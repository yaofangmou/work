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
#ifndef __HISDTV100_DVBT2_CORE_H__
#define __HISDTV100_DVBT2_CORE_H__

#include "hi_unf_frontend.h"
#include "hi_drv_mmz.h"
#include "hi_reg_common.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define DVBT2_RAW_BUF_SIZE               0xc00000+0x100
#define DVBT_RAW_BUF_SIZE                0x100000+0x100

#define DVBT2_CHN_SEL                        0x00
#define DVBT2_AXI_TOUT                       0x01
#define DVBT2_AXI_BASE_ADDR0         0x03
#define DVBT2_AXI_BASE_ADDR1         0x04
#define DVBT2_AXI_BASE_ADDR2        0x05
#define DVBT2_AXI_BASE_ADDR3        0x06
#define DVBT2_AXI_RSTN                    0x07
#define DVBT2_CLK_SEL                    0x08
#define DVBT2_AXI_CHN_ORDER         0x0a

#define DVBT2_MAN_RSTN_CTRL0         0x20
#define DVBT2_MAN_RSTN_CTRL1         0x21
#define DVBT2_STATE_WAITS                0x22
#define DVBT2_CLK_DEMO_L                 0x23
#define DVBT2_CLK_DEMO_M             0x24
#define DVBT2_CLK_DEMO_H             0x25
#define DVBT2_LOCK_FLAG                   0x2C
#define DVBT2_RSTN_CTRL                   0x2E
#define DVBT2_VEC_SEL                   0x2F

#define DVBT2_AGC_SPEED_BOUND        0x30
#define DVBT2_AGC_GOAL                   0x31
#define DVBT2_AGCOK_WAIT                0x32
#define DVBT2_AGC_CTRL                    0x33
#define DVBT2_AGC_DC_I                   0x34
#define DVBT2_AGC_DC_Q                   0x35
#define DVBT2_DAGC_CTRL                  0x36
#define DVBT2_AGC_CTRL_H              0x37
#define DVBT2_AGC_CTRL_L                  0x38
#define DVBT2_AMP_ERR_IIR             0x39
#define DVBT2_PDM_CTRL_L              0x3A
#define DVBT2_PDM_CTRL_H                 0x3B

#define DVBT2_DAGC_CTRL_1             0x40
#define DVBT2_DAGC_REF                   0x42
#define DVBT2_DAGC_SPEED              0x43
#define DVBT2_IF_FREQ_L                  0x4A
#define DVBT2_IF_FREQ_H                  0x4B
#define DVBT2_BAND_WIDTH             0x4E

#define DVBT2_CW_FREQ_L                   0x50
#define DVBT2_CW_FREQ_H                   0x51
#define DVBT2_CLK_ADC_L                   0x55
#define DVBT2_CLK_ADC_M               0x56
#define DVBT2_CLK_ADC_H                  0x57
#define DVBT2_ATV_STATE                  0x58

#define DVBT2_FD_GRP               0x61
#define DVBT2_CPE_CTRL                 0x62
#define DVBT2_CIRFLT_CTRL              0x66
#define DVBT2_ECHO_THRES              0x67
#define DVBT2_MIN_THRES              0x69

#define DVBT2_TIM_LOOP_L                 0x70
#define DVBT2_TIM_LOOP_H                 0x71
#define DVBT2_SNR_L                     0x7A
#define DVBT2_SNR_H                     0x7B
#define DVBT2_TMCC_AC                 0x7D

#define DVBT2_CHN_FFT_GI               0x85
#define DVBT2_TIM_OFFSET                  0x87
#define DVBT2_CAR_OFFSET_L              0x88
#define DVBT2_CAR_OFFSET_H              0x89
#define DVBT2_T2_THRES              0x8D

#define DVBT2_FEC_CTRL_T2_S2_2          0x92
#define DVBT2_AUTO_DLY                  0x93
#define DVBT2_FEC_BER_L                 0x96
#define DVBT2_FEC_BER_H                 0x97

#define DVBT2_OUTP_PLL0                  0xA3
#define DVBT2_OUTP_PLL1                  0xA4
#define DVBT2_OUTP_PLL2                  0xA5
#define DVBT2_OUTP_PLL3                  0xA6
#define DVBT2_OUTP_PLL4                  0xA7
#define DVBT2_OUTP_AD_RO                 0xAD
#define DVBT2_OUTP_NCO_CTRL                  0xAF

#define DVBT2_PLP_CTRL                 0xB0
#define DVBT2_PLP_ID0                  0xB1
#define DVBT2_PLP_ID1                  0xB2
#define DVBT2_TPS                         0xB3
#define DVBT2_COD_LOW                 0xB4
#define DVBT2_TPS_DVBT                  0xB5
#define DVBT2_PP_VERSION                  0xB8

#define DVBT2_NUM_PLP                  0xBF

#define DVBT2_PLP_ID_DPLP                  0xc6
#define DVBT2_PLP_TYPE_DPLP                  0xc7
#define DVBT2_PLP_GRP_ID_DPLP                 0xc8
#define DVBT2_PLP_PARAM_DPLP                  0xc9
#define DVBT2_FRM_INTVL_DPLP                  0xca
#define DVBT2_TIM_IL_LEN_DPLP                  0xcb
#define DVBT2_PLP_BLK_MAX_DPLP                  0xcc
#define DVBT2_FIRST_FRMIDX_DPLP                  0xce

#define DVBT2_CELL_ID_H                 0xd9
#define DVBT2_CELL_ID_L                 0xda
#define DVBT2_NETWORK_ID_H              0xdb
#define DVBT2_NETWORK_ID_L              0xdc
#define DVBT2_SYSTEM_ID_H               0xdd
#define DVBT2_SYSTEM_ID_L               0xde

#define DVBT2_CIR_DATA                 0xF0
#define DVBT2_CIR_CTRL                 0xF1

typedef struct hiDVBT2_PARA_S
{
    MMZ_BUFFER_S stDvbt2Buf;
    HI_BOOL bDvbt2BufInit;
}DVBT2_PARA_S;

HI_VOID DVBT2_HotReset(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_DVBT2_Init(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_DVBT2_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);
HI_S32 HiSDTV100_DVBT2_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_DVBT2_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

