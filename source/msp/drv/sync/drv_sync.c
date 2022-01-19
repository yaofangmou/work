/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_sync.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2009/12/21
  Description   :
*******************************************************************************/
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <linux/string.h>
#include <linux/sched.h>
#include <linux/list.h>
#include <linux/slab.h>
#include "hi_drv_stat.h"
#include "hi_kernel_adapt.h"

#include "hi_drv_ao.h"
#include "drv_sync.h"
#include "drv_sync_stc.h"


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

typedef enum
{
    SYNC_PROC_TYPE_SMOOTH,
    SYNC_PROC_TYPE_QUICK,

    SYNC_PROC_TYPE_BUTT
} SYNC_PROC_TYPE_E;

#define SYNC_GET_ID(sync)   ((sync) & 0xff)

#define SYNC_CHECK_ID_NOT_RET(id)   \
    do { \
        if ((id) >= SYNC_MAX_NUM) { \
            HI_ERR_SYNC("invalid id\n"); \
            return; \
        } \
        if (HI_NULL == g_SyncGlobalState.SyncInfo[id].pSync) { \
            HI_ERR_SYNC("invalid sync\n"); \
            return; \
        } \
    } while (0)

#define SYNC_CHECK_ID(id)   \
    do { \
        if ((id) >= SYNC_MAX_NUM) { \
            HI_ERR_SYNC("invalid id\n"); \
            return HI_ERR_SYNC_INVALID_PARA; \
        } \
        if (HI_NULL == g_SyncGlobalState.SyncInfo[id].pSync) { \
            HI_ERR_SYNC("invalid sync\n"); \
            return HI_ERR_SYNC_INVALID_PARA; \
        } \
    } while (0)

#define DRV_SYNC_LOCK(pMutex)    \
    do{ \
        if(down_interruptible(pMutex)) \
        {       \
            HI_FATAL_SYNC("ERR: Sync lock error!\n");    \
            return; \
        }   \
    }while(0)

#define DRV_SYNC_UNLOCK(pMutex)    \
    do{ \
        up(pMutex); \
    }while(0)

HI_DECLARE_MUTEX(g_SyncDebugInfoMutex);

extern SYNC_GLOBAL_STATE_S  g_SyncGlobalState;

#ifdef SYNC_DEBUG_DETAIL
HI_VOID SYNC_AddVidDebugInfo(SYNC_S *pSync)
{
    SYNC_DBGINFO_S   *pSyncDbgInfo = HI_NULL;
    struct list_head *pos = HI_NULL;
    struct list_head *n = HI_NULL;

    if (0 == pSync->SyncDbgListMaxLen)
    {
        return;
    }

    if (pSync->SyncDbgListNodeCnt >= pSync->SyncDbgListMaxLen)
    {
        list_for_each_safe(pos, n, &pSync->SyncDbgInfoListHead)
        {
            /*get this node info, fill in new parameter*/
            pSyncDbgInfo = list_entry(pos, SYNC_DBGINFO_S, List);

            /*list is full, delete first node*/
            list_del(pos);
            pSync->SyncDbgListNodeCnt--;
            break;
        }
    }

    /* there is not available kmalloc mem, need to malloc*/
    if (HI_NULL == pSyncDbgInfo)
    {
        pSyncDbgInfo = (SYNC_DBGINFO_S *)kmalloc(sizeof(SYNC_DBGINFO_S), GFP_KERNEL);
        if (HI_NULL == pSyncDbgInfo)
        {
            return;
        }
    }

    pSyncDbgInfo->AudSrcPts    = pSync->AudInfo.SrcPts;
    pSyncDbgInfo->AudPts       = pSync->AudInfo.Pts;
    pSyncDbgInfo->AudLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_AUD);
    pSyncDbgInfo->AudBufTime   = pSync->AudInfo.BufTime;
    pSyncDbgInfo->AudFrameTime = pSync->AudInfo.FrameTime;

    pSyncDbgInfo->VidSrcPts    = pSync->VidInfo.SrcPts;
    pSyncDbgInfo->VidPts       = pSync->VidInfo.Pts;
    pSyncDbgInfo->VidLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_VID);
    pSyncDbgInfo->VidDelayTime = pSync->VidInfo.DelayTime;
    pSyncDbgInfo->VidFrameTime = pSync->VidInfo.FrameTime;

    pSyncDbgInfo->PcrLast      = pSync->PcrSyncInfo.PcrLast;
    pSyncDbgInfo->PcrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);
    pSyncDbgInfo->PcrDeltaTime = pSync->PcrSyncInfo.PcrDelta;
    pSyncDbgInfo->VidPcrDiff   = pSync->PcrSyncInfo.VidPcrDiff;
    pSyncDbgInfo->AudPcrDiff   = pSync->PcrSyncInfo.AudPcrDiff;

    pSyncDbgInfo->VidAudDiff   = pSync->VidAudDiff;

    pSyncDbgInfo->DispTime     = pSync->VidInfo.DispTime;

    pSyncDbgInfo->SystemTime   = SYNC_GetSysTime();

    pSyncDbgInfo->SyncProc     = pSync->VidOpt.SyncProc;

    pSyncDbgInfo->Idx          = pSync->SyncDbgListNodeIdx;

    list_add_tail(&pSyncDbgInfo->List, &pSync->SyncDbgInfoListHead);

    pSync->SyncDbgListNodeIdx++;
    pSync->SyncDbgListNodeCnt++;

    return;
}

HI_VOID SYNC_RelsaseDebugList(SYNC_S *pSync)
{
    struct list_head *pos = HI_NULL;
    struct list_head *n = HI_NULL;
    SYNC_DBGINFO_S   *pSyncDbgInfo = HI_NULL;

    if (list_empty(&pSync->SyncDbgInfoListHead))
    {
        return;
    }

    list_for_each_safe(pos, n, &pSync->SyncDbgInfoListHead)
    {
        pSyncDbgInfo = list_entry(pos, SYNC_DBGINFO_S, List);

        list_del(pos);
        kfree(pSyncDbgInfo);
    }
    INIT_LIST_HEAD(&pSync->SyncDbgInfoListHead);
    pSync->SyncDbgListNodeIdx = 0;
    pSync->SyncDbgListNodeCnt = 0;

    return;
}

HI_VOID SYNC_ProcDebugInfo(SYNC_S *pSync, SYNC_DBGINFO_E SyncProcInfo, HI_VOID *pPara)
{
    DRV_SYNC_LOCK(&g_SyncDebugInfoMutex);

    switch (SyncProcInfo)
    {
        case SYNC_DBG_INFO_LIST_INITIAL:
        {
            pSync->SyncDbgListNodeIdx = 0;
            pSync->SyncDbgListNodeCnt = 0;

            INIT_LIST_HEAD(&pSync->SyncDbgInfoListHead);
            break;
        }

        case SYNC_DBG_INFO_LIST_SIZE:
        {
            if (*(HI_U32 *)pPara > SYNC_DBG_LIST_MAX_LEN)
            {
                HI_ERR_SYNC("para is invalid, SyncLogDepth need less than 600\n");
                break;
            }

            pSync->SyncDbgListMaxLen = *(HI_U32 *)pPara;
            SYNC_RelsaseDebugList(pSync);
            break;
        }

        case SYNC_DBG_INFO_LIST_RELEASE:
        {
            SYNC_RelsaseDebugList(pSync);
            break;
        }

        case SYNC_DBG_INFO_LIST_VIDADD:
        {
            SYNC_AddVidDebugInfo(pSync);
            break;
        }

        default :
            break;
    }

    DRV_SYNC_UNLOCK(&g_SyncDebugInfoMutex);
    return;
}
#endif

HI_U32 SYNC_GetSysTime(HI_VOID)
{
    HI_U64   SysTime;

    SysTime = sched_clock();

    do_div(SysTime, 1000000);

    return (HI_U32)SysTime;
}

HI_U32 SYNC_GetSysTimeCost(HI_U32 LastSysTime)
{
    HI_U32   CrtSysTime;
    HI_U32   Delta;

    CrtSysTime = SYNC_GetSysTime();

    if (CrtSysTime > LastSysTime)
    {
        Delta = CrtSysTime - LastSysTime;
    }
    else
    {
        Delta = (SYS_TIME_MAX - LastSysTime) + 1 + CrtSysTime;
    }

    return Delta;
}

HI_U32 SYNC_GetLocalTime(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_U32        CrtLocaltime = -1;
    HI_U32        CostSysTime;

    /*In TPLAY Mode, we need video channel localtime, ignore others channel*/
    if ((SYNC_STATUS_TPLAY == pSync->CrtStatus) && (SYNC_CHAN_VID != enChn))
    {
        return -1;
    }

    if (SYNC_CHAN_AUD == enChn)
    {
        if (!pSync->AudLocalTimeFlag)
        {
            return -1;
        }

        CostSysTime = SYNC_GetSysTimeCost(pSync->AudLastSysTime);

        CrtLocaltime = pSync->AudLastLocalTime + CostSysTime;
    }
    else if (SYNC_CHAN_VID == enChn)
    {
        if (!pSync->VidLocalTimeFlag)
        {
            return -1;
        }

        CostSysTime = SYNC_GetSysTimeCost(pSync->VidLastSysTime);

        CrtLocaltime = pSync->VidLastLocalTime + CostSysTime;

    }
    else if (SYNC_CHAN_PCR == enChn)
    {
        if(((!pSync->PcrSyncInfo.PcrFirstCome)
            && (SYNC_SCR_ADJUST_BUTT == pSync->PcrSyncInfo.enPcrAdjust)))
        {
            return -1;
        }

        if (!pSync->PcrSyncInfo.PcrLocalTimeFlag)
        {
            return -1;
        }

        CostSysTime = SYNC_GetSysTimeCost(pSync->PcrSyncInfo.PcrLastSysTime);

        /*adjust the diff between pcr and sys time*//*CNCommont: 校正PCR与本地时钟不匹配引起的误差*/
        if (pSync->PcrSyncInfo.PcrGradient <= 101 && pSync->PcrSyncInfo.PcrGradient >= 99)
        {
            CostSysTime = CostSysTime * 100 / pSync->PcrSyncInfo.PcrGradient;
        }

        CrtLocaltime = pSync->PcrSyncInfo.PcrLastLocalTime + CostSysTime;
    }

#ifdef HI_AVPLAY_SCR_SUPPORT
    else if (SYNC_CHAN_SCR == enChn)
    {
        if( !pSync->ScrInitFlag)
        {
            return -1;
        }

        CostSysTime = SYNC_GetSysTimeCost(pSync->ScrLastSysTime);

        CrtLocaltime = pSync->ScrLastLocalTime + CostSysTime;
    }
#endif

    if (CrtLocaltime > PCR_TIME_MAX)
    {
        CrtLocaltime -= PCR_TIME_MAX;
    }

    return CrtLocaltime;
}

HI_VOID SYNC_SetLocalTime(SYNC_S *pSync, SYNC_CHAN_E enChn, HI_U32 LocalTime)
{
    if (SYNC_CHAN_AUD == enChn)
    {
        pSync->AudLastSysTime = SYNC_GetSysTime();

        pSync->AudLastLocalTime = LocalTime;

        pSync->AudLocalTimeFlag = HI_TRUE;
    }
    else if (SYNC_CHAN_VID == enChn)
    {
        pSync->VidLastSysTime = SYNC_GetSysTime();

        pSync->VidLastLocalTime = LocalTime;

        pSync->VidLocalTimeFlag = HI_TRUE;
    }
    else if (SYNC_CHAN_PCR == enChn)
    {
        pSync->PcrSyncInfo.PcrLastSysTime = SYNC_GetSysTime();

        pSync->PcrSyncInfo.PcrLastLocalTime = LocalTime;

        pSync->PcrSyncInfo.PcrLocalTimeFlag = HI_TRUE;
    }
#ifdef HI_AVPLAY_SCR_SUPPORT
    else if (SYNC_CHAN_SCR == enChn)
    {
        pSync->ScrLastSysTime = SYNC_GetSysTime();

        pSync->ScrLastLocalTime = LocalTime;
    }
#endif

    return;
}

HI_S32 SYNC_StartSync(HI_U32 SyncId)
{
    SYNC_S  *pSync;

    SYNC_CHECK_ID(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    pSync->PreSyncStartSysTime = SYNC_GetSysTime();

    /* if timeout of presync is zero or sync adjust is disabled, disable presync*/
    if (   (!pSync->SyncAttr.u32PreSyncTimeoutMs)
        || (HI_UNF_SYNC_REF_NONE == pSync->SyncAttr.enSyncRef)
       )
    {
        pSync->PreSyncEndSysTime = pSync->PreSyncStartSysTime;
        pSync->PreSyncFinish = HI_TRUE;
        pSync->BufFundFinish = HI_TRUE;
    }

    /* no sync,then no buffund and audio resync*/
    if (HI_UNF_SYNC_REF_NONE == pSync->SyncAttr.enSyncRef)
    {
        //pSync->BufFundFinish = HI_TRUE;
        pSync->AudReSync = HI_FALSE;
        pSync->AudReBufFund = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_S32 SYNC_PauseSync(HI_U32 SyncId)
{
    SYNC_S  *pSync;

    SYNC_CHECK_ID(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    pSync->PcrSyncInfo.PcrPauseLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);
    pSync->AudPauseLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_AUD);
    pSync->VidPauseLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_VID);
#ifdef HI_AVPLAY_SCR_SUPPORT
    pSync->ScrPauseLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_SCR);
#endif
    return HI_SUCCESS;
}

HI_S32 SYNC_ResumeSync(HI_U32 SyncId)
{
    SYNC_S  *pSync;

    SYNC_CHECK_ID(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    /* if resume after reset, the local time won't be reset */
    if (pSync->PcrSyncInfo.PcrPauseLocalTime != -1)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, pSync->PcrSyncInfo.PcrPauseLocalTime);
    }

    if (pSync->AudPauseLocalTime != -1)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, pSync->AudPauseLocalTime);
    }

    if (pSync->VidPauseLocalTime != -1)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, pSync->VidPauseLocalTime);
    }
#ifdef HI_AVPLAY_SCR_SUPPORT
    if (pSync->ScrPauseLocalTime != -1)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_SCR, pSync->ScrPauseLocalTime);
    }
#endif
    return HI_SUCCESS;
}


HI_S32 SYNC_GetTime(HI_U32 SyncId, HI_U32 *pLocalTime, HI_U32 *pPlayTime)
{
    SYNC_S      *pSync;
    HI_U32      AudLocalTime;
    HI_U32      VidLocalTime;
    HI_U32      PcrLocalTime;

    SYNC_CHECK_ID(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    if (SYNC_STATUS_PAUSE == pSync->CrtStatus)
    {
        AudLocalTime = pSync->AudPauseLocalTime;
        VidLocalTime = pSync->VidPauseLocalTime;
        PcrLocalTime = pSync->PcrSyncInfo.PcrPauseLocalTime;
    }
    else
    {
        AudLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_AUD);
        VidLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_VID);
        PcrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);
    }

    if (AudLocalTime <= PCR_TIME_MAX)
    {
        *pLocalTime = AudLocalTime;
        *pPlayTime = abs((HI_S32)(AudLocalTime - pSync->AudFirstValidPts));
    }
    else if (VidLocalTime <= PCR_TIME_MAX)
    {
        *pLocalTime = VidLocalTime;
        *pPlayTime = abs((HI_S32)(VidLocalTime - pSync->VidFirstValidPts));
    }
    else if(PcrLocalTime <= PCR_TIME_MAX)
    {
        *pLocalTime = PcrLocalTime;
        *pPlayTime = abs((HI_S32)(PcrLocalTime - pSync->PcrSyncInfo.PcrFirst));
    }
    else
    {
        *pLocalTime = -1;
        *pPlayTime = 0;
    }

    return HI_SUCCESS;
}

HI_VOID Sync_ReprocessDiffTime(SYNC_S *pSync,HI_U32 PcrLocalTime,HI_U32 AudLocalTime,HI_U32 VidLocalTime,HI_S32 *AudPcrDiff,HI_S32 *VidPcrDiff,HI_S32 *VidAudDiff)
{
    if (-1 == PcrLocalTime)
    {
        *AudPcrDiff = 0;
        *VidPcrDiff = 0;
        if((-1 == AudLocalTime) ||  (-1 == VidLocalTime))
        {
            *VidAudDiff = 0;
        }
        else
        {
            *VidAudDiff = VidLocalTime - AudLocalTime + pSync->SyncAttr.s32VidPtsAdjust - pSync->SyncAttr.s32AudPtsAdjust;
        }
    }
    else
    {
        if ((-1 == AudLocalTime) && (-1 == VidLocalTime))
        {
            *VidAudDiff = 0;
            *AudPcrDiff = 0;
            *VidPcrDiff = 0;
        }
        else if (-1 == AudLocalTime)
        {
            *VidAudDiff = 0;
            *AudPcrDiff = 0;
            *VidPcrDiff = VidLocalTime - PcrLocalTime + pSync->SyncAttr.s32VidPtsAdjust;
        }
        else if (-1 == VidLocalTime)
        {
            *VidAudDiff = 0;
            *VidPcrDiff = 0;
            *AudPcrDiff = AudLocalTime - PcrLocalTime + pSync->SyncAttr.s32AudPtsAdjust;
        }
        else
        {
            *VidAudDiff = VidLocalTime - AudLocalTime + pSync->SyncAttr.s32VidPtsAdjust - pSync->SyncAttr.s32AudPtsAdjust;
            *VidPcrDiff = VidLocalTime - PcrLocalTime + pSync->SyncAttr.s32VidPtsAdjust;
            *AudPcrDiff = AudLocalTime - PcrLocalTime + pSync->SyncAttr.s32AudPtsAdjust;
        }
    }
    return;
}

HI_VOID SYNC_CalcDiffTime(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_U32             CurSysTime;
    HI_U32             PcrLocalTime;
    HI_U32             AudLocalTime;
    HI_U32             VidLocalTime;
    HI_S32             AudPcrDiff;
    HI_S32             VidPcrDiff;
    HI_S32             VidAudDiff;
    HI_S32             DefaultDiff;

    HI_U32             ScrLocalTime;
    HI_S32             AudScrDiff;
    HI_S32             VidScrDiff;

    CurSysTime = SYNC_GetSysTime();

    PcrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);
    AudLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_AUD);
    VidLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_VID);
    ScrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_SCR);

    DefaultDiff = (pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime + pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime) / 2;

    AudPcrDiff = AudLocalTime - PcrLocalTime + pSync->SyncAttr.s32AudPtsAdjust;
    VidPcrDiff = VidLocalTime - PcrLocalTime + pSync->SyncAttr.s32VidPtsAdjust;
    VidAudDiff = VidLocalTime - AudLocalTime + pSync->SyncAttr.s32VidPtsAdjust - pSync->SyncAttr.s32AudPtsAdjust;

    AudScrDiff = AudLocalTime - ScrLocalTime + pSync->SyncAttr.s32AudPtsAdjust;
    VidScrDiff = VidLocalTime - ScrLocalTime + pSync->SyncAttr.s32VidPtsAdjust;

    if(HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
    {
        if (SYNC_AUD_ADJUST_SCR != pSync->PcrSyncInfo.enPcrAdjust)
        {
            Sync_ReprocessDiffTime(pSync, PcrLocalTime, AudLocalTime, VidLocalTime, &AudPcrDiff, &VidPcrDiff, &VidAudDiff);
        }
        else
        {
            if ((-1 == AudLocalTime) || (-1 == VidLocalTime))
            {
                VidAudDiff = DefaultDiff;
            }
        }
    }
    else if(HI_UNF_SYNC_REF_AUDIO== pSync->SyncAttr.enSyncRef)
    {
        if ((-1 == AudLocalTime) || (-1 == VidLocalTime))
        {
            VidAudDiff = DefaultDiff;
        }
    }
    else if(HI_UNF_SYNC_REF_SCR== pSync->SyncAttr.enSyncRef)
    {
        if (-1 == ScrLocalTime)
        {
            VidScrDiff = DefaultDiff;
            AudScrDiff = DefaultDiff;
        }
    }

    if(-1 != ScrLocalTime)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_SCR, ScrLocalTime);
    }

    /* if AudScrDiff and VidScrDiff are both too large, we reinit scr */
    if ((abs(AudScrDiff) > SCR_DISCARD_THRESHOLD) && (abs(VidScrDiff) > SCR_DISCARD_THRESHOLD)
       )
    {
        pSync->ScrInitFlag = HI_FALSE;
    }

    HI_INFO_VSYNC(enChn, "SysTime %d Aud LastSysTime %d Aud LocatTime %d Aud LstPts %d, Aud LstBufTime %3d Vid LocatTime %d Vid LstPts %d VidAudDiff %d\n",
                      CurSysTime,pSync->AudLastSysTime,AudLocalTime, pSync->AudLastPts, pSync->AudLastBufTime,VidLocalTime, pSync->VidLastPts, VidAudDiff);

    HI_INFO_ASYNC(enChn, "SysTime %d Aud LastSysTime %d Aud LocatTime %d Aud LstPts %d, Aud LstBufTime %3d Vid LocatTime %d Vid LstPts %d VidAudDiff %d\n",
    CurSysTime,pSync->AudLastSysTime,AudLocalTime, pSync->AudLastPts, pSync->AudLastBufTime,VidLocalTime, pSync->VidLastPts, VidAudDiff);

    if(HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
    {
        HI_INFO_VSYNC(enChn, ">>>>PcrLocalTime %d  AudPcrDiff %d VidPcrDiff %d VidAudDiff %d\n",
                          PcrLocalTime, AudPcrDiff, VidPcrDiff, VidAudDiff);
    }

#ifdef HI_AVPLAY_SCR_SUPPORT
    if(HI_UNF_SYNC_REF_SCR == pSync->SyncAttr.enSyncRef)
    {
        HI_INFO_VSYNC(enChn, "ScrLocalTime %d  AudScrDiff %d VidScrDiff %d VidAudDiff %d\n",
                          ScrLocalTime, AudScrDiff, VidScrDiff, VidAudDiff);
    }
#endif

    pSync->PcrSyncInfo.LastAudPcrDiff = pSync->PcrSyncInfo.AudPcrDiff;
    pSync->PcrSyncInfo.LastVidPcrDiff = pSync->PcrSyncInfo.VidPcrDiff;
    pSync->PcrSyncInfo.AudPcrDiff = AudPcrDiff;
    pSync->PcrSyncInfo.VidPcrDiff = VidPcrDiff;

    pSync->LastVidAudDiff = pSync->VidAudDiff;
    pSync->VidAudDiff = VidAudDiff;

    pSync->AudScrDiff = AudScrDiff;
    pSync->VidScrDiff = VidScrDiff;

    return;
}

HI_VOID SYNC_PreSyncTargetInit(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    if ((SYNC_CHAN_VID == enChn) && (!pSync->VidPreSyncTargetInit))
    {
        if (!pSync->VidInfo.IsPtsValid)
        {
            HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync VidFrame SrcPts = -1\n");
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            return;
        }
        else
        {
            pSync->VidPreSyncTargetTime = pSync->VidInfo.Pts;
            pSync->VidPreSyncTargetInit = HI_TRUE;
        }
    }

    if ((SYNC_CHAN_AUD == enChn) && (!pSync->AudPreSyncTargetInit))
    {
        if (!pSync->AudInfo.IsPtsValid)
        {
            HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync AudFrame SrcPts = -1\n");
            pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

            return;
        }
        else
        {
            pSync->AudPreSyncTargetTime = pSync->AudInfo.Pts;
            pSync->AudPreSyncTargetInit = HI_TRUE;
        }
    }

    if (pSync->VidPreSyncTargetInit && pSync->AudPreSyncTargetInit)
    {
        if (pSync->VidPreSyncTargetTime > pSync->AudPreSyncTargetTime)
        {
            if (pSync->UseExtPreSyncTaget
            && pSync->ExtPreSyncTagetTime > pSync->VidPreSyncTargetTime)
            {
                pSync->PreSyncTarget = SYNC_CHAN_EXT;
                pSync->PreSyncTargetTime = pSync->ExtPreSyncTagetTime;
            }
            else
            {
                pSync->PreSyncTarget = SYNC_CHAN_VID;
                pSync->PreSyncTargetTime = pSync->VidPreSyncTargetTime;
            }
        }
        else
        {
            if (pSync->UseExtPreSyncTaget
              &&(pSync->ExtPreSyncTagetTime > pSync->AudPreSyncTargetTime)
               )
            {
                pSync->PreSyncTarget = SYNC_CHAN_EXT;
                pSync->PreSyncTargetTime = pSync->ExtPreSyncTagetTime;
            }
            else
            {
                pSync->PreSyncTarget = SYNC_CHAN_AUD;
                pSync->PreSyncTargetTime = pSync->AudPreSyncTargetTime;
            }
        }

        pSync->UseExtPreSyncTaget = HI_FALSE;

        pSync->PreSyncTargetInit = HI_TRUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync Target Init %d Vid pts %d Aud pts %d\n", pSync->PreSyncTarget, pSync->VidPreSyncTargetTime, pSync->AudPreSyncTargetTime);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync Target Init %d Vid pts %d Aud pts %d\n", pSync->PreSyncTarget, pSync->VidPreSyncTargetTime, pSync->AudPreSyncTargetTime);
    }
    else
    {
        if (SYNC_CHAN_VID == enChn)
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_BLOCK;
            //HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync Target UnInit AudPreSyncTargetInit %d VidPreSyncTargetInit %d\n", pSync->AudPreSyncTargetInit, pSync->VidPreSyncTargetInit);
        }
        else if(SYNC_CHAN_AUD == enChn)
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_BLOCK;
            //HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync Target UnInit AudPreSyncTargetInit %d VidPreSyncTargetInit %d\n", pSync->AudPreSyncTargetInit, pSync->VidPreSyncTargetInit);
        }

        return;
    }

    return;
}

HI_BOOL SYNC_CheckPcrTimeout(SYNC_S *pSync)
{
    HI_U32      PcrCostSysTime;

    PcrCostSysTime = SYNC_GetSysTimeCost(pSync->PcrSyncInfo.PcrSyncStartSysTime);
    return (PcrCostSysTime >= PCR_TIMEOUTMS) ? HI_TRUE : HI_FALSE;
}


HI_BOOL SYNC_CheckAudTimeout(SYNC_S *pSync)
{
    HI_U32      AudCostSysTime;

    AudCostSysTime = SYNC_GetSysTimeCost(pSync->PreSyncStartSysTime);
    return (AudCostSysTime >= AUD_TIMEOUTMS) ? HI_TRUE : HI_FALSE;
}

HI_S32 SYNC_CheckVidPtsValid(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo)
{
    HI_S32 PtsDelta = 0;

    if (HI_INVALID_PTS == pVidInfo->Pts)
    {
        HI_WARN_SYNC("Vid Pts == -1 invalid\n");
        pSync->VidPtsSeriesCnt = 0;
    }
    else if (pVidInfo->Pts < pSync->VidLastPts)
    {
        HI_WARN_SYNC("Vid Pts <= Vid LstPts %d\n", pSync->VidLastPts);
        pSync->VidPtsSeriesCnt = 0;
    }
    /* Pts jump too much */
    else
    {
        PtsDelta = pVidInfo->Pts - pSync->VidLastPts;

        if (PtsDelta > VID_PTS_GAP)
        {
            HI_WARN_SYNC("Vid PtsDelta %d > VID_PTS_GAP %d\n", PtsDelta, VID_PTS_GAP);
            pSync->VidPtsSeriesCnt = 0;
        }
    }

    pVidInfo->IsPtsValid = HI_FALSE;
    pSync->VidPtsSeriesCnt++;

    if (pSync->VidPtsSeriesCnt >= PTS_SERIES_COUNT)
    {
        pVidInfo->IsPtsValid = HI_TRUE;
    }

    HI_INFO_SYNC("vid IsPtsValid:%d, pts:%d\n", pVidInfo->IsPtsValid, pVidInfo->Pts);
    return HI_SUCCESS;
}

HI_S32 SYNC_CheckAudPtsValid(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo)
{
    HI_S32 PtsDelta = 0;

    if (HI_INVALID_PTS == pAudInfo->Pts)
    {
        HI_WARN_SYNC("Aud Pts == -1 invalid\n");
        pSync->AudPtsSeriesCnt = 0;
    }
    /* The same audio frame may be sent to sync twice for repeating.So pAudInfo->Pts == pSync->AudLastPts maybe*/
    else if (pAudInfo->Pts < pSync->AudLastPts)
    {
        HI_WARN_SYNC("Aud Pts < Aud LstPts %d\n", pSync->AudLastPts);
        pSync->AudPtsSeriesCnt = 0;
    }
    else
    {
        PtsDelta = pAudInfo->Pts - pSync->AudLastPts;

        /* FrameTime is approximate value */
        if (PtsDelta > (pAudInfo->FrameTime + 1))
        {
            HI_WARN_SYNC("Aud PtsDelta %d > Aud FrameTime %d\n", PtsDelta, pAudInfo->FrameTime);
            pSync->AudPtsSeriesCnt = 0;
        }
    }

    pAudInfo->IsPtsValid = HI_FALSE;
    pSync->AudPtsSeriesCnt++;

    if (pSync->AudPtsSeriesCnt >= PTS_SERIES_COUNT)
    {
        pAudInfo->IsPtsValid = HI_TRUE;
    }

    HI_INFO_SYNC("aud IsPtsValid:%d, pts:%d\n", pAudInfo->IsPtsValid, pAudInfo->Pts);
    return HI_SUCCESS;
}

HI_VOID SYNC_PrePcrSync(SYNC_S *pSync, SYNC_CHAN_E Chn, HI_BOOL *pIsPcrPreSyncFinsh)
{
    HI_S32      AudPcrDiff = 0;
    HI_S32      VidPcrDiff = 0;
    HI_S32      VidAudDiff = 0;
    HI_U32      PcrLocalTime= 0;
    HI_U32      VidLocalTime = 0;
    HI_U32      AudLocalTime = 0;

    PcrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);

    VidLocalTime = pSync->VidInfo.Pts - pSync->VidInfo.DelayTime;
    AudLocalTime = pSync->AudInfo.Pts - pSync->AudInfo.BufTime;

    AudPcrDiff = AudLocalTime + pSync->SyncAttr.s32AudPtsAdjust - PcrLocalTime;
    VidPcrDiff = VidLocalTime + pSync->SyncAttr.s32VidPtsAdjust - PcrLocalTime;
    VidAudDiff = (VidLocalTime + pSync->SyncAttr.s32VidPtsAdjust) - (AudLocalTime + pSync->SyncAttr.s32AudPtsAdjust);

    pSync->PcrSyncInfo.VidPcrDiff = VidPcrDiff;
    pSync->PcrSyncInfo.AudPcrDiff = AudPcrDiff;
    pSync->VidAudDiff = VidAudDiff;

    if ((HI_INVALID_PTS == PcrLocalTime) || ((AudPcrDiff > 0) && (VidPcrDiff > 0)))
    {
        if (SYNC_CHAN_VID == Chn)
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_BLOCK;
        }
        else if (SYNC_CHAN_AUD == Chn)
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_BLOCK;
        }

        *pIsPcrPreSyncFinsh = HI_FALSE;

        HI_WARN_SYNC("pcr pre sync, AudPcr %d, VidPcr %d, VidAud:%d,\n", AudPcrDiff, VidPcrDiff, VidAudDiff);
        return;
    }

    if (   ((AudPcrDiff < 0) || (VidPcrDiff < 0))
        && ((AudPcrDiff + PCR_SYNC_MAX_DELTA > 0) && (VidPcrDiff + PCR_SYNC_MAX_DELTA > 0))
        && (pSync->PcrSyncInfo.PcrDelta + AudPcrDiff + PCR_SYNC_MAX_DELTA > 0)
        && (pSync->PcrSyncInfo.PcrDelta + VidPcrDiff + PCR_SYNC_MAX_DELTA > 0))
    {
        /* adjust pcr to this one which is more behind */
        pSync->PcrSyncInfo.PcrDelta += (VidAudDiff > 0) ? AudPcrDiff : VidPcrDiff;

        *pIsPcrPreSyncFinsh = HI_TRUE;

        HI_WARN_SYNC("pcr pre sync, PcrDelta %d\n", pSync->PcrSyncInfo.PcrDelta);
        return;
    }

    return;
}

HI_VOID SYNC_PreSyncAudLeadAdjust(SYNC_S *pSync)
{
    HI_S32      VidAudDiff = 0;
    HI_S32      VidLocalTime = 0;
    HI_S32      AudLocalTime = 0;
    HI_BOOL     IsPcrPreSyncFinsh = HI_FALSE;

    if (!pSync->VidInfo.IsPtsValid)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
        return;
    }

    VidLocalTime = pSync->VidInfo.Pts - pSync->VidInfo.DelayTime;
    AudLocalTime = pSync->AudPreSyncTargetTime - pSync->AudInfo.BufTime;

    VidAudDiff = (VidLocalTime + pSync->SyncAttr.s32VidPtsAdjust) - (AudLocalTime + pSync->SyncAttr.s32AudPtsAdjust);
    pSync->VidAudDiff = VidAudDiff;

    /* the difference between video and audio is too large */
    if (VidAudDiff < (-VID_LAG_DISCARD_THRESHOLD))
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync Giveup VidAudDiff %d > VID_LAG_DISCARD_THRESHOLD %d\n",
            VidAudDiff, VID_LAG_DISCARD_THRESHOLD);

        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC,0);
        return;
    }

    if (VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime / 2)
    {
        if (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
        {
            if (SYNC_PCR_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
            {
                SYNC_PrePcrSync(pSync, SYNC_CHAN_VID, &IsPcrPreSyncFinsh);

                if (!IsPcrPreSyncFinsh)
                {
                    return;
                }
            }
            else
            {
                pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;    //pcr timeout or pcr doesn't come
            }
        }

        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync Ok VidAudDiff %d\n", VidAudDiff);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync Ok VidAudDiff %d\n", VidAudDiff);
        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC,0);
    }
    else
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
    }

    return;
}

HI_VOID SYNC_PreSyncExtModeAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_S32      VidTargetDiff;
    HI_S32      AudTargetDiff;

    if ((SYNC_CHAN_VID == enChn) || (SYNC_CHAN_AUD == enChn))
    {
        VidTargetDiff = pSync->VidInfo.Pts - pSync->VidInfo.DelayTime - pSync->PreSyncTargetTime;
        AudTargetDiff = pSync->AudInfo.Pts - pSync->PreSyncTargetTime;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "VidTargetDiff %d, AudTargetDiff %d\n", VidTargetDiff, AudTargetDiff);
        HI_INFO_VSYNC(SYNC_CHAN_AUD, "VidTargetDiff %d, AudTargetDiff %d\n", VidTargetDiff, AudTargetDiff);

        if (   (VidTargetDiff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
            && (AudTargetDiff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime) )
        {
            pSync->PreSyncEndSysTime = SYNC_GetSysTime();
            pSync->PreSyncFinish = HI_TRUE;
            pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
            pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

            HI_DRV_STAT_Event(STAT_EVENT_PRESYNC, 0);
            return;
        }
        else
        {
            if(VidTargetDiff < pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;
            }

            if(AudTargetDiff < pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
            {
                pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;
            }
            else
            {
                pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;
            }
        }
    }

    return;
}

HI_VOID SYNC_PreSyncVidLeadAdjust(SYNC_S *pSync)
{
    HI_S32      VidAudDiff = 0;
    HI_S32      VidLocalTime = 0;
    HI_S32      AudLocalTime = 0;
    HI_BOOL     IsPcrPreSyncFinsh = HI_FALSE;

    if (!pSync->AudInfo.IsPtsValid)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;
        return;
    }

    VidLocalTime = pSync->VidPreSyncTargetTime - pSync->VidInfo.DelayTime;
    AudLocalTime = pSync->AudInfo.Pts - pSync->AudInfo.BufTime;

    VidAudDiff = (VidLocalTime + pSync->SyncAttr.s32VidPtsAdjust) - (AudLocalTime + pSync->SyncAttr.s32AudPtsAdjust);
    pSync->VidAudDiff = VidAudDiff;

    /* the difference between video and audio is too large*/
    if (VidAudDiff > VID_LEAD_DISCARD_THRESHOLD)
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync VidAudDiff %d > u32PreSyncTimeoutMs %d\n", VidAudDiff, pSync->SyncAttr.u32PreSyncTimeoutMs);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync VidAudDiff %d > u32PreSyncTimeoutMs %d\n", VidAudDiff, pSync->SyncAttr.u32PreSyncTimeoutMs);

        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC, 0);
        return;
    }

    if (VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime / 2)
    {
        if (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
        {
            if (SYNC_PCR_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
            {
                SYNC_PrePcrSync(pSync, SYNC_CHAN_AUD, &IsPcrPreSyncFinsh);

                if (!IsPcrPreSyncFinsh)
                {
                    return;
                }
            }
            else
            {
                pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;    //pcr timeout or pcr doesn't come
            }
        }

        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;
        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC, 0);

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync Ok VidAudDiff %d\n", VidAudDiff);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync Ok VidAudDiff %d\n", VidAudDiff);
    }
    else
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;
    }

    return;
}

HI_VOID SYNC_PreSync(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_U32      CostSysTime;

    CostSysTime = SYNC_GetSysTimeCost(pSync->PreSyncStartSysTime);

    /* do not do presync if video or audio is disable */
    if ( (!pSync->AudEnable) || (!pSync->VidEnable) )
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC,0);
        return;
    }

    /* presync timeout*/
    if (CostSysTime >= pSync->SyncAttr.u32PreSyncTimeoutMs)
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC, 0);

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync TimeOut %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync TimeOut %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
        return;
    }

    /* video buffer or audio buffer will be blocked*/
    if ((SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.VidBufState)
        || (SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.AudBufState)
        )
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->PreSyncFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_DRV_STAT_Event(STAT_EVENT_PRESYNC, 1);

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "PreSync BufBlock Aud %d Vid %d\n", pSync->CrtBufStatus.AudBufState, pSync->CrtBufStatus.VidBufState);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "PreSync BufBlock Aud %d Vid %d\n", pSync->CrtBufStatus.AudBufState, pSync->CrtBufStatus.VidBufState);
        return;
    }

    /* prepare presync target*/
    if (!pSync->PreSyncTargetInit)
    {
        SYNC_PreSyncTargetInit(pSync, enChn);

        /* presync target is not ready*/
        if (!pSync->PreSyncTargetInit)
        {
            return;
        }
    }

    if(SYNC_CHAN_EXT == pSync->PreSyncTarget)
    {
        SYNC_PreSyncExtModeAdjust(pSync, enChn);
    }
    else if (enChn == pSync->PreSyncTarget)
    {
        if (SYNC_CHAN_VID == enChn)
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_BLOCK;
            pSync->VidAudDiff = pSync->VidPreSyncTargetTime - pSync->AudInfo.Pts;
        }
        else
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_BLOCK;
            pSync->VidAudDiff = pSync->VidInfo.Pts - pSync->AudPreSyncTargetTime;
        }
    }
    else
    {
        /* audio wait for video*/
        if (SYNC_CHAN_VID == enChn)
        {
            SYNC_PreSyncAudLeadAdjust(pSync);
        }
        /* video wait for audio*/
        else if (SYNC_CHAN_AUD == enChn)
        {
            SYNC_PreSyncVidLeadAdjust(pSync);
        }
    }

    return;
}

HI_VOID SYNC_BufFund(SYNC_S *pSync)
{
    HI_U32        CostSysTime;

    CostSysTime = SYNC_GetSysTimeCost(pSync->PreSyncEndSysTime);

    /* cumulation timeout */
    if (CostSysTime > BUF_FUND_TIMEOUT)
    {
        pSync->BufFundEndSysTime = SYNC_GetSysTime();
        pSync->BufFundFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_DRV_STAT_Event(STAT_EVENT_BUFREADY,2);
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "BufFund TimeOut %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "BufFund TimeOut %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);

        return;
    }

    /* video or audio buffer will be blocked */
    if ((SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.VidBufState)
        || (SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.AudBufState)
        )
    {
        pSync->BufFundEndSysTime = SYNC_GetSysTime();
        pSync->BufFundFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_DRV_STAT_Event(STAT_EVENT_BUFREADY,3);

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "BufFund BufBlock Aud %d Vid %d\n", pSync->CrtBufStatus.AudBufState, pSync->CrtBufStatus.VidBufState);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "BufFund BufBlock Aud %d Vid %d\n", pSync->CrtBufStatus.AudBufState, pSync->CrtBufStatus.VidBufState);

        return;
    }

    if (pSync->VidEnable && pSync->AudEnable)
    {
        if (   (pSync->AudInfo.BufTime + pSync->AudInfo.FrameTime >= AO_TRACK_AIP_START_LATENCYMS)
            || (pSync->AudInfo.FrameNum >= SYNC_AUD_BUF_NORMAL_FRMNUM) )
        {
            pSync->BufFundEndSysTime = SYNC_GetSysTime();
            pSync->BufFundFinish = HI_TRUE;
            pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
            pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

            HI_DRV_STAT_Event(STAT_EVENT_BUFREADY,1);
            HI_INFO_ASYNC(SYNC_CHAN_AUD, "BufFund Ok %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
            HI_INFO_VSYNC(SYNC_CHAN_VID, "BufFund Ok %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
        }
        else
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            if (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
            {
                 if ((HI_FALSE == pSync->VidFirstCome) && (HI_FALSE== SYNC_CheckAudTimeout(pSync)))
                 {
                     pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;
                 }
            }

            HI_INFO_ASYNC(SYNC_CHAN_AUD, "BufFund %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
            HI_INFO_VSYNC(SYNC_CHAN_VID, "BufFund %d AudBufTime %d AudFrameNum %d VidDelayTime %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum, pSync->VidInfo.DelayTime);
        }
    }
    else if (pSync->VidEnable && (!pSync->AudEnable))
    {

        pSync->BufFundEndSysTime = SYNC_GetSysTime();
        pSync->BufFundFinish = HI_TRUE;
        pSync->VidOpt.SyncProc = SYNC_PROC_CONTINUE;
        HI_DRV_STAT_Event(STAT_EVENT_BUFREADY,1);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "BufFund Ok\n");
    }
    else if ((!pSync->VidEnable) && pSync->AudEnable)
    {
        if (   (pSync->AudInfo.BufTime + pSync->AudInfo.FrameTime >= AO_TRACK_AIP_START_LATENCYMS)
            || (pSync->AudInfo.FrameNum >= SYNC_AUD_BUF_NORMAL_FRMNUM) )
        {
            pSync->BufFundEndSysTime = SYNC_GetSysTime();
            pSync->BufFundFinish = HI_TRUE;
            pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;
            HI_DRV_STAT_Event(STAT_EVENT_BUFREADY,1);
            HI_INFO_ASYNC(SYNC_CHAN_AUD, "BufFund Ok\n");
        }
        else
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        }
    }

    return;
}

HI_VOID SYNC_AudReSync(SYNC_S *pSync)
{
    HI_U32             VidLocalTime;
    HI_S32             VidAudDiff;
    HI_U32             CostSysTime;

    CostSysTime = SYNC_GetSysTimeCost(pSync->PreSyncStartSysTime);

    /* resync timeout */
    if (CostSysTime >= AUD_RESYNC_TIMEOUT)
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->AudReSync = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync TimeOut %d BufTime %d FrameNum %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum);
        return;
    }

    /* buffer blocked */
    if (SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.AudBufState)
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->AudReSync = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync BufBlock\n");
        return;
    }

    /* discard the frame if pts is -1 */
    if (-1 == pSync->AudInfo.Pts)
    {
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync AudFrame Pts = -1\n");
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

        return;
    }

    VidLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_VID);

    VidAudDiff = VidLocalTime - pSync->AudInfo.Pts + AO_TRACK_AIP_START_LATENCYMS;

    /* The difference is too large */
    if (abs(VidAudDiff) > AUD_RESYNC_ADJUST_THRESHOLD)
    {
        pSync->AudReSync = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync VidAudDiff %d > AUD_RESYNC_ADJUST_THRESHOLD %d\n", VidAudDiff, AUD_RESYNC_ADJUST_THRESHOLD);
        return;
    }

    /* adjust into sync start range */
    if (   (VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
        && (VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
        && (abs(VidAudDiff) <= pSync->AudInfo.FrameTime)
       )
    {
        pSync->PreSyncEndSysTime = SYNC_GetSysTime();
        pSync->AudReSync = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync Ok VidAudDiff %d\n", VidAudDiff);

        return;
    }

    if (VidAudDiff > 0)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync DISCARD VidAudDiff %d\n", VidAudDiff);
    }
    else
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReSync REPEAT VidAudDiff %d\n", VidAudDiff);
    }

    return;
}

HI_VOID SYNC_AudReBufFund(SYNC_S *pSync)
{
    HI_U32        CostSysTime;

    CostSysTime = SYNC_GetSysTimeCost(pSync->PreSyncEndSysTime);

    /* timeout */
    if (CostSysTime > BUF_FUND_TIMEOUT)
    {
        pSync->AudReBufFund = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudReBufFund TimeOut %d BufTime %d FrameNum %d\n", CostSysTime, pSync->AudInfo.BufTime, pSync->AudInfo.FrameNum);

        return;
    }

    /* buffer blocked */
    if (SYNC_BUF_STATE_HIGH == pSync->CrtBufStatus.AudBufState)
    {
        pSync->AudReBufFund = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, ("AudReBufFund BufBlock\n"));

        return;
    }

    if (pSync->AudInfo.BufTime + pSync->AudInfo.FrameTime >= AO_TRACK_AIP_START_LATENCYMS)
    {
        pSync->AudReBufFund = HI_FALSE;
        pSync->AudOpt.SyncProc = SYNC_PROC_CONTINUE;
        HI_INFO_VSYNC(SYNC_CHAN_AUD, "AudReBufFund Ok\n");
    }
    else
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
    }

    return;
}

HI_VOID SYNC_ProcVidRepeatCount(SYNC_S *pSync, SYNC_PROC_TYPE_E ProcType, HI_S32 VidTargetDiff)
{
#ifdef CHIP_TYPE_hi3716mv430
    HI_U32 RepeatCount = 0;

    if (SYNC_PROC_TYPE_SMOOTH == ProcType)
    {
        pSync->VidOpt.Repeat = 1;
        pSync->VidRepeatCnt++;

        return;
    }

    if ((VidTargetDiff >= pSync->VidInfo.FrameTime) && (0 != pSync->VidInfo.FrameTime))
    {
        RepeatCount = VidTargetDiff / pSync->VidInfo.FrameTime;

        RepeatCount = (RepeatCount > VID_REPEAT_MAX_COUNT) ? VID_REPEAT_MAX_COUNT : RepeatCount;

        pSync->VidRepeatCnt += RepeatCount;
        pSync->VidOpt.Repeat = RepeatCount;

        HI_INFO_SYNC("Calculate VidTargetDiff:%d, FrameTime:%d, RepeatCount :%d\n",
                    VidTargetDiff, pSync->VidInfo.FrameTime, RepeatCount);
    }

    return;
#else
    pSync->VidRepeatCnt++;
#endif
    return;
}

/* refer to audio and video is ahead of audio */
HI_VOID SYNC_AudSyncVidLeadAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn, HI_S32 VidAudDiff)
{
    if (VidAudDiff > pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
    {
        /* there is enough audio data in ao buffer */
        if ((pSync->AudInfo.BufTime >= (AO_PCM_DF_UNSTALL_THD_FRAMENUM * pSync->AudInfo.FrameTime))
          &&(pSync->AudInfo.FrameNum >= 10)
           )
        {
            // TODO: sdk  can we discard audio data when playing
            pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

            HI_INFO_ASYNC(enChn, "Vid Lead Aud %d, Discard\n", VidAudDiff);
        }
    }
    else
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_NORMAL;

        HI_INFO_ASYNC(enChn, "Vid Lead Aud %d, Play\n", VidAudDiff);
    }

    /* there is space in video buffer */
    // TODO: sdk change VidBlockFlag to VidFullFlag
    if (SYNC_BUF_STATE_HIGH != pSync->CrtBufStatus.VidBufState)
    {
        if (VidAudDiff > pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
        {
            if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay || pSync->VidFirstPts == HI_INVALID_PTS)
            {
                /* repeat one frame every VID_SMOOTH_REPEAT_INTERVAL frame */
                if (!(pSync->VidRepPlayCnt % VID_SMOOTH_REPEAT_INTERVAL))
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                    if (SYNC_CHAN_VID == enChn)
                    {
                        (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidAudDiff);
                    }

                    HI_INFO_VSYNC(enChn, "Vid Novel Lead Aud %d Smooth, Repeat\n", VidAudDiff);
                }
                else
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                    HI_INFO_VSYNC(enChn, "Vid Novel Lead Aud %d Smooth, Play\n", VidAudDiff);
                }

                if (SYNC_CHAN_VID == enChn)
                {
                    pSync->VidRepPlayCnt++;
                }
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                if (SYNC_CHAN_VID == enChn)
                {
                    (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidAudDiff);
                }

                HI_INFO_VSYNC(enChn, "Vid Novel Lead Aud %d, Repeat\n", VidAudDiff);
            }
        }
        else
        {
            if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay || pSync->VidFirstPts == HI_INVALID_PTS)
            {
                /* repeat one frame every VID_SMOOTH_REPEAT_INTERVAL frame */
                if (!(pSync->VidRepPlayCnt % VID_SMOOTH_REPEAT_INTERVAL))
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                    if (SYNC_CHAN_VID == enChn)
                    {
                        (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidAudDiff);
                    }

                    HI_INFO_VSYNC(enChn, "Vid Lead Aud %d Smooth, Repeat\n", VidAudDiff);
                }
                else
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                    HI_INFO_VSYNC(enChn, "Vid Lead Aud %d Smooth, Play\n", VidAudDiff);
                }

                if (SYNC_CHAN_VID == enChn)
                {
                    pSync->VidRepPlayCnt++;
                }
            }
            else
            {
                /* If smoothy is closed,video should be continues to play when audio buf is empty */
                if ((SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.AudBufState)&&(pSync->SyncAttr.stSyncStartRegion.bSmoothPlay == HI_FALSE))
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
                    HI_WARN_SYNC("+++AUDIO BUF IS EMPTY!Video play normally!\n");
                }
                else
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                    if (SYNC_CHAN_VID == enChn)
                    {
                        (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidAudDiff);
                    }

                    HI_INFO_VSYNC(enChn, "Vid Lead Aud %d, Repeat\n", VidAudDiff);
                }
            }
        }
    }
    /* the video buffer reach high waterline */
    else
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_VSYNC(enChn, "Vid Lead Aud %d BufBlock, Play\n", VidAudDiff);
    }

    return;
}

