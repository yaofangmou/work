/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_refresh.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                  Author                Modification
2018/01/01             sdk                 Created file
***************************************************************************************************/


/*********************************add include here*************************************************/
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/file.h>
#include <linux/fb.h>

#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_config.h"
#include "drv_hifb_fence.h"
#include "drv_hifb_debug.h"
/***************************** Macro Definition ***************************************************/


/*************************** Structure Definition *************************************************/
#ifdef CONFIG_HIFB_FENCE_SUPPORT
typedef struct tagHifbRefreshWorkQueue_S
{
    HIFB_PAR_S *pstPar;
    HIFB_HWC_LAYERINFO_S stLayerInfo;
    struct hi_sync_fence *pSyncfence;
    struct work_struct FenceRefreshWork;
}HIFB_REFRESH_WORKQUEUE_S;
#endif

/********************** Global Variable declaration ***********************************************/

/******************************* API declaration **************************************************/
static HI_S32  HIFB_REFRESH_PanDisplayForStereo  (struct fb_var_screeninfo *var, struct fb_info *info);
static HI_VOID HIFB_REFRESH_PanDisplayForNoStero (struct fb_var_screeninfo *var, struct fb_info *info);
static HI_VOID HIFB_REFRESH_UpNonStereoADDR      (struct fb_var_screeninfo *var, struct fb_info *info);
static HI_U32  HIFB_REFRESH_GetNonStereoADDR     (struct fb_var_screeninfo *var, struct fb_info *info);

#ifdef CONFIG_HIFB_FENCE_SUPPORT
static HI_VOID HIFB_REFRESH_HwcWork(struct work_struct *work);
static HI_VOID HIFB_REFRESH_Flip(HIFB_REFRESH_WORKQUEUE_S *pstWork);
#endif

#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
static HI_VOID HIFB_REFRESH_SetLowPowerInfo(HIFB_PAR_S* pstPar, HIFB_HWC_LAYERINFO_S *pstHwcLayerInfo);
#endif

