/******************************************************************************
  Copyright (C), 2001-2017, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_xdr_adapter.c
Version       : Initial Draft
Author        : Hisilicon multimedia software  group
Created       : 2017/05/26
Last Modified :sdk
Description   :
Function List :
History       :
******************************************************************************/
#include "drv_xdr_adapter.h"
#include "drv_pq_ext.h"
#include "drv_disp_xdr.h"
#include "drv_disp_bufcore.h"
#include "drv_disp_dolby.h"
#include "drv_disp_com.h"
#include "drv_win_share.h"
#include "hal_layerprocess.h"
#include "vdp_drv_wbc.h"
#include "drv_win_hal.h"

#include "vdp_hal_chn.h"
#include "vdp_drv_comm.h"

#ifdef CFG_HI3798CV200
#include "vdp_drv_hihdr.h"
#endif


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */


//==================extern function ================================
extern HI_BOOL  CheckFrameIs3D( HI_DRV_FRAME_TYPE_E  eFrmType);
extern HI_VOID GetSpecialLayerPriorty(HI_U32 u32layer_id, HI_U32 *pu32prio);

extern HI_VOID TransvertPixelFmt2CBB(HI_DRV_PIX_FORMAT_E *peInputPixelFmt, CBB_PIX_FORMAT_E  *peOutPixelFmt);
extern HI_S32  Internal_SelectTnrLocation(HI_PQ_ALGIP_SEL_E   enAlgIPSel);
extern HI_BOOL Internal_GetVidZmeOutFormatBasedOnP2IState(HI_U32 u32LayerNO, HI_BOOL bP2IOpen);
extern HI_S32 HAL_SetWbcParam(WIN_WBC_CONFIG_S *pstPara);

//=================transfer function for inner ==========================
HI_VOID JudgeCmpAndUvorderByPixFormat(HI_DRV_PIX_FORMAT_E ePixFormat,
                                      HI_BOOL  *pbUvorder,
                                      HI_BOOL  *pbCmpFmt,
                                      HI_BOOL  *pbLostCmp)
{
    /*since the cbb  has 3 params to describe:  cmp/uvorder/pixelfmt,  so we should
       * convert the enum value to the struct members.
       */
    if ((ePixFormat == HI_DRV_PIX_FMT_NV12)
        || (ePixFormat == HI_DRV_PIX_FMT_NV16_2X1)
        || (ePixFormat == HI_DRV_PIX_FMT_NV12_CMP))

    {
        *pbUvorder  = HI_TRUE;
    }
    else  if ((ePixFormat == HI_DRV_PIX_FMT_NV21)
              || (ePixFormat == HI_DRV_PIX_FMT_NV61_2X1)
              || (ePixFormat == HI_DRV_PIX_FMT_NV21_CMP)
              || (ePixFormat == HI_DRV_PIX_FMT_NV21_TILE)
              || (ePixFormat == HI_DRV_PIX_FMT_NV21_TILE_CMP))
    {
        *pbUvorder  = HI_FALSE;
    }
    else
    {
        *pbUvorder  = HI_FALSE;
    }


    /*since the cbb  has 3 params to describe:  cmp/uvorder/pixelfmt,  so we should
        *convert the enum value to the struct members.
        */

    if ((ePixFormat == HI_DRV_PIX_FMT_NV12_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV21_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV16_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV61_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV16_2X1_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV61_2X1_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV12_TILE_CMP)
        || (ePixFormat == HI_DRV_PIX_FMT_NV21_TILE_CMP))
    {
        /*should open dcmp function in video layer.*/
        *pbCmpFmt   = HI_TRUE;
        *pbLostCmp  = HI_FALSE;
    }
    else
    {
        /*not compressed fmt.*/
        *pbCmpFmt   = HI_FALSE;
        *pbLostCmp  = HI_FALSE;
    }

    return;
}



static HI_VOID ADAPTER_GetTnrDbDmInfo(WIN_INFO_S *pstWinInfo,
                                      HI_PQ_VDP_WBC_INFO_S *pstVdpLayerAlgInfor)
{
    HI_DRV_VIDEO_PRIVATE_S *pstPriv = HI_NULL;

    switch (pstWinInfo->pCurrentFrame->enBitWidth)
    {
        case HI_DRV_PIXEL_BITWIDTH_8BIT:
            pstVdpLayerAlgInfor->u32BitDepth = 8;
            break;
        case HI_DRV_PIXEL_BITWIDTH_10BIT:
            pstVdpLayerAlgInfor->u32BitDepth = 10;
            break;
        case HI_DRV_PIXEL_BITWIDTH_12BIT:
            pstVdpLayerAlgInfor->u32BitDepth = 12;
            break;
        case HI_DRV_PIXEL_BITWIDTH_BUTT:
        default:
            break;
    }

    pstVdpLayerAlgInfor->stOriCoordinate  = pstWinInfo->pCurrentFrame->stDispRect;
    pstVdpLayerAlgInfor->stCropCoordinate = pstWinInfo->stIn;

    pstVdpLayerAlgInfor->bCropBeforeDB = HI_TRUE;
    pstVdpLayerAlgInfor->u32SingleModeFlag = 1;
    pstVdpLayerAlgInfor->u32ImageStruct = 0;

    pstPriv = (HI_DRV_VIDEO_PRIVATE_S *)pstWinInfo->pCurrentFrame->u32Priv;

    pstVdpLayerAlgInfor->u32ImageAvgQP = pstPriv->stDNRInfo.u32ImageAvgQP;
    pstVdpLayerAlgInfor->u32VdhInfoAddr = pstPriv->stDNRInfo.u32VdhInfoAddr;
    pstVdpLayerAlgInfor->u32VdhInfoStride = pstPriv->stDNRInfo.u32VdhInfoStride;

#if 0 //430fpga
    pstVdpLayerAlgInfor->pstVdpWbcReg = (S_VPSSWB_REGS_TYPE *)pstWinInfo->stLayerAlgMmz.pu8StartVirAddr;
    pstVdpLayerAlgInfor->u32VdpWbcRegPhyAddr = pstWinInfo->stLayerAlgMmz.u32StartPhyAddr;
#endif

    pstVdpLayerAlgInfor->enVdecProtocol = HI_PQ_VDEC_PROTOCOL_H264;
    pstVdpLayerAlgInfor->enLayerId = pstWinInfo->u32LayerId;

    return;
}

