/******************************************************************************

  Copyright (C), 2001-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_layerprocess.c
  Version       : Initial Draft
  Created       : 2018/05/16
  Description   :
  History       :
  1.Date        : 2018/05/16
    Modification: Created file

******************************************************************************/
#include "hal_layerprocess.h"
#include "vdp_hal_ip_cycbuf.h"
#include "vdp_hal_ip_fdr.h"
#include "vdp_hal_offline.h"
#include "vpss_hal_sysctrl.h"
#include "drv_win_hal.h"
#include "vdp_drv_wbc.h"
#include "drv_xdr_adapter.h"
#include "drv_disp_com.h"
S_VDP_REGS_TYPE *pstXdpRegTmp = HI_NULL;
static HI_BOOL sg_bXdpHalInit = HI_FALSE;
XDP_LAYER_VID_INFO_S g_apbConfigInfor;
S_VDP_REGS_TYPE  g_stVdpRegCfgTmp;

extern S_VDP_REGS_TYPE *pVdpReg;
extern WIN_WBC_CONFIG_S     g_stVDPWBCCfg;
extern VDP_LAYER_WBC_INFO_S g_stLayWBCInfo;
extern HI_S32 HAL_GetEnable(HI_U32 eLayer, HI_BOOL *pbEnable);
XDP_LAYER_VID_INFO_S *HW_GenerateApbInputParam(HI_BOOL bOnline,
                                                        VDP_CHANGEINFO_S *pstChangeInfor,
                                                        XDP_LAYER_VID_INFO_S *pstHalInputPara);
extern HI_S32 HAL_SetWbcParam(WIN_WBC_CONFIG_S *pstPara);
extern HI_VOID ADAPTER_TransferWBCInfoToHalCfg(XDP_LAYER_VID_INFO_S *pstLayerInfo,
                                        VDP_LAYER_WBC_INFO_S *pstWBCCfg);
HI_VOID HW_ALG_POLICY_GetVpssBufferSize(XDP_VPSSIP_POLICY_S *pstVpssIpPolicy,
                                                    XDP_VPSSIP_CHN_CFG_S *pstVpssIpChnCfg,
                                                    HI_U32 *pu32TotalBufSize,
                                                    HI_U32 *pu32OtherBufSize)
{
    XDP_DRV_GetVpssIpBufSize(pstVpssIpPolicy, pstVpssIpChnCfg, pu32TotalBufSize, pu32OtherBufSize);
    return;
}

XDP_LAYER_VID_INFO_S g_stHalInputPara;
XDP_LAYER_VID_INFO_S *HW_BUF_GetLastHardwareConfig(HI_VOID)
{
    return &g_stHalInputPara;
}

HI_VOID  HW_BUF_GetTotalBufStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState)
{
    pstLowdelayState->u32TotalPlayCnts   = VDP_GetTotalPlayCnts();
    pstLowdelayState->u32UnloadPlayCnts  = VDP_GetUnloadPlayCnts();
    pstLowdelayState->u32QueueNodeCnts   = VDP_GetQueueNodeCnts();
    pstLowdelayState->u32DeQueueNodeCnts = VDP_GetDeQueueCnts();
    return;
}


HI_VOID LAYERPROCESS_GetSendFrameErr(HI_BOOL *pbSendErr)
{
    HI_U32 offset = 0;
    *pbSendErr = VDP_CYCBUF_GetSendErr(offset);
    return ;
}

HI_VOID LAYERPROCESS_SetLayerEnable(HI_U32 eLayer, HI_BOOL bEnable)
{
    VDP_VID_SetLayerEnable(eLayer, bEnable);
    VDP_VID_SetRegUp(eLayer);
    return;
}

HI_VOID LAYERPROCESS_GetLayerEnable(HI_U32 eLayer, HI_BOOL *pbEnable)
{
    VDP_VID_GetLayerEnable(eLayer, pbEnable);
    return;
}


