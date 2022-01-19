/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Create By liuhui 2018.09.25
 *
******************************************************************************/
#include <compile.h>
#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <malloc.h>
#include <string.h>
#include <delay.h>

#include "fat.h"
#include "mass_storage.h"
/******************************************************************************/

static struct stor_dev *cur_dev;
static udisk_part cur_part;

/******************************************************************************/

static inline int le32_to_int(unsigned char *le32)
{
    return ((le32[3] << 24) + (le32[2] << 16) + (le32[1] << 8) + le32[0]);
}
/******************************************************************************/

static inline int is_extended(int part_type)
{
    return (part_type == 0x5 ||part_type == 0xf || part_type == 0x85);
}
/******************************************************************************/

static int hifat_get_partition(struct stor_dev*udisk, int ext_part_sector,
				 int relative, int part_num,
				 int which_part, udisk_part *info)
{
	unsigned char buffer[SECTOR_SIZE];
	dos_part *pt;
	int i;

	if (udisk->stor_read (udisk->target, ext_part_sector, 1, (u32 *) buffer) != 1) {
		return -1;
	}
	if (buffer[DOS_MAGIC_OFFSET] != 0x55 ||
		buffer[DOS_MAGIC_OFFSET + 1] != 0xaa) {
		return -1;
	}

	pt = (dos_part *) (buffer + DOS_TBL_OFFSET);
	for (i = 0; i < 4; i++, pt++) {
		if (((pt->boot_ind & ~0x80) == 0) &&(pt->sys_ind != 0) &&
		    (part_num == which_part) &&(is_extended(pt->sys_ind) == 0)) {
			info->blksz = 512;
			info->start = ext_part_sector + le32_to_int (pt->start4);
			info->size  = le32_to_int (pt->size4);
			return 0;
		}

		if ((ext_part_sector == 0) ||
		    (pt->sys_ind != 0 && !is_extended (pt->sys_ind)) ) {
			part_num++;
		}
	}

	pt = (dos_part *) (buffer + DOS_TBL_OFFSET);
	for (i = 0; i < 4; i++, pt++) {
		if (is_extended (pt->sys_ind)) {
			int lba_start = le32_to_int (pt->start4) + relative;

			return hifat_get_partition(udisk, lba_start,
				 ext_part_sector == 0 ? lba_start : relative,
				 part_num, which_part, info);
		}
	}
	return -1;
}
/******************************************************************************/

static int hifat_stor_read(u32 block, u32 nr_blocks, void *buf)
{
	int ret;

	ret = cur_dev->stor_read(cur_dev->target, cur_part.start + block, nr_blocks, buf);

	return  ret;
}
/******************************************************************************/

int hifat_check_fat32(struct stor_dev *udisk, int part_no)
{
	unsigned char buffer[udisk->blksz];
	cur_dev = NULL;

	if (!hifat_get_partition (udisk, 0, 0, 1, part_no, &cur_part)){
		cur_dev = udisk;
	}

	if (!cur_dev) {
		cur_dev = udisk;
		cur_part.start = 0;
		cur_part.size = udisk->lba;
		cur_part.blksz = udisk->blksz;
	}

	if (hifat_stor_read(0, 1, buffer) != 1) {
		cur_dev = NULL;
		return -1;
	}

	if ((memcmp(buffer + DOS_MAGIC_OFFSET, "\x55\xAA", 2))
		||(memcmp(buffer + DOS_FAT32_OFFSET, "FAT32", 5))){

		cur_dev = NULL;
		return -1;
	}

	return 0;
}
/******************************************************************************/

