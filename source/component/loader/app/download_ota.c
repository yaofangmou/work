/*******************************************************************************
 *                Copyright    , 2009-2014, Hisilicon Tech. Co., Ltd.
 *******************************************************************************
 * File Name       : download_ota.c
 * Version         : Initial draft
 * Author          : Device Chipset STB Development Dept
 * Created Date    : 2009-02-12
 * Last Modified by: sdk
 * Description     :
 * Function List   :
 * Change History  :
 * Version   Date           Author            DefectNum      Description
 * main\1    2009-2-12      sdk               NULL          Create this file.
 ********************************************************************************/
#include "com_osal.h"
#include "com_debug.h"
#include "com_config.h"
#include "hi_unf_frontend.h"
#include "hi_error_mpi.h"
#include "download_ota.h"
#include "frontend_config.h"
#include "hi_unf_i2c.h"

#ifdef HI_LOADER_BOOTLOADER
#include <uboot.h>
#endif

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

#define OTA_D_DMXID             (0)

#define OTA_CONNECT_CHECKTIMES          (10)
#define OTA_CONNECT_CHECKINTERVAL       (50)    //ms
#define OTA_CONNECT_TIMEOUT             (2000)  //ms

#define OTA_ACQUIRE_TRYTIMES            (1000)  //ms
#define OTA_ACQUIRE_TIMEOUT             (10)    //ms


static HI_HANDLE    s_hChannel = HI_INVALID_HANDLE;
static HI_HANDLE    s_hFilter  = HI_INVALID_HANDLE;
static HI_U32       s_u32ChannelPid = 0;

static HI_U32       s_u32I2cChannel = 0;
static HI_U32       s_u32I2CType = 0;



static HI_S32 dlotaTunerCreateI2cChannel(HI_VOID)
{
    HI_S32 s32Ret  = HI_FAILURE;
    HI_U32 GpioSDA = 0;
    HI_U32 GpioSCL = 0;

    COM_DBG_FuncEnter();

    GpioSCL = HIINI_GetLong(TUNERINFO_SECTION, "GpioI2cScl", DEFAULT_GPIOI2C_SCL, FRONTEND_CONFIG_FILE);
    GpioSDA = HIINI_GetLong(TUNERINFO_SECTION, "GpioI2cSda", DEFAULT_GPIOI2C_SDA, FRONTEND_CONFIG_FILE);

    s32Ret = HI_UNF_I2C_CreateGpioI2c(&s_u32I2cChannel, GpioSCL, GpioSDA);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_I2C_CreateGpioI2c, s32Ret);
        return COM_ERR_DEVICE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerDestoryI2cChannel(HI_VOID)
{
    HI_S32 s32Ret = HI_FAILURE;

    COM_DBG_FuncEnter();

    s32Ret = HI_UNF_I2C_DestroyGpioI2c(s_u32I2cChannel);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_I2C_DestroyGpioI2c, s32Ret);
        return COM_ERR_DEVICE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerGetI2cChannel(HI_VOID)
{
    return s_u32I2cChannel;
}


