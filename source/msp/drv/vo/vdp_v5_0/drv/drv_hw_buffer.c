#include "hi_type.h"
#include "hi_common.h"
#include "drv_win_hal.h"
#include "drv_win_buffer.h"
#include "drv_win_priv.h"
#include "drv_disp_bufcore.h"
#include "hal_layerprocess.h"
#include "drv_mask.h"
#include "drv_win_policy.h"

#define WIN_INVALID_INDEX  0xffffffff
extern S_VDP_REGS_TYPE * pVdpReg;
extern spinlock_t g_threadIsr_Lock;
extern volatile HI_S32 s_s32WindowGlobalFlag;

extern    HI_VOID LAYERPROCESS_SetLayerEnable(HI_U32 eLayer, HI_BOOL bEnable);
extern HI_VOID HW_BUF_SetHoldMode(HI_U32 u32LayerId, HI_BOOL bhold_en);
extern HI_VOID VDP_OFF_SetSyncMode(S_VDP_REGS_TYPE * pstReg, HI_U32 sync_mode);
extern HI_BOOL VDP_IsInDispResoChging(HI_VOID);
extern HI_VOID VDP_OFF_SetStartMode(S_VDP_REGS_TYPE * pstReg, HI_U32 start);
extern HI_U32 VDP_OFF_GetOnlineId(S_VDP_REGS_TYPE * pstReg);
extern HI_U32 VDP_OFF_GetOfflineId(S_VDP_REGS_TYPE * pstReg);
extern HI_VOID VDP_DRV_CheckOnlPart(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_DRV_CheckAllPath(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_S32 Win_FrameOneRelease(WINDOW_S *pstWin,HI_DRV_VIDEO_FRAME_S *pstFrame);

extern HI_S32 WinUpdateWinAttr(WINDOW_S *pstWin,const HI_DISP_DISPLAY_INFO_S *pstDispInfo);
extern HI_VOID WinDisableSingleLayerRegion(WINDOW_S *pstWin, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
extern HI_VOID ISR_WinUpdatePlayInfo(WINDOW_S *pstWin, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo);
extern HI_S32 WinGetLatestFrameInfor(HI_HANDLE hWin, HI_DRV_VIDEO_FRAME_S *pstFrame);

HI_DRV_VIDEO_FRAME_S *Win_HW_BufGetConfigFrame(WB_POOL_S *pstWinBP, HI_BOOL bDeleteTheNode)
{
    DISP_BUF_NODE_S *pstNode = HI_NULL;
    HI_DRV_VIDEO_FRAME_S *pstFrm = HI_NULL;
    HI_S32 nRet = HI_FAILURE;

    WIN_CHECK_NULL_RETURN_NULL(pstWinBP);

    nRet = DispBuf_GetFullNode(&pstWinBP->stBuffer, &pstNode);
    if (nRet != HI_SUCCESS)
    {
        return HI_NULL;
    }

    pstWinBP->pstConfig = pstNode;
    DISP_ASSERT(HI_NULL != pstWinBP->pstConfig);

    pstFrm = (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;

    if (HI_TRUE == bDeleteTheNode)
    {
        nRet = DispBuf_DelFullNode(&pstWinBP->stBuffer, pstNode);
        DISP_ASSERT(nRet == HI_SUCCESS);

        DispBuf_AddUsingNode(&pstWinBP->stBuffer, pstNode);
        WinBuf_DebugAddCfg(pstWinBP->pstDebugInfo, pstFrm->u32FrameIndex);
    }

    return  pstFrm;
}


HI_VOID  Win_HW_BufGetFrameInfor(WB_POOL_S *pstWinBP,
                                             HI_U32 u32FrameAddr,
                                             HI_DRV_VIDEO_FRAME_S **pstFrame)
{
    DISP_BUF_NODE_S *pstNode = HI_NULL;

    /*input invalid  frame index, we only want to get the frame by the address ,not by the index.*/
    pstNode = DispBuf_FindNodeInList(&pstWinBP->stBuffer.stUsingArray, u32FrameAddr, WIN_INVALID_INDEX);
    if (HI_NULL != pstNode)
    {
        *pstFrame =  (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;
    }
    else
    {
        *pstFrame = HI_NULL;
    }

    return;
}


HI_VOID  Win_HW_ReturnFrame2EmptyList(WB_POOL_S *pstWinBP,
                                                 HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    DISP_BUF_NODE_S *pstNode = HI_NULL;
    pstNode = DispBuf_FindNodeInList(&pstWinBP->stBuffer.stUsingArray, pstFrame->stBufAddr[0].u32PhyAddr_Y,WIN_INVALID_INDEX);
    if (HI_NULL != pstNode)
    {
        DispBuf_DelUsingNode(&pstWinBP->stBuffer, pstNode);
        DispBuf_AddEmptyNode(&pstWinBP->stBuffer, pstNode);
    }

    return;
}

HI_DRV_VIDEO_FRAME_S *WinBuf_GetDisplayingFrame(WB_POOL_S *pstWinBP)
{
    HI_U32 u32FrameAddr = 0;
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;
    HW_BUFNODE_Infor_S stCurrentFrameInfor;
    VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();

    WIN_CHECK_NULL_RETURN_NULL(pstWinBP);
    WIN_CHECK_NULL_RETURN_NULL(pF);

    if (pF->PF_HW_BUF_GetCurrentPlayFrameInfor)
    {
        pF->PF_HW_BUF_GetCurrentPlayFrameInfor(0, &stCurrentFrameInfor);
        Win_HW_BufGetFrameInfor(pstWinBP, u32FrameAddr, &pstFrame);
    }

    return pstFrame;
}

HI_VOID RelealseMemNodeAndGetFrameAddr(WINDOW_S *pstWin,
                                                   HI_U32 u32NodeAddr,
                                                   HI_U32 *pu32FrameYAddr)
{
    HI_U32 i = 0;

    for (i = 0; i < WIN_ALG_MMZ_NUM; i++)
    {
        if (pstWin->stHardwareConfig.stNodeMMZ[i].stVideoAlgMmz.u32StartPhyAddr == u32NodeAddr)
        {
            pstWin->stHardwareConfig.stNodeMMZ[i].bReady = HI_TRUE;
            pstWin->stHardwareConfig.stVPSSMMZ[i].bReady = HI_TRUE;
            *pu32FrameYAddr = pstWin->stHardwareConfig.stNodeMMZ[i].u32FrameYAddr;
            pstWin->stHardwareConfig.stNodeMMZ[i].u32FrameYAddr = 0;
            pstWin->stHardwareConfig.stNodeMMZ[i].u32FrameIndex = 0;

            WIN_INFO("--release NodeAddr:%x, frameaddr:%x!\n", u32NodeAddr, *pu32FrameYAddr);
            break;
        }
    }

    if (i >= WIN_ALG_MMZ_NUM)
    {
        WIN_ERROR("Err addr:%x\n", u32NodeAddr);
    }

    return;
}


HI_DRV_VIDEO_FRAME_S *WinBuf_GetDisplayedFrame(WINDOW_S *pstWin, WB_POOL_S *pstWinBP)
{
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;
    HI_S32 ret = HI_FAILURE;
    VDP_DRV_RELEASE_FRAME_NODE_S stReleaseNode = {0};
    HI_U32 u32FrameAddr = 0;
    VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();
    WIN_CHECK_NULL_RETURN_NULL(pstWinBP);

    if ((HI_NULL != pF)
        && (HI_NULL != pF->PF_DeuqueBufNode))
    {
        ret = pF->PF_DeuqueBufNode(0, &stReleaseNode);
        if (HI_SUCCESS == ret)
        {
            RelealseMemNodeAndGetFrameAddr(pstWin, stReleaseNode.u32NodeAddr, &u32FrameAddr);
            Win_HW_BufGetFrameInfor(pstWinBP, u32FrameAddr, &pstFrame);
        }
    }

    return pstFrame;
}

HI_VOID WinBuf_DeleteDisplayedFrame(WB_POOL_S *pstWinBP,
                                                          HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (pstFrame != HI_NULL)
    {
        Win_HW_ReturnFrame2EmptyList(pstWinBP, pstFrame);
    }

    return ;
}

HI_DRV_VIDEO_FRAME_S * WinGetFrameToConfig(WINDOW_S *pstWin)
{
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;

    pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP,HI_TRUE);
    if (!pstFrame)
    {
        HI_ERR_WIN("Fatal Err, should not happen in 3716mv430!\n");
    }

    return pstFrame;
}

HI_VOID  Win_HW_LookupUndisplaydFrame(WINDOW_S *pstWin,
                                                  HI_U32 u32FrameAddr,
                                                  HI_U32 *pu32BufNodeCounts,
                                                  HI_DRV_VIDEO_FRAME_S **parrayFrameList)
{
    DispBuf_GatherHwNode(&pstWin->stBuffer.stWinBP.stBuffer.stUsingArray,
                         u32FrameAddr,
                         pu32BufNodeCounts,
                         parrayFrameList);
    return;
}

HI_VOID ISR_NormalProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    VDP_BKG_S  stLboxColor = {0};

    stLboxColor.u32BkgA = 0xff;
    if (pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT601_RGB_LIMITED
        || pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT601_RGB_FULL
        || pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT709_RGB_LIMITED
        || pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT709_RGB_FULL
        || pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT2020_RGB_LIMITED
        || pstInfo->stDispInfo.eColorSpace == HI_DRV_CS_BT2020_RGB_FULL
       )
    {
        stLboxColor.u32BkgY = 0x0;
        stLboxColor.u32BkgU = 0x0;
        stLboxColor.u32BkgV = 0x0;
    }
    else
    {
        stLboxColor.u32BkgY = 0x0;//0x40
        stLboxColor.u32BkgU = 0x200;
        stLboxColor.u32BkgV = 0x200;
    }

    VDP_VID_SetLayerBkg    (VDP_LAYER_VID0, stLboxColor);

    return;
}

HI_VOID Win_ReleaseFreezeFrame(WINDOW_S *pstWin)
{
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;

    if ((HI_DRV_WIN_SWITCH_BUTT != pstWin->stFrz.enFreezeMode)
        && (HI_TRUE == pstWin->stFrz.bEnable))
    {
        pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP,HI_FALSE);
        if (HI_NULL != pstFrame)
        {
            if (pstFrame->stPlayInfor.u32PlayCnt > 0)
            {
                pstFrame->stPlayInfor.u32PlayCnt --;
            }

            if (pstFrame->stPlayInfor.u32PlayCnt == 0)
            {
                Win_FrameOneRelease(pstWin, pstFrame);
                pstFrame = Win_HW_BufGetConfigFrame(&pstWin->stBuffer.stWinBP,HI_TRUE);
                WinBuf_DeleteDisplayedFrame(&pstWin->stBuffer.stWinBP, pstFrame);
            }
        }
    }

    return;
}

HI_VOID ISR_WIN_MaskProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WINDOW_S *pstWin;
    HI_BOOL bUpDispInfo = HI_FALSE;
    HI_BOOL bUpWinAttr = HI_FALSE;
    VDP_CHANGEINFO_S stChgInfo;
    HI_BOOL       bWinchange = HI_FALSE;

    //spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    pstWin = (WINDOW_S *)hDst;

    if (pstInfo->eEventType != HI_DRV_DISP_C_VT_INT)
    {
        DISP_PRINT("DISP HI_DRV_DISP_C_event= %d, disp=%d\n", pstInfo->eEventType, pstWin->enDisp);
    }

    ISR_NormalProcess(hDst, pstInfo);
    /*release the freeze frame to fronter module.*/
    Win_ReleaseFreezeFrame(pstWin);

    if ((WIN_DEVICE_STATE_SUSPEND == s_s32WindowGlobalFlag)
        || (pstInfo->eEventType == HI_DRV_DISP_C_PREPARE_CLOSE)
        || (pstInfo->eEventType == HI_DRV_DISP_C_PREPARE_TO_PEND)
       )
    {
        HW_BUF_SetHoldMode(0, HI_TRUE);
        VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, HI_TRUE);
        VDP_OFF_SetStartMode((S_VDP_REGS_TYPE *) pVdpReg, HI_FALSE);

        pstWin->bMasked = HI_TRUE;
    }
    else
    {
        pstWin->bMasked = HI_FALSE;
    }

    if ( (pstInfo->eEventType == HI_DRV_DISP_C_DISPLAY_SETTING_CHANGE)
         || (pstInfo->eEventType == HI_DRV_DISP_C_OPEN)
         || (pstInfo->eEventType == HI_DRV_DISP_C_RESUME))
    {
        HW_BUF_SetHoldMode(0, HI_FALSE);

        if ((HI_TRUE == pstWin->bEnable_Using)
            && (pstWin->stPlayInfor.bUndergoSuspend == HI_FALSE))
        {
            LAYERPROCESS_SetLayerEnable(VDP_LAYER_VID0, HI_TRUE);
        }

        pstWin->stPlayInfor.bUndergoSuspend = HI_FALSE;
        bUpDispInfo = HI_TRUE;
    }

    if (atomic_read(&pstWin->stCfg.bNewAttrFlag))
    {
        atomic_set(&pstWin->stCfg.bNewAttrFlag, 0);
        bUpWinAttr = HI_TRUE;
    }

    if (bUpDispInfo || bUpWinAttr)
    {
        #if 0
        HI_U32 time = 0;
        HI_DRV_SYS_GetTimeStampMs(&time);
        printk("befor:%d,%d,t:%d!\n", pstWin->stUsingAttr.stOutRect.s32Width,
                                           pstWin->stUsingAttr.stOutRect.s32Height, time);
        #endif

        (HI_VOID)WinUpdateWinAttr(pstWin, &pstInfo->stDispInfo);

        #if 0
        HI_DRV_SYS_GetTimeStampMs(&time);
        printk("after:%d,%d,t:%d!\n", pstWin->stUsingAttr.stOutRect.s32Width,
                                           pstWin->stUsingAttr.stOutRect.s32Height, time);
        #endif

        DISP_OSAL_SendEvent(&pstWin->stWinQueueEvent, EVENT_WIN_ATTR_UP_COMPLET);
        bWinchange = HI_TRUE;
    }

    if (HI_FALSE == pstWin->bEnable_Using || pstWin->bMasked)
    {
        LAYERPROCESS_SetLayerEnable(VDP_LAYER_VID0, HI_FALSE);
        //spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
        return;
    }

    pstWin->bInInterrupt = HI_TRUE;

    /*attention: unsigned symbol to signed symbol*/
    stChgInfo.bDispResoChange = bWinchange;
    stChgInfo.u32VideoX     = pstWin->stUsingAttr.stOutRect.s32X;
    stChgInfo.u32VideoY     = pstWin->stUsingAttr.stOutRect.s32Y;
    stChgInfo.u32VideoWth     = pstWin->stUsingAttr.stOutRect.s32Width;
    stChgInfo.u32VideoHgt     = pstWin->stUsingAttr.stOutRect.s32Height;

    stChgInfo.u32DispX      = pstWin->stUsingAttr.stOutRect.s32X;
    stChgInfo.u32DispY      = pstWin->stUsingAttr.stOutRect.s32Y;
    stChgInfo.u32DispWth      = pstWin->stUsingAttr.stOutRect.s32Width;
    stChgInfo.u32DispHgt      = pstWin->stUsingAttr.stOutRect.s32Height;

    VDP_DispResoChangeCfgFlow(pstWin, (HI_DISP_DISPLAY_INFO_S *)&pstInfo->stDispInfo, &stChgInfo);
    ISR_WinUpdatePlayInfo(pstWin, pstInfo);

    pstWin->bInInterrupt = HI_FALSE;
    //spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);

    if (pstWin->stPlayCtrl.eWinConfigCheck == WIN_HW_CONFIG_CHECK_OPEN)
    {
#ifdef VDP_REG_ASSERT_CHECK_SUPPORT
        VDP_DRV_CheckOnlPart((S_VDP_REGS_TYPE *)pVdpReg);
        VDP_DRV_CheckAllPath((S_VDP_REGS_TYPE *)pVdpReg);
        //VDP_EchoAbNormalStatus();
#endif
    }

    return;
}