/******************************* API realization **************************************************/
HI_S32 DRV_HIFB_REFRESH_PanDisplay(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    HI_ULONG StereoLockFlag = 0;
    HIFB_PAR_S *pstPar = NULL;

    HI_GFX_TINIT();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /***************************beg check par **********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(var, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    if (HIFB_REFRESH_MODE_WITH_PANDISPLAY != pstPar->stExtendInfo.enBufMode) { return HI_SUCCESS; }
    /***************************end check par **********************************/

    /***************************beg count times **********************************/
    HI_GFX_TSTART(NowTimeMs);
    pstPar->stFrameInfo.TwiceRefreshTimeMs = NowTimeMs - pstPar->stFrameInfo.PreRefreshTimeMs;
    pstPar->stFrameInfo.PreRefreshTimeMs = NowTimeMs;
    /***************************end count times **********************************/

    DRV_HIFB_Lock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);
       if (HI_TRUE == pstPar->st3DInfo.IsStereo)
       {
           pstPar->st3DInfo.BegUpStereoInfo = HI_TRUE;
           DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);

           HIFB_REFRESH_PanDisplayForStereo(var,info);

           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HI_SUCCESS;
       }
    DRV_HIFB_UnLock(&pstPar->st3DInfo.StereoLock,&StereoLockFlag);

    HIFB_REFRESH_PanDisplayForNoStero(var,info);

    pstPar->hifb_sync = HI_FALSE;
    pstPar->stFrameInfo.RefreshFrame++;

    /***************************beg count times **********************************/
    HI_GFX_TEND(EndTimeMs);
    pstPar->stFrameInfo.RunRefreshTimeMs = EndTimeMs - NowTimeMs;
    /***************************end count times **********************************/

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 HIFB_REFRESH_PanDisplayForStereo(struct fb_var_screeninfo *var, struct fb_info *info)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
     HI_S32 Ret = HI_SUCCESS;
     HIFB_PAR_S *pstPar = NULL;
     HIFB_BUFFER_S stInputDataBuf;
     HIFB_BLIT_OPT_S stBlitOpt;

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(var, HI_FAILURE);
     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);
     pstPar = (HIFB_PAR_S *)info->par;
     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);

     if ((HIFB_STEREO_FRMPACKING == pstPar->st3DInfo.StereoMode) || (0 == pstPar->st3DInfo.st3DMemInfo.u32StereoMemStart))
     {
        HIFB_REFRESH_UpNonStereoADDR(var,info);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
     }

     HI_GFX_Memset(&stInputDataBuf, 0x0, sizeof(stInputDataBuf));
     stInputDataBuf.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
     stInputDataBuf.stCanvas.u32Pitch   = info->fix.line_length;
     stInputDataBuf.stCanvas.u32PhyAddr = HIFB_REFRESH_GetNonStereoADDR(var,info);
     stInputDataBuf.stCanvas.u32Width   = info->var.xres;
     stInputDataBuf.stCanvas.u32Height  = info->var.yres;

     stInputDataBuf.UpdateRect.x = 0;
     stInputDataBuf.UpdateRect.y = 0;
     stInputDataBuf.UpdateRect.w = stInputDataBuf.stCanvas.u32Width;
     stInputDataBuf.UpdateRect.h = stInputDataBuf.stCanvas.u32Height;

     pstPar->st3DInfo.st3DSurface.enFmt      = stInputDataBuf.stCanvas.enFmt;
     pstPar->st3DInfo.st3DSurface.u32Width   = stInputDataBuf.stCanvas.u32Width;
     pstPar->st3DInfo.st3DSurface.u32Height  = stInputDataBuf.stCanvas.u32Height;

     HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(pstPar->stRunInfo.u32IndexForInt, CONFIG_HIFB_LAYER_BUFFER_MAX_NUM, HI_FAILURE);
     pstPar->st3DInfo.st3DSurface.u32PhyAddr = pstPar->st3DInfo.u32DisplayAddr[pstPar->stRunInfo.u32IndexForInt];

     HI_GFX_Memset(&stBlitOpt, 0, sizeof(stBlitOpt));
     stBlitOpt.bScale = HI_TRUE;
     stBlitOpt.bBlock = HI_TRUE;
     stBlitOpt.bRegionDeflicker = HI_TRUE;
     if (HIFB_ANTIFLICKER_TDE == pstPar->stBaseInfo.enAntiflickerMode)
     {
         stBlitOpt.enAntiflickerLevel = pstPar->stBaseInfo.enAntiflickerLevel;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }

     stBlitOpt.pParam = &(pstPar->stBaseInfo.u32LayerID);
     stBlitOpt.bCallBack = HI_TRUE;
     stBlitOpt.pfnCallBack = (IntCallBack)DRV_HIFB_BlitFinishCallBack;

     Ret = DRV_HIFB_UpStereoData(pstPar->stBaseInfo.u32LayerID, &stInputDataBuf, &stBlitOpt);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_UpStereoData, Ret);
         return HI_FAILURE;
     }

    /** can relese stereo memory **/
    pstPar->st3DInfo.BegUpStereoInfo = HI_FALSE;
    wake_up_interruptible(&pstPar->st3DInfo.WaiteFinishUpStereoInfoMutex);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#else
    HI_UNUSED(info);
#endif

    return HI_SUCCESS;
}

static HI_VOID HIFB_REFRESH_PanDisplayForNoStero(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_U32 CurDispAddr = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(var);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    HIFB_REFRESH_UpNonStereoADDR(var,info);

    if ((var->activate & FB_ACTIVATE_VBL) && (HI_TRUE == pstPar->bVblank))
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        DRV_HIFB_WaitVBlank(pstPar->stBaseInfo.u32LayerID);

        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetLayerAddr(pstPar->stBaseInfo.u32LayerID, &CurDispAddr);
        if (CurDispAddr != pstPar->stRunInfo.CurScreenAddr)
        {
            DRV_HIFB_WaitVBlank(pstPar->stBaseInfo.u32LayerID);
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID HIFB_REFRESH_UpNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info)
{
    HIFB_PAR_S *pstPar = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)info->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    pstPar->stRunInfo.bModifying = HI_TRUE;
    pstPar->stRunInfo.CurScreenAddr       = HIFB_REFRESH_GetNonStereoADDR(var,info);
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_STRIDE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_DISPLAYADDR;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.bModifying = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_U32 HIFB_REFRESH_GetNonStereoADDR(struct fb_var_screeninfo *var, struct fb_info *info)
{
     HI_S32 Ret = HI_SUCCESS;
     HI_U32 u32Align = 0xf;
     HI_U32 PerPixDepth = 0;
     HI_U32 PixXOffset = 0;
     HI_U32 PixYOffset = 0;
     HI_U32 u32TmpSize = 0;
     HI_U32 StartDisplayAddr = 0;
     HIFB_PAR_S *pstPar = NULL;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(var, 0x0);
     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, 0x0);
     pstPar = (HIFB_PAR_S *)info->par;
     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, 0x0);

     if (var->xoffset > CONFIG_HIFB_LAYER_MAXWIDTH)
     {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, var->xoffset);
         return info->fix.smem_start;
     }

     Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_STRIDE | HIFB_PARA_CHECK_BITSPERPIXEL,
                                   0, var->yres, info->fix.line_length, 0, var->bits_per_pixel);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, var->bits_per_pixel);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->fix.line_length);
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
         return info->fix.smem_start;
     }

     PerPixDepth = DRV_HIFB_GetPixDepth(var->bits_per_pixel);
     PixXOffset  = var->xoffset * PerPixDepth;
     PixYOffset  = info->fix.line_length * var->yoffset;

     if (0 != pstPar->stRunInfo.LastScreenAddr)
     {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return pstPar->stRunInfo.LastScreenAddr;
     }

     u32TmpSize = PixYOffset + PixXOffset;
     HI_GFX_CHECK_U64_ADDITION_REVERSAL_RETURN(info->fix.smem_start,u32TmpSize, info->fix.smem_start);
     HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_RETURN((info->fix.smem_start + u32TmpSize), info->fix.smem_start);

     if ( (info->var.bits_per_pixel == 24) && ( (info->var.xoffset != 0) || (info->var.yoffset != 0) ) )
     {
         StartDisplayAddr = (info->fix.smem_start + u32TmpSize)/16/3;
         StartDisplayAddr = StartDisplayAddr * 16 * 3;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }
     else
     {
         StartDisplayAddr = (info->fix.smem_start + u32TmpSize) & (~u32Align);
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }

     u32TmpSize = HI_HIFB_GetMemSize(info->fix.line_length, var->yres);
     HI_GFX_CHECK_U64_ADDITION_REVERSAL_RETURN(StartDisplayAddr, u32TmpSize, info->fix.smem_start);

     if ((StartDisplayAddr + u32TmpSize) > (info->fix.smem_start + info->fix.smem_len))
     {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, StartDisplayAddr + u32TmpSize);
         return info->fix.smem_start;
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return StartDisplayAddr;
}

