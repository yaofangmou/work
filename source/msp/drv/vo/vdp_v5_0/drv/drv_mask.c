#include "drv_mask.h"
#include "vdp_hal_ip_fdr.h"
#include "vdp_hal_vid.h"
#include "vdp_hal_offline.h"
#include "vdp_hal_ip_hzme.h"
#include "hi_type.h"
#include "hi_common.h"
#include "drv_win_hal.h"
#include "drv_win_buffer.h"
#include "drv_win_priv.h"
#include "drv_disp_bufcore.h"
#include "drv_disp_debug.h"
#include "hal_layerprocess.h"
#include "drv_mask.h"

extern DISP_NodeListINFOR_S *Win_GetFramePlayInfor(HI_DRV_VIDEO_FRAME_S *pstFrame);
extern S_VDP_REGS_TYPE* pVdpReg;
static HI_BOOL g_bResoChanging=HI_FALSE;

HI_VOID VDP_InitDispResoChangeFlow(HI_VOID)
{
    g_bResoChanging = HI_FALSE;
}

HI_BOOL VDP_IsInDispResoChging(HI_VOID)
{
    return g_bResoChanging;
}

static HI_VOID VDP_SetDispResoInChging(HI_BOOL bFlag)
{
    g_bResoChanging = bFlag;
}

static HI_U32 VDP_JudgeLogicOnlineorOffline(HI_VOID)
{
     U_CUR_LINE_MODE_STA CUR_LINE_MODE_STA;

     CUR_LINE_MODE_STA.u32 = pVdpReg->CUR_LINE_MODE_STA.u32;

     return (CUR_LINE_MODE_STA.bits.cur_line_mode)&0x1;
}


static HI_U32 VDP_GetCurUsingQBufAddr(HI_VOID)
{
    return pVdpReg->VID_DTV_DISP_ADDR.u32;
}


static HI_DRV_VIDEO_FRAME_S *parrayFrameList[WIN_IN_FB_DEFAULT_NUMBER] = {0};
extern HI_VOID  Win_HW_LookupUndisplaydFrame(WINDOW_S *pstWin,HI_U32 u32FrameAddr,
                                                  HI_U32 *pu32BufNodeCounts,
                                                  HI_DRV_VIDEO_FRAME_S **parrayFrameList);
extern HI_S32 ISR_WinConfigFrameNormal(WINDOW_S *pstWin,
                                        HI_DRV_VIDEO_FRAME_S *pstFrame,
                                        HI_DISP_DISPLAY_INFO_S *pstInfo);

extern HI_VOID DISP_XDR_IsrProcess_ext(HI_DRV_DISPLAY_E eDisp);
extern spinlock_t g_Mask_Lock;
static HI_S32 VDP_ChgDdrQBufCfg(WINDOW_S *pstWin,
                                        HI_DISP_DISPLAY_INFO_S *pstInfo,
                                        VDP_CHANGEINFO_S *pstChgInfo)
{
    HI_U32 u32CurUsingQBufAddr=0;
    HI_U32 u32QBufNum=0;
    HI_U32 i=0;
    HI_DRV_VIDEO_FRAME_S **pstFrameArrayPtr = parrayFrameList;
    HI_SIZE_T irqflag = 0;
    DISP_NodeListINFOR_S *pstPlayInfor = HI_NULL;

    u32CurUsingQBufAddr = VDP_GetCurUsingQBufAddr();

    Win_HW_LookupUndisplaydFrame(pstWin, u32CurUsingQBufAddr, &u32QBufNum, pstFrameArrayPtr);

    spin_lock_irqsave(&g_Mask_Lock, irqflag);
    for(i=0; i < u32QBufNum; i++)
    {
        pstPlayInfor = Win_GetFramePlayInfor(pstFrameArrayPtr[i]);

        pstPlayInfor->bMask = HI_TRUE;
        ISR_WinConfigFrameNormal(pstWin, pstFrameArrayPtr[i], pstInfo);//generate config;
        DISP_XDR_IsrProcess_ext(pstWin->enDisp);//call setvideolayer;
        pstPlayInfor->bMask = HI_FALSE;
    }

    spin_unlock_irqrestore(&g_Mask_Lock, irqflag);

    return HI_SUCCESS;
}

static HI_BOOL VDP_IsNotInFzone(HI_VOID)
{
   return (((pVdpReg->OFFLINE_SYNC_STATE.bits.sync_fzone_state)&0x1)==0);
}

static HI_S32 VDP_OfflineChgResoingFlow(WINDOW_S *pstWin,
                                        HI_DISP_DISPLAY_INFO_S *pstInfo,
                                        VDP_CHANGEINFO_S *pstChgInfo)
{
    HI_U32 u32OfflineSyncState;
    HI_BOOL bWaitSyncStart;
    HI_BOOL bNxtProcessing;

    u32OfflineSyncState=pVdpReg->OFFLINE_SYNC_STATE.u32;
    bWaitSyncStart     = (u32OfflineSyncState>> 0)&0x1;
    bNxtProcessing     = (u32OfflineSyncState>> 7)&0x1;

    if(HI_TRUE==bNxtProcessing)
    {
        WIN_WARN_NEW(MASK_INFOR,"offline is working\n");
        return HI_SUCCESS;
    }

    if(HI_TRUE == bWaitSyncStart)
    {
        HI_U32 t1 = 0,t2 = 0;

        WIN_WARN_NEW(MASK_INFOR,"sync mode is start\n");

        DISP_OS_GetTime(&t1);
        VDP_ChgDdrQBufCfg(pstWin, pstInfo, pstChgInfo);
        DISP_OS_GetTime(&t2);

        if ((t2 - t1) > 6)
        {
            WIN_WARN_NEW(MASK_INFOR,"mask change node time exceeds!\n");
        }

        if(HI_TRUE==VDP_IsNotInFzone())
        {
            WIN_WARN_NEW(MASK_INFOR,"mask finished and not close to frozen area.\n");
            VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, 0);
            VDP_SetDispResoInChging(HI_FALSE);
        }
        else
        {
            WIN_WARN_NEW(MASK_INFOR,"In fzone:%d!\n");
        }
    }
    else
    {
        WIN_WARN_NEW(MASK_INFOR,"mask finished and not bWaitSyncStart.\n");

        pstWin->stVLayerFunc.PF_HW_ChangeApbConfig(HI_FALSE, pstChgInfo);

        VDP_ChgDdrQBufCfg(pstWin, pstInfo,pstChgInfo);
        VDP_VID_SetRegUp(VDP_LAYER_VID0);

        /*clear sync mode*/
        VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, 0);
        VDP_SetDispResoInChging(HI_FALSE);
    }

    return HI_SUCCESS;
}



static HI_S32 VDP_OnlineChgResoingFlow(WINDOW_S *pstWin,
                                                HI_DISP_DISPLAY_INFO_S *pstInfo,
                                                VDP_CHANGEINFO_S *pstChgInfo)
{
    pstWin->stVLayerFunc.PF_HW_ChangeApbConfig(HI_TRUE, pstChgInfo);

    VDP_ChgDdrQBufCfg(pstWin, pstInfo,pstChgInfo);
    VDP_FDR_VID_SetWTunlEn(0, HI_TRUE);
    VDP_VID_SetRegUp(VDP_LAYER_VID0);

    //de sync
    VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, 0);
    VDP_SetDispResoInChging(HI_FALSE);

    return HI_SUCCESS;
}


HI_S32 VDP_DispResoChangeCfgFlow(WINDOW_S *pstWin,
                                            HI_DISP_DISPLAY_INFO_S *pstInfo,
                                            VDP_CHANGEINFO_S *pstChgInfo)
{
    if((HI_TRUE==pstChgInfo->bDispResoChange) && (HI_FALSE==VDP_IsInDispResoChging()))
    {
        WIN_WARN_NEW(MASK_INFOR,"first enter mask \n");
        //step1 : close wtunle
        VDP_FDR_VID_SetWTunlEn(0, HI_FALSE);

        //step2 :
        VDP_SetDispResoInChging(HI_TRUE);

        if(VDP_JudgeLogicOnlineorOffline()) // 1 : offline; 0: online
        {
            //sync_en
            VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, 1);
            VDP_OfflineChgResoingFlow(pstWin, pstInfo, pstChgInfo);

            WIN_WARN_NEW(MASK_INFOR,"mask first into offline mode\n");
        }
        else
        {
            WIN_WARN_NEW(MASK_INFOR,"mask first into online mode\n");
            //online do nothing.
        }
    }
    else if(HI_TRUE==VDP_IsInDispResoChging())
    {
        WIN_WARN_NEW(MASK_INFOR,"secondly enter mask\n");
        if(VDP_JudgeLogicOnlineorOffline()) // 1 : offline; 0: online
        {
            WIN_WARN_NEW(MASK_INFOR,"secondly enter offline mask\n");
            VDP_OfflineChgResoingFlow(pstWin, pstInfo, pstChgInfo);
        }
        else
        {
            //sync_en
            VDP_OFF_SetSyncMode((S_VDP_REGS_TYPE *)pVdpReg, 1);
            VDP_OnlineChgResoingFlow(pstWin, pstInfo, pstChgInfo);
            WIN_WARN_NEW(MASK_INFOR,"secondly enter online mask\n");
        }
    }

    return HI_SUCCESS;
}

