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
#include "hi_type.h"
#include "drv_tuner_ioctl.h"
#include "drv_demod.h"
#include "hi_drv_proc.h"

#include "hiSDTV100.h"
#include "hiSDTV100_config.h"
#include "hiSDTV100_hal.h"
#include "hiSDTV100_mcu.h"
#if defined(HISDTV100_CAB_SUPPORT)
#include "hiSDTV100_cab_core.h"
#include "hiSDTV100_cab_info.h"
#endif
#if defined(HISDTV100_SAT_SUPPORT)
#include "hiSDTV100_sat_core.h"
#include "hiSDTV100_sat_info.h"
#endif
#include "hiSDTV100_qtc.h"
#include "hiSDTV100_sampleData.h"
#if defined(HISDTV100_TER_SUPPORT)
#include "hiSDTV100_ter_core.h"
#include "hiSDTV100_ter_info.h"
#include "hiSDTV100_isdbt_core.h"
#include "hiSDTV100_isdbt_info.h"
#include "hiSDTV100_dvbt2_core.h"
#include "hiSDTV100_dvbt2_info.h"
#endif
#if defined(HI_FPGA_SUPPORT)
#include "hiSDTV100_fpga.h"
#endif

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

inline HI_UNF_TUNER_SIG_TYPE_E HiSDTV100_GetDevSigType(HI_U32 u32TunerPort)
{
    return g_stTunerOps[u32TunerPort].enSigType;
}

