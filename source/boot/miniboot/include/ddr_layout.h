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

#define DDR_LAYOUT_SIZE_EARLY_RESERVE_MEM	0x1000000

struct ddrlayout_t {
	uint32 start;
	uint32 end;
	uint32 size;
	uint32 attribue;
	char *name;
	void (*init)(struct ddrlayout_t *ddrlayout);
};


extern int get_ddr_layout_by_name(char *name, struct ddrlayout_t *tmp);
#endif
