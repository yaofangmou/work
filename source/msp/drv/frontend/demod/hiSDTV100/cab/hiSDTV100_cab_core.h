/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2018/07/05
  Description   :
  History       :
  1.Date        : 2018/07/05
    Modification: Created file
******************************************************************************/
#ifndef __HISDTV100_CAB_CORE_H__
#define __HISDTV100_CAB_CORE_H__

#include "hi_unf_frontend.h"
#include "hi_drv_mmz.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define            DVBC_J83B_CHN_SEL                        0x0
#define            DVBC_J83B_AXI_RSTN                    0x07
#define            DVBC_CLK_SEL                        0x08
#define            DVBC_J83B_CATCH_CLK_SEL             0x0a

#define            DVBC_J83B_MAN_RST_CTRL0                0x20
#define            DVBC_J83B_MAN_RST_CTRL1                0x21
#define            DVBC_J83B_DEMO_FREQ_L                    0x23
#define            DVBC_J83B_DEMO_FREQ_M                    0x24
#define            DVBC_J83B_FEC_FREQ_L                    0x26
#define            DVBC_J83B_FEC_FREQ_M                    0x27
#define            DVBC_J83B_CATCH_CTRL                    0x2A
#define            DVBC_J83B_TOUT_CTRL                    0x2B
#define            DVBC_J83B_LOCK_FLAG                    0x2C
#define            DVBC_J83B_MAN_STATE                    0x2D
#define            DVBC_J83B_DEMO_FEC_FREQ_H            0x2E
#define            DVBC_J83B_ILA_SEL                        0x2F

#define            DVBC_J83B_AGC_SPEED_BOUND            0x30
#define            DVBC_J83B_AGC_GOAL                    0x31
#define            DVBC_J83B_AGCOK_WAIT                    0x32
#define            DVBC_J83B_AGC_CTRL                    0x33
#define            DVBC_J83B_AGC_DC_I                    0x34
#define            DVBC_J83B_AGC_DC_Q                    0x35
#define            DVBC_J83B_DAGC_CTRL                    0x36
#define            DVBC_J83B_AGC_CTRL_H                    0x37
#define            DVBC_J83B_AGC_CTRL_L                    0x38
#define            DVBC_J83B_AMP_ERR_IIR                    0x39
#define            DVBC_J83B_PDM_CTRL_H                    0x3A
#define            DVBC_J83B_PDM_CTRL_L                    0x3B
#define            DVBC_J83B_USE_PWM                        0x3C

#define            DVBC_J83B_SF_RMV_CTRL                    0x41
#define            DVBC_J83B_DAGC_REF                    0x42
#define            DVBC_J83B_SCAN_WAIT                    0x43
#define            DVBC_J83B_FREQ_DEV_L                    0x44
#define            DVBC_J83B_FREQ_DEV_H                    0x45
#define            DVBC_J83B_FS_L                            0x46
#define            DVBC_J83B_FS_H                            0x47
#define            DVBC_J83B_TR_CR_CTRL                    0x48
#define            DVBC_J83B_TR_SCAN_CTRL                0x4A
#define            DVBC_J83B_FREQ_ADC_L                    0x4B
#define            DVBC_J83B_FREQ_ADC_M                    0x4C
#define            DVBC_J83B_TR_LOOP_CTRL                0x4D

#define            DVBC_J83B_EQU_CTRL                    0x63
#define            DVBC_J83B_EQU_STEP_WAIT                0x64
#define            DVBC_J83B_EQU_STATUS                    0x66
#define            DVBC_J83B_NOISE_POW_L                    0x6C
#define            DVBC_J83B_NOISE_POW_H                    0x6D
#define            DVBC_J83B_PT_CTRL                        0x6E
#define            DVBC_J83B_PT_CTRL1                        0x6F

#define            DVBC_J83B_PT2_CR_CTRL                    0x70
#define            DVBC_J83B_PLS_CTRL1                    0x77
#define            DVBC_J83B_PLS_CTRL2                    0x78
#define            DVBC_J83B_PLS_CTRL3                    0x79

#define            DVBC_J83B_QLLR_CTRL                    0x90
#define            DVBC_J83B_DEMAP_LOW_CTRL                0x91
#define            DVBC_J83B_SYNC_CTRL                    0x92
#define            DVBC_J83B_ITLV_CW                        0x94
#define            DVBC_J83B_ITLV_AUTO                    0x9C
#define            DVBC_J83B_J83B_RS2_BER                0x9F

#define            DVBC_J83B_OUTP_PLL_INI                0xB0
#define            DVBC_J83B_OUTP_CAP_SET                0xB1
#define            DVBC_J83B_OUTP_PLLUP_FRE                0xB2
#define            DVBC_J83B_OUTP_PLL0                    0xB3
#define            DVBC_J83B_OUTP_PLL1                    0xB4
#define            DVBC_J83B_OUTP_PLL2                    0xB5
#define            DVBC_J83B_OUTP_PLL3                    0xB6
#define            DVBC_J83B_OUTP_PLL4                    0xB7
#define            DVBC_J83B_OUTP_I2C_CLK0                0xB8
#define            DVBC_J83B_OUTP_I2C_CLK1                0xB9
#define            DVBC_J83B_OUTP_I2C_CLK2                0xBA
#define            DVBC_J83B_OUTP_RAM_THRE                0xBB
#define            DVBC_J83B_OUTP_TS_MODE                0xBC
#define            DVBC_J83B_OUTP_SYNC_BYTE                0xBD
#define            DVBC_J83B_OUTP_PKT_SET                0xBE
#define            DVBC_J83B_OUTP_RAND                    0xBF

#define            DVBC_J83B_OUTP_TS_10_SEL                0xC0
#define            DVBC_J83B_OUTP_TS_32_SEL                0xC1
#define            DVBC_J83B_OUTP_TS_54_SEL                0xC2
#define            DVBC_J83B_OUTP_TS_76_SEL                0xC3
#define            DVBC_J83B_OUTP_TS_98_SEL                0xC4
#define            DVBC_J83B_OUTP_BER                    0xC5
#define            DVBC_J83B_OUTP_PKT_MODE                0xC6
#define            DVBC_J83B_OUTP_NEAR_FUL                0xC7
#define            DVBC_J83B_OUTP_SYS_CLK0                0xC8
#define            DVBC_J83B_OUTP_SYS_CLK1                0xC9
#define            DVBC_J83B_OUTP_PLL_CTRL                0xCA
#define            DVBC_J83B_OUTP_BER_RES0                0xCB
#define            DVBC_J83B_OUTP_BER_RES1                0xCC
#define            DVBC_J83B_ERR_LMT_SET                    0xCD
#define            DVBC_J83B_ERR_PKT_L                    0xCE
#define            DVBC_J83B_ERR_PKT_H                    0xCF

#define            DVBC_J83B_CATCH_DATA                 0xF0
#define            DVBC_J83B_CATCH_EN                   0xF1

HI_S32 HiSDTV100_Cab_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType);
HI_S32 HiSDTV100_Cab_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);
HI_S32 HiSDTV100_Cab_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_Cab_SetSigType(HI_U32 u32TunerPort, HI_UNF_TUNER_SIG_TYPE_E enSigType);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

