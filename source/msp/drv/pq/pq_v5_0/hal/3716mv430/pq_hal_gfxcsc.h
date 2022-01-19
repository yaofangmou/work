/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_gfxcsc.h
  Version       : Initial Draft
  Author        : sdk
  Created       : 2015/10/10
  Description   :

******************************************************************************/

#ifndef __PQ_HAL_GFXCSC_H__
#define __PQ_HAL_GFXCSC_H__

#include "hi_type.h"
#include "drv_pq_ext.h"

#define CscPre           1 << 10
#define PQ_GFX_TABLE_MAX 61

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/* GRAPH CSC LAYER */
typedef enum hiHAL_GFX_LAYER_E
{
    HAL_GFX_GP0 = 0  , /* HD */
    HAL_GFX_GP1      , /* SD */
    HAL_GFX_WBC_GP   ,

    HAL_GFX_LAYER_BUTT
} HAL_GFX_LAYER_E;

typedef enum PQ_HAL_GFX_COLOR_SPACE_E
{
    PQ_HAL_GFX_CS_UNKNOWN = 0,

    PQ_HAL_GFX_CS_BT601_YUV_LIMITED,  /* BT.601 */
    PQ_HAL_GFX_CS_BT601_YUV_FULL,
    PQ_HAL_GFX_CS_BT601_RGB_LIMITED,
    PQ_HAL_GFX_CS_BT601_RGB_FULL,

    PQ_HAL_GFX_CS_BT709_YUV_LIMITED,  /* BT.709 */
    PQ_HAL_GFX_CS_BT709_YUV_FULL,
    PQ_HAL_GFX_CS_BT709_RGB_LIMITED,
    PQ_HAL_GFX_CS_BT709_RGB_FULL,

    PQ_HAL_GFX_CS_BT2020_YUV_LIMITED, /* BT.2020 */
    PQ_HAL_GFX_CS_BT2020_RGB_FULL,

    PQ_HAL_GFX_CS_BUTT
} PQ_HAL_GFX_COLOR_SPACE_E;

typedef struct PQ_HAL_GFX_CSC_MODE_S
{
    PQ_HAL_GFX_COLOR_SPACE_E eInputCS;  /* input  color space type, should be set carefully according to the application situation. */
    PQ_HAL_GFX_COLOR_SPACE_E eOutputCS; /* output color space type, should be set carefully according to the application situation. */

} PQ_HAL_GFX_CSC_MODE_S;

/* CSC 参数结构 */
typedef struct hiPQ_GFX_CSC_TUNING_S
{
    HI_U32  u32Bright;      /* bright adjust value,range[0,100],default setting 50; */
    HI_U32  u32Contrst;     /* contrast adjust value,range[0,100],default setting 50; */
    HI_U32  u32Hue;         /* hue adjust value,range[0,100],default setting 50; */
    HI_U32  u32Satur;       /* saturation adjust value,range[0,100],default setting 50; */
    HI_U32  u32Kr;          /* red   component gain adjust value for color temperature adjust,range[0,100],default setting 50; */
    HI_U32  u32Kg;          /* green component gain adjust value for color temperature adjust,range[0,100],default setting 50; */
    HI_U32  u32Kb;          /* blue  component gain adjust value for color temperature adjust,range[0,100],default setting 50; */

} PQ_GFX_CSC_TUNING_S;

HI_S32 PQ_HAL_SetGfxCsc(HI_U32 enLayer, HI_BOOL bCSCEn, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