#ifdef HI_LOADER_TUNER_SAT
HI_S32 dlotaTunerSetSatAttr(HI_U32 u32TunerID, HI_LOADER_PARAM_SAT_S* pstParam)
{
    HI_UNF_TUNER_SAT_ATTR_S stSatAttr;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_MemSet(&stSatAttr, 0x00, sizeof(stSatAttr));
    stSatAttr.u32DemodClk      = HIINI_GetLong(TUNERINFO_SECTION, "SatDemodClk",    DEFAULT_SAT_DEMOD_CLK,    FRONTEND_CONFIG_FILE);
    stSatAttr.u16TunerMaxLPF   = HIINI_GetLong(TUNERINFO_SECTION, "SatTunerMaxLPF", DEFAULT_SAT_TUNER_MAXLPF, FRONTEND_CONFIG_FILE);
    stSatAttr.u16TunerI2CClk   = HIINI_GetLong(TUNERINFO_SECTION, "SatTunerI2cClk", DEFAULT_SAT_TUNER_I2CCLK, FRONTEND_CONFIG_FILE);
    stSatAttr.enRFAGC          = HIINI_GetLong(TUNERINFO_SECTION, "SatRfAgc",       DEFAULT_SAT_RF_AGC,       FRONTEND_CONFIG_FILE);
    stSatAttr.enIQSpectrum     = HIINI_GetLong(TUNERINFO_SECTION, "SatIQSpectrum",  DEFAULT_SAT_IQ_SPECTRUM,  FRONTEND_CONFIG_FILE);
    stSatAttr.enTSClkPolar     = HIINI_GetLong(TUNERINFO_SECTION, "SatTsClkPolar",  DEFAULT_SAT_TS_CLK_POLAR, FRONTEND_CONFIG_FILE);
    stSatAttr.enTSFormat       = HIINI_GetLong(TUNERINFO_SECTION, "SatTsFormat",    DEFAULT_SAT_TS_FORMAT,    FRONTEND_CONFIG_FILE);
    stSatAttr.enTSSerialPIN    = HIINI_GetLong(TUNERINFO_SECTION, "SatTsSerialPin", DEFAULT_SAT_TS_SER_PIN,   FRONTEND_CONFIG_FILE);
    stSatAttr.enDiSEqCWave     = HIINI_GetLong(TUNERINFO_SECTION, "SatDiseqcWave",  DEFAULT_SAT_DISEQC_WAVE,  FRONTEND_CONFIG_FILE);
    stSatAttr.enLNBCtrlDev     = HIINI_GetLong(TUNERINFO_SECTION, "SatLnbCtrlDev",  DEFAULT_SAT_LNBCTRL_DEV,  FRONTEND_CONFIG_FILE);
    stSatAttr.u16LNBDevAddress = HIINI_GetLong(TUNERINFO_SECTION, "SatLnbCtrlDevAddr", DEFAULT_SAT_LNBCTRL_DEV_ADDR, FRONTEND_CONFIG_FILE);

    s32Ret = HI_UNF_TUNER_SetSatAttr(u32TunerID, &stSatAttr);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_SetSatAttr, s32Ret);
        return COM_ERR_DEVICE;
    }

    s32Ret = HI_UNF_TUNER_SetLNBPower(u32TunerID, pstParam->enLNBPower);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_SetLNBPower, s32Ret);
        return COM_ERR_DEVICE;
    }

    /* If LNB power off, 22K signal can't be sent, switch and motor configuration will be not effective */
    if ((HI_UNF_TUNER_FE_LNB_POWER_ON == pstParam->enLNBPower)
        || (HI_UNF_TUNER_FE_LNB_POWER_ENHANCED == pstParam->enLNBPower))
    {
#ifdef DISEQC_SUPPORT
        /* Wait DiSEqC switch to start */
        COM_Delayms(50);

        /* Use DiSEqC 1.1 Switch */
        s32Ret = HI_UNF_TUNER_DISEQC_Switch16Port(u32TunerID, &pstParam->stSwitch16Port);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_DISEQC_Switch16Port, s32Ret);
            return COM_ERR_DEVICE;
        }

        /* Use DiSEqC 1.0 Switch */
        s32Ret = HI_UNF_TUNER_DISEQC_Switch4Port(u32TunerID, &pstParam->stSwitch4Port);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_DISEQC_Switch4Port, s32Ret);
            return COM_ERR_DEVICE;
        }

#endif/* DISEQC_SUPPORT */

        /* Use 22K switch */
        s32Ret = HI_UNF_TUNER_Switch22K(u32TunerID, pstParam->enSwitch22K);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_Switch22K, s32Ret);
            return COM_ERR_DEVICE;
        }
    }

    s32Ret = HI_UNF_TUNER_SetLNBConfig(u32TunerID, &pstParam->stLNBConfig);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_SetLNBConfig, s32Ret);
        return COM_ERR_DEVICE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}
#endif