static void hifat_get_name(dir_entry *entry, char *name)
{
	char *pt_char;

	/* merge name and extern name */
	memcpy(name, entry->filename, 8);
	name[8] = '\0';
	pt_char = name;
	while (*pt_char && *pt_char != ' ')
		pt_char++;

	*pt_char = '.';
	pt_char++;
	memcpy(pt_char, entry->filename_ext, 3);
	pt_char[3] = '\0';
	while (*pt_char && *pt_char != ' ')
		pt_char++;

	/* change A to a */
	*pt_char = '\0';
	pt_char = name;
	while (*pt_char != '\0') {
		TOLOWER(*pt_char);
		pt_char++;
	}
}
/******************************************************************************/

static u32 hifat_get_entry(fat_data *fatdata, u32 entry)
{
	u32 bufnum;
	u32  offset;
	u32 ret = 0x00;

	bufnum = entry / FAT32BUFSIZE;
	offset = entry - bufnum * FAT32BUFSIZE;

	if (bufnum != fatdata->fatbufnum) {
		u32 getsize = FATBUFBLOCKS;
		u8 *bufptr = fatdata->fatbuf;
		u32 fatlength = fatdata->fatlength;
		u32 startblock = bufnum * FATBUFBLOCKS;

		if (getsize > fatlength)
			getsize = fatlength;

		fatlength *= fatdata->sect_size;	
		startblock += fatdata->fat_sect;	

		if (hifat_stor_read(startblock, getsize, bufptr) < 0) {
			return ret;
		}
		fatdata->fatbufnum = bufnum;
	}

	ret = ((u32 *) fatdata->fatbuf)[offset];

	return ret;
}
/******************************************************************************/

static int hifat_get_cluster(fat_data *fatdata, u32 clustnum, u8 *buffer, int size)
{
	u32 startsect;
	u32 nr_sect;
	int ret;

	if (clustnum > 0) {
		startsect = fatdata->data_begin + clustnum * fatdata->clust_size;
	} else {
		startsect = fatdata->rootdir_sect;
	}

	/* firstly read sector * n  bytes data */
	nr_sect = size / fatdata->sect_size;
	ret = hifat_stor_read(startsect, nr_sect, buffer);
	if (ret != nr_sect) {
		return -1;
	}

	/* read some data < one sector */
	if (size > (fatdata->sect_size*nr_sect)) {
		u8 tmpbuf[fatdata->sect_size];
		ret = hifat_stor_read(startsect + nr_sect, 1, tmpbuf);
		if (ret != 1) {
			return -1;
		}
		buffer += nr_sect * fatdata->sect_size;

		memcpy(buffer, tmpbuf, size - nr_sect *fatdata->sect_size);
		return 0;
	}

	return 0;
}
/******************************************************************************/

static long hifat_get_data(fat_data *fatdata, dir_entry *dentptr, 
	      u8 *buffer, unsigned long maxsize)

{
	unsigned long filesize = dentptr->file_size, gotsize = 0;
	unsigned int cluster_bytes = fatdata->clust_size * fatdata->sect_size;
	u32 curclust = START(dentptr);
	u32 endclust, newclust;
	unsigned long actsize;

	if (filesize > maxsize)
		filesize = maxsize;

	actsize = cluster_bytes;
	endclust = curclust;

	do {
		/* file has more than one cluster */
		while (filesize > actsize) {
			newclust = hifat_get_entry(fatdata, endclust);
			if ((newclust - 1) != endclust)
				goto getit;
			if (CHECK_CLUST(newclust)) {
				return gotsize;
			}
			endclust = newclust;
			actsize += cluster_bytes;
		}

		actsize -= cluster_bytes;
		if (hifat_get_cluster(fatdata, curclust, buffer, (int)actsize) != 0) {
			return -1;
		}

		gotsize += (int)actsize;
		filesize -= actsize;
		buffer += actsize;
		actsize = filesize;
		if (hifat_get_cluster(fatdata, endclust, buffer, (int)actsize) != 0) {
			return -1;
		}
		gotsize += actsize;
		return gotsize;
getit:
		if (hifat_get_cluster(fatdata, curclust, buffer, (int)actsize) != 0) {
			return -1;
		}
		gotsize += (int)actsize;
		filesize -= actsize;
		buffer += actsize;

		curclust = hifat_get_entry(fatdata, endclust);
		if (CHECK_CLUST(curclust)) {
			return gotsize;
		}
		actsize = cluster_bytes;
		endclust = curclust;
	} while (1);
}
/******************************************************************************/

