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
#include "hiSDTV100.h"
#include "hiSDTV100_config.h"
#include "hiSDTV100_sampleData.h"
#include "hiSDTV100_isdbt_info.h"
#include "hiSDTV100_dvbt2_info.h"
#include "hiSDTV100_cab_info.h"
#include "hiSDTV100_sat_info.h"
#include "drv_demod.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_ADP_GetCIR(HI_U32 u32TunerPort, HI_U32 u32DataLen)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetCIR(u32TunerPort, u32DataLen));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if(HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetCIR(u32TunerPort, u32DataLen));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }
    return s32Ret;
}

HI_S32 HiSDTV100_ADP_GetSampleData(HI_U32 u32TunerPort, TUNER_DATA_SRC_E enDataSrc, HI_U32 u32DataLen, HI_UNF_TUNER_SAMPLE_DATA_S *pstData)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if (HI_UNF_TUNER_SIG_TYPE_SAT == enCurrentSigType)
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetSampleData(u32TunerPort, enDataSrc, u32DataLen, pstData));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if(HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType ||
        HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType)
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetSampleData(u32TunerPort, enDataSrc, u32DataLen, pstData));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }
    HI_FuncExit();
    return s32Ret;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

