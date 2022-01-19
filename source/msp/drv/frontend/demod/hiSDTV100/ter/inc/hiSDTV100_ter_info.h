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
#ifndef __HISDTV100_TER_INFO_H__
#define __HISDTV100_TER_INFO_H__

#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_Ter_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus);
HI_S32 HiSDTV100_Ter_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER);
HI_S32 HiSDTV100_Ter_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR);
HI_S32 HiSDTV100_Ter_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength);
HI_S32 HiSDTV100_Ter_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo);
HI_S32 HiSDTV100_Ter_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb );
HI_S32 HiSDTV100_Ter_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum);
//HI_S32 HiSDTV100_Ter_GetPlpDump(HI_U32 u32TunerPort, DRV_FE_CTRL_PLPDUMP_S *pstPlpDump);
HI_S32 HiSDTV100_Ter_GetPLPInfo(HI_U32 u32TunerPort, HI_U32 u32Index, HI_UNF_TUNER_TER_PLP_INFO_S *pstPLPInfo);
HI_S32 HiSDTV100_Ter_SetPLPPara(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_PLP_PARA_S *pstPLPPara);
HI_S32 HiSDTV100_Ter_MonitorLayersConfig(HI_U32 u32TunerPort, HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S *pstMonitorLayersConfig);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

