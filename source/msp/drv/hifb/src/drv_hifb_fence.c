/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name     : drv_hifb_fence.c
Version       : Initial Draft
Author        :
Created       : 2018/01/01
Description   :
Function List :


History       :
Date                       Author                 Modification
2018/01/01                 sdk                    Created file
**************************************************************************************************/

#ifdef CONFIG_HIFB_FENCE_SUPPORT

/*********************************add include here************************************************/
#include <linux/file.h>

#include "drv_hifb_mem.h"
#include "drv_hifb_fence.h"
#include "drv_hifb_config.h"
#include "drv_hifb_debug.h"
/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/


/********************** Global Variable declaration **********************************************/
HIFB_SYNC_INFO_S gs_SyncInfo;
extern HIFB_DRV_OPS_S g_stDrvAdpCallBackFunction;

/******************************* API declaration *************************************************/
HI_S32 DRV_HIFB_FENCE_Init(HIFB_PAR_S *par)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(par, HI_FAILURE);

    if (HIFB_LAYER_HD_0 != par->stBaseInfo.u32LayerID)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    gs_SyncInfo.TimeLine       = 0;
    gs_SyncInfo.FenceValue     = 1;
    gs_SyncInfo.RegUpdateCnt   = 0;
    gs_SyncInfo.ReleaseFenceFd = -1;
    gs_SyncInfo.FrameEndFlag   = 0;

    gs_SyncInfo.pstTimeline = hi_sw_sync_timeline_create("hifb-sync");

    spin_lock_init(&gs_SyncInfo.lock);
    init_waitqueue_head(&gs_SyncInfo.FrameEndEvent);

    par->FenceRefreshCount = 0;
    par->bEndFenceRefresh  = HI_FALSE;

    par->pFenceRefreshWorkqueue = create_singlethread_workqueue(HIFB_HWC_REFRESH_WORK_QUEUE);
    if (NULL == par->pFenceRefreshWorkqueue)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, create_singlethread_workqueue, FAILURE_TAG);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID DRV_HIFB_FENCE_DeInit(HIFB_PAR_S *par)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);

    if (HIFB_LAYER_HD_0 != par->stBaseInfo.u32LayerID)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (NULL != gs_SyncInfo.pstTimeline)
    {
        hi_sync_timeline_destroy((struct sync_timeline*)gs_SyncInfo.pstTimeline);
    }
    gs_SyncInfo.pstTimeline = NULL;

    if (NULL != par->pFenceRefreshWorkqueue)
    {
        destroy_workqueue(par->pFenceRefreshWorkqueue);
    }
    par->pFenceRefreshWorkqueue = NULL;

    par->bEndFenceRefresh = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_VOID DRV_HIFB_FENCE_GetRegUpCnt(HI_U32* pRegUpdateCnt)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL != pRegUpdateCnt)
    {
       *pRegUpdateCnt = gs_SyncInfo.RegUpdateCnt;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_VOID DRV_HIFB_FENCE_FrameEndCallBack(HI_VOID *pParaml, HI_VOID *pParamr)
{
    HI_U32 *LayerId = NULL;
    HI_ULONG LockFlag = 0;
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    HI_BOOL HasBeenClosedForEndCallBack = HI_FALSE;
    HI_ULONG ActualIntLineNumsEndCallBack  = 0;
    HI_ULONG HardIntCntForEndCallBack = 0;
    HI_GFX_TINIT();

    HI_UNUSED(pParamr);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /*************************** check para ***********************************/
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pParaml);
    LayerId = (HI_U32*)pParaml;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(LayerId);

    if (HIFB_LAYER_HD_0 != *LayerId)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    /*************************** count times **********************************/
    HI_GFX_TSTART(NowTimeMs);
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetCloseState(*LayerId, NULL, &HasBeenClosedForEndCallBack);
    if (HI_TRUE == HasBeenClosedForEndCallBack)
    {
        gs_SyncInfo.PreTimeMs = 0;
        gs_SyncInfo.MaxTimeMs = 0;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (0 == gs_SyncInfo.PreTimeMs)
    {
        gs_SyncInfo.PreTimeMs = NowTimeMs;
    }
    if ((NowTimeMs - gs_SyncInfo.PreTimeMs) > gs_SyncInfo.MaxTimeMs)
    {
        gs_SyncInfo.MaxTimeMs = NowTimeMs - gs_SyncInfo.PreTimeMs;
    }
    gs_SyncInfo.PreTimeMs = NowTimeMs;

    /*************************** count interupt information *******************/
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_GetDhd0Info(*LayerId, NULL, NULL, &ActualIntLineNumsEndCallBack, &HardIntCntForEndCallBack);
    gs_SyncInfo.ActualIntLineNumsForEndCallBack  = ActualIntLineNumsEndCallBack;
    gs_SyncInfo.HardIntCntForEndCallBack         = HardIntCntForEndCallBack;
    gs_SyncInfo.EndSoftCallBackCnt++;

    /*************************** release fence ********************************/
    if (0 == gs_SyncInfo.RegUpdateCnt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    spin_lock_irqsave(&gs_SyncInfo.lock,LockFlag);
      if (NULL == gs_SyncInfo.pstTimeline)
      {
         wake_up_interruptible(&gs_SyncInfo.FrameEndEvent);
         spin_unlock_irqrestore(&gs_SyncInfo.lock,LockFlag);
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
      }

      while (gs_SyncInfo.RegUpdateCnt > 0)
      {
          gs_SyncInfo.RegUpdateCnt--;
          hi_sw_sync_timeline_inc(gs_SyncInfo.pstTimeline, 1);
          gs_SyncInfo.TimeLine++;
          HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
      }

      gs_SyncInfo.FrameEndFlag = 1;
      wake_up_interruptible(&gs_SyncInfo.FrameEndEvent);

    spin_unlock_irqrestore(&gs_SyncInfo.lock,LockFlag);

    /*************************** count run times **********************************/
    HI_GFX_TEND(EndTimeMs);
    if ((EndTimeMs - NowTimeMs) > gs_SyncInfo.RunMaxTimeMs)
    {
        gs_SyncInfo.RunMaxTimeMs = EndTimeMs - NowTimeMs;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 DRV_HIFB_FENCE_Create(HI_VOID)
{
    HI_S32 FenceFd   = -1;
    HI_U32 FenceValue = 0;
    struct hi_sync_fence *fence = NULL;
    struct sync_pt *pt = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_SyncInfo.pstTimeline, HI_FAILURE);

    FenceFd = get_unused_fd_flags(0);
    if (FenceFd < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, get_unused_fd_flags, FenceFd);
        return FenceFd;
    }
    gs_SyncInfo.ReleaseFenceFd = FenceFd;

    FenceValue = ++(gs_SyncInfo.FenceValue);
    pt = hi_sw_sync_pt_create(gs_SyncInfo.pstTimeline, FenceValue);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pt, HI_FAILURE);

    fence = hi_sync_fence_create(pt);
    if (NULL == fence)
    {
        hi_sync_pt_free(pt);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hi_sync_fence_create, FenceFd);
        return -ENOMEM;
    }

    hi_sync_fence_install(fence, FenceFd);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return FenceFd;
}

HI_VOID DRV_HIFB_FENCE_WaitRefreshEnd(HI_BOOL ShouldWaite)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (HI_TRUE == ShouldWaite)
    {
        gs_SyncInfo.FrameEndFlag = 0;
        wait_event_interruptible_timeout(gs_SyncInfo.FrameEndEvent, gs_SyncInfo.FrameEndFlag, HZ);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_VOID DRV_HIFB_FENCE_IncRefreshTime(HI_BOOL bLayerEnable)
{
    HI_ULONG LockFlag;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    spin_lock_irqsave(&gs_SyncInfo.lock,LockFlag);
      gs_SyncInfo.RegUpdateCnt++;
    spin_unlock_irqrestore(&gs_SyncInfo.lock,LockFlag);

    if (HI_TRUE == bLayerEnable)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (0 == gs_SyncInfo.RegUpdateCnt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (NULL == gs_SyncInfo.pstTimeline)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    while (gs_SyncInfo.RegUpdateCnt > 0)
    {
        gs_SyncInfo.RegUpdateCnt--;
        hi_sw_sync_timeline_inc(gs_SyncInfo.pstTimeline, 1);
        gs_SyncInfo.TimeLine++;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 DRV_HIFB_FENCE_Wait(struct hi_sync_fence *fence, long timeout)
{
    HI_S32 Err = 1;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(fence, HI_FAILURE);

    Err = hi_sync_fence_wait(fence, timeout);
    if (Err == -ETIME)
    {/**10 * MSEC_PER_SEC  in time.h **/
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hi_sync_fence_wait, Err);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID DRV_HIFB_FENCE_GetFenceValue(HI_U32 *pFenceValue)
{
    if (NULL != pFenceValue)
    {
        *pFenceValue = gs_SyncInfo.FenceValue;
    }
}

HI_VOID DRV_HIFB_FENCE_GetTimeLineValue(HI_U32 *pTimeLineValue)
{
    if (NULL != pTimeLineValue)
    {
        *pTimeLineValue = gs_SyncInfo.TimeLine;
    }
}
#endif