HI_VOID ADAPTER_TransferAddrToHalAddr(HI_DRV_FRAME_TYPE_E eFrmType,
        HI_DRV_DISP_STEREO_E eDispMode,
        HI_BOOL       bRightEyeFirst,
        HI_BOOL       bDcmpEn,
        HI_DRV_VID_FRAME_ADDR_S *pstBufAddr,
        HI_DRV_VID_FRAME_ADDR_S *pstBufAddr_LB,
        VDP_ADDR_S          *pstAddr)
{
    HI_DRV_VID_FRAME_ADDR_S     stTmpBufAddr[HI_DRV_BUF_ADDR_MAX];
    HI_DRV_VID_FRAME_ADDR_S     stTmpBufAddr_LB[HI_DRV_BUF_ADDR_MAX];

    memset((HI_VOID *)&stTmpBufAddr[0], 0x0, sizeof(HI_DRV_VID_FRAME_ADDR_S) * HI_DRV_BUF_ADDR_MAX);
    memset((HI_VOID *)&stTmpBufAddr_LB[0], 0x0, sizeof(HI_DRV_VID_FRAME_ADDR_S) * HI_DRV_BUF_ADDR_MAX);

    if ( HI_TRUE == CheckFrameIs3D(eFrmType))
    {
        if (bRightEyeFirst)
        {
            stTmpBufAddr[0] = pstBufAddr[1];
            stTmpBufAddr_LB[0] = pstBufAddr_LB[1];
            stTmpBufAddr[1] = pstBufAddr[0];
            stTmpBufAddr_LB[1] = pstBufAddr_LB[0];
        }
        else
        {
            stTmpBufAddr[0] = pstBufAddr[0];
            stTmpBufAddr_LB[0] = pstBufAddr_LB[0];
            stTmpBufAddr[1] = pstBufAddr[1];
            stTmpBufAddr_LB[1] = pstBufAddr_LB[1];
        }
    }
    else
    {
        stTmpBufAddr[0] = pstBufAddr[0];
        stTmpBufAddr_LB[0] = pstBufAddr_LB[0];
    }

    pstAddr[VDP_ADDR_DATA].u32LumAddr = stTmpBufAddr[0].u32PhyAddr_Y;
    pstAddr[VDP_ADDR_DATA].u32ChmAddr = stTmpBufAddr[0].u32PhyAddr_C;
    pstAddr[VDP_ADDR_DATA].u32LumStr  = stTmpBufAddr[0].u32Stride_Y;
    pstAddr[VDP_ADDR_DATA].u32ChmStr  = stTmpBufAddr[0].u32Stride_C;

    if ( HI_TRUE == CheckFrameIs3D(eFrmType))
    {
        pstAddr[VDP_ADDR_3D].u32LumAddr = stTmpBufAddr[1].u32PhyAddr_Y;
        pstAddr[VDP_ADDR_3D].u32ChmAddr = stTmpBufAddr[1].u32PhyAddr_C;
        pstAddr[VDP_ADDR_3D].u32LumStr  = stTmpBufAddr[1].u32Stride_Y;
        pstAddr[VDP_ADDR_3D].u32ChmStr  = stTmpBufAddr[1].u32Stride_C;
    }
    else
    {
        if (DISP_STEREO_NONE == eDispMode)
        {
            pstAddr[VDP_ADDR_3D].u32LumAddr = 0;
            pstAddr[VDP_ADDR_3D].u32ChmAddr = 0;
            pstAddr[VDP_ADDR_3D].u32LumStr  = 0;
            pstAddr[VDP_ADDR_3D].u32ChmStr  = 0;
        }
        else
        {
            pstAddr[VDP_ADDR_3D].u32LumAddr = stTmpBufAddr[0].u32PhyAddr_Y;
            pstAddr[VDP_ADDR_3D].u32ChmAddr = stTmpBufAddr[0].u32PhyAddr_C;
            pstAddr[VDP_ADDR_3D].u32LumStr  = stTmpBufAddr[0].u32Stride_Y;
            pstAddr[VDP_ADDR_3D].u32ChmStr  = stTmpBufAddr[0].u32Stride_C;
        }
    }

    if (bDcmpEn)
    {
        pstAddr[VDP_ADDR_HEAD].u32LumAddr = stTmpBufAddr[0].u32PhyAddr_YHead;
        pstAddr[VDP_ADDR_HEAD].u32ChmAddr = stTmpBufAddr[0].u32PhyAddr_CHead;
        pstAddr[VDP_ADDR_HEAD].u32LumStr  = stTmpBufAddr[0].u32Head_Stride;
        pstAddr[VDP_ADDR_HEAD].u32ChmStr  = stTmpBufAddr[0].u32Head_Stride;
        pstAddr[VDP_ADDR_HEAD].u32DcmpHeadSize = stTmpBufAddr[0].u32Head_Size;
    }

    pstAddr[VDP_ADDR_TILE].u32LumAddr = stTmpBufAddr_LB[0].u32PhyAddr_Y;
    pstAddr[VDP_ADDR_TILE].u32ChmAddr = stTmpBufAddr_LB[0].u32PhyAddr_C;
    pstAddr[VDP_ADDR_TILE].u32LumStr  = stTmpBufAddr_LB[0].u32Stride_Y;
    pstAddr[VDP_ADDR_TILE].u32ChmStr  = stTmpBufAddr_LB[0].u32Stride_C;

    if ( HI_TRUE == CheckFrameIs3D(eFrmType))//zhangfangni need modify
    {
        pstAddr[VDP_ADDR_TILE_3D].u32LumAddr = stTmpBufAddr_LB[1].u32PhyAddr_Y;
        pstAddr[VDP_ADDR_TILE_3D].u32ChmAddr = stTmpBufAddr_LB[1].u32PhyAddr_C;
        pstAddr[VDP_ADDR_TILE_3D].u32LumStr  = stTmpBufAddr_LB[1].u32Stride_Y;
        pstAddr[VDP_ADDR_TILE_3D].u32ChmStr  = stTmpBufAddr_LB[1].u32Stride_C;
    }
    else
    {
        if (DISP_STEREO_NONE == eDispMode)
        {
            pstAddr[VDP_ADDR_TILE_3D].u32LumAddr = 0;
            pstAddr[VDP_ADDR_TILE_3D].u32ChmAddr = 0;
            pstAddr[VDP_ADDR_TILE_3D].u32LumStr  = 0;
            pstAddr[VDP_ADDR_TILE_3D].u32ChmStr  = 0;
        }
        else
        {
            pstAddr[VDP_ADDR_TILE_3D].u32LumAddr = stTmpBufAddr_LB[0].u32PhyAddr_Y;
            pstAddr[VDP_ADDR_TILE_3D].u32ChmAddr = stTmpBufAddr_LB[0].u32PhyAddr_C;
            pstAddr[VDP_ADDR_TILE_3D].u32LumStr  = stTmpBufAddr_LB[0].u32Stride_Y;
            pstAddr[VDP_ADDR_TILE_3D].u32ChmStr  = stTmpBufAddr_LB[0].u32Stride_C;
        }
    }


    return;
}

//************************function for other chips except hi3798cv200*****************
HI_S32 ADAPTER_GetZmeCfgFromPq(WIN_INFO_S *pstWinInfo,
                               XDP_LAYER_VID_INFO_S *pstVidInfo,
                               HI_BOOL  bDolbyPath)
{
#ifdef  VDP_PQ_STRATEGY

    HI_PQ_ZME_STRATEGY_IN_U  stZmeIn ;
    HI_PQ_ZME_STRATEGY_OUT_U stZmeOut;

    HI_S32   s32Ret = HI_SUCCESS;
    HI_BOOL bBtm = HI_FALSE;
    HI_U32  u32Vcnt = 0;
    HI_PQ_VDP_WBC_INFO_S stVdpLayerAlgInfor;

    memset(&stZmeIn, 0x0, sizeof(HI_PQ_ZME_STRATEGY_IN_U));
    memset(&stZmeOut, 0x0, sizeof(HI_PQ_ZME_STRATEGY_OUT_U));
    memset(&stVdpLayerAlgInfor, 0x0, sizeof(HI_PQ_VDP_WBC_INFO_S));

    if (!pstWinInfo->bRegionMute
        && pstWinInfo->bRegionEnable
        && (HI_NULL != pstWinInfo->pCurrentFrame))
    {
        CBB_PIX_FORMAT_E eOutPixelFmt = CBB_VID_IFMT_BUTT;

        TransvertPixelFmt2CBB(&pstWinInfo->pCurrentFrame->ePixFormat, &eOutPixelFmt);
        if ((CBB_VID_IFMT_SP_420 == eOutPixelFmt) || (CBB_VID_IFMT_SP_TILE == eOutPixelFmt) || (CBB_VID_IFMT_SP_TILE_64 == eOutPixelFmt))
        {
            stZmeIn.stLayerStrategy.enZmeInFmt   = HI_PQ_ALG_PIX_FORMAT_SP420;
        }
        else if (CBB_VID_IFMT_SP_422 == eOutPixelFmt)
        {
            stZmeIn.stLayerStrategy.enZmeInFmt   = HI_PQ_ALG_PIX_FORMAT_SP422;
        }
        else if (CBB_VID_IFMT_SP_444 == eOutPixelFmt)
        {
            stZmeIn.stLayerStrategy.enZmeInFmt   = HI_PQ_ALG_PIX_FORMAT_SP444;
        }

        stZmeIn.stLayerStrategy.bFreezeEn = HI_FALSE;
        stZmeIn.stLayerStrategy.u32FrmWIn  = pstWinInfo->stIn.s32Width;
        stZmeIn.stLayerStrategy.u32FrmHIn  = pstWinInfo->stIn.s32Height;
        stZmeIn.stLayerStrategy.eFrostLevel = HI_PQ_FROST_LEVEL_CLOSE;

        stZmeIn.stLayerStrategy.stHDCPAttestFactor.bHDCPScene = pstWinInfo->bHdcpDegradePQ;
        stZmeIn.stLayerStrategy.stHDCPAttestFactor.u32IntermedWidth = pstWinInfo->stHdcpIntermediateRect.s32Width;
        stZmeIn.stLayerStrategy.stHDCPAttestFactor.u32IntermedHeight = pstWinInfo->stHdcpIntermediateRect.s32Height;

        stZmeIn.stLayerStrategy.u32FrmWOut = pstWinInfo->stVideo.s32Width;
        stZmeIn.stLayerStrategy.u32FrmHOut = pstWinInfo->stVideo.s32Height;

        if ((VDP_LAYER_VID0 == pstWinInfo->u32LayerId)
            || (VDP_LAYER_VID1 == pstWinInfo->u32LayerId))
        {
            VDP_DISP_GetVactState(0, &bBtm, &u32Vcnt);
            stZmeIn.stLayerStrategy.bZmeFrmFmtOut   = (VDP_DISP_GetDispMode(0) == 1) ? 1 : 0;
            stZmeIn.stLayerStrategy.bZmeBFIn    = !bBtm;
            stZmeIn.stLayerStrategy.bZmeBFOut   = !bBtm;
            stZmeIn.stLayerStrategy.bIsDolbyPath = bDolbyPath;

            if ((0 == pstWinInfo->stConfigNode.u32Index)
                ||  (HI_TRUE == pstVidInfo->stXdpSysCfg.bFieldMatch))
            {
                stZmeIn.stLayerStrategy.bZmeFrmFmtIn = HI_FALSE;
            }
            else
            {
                stZmeIn.stLayerStrategy.bZmeFrmFmtIn = HI_TRUE;
            }

            if (HI_SUCCESS != (s32Ret = DRV_PQ_GetVdpZmeStrategy ((HI_PQ_ZME_LAYER_E)pstWinInfo->u32LayerId, &stZmeIn, &stZmeOut)))
            {
                return s32Ret;
            }

            pstVidInfo->stXdpZmeCfg.bZmeFrmFmtOut = stZmeIn.stLayerStrategy.bZmeFrmFmtOut;
            pstVidInfo->stXdpZmeCfg.bZmeBFIn      = stZmeIn.stLayerStrategy.bZmeBFIn;
            pstVidInfo->stXdpZmeCfg.bZmeBFOut     = stZmeIn.stLayerStrategy.bZmeBFOut;

            pstVidInfo->stXdpZmeCfg.u32ZmeNum = stZmeOut.stStrategyLayerId.u32ZmeNum;

            pstVidInfo->stXdpFdrCfg.enDrawMode = (HI_U32)stZmeOut.stStrategyLayerId.eVScalerMode;

            pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Wth  =  stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth;
            pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Hgt  =  stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight;

            pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32InWidth   = stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32InWidth;
            pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32InHeight  = stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32InHeight;
            pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32OutWidth  = stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32OutWidth;
            pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32OutHeight = stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME2].u32OutHeight;

            ADAPTER_GetTnrDbDmInfo(pstWinInfo, &stVdpLayerAlgInfor);
            /*if (Internal_SelectTnrLocation(stVdpLayerAlgInfor.enAlgIPSel))
            {
                return HI_FAILURE;
            }*/

            //DRV_PQ_SetVdpAlgCalcCfg(&stVdpLayerAlgInfor);
        }
        else
        {
            memset((HI_VOID *)&stZmeOut, 0, sizeof(HI_PQ_ZME_STRATEGY_OUT_U));
            pstVidInfo->stXdpFdrCfg.enDrawMode = VDP_DRAW_MODE_1;
            pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Wth  =  pstWinInfo->stVideo.s32Width;;
            pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Hgt  =  pstWinInfo->stVideo.s32Height;;
        }

#ifndef VDP_ZME_COPY_MODE
        /*pass zme strategy to zme.*/
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable;

        /*pass zme strategy to zme.*/
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC;

        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV;
        //pstVidInfo->stXdpZmeCfg.bZmeDefault   = stZmeOut.stStrategyLayerId.bZmeDefault;

        /* set zme phase. */
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHL = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHL;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHC = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHC;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVL = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVL;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVC = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVC;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVLBtm = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVLBtm;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVCBtm = \
                stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVCBtm;
#else
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = HI_TRUE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = HI_TRUE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = HI_FALSE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = HI_FALSE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = HI_FALSE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = HI_FALSE;

        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = HI_FALSE;
        pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = HI_FALSE;
        //pstVidInfo->stXdpZmeCfg.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeDefault   = HI_FALSE;
#endif


        pstVidInfo->stXdpHZmeCfg.bHzmeEn  = stZmeOut.stStrategyLayerId.stHZmeCfg.bZmeHorEnable;
        //pstVidInfo->stXdpHZmeCfg.enHzmeMode = stZmeOut.stStrategyLayerId.stHZmeCfg.bPreZmeFir ? VDP_HZME_MODE_FIR : VDP_HZME_MODE_COPY;

        switch (stZmeOut.stStrategyLayerId.eHScalerMode)
        {
            case HI_PQ_PREZME_HOR_2X:
                pstVidInfo->stXdpFdrCfg.enDrawPixelMode = VDP_DRAW_PIXEL_MODE_2;
                break;
            case HI_PQ_PREZME_HOR_4X:
                pstVidInfo->stXdpFdrCfg.enDrawPixelMode = VDP_DRAW_PIXEL_MODE_4;
                break;
            case HI_PQ_PREZME_HOR_8X:
                pstVidInfo->stXdpFdrCfg.enDrawPixelMode = VDP_DRAW_PIXEL_MODE_8;
                break;
            case HI_PQ_PREZME_HOR_DISABLE:
            default:
                pstVidInfo->stXdpFdrCfg.enDrawPixelMode = VDP_DRAW_PIXEL_MODE_1;
                break;
        }

        /* frame is interlace, this is for V3.*/
        if (HI_FALSE == pstWinInfo->pCurrentFrame->bProgressive)
        {
            if (HI_DRV_FIELD_TOP == pstWinInfo->pCurrentFrame->enFieldMode)
            {
                pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_TOP;
            }
            else
            {
                pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_BOTTOM;
            }
        }
        else
        {
            if (VDP_LAYER_VID0 == pstWinInfo->u32LayerId)
            {
                pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_PROGRESSIVE;
            }
            else
            {
                /*read frame.*/
                if (stZmeOut.stStrategyLayerId.bReadFmtIn == HI_TRUE)
                {
                    pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_PROGRESSIVE;
                }
                else
                {
                    pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_INTERFACE;
                }
            }
        }
    }
    else
    {
        pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Wth = pstWinInfo->stVideo.s32Width;
        pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Hgt  =  pstWinInfo->stVideo.s32Height;

        pstVidInfo->stXdpFdrCfg.enDrawMode = VDP_DRAW_MODE_1;
        pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_INTERLACE;
    }
#else
    {
        pstVidInfo->stXdpHZmeCfg.enHzmeMode = VDP_HZME_MODE_COPY;
        pstVidInfo->stXdpFdrCfg.enDrawPixelMode = VDP_DRAW_PIXEL_MODE_1;

        if (VDP_LAYER_VID0 == pstWinInfo->u32LayerId)
        {
            pstVidInfo->stXdpHZmeCfg.bHzmeEn = HI_TRUE;
        }
        else
        {
            pstVidInfo->stXdpHZmeCfg.bHzmeEn = HI_FALSE;
        }

        pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Wth  =  pstWinInfo->stVideo.s32Width;
        pstVidInfo->stXdpZmeCfg.stZme2InRect.u32Hgt  =  pstWinInfo->stVideo.s32Height;

        pstVidInfo->stXdpFdrCfg.enDrawMode = VDP_DRAW_MODE_1;

        if (HI_NULL != pstWinInfo->pCurrentFrame)
        {
            if (pstWinInfo->pCurrentFrame->bProgressive == HI_FALSE)
            {
                if (HI_DRV_FIELD_TOP == pstWinInfo->pCurrentFrame->enFieldMode)
                {
                    pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_TOP;
                }
                else
                {
                    pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_BOTTOM;
                }
            }
            else
            {
                pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_PROGRESSIVE;
            }

        }
        else
        {
            pstVidInfo->stXdpFdrCfg.enReadMode = VDP_RMODE_INTERLACE;
        }
    }
#endif
    return HI_SUCCESS;
}


HI_VOID ADAPTER_TransferWBCInfoToHalCfg(XDP_LAYER_VID_INFO_S *pstLayerInfo,
                                        VDP_LAYER_WBC_INFO_S *pstWBCCfg)
{
    pstLayerInfo->stXdpWbcDhdCfg.bWbcEn = pstWBCCfg->bWbcLayerEn;
    pstLayerInfo->stXdpWbcDhdCfg.enWbcRootPath = pstWBCCfg->enWbcVpConnPoint;
    //pstLayerInfo->stXdpWbcDhdCfg.enWbcModeOut = XDP_WBC_MODE_OUT_INTERFACE; //XDP_WBC_MODE_OUT_TOP; // (pstWBCCfg->u32OutIop == VDP_RMODE_PROGRESSIVE) ? XDP_WBC_MODE_OUT_PROGRESIVE : XDP_WBC_MODE_OUT_INTERFACE;
    pstLayerInfo->stXdpWbcDhdCfg.enWbcModeOut = (pstWBCCfg->u32OutIop == VDP_RMODE_PROGRESSIVE) ? XDP_WBC_MODE_OUT_PROGRESIVE : XDP_WBC_MODE_OUT_INTERFACE;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.bLboxEn = HI_TRUE;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32X = pstWBCCfg->stVideoRect.u32X;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Y = pstWBCCfg->stVideoRect.u32Y;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Wth = pstWBCCfg->stVideoRect.u32Wth;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32Hgt = pstWBCCfg->stVideoRect.u32Hgt;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutWth = pstWBCCfg->stOutRect.u32Wth;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdLboxCfg.u32OutHgt = pstWBCCfg->stOutRect.u32Hgt;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Wth = pstWBCCfg->stInRect.u32Wth;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Hgt = pstWBCCfg->stInRect.u32Hgt;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32X = pstWBCCfg->stInRect.u32X;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdCropCfg.u32Y = pstWBCCfg->stInRect.u32Y;
#if 0
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn = 1;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn = 1;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHLumFirMode = 0;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHChmFirMode = 0;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVLumFirMode = 0;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVChmFirMode = 0;
#else
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHzmeEn       = pstWBCCfg->bZmeHorEnable;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHLumMidEn    = pstWBCCfg->bZmeMedH;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bHChmMidEn    = pstWBCCfg->bZmeMedH;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHLumFirMode = pstWBCCfg->bZmeFirHL ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enHChmFirMode = pstWBCCfg->bZmeFirHC ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;

    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HLumOffset = pstWBCCfg->s32ZmeOffsetHL;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HChmOffset = pstWBCCfg->s32ZmeOffsetHC;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVzmeEn       = pstWBCCfg->bZmeVerEnable;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVLumMidEn    = pstWBCCfg->bZmeMedV;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.bVChmMidEn    = pstWBCCfg->bZmeMedV;

    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVLumFirMode = pstWBCCfg->bZmeFirVL ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.enVChmFirMode = pstWBCCfg->bZmeFirVC ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;

    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumOffset = pstWBCCfg->s32ZmeOffsetVL;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmOffset = pstWBCCfg->s32ZmeOffsetVC;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VLumBOffset= pstWBCCfg->s32ZmeOffsetVLBtm;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VChmBOffset= pstWBCCfg->s32ZmeOffsetVCBtm;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32HorCoefAddr= pstWBCCfg->stZmeAddr.u32ZmeCoefAddrHL;
    pstLayerInfo->stXdpWbcDhdCfg.stWbcDhdZmeCfg.u32VerCoefAddr= pstWBCCfg->stZmeAddr.u32ZmeCoefAddrVL;
#endif
#if 0
    printk("TransferWBCInfoToHal wbc-en %d  inrect %d %d %d %d videorect %d %d %d %d Field %d \n",
            pstWBCCfg->bWbcLayerEn,
        pstWBCCfg->stInRect.u32Wth,
        pstWBCCfg->stInRect.u32Hgt,
        pstWBCCfg->stInRect.u32X,
        pstWBCCfg->stInRect.u32Y,
        pstWBCCfg->stVideoRect.u32X,
        pstWBCCfg->stVideoRect.u32Y,
        pstWBCCfg->stVideoRect.u32Wth,
        pstWBCCfg->stVideoRect.u32Hgt,
        pstLayerInfo->stXdpWbcDhdCfg.enWbcModeOut);
#endif
}
VDP_LAYER_WBC_INFO_S g_stLayWBCInfo = {0};
WIN_WBC_CONFIG_S     g_stVDPWBCCfg={0};

HI_VOID ADAPTER_TransferWinInfoToHalCfg(WIN_INFO_S *pstWinInfo,
                                        XDP_LAYER_VID_INFO_S *pstLayerInfo,
                                        HI_BOOL bDolbyPath)
{
    if ((pstWinInfo->u32LayerId >= VDP_LAYER_VID4) || (pstWinInfo->u32RegionNo >= MAX_WINDOWS_NUM))
    {
        HI_ERR_DISP("Invalid LayerId %d or RegionNo %d.\n", pstWinInfo->u32LayerId, pstWinInfo->u32RegionNo);
        return ;
    }

#ifdef HI_GFX_SDR2HDR_WEAK_PARA
    pstLayerInfo->stXdpLayerExtern.bGfxWeakCorlor = HI_TRUE;
#else
    pstLayerInfo->stXdpLayerExtern.bGfxWeakCorlor = HI_FALSE;
#endif

    pstLayerInfo->stXdpSysCfg.u32RegionNO = pstWinInfo->u32RegionNo;
    GetSpecialLayerPriorty(pstWinInfo->u32LayerId, &pstLayerInfo->stXdpSysCfg.u32LayerZorder);
    if (HI_NULL != pstWinInfo->pCurrentFrame) //sd layer may be null
    {
        pstLayerInfo->stXdpFdrCfg.u32ReverseTunnelPhyAddr = pstWinInfo->pCurrentFrame->BackTunnelPhyAddr;
        pstLayerInfo->stXdpFdrCfg.bWtunlEn         = (pstWinInfo->pCurrentFrame->BackTunnelPhyAddr != 0) ? HI_TRUE:HI_FALSE;
    }
    pstLayerInfo->stXdpFdrCfg.enDrawMode       = VDP_DRAW_MODE_1;//zhangfangni need modify
    pstLayerInfo->stXdpFdrCfg.enDrawPixelMode  = VDP_DRAW_MODE_1;//zhangfangni need modify
    pstLayerInfo->stXdpFdrCfg.bFlipEn          = pstWinInfo->bFlipEn;

    if (VDP_LAYER_VID1 == pstWinInfo->u32LayerId)
    {
        pstLayerInfo->stXdpSysCfg.bRegionModeEn = HI_TRUE;
    }
    else
    {
        pstLayerInfo->stXdpSysCfg.bRegionModeEn = HI_FALSE;
    }
    pstLayerInfo->stXdpLayerExtern.bCloseY2R =  pstWinInfo->bCloseY2R;
    pstLayerInfo->stXdpSysCfg.bRegionEn =  pstWinInfo->bRegionEnable;
    pstLayerInfo->stXdpSysCfg.bFieldMatch =  pstWinInfo->bFieldMatch;
    pstLayerInfo->stXdpSysCfg.bRWZB       =  pstWinInfo->stConfigNode.bDisableSoftwareAlg;
    pstLayerInfo->stXdpSysCfg.bForceFodEn =  HI_FALSE;//zhangfangni need modify
    pstLayerInfo->stXdpSysCfg.bLowMemMode =  HI_FALSE;//zhangfangni need modify

    pstLayerInfo->stXdpSysCfg.u32Alpha = (pstWinInfo->u32Alpha * LOGIC_MAX_ALPHA) / VDP_VIDEO_MAX_ALPHA;
    pstLayerInfo->stXdpSysCfg.u32AllAlpha = (pstWinInfo->u32AllAlpha * LOGIC_MAX_ALPHA) / VDP_VIDEO_MAX_ALPHA;

    pstLayerInfo->stXdpSrcCfg.enSrcClrSpace  = XDR_COLOR_SPACE_TRANSFER(pstWinInfo->enInCsc);
    pstLayerInfo->stXdpDispCfg.enOutClrSpace = XDR_COLOR_SPACE_TRANSFER(pstWinInfo->enOutCsc);
    pstLayerInfo->stXdpDispCfg.enDisPlayMode = XDR_OUT_TYPE_TRANSFER(pstWinInfo->enOutType);

    if (HI_TRUE == pstLayerInfo->stXdpSysCfg.bRegionEn)
    {
        ADAPTER_GetZmeCfgFromPq(pstWinInfo, pstLayerInfo, bDolbyPath);

        pstLayerInfo->stXdpFdrCfg.stCropRect.u32X      = (HI_U32)(pstWinInfo->stIn.s32X);
        pstLayerInfo->stXdpFdrCfg.stCropRect.u32Y      = (HI_U32)(pstWinInfo->stIn.s32Y);
        pstLayerInfo->stXdpFdrCfg.stCropRect.u32Wth    = pstWinInfo->stIn.s32Width;
        pstLayerInfo->stXdpFdrCfg.stCropRect.u32Hgt    = pstWinInfo->stIn.s32Height;

        pstLayerInfo->stXdpPositionCfg.stVideoRect.u32X     = (HI_U32)(pstWinInfo->stVideo.s32X);
        pstLayerInfo->stXdpPositionCfg.stVideoRect.u32Y     = (HI_U32)(pstWinInfo->stVideo.s32Y);
        pstLayerInfo->stXdpPositionCfg.stVideoRect.u32Wth   = pstWinInfo->stVideo.s32Width;
        pstLayerInfo->stXdpPositionCfg.stVideoRect.u32Hgt   = pstWinInfo->stVideo.s32Height;

        pstLayerInfo->stXdpPositionCfg.stDispRect.u32X      = (HI_U32)(pstWinInfo->stDisp.s32X);
        pstLayerInfo->stXdpPositionCfg.stDispRect.u32Y      = (HI_U32)(pstWinInfo->stDisp.s32Y);
        pstLayerInfo->stXdpPositionCfg.stDispRect.u32Wth    = pstWinInfo->stDisp.s32Width;
        pstLayerInfo->stXdpPositionCfg.stDispRect.u32Hgt    = pstWinInfo->stDisp.s32Height;

        pstLayerInfo->stXdpPositionCfg.stCropRect.u32X     = 0;//zhangfangni need modify
        pstLayerInfo->stXdpPositionCfg.stCropRect.u32Y     = 0;//zhangfangni need modify
        pstLayerInfo->stXdpPositionCfg.stCropRect.u32Wth   = pstWinInfo->stVideo.s32Width;//zhangfangni need modify
        pstLayerInfo->stXdpPositionCfg.stCropRect.u32Hgt   = pstWinInfo->stVideo.s32Height;//zhangfangni need modify

        pstLayerInfo->stXdpSrcCfg.enSrcClrSpace  = XDR_COLOR_SPACE_TRANSFER(pstWinInfo->enInCsc);
        pstLayerInfo->stXdpDispCfg.enOutClrSpace = XDR_COLOR_SPACE_TRANSFER(pstWinInfo->enOutCsc);
        pstLayerInfo->stXdpDispCfg.enDispMode    = XDR_DISPMODE_TRANSFER(pstWinInfo->pstDispInfo->eDispMode);

        pstLayerInfo->stXdpSysCfg.bMuteEn              = pstWinInfo->bRegionMute;
#if (defined(CHIP_TYPE_hi3798mv310) || defined(CHIP_TYPE_hi3716mv430))
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgY  = 0x0;
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgU  = 0x0;
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgV  = 0x0;
#else
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgY  = 0x40;
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgU  = 0x200;
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgV  = 0x200;
#endif
        pstLayerInfo->stXdpBkgCfg.stMuteColor.u32BkgA  = 0xff;

        pstLayerInfo->stXdpBkgCfg.stLetterBoxColor     = pstLayerInfo->stXdpBkgCfg.stMuteColor;

        /* set mixv color under RGB color space, cause Y2R always open. */
        pstLayerInfo->stXdpBkgCfg.stMixvColor.u32BkgA  = 0xff;
        pstLayerInfo->stXdpBkgCfg.stMixvColor.u32BkgY  = pstWinInfo->pstDispInfo->u32Kr;
        pstLayerInfo->stXdpBkgCfg.stMixvColor.u32BkgU  = pstWinInfo->pstDispInfo->u32Kg;
        pstLayerInfo->stXdpBkgCfg.stMixvColor.u32BkgV  = pstWinInfo->pstDispInfo->u32Kb;

        pstLayerInfo->stXdpDispCfg.bInterlace  = pstWinInfo->pstDispInfo->bInterlace;
        pstLayerInfo->stXdpDispCfg.stFmtReso.u32X  = pstWinInfo->pstDispInfo->stFmtResolution.s32X;
        pstLayerInfo->stXdpDispCfg.stFmtReso.u32Y  = pstWinInfo->pstDispInfo->stFmtResolution.s32Y;
        pstLayerInfo->stXdpDispCfg.stFmtReso.u32Wth  = pstWinInfo->pstDispInfo->stFmtResolution.s32Width;
        pstLayerInfo->stXdpDispCfg.stFmtReso.u32Hgt  = pstWinInfo->pstDispInfo->stFmtResolution.s32Height;

        //===============================src process=============================
        if (HI_NULL != pstWinInfo->pCurrentFrame)
        {
            HI_BOOL bUvorder = HI_FALSE, bCmpFmt = HI_FALSE, bLostCmp = HI_FALSE;
            pstLayerInfo->stXdpSysCfg.bSecureEn = pstWinInfo->pCurrentFrame->bSecure;
#ifdef  CFG_VDP_MMU_SUPPORT
            pstLayerInfo->stXdpSrcCfg.bSmmuEn   = HI_TRUE;
#else
            pstLayerInfo->stXdpSrcCfg.bSmmuEn   = HI_FALSE;
#endif
            JudgeCmpAndUvorderByPixFormat(pstWinInfo->pCurrentFrame->ePixFormat,
                                          &bUvorder, &bCmpFmt, &bLostCmp);

            pstLayerInfo->stXdpSrcCfg.bDcmpEn   = bCmpFmt;
            pstLayerInfo->stXdpSrcCfg.bDcmpLost = bLostCmp;
            pstLayerInfo->stXdpSrcCfg.bUVOrder  = bUvorder;

            pstLayerInfo->stXdpSrcCfg.u32TopFieldFirst = pstWinInfo->pCurrentFrame->bTopFieldFirst;

            pstLayerInfo->stXdpSrcCfg.enInFmt = XDR_PIXEL_FMT_TRANSFER(pstWinInfo->pCurrentFrame->ePixFormat);
            pstLayerInfo->stXdpSrcCfg.enXdpViDeoFrameType = XDR_FRAME_TYPE_TRANSFER(pstWinInfo->pCurrentFrame->enSrcFrameType);
            //============================bitwidth===========================
            pstLayerInfo->stXdpSrcCfg.enDataWidth = XDR_BITWIDTH_TRANSFER(pstWinInfo->pCurrentFrame->enBitWidth);

            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32X   = 0;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Y   = 0;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Wth = pstWinInfo->pCurrentFrame->u32Width;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Hgt = pstWinInfo->pCurrentFrame->u32Height;


            //=============================addr ===========================
            ADAPTER_TransferAddrToHalAddr(pstWinInfo->pCurrentFrame->eFrmType,
                                          pstWinInfo->pstDispInfo->eDispMode,
                                          pstWinInfo->pstDispInfo->bRightEyeFirst,
                                          bCmpFmt,
                                          &pstWinInfo->pCurrentFrame->stBufAddr[0],
                                          &pstWinInfo->pCurrentFrame->stBufAddr_LB[0],
                                          &pstLayerInfo->stXdpSrcCfg.stAddr[0]);

        }
        else
        {
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32X   = 0;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Y   = 0;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Wth = pstWinInfo->stIn.s32Width;
            pstLayerInfo->stXdpSrcCfg.stSrcRect.u32Hgt = pstWinInfo->stIn.s32Height;
        }
    }

    return ;
}

extern HI_S32 HW_BUF_QueueFrame(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstHalInputPara);
HI_VOID ADAPTER_CloseV0V1Layer(HI_VOID)
{
    static  XDP_LAYER_VID_INFO_S stLayerInfoIn;

    memset(&stLayerInfoIn, 0x0, sizeof(XDP_LAYER_VID_INFO_S));
    stLayerInfoIn.stXdpSysCfg.bRegionEn = HI_FALSE;
    HW_BUF_QueueFrame(VDP_LAYER_VID0, &stLayerInfoIn);

    return;
}

static XDP_LAYER_VID_INFO_S stLayerInfoIn[2] = {{{0}}};
/*bConfigWholeLayer means whether to config whole layer or not.*/
HI_VOID ADAPTER_SetLayerCfg(HI_U32 u32LayerId,
                            WIN_INFO_S *pstWinInfo,
                            HI_BOOL *pbVdmArray,
                            HI_BOOL bConfigWholeLayer)
{

    HI_PQ_HDR_CFG  *pstPqHdrCfg = HI_NULL;
    HI_U32 u32Index = 0;
    HI_U32 u32LayIndex = 0;

    switch (u32LayerId)
    {
        case VDP_LAYER_VID0:
            u32LayIndex = 0;
            break;
        case VDP_LAYER_SD0:
            u32LayIndex = 1;
            break;
        default:
            HI_ERR_DISP("Invalid layer id. %d\n", u32LayerId);
            u32LayIndex = 0;
        break;
    }

    memset(&stLayerInfoIn[u32LayIndex], 0x0, sizeof(stLayerInfoIn[u32LayIndex]));
    if (VDP_LAYER_VID_BUTT <= u32LayerId)
    {
        HI_ERR_DISP("Invalid layer id.\n");
        return;
    }

    ADAPTER_TransferWinInfoToHalCfg(pstWinInfo, &stLayerInfoIn[u32LayIndex], HI_FALSE);
    memcpy(&stLayerInfoIn[u32LayIndex].stXdpNodeInfo, &pstWinInfo->stConfigNode,sizeof(HW_NODE_RUNNING_CONFIG_S));

    if ((VDP_LAYER_VID0 == u32LayerId)
        || (VDP_LAYER_VID1 == u32LayerId))
    {
        for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
        {
            stLayerInfoIn[u32LayIndex].stXdpSysCfg.bVdmProcess[u32Index] = pbVdmArray[u32Index];

            if ((1 == pbVdmArray[u32Index])
                && (u32Index == (pstWinInfo->hWinHandle & 0xFF)))
            {
                stLayerInfoIn[u32LayIndex].stXdpSysCfg.u32VdmOnLayerId = pstWinInfo->u32LayerId;
            }
        }
    }

    if (HI_NULL != pstWinInfo->pCurrentFrame)
    {
        DISP_BUF_NODE_S *pstDispBufNode = HI_NULL;

        pstDispBufNode = container_of((HI_U32 *)pstWinInfo->pCurrentFrame, DISP_BUF_NODE_S, u32Data[0]);

        pstPqHdrCfg = (HI_PQ_HDR_CFG *)pstDispBufNode->u8Metadata;
        if (DRV_XDR_ENGINE_DOLBY == pstDispBufNode->enXdrEngine)
        {
            /* mute when it's dolby engine, otherwise it will flash and black screen in multi-win scene. */
            pstWinInfo->bRegionMute = HI_TRUE;
            stLayerInfoIn[u32LayIndex].stXdpSysCfg.bRegionEn = HI_FALSE;
            stLayerInfoIn[u32LayIndex].stXdpSysCfg.bMuteEn = HI_TRUE;
        }
    }

    if (VDP_LAYER_SD0 == u32LayerId)
    {
        pstPqHdrCfg = HI_NULL;
    }

    stLayerInfoIn[u32LayIndex].stXdpLayerExtern.bConfigWholeLayer = bConfigWholeLayer;

    HW_BUF_QueueFrame(u32LayerId, &stLayerInfoIn[u32LayIndex]);

    return;
}

HI_VOID ADAPTER_SetLayerCfg_Win(WIN_SHARE_INFO_S *pstWinShareInfo,
                            HI_U32 u32WinIdx,
                            HI_BOOL *pbVdmArray,
                            HI_BOOL bConfigWholeLayer)
{
    HI_U32 u32LayerId = 0;
    WIN_INFO_S *pstWinInfo = HI_NULL;

    u32LayerId = pstWinShareInfo->stWinInfo[u32WinIdx].u32LayerId;
    pstWinInfo = &pstWinShareInfo->stWinInfo[u32WinIdx];

#if 0
    printk("Cfg_Win wbc-en %d yaddr %#x ystride %d videorect %d %d %d %d\n",
        pstWinShareInfo->stWBCCfg.bWbcEnable,
        pstWinShareInfo->stWBCCfg.stAddr.u32PhyAddr_Y,
        pstWinShareInfo->stWBCCfg.stAddr.u32Stride_Y,
        pstWinShareInfo->stWBCCfg.stSdWinVideoRect.s32X,
        pstWinShareInfo->stWBCCfg.stSdWinVideoRect.s32Y,
        pstWinShareInfo->stWBCCfg.stSdWinVideoRect.s32Width,
        pstWinShareInfo->stWBCCfg.stSdWinVideoRect.s32Height);
#endif
    if (sizeof(g_stVDPWBCCfg) != sizeof(pstWinShareInfo->stWBCCfg))
    {
        HI_ERR_DISP("Invalid size %d %d\n", sizeof(g_stVDPWBCCfg), sizeof(pstWinShareInfo->stWBCCfg));
        return;
    }

    memcpy(&g_stVDPWBCCfg, &(pstWinShareInfo->stWBCCfg), sizeof(g_stVDPWBCCfg));

    ADAPTER_SetLayerCfg(u32LayerId, pstWinInfo, pbVdmArray, bConfigWholeLayer);
}
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