#if defined(HI_LOADER_TUNER_DVB_T) || defined(HI_LOADER_TUNER_DVB_T2)
static HI_S32 dlotaTunerSetTerAttr(HI_U32 u32TunerID, HI_LOADER_PARAM_OTA_S* pstParam)
{
    HI_UNF_TUNER_TER_ATTR_S stTerAttr;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_MemSet(&stTerAttr, 0x00, sizeof(stTerAttr));

    stTerAttr.u32DemodClk    = HIINI_GetLong(TUNERINFO_SECTION, "TerDemodeClk",   DEFAULT_TER_DEMOD_CLK,  FRONTEND_CONFIG_FILE);
    stTerAttr.u32ResetGpioNo = HIINI_GetLong(TUNERINFO_SECTION, "DemodRstGpio",   DEFAULT_DEMOD_RST_GPIO, FRONTEND_CONFIG_FILE);
    stTerAttr.u16TunerMaxLPF = HIINI_GetLong(TUNERINFO_SECTION, "TerTunerMaxLPF", DEFAULT_TER_TUNER_MAXLPF, FRONTEND_CONFIG_FILE);
    stTerAttr.u16TunerI2CClk = HIINI_GetLong(TUNERINFO_SECTION, "TerTunerI2CClk", DEFAULT_TER_TUNER_I2CCLK, FRONTEND_CONFIG_FILE);
    stTerAttr.enRFAGC        = HIINI_GetLong(TUNERINFO_SECTION, "TerRfAgc",       DEFAULT_TER_RF_AGC,       FRONTEND_CONFIG_FILE);
    stTerAttr.enIQSpectrum   = HIINI_GetLong(TUNERINFO_SECTION, "TerIQSpectrum",  DEFAULT_TER_IQ_SPECTRUM,  FRONTEND_CONFIG_FILE);
    stTerAttr.enTSClkPolar   = HIINI_GetLong(TUNERINFO_SECTION, "TerTsClkPolar",  DEFAULT_TER_TS_CLK_POLAR, FRONTEND_CONFIG_FILE);
    stTerAttr.enTSFormat     = HIINI_GetLong(TUNERINFO_SECTION, "TerTsFormat",    DEFAULT_TER_TS_FORMAT,  FRONTEND_CONFIG_FILE);
    stTerAttr.enTSSerialPIN  = HIINI_GetLong(TUNERINFO_SECTION, "TerTsSerialPIN", DEFAULT_TER_TS_SER_PIN, FRONTEND_CONFIG_FILE);
    stTerAttr.enTSSyncHead   = HIINI_GetLong(TUNERINFO_SECTION, "TerTsSyncHead",  DEFAULT_TER_TS_SYNC_HEAD, FRONTEND_CONFIG_FILE);

    s32Ret = HI_UNF_TUNER_SetTerAttr(u32TunerID, &stTerAttr);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_SetTerAttr, s32Ret);
        return COM_ERR_DEVICE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}
#endif

