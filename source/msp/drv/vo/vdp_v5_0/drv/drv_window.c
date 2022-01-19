/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name      : drv_window.h
Version          : Initial Draft
Author          : Hisilicon multimedia software group
Created          : 2012/12/30
Last Modified :
Description   :
Function List :
History          :
******************************************************************************/
#include "drv_win_common.h"
#include "drv_display.h"
#include "drv_window.h"
#include "drv_win_frc.h"
#include "drv_win_policy.h"
#include "drv_win_priv.h"
#include "hi_drv_sys.h"
#include "hi_drv_stat.h"
#include "drv_vdec_ext.h"
#include "drv_disp_hal.h"
#include "drv_disp_alg_service.h"
#include "hi_drv_module.h"
#include "drv_pq_ext.h"
#include "drv_win_alg_ratio.h"

#include "drv_win_hdr.h"
#include "drv_win_share.h"

#include "drv_disp_osal.h"
#include "drv_low_power.h"
#include "drv_async.h"
#include "drv_xdr_adapter.h"
#include "drv_win_alg_pq.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

HI_HANDLE g_hSlaveWin = 0;

DEFINE_SPINLOCK(g_threadIsr_Lock);
DEFINE_SPINLOCK(g_Mask_Lock);
#define WIN_VDEC_RELEASE_MACRO
HI_VOID Win_PQAlg_ISR(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);

/******************************************************************************
    global object
******************************************************************************/
volatile HI_S32 s_s32WindowGlobalFlag = WIN_DEVICE_STATE_CLOSE;
static DISPLAY_WINDOW_S stDispWindow;
static VIRTUAL_WINDOW_S stVirWindow;
WIN_XDR_FRAME_S g_LastframeInfo;
HI_DRV_VIDEO_FRAME_S g_LastReleasedframeInfo;
HI_U32 g_u32FrameAddr = 0;
HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S g_stWinPlayCtrl = {HI_DRV_WIN_PLAYCTRL_BUTT,
                                                        {WIN_FRAME_FORCE_CLOSE, WIN_FRAME_SHUTDOWN_CTRL, WIN_HW_CONFIG_CHECK_CLOSE}};

static VDEC_EXPORT_FUNC_S *g_pstVDPVdecFunc = HI_NULL;
extern S_VDP_REGS_TYPE* pVdpReg;
extern HI_BOOL WinGetResetEvent(WINDOW_S * pstWin, HI_DRV_VIDEO_FRAME_S *pstWinXdrFrm);
extern HI_VOID WinSetResetEvent(WINDOW_S *pstWin, HI_BOOL bReset, HI_DRV_WIN_SWITCH_E enRst);
extern HI_VOID DISP_XDR_IsrProcess_ext(HI_DRV_DISPLAY_E eDisp);
extern HI_VOID  VDP_VP_SetLayerEnable (HI_U32 u32Data, HI_U32 u32bEnable);
extern HI_VOID VDP_QBUFSTATUS_DFX(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_S32 VDP_DRV_StartLogic(HI_U32 u32LayerId);
extern HI_VOID VDP_DRV_CheckOffPart(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_S32 Win_RegenerateLastFrame(HI_DRV_VIDEO_FRAME_S *pstFrame);
extern DISP_NodeListINFOR_S *Win_GetFramePlayInfor(HI_DRV_VIDEO_FRAME_S *pstFrame);
extern HI_S32 WIN_ResetSeperate(HI_HANDLE hWin, HI_DRV_WIN_SWITCH_E enRst);
HI_S32 Win_ReleaseMMZ(WINDOW_S *pWindow);
HI_VOID ALG_ReleaseAlgMMZ(WINDOW_S *pstWin);
extern    HI_DRV_VIDEO_FRAME_S *WinBuf_GetDisplayedFrame(WINDOW_S *pstWin, WB_POOL_S *pstWinBP);
extern HI_DRV_VIDEO_FRAME_S *WinBuf_DeleteDisplayedFrame(WB_POOL_S *pstWinBP,HI_DRV_VIDEO_FRAME_S *pstFrame);
extern HI_S32 WinBuf_ClearBufNode(WINDOW_S *pstWin, WB_POOL_S *pstWinBP, HI_BOOL ResetAll);

HI_VOID Thread_CallbackForWinProcess(WINDOW_S * pstWin,HI_DISP_DISPLAY_INFO_S *pstInfo);
HI_S32 WinQueueFrame(HI_HANDLE hWin, WIN_XDR_FRAME_S *pstWinXdrFrm);

HI_S32 g_s32TestQueueCnt = 5;

static HI_VOID WinGetDefaultInitialPlayCtrl(WIN_CRITICAL_PlayCtrl_S *pstPlayCtrl)
{
    pstPlayCtrl->eWinFrameForceFlag  = g_stWinPlayCtrl.stPlayCtrlInfor.eProgRevise;
    pstPlayCtrl->eSoftAlgCtrl        = g_stWinPlayCtrl.stPlayCtrlInfor.eSoftAlgCtrl;
    pstPlayCtrl->eWinConfigCheck     = g_stWinPlayCtrl.stPlayCtrlInfor.eWinConfigCheck;
    return;
}

static  HI_VOID DFX_WinSetTopPlayCtrl(HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S *pstPlayctrl)
{
    g_stWinPlayCtrl = *pstPlayctrl;
    return;
}

static  HI_VOID DFX_WinGetTopPlayCtrl(HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S *pstPlayctrl)
{
    *pstPlayctrl = g_stWinPlayCtrl;
    return;
}

static  WIN_XDR_FRAME_S* WinGetLastFrameInfor(HI_VOID)
{
    return &g_LastframeInfo;
}

static  HI_VOID WinStoreLastFrameInfor(WIN_XDR_FRAME_S *pstFrameInfor)
{
    memcpy(&g_LastframeInfo, pstFrameInfor, sizeof(WIN_XDR_FRAME_S));
    return;
}

static HI_VOID WinDebug_SetDataFlowPath(HI_WIN_RROC_FOR_DEVELOPER_S *pstWinInfoForDeveloper,
                                        HI_DRV_WIN_DATA_FLOW_E eWinDataFlow)
{
    pstWinInfoForDeveloper->eWinDataFlow = eWinDataFlow;
}

static HI_VOID WinTransferConfigInfoToWinShareInfo(WINDOW_S *pstWin,
        WIN_INFO_S     *pstWinInfo)
{
    DISP_BUF_NODE_S     *pstDispBufNode = HI_NULL;

    pstWinInfo->hWinHandle    = pstWin->u32Index;
    pstWinInfo->bCloseHdr     = pstWin->stUsingAttr.bCloseHdrPath;
    pstWinInfo->u32Zorder   = pstWin->u32Zorder;

    WIN_SHARE_GetFrameColorSpace(pstWinInfo->pCurrentFrame, &pstWinInfo->enInCsc);
    pstWinInfo->pNextFrame = WinBuf_GetNextCfgFrm(&pstWin->stBuffer.stWinBP);

    if (HI_NULL != pstWinInfo->pCurrentFrame)
    {
        pstDispBufNode = container_of((HI_U32 *)pstWinInfo->pCurrentFrame, DISP_BUF_NODE_S, u32Data[0]);
        pstWinInfo->enOutCsc = pstDispBufNode->enOutCs;
        pstWinInfo->enOutType = pstDispBufNode->stHdrInfo.enDispOutType;
    }
    else
    {
        pstWinInfo->enOutCsc  = pstWinInfo->pstDispInfo->eColorSpace;
        pstWinInfo->enOutType = HI_DRV_DISP_TYPE_NORMAL;//pstWinPara->pstDispInfo->stDispHDRAttr.enDispType;
    }

    return;
}

HI_U32 WinGetHDWinNum(HI_VOID)
{
    return stDispWindow.u32WinNumber[HI_DRV_DISPLAY_1];
}

HI_BOOL WinCheckWhetherWbcIsogenyMode(HI_VOID)
{
    if ((stDispWindow.eIsogeny_mode == ISOGENY_WBC_MODE)
        && (stDispWindow.bIsogeny == HI_TRUE))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

HI_BOOL WinCheckWhetherCanToCreate(HI_HANDLE hWin)
{
    WINDOW_S *pstWin =  HI_NULL;

    pstWin = WinGetWindow(hWin);
    if (HI_NULL == pstWin)
    {
        WIN_WARN("WIN is not exist! %#x\n", hWin);
        return HI_FALSE;
    }

    /*in isogeny wbc mode, the sd window is a singleton mode.*/
    if (WinCheckWhetherWbcIsogenyMode()
        && (stDispWindow.u32CurrentHdWindowCounts > 1)
        && (pstWin->enType == HI_DRV_WIN_ACTIVE_SLAVE))
    {
        return  HI_FALSE;
    }

    return HI_TRUE;
}

HI_BOOL WinCheckProcCanBeRemoved(HI_HANDLE hWin)
{
    WINDOW_S *pstWin =  HI_NULL;
    pstWin = WinGetWindow(hWin);

    /*when remove slave window from proc, there exists one hd window.
             since remove proc infor should go first.*/
    if ((HI_NULL != pstWin)
        && WinCheckWhetherWbcIsogenyMode()
        && (stDispWindow.u32CurrentHdWindowCounts != 1)
        && (pstWin->enType == HI_DRV_WIN_ACTIVE_SLAVE))
    {
        return HI_FALSE;
    }
    else
    {
        return HI_TRUE;
    }

    return HI_TRUE;
}

HI_BOOL WinCheckWhetherCanToDestroy(HI_HANDLE hWin)
{
    WINDOW_S *pstWin =  HI_NULL;

    pstWin = WinGetWindow(hWin);
    if (HI_NULL == pstWin)
    {
        return HI_FALSE;
    }

    /*only when  the last master win destroyed, the  slave window can be destroyed.*/
    if (WinCheckWhetherWbcIsogenyMode()
        && (stDispWindow.u32CurrentHdWindowCounts != 0)
        && (pstWin->enType == HI_DRV_WIN_ACTIVE_SLAVE))
    {
        return HI_FALSE;
    }

    return HI_TRUE;
}

HI_BOOL   WinGetRegWinManageStatus(HI_VOID)
{
    return stDispWindow.bWinManageStatus;
}

HI_VOID WinSetRegWinManageStatus(HI_BOOL bRegStatus)
{
    stDispWindow.bWinManageStatus = bRegStatus;
    return ;
}

/* when UNF DEQUEUE func works, this func should be called, retrieve the frames. */
HI_S32 Win_Dequeue_DisplayedFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrm)
{
    HI_S32 nRet = 0;
    WINDOW_S *pstWin = HI_NULL;

    WinCheckWindow(hWin, pstWin);
    nRet = WinBufferGetULSFrame(&pstWin->stBuffer, pstFrm);

    return nRet;
}

VIRTUAL_S *WinGetVirWindow(HI_U32 u32WinIndex)
{
    if (!stVirWindow.u32WinNumber)
    {
        WIN_ERROR("Not found this window!\n");
        return HI_NULL;
    }

    if (WinGetPrefix(u32WinIndex) != WIN_INDEX_PREFIX)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    if (WinGetDispId(u32WinIndex) != WIN_INDEX_VIRTUAL_CHANNEL)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    if ( WinGetId(u32WinIndex) >= WINDOW_MAX_NUMBER)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    return stVirWindow.pstWinArray[WinGetId(u32WinIndex)];
}

HI_VOID ISR_CallbackForDispModeChange(HI_HANDLE hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
HI_VOID ISR_CallbackForWinProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
HI_VOID WinUpdateDispInfo(WINDOW_S *pstWin, HI_DISP_DISPLAY_INFO_S *pstDsipInfo);

HI_VOID Win_UpdateHdFramInfo(WIN_INFO_S *pstLayerPara,WIN_CONFIG_S *pstCfg,HI_BOOL bSecure);

HI_VOID WinDisableSingleLayerRegion(WINDOW_S *pstWin, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WIN_INFO_S stWinInfo = {0};
    HI_SIZE_T irqflag = 0;

    memset(&stWinInfo, 0, sizeof(stWinInfo));

    if (HI_NULL == pstWin || HI_NULL == pstInfo)
    {
        return;
    }

    if (pstWin->u32VideoLayer != VDP_LAYER_VID_BUTT)
    {
        stWinInfo.bRegionEnable = HI_FALSE;
        stWinInfo.u32LayerId    = pstWin->u32VideoLayer;
        stWinInfo.u32RegionNo  = pstWin->u32VideoRegionNo;
        stWinInfo.pstDispInfo   = (HI_DISP_DISPLAY_INFO_S *) & (pstInfo->stDispInfo);
        stWinInfo.enOutCsc = pstInfo->stDispInfo.eColorSpace;

        stWinInfo.stIn = pstInfo->stDispInfo.stFmtResolution;
        stWinInfo.stDisp  = pstInfo->stDispInfo.stFmtResolution;
        stWinInfo.stVideo = pstInfo->stDispInfo.stFmtResolution;
        stWinInfo.u32Alpha = pstWin->stCfg.u32Alpha;
        stWinInfo.u32AllAlpha = pstInfo->stDispInfo.u32Alpha;

        Win_UpdateHdFramInfo(&stWinInfo, &pstWin->stCfg, HI_FALSE);

        WinTransferConfigInfoToWinShareInfo(pstWin, &stWinInfo);
        spin_lock_irqsave(&g_Mask_Lock, irqflag);

        if (VDP_LAYER_SD0 == pstWin->u32VideoLayer)
        {
            pstWin->stVLayerFunc.PF_SetSdLayerCfg(stWinInfo.u32LayerId, &stWinInfo);
        }
        else if ((VDP_LAYER_VID0 == pstWin->u32VideoLayer)
                 || (VDP_LAYER_VID1 == pstWin->u32VideoLayer))
        {
            WIN_SHARE_SetWinInfo(&stWinInfo);
        }
        spin_unlock_irqrestore(&g_Mask_Lock, irqflag);
    }

    return;
}

HI_S32 Win_WaitForLayerClosed(WINDOW_S *pstWin)
{
    HI_U32 u32LeftTime = 0,  u32CircleTime = 0;
    HI_DRV_DISP_CALLBACK_INFO_S stInfo;
    HI_SIZE_T irqflag = 0;

    if ((HI_NULL == pstWin) )
    {
        WIN_ERROR("pstWin NULL\n");
        return HI_ERR_VO_NULL_PTR;
    }

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    /*Config regitster to close  hd layer.*/
    memset((HI_VOID *)&stInfo, 0, sizeof(stInfo));
    (HI_VOID)DISP_GetDisplayInfo(pstWin->enDisp, &stInfo.stDispInfo);

    WinDisableSingleLayerRegion(pstWin, &stInfo);
    pstWin->u32VideoLayer = VDP_LAYER_VID_BUTT;

#ifdef HI_VDP_VER_YDJC
    ADAPTER_CloseV0V1Layer();
    (HI_VOID)DISP_GetVbiTimeInfo(pstWin->enDisp, &u32CircleTime, &u32LeftTime);
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);

    msleep(u32LeftTime);

#else

    (HI_VOID)DISP_GetVbiTimeInfo(pstWin->enDisp, &u32CircleTime, &u32LeftTime);
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    msleep(u32CircleTime + u32LeftTime);
#endif
    return  HI_SUCCESS;
}



HI_VOID WinDisableAllLayerRegion(HI_DRV_DISPLAY_E enDisp, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_U32 i = 0;
    WINDOW_S *pstWin = HI_NULL;

    /*because video-window remmaping, so make a status resetting.*/
    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        pstWin = stDispWindow.pstWinArray[enDisp][i];
        if (pstWin)
        {
            WinDisableSingleLayerRegion(pstWin, pstInfo);
            pstWin->u32VideoLayer = VDP_LAYER_VID_BUTT;
        }
    }

    return;
}

HI_VOID WinLoadNewMapping(HI_DRV_DISPLAY_E enDisp)
{
    HI_U32 i = 0;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (stDispWindow.pstWinArray[enDisp][i]
            && (stDispWindow.pstWinArray[enDisp][i]->bEnable))
        {
            stDispWindow.pstWinArray[enDisp][i]->u32VideoLayer
                = stDispWindow.pstWinArray[enDisp][i]->u32VideoLayerNew;

            stDispWindow.pstWinArray[enDisp][i]->u32VideoRegionNo
                = stDispWindow.pstWinArray[enDisp][i]->u32VideoRegionNoNew;
        }
        else if (stDispWindow.pstWinArray[enDisp][i]
                 && (!stDispWindow.pstWinArray[enDisp][i]->bEnable))
        {
            stDispWindow.pstWinArray[enDisp][i]->u32VideoLayer
                = VDP_LAYER_VID_BUTT;
            stDispWindow.pstWinArray[enDisp][i]->u32VideoRegionNo
                = VDP_LAYER_VID_BUTT;
        }

        if (stDispWindow.pstWinArray[enDisp][i])
        {
            stDispWindow.pstWinArray[enDisp][i]->bEnable_Using = stDispWindow.pstWinArray[enDisp][i]->bEnable;
        }
    }

    return ;
}

HI_VOID Win_UpdateVideoLayerSetting(HI_DRV_DISPLAY_E enDstDisp,
                                    const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_U32 i = 0;
    HI_U32 u32LayerEnRecorder = 0;
    WINDOW_S *pWin = HI_NULL;

    /*judge whether the internal hareware-cfg is changed*/
    if (atomic_read(&stDispWindow.bWindowSytemUpdate[enDstDisp]))
    {
        /*video-window remmaping may occurs, so make a status resetting.
                 *and load new mapping.*/
        //WinDisableAllLayerRegion(enDstDisp, pstInfo);
        WinLoadNewMapping(enDstDisp);

        /*to adjust the order, becasue win-layermapping changed.*/
        for (i = 0; i < WINDOW_MAX_NUMBER; i++)
        {
            /*check wether the layer is set  or not.*/
            pWin = stDispWindow.pstWinArray[enDstDisp][i];
            if (HI_NULL == pWin)
            {
                continue;
            }

            atomic_set(&pWin->stCfg.bNewAttrFlag, 1);
            pWin->bDispInfoChange = HI_TRUE;

            if (pWin->u32VideoLayer == VDP_LAYER_VID_BUTT)
            {
                continue;
            }

            if (!pWin->stVLayerFunc.PF_CheckLayerInit(pWin->u32VideoLayer))
            {
                (HI_VOID)pWin->stVLayerFunc.PF_InitialLayer(pWin->u32VideoLayer);
            }

            if ((pWin->stWinLayerOpt.bEffective)
                && (pWin->stWinLayerOpt.layerOptType == LAYER_OPT_ZORDER_ADJUST))
            {
                if (((HI_U32)pWin->stWinLayerOpt.enLayerOpt) == HI_DRV_DISP_ZORDER_MOVETOP)
                {
                    pWin->stVLayerFunc.PF_MovTop(pWin->u32VideoLayer);
                }
                else if (((HI_U32)pWin->stWinLayerOpt.enLayerOpt) == HI_DRV_DISP_ZORDER_MOVEBOTTOM)
                {
                    pWin->stVLayerFunc.PF_MovBottom(pWin->u32VideoLayer);
                }

                /*clear the flag, to avoid taking effect next period.*/
                pWin->stWinLayerOpt.bEffective = HI_FALSE;
                pWin->stWinLayerOpt.layerOptType = LAYER_OPT_BUTT;
                pWin->stWinLayerOpt.enLayerOpt = HI_DRV_DISP_ZORDER_BUTT;
            }

            u32LayerEnRecorder |= (1 << (pWin->u32VideoLayer));

            /* Low power strategy: Dolby hdr win mode,will occupy two video layers. */
            if (HI_DRV_WINDOW_MODE_DOLBY == pWin->enWinMode)
            {
                u32LayerEnRecorder |= (1 << VDP_LAYER_VID0);
                u32LayerEnRecorder |= (1 << VDP_LAYER_VID1);
            }
        }

        atomic_set(&stDispWindow.bWindowSytemUpdate[enDstDisp], 0);
        DISP_OSAL_SendEvent(&stDispWindow.stWinSytemQueueEvent, EVENT_WIN_SYSTEM_UP_COMPLET);

        /* Update low power PIP strategy */
        (HI_VOID)LowPower_OperatePipLayer(u32LayerEnRecorder);
    }

    return ;
}


HI_VOID ISR_CallbackForWinManage(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_DRV_DISPLAY_E enDstDisp = (HI_DRV_DISPLAY_E)hDst;
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    Win_UpdateVideoLayerSetting(enDstDisp, pstInfo);
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;
}

HI_S32 WinRegWinManageCallback(HI_DRV_DISPLAY_E enDisp)
{
    HI_DRV_DISP_CALLBACK_S stCB;
    HI_S32 nRet = HI_SUCCESS;

    DispCheckID(enDisp);

    stCB.hDst  = (HI_VOID *)(unsigned long)enDisp;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;
    stCB.pfDISP_Callback = ISR_CallbackForWinManage;

    nRet = DISP_RegCallback(enDisp, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
    if (nRet)
    {
        WIN_ERROR("WIN register callback failed !\n");
    }

    return nRet;
}

HI_S32 WinUnRegWinManageCallback(HI_DRV_DISPLAY_E enDisp)
{
    HI_DRV_DISP_CALLBACK_S stCB;
    HI_S32 nRet = HI_SUCCESS;

    DispCheckID(enDisp);

    stCB.hDst  = (HI_VOID *)(unsigned long)enDisp;
    stCB.pfDISP_Callback = ISR_CallbackForWinManage;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;

    nRet = DISP_UnRegCallback(enDisp, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
    if (nRet)
    {
        WIN_ERROR("WIN unregister callback failed!\n");
    }

    return nRet;
}

HI_S32 WIN_DestroyStillFrame(HI_DRV_VIDEO_FRAME_S *pstReleaseFrame)
{
    HI_U32 i;
    WIN_RELEASE_FRM_S *pstWinRelFrame = &stDispWindow.stWinRelFrame;

    for (i = 0; i < MAX_RELEASE_NO; i++)
    {
        if (!pstWinRelFrame->pstNeedRelFrmNode[i] )
        {
            pstWinRelFrame->pstNeedRelFrmNode[i] = pstReleaseFrame;
            pstWinRelFrame->enThreadEvent = EVENT_RELEASE;
            wake_up(&pstWinRelFrame->stWaitQueHead);
            return HI_SUCCESS;
        }
    }

    WIN_ERROR("Release still frame failed ,buff is full!\n");
    return HI_FAILURE;
}

HI_S32 WinReleaseFrameThreadProcess(HI_VOID *pArg)
{
    HI_U32 i;
    WIN_RELEASE_FRM_S *pstWinRelFrame = pArg;

    /*if stop refush release frame buffer*/
    while (!kthread_should_stop() )
    {
        for ( i = 0; i < MAX_RELEASE_NO; i++)
        {
            if (pstWinRelFrame->pstNeedRelFrmNode[i])
            {
                if (HI_DRV_FRAME_VDP_ALLOCATE_STILL == pstWinRelFrame->pstNeedRelFrmNode[i]->u32StillFrame)
                {
                    DestroyStillFrame(pstWinRelFrame->pstNeedRelFrmNode[i]);
                    pstWinRelFrame->pstNeedRelFrmNode[i] = HI_NULL;
                }
            }
        }

        WinBuf_RetAllMemRefCnts();

        pstWinRelFrame->enThreadEvent = EVENT_BUTT;
        wait_event_timeout(pstWinRelFrame->stWaitQueHead, (EVENT_RELEASE == pstWinRelFrame->enThreadEvent), 5);
    }

    WinBuf_RetAllMemRefCnts();
    return HI_SUCCESS;
}

HI_S32 WinCreatReleaseFrameThread(HI_VOID )
{
    WIN_RELEASE_FRM_S *pstWinRelFrame = &stDispWindow.stWinRelFrame;

    memset(pstWinRelFrame, 0, sizeof(WIN_RELEASE_FRM_S));
    pstWinRelFrame->hThread =
        kthread_create(WinReleaseFrameThreadProcess, (HI_VOID *)(&stDispWindow.stWinRelFrame), "HI_WIN_ReleaseFrameProcess");

    init_waitqueue_head( &(pstWinRelFrame->stWaitQueHead) );
    if (IS_ERR(pstWinRelFrame->hThread))
    {
        WIN_FATAL("Can not create thread.\n");
        return HI_ERR_VO_CREATE_ERR;
    }

    wake_up_process(pstWinRelFrame->hThread);
    return HI_SUCCESS;
}

HI_S32 WinDestroyReleaseFrameThread(HI_VOID )
{
    HI_S32 s32Ret;
    HI_S32 s32Times = 0;
    WIN_RELEASE_FRM_S *pstWinRelFrame = &stDispWindow.stWinRelFrame;

    /*reflush release buffer */
    pstWinRelFrame->enThreadEvent = EVENT_RELEASE;
    wake_up(&pstWinRelFrame->stWaitQueHead);

    for (s32Times = 0 ; s32Times < 100; s32Times++)
    {
        if (EVENT_BUTT == pstWinRelFrame->enThreadEvent)
        {
            pstWinRelFrame->enThreadEvent = EVENT_RELEASE;
            s32Ret = kthread_stop(pstWinRelFrame->hThread);

            if (s32Ret != HI_SUCCESS)
            {
                WIN_FATAL("Destory Thread Error.\n");
            }
            return HI_SUCCESS;
        }
        msleep(10);
    }

    return HI_FAILURE;
}

HI_S32 WIN_Init(HI_VOID)
{
    HI_BOOL bDispInitFlag;
    HI_S32 s32Ret;
    DISP_INTF_OPERATION_S stFunction = {0};

    if (WIN_DEVICE_STATE_CLOSE != s_s32WindowGlobalFlag)
    {
        WIN_INFO("VO has been inited!\n");
        return HI_SUCCESS;
    }

    DISP_GetInitFlag(&bDispInitFlag);
    if (HI_TRUE != bDispInitFlag)
    {
        WIN_ERROR("Display is not inited!\n");
        return HI_ERR_VO_DEPEND_DEVICE_NOT_READY;
    }

    DISP_MEMSET(&stDispWindow, 0, sizeof(DISPLAY_WINDOW_S));
    VideoLayer_Init();

    (HI_VOID)DISP_HAL_GetOperation(&stFunction);
    if (HI_NULL == stFunction.PF_GetIsogenyMode)
    {
        WIN_ERROR("PF_GetIsogenyMode is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }
    (HI_VOID)stFunction.PF_GetIsogenyMode(&stDispWindow.eIsogeny_mode);

    /*first, judge whether iso-geny or not.*/
    if (DISP_IsFollowed(HI_DRV_DISPLAY_0)
        || DISP_IsFollowed(HI_DRV_DISPLAY_1))
    {
        stDispWindow.bIsogeny = HI_TRUE;
    }
    else
    {
        stDispWindow.bIsogeny = HI_FALSE;
    }
    DISP_OSAL_InitEvent(&stDispWindow.stWinSytemQueueEvent, EVENT_WIN_NOTHING);
#ifdef VDP_ISOGENY_SUPPORT
    if ( HI_TRUE == WinCheckWhetherWbcIsogenyMode())
    {
        s32Ret = ISOGBNY_Init();
        if ( HI_SUCCESS != s32Ret )
        {
            WIN_ERROR("WIN ISOGBNY_Init failed in %s!\n", __FUNCTION__);
            return HI_ERR_VO_CREATE_ERR;
        }
    }
#endif

    DISP_MEMSET(&stVirWindow, 0, sizeof(VIRTUAL_WINDOW_S));
    s32Ret = WinCreatReleaseFrameThread();
    if (HI_SUCCESS != s32Ret)
    {
        WIN_ERROR("win Create Release Frame Thread failed!\n");
        return HI_ERR_VO_MALLOC_FAILED;
    }


    /* Low power init */
    if (HI_SUCCESS != LowPower_Init())
    {
        WIN_ERROR("Low power is not inited!\n");
        return HI_ERR_VO_DEPEND_DEVICE_NOT_READY;
    }

    g_pstVDPVdecFunc = HI_NULL;
    s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VDEC, (HI_VOID **) & (g_pstVDPVdecFunc));
    if (HI_SUCCESS != s32Ret || g_pstVDPVdecFunc == HI_NULL)
    {
        g_pstVDPVdecFunc = HI_NULL;
        WIN_ERROR("get vdec func error.\n");
        return HI_FAILURE;
    }
    Win_PQAlgInit();
    Win_PQAlgEnable(HI_TRUE);
    Win_PQAlgStart();

    s_s32WindowGlobalFlag = WIN_DEVICE_STATE_OPEN;

    return HI_SUCCESS;
}

HI_S32 WIN_DeInit(HI_VOID)
{
    HI_S32 i, j, s32Ret;

    if (WIN_DEVICE_STATE_CLOSE == s_s32WindowGlobalFlag)
    {
        WIN_INFO("VO is not inited!\n");
        return HI_SUCCESS;
    }
    Win_PQAlgDeInit();

    /*close all the windows, since slave channel is not visible to  upper level
        * all the things done by lower driver.
        */
    for (i = HI_DRV_DISPLAY_1; i < HI_DRV_DISPLAY_BUTT; i++)
    {
        stDispWindow.u32WinNumber[i] = 0;

        for (j = 0; j < WINDOW_MAX_NUMBER; j++)
        {
            if (stDispWindow.pstWinArray[i][j])
            {
                (HI_VOID)WIN_Destroy(stDispWindow.pstWinArray[i][j]->u32Index);
                stDispWindow.pstWinArray[i][j] = HI_NULL;
            }
        }
    }

    stVirWindow.u32WinNumber = 0;

    if (WinGetRegWinManageStatus())
    {
        WinUnRegWinManageCallback(HI_DRV_DISPLAY_1);
        WinUnRegWinManageCallback(HI_DRV_DISPLAY_0);
        WinSetRegWinManageStatus(HI_FALSE);
    }

    s32Ret = WinDestroyReleaseFrameThread();
    if (HI_SUCCESS != s32Ret)
    {
        WIN_ERROR("win Destroy Release Frame Thread failed!\n");
    }

#ifdef VDP_ISOGENY_SUPPORT

    if ( HI_TRUE == WinCheckWhetherWbcIsogenyMode())
    {
        s32Ret = ISOGBNY_DeInit();
        if ( HI_SUCCESS != s32Ret )
        {
            WIN_ERROR("WIN ISOGBNY_DeInit failed in %s!\n", __FUNCTION__);
            return HI_ERR_VO_CREATE_ERR;
        }
    }

#endif

    VideoLayer_DeInit();

    /* Low power deinit */
    if (HI_SUCCESS != LowPower_DeInit())
    {
        return HI_FAILURE;
    }
    VDP_ASYNC_DeInit();

    s_s32WindowGlobalFlag = WIN_DEVICE_STATE_CLOSE;

    WIN_INFO("VO has been DEinited!\n");
    return HI_SUCCESS;
}

WINDOW_S *WinGetWindow(HI_U32 u32WinIndex);

HI_S32 WIN_Suspend(HI_VOID)
{
    HI_U32 i = 0;
    WINDOW_S *pstWin = HI_NULL;

    if (WIN_DEVICE_STATE_OPEN != s_s32WindowGlobalFlag)
    {
        WIN_WARN("WIN is not inited or suspended in %s!\n", __FUNCTION__);
        return HI_ERR_VO_NO_INIT;
    }

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
        if (HI_NULL != pstWin)
        {
            WinSetResetEvent(pstWin, HI_TRUE, HI_DRV_WIN_SWITCH_BLACK);
            if (pstWin->stVLayerFunc.PF_ResetHwBuf)
            {
                (HI_VOID)pstWin->stVLayerFunc.PF_ResetHwBuf(pstWin->u32VideoLayer,
                                                            HI_TRUE,
                                                            HI_DRV_WIN_SWITCH_BLACK);
            }
        }
    }

    s_s32WindowGlobalFlag = WIN_DEVICE_STATE_SUSPEND;

    return HI_SUCCESS;
}

HI_S32 WIN_Resume(HI_VOID)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_U32 i = 0;

    if (s_s32WindowGlobalFlag == WIN_DEVICE_STATE_SUSPEND)
    {
        VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();

        s_s32WindowGlobalFlag = WIN_DEVICE_STATE_OPEN;
        if (pF)
        {
            pF->PF_SetAllLayerDefault();
        }
    }

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
        if (HI_NULL != pstWin)
        {
            pstWin->stPlayInfor.bUndergoSuspend = HI_TRUE;
            pstWin->stPlayInfor.bUndergoSuspend_ForQueue = HI_TRUE;
        }
    }

    return HI_SUCCESS;
}


HI_BOOL WinCheckDolbyMode(HI_VOID)
{
    HI_S32 s32Index = 0;
    HI_U32 u32HdWinNum = 0;
    HI_BOOL bExistDolbyMode = HI_FALSE;
    WINDOW_S *pstWin = HI_NULL;

    u32HdWinNum = WinGetHDWinNum();

    if (u32HdWinNum != 1)
    {
        bExistDolbyMode = HI_FALSE;
    }
    else
    {
        for (s32Index = 0; s32Index < WINDOW_MAX_NUMBER; s32Index++)
        {
            pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][s32Index];
            if ((HI_NULL != pstWin)
                && (HI_DRV_WINDOW_MODE_DOLBY == pstWin->enWinMode))
            {
                bExistDolbyMode = HI_TRUE;
                break;
            }
        }
    }

    return bExistDolbyMode;
}

HI_S32 WinTestAddWindow(HI_DRV_DISPLAY_E  enDisp)
{
    HI_U32 u32WinNumber = 0;

    if (enDisp >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_ERROR("Invalid Disp = 0x%x\n", enDisp);
        return HI_ERR_VO_INVALID_PARA;
    }
    if (WinCheckDolbyMode())
    {
        HI_ERR_WIN("Exist HDR mode window!Can not create new window anymore!\n");
        return HI_ERR_VO_CREATE_ERR;
    }

#ifdef HI_GFX_USE_G3
    if (!DISP_IsSameSource(enDisp) && HI_DRV_DISPLAY_0 == enDisp)
    {
        if (stDispWindow.u32WinNumber[HI_DRV_DISPLAY_0] >= 1)
        {
            return HI_ERR_VO_WIN_UNSUPPORT;
        }
    }
#endif

    if (stDispWindow.eIsogeny_mode == ISOGENY_WBC_MODE)
    {
        u32WinNumber = (enDisp == HI_DRV_DISPLAY_1) ? WINDOW_MAX_NUMBER : 1;
    }
    else
    {
        u32WinNumber = WINDOW_MAX_NUMBER;
    }

    if ( stDispWindow.u32WinNumber[enDisp] < u32WinNumber)
    {
        return HI_SUCCESS;
    }
    else
    {
        return HI_ERR_VO_INVALID_OPT;
    }
}

HI_U32 WinGetPrefix(HI_U32 u32WinIndex)
{
    return (HI_U32)(u32WinIndex & WIN_INDEX_PREFIX_MASK);
}

HI_U32 WinGetDispId(HI_U32 u32WinIndex)
{
    return (HI_U32)((u32WinIndex >> WIN_INDEX_DISPID_SHIFT_NUMBER) & WIN_INDEX_DISPID_MASK);
}

HI_U32 WinGetId(HI_U32 u32WinIndex)
{
    return (HI_U32)(u32WinIndex & WINDOW_INDEX_NUMBER_MASK);
}

HI_U32 WinMakeVirIndex(HI_U32 u32WinIndex)
{
    /*
     *    0x12               34                         56                78
     *         WIN_INDEX_PREFIX  WIN_INDEX_VIRTUAL_CHANNEL   u32WinIndex
     *
     */
    return (HI_U32)(   WIN_INDEX_PREFIX
                       | ( ( WIN_INDEX_VIRTUAL_CHANNEL & WIN_INDEX_DISPID_MASK) \
                           << WIN_INDEX_DISPID_SHIFT_NUMBER
                         )
                       | (u32WinIndex & WINDOW_INDEX_NUMBER_MASK)
                   );
}

