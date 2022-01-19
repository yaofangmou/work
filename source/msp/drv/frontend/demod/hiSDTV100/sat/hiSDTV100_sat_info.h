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
#ifndef __HIMDTV_SAT_INFO_H__
#define __HIMDTV_SAT_INFO_H__

#include "hi_unf_frontend.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define SAT_SAMPLE_DATA_CNT 1024

HI_S32 HiSDTV100_Sat_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus);
HI_S32 HiSDTV100_Sat_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER);
HI_S32 HiSDTV100_Sat_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR);
HI_S32 HiSDTV100_Sat_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength);
HI_S32 HiSDTV100_Sat_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo);
HI_S32 HiSDTV100_Sat_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb );
HI_S32 HiSDTV100_Sat_GetTotalStream(HI_U32 u32TunerPort, HI_U32 *pu32TotalStream);
HI_S32 HiSDTV100_Sat_GetIsiID(HI_U32 u32TunerPort, HI_U8 u8Stream, HI_U8 *pu8IsiId);
HI_S32 HiSDTV100_Sat_SetIsiID(HI_U32 u32TunerPort, HI_U8 u8IsiId);
HI_S32 HiSDTV100_Sat_GetAgc(HI_U32 u32TunerPort, HI_U32 u32FreqCenter,HI_U32 *pu32Agc);
HI_S32 HiSDTV100_Sat_GetSampleData(HI_U32 u32TunerPort, TUNER_DATA_SRC_E enDataSrc, HI_U32 u32DataLen, HI_UNF_TUNER_SAMPLE_DATA_S *pstData);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

