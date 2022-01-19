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
#include "hiSDTV100_ter_info.h"
#include "hiSDTV100_config.h"

#include "hiSDTV100_isdbt_core.h"
#include "hiSDTV100_isdbt_info.h"
#include "hiSDTV100_dvbt2_core.h"
#include "hiSDTV100_dvbt2_info.h"
#include "drv_demod.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_Ter_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetStatus(u32TunerPort, penTunerStatus));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetStatus(u32TunerPort, penTunerStatus));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetBer(u32TunerPort, pu32BER));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetBer(u32TunerPort, pu32BER));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetSnr(u32TunerPort, pu32SNR));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetSnr(u32TunerPort, pu32SNR));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetSignalStrength(u32TunerPort, pu32SignalStrength));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetSignalStrength(u32TunerPort, pu32SignalStrength));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetSignalInfo(u32TunerPort, pstInfo));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetSignalInfo(u32TunerPort, pstInfo));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb )
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Symb);

    if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enCurrentSigType)
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enCurrentSigType))
    {
        #ifdef HISDTV100_SUPPORT_DVBT2
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetFreqSymbOffset(u32TunerPort, pu32Freq, pu32Symb));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enCurrentSigType)
    {
        #ifdef HISDTV100_SUPPORT_ISDBT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetFreqSymbOffset(u32TunerPort, pu32Freq, pu32Symb));
        #else
            HI_INFO_PrintU32(enCurrentSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum)
{
    HI_S32 s32Ret = HI_SUCCESS;
    #ifndef HISDTV100_SUPPORT_DVBT2
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    #endif

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8PLPNum);

    #ifdef HISDTV100_SUPPORT_DVBT2
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetPlpNum(u32TunerPort, pu8PLPNum));
    #else
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    #endif

    HI_FuncExit();
    return s32Ret;
}

#if 0
HI_S32 HiSDTV100_Ter_GetPlpDump(DRV_FE_CTRL_PLPDUMP_S *pstPlpDump)
{
    HI_S32 s32Ret = HI_SUCCESS;
    #ifndef HISDTV100_SUPPORT_DVBT2
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    #endif

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPlpDump);

    #ifdef HISDTV100_SUPPORT_DVBT2
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetPlpDump(pstPlpDump));
    #else
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    #endif

    HI_FuncExit();
    return s32Ret;
}
#endif

HI_S32 HiSDTV100_Ter_SetPLPPara(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_PLP_PARA_S *pstPLPPara)
{
    HI_S32 s32Ret = HI_SUCCESS;
    #ifndef HISDTV100_SUPPORT_DVBT2
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    #endif

    HI_FuncEnter();

    #ifdef HISDTV100_SUPPORT_DVBT2
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_SetPLPPara(u32TunerPort, pstPLPPara));
    #else
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    #endif

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_GetPLPInfo(HI_U32 u32TunerPort, HI_U32 u32Index, HI_UNF_TUNER_TER_PLP_INFO_S *pstPLPInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    #ifndef HISDTV100_SUPPORT_DVBT2
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    #endif

    HI_FuncEnter();

    #ifdef HISDTV100_SUPPORT_DVBT2
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetPLPInfo(u32TunerPort, u32Index, pstPLPInfo));
    #else
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    #endif

    HI_FuncExit();
    return s32Ret;
}

HI_S32 HiSDTV100_Ter_MonitorLayersConfig(HI_U32 u32TunerPort, HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S *pstMonitorLayersConfig)
{
    HI_S32 s32Ret = HI_SUCCESS;
    #ifndef HISDTV100_SUPPORT_ISDBT
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);
    #endif

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstMonitorLayersConfig);

    #ifdef HISDTV100_SUPPORT_ISDBT
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_Monitorlayer(u32TunerPort, pstMonitorLayersConfig));
    #else
        HI_INFO_PrintU32(enCurrentSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    #endif

    HI_FuncExit();
    return s32Ret;
}
#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

