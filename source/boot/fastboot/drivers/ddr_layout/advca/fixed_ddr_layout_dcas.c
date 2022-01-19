/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018/
  Description   :
  History       :
  1.Date        : 2018/
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#include <ddr_layout.h>


#define	DDR_LAYOUT_KERNEL_SIZE	0x2000000
#define	DDR_LAYOUT_ROOTFS_SIZE	0x1000000
#define	DDR_LAYOUT_EARLY_RESERVE_MEM_SIZE	0x2800000
/*******************************************************************************/

#define	DDR_LAYOUT_KERNEL_START	0x1FFFFC0
#define	DDR_LAYOUT_KERNEL_END	(DDR_LAYOUT_KERNEL_START + DDR_LAYOUT_KERNEL_SIZE)

#define	DDR_LAYOUT_ROOTFS_START	0x4000000
#define	DDR_LAYOUT_ROOTFS_END	(DDR_LAYOUT_ROOTFS_START + DDR_LAYOUT_ROOTFS_SIZE)

#define	DDR_LAYOUT_EARLY_RESERVE_MEM_START	0x5100000
#define	DDR_LAYOUT_EARLY_RESERVE_MEM_END	(DDR_LAYOUT_EARLY_RESERVE_MEM_START + DDR_LAYOUT_EARLY_RESERVE_MEM_SIZE)


/*******************************************************************************/

struct ddr_layout_t fixed_ddr_layout[] = {
	DDR_LAYOUT(DDR_LAYOUT_KERNEL_START, DDR_LAYOUT_KERNEL_END, LAYOUT_NAME_KERNEL),
	DDR_LAYOUT(DDR_LAYOUT_EARLY_RESERVE_MEM_START, DDR_LAYOUT_EARLY_RESERVE_MEM_END, LAYOUT_NAME_EARLY_RESERVE_MEM),
	DDR_LAYOUT(DDR_LAYOUT_ROOTFS_START, DDR_LAYOUT_ROOTFS_END, LAYOUT_NAME_ROOTFS),
	{NULL}
};