#ifdef CONFIG_HIFB_FENCE_SUPPORT
HI_S32 DRV_HIFB_REFRESH_FenceFlip(HIFB_PAR_S* pstPar, HI_VOID *pArgs)
{
    HI_S32 s32FenceFd = -1;
    struct fb_info *FbInfo = NULL;
    HIFB_REFRESH_WORKQUEUE_S *pstWork = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, -EFAULT);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pArgs, -EFAULT);

    if (pstPar->stBaseInfo.u32LayerID >= sizeof(s_stLayer) / sizeof(HIFB_LAYER_S))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstPar->stBaseInfo.u32LayerID);
        return HI_FAILURE;
    }

    FbInfo = s_stLayer[pstPar->stBaseInfo.u32LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(FbInfo, HI_FAILURE);

    pstWork = (HIFB_REFRESH_WORKQUEUE_S*)HI_GFX_KMALLOC(HIGFX_FB_ID,sizeof(HIFB_REFRESH_WORKQUEUE_S), GFP_KERNEL);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstWork, -EFAULT);

    if (copy_from_user(&(pstWork->stLayerInfo), pArgs, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
       HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
       return -EFAULT;
    }

#ifdef CONFIG_GFX_PROC_SUPPORT
    pstPar->stProcInfo.b3DStatus = pstPar->st3DInfo.IsStereo;
    pstPar->stProcInfo.bHwcRefreshInDeCmpStatus = pstWork->stLayerInfo.bDeCompress;
    pstPar->stProcInfo.HwcRefreshInDispFmt      = (HI_U32)pstWork->stLayerInfo.eFmt;
    pstPar->stProcInfo.HwcRefreshInDispStride   = pstWork->stLayerInfo.u32Stride;
    pstPar->stProcInfo.HwcRefreshInDispAdress   = pstWork->stLayerInfo.u32LayerAddr;
#endif

    /*************************** refresh  *************************************/
    s32FenceFd = DRV_HIFB_FENCE_Create();
    if (s32FenceFd < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_FENCE_Create, s32FenceFd);
        HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
        return -EFAULT;
    }

    pstWork->pstPar = pstPar;
    pstWork->stLayerInfo.s32ReleaseFenceFd = s32FenceFd;

    /**<-- save draw fence -->**/
    if (pstWork->stLayerInfo.s32AcquireFenceFd >= 0)
    {/** if not use gpu composer, no need wait, because hwcomposer sync **/
        pstWork->pSyncfence = hi_sync_fence_fdget(pstWork->stLayerInfo.s32AcquireFenceFd);
    }
    else
    {
        pstWork->pSyncfence = NULL;
    }

    if (NULL == pstPar->pFenceRefreshWorkqueue)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstPar->pFenceRefreshWorkqueue);
        put_unused_fd(pstWork->stLayerInfo.s32ReleaseFenceFd);
        HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
        return -EFAULT;
    }

    pstWork->stLayerInfo.bStereo = pstPar->st3DInfo.IsStereo;
    if (copy_to_user(pArgs,&(pstWork->stLayerInfo),sizeof(HIFB_HWC_LAYERINFO_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        put_unused_fd(pstWork->stLayerInfo.s32ReleaseFenceFd);
        HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
        return -EFAULT;
    }

    pstPar->bEndFenceRefresh = HI_FALSE;
    INIT_WORK(&(pstWork->FenceRefreshWork), HIFB_REFRESH_HwcWork);
    queue_work(pstPar->pFenceRefreshWorkqueue, &(pstWork->FenceRefreshWork));
#if 0
    Ret = wait_event_interruptible_timeout(pstPar->WaiteEndFenceRefresh, HI_TRUE == pstPar->bEndFenceRefresh,50 * HZ/1000);
#endif

    pstPar->bEndFenceRefresh = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID HIFB_REFRESH_HwcWork(struct work_struct *work)
{
    HIFB_PAR_S *pstPar  = NULL;
    HI_BOOL NoDiscardFrame = HI_FALSE;
    HI_BOOL bShouldWaite   = HI_FALSE;
    HIFB_REFRESH_WORKQUEUE_S *pstWork = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(work);
    pstWork = (HIFB_REFRESH_WORKQUEUE_S*)container_of(work, HIFB_REFRESH_WORKQUEUE_S, FenceRefreshWork);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstWork);

    /**<-- waite draw fence -->**/
    if (NULL != pstWork->pSyncfence)
    {
        DRV_HIFB_FENCE_Wait(pstWork->pSyncfence, 4000);
        hi_sync_fence_put(pstWork->pSyncfence);
        pstWork->pSyncfence = NULL;
    }

    pstPar = pstWork->pstPar;
    if (NULL == pstPar)
    {
         HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "pstPar is null");
         HI_GFX_KFREE(HIGFX_FB_ID,pstWork);
         return;
    }

    if (pstPar->FenceRefreshCount > 0)
    {
       g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_WhetherDiscardFrame(pstPar->stBaseInfo.u32LayerID, &NoDiscardFrame);
       NoDiscardFrame = (HI_FALSE == pstWork->stLayerInfo.bDiscardFrame) ? NoDiscardFrame : HI_FALSE;
       pstPar->bProcDiscardFrame = (HI_FALSE == NoDiscardFrame) ? (HI_TRUE) : (HI_FALSE);
       bShouldWaite = (HI_TRUE == pstPar->bDiscardFrame) ? (HI_FALSE) : (NoDiscardFrame);
       DRV_HIFB_FENCE_WaitRefreshEnd(bShouldWaite);
    }

    HIFB_REFRESH_Flip(pstWork);

    HI_GFX_KFREE(HIGFX_FB_ID,pstWork);

    pstPar->bEndFenceRefresh = HI_TRUE;
    wake_up_interruptible(&pstPar->WaiteEndFenceRefresh);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID HIFB_REFRESH_Flip(HIFB_REFRESH_WORKQUEUE_S *pstWork)
{
    HI_BOOL bDispEnable = HI_FALSE;
    HI_ULONG LockParFlag = 0;
    HI_BOOL bShouldClosePreMult = HI_FALSE;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *info = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstWork);
    pstPar = pstWork->pstPar;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(pstPar->stBaseInfo.u32LayerID);
    info = s_stLayer[pstPar->stBaseInfo.u32LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);

    if ((HI_TRUE == pstWork->stLayerInfo.bDeCompress) && (HI_TRUE == pstPar->st3DInfo.IsStereo))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstWork->stLayerInfo.bDeCompress);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstPar->st3DInfo.IsStereo);
        return;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetClosePreMultState(pstPar->stBaseInfo.u32LayerID, &bShouldClosePreMult);
    if (HI_TRUE == bShouldClosePreMult)
    {
        pstPar->stBaseInfo.bPreMul = HI_FALSE;
    }
    else
    {
        pstPar->stBaseInfo.bPreMul = pstWork->stLayerInfo.bPreMul;
    }

    pstPar->stRunInfo.LastScreenAddr = pstWork->stLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt    = pstWork->stLayerInfo.eFmt;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(pstPar->stBaseInfo.u32LayerID, pstWork->stLayerInfo.eFmt);

    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
        pstPar->bDeCompress = HI_FALSE;
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetDeCmpSwitch(pstPar->stBaseInfo.u32LayerID, HI_FALSE);

        HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(0, pstWork->stLayerInfo.u32Stride);
        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_NOVALUE(info->fix.smem_start, pstWork->stLayerInfo.u32LayerAddr);
        info->var.yoffset = (pstWork->stLayerInfo.u32LayerAddr - info->fix.smem_start)/pstWork->stLayerInfo.u32Stride;

        DRV_HIFB_REFRESH_PanDisplay(&info->var, info);

        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetHaltDispStatus(pstPar->stBaseInfo.u32LayerID, &bDispEnable);

        DRV_HIFB_FENCE_IncRefreshTime(bDispEnable);

        return;
    }

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockParFlag);
    pstPar->stRunInfo.bModifying          = HI_TRUE;
    #ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
    HIFB_REFRESH_SetLowPowerInfo(pstPar,&(pstWork->stLayerInfo));
    #endif
    pstPar->bDeCompress                   = pstWork->stLayerInfo.bDeCompress;
    pstPar->stRunInfo.CurScreenAddr       = pstWork->stLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt         = pstWork->stLayerInfo.eFmt;
    pstPar->stExtendInfo.DisplayStride    = pstWork->stLayerInfo.u32Stride;
    pstPar->stExtendInfo.stPos.s32XPos    = pstWork->stLayerInfo.stInRect.x;
    pstPar->stExtendInfo.stPos.s32YPos    = pstWork->stLayerInfo.stInRect.y;
    pstPar->stExtendInfo.DisplayWidth     = pstWork->stLayerInfo.stInRect.w;
    pstPar->stExtendInfo.DisplayHeight    = pstWork->stLayerInfo.stInRect.h;