inline HI_BOOL HiSDTV100_IsTer(HI_U32 u32TunerPort)
{
    if ((g_stTunerOps[u32TunerPort].enSigType >= HI_UNF_TUNER_SIG_TYPE_DVB_T)
        && (g_stTunerOps[u32TunerPort].enSigType <= HI_UNF_TUNER_SIG_TYPE_ISDB_T))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

inline HI_BOOL HiSDTV100_IsCab(HI_U32 u32TunerPort)
{
    if ((g_stTunerOps[u32TunerPort].enSigType == HI_UNF_TUNER_SIG_TYPE_CAB)
        || (g_stTunerOps[u32TunerPort].enSigType == HI_UNF_TUNER_SIG_TYPE_J83B))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

inline HI_BOOL HiSDTV100_IsSat(HI_U32 u32TunerPort)
{
    if (g_stTunerOps[u32TunerPort].enSigType == HI_UNF_TUNER_SIG_TYPE_SAT)
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

HI_S32 HiSDTV100_ADP_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_DBG_PrintU32(u8I2cChannel);
    HI_DBG_PrintU32(enTunerType);
    HI_DBG_PrintU32(g_stTunerOps[u32TunerPort].enSigType);

#if defined(HI_FPGA_SUPPORT)
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_FPGA_Init(u32TunerPort, s_tuner_pGpioFunc));
#endif

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DemAddrCfg(g_stTunerOps[u32TunerPort].u32DemodAddress));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_CrgCfg(g_stTunerOps[u32TunerPort].enSigType));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_PeriCfg(u32TunerPort, HI_TRUE));

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_Init(u32TunerPort, u8I2cChannel, enTunerType));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_Init(u32TunerPort, u8I2cChannel, enTunerType));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_Init(u32TunerPort, u8I2cChannel, enTunerType));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);
    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_Connect(u32TunerPort, pstChannel));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_Connect(u32TunerPort, pstChannel));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_Connect(u32TunerPort, pstChannel));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_DeInit(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    RESET_MCU(u32TunerPort);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_PeriCfg(u32TunerPort, HI_FALSE));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E  *penTunerStatus)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetStatus(u32TunerPort, penTunerStatus));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetStatus(u32TunerPort, penTunerStatus));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetStatus(u32TunerPort, penTunerStatus));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetBer(u32TunerPort, pu32BER));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetBer(u32TunerPort, pu32BER));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetBer(u32TunerPort, pu32BER));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetSnr(u32TunerPort, pu32SNR));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetSnr(u32TunerPort, pu32SNR));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetSnr(u32TunerPort, pu32SNR));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetSignalStrength(u32TunerPort, pu32SignalStrength));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetSignalStrength(u32TunerPort, pu32SignalStrength));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetSignalStrength(u32TunerPort, pu32SignalStrength));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetSignalInfo(u32TunerPort, pstInfo));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetSignalInfo(u32TunerPort, pstInfo));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetSignalInfo(u32TunerPort, pstInfo));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb )
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Symb);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetFreqSymbOffset(u32TunerPort, pu32Freq, pu32Symb));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_GetFreqSymbOffset(u32TunerPort, pu32Freq, pu32Symb));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetFreqSymbOffset(u32TunerPort, pu32Freq, pu32Symb));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SetSigType(HI_U32 u32TunerPort, HI_UNF_TUNER_SIG_TYPE_E enSigType)
{
    HI_S32 s32Ret = HI_SUCCESS;
    static HI_UNF_TUNER_SIG_TYPE_E enOldSigType = HI_UNF_TUNER_SIG_TYPE_BUTT;

    HI_FuncEnter();

    enOldSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    if(enOldSigType == enSigType)
    {
        HI_WARN_TUNER("Same sigType:%d now.\n", enSigType);
        HI_FuncExit();
        return HI_SUCCESS;
    }

    //DeInit demod first
    if ((enOldSigType >= HI_UNF_TUNER_SIG_TYPE_DVB_T)
        && (enOldSigType <= HI_UNF_TUNER_SIG_TYPE_ISDB_T))
    {
#if defined(HISDTV100_TER_SUPPORT)
        if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enOldSigType)
                    || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enOldSigType))
        {
            #ifdef HISDTV100_SUPPORT_DVBT2
                HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_DeInit(u32TunerPort));
            #else
                HI_WARN_PrintU32(enOldSigType);
                HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
                return HI_ERR_TUNER_INVALID_SIGTYPE;
            #endif
        }
        else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enOldSigType)
        {
            #ifdef HISDTV100_SUPPORT_ISDBT
                HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_DeInit(u32TunerPort));
            #else
                HI_WARN_PrintU32(enOldSigType);
                HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
                return HI_ERR_TUNER_INVALID_SIGTYPE;
            #endif
        }
        else
        {
            HI_WARN_PrintU32(enOldSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        }
#endif
    }
    else if ((enOldSigType == HI_UNF_TUNER_SIG_TYPE_CAB)
        || (enOldSigType == HI_UNF_TUNER_SIG_TYPE_J83B))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(enOldSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (enOldSigType == HI_UNF_TUNER_SIG_TYPE_SAT)
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_DeInit(u32TunerPort));
        #else
            HI_WARN_PrintU32(enOldSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(enOldSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

#if defined(HI_FPGA_SUPPORT)
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_FPGA_Init(u32TunerPort, s_tuner_pGpioFunc));
#endif

    //Init demod
    if ((enSigType >= HI_UNF_TUNER_SIG_TYPE_DVB_T)
        && (enSigType <= HI_UNF_TUNER_SIG_TYPE_ISDB_T))
    {
#if defined(HISDTV100_TER_SUPPORT)
        if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == enSigType)
                    || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == enSigType))
        {
            #ifdef HISDTV100_SUPPORT_DVBT2
                HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_Init(u32TunerPort));
            #else
                HI_WARN_PrintU32(enSigType);
                HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
                return HI_ERR_TUNER_INVALID_SIGTYPE;
            #endif
        }
        else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == enSigType)
        {
            #ifdef HISDTV100_SUPPORT_ISDBT
                HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_Init(u32TunerPort));
            #else
                HI_WARN_PrintU32(enSigType);
                HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
                return HI_ERR_TUNER_INVALID_SIGTYPE;
            #endif
        }
        else
        {
            HI_WARN_PrintU32(enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        }
#endif
    }
    else if ((enSigType == HI_UNF_TUNER_SIG_TYPE_CAB)
        || (enSigType == HI_UNF_TUNER_SIG_TYPE_J83B))
    {
        #ifdef HISDTV100_CAB_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Cab_Init(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel,
                                                                                            g_stTunerOps[u32TunerPort].enTunerDevType));
        #else
            HI_WARN_PrintU32(enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (enSigType == HI_UNF_TUNER_SIG_TYPE_SAT)
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_Init(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel,
                                                                                            g_stTunerOps[u32TunerPort].enTunerDevType));
        #else
            HI_WARN_PrintU32(enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    //update signal type
    g_stTunerOps[u32TunerPort].enSigType = enSigType;

    HI_FuncExit();
    return HI_SUCCESS;
}

#if defined(HISDTV100_TER_SUPPORT)
HI_S32 HiSDTV100_ADP_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8PLPNum);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetPlpNum(u32TunerPort, pu8PLPNum));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

#if 0
HI_S32 DEMOD_ADP_HiDTV200_GetPlpDump(DRV_FE_CTRL_PLPDUMP_S *pstPlpDump)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPlpDump);

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetPlpDump(pstPlpDump));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}
#endif

HI_S32 HiSDTV100_ADP_SetPLPPara(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_PLP_PARA_S *pstPLPPara)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_SetPLPPara(u32TunerPort, pstPLPPara));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetPLPInfo(HI_U32 u32TunerPort, HI_U32 u32Index, HI_UNF_TUNER_TER_PLP_INFO_S *pstPLPInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_GetPLPInfo(u32TunerPort, u32Index, pstPLPInfo));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_MonitorLayersConfig(HI_U32 u32TunerPort, HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S *pstMonitorLayersConfig)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_MonitorLayersConfig(u32TunerPort, pstMonitorLayersConfig));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}
#endif

#if defined(HISDTV100_SAT_SUPPORT)
HI_S32 HiSDTV100_ADP_SetSatAttr(HI_U32 u32TunerPort, HI_UNF_TUNER_SAT_ATTR_S *pstSatTunerAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstSatTunerAttr);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetSatAttr(u32TunerPort, pstSatTunerAttr));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SetLnbOut(HI_U32 u32TunerPort, TUNER_LNB_OUT_E enOut)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetLnbOut(u32TunerPort, enOut));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SendContinuous22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SendContinuous22K(u32TunerPort, u32Continuous22K));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SendTone(HI_U32 u32TunerPort, HI_U32 u32Tone)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SendTone(u32TunerPort, u32Tone));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_DiSEqCSendMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_SENDMSG_S *pstSendMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstSendMsg);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_DiSEqCSendMsg(u32TunerPort, pstSendMsg));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_DiSEqCRecvMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_RECVMSG_S *pstRecvMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstRecvMsg);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_DiSEqCRecvMsg(u32TunerPort, pstRecvMsg));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SetFuncMode(HI_U32 u32TunerPort, TUNER_FUNC_MODE_E enFuncMode)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetFuncMode(u32TunerPort, enFuncMode));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_BlindscanInit(HI_U32 u32TunerPort, TUNER_BLINDSCAN_INITPARA_S *pstPara)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPara);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_BlindscanInit(u32TunerPort, pstPara));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        HI_FuncExit();
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_BlindscanAction(HI_U32 u32TunerPort, TUNER_BLINDSCAN_PARA_S *pstPara)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPara);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_BlindscanAction(u32TunerPort, pstPara));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_TpVerify(HI_U32 u32TunerPort, TUNER_TP_VERIFY_PARAMS_S * pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_TpVerify(u32TunerPort, pstChannel));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetAgc(HI_U32 u32TunerPort, HI_U32 u32FreqCenter,HI_U32 *pu32Agc)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Agc);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetAgc(u32TunerPort, u32FreqCenter, pu32Agc));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SetIsiID(HI_U32 u32TunerPort, HI_U8 u8IsiId)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetIsiID(u32TunerPort, u8IsiId));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        HI_FuncExit();
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetTotalStream(HI_U32 u32TunerPort, HI_U32 *pu32TotalStream)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32TotalStream);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetTotalStream(u32TunerPort, pu32TotalStream));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_GetIsiID(HI_U32 u32TunerPort, HI_U8 u8Stream, HI_U8 *pu8IsiId)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8IsiId);

    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetIsiID(u32TunerPort, u8Stream, pu8IsiId));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_SetScramble(HI_U32 u32TunerPort, HI_U32 u32ScrambleValue)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetScramble(u32TunerPort, u32ScrambleValue));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_UNIC_GetSigStat(HI_U32 u32TunerPort, HI_U32 *pu32SigStat)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_UNIC_GetSigStat(u32TunerPort, pu32SigStat));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_UNIC_ClearChangeFlag(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_UNIC_ClearChangeFlag(u32TunerPort));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_UNIC_CheckTPChange( HI_U32 u32TunerPort, HI_U32 u32SymbRateKHz, HI_U32 au32Chanchange[3])
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_UNIC_CheckTPChange(u32TunerPort, u32SymbRateKHz, au32Chanchange));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

#endif

HI_VOID HiSDTV100_ADP_GetRegisters(HI_U32 u32TunerPort, HI_VOID *p)
{
    HI_U8 i = 0;
    HI_U8 u8RegVal = 0;

    if (NULL == p)
    {
        return;
    }

    printk("%d, %s.\n",__LINE__,__func__);
    //printf reg value
    PROC_PRINT(p,"  addr ");
    for(i = 0;i <= 0x0F;i++)
    {
        PROC_PRINT(p,"%2x ",i);
    }

    for(i = 0;i < 0xFF;i++)
    {
        qam_read_byte(u32TunerPort, i, &u8RegVal);
        if(i % 16 == 0)
        {
            PROC_PRINT(p,"\n %04x0:",i/16);
        }
        PROC_PRINT(p,"%2x ",u8RegVal);
    }
    PROC_PRINT(p,"\n");

    return;
}


HI_S32 HiSDTV100_ADP_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{
    HI_FuncEnter();

    if (HiSDTV100_IsTer(u32TunerPort))
    {
        #ifdef HISDTV100_TER_SUPPORT
            HI_S32 s32Ret = HI_SUCCESS;
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Ter_Standby(u32TunerPort, u32Standby));
        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsCab(u32TunerPort))
    {
        #ifdef HISDTV100_CAB_SUPPORT

        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else if (HiSDTV100_IsSat(u32TunerPort))
    {
        #ifdef HISDTV100_SAT_SUPPORT

        #else
            HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
        #endif
    }
    else
    {
        HI_WARN_PrintU32(g_stTunerOps[u32TunerPort].enSigType);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
        return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */
