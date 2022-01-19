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
#ifndef __HISDTV100_DVBT2_INFO_H__
#define __HISDTV100_DVBT2_INFO_H__

#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define DVBT2_CIR_FILE_NAME              "fe_cir_data_DVBT"
#define DVBT2_FILE_POSTFIX               "csv"
#define DVBT2_FILE_NAME_LEN              (128)
#define DVBT2_SAMPLE_DATA_CNT            (1024)

HI_S32 HiSDTV100_DVBT2_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus);
HI_S32 HiSDTV100_DVBT2_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo);
HI_S32 HiSDTV100_DVBT2_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER);
HI_S32 HiSDTV100_DVBT2_GetSnr(HI_U32 u32TunerPort, HI_U32* pu32SNR);
HI_S32 HiSDTV100_DVBT2_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength);
HI_S32 HiSDTV100_DVBT2_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb );
HI_S32 HiSDTV100_DVBT2_SetPLPPara(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_PLP_PARA_S *pstPLPPara);
HI_S32 HiSDTV100_DVBT2_GetPLPInfo(HI_U32 u32TunerPort, HI_U32 u32Index, HI_UNF_TUNER_TER_PLP_INFO_S *pstPLPInfo);
HI_S32 HiSDTV100_DVBT2_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum);
//HI_S32 HiSDTV100_DVBT2_GetPlpDump(HI_U32 u32TunerPort, DRV_FE_CTRL_PLPDUMP_S *pstPlpDump);
HI_S32 HiSDTV100_DVBT2_GetCIR(HI_U32 u32TunerPort, HI_U32 u32DataLen);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