/* refer to audio and video is behind audio */
HI_VOID SYNC_AudSyncVidLagAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn, HI_S32 VidAudDiff)
{
    pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

    if(SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.VidBufState)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        if (SYNC_BUF_STATE_HIGH != pSync->CrtBufStatus.AudBufState)
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
            HI_INFO_ASYNC(enChn, "Vid Buf Low, VidAudDiff: %d, Aud Speed Down\n", VidAudDiff);
#if 0
            if(pSync->VidAudDiff < -500)
            {
                pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_MUTE_REPEAT;
                HI_INFO_ASYNC(enChn, "Vid Buf Low, VidAudDiff: %d, Aud Mute Repeat\n", VidAudDiff);
            }
            else
            {
                pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
                HI_INFO_ASYNC(enChn, "Vid Buf Low, VidAudDiff: %d, Aud Speed Down\n", VidAudDiff);
            }
#endif
        }

        HI_INFO_VSYNC(enChn, "Vid Buf Low, VidAudDiff: %d, Vid Play\n", VidAudDiff);

        return;
    }
    else if (SYNC_BUF_STATE_LOW == pSync->CrtBufStatus.VidBufState)
    {
        if (SYNC_BUF_STATE_HIGH != pSync->CrtBufStatus.AudBufState)
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
            HI_INFO_ASYNC(enChn, "Vid Buf Low, VidAudDiff: %d, Aud Speed Down\n", VidAudDiff);
        }
    }

    if (VidAudDiff < pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
    {
        if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay)
        {
            /* discard one frame in every VID_SMOOTH_DISCARD_INTERVAL frame */
            if (!(pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL))
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

                if (SYNC_CHAN_VID == enChn)
                {
                    pSync->VidDiscardCnt++;
                }

                HI_INFO_VSYNC(enChn, "Vid Novel Lag Aud %d Smooth, Discard\n", VidAudDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(enChn, "Vid Novel Lag Aud %d Smooth, Play\n", VidAudDiff);
            }

            if (SYNC_CHAN_VID == enChn)
            {
                pSync->VidDisPlayCnt++;
            }
        }
        else
        {
            /* discard time before vdec */
            pSync->VidOpt.VdecDiscardTime = abs(VidAudDiff);
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            if (SYNC_CHAN_VID == enChn)
            {
                pSync->VidDiscardCnt++;
            }

            HI_INFO_VSYNC(enChn, "Vid Novel Lag Aud %d, Discard\n", VidAudDiff);
        }
    }
    else
    {
        if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay)
        {
            /* discard one frame in every VID_SMOOTH_DISCARD_INTERVAL frame */
            if (!(pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL))
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

                if (SYNC_CHAN_VID == enChn)
                {
                    pSync->VidDiscardCnt++;
                }

                HI_INFO_VSYNC(enChn, "Vid Lag Aud %d Smooth, Discard\n", VidAudDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(enChn, "Vid Lag Aud %d Smooth, Play\n", VidAudDiff);
            }

            if (SYNC_CHAN_VID == enChn)
            {
                pSync->VidDisPlayCnt++;
            }
        }
        else
        {
            /* discard time before vdec */
            pSync->VidOpt.VdecDiscardTime = abs(VidAudDiff);
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            if (SYNC_CHAN_VID == enChn)
            {
                pSync->VidDiscardCnt++;
            }

            HI_INFO_VSYNC(enChn, "Vid Lag Aud %d, Discard\n", VidAudDiff);
        }
    }

    return;
}

/* adjust referring to audio */
HI_VOID SYNC_AudSyncAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn, HI_S32 VidAudDiff)
{
    if (!pSync->VidSyndAdjust)
    {
        /* already in the start region */
        if (   (VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
            && (VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
           )
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            HI_INFO_ASYNC(enChn, "Vid Sync Aud, VidAudDiff %d, Play\n", VidAudDiff);
            HI_INFO_VSYNC(enChn, "Vid Sync Aud, VidAudDiff %d, Play\n", VidAudDiff);

            return;
        }
        else
        {
            pSync->VidSyndAdjust = HI_TRUE;
        }
    }

    if (   (VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
        && (VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
       )
    {
        if ((pSync->bUseStopRegion == HI_TRUE && abs(VidAudDiff) <= pSync->VidInfo.FrameTime)
            || (pSync->bUseStopRegion == HI_FALSE)
            )
        {
            pSync->VidSyndAdjust = HI_FALSE;
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            pSync->PcrSyncInfo.PcrAudSyncOK = HI_TRUE;
            pSync->PcrSyncInfo.PcrVidSyncOK = HI_TRUE;

            HI_INFO_ASYNC(enChn, "Vid AdjustSync Aud, VidAudDiff %d, Play\n", VidAudDiff);
            HI_INFO_VSYNC(enChn, "Vid AdjustSync Aud, VidAudDiff %d, Play\n", VidAudDiff);

            return;
        }
    }

    /* video is ahead of audio and the difference is too large */
    if (VidAudDiff > VID_LEAD_DISCARD_THRESHOLD)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_ASYNC(enChn, "VidAudDiff %d > VID_LEAD_DISCARD_THRESHOLD, Play\n", VidAudDiff);
        HI_INFO_VSYNC(enChn, "VidAudDiff %d > VID_LEAD_DISCARD_THRESHOLD, Play\n", VidAudDiff);

        return;
    }

    /* video is behind audio and the difference is too large */
    if (VidAudDiff < (-VID_LAG_DISCARD_THRESHOLD))
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_ASYNC(enChn, "VidAudDiff %d < VID_LAG_DISCARD_THRESHOLD, Play\n", VidAudDiff);
        HI_INFO_VSYNC(enChn, "VidAudDiff %d < VID_LAG_DISCARD_THRESHOLD, Play\n", VidAudDiff);

        return;
    }

    /* video is ahead of audio */
    if (VidAudDiff > 0)
    {
        SYNC_AudSyncVidLeadAdjust(pSync, enChn, VidAudDiff);
    }
    /* video is behind audio */
    else
    {
        SYNC_AudSyncVidLagAdjust(pSync, enChn, VidAudDiff);
    }

    return;
}

HI_VOID SYNC_ScrSyncAudAdjust(SYNC_S *pSync, HI_S32 VidAudDiff, HI_S32 AudScrDiff, HI_S32 VidScrDiff)
{
#ifdef HI_AVPLAY_SCR_SUPPORT

    /* aud is behind scr and AudScrDiff is in novel region */
    if (   (AudScrDiff >= pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
        && (AudScrDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime) )
    {
        #if 1
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff: %d, DISCARD\n", AudScrDiff);
        #else
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_UP;

        HI_INFO_SYNC("AudScrDiff: %d, Play, SPEED UP\n", AudScrDiff);
        #endif
    }
    /* aud is behind scr and AudScrDiff is out of novel region */
    else if (AudScrDiff < pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff: %d, DISCARD\n", AudScrDiff);
    }
    /* aud is ahead scr and AudScrDiff is in novel region */
    else if (   (AudScrDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
             && (AudScrDiff <= pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime) )
    {
        #if 1
        pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff: %d, REPEAT\n", AudScrDiff);
        #else
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;

        HI_INFO_SYNC("AudScrDiff: %d, Play, SPEED DOWN\n", AudScrDiff);
        #endif
    }
    /* aud is ahead scr and AudScrDiff is out of novel region */
    else if (AudScrDiff > pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff: %d, REPEAT\n", AudScrDiff);
    }
#endif
    return;
}

HI_VOID SYNC_ScrSyncVidLagAdjust(SYNC_S *pSync, HI_S32 VidScrDiff)
{
#ifdef HI_AVPLAY_SCR_SUPPORT

    /* vid is behind scr and VidScrDiff is in novel region */
    if (VidScrDiff >= pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
    {
        if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay)
        {
            if (0 == pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL)
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

                pSync->VidDiscardCnt++;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH DISCARD\n", VidScrDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH Play\n", VidScrDiff);
            }

            pSync->VidDisPlayCnt++;
        }
        else
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, DISCARD\n", VidScrDiff);
        }
    }
    /* vid is behind scr and VidScrDiff is out of novel region */
    else if (VidScrDiff < pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
    {
        if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay)
        {
            if (0 == pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL)
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

                pSync->VidDiscardCnt++;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH DISCARD\n", VidScrDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH Play\n", VidScrDiff);
            }

            pSync->VidDisPlayCnt++;
        }
        else
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            pSync->VidDiscardCnt++;

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, DISCARD\n", VidScrDiff);
        }
    }
#endif

    return;
}

HI_VOID SYNC_ScrSyncVidLeadAdjust(SYNC_S *pSync, HI_S32 VidScrDiff)
{
#ifdef HI_AVPLAY_SCR_SUPPORT

    /* vid is ahead scr and VidScrDiff is in novel region */
    if (VidScrDiff <= pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
    {
        if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay)
        {
            if (0 == pSync->VidRepPlayCnt % VID_SMOOTH_REPEAT_INTERVAL)
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidScrDiff);

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH REPEAT\n", VidScrDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH Play\n", VidScrDiff);
            }

            pSync->VidRepPlayCnt++;
        }
        else
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

            (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidScrDiff);

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, REPEAT\n", VidScrDiff);
        }
    }
    /* vid is ahead scr and VidScrDiff is out of novel region */
    else if (VidScrDiff > pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
    {
       if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay)
        {
            if (0 == pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL)
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

                (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidScrDiff);

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH REPEAT\n", VidScrDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, SMOOTH PLAY\n", VidScrDiff);
            }

            pSync->VidRepPlayCnt++;
        }
        else
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

            (HI_VOID)SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidScrDiff);

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, REPEAT\n", VidScrDiff);
        }
    }
#endif

    return;
}

HI_VOID SYNC_ScrSyncVidAdjust(SYNC_S *pSync, HI_S32 VidAudDiff, HI_S32 AudScrDiff, HI_S32 VidScrDiff)
{
#ifdef HI_AVPLAY_SCR_SUPPORT

    /* VidScrDiff is already in start region */
    if (   (VidScrDiff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
        && (VidScrDiff < pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime) )
    {
        /* VidAudDiff is already in start region */
        if (   (VidAudDiff < pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
            && (VidAudDiff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime) )
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, Play\n", VidScrDiff);
            return;
        }

        /* VidAudDiff is beyond start region, we adjust vid */
        /* we only need adjust one or two frames, so we ignore smooth play */
        if (AudScrDiff > 0 && VidScrDiff < 0)
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

            pSync->VidDiscardCnt++;

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, DISCARD\n", VidScrDiff);
        }

        if (AudScrDiff < 0 && VidScrDiff > 0)
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;

            pSync->VidRepeatCnt++;

            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidScrDiff: %d, REPEAT\n", VidScrDiff);
        }
    }
    /* vid is behind scr */
    else if (VidScrDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
    {
        SYNC_ScrSyncVidLagAdjust(pSync, VidScrDiff);
    }
    /* vid is ahead scr */
    else if (VidScrDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
    {
        SYNC_ScrSyncVidLeadAdjust(pSync, VidScrDiff);
    }
#endif

    return;
}

HI_VOID SYNC_ScrSyncAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn, HI_S32 VidAudDiff, HI_S32 AudScrDiff, HI_S32 VidScrDiff)
{

#ifdef HI_AVPLAY_SCR_SUPPORT

    /* AudScrDiff or VidScrDiff is too large, give up */
    if (    (abs(AudScrDiff) > SCR_DISCARD_THRESHOLD)
         || (abs(VidScrDiff) > SCR_DISCARD_THRESHOLD)
       )
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff %d VidScrDiff %d > SCR_DISCARD_THRESHOLD, Play\n", AudScrDiff, VidScrDiff);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "AudScrDiff %d VidScrDiff %d > SCR_DISCARD_THRESHOLD, Play\n", AudScrDiff, VidScrDiff);

        return;
    }

    if (SYNC_CHAN_AUD == enChn)
    {
        /* already in start region */
        if (   (AudScrDiff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
            && (AudScrDiff < pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime) )
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudScrDiff: %d, Play\n", AudScrDiff);
        }
        else
        {
            SYNC_ScrSyncAudAdjust(pSync, pSync->VidAudDiff, pSync->AudScrDiff, pSync->VidScrDiff);
        }
    }
    else if (SYNC_CHAN_VID == enChn)
    {
        SYNC_ScrSyncVidAdjust(pSync, pSync->VidAudDiff, pSync->AudScrDiff, pSync->VidScrDiff);
    }
#endif
    return;
}

HI_UNF_SYNC_REF_E SYNC_GetSyncAdjustRefMode(SYNC_S *pSync)
{
    /* refer to scr or refer to audio but audio first frame does not come */
    if (   (HI_UNF_SYNC_REF_SCR == pSync->SyncAttr.enSyncRef)
        || ((HI_UNF_SYNC_REF_AUDIO == pSync->SyncAttr.enSyncRef) && (!pSync->AudFirstCome)) )
    {
        return HI_UNF_SYNC_REF_SCR;
    }
    /* refer to aud or refer to pcr but pcr does not come */
    else if (   (HI_UNF_SYNC_REF_AUDIO == pSync->SyncAttr.enSyncRef)
             || (((HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef) && (!pSync->PcrSyncInfo.PcrFirstCome))
             || (SYNC_AUD_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust))   //pcr does not come and pcr timeout
            )
    {
        return HI_UNF_SYNC_REF_AUDIO;
    }
    /* refer to pcr and received pcr */
    else if (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
    {
        return HI_UNF_SYNC_REF_PCR;
    }

    return HI_UNF_AVPLAY_SYNC_REF_BUTT;
}

/* refer to pcr and audio is ahead of pcr */
HI_VOID SYNC_PcrSyncAudLeadAdjust(SYNC_S *pSync, HI_S32 AudPcrDiff)
{
    pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

    if (SYNC_BUF_STATE_HIGH != pSync->CrtBufStatus.AudBufState)
    {
        #if 0
        if (SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.AudBufState)
        {
             pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_MUTE_REPEAT;
        }
        else
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;
        }
        #else
        pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;
        #endif
        pSync->AudRepeatCnt++;
        HI_INFO_SYNC(">>>>Pcr Lag Aud, AudPcrDiff %d, Aud Repeat\n", AudPcrDiff);
    }

    return;
}

/* refer to pcr and audio is behind pcr */
HI_VOID SYNC_PcrSyncAudLagAdjust(SYNC_S *pSync, HI_S32 AudPcrDiff)
{
    pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_NORMAL;

    pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;

    pSync->AudDiscardCnt++;

    HI_INFO_SYNC(">>>>Pcr Lead Aud %d, discard\n", AudPcrDiff);

    return;
}

/* refer to pcr and video is ahead of pcr */
HI_VOID SYNC_PcrSyncVidLeadAdjust(SYNC_S *pSync, HI_S32 VidTargetDiff)
{
    /* there is space in video buffer */
    if (SYNC_BUF_STATE_HIGH != pSync->CrtBufStatus.VidBufState)
    {
        if (VidTargetDiff > pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
        {
            if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay || pSync->VidFirstPts == -1)
            {
                /* repeat one frame every VID_SMOOTH_REPEAT_INTERVAL frame */
                if (!(pSync->VidRepPlayCnt % VID_SMOOTH_REPEAT_INTERVAL))
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;
                    SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidTargetDiff);

                    HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d Smooth, Repeat\n", VidTargetDiff);
                }
                else
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                    HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d Smooth, Play\n", VidTargetDiff);
                }

                pSync->VidRepPlayCnt++;
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;
                SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidTargetDiff);

                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d, Repeat\n", VidTargetDiff);
            }
        }
        else
        {
            if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay || pSync->VidFirstPts == -1)
            {
                /* repeat one frame every VID_SMOOTH_REPEAT_INTERVAL frame */
                if (!(pSync->VidRepPlayCnt % VID_SMOOTH_REPEAT_INTERVAL))
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;
                    SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_SMOOTH, VidTargetDiff);

                    HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d Smooth, Repeat\n", VidTargetDiff);
                }
                else
                {
                    pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                    HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d Smooth, Play\n", VidTargetDiff);
                }

                pSync->VidRepPlayCnt++;
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_REPEAT;
                SYNC_ProcVidRepeatCount(pSync, SYNC_PROC_TYPE_QUICK, VidTargetDiff);

                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d, Repeat\n", VidTargetDiff);
            }
        }
    }
    /* the video buffer reach high waterline */
    else
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lag Vid %d BufBlock, Play\n", VidTargetDiff);
    }

    return;
}

/* refer to pcr and video is behind pcr */
HI_VOID SYNC_PcrSyncVidLagAdjust(SYNC_S *pSync, HI_S32 VidTargetDiff)
{
    if (VidTargetDiff < pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
    {
        if (pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay)
        {
            /* discard one frame in every VID_SMOOTH_DISCARD_INTERVAL frame */
            if (!(pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL))
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
                pSync->VidDiscardCnt++;
                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d Smooth, Discard\n", VidTargetDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d Smooth, Play\n", VidTargetDiff);
            }

            pSync->VidDisPlayCnt++;
        }
        else
        {
            /* discard time before vdec */
            pSync->VidOpt.VdecDiscardTime = abs(VidTargetDiff); //do what ? nouse
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
            pSync->VidDiscardCnt++;

            HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d, Discard\n", VidTargetDiff);
        }
    }
    else
    {
        if (pSync->SyncAttr.stSyncStartRegion.bSmoothPlay)
        {
            /* discard one frame in every VID_SMOOTH_DISCARD_INTERVAL frame */
            if (!(pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL))
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
                pSync->VidDiscardCnt++;
                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d Smooth, Discard\n", VidTargetDiff);
            }
            else
            {
                pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

                HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d Smooth, Play\n", VidTargetDiff);
            }

            pSync->VidDisPlayCnt++;
        }
        else
        {
            /* discard time before vdec */
            pSync->VidOpt.VdecDiscardTime = abs(VidTargetDiff); //do what ? nouse
            pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
            pSync->VidDiscardCnt++;
            HI_INFO_VSYNC(SYNC_CHAN_VID, ">>>>Pcr Lead Vid %d, Discard\n", VidTargetDiff);
        }
    }

    return;
}