HI_U32 WinMakeIndex(HI_DRV_DISPLAY_E enDisp, HI_U32 u32WinIndex)
{
    return (HI_U32)(   (WIN_INDEX_PREFIX)
                       | ( ( (HI_U32)enDisp & WIN_INDEX_DISPID_MASK) \
                           << WIN_INDEX_DISPID_SHIFT_NUMBER
                         )
                       | (u32WinIndex & WINDOW_INDEX_NUMBER_MASK)
                   );
}

HI_U32 WinGetIndex(HI_HANDLE hWin, HI_DRV_DISPLAY_E *enDisp, HI_U32 *u32WinIndex)
{

    *enDisp = (hWin & 0xff00) >> WIN_INDEX_DISPID_SHIFT_NUMBER;
    *u32WinIndex = hWin & 0xff;

    return HI_SUCCESS;
}

HI_S32 WinAddVirWindow(VIRTUAL_S *pstWin)
{
    HI_S32 i;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (!stVirWindow.pstWinArray[i])
        {
            pstWin->u32Index =    WinMakeVirIndex((HI_U32)i);
            stVirWindow.pstWinArray[i] = pstWin;
            stVirWindow.u32WinNumber++;

            return HI_SUCCESS;
        }
    }
    return HI_ERR_VO_CREATE_ERR;
}
HI_S32 WinDelVirWindow(HI_U32 u32WinIndex)
{
    if ( WinGetPrefix(u32WinIndex) != WIN_INDEX_PREFIX)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_FAILURE;
    }

    if ( WinGetDispId(u32WinIndex) != WIN_INDEX_VIRTUAL_CHANNEL)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_FAILURE;
    }

    if ( WinGetId(u32WinIndex) >= WINDOW_MAX_NUMBER)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_FAILURE;
    }

    if (!stVirWindow.u32WinNumber)
    {
        WIN_ERROR("Not found this window!\n");
        return HI_FAILURE;
    }

    if (stVirWindow.pstWinArray[WinGetId(u32WinIndex)])
    {
        stVirWindow.pstWinArray[WinGetId(u32WinIndex)] = HI_NULL;
        stVirWindow.u32WinNumber--;
    }
    else
    {
        WIN_ERROR("Not found this window!\n");
    }

    return HI_SUCCESS;
}


HI_S32 WinAddWindow(HI_DRV_DISPLAY_E enDisp, WINDOW_S *pstWin)
{
    HI_S32 i;

    if (enDisp >= HI_DRV_DISPLAY_BUTT)
    {
        return HI_ERR_VO_CREATE_ERR;
    }

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (!stDispWindow.pstWinArray[(HI_U32)enDisp][i])
        {
            pstWin->u32Index =    WinMakeIndex(enDisp, (HI_U32)i);

            stDispWindow.pstWinArray[(HI_U32)enDisp][i] = pstWin;
            stDispWindow.u32WinNumber[(HI_U32)enDisp]++;

            return HI_SUCCESS;
        }
    }

    return HI_ERR_VO_CREATE_ERR;
}



HI_S32 WinDelWindow(HI_U32 u32WinIndex)
{
    if ( WinGetPrefix(u32WinIndex) != WIN_INDEX_PREFIX)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_ERR_VO_WIN_NOT_EXIST;
    }

    if (  WinGetDispId(u32WinIndex) >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_ERR_VO_WIN_NOT_EXIST;
    }

    if ( WinGetId(u32WinIndex) >= WINDOW_MAX_NUMBER)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_ERR_VO_WIN_NOT_EXIST;
    }

    if (!stDispWindow.u32WinNumber[WinGetDispId(u32WinIndex)])
    {
        WIN_ERROR("Not found this window!\n");
        return HI_ERR_VO_WIN_NOT_EXIST;
    }

    if (stDispWindow.pstWinArray[WinGetDispId(u32WinIndex)][WinGetId(u32WinIndex)])
    {
        stDispWindow.pstWinArray[WinGetDispId(u32WinIndex)][WinGetId(u32WinIndex)] = HI_NULL;
        stDispWindow.u32WinNumber[WinGetDispId(u32WinIndex)]--;
    }
    else
    {
        WIN_ERROR("Not found this window!\n");
    }

    return HI_SUCCESS;
}

WINDOW_S *WinGetWindow(HI_U32 u32WinIndex)
{
    if ( WinGetPrefix(u32WinIndex) != WIN_INDEX_PREFIX)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    if (  WinGetDispId(u32WinIndex) >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_WARN("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    if (!stDispWindow.u32WinNumber[WinGetDispId(u32WinIndex)])
    {
        WIN_WARN("Not found this window!\n");
        return HI_NULL;
    }
    if ( WinGetId(u32WinIndex) >= WINDOW_MAX_NUMBER)
    {
        WIN_ERROR("Invalid window index = 0x%x\n", u32WinIndex);
        return HI_NULL;
    }

    return stDispWindow.pstWinArray[WinGetDispId(u32WinIndex)][WinGetId(u32WinIndex)];
}



/******************************************************************************
    internal function
******************************************************************************/

HI_VOID window_revise(HI_RECT_S *pstToBeRevisedRect_tmp,
                      const HI_RECT_S *ptmp_virtscreen)
{
    /*give a basic    process of width and height.*/
    if (pstToBeRevisedRect_tmp->s32Width < WIN_OUTRECT_MIN_WIDTH)
    {
        pstToBeRevisedRect_tmp->s32Width = WIN_OUTRECT_MIN_WIDTH;
    }

    /*here we delete the width max branch, because we support tc 2-screen,
        *even 3-screen display.
        * here we do not make a limit,  all the behavior depends on the zme performance.
        */

    if (pstToBeRevisedRect_tmp->s32Height < WIN_OUTRECT_MIN_HEIGHT)
    {
        pstToBeRevisedRect_tmp->s32Height = WIN_OUTRECT_MIN_HEIGHT;
    }

    return ;
}

/*previously, we do division first, then do multiplication
 *so we lose precision. now we invert the  order.
 */
static HI_S32 Win_Caculate(HI_S32 ratioA, HI_S32 ratioB, HI_S32 virtualValue, HI_S32 *s32CalcReult)
{
    if (ratioB)
    {
        *s32CalcReult = ((virtualValue * ratioA) * 100) / ratioB;
        return HI_SUCCESS;
    }
    else
    {
        WIN_ERROR("denominator is zero\n");
        return HI_FAILURE;
    }
}

/*this func is for both graphics and video    virtual screen deal, it's a common function.*/
HI_S32 WinOutRectSizeConversion(const HI_RECT_S *pstCanvas,
                                const HI_DRV_DISP_OFFSET_S *pstOffsetInfo,
                                const HI_RECT_S *pstFmtResolution,
                                HI_RECT_S *pstToBeRevisedRect,
                                HI_RECT_S *pstRevisedRect)
{
    HI_U32 zmeDestWidth = 0, zmeDestHeight = 0;
    HI_DRV_DISP_OFFSET_S tmp_offsetInfo = {0};
    HI_S32 Ret = HI_FAILURE;
    HI_S32 s32CalcResult = 0;
    HI_RECT_S stToBeRevisedRect_tmp = *pstToBeRevisedRect;

    tmp_offsetInfo = *pstOffsetInfo;

    /*for browse mode, revise in virt screen .*/
    window_revise(&stToBeRevisedRect_tmp, pstCanvas);

    zmeDestWidth = (pstFmtResolution->s32Width - tmp_offsetInfo.u32Left - tmp_offsetInfo.u32Right);
    zmeDestHeight = (pstFmtResolution->s32Height - tmp_offsetInfo.u32Top - tmp_offsetInfo.u32Bottom);

    if (pstCanvas->s32Width != stToBeRevisedRect_tmp.s32Width)
    {
        Ret = Win_Caculate(zmeDestWidth,
                           pstCanvas->s32Width,
                           stToBeRevisedRect_tmp.s32Width,
                           &s32CalcResult);
        if (Ret != HI_SUCCESS)
        {
            return Ret;
        }

        pstRevisedRect->s32Width = s32CalcResult / 100;
    }
    else
    {
        pstRevisedRect->s32Width = zmeDestWidth;
    }

    if (pstCanvas->s32Height != stToBeRevisedRect_tmp.s32Height)
    {
        Ret = Win_Caculate(zmeDestHeight,
                           pstCanvas->s32Height,
                           stToBeRevisedRect_tmp.s32Height,
                           &s32CalcResult);

        if (Ret != HI_SUCCESS)
        {
            return Ret;
        }

        pstRevisedRect->s32Height = s32CalcResult / 100;
    }
    else
    {
        pstRevisedRect->s32Height = zmeDestHeight;
    }


    Ret = Win_Caculate(zmeDestWidth,
                       pstCanvas->s32Width,
                       stToBeRevisedRect_tmp.s32X,
                       &s32CalcResult);
    if (Ret != HI_SUCCESS)
    {
        return Ret;
    }

    pstRevisedRect->s32X = s32CalcResult / 100 + tmp_offsetInfo.u32Left;

    Ret = Win_Caculate(zmeDestHeight,
                       pstCanvas->s32Height,
                       stToBeRevisedRect_tmp.s32Y,
                       &s32CalcResult);
    if (Ret != HI_SUCCESS)
    {
        return Ret;
    }

    pstRevisedRect->s32Y = s32CalcResult / 100 + tmp_offsetInfo.u32Top;
    WinOutRectAlign(pstRevisedRect);

    /*for browse mode, revise in virt screen .*/
    window_revise(pstRevisedRect, pstFmtResolution);
    return HI_SUCCESS;
}

HI_S32 WinOutRectSizeConversionByType(const HI_DISP_DISPLAY_INFO_S  *pstInfo,
                                      HI_RECT_S *pstRevisedRect,
                                      WINDOW_S *pstWin)
{
    HI_RECT_S stCanvas = {0}, stOutRectOrigin = {0};
    HI_DRV_DISP_OFFSET_S stOffsetInfo = {0};

    memset((void *)&stCanvas, 0, sizeof(HI_RECT_S));
    memset((void *)&stOffsetInfo, 0, sizeof(HI_DRV_DISP_OFFSET_S));

    stOutRectOrigin = pstWin->stCfg.stAttrBuf.stOutRect;

    if (!stOutRectOrigin.s32Width || !stOutRectOrigin.s32Height)
    {
        if (pstWin->bVirtScreenMode)
        {
            stOutRectOrigin = pstInfo->stVirtaulScreen;
        }
        else
        {
            stOutRectOrigin = pstInfo->stFmtResolution;
        }
    }

    if (pstWin->bVirtScreenMode)
    {
        (HI_VOID)DISP_GetVirtScreen(pstWin->enDisp, &stCanvas);
        stOffsetInfo = pstInfo->stOffsetInfo;

#ifndef HI_VO_OFFSET_EFFECTIVE_WHEN_WIN_FULL
        if (((pstWin->stCfg.stAttrBuf.stOutRect.s32Width == 0)
             || (pstWin->stCfg.stAttrBuf.stOutRect.s32Height == 0))
            || ((pstWin->stCfg.stAttrBuf.stOutRect.s32Width == stCanvas.s32Width)
                && (pstWin->stCfg.stAttrBuf.stOutRect.s32Height == stCanvas.s32Height))
           )
        {
            memset((void *)&stOffsetInfo, 0, sizeof(HI_DRV_DISP_OFFSET_S));
        }
#endif
    }
    else
    {
        stOffsetInfo.u32Left = 0;
        stOffsetInfo.u32Top = 0;
        stOffsetInfo.u32Right = 0;
        stOffsetInfo.u32Bottom = 0;
        stCanvas = pstWin->stDispInfo.stWinCurrentFmt;
    }

    (HI_VOID)WinOutRectSizeConversion(&stCanvas,
                                      &stOffsetInfo,
                                      &pstInfo->stFmtResolution,
                                      &stOutRectOrigin,
                                      pstRevisedRect);

    return HI_SUCCESS;
}


HI_S32 WindowRedistributeProcess(WINDOW_S *tmpWindow);
HI_S32 WindowRedistributeProcess_Wait(WINDOW_S *tmpWindow, HI_BOOL bWait);

HI_VOID Win_GetAllEnabledWindows(WINDOW_S **ppstWin, HI_U32 *WinNum, WINDOW_S *tmpWindow)
{
    HI_U32 k = 0, i = 0;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (stDispWindow.pstWinArray[tmpWindow->enDisp][i])
        {
            if ((stDispWindow.pstWinArray[tmpWindow->enDisp][i]->u32Index
                 != tmpWindow->u32Index)
                && (stDispWindow.pstWinArray[tmpWindow->enDisp][i]->bEnable == HI_TRUE))
            {
                ppstWin[k] = stDispWindow.pstWinArray[tmpWindow->enDisp][i];
                k++;
            }
        }
    }

    *WinNum = k;
    return ;
}

HI_VOID Win_InsertNodeIntoEnabledWindows(WINDOW_S **ppstWin, HI_U32 *WinNum, WINDOW_S *tmpWindow)
{
    HI_U32 i = 0;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (stDispWindow.pstWinArray[tmpWindow->enDisp][i])
        {
            /*select enabled window which does not equal to tmpWindow
                         and insert them to the window ptr array.*/
            if ((stDispWindow.pstWinArray[tmpWindow->enDisp][i]->u32Index
                 == tmpWindow->u32Index)
                && (tmpWindow->bEnable == HI_TRUE))
            {
                ppstWin[*WinNum] = tmpWindow;
                *WinNum = *WinNum + 1;
            }
        }
    }

    return ;
}

/*update the new layer and region number to window.*/
HI_S32 WinUpdateMappingInfor(WINDOW_S *pstWin, WindowMappingResult_S *pstWinMapResult, HI_DRV_DISPLAY_E enDisp)
{
    HI_U32 i = 0;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if ((stDispWindow.pstWinArray[pstWin->enDisp][i])
            && (stDispWindow.pstWinArray[pstWin->enDisp][i]->u32Index
                == pstWin->u32Index))
        {
            if (enDisp == HI_DRV_DISPLAY_1)
            {
                stDispWindow.pstWinArray[pstWin->enDisp][i]->u32VideoLayerNew = V0;
            }
            else if (enDisp == HI_DRV_DISPLAY_0)
            {

                stDispWindow.pstWinArray[pstWin->enDisp][i]->u32VideoLayerNew =  VDP_LAYER_SD0;
            }

            stDispWindow.pstWinArray[pstWin->enDisp][i]->u32VideoRegionNoNew = 0;
        }
    }


    return HI_SUCCESS;
}


/*window adjust, move/zme/create/destroy may cause the layout
 *change. because the  adjust in thread-suituation may be half complete,
 *and then interruptted by isr, so the change should be located in    isr func.
*/
HI_S32 WindowRedistributeProcess(WINDOW_S *tmpWindow)
{
    WINDOW_S *pstWin[WINDOW_MAX_NUMBER] = {HI_NULL};
    HI_U32   numofWindow = 0, i = 0;
    HI_S32                ret = HI_SUCCESS;
    HI_DRV_DISPLAY_E      enDisp  = HI_DRV_DISPLAY_BUTT;

    /*first,get all the enabled window ptrs.*/
    Win_GetAllEnabledWindows(pstWin, &numofWindow, tmpWindow);
    Win_InsertNodeIntoEnabledWindows(pstWin, &numofWindow, tmpWindow);
    if (0 == numofWindow)
    {
        DISP_WARN("No enabled window exist.\n");
        return HI_SUCCESS;
    }

    if (WINDOW_MAX_NUMBER < numofWindow)
    {
        DISP_WARN("Enabled window num is not correct.\n");
        return HI_FAILURE;
    }

    /*update new window-layer mapping.*/
    enDisp = tmpWindow->enDisp;
    for (i = 0 ; i < numofWindow; i++)
    {
        WinUpdateMappingInfor(pstWin[i], HI_NULL, enDisp);
    }

    return ret;
}

HI_S32 WindowRedistributeProcess_Wait(WINDOW_S *tmpWindow, HI_BOOL bWait)
{
    //unsigned int t = 0;
    HI_S32 s32Ret = HI_FAILURE;
    atomic_set(&stDispWindow.bWindowSytemUpdate[tmpWindow->enDisp], 1);

    if (HI_TRUE == bWait)
    {
        s32Ret = DISP_OSAL_WaitEvent(&stDispWindow.stWinSytemQueueEvent, EVENT_WIN_SYSTEM_UP_COMPLET, 50);
        DISP_OSAL_ResetEvent(&stDispWindow.stWinSytemQueueEvent, EVENT_WIN_NOTHING);

        if (HI_SUCCESS != s32Ret)
        {
            WIN_WARN("wait for redistribtue end time out!\n");
            return HI_ERR_VO_TIMEOUT;
        }
    }

    return HI_SUCCESS;
}

HI_VOID ISR_WinReleaseUSLFrame(WINDOW_S *pstWin);

extern HI_HANDLE g_hWin;
HI_S32 WinAllocateAlgMMZ(WINDOW_S *pstWin,
                                 HI_DRV_VIDEO_FRAME_S *pFrameInfo);

HI_S32 WinCreateDisplayWindow(HI_DRV_WIN_ATTR_S *pWinAttr, WINDOW_S **ppstWin, HI_U32 u32BufNum)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 nRet = HI_FAILURE;
    HIDRV_DISP_NODE_DELAYTIME   *pstDispNodeDelayTime   = HI_NULL;

    if (WinTestAddWindow(pWinAttr->enDisp))
    {
        WIN_ERROR("Reach max window number,can not create!\n");
        return HI_ERR_VO_CREATE_ERR;
    }

    pstWin = (WINDOW_S *)DISP_MALLOC(sizeof(WINDOW_S));
    if (!pstWin)
    {
        WIN_ERROR("Malloc WINDOW_S failed!\n");
        return HI_ERR_VO_MALLOC_FAILED;
    }

    DISP_MEMSET(pstWin, 0, sizeof(WINDOW_S));

    /* attribute */
    pstWin->bEnable = HI_FALSE;
    pstWin->bEnable_Using = HI_FALSE;
    pstWin->bMasked = HI_FALSE;

    pstWin->enState = WIN_STATE_WORK;
    pstWin->bUpState      = HI_FALSE;
    pstWin->stPlayCtrl.eFieldOrder = WIN_FIELDORDER_BUTT;

    DISP_OSAL_InitEvent(&pstWin->stWinQueueEvent, EVENT_WIN_NOTHING);
    DISP_OSAL_InitSpin(&(pstWin->Spin));

    pstWin->enDisp = pWinAttr->enDisp;
    pstWin->enType = HI_DRV_WIN_ACTIVE_SINGLE;

    /* pay attention: when virtualscreen,it is the use's settting.
      *if non-virt mode ,it is physical cooridinate.
      */
    pstWin->stCfg.stAttrBuf = *pWinAttr;
    pstWin->stCfg.stAttr    = *pWinAttr;
    pstWin->stCfg.u32Alpha = WINDOW_MAX_ALPHA;

    atomic_set(&pstWin->stCfg.bNewAttrFlag, 1);

    pstWin->stCfg.enFrameCS = HI_DRV_CS_UNKNOWN;
    pstWin->stCfg.u32Fidelity = 0;
    pstWin->stCfg.enOutCS    = HI_DRV_CS_UNKNOWN;

    /* initial first frame output status. */
    pstWin->stCfg.stFirstFrmStatus.bSenceChange = HI_FALSE;
    pstWin->stCfg.stFirstFrmStatus.enDispOutType = HI_DRV_DISP_TYPE_NORMAL;
    pstWin->stCfg.stFirstFrmStatus.enOutColorSpace = HI_DRV_CS_UNKNOWN;

    pstWin->stCfg.stSource.hSrc = HI_INVALID_HANDLE;
    pstWin->stCfg.stSource.hSecondSrc = HI_INVALID_HANDLE;
    pstWin->stCfg.stSource.pfAcqFrame = HI_NULL;
    pstWin->stCfg.stSource.pfRlsFrame = HI_NULL;
    pstWin->stCfg.stSource.pfSendWinInfo = HI_NULL;
    nRet = VideoLayer_GetFunction(&pstWin->stVLayerFunc);
    if (nRet)
    {
        WIN_ERROR("VideoLayer_GetFunction failed!\n");
        goto __ERR_GET_FUNC__;
    }

    (HI_VOID)pstWin->stVLayerFunc.PF_InitialLayer(0);

    pstWin->u32VideoLayer = VDP_LAYER_VID_BUTT;
    pstWin->u32VideoLayerNew = VDP_LAYER_VID_BUTT;

    pstWin->u32VideoRegionNo    = 0xffffffff;
    pstWin->u32VideoRegionNoNew = 0xffffffff;

    pstWin->u32LastInLowDelayIdx = 0xffffffff;
    pstWin->u32LastOutLowDelayIdx = 0xffffffff;



    nRet = WinBuf_Create(u32BufNum, WIN_BUF_MEM_SRC_SUPPLY, HI_NULL, &pstWin->stBuffer.stWinBP);
    if (nRet)
    {
        WIN_ERROR("Create buffer pool failed\n");
        goto __ERR_GET_FUNC__;
    }

    spin_lock_init(&(pstWin->stBuffer.stUselessBuf.stUlsLock));

    DRV_WIN_FRC_Create(&pstWin->hFrc);

    // initial reset
    pstWin->bReset = HI_FALSE;
    pstWin->bConfigedBlackFrame = HI_FALSE;

    // initial quickmode
    pstWin->bQuickMode = HI_FALSE;

    // initial stepmode flag
    pstWin->bStepMode = HI_FALSE;

    //init delay info
    pstWin->stDelayInfo.u32DispRate = 5000;
    pstWin->stDelayInfo.bTBMatch = HI_TRUE;
    pstWin->stDelayInfo.u32DisplayTime = 20;
    pstWin->bInInterrupt = HI_FALSE;

    //init rotation
    pstWin->enRotation = HI_DRV_ROT_ANGLE_0;
    pstWin->bVertFlip = HI_FALSE;
    pstWin->bHoriFlip = HI_FALSE;

    //init Node time from add full list to del full list
    pstDispNodeDelayTime = &(pstWin->stBuffer.stWinBP.stBuffer.stDispNodeDelayTime);

    memset(pstDispNodeDelayTime, 0, sizeof(HIDRV_DISP_NODE_DELAYTIME));
    pstDispNodeDelayTime->u16UnRecordNodeNum = UNRECORD_FRAME_NUM;

    WinGetDefaultInitialPlayCtrl(&pstWin->stPlayCtrl);
    XDP_RWZB_Init(&(pstWin->pstRwzb));
    *ppstWin = pstWin;

    return HI_SUCCESS;


__ERR_GET_FUNC__:

    DISP_FREE(pstWin);

    return nRet;
}

HI_S32 Win_FrameOneRelease(WINDOW_S *pstWin,
                                HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_DRV_WIN_SRC_INFO_S *pstSource;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_DRV_VIDEO_PRIVATE_S *pstFramePriv = HI_NULL;
    HI_BOOL bNeedRlsToFrontClass = HI_FALSE;

    pstFramePriv = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0]);
    if ((DEF_HI_DRV_VPSS_LAST_ERROR_FLAG != pstFramePriv->u32LastFlag)
         && (HI_DRV_FRAME_VDP_ALLOCATE_STILL != pstFrame->u32StillFrame))
    {
        bNeedRlsToFrontClass = HI_TRUE;
    }
    else
    {
        bNeedRlsToFrontClass = HI_FALSE;
    }

    if (HI_TRUE == bNeedRlsToFrontClass)
    {
        pstSource = &pstWin->stCfg.stSource;
        if (HI_NULL == pstSource->pfRlsFrame)
        {
            if (HI_NULL != g_pstVDPVdecFunc)
            {
                s32Ret = g_pstVDPVdecFunc->pfnVORlsFrame(HI_INVALID_HANDLE, pstFrame);
            }
            else
            {
                WIN_ERROR("get vdec func error.\n");
                s32Ret = HI_FAILURE;
            }
        }
        else
        {
            s32Ret = pstSource->pfRlsFrame(pstSource->hSrc, pstFrame);
        }

        if (HI_SUCCESS != s32Ret)
        {
            WIN_ERROR("Rls frame failed,addr:%x\n", pstFrame->stBufAddr[0].u32PhyAddr_Y);
        }

        if (pstWin->stPlayInfor.u32LastQueueFrameAddr == pstFrame->stBufAddr[0].u32PhyAddr_Y)
        {
            pstWin->stPlayInfor.u32LastQueueFrameAddr = 0xffffffff;
        }

        WIN_INFO("release frame:%x!\n", pstFrame->stBufAddr[0].u32PhyAddr_Y);
    }

    WinBuf_DebugAddRls(pstWin->stBuffer.stWinBP.pstDebugInfo, pstFrame->u32FrameIndex);
    g_LastReleasedframeInfo = *pstFrame;

    return s32Ret;
}

HI_VOID  Win_FrameRelease(WINDOW_S *pstWin)
{
    HI_DRV_VIDEO_FRAME_S *pstDisplayedFrame = HI_NULL;
    HI_U32  u32FrameCnt = 0;

    pstDisplayedFrame = WinBuf_GetDisplayedFrame(pstWin, &pstWin->stBuffer.stWinBP);
    while (HI_NULL != pstDisplayedFrame)
    {
        Win_FrameOneRelease(pstWin, pstDisplayedFrame);
        WinBuf_DeleteDisplayedFrame(&pstWin->stBuffer.stWinBP, pstDisplayedFrame);
        pstDisplayedFrame = WinBuf_GetDisplayedFrame(pstWin, &pstWin->stBuffer.stWinBP);

        /*check the loop cnt reach the max, if bigger than max, just break;*/
        CHECK_LOOP_REACH_MAX(u32FrameCnt, 20);
    }

    return;
}

HI_VOID  Win_DestroyFrameRelease(WINDOW_S *pstWin)
{
    HI_DRV_VIDEO_FRAME_S *pstDisplayedFrame = HI_NULL;
    HI_S32 nRet = HI_FAILURE;
    DISP_BUF_NODE_S *pstNode = HI_NULL;


    nRet = DispBuf_GetFullNode(&pstWin->stBuffer.stWinBP.stBuffer, &pstNode);
    while (HI_SUCCESS == nRet)
    {
        pstDisplayedFrame = (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;
        Win_FrameOneRelease(pstWin, pstDisplayedFrame);

        nRet = DispBuf_DelFullNode(&pstWin->stBuffer.stWinBP.stBuffer, pstNode);
        DISP_ASSERT(nRet == HI_SUCCESS);

        DispBuf_AddEmptyNode(&pstWin->stBuffer.stWinBP.stBuffer, pstNode);
        pstNode = HI_NULL;
        nRet = DispBuf_GetFullNode(&pstWin->stBuffer.stWinBP.stBuffer, &pstNode);
    }

    pstNode = HI_NULL;
    nRet = DispBuf_GetUsingNode(&pstWin->stBuffer.stWinBP.stBuffer, &pstNode);
    while (HI_SUCCESS == nRet)
    {
        pstDisplayedFrame = (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;
        Win_FrameOneRelease(pstWin, pstDisplayedFrame);

        DispBuf_DelUsingNode(&pstWin->stBuffer.stWinBP.stBuffer, pstNode);
        DispBuf_AddEmptyNode(&pstWin->stBuffer.stWinBP.stBuffer, pstNode);
        pstNode = HI_NULL;
        nRet = DispBuf_GetUsingNode(&pstWin->stBuffer.stWinBP.stBuffer, &pstNode);
    }

    return;
}


HI_S32 WinDestroyDisplayWindow(WINDOW_S *pstWin)
{
    HI_SIZE_T irqflag = 0;

    WIN_CHECK_NULL_RETURN(pstWin);
    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    Win_DestroyFrameRelease(pstWin);
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);

    (HI_VOID)WinBuf_Destroy(&pstWin->stBuffer.stWinBP);

    (HI_VOID)DRV_WIN_FRC_Destroy(pstWin->hFrc);

    pstWin->stVLayerFunc.PF_PauseHwBuf(0, VDP_CYCBUF_DTV_MODE_NORM);
    pstWin->stVLayerFunc.PF_DeInitialLayer(pstWin->u32VideoLayer);
    msleep(50);

    ALG_ReleaseAlgMMZ(pstWin);
    Win_ReleaseMMZ(pstWin);

    XDP_RWZB_DeInit(pstWin->pstRwzb);
    pstWin->pstRwzb = HI_NULL;
    DISP_FREE(pstWin);
    pstWin = HI_NULL;

    return HI_SUCCESS;
}

extern HI_VOID VDP_OFFLINE_DFX(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_DRV_CheckOnlPart(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_DRV_CheckAllPath(S_VDP_REGS_TYPE *pstLogicRegs);

HI_VOID ISR_CallbackForStartLogic(HI_VOID* hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WINDOW_S *pstWin = (WINDOW_S *)hDst;

    if (HI_NULL == pstWin)
    {
        WIN_ERROR("Null Window!\n");
        return;
    }

    Win_PQAlg_ISR(pstWin, HI_NULL);
    mb();
    VDP_DRV_StartLogic(0);


    if (HI_TRUE == pstWin->bDebugEn)
    {
#ifdef XDP_SUPPORT_MEM_MAGIC
        if (HI_TRUE == pstWin->stDebug.bMagicEnable)
        {
            XDP_OSAL_MemCheckMagic(&(pstWin->stHardwareConfig.stDeiMmzBufMagicInfo));
        }
        Win_PQAlgEnableMagic(pstWin->stDebug.bMagicEnable);
#endif
        Win_PQAlgEnable(pstWin->stDebug.bSoftAlgEnable);
    }

    if (pstWin->stPlayCtrl.eWinConfigCheck == WIN_HW_CONFIG_CHECK_OPEN)
    {
#ifdef VDP_REG_ASSERT_CHECK_SUPPORT
        VDP_DRV_CheckOffPart(pVdpReg);
        //VDP_QBUFSTATUS_DFX(pVdpReg);
        VDP_DRV_CheckAllPath(pVdpReg);
        VDP_QBUFSTATUS_DFX(pVdpReg);
        VDP_OFFLINE_DFX(pVdpReg);
#endif
    }

    return;
}

#define  ISR_STATUS_MASK_TIMEOUT 0x6
#define  ISR_STATUS_MASK_RXERR   0x40

HI_VOID ISR_CallbackForLogicTimeout(HI_VOID* hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_U32 u32IntStateVPSS = 0;
    VIDEO_LAYER_FUNCTIONG_S stFunc = {0};
    DISP_INTF_OPERATION_S *pfOpt = HI_NULL;

    pfOpt = DISP_HAL_GetOperationPtr();
    VideoLayer_GetFunction(&stFunc);

    if (pfOpt == HI_NULL)
    {
        WIN_ERROR("Null pfOpt !\n");
        return;
    }

    if ((HI_NULL == pfOpt->PF_GetUnMaskVPSSIntState) || (HI_NULL == stFunc.PF_OfflineReset))
    {
        WIN_ERROR("Null pointer %p %p\n", pfOpt->PF_GetUnMaskVPSSIntState, stFunc.PF_OfflineReset);
        return;
    }

    pfOpt->PF_GetUnMaskVPSSIntState(&u32IntStateVPSS);

    stFunc.PF_OfflineReset();
    WIN_ERROR("Offline has timeout%#x!\n", u32IntStateVPSS);

    return;
}

extern HI_VOID ISR_WIN_MaskProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
HI_VOID ISR_CallbackForBufRelease(HI_VOID* hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
HI_S32 WinRegCallback(WINDOW_S *pstWin)
{
    HI_DRV_DISP_CALLBACK_S stCB = {0};
    HI_S32 nRet = HI_SUCCESS;

    if (WinGetDispID(pstWin) >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_ERROR("WIN register callback failed!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    /*only hd register win process.*/
    if (WinGetDispID(pstWin) == HI_DRV_DISPLAY_1)
    {
        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForWinProcess;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_WIN_MaskProcess;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }


        stCB.hDst  = (HI_VOID*)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForBufRelease;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_RETURN_FRAME_ISR, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }


        stCB.hDst  = (HI_VOID*)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForStartLogic;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_FINISH, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID*)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForLogicTimeout;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_TIMEOUT0, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }
        stCB.hDst  = (HI_VOID*)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForLogicTimeout;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;

        nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_TIMEOUT1, &stCB);
        if (nRet)
        {
            WIN_ERROR("WIN register callback failed.\n");
            return nRet;
        }
    }
    else
    {
        if (!WinCheckWhetherWbcIsogenyMode())
        {
            stCB.hDst  = (HI_VOID *)pstWin;
            stCB.pfDISP_Callback = ISR_CallbackForWinProcess;
            stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;

            nRet = DISP_RegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
            if (nRet)
            {
                WIN_ERROR("WIN register callback failed.\n");
                return nRet;
            }
        }

    }

    return HI_SUCCESS;
}

HI_S32 WinUnRegCallback(WINDOW_S *pstWin)
{
    HI_DRV_DISP_CALLBACK_S stCB = {0};
    HI_S32 nRet = HI_SUCCESS;

    if (WinGetDispID(pstWin) >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_ERROR("WIN register callback failed!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if (WinGetDispID(pstWin) == HI_DRV_DISPLAY_1)
    {
        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForWinProcess;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }


        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_WIN_MaskProcess;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForBufRelease;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_RETURN_FRAME_ISR, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForStartLogic;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_FINISH, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForLogicTimeout;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_TIMEOUT0, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }

        stCB.hDst  = (HI_VOID *)pstWin;
        stCB.pfDISP_Callback = ISR_CallbackForLogicTimeout;
        stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_HIGH;
        nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_FRAME_TIMEOUT1, &stCB);

        if ( nRet != HI_SUCCESS)
        {
            WIN_ERROR("WIN unregister callback failed!\n");
            return nRet;
        }

    }
    else
    {
        if (!WinCheckWhetherWbcIsogenyMode())
        {
            stCB.hDst  = (HI_VOID *)pstWin;
            stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
            stCB.pfDISP_Callback = ISR_CallbackForWinProcess;
            nRet = DISP_UnRegCallback(WinGetDispID(pstWin), HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);
            if (nRet)
            {
                WIN_ERROR("WIN unregister callback failed.\n");
                return nRet;
            }
        }
    }

    return HI_SUCCESS;
}


HI_VOID WinSetBlackFrameFlag(WINDOW_S *pstWin)
{
    if (pstWin)
    {
        pstWin->bConfigedBlackFrame = HI_TRUE;
    }
}

HI_VOID WinClearBlackFrameFlag(WINDOW_S *pstWin)
{
    if (pstWin)
    {
        pstWin->bConfigedBlackFrame = HI_FALSE;
    }
}

HI_BOOL WinTestBlackFrameFlag(WINDOW_S *pstWin)
{
    if (pstWin)
    {
        return pstWin->bConfigedBlackFrame;
    }

    return HI_FALSE;
}

HI_S32 WinCheckFixedAttr(HI_DRV_WIN_ATTR_S *pOldAttr, HI_DRV_WIN_ATTR_S *pNewAttr)
{
    if ((pNewAttr->enDisp >=  HI_DRV_DISPLAY_BUTT)
        || (pNewAttr->enARCvrs >=  HI_DRV_ASP_RAT_MODE_BUTT)
        || (pNewAttr->enDataFormat >=  HI_DRV_PIX_BUTT))
    {
        WIN_ERROR("Input param is invalid!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if ( (pOldAttr->enDisp != pNewAttr->enDisp)
         || (pOldAttr->bVirtual != pNewAttr->bVirtual)
       )
    {
        WIN_ERROR("the fixed attr is not right.!\n");
        return HI_ERR_VO_OPERATION_DENIED;
    }

    if (pOldAttr->bVirtual)
    {

    }

    return HI_SUCCESS;
}


HI_BOOL WinCheckAttrChange(HI_DRV_WIN_ATTR_S *pstOriAttr, HI_DRV_WIN_ATTR_S *pstNewAttr)
{
    if (0 == memcmp(pstOriAttr, pstNewAttr, sizeof(HI_DRV_WIN_ATTR_S)))
    {
        /*no change*/
        return HI_FALSE;
    }
    else
    {
        return HI_TRUE;
    }
}

HI_S32 WinCheckAttr(HI_DRV_WIN_ATTR_S *pstAttr, HI_BOOL bVirtScreen)
{
    HI_RECT_S drv_resolution;
    HI_S32 ret = 0;
    HI_DISP_DISPLAY_INFO_S  stInfo;

    if ((pstAttr->enDisp > HI_DRV_DISPLAY_1)
        || (pstAttr->enARCvrs >= HI_DRV_ASP_RAT_MODE_BUTT)
        || (pstAttr->enDataFormat >= HI_DRV_PIX_BUTT))
    {
        WIN_FATAL("Invalid enum.\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    memset((void *)&drv_resolution, 0, sizeof(drv_resolution));
    memset((void *)&stInfo, 0, sizeof(stInfo));

    if (bVirtScreen)
    {
        ret = DISP_GetVirtScreen(pstAttr->enDisp, &drv_resolution);
    }
    else
    {
        ret = DISP_GetDisplayInfo(pstAttr->enDisp, &stInfo);
        drv_resolution = stInfo.stFmtResolution;
    }

    if (HI_SUCCESS != ret)
    {
        HI_ERR_WIN("Get Virtual SCREEN error!\n");
        return ret;
    }

    if ( ((pstAttr->stOutRect.s32Height == 0)
          && (pstAttr->stOutRect.s32Width != 0))
         || ((pstAttr->stOutRect.s32Height != 0)
             && (pstAttr->stOutRect.s32Width == 0)))
    {
        HI_ERR_WIN("win outrect error, one of w/h is zero.!\n");
        return HI_ERR_VO_INVALID_PARA;
    }
    else if ((!(pstAttr->stOutRect.s32Height | pstAttr->stOutRect.s32Width))
             && (pstAttr->stOutRect.s32X | pstAttr->stOutRect.s32Y))
    {
        HI_ERR_WIN("when w/h is zero, x/y should be zero too.!\n");
        return HI_ERR_VO_INVALID_PARA;
    }
    else if ((pstAttr->stOutRect.s32Height | pstAttr->stOutRect.s32Width)
             && ((pstAttr->stOutRect.s32Width   < WIN_OUTRECT_MIN_WIDTH)
                 || (pstAttr->stOutRect.s32Height  < WIN_OUTRECT_MIN_HEIGHT))
            )
    {
        WIN_FATAL("The Min WIN OutRect supported is 64*64 !\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if (   ( pstAttr->stCustmAR.u32ARw > (pstAttr->stCustmAR.u32ARh * WIN_MAX_ASPECT_RATIO) )
           || ( (pstAttr->stCustmAR.u32ARw * WIN_MAX_ASPECT_RATIO) < pstAttr->stCustmAR.u32ARh)
       )
    {
        HI_ERR_WIN("bUserDefAspectRatio  error!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if ( pstAttr->bUseCropRect)
    {
        if (    (pstAttr->stCropRect.u32TopOffset    > WIN_CROPRECT_MAX_OFFSET_TOP)
                || (pstAttr->stCropRect.u32LeftOffset    > WIN_CROPRECT_MAX_OFFSET_LEFT)
                || (pstAttr->stCropRect.u32BottomOffset > WIN_CROPRECT_MAX_OFFSET_BOTTOM)
                || (pstAttr->stCropRect.u32RightOffset    > WIN_CROPRECT_MAX_OFFSET_RIGHT)
           )
        {
            WIN_FATAL("WIN CropRec support less than 128!\n");
            return HI_ERR_VO_INVALID_PARA;
        }
    }
    else
    {
        if ( !pstAttr->stInRect.s32Height || !pstAttr->stInRect.s32Width)
        {
            DISP_MEMSET(&pstAttr->stInRect, 0, sizeof(HI_RECT_S));
        }
        else if (   (pstAttr->stInRect.s32Width     < WIN_INRECT_MIN_WIDTH)
                    || (pstAttr->stInRect.s32Height  < WIN_INRECT_MIN_HEIGHT)
                    || (pstAttr->stInRect.s32Width     > WIN_INRECT_MAX_WIDTH)
                    || (pstAttr->stInRect.s32Height  > WIN_INRECT_MAX_HEIGHT)
                )
        {
            WIN_FATAL("WIN InRect support %d*%d ~ %d*%d!\n",
                WIN_INRECT_MIN_WIDTH,
                WIN_INRECT_MIN_HEIGHT,
                WIN_INRECT_MAX_WIDTH,
                WIN_INRECT_MAX_HEIGHT
            );
            return HI_ERR_VO_INVALID_PARA;
        }
        else if ( (pstAttr->stInRect.s32X  < 0) || (pstAttr->stInRect.s32Y  < 0))
        {
            WIN_FATAL("WIN InRect  invalid para!\n");
            return HI_ERR_VO_INVALID_PARA;
        }
    }

    return HI_SUCCESS;
}

HI_VOID WinReviseOutRectByCapability(const HI_RECT_S *pstLayerCapabilitySize,
                                     HI_RECT_S *pstWinOutRect)
{
    if (pstWinOutRect->s32Width > pstLayerCapabilitySize->s32Width)
    {
        pstWinOutRect->s32Width = pstLayerCapabilitySize->s32Width;
    }

    if (pstWinOutRect->s32Height > pstLayerCapabilitySize->s32Height)
    {
        pstWinOutRect->s32Height = pstLayerCapabilitySize->s32Height;
    }

    return ;
}

static HI_S32 WinCalDobySourceInfo(WINDOW_S *pstWin, HI_U32 u32VideoLayer, HI_DISP_DISPLAY_INFO_S *pstDispInfo, HI_DRV_WIN_PRIV_INFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    VIDEO_LAYER_CAPABILITY_S  stVideoLayerCap;
    HI_DRV_WIN_ATTR_S          *pstAttr = HI_NULL;

    memset(&stVideoLayerCap, 0x0, sizeof(stVideoLayerCap));
    pstAttr = &pstWin->stUsingAttr;

    pstInfo->ePixFmt        = HI_DRV_PIX_FMT_NV21;
    pstInfo->bUseCropRect   = HI_FALSE;

    pstInfo->stInRect.s32Width = 0;
    pstInfo->stInRect.s32Height = 0;
    pstInfo->stInRect.s32X = 0;
    pstInfo->stInRect.s32Y = 0;

    pstInfo->stCropRect.u32LeftOffset = 0;
    pstInfo->stCropRect.u32TopOffset = 0;
    pstInfo->stCropRect.u32RightOffset = 0;
    pstInfo->stCropRect.u32BottomOffset = 0;


    if (!pstAttr->stOutRect.s32Width || !pstAttr->stOutRect.s32Height)
    {
        pstInfo->stOutRect = pstDispInfo->stFmtResolution;
    }
    else
    {
        pstInfo->stOutRect = pstAttr->stOutRect;
    }

    pstInfo->stScreenAR   = pstDispInfo->stAR;
    pstInfo->stCustmAR    = pstAttr->stCustmAR;
    pstInfo->enARCvrs     = HI_DRV_ASP_RAT_MODE_FULL;
    pstInfo->bUseExtBuf   = pstAttr->bUserAllocBuffer;
    pstInfo->u32MaxRate   = (pstDispInfo->u32RefreshRate > WIN_TRANSFER_CODE_MAX_FRAME_RATE) ?
                            (pstDispInfo->u32RefreshRate / 2 ) : pstDispInfo->u32RefreshRate;

    pstInfo->bInterlaced = HI_TRUE;
    pstInfo->enRotation  = HI_DRV_ROT_ANGLE_0;
    pstInfo->bHoriFlip   = HI_FALSE;
    pstInfo->bVertFlip   = HI_FALSE;

    pstInfo->stScreen = pstDispInfo->stFmtResolution;
    pstInfo->bIn3DMode = HI_FALSE;
    /*displaying window does not support tunnel mode.*/
    pstInfo->bTunnelSupport = HI_TRUE;


    if (!pstWin->stVLayerFunc.PF_GetCapability)
    {
        WIN_FATAL("PF_GetCapability is null\n");
        return HI_SUCCESS;//here should return failure NOT success!
    }

    if ((s32Ret = pstWin->stVLayerFunc.PF_GetCapability(u32VideoLayer, &stVideoLayerCap)))
    {
        return s32Ret;
    }

    /*in most condition, v1 will be set to mutilarea mode except in dolby mode,
      *under which v1 will be set single mode.  v1 only support 8 bit in multiarea
      * mode and 10 bit in singlearea mode.
      *  so when the layer support 10bit or the window in dolby mode , we acquire 10 bit from vpss.
      *  VPSS will give a result according the stream source.
      */
    if ((stVideoLayerCap.u32BitWidth == 10)
        || (pstWin->enWinMode == HI_DRV_WINDOW_MODE_DOLBY))
    {
        pstInfo->enBitWidth = HI_DRV_PIXEL_BITWIDTH_10BIT;
    }
    else
    {
        pstInfo->enBitWidth = HI_DRV_PIXEL_BITWIDTH_8BIT;
    }


    /*as a result of winlayermapping, we switch vpss  compress on or off according
        the layer capability.*/
    if (stVideoLayerCap.bDcmp == HI_TRUE)
    {
        pstInfo->ePixFmt = HI_DRV_PIX_FMT_NV21_CMP;
    }
    else
    {
        pstInfo->ePixFmt = HI_DRV_PIX_FMT_NV21;
    }

    /*if the layer has zme,it can bypass vpss*/
    if (stVideoLayerCap.bZme == HI_TRUE)
    {
        pstInfo->bPassThrough = HI_TRUE;
        memset( &pstInfo->stOutRect, 0, sizeof(HI_RECT_S));
    }
    else
    {
        WinReviseOutRectByCapability(&stVideoLayerCap.stVideoReadSize, &pstInfo->stOutRect);
        pstInfo->bPassThrough = HI_FALSE;
    }

    DISP_PRINT(">>>>>>>>>>>>>>>>>>>>>>>>>>>will send info to source .............\n");

    //pro info below need to modify when it comes to Dolby frame. currently just mantain it.
    pstWin->stWinInfoForDeveloper.u32WinNum = stDispWindow.u32WinNumber[pstWin->enDisp];
    pstWin->stWinInfoForDeveloper.bIn3DMode = pstInfo->bIn3DMode;

    pstWin->stWinInfoForDeveloper.bHorSrOpenInPreProcess = HI_FALSE;
    pstWin->stWinInfoForDeveloper.bVerSrOpenInPreProcess = HI_FALSE;

    pstWin->stWinInfoForDeveloper.stVdpRequire = pstInfo->stOutRect;
    pstWin->stWinInfoForDeveloper.eCurrentFmt = pstDispInfo->stFmtResolution;
    pstWin->stWinInfoForDeveloper.stFinalWinOutputSize = pstInfo->stOutRect;


    return s32Ret;

}


static HI_S32 WinCalcuInfo(WINDOW_S *pstWin, HI_U32 u32VideoLayer, HI_DISP_DISPLAY_INFO_S *pstDispInfo, HI_DRV_WIN_PRIV_INFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    VIDEO_LAYER_CAPABILITY_S  stVideoLayerCap = {0};
    HI_BOOL bHorSrEnable = HI_FALSE;
    HI_BOOL bVerSrEnable = HI_FALSE;
    HI_DRV_WIN_ATTR_S          *pstAttr = HI_NULL;

    pstAttr = &pstWin->stUsingAttr;

    pstInfo->ePixFmt        = HI_DRV_PIX_FMT_NV21;
    pstInfo->stScreenAR   = pstDispInfo->stAR;
    pstInfo->stCustmAR    = pstAttr->stCustmAR;
    pstInfo->enARCvrs     = pstAttr->enARCvrs;
    pstInfo->bUseExtBuf   = pstAttr->bUserAllocBuffer;
    pstInfo->u32MaxRate   = (pstDispInfo->u32RefreshRate > WIN_TRANSFER_CODE_MAX_FRAME_RATE) ?
                            (pstDispInfo->u32RefreshRate / 2 ) : pstDispInfo->u32RefreshRate;

    pstInfo->bInterlaced = pstDispInfo->bInterlace;
    pstInfo->enRotation  = pstWin->enRotation;
    pstInfo->bHoriFlip   = pstWin->bHoriFlip;
    pstInfo->bVertFlip   = pstWin->bVertFlip;

    if ((pstDispInfo->eDispMode != DISP_STEREO_NONE)
        && (pstDispInfo->eDispMode < DISP_STEREO_BUTT))
    {
        pstInfo->bIn3DMode = HI_TRUE;
    }
    else
    {
        pstInfo->bIn3DMode = HI_FALSE;
    }

    /*displaying window does not support tunnel mode.*/
    pstInfo->bTunnelSupport = HI_TRUE;

    pstInfo->stScreen = pstDispInfo->stFmtResolution;

    pstWin->stWinInfoForDeveloper.stFinalWinOutputSize = pstInfo->stOutRect;

    if (!pstWin->stVLayerFunc.PF_GetCapability)
    {
        WIN_FATAL("PF_GetCapability is null\n");
        return HI_SUCCESS;//here should return failure NOT success!
    }

    if ((s32Ret = pstWin->stVLayerFunc.PF_GetCapability(u32VideoLayer, &stVideoLayerCap)))
    {
        return s32Ret;
    }

    pstInfo->bUseCropRect   = pstAttr->bUseCropRect;
    pstInfo->stInRect        = pstAttr->stInRect;
    pstInfo->stCropRect  = pstAttr->stCropRect;

    if (!pstAttr->stOutRect.s32Width || !pstAttr->stOutRect.s32Height)
    {
        pstInfo->stOutRect = pstDispInfo->stFmtResolution;
    }
    else
    {
        pstInfo->stOutRect = pstAttr->stOutRect;
    }

    /*in most condition, v1 will be set to mutilarea mode except in dolby mode,
      *under which v1 will be set single mode.  v1 only support 8 bit in multiarea
      * mode and 10 bit in singlearea mode.
      *  so when the layer support 10bit or the window in dolby mode , we acquire 10 bit from vpss.
      *  VPSS will give a result according the stream source.
      */
    if ((stVideoLayerCap.u32BitWidth == 10)
        || (pstWin->enWinMode == HI_DRV_WINDOW_MODE_DOLBY))
    {
        pstInfo->enBitWidth = HI_DRV_PIXEL_BITWIDTH_10BIT;
    }
    else
    {
        pstInfo->enBitWidth = HI_DRV_PIXEL_BITWIDTH_8BIT;
    }

    if (pstWin->bMCE && (pstDispInfo->stFmtResolution.s32Width <= FHD_WIDTH_VALUE))
    {
        stVideoLayerCap.bZme = HI_FALSE;
        pstInfo->enBitWidth = HI_DRV_PIXEL_BITWIDTH_8BIT;
    }

    /*  Window  process in VDP */
    if ((stVideoLayerCap.bZmePrior == HI_TRUE)
        && (stVideoLayerCap.bZme == HI_TRUE)
        && (pstInfo->enRotation == HI_DRV_ROT_ANGLE_0)
        && (!pstInfo->bIn3DMode)
#if defined(HI_NVR_SUPPORT)
        && (pstInfo->stOutRect.s32Width > FHD_WIDTH_VALUE )
#endif
       )
    {
        pstInfo->enARCvrs  = HI_DRV_ASP_RAT_MODE_FULL;

        pstInfo->bPassThrough = HI_TRUE;
        memset(&pstInfo->stOutRect, 0, sizeof(pstInfo->stOutRect));

        pstInfo->bUseCropRect = HI_FALSE;
        DISP_MEMSET(&pstInfo->stCropRect, 0, sizeof(pstInfo->stCropRect));
        DISP_MEMSET(&pstInfo->stInRect, 0, sizeof(pstInfo->stInRect));
    }
    else
    {
        pstInfo->enARCvrs  = pstAttr->enARCvrs;
        pstInfo->bPassThrough = HI_FALSE;
        WinReviseOutRectByCapability(&stVideoLayerCap.stVideoReadSize, &pstInfo->stOutRect);
    }

    /*as a result of winlayermapping, we switch vpss  compress on or off according
        the layer capability.*/
    if (stVideoLayerCap.bDcmp == HI_TRUE)
    {
        pstInfo->ePixFmt = HI_DRV_PIX_FMT_NV21_CMP;
    }
    else
    {
        pstInfo->ePixFmt = HI_DRV_PIX_FMT_NV21;
    }

    pstWin->stWinInfoForDeveloper.u32WinNum = stDispWindow.u32WinNumber[pstWin->enDisp];
    pstWin->stWinInfoForDeveloper.bIn3DMode = pstInfo->bIn3DMode;

    pstWin->stWinInfoForDeveloper.bHorSrOpenInPreProcess = bHorSrEnable;
    pstWin->stWinInfoForDeveloper.bVerSrOpenInPreProcess = bVerSrEnable;

    pstWin->stWinInfoForDeveloper.stVdpRequire = pstInfo->stOutRect;
    pstWin->stWinInfoForDeveloper.eCurrentFmt = pstDispInfo->stFmtResolution;

    return s32Ret;

}

HI_S32 WinSendAttrToSource(WINDOW_S *pstWin, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_DRV_WIN_PRIV_INFO_S      stInfo = {0};
    PFN_GET_WIN_INFO_CALLBACK   pfTmpSendWinInfo = HI_NULL;

    DISP_MEMSET(&stInfo, 0, sizeof(stInfo));

    if (HI_NULL == pstWin->stCfg.stSource.pfSendWinInfo)
    {
        return HI_FAILURE;
    }

    pfTmpSendWinInfo = pstWin->stCfg.stSource.pfSendWinInfo;

    /* hSrc valid and hSecondSrc invalid,there's ONLY one VPSS:normal frame or
        * (BL+metadata)Dolby frame will enter this branch.
        */
    if ((pstWin->stCfg.stSource.hSrc != HI_INVALID_HANDLE) &&
        (pstWin->stCfg.stSource.hSecondSrc == HI_INVALID_HANDLE))
    {
        (HI_VOID)WinCalcuInfo(pstWin, pstWin->u32VideoLayer, pstDispInfo, &stInfo);
        (pfTmpSendWinInfo)(pstWin->stCfg.stSource.hSrc, &stInfo);

    }

    /* Both hSrc and hSecondSrc are valid indicate there're two VPSSes:
        * BL+(EL+metadata)Dolby frame will enter this branch.
        */
    else if ((pstWin->stCfg.stSource.hSrc != HI_INVALID_HANDLE) &&
             (pstWin->stCfg.stSource.hSecondSrc != HI_INVALID_HANDLE))
    {
        /*set the first VPSS output attributes.Calculate V0 videoLayer's info.*/
        (HI_VOID)WinCalDobySourceInfo(pstWin, VDP_LAYER_VID0, pstDispInfo, &stInfo);
        (pfTmpSendWinInfo)(pstWin->stCfg.stSource.hSrc, &stInfo);

        /*set the second VPSS output attributes.Calulate V1 videoLayer's info.*/
        DISP_MEMSET(&stInfo, 0, sizeof(stInfo));
        (HI_VOID)WinCalDobySourceInfo(pstWin, VDP_LAYER_VID1, pstDispInfo, &stInfo);
        (pfTmpSendWinInfo)(pstWin->stCfg.stSource.hSecondSrc, &stInfo);
    }
    else
    {
        HI_ERR_WIN("hSrc is invalid!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}


HI_S32 WinGetSlaveWinAttr(HI_DRV_WIN_ATTR_S *pWinAttr,
                          HI_DRV_WIN_ATTR_S *pSlvWinAttr,
                          HI_BOOL bVirtScreen)
{
    HI_S32 nRet = HI_FAILURE;
    HI_DISP_DISPLAY_INFO_S stDispInfo, stSlaveDispInfo;
    HI_RECT_S stCanvas = {0};
    HI_RECT_S stMastOutRect = {0};
    HI_DRV_DISP_OFFSET_S stOffsetInfo = {0};

    DISP_MEMSET(pSlvWinAttr, 0, sizeof(HI_DRV_WIN_ATTR_S));
    DISP_MEMSET((void *)&stDispInfo, 0, sizeof(stDispInfo));
    DISP_MEMSET((void *)&stSlaveDispInfo, 0, sizeof(stSlaveDispInfo));

    // s1 get slave display
    nRet = DISP_GetSlave(pWinAttr->enDisp, &pSlvWinAttr->enDisp);
    if (nRet)
    {
        WIN_ERROR("Get slave Display failed\n");
        return nRet;
    }

    if (!DISP_IsOpened(pSlvWinAttr->enDisp) )
    {
        WIN_ERROR("Slave Display is not open\n");
        return HI_ERR_DISP_NOT_OPEN;
    }

    // s2 get master and slave display info
    pSlvWinAttr->bVirtual = HI_FALSE;

    /* may change when window lives */
    pSlvWinAttr->stCustmAR = pWinAttr->stCustmAR;
    pSlvWinAttr->enARCvrs  = pWinAttr->enARCvrs;

    /*now sd's crop is done by hd(vpss cropped),
       so in isogeny-wbc mode, sd's inrect and croprect should  re-calculated.
      */
    pSlvWinAttr->bUseCropRect = pWinAttr->bUseCropRect;
    pSlvWinAttr->stInRect    = pWinAttr->stInRect;
    pSlvWinAttr->stCropRect = pWinAttr->stCropRect;

    if (!bVirtScreen)
    {
        (HI_VOID)DISP_GetDisplayInfo(pWinAttr->enDisp, &stDispInfo);
        (HI_VOID)DISP_GetDisplayInfo(pSlvWinAttr->enDisp, &stSlaveDispInfo);

        stCanvas = stDispInfo.stFmtResolution;
        stOffsetInfo.u32Left = 0;
        stOffsetInfo.u32Top  = 0;
        stOffsetInfo.u32Right = 0;
        stOffsetInfo.u32Bottom = 0;

        stMastOutRect = pWinAttr->stOutRect;
        if ((stMastOutRect.s32Width == 0) || (stMastOutRect.s32Height == 0))
        {
            stMastOutRect.s32Width  = stCanvas.s32Width;
            stMastOutRect.s32Height = stCanvas.s32Height;
        }

        (HI_VOID)WinOutRectSizeConversion(&stCanvas,
                                          &stOffsetInfo,
                                          &stSlaveDispInfo.stFmtResolution,
                                          &stMastOutRect,
                                          &pSlvWinAttr->stOutRect);
    }
    else
    {
        pSlvWinAttr->stOutRect    = pWinAttr->stOutRect;
    }

    return HI_SUCCESS;
}

HI_S32 WinGetSlaveWinAttr2(WINDOW_S *pstWin,
                           HI_DRV_WIN_ATTR_S *pWinAttr,
                           HI_DRV_WIN_ATTR_S *pSlvWinAttr)
{
    HI_DISP_DISPLAY_INFO_S stDispInfo, stSlaveDispInfo;
    HI_RECT_S stCanvas = {0};
    HI_RECT_S stMastOutRect = {0};
    HI_DRV_DISP_OFFSET_S stOffsetInfo = {0};

    memset((void *)&stDispInfo, 0, sizeof(stDispInfo));
    memset((void *)&stSlaveDispInfo, 0, sizeof(stSlaveDispInfo));

    /* may change when window lives */
    pSlvWinAttr->stCustmAR = pWinAttr->stCustmAR;
    pSlvWinAttr->enARCvrs  = pWinAttr->enARCvrs;

    pSlvWinAttr->bUseCropRect = pWinAttr->bUseCropRect;
    pSlvWinAttr->stInRect    = pWinAttr->stInRect;
    pSlvWinAttr->stCropRect = pWinAttr->stCropRect;

    if (pstWin->bVirtScreenMode)
    {
        pSlvWinAttr->stOutRect  = pWinAttr->stOutRect;
    }
    else
    {
        (HI_VOID)DISP_GetDisplayInfo(pWinAttr->enDisp, &stDispInfo);
        (HI_VOID)DISP_GetDisplayInfo(pSlvWinAttr->enDisp, &stSlaveDispInfo);

        stCanvas = stDispInfo.stFmtResolution;
        stOffsetInfo.u32Left = 0;
        stOffsetInfo.u32Top  = 0;
        stOffsetInfo.u32Right = 0;
        stOffsetInfo.u32Bottom = 0;

        stMastOutRect = pWinAttr->stOutRect;
        if ((stMastOutRect.s32Width == 0) || (stMastOutRect.s32Height == 0))
        {
            stMastOutRect.s32Width  = stCanvas.s32Width;
            stMastOutRect.s32Height = stCanvas.s32Height;
        }

        (HI_VOID)WinOutRectSizeConversion(&stCanvas,
                                          &stOffsetInfo,
                                          &stSlaveDispInfo.stFmtResolution,
                                          &stMastOutRect,
                                          &pSlvWinAttr->stOutRect);
    }

    return HI_SUCCESS;
}

HI_S32 WinCheckFrame(HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = (HI_DRV_VIDEO_PRIVATE_S *) & (pFrameInfo->u32Priv[0]);

    if (pstPriv->u32LastFlag  == DEF_HI_DRV_VPSS_LAST_ERROR_FLAG)
    {
        return HI_SUCCESS;
    }

    pstPriv->u32PlayTime = 1;

    if (pFrameInfo->eFrmType >=  HI_DRV_FT_BUTT)
    {
        WIN_FATAL("Q Frame eFrmType error : %d, HI_DRV_FT_BUTT is %d.\n",
                  pFrameInfo->eFrmType, HI_DRV_FT_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->enSrcFrameType >=  HI_DRV_VIDEO_FRAME_TYPE_BUTT)
    {
        WIN_FATAL("Q Frame enSrcFrameType error : %d, HI_DRV_VIDEO_FRAME_TYPE_BUTT is %d.\n",
                  pFrameInfo->enSrcFrameType, HI_DRV_VIDEO_FRAME_TYPE_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_SDR)
    {
        HI_DRV_COLOR_SPACE_E  enInColorSpace = HI_DRV_CS_UNKNOWN;
        enInColorSpace = ((HI_DRV_VIDEO_PRIVATE_S *)&pFrameInfo->u32Priv[0])->eColorSpace;

        if ((HI_DRV_CS_DEFAULT >= enInColorSpace)
            || (HI_DRV_CS_BUTT <= enInColorSpace))
        {
            WIN_FATAL("Q Frame enInColorSpace error : %d.\n", enInColorSpace);
            return HI_ERR_VO_INVALID_PARA;
        }
    }

    if (pFrameInfo->enFieldMode >=  HI_DRV_FIELD_BUTT)
    {
        WIN_FATAL("Q Frame enFieldMode error : %d, HI_DRV_FIELD_BUTT is %d.\n",
                  pFrameInfo->enFieldMode, HI_DRV_FIELD_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }
    if (pFrameInfo->enBufValidMode >=  HI_DRV_FIELD_BUTT)
    {
        WIN_FATAL("Q Frame enBufValidMode error : %d, HI_DRV_FIELD_BUTT is %d.\n",
                  pFrameInfo->enBufValidMode, HI_DRV_FIELD_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->enBitWidth >=  HI_DRV_PIXEL_BITWIDTH_BUTT)
    {
        WIN_FATAL("Q Frame enBitWidth error : %d, HI_DRV_PIXEL_BITWIDTH_BUTT is %d.\n",
                  pFrameInfo->enBitWidth, HI_DRV_PIXEL_BITWIDTH_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->enTBAdjust >=  HI_DRV_VIDEO_TB_BUTT)
    {
        WIN_FATAL("Q Frame enTBAdjust error : %d, HI_DRV_VIDEO_TB_BUTT is %d.\n",
                  pFrameInfo->enTBAdjust, HI_DRV_VIDEO_TB_BUTT);
        return HI_ERR_VO_INVALID_PARA;
    }


    if (pFrameInfo->enCodecType >=  HI_DRV_STD_END_RESERVED)
    {
        WIN_FATAL("Q Frame enCodecType error : %d, HI_DRV_STD_END_RESERVED is %d.\n",
                  pFrameInfo->enCodecType, HI_DRV_STD_END_RESERVED);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (!( (HI_DRV_PIX_FMT_NV12 == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV21 == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV21_CMP  == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV21_TILE == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV21_TILE_CMP == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV61_2X1 == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_NV42 == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_RGB24 == pFrameInfo->ePixFormat)
           || (HI_DRV_PIX_FMT_ARGB8888 == pFrameInfo->ePixFormat)
         )
       )
    {
        WIN_FATAL("Q Frame pixformat error : %d\n", pFrameInfo->ePixFormat);
        return HI_ERR_VO_INVALID_PARA;
    }

    if ( (pFrameInfo->u32Width < WIN_FRAME_MIN_WIDTH)
         || (pFrameInfo->u32Width > WIN_FRAME_MAX_WIDTH)
         || (pFrameInfo->u32Height < WIN_FRAME_MIN_HEIGHT)
         || (pFrameInfo->u32Height > WIN_FRAME_MAX_HEIGHT)
       )
    {
        WIN_FATAL("Q Frame resolution error : w=%d,h=%d\n",
                  pFrameInfo->u32Width, pFrameInfo->u32Height);
        return HI_ERR_VO_INVALID_PARA;
    }

    pFrameInfo->stDispRect.s32X = 0;
    pFrameInfo->stDispRect.s32Y = 0;
    pFrameInfo->stDispRect.s32Width  = pFrameInfo->u32Width;
    pFrameInfo->stDispRect.s32Height = pFrameInfo->u32Height;

    if ((pFrameInfo->u32FrameRate > WIN_MAX_FRAME_RATE)
        || (0 == pFrameInfo->u32FrameRate))
    {
        WIN_ERROR("Q Frame u32FrameRate error:%d, max frame rate is %d.\n",
                  pFrameInfo->u32FrameRate, WIN_MAX_FRAME_RATE);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->stPlayInfor.u32PlayCnt > WIN_MAX_FRAME_PLAY_TIME)
    {
        WIN_ERROR("Q Frame u32PlayCnt error:%d, max play cnt is %d.\n",
                  pFrameInfo->stPlayInfor.u32PlayCnt, WIN_MAX_FRAME_PLAY_TIME);
        return HI_ERR_VO_INVALID_PARA;
    }

    if (((0 == pFrameInfo->stBufAddr[0].u32PhyAddr_Y)
         && (0 == pFrameInfo->stBufAddr[0].u32PhyAddr_YHead)
        )
        || (0 == pFrameInfo->stBufAddr[0].u32Stride_Y)
        || (4096 < pFrameInfo->stBufAddr[0].u32Stride_Y)
        || (0 == pFrameInfo->stBufAddr[0].u32Stride_C)
        || (4096 < pFrameInfo->stBufAddr[0].u32Stride_C)
       )
    {
        WIN_ERROR("Invalid addr:%x,%x, ystride %d!\n", pFrameInfo->stBufAddr[0].u32PhyAddr_Y, pFrameInfo->stBufAddr[0].u32PhyAddr_YHead,
                  pFrameInfo->stBufAddr[0].u32Stride_Y);
        return HI_ERR_VO_INVALID_PARA;
    }

    if ((0 != (pFrameInfo->stBufAddr[0].u32PhyAddr_Y & 0xF))
        || (0 != (pFrameInfo->stBufAddr[0].u32PhyAddr_C & 0xF))
        || (0 != (pFrameInfo->stBufAddr[0].u32PhyAddr_YHead & 0xF))
        || (0 != (pFrameInfo->stBufAddr[0].u32PhyAddr_CHead & 0xF))
        || (0 != (pFrameInfo->stBufAddr[0].u32Stride_Y & 0xF))
        || (0 != (pFrameInfo->stBufAddr[0].u32Stride_C & 0xF))
        || (pFrameInfo->stBufAddr[0].u32Stride_Y < pFrameInfo->u32Width)
        )
    {
        WIN_ERROR("Invalid addr %#x %#x %#x %#x %d %d \n",
            pFrameInfo->stBufAddr[0].u32PhyAddr_Y,
            pFrameInfo->stBufAddr[0].u32PhyAddr_C,
            pFrameInfo->stBufAddr[0].u32PhyAddr_YHead,
            pFrameInfo->stBufAddr[0].u32PhyAddr_CHead,
            pFrameInfo->stBufAddr[0].u32Stride_Y,
            pFrameInfo->stBufAddr[0].u32Stride_C);

        return HI_ERR_VO_INVALID_PARA;
    }

    if (pFrameInfo->enBitWidth == HI_DRV_PIXEL_BITWIDTH_10BIT)
    {
        if ( (0 != (pFrameInfo->stBufAddr_LB[0].u32PhyAddr_Y & 0xF))
            || (0 != (pFrameInfo->stBufAddr_LB[0].u32PhyAddr_C & 0xF))
            || (0 != (pFrameInfo->stBufAddr_LB[0].u32PhyAddr_YHead & 0xF))
            || (0 != (pFrameInfo->stBufAddr_LB[0].u32PhyAddr_CHead & 0xF))
            || (0 != (pFrameInfo->stBufAddr_LB[0].u32Stride_Y & 0xF))
            || (0 != (pFrameInfo->stBufAddr_LB[0].u32Stride_C & 0xF))
            || (0 ==  pFrameInfo->stBufAddr_LB[0].u32Stride_Y)
            || (0 ==  pFrameInfo->stBufAddr_LB[0].u32Stride_C))
        {
            WIN_ERROR("Invalid addr %#x %#x %#x %#x %d %d \n",
                pFrameInfo->stBufAddr_LB[0].u32PhyAddr_Y,
                pFrameInfo->stBufAddr_LB[0].u32PhyAddr_C,
                pFrameInfo->stBufAddr_LB[0].u32PhyAddr_YHead,
                pFrameInfo->stBufAddr_LB[0].u32PhyAddr_CHead,
                pFrameInfo->stBufAddr_LB[0].u32Stride_Y,
                pFrameInfo->stBufAddr_LB[0].u32Stride_C);

            return HI_ERR_VO_INVALID_PARA;
        }
    }

    return HI_SUCCESS;
}

HI_S32 WinAttachDefaultSource(WINDOW_S *pstWin)
{
    WB_SOURCE_INFO_S stSrc2Buf;
    HI_S32 nRet = HI_SUCCESS;

    memset(&stSrc2Buf, 0x0, sizeof(stSrc2Buf));
    /*when create window, default set the attach obj to vo it self.*/
    pstWin->stCfg.stSource.hSrc = pstWin->u32Index;
    pstWin->stCfg.stSource.pfAcqFrame = HI_NULL;
    pstWin->stCfg.stSource.pfRlsFrame = Win_ReleaseDisplayedFrame_ForDequeue;
    pstWin->stCfg.stSource.pfSendWinInfo = HI_NULL;
    pstWin->stCfg.stSource.hSecondSrc = HI_INVALID_HANDLE;

    /*and set the window's buffer  attach source.*/
    stSrc2Buf.hSrc = pstWin->u32Index;
    stSrc2Buf.hSecondSrc = HI_INVALID_HANDLE;
    stSrc2Buf.pfAcqFrame = HI_NULL;
    stSrc2Buf.pfRlsFrame = Win_ReleaseDisplayedFrame_ForDequeue;
    nRet =  WinBuf_SetSource(&pstWin->stBuffer.stWinBP, &stSrc2Buf);

    return nRet;
}

HI_S32 Win_ReleaseMMZ(WINDOW_S *pWindow);
HI_S32 Win_AllocateMMZ(WINDOW_S *pWindow)
{
    HI_U32 i = 0;
    HI_S32 nRet = HI_SUCCESS;
    DISP_MMZ_BUF_S stMmzBuf = {0};
    HI_U32 u32EachMemSize = 0;


    u32EachMemSize = (sizeof(S_VDP_QF_REGS_TYPE) + 15) & 0xfffffff0;
    nRet = DISP_OS_MMZ_AllocAndMap((const char *)"VDP_REG_NODE",
                                   VDP_MEM_TYPE_PHY,
                                    u32EachMemSize* WIN_ALG_MMZ_NUM,
                                   VDP_MEM_ALIGN,
                                   &stMmzBuf);
   if (nRet)
   {
      goto __ERR_RELEASE__;
   }

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
    {
       pWindow->stHardwareConfig.stNodeMMZ[i].bReady = HI_TRUE;
       pWindow->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz = stMmzBuf;
       pWindow->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz.u32Size = stMmzBuf.u32Size / WIN_ALG_MMZ_NUM ;
       pWindow->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz.u32StartPhyAddr = stMmzBuf.u32StartPhyAddr + i * u32EachMemSize;
       pWindow->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz.pu8StartVirAddr = (HI_U8 *)((HI_ULONG)stMmzBuf.pu8StartVirAddr
                                                                              + i * u32EachMemSize);
    }

    memset(&stMmzBuf, 0, sizeof(stMmzBuf));

    u32EachMemSize = (sizeof(S_VDP_REGS_TYPE) + 15) & 0xfffffff0;
    nRet = DISP_OS_MMZ_AllocAndMap((const char *)"VDP_VPSSCoef",
                                   VDP_MEM_TYPE_PHY,
                                   u32EachMemSize * WIN_ALG_MMZ_NUM,
                                   VDP_MEM_ALIGN,
                                   &stMmzBuf);
    if (nRet)
    {
       goto __ERR_RELEASE__;
    }

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
    {
       pWindow->stHardwareConfig.stVPSSMMZ[i].bReady = HI_TRUE;
       pWindow->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz = stMmzBuf;
       pWindow->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz.u32Size = stMmzBuf.u32Size / WIN_ALG_MMZ_NUM ;
       pWindow->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz.u32StartPhyAddr = stMmzBuf.u32StartPhyAddr + i * u32EachMemSize;
       pWindow->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz.pu8StartVirAddr = (HI_U8 *)((HI_ULONG)stMmzBuf.pu8StartVirAddr
                                                                              + i * u32EachMemSize);
    }

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
    {
       pWindow->stHardwareConfig.pstNodePrivateInfor[i] = DISP_MALLOC(sizeof(HW_NODE_PRIVATE_DEBUG_INFOR_S));
       if (HI_NULL == pWindow->stHardwareConfig.pstNodePrivateInfor[i])
       {
          goto __ERR_RELEASE__;
       }
    }

    return HI_SUCCESS;
__ERR_RELEASE__:
    Win_ReleaseMMZ(pWindow);
    return HI_ERR_VO_MALLOC_FAILED;
}

HI_S32 Win_ReleaseMMZ(WINDOW_S *pWindow)
{
    HI_U32 i = 0;
    DISP_MMZ_BUF_S stVideoAlgMmz = {0};


     for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
     {
         pWindow->stHardwareConfig.stNodeMMZ[i].bReady = HI_FALSE;
     }

     stVideoAlgMmz = pWindow->stHardwareConfig.stNodeMMZ[0].stVideoAlgMmz;
     stVideoAlgMmz.u32Size *= WIN_ALG_MMZ_NUM;

     if ((0 != stVideoAlgMmz.pu8StartVirAddr) && (0 != stVideoAlgMmz.u32StartPhyAddr))
     {
        DISP_OS_MMZ_UnmapAndRelease(&stVideoAlgMmz);
     }


     for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
     {
         pWindow->stHardwareConfig.stVPSSMMZ[i].bReady = HI_FALSE;
     }

     stVideoAlgMmz = pWindow->stHardwareConfig.stVPSSMMZ[0].stVideoAlgMmz;
     stVideoAlgMmz.u32Size *= WIN_ALG_MMZ_NUM;
     if ((0 != stVideoAlgMmz.pu8StartVirAddr) && (0 != stVideoAlgMmz.u32StartPhyAddr))
     {
        DISP_OS_MMZ_UnmapAndRelease(&stVideoAlgMmz);
     }

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
    {
       if (pWindow->stHardwareConfig.pstNodePrivateInfor[i] != HI_NULL)
       {
           DISP_FREE(pWindow->stHardwareConfig.pstNodePrivateInfor[i]);
           pWindow->stHardwareConfig.pstNodePrivateInfor[i] = HI_NULL;
       }
    }

    return HI_SUCCESS;
}

static HI_S32 WIN_Create_Seperate(HI_DRV_WIN_ATTR_S *pWinAttr,
                                  HI_HANDLE phWin,
                                  HI_U32    u32BufNum,
                                  WINDOW_S **pWindowReturn)
{
    WINDOW_S *pWindow = HI_NULL;
    HI_S32 nRet = HI_SUCCESS;
    HI_DISP_DISPLAY_INFO_S stDispInfo = {0};

    if (DISP_IsOpened(pWinAttr->enDisp) != HI_TRUE)
    {
        WIN_ERROR("DISP is not opened!\n");
        return HI_ERR_DISP_NOT_EXIST;
    }

    nRet = WinCreateDisplayWindow(pWinAttr, &pWindow, u32BufNum);
    if (nRet)
    {
        return nRet;
    }

    (HI_VOID)DISP_GetDisplayInfo(pWinAttr->enDisp, &stDispInfo);
    WinUpdateDispInfo(pWindow, &stDispInfo);

    /*before regcallback, create wbc first.*/
    nRet = WinRegCallback(pWindow);
    if (nRet)
    {
        goto __ERR_RET_DESTROY__;
    }

    nRet = WinAddWindow(pWindow->enDisp, pWindow);
    if (nRet)
    {
        goto __ERR_RET_UNREG_;
    }

    nRet = WinAttachDefaultSource(pWindow);
    if (nRet)
    {
        goto __ERR_RET_DELWIN;
    }

    /*this branch is for  main window,  only create wbc in  the first main window.*/
    if ((stDispWindow.eIsogeny_mode == ISOGENY_WBC_MODE)
        && DISP_IsFollowed(pWindow->enDisp))
    {
        stDispWindow.u32CurrentHdWindowCounts ++;
    }

    nRet = Win_AllocateMMZ(pWindow);
    if (HI_SUCCESS != nRet)
    {
        goto __ERR_RET_DELWIN;
    }

    *pWindowReturn  = pWindow;
    return HI_SUCCESS;

__ERR_RET_DELWIN:
    WinDelWindow(pWindow->u32Index);

__ERR_RET_UNREG_:
    WinUnRegCallback(pWindow);

__ERR_RET_DESTROY__:
    WinDestroyDisplayWindow(pWindow);
    return nRet;
}

HI_S32 WIN_Sync_DeInit(WINDOW_S *pstWindow);
extern HI_S32 DispBuf_GetListNodeNumber(COMMON_LIST_S *pstBuffer, HI_U32 *pu32Num);
extern HI_VOID  VDP_VID_GetLayerEnable    (HI_U32 u32Data, HI_U32 *pu32bEnable);

HI_S32 WIN_Destroy_Seperate(HI_HANDLE hWin)
{
    WINDOW_S *pstWin =  HI_NULL;
    WinCheckWindow(hWin, pstWin);

    /*check whether slave window can be destroy.*/
    if (HI_FALSE == WinCheckWhetherCanToDestroy(hWin))
    {
        return  HI_SUCCESS;
    }

    if (HI_SUCCESS != pstWin->stVLayerFunc.PF_ResetHwBuf(pstWin->u32VideoLayer, HI_TRUE, VDP_CYCBUF_RESET_MODE_BLACK))
    {
        WIN_ERROR("Window reset failed when destroyed!\n");
        return HI_ERR_VO_DESTROY_ERR;
    }

    /*disable  hardware first, after that  the software can be released.*/
    if (pstWin->bEnable == HI_TRUE)
    {
        (HI_VOID)WIN_SetEnable(hWin, HI_FALSE);
    }

    /* stop isr secondly.*/
    (HI_VOID)WinUnRegCallback(pstWin);

    WinDelWindow(pstWin->u32Index);

    if (WinCheckWhetherWbcIsogenyMode()
        && (pstWin->enType == HI_DRV_WIN_ACTIVE_MAIN_AND_SLAVE))
    {
        stDispWindow.u32CurrentHdWindowCounts --;
    }
    (HI_VOID)WinDestroyDisplayWindow(pstWin);

    return HI_SUCCESS;
}

HI_S32 WIN_Create_SlaveWin(HI_DRV_WIN_ATTR_S *pWinAttr,
                           HI_BOOL bVirtScreen,
                           HI_HANDLE *phSlvWin,
                           HI_VOID *pstMasterWin)
{
    HI_DRV_WIN_ATTR_S stSlvWinAttr;
    WINDOW_S *pSlaveWindow = HI_NULL;
    HI_U32 phWin = 0;
    HI_S32 nRet = 0;

    /*in isogeny wbc mode, the sd window is a singleton mode.*/
    if ((stDispWindow.eIsogeny_mode == ISOGENY_WBC_MODE)
        && (stDispWindow.u32CurrentHdWindowCounts > 1))
    {
        *phSlvWin = g_hSlaveWin;
        return  HI_SUCCESS;
    }

    /*in fact, in isogeny-wbc mode,  slave's winattr partly is generated
      * according to the wbc's output.
      */
    nRet = WinGetSlaveWinAttr(pWinAttr, &stSlvWinAttr, bVirtScreen);
    if (nRet)
    {
        WIN_ERROR("Get Slave WinAttr is invalid!\n");
        return HI_FAILURE;
    }

    nRet = WIN_Create_Seperate(&stSlvWinAttr,
                               phWin,
                               WIN_IN_FB_DEFAULT_NUMBER,
                               &pSlaveWindow);
    if (nRet)
    {
        WIN_ERROR("Creat slave window failed!\n");
        return HI_FAILURE;
    }

    /*pointer to each other.*/
    *phSlvWin    =  (HI_HANDLE)(pSlaveWindow->u32Index);
    g_hSlaveWin  =  (HI_HANDLE)(pSlaveWindow->u32Index);

    pSlaveWindow->pstMstWin = (HI_VOID *)pstMasterWin;
    pSlaveWindow->enType = HI_DRV_WIN_ACTIVE_SLAVE ;
    pSlaveWindow->bVirtScreenMode = bVirtScreen;

    /*in this func,  means this is  iso-geny already.*/
    if (stDispWindow.eIsogeny_mode != ISOGENY_WBC_MODE)
    {
        /*sync no support*/
    }

    return HI_SUCCESS;
}


/******************************************************************************
    apply function
******************************************************************************/
HI_S32 WIN_Create_MCE(HI_DRV_WIN_ATTR_S *pWinAttr, HI_HANDLE *phWin, HI_BOOL bVirtScreen)
{

    WINDOW_S *pstWin = HI_NULL;
    HI_S32 nRet = HI_SUCCESS;

    nRet = WIN_Create(pWinAttr, phWin, bVirtScreen);

    if (HI_SUCCESS == nRet)
    {
        WinCheckWindow(*phWin, pstWin);
        pstWin->bMCE = HI_TRUE;
    }

    return nRet;
}
HI_S32 WIN_Create(HI_DRV_WIN_ATTR_S *pWinAttr, HI_HANDLE *phWin, HI_BOOL bVirtScreen)
{
    HI_S32 nRet = HI_SUCCESS;
    WINDOW_S *pWindow = HI_NULL;
    HI_HANDLE hSlaveWin = 0;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pWinAttr);
    WinCheckNullPointer(phWin);
    DispCheckID(pWinAttr->enDisp);

    // s1 check attribute
    nRet = WinCheckAttr(pWinAttr, bVirtScreen);
    if (nRet)
    {
        WIN_ERROR("WinAttr is invalid!\n");
        return nRet;
    }

    if (!WinGetRegWinManageStatus())
    {
        WinRegWinManageCallback(HI_DRV_DISPLAY_0);
        WinRegWinManageCallback(HI_DRV_DISPLAY_1);
        WinSetRegWinManageStatus(HI_TRUE);
    }

    if (pWinAttr->bVirtual != HI_TRUE)
    {
        nRet = WIN_Create_Seperate(pWinAttr, *phWin, WIN_IN_FB_DEFAULT_NUMBER, &pWindow);
        if (nRet)
        {
            return nRet;
        }

        pWindow->bVirtScreenMode = bVirtScreen;
        *phWin = (HI_HANDLE)(pWindow->u32Index);
        g_hWin = (HI_HANDLE)(pWindow->u32Index);

        /*if master mode, create the slave window.*/
        if (DISP_IsFollowed(pWinAttr->enDisp) && ( HI_TRUE != WinCheckWhetherWbcIsogenyMode()))
        {
            nRet = WIN_Create_SlaveWin(pWinAttr,
                                       bVirtScreen,
                                       &hSlaveWin,
                                       pWindow);
            if (nRet)
            {
                goto __ERR_RET_UNREG_CB__;
            }

            pWindow->enType = HI_DRV_WIN_ACTIVE_MAIN_AND_SLAVE;
            pWindow->hSlvWin = hSlaveWin;

        }
        else
        {
            pWindow->enType = HI_DRV_WIN_ACTIVE_SINGLE;
        }

        return HI_SUCCESS;

    __ERR_RET_UNREG_CB__:
        WIN_Destroy_Seperate(pWindow->u32Index);
        return nRet;
    }
    else
    {
        WIN_ERROR("no supprot virtual win\n");
    }

    return HI_SUCCESS;
}


/*slave's  enable and create/destroy opts , are invisible above.**/
HI_S32 WIN_Destroy(HI_HANDLE hWin)
{
    WINDOW_S *pstWin;
    HI_S32 nRet = HI_SUCCESS;

    HI_HANDLE hSlaveWin = HI_INVALID_HANDLE;

    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);
    if (pstWin->hSlvWin)
    {
        hSlaveWin = pstWin->hSlvWin;
    }

    nRet = WIN_Destroy_Seperate(hWin);
    if (HI_SUCCESS != nRet)
    {
        return nRet;
    }

    /*destroy slave window first, then wbc.  because  if wbc destroyed first
      *, mem released either. slave window will have no mem to use.*/
    if (HI_INVALID_HANDLE != hSlaveWin)
    {
        nRet = WIN_Destroy_Seperate(hSlaveWin);
        if (HI_SUCCESS != nRet)
        {
            return nRet;
        }
    }


    return HI_SUCCESS;
}

HI_S32 WIN_CheckAttachState(HI_HANDLE hWin, HI_BOOL *pbSrcAttached, HI_BOOL *pbSinkAttached)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    if ((pstWin->stCfg.stSource.hSrc == HI_INVALID_HANDLE)
        || (pstWin->stCfg.stSource.hSrc == hWin))
    {
        *pbSrcAttached = HI_FALSE;
    }
    else
    {
        *pbSrcAttached = HI_TRUE;
    }

    *pbSinkAttached = HI_FALSE;


    return HI_SUCCESS;
}

/*get current number.*/
HI_U32 WIN_GetDisp1CurrentWinCnt(HI_VOID)
{
    return  stDispWindow.u32WinNumber[HI_DRV_DISPLAY_1];
}

HI_S32 WIN_SetAttr(HI_HANDLE hWin, HI_DRV_WIN_ATTR_S *pWinAttr)
{
    WINDOW_S *pstWin;
    HI_DRV_WIN_ATTR_S stSlvWinAttr;
    HI_DISP_DISPLAY_INFO_S stDispInfo;
    HI_S32 nRet = HI_SUCCESS;

    WINDOW_S *pstWinTmp = HI_NULL;
    //    HI_U32  u32Wait = 0;
    HI_SIZE_T irqflag = 0;
    HI_BOOL bCloseHdr = HI_FALSE;
    WinCheckDeviceOpen();
    WinCheckNullPointer(pWinAttr);

    memset((void *)&stSlvWinAttr, 0, sizeof(HI_DRV_WIN_ATTR_S));

    WinCheckWindow(hWin, pstWin);
    nRet = WinCheckFixedAttr(&pstWin->stCfg.stAttrBuf, pWinAttr);
    if (nRet)
    {
        return nRet;
    }

    nRet = WinCheckAttr(pWinAttr, pstWin->bVirtScreenMode);
    if (nRet)
    {
        return nRet;
    }
    if (HI_TRUE != WinCheckAttrChange(pWinAttr, &pstWin->stCfg.stAttrBuf))
    {
        WIN_WARN("set same attr!\n");
        return HI_SUCCESS;
    }

    nRet = DISP_GetDisplayInfo(pstWin->enDisp, &stDispInfo);
    if (nRet)
    {
        WIN_ERROR("DISP_GetDisplayInfo failed in %s!\n", __FUNCTION__);
        return HI_ERR_VO_CREATE_ERR;
    }

    pstWinTmp = (WINDOW_S *) DISP_MALLOC(sizeof(WINDOW_S));
    if (!pstWinTmp)
    {
        return HI_ERR_VO_MALLOC_FAILED;
    }

    *pstWinTmp = *pstWin;
    bCloseHdr = pstWinTmp->stCfg.stAttrBuf.bCloseHdrPath;
    pstWinTmp->stCfg.stAttrBuf = *pWinAttr;
    pstWinTmp->stCfg.stAttrBuf.bCloseHdrPath = bCloseHdr;
    WinUpdateDispInfo(pstWinTmp, &stDispInfo);

    /*to judge the layout valid or not.*/
    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    nRet =    WindowRedistributeProcess(pstWinTmp);
    if (nRet)
    {
        spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
        DISP_FREE(pstWinTmp);
        WIN_ERROR("reallocate video layer failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);

    /*update the formal window's initial fmt.*/
    WinUpdateDispInfo(pstWin, &stDispInfo);

    bCloseHdr = pstWin->stCfg.stAttrBuf.bCloseHdrPath;
    pstWin->stCfg.stAttrBuf = *pWinAttr;
    pstWin->stCfg.stAttrBuf.bCloseHdrPath = bCloseHdr;
    atomic_set(&pstWin->stCfg.bNewAttrFlag, 1);

    /*wait for the hal resources:such as physical layers, zorder to take effect.*/
    if (pstWin->bEnable)
    {
        (HI_VOID)WindowRedistributeProcess_Wait(pstWin, HI_TRUE);
        /* WIN_SetAttr and Win's interrupt process function may run in
                * different core, when interrupt process run after WIN_SetAttr,it will cause TIME-OUT.
                * therefore,add atomic_read NewAttrFlag here to avoid this problem.
                * Testing result shows that it takes about 1ms to run over all interrupt process functions
                * in DISP1(0% location),here max sleep 5ms to ensure Win's interrupt function be processed.
                */

        nRet = DISP_OSAL_WaitEvent(&pstWin->stWinQueueEvent, EVENT_WIN_ATTR_UP_COMPLET, 50);
        DISP_OSAL_ResetEvent(&pstWin->stWinQueueEvent, EVENT_WIN_NOTHING);

        if (HI_SUCCESS != nRet)
        {
            DISP_WARN("############ freeze TIMEOUT#########\n");
            return HI_ERR_VO_TIMEOUT;
        }
    }
    else
    {
        (HI_VOID)WindowRedistributeProcess_Wait(pstWin, HI_FALSE);
    }

    if (pstWin->hSlvWin)
    {
        /*only non-wbc mode , or 1 window in wbc-mode, can slave's attr be set. */
        if ((stDispWindow.eIsogeny_mode != ISOGENY_WBC_MODE) ||  (WIN_GetDisp1CurrentWinCnt() == 1))
        {
            WIN_GetAttr(pstWin->hSlvWin, &stSlvWinAttr);
            WinGetSlaveWinAttr2(pstWin, pWinAttr, &stSlvWinAttr);
            nRet = WIN_SetAttr(pstWin->hSlvWin, &stSlvWinAttr);
        }
    }

    DISP_FREE(pstWinTmp);

    return nRet;
}



HI_S32 WIN_GetAttr(HI_HANDLE hWin, HI_DRV_WIN_ATTR_S *pWinAttr)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckNullPointer(pWinAttr);

    WinCheckWindow(hWin, pstWin);
    *pWinAttr = pstWin->stCfg.stAttrBuf;

    return HI_SUCCESS;
}


//get info for source
HI_S32 WIN_GetInfo(HI_HANDLE hWin, HI_DRV_WIN_INFO_S *pstInfo)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstInfo);

    WinCheckWindow(hWin, pstWin);
    pstInfo->eType = WinGetType(pstWin);
    pstInfo->hPrim = (HI_HANDLE)(pstWin->u32Index);
    pstInfo->hSec  = (HI_HANDLE)(pstWin->hSlvWin);

    return HI_SUCCESS;
}

static HI_S32 WIN_ResetWithBlkFrm(HI_HANDLE hWin, HI_BOOL *pbEnable)
{
    HI_S32  nRet = HI_SUCCESS;

    (HI_VOID)WIN_GetEnable(hWin, pbEnable);
    if (HI_TRUE == *pbEnable)
    {
        nRet = WIN_Reset(hWin, HI_DRV_WIN_SWITCH_DEATTACHMODE_LAST);
    }
    else
    {
        nRet = WIN_Reset(hWin, HI_DRV_WIN_SWITCH_BLACK);
    }

    return nRet;
}

HI_S32 WIN_SetSdrSource(HI_HANDLE hWin, HI_DRV_WIN_SRC_INFO_S *pstSrc)
{
    HI_DISP_DISPLAY_INFO_S stDispInfo = {0};
    WB_SOURCE_INFO_S stSrc2Buf = {0};
    WINDOW_S *pstWin = HI_NULL;


    HI_S32 nRet = HI_SUCCESS;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstSrc);

    if (pstSrc->hSrc == HI_INVALID_HANDLE)
    {
        HI_BOOL bEnable = HI_FALSE;
        (HI_VOID)WIN_GetEnable(hWin, &bEnable);

        if (HI_TRUE == bEnable)
        {
            WIN_WARN("Reset Window HI_DRV_WIN_SWITCH_DEATTACHMODE_LAST\n");
            nRet = WIN_Reset(hWin, HI_DRV_WIN_SWITCH_DEATTACHMODE_LAST);
        }
        else
        {
            nRet = WIN_Reset(hWin, HI_DRV_WIN_SWITCH_BLACK);
        }

        if (HI_SUCCESS != nRet)
        {
            DISP_ERROR("Reset Window Failed\n");
            return nRet;
        }
    }


    WinCheckWindow(hWin, pstWin);

    nRet = DISP_GetDisplayInfo(WinGetDispID(pstWin), &stDispInfo);
    if (nRet)
    {
        return nRet;
    }

    if (pstWin->stCfg.stSource.hSrc == pstSrc->hSrc)
    {
        if (pstSrc->hSrc)
        {
            WIN_ERROR("Attach repeately!\n");
        }
        else
        {
            WIN_ERROR("Detach repeately!\n");
        }

        return HI_ERR_VO_OPERATION_DENIED;
    }

    pstWin->stCfg.stSource = *pstSrc;

    stSrc2Buf.hSrc = pstSrc->hSrc;
    stSrc2Buf.pfAcqFrame = pstSrc->pfAcqFrame;
    stSrc2Buf.pfRlsFrame = pstSrc->pfRlsFrame;
    nRet =  WinBuf_SetSource(&pstWin->stBuffer.stWinBP, &stSrc2Buf);

    if (nRet)
    {
        return nRet;
    }

    // send attr to source
    WinSendAttrToSource(pstWin, &stDispInfo);

    return HI_SUCCESS;
}

HI_S32 WIN_SetHdrSource(HI_HANDLE hWin, HI_DRV_WIN_SRC_INFO_S *pstSrc)
{
    HI_DISP_DISPLAY_INFO_S stDispInfo;
    WB_SOURCE_INFO_S stSrc2Buf;
    WINDOW_S *pstWin;
    HI_BOOL bEnable = HI_FALSE;
    HI_S32 nRet = HI_SUCCESS;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstSrc);

    if ((HI_INVALID_HANDLE == pstSrc->hSrc) &&
        (pstSrc->hSecondSrc != HI_INVALID_HANDLE))
    {
        WIN_ERROR("Not support,BL is invalid while EL is valid!\n");
        return HI_ERR_VO_INVALID_OPT;
    }

    if ((HI_INVALID_HANDLE == pstSrc->hSrc) &&
        (HI_INVALID_HANDLE == pstSrc->hSecondSrc))
    {
        nRet = WIN_ResetWithBlkFrm(hWin, &bEnable);
        if (HI_SUCCESS != nRet)
        {
            return nRet;
        }
    }

    if ((HI_INVALID_HANDLE != pstSrc->hSrc) &&
        (HI_INVALID_HANDLE == pstSrc->hSecondSrc))
    {
        nRet = WIN_ResetWithBlkFrm(hWin, &bEnable);
        if (HI_SUCCESS != nRet)
        {
            return nRet;
        }
    }

    WinCheckWindow(hWin, pstWin);

    nRet = DISP_GetDisplayInfo(WinGetDispID(pstWin), &stDispInfo);
    if (HI_SUCCESS != nRet)
    {
        return nRet;
    }
    if (HI_INVALID_HANDLE == pstSrc->hSrc)
    {
        if ((pstWin->stCfg.stSource.hSrc == pstSrc->hSrc) &&
            (pstWin->stCfg.stSource.hSecondSrc == pstSrc->hSecondSrc))
        {
            WIN_ERROR("Detach repeately!\n");
            return HI_ERR_VO_OPERATION_DENIED;
        }
    }
    else
    {
        if ((pstWin->stCfg.stSource.hSrc == pstSrc->hSrc) &&
            (pstWin->stCfg.stSource.hSecondSrc == pstSrc->hSecondSrc))
        {
            WIN_ERROR("Attach repeately!\n");
            return HI_ERR_VO_OPERATION_DENIED;
        }
    }
    pstWin->stCfg.stSource = *pstSrc;

    stSrc2Buf.hSrc = pstSrc->hSrc;
    stSrc2Buf.hSecondSrc = pstSrc->hSecondSrc;
    stSrc2Buf.pfAcqFrame = pstSrc->pfAcqFrame;
    stSrc2Buf.pfRlsFrame = pstSrc->pfRlsFrame;
    nRet =  WinBuf_SetSource(&pstWin->stBuffer.stWinBP, &stSrc2Buf);

    if (HI_SUCCESS != nRet)
    {
        return nRet;
    }

    // send attr to source
    WinSendAttrToSource(pstWin, &stDispInfo);

    return HI_SUCCESS;
}

HI_S32 WIN_SetSource(HI_HANDLE hWin, HI_DRV_WIN_SRC_INFO_S *pstSrc)
{
    HI_S32    s32Ret;
    WINDOW_S *pstWin;

    if ((pstSrc->hSrc == HI_INVALID_HANDLE) && (pstSrc->hSecondSrc != HI_INVALID_HANDLE))
    {
        WIN_ERROR("Invalid hsrc number:%x,%x\n", pstSrc->hSrc, pstSrc->hSecondSrc);
        return HI_ERR_VO_INVALID_PARA;
    }


    WinCheckWindow(hWin, pstWin);
    DispCheckID(pstWin->enDisp);

    if ((HI_DRV_WINDOW_MODE_NORMAL == pstWin->enWinMode)
        || (HI_DRV_WINDOW_MODE_HDR == pstWin->enWinMode))
    {
        pstSrc->hSecondSrc = HI_INVALID_HANDLE;
        s32Ret = WIN_SetSdrSource(hWin, pstSrc);
        if (HI_SUCCESS != s32Ret)
        {
            WIN_ERROR("set sdrsource failed\n");
            return  s32Ret;
        }
    }
    else if (HI_DRV_WINDOW_MODE_DOLBY == pstWin->enWinMode)
    {
        s32Ret = WIN_SetHdrSource(hWin, pstSrc);
        if (HI_SUCCESS != s32Ret)
        {
            WIN_ERROR("set dolbysource failed\n");
            return  s32Ret;
        }
    }
    else
    {
        return HI_ERR_VO_WIN_UNSUPPORT;
    }

    if (HI_INVALID_HANDLE == pstSrc->hSrc)
    {
        WinDebug_SetDataFlowPath(&pstWin->stWinInfoForDeveloper, HI_DATA_FLOW_QUEUE_DEQUEUE);
    }
    else
    {
        WinDebug_SetDataFlowPath(&pstWin->stWinInfoForDeveloper, HI_DATA_FLOW_QUEUE_ISRRELEASE);
    }


    return s32Ret;
}
HI_S32 WIN_GetSource(HI_HANDLE hWin, HI_DRV_WIN_SRC_INFO_S *pstSrc)
{
    WINDOW_S *pstWin;


    WinCheckDeviceOpen();
    WinCheckNullPointer(pstSrc);

    WinCheckWindow(hWin, pstWin);
    *pstSrc = pstWin->stCfg.stSource;

    return HI_SUCCESS;
}

/*
1) whether salve;
2) now window's num;
3) wbc mode or not?
3) enable or not.
4) if enable == pstwin's enable status, return;
   output: whether allow to set enable or not.
*/
HI_BOOL WIN_Judge_WhetherCanSetEnable(WINDOW_S *pstWin, HI_BOOL bEnable)
{
    HI_U32 i = 0, u32WinEnableNum = 0;

    /*if  flag is the same with previous setting, do nothing.*/
    if (bEnable == pstWin->bEnable)
    {
        WIN_WARN("Set the same enable Flag.!\n");
        return HI_FALSE;
    }

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i]
            && (stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i]->bEnable))
        {
            u32WinEnableNum ++;
        }
    }

    if (HI_DRV_WIN_ACTIVE_MAIN_AND_SLAVE == WinGetType(pstWin)
        || HI_DRV_WIN_ACTIVE_SINGLE == WinGetType(pstWin)
        || HI_DRV_WIN_VITUAL_SINGLE == WinGetType(pstWin))
    {
        /*if master,  do not  make limit.*/
        return HI_TRUE;
    }
    else
    {
        /*only  slave window not in wbc mode can do freeze.*/
        if (stDispWindow.eIsogeny_mode != ISOGENY_WBC_MODE)
        {
            /*if non-wbc isogeny mode, enable  do not make limit.*/
            return HI_TRUE;
        }
        else
        {
            if ((bEnable) && (u32WinEnableNum > 0))
            {
                /*if enable, only in condition:  more than 1 window enabled. */
                return HI_TRUE;
            }
            else if ((!bEnable) && (u32WinEnableNum == 0))
            {
                /*if disabled, only in condition:  all the window disabled. */
                return HI_TRUE;
            }

            return HI_FALSE;
        }
    }

}

HI_S32 WIN_SetEnable_Seperate(WINDOW_S *pstWin, HI_BOOL bEnable)
{
    HI_S32 ret = HI_SUCCESS;
    WINDOW_S *pstWinTmp = HI_NULL;
    HI_DISP_DISPLAY_INFO_S stDispInfo;
    HI_SIZE_T irqflag = 0;

    /*if isogeny wbc mode, and slave window, we should give a refcnt increase.*/
    if (HI_FALSE == WIN_Judge_WhetherCanSetEnable(pstWin, bEnable))
    {
        return HI_SUCCESS;
    }

    memset((void *)&stDispInfo, 0, sizeof(HI_DISP_DISPLAY_INFO_S));
    pstWinTmp = (WINDOW_S *) DISP_MALLOC(sizeof(WINDOW_S));
    if (!pstWinTmp)
    {
        WIN_ERROR("malloc failed\n");
        return HI_ERR_VO_MALLOC_FAILED;
    }

    *pstWinTmp = *pstWin;
    pstWinTmp->bEnable =  bEnable;

    ret = DISP_GetDisplayInfo(pstWin->enDisp, &stDispInfo);
    if (ret)
    {
        stDispInfo.stFmtResolution.s32X = 0;
        stDispInfo.stFmtResolution.s32Y = 0;
        stDispInfo.stFmtResolution.s32Width = 1280;
        stDispInfo.stFmtResolution.s32Height = 720;
        memset((void *)&stDispInfo.stOffsetInfo, 0, sizeof(HI_DRV_DISP_OFFSET_S));
        WIN_WARN("when call set_enable, may ctrl+c, display closed\n");
    }

    /* when enable,may cause win-layer remapping.*/
    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    ret =  WindowRedistributeProcess(pstWinTmp);
    if (ret)
    {
        spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
        DISP_FREE(pstWinTmp);
        return ret;
    }

    pstWin->bEnable = bEnable;
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);

    (HI_VOID)WindowRedistributeProcess_Wait(pstWinTmp, HI_FALSE);
    DISP_FREE(pstWinTmp);
    return HI_SUCCESS;
}

HI_S32 WIN_SetEnable(HI_HANDLE hWin, HI_BOOL bEnable)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 ret = HI_SUCCESS;

    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);

    /*if window has opened, return hi_success.*/
    if (pstWin->bEnable == bEnable)
    {
        return HI_SUCCESS;
    }

    if ((ret = WIN_SetEnable_Seperate(pstWin, bEnable)))
    {
        WIN_ERROR("main window enable error:%x\n", ret);
        return ret;
    }

    if (HI_FALSE == bEnable)
    {
        pstWin->stVLayerFunc.PF_SetEnable(VDP_LAYER_VID0, bEnable);
        msleep(50);
    }

    return HI_SUCCESS;
}

HI_S32 WIN_GetEnable(HI_HANDLE hWin, HI_BOOL *pbEnable)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pbEnable);

    WinCheckWindow(hWin, pstWin);
    *pbEnable = pstWin->bEnable;


    return HI_SUCCESS;
}

#define WIN_PROCESS_CALC_TIME_THRESHOLD 10
#define WIN_DELAY_TIME_MAX_CIRCLE 50
HI_S32 WIN_CalcDelayTime(WINDOW_S *pstWin, HI_U32 *pu32BufNum, HI_U32 *pu32RemainBufNum,HI_U32 *pu32DelayMs)
{
    HI_U32 u32CircleTime = 0, u32LeftTime = 0, u32FullFrameNode1 = 0, u32UsingFrameNode1 = 0;
    VDP_DRV_LAYER_INFO_S stBufInfor = {0};

    (HI_VOID)DISP_GetVbiTimeInfo(pstWin->enDisp, &u32CircleTime, &u32LeftTime);

    if (pstWin->stVLayerFunc.PF_GetTotalBufStatus)
    {
       (HI_VOID)pstWin->stVLayerFunc.PF_GetTotalBufStatus(pstWin->u32VideoLayer, &stBufInfor);
    }

    *pu32DelayMs = stBufInfor.u32TotalPlayCnts * u32CircleTime + u32LeftTime;

    DispBuf_GetListNodeNumber(&pstWin->stBuffer.stWinBP.stBuffer.stFullArray, &u32FullFrameNode1);
    DispBuf_GetListNodeNumber(&pstWin->stBuffer.stWinBP.stBuffer.stUsingArray, &u32UsingFrameNode1);
    if (HI_TRUE == pstWin->stPlayInfor.bLastFrame)
    {
        /*if last frame, we can't collect value from register, just use softarray, since online mode,
                one node is needed, so if <=1, just return eos.*/
        *pu32BufNum = u32FullFrameNode1 +  u32UsingFrameNode1;
        if (*pu32BufNum <= 1)
        {
            *pu32BufNum = 0;
        }
    }
    else
    {
        /*when not finished, this value is for avsync*/
        *pu32BufNum = stBufInfor.u32TotalPlayCnts;
    }

    return HI_SUCCESS;
}

HI_S32 WIN_GetPlayInfo(HI_HANDLE hWin, HI_DRV_WIN_PLAY_INFO_S *pstInfo)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstInfo);
    WinCheckWindow(hWin, pstWin);

    if (!pstWin->bEnable || !pstWin->stDelayInfo.u32DispRate)
    {
        WIN_WARN("window is not ready! state:%d dispRate:%d\n",
                 pstWin->bEnable,
                 pstWin->stDelayInfo.u32DispRate);
        return HI_ERR_VO_INVALID_OPT;
    }

    WIN_CalcDelayTime(pstWin, &(pstInfo->u32FrameNumInBufQn), &(pstInfo->u32RemainFrameNum), &(pstInfo->u32DelayTime));
    pstInfo->u32DispRate = pstWin->stDelayInfo.u32DispRate;
    pstInfo->u32UnderLoad = pstWin->stBuffer.u32UnderLoad;

    return HI_SUCCESS;
}

HI_S32 WinPutNewFrameIntoBufNode(WB_POOL_S *pstWinBP,
                                 WIN_XDR_FRAME_S *pstWinXdrFrm,
                                 HI_U32  u32PlayCnt)
{
    HI_S32  nRet = HI_SUCCESS;

    WinCheckNullPointer(pstWinBP);
    WinCheckNullPointer(pstWinXdrFrm);

    nRet = WinBuf_PutNewHdrFrame(pstWinBP, pstWinXdrFrm, u32PlayCnt);

    return nRet;
}

HI_S32 WinStatisticLowdelayTimeInfor(HI_HANDLE hWin,
                                     HI_DRV_VIDEO_FRAME_S *pFrameInfo,
                                     HI_LD_Event_ID_E eLDEventId)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckWindow(hWin, pstWin);

    if (pstWin->enType == HI_DRV_WIN_ACTIVE_MAIN_AND_SLAVE
        || pstWin->enType == HI_DRV_WIN_ACTIVE_SINGLE)
    {
        HI_LD_Event_S evt = {0};
        HI_U32 TmpTime = 0;

        if (((EVENT_VO_FRM_IN == eLDEventId) && (pFrameInfo->u32FrameIndex == pstWin->u32LastInLowDelayIdx))
            ||  ((EVENT_VO_FRM_OUT == eLDEventId) && (pFrameInfo->u32FrameIndex == pstWin->u32LastOutLowDelayIdx)))
        {
            return HI_SUCCESS;
        }

        (HI_VOID)HI_DRV_SYS_GetTimeStampMs(&TmpTime);

        evt.evt_id = eLDEventId;
        evt.frame = pFrameInfo->u32FrameIndex;
        evt.handle = pFrameInfo->hTunnelSrc;
        evt.time = TmpTime;
        HI_DRV_LD_Notify_Event(&evt);

        if (EVENT_VO_FRM_IN == eLDEventId)
        {
            pstWin->u32LastInLowDelayIdx = pFrameInfo->u32FrameIndex;
        }
        else if (EVENT_VO_FRM_OUT == eLDEventId)
        {
            pstWin->u32LastOutLowDelayIdx = pFrameInfo->u32FrameIndex;
        }

    }

    return HI_SUCCESS;
}

HI_BOOL checkAlgMemReady(WINDOW_S *pstWin)
{
    HI_U32 i = 0;

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
     {
         if (pstWin->stHardwareConfig.stNodeMMZ[i].bReady == HI_TRUE)
         {
             //pstWin->stNodeMMZ[i].bReady = HI_FALSE;
             break;
         }
     }

     if (i >= WIN_ALG_MMZ_NUM)
     {
         return HI_FALSE;
     }

     return HI_TRUE;
}

HI_U32 CheckWhetherCanQueueFrame(WINDOW_S * pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (HI_FALSE == checkAlgMemReady(pstWin))
    {
       WIN_INFO("can not alloctate alg mem\n");
       return HI_ERR_VO_BUFQUE_FULL;
    }

    if ((pstWin->stPlayInfor.u32LastQueueFrameAddr == pstFrame->stBufAddr[0].u32PhyAddr_Y))
    {
        WIN_ERROR("Should not send the same addr to VDP:%x!\n", pstWin->stPlayInfor.u32LastQueueFrameAddr);
        return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_BOOL  CheckHardwareResetFinish(WINDOW_S * pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    return HI_TRUE;
}

HI_VOID pushBufNodeToArray(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    return ;
}

static HI_VOID Win_PROC_RegisterFramePlayInfor(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    HI_U32 u32PlayCnt = pFrameInfo->stPlayInfor.u32PlayCnt;

    if (pstWin->stWinDebugInfo.stWinPlayStatus.u32FirstQueueTime == 0)
    {
        DISP_OS_GetTime(&pstWin->stWinDebugInfo.stWinPlayStatus.u32FirstQueueTime);
    }

    pstWin->stWinDebugInfo.stWinPlayStatus.u32TotalFrame ++;
    pstWin->stWinDebugInfo.stWinPlayStatus.u32TotalPlayCnt += u32PlayCnt;

    DISP_OS_GetTime(&pstWin->stWinDebugInfo.stWinPlayStatus.u32CurrentTime);
    return;
}

HI_VOID Win_GetFodReviseResult(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_DRV_WIN_FIELDORDER_E eFodResult = WIN_FIELDORDER_BUTT;


    if (WIN_FIELDORDER_BUTT == pstWin->stPlayCtrl.eFieldOrder)
    {
        pstWin->stPlayCtrl.eFieldOrder = pstFrame->bTopFieldFirst ?  WIN_FIELDORDER_TOPFIRST : WIN_FIELDORDER_BOTTOMFIRST;
    }
    else
    {
        eFodResult = Win_PQAlg_GetFodResult(pstWin);
        if ((WIN_FIELDORDER_TOPFIRST == eFodResult)
            || (WIN_FIELDORDER_BOTTOMFIRST == eFodResult))
        {
            pstWin->stPlayCtrl.eFieldOrder = eFodResult;
           // WIN_ERROR("fod result %d\n", pstWin->stPlayCtrl.eFieldOrder);
        }
    }

    if ((WIN_FIELDORDER_TOPFIRST == pstWin->stPlayCtrl.eFieldOrder)
        || (WIN_FIELDORDER_BOTTOMFIRST == pstWin->stPlayCtrl.eFieldOrder))
    {
        pstFrame->bTopFieldFirst = (WIN_FIELDORDER_TOPFIRST == pstWin->stPlayCtrl.eFieldOrder) ? HI_TRUE : HI_FALSE;
    }

    return;
}

HI_S32 Win_ReviseFrameInfo(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_BOOL bSingleFieldFrameMode = HI_FALSE;

    WIN_POLICY_ReviseProgressive(pstFrame,pstWin->stPlayCtrl.eWinFrameForceFlag);
    WIN_POLICY_CheckSingleFieldMode(pstFrame, &bSingleFieldFrameMode);
    WIN_POLICY_ReviseSize(pstFrame, bSingleFieldFrameMode);
    (HI_VOID)XDP_RWZB_Calc(pstWin->pstRwzb, pstFrame);
    return s32Ret;
}

HI_BOOL Win_CheckFrameRelease(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (HI_TRUE == pstFrame->bProgressive)
    {
        if (0 == pstFrame->stPlayInfor.u32PlayCnt)
        {
            return HI_TRUE;
        }
    }

    return HI_FALSE;
}

HI_S32 WinQueueFrame(HI_HANDLE hWin, WIN_XDR_FRAME_S *pstWinXdrFrm)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 nRet = HI_SUCCESS;
    HI_DRV_VIDEO_FRAME_S *pFrameInfo = HI_NULL;
    HI_DISP_DISPLAY_INFO_S stDispInfo = {0};
    HI_SIZE_T irqflag = 0;
    WIN_XDR_FRAME_S *pstWinXdrFrmTmp = HI_NULL;
    HI_DRV_VIDEO_PRIVATE_S *pstFramePriv = HI_NULL;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstWinXdrFrm);
    WinCheckWindow(hWin, pstWin);

    pFrameInfo = &pstWinXdrFrm->stBaseFrm;
    nRet = WinCheckFrame(pFrameInfo);
    if (nRet)
    {
        WIN_ERROR("win frame parameters invalid\n");
        return HI_ERR_VO_FRAME_INFO_ERROR;
    }

    /*if frame is valid, just add try counts.*/
    WinBuf_DebugAddTryQF(pstWin->stBuffer.stWinBP.pstDebugInfo);

    if (HI_FALSE == pstWin->bEnable)
    {
        WIN_ERROR("Window is disabled\n");
        return HI_ERR_VO_WIN_NOT_ENABLE;
    }

    nRet = CheckWhetherCanQueueFrame(pstWin, pFrameInfo);
    if (HI_SUCCESS != nRet)
    {
        DISP_ASSERT((nRet == HI_ERR_VO_BUFQUE_FULL));
        return nRet;
    }

    Win_ReviseFrameInfo(pstWin, pFrameInfo);
    if (HI_TRUE == Win_CheckFrameRelease(pstWin, pFrameInfo))
    {
        WinBuf_DebugAddQFOK(pstWin->stBuffer.stWinBP.pstDebugInfo);
        return Win_FrameOneRelease(pstWin, pFrameInfo);
    }

    pstFramePriv = ((HI_DRV_VIDEO_PRIVATE_S *)&pFrameInfo->u32Priv[0]);
    if (DEF_HI_DRV_VPSS_LAST_ERROR_FLAG == pstFramePriv->u32LastFlag)
    {
        pstWinXdrFrmTmp = WinGetLastFrameInfor();
        pFrameInfo = &pstWinXdrFrmTmp->stBaseFrm;

        WIN_WARN("Eos,field mode:%d, prog:%d \n", pFrameInfo->enFieldMode, pFrameInfo->bProgressive);

        if ((pFrameInfo->enFieldMode < HI_DRV_FIELD_ALL)
            || (HI_TRUE == pFrameInfo->bProgressive))
        {
            pstWin->stPlayInfor.bLastFrame = (DEF_HI_DRV_VPSS_LAST_ERROR_FLAG == pstFramePriv->u32LastFlag);
            WIN_WARN("When last frame is not all, it's not neccesarry to drain the buffer.\n");
            return HI_SUCCESS;
        }

        Win_RegenerateLastFrame(&pstWinXdrFrmTmp->stBaseFrm);
    }
    else
    {
        pstWinXdrFrmTmp =  pstWinXdrFrm;
    }

    nRet = WinAllocateAlgMMZ(pstWin, pFrameInfo);
    if (HI_SUCCESS != nRet)
    {
        WIN_ERROR("Allocate alg mmz failed\n");
        return nRet;
    }

    pFrameInfo->stLowdelayStat.u32WinConfigTime = 0;
    nRet = WinPutNewFrameIntoBufNode(&pstWin->stBuffer.stWinBP, pstWinXdrFrmTmp, 1);
    if (HI_SUCCESS != nRet)
    {
        WIN_ERROR("buff full!\n");
        return HI_ERR_VO_BUFQUE_FULL;
    }

    (HI_VOID)HI_DRV_SYS_GetTimeStampMs(&(pFrameInfo->stLowdelayStat.u32WinGetFrameTime));
    (HI_VOID)WinStatisticLowdelayTimeInfor(hWin, pFrameInfo, EVENT_VO_FRM_IN);
    Win_PROC_RegisterFramePlayInfor(pstWin, pFrameInfo);
    WinStoreLastFrameInfor(pstWinXdrFrm);
    pstWin->stPlayInfor.u32LastQueueFrameAddr = pFrameInfo->stBufAddr[0].u32PhyAddr_Y;

    if ((HI_DRV_WIN_SWITCH_BUTT != pstWin->stFrz.enFreezeMode) && (HI_TRUE == pstWin->stFrz.bEnable))
    {
        return HI_SUCCESS;
    }

    spin_lock_irqsave(&g_Mask_Lock, irqflag);
    (HI_VOID)DISP_GetDisplayInfo(pstWin->enDisp, &stDispInfo);
    Thread_CallbackForWinProcess(pstWin,&stDispInfo);
    DISP_XDR_IsrProcess_ext(pstWin->enDisp);
    spin_unlock_irqrestore(&g_Mask_Lock, irqflag);
    return HI_SUCCESS;
}

HI_S32 WIN_QueueFrame(HI_HANDLE hWin, WIN_XDR_FRAME_S *pstWinXdrFrm)
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = HI_NULL;

    WinCheckNullPointer(pstWinXdrFrm);
    pstWinXdrFrm->stBaseFrm.u32StillFrame = HI_DRV_FRAME_NORMAL;

    pstPriv = (HI_DRV_VIDEO_PRIVATE_S *)&pstWinXdrFrm->stBaseFrm.u32Priv[0];
    /*if come into this func , means non-fence mode.*/
    pstPriv->bForFenceUse = HI_FALSE;

    return WinQueueFrame(hWin, pstWinXdrFrm);
}

HI_S32 WIN_QueueUselessFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 nRet = HI_SUCCESS;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pFrameInfo);

    WinCheckWindow(hWin, pstWin);
    nRet = WinCheckFrame(pFrameInfo);
    if (nRet)
    {
        WIN_ERROR("win frame parameters invalid\n");
        return HI_ERR_VO_FRAME_INFO_ERROR;
    }

    if (pstWin->bEnable == HI_TRUE)
    {
        nRet = WinBufferPutULSFrame(&pstWin->stBuffer, pFrameInfo);
        if (nRet)
        {
            WIN_WARN("quls failed\n");
            return HI_ERR_VO_BUFQUE_FULL;
        }
    }
    else
    {
        WIN_ERROR("Window is disabled\n");
        return HI_ERR_VO_INVALID_OPT;
    }


    return HI_SUCCESS;
}

HI_S32 WIN_DequeueFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    HI_S32 nRet = HI_FAILURE;
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pFrameInfo);
    WinCheckWindow(hWin, pstWin);

    nRet = Win_Dequeue_DisplayedFrame(hWin, pFrameInfo);

    return nRet;
}

HI_S32 WIN_SetZorder(HI_HANDLE hWin, HI_DRV_DISP_ZORDER_E enZFlag)
{
    return HI_SUCCESS;
}

HI_S32 WIN_GetZorder(HI_HANDLE hWin, HI_U32 *pu32Zorder)
{
    WINDOW_S *pstWin;
    HI_S32 nRet = HI_SUCCESS;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pu32Zorder);

    WinCheckWindow(hWin, pstWin);
    *pu32Zorder = pstWin->u32Zorder;

    return nRet;
}

extern HI_DRV_VIDEO_FRAME_S *Win_HW_BufGetConfigFrame(WB_POOL_S *pstWinBP, HI_BOOL bDeleteTheNode);

HI_S32 WIN_Freeze(HI_HANDLE hWin, HI_BOOL bEnable, HI_DRV_WIN_SWITCH_E enFrz)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;

    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);
    if (enFrz >= HI_DRV_WIN_SWITCH_BUTT)
    {
        WIN_ERROR("Freeze mode is invalid!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if ((pstWin->stFrz.bEnable != bEnable) && (HI_FALSE == bEnable))
    {
        pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP, HI_FALSE);
        while(HI_NULL != pstFrame)
        {
            Win_FrameOneRelease(pstWin, pstFrame);
            pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP, HI_TRUE);
            WinBuf_DeleteDisplayedFrame(&pstWin->stBuffer.stWinBP, pstFrame);
            pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP, HI_FALSE);
        }
    }

    pstWin->stFrz.enFreezeMode = enFrz;
    pstWin->stFrz.bEnable      = bEnable;

    if (pstWin->stFrz.bEnable == HI_TRUE)
    {
        s32Ret= WIN_ResetSeperate(hWin, pstWin->stFrz.enFreezeMode);
    }

    return s32Ret;
}

HI_S32 WIN_GetFreezeStatus(HI_HANDLE hWin, HI_BOOL *pbEnable, HI_DRV_WIN_SWITCH_E *penFrz)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckNullPointer(penFrz);
    WinCheckNullPointer(pbEnable);


    WinCheckWindow(hWin, pstWin);
    *pbEnable = pstWin->stFrz.bEnable;
    *penFrz = pstWin->stFrz.enFreezeMode;

    return HI_SUCCESS;
}

HI_BOOL WinGetResetEvent(WINDOW_S * pstWin, HI_DRV_VIDEO_FRAME_S *pstWinXdrFrm)
{
    return pstWin->stWinStatus.bResetOccur;
}

HI_VOID WinSetResetEvent(WINDOW_S *pstWin, HI_BOOL bReset, HI_DRV_WIN_SWITCH_E enRst)
{
    pstWin->stWinStatus.bResetOccur = bReset;
    pstWin->stWinStatus.enResetEventMode = enRst;
    return;
}

HI_S32 WIN_ResetSeperate(HI_HANDLE hWin, HI_DRV_WIN_SWITCH_E enRst)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckWindow(hWin, pstWin);

    /*in wbc mode, the slave window does not need to be reset.*/
    if ((pstWin->enType == HI_DRV_WIN_ACTIVE_SLAVE)
        && (stDispWindow.eIsogeny_mode == ISOGENY_WBC_MODE))
    {
        return HI_SUCCESS;
    }

    if ((HI_FALSE == pstWin->bEnable) && (HI_DRV_WIN_SWITCH_DEATTACHMODE_LAST == pstWin->stRst.enResetMode))
    {
        WIN_ERROR("Invalid opt, can't display still frame when window disabled.\n");
        return HI_ERR_VO_INVALID_OPT;
    }

    WinSetResetEvent(pstWin,HI_TRUE, enRst);
    pstWin->stRst.enResetMode = enRst;
    if (pstWin->stVLayerFunc.PF_ResetHwBuf)
    {
        (HI_VOID)pstWin->stVLayerFunc.PF_ResetHwBuf(pstWin->u32VideoLayer, HI_TRUE, enRst);
    }

    return HI_SUCCESS;
}


HI_S32 WIN_Reset(HI_HANDLE hWin, HI_DRV_WIN_SWITCH_E enRst)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32  ret = 0;

    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);
    if (enRst >= HI_DRV_WIN_SWITCH_BUTT)
    {
        WIN_ERROR("Reset mode is invalid!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if (HI_SUCCESS != (ret = WIN_ResetSeperate(hWin, enRst)))
    {
        return ret;
    }

    return HI_SUCCESS;
}


HI_S32 WIN_Pause(HI_HANDLE hWin, HI_BOOL bEnable)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckWindow(hWin, pstWin);

    if (HI_TRUE == bEnable)
    {
        pstWin->enState = WIN_STATE_PAUSE;
        pstWin->stVLayerFunc.PF_PauseHwBuf(0, VDP_CYCBUF_DTV_MODE_PAUSE);
    }
    else
    {
        pstWin->stVLayerFunc.PF_PauseHwBuf(0, VDP_CYCBUF_DTV_MODE_NORM);
        pstWin->enState = WIN_STATE_WORK;
    }

    return HI_SUCCESS;
}

HI_S32 WIN_SetStepMode(HI_HANDLE hWin, HI_BOOL bStepMode)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckWindow(hWin, pstWin);

    // s2 set enable
    if (pstWin->bUpState && pstWin->bEnable)
    {
        WIN_ERROR("Window is changing, can't set pause now!\n");
        return HI_ERR_VO_INVALID_OPT;
    }

    // set stepmode flag
    pstWin->bStepMode = bStepMode;


    return HI_SUCCESS;
}

HI_S32 WIN_SetStepPlay(HI_HANDLE hWin)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckWindow(hWin, pstWin);
    pstWin->bStepPlayNext = HI_TRUE;


    return HI_SUCCESS;
}

HI_S32 WIN_SetQuick(HI_HANDLE hWin, HI_BOOL bEnable)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckWindow(hWin, pstWin);

    if (HI_TRUE == bEnable)
    {
        pstWin->stVLayerFunc.PF_PauseHwBuf(0, VDP_CYCBUF_DTV_MODE_QUICK);
    }
    else
    {
        pstWin->stVLayerFunc.PF_PauseHwBuf(0, VDP_CYCBUF_DTV_MODE_NORM);
    }

    // initial quickmode
    pstWin->bQuickMode = bEnable;

    return HI_SUCCESS;
}

HI_S32 WIN_GetQuick(HI_HANDLE hWin, HI_BOOL *pbEnable)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    // initial quickmode
    *pbEnable = pstWin->bQuickMode;

    return HI_SUCCESS;
}

/* only for virtual window */
HI_S32 WIN_SetExtBuffer(HI_HANDLE hWin, HI_DRV_VIDEO_BUFFER_POOL_S *pstBuf)
{
    return HI_ERR_VO_WIN_UNSUPPORT;
}

HI_S32 WIN_AttachSink(HI_HANDLE hWin, HI_HANDLE hSink)
{
    WIN_ERROR("no support vir window\n");
    return HI_FAILURE;
}

HI_S32 WIN_DetachSink(HI_HANDLE hWin, HI_HANDLE hSink)
{
    WIN_ERROR("no support vir window\n");
    return HI_FAILURE;
}


HI_S32 WIN_AcquireFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pFrameinfo)
{
    WIN_ERROR("no support vir window\n");
    return HI_FAILURE;
}

HI_S32 WIN_ReleaseFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pFrameinfo)
{
    WIN_ERROR("no support vir window\n");
    return HI_FAILURE;
}

HI_S32 WIN_CreatStillFrame(HI_DRV_VIDEO_FRAME_S *pFrameinfo, HI_DRV_VIDEO_FRAME_S *pStillFrameInfo)
{
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = HI_NULL;
    HI_U32 datalen = 0, y_stride = 0, height = 0 ;
    DISP_MMZ_BUF_S    stMMZ_StillFrame;
    DISP_MMZ_BUF_S    stMMZ_Frame;
    HI_S32            nRet = 0;
    HI_BOOL  bUvorder = HI_FALSE;
    HI_BOOL  bCmpFmt = HI_FALSE;
    HI_BOOL  bLostCmp = HI_FALSE;

    pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(pFrameinfo->u32Priv);

    memset(&stMMZ_StillFrame, 0, sizeof(stMMZ_StillFrame));
    memset(&stMMZ_Frame, 0, sizeof(stMMZ_Frame));

    /*1:calculate alloc mem*/
    y_stride = pFrameinfo->stBufAddr[0].u32Stride_Y;
    height     = (HI_TRUE == pstPrivInfo->stCompressInfo.u32CompressFlag)
                 ? pstPrivInfo->stCompressInfo.s32CompFrameHeight : pFrameinfo->u32Height;

    if ( HI_DRV_PIX_FMT_NV21 == pFrameinfo->ePixFormat)
    {
        datalen = height * y_stride * 3 / 2 ;
    }
    else
    {
        datalen = height * y_stride * 2 ;
    }


    if (HI_SUCCESS != DISP_OS_MMZ_Alloc("VDP_StillFrame", VDP_MEM_TYPE_MMZ, datalen, VDP_MEM_ALIGN, &stMMZ_StillFrame))
    {
        WIN_ERROR(" Alloc StillFrame  failid(%x)\n", datalen);
        return HI_ERR_VO_MALLOC_FAILED;
    }

    /*2: creat still frame*/
    /*not support  Compress info*/
    stMMZ_Frame.u32StartPhyAddr = pFrameinfo->stBufAddr[0].u32PhyAddr_Y;

#ifdef  CFG_VDP_MMU_SUPPORT
    stMMZ_Frame.bSmmu = HI_TRUE;
#else
    stMMZ_Frame.bSmmu = HI_FALSE;
#endif
    stMMZ_Frame.u32Size = datalen;

#ifdef  CFG_VDP_MMU_SUPPORT
    stMMZ_StillFrame.bSmmu = HI_TRUE;
#else
    stMMZ_StillFrame.bSmmu = HI_FALSE;
#endif

    stMMZ_StillFrame.u32Size = datalen;

    nRet = DISP_OS_MMZ_Map(&stMMZ_StillFrame);
    if (HI_SUCCESS != nRet)
    {
        goto __FAILURE_RELEASE;
    }

    nRet = DISP_OS_MMZ_Map(&stMMZ_Frame);
    if (HI_SUCCESS != nRet)
    {
        goto __EXIT_UNMAP;
    }


    memcpy(pStillFrameInfo, pFrameinfo, sizeof(HI_DRV_VIDEO_FRAME_S));
    memcpy((void *)stMMZ_StillFrame.pu8StartVirAddr, (void *)stMMZ_Frame.pu8StartVirAddr, datalen);

    JudgeCmpAndUvorderByPixFormat(pFrameinfo->ePixFormat, &bUvorder, &bCmpFmt, &bLostCmp);

    /*3: calculate still frame addr*/
    if (HI_FALSE == bCmpFmt)
    {
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_YHead = HI_NULL;
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_Y = stMMZ_StillFrame.u32StartPhyAddr;
        pStillFrameInfo->stBufAddr[0].u32Stride_Y =  pFrameinfo->stBufAddr[0].u32Stride_Y;
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_C = stMMZ_StillFrame.u32StartPhyAddr + (pStillFrameInfo->u32Height * pStillFrameInfo->stBufAddr[0].u32Stride_Y);
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_CrHead = stMMZ_StillFrame.u32StartPhyAddr + ( pFrameinfo->stBufAddr[0].u32PhyAddr_CrHead - stMMZ_Frame.u32StartPhyAddr);
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_Cr = stMMZ_StillFrame.u32StartPhyAddr + ( pFrameinfo->stBufAddr[0].u32PhyAddr_Cr - stMMZ_Frame.u32StartPhyAddr );
        pStillFrameInfo->stBufAddr[0].u32Stride_Cr = pFrameinfo->stBufAddr[0].u32Stride_Cr;
    }
    else
    {
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_YHead = stMMZ_StillFrame.u32StartPhyAddr;
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_Y = HI_NULL;
        pStillFrameInfo->stBufAddr[0].u32Stride_Y =  pFrameinfo->stBufAddr[0].u32Stride_Y;
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_C = stMMZ_StillFrame.u32StartPhyAddr + (pStillFrameInfo->u32Height * pStillFrameInfo->stBufAddr[0].u32Stride_Y);
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_CrHead = stMMZ_StillFrame.u32StartPhyAddr + ( pFrameinfo->stBufAddr[0].u32PhyAddr_CrHead - stMMZ_Frame.u32StartPhyAddr);
        pStillFrameInfo->stBufAddr[0].u32PhyAddr_Cr = stMMZ_StillFrame.u32StartPhyAddr + ( pFrameinfo->stBufAddr[0].u32PhyAddr_Cr - stMMZ_Frame.u32StartPhyAddr );
        pStillFrameInfo->stBufAddr[0].u32Stride_Cr = pFrameinfo->stBufAddr[0].u32Stride_Cr;
    }

    pStillFrameInfo->u32StillFrame = HI_DRV_FRAME_VDP_ALLOCATE_STILL;

    DISP_OS_MMZ_UnMap(&stMMZ_StillFrame);
    DISP_OS_MMZ_UnMap(&stMMZ_Frame);

    return HI_SUCCESS;

__EXIT_UNMAP:
    DISP_OS_MMZ_UnMap(&stMMZ_StillFrame);

__FAILURE_RELEASE:
    DISP_OS_MMZ_Release(&stMMZ_StillFrame);
    return nRet;
}
#ifdef XDP_SUPPORT_MEM_MAGIC
HI_S32 WIN_SetMagicEnable(HI_HANDLE hWin, HI_BOOL bEnable)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckWindow(hWin, pstWin);

    // s2 set enable
    pstWin->stDebug.bMagicEnable = bEnable;
    pstWin->bDebugEn = HI_TRUE;

    return HI_SUCCESS;
}
#endif

HI_S32 DestroyStillFrame(HI_DRV_VIDEO_FRAME_S *pStillFrameInfo)
{
    DISP_MMZ_BUF_S    stMMZ_StillFrame = {0};
    HI_BOOL  bUvorder = HI_FALSE;
    HI_BOOL  bCmpFmt = HI_FALSE;
    HI_BOOL  bLostCmp = HI_FALSE;

    WinCheckNullPointer(pStillFrameInfo);

    if (HI_DRV_FRAME_VDP_ALLOCATE_STILL == pStillFrameInfo->u32StillFrame)
    {
        memset((void *)&stMMZ_StillFrame, 0, sizeof(stMMZ_StillFrame));

        JudgeCmpAndUvorderByPixFormat(pStillFrameInfo->ePixFormat, &bUvorder, &bCmpFmt, &bLostCmp);
        if (HI_TRUE == bCmpFmt)
        {
            stMMZ_StillFrame.u32StartPhyAddr = pStillFrameInfo->stBufAddr[0].u32PhyAddr_YHead;
        }
        else
        {
            stMMZ_StillFrame.u32StartPhyAddr = pStillFrameInfo->stBufAddr[0].u32PhyAddr_Y;
        }

#ifdef  CFG_VDP_MMU_SUPPORT
        stMMZ_StillFrame.bSmmu = HI_TRUE;
#else
        stMMZ_StillFrame.bSmmu = HI_FALSE;
#endif

        stMMZ_StillFrame.bSecure = pStillFrameInfo->bSecure;
        DISP_OS_MMZ_Release(&stMMZ_StillFrame);
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

HI_S32 WIN_SendFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    WIN_XDR_FRAME_S *pstWinXdrFrm = HI_NULL;

    WinCheckNullPointer(pFrameInfo);

    /* malloc buff to load frame. */
    pstWinXdrFrm = (WIN_XDR_FRAME_S *)HI_KMALLOC(HI_ID_VO, sizeof(WIN_XDR_FRAME_S), GFP_KERNEL);
    if (HI_NULL == pstWinXdrFrm)
    {
        HI_ERR_WIN("Malloc pstWinXdrFrm failed.\n");
        return HI_ERR_VO_MALLOC_FAILED;
    }

    s32Ret = WIN_CreatStillFrame(pFrameInfo, &pstWinXdrFrm->stBaseFrm);
    if ( HI_SUCCESS != s32Ret )
    {
        WIN_ERROR(" WIN_CreatStillFrame  failid(%x)\n", s32Ret);
        HI_KFREE(HI_ID_VO, pstWinXdrFrm);
        return s32Ret;
    }

    pstWinXdrFrm->hWindow = hWin;
    pstWinXdrFrm->enXdrEngine = DRV_XDR_ENGINE_SDR;

    s32Ret = WIN_POLICY_GetOutputTypeAndEngine(hWin,
             pFrameInfo->enSrcFrameType,
             &pstWinXdrFrm->enDispOutType,
             &pstWinXdrFrm->enXdrEngine);

    if (s32Ret != HI_SUCCESS)
    {
        WIN_ERROR("Get output type fail.\n");
        HI_KFREE(HI_ID_VO, pstWinXdrFrm);
        return s32Ret;
    }

    s32Ret = WinQueueFrame(hWin, pstWinXdrFrm);

    HI_KFREE(HI_ID_VO, pstWinXdrFrm);

    return s32Ret;
}

HI_S32 Win_DebugGetHandle(HI_DRV_DISPLAY_E enDisp, WIN_HANDLE_ARRAY_S *pstWin)
{
    HI_S32 i;

    WinCheckDeviceOpen();

    // s1 检查句柄合法性
    WinCheckNullPointer(pstWin);

    if (enDisp >= HI_DRV_DISPLAY_BUTT)
    {
        WIN_ERROR("enDisp out of range\n");
        return HI_FAILURE;
    }

    DISP_MEMSET(pstWin, 0, sizeof(WIN_HANDLE_ARRAY_S));

    pstWin->u32WinNumber = 0;

    for (i = 0; i < WINDOW_MAX_NUMBER; i++)
    {
        if (stDispWindow.pstWinArray[(HI_U32)enDisp][i])
        {
            pstWin->ahWinHandle[pstWin->u32WinNumber] = (HI_HANDLE)(stDispWindow.pstWinArray[(HI_U32)enDisp][i]->u32Index);
            pstWin->u32WinNumber++;
        }
    }

    return HI_SUCCESS;
}

HI_VOID ISR_WinReleaseUSLFrame(WINDOW_S *pstWin)
{
    HI_DRV_WIN_SRC_INFO_S *pstSource = &pstWin->stCfg.stSource;
    HI_DRV_VIDEO_FRAME_S stRlsFrm = {0};
    HI_S32 nRet;

    if (pstWin->stCfg.stSource.hSrc == (HI_HANDLE)pstWin->u32Index)
    {
        return;
    }

    memset(&stRlsFrm, 0, sizeof(stRlsFrm));
    /* release useless frame */
    nRet = WinBufferGetULSFrame(&pstWin->stBuffer, &stRlsFrm);
    while (HI_SUCCESS == nRet)
    {
        if (HI_DRV_FRAME_VDP_ALLOCATE_STILL == stRlsFrm.u32StillFrame)
        {
            (HI_VOID)WIN_DestroyStillFrame(&stRlsFrm);
        }
        else if (pstSource->pfRlsFrame)
        {
            if ((pstSource->hSecondSrc != HI_INVALID_HANDLE)
                && (HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL == stRlsFrm.enSrcFrameType))
            {
                pstSource->pfRlsFrame(pstSource->hSecondSrc, &stRlsFrm);
            }
            else if (pstSource->hSrc != HI_INVALID_HANDLE)
            {
                pstSource->pfRlsFrame(pstSource->hSrc, &stRlsFrm);
            }
            else
            {
                WIN_ERROR("Cannot Release USL frame,invalid hSrc or FrameType! FrameType %d hSrc %#x\n",
                          stRlsFrm.enSrcFrameType,
                          pstSource->hSrc);
            }
        }

        nRet = WinBufferGetULSFrame(&pstWin->stBuffer, &stRlsFrm);
    }

    return;
}

HI_DRV_VIDEO_FRAME_S *ISR_SlaveWinGetConfigFrame(WINDOW_S *pstWin)
{
    WIN_ERROR("Invalid Code branch\n");

    return HI_NULL;
}


HI_VOID WinUpdateDispInfo(WINDOW_S *pstWin, HI_DISP_DISPLAY_INFO_S *pstDsipInfo)
{
    pstWin->stDispInfo.u32RefreshRate = pstDsipInfo->u32RefreshRate;
    pstWin->stDispInfo.bIsInterlace   = pstDsipInfo->bInterlace;
    pstWin->stDispInfo.bIsBtm          = pstDsipInfo->bIsBottomField;
    pstWin->stDispInfo.stWinCurrentFmt = pstDsipInfo->stFmtResolution;

    return;
}

WIN_DISP_INFO_S *WinGetDispInfoByHandle(HI_HANDLE hWin)
{
    WINDOW_S *pstWin;

    pstWin = WinGetWindow(hWin);

    if (pstWin)
    {
        return &pstWin->stDispInfo;
    }

    return HI_NULL;
}

HI_VOID WinTestFrameMatch(WINDOW_S *pstWin, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_DISP_DISPLAY_INFO_S *pstDsipInfo)
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = (HI_DRV_VIDEO_PRIVATE_S *) & (pstFrame->u32Priv[0]);

    if (pstDsipInfo->bInterlace == HI_TRUE)
    {
        if ( ((pstPriv->eOriginField == HI_DRV_FIELD_TOP)
              && (pstDsipInfo->bIsBottomField == HI_FALSE) )
             || ((pstPriv->eOriginField == HI_DRV_FIELD_BOTTOM)
                 && (pstDsipInfo->bIsBottomField == HI_TRUE) )
           )
        {
            pstWin->u32TBNotMatchCount++;
        }
    }

    return;
}
HI_VOID Win_UpdateHdFramInfo(WIN_INFO_S *pstLayerPara,WIN_CONFIG_S *pstCfg,HI_BOOL bSecure)
{
#ifdef VDP_ISOGENY_SUPPORT
    WBC_HD_WIN_INFOR_S  stHDWinInfo = {0};

    memset((HI_VOID *)&stHDWinInfo, 0, sizeof(stHDWinInfo));

    if ( VDP_LAYER_VID0 == pstLayerPara->u32LayerId )
    {
        stHDWinInfo.bV0Secure = bSecure;
        stHDWinInfo.bV0Mute = pstLayerPara->bRegionMute;
        stHDWinInfo.bV0RegionEnable = pstLayerPara->bRegionEnable;
        stHDWinInfo.stV0DispRect = pstLayerPara->stDisp;
        stHDWinInfo.stV0VideoRect = pstLayerPara->stVideo;
        stHDWinInfo.stV0InRect = pstLayerPara->stIn;
        stHDWinInfo.bV0FieldMatch = pstLayerPara->bFieldMatch;

        stHDWinInfo.enV0WinSrcColorSpace = pstCfg->enFrameCS;
        stHDWinInfo.enV0WinDestColorSpace =  pstCfg->enOutCS;
        stHDWinInfo.eSrcPixelFmt = (HI_NULL != pstLayerPara->pCurrentFrame) ? pstLayerPara->pCurrentFrame->ePixFormat : HI_DRV_PIX_FMT_YVU420;
    }
    else if ( VDP_LAYER_VID1 == pstLayerPara->u32LayerId )
    {
        stHDWinInfo.bV1Secure = bSecure;
        stHDWinInfo.bV1Mute = pstLayerPara->bRegionMute;
        stHDWinInfo.bV1RegionEnable = pstLayerPara->bRegionEnable;
    }
    else
    {
        /*do nothing\n*/
    }
    stHDWinInfo.u32WinNum = WinGetHDWinNum();

    ISOGENY_UpDateHDWinFramInfo(&stHDWinInfo,pstLayerPara->u32LayerId);
#endif
    return;
}


HI_VOID WinGetActualOffsetAccordingUserSetting(HI_DRV_DISPLAY_E enDisp,
        HI_DRV_DISP_OFFSET_S  *pstUserSettingOffset,
        HI_DRV_DISP_OFFSET_S  *pstActualOffset,
        HI_RECT_S *pstOutRect)
{
#ifndef HI_VO_OFFSET_EFFECTIVE_WHEN_WIN_FULL
    HI_RECT_S  stCanvas = {0};

    (HI_VOID)DISP_GetVirtScreen(enDisp, &stCanvas);

    if (((pstOutRect->s32Width == 0)
         || (pstOutRect->s32Height == 0))
        || ((pstOutRect->s32Width == stCanvas.s32Width)
            && (pstOutRect->s32Height == stCanvas.s32Height)))
    {
        memset((void *)pstActualOffset, 0, sizeof(HI_DRV_DISP_OFFSET_S));
    }
    else
    {
        *pstActualOffset = *pstUserSettingOffset;
    }

#else
    *pstActualOffset = *pstUserSettingOffset;
#endif

    return;
}


HI_S32  RWZB_GetDATEParaIndex(HI_S32 u32RwzbType)
{
    HI_U32 u32Index;

    switch (u32RwzbType)
    {
        case FIDELITY_480I_YPBPR:
        case FIDELITY_576I_YPBPR:
            u32Index = 1;
            break;

        case FIDELITY_SKN:
        case FIDELITY_ZDN:
            u32Index = 2;
            break;
        case FIDELITY_MOTO_CVBS:
            u32Index = 3;
            break;
        case FIDELITY_033:
            u32Index = 4;
            break;
        case FIDELITY_MATRIX525:
            u32Index = 5;
            break;


        default:
            u32Index = 0;
            break;
    }
    return u32Index;
}

extern HI_BOOL DISP_IsFollowed(HI_DRV_DISPLAY_E enDisp);
extern  S_VDP_REGS_TYPE *g_pstVdpBaseAddr;

HI_S32 Win_PqHdrCfgProcess(WINDOW_S *pstWin,
                           HI_DRV_VIDEO_FRAME_S *pstFrame,
                           const HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_PQ_XDR_FRAME_INFO    stPqWinHdrMetaInfo;
    DISP_BUF_NODE_S         *pstConfig = HI_NULL;
 //   HI_S32                  nRet = HI_SUCCESS;

    if (HI_NULL == pstFrame)
    {
        return HI_SUCCESS;
    }
#ifdef  CFG_HI3798CV200
    if (HI_DRV_VIDEO_FRAME_TYPE_SDR == pstFrame->enSrcFrameType)
    {
        return HI_SUCCESS;
    }
#endif

    if (HI_NULL == pstWin->stBuffer.stWinBP.pstConfig)
    {
        return HI_SUCCESS;
    }

    pstConfig = pstWin->stBuffer.stWinBP.pstConfig;

    memcpy(&stPqWinHdrMetaInfo, pstConfig->u8Pqdata, sizeof(stPqWinHdrMetaInfo));
    stPqWinHdrMetaInfo.stLayerRegionInfo.enPqXdrLayerId = pstWin->u32VideoLayer;
    stPqWinHdrMetaInfo.stLayerRegionInfo.u32WindowNum = WinGetHDWinNum();
#if 0
    nRet = DRV_PQ_GetHdrCfg(&stPqWinHdrMetaInfo,
                            (HI_PQ_HDR_CFG *)pstConfig->u8Metadata);
    if (nRet != HI_SUCCESS)
    {
        HI_ERR_WIN("Get Hdr config from PQ fail.FrmType->%d,OutType->%d,Ret->%d\n",
                   pstFrame->enSrcFrameType, pstConfig->stHdrInfo.enDispOutType, nRet);
        return nRet;
    }
#endif
    return HI_SUCCESS;
}

HI_VOID Win_PqProcess(WINDOW_S *pstWin,
                      HI_DRV_VIDEO_FRAME_S *pstFrame,
                      HI_RECT_S *pstVideoRect,
                      const HI_DISP_DISPLAY_INFO_S *pstDispInfo,
                      HI_BOOL bHdrMode)
{
    HI_VDP_PQ_INFO_S stTimingInfo;
    HI_DRV_WIN_ATTR_S *pstAttr = &pstWin->stUsingAttr;
    VIDEO_LAYER_CAPABILITY_S  stVideoLayerCap;
    DISP_INTF_OPERATION_S stFunction = {0};
    HI_U32 u32PixelRepeateTimes = 0;

#ifdef  CHIP_TYPE_hi3798mv310
    Win_PqHdrCfgProcess(pstWin, pstFrame, pstDispInfo);
#endif
    (HI_VOID)pstWin->stVLayerFunc.PF_GetCapability(pstWin->u32VideoLayer, &stVideoLayerCap);

    /*this is the current value.*/
    stTimingInfo.enLayerId  = pstWin->u32VideoLayer;
    if (HI_NULL == pstFrame)
    {
        stTimingInfo.u32Width = pstVideoRect->s32Width;
        stTimingInfo.u32Height = pstVideoRect->s32Height;
    }
    else
    {
        stTimingInfo.u32Width = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->stVideoOriginalInfo.u32Width;
        stTimingInfo.u32Height = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->stVideoOriginalInfo.u32Height;
        if (stTimingInfo.u32Width == 0 || stTimingInfo.u32Height == 0)
        {
            stTimingInfo.u32Width = pstFrame->u32Width;
            stTimingInfo.u32Height = pstFrame->u32Height;
        }

    }
    stTimingInfo.bSRState     = pstWin->stMiscInfor.bWinSrEnableCurrent;
    stTimingInfo.bPartUpdate = HI_TRUE;

    stTimingInfo.bIsogenyMode = DISP_Check_IsogenyMode();
    stTimingInfo.bHdrMode     = bHdrMode;

    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)pstWin->enDisp].stFmtRect = pstDispInfo->stFmtResolution;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)pstWin->enDisp].u32RefreshRate = pstDispInfo->u32RefreshRate;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)pstWin->enDisp].bProgressive = pstDispInfo->bInterlace ? HI_FALSE : HI_TRUE;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)pstWin->enDisp].enOutColorSpace = pstDispInfo->eColorSpace;

    (HI_VOID)DISP_HAL_GetOperation(&stFunction);

    if (HI_NULL != stFunction.PF_GetPixelRepeatTimesAccordingFmt)
    {
        stFunction.PF_GetPixelRepeatTimesAccordingFmt(pstWin->enDisp,
                pstDispInfo->eFmt,
                &u32PixelRepeateTimes);
    }
    else
    {
        WIN_FATAL("Get ops function failed!\n");
    }

    stTimingInfo.stVideo.s32X      = pstVideoRect->s32X * u32PixelRepeateTimes;
    stTimingInfo.stVideo.s32Y      = pstVideoRect->s32Y;
    stTimingInfo.stVideo.s32Width  = pstVideoRect->s32Width * u32PixelRepeateTimes;
    stTimingInfo.stVideo.s32Height = pstVideoRect->s32Height;

    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)pstWin->enDisp].stFmtRect.s32Width *= u32PixelRepeateTimes;

    if (DISP_STEREO_NONE == pstDispInfo->eDispMode)
    {
        stTimingInfo.b3dType = HI_FALSE;
    }
    else
    {
        stTimingInfo.b3dType = HI_TRUE;
    }

#if 0//430 fpga
    DRV_PQ_UpdateVdpPQ((HI_PQ_DISPLAY_E)pstWin->enDisp, &stTimingInfo, (S_VDP_REGS_TYPE *)g_pstVdpBaseAddr);
#endif

    /*save the value ,for next judgement.*/
    pstWin->stMiscInfor.stFrameOriginalRect.s32Width  = stTimingInfo.u32Width;
    pstWin->stMiscInfor.stFrameOriginalRect.s32Height  = stTimingInfo.u32Height;
    pstWin->stMiscInfor.stWinOutRect.s32Width  =  pstAttr->stOutRect.s32Width;
    pstWin->stMiscInfor.stWinOutRect.s32Height = pstAttr->stOutRect.s32Height;
    pstWin->stMiscInfor.bWinSrEnableLast       =  stTimingInfo.bSRState;

    return;
}

HI_S32 Win_GetAlgMemsize(HI_HANDLE hVdec,
                         HI_U32 u32BitWidth,
                         HI_U32 *pu32DeiBufSize,
                         HI_U32 *pu32OtherBufSize)
{
    XDP_VPSSIP_POLICY_S  stVpssIpPolicy = {0};
    XDP_VPSSIP_CHN_CFG_S stVpssIpChnCfg = {{{0}}};
    HI_U32               u32BufSize = 0, u32OtherBufSize = 0;
    VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();

    if (u32BitWidth >= 10)
    {
        if (HI_NULL != pu32DeiBufSize)
        {
            *pu32DeiBufSize    = 0;
        }

        if (HI_NULL != pu32OtherBufSize)
        {
            *pu32OtherBufSize  = 0;
        }

        return HI_SUCCESS;
    }

    /*just get size, hal will not record these setting.*/
    stVpssIpPolicy.bIsSD      = HI_FALSE;
    stVpssIpPolicy.enRdMode   = VDP_RMODE_INTERLACE;
    stVpssIpPolicy.enDataFmt  = VDP_VID_IFMT_SP_TILE_64;
    stVpssIpPolicy.u32HzmeWth = XDP_MAX_WTH;
    stVpssIpPolicy.u32HzmeHgt = XDP_MAX_HGT;
    stVpssIpPolicy.enNrDataWidth = (HI_TRUE == stVpssIpPolicy.bIsSD) ? XDP_DATA_WTH_10 : XDP_DATA_WTH_8;

    if ((HI_NULL == pF)
        || (HI_NULL == pF->PF_HW_ALG_POLICY_GetVpssBufferSize))
    {
        return HI_FAILURE;
    }

    pF->PF_HW_ALG_POLICY_GetVpssBufferSize(&stVpssIpPolicy,
                                            &stVpssIpChnCfg,
                                            &u32BufSize,
                                            &u32OtherBufSize);

    if (HI_NULL != pu32DeiBufSize)
    {
        *pu32DeiBufSize    = u32BufSize      + XDP_OSAL_MemGetMagicSize(HI_NULL);
        WIN_INFO("dei size:%x!\n", *pu32DeiBufSize);
    }

    if (HI_NULL != pu32OtherBufSize)
    {
        *pu32OtherBufSize  = u32OtherBufSize + XDP_OSAL_MemGetMagicSize(HI_NULL);
        WIN_INFO("vpssout size:%x!\n", *pu32OtherBufSize);
    }

    return HI_SUCCESS;
}

#ifdef XDP_SUPPORT_MEM_MAGIC
HI_S32 WinMMZTrans_2_OSAL(hiXDP_OSAL_MEM_S *pstOsalMem, DISP_MMZ_BUF_S *pstMmz, HI_CHAR* pMMZName, HI_BOOL bMap)
{
    WIN_CHECK_NULL_RETURN(pstOsalMem);
    WIN_CHECK_NULL_RETURN(pstMmz);

    pstOsalMem->u32PhyAddr = pstMmz->u32StartPhyAddr;
    pstOsalMem->pu8VirAddr = pstMmz->pu8StartVirAddr;
    pstOsalMem->u32Size = pstMmz->u32Size;
    pstOsalMem->bSmmu = pstMmz->bSmmu;
    pstOsalMem->bSecure = pstMmz->bSecure;
    pstOsalMem->bMap = bMap;
    strncpy(pstOsalMem->aName, pMMZName, XDP_MEM_NAME_LEN_MAX);
    pstOsalMem->aName[XDP_MEM_NAME_LEN_MAX - 1] = '\0';

    return HI_SUCCESS;
}
#endif

HI_S32 WinAllocateAlgMMZ(WINDOW_S *pstWin,
                                 HI_DRV_VIDEO_FRAME_S *pFrameInfo)
{
    HI_U32               u32DeiBufSize = 0, u32VpssOutSize = 0;
    HI_S32               ret = HI_FAILURE;
    HI_BOOL               bOnline = HI_FALSE;
#ifdef WIN_VDEC_RELEASE_MACRO
    VDEC_EXPORT_FUNC_S *pstVdecFunc = HI_NULL;
    HI_DRV_DEI_MEM_INFO_S stDeiMemInfo = {0};
#endif

    if (pstWin->stHardwareConfig.bVPSSAlgMMZBuf == HI_TRUE)
    {
        return HI_SUCCESS;
    }

    bOnline = WIN_POLICY_JudgeOnlineMode(pFrameInfo);
    if (bOnline == HI_TRUE)
    {
        return HI_SUCCESS;
    }

    Win_GetAlgMemsize(pstWin->u32Index, 8, &u32DeiBufSize, &u32VpssOutSize);
    memset(&pstWin->stHardwareConfig.stDeiMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stDeiMmzBuf));
    memset(&pstWin->stHardwareConfig.stVpssoutMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stVpssoutMmzBuf));

#ifndef WIN_VDEC_RELEASE_MACRO
    ret = DISP_OS_MMZ_AllocAndMap((const char *)"VDP_DEI_NODE",
                               VDP_MEM_TYPE_PHY,
                               u32DeiBufSize,
                               VDP_MEM_ALIGN,
                               &pstWin->stHardwareConfig.stDeiMmzBuf);

    if (HI_SUCCESS != ret)
    {
       return ret;
    }

    ret = DISP_OS_MMZ_AllocAndMap((const char *)"VDP_VPSSOUT_MEM",
                               VDP_MEM_TYPE_PHY,
                               u32DeiBufSize,
                               VDP_MEM_ALIGN,
                               &pstWin->stHardwareConfig.stVpssoutMmzBuf);

    if (HI_SUCCESS != ret)
    {
        DISP_OS_MMZ_UnmapAndRelease(&pstWin->stHardwareConfig.stDeiMmzBuf);
        memset(&pstWin->stHardwareConfig.stDeiMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stDeiMmzBuf));
       return ret;
    }


#ifdef XDP_SUPPORT_MEM_MAGIC
        WinMMZTrans_2_OSAL(&(pstWin->stHardwareConfig.stDeiMmzBufMagicInfo),
                            &(pstWin->stHardwareConfig.stDeiMmzBuf),
                                "VDP_DEI_NODE", HI_TRUE);
        XDP_OSAL_MemAddMagic(&(pstWin->stHardwareConfig.stDeiMmzBufMagicInfo), OSAL_MEM_MAGIC_NO);
#endif

#else
    ret = HI_DRV_MODULE_GetFunction(HI_ID_VDEC, (HI_VOID **) & (pstVdecFunc));
    if (HI_SUCCESS != ret || pstVdecFunc == HI_NULL)
    {
        WIN_ERROR("get vdec func error.\n");
        return HI_FAILURE;
    }

    stDeiMemInfo.u32DeiMemSize = u32DeiBufSize;
    ret = pstVdecFunc->pfnVDEC_GetDeiMem(pstWin->stCfg.stSource.hSrc, &stDeiMemInfo);
    if (HI_SUCCESS != ret)
    {
        WIN_ERROR("get vdec mem error.\n");
        return ret;
    }

    pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr = stDeiMemInfo.u32DeiMemPhyAddr;
    pstWin->stHardwareConfig.stDeiMmzBuf.u32Size         = stDeiMemInfo.u32DeiMemSize;

    ret = DISP_OS_MMZ_Map(&pstWin->stHardwareConfig.stDeiMmzBuf);
    if (HI_SUCCESS != ret)
    {
       pstVdecFunc->pfnVDEC_ReleaseDeiMem(pstWin->stCfg.stSource.hSrc, &stDeiMemInfo);
       memset(&pstWin->stHardwareConfig.stDeiMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stDeiMmzBuf));
       WIN_ERROR("mmap dei mem failed!\n");
       return ret;
    }

    WIN_WARN("get vdec-dei phy:%x, virt:%x,size:%x!\n", pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr,
                                            (HI_U32)pstWin->stHardwareConfig.stDeiMmzBuf.pu8StartVirAddr,
                                            pstWin->stHardwareConfig.stDeiMmzBuf.u32Size);


    ret = DISP_OS_MMZ_AllocAndMap((const char *)"VDP_VPSSOUT_MEM",
                                     VDP_MEM_TYPE_PHY,
                                     u32VpssOutSize,
                                     VDP_MEM_ALIGN,
                                     &pstWin->stHardwareConfig.stVpssoutMmzBuf);

    WIN_WARN("Get vpout phy:%x, size:%x!\n", pstWin->stHardwareConfig.stVpssoutMmzBuf.u32StartPhyAddr,
                                             (HI_U32)pstWin->stHardwareConfig.stVpssoutMmzBuf.pu8StartVirAddr,
                                             pstWin->stHardwareConfig.stVpssoutMmzBuf.u32Size);

    if (HI_SUCCESS != ret)
    {
       pstVdecFunc->pfnVDEC_ReleaseDeiMem(pstWin->stCfg.stSource.hSrc, &stDeiMemInfo);
       DISP_OS_MMZ_UnMap(&pstWin->stHardwareConfig.stDeiMmzBuf);
       memset(&pstWin->stHardwareConfig.stDeiMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stDeiMmzBuf));
       WIN_ERROR("Allocate vpssout mem failed!\n");
       return ret;
    }

#endif

    pstWin->stHardwareConfig.bVPSSAlgMMZBuf = HI_TRUE;
    return HI_SUCCESS;
}


HI_VOID ALG_ReleaseAlgMMZ(WINDOW_S *pstWin)
{
#ifdef WIN_VDEC_RELEASE_MACRO
    VDEC_EXPORT_FUNC_S *pstVdecFunc = HI_NULL;
    HI_DRV_DEI_MEM_INFO_S stDeiMemInfo = {0};
    HI_S32 ret = HI_FAILURE;
#endif

    if (pstWin->stHardwareConfig.bVPSSAlgMMZBuf != HI_TRUE)
    {
        return ;
    }

#ifndef WIN_VDEC_RELEASE_MACRO
    if ((0 != pstWin->stHardwareConfig.stDeiMmzBuf.pu8StartVirAddr)
        && (0 != pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr))
    {
        DISP_OS_MMZ_UnmapAndRelease(&pstWin->stHardwareConfig.stDeiMmzBuf);
    }

    if ((0 != pstWin->stHardwareConfig.stVpssoutMmzBuf.pu8StartVirAddr)
        && (0 != pstWin->stHardwareConfig.stVpssoutMmzBuf.u32StartPhyAddr))
    {
        DISP_OS_MMZ_UnmapAndRelease(&pstWin->stHardwareConfig.stVpssoutMmzBuf);
    }

#else

    if ((0 != pstWin->stHardwareConfig.stDeiMmzBuf.pu8StartVirAddr)
        && (0 != pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr))
    {
        ret = HI_DRV_MODULE_GetFunction(HI_ID_VDEC, (HI_VOID **) &(pstVdecFunc));
        if (HI_SUCCESS != ret || pstVdecFunc == HI_NULL)
        {
            WIN_ERROR("get vdec func error.\n");
            return ;
        }

       DISP_OS_MMZ_UnMap(&pstWin->stHardwareConfig.stDeiMmzBuf);

       stDeiMemInfo.u32DeiMemSize = pstWin->stHardwareConfig.stDeiMmzBuf.u32Size;
       stDeiMemInfo.u32DeiMemPhyAddr = pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr;
       pstVdecFunc->pfnVDEC_ReleaseDeiMem(pstWin->stCfg.stSource.hSrc, &stDeiMemInfo);
       memset(&pstWin->stHardwareConfig.stDeiMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stDeiMmzBuf));
    }


    if ((0 != pstWin->stHardwareConfig.stVpssoutMmzBuf.pu8StartVirAddr)
             && (0 != pstWin->stHardwareConfig.stVpssoutMmzBuf.u32StartPhyAddr))
    {
         DISP_OS_MMZ_UnmapAndRelease(&pstWin->stHardwareConfig.stVpssoutMmzBuf);
         memset(&pstWin->stHardwareConfig.stVpssoutMmzBuf, 0, sizeof(pstWin->stHardwareConfig.stVpssoutMmzBuf));
    }

#endif

    pstWin->stHardwareConfig.bVPSSAlgMMZBuf = HI_FALSE;
    return;
}


HI_BOOL checkConfigChangeorNot(HI_VOID)
{
    return HI_FALSE;
}

HI_U32 g_FrameIndex = 0;
HI_S32  WIN_Genarate_hwconfig(WINDOW_S *pstWin,
                                     HI_DRV_VIDEO_FRAME_S *pstFrame,
                                     HW_NODE_RUNNING_CONFIG_S *pstConfigNode,
                                     HI_RECT_S *pstIn,
                                     HI_RECT_S *pstVideo,
                                     HI_RECT_S *pstDisp)
{
    HI_U32 i = 0;
    WIN_CRITICAL_FrameInfor_S stCurrentPlayInfor;
    HI_DRV_VIDEO_PRIVATE_S *pstFramePriv = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0]);
    DISP_NodeListINFOR_S *pstPlayInfo = HI_NULL;
    HI_BOOL bSingleFieldFrameMode = HI_FALSE;
    HI_BOOL bLastFrame     = HI_FALSE;
    HI_BOOL bNewSrcInfo    = HI_FALSE;
    HI_BOOL bNewEvent      = HI_FALSE;

    memset(&stCurrentPlayInfor, 0, sizeof(WIN_CRITICAL_FrameInfor_S));
    pstPlayInfo = Win_GetFramePlayInfor(pstFrame);

    WIN_POLICY_CheckSingleFieldMode(pstFrame, &bSingleFieldFrameMode);
    bNewSrcInfo = WIN_POLICY_CheckSrcInfoChange(pstFrame, &(pstWin->stPlayInfor), bSingleFieldFrameMode);
    bLastFrame  = (pstFramePriv->u32LastFlag == DEF_HI_DRV_VPSS_LAST_ERROR_FLAG);

    stCurrentPlayInfor.stFrameSize.s32X = 0;
    stCurrentPlayInfor.stFrameSize.s32Y = 0;
    stCurrentPlayInfor.stFrameSize.s32Width  = pstFrame->u32Width;
    stCurrentPlayInfor.stFrameSize.s32Height = pstFrame->u32Height;

    /*temporary set size to zero*/
    stCurrentPlayInfor.stVideoSize = *pstVideo;
    stCurrentPlayInfor.stDispSize  = *pstDisp;

    stCurrentPlayInfor.enFieldMode = pstFrame->enFieldMode;
    stCurrentPlayInfor.bTopFieldFirst = pstFrame->bTopFieldFirst;
    stCurrentPlayInfor.bProgressive = pstFrame->bProgressive;

    stCurrentPlayInfor.bLastFrame                = bLastFrame;
    stCurrentPlayInfor.bMask                     = pstPlayInfo->bMask;
    stCurrentPlayInfor.bUndergoSuspend           = pstWin->stPlayInfor.bUndergoSuspend;
    stCurrentPlayInfor.bUndergoSuspend_ForQueue  = pstWin->stPlayInfor.bUndergoSuspend_ForQueue;
    stCurrentPlayInfor.u32LastQueueFrameAddr     = pstWin->stPlayInfor.u32LastQueueFrameAddr;
    stCurrentPlayInfor.stInSize                  = *pstIn;

    pstConfigNode->bLastFrame              = bLastFrame;
    pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
    pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_NULL;

    if (HI_TRUE == stCurrentPlayInfor.bUndergoSuspend_ForQueue)
    {
        g_FrameIndex = 0;
        bNewEvent = HI_TRUE;
        stCurrentPlayInfor.bUndergoSuspend_ForQueue = HI_FALSE;
    }
    else if (HI_TRUE == WinGetResetEvent(pstWin, HI_NULL))
    {
        g_FrameIndex = 0;
        bNewEvent = HI_TRUE;
        WinSetResetEvent(pstWin, HI_FALSE, 0);
    }
    else if ((HI_TRUE == pstPlayInfo->bMask) && (pstWin->stPlayInfor.bMask != pstPlayInfo->bMask))
    {
        g_FrameIndex = 0;
    }
    else if ((stCurrentPlayInfor.bLastFrame == HI_FALSE) && (pstWin->stPlayInfor.bLastFrame == HI_TRUE))
    {
        g_FrameIndex = 0;
        bNewEvent = HI_TRUE;
    }
    else if (HI_FALSE == bSingleFieldFrameMode)
    {
        if ((0 != memcmp(&stCurrentPlayInfor.stFrameSize, &pstWin->stPlayInfor.stFrameSize, sizeof(HI_RECT_S)))
            || (0 != memcmp(&stCurrentPlayInfor.stVideoSize, &pstWin->stPlayInfor.stVideoSize, sizeof(HI_RECT_S)))
            || (0 != memcmp(&stCurrentPlayInfor.stDispSize, &pstWin->stPlayInfor.stDispSize, sizeof(HI_RECT_S)))
            || (0 != memcmp(&stCurrentPlayInfor.stInSize, &pstWin->stPlayInfor.stInSize, sizeof(HI_RECT_S)))
            || (stCurrentPlayInfor.enFieldMode != pstWin->stPlayInfor.enFieldMode)
            || (stCurrentPlayInfor.bProgressive != pstWin->stPlayInfor.bProgressive)
            || (stCurrentPlayInfor.enFieldMode < HI_DRV_FIELD_ALL))
        {
            g_FrameIndex = 0;

        }
    }
    else if (HI_TRUE == bSingleFieldFrameMode)
    {
        if ((0 != memcmp(&stCurrentPlayInfor.stFrameSize, &pstWin->stPlayInfor.stFrameSize, sizeof(HI_RECT_S)))
            || (0 != memcmp(&stCurrentPlayInfor.stVideoSize, &pstWin->stPlayInfor.stVideoSize, sizeof(HI_RECT_S)))
            || (0 != memcmp(&stCurrentPlayInfor.stDispSize, &pstWin->stPlayInfor.stDispSize, sizeof(HI_RECT_S)))
            || (stCurrentPlayInfor.enFieldMode == pstWin->stPlayInfor.enFieldMode)
            || (stCurrentPlayInfor.bProgressive != pstWin->stPlayInfor.bProgressive))
        {
            g_FrameIndex = 0;
        }
    }
    /* fod */
    if ((HI_TRUE == bNewSrcInfo) || (HI_TRUE == bNewEvent))
    {
        pstWin->stPlayCtrl.eFieldOrder = WIN_FIELDORDER_BUTT;
    }
    Win_GetFodReviseResult(pstWin, pstFrame);
    stCurrentPlayInfor.bTopFieldFirst = pstFrame->bTopFieldFirst;
    if (pstFrame->bTopFieldFirst != pstWin->stPlayInfor.bTopFieldFirst)
    {
        g_FrameIndex = 0;
    }

    pstWin->stPlayInfor = stCurrentPlayInfor;
    /*clear the reset buffer.*/
    pstConfigNode->u32Index = g_FrameIndex;

    if (g_FrameIndex == 0)
    {
        WIN_INFO("index change, w:%d,h:%d, p/i:%d,fo:%d\n", pstFrame->u32Width,
                                          pstFrame->u32Height,
                                          pstFrame->bProgressive,
                                          pstFrame->bTopFieldFirst);
    }

    g_FrameIndex ++;
    pstConfigNode->bFastforward = HI_FALSE;//zhangfangni need modify
    pstConfigNode->bDisableSoftwareAlg = WIN_POLICY_JudgeWetherCloseSoftAlg(pstWin->stPlayCtrl.eSoftAlgCtrl);
    if (HI_TRUE == WIN_POLICY_RwzbProcess(((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->u32Fidelity))
    {
        pstConfigNode->bDisableSoftwareAlg = HI_TRUE;
    }

    pstConfigNode->bCompactAccess      = (HI_TRUE == bSingleFieldFrameMode) ? HI_TRUE : HI_FALSE;

    /*bmute alg buffer*/
    pstConfigNode->bMuteSoftwareAlgBuf = HI_TRUE;
    pstConfigNode->bMaskEn = pstPlayInfo->bMask;
    pstConfigNode->enOnOffLineMode = pstFrame->bProgressive ? XDP_HAL_STATUS_ONLINE:XDP_HAL_STATUS_OFFLINE;

    if (pstFrame->bProgressive == HI_TRUE)
    {
        pstConfigNode->u32TopPlaycnts    = pstFrame->stPlayInfor.u32PlayCnt;
        pstConfigNode->u32BottomPlaycnts = 0;
    }
    else if (stCurrentPlayInfor.enFieldMode == HI_DRV_FIELD_ALL)
    {
        pstConfigNode->u32TopPlaycnts    = (stCurrentPlayInfor.bTopFieldFirst == HI_TRUE) ? (pstFrame->stPlayInfor.u32PlayCnt + 1)/2 : pstFrame->stPlayInfor.u32PlayCnt / 2;
        pstConfigNode->u32BottomPlaycnts = (stCurrentPlayInfor.bTopFieldFirst == HI_TRUE) ? pstFrame->stPlayInfor.u32PlayCnt / 2 : (pstFrame->stPlayInfor.u32PlayCnt + 1)/2;

        if(pstConfigNode->u32Index == 0)
        {
            pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
            pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_NULL;

            if (pstConfigNode->u32TopPlaycnts == 0)
            {
                pstConfigNode->u32TopPlaycnts    = 1;
            }

            if (pstConfigNode->u32BottomPlaycnts == 0)
            {
                pstConfigNode->u32BottomPlaycnts    = 1;
            }
        }
        else
        {
            if (pstConfigNode->u32TopPlaycnts == 0)
            {
                pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_DI;
                pstConfigNode->u32TopPlaycnts    = 1;
            }
            else
            {
                pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
            }

            if (pstConfigNode->u32BottomPlaycnts == 0)
            {
                pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_DI;
                pstConfigNode->u32BottomPlaycnts = 1;
            }
            else
            {
                pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_NULL;
            }
        }
    }
    else
    {
        if (HI_DRV_FIELD_TOP == stCurrentPlayInfor.enFieldMode)
        {
            if ((pstConfigNode->u32Index == 0) && (pstFrame->stPlayInfor.u32PlayCnt == 0))
            {
                pstConfigNode->u32TopPlaycnts    = 1;
            }
            else
            {
                pstConfigNode->u32TopPlaycnts    = pstFrame->stPlayInfor.u32PlayCnt;
            }

            pstConfigNode->u32BottomPlaycnts = 0;
        }
        else if (HI_DRV_FIELD_BOTTOM == stCurrentPlayInfor.enFieldMode)
        {
            if ((pstConfigNode->u32Index == 0) && (pstFrame->stPlayInfor.u32PlayCnt == 0))
            {
                pstConfigNode->u32BottomPlaycnts    = 1;
            }
            else
            {
                pstConfigNode->u32BottomPlaycnts    = pstFrame->stPlayInfor.u32PlayCnt;
            }

            pstConfigNode->u32TopPlaycnts          = 0;
        }

        if(pstConfigNode->u32Index == 0)
        {
            pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
            pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_NULL;
        }
        else
        {
            if (HI_TRUE == bSingleFieldFrameMode)
            {
                if ((pstConfigNode->u32TopPlaycnts == 0) && (HI_DRV_FIELD_TOP == stCurrentPlayInfor.enFieldMode))
                {
                    pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_DI;
                }
                else
                {
                    pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
                }

                if ((pstConfigNode->u32BottomPlaycnts == 0) && (HI_DRV_FIELD_BOTTOM == stCurrentPlayInfor.enFieldMode))
                {
                    pstConfigNode->enBottomActiveRefMode      = XDP_ACTIVE_REF_DI;
                }
                else
                {
                    pstConfigNode->enBottomActiveRefMode      = XDP_ACTIVE_REF_NULL;
                }
            }
            else
            {
                pstConfigNode->enTopActiveRefMode      = XDP_ACTIVE_REF_NULL;
                pstConfigNode->enBottomActiveRefMode   = XDP_ACTIVE_REF_NULL;
            }
        }
    }

    if (pstPlayInfo->stNodeAddr.u32StartPhyAddr == 0)
    {
        for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
        {
            if (pstWin->stHardwareConfig.stNodeMMZ[i].bReady == HI_TRUE)
            {
                pstConfigNode->pstXdpNodeAddr         = &pstWin->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz;
                pstConfigNode->pstXdpPqBaseAddr       = &pstWin->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz;
                pstConfigNode->pstXdpNodePrivateInfor = pstWin->stHardwareConfig.pstNodePrivateInfor[i];
                WIN_INFO("--Get NodeAddr:%x,frameaddr:%x!\n", pstConfigNode->pstXdpNodeAddr->u32StartPhyAddr,
                                                            pstFrame->stBufAddr[0].u32PhyAddr_Y);

                memset(pstConfigNode->pstXdpNodeAddr->pu8StartVirAddr, 0, pstConfigNode->pstXdpNodeAddr->u32Size);

                /*since software alg should not load every queue, so should not memset.*/
                //memset(pstConfigNode->pstXdpPqBaseAddr->pu8StartVirAddr, 0, pstConfigNode->pstXdpPqBaseAddr->u32Size);

                pstWin->stHardwareConfig.stNodeMMZ[i].bReady = HI_FALSE;
                pstWin->stHardwareConfig.stVPSSMMZ[i].bReady = HI_FALSE;

                pstWin->stHardwareConfig.stNodeMMZ[i].u32FrameYAddr = pstFrame->stBufAddr[0].u32PhyAddr_Y;
                pstWin->stHardwareConfig.stNodeMMZ[i].u32FrameIndex = pstFrame->u32FrameIndex;

                memcpy(&(pstPlayInfo->stNodeAddr),
                       &pstWin->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz,
                       sizeof(DISP_MMZ_BUF_S));

                memcpy(&(pstPlayInfo->stXdpPqBaseAddr),
                       &pstWin->stHardwareConfig.stVPSSMMZ[i].stVideoAlgMmz,
                       sizeof(DISP_MMZ_BUF_S));
                pstPlayInfo->pstXdpNodePrivateInfor = pstWin->stHardwareConfig.pstNodePrivateInfor[i];
                break;
            }
        }

        if (i >= WIN_ALG_MMZ_NUM)
        {
            WIN_ERROR("i >= WIN_ALG_MMZ_NUM !!!\n");
            return HI_ERR_VO_NO_SOURCE;
        }
    }
    else
    {
        pstConfigNode->pstXdpNodeAddr          = &pstPlayInfo->stNodeAddr;
        pstConfigNode->pstXdpPqBaseAddr        = &pstPlayInfo->stXdpPqBaseAddr;
        pstConfigNode->pstXdpNodePrivateInfor  = (HW_NODE_PRIVATE_DEBUG_INFOR_S *)pstPlayInfo->pstXdpNodePrivateInfor;
    }

    if ( (HI_NULL == pstConfigNode->pstXdpNodeAddr) || (HI_NULL == pstConfigNode->pstXdpPqBaseAddr  ))
    {
        WIN_ERROR("NULL ptr %p %p!!!\n", pstConfigNode->pstXdpNodeAddr, pstConfigNode->pstXdpPqBaseAddr);
    }

    pstConfigNode->stXdpVpssIpCfg.bCcsEn = HI_FALSE;
    pstConfigNode->stXdpVpssIpCfg.bClsEn = HI_FALSE;
    pstConfigNode->stXdpVpssIpCfg.bVc1En = HI_FALSE;

    pstConfigNode->stXdpVpssIpCfg.u32VpssBufStartAddr = pstWin->stHardwareConfig.stDeiMmzBuf.u32StartPhyAddr;
    pstConfigNode->stXdpVpssIpCfg.u32VpssBufVirtStartAddr = (HI_U32)pstWin->stHardwareConfig.stDeiMmzBuf.pu8StartVirAddr;

    pstConfigNode->stXdpVpssIpCfg.u32VpssOutStartAddr     = pstWin->stHardwareConfig.stVpssoutMmzBuf.u32StartPhyAddr;
    pstConfigNode->stXdpVpssIpCfg.u32VpssOutVirtStartAddr = (HI_U32)pstWin->stHardwareConfig.stVpssoutMmzBuf.pu8StartVirAddr;

    return HI_SUCCESS;
}


extern HI_VOID WinConfigInrect(WINDOW_S *pstWin, WIN_INFO_S *pstLayerPara, HI_DRV_VIDEO_FRAME_S *pstFrame);
extern HI_VOID Win_AspRatioProcess(VDP_ALG_RATIO_DRV_PARA_S *pstAspDrvPara,VDP_ALG_RATIO_OUT_PARA_S *pstAspCfg);

HI_VOID Win_GenerateFrameAspectInfor(HI_VOID)
{
    return;
}

HI_VOID Win_TransvertCoordinateHD(WINDOW_S *pstWin,
                                HI_DRV_VIDEO_FRAME_S *pstFrame,
                                WIN_INFO_S *pstLayerPara,
                                HI_DISP_DISPLAY_INFO_S *pstInfo,
    VDP_ALG_RATIO_DRV_PARA_S  *pstDrvPara,
    VDP_ALG_RATIO_OUT_PARA_S  *pstOutPara
                                )
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = HI_NULL;
    HI_RECT_S  stFinalDisPosition;/*out out win Rect*/
    HI_RECT_S  stFinalVideoPosition;/*out out video Rect*/
    VDP_ALG_RATIO_DRV_PARA_S  stDrvPara;
    VDP_ALG_RATIO_OUT_PARA_S  stOutPara;

    VIDEO_LAYER_CAPABILITY_S  stVideoLayerCap = {0};
     (HI_VOID)pstWin->stVLayerFunc.PF_GetCapability(pstWin->u32VideoLayer, &stVideoLayerCap);

    memset(&stDrvPara, 0, sizeof(VDP_ALG_RATIO_DRV_PARA_S));
    memset(&stOutPara, 0, sizeof(VDP_ALG_RATIO_OUT_PARA_S));
    memset(&stFinalDisPosition, 0, sizeof(HI_RECT_S));
    memset(&stFinalVideoPosition, 0, sizeof(HI_RECT_S));

    WinConfigInrect(pstWin, pstLayerPara, pstFrame);

    pstPriv = (HI_DRV_VIDEO_PRIVATE_S *)pstFrame->u32Priv;
    //if ((!pstPriv->bAspectProcessed) && ( stVideoLayerCap.bZme))
    if (1)
    {
        /*window phy OutRect*/
        stFinalDisPosition = pstWin->stUsingAttr.stOutRect;

        /*need VDP AspRatio process*/
        /*out out win Rect*/
        stDrvPara.stDispRect.u32AspectWidth = pstFrame->u32AspectWidth;
        stDrvPara.stDispRect.u32AspectHeight = pstFrame->u32AspectHeight;
        stDrvPara.stScreen.u32AspectHeight = pstInfo->stAR.u32ARh;
        stDrvPara.stScreen.u32AspectWidth = pstInfo->stAR.u32ARw;
        stDrvPara.eAspMode = pstWin->stUsingAttr.enARCvrs;

        if ((!pstWin->stUsingAttr.stCustmAR.u32ARw ) || (!pstWin->stUsingAttr.stCustmAR.u32ARh))
        {
            stDrvPara.stUsrAsp.bUserDefAspectRatio = HI_FALSE;
        }
        else
        {
            stDrvPara.stUsrAsp.bUserDefAspectRatio = HI_TRUE;
        }

        stDrvPara.stUsrAsp.u32UserAspectWidth = pstWin->stUsingAttr.stCustmAR.u32ARw;
        stDrvPara.stUsrAsp.u32UserAspectHeight = pstWin->stUsingAttr.stCustmAR.u32ARh;

        stDrvPara.stDispRect.stRect = pstFrame->stDispRect;
        stDrvPara.stInRect.stRect = pstLayerPara->stIn;


        stDrvPara.stInRect.u32AspectWidth = stDrvPara.stDispRect.u32AspectWidth;
        stDrvPara.stInRect.u32AspectHeight = stDrvPara.stDispRect.u32AspectHeight;
        stDrvPara.stOutWnd = stFinalDisPosition;
        stDrvPara.stScreen.stRect = pstInfo->stFmtResolution;

        if ((0 == stDrvPara.stOutWnd.s32Width) || (0 == stDrvPara.stOutWnd.s32Height))
        {
            stDrvPara.stOutWnd.s32Width = stDrvPara.stScreen.stRect.s32Width;
            stDrvPara.stOutWnd.s32Height = stDrvPara.stScreen.stRect.s32Height;
        }

        if ((stDrvPara.eAspMode == HI_DRV_ASP_RAT_MODE_FULL
             || stDrvPara.eAspMode == HI_DRV_ASP_RAT_MODE_BUTT)
            && stDrvPara.stOutWnd.s32Width == 720
            && stDrvPara.stInRect.stRect.s32Width == 704
            && (stDrvPara.stInRect.stRect.s32Height == 576
                || stDrvPara.stInRect.stRect.s32Height == 480)
            && stDrvPara.stInRect.stRect.s32Height
            == stDrvPara.stOutWnd.s32Height)
        {
            stOutPara.stVideoWnd.s32X = 8;
            stOutPara.stVideoWnd.s32Y = 0;
            stOutPara.stVideoWnd.s32Width = stDrvPara.stInRect.stRect.s32Width;
            stOutPara.stVideoWnd.s32Height = stDrvPara.stInRect.stRect.s32Height;
            stOutPara.enCropId = VDP_ALG_RATIO_CROP_BUTT;
            stOutPara.enLboxId = VDP_ALG_RATIO_LBOX_BUTT;
        }
        else
        {
            Win_AspRatioProcess(&stDrvPara, &stOutPara);

            if (HI_TRUE == stDrvPara.bPause)
            {
                stOutPara.enCropId = VDP_ALG_RATIO_CROP_FDRVF;
                stOutPara.enLboxId = VDP_ALG_RATIO_LBOX1;
            }
            else
            {
                stOutPara.enCropId = VDP_ALG_RATIO_CROP_FDRV0;
                stOutPara.enLboxId = VDP_ALG_RATIO_LBOX1;
            }
        }

        stFinalVideoPosition = stOutPara.stVideoWnd;
        pstLayerPara->stIn = stDrvPara.stInRect.stRect;

    }
    else
    {
        if ( VDP_LAYER_SD0 == pstWin->u32VideoLayer)
        {
            HI_DRV_VIDEO_PRIVATE_S *pstFramePrivate = (HI_DRV_VIDEO_PRIVATE_S *)(&(pstFrame->u32Priv[0]));

            stFinalDisPosition = pstFramePrivate->stWBC2SDDispRect;
        }
        else
        {
            stFinalDisPosition = pstWin->stUsingAttr.stOutRect;
        }

        stFinalVideoPosition = stFinalDisPosition;

    }

    pstLayerPara->stDisp   = stFinalDisPosition;
    pstLayerPara->stVideo  = stFinalVideoPosition;


    *pstDrvPara = stDrvPara;
    *pstOutPara = stOutPara;



    return;
}