#ifdef CONFIG_GFX_CANVASE_TO_LAYER_SUPPORT
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;
#endif
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FENCE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_BMUL;
    pstPar->stRunInfo.bModifying          = HI_FALSE;
    pstPar->FenceRefreshCount++;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#else
HI_S32 DRV_HIFB_REFRESH_NoFenceFlip(HIFB_PAR_S* pstPar, HI_VOID *pArgs)
{
    HI_BOOL bShouldClosePreMult = HI_FALSE;
    HI_ULONG LockParFlag = 0;
    struct fb_info *info = NULL;
    HIFB_HWC_LAYERINFO_S stHwcLayerInfo;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstPar, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pArgs, HI_FAILURE);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(pstPar->stBaseInfo.u32LayerID,-EFAULT);
    info = s_stLayer[pstPar->stBaseInfo.u32LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(info, HI_FAILURE);

    HI_GFX_Memset(&stHwcLayerInfo, 0x0, sizeof(stHwcLayerInfo));

    if (copy_from_user(&stHwcLayerInfo, pArgs, sizeof(HIFB_HWC_LAYERINFO_S)))
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
       return HI_FAILURE;
    }

#ifdef CONFIG_GFX_PROC_SUPPORT
    pstPar->stProcInfo.b3DStatus = pstPar->st3DInfo.IsStereo;
    pstPar->stProcInfo.bHwcRefreshInDeCmpStatus = stHwcLayerInfo.bDeCompress;
    pstPar->stProcInfo.HwcRefreshInDispFmt      = (HI_U32)stHwcLayerInfo.eFmt;
    pstPar->stProcInfo.HwcRefreshInDispStride   = stHwcLayerInfo.u32Stride;
    pstPar->stProcInfo.HwcRefreshInDispAdress   = stHwcLayerInfo.u32LayerAddr;
