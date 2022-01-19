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
#ifndef __HISDTV100_ISDBT_INFO_H__
#define __HISDTV100_ISDBT_INFO_H__

#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define ISDBT_CIR_FILE_NAME              "fe_cir_data_ISDBT"
#define ISDBT_FILE_POSTFIX               "csv"
#define ISDBT_FILE_NAME_LEN              (128)
#define ISDBT_SAMPLE_DATA_CNT            (1024)

HI_S32 HiSDTV100_ISDBT_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus);
HI_S32 HiSDTV100_ISDBT_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo);
HI_S32 HiSDTV100_ISDBT_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER);
HI_S32 HiSDTV100_ISDBT_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR);
HI_S32 HiSDTV100_ISDBT_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb );
HI_S32 HiSDTV100_ISDBT_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength);
HI_S32 HiSDTV100_ISDBT_GetCIR(HI_U32 u32TunerPort, HI_U32 u32DataLen);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