HI_VOID Win_GetPQReuslt(HI_VOID)
{
    return;
}

HI_VOID Win_PrePostFrameProcess(WINDOW_S *pstWin,
                                HI_DRV_VIDEO_FRAME_S *pstFrame,
                                WIN_INFO_S *pstLayerPara,
                                HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    VDP_ALG_RATIO_DRV_PARA_S  stDrvParaHD;
    VDP_ALG_RATIO_OUT_PARA_S  stOutParaHD;
    //VDP_ALG_RATIO_DRV_PARA_S stDrvParaSD;
    //VDP_ALG_RATIO_OUT_PARA_S stOutParaSD;

    Win_TransvertCoordinateHD(pstWin, pstFrame,
                              pstLayerPara, pstInfo,
                              &stDrvParaHD, &stOutParaHD);

    //Win_TransvertCoordinateSD(&stDrvParaHD, &stOutParaHD,  &stDrvParaSD, &stOutParaSD);

    Win_GenerateFrameAspectInfor();
    Win_GetPQReuslt();

    return;
}

HI_S32 Win_GenerateConfigInfo(WINDOW_S *pstWin,
                               HI_DRV_VIDEO_FRAME_S *pstFrame,
                               HI_DISP_DISPLAY_INFO_S *pstInfo,
                               WIN_INFO_S *pstLayerPara)
{
    VIDEO_LAYER_CAPABILITY_S  stVideoLayerCap = {0};
    HI_S32 ret = HI_FAILURE;
    HI_RECT_S stFrameIntermediaRect = {0};
    DISP_INTF_OPERATION_S stFunction = {0};
    HI_BOOL bBtm  =    HI_FALSE;
    HI_U32  u32Vcnt = 0;
    HI_DRV_DISP_OFFSET_S  stOffsetTmp = {0};
    HI_RECT_S stFmtResolution = {0};
    (HI_VOID)pstWin->stVLayerFunc.PF_GetCapability(pstWin->u32VideoLayer, &stVideoLayerCap);

    /* first  get the basic setting of layerparam. */
    memset(pstLayerPara, 0x0, sizeof(WIN_INFO_S));
    pstLayerPara->pCurrentFrame = pstFrame;

    /*stOutRect may equal to stIn in most situation.*/
    pstLayerPara->pstDispInfo =  pstInfo;

    pstLayerPara->u32RegionNo =    pstWin->u32VideoRegionNo;
    pstLayerPara->u32LayerId =    pstWin->u32VideoLayer;
    pstLayerPara->bRegionMute  = 0;
    pstLayerPara->bRegionEnable = HI_TRUE;
    pstLayerPara->bFlipEn = (pstFrame->u32Circumrotate == HI_TRUE);
    Win_PrePostFrameProcess(pstWin, pstFrame, pstLayerPara,pstInfo);

    (HI_VOID)DISP_HAL_GetOperation(&stFunction);
    if (HI_NULL == stFunction.FP_GetChnBottomFlag)
    {
        WIN_FATAL("stFunction.FP_GetChnBottomFlag is NULL!\n");
        return HI_FAILURE;
    }
    stFunction.FP_GetChnBottomFlag(pstWin->enDisp, &bBtm, &u32Vcnt);

    if (pstWin->bVirtScreenMode == HI_TRUE)
    {
        WinGetActualOffsetAccordingUserSetting(pstWin->enDisp,
                                               &pstLayerPara->pstDispInfo->stOffsetInfo,
                                               &stOffsetTmp,
                                               &pstWin->stCfg.stAttrBuf.stOutRect);
    }
    else
    {
        memset((void *)&stOffsetTmp, 0, sizeof(stOffsetTmp));
    }

    stFmtResolution = pstLayerPara->pstDispInfo->stFmtResolution;

    if ((pstLayerPara->stIn.s32Width != pstLayerPara->stVideo.s32Width)
        || (pstLayerPara->stIn.s32Height != pstLayerPara->stVideo.s32Height))
    {
        if (!stVideoLayerCap.bZme)
        {
            /*we must confirm that v1, should not configure the zme,
                        but the ifir is needed ,so we have to configure it or not? */
            pstLayerPara->bRegionMute = HI_TRUE;
        }
    }
    /*
        *since we support picture moved out of screen, so we should give a revise to the window ,
        *both inrect and outrect.
        */
    (HI_VOID)Win_Revise_OutOfScreenWin_OutRect(&pstLayerPara->stIn, &pstLayerPara->stVideo, &pstLayerPara->stDisp,
            &stFmtResolution,
            &stOffsetTmp,
            pstLayerPara);

    if (((pstFrame->ePixFormat == HI_DRV_PIX_FMT_NV12_CMP)
         || (pstFrame->ePixFormat == HI_DRV_PIX_FMT_NV21_CMP))
        && (stVideoLayerCap.bDcmp != HI_TRUE))
    {
        /*frame is compressed but the layer has no capability*/
        pstLayerPara->bRegionMute = 1;
    }

    if (pstLayerPara->bRegionMute)
    {
        pstLayerPara->stIn.s32Width = pstLayerPara->stDisp.s32Width;
        pstLayerPara->stIn.s32Height = pstLayerPara->stDisp.s32Height;
        pstLayerPara->stVideo.s32Width = pstLayerPara->stDisp.s32Width;
        pstLayerPara->stVideo.s32Height = pstLayerPara->stDisp.s32Height;
    }

    stFrameIntermediaRect.s32X      = 0;
    stFrameIntermediaRect.s32Y      = 0;
    stFrameIntermediaRect.s32Width  = pstFrame->DispCtrlWidth;
    stFrameIntermediaRect.s32Height = pstFrame->DispCtrlHeight;
    /*get intermediate Rect to degrade the PQ  as a matter of TEE monitor.*/
    Win_Policy_GetPQDegradingConfigFromTEE(pstFrame->bSecure,
                                           &pstLayerPara->stIn,
                                           &pstLayerPara->stVideo,
                                           pstWin->u32VideoLayer,
                                           &stFrameIntermediaRect,
                                           &pstLayerPara->bHdcpDegradePQ,
                                           &pstLayerPara->stHdcpIntermediateRect);

    /*pay attention,  when frame is interleave, frame rate is the rate of frame ,not field.*/
    pstLayerPara->bFieldMatch = WIN_POLICY_JudgeFieldMatchEnableStatus(&pstLayerPara->stIn,
                                           pstFrame->u32OriFrameRate/10,
                                           pstFrame->bProgressive,
                                           &pstInfo->stFmtResolution,
                                           pstInfo->u32RefreshRate,
                                           (pstInfo->bInterlace ? HI_FALSE:HI_TRUE));

    pstLayerPara->enLayerFrostMode = pstWin->enWinFrostMode;


    XDP_ASP_INFO("tohw video %d %d %d %d  disp %d %d %d %d\n",
        pstLayerPara->stVideo.s32X,
        pstLayerPara->stVideo.s32Y,
        pstLayerPara->stVideo.s32Width,
        pstLayerPara->stVideo.s32Height,

    pstLayerPara->stDisp.s32X,
    pstLayerPara->stDisp.s32Y,
    pstLayerPara->stDisp.s32Width,
    pstLayerPara->stDisp.s32Height
    );


    ret = WIN_Genarate_hwconfig(pstWin,
                               pstFrame,
                               &pstLayerPara->stConfigNode,
                               &pstLayerPara->stIn,
                               &pstLayerPara->stVideo,
                               &pstLayerPara->stDisp);
    if (HI_SUCCESS != ret)
    {
        WIN_FATAL("Should not come here!\n");
        return HI_FAILURE;
    }
    return HI_SUCCESS;
}

HI_VOID Win_UpWinPosionDebugInfo(HI_VOID *hDst,WIN_INFO_S *pstLayerPara)
{
    WINDOW_S *pstWin;
    HI_DISP_DISPLAY_INFO_S stDispInfo = {0};

    pstWin = (WINDOW_S *)hDst;
    (HI_VOID)DISP_GetDisplayInfo(pstWin->enDisp, &stDispInfo);

    pstWin->stWinDebugInfo.stWinUseInfo.u32OffsetLeft = stDispInfo.stOffsetInfo.u32Left;
    pstWin->stWinDebugInfo.stWinUseInfo.u32OffsetRight = stDispInfo.stOffsetInfo.u32Top;
    pstWin->stWinDebugInfo.stWinUseInfo.u32OffsetTop = stDispInfo.stOffsetInfo.u32Right;
    pstWin->stWinDebugInfo.stWinUseInfo.u32OffsetButtom = stDispInfo.stOffsetInfo.u32Bottom;

    pstWin->stWinDebugInfo.stWinUseInfo.stVirInRect = pstWin->stCfg.stAttr.stInRect;
    pstWin->stWinDebugInfo.stWinUseInfo.stVirOutRect = pstWin->stCfg.stAttr.stOutRect;

    pstWin->stWinDebugInfo.stWinUseInfo.stPhyInRect = pstWin->stUsingAttr.stInRect;
    pstWin->stWinDebugInfo.stWinUseInfo.stPhyOutRect = pstWin->stUsingAttr.stOutRect;

    if (HI_NULL != pstLayerPara->pCurrentFrame)
    {
        pstWin->stWinDebugInfo.stWinHalInfo.stSrcRect.s32X = 0;
        pstWin->stWinDebugInfo.stWinHalInfo.stSrcRect.s32Y = 0;
        pstWin->stWinDebugInfo.stWinHalInfo.stSrcRect.s32Width = pstLayerPara->pCurrentFrame->u32Width;
        pstWin->stWinDebugInfo.stWinHalInfo.stSrcRect.s32Height = pstLayerPara->pCurrentFrame->u32Height;
    }

    pstWin->stWinDebugInfo.stWinHalInfo.stIn = pstLayerPara->stIn;
    pstWin->stWinDebugInfo.stWinHalInfo.stVideo = pstLayerPara->stVideo;
    pstWin->stWinDebugInfo.stWinHalInfo.stDisp = pstLayerPara->stDisp;

    return;
}

extern HI_VOID WIN_SHARE_GetShareInfo(WIN_SHARE_INFO_S *pstWinShareInfo);
HI_S32 ISR_WinConfigFrameNormal(WINDOW_S *pstWin,
                                        HI_DRV_VIDEO_FRAME_S *pstFrame,
                                        HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    HI_DRV_DISP_COLOR_SETTING_S stColor;
    HI_U32 u32Fidelity = 0;
    HI_S32 ret = HI_FAILURE;
    DISP_INTF_OPERATION_S *pstDispOpt = HI_NULL;
    HI_RECT_S stCanvas;
    HIDRV_DISP_NODE_DELAYTIME   *pstDispNodedelayTime = HI_NULL;
    HI_BOOL  bSdrChoice = HI_FALSE, bHdrFrame = HI_FALSE;
    WIN_INFO_S stWinInfo = {0};

    memset(&stCanvas, 0, sizeof(stCanvas));
    memset(&stColor, 0, sizeof(stColor));

    pstDispOpt = DISP_HAL_GetOperationPtr();
    if ((HI_NULL == pstDispOpt)
        || (HI_NULL == pstFrame))
    {
        WIN_ERROR("Get disp ops failed.\n");
        return HI_FAILURE;
    }

    WIN_SHARE_GetFrameColorSpace(pstFrame, &stColor.enInCS);
    stColor.enOutCS = pstInfo->eColorSpace;
    u32Fidelity     = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->u32Fidelity;

    if (stColor.enInCS == HI_DRV_CS_UNKNOWN)
    {
        stColor.enInCS = HI_DRV_CS_BT709_YUV_LIMITED;
    }

    if (stColor.enOutCS == HI_DRV_CS_UNKNOWN)
    {
        stColor.enOutCS = HI_DRV_CS_BT709_YUV_LIMITED;
    }

    pstWin->stCfg.enFrameCS = stColor.enInCS;
    pstWin->stCfg.enOutCS    = stColor.enOutCS;
    pstWin->stCfg.u32Fidelity = u32Fidelity;
    pstWin->stCfg.eDispMode = pstInfo->eDispMode;
    pstWin->stCfg.bRightEyeFirst = pstInfo->bRightEyeFirst;

    ret =  Win_GenerateConfigInfo(pstWin, pstFrame, pstInfo, &stWinInfo);
    if (HI_SUCCESS != ret)
    {
        WIN_ERROR("Get disp ops failed.\n");
        return ret;
    }

    /* here we delete all the rwzb content, just rebuild it  in 98cv200 .*/
    if (pstWin->enDisp == HI_DRV_DISPLAY_1)
    {
        (HI_VOID)pstDispOpt->PF_DATE_SetCoef(HI_DRV_DISPLAY_0, RWZB_GetDATEParaIndex(u32Fidelity));
        (HI_VOID)pstDispOpt->PF_DATE_SetIRE(pstWin->enDisp, 0);

        if ( VDP_LAYER_VID0 == stWinInfo.u32RegionNo )
        {
            if ((HI_TRUE == WIN_POLICY_RwzbProcess(u32Fidelity)) && (pstFrame->u32Height == stWinInfo.stVideo.s32Height))
            {
                (HI_VOID)DRV_PQ_SetDefaultParam(HI_TRUE);
                if (( 1 == WinGetHDWinNum()) && ( pstInfo->bAttachCVBS))
                {
                    stWinInfo.bCloseY2R = HI_TRUE;
                }
            }
            else if ((HI_DRV_PIX_FMT_NV61_2X1 == pstFrame->ePixFormat) && (pstFrame->u32Height >= UHD_2160P_HEIGHT))
            {
                (HI_VOID)DRV_PQ_SetDefaultParam(HI_FALSE);
                stWinInfo.bCloseY2R = HI_TRUE;
            }
            else
            {
                (HI_VOID)DRV_PQ_SetDefaultParam(HI_FALSE);
                stWinInfo.bCloseY2R = HI_FALSE;
            }
        }
    }

    stWinInfo.u32Alpha = pstWin->stCfg.u32Alpha;
    stWinInfo.u32AllAlpha = pstInfo->u32Alpha;
    stWinInfo.enOutCsc = pstWin->stCfg.enOutCS;
    stWinInfo.pstDispInfo = pstInfo;

    WIN_JudgeHdrFrame(pstFrame->enSrcFrameType, &bHdrFrame);
    if ((HI_FALSE == bHdrFrame) || (pstWin->stUsingAttr.bCloseHdrPath))
    {
        bSdrChoice = HI_TRUE;
    }
    else
    {
        bSdrChoice = HI_TRUE;
    }

    Win_PqProcess(pstWin, pstFrame,&stWinInfo.stVideo, pstInfo, !bSdrChoice);
    WinTransferConfigInfoToWinShareInfo(pstWin, &stWinInfo);

    WIN_SHARE_SetWinInfo(&stWinInfo);
    Win_UpdateHdFramInfo(&stWinInfo,&pstWin->stCfg,pstFrame->bSecure);
    WinTestFrameMatch(pstWin, pstFrame, pstInfo);

    pstDispNodedelayTime   =  &(pstWin->stBuffer.stWinBP.stBuffer.stDispNodeDelayTime);
    if (pstDispNodedelayTime)
    {
        (HI_VOID)DISP_GetVbiTimeInfo(pstWin->enDisp, HI_NULL, &(pstDispNodedelayTime->u32NodeConfigLeftTime));
    }

    Win_UpWinPosionDebugInfo(pstWin,&stWinInfo);

    return HI_SUCCESS;
}

HI_S32 ISR_WinConfigFrame(WINDOW_S *pstWin,
                                    HI_DRV_VIDEO_FRAME_S *pstFrame,
                                    HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    HI_S32 ret = HI_FAILURE;

    if (HI_NULL == pstFrame)
    {
        WIN_ERROR("null pFrame\n");
        return HI_FAILURE;
    }

    ret = ISR_WinConfigFrameNormal(pstWin, pstFrame, pstInfo);
    if (HI_SUCCESS != ret)
    {
        WIN_ERROR("config normal failed.\n");
        return ret;
    }


    if (pstFrame)
    {
        if (0 == pstFrame->stLowdelayStat.u32WinConfigTime)
        {
            if (HI_DRV_SYS_GetTimeStampMs(&(pstFrame->stLowdelayStat.u32WinConfigTime)))
            {
                DISP_ERROR("get sys time failed, not init.\n");
                return HI_FAILURE;
            }
        }

        memcpy(&pstWin->stLowdelayStat, &pstFrame->stLowdelayStat, sizeof(HI_DRV_LOWDELAY_STAT_INFO_S));
    }

    WinUpdateDispInfo(pstWin, pstInfo);
    return  HI_SUCCESS;
}

HI_VOID ISR_WinUpdatePlayInfo(WINDOW_S *pstWin, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    // calc delay time in buffer queue
    HI_U32 T = 0;

    if ((0 == pstInfo->stDispInfo.u32RefreshRate)
        || (0 == pstInfo->stDispInfo.stFmtResolution.s32Height)
        || (0 == pstInfo->stDispInfo.stPixelFmtResolution.s32Height))
    {
        WIN_ERROR("Invalid display fresh rate!\n");
        return;
    }

    pstWin->stDelayInfo.u32DispRate = pstInfo->stDispInfo.u32RefreshRate;
    pstWin->stDelayInfo.T = (1 * 1000 * 100) / pstInfo->stDispInfo.u32RefreshRate;

    pstWin->stDelayInfo.bInterlace = pstInfo->stDispInfo.bInterlace;
    T = pstWin->stDelayInfo.T;

    if (pstInfo->stDispInfo.bInterlace)
    {
        pstWin->stDelayInfo.u32DisplayTime = (pstInfo->stDispInfo.u32Vline * 2 * T) / pstInfo->stDispInfo.stPixelFmtResolution.s32Height;
    }
    else
    {
        pstWin->stDelayInfo.u32DisplayTime = (pstInfo->stDispInfo.u32Vline * T) / pstInfo->stDispInfo.stPixelFmtResolution.s32Height;
    }

    if (HI_DRV_SYS_GetTimeStampMs((HI_U32 *)&pstWin->stDelayInfo.u32CfgTime))
    {
        DISP_ERROR("get sys time failed, not init.\n");
        return ;
    }

    return;
}



HI_VOID WinGetHDDispInfo(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pb3Dmode, HI_BOOL *pbSDFmt, HI_BOOL *pbHDInterlace)
{
    HI_DISP_DISPLAY_INFO_S stDispInfo = {0};

    (HI_VOID)DISP_GetDisplayInfo(enDisp, &stDispInfo);

    if (DISP_STEREO_NONE != stDispInfo.eDispMode)
    {
        *pb3Dmode =  HI_TRUE;
    }
    else
    {
        *pb3Dmode =  HI_FALSE;
    }

    *pbHDInterlace = stDispInfo.bInterlace;

    if ((HI_DRV_DISP_FMT_PAL <= stDispInfo.eFmt ) && (HI_DRV_DISP_FMT_1440x480i_60 >= stDispInfo.eFmt ))
    {
        *pbSDFmt  =  HI_TRUE;
    }
    else
    {
        *pbSDFmt =  HI_FALSE;
    }
    return;
}

extern HI_DRV_VIDEO_FRAME_S * WinGetFrameToConfig(WINDOW_S *pstWin);

static HI_VOID WinPlayBuffer(WINDOW_S *pstWin,
                                 HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;

    ISR_WinReleaseUSLFrame(pstWin);
    pstFrame = WinGetFrameToConfig(pstWin);
    if (pstFrame)
    {
        if (HI_SUCCESS != WinStatisticLowdelayTimeInfor(pstWin->u32Index, pstFrame, EVENT_VO_FRM_OUT))
        {
            WIN_ERROR("Update Window lowdelay time failed\n");
        }

        ISR_WinConfigFrame(pstWin, pstFrame, pstInfo);
        WinClearBlackFrameFlag(pstWin);
    }
    else if (WinTestBlackFrameFlag(pstWin) == HI_TRUE)
    {
        /*no frame to display, just mute the layer.*/
        ISR_WinConfigFrame(pstWin, HI_NULL, pstInfo);
    }
    else
    {
        ISR_WinConfigFrame(pstWin, HI_NULL, pstInfo);
    }

    /* last branch , no frame and it's the start of playing, just return. */
    return;
}

extern HI_VOID  Win_HW_LookupUndisplaydFrame(WINDOW_S *pstWin,
                                                            HI_U32 u32FrameAddr,
                                                            HI_U32 *pu32BufNodeCounts,
                                                            HI_DRV_VIDEO_FRAME_S **parrayFrameList);

extern HI_S32 WinUpdateWinAttr(WINDOW_S *pstWin,const HI_DISP_DISPLAY_INFO_S *pstDispInfo);
HI_VOID ISR_CallbackForBufRelease(HI_VOID* hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_SIZE_T irqflag = 0;
    HI_DRV_WIN_SRC_INFO_S *pstSource = HI_NULL;

#if 0
    if ((WIN_DEVICE_STATE_SUSPEND == s_s32WindowGlobalFlag)
        || (pstInfo->eEventType == HI_DRV_DISP_C_PREPARE_CLOSE)
        || (pstInfo->eEventType == HI_DRV_DISP_C_PREPARE_TO_PEND))
    {
        return;
    }
#endif

    pstWin = (WINDOW_S *)hDst;
    pstSource = &pstWin->stCfg.stSource;
    if ((HI_NULL == pstSource->pfRlsFrame) || (pstSource->hSrc == HI_INVALID_HANDLE))
    {
        return;
    }

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    Win_FrameRelease(pstWin);

    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return;
}

HI_VOID ISR_CallbackForWinProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WINDOW_S *pstWin;

    pstWin = (WINDOW_S *)hDst;
    ISR_WinUpdatePlayInfo(pstWin, pstInfo);
    return;
}


HI_VOID Thread_CallbackForWinProcess(WINDOW_S * pstWin, HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    /*queue frame to  play buffer.*/
    WinPlayBuffer(pstWin, pstInfo);
    return;
}


HI_S32 WinGetProcIndex(HI_HANDLE hWin, HI_U32 *p32Index)
{
    WINDOW_S *pstWin = HI_NULL;

    WinCheckDeviceOpen();
    WinCheckNullPointer(p32Index);

    pstWin = WinGetWindow(hWin);
    if (pstWin)
    {
        *p32Index = pstWin->u32Index;
    }
    else
    {
        VIRTUAL_S *pstVirWin = HI_NULL;

        pstVirWin = WinGetVirWindow(hWin);
        if (pstVirWin)
        {
            *p32Index = pstVirWin->u32Index;
        }
        else
        {
            return HI_ERR_VO_WIN_NOT_EXIST;
        }
    }

    return HI_SUCCESS;
}

static  HI_VOID WinBufGetNodeCnts(WB_POOL_S *pstWinBP)
{
    HI_U32   u32Num = 0;
    DispBuf_GetListNodeNumber(&pstWinBP->stBuffer.stFullArray, &u32Num);
    WIN_WARN("Current fulllist buf num:%d!\n", u32Num);
    DispBuf_GetListNodeNumber(&pstWinBP->stBuffer.stUsingArray, &u32Num);
    WIN_WARN("Current usinglist buf num:%d!\n", u32Num);
    DispBuf_GetListNodeNumber(&pstWinBP->stBuffer.stEmptyArray, &u32Num);
    WIN_WARN("Current emptylist buf num:%d\n", u32Num);
    return;
}

static  HI_S32 WinBufGetStateInfo(WINDOW_S *pstWin,WB_POOL_S *pstWinBP, WIN_PROC_INFO_S *pstInfo)
{
    DISP_BUF_NODE_S *pstNode;
    HI_DRV_VIDEO_FRAME_S *pstFrame;
    HI_S32 i, nRet;
    VDP_DRV_LAYER_INFO_S stBufInfor = {0};

    WIN_CHECK_NULL_RETURN(pstWin);
    WIN_CHECK_NULL_RETURN(pstWinBP);
    WIN_CHECK_NULL_RETURN(pstInfo);

    pstInfo->u32ULSIn  = pstWin->stBuffer.stUselessBuf.u32ULSIn;
    pstInfo->u32ULSOut = pstWin->stBuffer.stUselessBuf.u32ULSOut;

    if (pstWin->stVLayerFunc.PF_GetTotalBufStatus)
    {
       (HI_VOID)pstWin->stVLayerFunc.PF_GetTotalBufStatus(pstWin->u32VideoLayer, &stBufInfor);
       pstWin->stBuffer.u32UnderLoad = stBufInfor.u32UnloadPlayCnts;

       pstInfo->u32BuffedPlayCnts        = stBufInfor.u32TotalPlayCnts;
       pstInfo->u32BuffedQueueNodeCnts   = stBufInfor.u32QueueNodeCnts;
       pstInfo->u32BuffedDequeueNodeCnts = stBufInfor.u32DeQueueNodeCnts;
       pstInfo->u32UnderLoad = pstWin->stBuffer.u32UnderLoad;
    }

    pstInfo->stBufState.u32Number = pstWinBP->u32BufNumber;

    for (i = 0; i < pstWinBP->u32BufNumber; i++)
    {
        nRet = DispBuf_GetNodeContent(&pstWinBP->stBuffer, i, &pstNode);
        if ( nRet == HI_SUCCESS)
        {
            pstInfo->stBufState.stNode[i].u32State = pstNode->u32State;
            pstInfo->stBufState.stNode[i].u32Empty = pstNode->u32EmptyCount;
            pstInfo->stBufState.stNode[i].u32Full  = pstNode->u32FullCount;

            pstFrame = (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;
            pstInfo->stBufState.stNode[i].u32FrameIndex = pstFrame->u32FrameIndex;
        }
        else
        {
            pstInfo->stBufState.stNode[i].u32State = 0;
            pstInfo->stBufState.stNode[i].u32Empty = 0;
            pstInfo->stBufState.stNode[i].u32Full  = 0;
            pstInfo->stBufState.stNode[i].u32FrameIndex = 0;
        }
    }

    WinBufGetNodeCnts(pstWinBP);

    if (HI_NULL == pstWinBP->pstDebugInfo)
    {
        return HI_ERR_VO_NULL_PTR;
    }

    memcpy(&pstInfo->stBufState.stRecord, pstWinBP->pstDebugInfo, sizeof(WB_DEBUG_INFO_S));
    (HI_VOID)WinGetLatestFrameInfor(HI_INVALID_HANDLE,&pstInfo->stBufState.stCurrentFrame);
    return HI_SUCCESS;
}

HI_S32 WinGetProcInfo(HI_HANDLE hWin, WIN_PROC_INFO_S *pstInfo)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();

    WinCheckNullPointer(pstInfo);

    DISP_MEMSET(pstInfo, 0, sizeof(WIN_PROC_INFO_S));

    // s1 get active window pointer
    pstWin = WinGetWindow(hWin);
    if (pstWin)
    {
        // get window proc info
        pstInfo->enType        = pstWin->enType;
        pstInfo->u32Index    = pstWin->u32Index;

        pstInfo->u32LayerId = (HI_U32)pstWin->u32VideoLayer;
        pstInfo->u32LayerRegionNo  = (HI_U32)pstWin->u32VideoRegionNo;

        pstInfo->u32Zorder  = pstWin->u32Zorder;
        pstInfo->bEnable   =  (HI_U32)pstWin->bEnable;
        pstInfo->bMasked   =  (HI_U32)pstWin->bMasked;
        pstInfo->u32WinState = (HI_U32)pstWin->enState;

        pstInfo->bReset = pstWin->bReset;
        pstInfo->enResetMode = pstWin->stRst.enResetMode;
        pstInfo->enFreezeMode = pstWin->stFrz.enFreezeMode;

        pstInfo->bQuickMode = pstWin->bQuickMode;
        pstInfo->bStepMode    = pstWin->bStepMode;
        pstInfo->bVirtualCoordinate = pstWin->bVirtScreenMode;

        pstInfo->hSrc           = (HI_U32)pstWin->stCfg.stSource.hSrc;
        pstInfo->hSecondSrc    = (HI_U32)pstWin->stCfg.stSource.hSecondSrc;
        pstInfo->pfAcqFrame    = (HI_VOID *)pstWin->stCfg.stSource.pfAcqFrame;
        pstInfo->pfRlsFrame    = (HI_VOID *)pstWin->stCfg.stSource.pfRlsFrame;
        pstInfo->pfSendWinInfo = (HI_VOID *)pstWin->stCfg.stSource.pfSendWinInfo;

        pstInfo->stAttr  = pstWin->stCfg.stAttr;
        pstInfo->u32Alpha = pstWin->stCfg.u32Alpha,

        pstInfo->u32TBNotMatchCount = pstWin->u32TBNotMatchCount;

        pstInfo->eDispMode = pstWin->stCfg.eDispMode;
        pstInfo->bRightEyeFirst = pstWin->stCfg.bRightEyeFirst;

        pstInfo->hSlvWin  = (HI_U32)pstWin->hSlvWin;
        pstInfo->bDebugEn = (HI_U32)pstWin->bDebugEn;

#ifdef VDP_ISOGENY_SUPPORT
        WIN_GetIsogenyPocInfor(&pstInfo->stIsogenyProcInfo);
#endif
        WinBufGetStateInfo(pstWin, &pstWin->stBuffer.stWinBP, pstInfo);

        pstInfo->stWinDebugInfo = pstWin->stWinDebugInfo;
        pstInfo->stWinInfoForDeveloper  = pstWin->stWinInfoForDeveloper;

        pstInfo->enWinMode  = pstWin->enWinMode;
        memcpy(&pstInfo->stLowdelayStat, &pstWin->stLowdelayStat, sizeof(HI_DRV_LOWDELAY_STAT_INFO_S));
        pstInfo->stFirstFrmStatus = pstWin->stCfg.stFirstFrmStatus;
    }

    return HI_SUCCESS;
}

