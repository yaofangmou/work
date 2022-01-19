/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : drv_hifb_scrolltext.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                 Author                Modification
2018/01/01            sdk                 Created file
*************************************************************************************************/

#ifdef CONFIG_HIFB_SCROLLTEXT_SUPPORT
/*********************************add include here***********************************************/
#include <linux/ctype.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/delay.h>

#include <linux/slab.h>
#include <linux/mm.h>
#include <linux/spinlock.h>

#include <linux/fb.h>
#include <linux/interrupt.h>

#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_scrolltext.h"
#include "hi_gfx_sys_k.h"

/***************************** Macro Definition *************************************************/

/*************************** Structure Definition ***********************************************/

/********************** Global Variable declaration *********************************************/
static spinlock_t scrolltextLock = __SPIN_LOCK_UNLOCKED(scrolltextLock);
/******************************* API declaration ************************************************/

static inline HI_S32 DRV_SCROLLTEXT_SwitchTextBuffer(HIFB_SCROLLTEXT_S *pstScrollText, HI_U32 BufNum);

/******************************* API release ****************************************************/

/***************************************************************************************
* func         : HIFB_SCROLLTEXT_AllocHandle
* description  : 判断滚动字幕参数是否合法
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_U32 HIFB_SCROLLTEXT_AllocHandle(HI_U32 LayerId)
{
    HI_U32 u32ScrollTextHandle;
    HIFB_SCROLLTEXT_INFO_S *pstScrollTextInfo = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (LayerId >= sizeof(s_stTextLayer) / sizeof(HIFB_SCROLLTEXT_INFO_S)) { return HIFB_SCROLLTEXT_BUTT_HANDLE; }
    pstScrollTextInfo = &s_stTextLayer[LayerId];
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstScrollTextInfo, HIFB_SCROLLTEXT_BUTT_HANDLE);

    u32ScrollTextHandle = pstScrollTextInfo->u32ScrollTextId++;
    if (pstScrollTextInfo->u32ScrollTextId > 1)
    {
        pstScrollTextInfo->u32ScrollTextId = 0;
    }

    if (!pstScrollTextInfo->bAvailable)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "the scroll text was invalid");
        return HIFB_SCROLLTEXT_BUTT_HANDLE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return ((0xf0 & (LayerId << 4)) | (0x0f & u32ScrollTextHandle));
}

/***************************************************************************************
* func         : hifb_parse_scrolltexthandle
* description  : 获取图层ID和字幕的ID
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_SCROLLTEXT_GetHandle(HI_U32 u32Handle, HI_U32 *pU32LayerId, HI_U32 *pScrollTextId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pU32LayerId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pScrollTextId, HI_FAILURE);

    if (u32Handle >= HIFB_SCROLLTEXT_BUTT_HANDLE)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "invalid scrolltext handle");
        return HI_FAILURE;
    }

    *pU32LayerId   = (u32Handle & 0xf0) >> 4;
    *pScrollTextId = u32Handle & 0x0f;

    if (*pU32LayerId >= HIFB_LAYER_ID_BUTT)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "invalid scrolltext handle");
        *pU32LayerId = HIFB_LAYER_ID_BUTT;
        return HI_FAILURE;
    }

    if (*pScrollTextId >= SCROLLTEXT_NUM)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "invalid scrolltext handle");
        *pScrollTextId = SCROLLTEXT_NUM;
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_SCROLLTEXT_IsOverLay
* description  : check these two rectangle overlay each other
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_BOOL HIFB_SCROLLTEXT_IsOverLay(HIFB_RECT *pstSrcRect, HIFB_RECT *pstDstRect)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstSrcRect, HI_FALSE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDstRect, HI_FALSE);

    if (   (pstSrcRect->x >= (pstDstRect->x + pstDstRect->w))
        || (pstDstRect->x >= (pstSrcRect->x + pstSrcRect->w)))
    {
        return HI_FALSE;
    }

    if(    (pstSrcRect->y >= (pstDstRect->y + pstDstRect->h))
        || (pstDstRect->y >= (pstSrcRect->y + pstSrcRect->h)))
    {
        return HI_FALSE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_TRUE;
}

/***************************************************************************************
* func         : HIFB_SCROLLTEXT_CheckPara
* description  : 判断滚动字幕参数是否合法
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 HIFB_SCROLLTEXT_CheckPara(HI_U32 u32LayerId, HIFB_SCROLLTEXT_ATTR_S *stAttr)
{
    HI_U32 i;
    HIFB_RECT stScrollTextRect, stSrcRect;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (u32LayerId >= sizeof(s_stLayer) / sizeof(HIFB_LAYER_S)) { return HI_FAILURE; }
    if (u32LayerId >= sizeof(s_stTextLayer) / sizeof(HIFB_SCROLLTEXT_INFO_S)) { return HI_FAILURE; }

    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stAttr, HI_FAILURE);
    stScrollTextRect = stAttr->stRect;

    HI_GFX_Memset(&stScrollTextRect, 0x0, sizeof(stScrollTextRect));
    HI_GFX_Memset(&stSrcRect, 0x0, sizeof(stSrcRect));

    if ((0 == stAttr->u16CacheNum) || (stAttr->u16CacheNum > SCROLLTEXT_CACHE_NUM))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "the cachenum u applied was invalid");
        return HI_FAILURE;
    }

    if (s_stTextLayer[u32LayerId].u32textnum >= SCROLLTEXT_NUM)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, s_stTextLayer[u32LayerId].u32textnum);
        return HI_FAILURE;
    }

    if (  (0 > stScrollTextRect.x)
        ||(0 > stScrollTextRect.y)
        ||(pstPar->stExtendInfo.stPos.s32XPos > stScrollTextRect.x)
        ||(pstPar->stExtendInfo.stPos.s32YPos > stScrollTextRect.y))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.x);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.y);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.stPos.s32XPos);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.stPos.s32YPos);
        return HI_FAILURE;
    }

    if (   (0 > stScrollTextRect.w)
         ||(0 > stScrollTextRect.h)
         ||(pstPar->stExtendInfo.DisplayWidth  < stScrollTextRect.w)
         ||(pstPar->stExtendInfo.DisplayHeight < stScrollTextRect.h))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.h);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayHeight);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "failed to create the scrolltext because of wrong width or height");
        return HI_FAILURE;
    }

   if (  (pstPar->stExtendInfo.stPos.s32XPos + pstPar->stExtendInfo.DisplayWidth) < (stScrollTextRect.w + stScrollTextRect.x)
        ||(pstPar->stExtendInfo.stPos.s32YPos + pstPar->stExtendInfo.DisplayHeight) < (stScrollTextRect.h + stScrollTextRect.y))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.x);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.y);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stScrollTextRect.h);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.stPos.s32XPos);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.stPos.s32YPos);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stExtendInfo.DisplayHeight);
        return HI_FAILURE;
    }

    for (i = 0; i < s_stTextLayer[u32LayerId].u32textnum; i++)
    {
        if (s_stTextLayer[u32LayerId].stScrollText[i].bAvailable)
        {
            stSrcRect = s_stTextLayer[u32LayerId].stScrollText[i].stRect;
            if (HIFB_SCROLLTEXT_IsOverLay(&stSrcRect, &stScrollTextRect))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_SCROLLTEXT_IsOverLay, FAILURE_TAG);
                return HI_FAILURE;
            }
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_SCROLLTEXT_FreeCacheBuf
* description  : 释放滚动字幕buffer
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_SCROLLTEXT_FreeCacheBuf(HIFB_SCROLLTEXT_S *pstScrollText)
{
    HI_U32 i;
    HI_CHAR *pBuf = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstScrollText, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(pstScrollText->u32cachebufnum, SCROLLTEXT_CACHE_NUM + 1, HI_FAILURE);

    for (i = 0; i < pstScrollText->u32cachebufnum; i++)
    {
        pBuf = pstScrollText->stCachebuf[i].pVirAddr;
        if (NULL != pBuf)
        {
            DRV_HIFB_MEM_UnMap(pBuf);
        }

        if (pstScrollText->stCachebuf[i].u32PhyAddr != 0)
        {
            DRV_HIFB_MEM_Free(pstScrollText->stCachebuf[i].u32PhyAddr,HI_TRUE);
        }

        pstScrollText->stCachebuf[i].pVirAddr   = NULL;
        pstScrollText->stCachebuf[i].u32PhyAddr = 0;
        pstScrollText->stCachebuf[i].bInusing   = HI_FALSE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_SCROLLTEXT_AllocBuf
* description  : 创建滚动字幕buffer
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 HIFB_SCROLLTEXT_AllocBuf(HI_U32 u32LayerId, HIFB_SCROLLTEXT_ATTR_S *stAttr)
{
    struct fb_info *info = NULL;
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32StartAddr;
    HI_U32 i, u32cacheSize, u32Pitch;
    HI_CHAR name[256] = {'\0'};
    HI_CHAR *pBuf = NULL;
    HI_U32 u32Index  = 0;
    HIFB_SCROLLTEXT_S *pstScrollText = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (u32LayerId >= sizeof(s_stLayer) / sizeof(HIFB_LAYER_S)) { return HI_FAILURE; }
    if (u32LayerId >= sizeof(s_stTextLayer) / sizeof(HIFB_SCROLLTEXT_INFO_S)) { return HI_FAILURE; }

    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);

    u32Index = s_stTextLayer[u32LayerId].u32ScrollTextId;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, SCROLLTEXT_NUM, HI_FAILURE);

    pstScrollText = &(s_stTextLayer[u32LayerId].stScrollText[u32Index]);

    if (pstScrollText->bAvailable)
    {
        DRV_HIFB_SCROLLTEXT_FreeCacheBuf(pstScrollText);
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_BITSPERPIXEL,
                                  stAttr->stRect.w, stAttr->stRect.h, 0, 0, info->var.bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stAttr->stRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stAttr->stRect.h);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        return HI_FAILURE;
    }
    u32Pitch = ((stAttr->stRect.w * info->var.bits_per_pixel >> 3) + 15) >> 4;
    u32Pitch = u32Pitch << 4;

    u32cacheSize =  u32Pitch * stAttr->stRect.h;

    if (stAttr->u16CacheNum > SCROLLTEXT_CACHE_NUM)
    {
        return HI_FAILURE;
    }

    for (i = 0; i < stAttr->u16CacheNum; i++)
    {
        snprintf(name, sizeof(name), "HIFB_Layer%d_Scroll%d", u32LayerId, i);
        name[sizeof(name) - 1] = '\0';

        u32StartAddr = DRV_HIFB_MEM_Alloc(name, "iommu", u32cacheSize);
        if (0 == u32StartAddr)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_MEM_Alloc, FAILURE_TAG);
            return HI_FAILURE;
        }
        pstScrollText->stCachebuf[i].u32PhyAddr = u32StartAddr;

        pBuf = (HI_CHAR *)DRV_HIFB_MEM_Map(pstScrollText->stCachebuf[i].u32PhyAddr);
        if (pBuf == NULL)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_MEM_Map, FAILURE_TAG);
            DRV_HIFB_MEM_Free(pstScrollText->stCachebuf[i].u32PhyAddr,HI_TRUE);
            return HI_FAILURE;
        }

        HI_GFX_Memset(pBuf, 0, u32cacheSize);

        pstScrollText->stCachebuf[i].bInusing   = HI_FALSE;
        pstScrollText->stCachebuf[i].pVirAddr   = pBuf;

    }

    pstScrollText->bAvailable     = HI_TRUE;
    pstScrollText->u32Stride      = u32Pitch;
    pstScrollText->u32cachebufnum = stAttr->u16CacheNum;
    pstScrollText->bDeflicker     = stAttr->bDeflicker;
    pstScrollText->ePixelFmt      = stAttr->ePixelFmt;
    HI_GFX_Memcpy(&(pstScrollText->stRect), &(stAttr->stRect), sizeof(HIFB_RECT));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID HIFB_SCROLLTEXT_BlitWork(struct work_struct *work);

/***************************************************************************************
* func         : DRV_HIFB_SCROLLTEXT_Create
* description  : 创建滚动字幕
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_SCROLLTEXT_Create(HI_U32 u32LayerId, HIFB_SCROLLTEXT_CREATE_S *stScrollText)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32Index = 0;
    HIFB_SCROLLTEXT_ATTR_S stAttr;
    HIFB_SCROLLTEXT_INFO_S *pstTextInfo = NULL;
    HIFB_SCROLLTEXT_S *stText = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stScrollText, HI_FAILURE);
    stAttr = stScrollText->stAttr;

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    pstTextInfo = &s_stTextLayer[u32LayerId];

    Ret = HIFB_SCROLLTEXT_CheckPara(u32LayerId, &stAttr);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_SCROLLTEXT_CheckPara, Ret);
        return HI_FAILURE;
    }

    Ret = HIFB_SCROLLTEXT_AllocBuf(u32LayerId, &stAttr);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_SCROLLTEXT_AllocBuf, Ret);
        return HI_FAILURE;
    }

    pstTextInfo->u32textnum++;

    if (!pstTextInfo->bAvailable)
    {
        INIT_WORK(&(s_stTextLayer[u32LayerId].blitScrollTextWork), HIFB_SCROLLTEXT_BlitWork);
    }

    pstTextInfo->bAvailable  = HI_TRUE;

    stScrollText->u32Handle = HIFB_SCROLLTEXT_AllocHandle(u32LayerId);

    u32Index = stScrollText->u32Handle & 0x0f;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32Index, SCROLLTEXT_NUM, HI_FAILURE);
    stText = &(pstTextInfo->stScrollText[u32Index]);

    stText->enHandle = stScrollText->u32Handle;
    stText->u32IdleFlag = 1;

    init_waitqueue_head(&(stText->wbEvent));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_SCROLLTEXT_FillText
* description  : 数据处理，这个地方是重头戏，处理比较复杂
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_SCROLLTEXT_FillText(HIFB_SCROLLTEXT_DATA_S *stScrollTextData)
{
    HI_U32 i;
    HI_U32 u32LayerId = HIFB_LAYER_ID_BUTT;
    HI_U32 u32TextId = SCROLLTEXT_NUM;
    HI_U32 u32Handle;
    HI_S32 Ret;
    HIFB_SCROLLTEXT_CACHE stCacheBuf;
    HIFB_BUFFER_S stTempBuf, stCanvasBuf;
    HIFB_BLIT_OPT_S stBlitOpt;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HIFB_SCROLLTEXT_S *pstScrollText = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stScrollTextData, HI_FAILURE);
    u32Handle = stScrollTextData->u32Handle;

    HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));

    Ret = DRV_HIFB_SCROLLTEXT_GetHandle(u32Handle, &u32LayerId, &u32TextId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_GetHandle, Ret);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);
    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);

    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32TextId, SCROLLTEXT_NUM, HI_FAILURE);
    pstScrollText = &(s_stTextLayer[u32LayerId].stScrollText[u32TextId]);
    if (pstScrollText->u32cachebufnum > SCROLLTEXT_CACHE_NUM)
    {
        return HI_FAILURE;
    }

    if (HI_FALSE == pstScrollText->bAvailable)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "the scrolltext was invalid");
        return HI_FAILURE;
    }

    if (HI_TRUE == pstScrollText->bPause)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (0 != stScrollTextData->u32PhyAddr)
    {
        if (!pstScrollText->u32IdleFlag)
        {
            wait_event_interruptible_timeout(pstScrollText->wbEvent, pstScrollText->u32IdleFlag, 100*HZ);
        }

        stCanvasBuf.stCanvas.u32PhyAddr = stScrollTextData->u32PhyAddr;
        stCanvasBuf.stCanvas.enFmt      = pstScrollText->ePixelFmt;
        stCanvasBuf.stCanvas.u32Width   = pstScrollText->stRect.w;
        stCanvasBuf.stCanvas.u32Height  = pstScrollText->stRect.h;
        stCanvasBuf.stCanvas.u32Pitch   = stScrollTextData->u32Stride;
        stCanvasBuf.UpdateRect.x        = 0;
        stCanvasBuf.UpdateRect.y        = 0;
        stCanvasBuf.UpdateRect.w        = pstScrollText->stRect.w;
        stCanvasBuf.UpdateRect.h        = pstScrollText->stRect.h;

        for (i = 0; i < pstScrollText->u32cachebufnum; i++)
        {
            stCacheBuf = pstScrollText->stCachebuf[i];
            if (HI_FALSE == stCacheBuf.bInusing)
            {
                stTempBuf.stCanvas.u32PhyAddr = stCacheBuf.u32PhyAddr;
                stTempBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
                stTempBuf.stCanvas.u32Width   = pstScrollText->stRect.w;
                stTempBuf.stCanvas.u32Height  = pstScrollText->stRect.h;
                stTempBuf.stCanvas.u32Pitch   = pstScrollText->u32Stride;
                stTempBuf.UpdateRect.x        = 0;
                stTempBuf.UpdateRect.y        = 0;
                stTempBuf.UpdateRect.w        = pstScrollText->stRect.w;
                stTempBuf.UpdateRect.h        = pstScrollText->stRect.h;

                if (stTempBuf.stCanvas.u32Pitch != stCanvasBuf.stCanvas.u32Pitch)
                {
                    stBlitOpt.bScale = HI_TRUE;
                }

                if (pstScrollText->bDeflicker && (pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE))
                {
                    stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
                }

                stBlitOpt.bBlock = HI_TRUE;
                stBlitOpt.bCallBack = HI_FALSE;

                pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
                pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
                HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit, HI_FAILURE);
                Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(&stCanvasBuf, &stTempBuf, &stBlitOpt, HI_TRUE);
                if (Ret <= 0)
                {
                    HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
                    return HI_FAILURE;
                }

                i = DRV_SCROLLTEXT_SwitchTextBuffer(pstScrollText,i);

                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_SUCCESS;
            }
        }
    }
    else if (NULL != stScrollTextData->pu8VirAddr)
    {
        HI_CHAR *pBuf = NULL;
        if (pstPar->stExtendInfo.enColFmt != pstScrollText->ePixelFmt)
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->stExtendInfo.enColFmt);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstScrollText->ePixelFmt);
            return HI_FAILURE;
        }

        if (!pstScrollText->u32IdleFlag)
        {
            wait_event_interruptible_timeout(pstScrollText->wbEvent, pstScrollText->u32IdleFlag, 100*HZ);
        }

        for (i = 0; i < pstScrollText->u32cachebufnum; i++)
        {
            HI_U32 u32LineNum = 0;
            stCacheBuf = pstScrollText->stCachebuf[i];
            if (HI_FALSE == stCacheBuf.bInusing)
            {
                HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstScrollText->stCachebuf[i].pVirAddr, HI_FAILURE);
                HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stScrollTextData->pu8VirAddr, HI_FAILURE);

                pBuf = pstScrollText->stCachebuf[i].pVirAddr;
                for (u32LineNum = 0; u32LineNum < pstScrollText->stRect.h; u32LineNum++)
                {
                    HI_GFX_Memcpy(pBuf + u32LineNum*pstScrollText->u32Stride,
                           stScrollTextData->pu8VirAddr + u32LineNum * stScrollTextData->u32Stride,pstScrollText->u32Stride);
                }

                i = DRV_SCROLLTEXT_SwitchTextBuffer(pstScrollText,i);

                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_SUCCESS;
            }
        }
    }

    return HI_FAILURE;
}

static inline HI_S32 DRV_SCROLLTEXT_SwitchTextBuffer(HIFB_SCROLLTEXT_S *pstScrollText, HI_U32 BufNum)
{
    HI_ULONG flags = 0;
    HI_S32 s32Cnt  = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    spin_lock_irqsave(&scrolltextLock, flags);

    if (NULL == pstScrollText)
    {
       spin_unlock_irqrestore(&scrolltextLock, flags);
       return HI_FAILURE;
    }

    if (BufNum >= SCROLLTEXT_CACHE_NUM)
    {
       spin_unlock_irqrestore(&scrolltextLock, flags);
       return HI_FAILURE;
    }
    pstScrollText->stCachebuf[BufNum].bInusing = HI_TRUE;

    pstScrollText->u32IdleFlag = 0;

    if (pstScrollText->u32cachebufnum >= SCROLLTEXT_CACHE_NUM)
    {
       spin_unlock_irqrestore(&scrolltextLock, flags);
       return HI_FAILURE;
    }

    while (BufNum < pstScrollText->u32cachebufnum)
    {
         HI_U32 u32LastUsingCache = BufNum;
         HI_U32 j = BufNum + 1;

         while (j < pstScrollText->u32cachebufnum)
         {
              if (HI_TRUE == pstScrollText->stCachebuf[j].bInusing)
              {
                    HI_BOOL bInusing   =  pstScrollText->stCachebuf[j].bInusing;
                    HI_U32  u32PhyAddr = pstScrollText->stCachebuf[j].u32PhyAddr;
                    HI_U8   *pVirAddr  = pstScrollText->stCachebuf[j].pVirAddr;
                    pstScrollText->stCachebuf[j].bInusing   = pstScrollText->stCachebuf[u32LastUsingCache].bInusing;
                    pstScrollText->stCachebuf[j].u32PhyAddr = pstScrollText->stCachebuf[u32LastUsingCache].u32PhyAddr;
                    pstScrollText->stCachebuf[j].pVirAddr   = pstScrollText->stCachebuf[u32LastUsingCache].pVirAddr;
                    pstScrollText->stCachebuf[u32LastUsingCache].bInusing = bInusing;
                    pstScrollText->stCachebuf[u32LastUsingCache].u32PhyAddr = u32PhyAddr;
                    pstScrollText->stCachebuf[u32LastUsingCache].pVirAddr = pVirAddr;
                    u32LastUsingCache = j;
              }
              else
              {
                    pstScrollText->u32IdleFlag = 1;
              }

              j++;
         }

        BufNum++;
    }

    if (HI_FALSE == pstScrollText->stCachebuf[0].bInusing)
    {
        pstScrollText->u32IdleFlag = 1;
        for (s32Cnt = 1; s32Cnt < pstScrollText->u32cachebufnum; s32Cnt++)
        {
             HI_BOOL bInusing   =  pstScrollText->stCachebuf[s32Cnt - 1].bInusing;
             HI_U32  u32PhyAddr = pstScrollText->stCachebuf[s32Cnt - 1].u32PhyAddr;
             HI_U8   *pVirAddr  = pstScrollText->stCachebuf[s32Cnt - 1].pVirAddr;
             pstScrollText->stCachebuf[s32Cnt - 1].bInusing   = pstScrollText->stCachebuf[s32Cnt].bInusing;
             pstScrollText->stCachebuf[s32Cnt - 1].u32PhyAddr = pstScrollText->stCachebuf[s32Cnt].u32PhyAddr;
             pstScrollText->stCachebuf[s32Cnt - 1].pVirAddr   = pstScrollText->stCachebuf[s32Cnt].pVirAddr;
             pstScrollText->stCachebuf[s32Cnt].bInusing   = bInusing;
             pstScrollText->stCachebuf[s32Cnt].u32PhyAddr = u32PhyAddr;
             pstScrollText->stCachebuf[s32Cnt].pVirAddr   = pVirAddr;
        }
    }

    spin_unlock_irqrestore(&scrolltextLock, flags);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return BufNum;
}


/***************************************************************************************
* func         : DRV_HIFB_SCROLLTEXT_Destory
* description  : 销毁滚动字幕
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_SCROLLTEXT_Destory(HI_U32 u32LayerID, HI_U32 u32ScrollTextID)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_SCROLLTEXT_S *pstScrollText = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerID, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32ScrollTextID, SCROLLTEXT_NUM, HI_FAILURE);

    if (!s_stTextLayer[u32LayerID].stScrollText[u32ScrollTextID].bAvailable)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, s_stTextLayer[u32LayerID].stScrollText[u32ScrollTextID].bAvailable);
        return HI_FAILURE;
    }

    if (0 == s_stTextLayer[u32LayerID].u32textnum)
    {
        return HI_FAILURE;
    }

    s_stTextLayer[u32LayerID].u32textnum--;

    if (0 == s_stTextLayer[u32LayerID].u32textnum)
    {
        s_stTextLayer[u32LayerID].bAvailable = HI_FALSE;
        flush_work(&s_stTextLayer[u32LayerID].blitScrollTextWork);
    }

    pstScrollText = &(s_stTextLayer[u32LayerID].stScrollText[u32ScrollTextID]);

    if (pstScrollText->s32TdeBlitHandle)
    {
        if (NULL != g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitForDone)
        {
           Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitForDone(pstScrollText->s32TdeBlitHandle, 1000);
        }
        if (Ret < 0)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_WaitForDone, Ret);
            return HI_FAILURE;
        }
    }

    DRV_HIFB_SCROLLTEXT_FreeCacheBuf(pstScrollText);

    s_stTextLayer[u32LayerID].u32ScrollTextId = u32ScrollTextID;
    HI_GFX_Memset(pstScrollText,0,sizeof(HIFB_SCROLLTEXT_S));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


/***************************************************************************************
* func         : HIFB_SCROLLTEXT_CallBack
* description  : 滚动字幕回调，TDE blit之后回调的
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_SCROLLTEXT_CallBack(HI_VOID *pParaml, HI_VOID *pParamr)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32TextLayerId = HIFB_LAYER_ID_BUTT;
    HI_U32 u32TextId = SCROLLTEXT_NUM;
    HI_U32 u32Handle;
    HIFB_SCROLLTEXT_S *pstScrollText = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pParaml, HI_FAILURE);
    u32Handle = *(HI_U32 *)pParaml;

    Ret = DRV_HIFB_SCROLLTEXT_GetHandle(u32Handle, &u32TextLayerId, &u32TextId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_SCROLLTEXT_GetHandle, Ret);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32TextLayerId, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32TextId, SCROLLTEXT_NUM, HI_FAILURE);

    pstScrollText = &(s_stTextLayer[u32TextLayerId].stScrollText[u32TextId]);
    pstScrollText->stCachebuf[0].bInusing = HI_FALSE;

    if (pstScrollText->bAvailable)
    {
        pstScrollText->s32TdeBlitHandle = 0;
        pstScrollText->bBliting = HI_FALSE;

        pstScrollText->u32IdleFlag = 1;
        wake_up_interruptible(&(pstScrollText->wbEvent));
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


/***************************************************************************************
* func         : hifb_scrolltext_blit
* description  : 滚动字幕blit
* param[in]    :
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_VOID HIFB_SCROLLTEXT_BlitWork(struct work_struct *work)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 i, j;
    HI_U32 u32StartAddr;
    HIFB_SCROLLTEXT_INFO_S *pstScrollTextInfo = NULL;
    HIFB_SCROLLTEXT_S *pstScrollText = NULL;
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 u32LayerID;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(work);
    pstScrollTextInfo = (HIFB_SCROLLTEXT_INFO_S *)container_of(work, HIFB_SCROLLTEXT_INFO_S, blitScrollTextWork);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstScrollTextInfo);

    u32LayerID = pstScrollTextInfo - &s_stTextLayer[0];

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(u32LayerID);
    info = s_stLayer[u32LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);

    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    u32StartAddr = pstPar->stRunInfo.CurScreenAddr;

    if (s_stTextLayer[u32LayerID].bAvailable)
    {
        for (i = 0; i < SCROLLTEXT_NUM; i++)
        {
            j = 0;
            pstScrollText = &(pstScrollTextInfo->stScrollText[i]);

            if (   pstScrollText->bAvailable
                && !pstScrollText->bPause
                && pstScrollText->stCachebuf[j].bInusing
                && !pstScrollText->bBliting)
            {
                HIFB_BUFFER_S stTempBuf, stCanvasBuf;
                HIFB_BLIT_OPT_S stBlitOpt;

                HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));

                stCanvasBuf.stCanvas.u32PhyAddr = pstScrollText->stCachebuf[j].u32PhyAddr;
                stCanvasBuf.stCanvas.enFmt     = pstPar->stExtendInfo.enColFmt;
                stCanvasBuf.stCanvas.u32Width  = pstScrollText->stRect.w;
                stCanvasBuf.stCanvas.u32Height = pstScrollText->stRect.h;
                stCanvasBuf.stCanvas.u32Pitch  = pstScrollText->u32Stride;

                stCanvasBuf.UpdateRect.x      = 0;
                stCanvasBuf.UpdateRect.y      = 0;
                stCanvasBuf.UpdateRect.w      = pstScrollText->stRect.w;
                stCanvasBuf.UpdateRect.h      = pstScrollText->stRect.h;

                stTempBuf.stCanvas.u32PhyAddr = u32StartAddr;
                stTempBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
                stTempBuf.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
                stTempBuf.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
                stTempBuf.stCanvas.u32Pitch   = info->fix.line_length;

                if (pstScrollText->stRect.x >= pstPar->stExtendInfo.stPos.s32XPos)
                {
                  stTempBuf.UpdateRect.x = pstScrollText->stRect.x - pstPar->stExtendInfo.stPos.s32XPos;
                }

                if (pstScrollText->stRect.y >= pstPar->stExtendInfo.stPos.s32YPos)
                {
                   stTempBuf.UpdateRect.y = pstScrollText->stRect.y - pstPar->stExtendInfo.stPos.s32YPos;
                }

                stTempBuf.UpdateRect.w = pstScrollText->stRect.w;
                stTempBuf.UpdateRect.h = pstScrollText->stRect.h;

                if (stTempBuf.stCanvas.u32Width != stCanvasBuf.stCanvas.u32Width || stTempBuf.stCanvas.u32Height != stCanvasBuf.stCanvas.u32Height)
                {
                    stBlitOpt.bScale = HI_TRUE;
                }

                if (pstScrollText->bDeflicker && pstPar->stBaseInfo.enAntiflickerMode == HIFB_ANTIFLICKER_TDE)
                {
                    stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
                }

                stBlitOpt.bBlock = HI_FALSE;
                stBlitOpt.bCallBack = HI_TRUE;
                stBlitOpt.pfnCallBack = (IntCallBack)HIFB_SCROLLTEXT_CallBack;
                stBlitOpt.pParam = &(pstScrollText->enHandle);
                pstScrollText->bBliting = HI_TRUE;

                pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
                pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
                HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit);
                Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(&stCanvasBuf, &stTempBuf, &stBlitOpt, HI_TRUE);
                if (Ret <= 0)
                {
                    HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_Blit, Ret);
                    return;
                }

                pstScrollText->s32TdeBlitHandle = Ret;
            }
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 DRV_HIFB_SCROLLTEXT_Blit(HI_U32 u32LayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(u32LayerId, HI_FAILURE);

    if (s_stTextLayer[u32LayerId].bAvailable)
    {
        schedule_work(&(s_stTextLayer[u32LayerId].blitScrollTextWork));
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif
