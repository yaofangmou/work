/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : sample_ion.c
  Version       : Initial Draft
  Author        : y00241285
  Created       :
  Last Modified :
  Description   : Demo of ion
  Function List :
  History       :
  1.Date        :
  Author        :
  Modification  : Created file
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <pthread.h>

#include <sys/mman.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <unistd.h>

#include "sample_ion.h"

#define SIZE_4K	4*1024
#define SIZE_4M 4*1024*1024
#define SIZE_50M 50*1024*1024
#define SIZE_150M 150*1024*1024

#define ALLOC_SIZE	SIZE_4M
#define HEAP_MASK	ION_HEAP_SYSTEM_MASK

int prot = 0x1|0x2;  // PROT_READ | PROT_WRITE;
int map_flags = 0x1;     //MAP_SHARED;

unsigned int test_size = 0;


int open_dev(int *dev_fd)
{
	int fd = -1;

	fd = open("/dev/ion", O_RDWR);
	if (fd < 0) {
		printf("open ion device failed!\n");
		return -1;
	}

	*dev_fd = fd;

	return 0;
}

int close_dev(int fd)
{
	if (fd < 0) {
		printf("err args, closed failed!\n");
		return fd;
	}
	close(fd);
	return 0;
}

int _ion_alloc_test(int *dev_fd, ion_user_handle_t *handle)
{
	int ret;
	int fd;
	struct ion_allocation_data data = {
		.len = test_size,
		.align = 0,
		.heap_id_mask = HEAP_MASK,
		.flags = 0,
	};

	if (open_dev(&fd))
		goto out;

	ret = ioctl(fd, ION_IOC_ALLOC, &data);
	if (ret < 0)
		goto out;

	*handle = data.handle;
	*dev_fd = fd;
	if (data.heap_id_mask == ION_HEAP_CMA_MASK) {
		struct ion_phys_data phys = {
			.handle = data.handle,
		};

		ret = ioctl(fd, ION_IOC_PHYS, &phys);
		if (ret<0) {
			printf("ion_phys failed\n");
		}
		printf("phys:0x%x  len:0x%x \n", (unsigned int)phys.phys_addr, (unsigned int)phys.len);
		printf("ion_phys pass!\n");
	}

	return 0;

out:
	return -1;

}

int ion_free(int fd, ion_user_handle_t handle)
{
	int ret;
	struct ion_handle_data f_handle;

	f_handle.handle = handle;
	ret = ioctl(fd, ION_IOC_FREE, &f_handle);
	if (ret < 0) {
		printf("ion_free failed!\n");
		return ret;
	}
	return 0;
}

void ion_alloc_test(void)
{
	int fd;	
	int ret;
	ion_user_handle_t handle;

	if (_ion_alloc_test(&fd, &handle)) {
		return;
	}

	ret = ion_free(fd, handle);
	if (ret) {
		printf("ion_alloc failed!\n");
		return;
	}
	close(fd);
	printf("ion_alloc size:0x%x successfully!\n", test_size);
	return;
}


void ion_map_test(void)
{
	int fd;	
	int ret;
	ion_user_handle_t handle;
	struct ion_fd_data map_fd;
	void *virt;

	if (_ion_alloc_test(&fd, &handle)) {
		return;
	}
	map_fd.handle = handle;

	ret = ioctl(fd, ION_IOC_MAP, &map_fd);
	if (ret < 0) {
		printf("ION_IOC_MAP failed!\n");
		ion_free(fd, handle);
		return;
	}
	virt = mmap(NULL, ALLOC_SIZE, prot, map_flags, map_fd.fd, 0);
	if (NULL == virt) {
		printf("mmap failed!\n");
		return;
	}
	munmap(virt, ALLOC_SIZE);
	close(map_fd.fd);

	ret = ion_free(fd, handle);
	close(fd);
	printf("ion_map successfully!\n");
	return;
}

int main(int argc, char *argv[])
{
	unsigned int size = 0;

	if (argc == 1) {
		size = 0x100000;
	} else if (argc > 1) {
		size = strtol(argv[1], NULL, 0);
	}
	if (size)
		test_size = size;
	else
		test_size = 0x100000;

	ion_alloc_test();

	return 0;
}