#endif

    /*************************** refresh  *************************************/
    stHwcLayerInfo.bStereo = pstPar->st3DInfo.IsStereo;
    if (copy_to_user(pArgs,&stHwcLayerInfo,sizeof(HIFB_HWC_LAYERINFO_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return HI_FAILURE;
    }

    if ((HI_TRUE == stHwcLayerInfo.bDeCompress) && (HI_TRUE == pstPar->st3DInfo.IsStereo))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "decompress and stereo only support once");
        return HI_FAILURE;
    }

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetClosePreMultState(pstPar->stBaseInfo.u32LayerID, &bShouldClosePreMult);
    if (HI_TRUE == bShouldClosePreMult)
    {
        pstPar->stBaseInfo.bPreMul = HI_FALSE;
    }
    else
    {
        pstPar->stBaseInfo.bPreMul = stHwcLayerInfo.bPreMul;
    }

    pstPar->stRunInfo.LastScreenAddr = stHwcLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt = stHwcLayerInfo.eFmt;

    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(pstPar->stBaseInfo.u32LayerID, stHwcLayerInfo.eFmt);

    if (HI_TRUE == pstPar->st3DInfo.IsStereo)
    {
        pstPar->bDeCompress = HI_FALSE;
        g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_SetDeCmpSwitch(pstPar->stBaseInfo.u32LayerID, HI_FALSE);

        HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, stHwcLayerInfo.u32Stride, -EFAULT);
        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(info->fix.smem_start, stHwcLayerInfo.u32LayerAddr,HI_FAILURE);
        info->var.yoffset = (stHwcLayerInfo.u32LayerAddr - info->fix.smem_start) / stHwcLayerInfo.u32Stride;

        DRV_HIFB_REFRESH_PanDisplay(&info->var, info);

        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    DRV_HIFB_Lock(&pstPar->stBaseInfo.lock,&LockParFlag);
    pstPar->stRunInfo.bModifying          = HI_TRUE;
    #ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
    HIFB_REFRESH_SetLowPowerInfo(pstPar,&stHwcLayerInfo);
    #endif
    pstPar->bDeCompress                   = stHwcLayerInfo.bDeCompress;
    pstPar->stRunInfo.CurScreenAddr       = stHwcLayerInfo.u32LayerAddr;
    pstPar->stExtendInfo.enColFmt         = stHwcLayerInfo.eFmt;
    pstPar->stExtendInfo.DisplayStride    = stHwcLayerInfo.u32Stride;
    pstPar->stExtendInfo.stPos.s32XPos    = stHwcLayerInfo.stInRect.x;
    pstPar->stExtendInfo.stPos.s32YPos    = stHwcLayerInfo.stInRect.y;
    pstPar->stExtendInfo.DisplayWidth     = stHwcLayerInfo.stInRect.w;
    pstPar->stExtendInfo.DisplayHeight    = stHwcLayerInfo.stInRect.h;
 #ifdef CONFIG_GFX_CANVASE_TO_LAYER_SUPPORT
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FMT;
 #endif
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_INRECT;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_REFRESH;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_FENCE;
    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_BMUL;
    pstPar->stRunInfo.bModifying          = HI_FALSE;
    DRV_HIFB_UnLock(&pstPar->stBaseInfo.lock,&LockParFlag);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
static HI_VOID HIFB_REFRESH_SetLowPowerInfo(HIFB_PAR_S* pstPar, HIFB_HWC_LAYERINFO_S *pstHwcLayerInfo)
{
    HI_S32 Index = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstHwcLayerInfo);

    pstPar->stLowPowerInfo.LowPowerEn = pstHwcLayerInfo->stLowPowerInfo.LowPowerEn;

    for (Index = 0; Index < CONFIG_HIFB_LOWPOWER_MAX_PARA_CNT; Index++)
    {
       pstPar->stLowPowerInfo.LpInfo[Index] = pstHwcLayerInfo->stLowPowerInfo.LpInfo[Index];
    }

    pstPar->stRunInfo.u32ParamModifyMask |= HIFB_LAYER_PARAMODIFY_LOWPOWER;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif
