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
#ifndef	__DDR_LAYOUT_H__
#define	__DDR_LAYOUT_H__

#include <common.h>

#if defined(CONFIG_SUPPORT_CA_NAGRA)
	#include <advca/nagra/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_CONAX)
	#include <advca/conax/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_VERIMATRIX)
	#include <advca/vmx/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_VERIMATRIX_ULTRA)
	#include <advca/vmx_ultra/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_IRDETO)
	#include <advca/irdeto/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_DCAS)
	#include <advca/dcas/ddr_layout_advca.h>
#elif defined(CONFIG_SUPPORT_CA_L2)
	#include <advca/l2/ddr_layout_advca.h>
#else
	#include <ddr_layout_basic.h>
#endif

#define DDR_LAYOUT(start_addr, end_addr, region_name)	\
	{.start = start_addr, .end = end_addr, .name = region_name}
/*****************************************************************************/

struct ddr_layout_t {
	char *name;
	unsigned int start;
	unsigned int end;
	unsigned int gap_to_next;
};

struct ddr_layout_ctrl_t {
	unsigned int count;

#define MAX_OF_LAYOUT                 20
	struct ddr_layout_t layout[MAX_OF_LAYOUT];
};

#define LAYOUT_NAME_BOOTLOADER         "bootloader"
#define LAYOUT_NAME_BOOTLOADERBAK      "bootloaderbak"
#define LAYOUT_NAME_TEEOS              "trustedcore"
#define LAYOUT_NAME_TEEOSBAK           "trustedcorebak"
#define LAYOUT_NAME_BOOT               "boot"
#define LAYOUT_NAME_BOOTARGS           "bootargs"
#define LAYOUT_NAME_LOGO               "logo"
#define LAYOUT_NAME_LOADER             "kernel"
#define LAYOUT_NAME_LOADERBAK          "kernelbak"
#define LAYOUT_NAME_KERNEL             "kernel"
#define LAYOUT_NAME_KERNELBAK          "kernelbak"
#define LAYOUT_NAME_SWINFO             "softwareinfo"
#define LAYOUT_NAME_APPFS              "appfs"
#define LAYOUT_NAME_ROOTFS             "rootfs"
#define LAYOUT_NAME_SECONDBOOT         "secondboot"
#define LAYOUT_NAME_RESERVE            "reserve"
#define LAYOUT_NAME_DSP                "dsp"

#define LAYOUT_NAME_EARLY_RESERVE_MEM  "early reserve"



extern void ddr_layout_init(void);
extern int get_ddr_layout_by_name(char *name, struct ddr_layout_t *tmp);
#endif