HI_VOID SYNC_PcrAudAdjust(SYNC_S *pSync, HI_S32 AudPcrDiff)
{
    if (abs(AudPcrDiff) > PCR_SYNC_THRESHOLD)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->PcrSyncInfo.PcrAudSyncOK = HI_FALSE;

        HI_INFO_SYNC("AudPcrDiff is too large\n");
        return;
    }

    /* already in the stop region */
    if (abs(AudPcrDiff) < PCR_LAG_STOP_THRESHOLD)
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->PcrSyncInfo.PcrAudSyncOK = HI_TRUE;

        HI_INFO_SYNC("AudPcrDiff sync finsh\n");
        return;
    }
    else
    {
        pSync->PcrSyncInfo.PcrAudSyncOK = HI_FALSE;
    }

    if (pSync->PcrSyncInfo.AudPcrDiff > 0)
    {
         SYNC_PcrSyncAudLeadAdjust(pSync, AudPcrDiff);
    }
    else
    {
         SYNC_PcrSyncAudLagAdjust(pSync, AudPcrDiff);
    }

    return;
}

HI_VOID SYNC_PcrVidAdjust(SYNC_S *pSync, HI_S32 VidPcrDiff)
{
    if (abs(VidPcrDiff) > PCR_SYNC_THRESHOLD)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->PcrSyncInfo.PcrVidSyncOK = HI_FALSE;

        HI_INFO_SYNC("VidPcrDiff is too large :%d", VidPcrDiff);
        return;
    }

    /* already in the stop region, */
    if (abs(VidPcrDiff) < PCR_LAG_STOP_THRESHOLD)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->PcrSyncInfo.PcrVidSyncOK = HI_TRUE;

        HI_INFO_SYNC("VidPcrDiff sync finsh :%d", VidPcrDiff);
        return;
    }
    else
    {
        pSync->PcrSyncInfo.PcrVidSyncOK = HI_FALSE;
    }

    if (pSync->PcrSyncInfo.VidPcrDiff > 0)
    {
        SYNC_PcrSyncVidLeadAdjust(pSync, VidPcrDiff);
    }
    else
    {
        SYNC_PcrSyncVidLagAdjust(pSync, VidPcrDiff);
    }

    return;
}

HI_VOID SYNC_PcrVidAudAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    if (SYNC_CHAN_VID == enChn)
    {
        if (pSync->VidAudDiff > 0)
        {
            SYNC_PcrSyncVidLeadAdjust(pSync, pSync->VidAudDiff);
        }
        else
        {
            SYNC_PcrSyncVidLagAdjust(pSync, pSync->VidAudDiff);
        }
    }

    if (SYNC_CHAN_AUD == enChn)
    {
        /* need adjust aud speed */
        if (pSync->VidAudDiff > 0)
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_UP;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        }
        else
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        }
    }

    return;
}

HI_VOID SYNC_PcrCheckAdjustFinsh(SYNC_S *pSync, HI_S32 AudPcrDiff, HI_S32 VidPcrDiff, HI_BOOL *pIsSyncFinsh)
{
    HI_S32 PcrLagThreshold;
    HI_S32 PcrLeadThreshold;

    /* if only aud or vid is exist,make sure audpcrdiff or vidpcrdiff in -100~100 */
    if (((pSync->AudFirstCome) && (!pSync->VidFirstCome)) || ((!pSync->AudFirstCome) && (pSync->VidFirstCome)))
    {
        PcrLagThreshold = PCR_LAG_STOP_THRESHOLD;
        PcrLeadThreshold = PCR_LEAD_STOP_THRESHOLD;
    }
    else
    {
        PcrLagThreshold = PCR_LAG_ADJUST_THRESHOLD;
        PcrLeadThreshold = PCR_LEAD_ADJUST_THRESHOLD;
    }

    if (!pSync->VidSyndAdjust)
    {
         /* VidAudDiff is in sync start region, vidpcr and audpcr is in sync start region, don't need to adjust  */
        if (   (pSync->VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
            && (pSync->VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
            && ((AudPcrDiff <= PcrLagThreshold) && (AudPcrDiff + PcrLeadThreshold >= 0))
            && ((VidPcrDiff <= PcrLagThreshold) && (VidPcrDiff + PcrLeadThreshold >= 0))
           )
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            pSync->PcrSyncInfo.PcrVidSyncOK = HI_TRUE;
            pSync->PcrSyncInfo.PcrAudSyncOK = HI_TRUE;

            *pIsSyncFinsh = HI_TRUE;

            HI_INFO_SYNC("pcr sync finsh, VidAudDiff %d\n", pSync->VidAudDiff);
            return;
        }

        pSync->VidSyndAdjust = HI_TRUE;
        pSync->PcrSyncInfo.PcrAudSyncOK = HI_FALSE;
        pSync->PcrSyncInfo.PcrVidSyncOK = HI_FALSE;
    }

    /* VidAudDiff is in sync start region, vidpcr and audpcr is in sync start region, don't need to adjust */
    if (   (pSync->VidAudDiff <= pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
        && (pSync->VidAudDiff >= pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
        && ((AudPcrDiff <= PcrLagThreshold) && (AudPcrDiff + PcrLeadThreshold >= 0))
        && ((VidPcrDiff <= PcrLagThreshold) && (VidPcrDiff + PcrLeadThreshold >= 0))
       )
    {
        if (  (pSync->bUseStopRegion == HI_TRUE && abs(pSync->VidAudDiff) <= pSync->VidInfo.FrameTime)
           || (pSync->bUseStopRegion == HI_FALSE))
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            pSync->PcrSyncInfo.PcrVidSyncOK = HI_TRUE;
            pSync->PcrSyncInfo.PcrAudSyncOK = HI_TRUE;

            *pIsSyncFinsh = HI_TRUE;
            pSync->VidSyndAdjust = HI_FALSE;

            HI_WARN_SYNC("pcr sync finsh, VidAudDiff %d\n", pSync->VidAudDiff);
            return;
        }
    }

    *pIsSyncFinsh = HI_FALSE;
    return;
}

HI_VOID SYNC_PcrStartRegionAdjust(SYNC_S *pSync, SYNC_CHAN_E Chn, HI_S32 AudPcrDiff, HI_S32 VidPcrDiff)
{
    HI_BOOL IsSyncFinsh = HI_FALSE;

    SYNC_PcrCheckAdjustFinsh(pSync, AudPcrDiff, VidPcrDiff, &IsSyncFinsh);

    if (HI_TRUE == IsSyncFinsh)
    {
       return;
    }

    /* adjust aud to match pcr */
    if (SYNC_CHAN_AUD == Chn)
    {
        SYNC_PcrAudAdjust(pSync, AudPcrDiff);
    }

    /* adjust vid to match pcr */
    if (SYNC_CHAN_VID == Chn)
    {
        SYNC_PcrVidAdjust(pSync, VidPcrDiff);
    }

    /* adjust aud and vid to match startregion */
    if ((HI_TRUE == pSync->PcrSyncInfo.PcrAudSyncOK) && (HI_TRUE == pSync->PcrSyncInfo.PcrVidSyncOK))
    {
        SYNC_PcrVidAudAdjust(pSync, Chn);
    }

    HI_WARN_SYNC("PcrAudSyncOK:%d, PcrVidSyncOK:%d; AudPcr:%d, VidPcr:%d, AudVid:%d\n",
         pSync->PcrSyncInfo.PcrAudSyncOK, pSync->PcrSyncInfo.PcrVidSyncOK,
         pSync->PcrSyncInfo.AudPcrDiff, pSync->PcrSyncInfo.VidPcrDiff, pSync->VidAudDiff);
    return;
}

HI_VOID SYNC_PcrSyncAdjust(SYNC_S *pSync, SYNC_CHAN_E Chn, HI_S32 AudPcrDiff, HI_S32 VidPcrDiff)
{
    if (pSync->AudFirstCome && pSync->VidFirstCome)
    {
        if (   (HI_TRUE == pSync->bPcrBackFlag)
            || (HI_TRUE == pSync->bVidBackFlag)
            || (HI_TRUE == pSync->bAudBackFlag))
        {
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
            return;
        }
    }

    /* if pcr is abnormal chenge syncRef to Aud */
    if ((abs(AudPcrDiff) > PCR_SYNC_THRESHOLD) && (abs(VidPcrDiff) > PCR_SYNC_THRESHOLD))
    {
        if (abs(pSync->VidAudDiff) < PCR_SYNC_THRESHOLD)
        {
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            HI_INFO_SYNC("change syncRef to aud\n");
            return;
        }
    }

    if ((AudPcrDiff + PCR_LEAD_ADJUST_THRESHOLD < 0) && (VidPcrDiff + PCR_LEAD_ADJUST_THRESHOLD < 0))
    {
        if (   (AudPcrDiff + pSync->PcrSyncInfo.PcrDelta + PCR_SYNC_MAX_DELTA < 0)
            || (VidPcrDiff + pSync->PcrSyncInfo.PcrDelta + PCR_SYNC_MAX_DELTA < 0))
        {
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;
            pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
            pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

            HI_INFO_SYNC("change syncRef to aud\n");
            return;
        }

        /* adjust pcr to this one which is more behind */
        if (pSync->PcrSyncInfo.PcrAdjustDeltaOK)
        {
            pSync->PcrSyncInfo.PcrDelta += (VidPcrDiff > AudPcrDiff) ? AudPcrDiff : VidPcrDiff;
            pSync->PcrSyncInfo.PcrAdjustDeltaOK = HI_FALSE;

            HI_INFO_SYNC("change PcrDelta %d\n", pSync->PcrSyncInfo.PcrDelta);
        }

        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
        return;
    }

    SYNC_PcrStartRegionAdjust(pSync, Chn, AudPcrDiff, VidPcrDiff);
    return;
}

HI_VOID SYNC_SyncAdjust(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_UNF_SYNC_REF_E  SyncRefMode;

    /* do not sync when LoopBackFlag is true */
    if (pSync->LoopBackFlag)
    {
        return;
    }

    SyncRefMode = SYNC_GetSyncAdjustRefMode(pSync);

    switch (SyncRefMode)
    {
        case HI_UNF_SYNC_REF_SCR :
        {
            SYNC_ScrSyncAdjust(pSync, enChn, pSync->VidAudDiff, pSync->AudScrDiff, pSync->VidScrDiff);
            break;
        }

        case HI_UNF_SYNC_REF_AUDIO :
        {
            SYNC_AudSyncAdjust(pSync, enChn, pSync->VidAudDiff);
            break;
        }

        case HI_UNF_SYNC_REF_PCR :
        {
            SYNC_PcrSyncAdjust(pSync, enChn, pSync->PcrSyncInfo.AudPcrDiff, pSync->PcrSyncInfo.VidPcrDiff);
            break;
        }

        default :
            HI_INFO_ASYNC(enChn, "SyncRefMode 0x%x is not support\n", SyncRefMode);
            HI_INFO_VSYNC(enChn, "SyncRefMode 0x%x is not support\n", SyncRefMode);
            return;
    }

    return;
}

SYNC_REGION_STAT_E SYNC_CheckPCRRegion(SYNC_S *pSync, HI_S32 Diff)
{
    if (   (Diff < PCR_LAG_ADJUST_THRESHOLD)
        && (Diff > -PCR_LEAD_ADJUST_THRESHOLD))
    {
        return SYNC_REGION_STAT_IN_START;
    }
    else if (   (Diff < PCR_DISCARD_THRESHOLD)
             && (Diff > -PCR_DISCARD_THRESHOLD))
    {
        return SYNC_REGION_STAT_IN_NOVEL;
    }
    else if (  (Diff < VID_LEAD_DISCARD_THRESHOLD)
             && (Diff > -VID_LEAD_DISCARD_THRESHOLD))
    {
        return SYNC_REGION_STAT_IN_DISCARD;
    }
    else
    {
        return SYNC_REGION_STAT_OUT_DISCARD;
    }
}

SYNC_REGION_STAT_E SYNC_CheckRegion(SYNC_S *pSync, HI_S32 Diff)
{
    if ((Diff < pSync->SyncAttr.stSyncStartRegion.s32VidPlusTime)
        && (Diff > pSync->SyncAttr.stSyncStartRegion.s32VidNegativeTime)
        )
    {
        return SYNC_REGION_STAT_IN_START;
    }
    else if ((Diff < pSync->SyncAttr.stSyncNovelRegion.s32VidPlusTime)
             && (Diff > pSync->SyncAttr.stSyncNovelRegion.s32VidNegativeTime)
            )
    {
        return SYNC_REGION_STAT_IN_NOVEL;
    }
    else if ((Diff < VID_LEAD_DISCARD_THRESHOLD)
             && (Diff > -VID_LAG_DISCARD_THRESHOLD)
            )
    {
        return SYNC_REGION_STAT_IN_DISCARD;
    }
    else
    {
        return SYNC_REGION_STAT_OUT_DISCARD;
    }

}

HI_VOID SYNC_CheckEvent(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    HI_U32                  ErrDelta;
    SYNC_REGION_STAT_E      LastVidAudStat = SYNC_REGION_STAT_BUTT;
    SYNC_REGION_STAT_E      CurVidAudStat  = SYNC_REGION_STAT_BUTT;
    SYNC_REGION_STAT_E      LastVidPcrStat = SYNC_REGION_STAT_BUTT;
    SYNC_REGION_STAT_E      CurVidPcrStat  = SYNC_REGION_STAT_BUTT;
    SYNC_REGION_STAT_E      LastAudPcrStat = SYNC_REGION_STAT_BUTT;
    SYNC_REGION_STAT_E      CurAudPcrStat  = SYNC_REGION_STAT_BUTT;
    HI_U32                  CurSysTime;
    HI_BOOL                 SyncStateChange = HI_FALSE;

    if (SYNC_CHAN_VID == enChn)
    {
        ErrDelta = pSync->VidInfo.FrameTime * SYNC_PTS_JUMP_FRM_NUM;

        if (HI_INVALID_PTS == pSync->VidLastPts)
        {
            return;
        }

        if (abs(pSync->VidInfo.Pts - pSync->VidLastPts) > ErrDelta)
        {
            HI_INFO_VSYNC(SYNC_CHAN_VID, "VidLastPts %d, VidPts %d, u32FirstValidPts %d, ErrDelta %d\n",
                pSync->VidInfo.Pts, pSync->VidLastPts, pSync->VidFirstValidPts, ErrDelta);

            pSync->SyncEvent.bVidPtsJump = HI_TRUE;
            pSync->SyncEvent.VidPtsJumpParam.enPtsChan = HI_UNF_SYNC_PTS_CHAN_VID;
            pSync->SyncEvent.VidPtsJumpParam.u32CurPts = pSync->VidInfo.Pts;
            pSync->SyncEvent.VidPtsJumpParam.u32CurSrcPts = pSync->VidInfo.SrcPts;
            pSync->SyncEvent.VidPtsJumpParam.u32FirstPts = pSync->VidFirstPts;
            pSync->SyncEvent.VidPtsJumpParam.u32FirstValidPts = pSync->VidFirstValidPts;
            pSync->SyncEvent.VidPtsJumpParam.u32LastPts = pSync->VidLastPts;
            pSync->SyncEvent.VidPtsJumpParam.u32LastSrcPts = pSync->VidLastSrcPts;

            /* pts is one of VidFirstDecPts/VidSecondDecPts/VidFirstValidPts */
            if (   (pSync->VidInfo.SrcPts == pSync->VidFirstDecPts)
                || (pSync->VidInfo.SrcPts == pSync->VidSecondDecPts)
                || ((pSync->VidInfo.SrcPts == pSync->VidFirstValidPts) && (pSync->VidFirstValidCome))
               )
            {
                HI_INFO_VSYNC(SYNC_CHAN_VID,
                    "Vid pts LoopBack, SrcPts %u, VidFirstDecPts %u, VidSecondDecPts %u, VidFirstValidPts %u!\n",
                    pSync->VidInfo.SrcPts, pSync->VidFirstDecPts, pSync->VidSecondDecPts, pSync->VidFirstValidPts);

                pSync->SyncEvent.VidPtsJumpParam.bLoopback = HI_TRUE;
                pSync->VidPtsLoopBack = HI_TRUE;
            }
            else
            {
                pSync->SyncEvent.VidPtsJumpParam.bLoopback = HI_FALSE;
            }
        }
    }
    else if (SYNC_CHAN_AUD == enChn)
    {
        ErrDelta = pSync->AudInfo.FrameTime * SYNC_PTS_JUMP_FRM_NUM;

        if (HI_INVALID_PTS == pSync->AudLastPts)
        {
            return;
        }

        if (abs(pSync->AudInfo.Pts - pSync->AudLastPts) > ErrDelta)
        {

            HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudLastPts %d, AuddPts %d, u32FirstValidPts %d, ErrDelta %d\n",
                pSync->AudLastPts, pSync->AudInfo.Pts, pSync->AudFirstValidPts, ErrDelta);

            pSync->SyncEvent.bAudPtsJump = HI_TRUE;
            pSync->SyncEvent.AudPtsJumpParam.enPtsChan = HI_UNF_SYNC_PTS_CHAN_AUD;
            pSync->SyncEvent.AudPtsJumpParam.u32CurPts = pSync->AudInfo.Pts;
            pSync->SyncEvent.AudPtsJumpParam.u32CurSrcPts = pSync->AudInfo.SrcPts;
            pSync->SyncEvent.AudPtsJumpParam.u32FirstPts = pSync->AudFirstPts;
            pSync->SyncEvent.AudPtsJumpParam.u32FirstValidPts = pSync->AudFirstValidPts;
            pSync->SyncEvent.AudPtsJumpParam.u32LastPts = pSync->AudLastPts;
            pSync->SyncEvent.AudPtsJumpParam.u32LastSrcPts = pSync->AudLastSrcPts;

            if (pSync->AudInfo.SrcPts == pSync->AudFirstValidPts)
            {
                HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud pts LoopBack!\n");

                pSync->SyncEvent.AudPtsJumpParam.bLoopback = HI_TRUE;
                pSync->AudPtsLoopBack = HI_TRUE;
            }
            else
            {
                pSync->SyncEvent.AudPtsJumpParam.bLoopback = HI_FALSE;
            }
        }
    }
    /* pcr jump check, to add */
    else
    {
    }

    if (HI_UNF_SYNC_REF_AUDIO == pSync->SyncAttr.enSyncRef)
    {
        LastVidAudStat = SYNC_CheckRegion(pSync, pSync->LastVidAudDiff);
        CurVidAudStat  = SYNC_CheckRegion(pSync, pSync->VidAudDiff);

        if (LastVidAudStat != CurVidAudStat)
        {
            SyncStateChange = HI_TRUE;
        }
    }
    else if (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)
    {
        LastAudPcrStat = SYNC_CheckPCRRegion(pSync, pSync->PcrSyncInfo.LastAudPcrDiff);
        LastVidPcrStat = SYNC_CheckPCRRegion(pSync, pSync->PcrSyncInfo.LastVidPcrDiff);
        LastVidAudStat = SYNC_CheckRegion(pSync, pSync->LastVidAudDiff);

        CurAudPcrStat = SYNC_CheckPCRRegion(pSync, pSync->PcrSyncInfo.AudPcrDiff);
        CurVidPcrStat = SYNC_CheckPCRRegion(pSync, pSync->PcrSyncInfo.VidPcrDiff);
        CurVidAudStat = SYNC_CheckRegion(pSync, pSync->VidAudDiff);

        if (   (LastAudPcrStat != CurAudPcrStat)
            || (LastVidPcrStat != CurVidPcrStat)
            || (LastVidAudStat != CurVidAudStat))
        {
            SyncStateChange = HI_TRUE;
        }
    }

    /* if sync status change, record this event */
    if ((HI_TRUE == SyncStateChange) || (HI_TRUE == pSync->bFirstSyncStateReport))
    {
        HI_INFO_SYNC("Sync Status change: LastVidAudStat %d, CurVidAudStat %d!\n",
            LastVidAudStat, CurVidAudStat);
        pSync->bFirstSyncStateReport = HI_FALSE;

        pSync->SyncEvent.bStatChange = HI_TRUE;
        pSync->SyncEvent.StatParam.s32VidAudDiff = pSync->VidAudDiff;
        pSync->SyncEvent.StatParam.s32VidPcrDiff = pSync->PcrSyncInfo.VidPcrDiff;
        pSync->SyncEvent.StatParam.s32AudPcrDiff = pSync->PcrSyncInfo.AudPcrDiff;
        pSync->SyncEvent.StatParam.u32VidLocalTime = pSync->VidLastLocalTime;
        pSync->SyncEvent.StatParam.u32AudLocalTime = pSync->AudLastLocalTime;
        pSync->SyncEvent.StatParam.u32PcrLocalTime = pSync->PcrSyncInfo.PcrLastLocalTime;
    }

    /*do not sync when vid or aud loopback*/
    if (!pSync->LoopBackFlag && (pSync->AudPtsLoopBack || pSync->VidPtsLoopBack))
    {
        pSync->LoopBackFlag = HI_TRUE;
        pSync->LoopBackTime = SYNC_GetSysTime();

        HI_INFO_SYNC("Change SyncRef=NONE, AudPtsLoopBack %d, VidPtsLoopBack %d\n",
            pSync->AudPtsLoopBack, pSync->VidPtsLoopBack);
    }

    if (pSync->LoopBackFlag)
    {
        CurSysTime = SYNC_GetSysTime();

        /*recover sync when timeout or vid and aud both loopback*/
        if ((CurSysTime - pSync->LoopBackTime > PTS_LOOPBACK_TIMEOUT)
            || (pSync->AudPtsLoopBack && pSync->VidPtsLoopBack)
            )
        {
            pSync->LoopBackFlag = HI_FALSE;
            pSync->AudPtsLoopBack = HI_FALSE;
            pSync->VidPtsLoopBack = HI_FALSE;

            HI_INFO_SYNC("Change SyncRef=UserSetRed, AudPtsLoopBack %d, VidPtsLoopBack %d\n",
                pSync->AudPtsLoopBack, pSync->VidPtsLoopBack);
        }
    }

    return;
}

HI_VOID SYNC_CheckTBMatchAdjust(SYNC_S *pSync)
{
    SYNC_REGION_STAT_E      enSyncRegion;

    enSyncRegion = SYNC_CheckRegion(pSync, pSync->VidAudDiff);

    if (enSyncRegion == SYNC_REGION_STAT_IN_START)
    {
        if (pSync->VidSyndAdjust)
        {
            pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_PLAY;
            return;
        }

        /*just in start region ,vdp can repeat or discat to match TB when it's necessary*/
        if(0 == pSync->VidAudDiff)
        {
            pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_PLAY;
        }
        else if (pSync->VidAudDiff > 0)
        {
            pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_REPEAT;
        }
        else
        {
            pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_DISCARD;
        }
        return ;
    }
    else
    {
        pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_PLAY;
        return;
    }
}

HI_BOOL SYNC_IsSyncRefNone(SYNC_S *pSync, SYNC_CHAN_E enChn)
{
    if (HI_UNF_SYNC_REF_NONE != pSync->SyncAttr.enSyncRef)
    {
        return HI_FALSE;
    }

    if (SYNC_CHAN_AUD == enChn)
    {
        if (!pSync->AudFirstPlay)
        {
            pSync->AudFirstPlay = HI_TRUE;
            pSync->AudFirstPlayTime = SYNC_GetSysTime();
        }

        if (SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.AudBufState)
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
        }
        else
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_NORMAL;
        }

        pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "--------Aud NoneSync Play Speed %d--------\n", pSync->AudOpt.SpeedAdjust);
    }

    if (SYNC_CHAN_VID == enChn)
    {
        if (!pSync->VidFirstPlay)
        {
            pSync->VidFirstPlay = HI_TRUE;
            pSync->VidFirstPlayTime = SYNC_GetSysTime();
            HI_DRV_STAT_Event(STAT_EVENT_FRAMESYNCOK, 0);
        }

        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;
        HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid NoneSync Play--------\n");
    }

    return HI_TRUE;
}

HI_BOOL SYNC_IsVidPreSyncFinish(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo, SYNC_VID_OPT_S *pVidOpt)
{
    if (pSync->PreSyncFinish)
    {
        return HI_TRUE;
    }

    SYNC_PreSync(pSync, SYNC_CHAN_VID);
    if (pSync->VidOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pVidOpt = pSync->VidOpt;

        if (pSync->PreSyncTargetInit)
        {
            HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid PreSync VidAudDiff %d Proc %d--------\n",
                pSync->VidAudDiff, pVidOpt->SyncProc);
        }

        if (pVidInfo->IsPtsValid)
        {
            SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, (pVidInfo->Pts - pVidInfo->DelayTime));
        }

        return HI_FALSE;
    }

    if (!pSync->ScrInitFlag && (-1 != pVidInfo->Pts))
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_SCR, (pVidInfo->Pts - pSync->VidInfo.DelayTime));
        pSync->ScrInitFlag = HI_TRUE;
        pSync->ScrFirstLocalTime = pVidInfo->Pts - pSync->VidInfo.DelayTime;
        pSync->ScrFirstSysTime = SYNC_GetSysTime();
    }

    return HI_TRUE;
}

HI_BOOL SYNC_IsVidBufFundFinish(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo, SYNC_VID_OPT_S *pVidOpt)
{
    if (pSync->BufFundFinish)
    {
        return HI_TRUE;
    }

    SYNC_BufFund(pSync);
    if (pSync->VidOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pVidOpt = pSync->VidOpt;
        HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid BufFund Proc %d--------\n", pVidOpt->SyncProc);
        return HI_FALSE;
    }

    if (pSync->AudFirstCome)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, (pSync->AudInfo.Pts - pSync->AudInfo.BufTime));
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud BufFund First SetLocalTime %d\n", (pSync->AudInfo.Pts - pSync->AudInfo.BufTime));

        if (SYNC_AUD_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
        {
           SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR,  (pSync->AudInfo.Pts - pSync->AudInfo.BufTime));

           HI_INFO_SYNC(">>>>Pcr SetLocalTime %d  by Audpts\n",  (pSync->AudInfo.Pts - pSync->AudInfo.BufTime));
        }
    }

    SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, (pVidInfo->Pts - pSync->VidInfo.DelayTime));

    HI_INFO_VSYNC(SYNC_CHAN_VID, "Vid BufFund First SetLocalTime %d\n", (pVidInfo->Pts - pSync->VidInfo.DelayTime));

    return HI_TRUE;

}

HI_VOID SYNC_SetVidLocalTime(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo)
{
    /* if video localtime has not been initialized or there are three successive video pts,update video localtime */
    if ((HI_TRUE == pVidInfo->IsPtsValid) || ((HI_FALSE == pSync->VidLocalTimeFlag) && (HI_INVALID_PTS != pVidInfo->Pts)) )
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, (pVidInfo->Pts - pSync->VidInfo.DelayTime));

        HI_INFO_VSYNC(SYNC_CHAN_VID, "Vid SetLocalTime %d\n", (pVidInfo->Pts - pSync->VidInfo.DelayTime));
    }

    return;
}

HI_BOOL SYNC_IsVidBufOverFlowDiscFrm(SYNC_S *pSync, SYNC_VID_OPT_S *pVidOpt)
{
    if (!pSync->CrtBufStatus.bOverflowDiscFrm)
    {
        return HI_FALSE;
    }

    /*discard one frame in every VID_SMOOTH_DISCARD_INTERVAL frame*/
    if (!(pSync->VidDisPlayCnt % VID_SMOOTH_DISCARD_INTERVAL))
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "Vid Buf overflow, Discard\n");
    }
    else
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "Vid Buf overflow, Play\n");
    }

    pSync->VidDisPlayCnt++;

    *pVidOpt = pSync->VidOpt;

    HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid Sync Proc %d--------\n", pVidOpt->SyncProc);

    return HI_TRUE;
}

HI_VOID SYNC_VidCheckBufState(SYNC_S *pSync)
{
    /* if vid buf empty, need to change VidOpt.SyncProc to SYNC_PROC_PLAY, then adjust pcr*/
    if (   (SYNC_PROC_DISCARD == pSync->VidOpt.SyncProc)
        && (SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.VidBufState) )
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        if (HI_TRUE == pSync->PcrSyncInfo.PcrAdjustDeltaOK)
        {
            /*adjust pcr to this one which is more behind*/
            if (abs(pSync->VidAudDiff) < VID_LEAD_DISCARD_THRESHOLD)
            {
             //   pSync->PcrSyncInfo.PcrDelta += (pSync->VidAudDiff > 0) ? pSync->PcrSyncInfo.AudPcrDiff : pSync->PcrSyncInfo.VidPcrDiff;
            //    pSync->PcrSyncInfo.PcrAdjustDeltaOK = HI_FALSE;

                HI_INFO_SYNC(">>>>Vid buf low, change PcrDelta %d \n", pSync->PcrSyncInfo.PcrDelta);
            }
        }
    }

    return;
}

