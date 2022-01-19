/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_sharpen.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2013/11/10
  Description   :

******************************************************************************/

#ifndef __PQ_HAL_SHARPEN_H__
#define __PQ_HAL_SHARPEN_H__

#include "hi_type.h"
#include "pq_hal_comm.h"
#include "drv_pq_comm.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define SHARP_STRENGTH_ADDR      0x2244
#define SHARP_LUM_GAIN_LSB       16
#define SHARP_LUM_GAIN_MSB       27

#define SHARP_LMINGRATIO_LSB     8
#define SHARP_LMINGRATIO_MSB     15

HI_S32 PQ_HAL_EnableSharp(HI_BOOL bOnOff);
HI_S32 PQ_HAL_SetSharpStrReg(HI_U32 u32LumGain, HI_U32 u32LmingRatio);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif

