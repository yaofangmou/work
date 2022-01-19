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
#include "hiSDTV100.h"
#include "hiSDTV100_config.h"

#include "hiSDTV100_ter_core.h"
#include "hiSDTV100_isdbt_core.h"
#include "hiSDTV100_isdbt_info.h"
#include "hiSDTV100_dvbt2_core.h"
#include "hiSDTV100_dvbt2_info.h"
#include "drv_demod.h"
#include "mxl661.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_Ter_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_DBG_PrintU32(enCurrentSigType);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_Init(u32TunerPort));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_Init(u32TunerPort));
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

    switch(enTunerType)
    {
#if defined(TUNER_DEV_TYPE_MXL661)
        case HI_UNF_TUNER_DEV_TYPE_MXL661:
            mxl661_init_tuner(u32TunerPort);
            break;
#endif
        default:
            break;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    HI_U8 u8I2cChannel = g_stTunerOps[u32TunerPort].enI2cChannel;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, u8I2cChannel, pstChannel->u32Frequency);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_Connect(u32TunerPort, pstChannel));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_Connect(u32TunerPort, pstChannel));
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

HI_S32 HiSDTV100_Ter_DeInit(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_DeInit(u32TunerPort));
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

HI_S32 HiSDTV100_Ter_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_Standby(u32TunerPort, u32Standby));
        #else
            HI_WARN_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_Standby(u32TunerPort, u32Standby));
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
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Ter_SetSigType(HI_U32 u32TunerPort, HI_UNF_TUNER_SIG_TYPE_E enSigType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    return s32Ret;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