HI_S32 WinGetCurrentImg(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    WINDOW_S *pstWin;
    HI_DRV_VIDEO_FRAME_S *pstFrmTmp = NULL;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFrame);
    WinCheckWindow(hWin, pstWin);
    DISP_MEMSET(pstFrame, 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    pstFrmTmp = WinBuf_GetDisplayingFrame(&pstWin->stBuffer.stWinBP);
    if (NULL == pstFrmTmp)
    {
        if (pstWin->latest_display_frame_valid)
        {
            *pstFrame = pstWin->latest_display_frame;
        }
        else
        {
            return HI_FAILURE;
        }
    }
    else
    {
        *pstFrame = *(pstFrmTmp);
        pstWin->latest_display_frame = *(pstFrmTmp);
        pstWin->latest_display_frame_valid = 1;
    }

    return HI_SUCCESS;
}

HI_S32 WinGetLatestFrameInfor(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFrame);
    DISP_MEMSET(pstFrame, 0, sizeof(HI_DRV_VIDEO_FRAME_S));
    *pstFrame = g_LastReleasedframeInfo;
    return HI_SUCCESS;
}

HI_S32 WinProcessFrameToSP420(HI_DRV_VIDEO_FRAME_S *pstFrame, HI_U32 u32DstSmmuAddr, WIN_EXTERN_S *pstExtern)
{
    HI_S32 s32Ret = HI_FAILURE;
    WIN_ERROR("no support!\n");
    return s32Ret;
}

HI_VOID WinTransforOneLineU10To8Bit(HI_U8 *pInAddr, HI_U32 u32Width, HI_U8 *pOutAddr, HI_U8  *pu8TempBuffer)
{
    HI_U32 i = 0, j = 0, u32Cnt = 0;
    HI_U8  *pTmpMem = HI_NULL;

    pTmpMem = pInAddr;
    u32Cnt = HICEILING(u32Width, 4);

    for (i = 0; i < u32Cnt; i++)
    {
        for (j = 0; j < 5; j++)
        {
            pu8TempBuffer[j] = *(pTmpMem + i * 5 + j);
        }
        *pOutAddr = ((pu8TempBuffer[2] << 4) & 0xf0) | ((pu8TempBuffer[1] >> 4) & 0x0f);
        pOutAddr++;
        *pOutAddr = pu8TempBuffer[4] & 0xff;
        pOutAddr++;
    }

    return ;
}

HI_VOID WinTransforOneLineV10To8Bit( HI_U8 *pInAddr, HI_U32 u32Width, HI_U8 *pOutAddr, HI_U8  *pu8TempBuffer)
{
    HI_U32 i = 0, j = 0, u32Cnt = 0;
    HI_U8  *pTmpMem = HI_NULL;

    pTmpMem = pInAddr;
    u32Cnt = HICEILING(u32Width, 4);

    for (i = 0; i < u32Cnt; i++)
    {
        for (j = 0; j < 5; j++)
        {
            pu8TempBuffer[j] = *(pTmpMem + i * 5 + j);
        }
        *pOutAddr = ((pu8TempBuffer[1] << 6) & 0xc0) | ((pu8TempBuffer[0] >> 2) & 0x3f);
        pOutAddr++;
        *pOutAddr = ((pu8TempBuffer[3] << 2) & 0xfc) | ((pu8TempBuffer[2] >> 6) & 0x03);
        pOutAddr++;
    }

    return ;
}

HI_VOID WinTransforOneLineY10bitToY8bit(HI_U8 *pu8InY10data,  HI_U8 *pu8OutY8data, HI_U32 u32Stride,  HI_U32 u32Width, HI_U8 *pTempBuffer)
{
    HI_U32 i = 0, j = 0, u32Temp = 0;

    for (i = 0; i < u32Stride; i++)
    {
        for (j = 0; j < 8; j++)
        {
            pTempBuffer[i * 8 + j] = (pu8InY10data[i] >> j) & 0x1;
        }
    }
    for (i = 0; i < u32Width; i++)
    {
        u32Temp = 0;
        for (j = 0; j < 8; j++)
        {
            u32Temp |= pTempBuffer[i * 10 + j + 2] << j;
        }
        pu8OutY8data[i] = u32Temp;
    }

    return ;
}

HI_VOID  WinWriteuv420ToBuffer(HI_U8 *pu8bufferAddress, HI_U8 *pu8VAddress, HI_U8 *pu8UAddress, HI_U32 u32DataLen)
{
    HI_U32 i = 0;
    HI_U32 j = 0;

    for (i = 0; i < u32DataLen; i++)
    {
        pu8bufferAddress[j] = pu8VAddress[i];
        j++;
        pu8bufferAddress[j] = pu8UAddress[i];
        j++;
    }

    return ;
}

HI_S32 WinCapture420Frame10bitTransforTo8bit(HI_DRV_VIDEO_FRAME_S *pstFrame, DISP_MMZ_BUF_S *pstSrcmem)
{
    HI_U32  u32Ystride = 0, u32Cstride = 0, u32Height = 0, u32Width = 0, i = 0, u32Datalen = 0;
    HI_U8  *pYStartAddress = HI_NULL;
    DISP_MMZ_BUF_S        stWinCaptureMMZ = {0};
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 *pu8TempAddr = HI_NULL;

    if (pstFrame->ePixFormat != HI_DRV_PIX_FMT_NV21)
    {
        WIN_ERROR("ePixFormat not support\n");
        return HI_ERR_VO_WIN_UNSUPPORT;
    }

    u32Height =  pstFrame->u32Height;
    u32Width = pstFrame->u32Width;
    u32Ystride = pstFrame->stBufAddr[0].u32Stride_Y;
    u32Cstride = pstFrame->stBufAddr[0].u32Stride_C;
    u32Datalen =  u32Width + 10 * u32Ystride;
    stWinCaptureMMZ.u32Size = u32Datalen + BUFFER_LEN_4K;

    if (HI_SUCCESS != DISP_OS_MMZ_Alloc("VDP_Cpefun", VDP_MEM_TYPE_MMZ, u32Datalen, VDP_MEM_ALIGN, &stWinCaptureMMZ))
    {
        WIN_ERROR("Malloc mem failed!\n");
        return HI_ERR_VO_MALLOC_FAILED;
    }

    s32Ret = DISP_OS_MMZ_Map(&stWinCaptureMMZ);
    if (s32Ret != HI_SUCCESS)
    {
        DISP_OS_MMZ_Release(&stWinCaptureMMZ);
        WIN_ERROR("Map VDP_Cpefun Failed\n");
        return s32Ret;
    }

    pYStartAddress = pstSrcmem->pu8StartVirAddr;
    pu8TempAddr = stWinCaptureMMZ.pu8StartVirAddr;

    for (i = 0; i < u32Height; i++)
    {
        WinTransforOneLineY10bitToY8bit(pYStartAddress , pYStartAddress/*pu8TempAddr*/, u32Ystride, u32Width, pu8TempAddr + u32Width);
        pYStartAddress += u32Ystride;
    }

    for (i = 0; i < u32Height / 2; i++)
    {
        WinTransforOneLineV10To8Bit(pYStartAddress, u32Width , pu8TempAddr, pu8TempAddr + u32Datalen);
        WinTransforOneLineU10To8Bit(pYStartAddress, u32Width, pu8TempAddr + u32Width / 2, pu8TempAddr + u32Datalen);
        WinWriteuv420ToBuffer(pYStartAddress, pu8TempAddr,  pu8TempAddr + u32Width / 2, u32Width / 2);
        pYStartAddress += u32Ystride;
    }

    DISP_OS_MMZ_UnMap(&stWinCaptureMMZ);
    DISP_OS_MMZ_Release(&stWinCaptureMMZ);

    return HI_SUCCESS;
}

extern HI_S32 XDP_OSAL_Tile2Linear(HI_U32 u32Width, HI_U32 u32Height,
                               HI_DRV_PIXEL_BITWIDTH_E enBitWidth,
                               HI_U8 *pu8TileAddrY, HI_U8 *pu8TileAddrC, HI_U32 u32TilePixelStride,
                               HI_U8 *pu8LinearPixel, HI_U32 u32LineraPixelStride);
HI_S32 WinGetOutputCaptureFrame(HI_DRV_VIDEO_FRAME_S *pstFrame, DISP_MMZ_BUF_S *pstDstMem)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32   u32Ystride = 0,  u32Height = 0;

    u32Ystride = pstFrame->stBufAddr[0].u32Stride_Y;
    u32Height   = pstFrame->u32Height;

    s32Ret = DISP_OS_MMZ_Map(pstDstMem);
    if (s32Ret != HI_SUCCESS)
    {
        WIN_ERROR("Map VDP_Cpefun Failed\n");
        return s32Ret;
    }

    if ((HI_DRV_PIXEL_BITWIDTH_10BIT == pstFrame->enBitWidth ) &&
        ( (HI_DRV_PIX_FMT_NV21 == pstFrame->ePixFormat) || (HI_DRV_PIX_FMT_NV12 == pstFrame->ePixFormat)))
    {
        DISP_MMZ_BUF_S stSrcMem = {0};
        stSrcMem.bSecure = HI_FALSE;
        stSrcMem.pu8StartVirAddr = 0;
        stSrcMem.u32StartPhyAddr = pstFrame->stBufAddr[0].u32PhyAddr_Y;
        stSrcMem.u32Size = u32Height * u32Ystride * 3 / 2;

#ifdef CFG_VDP_MMU_SUPPORT
        stSrcMem.bSmmu = HI_TRUE;
#else
        stSrcMem.bSmmu = HI_FALSE;
#endif
        s32Ret = DISP_OS_MMZ_Map(&stSrcMem);
        if (s32Ret != HI_SUCCESS)
        {
            WIN_ERROR("Map Src Buffer Failed\n");
            DISP_OS_MMZ_UnMap(pstDstMem);
            return s32Ret;
        }

        memcpy(pstDstMem->pu8StartVirAddr,
               stSrcMem.pu8StartVirAddr,
               u32Height * u32Ystride * 3 / 2);

        s32Ret = WinCapture420Frame10bitTransforTo8bit(pstFrame, pstDstMem);
        DISP_OS_MMZ_UnMap(&stSrcMem);
    }
    else   if ((HI_DRV_PIXEL_BITWIDTH_8BIT == pstFrame->enBitWidth ) &&
               ( (HI_DRV_PIX_FMT_NV21 == pstFrame->ePixFormat) || (HI_DRV_PIX_FMT_NV12 == pstFrame->ePixFormat)))
    {
        DISP_MMZ_BUF_S stSrcMem = {0};

        stSrcMem.bSecure = HI_FALSE;
        stSrcMem.pu8StartVirAddr = 0;
        stSrcMem.u32StartPhyAddr = pstFrame->stBufAddr[0].u32PhyAddr_Y;
        stSrcMem.u32Size = u32Height * u32Ystride * 3 / 2;
#ifdef CFG_VDP_MMU_SUPPORT
        stSrcMem.bSmmu = HI_TRUE;
#else
        stSrcMem.bSmmu = HI_FALSE;
#endif
        s32Ret = DISP_OS_MMZ_Map(&stSrcMem);
        if (s32Ret != HI_SUCCESS)
        {
            WIN_ERROR("Map Src Buffer Failed\n");
            DISP_OS_MMZ_UnMap(pstDstMem);

            return s32Ret;
        }

        memcpy(pstDstMem->pu8StartVirAddr,
               stSrcMem.pu8StartVirAddr,
               u32Height * u32Ystride * 3 / 2);
        DISP_OS_MMZ_UnMap(&stSrcMem);
    }
    else
    {
        DISP_MMZ_BUF_S stSrcMem = {0};
        DISP_MMZ_BUF_S stSrcMemC = {0};
        stSrcMem.bSecure = HI_FALSE;
        stSrcMem.pu8StartVirAddr = 0;
        stSrcMem.u32StartPhyAddr = pstFrame->stBufAddr[0].u32PhyAddr_Y;
        stSrcMem.u32Size = u32Height * u32Ystride * 3 / 2;

#ifdef CFG_VDP_MMU_SUPPORT
        stSrcMem.bSmmu = HI_TRUE;
#else
        stSrcMem.bSmmu = HI_FALSE;
#endif
        s32Ret = DISP_OS_MMZ_Map(&stSrcMem);
        if (s32Ret != HI_SUCCESS)
        {
            WIN_ERROR("Map Src Buffer Failed\n");
            DISP_OS_MMZ_UnMap(pstDstMem);

            return s32Ret;
        }

        stSrcMemC = stSrcMem;
        stSrcMemC.u32StartPhyAddr = pstFrame->stBufAddr[0].u32PhyAddr_C;
        stSrcMemC.u32Size = u32Height * pstFrame->stBufAddr[0].u32Stride_C / 2;

        s32Ret = DISP_OS_MMZ_Map(&stSrcMemC);
        if (s32Ret != HI_SUCCESS)
        {
            WIN_ERROR("Map Src Buffer Failed\n");
            DISP_OS_MMZ_UnMap(pstDstMem);
            DISP_OS_MMZ_UnMap(&stSrcMem);

            return s32Ret;
        }

        XDP_OSAL_Tile2Linear(pstFrame->u32Width, pstFrame->u32Height,
                             pstFrame->enBitWidth, stSrcMem.pu8StartVirAddr,
                             stSrcMemC.pu8StartVirAddr, pstFrame->stBufAddr[0].u32Stride_Y,
                             pstDstMem->pu8StartVirAddr, pstFrame->stBufAddr[0].u32Stride_Y
                            );

        DISP_OS_MMZ_UnMap(&stSrcMem);
        DISP_OS_MMZ_UnMap(&stSrcMemC);
    }

    DISP_OS_MMZ_UnMap(pstDstMem);

    return s32Ret;
}

HI_S32 WinCaptureFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_U32 *stMMZPhyAddr, HI_U32 *stMMZlen)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_DRV_VIDEO_FRAME_S *pstFrm = HI_NULL;
    HI_U32 u32Datalen = 0;
    DISP_MMZ_BUF_S stDstMem = {0};
    HI_S32 s32Ret = HI_FAILURE;

    HI_U32 u32RetSize = 0;
    HI_DRV_PIXEL_BITWIDTH_E     enBitWidth;

    HI_U32 u32Height = 0;
    HI_U32 u32Width_Stride = 0;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFrame);
    WinCheckNullPointer(stMMZPhyAddr);
    WinCheckNullPointer(stMMZlen);
    WinCheckWindow(hWin, pstWin);
    DISP_MEMSET(pstFrame, 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    if (pstWin->enType == HI_DRV_WIN_VITUAL_SINGLE)
    {
        return HI_ERR_VO_WIN_UNSUPPORT;
    }

    if (pstWin->u32WinCapMMZvalid )
    {
        WIN_FATAL("do not support continous capturing.\n");
        return HI_ERR_VO_WIN_UNSUPPORT;
    }

    if ( ((WIN_STATE_FREEZE == pstWin->enState)
          && (HI_DRV_WIN_SWITCH_BLACK == pstWin->stFrz.enFreezeMode))
         || ((HI_TRUE == pstWin->bReset)
             && (HI_DRV_WIN_SWITCH_BLACK == pstWin->stRst.enResetMode)))
    {
        pstFrm = BP_GetBlackFrameInfo();
    }
    else
    {
        s32Ret = WinBuf_SetCaptureFrame(pstWin);
        if (HI_SUCCESS != s32Ret)
        {
            WIN_ERROR("get frame err\n");
            return s32Ret;
        }

        pstFrm = WinBuf_GetCapturedFrame(&pstWin->stBuffer.stWinBP);
        if (HI_NULL == pstFrm)
        {
            pstFrm = BP_GetBlackFrameInfo();
        }
    }

    if (HI_NULL == pstFrm)
    {
        WIN_ERROR("get null frame ptr\n");
        return HI_ERR_VO_BUFQUE_EMPTY;
    }

    *pstFrame = *(pstFrm);

    u32Height   = pstFrame->u32Height;
    enBitWidth  = pstFrame->enBitWidth;
    u32Width_Stride = pstFrame->stBufAddr[0].u32Stride_Y;

    if ((HI_DRV_PIXEL_BITWIDTH_8BIT != enBitWidth)
        && (HI_DRV_PIXEL_BITWIDTH_10BIT != enBitWidth))
    {
        WIN_ERROR("Unsupport BitWidth %d.\n", enBitWidth);
        return HI_FAILURE;
    }

    switch (pstFrame->ePixFormat)
    {
        case HI_DRV_PIX_FMT_NV21:
        case HI_DRV_PIX_FMT_NV12_TILE:
        case HI_DRV_PIX_FMT_NV21_TILE:
        case HI_DRV_PIX_FMT_NV12_TILE_CMP:
        case HI_DRV_PIX_FMT_NV21_TILE_CMP:
        {
            u32RetSize = u32Height * u32Width_Stride * 3 / 2;
            break;
        }

        case HI_DRV_PIX_FMT_NV61_2X1:
        {
            u32RetSize = u32Height * u32Width_Stride * 2;
            break;
        }

        case HI_DRV_PIX_FMT_NV21_CMP:
        {
            u32RetSize = u32Height * u32Width_Stride * 3 / 2 + 16 * u32Height * 3 / 2;
            break;
        }

        default:
        {
            WIN_ERROR("Unsupport BitWidth %d.\n", enBitWidth);
            return HI_FAILURE;
        }
    }

    u32Datalen = u32RetSize;

    if (HI_SUCCESS != DISP_OS_MMZ_Alloc("VDP_Cpefun", VDP_MEM_TYPE_MMZ, u32Datalen, VDP_MEM_ALIGN, &pstWin->stWinCaptureMMZ))
    {
        WinBuf_ReleaseCaptureFrame(&pstWin->stBuffer.stWinBP, pstFrame, HI_FALSE);
        return HI_ERR_VO_MALLOC_FAILED;
    }

    pstWin->u32WinCapMMZvalid  = 1;
    *stMMZPhyAddr = pstWin->stWinCaptureMMZ.u32StartPhyAddr;
    *stMMZlen      = pstWin->stWinCaptureMMZ.u32Size;
    stDstMem.bSecure = pstWin->stWinCaptureMMZ.bSecure;
    stDstMem.bSmmu = pstWin->stWinCaptureMMZ.bSmmu;
    stDstMem.u32Size = pstWin->stWinCaptureMMZ.u32Size;
    stDstMem.u32StartPhyAddr = pstWin->stWinCaptureMMZ.u32StartPhyAddr;
    stDstMem.pu8StartVirAddr = 0;

    s32Ret = WinGetOutputCaptureFrame(pstFrame, &stDstMem);
    if (s32Ret != HI_SUCCESS)
    {
        WinBuf_ReleaseCaptureFrame(&pstWin->stBuffer.stWinBP, pstFrame, pstWin->u32WinCapMMZvalid);
        DISP_OS_MMZ_Release(&pstWin->stWinCaptureMMZ);
        WIN_ERROR("Get Output  Capture Frame Failed\n");
    }

    return s32Ret;

}

HI_S32 WinReleaseCaptureFrame(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 Ret = HI_FAILURE;

    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFrame);
    WinCheckWindow(hWin, pstWin);

    if (pstWin->enType == HI_DRV_WIN_VITUAL_SINGLE)
    {
        return HI_ERR_VO_WIN_UNSUPPORT;
    }

    Ret = WinBuf_ReleaseCaptureFrame(&pstWin->stBuffer.stWinBP, pstFrame, pstWin->u32WinCapMMZvalid);

    return Ret;
}

HI_S32 WinFreeCaptureMMZ(WINDOW_S *pstWin)
{
    if (pstWin->u32WinCapMMZvalid == 1)
    {
        DISP_OS_MMZ_Release(&pstWin->stWinCaptureMMZ);
        pstWin->stWinCaptureMMZ.u32StartPhyAddr = 0;
        pstWin->u32WinCapMMZvalid = 0;
    }
    else
    {
        WIN_ERROR("warning: when free mmz, null refcnt occurs.!\n");
        return HI_ERR_VO_INVALID_OPT;
    }

    return HI_SUCCESS;
}

HI_S32 WinFreeCaptureMMZBuf(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *cap_frame)
{
    WINDOW_S *pstWin;

    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    if (cap_frame->stBufAddr[0].u32PhyAddr_Y
        != pstWin->stWinCaptureMMZ.u32StartPhyAddr)
    {
        WIN_ERROR("capture release addr:%x,%x!\n", cap_frame->stBufAddr[0].u32PhyAddr_Y,
                  pstWin->stWinCaptureMMZ.u32StartPhyAddr);
        return HI_ERR_VO_INVALID_OPT;
    }

    return WinFreeCaptureMMZ(pstWin);

}

HI_S32 WinForceClearCapture(HI_HANDLE hWin)
{
    HI_DRV_VIDEO_FRAME_S *pstFrmTmp = NULL;
    WINDOW_S *pstWin = HI_NULL;
    HI_S32 Ret = HI_FAILURE;

    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    pstFrmTmp = WinBuf_GetCapturedFrame(&pstWin->stBuffer.stWinBP);
    if (NULL != pstFrmTmp)
    {
        Ret = WinBuf_ReleaseCaptureFrame(&pstWin->stBuffer.stWinBP, pstFrmTmp, pstWin->u32WinCapMMZvalid);
        if (HI_SUCCESS != Ret)
        {
            return Ret;
        }
    }

    Ret = WinFreeCaptureMMZ(pstWin);

    return Ret;
}

HI_S32 WinCapturePause(HI_HANDLE hWin, HI_BOOL bCaptureStart)
{
    WINDOW_S *pstWin = HI_NULL, *pstWinAttach = HI_NULL;
    HI_S32 Ret = 0;
    HI_HANDLE  attach_handle = 0;

    WinCheckWindow(hWin, pstWin);

    if (bCaptureStart && ((pstWin->enState == WIN_STATE_PAUSE)
                          || (pstWin->enState == WIN_STATE_FREEZE)))
    {
        pstWin->bRestoreFlag = 0;
        return HI_SUCCESS;
    }

    if (pstWin->enType == HI_DRV_WIN_ACTIVE_MAIN_AND_SLAVE)
    {
        /*attach mode , need  pasue salve window too*/
        attach_handle = pstWin->hSlvWin;
        pstWinAttach = WinGetWindow(attach_handle);

        if (!pstWinAttach)
        {
            attach_handle = 0;
        }
    }
    else if (pstWin->enType == HI_DRV_WIN_ACTIVE_SINGLE)
    {
        /*not attach mode only need  pasue self window*/
        attach_handle = 0;
    }
    else if (pstWin->enType == HI_DRV_WIN_ACTIVE_SLAVE)
    {
        /*attach mode only    mce capture slave window*/
        attach_handle = 0;
    }

    if (bCaptureStart)
    {
        Ret = WIN_Pause(hWin, bCaptureStart);
        if (Ret != HI_SUCCESS)
        {
            return Ret;
        }

        if (attach_handle)
        {
            Ret = WIN_Pause(attach_handle, bCaptureStart);
            if (Ret != HI_SUCCESS)
            {
                (HI_VOID)WIN_Pause(hWin, !bCaptureStart);
                return Ret;
            }
        }

        pstWin->bRestoreFlag = 1;
    }
    else
    {
        if (pstWin->bRestoreFlag)
        {

            Ret = WIN_Pause(hWin, 0);
            if (attach_handle)
            {
                (HI_VOID)WIN_Pause(attach_handle, 0);
            }

            pstWin->bRestoreFlag = 0;

            if (Ret != HI_SUCCESS)
            {
                return Ret;
            }
        }
    }

    return HI_SUCCESS;
}

HI_S32 WIN_GetUnload(HI_HANDLE hWin, HI_U32 *pu32Times)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckNullPointer(pu32Times);

    WinCheckWindow(hWin, pstWin);
    *pu32Times = pstWin->stBuffer.u32UnderLoad;

    return HI_SUCCESS;
}

HI_S32 WIN_SetWindowAlpha(HI_HANDLE hWin, HI_U32 u32Alpha)
{
    HI_U32 u32Num = 0;
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();


    WinCheckWindow(hWin, pstWin);
    pstWin->stCfg.u32Alpha = u32Alpha;

    DispBuf_GetListNodeNumber(&pstWin->stBuffer.stWinBP.stBuffer.stFullArray, &u32Num);
    WIN_WARN("----full u32number:%d!\n", u32Num);
    DispBuf_GetListNodeNumber(&pstWin->stBuffer.stWinBP.stBuffer.stUsingArray, &u32Num);
    WIN_WARN("----using u32number:%d!\n", u32Num);
    DispBuf_GetListNodeNumber(&pstWin->stBuffer.stWinBP.stBuffer.stEmptyArray, &u32Num);
    WIN_WARN("----empty u32number:%d!\n", u32Num);

    return HI_SUCCESS;
}


HI_S32 WIN_GetWindowAlpha(HI_HANDLE hWin, HI_U32 *pu32Alpha)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();

    WinCheckWindow(hWin, pstWin);
    *pu32Alpha = pstWin->stCfg.u32Alpha;

    return HI_SUCCESS;
}

HI_S32 WIN_SetWindowProgInterleave(HI_HANDLE hWin, HI_DRV_WIN_FORCEFRAMEPROG_FLAG_E eForceFrameProgFlag)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    pstWin->stPlayCtrl.eWinFrameForceFlag = eForceFrameProgFlag;
    pstWin->stWinDebugInfo.stWinPlayCtrl.eWinFrameForceFlag = eForceFrameProgFlag;

    return HI_SUCCESS;
}


HI_S32 WIN_GetWindowProgInterleave(HI_HANDLE hWin, HI_DRV_WIN_FORCEFRAMEPROG_FLAG_E *peForceFrameProgFlag)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);
    *peForceFrameProgFlag = pstWin->stPlayCtrl.eWinFrameForceFlag;

    return HI_SUCCESS;
}

HI_S32 WIN_SetWindowCloseSoftAlg(HI_HANDLE hWin, HI_WIN_CLOSE_SOFTALG_FLAG_E   eSoftAlgCtrl)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);

    pstWin->stPlayCtrl.eSoftAlgCtrl = eSoftAlgCtrl;
    pstWin->stWinDebugInfo.stWinPlayCtrl.eSoftAlgCtrl = eSoftAlgCtrl;

    return HI_SUCCESS;
}

HI_S32 WIN_GetWindowCloseSoftAlg(HI_HANDLE hWin, HI_WIN_CLOSE_SOFTALG_FLAG_E *peSoftAlgCtrl)
{
    WINDOW_S *pstWin;
    WinCheckWindow(hWin, pstWin);
    WinCheckDeviceOpen();

    *peSoftAlgCtrl = pstWin->stPlayCtrl.eSoftAlgCtrl;
    return HI_SUCCESS;
}

HI_S32 WIN_SetWindowConfigCheck(HI_HANDLE hWin, HI_WIN_HW_CONFIG_CHECK_FLAG_E   eConfigCheck)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);
    pstWin->stPlayCtrl.eWinConfigCheck = eConfigCheck;
    pstWin->stWinDebugInfo.stWinPlayCtrl.eWinConfigCheck = eConfigCheck;
    return HI_SUCCESS;
}

HI_S32 WIN_GetWindowConfigCheck(HI_HANDLE hWin, HI_WIN_HW_CONFIG_CHECK_FLAG_E *peConfigCheck)
{
    WINDOW_S *pstWin;
    WinCheckWindow(hWin, pstWin);
    WinCheckDeviceOpen();

    *peConfigCheck = pstWin->stPlayCtrl.eWinConfigCheck;
    return HI_SUCCESS;
}

HI_S32 WIN_SetWindowStepMode(HI_HANDLE hWin, HI_WIN_QUEUE_CTRL_FLAG_E   eStepMode)
{
    WINDOW_S *pstWin = HI_NULL;
    VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();
    WinCheckWindow(hWin, pstWin);
    WinCheckDeviceOpen();

    if ((HI_NULL != pF) && (HI_NULL != pF->PF_HW_BUF_SetStepMode))
    {
        if (WIN_QUEUE_CTRL_STEP_BY_STEP == eStepMode)
        {
            pF->PF_HW_BUF_SetStepMode(pstWin->u32VideoLayer, HI_TRUE);
        }
        else
        {
            pF->PF_HW_BUF_SetStepMode(pstWin->u32VideoLayer, HI_FALSE);
        }
    }

    return HI_SUCCESS;
}


HI_S32 WIN_SetWindowTotalPlayCtrl(HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S *pstWinPlayCtrl)
{
    HI_U32 i = 0;
    WINDOW_S *pstWin = HI_NULL;
    HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S stWinPlayCtrl;

    switch(pstWinPlayCtrl->ePlayctrlType)
    {
        case HI_DRV_WIN_PROGRESSIVE_INTERLEAVE_REVISE_CTRL:

            for (i = 0; i < WINDOW_MAX_NUMBER; i++)
            {
                pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
                if (pstWin)
                {
                   WIN_SetWindowProgInterleave(pstWin->u32Index, pstWinPlayCtrl->stPlayCtrlInfor.eProgRevise);
                }
            }

            DFX_WinGetTopPlayCtrl(&stWinPlayCtrl);
            stWinPlayCtrl.stPlayCtrlInfor.eProgRevise = pstWinPlayCtrl->stPlayCtrlInfor.eProgRevise;
            DFX_WinSetTopPlayCtrl(&stWinPlayCtrl);

            break;
        case HI_DRV_WIN_SOFTALG_CTRL:
            for (i = 0; i < WINDOW_MAX_NUMBER; i++)
            {
                pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
                if (pstWin)
                {
                    WIN_SetWindowCloseSoftAlg(pstWin->u32Index, pstWinPlayCtrl->stPlayCtrlInfor.eSoftAlgCtrl);
                }
            }

            DFX_WinGetTopPlayCtrl(&stWinPlayCtrl);
            stWinPlayCtrl.stPlayCtrlInfor.eSoftAlgCtrl = pstWinPlayCtrl->stPlayCtrlInfor.eSoftAlgCtrl;
            DFX_WinSetTopPlayCtrl(&stWinPlayCtrl);
            break;
         case HI_DRV_WIN_HW_CONFIG_CHECK:
            for (i = 0; i < WINDOW_MAX_NUMBER; i++)
            {
                pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
                if (pstWin)
                {
                    WIN_SetWindowConfigCheck(pstWin->u32Index, pstWinPlayCtrl->stPlayCtrlInfor.eWinConfigCheck);
                }
            }

            DFX_WinGetTopPlayCtrl(&stWinPlayCtrl);
            stWinPlayCtrl.stPlayCtrlInfor.eWinConfigCheck = pstWinPlayCtrl->stPlayCtrlInfor.eWinConfigCheck;
            DFX_WinSetTopPlayCtrl(&stWinPlayCtrl);
            break;
          case HI_DRV_WIN_QUEUE_CTRL:
            for (i = 0; i < WINDOW_MAX_NUMBER; i++)
            {
                pstWin = stDispWindow.pstWinArray[HI_DRV_DISPLAY_1][i];
                if (pstWin)
                {
                    WIN_SetWindowStepMode(pstWin->u32Index, pstWinPlayCtrl->stPlayCtrlInfor.eQueueCtrl);
                }
            }

            DFX_WinGetTopPlayCtrl(&stWinPlayCtrl);
            stWinPlayCtrl.stPlayCtrlInfor.eQueueCtrl = pstWinPlayCtrl->stPlayCtrlInfor.eQueueCtrl;
            DFX_WinSetTopPlayCtrl(&stWinPlayCtrl);
            break;
        default:
            break;
    }
    return HI_SUCCESS;
}

HI_S32 WinDebugCmdProcess(WIN_DEBUG_CMD_AND_ARGS_S *pstDebugCmd)
{
    HI_S32 s32Ret = HI_SUCCESS;

    WinCheckNullPointer(pstDebugCmd);
    return s32Ret;
}

HI_S32 WinSetFirstFrmOutStatus(HI_HANDLE hWin, WIN_FIRST_FRAME_STATUS_S *pstFirstFrmStatus)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFirstFrmStatus);
    WinCheckWindow(hWin, pstWin);
    pstWin->stCfg.stFirstFrmStatus.bSenceChange = pstFirstFrmStatus->bSenceChange;
    pstWin->stCfg.stFirstFrmStatus.enDispOutType = pstFirstFrmStatus->enDispOutType;
    pstWin->stCfg.stFirstFrmStatus.enOutColorSpace = pstFirstFrmStatus->enOutColorSpace;


    return HI_SUCCESS;
}

HI_S32 WinGetFirstFrmOutStatus(HI_HANDLE hWin, WIN_FIRST_FRAME_STATUS_S *pstFirstFrmStatus)
{

    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckNullPointer(pstFirstFrmStatus);
    WinCheckWindow(hWin, pstWin);
    pstFirstFrmStatus->bSenceChange = pstWin->stCfg.stFirstFrmStatus.bSenceChange;
    pstFirstFrmStatus->enDispOutType = pstWin->stCfg.stFirstFrmStatus.enDispOutType;
    pstFirstFrmStatus->enOutColorSpace = pstWin->stCfg.stFirstFrmStatus.enOutColorSpace;


    /* not support virtual window currently. */
    return HI_SUCCESS;

}

HI_S32 WinResetFirstFrameStatus(HI_HANDLE hWin)
{
    WINDOW_S *pstWin;
    WinCheckDeviceOpen();
    WinCheckWindow(hWin, pstWin);
    pstWin->stCfg.stFirstFrmStatus.bSenceChange = HI_FALSE;
    pstWin->stCfg.stFirstFrmStatus.enDispOutType = HI_DRV_DISP_TYPE_NORMAL;
    pstWin->stCfg.stFirstFrmStatus.enOutColorSpace = HI_DRV_CS_UNKNOWN;

    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
