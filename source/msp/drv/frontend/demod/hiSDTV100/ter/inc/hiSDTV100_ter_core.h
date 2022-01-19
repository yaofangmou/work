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
#ifndef __HISDTV100_TER_CORE_H__
#define __HISDTV100_TER_CORE_H__

#include "hi_unf_frontend.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_Ter_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType);
HI_S32 HiSDTV100_Ter_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel);
HI_S32 HiSDTV100_Ter_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_Ter_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby);
HI_S32 HiSDTV100_Ter_SetSigType(HI_U32 u32TunerPort, HI_UNF_TUNER_SIG_TYPE_E enSigType);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