HI_S32 Win_RegenerateLastFrame(HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    VIDEO_LAYER_FUNCTIONG_S *pF = VideoLayer_GetFunctionPtr();
    XDP_LAYER_VID_INFO_S *pstVideoLayerHalInfor = HI_NULL;
    HI_DRV_VIDEO_PRIVATE_S *pstFramePrivate = HI_NULL;

    pstFramePrivate = (HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0];

    if (HI_NULL == pF)
    {
        WIN_ERROR("Null opt ptr!\n");
        return HI_FAILURE;
    }

    if (HI_NULL == pF->PF_HW_BUF_GetLastHardwareConfig)
    {
        WIN_ERROR("Null opt ptr!\n");
        return HI_FAILURE;
    }

    pstVideoLayerHalInfor = pF->PF_HW_BUF_GetLastHardwareConfig();
    if (HI_NULL == pstVideoLayerHalInfor)
    {
        WIN_ERROR("Null opt ptr!\n");
        return HI_FAILURE;
    }

    pstFrame->u32Width = pstVideoLayerHalInfor->stXdpHZmeCfg.u32HzmeOutWth;
    pstFrame->u32Height = pstVideoLayerHalInfor->stXdpHZmeCfg.u32HzmeOutHgt;
    pstFramePrivate->u32LastFlag = DEF_HI_DRV_VPSS_LAST_ERROR_FLAG;

    return HI_SUCCESS;
}

DISP_NodeListINFOR_S *Win_GetFramePlayInfor(HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    DISP_BUF_NODE_S *pstDispBufNode = HI_NULL;
    pstDispBufNode = VDP_FRAME_2_NODE(pstFrame);
    return &(pstDispBufNode->stPlayInfor);
}
