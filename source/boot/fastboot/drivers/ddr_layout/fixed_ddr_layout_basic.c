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


/*******************************************************************************/

struct ddr_layout_t fixed_ddr_layout[] = {
	DDR_LAYOUT(DDR_LAYOUT_START_KERNEL, DDR_LAYOUT_END_KERNEL, LAYOUT_NAME_KERNEL),
#ifdef	CONFIG_TEE_SUPPORT
	DDR_LAYOUT(DDR_LAYOUT_START_TEEOS, DDR_LAYOUT_END_TEEOS, LAYOUT_NAME_TEEOS),
#endif
	DDR_LAYOUT(DDR_LAYOUT_START_EARLY_RESERVE_MEM, DDR_LAYOUT_END_EARLY_RESERVE_MEM, LAYOUT_NAME_EARLY_RESERVE_MEM),
	DDR_LAYOUT(DDR_LAYOUT_START_ROOTFS, DDR_LAYOUT_END_ROOTFS, LAYOUT_NAME_ROOTFS),
	{NULL}
};