static HI_S32 dlotaTunerSetAttr(HI_U32 u32TunerID)
{
    HI_UNF_TUNER_ATTR_S stTunerAttr;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_MemSet(&stTunerAttr, 0x00, sizeof(stTunerAttr));

    stTunerAttr.enSigType        = HIINI_GetLong(TUNERINFO_SECTION, "SigType",   DEFAULT_SIG_TYPE, FRONTEND_CONFIG_FILE);
    stTunerAttr.enTunerDevType   = HIINI_GetLong(TUNERINFO_SECTION, "TunerType", DEFAULT_TUNER_TYPE, FRONTEND_CONFIG_FILE);
    stTunerAttr.u32TunerAddr     = HIINI_GetLong(TUNERINFO_SECTION, "TunerI2cAddr", DEFAULT_TUNER_ADDR, FRONTEND_CONFIG_FILE);
    stTunerAttr.enDemodDevType   = HIINI_GetLong(TUNERINFO_SECTION, "DemodType",    DEFAULT_DEMOD_TYPE, FRONTEND_CONFIG_FILE);
    stTunerAttr.u32DemodAddr     = HIINI_GetLong(TUNERINFO_SECTION, "DemodI2cAddr", DEFAULT_DEMOD_ADDR, FRONTEND_CONFIG_FILE);
    stTunerAttr.enOutputMode     = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutPutMode", DEFAULT_DEMOD_OUTPUT_MODE, FRONTEND_CONFIG_FILE);
    if(NEED_RESET == HIINI_GetLong(TUNERINFO_SECTION, "DemodRstType", DEFAULT_DEMOD_RST_TYPE, FRONTEND_CONFIG_FILE))
    {
        stTunerAttr.u32ResetGpioNo   = HIINI_GetLong(TUNERINFO_SECTION, "DemodRstGpio", DEFAULT_DEMOD_RST_GPIO, FRONTEND_CONFIG_FILE);
    }

    if (USE_I2C == s_u32I2CType)
    {
        stTunerAttr.enI2cChannel = HIINI_GetLong(TUNERINFO_SECTION, "I2cChNum", DEFAULT_I2C_CHNUM, FRONTEND_CONFIG_FILE);
    }
    else
    {
        stTunerAttr.enI2cChannel = dlotaTunerGetI2cChannel();
    }

    s32Ret = HI_UNF_TUNER_SetAttr(u32TunerID, &stTunerAttr);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_SetAttr, s32Ret);
        return s32Ret;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerConfig(HI_LOADER_PARAM_OTA_S* pstParam)
{
    HI_S32                   s32Ret = HI_FAILURE;
    HI_U32                   u32CfgTSOut = 0;
    HI_UNF_TUNER_TSOUT_SET_S stTSOut;

    COM_DBG_FuncEnter();

    s32Ret = dlotaTunerSetAttr(OTA_TUNER_ID);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaTunerSetAttr, s32Ret);
        return s32Ret;
    }

    COM_MemSet(&stTSOut, 0x00, sizeof(stTSOut));

    u32CfgTSOut = HIINI_GetLong(TUNERINFO_SECTION, "DemodTsOutMode", DEFAULT_DEMOD_TSOUT_MODE, FRONTEND_CONFIG_FILE);
    if(USER_DEFINED == u32CfgTSOut)
    {
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT0] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT0", DEFAULT_DEMOD_OUTPUT_TSDAT0, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT1] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT1", DEFAULT_DEMOD_OUTPUT_TSDAT1, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT2] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT2", DEFAULT_DEMOD_OUTPUT_TSDAT2, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT3] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT3", DEFAULT_DEMOD_OUTPUT_TSDAT3, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT4] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT4", DEFAULT_DEMOD_OUTPUT_TSDAT4, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT5] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT5", DEFAULT_DEMOD_OUTPUT_TSDAT5, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT6] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT6", DEFAULT_DEMOD_OUTPUT_TSDAT6, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT7] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSDAT7", DEFAULT_DEMOD_OUTPUT_TSDAT7, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSSYNC] = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSSYNC", DEFAULT_DEMOD_OUTPUT_TSSYNC, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSVLD]  = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSVLD",  DEFAULT_DEMOD_OUTPUT_TSVLD,  FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSERR]  = HIINI_GetLong(TUNERINFO_SECTION, "DemodOutputTSERR",  DEFAULT_DEMOD_OUTPUT_TSERR,  FRONTEND_CONFIG_FILE);

        s32Ret = HI_UNF_TUNER_SetTSOUT(OTA_TUNER_ID, &stTSOut);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_SetTSOUT, s32Ret);
            return s32Ret;
        }
    }

    if ((0 != (HI_UNF_TUNER_SIG_TYPE_DVB_T & pstParam->enSigType))
        || (0 != (HI_UNF_TUNER_SIG_TYPE_DVB_T2 & pstParam->enSigType))
        || (0 != (HI_UNF_TUNER_SIG_TYPE_ISDB_T & pstParam->enSigType))
        || (0 != (HI_UNF_TUNER_SIG_TYPE_ATSC_T & pstParam->enSigType))
        || (0 != (HI_UNF_TUNER_SIG_TYPE_DTMB & pstParam->enSigType)))
    {
#if defined(HI_LOADER_TUNER_DVB_T) || defined(HI_LOADER_TUNER_DVB_T2)
        s32Ret = dlotaTunerSetTerAttr(OTA_TUNER_ID, pstParam);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(dlotaTunerSetTerAttr, s32Ret);
            return s32Ret;
        }

#else

        COM_PrintErrCode(COM_ERR_UNAVAILABLE);
        return COM_ERR_UNAVAILABLE;
#endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_SAT == pstParam->enSigType)
    {
#ifdef HI_LOADER_TUNER_SAT
        s32Ret = dlotaTunerSetSatAttr(OTA_TUNER_ID, &pstParam->unParam.stSat);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(dlotaTunerSetSatAttr, s32Ret);
            return s32Ret;
        }

#else
        COM_PrintErrCode(COM_ERR_UNAVAILABLE);
        return COM_ERR_UNAVAILABLE;
#endif
    }
    else if (HI_UNF_TUNER_SIG_TYPE_CAB != pstParam->enSigType)
    {
        COM_PrintErrCode(COM_ERR_UNAVAILABLE);
        return COM_ERR_UNAVAILABLE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerOpen(HI_LOADER_PARAM_OTA_S* pstParam)
{
    HI_S32 s32Ret = HI_FAILURE;

    COM_DBG_FuncEnter();

    s32Ret = HI_UNF_I2C_Init();
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_I2C_Init, s32Ret);
        return COM_ERR_DEVICE;
    }

    s32Ret = HI_UNF_TUNER_Init();
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_Init, s32Ret);
        COM_CHECK(HI_UNF_I2C_DeInit());
        return s32Ret;
    }

    s32Ret = HI_UNF_TUNER_Open(OTA_TUNER_ID);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_Open, s32Ret);
        COM_CHECK(HI_UNF_TUNER_DeInit());
        COM_CHECK(HI_UNF_I2C_DeInit());
        return s32Ret;
    }

    s_u32I2CType = HIINI_GetLong(TUNERINFO_SECTION, "I2cType", 0, FRONTEND_CONFIG_FILE);
    if (1 == s_u32I2CType)
    {
        s32Ret = dlotaTunerCreateI2cChannel();
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(dlotaTunerCreateI2cChannel, s32Ret);
            COM_CHECK(HI_UNF_TUNER_DeInit());
            COM_CHECK(HI_UNF_I2C_DeInit());
            return s32Ret;
        }

    }

    s32Ret = dlotaTunerConfig(pstParam);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaTunerConfig, s32Ret);

        if (1 == s_u32I2CType)
        {
            COM_CHECK(dlotaTunerDestoryI2cChannel());
        }
        COM_CHECK(HI_UNF_TUNER_DeInit());
        COM_CHECK(HI_UNF_I2C_DeInit());
        return s32Ret;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerClose(HI_VOID)
{
    COM_DBG_FuncEnter();

    if (1 == s_u32I2CType)
    {
        COM_CHECK(dlotaTunerDestoryI2cChannel());
    }

    COM_CHECK(HI_UNF_TUNER_Close(OTA_TUNER_ID));
    COM_CHECK(HI_UNF_TUNER_DeInit());
    COM_CHECK(HI_UNF_I2C_DeInit());

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaTunerLock
(
    HI_LOADER_PARAM_OTA_S*      pstOtaParam,
    HI_UNF_TUNER_LOCK_STATUS_E* penStatus
)
{
    HI_S32 i = 0;
    HI_UNF_TUNER_CONNECT_PARA_S stConnectParam;
    HI_UNF_TUNER_STATUS_S stTunerStatus;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_MemSet(&stTunerStatus, 0x00, sizeof(stTunerStatus));
    COM_MemSet(&stConnectParam, 0x00, sizeof(stConnectParam));
    stConnectParam.enSigType = pstOtaParam->enSigType;

    if (0 != (HI_UNF_TUNER_SIG_TYPE_CAB & pstOtaParam->enSigType))
    {
        COM_MemCpy(&stConnectParam.unConnectPara.stCab,
                   &pstOtaParam->unParam.stCab.stConnectParam,
                   sizeof(stConnectParam.unConnectPara.stCab));
    }
    else if (0 != (HI_UNF_TUNER_SIG_TYPE_SAT & pstOtaParam->enSigType))
    {
        COM_MemCpy(&stConnectParam.unConnectPara.stSat,
                   &pstOtaParam->unParam.stSat.stConnectParam,
                   sizeof(stConnectParam.unConnectPara.stSat));
    }
    else if ((0 != (HI_UNF_TUNER_SIG_TYPE_DVB_T & pstOtaParam->enSigType))
             || (0 != (HI_UNF_TUNER_SIG_TYPE_DVB_T2 & pstOtaParam->enSigType))
             || (0 != (HI_UNF_TUNER_SIG_TYPE_ISDB_T & pstOtaParam->enSigType))
             || (0 != (HI_UNF_TUNER_SIG_TYPE_ATSC_T & pstOtaParam->enSigType))
             || (0 != (HI_UNF_TUNER_SIG_TYPE_DTMB & pstOtaParam->enSigType)))
    {
        COM_MemCpy(&stConnectParam.unConnectPara.stTer,
                   &pstOtaParam->unParam.stTer.stConnectParam,
                   sizeof(stConnectParam.unConnectPara.stTer));
    }
    else
    {
        COM_PrintErrCode(COM_ERR_UNAVAILABLE);
        return COM_ERR_UNAVAILABLE;
    }

    s32Ret = HI_UNF_TUNER_Connect(OTA_TUNER_ID, &stConnectParam, OTA_CONNECT_TIMEOUT);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_TUNER_Connect, s32Ret);
        return s32Ret;
    }

    for (i = 0; i < OTA_CONNECT_CHECKTIMES; i++)
    {
        s32Ret = HI_UNF_TUNER_GetStatus(OTA_TUNER_ID, &stTunerStatus);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_GetStatus, s32Ret);
            continue;
        }

        if (HI_UNF_TUNER_SIGNAL_LOCKED == stTunerStatus.enLockStatus)
        {
            *penStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
            return HI_SUCCESS;
        }

        COM_Delayms(OTA_CONNECT_CHECKINTERVAL);
    }

    *penStatus = HI_UNF_TUNER_SIGNAL_DROPPED;

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaDemuxAttachTSPort(HI_U32 u32DmxID, HI_UNF_DMX_PORT_E enDmxPort)
{
    HI_UNF_DMX_PORT_ATTR_S stDmxPortAttr;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_MemSet(&stDmxPortAttr, 0x00, sizeof(stDmxPortAttr));
    s32Ret = HI_UNF_DMX_GetTSPortAttr(enDmxPort, &stDmxPortAttr);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_GetTSPortAttr, s32Ret);
        return COM_ERR_DEVICE;
    }

    stDmxPortAttr.enPortType           = HIINI_GetLong(TUNERINFO_SECTION, "DemuxPortType", DEFAULT_DEMUX_PORT_TYPE, FRONTEND_CONFIG_FILE);
    stDmxPortAttr.u32SerialBitSelector = HIINI_GetLong(TUNERINFO_SECTION, "DemuxBitSel",   DEFAULT_DEMUX_BITSEL,    FRONTEND_CONFIG_FILE);
    stDmxPortAttr.u32TunerInClk        = HIINI_GetLong(TUNERINFO_SECTION, "DemuxInClk",    DEFAULT_DEMUX_INCLK,     FRONTEND_CONFIG_FILE);
    stDmxPortAttr.enSerialPortShareClk = HIINI_GetLong(TUNERINFO_SECTION, "DemuxPortShareClk", DEFAULT_DEMUX_PORT_SHARECLK, FRONTEND_CONFIG_FILE);

    s32Ret = HI_UNF_DMX_SetTSPortAttr(enDmxPort, &stDmxPortAttr);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_SetTSPortAttr, s32Ret);
        return COM_ERR_DEVICE;
    }

    s32Ret = HI_UNF_DMX_AttachTSPort(u32DmxID, enDmxPort);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_AttachTSPort, s32Ret);
        return COM_ERR_DEVICE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaDemuxDetachTSPort(HI_U32 u32DmxId)
{
    COM_DBG_FuncEnter();

    COM_CHECK(HI_UNF_DMX_DetachTSPort(u32DmxId));

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 dlotaDemuxInit(HI_VOID)
{
    HI_S32            s32Ret = HI_FAILURE;
    HI_UNF_DMX_PORT_E DmxAttachPort;

    COM_DBG_FuncEnter();

    s32Ret = HI_UNF_DMX_Init();
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_Init, s32Ret);
        return COM_ERR_DEVICE;
    }

    DmxAttachPort = HIINI_GetLong(TUNERINFO_SECTION, "DemuxPort", DEFAULT_DEMUX_PORT, FRONTEND_CONFIG_FILE);

    s32Ret = dlotaDemuxAttachTSPort(OTA_D_DMXID, DmxAttachPort);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaDemuxAttachTSPort, s32Ret);

        COM_CHECK(HI_UNF_DMX_DeInit());
        return s32Ret;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}
