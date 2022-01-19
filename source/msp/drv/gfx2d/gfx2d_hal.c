/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : gfx2d_hal.c
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
#include <linux/fs.h>

#include "hi_gfx2d_type.h"
#include "gfx2d_hal.h"
#include "gfx2d_hal_hwc.h"
#include "gfx2d_debug.h"

/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/


/********************** Global Variable declaration **********************************************/

/******************************* API forward declarations ****************************************/

/******************************* API realization *************************************************/
HI_S32 GFX2D_HAL_Init(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_Init();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

HI_VOID GFX2D_HAL_Deinit(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    GFX2D_HAL_HWC_Deinit();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

HI_S32 GFX2D_HAL_Open(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_Open();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

HI_VOID GFX2D_HAL_Close(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    GFX2D_HAL_HWC_Close();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

HI_S32 GFX2D_HAL_Compose(const HI_GFX2D_DEV_ID_E enDevId,
                         const HI_GFX2D_COMPOSE_LIST_S *pstComposeList,
                         const HI_GFX2D_SURFACE_S *pstDstSurface,
                         HI_VOID **ppNode,
                         GFX2D_HAL_DEV_TYPE_E *penNodeType)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_Compose(enDevId, pstComposeList, pstDstSurface, ppNode, penNodeType);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

HI_VOID GFX2D_HAL_GetNodeOps(const GFX2D_HAL_DEV_TYPE_E enDevType,
                             GFX2D_HAL_NODE_OPS_S **ppstNodeOps)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (enDevType == GFX2D_HAL_DEV_TYPE_HWC)
    {
        GFX2D_HAL_HWC_GetNodeOps(ppstNodeOps);
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 GFX2D_HAL_GetIntStatus(const GFX2D_HAL_DEV_TYPE_E enDevType)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_GetIntStatus();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

HI_U32 GFX2D_HAL_GetIsrNum(const HI_GFX2D_DEV_ID_E enDevId, const GFX2D_HAL_DEV_TYPE_E enDevType)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_GetIsrNum();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

HI_U32 GFX2D_HAL_GetBaseAddr(const HI_GFX2D_DEV_ID_E enDevId, const GFX2D_HAL_DEV_TYPE_E enDevType)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    Ret = GFX2D_HAL_HWC_GetBaseAddr();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

#ifdef GFX2D_ALPHADETECT_SUPPORT
HI_VOID GFX2D_HAL_GetTransparent(HI_GFX2D_EXTINFO_S *ExtInfo)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    GFX2D_HAL_HWC_GetTransparent(ExtInfo);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

#ifndef GFX2D_PROC_UNSUPPORT
HI_VOID GFX2D_HAL_ReadProc(struct seq_file *p, HI_VOID *v)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    GFX2D_HAL_HWC_ReadProc(p, v);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
HI_VOID GFX2D_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize)
{
    if ((NULL != pDst) && (NULL != pSrc) && (0 != SrcSize)) { memcpy(pDst, pSrc, SrcSize); }
}

HI_VOID GFX2D_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize)
{
    if ((NULL != pDst) && (0 != DstSize)) { memset(pDst, InitValue, DstSize); }
}
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/