static long hifat_read_file(const char *filename, void *buffer, unsigned long maxsize)
{
	master_sect mast_sect;
	u8 buf_tmp[2048];
	fat_data datablock;
	fat_data *fatdata = &datablock;
	dir_entry *entry;
	u32 cursect;
	u32 root_cluster = 0;
	int j = 0;
	long ret = -1;

	if (hifat_stor_read(0, 1, buf_tmp) < 0) {
		printf(" hifat read master sector failed \n");
		return -1;
	}
	memcpy(&mast_sect, buf_tmp, sizeof(master_sect));

	/* root cluster number */
	root_cluster = mast_sect.root_cluster;
	fatdata->fatlength = mast_sect.fat32_length;
	fatdata->fat_sect = mast_sect.fat_sect;
	cursect = fatdata->rootdir_sect = fatdata->fat_sect + fatdata->fatlength * mast_sect.fats;
	fatdata->sect_size = (mast_sect.sector_size[1] << 8) + mast_sect.sector_size[0];
	fatdata->clust_size = mast_sect.cluster_size;
	fatdata->data_begin = fatdata->rootdir_sect -(fatdata->clust_size * 2);
	fatdata->fatbufnum = -1;
	fatdata->fatbuf = malloc(FATBUFSIZE);
	if (fatdata->fatbuf == NULL) {
		return -1;
	}

	for(;;) {
		int i;
		if (hifat_stor_read(cursect, 1, buf_tmp) < 0) {
			printf(" hifat read root directory entry failed \n");
			goto exit;
		}

		entry = (dir_entry *)buf_tmp;
		for (i = 0; i < (fatdata->sect_size /sizeof(dir_entry)); i++) {
			char name[14];

			if ((entry->filename[0] == 0xe5) ||(entry->file_attr & 0x08)) {
				/* dir is delete entry or volume */
				entry++;
				continue;
			} else if (entry->filename[0] == 0) {
				goto exit;
			}
			
			hifat_get_name(entry, name);
			if (strcmp(filename, name)) {
				entry++;
				continue;
			}

			goto rootdir_done;
		}

		j++;
		int fat32_end = 0;
		if (j == fatdata->clust_size) {
			int nxtsect = 0;
			int nxt_clust = 0;

			nxt_clust = hifat_get_entry(fatdata, root_cluster);
			fat32_end = CHECK_CLUST(nxt_clust);

			nxtsect = fatdata->data_begin + (nxt_clust * fatdata->clust_size);

			root_cluster = nxt_clust;

			cursect = nxtsect;
			j = 0;
		} else {
			cursect++;
		}

		if (fat32_end) {
			goto exit;
		}
	}
	
rootdir_done:
	ret = hifat_get_data(fatdata, entry, buffer, maxsize);
exit:
	free(fatdata->fatbuf);
	return ret;
}
/******************************************************************************/

int hifat_read(const char *filename, unsigned int addr, unsigned int size)
{
	int ix_dev;
	int ix_part;
	struct stor_dev *udisk = NULL;

	for (ix_dev = 0 ; ix_dev < hiusb_stor_get_max(); ix_dev++) {
		udisk = hiusb_stor_get_udisk(ix_dev);
		if (!udisk)
			return 0;

		for (ix_part = 1; ix_part < MAX_PART_NUM; ix_part++) {
			if (!hifat_check_fat32(udisk, ix_part)) {
				size = hifat_read_file(filename, (unsigned char *)addr, size);
				if (size < 0)
					continue;
				printf("\n%ld bytes read\n",size);
				return 0;
			}
		}
	}

	printf("not find file\n");
	return 1;
}
/******************************************************************************/