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
#ifndef _HIFAT_H_
#define _HIFAT_H_
#include <stddef.h>

typedef struct master_sector {
	u8	reserved0[11];
	u8	sector_size[2];
	u8	cluster_size;
	u16	fat_sect;
	u8	fats;
	u8	reserved1[19];
	u32	fat32_length;
	u8	reserved2[3];
	u32	root_cluster;
	u16	reserved3[8];
} master_sect;

typedef struct dir_entry {
	char	filename[8];
	char filename_ext[3];
	u8	file_attr;
	u32	reserved0[2];
	u16	start_cluster_high;
	u16	reserved1[2];
	u16	start_cluster_low;
	u32	file_size;
} dir_entry;

typedef struct fat_data {
	u8	*fatbuf;
	u32	fatlength;
	u16	fat_sect;
	u32	rootdir_sect;
	u16	sect_size;
	u16	clust_size;
	int	data_begin;
	int	fatbufnum;
} fat_data;

typedef struct dos_partition {
	unsigned char boot_ind;
	unsigned char reserved[3];
	unsigned char sys_ind;
	unsigned char reserved2[3];
	unsigned char start4[4];
	unsigned char size4[4];	
} dos_part;

typedef struct udisk_partition {
	unsigned long	start;
	unsigned long	size;
	unsigned long	blksz;
} udisk_part;


#define SECTOR_SIZE	512
#define DOS_FAT32_OFFSET	0x52
#define DOS_TBL_OFFSET	0x1be
#define DOS_MAGIC_OFFSET	0x1fe

#define DIRENTSPERBLOCK	
#define FATBUFBLOCKS	6
#define FATBUFSIZE	(fatdata->sect_size * FATBUFBLOCKS)
#define FAT32BUFSIZE	(FATBUFSIZE/4)

#define MAX_PART_NUM  16
#define ATTR_VOLUME	8
#define DELETED_FLAG	((char)0xe5)
#define aRING		0x05

#define TOLOWER(c)	if((c) >= 'A' && (c) <= 'Z'){(c)+=('a' - 'A');}
#define START(dent)	((dent)->start_cluster_low + ((dent)->start_cluster_high << 16))
#define CHECK_CLUST(x) ((x) <= 1 ||(x) >= 0xffffff0)

int hifat_read(const char *filename, unsigned int addr, unsigned int maxsize);
#endif /* _HIFAT_H_ */
