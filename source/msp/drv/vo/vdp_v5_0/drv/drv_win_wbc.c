/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name      : drv_win_wbc.c
Version          : Initial Draft
Author          : Hisilicon multimedia software group
Created          : 2015/03/11
Description   :
Function List :
History          :
******************************************************************************/

#include "drv_disp_com.h"
#include "drv_win_priv.h"
#include "drv_win_hal.h"
#include "hi_drv_disp.h"
#include "drv_display.h"
#include "drv_disp_bufcore.h"
#include "hi_osal.h"
#include "hi_drv_proc.h"
#include "hi_drv_module.h"
#include "drv_win_policy.h"
#include "drv_low_power.h"

#ifndef __DISP_PLATFORM_BOOT__

#define XDP_ISOGENY_INFO(fmt...) //printk(fmt)
#define XDP_ISOGENY_3FRAME_INFO(fmt...)  //printk(fmt)

#define XDP_ISOGENY_1FIELD_BUFDIV 2
#define XDP_ISOGENY_3FRAME_BUFDIV 1

#ifdef VDP_ISOGENY_SUPPORT
extern spinlock_t g_threadIsr_Lock;
extern S_VDP_REGS_TYPE *g_pstVdpBaseAddr;
WBC_HD_WIN_INFOR_S stWnHDFrameInfor;
ISOGBNY_CFG_INFOR_S stIsogenyInfo;
HI_BOOL g_bVDPIsogenyBypass = HI_FALSE;


HI_VOID ISOGENY_UpDateHDWinFramInfo(WBC_HD_WIN_INFOR_S *pstHDWinInfo, HI_U32 u32VideoLayer)
{
    if ( VDP_LAYER_VID0 == u32VideoLayer )
    {
        stWnHDFrameInfor.bV0Mute = pstHDWinInfo->bV0Mute;
        stWnHDFrameInfor.bV0RegionEnable = pstHDWinInfo->bV0RegionEnable;

        stWnHDFrameInfor.stV0InRect = pstHDWinInfo->stV0InRect;
        stWnHDFrameInfor.stV0VideoRect = pstHDWinInfo->stV0VideoRect;
        stWnHDFrameInfor.stV0DispRect = pstHDWinInfo->stV0DispRect;

        stWnHDFrameInfor.eSrcPixelFmt = pstHDWinInfo->eSrcPixelFmt;
        stWnHDFrameInfor.enV0WinSrcColorSpace = pstHDWinInfo->enV0WinSrcColorSpace;
        stWnHDFrameInfor.enV0WinDestColorSpace = pstHDWinInfo->enV0WinDestColorSpace;
        stWnHDFrameInfor.bV0Secure = pstHDWinInfo->bV0Secure;
        stWnHDFrameInfor.bV0FieldMatch = pstHDWinInfo->bV0FieldMatch;
    }
    else
    {
        stWnHDFrameInfor.bV1Mute &= pstHDWinInfo->bV1Mute;
        stWnHDFrameInfor.bV1RegionEnable |= pstHDWinInfo->bV1RegionEnable;
        stWnHDFrameInfor.bV1Secure |= pstHDWinInfo->bV1Secure;

    }

    stWnHDFrameInfor.u32WinNum = pstHDWinInfo->u32WinNum;
#if 0
    printk("v0mute %d en %d inrect %d %d %d %d videorect %d %d %d %d\n",
           stWnHDFrameInfor.bV0Mute,
           stWnHDFrameInfor.bV0RegionEnable,
           stWnHDFrameInfor.stV0InRect.s32X,
           stWnHDFrameInfor.stV0InRect.s32Y,
           stWnHDFrameInfor.stV0InRect.s32Width,
           stWnHDFrameInfor.stV0InRect.s32Height,

           stWnHDFrameInfor.stV0VideoRect.s32X,
           stWnHDFrameInfor.stV0VideoRect.s32Y,
           stWnHDFrameInfor.stV0VideoRect.s32Width,
           stWnHDFrameInfor.stV0VideoRect.s32Height
          );
#endif
}


HI_VOID ISOGENY_GetHDWinFrameInfo(WBC_HD_WIN_INFOR_S *pstHDWinInfo)
{
    *pstHDWinInfo = stWnHDFrameInfor;
}

HI_BOOL  ISOGENY_GetHDWinEnable(HI_VOID)
{
    ISOGENY_GetHDWinFrameInfo(&stWnHDFrameInfor);

    if ( 0 == stWnHDFrameInfor.u32WinNum )
    {
        return HI_FALSE;
    }

    if ((HI_TRUE == stWnHDFrameInfor.bV0Mute) &&
        (HI_TRUE == stWnHDFrameInfor.bV0RegionEnable)
       )
    {
        return HI_FALSE;
    }

    if ( HI_TRUE == stWnHDFrameInfor.bV0RegionEnable)
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}


HI_VOID ISOGENY_CleanHDWinFrameInfo(HI_VOID)
{
    return;
}

HI_S32  ISOGBNY_GetWBCOutSize(HI_RECT_S *pstHDOutPutFrameSize,
                              HI_RECT_S *pstHdFmtRect,
                              HI_RECT_S *pstSdFmtRect,
                              HI_RECT_S *pstSdOutRect)
{
    HI_RECT_S  stSdOutputRectSize;

    if (0 == pstHdFmtRect->s32Width || 0 == pstHdFmtRect->s32Height)
    {
        WIN_ERROR("Denominator may be zero !\n");
        return HI_FAILURE;
    }
    /*do correspoding tranlation according the hd and sd fmt.*/
    stSdOutputRectSize.s32X = (pstHDOutPutFrameSize->s32X * pstSdFmtRect->s32Width) / pstHdFmtRect->s32Width;
    stSdOutputRectSize.s32Width = (pstHDOutPutFrameSize->s32Width * pstSdFmtRect->s32Width) / pstHdFmtRect->s32Width;

    stSdOutputRectSize.s32Y = (pstHDOutPutFrameSize->s32Y * pstSdFmtRect->s32Height) / pstHdFmtRect->s32Height;
    stSdOutputRectSize.s32Height = (pstHDOutPutFrameSize->s32Height * pstSdFmtRect->s32Height) / pstHdFmtRect->s32Height;

    if (stSdOutputRectSize.s32Height < 64)
    {
        stSdOutputRectSize.s32Height = 64;
    }

    if (stSdOutputRectSize.s32Width < 64)
    {
        stSdOutputRectSize.s32Width = 64;
    }

    if (stSdOutputRectSize.s32Width > 720)
    {
        WIN_WARN("Sd OutputSize out of range.\n");
        stSdOutputRectSize.s32Width = 720;
    }

    if (stSdOutputRectSize.s32Height > 576)
    {
        WIN_WARN("Sd OutputSize out of range.\n");
        stSdOutputRectSize.s32Height = 576;
    }

    if ((stSdOutputRectSize.s32Width + stSdOutputRectSize.s32X) > 720)
    {
        if (stSdOutputRectSize.s32Width <= 64)
        {
            stSdOutputRectSize.s32X = 720 - stSdOutputRectSize.s32Width ;
        }

    }

    WinOutRectAlign(&stSdOutputRectSize);

    *pstSdOutRect = stSdOutputRectSize;

    return HI_SUCCESS;
}

HI_BOOL ISOGBNY_CheckFrameAddrValid(HI_U32 u32Yaddr,
                                    HI_U32 u32YStride,
                                    HI_U32 u32Caddr,
                                    HI_U32 u32CStride,
                                    HI_U32 u32Height)
{
    return HI_TRUE;
}

HI_S32 ISOGBNY_GenarateFrameInfor(HI_DRV_VIDEO_FRAME_S *pstConfigFrame,
                                  HI_RECT_S *pstSdDispRect)
{
    pstConfigFrame->stDispRect.s32Width = pstSdDispRect->s32Width;
    pstConfigFrame->stDispRect.s32Height = pstSdDispRect->s32Height;
    pstConfigFrame->stDispRect.s32X = pstSdDispRect->s32X;
    pstConfigFrame->stDispRect.s32Y = pstSdDispRect->s32Y;

    /*set the w/h of frame.*/
    pstConfigFrame->u32Width = pstSdDispRect->s32Width; //= 720;
    pstConfigFrame->u32Height = pstSdDispRect->s32Height;// = 576;
    pstConfigFrame->enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;

    pstConfigFrame->stBufAddr[0].u32Stride_Y = 720;
    pstConfigFrame->stBufAddr[0].u32Stride_C = 720;

    if (ISOGBNY_BUF_SINGL_NUM == stIsogenyInfo.u32FrameNum)
    {
        pstConfigFrame->stBufAddr[0].u32PhyAddr_C = ((pstConfigFrame->stBufAddr[0].u32PhyAddr_Y
                + pstConfigFrame->stBufAddr[0].u32Stride_Y * (ISOGBNY_RECT_HEIGHT / XDP_ISOGENY_1FIELD_BUFDIV))  + 0xf) & 0xFFFFFFF0 ;
    }
    else
    {
        pstConfigFrame->stBufAddr[0].u32PhyAddr_C = ((pstConfigFrame->stBufAddr[0].u32PhyAddr_Y
                + pstConfigFrame->stBufAddr[0].u32Stride_Y * (ISOGBNY_RECT_HEIGHT / XDP_ISOGENY_3FRAME_BUFDIV))  + 0xf) & 0xFFFFFFF0 ;
    }

    if (HI_FALSE == ISOGBNY_CheckFrameAddrValid(pstConfigFrame->stBufAddr[0].u32PhyAddr_Y,
            pstConfigFrame->stBufAddr[0].u32Stride_Y,
            pstConfigFrame->stBufAddr[0].u32PhyAddr_C,
            pstConfigFrame->stBufAddr[0].u32Stride_C,
            pstConfigFrame->u32Height))
    {
        WIN_FATAL("Wbc write out of range, W/H:%d,%d Frame %d yaddr ystride %#x %d caddr cstride %#x %d\n",
                  pstConfigFrame->u32Width, pstConfigFrame->u32Height,
                  pstConfigFrame->u32FrameIndex,
                  pstConfigFrame->stBufAddr[0].u32PhyAddr_Y,
                  pstConfigFrame->stBufAddr[0].u32Stride_Y,
                  pstConfigFrame->stBufAddr[0].u32PhyAddr_C,
                  pstConfigFrame->stBufAddr[0].u32Stride_C
                 );
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_U32 ISOGBNY_GetBuffNum(ISOGBNY_BUFFER_MODE_E enIsogenyBuffMode)
{
    HI_U32 u32BuffNum = 0;

    if (( ISOGBNY_BUFFER_MODE_MULTIPLE_SEC == enIsogenyBuffMode)
        || ( ISOGBNY_BUFFER_MODE_MULTIPLE_NONSEC == enIsogenyBuffMode)
       )
    {
        u32BuffNum = ISOGBNY_BUF_MULTIPLE_NUM;
    }
    else
    {
        u32BuffNum = ISOGBNY_BUF_SINGL_NUM;
    }

    return u32BuffNum;
}


HI_VOID ISOGBNY_PqProcess(HI_DRV_VIDEO_FRAME_S *pstFrame,
                          WIN_INFO_S *pstLayerPara,
                          const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_VDP_PQ_INFO_S stTimingInfo;

    /*this is the current value.*/
    stTimingInfo.enLayerId  = VDP_LAYER_SD0;
    stTimingInfo.u32Width = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->stVideoOriginalInfo.u32Width;
    stTimingInfo.u32Height = ((HI_DRV_VIDEO_PRIVATE_S *)&pstFrame->u32Priv[0])->stVideoOriginalInfo.u32Height;

    stTimingInfo.bSRState     = HI_FALSE;
    stTimingInfo.bPartUpdate = HI_TRUE;
    stTimingInfo.bIsogenyMode = DISP_Check_IsogenyMode();

    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)HI_DRV_DISPLAY_0].stFmtRect = pstInfo->stDispInfo.stFmtResolution;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)HI_DRV_DISPLAY_0].u32RefreshRate = pstInfo->stDispInfo.u32RefreshRate;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)HI_DRV_DISPLAY_0].bProgressive = pstInfo->stDispInfo.bInterlace ? HI_FALSE : HI_TRUE;
    stTimingInfo.stChannelTiming[(HI_PQ_DISPLAY_E)HI_DRV_DISPLAY_0].enOutColorSpace = pstInfo->stDispInfo.eColorSpace;


    stTimingInfo.stVideo.s32X      = pstLayerPara->stVideo.s32X ;
    stTimingInfo.stVideo.s32Y      = pstLayerPara->stVideo.s32Y;
    stTimingInfo.stVideo.s32Width  = pstLayerPara->stVideo.s32Width;
    stTimingInfo.stVideo.s32Height = pstLayerPara->stVideo.s32Height;


    if (DISP_STEREO_NONE == pstInfo->stDispInfo.eDispMode)
    {
        stTimingInfo.b3dType = HI_FALSE;
    }
    else
    {
        stTimingInfo.b3dType = HI_TRUE;
    }

#if 0//430 fpga
    DRV_PQ_UpdateVdpPQ((HI_PQ_DISPLAY_E)HI_DRV_DISPLAY_0, &stTimingInfo, (S_VDP_REGS_TYPE *)g_pstVdpBaseAddr);
#endif
}


static HI_VOID WinTransferSdCfgInfoToWinInfo(WIN_INFO_S     *pstWinInfo)
{
    pstWinInfo->bCloseHdr     = HI_TRUE;
    WIN_SHARE_GetFrameColorSpace(pstWinInfo->pCurrentFrame, &pstWinInfo->enInCsc);
    pstWinInfo->enOutType = HI_DRV_DISP_TYPE_NORMAL;
    return;
}


HI_VOID ISR_SlaveWinConfigFrame( HI_DRV_VIDEO_FRAME_S *pstFrame, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WIN_INFO_S     stLayerPara = {0};
    VIDEO_LAYER_FUNCTIONG_S *pstFunc = HI_NULL;

    if (HI_TRUE == g_bVDPIsogenyBypass)
    {
        return;
    }

    if (HI_NULL == pstInfo)
    {
        WIN_INFO("Pointer is NULL!\n");
        return ;
    }

    /*here we delete all the rwzb content, just rebuild it  in 98cv200 .*/
    memset(&stLayerPara, 0, sizeof(WIN_INFO_S));
    pstFunc = VideoLayer_GetFunctionPtr();

    if (HI_NULL == pstFunc)
    {
        WIN_INFO("pstFunc is NULL!\n");
        return ;
    }

    stLayerPara.enOutCsc = HI_DRV_CS_BT601_YUV_LIMITED;
    stLayerPara.u32RegionNo =    0;
    stLayerPara.u32LayerId =   VDP_LAYER_SD0;
    stLayerPara.bRegionMute  = 0;
    stLayerPara.bRegionEnable = HI_TRUE;
    stLayerPara.pstDispInfo = (HI_DISP_DISPLAY_INFO_S *) & (pstInfo->stDispInfo);

    /*stOutRect may equal to stIn in most situation.*/
    stLayerPara.pCurrentFrame = pstFrame;
    stLayerPara.u32AllAlpha =  pstInfo->stDispInfo.u32Alpha;
    stLayerPara.u32Alpha = stLayerPara.u32AllAlpha;

    if (HI_NULL != pstFrame)
    {
        pstFrame->stDispRect.s32X = 0;
        pstFrame->stDispRect.s32Y = 0;
        pstFrame->stDispRect.s32Width = 720;
        pstFrame->stDispRect.s32Height = 576;

        stLayerPara.stIn   = pstFrame->stDispRect;
        stLayerPara.stIn.s32X = 0;
        stLayerPara.stIn.s32Y = 0;
        stLayerPara.stIn.s32Width = pstFrame->stDispRect.s32Width;
        stLayerPara.stIn.s32Height = pstFrame->stDispRect.s32Height;
        stLayerPara.stVideo      = pstFrame->stDispRect;
        stLayerPara.stDisp      = pstFrame->stDispRect;

        pstFrame->u32Width = pstFrame->stDispRect.s32Width;;
        pstFrame->u32Height = pstFrame->stDispRect.s32Height;;

        (HI_VOID)ISOGBNY_PqProcess(pstFrame, &stLayerPara, pstInfo);

        XDP_ISOGENY_3FRAME_INFO("(%lu)disp frame yaddr %#x %#x ystride %d cstride %d\n",
                                jiffies,
                                pstFrame->stBufAddr[0].u32PhyAddr_Y,
                                pstFrame->stBufAddr[0].u32PhyAddr_C,
                                pstFrame->stBufAddr[0].u32Stride_Y,
                                pstFrame->stBufAddr[0].u32Stride_C);
#if 0
        XDP_ISOGENY_3FRAME_INFO("slave rect %d %d %d %d yaddr %#x caddr %#x stride y c %d %d\n",
                                pstFrame->stDispRect.s32X,
                                pstFrame->stDispRect.s32Y,
                                pstFrame->stDispRect.s32Width,
                                pstFrame->stDispRect.s32Height,
                                pstFrame->stBufAddr[0].u32PhyAddr_Y,
                                pstFrame->stBufAddr[0].u32PhyAddr_C,
                                pstFrame->stBufAddr[0].u32Stride_Y,
                                pstFrame->stBufAddr[0].u32Stride_C
                               );
#endif
    }
    else
    {
        stLayerPara.bRegionMute  = HI_TRUE;
        stLayerPara.bRegionEnable = HI_FALSE;
        XDP_ISOGENY_3FRAME_INFO("(%lu)disp frame is null!\n", jiffies);
    }


    if (HI_NULL == pstFunc->PF_SetSdLayerCfg)
    {
        WIN_INFO("pstFunc->PF_SetSdLayerCfg is NULL!\n");
        return ;
    }

    WinTransferSdCfgInfoToWinInfo(&stLayerPara);

    (HI_VOID)pstFunc->PF_SetSdLayerCfg(VDP_LAYER_SD0, &stLayerPara);
    return;
}


HI_DRV_FIELD_MODE_E  ISOGBNY_GetWbcOutputFieldMode(HI_VOID)
{
    DISP_INTF_OPERATION_S stFunction = {0};
    HI_BOOL bBtm = HI_FALSE;
    HI_U32  u32Vcnt = 0;

    (HI_VOID)DISP_HAL_GetOperation(&stFunction);

    if (HI_NULL != stFunction.FP_GetChnBottomFlag)
    {
        stFunction.FP_GetChnBottomFlag(HI_DRV_DISPLAY_0, &bBtm, &u32Vcnt);
    }
    else
    {
        WIN_ERROR("pstFunc is NULL!\n");
    }

    return (1 - bBtm);
}

HI_VOID ISOGBNY_ConfigWbcConvert(WIN_WBC_CONFIG_S *pWBCConfig, ISOGBNY_WBC_CFG_S *pstWBC0Cfg)
{
    pWBCConfig->bWbcEnable      = pstWBC0Cfg->bWbcEnable;
    pWBCConfig->eOutPutPixelFmt = pstWBC0Cfg->eOutPutPixelFmt;
    pWBCConfig->eInPutPixelFmt  = pstWBC0Cfg->eInPutPixelFmt;
    pWBCConfig->eFieldMode      = pstWBC0Cfg->eFieldMode;

    memcpy(&pWBCConfig->stAddr, &pstWBC0Cfg->stAddr, sizeof(HI_DRV_VID_FRAME_ADDR_S));
    memcpy(&pWBCConfig->stHdWinInputSize, &pstWBC0Cfg->stHdWinInputSize, sizeof(HI_RECT_S));
    memcpy(&pWBCConfig->stHdWinOutputSize, &pstWBC0Cfg->stHdWinOutputSize, sizeof(HI_RECT_S));
    memcpy(&pWBCConfig->stSdVideoRect, &pstWBC0Cfg->stSdWinVideoRect, sizeof(HI_RECT_S));
    memcpy(&pWBCConfig->stSdOutRect, &pstWBC0Cfg->stSdWinOutRect, sizeof(HI_RECT_S));

    pWBCConfig->enHdWinSrcColorSpace    = pstWBC0Cfg->enHdWinSrcColorSpace;
    pWBCConfig->enHdWinDestColorSpace   = pstWBC0Cfg->enHdWinDestColorSpace;
    pWBCConfig->bForceFieldMode         = pstWBC0Cfg->bForceFieldMode;
    pWBCConfig->bComplexMode            = pstWBC0Cfg->bComplexMode;

    return;
}

HI_S32 ISOGBNY_SetWBCEnableCfg(DISP_INTF_OPERATION_S *pstFunc, HI_BOOL bEnable)
{
    WBC_DHD0_Cfg_S stWBCCfg = {0};
    HI_DRV_FIELD_MODE_E eFieldMode = HI_DRV_FIELD_BUTT;
    HI_S32 s32Ret = HI_SUCCESS;

    if (HI_NULL == pstFunc)
    {
        WIN_ERROR("pstFunc is NULL!\n");
        return HI_FAILURE;
    }

    stWBCCfg.bEnable = bEnable;
    if (HI_TRUE == stWBCCfg.bEnable)
    {
        eFieldMode = ISOGBNY_GetWbcOutputFieldMode();
        stWBCCfg.three_d_mode = 0;
        stWBCCfg.rgup_mode = 1;
        if (ISOGBNY_BUF_SINGL_NUM == ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
        {
            stWBCCfg.mode_out = eFieldMode + 2; //XDP_WBC_MODE_OUT_INTERFACE;
        }
        else
        {
            stWBCCfg.mode_out = 1; //XDP_WBC_MODE_OUT_PROGRESIVE;
        }

        stWBCCfg.root_path = XDP_WBC_ROOT_PATH_BZME;
    }

    s32Ret = pstFunc->PF_SetWbcEnableCfg(DISP_WBC_Video, &stWBCCfg);

    return s32Ret;
}

HI_S32 ISOGBNY_ConfigWbc_V0ISR(ISOGBNY_WBC_CFG_S *pstWBC0Cfg, HI_DRV_VIDEO_FRAME_S *pstCfgFrame)
{
    DISP_INTF_OPERATION_S stFunction = {0};
    VIDEO_LAYER_FUNCTIONG_S *pstFunc = HI_NULL;
    WBC_HD_WIN_INFOR_S stHDWinInfo = {0};
    WIN_WBC_POLICY_S stWbcPolicy = {0};
    HI_DRV_FIELD_MODE_E eFieldMode = HI_DRV_FIELD_BUTT;


    (HI_VOID)DISP_HAL_GetOperation(&stFunction);
    pstFunc = VideoLayer_GetFunctionPtr();

    if (HI_NULL == pstFunc)
    {
        WIN_ERROR("pstFunc is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }

    if (HI_NULL == pstFunc->PF_GetWbcPolicy)
    {
        WIN_ERROR("pstFunc->PF_GetWbcPolicy is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }

    if ((HI_NULL == stFunction.PF_SetWbcAddr) || (HI_NULL == stFunction.PF_SetWBCRegUp)
        || (HI_NULL == stFunction.PF_SetWbcEnableCfg))
    {
        WIN_ERROR("stFunction.func is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }

    if (HI_NULL == pstCfgFrame)
    {
        ISOGBNY_SetWBCEnableCfg(&stFunction, HI_FALSE);
        pstWBC0Cfg->bWbcEnable = HI_FALSE;
    }
    else
    {
        ISOGENY_GetHDWinFrameInfo(&stHDWinInfo);

        //printk("ISOGBNY_ConfigWbc_V0ISR use src dst %p %d %d\n", pstWBC0Cfg, pstWBC0Cfg->enHdWinSrcColorSpace, pstWBC0Cfg->enHdWinDestColorSpace);

        pstFunc->PF_GetWbcPolicy((WIN_WBC_CONFIG_S *)pstWBC0Cfg, &stWbcPolicy);

        if (HI_SUCCESS != ISOGBNY_GenarateFrameInfor(pstCfgFrame,
                &stWbcPolicy.stWbcOutputSize))
        {
            WIN_ERROR("Call ISOGBNY_GenarateFrameInfor failed!\n");
            return HI_FAILURE;
        }

        pstWBC0Cfg->stAddr.u32PhyAddr_Y  =  pstCfgFrame->stBufAddr[0].u32PhyAddr_Y;
        pstWBC0Cfg->stAddr.u32Stride_Y   =  pstCfgFrame->stBufAddr[0].u32Stride_Y;
        pstWBC0Cfg->stAddr.u32PhyAddr_C  =  pstCfgFrame->stBufAddr[0].u32PhyAddr_C;
        pstWBC0Cfg->stAddr.u32Stride_C   =  pstCfgFrame->stBufAddr[0].u32Stride_C;

        eFieldMode = ISOGBNY_GetWbcOutputFieldMode();

        //single buf, wbc outmode follow interface
        if (ISOGBNY_BUF_SINGL_NUM == ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
        {
            if (HI_DRV_FIELD_BOTTOM == eFieldMode)
            {
                pstWBC0Cfg->stAddr.u32PhyAddr_Y -= pstWBC0Cfg->stAddr.u32Stride_Y / 2;
                pstWBC0Cfg->stAddr.u32PhyAddr_C -= pstWBC0Cfg->stAddr.u32Stride_C / 2;
            }
            pstWBC0Cfg->stAddr.u32Stride_Y = pstWBC0Cfg->stAddr.u32Stride_Y / 2;
            pstWBC0Cfg->stAddr.u32Stride_C = pstWBC0Cfg->stAddr.u32Stride_C / 2;
        }

        pstCfgFrame->stDispRect = stIsogenyInfo.stWBC0Cfg.stSdWinVideoRect;
        ((HI_DRV_VIDEO_PRIVATE_S *)&pstCfgFrame->u32Priv[0])->eColorSpace = stIsogenyInfo.stWBC0Cfg.enHdWinSrcColorSpace;

        stFunction.PF_SetWbcAddr(DISP_WBC_Video, &(pstWBC0Cfg->stAddr));

        XDP_ISOGENY_3FRAME_INFO("(%lu)wbc cfg logic yaddr %#x %#x ystride %d cstride %d\n",
                                jiffies,
                                pstWBC0Cfg->stAddr.u32PhyAddr_Y,
                                pstWBC0Cfg->stAddr.u32PhyAddr_C,
                                pstWBC0Cfg->stAddr.u32Stride_Y,
                                pstWBC0Cfg->stAddr.u32Stride_C);
        ISOGBNY_SetWBCEnableCfg(&stFunction, HI_TRUE);
    }
    stFunction.PF_SetWBCRegUp(VDP_LAYER_WBC_HD0);

    return HI_SUCCESS;
}

HI_S32 ISOGBNY_ConfigWbc_QFrame(ISOGBNY_WBC_CFG_S *pstWBC0Cfg)
{
    DISP_INTF_OPERATION_S stFunction = {0};
    VIDEO_LAYER_FUNCTIONG_S *pstFunc = HI_NULL;
    WBC_HD_WIN_INFOR_S stHDWinInfo = {0};
    HI_RECT_S stSdWinOutputSize = {0};
    HI_DISP_DISPLAY_INFO_S *pstDispHd = HI_NULL, *pstDispSd = HI_NULL;

    (HI_VOID)DISP_HAL_GetOperation(&stFunction);
    pstFunc = VideoLayer_GetFunctionPtr();

    if ((HI_NULL == pstFunc) || (HI_NULL == stFunction.PF_SetWbcEnableCfg))
    {
        WIN_INFO("pstFunc is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }

    if (HI_NULL == pstFunc->PF_GetWbcPolicy)
    {
        WIN_INFO("PF_GetWbcPolicy is NULL!\n");
        return HI_ERR_VO_NULL_PTR;
    }

    ISOGENY_GetHDWinFrameInfo(&stHDWinInfo);
    if (sizeof(WIN_WBC_CONFIG_S) != sizeof(*pstWBC0Cfg))
    {
        WIN_FATAL("pointer size is not same! %d %d\n", sizeof(WIN_WBC_CONFIG_S), sizeof(*pstWBC0Cfg));
        return HI_ERR_VO_NULL_PTR;
    }

    if (pstWBC0Cfg->bWbcEnable == HI_FALSE)
    {
        ISOGBNY_SetWBCEnableCfg(&stFunction, HI_FALSE);
        return  HI_FAILURE;
    }

    pstDispHd = DISP_GetDispBasicInfor(HI_DRV_DISPLAY_1);
    pstDispSd = DISP_GetDispBasicInfor(HI_DRV_DISPLAY_0);

    if ( WBC_WB_FIELD_FIELD == stIsogenyInfo.enWBForceField )
    {
        pstWBC0Cfg->bForceFieldMode = HI_TRUE;
    }
    else
    {
        pstWBC0Cfg->bForceFieldMode = HI_FALSE;
    }

    pstWBC0Cfg->stHdWinInputSize = stHDWinInfo.stV0InRect;
    pstWBC0Cfg->stHdWinOutputSize = stHDWinInfo.stV0VideoRect;

    if ((WBC_WB_POINT_VP == stIsogenyInfo.enWBCForcePoint)
        || (stHDWinInfo.u32WinNum > 1) || (pstWBC0Cfg->stHdWinInputSize.s32Width > 1920))
    {
        pstWBC0Cfg->bComplexMode = HI_TRUE;
    }
    else
    {
        pstWBC0Cfg->bComplexMode = HI_FALSE;
    }

    pstWBC0Cfg->bFieldMatch = stHDWinInfo.bV0FieldMatch;

    (HI_VOID)ISOGBNY_GetWBCOutSize(&stHDWinInfo.stV0VideoRect,
                                   &pstDispHd->stFmtResolution,
                                   &pstDispSd->stFmtResolution,
                                   &stSdWinOutputSize);

    pstWBC0Cfg->stSdWinVideoRect = stSdWinOutputSize;
    pstWBC0Cfg->stSdWinOutRect = pstDispSd->stFmtResolution;
    pstWBC0Cfg->eOutPutPixelFmt = HI_DRV_PIX_FMT_NV61_2X1;
    pstWBC0Cfg->eInPutPixelFmt = stHDWinInfo.eSrcPixelFmt;

    if (HI_DRV_CS_UNKNOWN == stHDWinInfo.enV0WinSrcColorSpace)
    {
        pstWBC0Cfg->enHdWinSrcColorSpace = HI_DRV_CS_BT709_YUV_LIMITED;
    }
    else
    {
        pstWBC0Cfg->enHdWinSrcColorSpace = stHDWinInfo.enV0WinSrcColorSpace;
    }

    if (HI_DRV_CS_UNKNOWN == stHDWinInfo.enV0WinDestColorSpace)
    {
        pstWBC0Cfg->enHdWinDestColorSpace = HI_DRV_CS_BT709_YUV_LIMITED;
    }
    else
    {
        pstWBC0Cfg->enHdWinDestColorSpace = stHDWinInfo.enV0WinDestColorSpace;
    }

    stIsogenyInfo.stWBCInfo.eDispMode = pstDispHd->eDispMode;

    return HI_SUCCESS;
}

HI_VOID ISOGBNY_WBC0StatusReset(ISOGBNY_WBC_CFG_S *pstWBC0Cfg)
{
    stIsogenyInfo.stWBCInfo.u32WBCQFrameCfgCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCISRCfgTryCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCISRCfgOKCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCFinishISRCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCFinishSucCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCDisardCount = 0;
    stIsogenyInfo.stWBCInfo.u32WBCFailCount = 0;
}

HI_VOID ISOGBNY_SlaveStatusReset(ISOGBNY_SLAVE_CFG_S *pstSlaveCfg)
{
    pstSlaveCfg->pstNextNode = HI_NULL;
    pstSlaveCfg->pstCurrentNode = HI_NULL;
    pstSlaveCfg->pstDispNode = HI_NULL;

    pstSlaveCfg->u32ISRCount = 0;
    pstSlaveCfg->u32ReCfgCount = 0;
    pstSlaveCfg->u3ToDispCount = 0;

    pstSlaveCfg->u32DisardCount = 0;
    pstSlaveCfg->u32RepeatCount = 0;
    pstSlaveCfg->u32ReleaseCount = 0;
}

HI_S32 ISOGBNY_CreatFrameMem( DISP_MMZ_BUF_S *pstMBuf_WBC, HI_U32 u32AllocateSize)
{
    HI_S32 s32Ret = HI_FAILURE;

    if (HI_TRUE == pstMBuf_WBC->bSecure)
    {
        s32Ret = DISP_OS_SECSMMU_Alloc("VDP_WBC_V3_SE", u32AllocateSize, VDP_MEM_ALIGN, pstMBuf_WBC);
    }
    else
    {
        s32Ret = DISP_OS_MMZ_Alloc("VDP_WBC_V3", VDP_MEM_TYPE_MMZ, u32AllocateSize, VDP_MEM_ALIGN, pstMBuf_WBC);

        XDP_ISOGENY_INFO("malloc mem %#x\n", pstMBuf_WBC->u32StartPhyAddr);
    }

    return  s32Ret;
}
HI_VOID ISOGBNY_ReleaseFrameMem( DISP_MMZ_BUF_S *pstMBuf_WBC )
{
    XDP_ISOGENY_INFO("free mem %#x\n", pstMBuf_WBC->u32StartPhyAddr);

    if ( HI_TRUE == pstMBuf_WBC->bSecure)
    {
        DISP_OS_SECSMMU_Release(pstMBuf_WBC);
    }
    else
    {
        DISP_OS_MMZ_Release(pstMBuf_WBC);
    }
}
HI_VOID ISOGBNY_ReleaseFrameBuf( DISP_MMZ_BUF_S *pstMBuf_WBC )
{
    ISOGBNY_ReleaseFrameMem(pstMBuf_WBC);
}

HI_S32 ISOGBNY_CreatFrameBuf( DISP_MMZ_BUF_S *pstMBuf_WBC, ISOGBNY_BUFFER_MODE_E enIsogenyBuffMode)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32AllocateSize = 0;
    HI_U32 u32YSize = 0;
    HI_U32 u32CSize = 0;
    HI_U32 u32BuffNum = 0;

    u32BuffNum = ISOGBNY_GetBuffNum(enIsogenyBuffMode);

    if ((u32BuffNum == 0) || (u32BuffNum > ISOGBNY_BUFF_NUM_MAX))
    {
        WIN_ERROR("Isogeny buffer out of max number!\n");
        return HI_FAILURE;
    }

    u32YSize = ISOGBNY_MAX_STRIDE * ISOGBNY_RECT_HEIGHT ;
    if (ISOGBNY_BUF_SINGL_NUM == u32BuffNum)
    {
        u32YSize /= XDP_ISOGENY_1FIELD_BUFDIV; //field mode
        u32YSize = (u32YSize  + 0xf) & 0xFFFFFFF0;
    }
    else
    {
        u32YSize /= XDP_ISOGENY_3FRAME_BUFDIV; //frame mode
        u32YSize = (u32YSize  + 0xf) & 0xFFFFFFF0;
    }

    u32CSize = u32YSize;/*422 */
    u32AllocateSize = (u32YSize + u32CSize) * u32BuffNum;

    s32Ret = ISOGBNY_CreatFrameMem(pstMBuf_WBC, u32AllocateSize);
    if (HI_SUCCESS != s32Ret)
    {
        WIN_ERROR("CreatFrameBuf malloc frame info memory err!\n");
        return s32Ret;
    }

    stIsogenyInfo.u32FrameNum = u32BuffNum;


    return HI_SUCCESS;
}


HI_S32 ISOGBNY_FrameBuf_Init(ISOGBNY_BUFFER_MODE_E enIsogenyBuffMode)
{
    HI_BOOL bSecure = HI_FALSE;
    HI_S32 s32Ret;
    DISP_BUF_NODE_S *pstNode = HI_NULL;
    HI_DRV_VIDEO_FRAME_S *pstFrame = HI_NULL;
    HI_U32 u32YSize = 0;
    HI_U32 u32CSize = 0;
    HI_U32 u32Idx = 0;

    if (enIsogenyBuffMode >= ISOGBNY_BUFFER_MODE_BUTT)
    {
        WIN_FATAL("Para enIsogenyBuffMode is invalid!\n");
        return HI_ERR_VO_INVALID_PARA;
    }

    if (ISOGBNY_BUFFER_STATUS_INIT == stIsogenyInfo.enIsogenyBuffStatus)
    {
        return HI_SUCCESS;
    }

    if (( ISOGBNY_BUFFER_MODE_MULTIPLE_SEC == enIsogenyBuffMode)
        || ( ISOGBNY_BUFFER_MODE_SINGL_SEC == enIsogenyBuffMode)
       )
    {
        bSecure = HI_TRUE;
    }

    stIsogenyInfo.stIsogenyFrameMem.bSecure = bSecure;

    s32Ret = ISOGBNY_CreatFrameBuf(&stIsogenyInfo.stIsogenyFrameMem, enIsogenyBuffMode);
    if (s32Ret != HI_SUCCESS)
    {
        WIN_FATAL("isogeny create node failed\n");
        return HI_FAILURE;
    }

    s32Ret = DispBuf_Create(&stIsogenyInfo.stBuffer, stIsogenyInfo.u32FrameNum);
    if (s32Ret != HI_SUCCESS)
    {
        WIN_FATAL("isogeny create node failed\n");
        ISOGBNY_ReleaseFrameBuf(&stIsogenyInfo.stIsogenyFrameMem);
        return HI_FAILURE;
    }

    u32CSize = u32YSize = ISOGBNY_MAX_STRIDE * ISOGBNY_RECT_HEIGHT ; //sp422
    if (ISOGBNY_BUF_SINGL_NUM == stIsogenyInfo.u32FrameNum)
    {
        u32CSize = u32YSize = (ISOGBNY_MAX_STRIDE * ISOGBNY_RECT_HEIGHT / XDP_ISOGENY_1FIELD_BUFDIV  + 0xf) & 0xFFFFFFF0; //field mode
    }
    else
    {
        u32CSize = u32YSize = (ISOGBNY_MAX_STRIDE * ISOGBNY_RECT_HEIGHT / XDP_ISOGENY_3FRAME_BUFDIV  + 0xf) & 0xFFFFFFF0; //field mode
    }

    XDP_ISOGENY_3FRAME_INFO("stIsogenyInfo.u32FrameNum : %d\n", stIsogenyInfo.u32FrameNum);

    for (u32Idx = 0; u32Idx < stIsogenyInfo.u32FrameNum; u32Idx++)
    {
        s32Ret = DispBuf_GetEmptyNode(&stIsogenyInfo.stBuffer, &pstNode);
        if (s32Ret == HI_SUCCESS)
        {
            s32Ret = DispBuf_DelEmptyNode(&stIsogenyInfo.stBuffer, pstNode);
            if (s32Ret == HI_SUCCESS)
            {
                pstFrame = (HI_DRV_VIDEO_FRAME_S *) & (pstNode->u32Data);
                memset((HI_VOID *)pstFrame, 0x0, sizeof(HI_DRV_VIDEO_FRAME_S));

                pstFrame->u32FrameIndex = u32Idx;
                pstFrame->bProgressive = HI_TRUE;
                pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV61_2X1;
                pstFrame->stBufAddr[0].u32PhyAddr_Y =  stIsogenyInfo.stIsogenyFrameMem.u32StartPhyAddr + u32Idx * (u32YSize + u32CSize);
                pstFrame->stBufAddr[0].u32Stride_Y  =  ISOGBNY_MAX_STRIDE;
                pstFrame->stBufAddr[0].u32PhyAddr_C =  pstFrame->stBufAddr[0].u32PhyAddr_Y + u32YSize;
                pstFrame->stBufAddr[0].u32Stride_C =  ISOGBNY_MAX_STRIDE;
                pstFrame->bSecure = stIsogenyInfo.stIsogenyFrameMem.bSecure;

                XDP_ISOGENY_3FRAME_INFO("Init node(%p) frame %d yaddr %#x caddr %#x stride y c %d %d\n",
                                        pstNode,
                                        pstFrame->u32FrameIndex,
                                        pstFrame->stBufAddr[0].u32PhyAddr_Y,
                                        pstFrame->stBufAddr[0].u32PhyAddr_C,
                                        pstFrame->stBufAddr[0].u32Stride_Y,
                                        pstFrame->stBufAddr[0].u32Stride_C);

                s32Ret = DispBuf_AddEmptyNode_NoReset(&stIsogenyInfo.stBuffer, pstNode);
                if (HI_SUCCESS != s32Ret)
                {
                    WIN_ERROR("isogeny add empty node failed\n");
                }
            }
            else
            {
                WIN_ERROR("isogeny del empty node failed\n");
            }
        }
        else
        {
            WIN_ERROR("isogeny get empty node failed\n");
        }
    }

    /*status init*/
    ISOGBNY_WBC0StatusReset(&stIsogenyInfo.stWBC0Cfg);
    ISOGBNY_SlaveStatusReset(&stIsogenyInfo.stSlaveCfg);

    stIsogenyInfo.enIsogenyBuffMode = enIsogenyBuffMode;
    stIsogenyInfo.enIsogenyBuffStatus = ISOGBNY_BUFFER_STATUS_INIT;
    stIsogenyInfo.pstWC0CfgNode = HI_NULL;
    stIsogenyInfo.pstWC0WBCNode = HI_NULL;
    stIsogenyInfo.stWBCInfo.u32WBCReInitCount++;

    return s32Ret;
}

HI_VOID ISOGBNY_FrameBuf_DeInit(HI_VOID)
{

    if (ISOGBNY_BUFFER_STATUS_DEINIT == stIsogenyInfo.enIsogenyBuffStatus)
    {
        return ;
    }

    (HI_VOID)DispBuf_Destoy(&stIsogenyInfo.stBuffer);

    ISOGBNY_ReleaseFrameBuf(&stIsogenyInfo.stIsogenyFrameMem);
    stIsogenyInfo.enIsogenyBuffMode = ISOGBNY_BUFFER_MODE_BUTT;
    stIsogenyInfo.enIsogenyBuffStatus = ISOGBNY_BUFFER_STATUS_DEINIT;
    stIsogenyInfo.pstWC0CfgNode = HI_NULL;
    stIsogenyInfo.pstWC0WBCNode = HI_NULL;

}


HI_S32 ISOGBNY_ThreadProcess(HI_VOID *pArg)
{
    HI_S32 s32Ret;

    ISOGBNY_THREAT_PROCESS_S *pstIsogenyThread = (ISOGBNY_THREAT_PROCESS_S *) pArg;
    HI_BOOL bStop_Thread = pstIsogenyThread->bStop_ISOGBNY_ProcessThread;

    /*if stop refush release frame buffer*/
    while (!kthread_should_stop() && !bStop_Thread)
    {
        if (HI_TRUE == pstIsogenyThread->bChangeProcess)
        {

            msleep(100);
            ISOGBNY_FrameBuf_DeInit();
            s32Ret = ISOGBNY_FrameBuf_Init(pstIsogenyThread->enIsogenyBuffMode);

            if (HI_SUCCESS != s32Ret)
            {
                WIN_FATAL("isogeny FrameBuf init failed\n");
                return HI_FAILURE;
            }

            stIsogenyInfo.stWBC0Cfg.eFieldMode = HI_DRV_FIELD_TOP; //default will revise to follow interface(VID0)
            if (ISOGBNY_BUF_MULTIPLE_NUM == ISOGBNY_GetBuffNum(pstIsogenyThread->enIsogenyBuffMode))
            {
                stIsogenyInfo.stWBC0Cfg.eFieldMode = HI_DRV_FIELD_ALL;
            }

            XDP_ISOGENY_3FRAME_INFO("Run ISOGBNY_ThreadProcess! bufmode : %u fieldmode:%d\n", pstIsogenyThread->enIsogenyBuffMode,
                                    stIsogenyInfo.stWBC0Cfg.eFieldMode);

            pstIsogenyThread->bChangeProcess = HI_FALSE;
            stIsogenyInfo.bCloseIsogeny = HI_FALSE;
        }

        wait_event_timeout(pstIsogenyThread->stWaitQueHead, (HI_TRUE == pstIsogenyThread->bChangeProcess), HZ);
    }

    return HI_SUCCESS;
}

HI_S32 ISOGBNY_CreatProcessThread(HI_VOID )
{
#ifndef __DISP_PLATFORM_BOOT__
    ISOGBNY_THREAT_PROCESS_S *pstIsogenyThread = &stIsogenyInfo.stIsogenyThread;

    pstIsogenyThread->bStop_ISOGBNY_ProcessThread = HI_FALSE;

    init_waitqueue_head( &(pstIsogenyThread->stWaitQueHead));
    pstIsogenyThread->hThread =
        kthread_create(ISOGBNY_ThreadProcess, (HI_VOID *)(&stIsogenyInfo.stIsogenyThread), "IsogenyProcess");

    if (IS_ERR(pstIsogenyThread->hThread))
    {
        DISP_FATAL("Can not create process thread .\n");
        return HI_ERR_DISP_CREATE_ERR;
    }

    wake_up_process(pstIsogenyThread->hThread);
#endif
    return HI_SUCCESS;
}

HI_S32 ISOGBNY_DestroyProcessThread(HI_VOID )
{
#ifndef __DISP_PLATFORM_BOOT__
    HI_S32 s32Ret;

    ISOGBNY_THREAT_PROCESS_S *pstIsogenyThread  = &stIsogenyInfo.stIsogenyThread;
    HI_BOOL bChangeProcess = pstIsogenyThread->bChangeProcess;

    pstIsogenyThread->bStop_ISOGBNY_ProcessThread = HI_TRUE;

    pstIsogenyThread->bChangeProcess = HI_TRUE;

    wake_up(&pstIsogenyThread->stWaitQueHead);

    s32Ret = kthread_stop(pstIsogenyThread->hThread);

    pstIsogenyThread->bChangeProcess = bChangeProcess;

    return s32Ret;
#else
    return HI_SUCCESS;
#endif
}

ISOGBNY_BUFFER_MODE_E ISOGENY_JudgeBufferMode(HI_DISP_DISPLAY_INFO_S *pstHD, HI_DISP_DISPLAY_INFO_S *pstSD, HI_BOOL bSecureV0, HI_BOOL bSecureV1)
{
    HI_U32 u32HDDispFreq;
    HI_U32 u32SDDispFreq;

    u32HDDispFreq = pstHD->u32RefreshRate;
    u32SDDispFreq = pstSD->u32RefreshRate;


#ifdef VDP_ISOGENY_TEE_SUPPORT
    if ( ( HI_TRUE == bSecureV0) || ( HI_TRUE == bSecureV1))
    {
        if (HI_FALSE == pstHD->bInterlace)
        {
            //  return ISOGBNY_BUFFER_MODE_MULTIPLE_SEC;
        }
        if ( u32HDDispFreq != u32SDDispFreq)
        {
            return ISOGBNY_BUFFER_MODE_MULTIPLE_SEC;
        }
        else
        {
            return ISOGBNY_BUFFER_MODE_SINGL_SEC;
        }
    }
    else
    {
        if (HI_FALSE == pstHD->bInterlace)
        {
            //  return ISOGBNY_BUFFER_MODE_MULTIPLE_NONSEC;
        }

        if ( u32HDDispFreq != u32SDDispFreq)
        {
            return ISOGBNY_BUFFER_MODE_MULTIPLE_NONSEC;
        }
        else
        {
            return ISOGBNY_BUFFER_MODE_SINGL_NONSEC;
        }
    }
#else
    if (HI_FALSE == pstHD->bInterlace)
    {
        // return ISOGBNY_BUFFER_MODE_MULTIPLE_NONSEC;
    }

    if ( u32HDDispFreq != u32SDDispFreq)
    {
        return ISOGBNY_BUFFER_MODE_MULTIPLE_NONSEC;
    }
    else
    {
        return ISOGBNY_BUFFER_MODE_SINGL_NONSEC;
    }
#endif
}

HI_S32 ISOGBNY_ReleaseNode( DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    HI_S32 nRet;

    if (HI_NULL == pstNode)
    {
        return HI_FAILURE;
    }

    pstNode->u32State = ISOGBNY_NODE_STATUS_FREE;

    nRet = DispBuf_AddEmptyNode_NoReset(pstBuffer, pstNode);

    if (HI_SUCCESS != nRet)
    {
        WIN_ERROR("DispBuf_AddEmptyNode_NoReset err(0x%x).\n", pstNode->u32ID);
        return HI_FAILURE;
    }

    stIsogenyInfo.stSlaveCfg.u32ReleaseCount++;
    return nRet;
}

HI_VOID ISOGENY_QueueFrameProcess(HI_VOID)
{
    HI_S32 nRet;
    HI_SIZE_T irqflag = 0;
    static HI_BOOL bLastDISP0Attached = HI_FALSE;
    HI_BOOL bIntfAttached = HI_FALSE;

    if (HI_TRUE == g_bVDPIsogenyBypass)
    {
        return;
    }

    XDP_ISOGENY_INFO("call ISOGENY_QueueFrameProcess\n");

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);
    if ((HI_TRUE == stIsogenyInfo.bCloseIsogeny) || (ISOGBNY_BUFFER_STATUS_INIT != stIsogenyInfo.enIsogenyBuffStatus))
    {
        goto _ISOGENY_COLSED_EXIT;
    }

    stIsogenyInfo.stWBC0Cfg.bWbcEnable = HI_TRUE;
    /*config WBC0, and get free Buffer */
    if ( HI_FALSE == ISOGENY_GetHDWinEnable())
    {
        XDP_ISOGENY_INFO("QstIsogenyInfo.stSlaveCfg.bEnable is 0\n");
        stIsogenyInfo.stSlaveCfg.bEnable = HI_FALSE;
        stIsogenyInfo.stWBC0Cfg.bWbcEnable = HI_FALSE;
        stIsogenyInfo.stSlaveCfg.u32ReCfgCount = 0;
        goto _ISOGENY_COLSED_EXIT;
    }

    nRet = ISOGBNY_ConfigWbc_QFrame(&stIsogenyInfo.stWBC0Cfg);
    if (HI_SUCCESS != nRet  )
    {
        stIsogenyInfo.stWBCInfo.u32WBCFailCount++;
        WIN_ERROR("ISOGBNY_ConfigWbc_QFrame failed, ret(%d)\n", nRet);
        goto _ISOGENY_EXIT;
    }

    stIsogenyInfo.stWBCInfo.u32WBCQFrameCfgCount++;

_ISOGENY_EXIT:

    ISOGENY_CleanHDWinFrameInfo();
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;

_ISOGENY_COLSED_EXIT:
    stIsogenyInfo.stWBCInfo.u32WBCDisardCount++;
    (HI_VOID)ISOGBNY_ConfigWbc_QFrame(&stIsogenyInfo.stWBC0Cfg);
    ISOGENY_CleanHDWinFrameInfo();

    /* Check VDAC attach status, if closed and changed, Close Isogeny in low power */
    bIntfAttached = DISP_CheckIntfAttached(HI_DRV_DISPLAY_0);
    if (!bIntfAttached && (bLastDISP0Attached != bIntfAttached))
    {
        bLastDISP0Attached = bIntfAttached;
        (HI_VOID)LowPower_CloseIsogeny();
    }

    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;
}


HI_VOID ISR_CallbackForWbc0Finish(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_S32 nRet;

    stIsogenyInfo.stWBCInfo.u32WBCFinishISRCount++;

    if (HI_TRUE == g_bVDPIsogenyBypass)
    {
        stIsogenyInfo.stWBCInfo.u32WBCDisardCount++;
        return;
    }

    XDP_ISOGENY_INFO("call ISR_CallbackForWbc0Finish\n");

    if ((HI_TRUE == stIsogenyInfo.bCloseIsogeny) || (ISOGBNY_BUFFER_STATUS_INIT != stIsogenyInfo.enIsogenyBuffStatus ))
    {
        stIsogenyInfo.stWBCInfo.u32WBCDisardCount++;
        return;
    }

    if (HI_NULL == stIsogenyInfo.pstWC0WBCNode)
    {
//        stIsogenyInfo.stWBCInfo.u32WBCDisardCount++;
        return;
    }

    if (ISOGBNY_NODE_STATUS_WBCING != stIsogenyInfo.pstWC0WBCNode->u32State)
    {
        WIN_ERROR("Node is not wbcing : %p state %d\n", stIsogenyInfo.pstWC0WBCNode, stIsogenyInfo.pstWC0WBCNode->u32State);
    }

    XDP_ISOGENY_3FRAME_INFO("(%lu)add full %p\n", jiffies, stIsogenyInfo.pstWC0WBCNode);
    stIsogenyInfo.pstWC0WBCNode->u32State = ISOGBNY_NODE_STATUS_WBCDONE;
    nRet = DispBuf_AddFullNode(&stIsogenyInfo.stBuffer, stIsogenyInfo.pstWC0WBCNode);
    DISP_ASSERT(nRet == HI_SUCCESS);
    stIsogenyInfo.stSlaveCfg.bEnable = HI_TRUE;

    stIsogenyInfo.pstWC0WBCNode = HI_NULL;
    if (ISOGBNY_BUF_SINGL_NUM != ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
    {
        stIsogenyInfo.pstWC0WBCNode = stIsogenyInfo.pstWC0CfgNode;
    }

    stIsogenyInfo.pstWC0CfgNode = HI_NULL;
    stIsogenyInfo.stWBCInfo.u32WBCFinishSucCount++;

    return ;
}

HI_VOID ISR_CallbackIsogenyProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    WBC_HD_WIN_INFOR_S stWnHDFrameInfor;
    HI_S32 nRet;
    DISP_BUF_NODE_S *pstNode = HI_NULL;
    HI_DISP_DISPLAY_INFO_S stHdDispInfo;
    HI_DISP_DISPLAY_INFO_S stSdDispInfo;
    HI_DRV_VIDEO_FRAME_S  *psCfgtFrame = HI_NULL ;
    ISOGBNY_BUFFER_MODE_E enIsogenyBuffMode = ISOGBNY_BUFFER_MODE_BUTT;
    HI_SIZE_T irqflag = 0;
    static HI_BOOL bLastDISP0Attached = HI_FALSE;
    HI_BOOL bIntfAttached = HI_FALSE;

    if (HI_TRUE == g_bVDPIsogenyBypass)
    {
        return;
    }

    memset((HI_VOID *)&stHdDispInfo, 0, sizeof(HI_DISP_DISPLAY_INFO_S));
    memset((HI_VOID *)&stSdDispInfo, 0, sizeof(HI_DISP_DISPLAY_INFO_S));

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);

    stIsogenyInfo.stWBCInfo.u32WBCISRCfgTryCount++;
#if 0
    /* Check VDAC attach status, if opened and changed, Open Isogeny in low power */
    bIntfAttached = DISP_CheckIntfAttached(HI_DRV_DISPLAY_0);
    if (bLastDISP0Attached != bIntfAttached)
    {
        if (bIntfAttached)
        {
            bLastDISP0Attached = bIntfAttached;
            (HI_VOID)LowPower_OpenIsogeny();

            /* If process is in the ISOGBNY_ThreadProcess, skip bCloseIsogeny operation*/
            if (!stIsogenyInfo.stIsogenyThread.bChangeProcess)
            {
                stIsogenyInfo.bCloseIsogeny = HI_FALSE;
            }
        }
        else
        {
            stIsogenyInfo.bCloseIsogeny = HI_TRUE;
        }
    }
#endif
    if ((HI_TRUE == stIsogenyInfo.bCloseIsogeny) || (ISOGBNY_BUFFER_STATUS_INIT != stIsogenyInfo.enIsogenyBuffStatus  ))
    {
        XDP_ISOGENY_INFO("stIsogenyInfo.bCloseIsogeny stIsogenyInfo.enIsogenyBuffStatus %d %d\n",
                         stIsogenyInfo.bCloseIsogeny,
                         stIsogenyInfo.enIsogenyBuffStatus
                        );
        goto _ISOGENY_COLSED_EXIT;
    }

    ISOGENY_GetHDWinFrameInfo(&stWnHDFrameInfor);
    (HI_VOID) DISP_GetDisplayInfo(HI_DRV_DISPLAY_0, &stSdDispInfo);
    (HI_VOID) DISP_GetDisplayInfo(HI_DRV_DISPLAY_1, &stHdDispInfo);

    /*judge mode*/
    enIsogenyBuffMode = ISOGENY_JudgeBufferMode(&stHdDispInfo, &stSdDispInfo, stWnHDFrameInfor.bV0Secure, stWnHDFrameInfor.bV1Secure);

    if ( enIsogenyBuffMode != stIsogenyInfo.enIsogenyBuffMode )
    {
        XDP_ISOGENY_INFO("enIsogenyBuffMode != stIsogenyInfo.enIsogenyBuffMode %d %d\n",
                         enIsogenyBuffMode,
                         stIsogenyInfo.enIsogenyBuffMode
                        );
        /*wake up ISOgeny thread !*/
        stIsogenyInfo.stIsogenyThread.enIsogenyBuffMode = enIsogenyBuffMode;
        stIsogenyInfo.bCloseIsogeny = HI_TRUE;
        stIsogenyInfo.stIsogenyThread.bChangeProcess = HI_TRUE;
        //debug_print("from %d  change to %d.\n",stIsogenyInfo.enIsogenyBuffMode,enIsogenyBuffMode);
        wake_up(&stIsogenyInfo.stIsogenyThread.stWaitQueHead);
        goto _ISOGENY_COLSED_EXIT;
    }

    /*config WBC0, and get free Buffer */
    if ((HI_FALSE == ISOGENY_GetHDWinEnable()) || (HI_FALSE == stIsogenyInfo.stWBC0Cfg.bWbcEnable))
    {
        XDP_ISOGENY_INFO("ISRstIsogenyInfo.stSlaveCfg.bEnable is 0\n");
        stIsogenyInfo.stSlaveCfg.bEnable = HI_FALSE;
        stIsogenyInfo.stSlaveCfg.u32ReCfgCount = 0;
        goto _ISOGENY_COLSED_EXIT;
    }

    if (HI_NULL != stIsogenyInfo.pstWC0CfgNode)
    {
        if (ISOGBNY_BUF_SINGL_NUM == ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
        {
            stIsogenyInfo.pstWC0CfgNode->u32State = ISOGBNY_NODE_STATUS_FREE;
            nRet = DispBuf_AddEmptyNode_NoReset(&stIsogenyInfo.stBuffer, stIsogenyInfo.pstWC0CfgNode);
            DISP_ASSERT(nRet == HI_SUCCESS);
            stIsogenyInfo.pstWC0WBCNode = HI_NULL;
        }
        else
        {
            if (HI_NULL != stIsogenyInfo.pstWC0WBCNode)
            {
                stIsogenyInfo.pstWC0WBCNode->u32State = ISOGBNY_NODE_STATUS_FREE;
                nRet = DispBuf_AddEmptyNode_NoReset(&stIsogenyInfo.stBuffer, stIsogenyInfo.pstWC0WBCNode);
                DISP_ASSERT(nRet == HI_SUCCESS);
            }

            stIsogenyInfo.pstWC0WBCNode = stIsogenyInfo.pstWC0CfgNode;

        }
        stIsogenyInfo.pstWC0CfgNode = HI_NULL;
    }

    nRet = DispBuf_GetEmptyNode(&stIsogenyInfo.stBuffer, &pstNode);
    if (nRet != HI_SUCCESS)
    {
        goto _ISOGENY_EXIT;
    }
    nRet = DispBuf_DelEmptyNode(&stIsogenyInfo.stBuffer, pstNode);

    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("DispBuf_DelEmptyNode failed, ID=0x%x\n", pstNode->u32ID);
        goto _ISOGENY_EXIT;
    }

    if (HI_NULL == pstNode)
    {
        WIN_ERROR("HI_NULL == pstNode\n");
        goto _ISOGENY_COLSED_EXIT;
    }

    if (ISOGBNY_NODE_STATUS_FREE != pstNode->u32State)
    {
        WIN_ERROR("Node is not free : %p state %d\n", pstNode, pstNode->u32State);
    }

    psCfgtFrame = (HI_DRV_VIDEO_FRAME_S *) & (pstNode->u32Data);

    XDP_ISOGENY_3FRAME_INFO("(%lu)Get empty %p yaddr %#x\n", jiffies, pstNode, psCfgtFrame->stBufAddr[0].u32PhyAddr_Y);

    nRet = ISOGBNY_ConfigWbc_V0ISR(&stIsogenyInfo.stWBC0Cfg, psCfgtFrame);
    if (HI_SUCCESS != nRet  )
    {
        WIN_ERROR("ISOGBNY_ConfigWbc_QFrame failed, ret(%d)\n", nRet);

        nRet = DispBuf_AddEmptyNode_NoReset(&stIsogenyInfo.stBuffer, pstNode);
        if (HI_SUCCESS != nRet  )
        {
            WIN_ERROR("add  node to empty err, ret(%d)\n", nRet);
        }

        goto _ISOGENY_EXIT;
    }

    pstNode->u32State = ISOGBNY_NODE_STATUS_WBCING;

    stIsogenyInfo.pstWC0CfgNode = pstNode;
    XDP_ISOGENY_INFO("Create WBC Finish Int !\n");

    if (ISOGBNY_BUF_SINGL_NUM == ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
    {
        stIsogenyInfo.pstWC0WBCNode = stIsogenyInfo.pstWC0CfgNode;
        ISR_CallbackForWbc0Finish(HI_NULL, HI_NULL);
    }

    stIsogenyInfo.stWBCInfo.u32WBCISRCfgOKCount++;

_ISOGENY_EXIT:

    ISOGENY_CleanHDWinFrameInfo();
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;

_ISOGENY_COLSED_EXIT:
    (HI_VOID)ISOGBNY_ConfigWbc_V0ISR(&stIsogenyInfo.stWBC0Cfg, HI_NULL);
    ISOGENY_CleanHDWinFrameInfo();

    /* Check VDAC attach status, if closed and changed, Close Isogeny in low power */
    bIntfAttached = DISP_CheckIntfAttached(HI_DRV_DISPLAY_0);
    if (!bIntfAttached && (bLastDISP0Attached != bIntfAttached))
    {
        bLastDISP0Attached = bIntfAttached;
        (HI_VOID)LowPower_CloseIsogeny();
    }

    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;

}

DISP_BUF_NODE_S *ISOGBNY_SlaveGetCfgNode( DISP_BUF_S *pstBuffer, ISOGBNY_SLAVE_CFG_S *pstSlaveCfg)
{
    HI_S32 nRet;
    DISP_BUF_NODE_S *pstCfgNode;
    DISP_BUF_NODE_S *pstNextCfgNode;


    nRet = DispBuf_GetFullNode(pstBuffer, &pstCfgNode);

    if (nRet != HI_SUCCESS)
    {
        return HI_NULL;
    }

    /*up data*/
    nRet = DispBuf_DelFullNode(pstBuffer, pstCfgNode);

    if (nRet != HI_SUCCESS)
    {
        WIN_INFO("DelFullNode err(%d).\n", nRet);
        return HI_NULL;
    }

    /*get newer*/
    nRet = DispBuf_GetFullNode(pstBuffer, &pstNextCfgNode);

    if (nRet != HI_SUCCESS)
    {
        return pstCfgNode;
    }

    nRet = DispBuf_DelFullNode(pstBuffer, pstNextCfgNode);

    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("DelFullNode err(%d).\n", nRet);
        return pstCfgNode;
    }

    nRet = ISOGBNY_ReleaseNode(pstBuffer, pstCfgNode);

    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("ReleaseNode err(%d).\n", nRet);
        return pstNextCfgNode;
    }

    pstSlaveCfg->u32DisardCount++;

    return pstNextCfgNode;

}


HI_VOID ISOGBNY_SlaveNoFrameCfg( ISOGBNY_SLAVE_CFG_S *pstSlaveCfg, DISP_BUF_NODE_S *pstNewNode)
{

    if ( HI_NULL == pstNewNode)
    {
        pstSlaveCfg->pstDispNode = HI_NULL;
        pstSlaveCfg->pstCurrentNode = HI_NULL;
        pstSlaveCfg->pstNextNode = HI_NULL;
    }
    else
    {
        pstSlaveCfg->pstDispNode = HI_NULL;
        pstSlaveCfg->pstCurrentNode = pstNewNode;
        pstSlaveCfg->pstNextNode = HI_NULL;
    }

}


HI_VOID ISOGBNY_SlaveNormalCfg( ISOGBNY_SLAVE_CFG_S *pstSlaveCfg, DISP_BUF_NODE_S *pstNewNode)
{
    HI_S32 nRet;

    XDP_ISOGENY_3FRAME_INFO("(%lu)release %p\n", jiffies, pstSlaveCfg->pstDispNode);
    nRet = ISOGBNY_ReleaseNode(&stIsogenyInfo.stBuffer, pstSlaveCfg->pstDispNode);

    if (nRet != HI_SUCCESS)
    {
        WIN_ERROR("ISOGBNY_ReleaseNode err(%d).\n", nRet);
        return ;
    }

    if ( HI_NULL == pstNewNode)
    {
        if ( HI_NULL == pstSlaveCfg->pstNextNode)
        {
            pstSlaveCfg->pstDispNode = HI_NULL;
            pstSlaveCfg->pstNextNode = HI_NULL;
        }
        else
        {
            pstSlaveCfg->pstDispNode = pstSlaveCfg->pstCurrentNode;
            pstSlaveCfg->pstCurrentNode = pstSlaveCfg->pstNextNode;
            pstSlaveCfg->pstNextNode = HI_NULL;
        }
    }
    else
    {
        if ( HI_NULL == pstSlaveCfg->pstNextNode)
        {
            pstSlaveCfg->pstDispNode = pstSlaveCfg->pstCurrentNode;
            pstSlaveCfg->pstCurrentNode = pstNewNode;
            pstSlaveCfg->pstNextNode = HI_NULL;
        }
        else
        {
            pstSlaveCfg->pstDispNode = pstSlaveCfg->pstCurrentNode;
            pstSlaveCfg->pstCurrentNode = pstSlaveCfg->pstNextNode;
            pstSlaveCfg->pstNextNode = pstNewNode;
        }
    }
}


HI_VOID  ISOGBNY_SlaveOneFrameCfg( ISOGBNY_SLAVE_CFG_S *pstSlaveCfg, DISP_BUF_NODE_S *pstNewNode)
{

    if ( HI_NULL == pstNewNode)
    {
        pstSlaveCfg->pstDispNode = HI_NULL;
        pstSlaveCfg->pstNextNode = HI_NULL;
        pstSlaveCfg->u32RepeatCount++;
    }
    else
    {
        pstSlaveCfg->pstDispNode = pstSlaveCfg->pstCurrentNode;
        pstSlaveCfg->pstCurrentNode = pstNewNode;
        pstSlaveCfg->pstNextNode = HI_NULL;
    }
}

HI_VOID  ISOGBNY_SlaveSingleCfg( ISOGBNY_SLAVE_CFG_S *pstSlaveCfg, DISP_BUF_NODE_S *pstNewNode)
{
    // HI_S32 nRet;
#if 1
    if ( HI_NULL == pstNewNode)
    {
        pstSlaveCfg->pstDispNode = HI_NULL;
        pstSlaveCfg->pstNextNode = HI_NULL;
        pstSlaveCfg->u32RepeatCount++;
    }
    else
#endif
    {
#if 0
        if ( HI_NULL != pstSlaveCfg->pstDispNode)
        {
            nRet = ISOGBNY_ReleaseNode(&stIsogenyInfo.stBuffer, pstSlaveCfg->pstDispNode);

            if (nRet != HI_SUCCESS)
            {
                return ;
            }
        }

        if (HI_NULL != pstSlaveCfg->pstCurrentNode)
        {
            nRet = ISOGBNY_ReleaseNode(&stIsogenyInfo.stBuffer, pstSlaveCfg->pstCurrentNode);

            if (nRet != HI_SUCCESS)
            {
                return ;
            }
        }
#endif
        pstSlaveCfg->pstDispNode = HI_NULL;
        pstSlaveCfg->pstCurrentNode = pstNewNode;
        pstSlaveCfg->pstNextNode = HI_NULL;
    }

}




HI_VOID ISR_CallbackForSlaveProcess(HI_VOID *hDst, const HI_DRV_DISP_CALLBACK_INFO_S *pstInfo)
{
    HI_DRV_VIDEO_FRAME_S *pstDispFrame = HI_NULL;
    DISP_BUF_NODE_S *pstNeWNode = HI_NULL;
    ISOGBNY_SLAVE_CFG_S *pstSlaveCfg = HI_NULL;
    HI_SIZE_T irqflag = 0;

    if (HI_TRUE == g_bVDPIsogenyBypass)
    {
        return;
    }

    spin_lock_irqsave(&g_threadIsr_Lock, irqflag);

    /* put config frame to buffer list */
    if ((HI_TRUE == stIsogenyInfo.bCloseIsogeny) || (ISOGBNY_BUFFER_STATUS_INIT != stIsogenyInfo.enIsogenyBuffStatus ))
    {
        XDP_ISOGENY_INFO("NULL SLAVE  %d %d\n", stIsogenyInfo.bCloseIsogeny, stIsogenyInfo.enIsogenyBuffStatus);
        ISR_SlaveWinConfigFrame(HI_NULL, pstInfo);
        goto ISR_CallbackForSlaveProcess_EXIT;
    }

    pstSlaveCfg = &stIsogenyInfo.stSlaveCfg;
    pstSlaveCfg->u32ISRCount++;

    if (HI_FALSE == pstSlaveCfg->bEnable)
    {
        XDP_ISOGENY_INFO("NULL SLAVE not enable\n");
        ISR_SlaveWinConfigFrame(HI_NULL, pstInfo);
        goto ISR_CallbackForSlaveProcess_EXIT;
    }

    pstNeWNode = ISOGBNY_SlaveGetCfgNode(&stIsogenyInfo.stBuffer, pstSlaveCfg);
    pstSlaveCfg->u3ToDispCount++;
    if ( HI_NULL != pstNeWNode)
    {
        XDP_ISOGENY_INFO("u32RecCount add to %d\n", pstSlaveCfg->u32RecCount);
        pstSlaveCfg->u32ReCfgCount++;

        if (ISOGBNY_NODE_STATUS_WBCDONE != pstNeWNode->u32State)
        {
            WIN_ERROR("Node is not wbcdone : %p state %d\n", pstNeWNode, pstNeWNode->u32State);
        }

        pstNeWNode->u32State = ISOGBNY_NODE_STATUS_DISP;
    }

    XDP_ISOGENY_3FRAME_INFO("(%lu)Get for slave %p\n", jiffies, pstNeWNode);

    if (ISOGBNY_BUF_SINGL_NUM == ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
    {
        /*signle buff mode */
        if (HI_NULL == pstSlaveCfg->pstCurrentNode)
        {
            /*last cfg  has no frame*/
            ISOGBNY_SlaveNoFrameCfg(pstSlaveCfg, pstNeWNode);
        }
        else
        {
            ISOGBNY_SlaveSingleCfg(pstSlaveCfg, pstNeWNode);
        }

        (HI_VOID)ISOGBNY_ReleaseNode(&stIsogenyInfo.stBuffer, pstNeWNode);
    }
    else
    {
        if (HI_NULL == pstSlaveCfg->pstCurrentNode)
        {
            /*last cfg  has no frame*/
            ISOGBNY_SlaveNoFrameCfg(pstSlaveCfg, pstNeWNode);
        }
        else if (HI_NULL == pstSlaveCfg->pstDispNode)
        {
            /*last cfg has 1 frame*/
            ISOGBNY_SlaveOneFrameCfg(pstSlaveCfg, pstNeWNode);
        }
        else
        {
            /*last cfg has more than 2 frame*/
            ISOGBNY_SlaveNormalCfg(pstSlaveCfg, pstNeWNode);
        }
    }

    if ( HI_NULL != pstSlaveCfg->pstCurrentNode)
    {
        if (ISOGBNY_BUF_SINGL_NUM != ISOGBNY_GetBuffNum(stIsogenyInfo.enIsogenyBuffMode))
        {
            if (ISOGBNY_NODE_STATUS_DISP != pstSlaveCfg->pstCurrentNode->u32State)
            {
                WIN_ERROR("Node is not disping : %p state %d\n", pstSlaveCfg->pstCurrentNode, pstSlaveCfg->pstCurrentNode->u32State);
            }
        }
        pstDispFrame = (HI_DRV_VIDEO_FRAME_S *) & (pstSlaveCfg->pstCurrentNode->u32Data[0]);
    }
    else
    {
        pstDispFrame = HI_NULL;
    }
    if (pstSlaveCfg->u32ReCfgCount < 3)
    {
        pstDispFrame = HI_NULL;
    }
    XDP_ISOGENY_3FRAME_INFO("(%lu)disp %p cur %p nx %p\n",
                            jiffies,
                            pstSlaveCfg->pstDispNode,
                            pstSlaveCfg->pstCurrentNode,
                            pstSlaveCfg->pstNextNode
                           );

    ISR_SlaveWinConfigFrame(pstDispFrame, pstInfo);

ISR_CallbackForSlaveProcess_EXIT:
    spin_unlock_irqrestore(&g_threadIsr_Lock, irqflag);
    return ;

}


HI_VOID WIN_GetIsogenyPocInfor(ISOGBNY_PROC_INFO_S *pstIsogenyProcInfo)
{
    pstIsogenyProcInfo->bChangeStatus = stIsogenyInfo.bCloseIsogeny;
    pstIsogenyProcInfo->bIsogbnyInit = stIsogenyInfo.bIsogenyInit;
    pstIsogenyProcInfo->enIsogenyBuffStatus = stIsogenyInfo.enIsogenyBuffStatus;
    pstIsogenyProcInfo->enIsogenyBuffMode = stIsogenyInfo.enIsogenyBuffMode;
    pstIsogenyProcInfo->enWBCForcePoint = stIsogenyInfo.enWBCForcePoint;
    pstIsogenyProcInfo->enWBForceField = stIsogenyInfo.enWBForceField;

    pstIsogenyProcInfo->pstBuffer = &stIsogenyInfo.stBuffer;

    pstIsogenyProcInfo->stWBC0ProcInfo = stIsogenyInfo.stWBCInfo;
    pstIsogenyProcInfo->stWBC0ProcInfo.bEnable = stIsogenyInfo.stWBC0Cfg.bWbcEnable;
    pstIsogenyProcInfo->stWBC0ProcInfo.eInPutPixelFmt = stIsogenyInfo.stWBC0Cfg.eInPutPixelFmt;
    pstIsogenyProcInfo->stWBC0ProcInfo.eOutPutPixelFmt = stIsogenyInfo.stWBC0Cfg.eOutPutPixelFmt;
    pstIsogenyProcInfo->stWBC0ProcInfo.enHdWinSrcColorSpace = stIsogenyInfo.stWBC0Cfg.enHdWinSrcColorSpace;
    pstIsogenyProcInfo->stWBC0ProcInfo.enHdWinDestColorSpace = stIsogenyInfo.stWBC0Cfg.enHdWinDestColorSpace;
    pstIsogenyProcInfo->stWBC0ProcInfo.stHdWinInputRect = stIsogenyInfo.stWBC0Cfg.stHdWinInputSize;
    pstIsogenyProcInfo->stWBC0ProcInfo.stHdWinOutRect = stIsogenyInfo.stWBC0Cfg.stHdWinOutputSize;
    pstIsogenyProcInfo->stWBC0ProcInfo.stSdWinVideoRect = stIsogenyInfo.stWBC0Cfg.stSdWinVideoRect;
    pstIsogenyProcInfo->stWBC0ProcInfo.stSdWinOutRect = stIsogenyInfo.stWBC0Cfg.stSdWinOutRect;

    pstIsogenyProcInfo->stSlaveProcInfo.bEnable = stIsogenyInfo.stSlaveCfg.bEnable;
    pstIsogenyProcInfo->stSlaveProcInfo.pstSlaveCurrentNode = stIsogenyInfo.stSlaveCfg.pstCurrentNode;
    pstIsogenyProcInfo->stSlaveProcInfo.pstSlaveDispNode = stIsogenyInfo.stSlaveCfg.pstDispNode;
    pstIsogenyProcInfo->stSlaveProcInfo.pstSlaveNextNode = stIsogenyInfo.stSlaveCfg.pstNextNode;

    if (HI_NULL != stIsogenyInfo.stSlaveCfg.pstCurrentNode)
    {
        pstIsogenyProcInfo->stSlaveProcInfo.pstSlaveCfgFrame = (HI_DRV_VIDEO_FRAME_S *)&stIsogenyInfo.stSlaveCfg.pstCurrentNode->u32Data;
    }

    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveISRCount = stIsogenyInfo.stSlaveCfg.u32ISRCount;
    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveToDispCount = stIsogenyInfo.stSlaveCfg.u3ToDispCount;
    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveReCfgCount = stIsogenyInfo.stSlaveCfg.u32ReCfgCount;
    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveDisardCount = stIsogenyInfo.stSlaveCfg.u32DisardCount;
    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveRepeatCount = stIsogenyInfo.stSlaveCfg.u32RepeatCount;
    pstIsogenyProcInfo->stSlaveProcInfo.u32SlaveReleaseCount = stIsogenyInfo.stSlaveCfg.u32ReleaseCount;

    return ;
}



/***************************************************************/

extern HI_U8 *g_pVDPColorSpaceString[HI_DRV_CS_BUTT];
extern HI_U8 *g_pWinTrueString[2];
extern HI_U8 *g_pWinFrameTypetring[HI_DRV_FT_BUTT];
extern HI_U8 *g_pWinAspectCvrsString[HI_DRV_ASP_RAT_MODE_BUTT] ;
extern HI_U8 *g_pWinFieldTypeString[HI_DRV_FIELD_BUTT + 1];
extern HI_U8 *g_pWinYNString[2];
extern HI_U8 *g_pWinFieldModeString[HI_DRV_FIELD_BUTT + 1];


HI_S32 ISOGENY_ProcRead(struct seq_file *p, HI_VOID *v)
{

#if 1

    HI_DRV_VIDEO_FRAME_S *pstNewFrame;
    HI_DRV_VIDEO_PRIVATE_S *pstPriv;
    //    HI_U32 i;
    ISOGBNY_PROC_INFO_S stIsogenyProcInfo;
    memset(&stIsogenyProcInfo, 0, sizeof(stIsogenyProcInfo));

    if (HI_NULL == p)
    {
        WIN_ERROR("Para p is null.\n");
        return HI_ERR_VO_NULL_PTR;
    }

    WIN_GetIsogenyPocInfor(&stIsogenyProcInfo);

    PROC_PRINT(p, "-----------------Isogeny  bypass state--------------------------------|\n");
    PROC_PRINT(p, "state: %s\n", (HI_FALSE == g_bVDPIsogenyBypass) ? "work normal" : "bypass");

    PROC_PRINT(p, "-----------------Isogeny  frame--------------------------------|\n");
    if (HI_TRUE != stIsogenyProcInfo.bIsogbnyInit)
    {
        PROC_PRINT(p, "change mode \n");
        return HI_ERR_VO_NOT_EXIST;
    }

    pstNewFrame = stIsogenyProcInfo.stSlaveProcInfo.pstSlaveCfgFrame;
    if (pstNewFrame)
    {
        if (pstNewFrame->enFieldMode > HI_DRV_FIELD_BUTT)
        {
            WIN_ERROR("enFieldMode out of range.\n");
            return HI_ERR_VO_INVALID_PARA;
        }

        pstPriv     = (HI_DRV_VIDEO_PRIVATE_S *)(&pstNewFrame->u32Priv[0]);
        PROC_PRINT(p, "%-19s:%-20s\n",  "wbc field", g_pWinFieldTypeString[pstNewFrame->enFieldMode]);
        PROC_PRINT(p, "%-19s:0x%x\n", "|FrameIndex",  pstNewFrame->u32FrameIndex);
        PROC_PRINT(p, "%-19s:0x%x/0x%x\n", "|SrcPTS/PTS",  pstNewFrame->u32SrcPts, pstNewFrame->u32Pts);
        PROC_PRINT(p, "%-19s:%d\n", "|PlayTime", pstPriv->u32PlayTime);
        PROC_PRINT(p, "%-19s:%-20s\n", "|FieldMode", g_pWinFieldModeString[pstNewFrame->enFieldMode]);
        PROC_PRINT(p, "%-19s:%d\n", "|Fidelity", pstPriv->u32Fidelity);
        PROC_PRINT(p, "%-19s:0x%x/0x%x\n", "|H8:YAddr/YStride", pstNewFrame->stBufAddr[0].u32PhyAddr_Y, pstNewFrame->stBufAddr[0].u32Stride_Y);
        PROC_PRINT(p, "%-19s:0x%x/0x%x\n", "|H8:CAddr/CStride", pstNewFrame->stBufAddr[0].u32PhyAddr_C, pstNewFrame->stBufAddr[0].u32Stride_C);
        PROC_PRINT(p, "%-19s:0x%x/0x%x\n", "|L2:YAddr/YStride", pstNewFrame->stBufAddr_LB[0].u32PhyAddr_Y, pstNewFrame->stBufAddr_LB[0].u32Stride_Y);
        PROC_PRINT(p, "%-19s:0x%x/0x%x\n", "|L2:CAddr/CStride", pstNewFrame->stBufAddr_LB[0].u32PhyAddr_C, pstNewFrame->stBufAddr_LB[0].u32Stride_C);
        PROC_PRINT(p, "%-19s:%-20d\n", "Secure", pstNewFrame->bSecure);
    }

    PROC_PRINT(p, "-----------------Isogeny  infor--------------------------------|\n");
    PROC_PRINT(p, "%-19s:%-20d\n",  "wbc enable", stIsogenyProcInfo.stWBC0ProcInfo.bEnable);
    PROC_PRINT(p, "%-19s:%-20d\n",  "wbc point", stIsogenyProcInfo.enWBCForcePoint);
    PROC_PRINT(p, "%-19s:%-20d\n",  "enIsogenyBuffMode", stIsogenyProcInfo.enIsogenyBuffMode);
    PROC_PRINT(p, "%-19s:%-20d\n",  "enIsogenyBuffStatus", stIsogenyProcInfo.enIsogenyBuffStatus);
    PROC_PRINT(p, "%-19s:%-20d\n",  "enWBForceField:", stIsogenyProcInfo.enWBForceField);


    PROC_PRINT(p, "%-19s:%-20d\n",  "InputPixFmt", stIsogenyProcInfo.stWBC0ProcInfo.eInPutPixelFmt);
    PROC_PRINT(p, "%-19s:%-20d\n",  "OutputPixFmt", stIsogenyProcInfo.stWBC0ProcInfo.eOutPutPixelFmt);
    PROC_PRINT(p, "%-19s:%-20d\n",  "HDWinSrcCSC", stIsogenyProcInfo.stWBC0ProcInfo.enHdWinSrcColorSpace);
    PROC_PRINT(p, "%-19s:%-20d\n",  "HDWinDstCSC", stIsogenyProcInfo.stWBC0ProcInfo.enHdWinDestColorSpace);
    PROC_PRINT(p, "HDInRect(xywh):     %d,%d,%d,%d\n", stIsogenyProcInfo.stWBC0ProcInfo.stHdWinInputRect.s32X,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinInputRect.s32Y,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinInputRect.s32Width,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinInputRect.s32Height
              );

    PROC_PRINT(p, "HDOutRect(xywh):    %d,%d,%d,%d\n", stIsogenyProcInfo.stWBC0ProcInfo.stHdWinOutRect.s32X,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinOutRect.s32Y,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinOutRect.s32Width,
               stIsogenyProcInfo.stWBC0ProcInfo.stHdWinOutRect.s32Height
              );

    PROC_PRINT(p, "SDVideoRect(xywh):  %d,%d,%d,%d\n", stIsogenyProcInfo.stWBC0ProcInfo.stSdWinVideoRect.s32X,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinVideoRect.s32Y,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinVideoRect.s32Width,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinVideoRect.s32Height
              );

    PROC_PRINT(p, "SDOutRect(xywh):    %d,%d,%d,%d\n", stIsogenyProcInfo.stWBC0ProcInfo.stSdWinOutRect.s32X,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinOutRect.s32Y,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinOutRect.s32Width,
               stIsogenyProcInfo.stWBC0ProcInfo.stSdWinOutRect.s32Height
              );

    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCQFrameCfgCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCQFrameCfgCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCISRCfgTryCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCISRCfgTryCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCISRCfgOkCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCISRCfgOKCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCFinishISRCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCFinishISRCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCFinishOkCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCFinishSucCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCDisardCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCDisardCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCFailCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCFailCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32WBCReInitCount", stIsogenyProcInfo.stWBC0ProcInfo.u32WBCReInitCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "Slave enable", stIsogenyProcInfo.stSlaveProcInfo.bEnable);

    if (HI_NULL != stIsogenyProcInfo.stSlaveProcInfo.pstSlaveNextNode)
    {
        PROC_PRINT(p, "%-19s:0x%-20x\n",    "SlaveNextNodeID",  stIsogenyProcInfo.stSlaveProcInfo.pstSlaveNextNode->u32ID);
    }
    else
    {
        PROC_PRINT(p, "%-19s:%-20s\n",  "SlaveNextNode", "Nothing");
    }

    if (HI_NULL != stIsogenyProcInfo.stSlaveProcInfo.pstSlaveCurrentNode)
    {
        PROC_PRINT(p, "%-19s:0x%-20x\n",    "SlaveCurrentNodeID",  stIsogenyProcInfo.stSlaveProcInfo.pstSlaveCurrentNode->u32ID);
        if (HI_NULL != stIsogenyProcInfo.stSlaveProcInfo.pstSlaveCfgFrame)
        {
            PROC_PRINT(p, "%-19s:%-20d\n",  "Config FrameIndx",  stIsogenyProcInfo.stSlaveProcInfo.pstSlaveCfgFrame->u32FrameIndex);
        }
    }
    else
    {
        PROC_PRINT(p, "%-19s:%-20s\n",  "SlaveCurrentNode", "Nothing");
    }

    if (HI_NULL != stIsogenyProcInfo.stSlaveProcInfo.pstSlaveDispNode)
    {
        PROC_PRINT(p, "%-19s:0x%-20x\n",    "SlaveDispNodeID",  stIsogenyProcInfo.stSlaveProcInfo.pstSlaveDispNode->u32ID);
    }
    else
    {
        PROC_PRINT(p, "%-19s:%-20s\n",  "SlaveDispNode", "Nothing");
    }


    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveISRCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveISRCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveDispCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveToDispCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveReCfgCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveReCfgCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveDisardCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveDisardCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveRepeatCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveRepeatCount);
    PROC_PRINT(p, "%-19s:%-20d\n",  "u32SlaveReleaseCount", stIsogenyProcInfo.stSlaveProcInfo.u32SlaveReleaseCount);
#if 0
    if (HI_NULL != stIsogenyProcInfo.pstBuffer)
    {
        for (i = 0; i < stIsogenyProcInfo.pstBuffer->u32Number;)
        {
            if (HI_NULL != stIsogenyProcInfo.pstBuffer->pstBufArray[i])
            {
                pstNewFrame = (HI_DRV_VIDEO_FRAME_S *) & (stIsogenyProcInfo.pstBuffer->pstBufArray[i]->u32Data);
                PROC_PRINT(p, "[%d,0x%x,%d,0x%x] ",
                           stIsogenyProcInfo.pstBuffer->pstBufArray[i]->u32ID,
                           stIsogenyProcInfo.pstBuffer->pstBufArray[i]->u32State,
                           pstNewFrame->u32FrameIndex,
                           pstNewFrame->stBufAddr[0].u32PhyAddr_Y);
            }

            i++;
            if ( (i % 4) == 0)
            {
                PROC_PRINT(p, "\n");
            }
        }
    }

    PROC_PRINT(p, "\n");


    PROC_PRINT(p, "Empty:read->%d,Write->%d \n", stIsogenyProcInfo.pstBuffer->u32EmptyReadPos, stIsogenyProcInfo.pstBuffer->u32EmptyWritePos);

    for (i = 0; i < stIsogenyProcInfo.pstBuffer->u32Number; i++)
    {
        PROC_PRINT(p, "[%d],", stIsogenyProcInfo.pstBuffer->u32EmptyArray[i]);

    }


    PROC_PRINT(p, "\n");


    PROC_PRINT(p, "Full:read->%d,Write->%d \n", stIsogenyProcInfo.pstBuffer->u32FullReaddPos, stIsogenyProcInfo.pstBuffer->u32FullWritePos);

    for (i = 0; i < stIsogenyProcInfo.pstBuffer->u32Number; i++)
    {
        PROC_PRINT(p, "[%d],", stIsogenyProcInfo.pstBuffer->u32FullArray[i]);

    }
#endif

    PROC_PRINT(p, "\n");
#endif
    return HI_SUCCESS;
}

HI_S32 ISOGENY_ProcWrite(struct file *file,
                         const char __user *buf, size_t count, loff_t *ppos)
{


    return count;

}

HI_S32 ISOGENY_AddToProc(HI_VOID)
{
    DRV_PROC_ITEM_S  *pProcItem;
    HI_CHAR           ProcName[12];
    HI_S32 s32Ret;

    s32Ret = HI_OSAL_Snprintf(ProcName, sizeof(ProcName), "isogeny");

    if (0 == s32Ret)
    {
        HI_ERR_WIN("HI_OSAL_Snprintf failed!\n");
        return HI_FAILURE;
    }

    pProcItem = HI_DRV_PROC_AddModule(ProcName, HI_NULL, HI_NULL);

    if (!pProcItem)
    {
        HI_ERR_WIN("Isogeny add proc failed!\n");
        return HI_ERR_VO_ADD_PROC_ERR;
    }

    pProcItem->data  = &stIsogenyInfo;
    pProcItem->read  = ISOGENY_ProcRead;
    pProcItem->write = ISOGENY_ProcWrite;

    return HI_SUCCESS;
}

HI_VOID ISOGENY_DelFromProc(HI_VOID)
{
    HI_CHAR           ProcName[12];
    HI_S32 s32Ret;

    s32Ret = HI_OSAL_Snprintf(ProcName, sizeof(ProcName), "isogeny");

    if (0 == s32Ret)
    {
        HI_ERR_WIN("HI_OSAL_Snprintf failed!\n");
        return;
    }

    HI_DRV_PROC_RemoveModule(ProcName);

    return ;
}


HI_S32 ISOGBNY_Init(HI_VOID)
{
    HI_S32 nRet;
    HI_DRV_DISP_CALLBACK_S stCB;
    HI_DRV_DISP_CALLBACK_S stCB1;

    memset(&stIsogenyInfo , 0x0, sizeof(ISOGBNY_CFG_INFOR_S));

    stIsogenyInfo.bCloseIsogeny = HI_FALSE;
    stIsogenyInfo.enIsogenyBuffMode = ISOGBNY_BUFFER_MODE_BUTT;
    stIsogenyInfo.enIsogenyBuffStatus = ISOGBNY_BUFFER_STATUS_DEINIT;

    stIsogenyInfo.enWBCForcePoint = WBC_WB_POINT_AUTO;
    stIsogenyInfo.enWBForceField = WBC_WB_FIELD_AUTO;

    nRet = ISOGBNY_CreatProcessThread();

    if (nRet)
    {
        WIN_ERROR("ISOGBNY Creat callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    if (VDP_NORMAL_STAGE == DRV_WIN_GetSftwareStage())
    {
        nRet = ISOGENY_AddToProc();
        if (nRet)
        {
            WIN_ERROR("ISOGENY AddToProc failed in %s!\n", __FUNCTION__);
            return HI_ERR_VO_CREATE_ERR;
        }
    }

    /*set default mode */
    stIsogenyInfo.bCloseIsogeny = HI_TRUE;
    if (HI_SUCCESS != ISOGBNY_FrameBuf_Init(ISOGBNY_BUFFER_MODE_SINGL_NONSEC))
    {
        WIN_ERROR("ISOGENY AddToProc failed in %s!\n", __FUNCTION__);
        return HI_ERR_VO_CREATE_ERR;
    }

    stCB.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_LOW;
    stCB.pfDISP_Callback = ISR_CallbackIsogenyProcess;
    nRet = DISP_RegCallback(HI_DRV_DISPLAY_1, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    stCB1.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB1.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_LOW;
    stCB1.pfDISP_Callback = ISR_CallbackForWbc0Finish;
    nRet = DISP_RegCallback(HI_DRV_DISPLAY_1, HI_DRV_DISP_C_VID_WBC, &stCB1);
    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    stCB.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB.pfDISP_Callback = ISR_CallbackForSlaveProcess;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;

    nRet = DISP_RegCallback(HI_DRV_DISPLAY_0, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return HI_ERR_VO_CREATE_ERR;
    }

    stIsogenyInfo.stWBC0Cfg.eFieldMode = HI_DRV_FIELD_TOP; //default will revise to follow interface(VID0)
    stIsogenyInfo.bCloseIsogeny = HI_FALSE;
    stIsogenyInfo.bIsogenyInit = HI_TRUE;
    stIsogenyInfo.stWBCInfo.u32WBCReInitCount = 0;
    return HI_SUCCESS;
}

HI_S32 ISOGBNY_DeInit(HI_VOID)
{
    HI_S32 nRet;
    HI_DRV_DISP_CALLBACK_S stCB;
    HI_DRV_DISP_CALLBACK_S stCB1;

    if (HI_FALSE == stIsogenyInfo.bIsogenyInit)
    {
        return HI_SUCCESS;
    }

    stIsogenyInfo.bIsogenyInit = HI_FALSE;
    stIsogenyInfo.bCloseIsogeny = HI_TRUE;
    stIsogenyInfo.enWBCForcePoint = WBC_WB_POINT_AUTO;
    stIsogenyInfo.enWBForceField = WBC_WB_FIELD_AUTO;

    msleep(50);
    nRet = ISOGBNY_DestroyProcessThread();

    if (nRet)
    {
        WIN_ERROR("ISOGBNY Creat callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    stIsogenyInfo.enIsogenyBuffMode = ISOGBNY_BUFFER_MODE_BUTT;

    /*register in hd, for configure the wbc.*/
    stCB.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_LOW;
    stCB.pfDISP_Callback = ISR_CallbackIsogenyProcess;

    nRet = DISP_UnRegCallback(HI_DRV_DISPLAY_1, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    stCB1.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB1.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_LOW;
    stCB1.pfDISP_Callback = ISR_CallbackForWbc0Finish;
    nRet = DISP_UnRegCallback(HI_DRV_DISPLAY_1, HI_DRV_DISP_C_VID_WBC, &stCB1);
    //nRet = DISP_UnRegCallback(HI_DRV_DISPLAY_1, HI_DRV_DISP_C_DHD0_WBC, &stCB1);


    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return nRet;
    }

    stCB1.hDst  = (HI_VOID *)(unsigned long)WIN_WBC_VP_HANDLE;
    stCB.pfDISP_Callback = ISR_CallbackForSlaveProcess;
    stCB.eCallBackPrior  =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
    nRet = DISP_UnRegCallback(HI_DRV_DISPLAY_0, HI_DRV_DISP_C_INTPOS_0_PERCENT, &stCB);

    if (nRet)
    {
        WIN_ERROR("ISOGENY register callback failed in %s!\n", __FUNCTION__);
        return HI_ERR_VO_CREATE_ERR;
    }

    if (VDP_NORMAL_STAGE == DRV_WIN_GetSftwareStage())
    {
        ISOGENY_DelFromProc();
    }

    if (ISOGBNY_BUFFER_STATUS_INIT == stIsogenyInfo.enIsogenyBuffStatus )
    {
        ISOGBNY_FrameBuf_DeInit();
    }

    memset(&stIsogenyInfo, 0x0, sizeof(stIsogenyInfo));

    return HI_SUCCESS;
}
#endif //#ifdef VDP_ISOGENY_SUPPORT
#endif //#ifndef __DISP_PLATFORM_BOOT__