HI_S32 VDP_DRV_PQ_2_VDP_ZMECfg(HI_BOOL bFreezeEn, HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut, XDP_LAYER_VID_INFO_S *pstHalInputPara)
{
    HI_PQ_IMAGE_FMT_S   stZmeFmt = {0};
    VDP_ZME_FIR_MODE_E eZmeFirMode = VDP_ZME_FIR_MODE_BUTT;

    /*if (bFreezeEn && (!bOnLine))*/
    if (HI_FALSE == bFreezeEn)
    {
        /* hzme cfg */
        pstHalInputPara->stXdpHZmeCfg.bHzmeEn    = pstZmeOut->stStrategyLayerId.stHZmeCfg.bZmeHorEnable;
        pstHalInputPara->stXdpHZmeCfg.bHLumMidEn = pstZmeOut->stStrategyLayerId.stHZmeCfg.bZmeMedH;
        pstHalInputPara->stXdpHZmeCfg.bHChmMidEn = pstZmeOut->stStrategyLayerId.stHZmeCfg.bZmeMedH;

        eZmeFirMode = pstZmeOut->stStrategyLayerId.stHZmeCfg.bZmeFirHL ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
        pstHalInputPara->stXdpHZmeCfg.enHLumFirMode = eZmeFirMode;

        eZmeFirMode = pstZmeOut->stStrategyLayerId.stHZmeCfg.bZmeFirHC ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
        pstHalInputPara->stXdpHZmeCfg.enHChmFirMode = eZmeFirMode;

        pstHalInputPara->stXdpHZmeCfg.u32HzmeOutWth = pstZmeOut->stStrategyLayerId.stHZmeCfg.u32OutWidth;
        pstHalInputPara->stXdpHZmeCfg.u32HzmeOutHgt = pstZmeOut->stStrategyLayerId.stHZmeCfg.u32OutHeight;

        pstHalInputPara->stXdpHZmeCfg.u32LumOffset = pstZmeOut->stStrategyLayerId.stHZmeCfg.s32ZmeOffsetHL;
        pstHalInputPara->stXdpHZmeCfg.u32ChmOffset = pstZmeOut->stStrategyLayerId.stHZmeCfg.s32ZmeOffsetHC;

        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn   = HI_FALSE;  // add later
        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode = HI_FALSE;  // add later
        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode  = HI_FALSE;  // add later
        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn   = HI_FALSE;  // add later
        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain        = HI_FALSE;  // add later
        pstHalInputPara->stXdpHZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring      = HI_FALSE;  // add later

        pstHalInputPara->stXdpHZmeCfg.u32HorCoefAddr = pstZmeOut->stStrategyLayerId.stHZmeCfg.u32ZmeCoefAddrHL;

        /* vfcfg cfg */
        pstHalInputPara->stXdpFdrCfg.enDrawMode      = (VDP_DRAW_MODE_E)pstZmeOut->stStrategyLayerId.eVScalerMode;
        pstHalInputPara->stXdpFdrCfg.enDrawPixelMode = (VDP_DRAW_MODE_E)pstZmeOut->stStrategyLayerId.eHScalerMode;
        pstHalInputPara->stXdpFdrCfg.stCropRect.u32Hgt = pstZmeOut->stStrategyLayerId.stHZmeCfg.u32InHeight *
                                                         (1 << (HI_U32)pstHalInputPara->stXdpFdrCfg.enDrawMode);
    }
    else
    {
        /* vfcfg cfg */
        pstHalInputPara->stXdpVfFdrCfg.enDrawMode      = (VDP_DRAW_MODE_E)pstZmeOut->stStrategyLayerId.stFdrVfConfig.eVScalerModeVf;
        pstHalInputPara->stXdpVfFdrCfg.enDrawPixelMode = (VDP_DRAW_MODE_E)pstZmeOut->stStrategyLayerId.stFdrVfConfig.eHScalerModeVf;
    }

    stZmeFmt = pstZmeOut->stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1];

    /* zme cfg */
    pstHalInputPara->stXdpZmeCfg.bHzmeEn         = stZmeFmt.bZmeHorEnable;
    pstHalInputPara->stXdpZmeCfg.enHLumFirMode   = stZmeFmt.bZmeFirHL ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstHalInputPara->stXdpZmeCfg.enHChmFirMode   = stZmeFmt.bZmeFirHC ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstHalInputPara->stXdpZmeCfg.bHLumMidEn      = stZmeFmt.bZmeMedH;
    pstHalInputPara->stXdpZmeCfg.bHChmMidEn      = stZmeFmt.bZmeMedH;
    pstHalInputPara->stXdpZmeCfg.s32HLumOffset   = stZmeFmt.stZmeOffset.s32ZmeOffsetHL;
    pstHalInputPara->stXdpZmeCfg.s32HChmOffset   = stZmeFmt.stZmeOffset.s32ZmeOffsetHC;

    pstHalInputPara->stXdpZmeCfg.bVzmeEn         = stZmeFmt.bZmeVerEnable;
    pstHalInputPara->stXdpZmeCfg.enVLumFirMode   = stZmeFmt.bZmeFirVL ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstHalInputPara->stXdpZmeCfg.enVChmFirMode   = stZmeFmt.bZmeFirVC ? VDP_ZME_FIR_MODE_FIR: VDP_ZME_FIR_MODE_COPY;
    pstHalInputPara->stXdpZmeCfg.bVLumMidEn      = stZmeFmt.bZmeMedV;
    pstHalInputPara->stXdpZmeCfg.bVChmMidEn      = stZmeFmt.bZmeMedV;
    pstHalInputPara->stXdpZmeCfg.s32VLumOffset   = stZmeFmt.stZmeOffset.s32ZmeOffsetVL;
    pstHalInputPara->stXdpZmeCfg.s32VChmOffset   = stZmeFmt.stZmeOffset.s32ZmeOffsetVC;
    pstHalInputPara->stXdpZmeCfg.s32VLumBOffset  = stZmeFmt.stZmeOffset.s32ZmeOffsetVLBtm;
    pstHalInputPara->stXdpZmeCfg.s32VChmBOffset  = stZmeFmt.stZmeOffset.s32ZmeOffsetVCBtm;

    pstHalInputPara->stXdpZmeCfg.u32HorCoefAddr  = stZmeFmt.stZmeAddr.u32ZmeCoefAddrHL;
    pstHalInputPara->stXdpZmeCfg.u32VerCoefAddr  = stZmeFmt.stZmeAddr.u32ZmeCoefAddrVL;

    return HI_SUCCESS;
}


