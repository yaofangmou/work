/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : gfx2d_hal_hwc_adp.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :


History          :
Date                  Author                Modification
2018/01/01            sdk                   Created file
**************************************************************************************************/

/*********************************add include here************************************************/
#include "gfx2d_hal_hwc_adp.h"
#include "hi_gfx_sys_k.h"
#include "gfx2d_debug.h"
#include "gfx2d_hal.h"

/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/


/********************** Global Variable declaration **********************************************/

static HWC_CAPABILITY_S gs_stCapability =
{
    HWC_MAX_LAYERS,
    6,
    1,
#if HWC_VERSION == 0x500
    {0x00c043d0, 0x7efc},
#else
    {0x00c043d0, 0xfe7efc},
#endif
#ifndef CONFIG_GFX_HWC_VERSION_3_0
    {0x0c040c0, 0x200},
#else
    {0x0c040c0, 0x8A00},   /** support HI_GFX2D_FMT_SEMIPLANAR422UV_H **/
#endif
    1,
    0xffff,
    16,
    1,
#if HWC_VERSION == 0x400
    2560,
#elif HWC_VERSION == 0x300
    3840,
#else
    4096,
#endif
    1,
#if HWC_VERSION == 0x400
    1600,
#elif HWC_VERSION == 0x300
    2160,
#else
    2160,
#endif
    32,
    32,
    16,
    16,
    2,
    {0x400000, 0x0},
#if HWC_VERSION >= 0x400
#ifdef CONFIG_GFX_HWC_VERSION_3_0
    HI_FALSE,
#else
    HI_TRUE,
#endif
    HI_TRUE,
#ifdef CONFIG_GFX_HWC_VERSION_3_0
    1,
#else
    2,
#endif
    1,
#else
    HI_FALSE,
    HI_FALSE,
    1,
    2,
#endif
};


/******************************* API forward declarations ****************************************/

/******************************* API realization *************************************************/

HI_VOID HWC_ADP_GetCapability(HWC_CAPABILITY_S *pstCapability)
{
    if (NULL != pstCapability)
    {
       HI_GFX_Memcpy(pstCapability, &gs_stCapability, sizeof(HWC_CAPABILITY_S));
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==================================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8MaxLayerNum);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8MaxGLayerNum);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8MaxVLayerNum);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32InputFmtBitmap[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32InputFmtBitmap[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32OutputFmtBitmap[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32OutputFmtBitmap[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MinStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MaxStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8StrideAlign);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MinWidth);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MaxWidth);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MinHeight);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MaxHeight);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MinVWidth);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MinVHeight);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MaxHorizonZmeRatio);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32MaxVerticalZmeRatio);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u32CmpWidthAlign);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32CmpFmtBitmap[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.au32CmpFmtBitmap[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.bGZmeSupport);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.bClipSupport);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8ZmeLayerNum);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_stCapability.u8ZmeAlign);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==================================================");

    return;
}