static HI_S32 dlotaDemuxDeInit(HI_VOID)
{
    COM_DBG_FuncEnter();

    COM_CHECK(dlotaDemuxDetachTSPort(OTA_D_DMXID));
    COM_CHECK(HI_UNF_DMX_DeInit());

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

HI_S32 DOWNLOAD_OTA_Init(HI_LOADER_PARAM_S* pstLoaderParam)
{
    HI_UNF_TUNER_LOCK_STATUS_E enStatus = HI_UNF_TUNER_SIGNAL_BUTT;
    HI_LOADER_PARAM_OTA_S* pstOTAParam = HI_NULL_PTR;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_CHECK_PARAM(HI_NULL_PTR == pstLoaderParam);

    pstOTAParam = &pstLoaderParam->unParam.stOTAParam;

    s_u32ChannelPid = pstOTAParam->u32Pid;

    s32Ret = dlotaTunerOpen(pstOTAParam);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaTunerOpen, s32Ret);
        return s32Ret;
    }

    s32Ret = dlotaDemuxInit();
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaDemuxInit, s32Ret);
        COM_CHECK(dlotaTunerClose());
        return s32Ret;
    }

    s32Ret = dlotaTunerLock(pstOTAParam, &enStatus);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(dlotaTunerLock, s32Ret);
        COM_CHECK(dlotaDemuxDeInit());
        COM_CHECK(dlotaTunerClose());
        return s32Ret;
    }

    if (HI_UNF_TUNER_SIGNAL_LOCKED != enStatus)
    {
        COM_CHECK(dlotaDemuxDeInit());
        COM_CHECK(dlotaTunerClose());
        COM_PrintErrCode(COM_ERR_SIGNAL_LOSE);
        return COM_ERR_SIGNAL_LOSE;
    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

HI_S32 DOWNLOAD_OTA_DeInit(HI_VOID)
{
    COM_DBG_FuncEnter();

    if (HI_INVALID_HANDLE != s_hChannel)
    {
        COM_CHECK(HI_UNF_DMX_CloseChannel(s_hChannel));

        if (HI_INVALID_HANDLE != s_hFilter)
        {
            COM_CHECK(HI_UNF_DMX_DetachFilter(s_hFilter, s_hChannel));
            COM_CHECK(HI_UNF_DMX_DestroyFilter(s_hFilter));
            s_hFilter  = HI_INVALID_HANDLE;
        }

        COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
        s_hChannel = HI_INVALID_HANDLE;
    }

    COM_CHECK(dlotaDemuxDeInit());
    COM_CHECK(dlotaTunerClose());

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

HI_S32 DOWNLOAD_OTA_GetData(HI_VOID* pbuffer, HI_U32 u32BufferSize, HI_U32* pu32DataLen)
{
    HI_U32 i = 0;
    HI_U32 u32AcquiredNum = 0;
    HI_UNF_DMX_DATA_S stDmxData;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_CHECK_PARAM(HI_NULL_PTR == pbuffer);
    COM_CHECK_PARAM(HI_NULL_PTR == pu32DataLen);
    COM_CHECK_PARAM(0 == u32BufferSize);

    for (i = 0; i < OTA_ACQUIRE_TRYTIMES; i++)
    {
        COM_MemSet(&stDmxData, 0x00, sizeof(stDmxData));
        s32Ret = HI_UNF_DMX_AcquireBuf(s_hChannel, 1, &u32AcquiredNum, &stDmxData, OTA_ACQUIRE_TIMEOUT);
        if (HI_SUCCESS != s32Ret)
        {
            COM_Delayms(OTA_ACQUIRE_TIMEOUT);
            continue;
        }

        if (0 < u32AcquiredNum)
        {
            break;
        }

        COM_Delayms(OTA_ACQUIRE_TIMEOUT);
    }

    if (OTA_ACQUIRE_TRYTIMES == i)
    {
        HI_UNF_TUNER_STATUS_S stStatus;

        COM_MemSet(&stStatus, 0x00, sizeof(stStatus));
        s32Ret = HI_UNF_TUNER_GetStatus(OTA_TUNER_ID, &stStatus);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_TUNER_GetStatus, s32Ret);
            return s32Ret;
        }

        if (HI_UNF_TUNER_SIGNAL_LOCKED != stStatus.enLockStatus)
        {
            COM_PrintErrCode(COM_ERR_SIGNAL_LOSE);
            return COM_ERR_SIGNAL_LOSE;
        }

        COM_PrintErrCode(COM_ERR_DOWNLOAD_TIMEOUT);
        return COM_ERR_DOWNLOAD_TIMEOUT;
    }

    if (stDmxData.u32Size > u32BufferSize)
    {
        COM_CHECK(HI_UNF_DMX_ReleaseBuf(s_hChannel, 1, &stDmxData));

        COM_PrintErrCode(COM_ERR_OVERFLOW);
        return COM_ERR_OVERFLOW;
    }

    COM_MemCpy(pbuffer, stDmxData.pu8Data, stDmxData.u32Size);
    *pu32DataLen = stDmxData.u32Size;

    COM_CHECK(HI_UNF_DMX_ReleaseBuf(s_hChannel, 1, &stDmxData));

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

HI_S32 DOWNLOAD_OTA_SetFilter(HI_UNF_DMX_FILTER_ATTR_S* pstFilterAttr)
{
    HI_U32 u32DmxId = OTA_D_DMXID;
    HI_UNF_DMX_CHAN_ATTR_S stChAttr;
    HI_S32 s32Ret = HI_SUCCESS;

    COM_DBG_FuncEnter();

    COM_CHECK_PARAM(HI_NULL_PTR == pstFilterAttr);

    if (HI_INVALID_HANDLE == s_hChannel)
    {
        COM_MemSet(&stChAttr, 0x00, sizeof(stChAttr));

        s32Ret = HI_UNF_DMX_GetChannelDefaultAttr(&stChAttr);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_DMX_GetChannelDefaultAttr, s32Ret);
            return COM_ERR_DEVICE;
        }

        stChAttr.enChannelType  = HI_UNF_DMX_CHAN_TYPE_SEC;
        stChAttr.enCRCMode      = HI_UNF_DMX_CHAN_CRC_MODE_FORCE_AND_DISCARD;
        stChAttr.enOutputMode   = HI_UNF_DMX_CHAN_OUTPUT_MODE_PLAY;
        s32Ret = HI_UNF_DMX_CreateChannel(u32DmxId, &stChAttr, &s_hChannel);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_DMX_CreateChannel, s32Ret);
            return COM_ERR_DEVICE;
        }
    }
    else
    {
        s32Ret = HI_UNF_DMX_CloseChannel(s_hChannel);
        if (HI_SUCCESS != s32Ret)
        {
            COM_PrintFuncErr(HI_UNF_DMX_CloseChannel, s32Ret);

            COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
            s_hChannel = HI_INVALID_HANDLE;

            return COM_ERR_DEVICE;
        }
    }

    s32Ret = HI_UNF_DMX_SetChannelPID(s_hChannel, s_u32ChannelPid);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_SetChannelPID, s32Ret);

        COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
        s_hChannel = HI_INVALID_HANDLE;

        return COM_ERR_DEVICE;
    }

    if (HI_INVALID_HANDLE != s_hFilter)
    {
        COM_CHECK(HI_UNF_DMX_DetachFilter(s_hFilter, s_hChannel));
        COM_CHECK(HI_UNF_DMX_DestroyFilter(s_hFilter));

        s_hFilter = HI_INVALID_HANDLE;
    }

    s32Ret = HI_UNF_DMX_CreateFilter(u32DmxId, pstFilterAttr, &s_hFilter);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_CreateFilter, s32Ret);

        COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
        s_hChannel = HI_INVALID_HANDLE;

        return COM_ERR_DEVICE;
    }

    s32Ret = HI_UNF_DMX_AttachFilter(s_hFilter, s_hChannel);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_AttachFilter, s32Ret);

        COM_CHECK(HI_UNF_DMX_DestroyFilter(s_hFilter));
        s_hFilter = HI_INVALID_HANDLE;

        COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
        s_hChannel = HI_INVALID_HANDLE;

        return COM_ERR_DEVICE;
    }

    s32Ret = HI_UNF_DMX_OpenChannel(s_hChannel);
    if (HI_SUCCESS != s32Ret)
    {
        COM_PrintFuncErr(HI_UNF_DMX_OpenChannel, s32Ret);

        COM_CHECK(HI_UNF_DMX_DetachFilter(s_hFilter, s_hChannel));

        COM_CHECK(HI_UNF_DMX_DestroyFilter(s_hFilter));
        s_hFilter = HI_INVALID_HANDLE;

        COM_CHECK(HI_UNF_DMX_DestroyChannel(s_hChannel));
        s_hChannel = HI_INVALID_HANDLE;

        return COM_ERR_DEVICE;

    }

    COM_DBG_FuncExit();
    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