static HI_VOID  Local_updatePqOnlineCfg(XDP_LAYER_VID_INFO_S *pstHalInputPara, S_VDP_REGS_TYPE* pstVdpRegCfgTmp)
{
     /* Get Acc Para */
        pstHalInputPara->stXdpAccCfg.bEn            = pstVdpRegCfgTmp->VHDACCTHD1.bits.acc_en;
        pstHalInputPara->stXdpAccCfg.bAccMode       = pstVdpRegCfgTmp->VHDACCTHD1.bits.acc_mode;
        pstHalInputPara->stXdpAccCfg.u32ThdMedLow   = pstVdpRegCfgTmp->VHDACCTHD1.bits.thd_med_low;
        pstHalInputPara->stXdpAccCfg.u32ThdHigh     = pstVdpRegCfgTmp->VHDACCTHD1.bits.thd_high;
        pstHalInputPara->stXdpAccCfg.u32ThdLow      = pstVdpRegCfgTmp->VHDACCTHD1.bits.thd_low;

        pstHalInputPara->stXdpAccCfg.bAccRst        = pstVdpRegCfgTmp->VHDACCTHD2.bits.acc_rst;
        pstHalInputPara->stXdpAccCfg.u32ThdMedHigh  = pstVdpRegCfgTmp->VHDACCTHD2.bits.thd_med_high;

        pstHalInputPara->stXdpAccCfg.u32DemoSplitPoint  = pstVdpRegCfgTmp->VHDACCDEMO.bits.demo_split_point;
        pstHalInputPara->stXdpAccCfg.enDemoMode     = pstVdpRegCfgTmp->VHDACCDEMO.bits.demo_mode;
        pstHalInputPara->stXdpAccCfg.bDemoEn        = pstVdpRegCfgTmp->VHDACCDEMO.bits.demo_en;

        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data0  = pstVdpRegCfgTmp->VHDACCLOW1.bits.low_table_data0;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data1  = pstVdpRegCfgTmp->VHDACCLOW1.bits.low_table_data1;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data2  = pstVdpRegCfgTmp->VHDACCLOW1.bits.low_table_data2;

        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data3  = pstVdpRegCfgTmp->VHDACCLOW2.bits.low_table_data3;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data4  = pstVdpRegCfgTmp->VHDACCLOW2.bits.low_table_data4;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data5  = pstVdpRegCfgTmp->VHDACCLOW2.bits.low_table_data5;

        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data6  = pstVdpRegCfgTmp->VHDACCLOW3.bits.low_table_data6;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data7  = pstVdpRegCfgTmp->VHDACCLOW3.bits.low_table_data7;
        pstHalInputPara->stXdpAccCfg.stAccTable[0].u32Data8  = pstVdpRegCfgTmp->VHDACCLOW3.bits.low_table_data8;

        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data0  = pstVdpRegCfgTmp->VHDACCMED1.bits.mid_table_data0;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data1  = pstVdpRegCfgTmp->VHDACCMED1.bits.mid_table_data1;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data2  = pstVdpRegCfgTmp->VHDACCMED1.bits.mid_table_data2;

        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data3  = pstVdpRegCfgTmp->VHDACCMED2.bits.mid_table_data3;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data4  = pstVdpRegCfgTmp->VHDACCMED2.bits.mid_table_data4;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data5  = pstVdpRegCfgTmp->VHDACCMED2.bits.mid_table_data5;

        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data6  = pstVdpRegCfgTmp->VHDACCMED3.bits.mid_table_data6;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data7  = pstVdpRegCfgTmp->VHDACCMED3.bits.mid_table_data7;
        pstHalInputPara->stXdpAccCfg.stAccTable[1].u32Data8  = pstVdpRegCfgTmp->VHDACCMED3.bits.mid_table_data8;

        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data0  = pstVdpRegCfgTmp->VHDACCHIGH1.bits.high_table_data0;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data1  = pstVdpRegCfgTmp->VHDACCHIGH1.bits.high_table_data1;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data2  = pstVdpRegCfgTmp->VHDACCHIGH1.bits.high_table_data2;

        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data3  = pstVdpRegCfgTmp->VHDACCHIGH2.bits.high_table_data3;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data4  = pstVdpRegCfgTmp->VHDACCHIGH2.bits.high_table_data4;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data5  = pstVdpRegCfgTmp->VHDACCHIGH2.bits.high_table_data5;

        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data6  = pstVdpRegCfgTmp->VHDACCHIGH3.bits.high_table_data6;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data7  = pstVdpRegCfgTmp->VHDACCHIGH3.bits.high_table_data7;
        pstHalInputPara->stXdpAccCfg.stAccTable[2].u32Data8  = pstVdpRegCfgTmp->VHDACCHIGH3.bits.high_table_data8;

        /* Get Acm Para */
        pstHalInputPara->stXdpAcmCfg.bAcm0En  = pstVdpRegCfgTmp->VHDACM0.bits.acm0_en;
        pstHalInputPara->stXdpAcmCfg.bAcm1En  = pstVdpRegCfgTmp->VHDACM0.bits.acm1_en;
        pstHalInputPara->stXdpAcmCfg.bAcm2En  = pstVdpRegCfgTmp->VHDACM0.bits.acm2_en;
        pstHalInputPara->stXdpAcmCfg.bAcm3En  = pstVdpRegCfgTmp->VHDACM0.bits.acm3_en;

        pstHalInputPara->stXdpAcmCfg.bBwProMode  = pstVdpRegCfgTmp->VHDACM1.bits.bw_pro_mode;
        pstHalInputPara->stXdpAcmCfg.enDemoMode  = pstVdpRegCfgTmp->VHDACM1.bits.acm_dbg_mode;
        pstHalInputPara->stXdpAcmCfg.bDemoEn     = pstVdpRegCfgTmp->VHDACM1.bits.acm_test_en;

        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmSecBlk = pstVdpRegCfgTmp->VHDACM0.bits.acm_sec_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmFirBlk = pstVdpRegCfgTmp->VHDACM0.bits.acm_fir_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmDUoff  = pstVdpRegCfgTmp->VHDACM0.bits.acm_d_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmCUoff  = pstVdpRegCfgTmp->VHDACM0.bits.acm_c_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmBUoff  = pstVdpRegCfgTmp->VHDACM0.bits.acm_b_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmAUoff  = pstVdpRegCfgTmp->VHDACM0.bits.acm_a_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmDVoff  = pstVdpRegCfgTmp->VHDACM1.bits.acm_d_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmCVoff  = pstVdpRegCfgTmp->VHDACM1.bits.acm_c_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmBVoff  = pstVdpRegCfgTmp->VHDACM1.bits.acm_b_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[0].u32AcmAVoff  = pstVdpRegCfgTmp->VHDACM1.bits.acm_a_v_off;

        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmSecBlk = pstVdpRegCfgTmp->VHDACM2.bits.acm_sec_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmFirBlk = pstVdpRegCfgTmp->VHDACM2.bits.acm_fir_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmDUoff  = pstVdpRegCfgTmp->VHDACM2.bits.acm_d_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmCUoff  = pstVdpRegCfgTmp->VHDACM2.bits.acm_c_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmBUoff  = pstVdpRegCfgTmp->VHDACM2.bits.acm_b_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmAUoff  = pstVdpRegCfgTmp->VHDACM2.bits.acm_a_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmDVoff  = pstVdpRegCfgTmp->VHDACM3.bits.acm_d_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmCVoff  = pstVdpRegCfgTmp->VHDACM3.bits.acm_c_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmBVoff  = pstVdpRegCfgTmp->VHDACM3.bits.acm_b_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[1].u32AcmAVoff  = pstVdpRegCfgTmp->VHDACM3.bits.acm_a_v_off;

        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmSecBlk = pstVdpRegCfgTmp->VHDACM4.bits.acm_sec_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmFirBlk = pstVdpRegCfgTmp->VHDACM4.bits.acm_fir_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmDUoff  = pstVdpRegCfgTmp->VHDACM4.bits.acm_d_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmCUoff  = pstVdpRegCfgTmp->VHDACM4.bits.acm_c_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmBUoff  = pstVdpRegCfgTmp->VHDACM4.bits.acm_b_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmAUoff  = pstVdpRegCfgTmp->VHDACM4.bits.acm_a_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmDVoff  = pstVdpRegCfgTmp->VHDACM5.bits.acm_d_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmCVoff  = pstVdpRegCfgTmp->VHDACM5.bits.acm_c_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmBVoff  = pstVdpRegCfgTmp->VHDACM5.bits.acm_b_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[2].u32AcmAVoff  = pstVdpRegCfgTmp->VHDACM5.bits.acm_a_v_off;

        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmSecBlk = pstVdpRegCfgTmp->VHDACM6.bits.acm_sec_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmFirBlk = pstVdpRegCfgTmp->VHDACM6.bits.acm_fir_blk;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmDUoff  = pstVdpRegCfgTmp->VHDACM6.bits.acm_d_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmCUoff  = pstVdpRegCfgTmp->VHDACM6.bits.acm_c_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmBUoff  = pstVdpRegCfgTmp->VHDACM6.bits.acm_b_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmAUoff  = pstVdpRegCfgTmp->VHDACM6.bits.acm_a_u_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmDVoff  = pstVdpRegCfgTmp->VHDACM7.bits.acm_d_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmCVoff  = pstVdpRegCfgTmp->VHDACM7.bits.acm_c_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmBVoff  = pstVdpRegCfgTmp->VHDACM7.bits.acm_b_v_off;
        pstHalInputPara->stXdpAcmCfg.stAcmPara[3].u32AcmAVoff  = pstVdpRegCfgTmp->VHDACM7.bits.acm_a_v_off;

}