HI_VOID SYNC_VidProcBack(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo, SYNC_VID_OPT_S *pVidOpt)
{
    HI_U32 LoopBackTimeCost = 0;

    if ((HI_UNF_SYNC_REF_PCR != SYNC_GetSyncAdjustRefMode(pSync)) || (HI_FALSE == pSync->AudFirstCome))
    {
        pSync->bVidBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        return;
    }

    if ((HI_FALSE == pSync->bAudBackFlag) && (HI_FALSE == pSync->bVidBackFlag) && (HI_FALSE == pSync->bPcrBackFlag))
    {
        return;
    }

    if (HI_INVALID_TIME == pSync->LoopBackStartTime)
    {
        pSync->LoopBackStartTime = SYNC_GetSysTime();
    }

    LoopBackTimeCost = SYNC_GetSysTimeCost(pSync->LoopBackStartTime);
    if (LoopBackTimeCost > PTS_LOOPBACK_TIMEOUT)
    {
        pSync->bAudBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        pSync->bVidBackFlag = HI_FALSE;

        pSync->LoopBackStartTime = HI_INVALID_TIME;

        HI_WARN_SYNC("loopback timeOut, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    /* pcr and vid loopback, then vid need block to waite aud */
    if ((HI_FALSE == pSync->bVidBackFlag) && (HI_TRUE == pSync->bAudBackFlag))
    {
        pVidOpt->SyncProc = SYNC_PROC_PLAY;

        HI_WARN_SYNC("vid play, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    /* pcr and vid loopback, then vid need block to waite aud */
    if ((HI_TRUE == pSync->bVidBackFlag) && (HI_FALSE == pSync->bAudBackFlag))
    {
        pVidOpt->SyncProc = SYNC_PROC_BLOCK;

        HI_WARN_SYNC("vid block, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    /* process back over */
    if ((HI_TRUE == pSync->bPcrBackFlag) && (HI_TRUE == pSync->bVidBackFlag) && (HI_TRUE == pSync->bAudBackFlag))
    {
        pSync->bAudBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        pSync->bVidBackFlag = HI_FALSE;
        pSync->LoopBackStartTime = HI_INVALID_TIME;

        HI_WARN_SYNC("loopback proc finsh, VidAudDiff:%d\n", pSync->VidAudDiff);
        return;
    }

    HI_WARN_SYNC("Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
        pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
    return;
}

HI_VOID SYNC_VidLoopBackCheck(SYNC_S *pSync, SYNC_VID_INFO_S *pVidInfo)
{
    if (   (!pVidInfo->IsPtsValid)
        || (HI_TRUE == pSync->bVidBackFlag)
        || (HI_INVALID_PTS == pSync->VidLastValidPts)
        || (HI_UNF_SYNC_REF_PCR != SYNC_GetSyncAdjustRefMode(pSync)))
    {
        return;
    }

    if (   (pSync->VidLastValidPts > pVidInfo->Pts)
        && (pSync->VidLastValidPts - pVidInfo->Pts > PTS_LOOPBACK_THRESHOLD))
    {
        if ((PCR_TIME_MAX - pSync->VidLastValidPts < 1000) && (pVidInfo->Pts < 1000))
        {
            HI_WARN_SYNC("video warps normally.lp %d,p %d\n", pSync->VidLastValidPts, pVidInfo->Pts);
        }
        else
        {
            pSync->VidLoopBackPts = pSync->VidLastValidPts;
            pSync->bVidBackFlag = HI_TRUE;

            HI_WARN_SYNC("vid loopback! lastpts %d, pts %d\n", pSync->VidLastValidPts, pVidInfo->Pts);
        }
    }
    else if (   (HI_TRUE == pSync->bAudBackFlag)
             && (pVidInfo->Pts < pSync->AudLoopBackPts)
             && (pVidInfo->Pts - pSync->AudLoopBackPts < (-1 * PTS_LOOPBACK_THRESHOLD)))
    {
        if ((PCR_TIME_MAX - pSync->AudLoopBackPts < 1000) && (pVidInfo->Pts < 1000))
        {
            HI_WARN_SYNC("vid warps normally lastpts %d, pts %d\n", pSync->AudLoopBackPts, pVidInfo->Pts);
        }
        else
        {
            pSync->AudLoopBackPts = HI_INVALID_PTS;
            pSync->VidLoopBackPts = HI_INVALID_PTS;
            pSync->bVidBackFlag = HI_TRUE;

            HI_WARN_SYNC("Vid loopback! lastpts %d, pts %d\n", pSync->AudLoopBackPts, pVidInfo->Pts);
        }
    }

    return;
}
HI_VOID SYNC_VidProc(HI_HANDLE hSync, SYNC_VID_INFO_S *pVidInfo, SYNC_VID_OPT_S *pVidOpt)
{
    HI_U32      SyncId = SYNC_GET_ID(hSync);
    SYNC_S     *pSync;
    HI_U32      SysTime;

    SYNC_CHECK_ID_NOT_RET(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    pVidOpt->SyncProc = SYNC_PROC_PLAY;
    pVidOpt->Repeat = 0;
    pVidOpt->Discard = 0;
    pVidOpt->VdecDiscardTime = 0;
    pVidOpt->enTBAdjust = HI_DRV_VIDEO_TB_PLAY;

    /* record the video frame information */
    pSync->VidInfo = *pVidInfo;
    pSync->VidOpt = *pVidOpt;

    SysTime = SYNC_GetSysTime();

    HI_INFO_VSYNC(SYNC_CHAN_VID, "VidInfo SrcPts %-8d,Pts %-8d,FrameTime %d, DelayTime %d,SysTime %d\n",
                                 pVidInfo->SrcPts, pVidInfo->Pts, pVidInfo->FrameTime,pVidInfo->DelayTime,SysTime);

    /*can't do(no effect) smooth adjust when do sync without FRC(frame rate convertion)*/
    if (!pSync->bUseStopRegion)
    {
        pSync->SyncAttr.stSyncStartRegion.bSmoothPlay = HI_FALSE;
        pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay = HI_FALSE;
    }

    /*pcr timeout, we used aud adjust scr*/
    if ((SYNC_SCR_ADJUST_BUTT == pSync->PcrSyncInfo.enPcrAdjust) && (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef))
    {
        if (HI_INVALID_TIME == pSync->PcrSyncInfo.PcrSyncStartSysTime)
        {
            pSync->PcrSyncInfo.PcrSyncStartSysTime = SYNC_GetSysTime();
        }

        if (HI_TRUE == SYNC_CheckPcrTimeout(pSync))
        {
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;

            HI_INFO_SYNC("Pcr is timeout adjust pcr by audpts\n");
        }
    }

    if (0 == pVidInfo->DispTime)
    {
        pSync->VidOpt.SyncProc = SYNC_PROC_DISCARD;
        *pVidOpt = pSync->VidOpt;
        HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid Frc Discard--------\n");
        return;
    }

    SYNC_CheckVidPtsValid(pSync, &pSync->VidInfo);

    SYNC_VidLoopBackCheck(pSync, &pSync->VidInfo);

    /* quick output the first frame*/
    if (pSync->SyncAttr.bQuickOutput && (!pSync->VidFirstPlay))
    {
        pSync->VidFirstPlay = HI_TRUE;
        pSync->VidFirstPlayTime = SYNC_GetSysTime();

        pSync->VidFirstCome = HI_TRUE;
        pSync->VidFirstSysTime = pSync->VidFirstPlayTime;
        pSync->VidFirstPts = pVidInfo->Pts;

        HI_DRV_STAT_Event(STAT_EVENT_FRAMESYNCOK, 0);

        pSync->VidOpt.SyncProc   = SYNC_PROC_QUICKOUTPUT;
        pSync->VidOpt.enTBAdjust = HI_DRV_VIDEO_TB_PLAY;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid QuickOutput Proc %d--------\n", pVidOpt->SyncProc);
        HI_INFO_VSYNC(SYNC_CHAN_VID, "First VidFrame SysTime %d, Pts %d, SrcPts %d\n",
            pSync->VidFirstSysTime, pSync->VidFirstPts, pVidInfo->SrcPts);

        goto OUT;
    }

    /* record the information and the time of the first video frame used to sync*/
    if (!pSync->VidFirstCome)
    {
        pSync->VidFirstCome = HI_TRUE;
        pSync->VidFirstSysTime = SYNC_GetSysTime();
        pSync->VidFirstPts = pVidInfo->Pts;
        pSync->VidSyndAdjust = HI_FALSE;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "First VidFrame SysTime %d, Pts %d, SrcPts %d\n",
            pSync->VidFirstSysTime, pSync->VidFirstPts, pVidInfo->SrcPts);
    }

    if (!pSync->VidFirstValidCome && (-1 != pVidInfo->SrcPts))
    {
        pSync->VidFirstValidCome = HI_TRUE;
        pSync->VidFirstValidPts = pVidInfo->SrcPts;

        if (pSync->AudFirstValidCome)
        {
            pSync->bFirstSyncStateReport = HI_TRUE;
        }

        HI_INFO_VSYNC(SYNC_CHAN_VID, "VidFirstValidPts come: %u\n", pSync->VidFirstValidPts);
    }

    if (SYNC_STATUS_TPLAY == pSync->CrtStatus)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, (pVidInfo->Pts - pSync->VidInfo.DelayTime));
        pSync->VidOpt.SyncProc = SYNC_PROC_PLAY;

        HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid TPLAY--------\n");
        goto OUT;
    }

    /* presync*/
    if (!SYNC_IsVidPreSyncFinish(pSync, &pSync->VidInfo, &pSync->VidOpt))
    {
        goto OUT;
    }

    /* presync finished. cumulate video and audio data to prevent underflow*/
    if (!SYNC_IsVidBufFundFinish(pSync, &pSync->VidInfo, &pSync->VidOpt))
    {
        goto OUT;
    }

    SYNC_SetVidLocalTime(pSync, &pSync->VidInfo);

    SYNC_CalcDiffTime(pSync, SYNC_CHAN_VID);

    SYNC_CheckEvent(pSync, SYNC_CHAN_VID);

    SYNC_CheckTBMatchAdjust(pSync);

    if (SYNC_IsVidBufOverFlowDiscFrm(pSync, &pSync->VidOpt))
    {
        goto OUT;
    }

    if (SYNC_IsSyncRefNone(pSync, SYNC_CHAN_VID))
    {
        goto OUT;
    }

    SYNC_SyncAdjust(pSync, SYNC_CHAN_VID);

    SYNC_VidProcBack(pSync, &pSync->VidInfo, &pSync->VidOpt);

    SYNC_VidCheckBufState(pSync);

    if (SYNC_PROC_PLAY == pVidOpt->SyncProc)
    {
        if (!pSync->VidFirstPlay)
        {
            pSync->VidFirstPlay = HI_TRUE;
            pSync->VidFirstPlayTime = SYNC_GetSysTime();
            HI_DRV_STAT_Event(STAT_EVENT_FRAMESYNCOK, 0);
        }
    }

OUT:
    pSync->VidLastPts = pVidInfo->Pts;
    pSync->VidLastSrcPts = pVidInfo->SrcPts;

    if (pSync->VidInfo.IsPtsValid)
    {
         pSync->VidLastValidPts = pVidInfo->Pts;
    }

    *pVidOpt = pSync->VidOpt;

#ifdef SYNC_DEBUG_DETAIL
    SYNC_ProcDebugInfo(pSync, SYNC_DBG_INFO_LIST_VIDADD, HI_NULL);
#endif

    HI_INFO_VSYNC(SYNC_CHAN_VID, "--------Vid Sync Proc %d ,TBA:%d--------\n",
        pVidOpt->SyncProc, pVidOpt->enTBAdjust);

    return;
}

HI_BOOL SYNC_IsAudPreSyncFinish(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    if (pSync->PreSyncFinish)
    {
        return HI_TRUE;
    }

    SYNC_PreSync(pSync, SYNC_CHAN_AUD);

    if (pSync->AudOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pAudOpt = pSync->AudOpt;

        if (pSync->PreSyncTargetInit)
        {
            HI_INFO_ASYNC(SYNC_CHAN_AUD, "--------Aud PreSync VidAudDiff %d Proc %d Speed %d--------\n",
                pSync->VidAudDiff, pAudOpt->SyncProc, pAudOpt->SpeedAdjust);
        }

        if (pAudInfo->IsPtsValid)
        {
            SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, (pAudInfo->Pts - pAudInfo->BufTime));
        }

        return HI_FALSE;
    }

    /* first set scr */
    if(!pSync->ScrInitFlag && (-1 != pAudInfo->Pts))
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_SCR, (pAudInfo->Pts - pAudInfo->BufTime));
        pSync->ScrInitFlag = HI_TRUE;
        pSync->ScrFirstLocalTime = pAudInfo->Pts - pAudInfo->BufTime;
        pSync->ScrFirstSysTime = SYNC_GetSysTime();
    }

    return HI_TRUE;
}

HI_BOOL SYNC_IsAudBufFundFinish(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    if (pSync->BufFundFinish)
    {
        return HI_TRUE;
    }

    SYNC_BufFund(pSync);
    if (pSync->AudOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pAudOpt = pSync->AudOpt;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "--------Aud BufFund Proc %d Speed %d--------\n",
            pAudOpt->SyncProc, pAudOpt->SpeedAdjust);

        return HI_FALSE;
    }

    SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, (pAudInfo->Pts - pAudInfo->BufTime));

    if (SYNC_AUD_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
    {
       SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, (pAudInfo->Pts - pAudInfo->BufTime ));

       HI_INFO_SYNC("Pcr SetLocalTime %d  by Audpts\n", (pAudInfo->Pts - pAudInfo->BufTime ));
    }

    if (pSync->VidFirstCome)
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_VID, (pSync->VidInfo.Pts - pSync->VidInfo.DelayTime));

        HI_INFO_VSYNC(SYNC_CHAN_VID, "Vid BufFund First SetLocalTime %d\n",
            (pSync->VidInfo.Pts - pSync->VidInfo.DelayTime));
    }

    HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud BufFund First SetLocalTime %d\n", (pAudInfo->Pts - pAudInfo->BufTime));

    return HI_TRUE;
}

HI_BOOL SYNC_IsAudReSyncFinish(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    /*AudDDPMode do not set audio resynchronization*/
    if (pSync->AudDDPMode || !pSync->AudReSync)
    {
        return HI_TRUE;
    }

    SYNC_AudReSync(pSync);
    if (pSync->AudOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pAudOpt = pSync->AudOpt;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "--------Aud ReSync VidAudDiff %d Proc %d Speed %d--------\n",
            pSync->VidAudDiff, pAudOpt->SyncProc, pAudOpt->SpeedAdjust);

        return HI_FALSE;
    }

    return HI_TRUE;
}

HI_BOOL SYNC_IsAudReBufFundFinish(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    if (!pSync->AudReBufFund)
    {
        return HI_TRUE;
    }

    SYNC_AudReBufFund(pSync);
    if (pSync->AudOpt.SyncProc != SYNC_PROC_CONTINUE)
    {
        *pAudOpt = pSync->AudOpt;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "--------Aud ReBufFund Proc %d Speed %d--------\n", pAudOpt->SyncProc, pAudOpt->SpeedAdjust);
        HI_INFO_ASYNC(SYNC_CHAN_AUD, "\n");
        return HI_FALSE;
    }

    if (SYNC_AUD_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
    {
       SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, (pAudInfo->Pts - pAudInfo->BufTime));

       HI_INFO_SYNC("Pcr SetLocalTime %d  by Audpts\n", (pAudInfo->Pts - pAudInfo->BufTime));
    }

    SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, (pAudInfo->Pts - pAudInfo->BufTime));

    HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud ReBufFund First SetLocalTime %d\n", (pAudInfo->Pts - pAudInfo->BufTime));

    return HI_TRUE;
}

HI_VOID SYNC_SetAudLocalTime(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo)
{
    if ((HI_TRUE == pAudInfo->IsPtsValid) || ((HI_FALSE == pSync->AudLocalTimeFlag) && (HI_INVALID_PTS != pAudInfo->Pts)))
    {
        SYNC_SetLocalTime(pSync, SYNC_CHAN_AUD, (pAudInfo->Pts - pAudInfo->BufTime));

        if (SYNC_AUD_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
        {
           SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, (pAudInfo->Pts - pAudInfo->BufTime));

           HI_INFO_SYNC("Pcr SetLocalTime %d  by Audpts\n", (pAudInfo->Pts - pAudInfo->BufTime));
        }

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud SetLocalTime %d\n", (pAudInfo->Pts - pAudInfo->BufTime));
    }

    return;
}

HI_VOID SYNC_AudCheckBufState(SYNC_S *pSync, SYNC_AUD_OPT_S *pAudOpt)
{
    /* If there isn't enough audio data,low the audio output speed*/
    if (SYNC_BUF_STATE_EMPTY == pSync->CrtBufStatus.AudBufState)
    {
        if (SYNC_PROC_DISCARD == pSync->AudOpt.SyncProc)
        {

            if ((HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef)&&(HI_FALSE == pSync->AudFirstPlay))
            {
                return;
            }
            else
            {
                pSync->AudOpt.SyncProc = SYNC_PROC_PLAY;
            }

            if (HI_TRUE == pSync->PcrSyncInfo.PcrAdjustDeltaOK)
            {
                if (abs(pSync->VidAudDiff) < VID_LEAD_DISCARD_THRESHOLD)
                {
                    /*adjust pcr to this one which is more behind*/
           //         pSync->PcrSyncInfo.PcrDelta += (pSync->VidAudDiff > 0) ? pSync->PcrSyncInfo.AudPcrDiff : pSync->PcrSyncInfo.VidPcrDiff;
          //          pSync->PcrSyncInfo.PcrAdjustDeltaOK = HI_FALSE;

                    HI_INFO_SYNC(">>>>Aud buf low, change PcrDelta %d \n", pSync->PcrSyncInfo.PcrDelta);
                }
            }
        }

        if(SYNC_AUD_SPEED_ADJUST_MUTE_REPEAT != pSync->AudOpt.SpeedAdjust)
        {
            pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_DOWN;
        }

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "Aud Buf Low\n");
    }

    return;
}

HI_VOID SYNC_AudProcBack(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    HI_U32 LoopBackTimeCost = 0;

    if ((HI_UNF_SYNC_REF_PCR != SYNC_GetSyncAdjustRefMode(pSync)) || (HI_FALSE == pSync->VidFirstCome))
    {
        pSync->bAudBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        return;
    }

    if ((HI_FALSE == pSync->bAudBackFlag) && (HI_FALSE == pSync->bVidBackFlag) && (HI_FALSE == pSync->bPcrBackFlag))
    {
        return;
    }

    if (HI_INVALID_TIME == pSync->LoopBackStartTime)
    {
        pSync->LoopBackStartTime = SYNC_GetSysTime();
    }

    LoopBackTimeCost = SYNC_GetSysTimeCost(pSync->LoopBackStartTime);
    if (LoopBackTimeCost > PTS_LOOPBACK_TIMEOUT)
    {
        pSync->bAudBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        pSync->bVidBackFlag = HI_FALSE;

        pSync->LoopBackStartTime = HI_INVALID_TIME;

        HI_WARN_SYNC("loopback timeOut, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d \n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    if ((HI_TRUE == pSync->bVidBackFlag) && (HI_FALSE == pSync->bAudBackFlag))
    {
        pAudOpt->SyncProc = SYNC_PROC_PLAY;

        HI_WARN_SYNC("aud play, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    if ((HI_FALSE == pSync->bVidBackFlag) && (HI_TRUE == pSync->bAudBackFlag))
    {
        pAudOpt->SyncProc = SYNC_PROC_BLOCK;

        HI_WARN_SYNC("aud block, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
            pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
        return;
    }

    if ((HI_TRUE == pSync->bPcrBackFlag) && (HI_TRUE == pSync->bVidBackFlag) && (HI_TRUE == pSync->bAudBackFlag))
    {
        pSync->bAudBackFlag = HI_FALSE;
        pSync->bPcrBackFlag = HI_FALSE;
        pSync->bVidBackFlag = HI_FALSE;
        pSync->LoopBackStartTime = HI_INVALID_TIME;

        HI_WARN_SYNC("loopback proc finsh, VidAudDiff:%d\n", pSync->VidAudDiff);
        return;
    }

    HI_WARN_SYNC("aud block, Audloop:%d, Vidloop:%d, Pcrloop:%d, VidAudDiff:%d\n",
        pSync->bAudBackFlag, pSync->bVidBackFlag, pSync->bPcrBackFlag, pSync->VidAudDiff);
    return;
}

HI_VOID SYNC_AudLoopBackCheck(SYNC_S *pSync, SYNC_AUD_INFO_S *pAudInfo)
{
    if (   (!pAudInfo->IsPtsValid)
        || (HI_TRUE == pSync->bAudBackFlag)
        || (HI_INVALID_PTS == pSync->AudLastValidPts)
        || (HI_UNF_SYNC_REF_PCR != SYNC_GetSyncAdjustRefMode(pSync)))
    {
        return;
    }

    if (   (pSync->AudLastValidPts > pAudInfo->Pts)
        && (pSync->AudLastValidPts - pAudInfo->Pts > PTS_LOOPBACK_THRESHOLD))
    {
        if ((PCR_TIME_MAX - pSync->AudLastValidPts < 1000) && (pAudInfo->Pts < 1000))
        {
            HI_WARN_SYNC("audio warps normally.lp %d,p %d\n", pSync->AudLastValidPts, pAudInfo->Pts);
        }
        else
        {
            pSync->AudLoopBackPts = pSync->AudLastValidPts;
            pSync->bAudBackFlag = HI_TRUE;

            HI_WARN_SYNC("Aud loopback! lastpts %d pts %d\n", pSync->AudLastValidPts, pAudInfo->Pts);
        }
    }
    else if (   (HI_TRUE == pSync->bVidBackFlag)
             && (pAudInfo->Pts < pSync->VidLoopBackPts)
             && (pAudInfo->Pts - pSync->VidLoopBackPts < (-1 * PTS_LOOPBACK_THRESHOLD)) )
    {
        if ((PCR_TIME_MAX - pSync->VidLoopBackPts < 1000) && (pAudInfo->Pts < 1000))
        {
            HI_WARN_SYNC("audio warps normally lastpts %d, pts %d\n", pSync->AudLoopBackPts, pAudInfo->Pts);
        }
        else
        {
            pSync->AudLoopBackPts = HI_INVALID_PTS;
            pSync->VidLoopBackPts = HI_INVALID_PTS;
            pSync->bAudBackFlag = HI_TRUE;

            HI_WARN_SYNC("Aud loopback! lastpts %d, pts %d\n", pSync->AudLastValidPts, pAudInfo->Pts);
        }
    }

    return;
}

HI_VOID SYNC_AudProc(HI_HANDLE hSync, SYNC_AUD_INFO_S *pAudInfo, SYNC_AUD_OPT_S *pAudOpt)
{
    HI_U32      SyncId = SYNC_GET_ID(hSync);
    SYNC_S     *pSync;
    HI_U32      SysTime;

    SYNC_CHECK_ID_NOT_RET(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    pAudOpt->SyncProc = SYNC_PROC_PLAY;
    pAudOpt->SpeedAdjust = SYNC_AUD_SPEED_ADJUST_NORMAL;

    /* record audio frame information */
    pSync->AudInfo = *pAudInfo;
    pSync->AudOpt = *pAudOpt;

    SysTime = SYNC_GetSysTime();

    HI_INFO_ASYNC(SYNC_CHAN_AUD, "AudInfo SrcPts %-8d, Pts %-8d, FrameTime %d, BufTime %-4d, FrameNum %d, SysTime %d\n",
        pAudInfo->SrcPts, pAudInfo->Pts, pAudInfo->FrameTime, pAudInfo->BufTime, pAudInfo->FrameNum, SysTime);

    /*can't do(no effect) smooth adjust when do sync without FRC(frame rate convertion)*/
    if (!pSync->bUseStopRegion)
    {
        pSync->SyncAttr.stSyncStartRegion.bSmoothPlay = HI_FALSE;
        pSync->SyncAttr.stSyncNovelRegion.bSmoothPlay = HI_FALSE;
    }

    if ((SYNC_SCR_ADJUST_BUTT == pSync->PcrSyncInfo.enPcrAdjust) && (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef))
    {
        if (HI_INVALID_TIME == pSync->PcrSyncInfo.PcrSyncStartSysTime)
        {
            pSync->PcrSyncInfo.PcrSyncStartSysTime = SYNC_GetSysTime();
        }

        if (HI_TRUE == SYNC_CheckPcrTimeout(pSync))
        {
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;

            HI_INFO_SYNC("Pcr is timeout adjust pcr by audpts\n");
        }
    }

    SYNC_CheckAudPtsValid(pSync, &pSync->AudInfo);

    SYNC_AudLoopBackCheck(pSync, &pSync->AudInfo);

    if (!pSync->AudFirstCome)
    {
        pSync->AudFirstCome = HI_TRUE;
        pSync->AudFirstSysTime = SYNC_GetSysTime();
        pSync->AudFirstPts = pAudInfo->Pts;
        pSync->AudLastPts = pAudInfo->Pts;
        pSync->AudLastBufTime = pAudInfo->BufTime;

        HI_INFO_ASYNC(SYNC_CHAN_AUD, "First AudFrame SysTime %d, Pts %d, SrcPts %d\n",
            pSync->AudFirstSysTime, pSync->AudFirstPts, pAudInfo->SrcPts);
        pSync->VidSyndAdjust = HI_FALSE;
    }

    if (!pSync->AudFirstValidCome && (-1 != pAudInfo->SrcPts))
    {
        pSync->AudFirstValidCome = HI_TRUE;
        pSync->AudFirstValidPts = pAudInfo->SrcPts;

        if (pSync->VidFirstValidCome)
        {
            pSync->bFirstSyncStateReport = HI_TRUE;
        }

        HI_INFO_VSYNC(SYNC_CHAN_VID, "AudFirstValidPts come: %u\n", pSync->AudFirstValidPts);
    }

    if ((pAudInfo->Pts == -1) && (!pSync->AudFirstValidCome) && (HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef))
    {
        pSync->AudOpt.SyncProc = SYNC_PROC_DISCARD;
        pSync->AudOpt.SpeedAdjust = SYNC_AUD_SPEED_ADJUST_NORMAL;

        HI_WARN_SYNC("aud pts -1 ------\n");
        goto OUT;
    }

    if (!SYNC_IsAudPreSyncFinish(pSync, &pSync->AudInfo, &pSync->AudOpt))
    {
        goto OUT;
    }

    if (!SYNC_IsAudBufFundFinish(pSync, &pSync->AudInfo, &pSync->AudOpt))
    {
        goto OUT;
    }

    /* audio resynchronization is needed when change audio track.StopAud->StartAud*/
    if (!SYNC_IsAudReSyncFinish(pSync, &pSync->AudInfo, &pSync->AudOpt))
    {
        goto OUT;
    }

    /* it is needed to accumulate audio data again */
    if (!SYNC_IsAudReBufFundFinish(pSync, &pSync->AudInfo, &pSync->AudOpt))
    {
        goto OUT;
    }

    if ((HI_UNF_SYNC_REF_PCR == pSync->SyncAttr.enSyncRef) && (!pSync->AudFirstPlay))
    {
        if ((HI_FALSE == pSync->VidFirstCome) && (HI_FALSE == SYNC_CheckAudTimeout(pSync)))
        {
            pSync->AudOpt.SyncProc = SYNC_PROC_REPEAT;
            goto OUT;
        }
    }

    SYNC_SetAudLocalTime(pSync, &pSync->AudInfo);

    SYNC_CalcDiffTime(pSync, SYNC_CHAN_AUD);

    SYNC_CheckEvent(pSync, SYNC_CHAN_AUD);

    if (SYNC_IsSyncRefNone(pSync, SYNC_CHAN_AUD))
    {
        goto OUT;
    }

    SYNC_SyncAdjust(pSync, SYNC_CHAN_AUD);

    SYNC_AudProcBack(pSync, &pSync->AudInfo, &pSync->AudOpt);

    SYNC_AudCheckBufState(pSync, &pSync->AudOpt);

    if (SYNC_PROC_PLAY == pAudOpt->SyncProc)
    {
        if (!pSync->AudFirstPlay)
        {
            pSync->AudFirstPlay = HI_TRUE;
            pSync->AudFirstPlayTime = SYNC_GetSysTime();
        }
    }

OUT:
    pSync->AudLastPts = pAudInfo->Pts;
    pSync->AudLastBufTime = pAudInfo->BufTime;

    if (pSync->AudInfo.IsPtsValid)
    {
        pSync->AudLastValidPts = pAudInfo->Pts;
    }

    *pAudOpt = pSync->AudOpt;

    HI_WARN_SYNC("++audproc %d,ap %d,vp %d,diff %d,al %d,pl %d,pts:%d,bt:%d,ft:%d,sys:%d,lp:%d,dlt:%d,lv:%d\n",
    pAudOpt->SyncProc,pSync->PcrSyncInfo.AudPcrDiff,pSync->PcrSyncInfo.VidPcrDiff,
    pSync->VidAudDiff,SYNC_GetLocalTime(pSync, SYNC_CHAN_AUD),SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR),
    pAudInfo->Pts, pAudInfo->BufTime,pAudInfo->FrameTime,SYNC_GetSysTime(),pSync->PcrSyncInfo.PcrLast,
    pSync->PcrSyncInfo.PcrDelta,pSync->VidLastPts);

    HI_INFO_SYNC( "--------Aud Sync Proc %d Speed %d--------\n",
        pAudOpt->SyncProc, pAudOpt->SpeedAdjust);

    return;
}

HI_VOID SYNC_CheckPcrVaild(SYNC_S *pSync, HI_U32 PcrTime, HI_U32 StcTime)
{
    HI_S32 PcrDelta = 0;
    HI_S32 StcDelta = 0;
    HI_S32 PcrStcDiffPercent = 0;
    SYNC_PCRINFO_S *pPcrSyncInfo = &pSync->PcrSyncInfo;

     /* Pts is invalid*/
    if (HI_INVALID_PTS == PcrTime)
    {
        HI_INFO_SYNC("PcrTime == -1 invalid\n");
        pPcrSyncInfo->PcrSeriesCnt = 0;
    }
    /* Pts go back */
    else if (PcrTime < pPcrSyncInfo->PcrLast)
    {
        HI_INFO_SYNC("pcr:%d < pcr Last %d\n", pPcrSyncInfo->PcrLast);
        pPcrSyncInfo->PcrSeriesCnt = 0;
    }
    else
    {
        PcrDelta = PcrTime - pPcrSyncInfo->PcrLast;
        StcDelta = StcTime - pPcrSyncInfo->StcInfo.StcLast;

        PcrStcDiffPercent = (StcDelta == 0) ? 0 : ((PcrDelta - StcDelta) * 100 / StcDelta);

        if (PcrStcDiffPercent >= PCR_STC_DIFF_MAX_PERCENT)
        {
            pPcrSyncInfo->PcrLeadSeriesCnt++;
            pPcrSyncInfo->PcrLagSeriesCnt = 0;
        }
        else if (PcrStcDiffPercent <= -1 * PCR_STC_DIFF_MAX_PERCENT)
        {
            pPcrSyncInfo->PcrLagSeriesCnt++;
            pPcrSyncInfo->PcrLeadSeriesCnt = 0;
        }
        else
        {
            pPcrSyncInfo->PcrLeadSeriesCnt = 0;
            pPcrSyncInfo->PcrLagSeriesCnt = 0;
        }

        /* pcr abnormal serise count more than PCR_ABNORMAL_MAX_SERIES_COUNT then change SyncRef to Aud*/
        if (   (pPcrSyncInfo->PcrLagSeriesCnt >= PCR_ABNORMAL_MAX_SERIES_COUNT)
            || (pPcrSyncInfo->PcrLagSeriesCnt >= PCR_ABNORMAL_MAX_SERIES_COUNT))
        {
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_AUD_ADJUST_SCR;

            HI_INFO_SYNC("pcr is abnormal change syncRef to aud\n");
        }

        /* pcr jump too much */
        if ((PcrDelta > PCR_MAX_DELTA) && (PcrStcDiffPercent >= PCR_STC_DIFF_MAX_PERCENT))
        {
            HI_INFO_SYNC("pcr PcrDelta %d > PCR_MAX_DELTA %d\n", PcrDelta, PCR_MAX_DELTA);
            pPcrSyncInfo->PcrSeriesCnt = 0;
        }
    }

    pPcrSyncInfo->IsPcrValid = HI_FALSE;
    pPcrSyncInfo->PcrSeriesCnt++;

    if (pPcrSyncInfo->PcrSeriesCnt >= PTS_SERIES_COUNT)
    {
        pPcrSyncInfo->IsPcrValid = HI_TRUE;
    }

    HI_INFO_SYNC("pcr IsPtsValid:%d, PcrTime:%d\n", pPcrSyncInfo->IsPcrValid, PcrTime);
    return;
}

HI_VOID SYNC_PcrLoopBackCheck(SYNC_S *pSync, HI_U32 PcrTime)
{
    SYNC_PCRINFO_S *pPcrSyncInfo = &pSync->PcrSyncInfo;

    if (   (!pPcrSyncInfo->IsPcrValid)
        || (HI_TRUE == pSync->bPcrBackFlag)
        || (HI_INVALID_PTS == pPcrSyncInfo->PcrLastValid)
        || (HI_UNF_SYNC_REF_PCR != SYNC_GetSyncAdjustRefMode(pSync)))
    {
        return;
    }

    if (   (pPcrSyncInfo->PcrLastValid > PcrTime)
        && (pPcrSyncInfo->PcrLastValid - PcrTime > PTS_LOOPBACK_THRESHOLD) )
    {
        if ((PCR_TIME_MAX - pPcrSyncInfo->PcrLastValid  < 1000) && (PcrTime < 1000))
        {
            HI_WARN_SYNC("pcr warps normally lastpts %d, pts %d\n", pPcrSyncInfo->PcrLastValid, PcrTime);
        }
        else
        {
            pSync->bPcrBackFlag = HI_TRUE;
            HI_WARN_SYNC("pcr loopback! lastpcr %d, pcr %d\n", pPcrSyncInfo->PcrLastValid, PcrTime);
        }
    }
    else if (   (HI_TRUE == pSync->bVidBackFlag)
             && (HI_TRUE == pSync->bAudBackFlag))
    {
        if (   (abs(PcrTime - pSync->AudLastValidPts) < PTS_LOOPBACK_THRESHOLD)
            || (abs(PcrTime - pSync->VidLastValidPts) < PTS_LOOPBACK_THRESHOLD))
        {
            pSync->bPcrBackFlag = HI_TRUE;
            HI_WARN_SYNC("pcr loopback! lastpcr %d, pcr %d\n", pPcrSyncInfo->PcrLastValid, PcrTime);
        }
    }

    return;
}

HI_VOID SYNC_PcrProc(HI_HANDLE hSync, HI_U64 PcrValue, HI_U64 StcValue)
{
    HI_U32      SyncId = SYNC_GET_ID(hSync);
    SYNC_S     *pSync = HI_NULL;
    HI_U32      PcrDelta = 0;
    HI_U32      SysCostTime = 0;
    HI_U32      PcrTime = 0;
    HI_U32      StcTime = 0;
    HI_U32      PcrLocalTime = 0;
    HI_U64      PcrValueConvert = 0;
    HI_U64      StcValueConvert = 0;

    SYNC_CHECK_ID_NOT_RET(SyncId);

    pSync = g_SyncGlobalState.SyncInfo[SyncId].pSync;

    if (pSync->CrtStatus == SYNC_STATUS_STOP)
    {
        return;
    }

    pSync->CrtPcrValue = PcrValue;
    pSync->CrtStcValue = StcValue;
    pSync->bPcrStcChanged = HI_TRUE;

    /* PcrValue is sample with the freq of 27Mhz, but the sync module need the freq of 1khz
    * so divide 27000 here
    */
    PcrValueConvert = PcrValue;
    do_div(PcrValueConvert, 27000);
    PcrTime = (HI_U32) (PcrValueConvert & 0xffffffff);

    StcValueConvert = StcValue;
    do_div(StcValueConvert, 27000);
    StcTime = (HI_U32) (StcValueConvert & 0xffffffff);

    /* first pcr*/
    if (!pSync->PcrSyncInfo.PcrFirstCome)
    {
        if ((HI_FALSE == SYNC_CheckPcrTimeout(pSync))
            || (HI_INVALID_TIME == pSync->PcrSyncInfo.PcrSyncStartSysTime))
        {
            //fisrt set pcr local  time
            SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, (PcrTime + pSync->PcrSyncInfo.PcrDelta));
            HI_INFO_SYNC(">>>>Pcr First SetLocalTime %d\n", (PcrTime + pSync->PcrSyncInfo.PcrDelta));
            pSync->PcrSyncInfo.PcrAdjustDeltaOK = HI_TRUE;
            pSync->PcrSyncInfo.enPcrAdjust = SYNC_PCR_ADJUST_SCR;
        }

        //second change PcrFirstCome value to HI_TRUE
        pSync->PcrSyncInfo.PcrFirstCome = HI_TRUE;
        pSync->PcrSyncInfo.PcrFirstSysTime = SYNC_GetSysTime();
        pSync->PcrSyncInfo.PcrFirst = PcrTime;
        pSync->PcrSyncInfo.PcrLast = PcrTime;

        return;
    }

    (HI_VOID)SYNC_CheckPcrVaild(pSync, PcrTime, StcTime);
    (HI_VOID)SYNC_PcrLoopBackCheck(pSync, PcrTime);

    pSync->PcrSyncInfo.PcrLast = PcrTime;
    pSync->PcrSyncInfo.StcInfo.StcLast = StcTime;

    if (HI_TRUE == pSync->PcrSyncInfo.IsPcrValid)
    {
        pSync->PcrSyncInfo.PcrLastValid = PcrTime;
    }

#ifdef SYNC_PCR_ADJUST_STC_SUPPORT
    /* stc adjust */
    if (HI_FALSE == pSync->bExternalPllAdjust)
    {
        SYNC_StcAdjust(pSync, PcrValue, StcValue);
    }
    else
    {
        SYNC_StcAdjustbyExternal(pSync, pSync->ExternalPPM);
        pSync->ExternalPPM = SYNC_INVAILDE_PPM;
    }
#endif

    if (HI_TRUE == pSync->PcrSyncInfo.IsPcrValid)
    {
        SysCostTime = SYNC_GetSysTimeCost(pSync->PcrSyncInfo.PcrLastSysTime);

        if (SysCostTime != 0)
        {
            PcrDelta = PcrTime - pSync->PcrSyncInfo.PcrLast;
            pSync->PcrSyncInfo.PcrGradient = PcrDelta * 100 / SysCostTime;
        }

        if (SYNC_PCR_ADJUST_SCR == pSync->PcrSyncInfo.enPcrAdjust)
        {
            PcrLocalTime = SYNC_GetLocalTime(pSync, SYNC_CHAN_PCR);

            /* keep pcr uniformly continuous when Network jitter occurs */
            if(    (abs(PcrLocalTime - PcrTime - pSync->PcrSyncInfo.PcrDelta ) < 300)
                && (pSync->PcrSyncInfo.PcrAdjustDeltaOK))
            {
               return;
            }

            SYNC_SetLocalTime(pSync, SYNC_CHAN_PCR, (PcrTime + pSync->PcrSyncInfo.PcrDelta));

            pSync->PcrSyncInfo.PcrAdjustDeltaOK = HI_TRUE;

            HI_INFO_SYNC(">>>>PcrTime %d, PcrDelta %d \n", PcrTime, pSync->PcrSyncInfo.PcrDelta);

            HI_INFO_SYNC(">>>>Pcr SetLocalTime %d by Pcr\n", (PcrTime + pSync->PcrSyncInfo.PcrDelta));
        }
    }

    return;
}


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
