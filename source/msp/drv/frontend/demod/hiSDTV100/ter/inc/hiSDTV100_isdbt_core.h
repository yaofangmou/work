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
#ifndef __HISDTV100_ISDBT_CORE_H__
#define __HISDTV100_ISDBT_CORE_H__

#include "hi_unf_frontend.h"
#include "hi_drv_mmz.h"
#include "hi_reg_common.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define HiISDBT_RAW_BUF_SIZE               0x800000+0x100

#define ISDBT_CHN_SEL                        0x00
#define ISDBT_AXI_TOUT                       0x01
#define ISDBT_AXI_BASE_ADDR0         0x03
#define ISDBT_AXI_BASE_ADDR1         0x04
#define ISDBT_AXI_BASE_ADDR2        0x05
#define ISDBT_AXI_BASE_ADDR3        0x06
#define ISDBT_AXI_RSTN                    0x07
#define ISDBT_CLK_SEL                    0x08
#define ISDBT_AXI_CHN_ORDER        0x0a

#define ISDBT_MAN_RSTN_CTRL0         0x20
#define ISDBT_MAN_RSTN_CTRL1         0x21
#define ISDBT_STATE_WAITS                0x22
#define ISDBT_CLK_DEMO_L                 0x23
#define ISDBT_CLK_DEMO_M             0x24
#define ISDBT_CLK_DEMO_H             0x25
#define ISDBT_LOCK_FLAG                   0x2C
#define ISDBT_TUNER_SEL                   0x2D
#define ISDBT_RSTN_CTRL                   0x2E
#define ISDBT_VEC_SEL                      0x2F

#define ISDBT_AGC_GOAL                   0x31
#define ISDBT_AGC_CTRL                    0x33
#define ISDBT_AGC_CTRL_L                0x37
#define ISDBT_AGC_CTRL_H               0x38

#define ISDBT_MF_SEL                     0x40
#define ISDBT_DAGC_REF                   0x42
#define ISDBT_DAGC_SPEED              0x43
#define ISDBT_IF_FREQ_L                  0x4A
#define ISDBT_IF_FREQ_H                  0x4B
#define ISDBT_BAND_WIDTH             0x4E

#define ISDBT_CLK_ADC_L                   0x55
#define ISDBT_CLK_ADC_M               0x56
#define ISDBT_CLK_ADC_H                  0x57

#define ISDBT_LOOP_BW                       0x60
#define ISDBT_THRES                         0x67

#define ISDBT_CPE_ENA                 0x72
#define ISDBT_SP_CTRL                   0x74
#define ISDBT_SNR_L                     0x7A
#define ISDBT_SNR_H                     0x7B

#define ISDBT_CHN_FFT_GI                0x85

#define ISDBT_CAR_OFFSET_L              0x88
#define ISDBT_CAR_OFFSET_H              0x89

#define ISDBT_BER_CTRL                 0x92
#define ISDBT_FEC_BER_L                 0x96
#define ISDBT_FEC_BER_H                 0x97

#define ISDBT_PART_HIER                 0xB0

#define ISDBT_TMCC_1                 0xC0
#define ISDBT_TMCC_2                 0xC1
#define ISDBT_TMCC_3                 0xC2
#define ISDBT_TMCC_4                 0xC3
#define ISDBT_TMCC_5                 0xC4
#define ISDBT_TMCC_6                 0xC5
#define ISDBT_TMCC_7                 0xC6

#define ISDBT_CIR_DATA                 0xF0
#define ISDBT_CIR_CTRL                 0xF1

typedef struct hiISDBT_PARA_S
{
    MMZ_BUFFER_S stIsdbtBuf;
    HI_BOOL bIsdbtBufInit;
}ISDBT_PARA_S;

HI_S32 HiSDTV100_ISDBT_Init(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_ISDBT_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);
HI_S32 HiSDTV100_ISDBT_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_ISDBT_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby);
HI_S32 HiSDTV100_ISDBT_Monitorlayer(HI_U32 u32TunerPort, HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S *pstMonitorLayersConfig);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