HI_S32 HW_BUF_QueueFrame(HI_U32 u32LayerId, XDP_LAYER_VID_INFO_S *pstHalInputPara)
{
    HI_BOOL bSendErr = HI_FALSE;
    HI_PQ_ONLINE_INFO_S stOnlineInfo = {{0}};
    HI_PQ_ZME_STRATEGY_IN_U stZmeIn = {{0}};
    HI_PQ_ZME_STRATEGY_OUT_U stZmeOut = {{0}};
    S_VDP_REGS_TYPE* pstVdpRegCfgTmp = HI_NULL;

    HI_S32 s32Ret = 0;

    if (HI_NULL == pstHalInputPara)
    {
        VDP_PRINT("pstHalInputPara is null!\n");
        return HI_FAILURE;
    }

    if (VDP_LAYER_VID0 == u32LayerId)
    {
        LAYERPROCESS_GetSendFrameErr(&bSendErr);
        if (bSendErr)
        {
            VDP_PRINT("SendFrame Err \n");
            return HI_FAILURE;
        }

        /* Get Csc Coef*/
        XDP_DRV_GetVidCscInfo(VDP_LAYER_VID0, pstHalInputPara);

        /*set freeze mode for pq.*/
        stZmeIn.stLayerStrategy.bFreezeEn = pstHalInputPara->stXdpNodeInfo.bFreezeEn;
        //stZmeIn.stLayerStrategy.bOnLine = (XDP_HAL_STATUS_ONLINE == pstHalInputPara->stXdpNodeInfo.enOnOffLineMode) ? HI_TRUE : HI_FALSE;
        stZmeIn.stLayerStrategy.bIsDolbyPath = HI_FALSE;

        if ((VDP_VID_IFMT_SP_420 == pstHalInputPara->stXdpSrcCfg.enInFmt)
            || (VDP_VID_IFMT_SP_TILE == pstHalInputPara->stXdpSrcCfg.enInFmt)
            || (VDP_VID_IFMT_SP_TILE_64 == pstHalInputPara->stXdpSrcCfg.enInFmt))
        {
            stZmeIn.stLayerStrategy.enZmeInFmt = HI_PQ_ALG_PIX_FORMAT_SP420;
        }
        else if (VDP_VID_IFMT_SP_422 == pstHalInputPara->stXdpSrcCfg.enInFmt)
        {
            stZmeIn.stLayerStrategy.enZmeInFmt = HI_PQ_ALG_PIX_FORMAT_SP422;
        }
        else
        {
            stZmeIn.stLayerStrategy.enZmeInFmt = HI_PQ_ALG_PIX_FORMAT_SP444;
        }

        if (HI_FALSE == stZmeIn.stLayerStrategy.bFreezeEn)
        {
            stZmeIn.stLayerStrategy.u32FrmWIn = pstHalInputPara->stXdpFdrCfg.stCropRect.u32Wth;
            stZmeIn.stLayerStrategy.u32FrmHIn = pstHalInputPara->stXdpFdrCfg.stCropRect.u32Hgt;
        }
        else
        {
            stZmeIn.stLayerStrategy.u32FrmWIn = pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Wth;
            stZmeIn.stLayerStrategy.u32FrmHIn = pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Hgt;
        }

        stZmeIn.stLayerStrategy.u32FrmWOut = pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Wth;
        stZmeIn.stLayerStrategy.u32FrmHOut = pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Hgt;

        /* Frame format for zme input: 0-field; 1-frame */
        if ((0 == pstHalInputPara->stXdpNodeInfo.u32Index)
            ||  (HI_TRUE == pstHalInputPara->stXdpSysCfg.bFieldMatch))
        {
            stZmeIn.stLayerStrategy.bZmeFrmFmtIn = HI_FALSE;
        }
        else
        {
            stZmeIn.stLayerStrategy.bZmeFrmFmtIn = HI_TRUE;
        }

        stZmeIn.stLayerStrategy.eFrostLevel = HI_PQ_FROST_LEVEL_CLOSE;
        stZmeIn.stLayerStrategy.stHDCPAttestFactor.bHDCPScene = HI_FALSE;
        stZmeIn.stLayerStrategy.bZmeFrmFmtOut   = (VDP_DISP_GetDispMode(0) == 1) ? 1 : 0;

        if (HI_SUCCESS != (s32Ret = DRV_PQ_GetVdpZmeStrategy ((HI_PQ_ZME_LAYER_E)u32LayerId, &stZmeIn, &stZmeOut)))
        {
            HI_ERR_DISP("DRV_PQ_GetVdpZmeStrategy fail ret:%d\n", s32Ret);
            return s32Ret;
        }

        VDP_DRV_PQ_2_VDP_ZMECfg(stZmeIn.stLayerStrategy.bFreezeEn, &stZmeOut, pstHalInputPara);


        if (HI_TRUE == pstHalInputPara->stXdpNodeInfo.bApbConfig)
        {
            pstVdpRegCfgTmp = &g_stVdpRegCfgTmp;
        }
        else
        {
            pstVdpRegCfgTmp = (S_VDP_REGS_TYPE *)pstHalInputPara->stXdpNodeInfo.pstXdpPqBaseAddr->pu8StartVirAddr;
        }

        stOnlineInfo.stSrcRect.s32Width  = pstHalInputPara->stXdpSrcCfg.stSrcRect.u32Wth;
        stOnlineInfo.stSrcRect.s32Height = pstHalInputPara->stXdpSrcCfg.stSrcRect.u32Hgt;
        stOnlineInfo.stOutRect.s32Width  = pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Wth;
        stOnlineInfo.stOutRect.s32Height = pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Hgt;


        DRV_PQ_UpdateVdpOnlinePQ(HI_PQ_DISPLAY_HD1, &stOnlineInfo, (HI_VOID *)pstVdpRegCfgTmp);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_DISP("Vdp Alg Init Fail \n");
            return HI_FAILURE;
        }

        /* get zme shoot cfg */
        if (pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_en)
        {
            if (stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth >= stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth)
            {
                pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_en = HI_FALSE;
            }
        }

        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlEn   = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_en;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bShootctrlMode = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_mode;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bFlatdectMode  = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_flatdect_mode;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].bCoringadjEn   = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_coringadj_en;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Gain        = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_gain;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_HOR].u32Coring      = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_HL.bits.hl_coring;

        if (pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_en)
        {
            if (stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight >= stZmeOut.stStrategyLayerId.stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight)
            {
                pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_en = HI_FALSE;
            }
        }

        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bShootctrlEn   = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_en;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bShootctrlMode = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_mode;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bFlatdectMode  = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_flatdect_mode;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].bCoringadjEn   = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_coringadj_en;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].u32Gain        = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_gain;
        pstHalInputPara->stXdpZmeCfg.stShootCtrl[XDP_ZME_SHOOT_VER].u32Coring      = pstVdpRegCfgTmp->V0_ZME_SHOOTCTRL_VL.bits.vl_coring;

        /* get lti cfg */
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.bLtiEn           = pstVdpRegCfgTmp->VHDLTICTRL.bits.lti_en;
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.u32LgainRatio    = pstVdpRegCfgTmp->VHDLTICTRL.bits.lgain_ratio;
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.u32LmixingRatio  = pstVdpRegCfgTmp->VHDLTICTRL.bits.lmixing_ratio;
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.u32LcoringThd    = pstVdpRegCfgTmp->VHDLTITHD.bits.lcoring_thd;
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.u32LunderSwing   = pstVdpRegCfgTmp->VHDLTITHD.bits.lunder_swing;
        pstHalInputPara->stXdpZmeCfg.stLtiCtrl.u32LoverSwing    = pstVdpRegCfgTmp->VHDLTITHD.bits.lover_swing;

        Local_updatePqOnlineCfg(pstHalInputPara, pstVdpRegCfgTmp);

        /* Get WBC_DHD CFG */
      //  pstHalInputPara->stXdpWbcDhdCfg.bWbcEn = HI_FALSE;
        /* Get VF FDR Para */

        //1离线静帧模式的时候，VF的SRC和CROP都是宽高比决策出来的。其余时候时候跟HZME输出一致
        if (HI_FALSE == pstHalInputPara->stXdpNodeInfo.bFreezeEn)
        {
            pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32Wth = pstHalInputPara->stXdpHZmeCfg.u32HzmeOutWth;
            pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32Hgt = pstHalInputPara->stXdpHZmeCfg.u32HzmeOutHgt;
            pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32X  = 0;
            pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Y  = 0;
            pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Wth = pstHalInputPara->stXdpHZmeCfg.u32HzmeOutWth;
            pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Hgt = pstHalInputPara->stXdpHZmeCfg.u32HzmeOutHgt;
        }


        pstHalInputPara->stXdpVfFdrCfg.bUVOrder = 0;//zhangfangni need modify

        memset(&g_stLayWBCInfo, 0x0, sizeof(g_stLayWBCInfo));
        HAL_SetWbcParam(&g_stVDPWBCCfg);
        ADAPTER_TransferWBCInfoToHalCfg(pstHalInputPara, &g_stLayWBCInfo);

        VDP_DRV_SetVid0Layer(pstHalInputPara);
        g_stHalInputPara = *pstHalInputPara;
    }
    else if (VDP_LAYER_SD0 == u32LayerId)
    {
        /* Get Csc Coef*/
        XDP_DRV_GetVidCscInfo(VDP_LAYER_SD0, pstHalInputPara);
        ADAPTER_TransferWBCInfoToHalCfg(pstHalInputPara, &g_stLayWBCInfo);
        VDP_DRV_SetVid1Layer(pstHalInputPara);
    }

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_StartLogic(HI_U32 u32LayerId)
{
    VDP_OFF_SetStart(pVdpReg, 1);
    return HI_SUCCESS;
}

HI_U32 LAYERPROCESS_GetInterruptState(VDP_INTMSK_E enInterruptMask)
{
    HI_U32 u32InterruptState = 0;
    u32InterruptState = VDP_DISP_GetIntSta(enInterruptMask);
    return u32InterruptState;
}

HI_VOID LAYERPROCESS_ClearInterruptState(VDP_INTMSK_E enInterruptMask)
{
    VDP_DISP_ClearIntSta(enInterruptMask);
}


HI_U8 LAYERPROCESS_GetDtvReleaseNumber (HI_VOID)
{
    HI_U32 offset = 0;

    if (VDP_INTMSK_DTV_BACK_INT != LAYERPROCESS_GetInterruptState(VDP_INTMSK_DTV_BACK_INT))
    {
        //return 0;//num = 0
    }

    LAYERPROCESS_ClearInterruptState(VDP_INTMSK_DTV_BACK_INT);

    return VDP_CYCBUF_GetBackNum(offset);
}

HI_U32 LAYERPROCESS_GetDtvReleaseFrameAddr(HI_VOID)
{
    //HI_U32 u32ReleaseCAddr = 0;
    HI_U32 offset = 0;

    VDP_CYCBUF_SetDtvBackPassword(offset, 0xbadbeef);

    return VDP_CYCBUF_GetDtvBackAddr(offset);
    //u32ReleaseCAddr = VDP_FDR_VID_GetDtvBackCaddr();
}

HI_BOOL LAYERPROCESS_GetBackFrameErr(HI_VOID)
{
    HI_U32 offset = 0;

    return VDP_CYCBUF_GetBackErr(offset);
}

HI_S32 HW_DRV_DeQueueFrame(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode)//zjy from s3,还帧接口
{
    HI_U8 u8BackBufferNumber = 0;
    HI_BOOL bBackErr = HI_FALSE;

    //获取可还帧数
    u8BackBufferNumber = LAYERPROCESS_GetDtvReleaseNumber();
    if (0 == u8BackBufferNumber)
    {
        //VDP_PRINT("u8BackBufferNumber ==  %d\n", u8BackBufferNumber);
        return HI_ERR_VO_BUFQUE_EMPTY;
    }

    //获取还帧地址
    pstReleaseNode->u32NodeAddr = LAYERPROCESS_GetDtvReleaseFrameAddr();
    if (0 == pstReleaseNode->u32NodeAddr)
    {
        //VDP_PRINT("Invalid Release Buffer addr  0x%x\n", pstReleaseNode->u32NodeAddr);
        return HI_FAILURE;
    }

    //查询还帧失败状态
    bBackErr = LAYERPROCESS_GetBackFrameErr();
    if (bBackErr)
    {
        //VDP_PRINT("BackFrame Err \n");
        return HI_FAILURE;
    }

    //VDP_PRINT("VDP_DRV_DeQueueFrame success:%x!\n", pstReleaseNode->u32NodeAddr);

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_InitLayer(HI_U32 u32LayerId)
{
    pstXdpRegTmp = (S_VDP_REGS_TYPE *)HI_KMALLOC(HI_ID_VO, sizeof(S_VDP_REGS_TYPE), GFP_ATOMIC);
    if (pstXdpRegTmp == HI_NULL)
    {
        VDP_PRINT("pstXdpRegTmp can not kmalloc!\n");
        sg_bXdpHalInit = HI_FALSE;
        return HI_FAILURE;
    }

    memset(pstXdpRegTmp, 0x0, sizeof(S_VDP_REGS_TYPE));

    {
        HI_S32 s32V0IfirCoef[8] = { -7, 12, -17, 25, -38, 58, -105, 328};
        VDP_VID_SetIfirMode            (VDP_LAYER_VID0, VDP_IFIRMODE_6TAPFIR);
        VDP_VID_SetIfirCoef            (VDP_LAYER_VID0, s32V0IfirCoef);
    }

    sg_bXdpHalInit = HI_TRUE;
    return HI_SUCCESS;

}

HI_S32 VDP_DRV_DeInitLayer(HI_U32 u32LayerId)
{
    VDP_VID_SetLayerEnable(VDP_LAYER_VID0, HI_FALSE);
    VDP_VID_SetRegUp(VDP_LAYER_VID0);

    if(u32LayerId == VDP_LAYER_VID0)
    {
        XDP_DRV_SetVid0OfflineChnDisable();
    }

    VDP_CYCBUF_ClearUnloadFlag(0);
    VDP_OFF_SetStartMode((S_VDP_REGS_TYPE *)pVdpReg, 0x0);
    VDP_CYCBUF_SetRegup(0, 1);

    sg_bXdpHalInit = HI_FALSE;
    return HI_SUCCESS;
}

HI_VOID VDP_DRV_PrepareLayerInfo(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode)
{
    return ;
}

HI_S32 VDP_DRV_PqInit(HI_U32 u32LayerId, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_BOOL bNewScene)
{
    if (VDP_LAYER_VID0 == u32LayerId)
    {
        // zme init
        //csc init
        //vpss ip init
        //vdp ip init
    }

    if (VDP_LAYER_VID1 == u32LayerId)
    {
    }

    //other layer

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_PqDeInit(HI_U32 u32LayerId, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_BOOL bNewScene)
{
    /*zjy to be added*/
    return HI_SUCCESS;
}

HI_VOID VDP_DRV_GetLayerState(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState)
{
    return;
}

// 播控只是动作，只管查询寄存器，配置寄存器
HI_VOID VDP_DRV_SetLayerPlayMode(HI_U32 u32LayerId, VDP_CYCBUF_DTV_MODE_E enDtvMode)
{
    HI_U32 offset = 0;

    /*zjy to be added*/
    //VO_CHECK_OVER_RANGE_RE_FAIL(enDtvMode, VDP_CYCBUF_DTV_MODE_BUTT);
    VDP_CYCBUF_SetDtvMode(offset, enDtvMode);
    VDP_CYCBUF_SetRegup(0, 1);

    return;
}

HI_VOID HW_BUF_SetHoldMode(HI_U32 u32LayerId, HI_BOOL bhold_en)
{
    VDP_OFF_SetHoldEn(pVdpReg, bhold_en);
    return;
}

HI_VOID HW_BUF_SetStepMode(HI_U32 u32LayerId, HI_BOOL bhold_en)
{
    VDP_OFF_SetHoldEn(pVdpReg, bhold_en);

    if (HI_TRUE == bhold_en)
    {
        VDP_OFF_SetHoldBreak(pVdpReg);
    }

    return;
}

HI_VOID HW_OfflineReset(HI_VOID)
{
    HI_U32 u32OfflineState = 0;
    HI_U32 u32TryCnt = 0;

    VDP_OFF_RestEn(pVdpReg, 0x1);
    u32OfflineState = 0xFF;
    u32TryCnt = 0;
    while ((0x0 != u32OfflineState) && (u32TryCnt++ < 100))
    {
        u32OfflineState = VDP_OFF_GetOflineState(pVdpReg);
        u32OfflineState = u32OfflineState & 0xF;
    }

    if (0x0 != u32OfflineState)
    {
        WIN_ERROR("Offline reset try %d times fail! offlinestat %#x\n",
                  u32TryCnt, u32OfflineState);
    }

    VDP_OFF_RestEn(pVdpReg, 0x0);
    VDP_OFF_SetStartMode(pVdpReg, 0x0);
    VDP_CYCBUF_SetLburstNum( 0, VDP_CFG_NODE_SIZE / 16);

    return;
}

HI_BOOL HW_BUF_CheckResetFinish(HI_VOID)
{
    /*get reset finished or not.*/
    return HI_TRUE;
}

HI_S32 HW_DRV_SetLayerResetMode(HI_U32 u32LayerId, HI_BOOL bResetEn, HI_DRV_WIN_SWITCH_E enResetMode)
{
    HI_U32  offset = 0, i = 0;
    HI_BOOL bResetStatus = 0, bSyncMode = HI_FALSE, bhold_en = HI_FALSE;
    HI_BOOL bEnable = HI_FALSE;
    VDP_CYCBUF_RESET_MODE_E eHalResetMode;

    eHalResetMode = (enResetMode == HI_DRV_WIN_SWITCH_LAST) ? VDP_CYCBUF_RESET_MODE_PAUSE : VDP_CYCBUF_RESET_MODE_BLACK;

    /*clear sync and hold first, if not clear, reset may be blocked.*/
    VDP_OFF_GetSyncMode ((S_VDP_REGS_TYPE *)pVdpReg, &bSyncMode);
    if (HI_TRUE == bSyncMode)
    {
        VDP_OFF_SetSyncMode ((S_VDP_REGS_TYPE *)pVdpReg, 0x0);
        HI_ERR_WIN("When reset,syncmode enabled\n");
    }

    VDP_OFF_GetHoldEn(pVdpReg, &bhold_en);
    if (HI_TRUE == bhold_en)
    {
        VDP_OFF_SetHoldEn ((S_VDP_REGS_TYPE *)pVdpReg, 0x0);
        HI_ERR_WIN("When reset,hold enabled\n");
    }

    HAL_GetEnable(VDP_LAYER_VID0, &bEnable);

    /*if layer not enable, just enable the layer, than do reset.*/
    if (HI_FALSE == bEnable)
    {
        HW_VID_SetLayerMute(VDP_LAYER_VID0, HI_TRUE);
        LAYERPROCESS_SetLayerEnable(VDP_LAYER_VID0, HI_TRUE);
    }

    VDP_CYCBUF_SetResetMode(offset, eHalResetMode);
    VDP_CYCBUF_SetRegup(0, 1);

    VDP_CYCBUF_SetResetEn(offset, bResetEn);
    VDP_CYCBUF_SetRegup(0, 1);

    VDP_CYCBUF_GetResetEn(offset, &bResetStatus);
    while ((bResetStatus != HI_TRUE) && (i < 50))
    {
        msleep(1);
        i ++;
        VDP_CYCBUF_GetResetEn(offset, &bResetStatus);
    }

    HI_INFO_WIN("Reset layer lasted for %d ms\n", i);

    if (HI_TRUE != bResetStatus)
    {
         bEnable = HI_TRUE;
         HAL_GetEnable(VDP_LAYER_VID0, &bEnable);

        HI_ERR_WIN("Reset(%d) layer failed when layer is (%d)!\n", bResetEn, bEnable);
    }

    /*since reset may ocurr at top filed, although bottom field will flow, but it will reset the
          startmode to true, and buffer flow will stop.*/
    VDP_OFF_SetStartMode((S_VDP_REGS_TYPE *)pVdpReg, 0x0);
    /*temp modify just let the reset work, move the node to back list.*/
    msleep(45);

    if (HI_FALSE == bEnable)
    {
        HW_VID_SetLayerMute(VDP_LAYER_VID0, HI_FALSE);
        LAYERPROCESS_SetLayerEnable(VDP_LAYER_VID0, HI_FALSE);
    }

    return HI_SUCCESS;
}

HI_VOID  HW_BUF_GetUnderloadStatus(HI_U32 u32LayerId, VDP_DRV_LAYER_INFO_S *pstLowdelayState)
{
#if 0
    HI_U32 offset = 0;

    pstLowdelayState->u32UnderloadSta   = VDP_CYCBUF_GetUnderloadSta(offset);
    pstLowdelayState->u32UnderloadCount = VDP_CYCBUF_GetUnderloadCnt( offset);
#endif
    return;
}

HI_VOID  HW_BUF_GetCurrentPlayFrameInfor(HI_U32 u32LayerId, HW_BUFNODE_Infor_S *pstCurrentFrameInfor)
{
    /*get the current frame index, may displayed, may diplaying.*/
    pstCurrentFrameInfor->u32FrameIndex  = VDP_CYCBUF_GetDispCurIdex(u32LayerId);
    pstCurrentFrameInfor->u32FrameAddr_Y  = VDP_CYCBUF_GetDtvDispAddr(u32LayerId);
    pstCurrentFrameInfor->u32FrameAddr_C  = 0;

    return;
}


HI_VOID HW_BUF_GetFramePrivateInfor(HI_U32 u32LayerId, HW_DYNAMIC_FrameInfor_S *pstCurrentFrameInfor)
{
    HW_DYNAMIC_FrameInfor_S *pstHWFrameInfo;

    pstHWFrameInfo = XDP_DRV_GetVid0SoftAlgCfg();
    if ((HI_NULL != pstHWFrameInfo) && (HI_NULL != pstCurrentFrameInfor))
    {
        *pstCurrentFrameInfor = *pstHWFrameInfo;
    }
    return;
}

HI_VOID HW_ALG_GetWbcConfig(HW_ALG_WBC_STATUS_INFOR_S *pstWbcStatus)
{
    pstWbcStatus->u32P1RgmvAddr = pVdpReg->VPSS_P1RGMV_RADDR_LOW.u32;
    pstWbcStatus->u32P2RgmvAddr = pVdpReg->VPSS_P2RGMV_RADDR_LOW.u32;
    pstWbcStatus->u32Stride     = pVdpReg->VPSS_P1RGMV_STRIDE.bits.p1rgmv_stride;
    pstWbcStatus->u32SttAddr    = pVdpReg->VPSS_STT_W_RADDR_LOW.u32;
    return;
}

HI_VOID VDP_SetVpssBaseAddr(HI_U32 u32BaseAddr, HI_BOOL bDei, HI_BOOL bTnr, HI_BOOL bSnr)
{
    HI_U32 u32Cnt = 0;
    HI_U32 u32StartOffset = 0, u32EndOffset = 0;
    HI_U32 u32Mask0 = 0, u32Mask1 = 0;

    if (bTnr)
    {
        u32StartOffset = (VDP_REG_SIZE_CALC(VOCTRL, VPSS_TNR_CTRL) - 0x9600) / 256;
    }
    else if (bDei)
    {
        u32StartOffset = (VDP_REG_SIZE_CALC(VOCTRL, VPSS_DIECTRL) - 0x9600) / 256;
    }
    else if (bSnr)
    {
        u32StartOffset = (VDP_REG_SIZE_CALC(VOCTRL, VPSS_DBM_CTRL) - 0x9600) / 256;
    }
    else
    {
        DISP_ERROR("Invalid case %d %d %d\n", bDei, bTnr, bSnr);
    }
    u32EndOffset = (VDP_REG_SIZE_CALC(VOCTRL, DHD_TOP_CTRL) - 0x9600) / 256;
    if ((u32EndOffset - u32StartOffset) > 32)
    {
        DISP_ERROR("Err u32StartOffset = %#x, u32EndOffset = %#x!\n", u32StartOffset, u32EndOffset);
    }
    for (u32Cnt = u32StartOffset; u32Cnt < u32EndOffset - 1; u32Cnt++)
    {
        if (u32Cnt < 32)
        {
            u32Mask0 |= (0x1 << u32Cnt);
        }
        else
        {
            u32Mask1 |= (0x1 << (u32Cnt - 32));
        }
    }
    VPSS_Sys_SetStartAddr(pVdpReg, 0, u32BaseAddr - (0xB700 - 0x9600));
    VPSS_Sys_SetMask0(pVdpReg, 0, u32Mask0);
    VPSS_Sys_SetMask1(pVdpReg, 0, u32Mask1);
    return;
}

HI_VOID HW_ALG_SetWbcConfigParam(HW_ALG_WBC_CONFIG_INFOR_S *pstWbcSettings)
{
    VPSS_Sys_SetSttWAddr((S_VDP_REGS_TYPE *)pVdpReg, 0x0, 0, pstWbcSettings->u32SttAddr);
    VDP_SetVpssBaseAddr( pstWbcSettings->u32SoftAlgCaculateResult, HI_TRUE, HI_TRUE, HI_TRUE);
    VPSS_Sys_SetRegloadUp(pVdpReg, 0, 1);
    return;
}


HI_VOID HW_VID_SetLayerMute(HI_U32 u32LayerID, HI_BOOL bEnable)
{
     VDP_VID_SetLayerMute(u32LayerID, bEnable);
    return;
}

/**********************for lowdelay**************************/
HI_S32 VDP_DRV_GetLowdelayReleaseFrameNode(HI_U32 u32LayerId, VDP_DRV_RELEASE_FRAME_NODE_S *pstReleaseNode)
{
    HI_U32 u32NodeNumber = 0;
    HI_S32 ret = HI_FAILURE;

    u32NodeNumber = VDP_CYCBUF_GetBackNum(u32LayerId);
    if (u32NodeNumber == 0)
    {
        return HI_ERR_VO_BUFQUE_EMPTY;
    }

    VDP_CYCBUF_SetDtvBackPassword(u32LayerId, 0xbadbeef);
    pstReleaseNode->u32NodeAddr = VDP_CYCBUF_GetDtvBackAddr(u32LayerId);
    ret = VDP_CYCBUF_GetBackErr(u32LayerId);
    if (0 != ret)
    {
        return HI_ERR_VO_BUFQUE_FULL;
    }

    return HI_SUCCESS;
}

HI_VOID HW_ChangeApbConfig(HI_BOOL bOnline,VDP_CHANGEINFO_S *pstChangeInfor)
{
    HW_GenerateApbInputParam(bOnline, pstChangeInfor, &g_apbConfigInfor);
    HW_BUF_QueueFrame(VDP_LAYER_VID0, &g_apbConfigInfor);
    return;
}


XDP_LAYER_VID_INFO_S *HW_GenerateApbInputParam(HI_BOOL bOnline,
                                                        VDP_CHANGEINFO_S *pstChangeInfor,
                                                        XDP_LAYER_VID_INFO_S *pstHalInputPara)
{
    memset(pstHalInputPara, 0, sizeof(XDP_LAYER_VID_INFO_S));

    /*************************get sys config***************************/
    pstHalInputPara->stXdpSysCfg.u32AllAlpha       = 0xff;
    pstHalInputPara->stXdpSysCfg.bRWZB          = HI_FALSE;
    pstHalInputPara->stXdpSysCfg.bLowMemMode    = HI_FALSE;
    pstHalInputPara->stXdpSysCfg.bFieldMatch    = HI_FALSE;

    /*************************get src config***************************/
    pstHalInputPara->stXdpSrcCfg.enSrcClrSpace         = VDP_CLR_SPACE_YUV_709;// fix to 709 should get the actual src config.
    pstHalInputPara->stXdpSrcCfg.stSrcRect.u32X        = 0;
    pstHalInputPara->stXdpSrcCfg.stSrcRect.u32Y        = 0;
    VDP_FDR_VID_GetSrcW(VDP_LAYER_VID0, &pstHalInputPara->stXdpSrcCfg.stSrcRect.u32Wth);
    VDP_FDR_VID_GetSrcH(VDP_LAYER_VID0, &pstHalInputPara->stXdpSrcCfg.stSrcRect.u32Hgt);

    pstHalInputPara->stXdpSrcCfg.enInFmt               = VDP_VID_IFMT_SP_420;
    pstHalInputPara->stXdpSrcCfg.enDataWidth           = VDP_DATA_WTH_8;
    pstHalInputPara->stXdpSrcCfg.bUVOrder              = 0;

    /*************************get fdr config***************************/
    VDP_FDR_VID_GetSrcCropX(VDP_LAYER_VID0, &pstHalInputPara->stXdpFdrCfg.stCropRect.u32X);
    VDP_FDR_VID_GetSrcCropY(VDP_LAYER_VID0, &pstHalInputPara->stXdpFdrCfg.stCropRect.u32Y);
    VDP_FDR_VID_GetIresoH(VDP_LAYER_VID0, &pstHalInputPara->stXdpFdrCfg.stCropRect.u32Hgt);
    VDP_FDR_VID_GetIresoW(VDP_LAYER_VID0, &pstHalInputPara->stXdpFdrCfg.stCropRect.u32Wth);

#if 0
    VDP_PRINT("fdr crop:%d,%d,%d,%d!\n", pstHalInputPara->stXdpFdrCfg.stCropRect.u32X,
                                      pstHalInputPara->stXdpFdrCfg.stCropRect.u32Y,
                                      pstHalInputPara->stXdpFdrCfg.stCropRect.u32Wth,
                                      pstHalInputPara->stXdpFdrCfg.stCropRect.u32Hgt);
#endif

    pstHalInputPara->stXdpFdrCfg.enDrawMode             = 0;
    pstHalInputPara->stXdpFdrCfg.enDrawPixelMode        = 0;
    pstHalInputPara->stXdpFdrCfg.bFlipEn                = 0;
    pstHalInputPara->stXdpFdrCfg.bWtunlEn               = 0;

    /*************************get VF fdr config***************************/

    VDP_FDR_VF_GetSrcOutReso(VDP_LAYER_VID0, &pstHalInputPara->stXdpVfFdrCfg.stSrcRect);
    VDP_FDR_VF_GetSrcCropSize(VDP_LAYER_VID0, &pstHalInputPara->stXdpVfFdrCfg.stCropRect);
    pstHalInputPara->stXdpVfFdrCfg.enDrawMode             = 0;
    pstHalInputPara->stXdpVfFdrCfg.enDrawPixelMode        = 0;
    pstHalInputPara->stXdpVfFdrCfg.bUVOrder               = 0;

#if 0
    VDP_PRINT("vf  src:%d,%d, %d,%d!\n", pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32X,
                                pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32Y,
                                pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32Hgt,
                                pstHalInputPara->stXdpVfFdrCfg.stSrcRect.u32Wth);

    VDP_PRINT("vf  crop:%d,%d, %d,%d!\n", pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32X,
                                pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Y,
                                pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Hgt,
                                pstHalInputPara->stXdpVfFdrCfg.stCropRect.u32Wth);
#endif

    /*************************get disp position config***************************/

    pstHalInputPara->stXdpPositionCfg.stCropRect.u32X    =      0;
    pstHalInputPara->stXdpPositionCfg.stCropRect.u32Y    =      0;
    pstHalInputPara->stXdpPositionCfg.stCropRect.u32Wth  =      pstChangeInfor->u32VideoWth;
    pstHalInputPara->stXdpPositionCfg.stCropRect.u32Hgt  =      pstChangeInfor->u32VideoHgt;


    pstHalInputPara->stXdpPositionCfg.stVideoRect.u32X    =      pstChangeInfor->u32VideoX;
    pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Y    =      pstChangeInfor->u32VideoY;

    pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Wth  =      pstChangeInfor->u32VideoWth;
    pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Hgt  =      pstChangeInfor->u32VideoHgt;

    if (pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Wth > XDP_MAX_OUTWTH)
    {
        pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Wth  = XDP_MAX_OUTWTH;
    }

    if (pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Hgt > XDP_MAX_OUTHGT)
    {
        pstHalInputPara->stXdpPositionCfg.stVideoRect.u32Hgt  = XDP_MAX_OUTHGT;
    }

    pstHalInputPara->stXdpPositionCfg.stDispRect.u32X    =      pstChangeInfor->u32DispX;
    pstHalInputPara->stXdpPositionCfg.stDispRect.u32Y    =      pstChangeInfor->u32DispY;

    pstHalInputPara->stXdpPositionCfg.stDispRect.u32Wth  =      pstChangeInfor->u32DispWth;
    pstHalInputPara->stXdpPositionCfg.stDispRect.u32Hgt  =      pstChangeInfor->u32DispHgt;


    /*************************get disp position config***************************/
    pstHalInputPara->stXdpDispCfg.enDispMode                 = 0;
    pstHalInputPara->stXdpDispCfg.enOutClrSpace              = VDP_CLR_SPACE_YUV_709_L;

    /*************************get vc1cfg position config***************************/
    pstHalInputPara->stXdpNodeInfo.enOnOffLineMode = (HI_TRUE == bOnline) ? XDP_HAL_STATUS_ONLINE: XDP_HAL_STATUS_OFFLINE;
    pstHalInputPara->stXdpNodeInfo.bApbConfig      =  HI_TRUE;
    pstHalInputPara->stXdpNodeInfo.bMaskEn         =  HI_TRUE;
    pstHalInputPara->stXdpNodeInfo.bFreezeEn       = (HI_TRUE == bOnline) ? HI_FALSE: HI_TRUE;


    /*************************get wbc position config***************************/
    pstHalInputPara->stXdpWbcDhdCfg.enWbcRootPath = XDP_WBC_ROOT_PATH_BLBX;
    pstHalInputPara->stXdpWbcDhdCfg.enWbcModeOut  = XDP_WBC_MODE_OUT_INTERFACE;
    pstHalInputPara->stXdpWbcDhdCfg.bWbcEn        =  HI_FALSE;

    return HI_SUCCESS;
}

