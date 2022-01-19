/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : drv_hifb_mem.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                  Author                Modification
2018/01/01            sdk                   Created file
*************************************************************************************************/

/*********************************add include here***********************************************/
#include "hi_drv_mmz.h"
#include "drv_pdm_ext.h"

#include "drv_hifb_mem.h"

#include "drv_hifb_debug.h"
/***************************** Macro Definition *************************************************/


/*************************** Structure Definition ***********************************************/


/********************** Global Variable declaration *********************************************/

/******************************* API declaration ************************************************/
static inline HI_U32 HIFB_MEM_GetBpp32FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt);
static inline HI_U32 HIFB_MEM_GetBpp24FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt);
static inline HI_U32 HIFB_MEM_GetBpp16FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt);

/******************************* API release ****************************************************/

/***************************************************************************************
* func          : DRV_HIFB_MEM_Map
* description   : CNcomment: 内存映射 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID *DRV_HIFB_MEM_Map(HI_U32 u32PhyAddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_GFX_Map(u32PhyAddr,0,HI_TRUE);
}

/***************************************************************************************
* func          : DRV_HIFB_MEM_UnMap
* description   : CNcomment: 内存逆映射 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_MEM_UnMap(HI_VOID *pViraddr)
{
    //dump_stack();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_GFX_Unmap(pViraddr,HI_TRUE);
}

/***************************************************************************************
* func         : DRV_HIFB_MEM_Free
* description  : CNcomment: 释放内存 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_MEM_Free(HI_U32 u32Phyaddr,HI_BOOL bSmmu)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_FreeMem(u32Phyaddr,bSmmu);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_MEM_Alloc
* description  : CNcomment: 分配内存 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_U32 DRV_HIFB_MEM_Alloc(HI_CHAR *pName, HI_CHAR* pZoneName, HI_U32 u32LayerSize)
{
    HI_U32 PhyAddr = 0;
    HI_BOOL bMmu = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PhyAddr = HI_GFX_AllocMem(pName, pZoneName, u32LayerSize,&bMmu);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return PhyAddr;
}

/***************************************************************************************
* func        : DRV_HIFB_MEM_Map2Smmu
* description : CNcomment: map mmz to smmu mem CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_U32 DRV_HIFB_MEM_Map2Smmu(HI_U32 u32PhyBuf)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_GFX_MapMmzToSmmu(u32PhyBuf);
}

/***************************************************************************************
* func         : DRV_HIFB_MEM_UnMapFromSmmu
* description  : CNcomment: un map smmu mem CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_MEM_UnMapFromSmmu(HI_U32 u32SmmuBuf)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_GFX_UnMapSmmu(u32SmmuBuf);
}

/**< check these two rectangle cover each other >**/
HI_BOOL DRV_HIFB_MEM_IsConTain(HIFB_RECT *pstParentRect, HIFB_RECT *pstChildRect)
{
    HIFB_POINT_S stPoint = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstParentRect, HI_FALSE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstChildRect, HI_FALSE);

    stPoint.s32XPos = pstChildRect->x;
    stPoint.s32YPos = pstChildRect->y;

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(pstParentRect->w, pstParentRect->x, HI_FALSE);
    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(pstParentRect->h, pstParentRect->y, HI_FALSE);

    if ((stPoint.s32XPos < pstParentRect->x) || (stPoint.s32XPos > (pstParentRect->x + pstParentRect->w))
      ||(stPoint.s32YPos < pstParentRect->y) || (stPoint.s32YPos > (pstParentRect->y + pstParentRect->h)))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stPoint.s32XPos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stPoint.s32YPos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->x);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->h);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_FALSE;
    }

    stPoint.s32XPos = pstChildRect->x + pstChildRect->w;
    stPoint.s32YPos = pstChildRect->y + pstChildRect->h;

    if ((stPoint.s32XPos < pstParentRect->x) || (stPoint.s32XPos > (pstParentRect->x + pstParentRect->w))
      ||(stPoint.s32YPos < pstParentRect->y) || (stPoint.s32YPos > (pstParentRect->y + pstParentRect->h)))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stPoint.s32XPos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stPoint.s32YPos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->x);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstParentRect->h);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_FALSE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_TRUE;
}

HI_U32 DRV_HIFB_MEM_GetBppByFmt(HIFB_COLOR_FMT_E enDataFmt)
{
    HI_U32 BppDepth = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    BppDepth = HIFB_MEM_GetBpp32FromPixelFmt(enDataFmt);
    if (32 == BppDepth)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return BppDepth;
    }

    BppDepth = HIFB_MEM_GetBpp24FromPixelFmt(enDataFmt);
    if (24 == BppDepth)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return BppDepth;
    }

    BppDepth = HIFB_MEM_GetBpp16FromPixelFmt(enDataFmt);
    if (16 == BppDepth)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return BppDepth;
    }

    switch (enDataFmt)
    {
        case HIFB_FMT_1BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return 1;
        case HIFB_FMT_2BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return 2;
        case HIFB_FMT_4BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return 4;
        case HIFB_FMT_8BPP:
        case HIFB_FMT_ACLUT44:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return 8;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return 0;
    }
}

static inline HI_U32 HIFB_MEM_GetBpp32FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    switch (enDataFmt)
    {
       case HIFB_FMT_KRGB888:
       case HIFB_FMT_ARGB8888:
       case HIFB_FMT_RGBA8888:
       case HIFB_FMT_ABGR8888:
       case HIFB_FMT_KBGR888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 32;
       default:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 0;
    }
}

static inline HI_U32 HIFB_MEM_GetBpp24FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    switch (enDataFmt)
    {
       case HIFB_FMT_RGB888:
       case HIFB_FMT_ARGB8565:
       case HIFB_FMT_RGBA5658:
       case HIFB_FMT_ABGR8565:
       case HIFB_FMT_BGR888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 24;
       default:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 0;
    }
}

static inline HI_U32 HIFB_MEM_GetBpp16FromPixelFmt(HIFB_COLOR_FMT_E enDataFmt)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    switch (enDataFmt)
    {
       case HIFB_FMT_RGB565:
       case HIFB_FMT_KRGB444:
       case HIFB_FMT_KRGB555:
       case HIFB_FMT_ARGB4444:
       case HIFB_FMT_ARGB1555:
       case HIFB_FMT_RGBA4444:
       case HIFB_FMT_RGBA5551:
       case HIFB_FMT_ACLUT88:
       case HIFB_FMT_BGR565:
       case HIFB_FMT_ABGR1555:
       case HIFB_FMT_ABGR4444:
       case HIFB_FMT_KBGR444:
       case HIFB_FMT_KBGR555:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 16;
       default:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return 0;
    }
}

/***************************************************************************************
* func         : DRV_HIFB_MEM_BitFieldCmp
* description  : CNcomment: 判断两个像素格式是否相等 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_MEM_BitFieldCmp(struct fb_bitfield x, struct fb_bitfield y)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if ((x.offset == y.offset) && (x.length == y.length) && (x.msb_right == y.msb_right))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, x.offset);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, y.offset);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, x.length);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, y.length);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, x.msb_right);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, y.msb_right);
    return HI_FAILURE;
}
