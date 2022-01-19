/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2018/05/18
  Description   :
  History       :
  1.Date        : 2018/05/18
    Modification: Created file
******************************************************************************/
#ifndef __HISDTV100_SAT_CORE_H__
#define __HISDTV100_SAT_CORE_H__

#include "hi_unf_frontend.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define SAT_CHN_SEL             0x0
#define SAT_AXI_RSTN            0x07
#define SAT_CLK_SEL             0x08
#define SAT_CATCH_CLK_SEL       0x0a
#define SAT_MAN_RST_CTRL0       0x20
#define SAT_MAN_RST_CTRL1       0x21
#define SAT_STATE_WAITS         0x22
#define SAT_DEMO_FREQ_L         0x23
#define SAT_DEMO_FREQ_M         0x24
#define SAT_DEMO_FREQ_H         0x25
#define SAT_FEC_FREQ_L          0x26
#define SAT_FEC_FREQ_M          0x27
#define SAT_FEC_FREQ_H          0x28
#define SAT_SNR_DIFF            0x29
#define SAT_FS_DIFF             0x2A
#define SAT_SIG_CHANGE          0x2B
#define SAT_LOCK_FLAG           0x2C
#define SAT_TUNER_SEL           0x2D
#define SAT_RSTN_CTRL           0x2E
#define SAT_ILA_SEL             0x2F
#define SAT_AGC_SPEED_BOUND     0x30
#define SAT_AGC_GOAL            0x31
#define SAT_AGCOK_WAIT          0x32
#define SAT_AGC_CTRL            0x33
#define SAT_AGC_DC_I            0x34
#define SAT_AGC_DC_Q            0x35
#define SAT_DAGC_CTRL           0x36
#define SAT_AGC_CTRL_L          0x37
#define SAT_AGC_CTRL_H          0x38
#define SAT_AMP_ERR_IIR         0x39
#define SAT_PDM_CTRL_L          0x3A
#define SAT_PDM_CTRL_H          0x3B
#define SAT_USE_PWM             0x3C
#define SAT_TR_CTRL1            0x40
#define SAT_DAGC_STD            0x41
#define SAT_TR_CTRL2            0x42
#define SAT_TR_MONITOR          0x43
#define SAT_CNT_THRESH          0x44
#define SAT_FS_H                0x45
#define SAT_FS_L                0x46
#define SAT_FS_M                0x47
#define SAT_CENT_FREQ_L         0x48
#define SAT_CENT_FREQ_H         0x49
#define SAT_TR_LOCK_TH          0x4A
#define SAT_TR_UNLOCK_TH        0x4B
#define SAT_FS_OFFSET_FC_L      0x4C
#define SAT_FS_OFFSET_FC_H      0x4D
#define SAT_FREQ_OFFSET_FC_L    0x4E
#define SAT_FREQ_OFFSET_FC_H    0x4F
#define SAT_PLH_SYNC            0x50
#define SAT_PLH_LOST_TH         0x51
#define SAT_CR_CTRL_SW          0x52
#define SAT_SCAN_STEP_L         0x53
#define SAT_SCAN_STEP_FB        0x54
#define SAT_SCAN_ADJUST         0x55
#define SAT_CR_ZUNI_WAIT        0x56
#define SAT_CR_BW_ADJUST        0x57
#define SAT_CR_BW_MAX           0x58
#define SAT_CR_BW_SET           0x59
#define SAT_CR_CN               0x5A
#define SAT_CR_STATE            0x5B
#define SAT_PLS_CODE            0x5C
#define SAT_FREQ_INV            0x5D
#define SAT_CR_ZUNI_BW_L        0x5E
#define SAT_CR_ZUNI_BW_H        0x5F
#define SAT_SYNC_FREQ_L         0x60
#define SAT_SYNC_FREQ_H         0x61
#define SAT_SCAN_FREQ_L         0x62
#define SAT_SCAN_FREQ_H         0x63
#define SAT_FREQ_ACC_L          0x64
#define SAT_FREQ_ACC_H          0x65
#define SAT_TR_FREQ_FB_L        0x66
#define SAT_TR_FREQ_FB_H        0x67
#define SAT_CR_LOOP_DC_L        0x68
#define SAT_CR_LOOP_DC_H        0x69
#define SAT_SG_AUTO             0x6A
#define SAT_CHIP_ID_0           0x6C
#define SAT_CHIP_ID_1           0x6D
#define SAT_CHIP_ID_2           0x6E
#define SAT_CHIP_ID_3           0x6F
#define SAT_EQU_CTRL            0x70
#define SAT_LMS_STEP            0x71
#define SAT_LEAK_SPEED          0x72
#define SAT_AMP_CTRL            0x73
#define SAT_BYPASS_TAP          0x74
#define SAT_CN_CTRL             0x75
#define SAT_EQU_TAP_REAL        0x76
#define SAT_EQU_TAP_IMAG        0x77
#define SAT_EQU_TAP_SEL         0x78
#define SAT_EQU_WAIT            0x79
#define SAT_XREG_INIT_LOW       0x7A
#define SAT_XREG_INIT_MID       0x7B
#define SAT_XREG_INIT_HI        0x7C
#define SAT_RD_WR_TAP           0x7D
#define SAT_NOISE_POW_L         0x7E
#define SAT_NOISE_POW_H         0x7F
#define SAT_TS_PARALL_CTRL      0x80
#define SAT_TS_10_SEL           0x81
#define SAT_TS_32_SEL           0x82
#define SAT_TS_54_SEL           0x83
#define SAT_TS_76_SEL           0x84
#define SAT_TS_98_SEL           0x85
#define SAT_TS_CTRL0            0x86
#define SAT_TS_CTRL3            0x87
#define SAT_TS_CTRL4            0x88
#define SAT_TS_CLK_DIV_F_L      0x89
#define SAT_TS_CLK_DIV_F_H      0x8A
#define SAT_ISI_SEL             0x8B
#define SAT_MATTYPE             0x8C
#define SAT_ISI_NUM             0x8D
#define SAT_CRC_ERR             0x8E
#define SAT_RST_WAIT            0x8F
#define SAT_FEC_CTRL_BCH        0x90
#define SAT_FEC_CTRL_LDPC       0x91
#define SAT_FEC_CTRL_BER        0x92
#define SAT_AUTO_DLY            0x93
#define SAT_FEC_CTRL_PRE        0x94
#define SAT_FEC_CTRL_POST       0x95
#define SAT_FEC_BER_L           0x96
#define SAT_FEC_BER_H           0x97
#define SAT_FEC_FER_L           0x98
#define SAT_FEC_FER_H           0x99
#define SAT_NULL_PARA           0x9A
#define SAT_PRBS_STA_TIM        0x9B
#define SAT_SWITCH_DLY          0x9C
#define SAT_T2_SUCCESS          0x9E
#define SAT_RD_STA_ERR          0x9F
#define SAT_CBS_FC_CTRL         0xA0
#define SAT_CBS_FO_CTRL         0xA1
#define SAT_CBS_TH_1            0xA2
#define SAT_CBS_TH_2            0xA3
#define SAT_CBS_FS_MSB          0xA4
#define SAT_CBS_NBI_CTRL        0xA6
#define SAT_CBS_NUM_CTRL        0xA7
#define SAT_CBS_CTRL_REG        0xA8
#define SAT_CBS_FS_L            0xA9
#define SAT_CBS_FS_H            0xAA
#define SAT_CBS_FC_L            0xAB
#define SAT_CBS_FC_H            0xAC
#define SAT_CBS_FINISH          0xAD
#define SAT_CBS_RELIABILITY1    0xAE
#define SAT_CBS_R2_NUM          0xAF
#define SAT_DSEC_ADDR           0xB0
#define SAT_DSEC_DATA           0xB1
#define SAT_DSEC_RATIO_L        0xB2
#define SAT_DSEC_RATIO_H        0xB3
#define SAT_DSEC_TX_CTRL        0xB4
#define SAT_DSEC_RX_CTRL        0xB5
#define SAT_DSEC_EN             0xB7
#define SAT_RX_STATE            0xB8
#define SAT_INT_STATE           0xB9
#define SAT_TX_IMP_ENV          0xBA
#define SAT_TX_TWAIT            0xBB
#define SAT_RX_TWAIT            0xBC
#define SAT_DF_FC_L             0xB0
#define SAT_DF_FC_H             0xB1
#define SAT_FS_FC_L             0xB2
#define SAT_FS_FC_M             0xB3
#define SAT_FS_FC_H             0xB4
#define SAT_TCF_FC_L            0xB5
#define SAT_TCF_FC_H            0xB6
#define SAT_RCF_FC_L            0xB7
#define SAT_RCF_FC_H            0xB8
#define SAT_TX_CTRL             0xB9
#define SAT_RX_CTRL             0xBA
#define SAT_ERR_BIT_STA         0xC0
#define SAT_DJB_BER_H           0xC1
#define SAT_DJB_BER_L           0xC2
#define SAT_DJB_ERR2_H          0xC3
#define SAT_DJB_ERR2_L          0xC4
#define SAT_OUT_CTRL            0xC5
#define SAT_NOT_USED            0xC6
#define SAT_SYNC_LCL            0xC7
#define SAT_IS_ISI              0xC8
#define SAT_GS_HEAD0            0xC9
#define SAT_GS_HEAD1            0xCA
#define SAT_GS_HEAD2            0xCB
#define SAT_GS_HEAD3            0xCC
#define SAT_GS_OUT              0xCD
#define SAT_RO_DET_TH           0xCE
#define SAT_GFPS_UPL_L          0xCF
#define SAT_GFPS_UPL_H          0xD0
#define SAT_RO_LOST_TH          0xD1
#define SAT_CR_SRCH             0xE0
#define SAT_LOCK_THRES          0xE1
#define SAT_FS_SRCH_TH          0xE2
#define SAT_PARAM_DVBS          0xE3
#define SAT_OUT_TIM_NM          0xE4
#define SAT_CODE_LEN_CHG_ENA    0xE5
#define SAT_FEC_CTRL_S2         0xE6
#define SAT_SIGMA_S2            0xE7
#define SAT_FEC_CTRL_D1         0xE8
#define SAT_LDPC_ITER_NUM_D1    0xE9
#define SAT_LDPC_ITER_NUM_D2    0xEA
#define SAT_LDPC_ITER_NUM_D3    0xEB
#define SAT_FEC_BER_D1          0xEC
#define SAT_FEC_BER_D2          0xED
#define SAT_FEC_BER_D3          0xEE
#define SAT_FEC_BER_D4          0xEF
#define SAT_CATCH_DATA          0xF0
#define SAT_CATCH_CTRL          0xF1

#define SAT_BS_WINDOW_STEP_KHZ (45000)

HI_S32 HiSDTV100_Sat_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType);
HI_S32 HiSDTV100_Sat_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);
HI_S32 HiSDTV100_Sat_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_Sat_SetSatAttr(HI_U32 u32TunerPort, HI_UNF_TUNER_SAT_ATTR_S *pstSatTunerAttr);
HI_S32 HiSDTV100_Sat_SetLnbOut(HI_U32 u32TunerPort, TUNER_LNB_OUT_E enOut);
HI_S32 HiSDTV100_Sat_SendContinuous22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K);
HI_S32 HiSDTV100_Sat_SendTone(HI_U32 u32TunerPort, HI_U32 u32Tone);
HI_S32 HiSDTV100_Sat_DiSEqCSendMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_SENDMSG_S *pstSendMsg);
HI_S32 HiSDTV100_Sat_DiSEqCRecvMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_RECVMSG_S *pstRecvMsg);
HI_S32 HiSDTV100_Sat_SetFuncMode(HI_U32 u32TunerPort, TUNER_FUNC_MODE_E enFuncMode);
HI_S32 HiSDTV100_Sat_BlindscanInit(HI_U32 u32TunerPort, TUNER_BLINDSCAN_INITPARA_S *pstPara);
HI_S32 HiSDTV100_Sat_BlindscanAction(HI_U32 u32TunerPort, TUNER_BLINDSCAN_PARA_S *pstPara);
HI_S32 HiSDTV100_Sat_TpVerify(HI_U32 u32TunerPort, TUNER_TP_VERIFY_PARAMS_S * pstChannel);
HI_S32 HiSDTV100_Sat_SetScramble(HI_U32 u32TunerPort, HI_U32 u32ScrambleN);
HI_S32 HiSDTV100_UNIC_GetSigStat(HI_U32 u32TunerPort, HI_U32 *pu32SigStat);
HI_S32 HiSDTV100_UNIC_ClearChangeFlag(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_UNIC_CheckTPChange(HI_U32 u32TunerPort, HI_U32 u32SymbRateKHz, HI_U32 au32Chanchange[3]);

//Internal
HI_S32 Sat_SetSymRate(HI_U32 u32TunerPort, HI_U32 u32SymRate);  /*u32SymRate unit hz*/

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

