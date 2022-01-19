#include <sys/types.h>
#include <sys/stat.h>

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>
#include <time.h>
#include <string.h>
#include <unistd.h>

#include "hi_adp.h"
#include "hi_adp_tuner.h"
#include "hi_adp_boardcfg.h"
#include "hi_unf_frontend.h"
#include "hi_unf_demux.h"

static HI_UNF_TUNER_SIG_TYPE_E g_enSigType[HI_TUNER_NUMBER];
static HI_U32  gCfgTunerNum = 1;  //read from ini-file in function: HIADP_Tuner_Init.

/********************************* TUNER public function*******************************************/

HI_S32 HIADP_Tuner_GetConfig(HI_U32 TunerId, HI_UNF_TUNER_ATTR_S *TunerAttr)
{
    HI_S32  Ret;
    HI_U32  I2CType = 0;
    HI_U32  GpioSDA = 0;
    HI_U32  GpioSCL = 0;
    HI_U32  GpioI2cNum = 0;
    HI_CHAR SectionName[SECTION_MAX_LENGTH] = {0};

    if(TunerId >= gCfgTunerNum)
    {
        sample_common_printf("TunerId[%d] is out of config tuner number[%d].\n",TunerId,gCfgTunerNum);
        return HI_FAILURE;
    }

    snprintf(SectionName,SECTION_MAX_LENGTH,"tuner%dinfo",TunerId);

    TunerAttr->enSigType      = HIADP_INI_Getl(SectionName, "SigType",      DEFAULT_SIG_TYPE,   FRONTEND_CONFIG_FILE);
    TunerAttr->enTunerDevType = HIADP_INI_Getl(SectionName, "TunerType",    DEFAULT_TUNER_TYPE, FRONTEND_CONFIG_FILE);
    TunerAttr->u32TunerAddr   = HIADP_INI_Getl(SectionName, "TunerI2cAddr", DEFAULT_TUNER_ADDR, FRONTEND_CONFIG_FILE);
    TunerAttr->enDemodDevType = HIADP_INI_Getl(SectionName, "DemodType",    DEFAULT_DEMOD_TYPE, FRONTEND_CONFIG_FILE);
    TunerAttr->u32DemodAddr   = HIADP_INI_Getl(SectionName, "DemodI2cAddr", DEFAULT_DEMOD_ADDR, FRONTEND_CONFIG_FILE);
    TunerAttr->enOutputMode   = HIADP_INI_Getl(SectionName, "DemodOutPutMode", DEFAULT_DEMOD_OUTPUT_MODE, FRONTEND_CONFIG_FILE);

    if(NEED_RESET == HIADP_INI_Getl(SectionName, "DemodRstType", DEFAULT_DEMOD_RST_TYPE, FRONTEND_CONFIG_FILE))
    {
        TunerAttr->u32ResetGpioNo   = HIADP_INI_Getl(SectionName, "DemodRstGpio", DEFAULT_DEMOD_RST_GPIO, FRONTEND_CONFIG_FILE);
    }

    I2CType = HIADP_INI_Getl(SectionName, "I2cType", 0, FRONTEND_CONFIG_FILE);

    if(USE_I2C == I2CType)
    {
        TunerAttr->enI2cChannel  = HIADP_INI_Getl(SectionName, "I2cChNum", DEFAULT_I2C_CHNUM, FRONTEND_CONFIG_FILE);
    }
    else
    {
        GpioSCL = HIADP_INI_Getl(SectionName, "GpioI2cScl", DEFAULT_GPIOI2C_SCL, FRONTEND_CONFIG_FILE);
        GpioSDA = HIADP_INI_Getl(SectionName, "GpioI2cSda", DEFAULT_GPIOI2C_SDA, FRONTEND_CONFIG_FILE);
        if(GpioSCL && GpioSDA)
        {
            Ret = HI_UNF_I2C_CreateGpioI2c(&GpioI2cNum, GpioSCL, GpioSDA);
            if (HI_SUCCESS != Ret)
            {
                sample_common_printf("HI_UNF_I2C_CreateGpioI2c failed 0x%x\n", Ret);
                return HI_FAILURE;
            }

            TunerAttr->enI2cChannel = GpioI2cNum;
        }
        else
        {
            sample_common_printf("Invalid data: GpioSCL[%d] or GpioSDA[%d]\n", GpioSCL, GpioSDA);
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}

HI_S32 HIADP_Tuner_GetSatAttr(HI_U32 TunerId, HI_UNF_TUNER_SAT_ATTR_S *SatTunerAttr)
{
    HI_CHAR SectionName[SECTION_MAX_LENGTH] = {0};

    if(TunerId >= gCfgTunerNum)
    {
        sample_common_printf("TunerId[%d] is out of config tuner number[%d].\n",TunerId,gCfgTunerNum);
        return HI_FAILURE;
    }

    snprintf(SectionName,SECTION_MAX_LENGTH,"tuner%dinfo",TunerId);

    SatTunerAttr->u32DemodClk      = HIADP_INI_Getl(SectionName, "SatDemodClk",    DEFAULT_SAT_DEMOD_CLK,    FRONTEND_CONFIG_FILE);
    SatTunerAttr->u16TunerMaxLPF   = HIADP_INI_Getl(SectionName, "SatTunerMaxLPF", DEFAULT_SAT_TUNER_MAXLPF, FRONTEND_CONFIG_FILE);
    SatTunerAttr->u16TunerI2CClk   = HIADP_INI_Getl(SectionName, "SatTunerI2cClk", DEFAULT_SAT_TUNER_I2CCLK, FRONTEND_CONFIG_FILE);
    SatTunerAttr->enRFAGC          = HIADP_INI_Getl(SectionName, "SatRfAgc",       DEFAULT_SAT_RF_AGC,       FRONTEND_CONFIG_FILE);
    SatTunerAttr->enIQSpectrum     = HIADP_INI_Getl(SectionName, "SatIQSpectrum",  DEFAULT_SAT_IQ_SPECTRUM,  FRONTEND_CONFIG_FILE);
    SatTunerAttr->enTSClkPolar     = HIADP_INI_Getl(SectionName, "SatTsClkPolar",  DEFAULT_SAT_TS_CLK_POLAR, FRONTEND_CONFIG_FILE);
    SatTunerAttr->enTSFormat       = HIADP_INI_Getl(SectionName, "SatTsFormat",    DEFAULT_SAT_TS_FORMAT,    FRONTEND_CONFIG_FILE);
    SatTunerAttr->enTSSerialPIN    = HIADP_INI_Getl(SectionName, "SatTsSerialPin", DEFAULT_SAT_TS_SER_PIN,   FRONTEND_CONFIG_FILE);
    SatTunerAttr->enDiSEqCWave     = HIADP_INI_Getl(SectionName, "SatDiseqcWave",  DEFAULT_SAT_DISEQC_WAVE,  FRONTEND_CONFIG_FILE);
    SatTunerAttr->enLNBCtrlDev     = HIADP_INI_Getl(SectionName, "SatLnbCtrlDev",  DEFAULT_SAT_LNBCTRL_DEV,  FRONTEND_CONFIG_FILE);
    SatTunerAttr->u16LNBDevAddress = HIADP_INI_Getl(SectionName, "SatLnbCtrlDevAddr", DEFAULT_SAT_LNBCTRL_DEV_ADDR, FRONTEND_CONFIG_FILE);

    return HI_SUCCESS;
}

HI_S32 HIADP_Tuner_GetTerAttr(HI_U32 TunerId, HI_UNF_TUNER_TER_ATTR_S *TerTunerAttr)
{
    HI_CHAR SectionName[SECTION_MAX_LENGTH] = {0};

    if(TunerId >= gCfgTunerNum)
    {
        sample_common_printf("TunerId[%d] is out of config tuner number[%d].\n",TunerId,gCfgTunerNum);
        return HI_FAILURE;
    }

    snprintf(SectionName,SECTION_MAX_LENGTH,"tuner%dinfo",TunerId);

    TerTunerAttr->u32DemodClk    = HIADP_INI_Getl(SectionName, "TerDemodeClk",   DEFAULT_TER_DEMOD_CLK,  FRONTEND_CONFIG_FILE);
    TerTunerAttr->u32ResetGpioNo = HIADP_INI_Getl(SectionName, "DemodRstGpio",   DEFAULT_DEMOD_RST_GPIO, FRONTEND_CONFIG_FILE);
    TerTunerAttr->u16TunerMaxLPF = HIADP_INI_Getl(SectionName, "TerTunerMaxLPF", DEFAULT_TER_TUNER_MAXLPF, FRONTEND_CONFIG_FILE);
    TerTunerAttr->u16TunerI2CClk = HIADP_INI_Getl(SectionName, "TerTunerI2CClk", DEFAULT_TER_TUNER_I2CCLK, FRONTEND_CONFIG_FILE);
    TerTunerAttr->enRFAGC        = HIADP_INI_Getl(SectionName, "TerRfAgc",       DEFAULT_TER_RF_AGC,       FRONTEND_CONFIG_FILE);
    TerTunerAttr->enIQSpectrum   = HIADP_INI_Getl(SectionName, "TerIQSpectrum",  DEFAULT_TER_IQ_SPECTRUM,  FRONTEND_CONFIG_FILE);
    TerTunerAttr->enTSClkPolar   = HIADP_INI_Getl(SectionName, "TerTsClkPolar",  DEFAULT_TER_TS_CLK_POLAR, FRONTEND_CONFIG_FILE);
    TerTunerAttr->enTSFormat     = HIADP_INI_Getl(SectionName, "TerTsFormat",    DEFAULT_TER_TS_FORMAT,  FRONTEND_CONFIG_FILE);
    TerTunerAttr->enTSSerialPIN  = HIADP_INI_Getl(SectionName, "TerTsSerialPIN", DEFAULT_TER_TS_SER_PIN, FRONTEND_CONFIG_FILE);
    TerTunerAttr->enTSSyncHead   = HIADP_INI_Getl(SectionName, "TerTsSyncHead",  DEFAULT_TER_TS_SYNC_HEAD, FRONTEND_CONFIG_FILE);

    return HI_SUCCESS;

}

HI_S32 HIADP_Tuner_SetTSOUT(HI_U32 TunerId)
{
    HI_S32  Ret;
    HI_U32  CfgTSOut = 0;
    HI_UNF_TUNER_TSOUT_SET_S stTSOut;

    HI_CHAR SectionName[SECTION_MAX_LENGTH] = {0};

    if(TunerId >= gCfgTunerNum)
    {
        sample_common_printf("TunerId[%d] is out of config tuner number[%d].\n",TunerId,gCfgTunerNum);
        return HI_FAILURE;
    }

    snprintf(SectionName,SECTION_MAX_LENGTH,"tuner%dinfo",TunerId);
    CfgTSOut = HIADP_INI_Getl(SectionName, "DemodTsOutMode", DEFAULT_DEMOD_TSOUT_MODE, FRONTEND_CONFIG_FILE);
    if(USER_DEFINED == CfgTSOut)
    {
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT0] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT0", DEFAULT_DEMOD_OUTPUT_TSDAT0, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT1] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT1", DEFAULT_DEMOD_OUTPUT_TSDAT1, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT2] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT2", DEFAULT_DEMOD_OUTPUT_TSDAT2, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT3] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT3", DEFAULT_DEMOD_OUTPUT_TSDAT3, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT4] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT4", DEFAULT_DEMOD_OUTPUT_TSDAT4, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT5] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT5", DEFAULT_DEMOD_OUTPUT_TSDAT5, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT6] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT6", DEFAULT_DEMOD_OUTPUT_TSDAT6, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSDAT7] = HIADP_INI_Getl(SectionName, "DemodOutputTSDAT7", DEFAULT_DEMOD_OUTPUT_TSDAT7, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSSYNC] = HIADP_INI_Getl(SectionName, "DemodOutputTSSYNC", DEFAULT_DEMOD_OUTPUT_TSSYNC, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSVLD]  = HIADP_INI_Getl(SectionName, "DemodOutputTSVLD",  DEFAULT_DEMOD_OUTPUT_TSVLD, FRONTEND_CONFIG_FILE);
        stTSOut.enTSOutput[HI_UNF_TUNER_OUTPUT_TSERR]  = HIADP_INI_Getl(SectionName, "DemodOutputTSERR",  DEFAULT_DEMOD_OUTPUT_TSERR, FRONTEND_CONFIG_FILE);

        Ret = HI_UNF_TUNER_SetTSOUT(TunerId, &stTSOut);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("[%s] HI_UNF_TUNER_SetTSOUT failed 0x%x\n", __FUNCTION__, Ret);
            return HI_FAILURE;
        }

    }

    return HI_SUCCESS;
}


HI_S32 HIADP_Tuner_Init(HI_VOID)
{
    HI_S32                          Ret;
    HI_U32                          i;
    HI_UNF_TUNER_ATTR_S             TunerAttr;
    HI_UNF_TUNER_FE_LNB_CONFIG_S    LnbConfig;
    HI_UNF_TUNER_SAT_ATTR_S         SatTunerAttr;
    HI_UNF_TUNER_TER_ATTR_S         TerTunerAttr;

    Ret = HI_UNF_I2C_Init();
    if (HI_SUCCESS != Ret)
    {
        sample_common_printf("[%s] HI_UNF_I2C_Init failed 0x%x\n", __FUNCTION__, Ret);
        return Ret;
    }

    Ret = HI_UNF_TUNER_Init();
    if (HI_SUCCESS != Ret)
    {
        sample_common_printf("[%s] HI_UNF_TUNER_Init failed 0x%x\n", __FUNCTION__, Ret);
        return Ret;
    }

    gCfgTunerNum = HIADP_INI_Getl("tunernum", "TunerNum", DEFAULT_TUNER_NUM, FRONTEND_CONFIG_FILE);
    if(gCfgTunerNum > HI_TUNER_NUMBER)
    {
        sample_common_printf("[%s] gCfgTunerNum[%d] is out of max number[%d].\n", __FUNCTION__, gCfgTunerNum, HI_TUNER_NUMBER);
        return HI_FAILURE;
    }

    for (i = 0; i < gCfgTunerNum; i++)
    {
        Ret = HI_UNF_TUNER_Open(i);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("[%s] HI_UNF_TUNER_Open failed 0x%x\n", __FUNCTION__, Ret);
            break;
        }

        /*get default attribute in order to set attribute next*/
        Ret = HI_UNF_TUNER_GetDeftAttr(i, &TunerAttr);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("[%s] HI_UNF_TUNER_GetDeftAttr failed 0x%x\n", __FUNCTION__, Ret);
            break;
        }

        Ret = HIADP_Tuner_GetConfig(i, &TunerAttr);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("[%s] HIADP_Tuner_GetConfig failed 0x%x\n", __FUNCTION__, Ret);
            break;
        }
        sleep(1);
        printf("****************************************************************************\n");
        printf("TunerId=%u, TunerType=%u, TunerAddr=0x%x, I2cChannel=%u, DemodAddr=0x%x, \nDemodType=%u,SigType:%u,OutputMode:%u,ResetGpioNo:%u\n",
                i,
                TunerAttr.enTunerDevType,
                TunerAttr.u32TunerAddr,
                TunerAttr.enI2cChannel,
                TunerAttr.u32DemodAddr,
                TunerAttr.enDemodDevType,
                TunerAttr.enSigType,
                TunerAttr.enOutputMode,
                TunerAttr.u32ResetGpioNo);
        printf("****************************************************************************\n");
        sleep(1);
        Ret = HI_UNF_TUNER_SetAttr(i, &TunerAttr);
        if (HI_SUCCESS != Ret)
        {
            sample_common_printf("[%s] HI_UNF_TUNER_SetAttr failed 0x%x\n", __FUNCTION__, Ret);
            break;
        }

        g_enSigType[i] = TunerAttr.enSigType;

        if (HI_UNF_TUNER_SIG_TYPE_SAT == TunerAttr.enSigType)
        {
            /* Default use dual freqency, C band, 5150/5750 */
            Ret = HIADP_Tuner_GetSatAttr(i, &SatTunerAttr);
            if (HI_SUCCESS != Ret)
            {
                sample_common_printf("[%s] HIADP_Tuner_GetSatAttr failed 0x%x\n", __FUNCTION__, Ret);
                break;
            }

            Ret = HI_UNF_TUNER_SetSatAttr(i, &SatTunerAttr);
            if (HI_SUCCESS != Ret)
            {
                printf("[%s] HI_UNF_TUNER_SetSatAttr failed 0x%x\n", __FUNCTION__, Ret);
                return Ret;
            }
            LnbConfig.enLNBType = HI_UNF_TUNER_FE_LNB_DUAL_FREQUENCY;
            LnbConfig.enLNBBand = HI_UNF_TUNER_FE_LNB_BAND_C;
            LnbConfig.u32LowLO = 5150;
            LnbConfig.u32HighLO = 5750;
            HI_UNF_TUNER_SetLNBConfig(i, &LnbConfig);

            HI_UNF_TUNER_SetLNBPower(i, HI_UNF_TUNER_FE_LNB_POWER_ON);
        }
        else if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == TunerAttr.enSigType) ||
                 (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == TunerAttr.enSigType) ||
                 (HI_UNF_TUNER_SIG_TYPE_ISDB_T == TunerAttr.enSigType) ||
                 (HI_UNF_TUNER_SIG_TYPE_DTMB == TunerAttr.enSigType))
        {
            Ret = HIADP_Tuner_GetTerAttr(i, &TerTunerAttr);
            if (HI_SUCCESS != Ret)
            {
                sample_common_printf("[%s] HIADP_Tuner_GetTerAttr failed 0x%x\n", __FUNCTION__, Ret);
                break;
            }

            Ret = HI_UNF_TUNER_SetTerAttr(i, &TerTunerAttr);
            if (HI_SUCCESS != Ret)
            {
                printf("[%s] HI_UNF_TUNER_SetTerAttr failed 0x%x\n", __FUNCTION__, Ret);
                return Ret;
            }

        }
        else if(HI_UNF_TUNER_SIG_TYPE_ABSS == TunerAttr.enSigType)
        {
            LnbConfig.enLNBType = HI_UNF_TUNER_FE_LNB_SINGLE_FREQUENCY;
            LnbConfig.enLNBBand = HI_UNF_TUNER_FE_LNB_BAND_KU;
            LnbConfig.u32LowLO = 10750;
            LnbConfig.u32HighLO = 10750;
            HI_UNF_TUNER_SetLNBConfig(i, &LnbConfig);
        }

        HIADP_Tuner_SetTSOUT(i);
    }

    if (HI_SUCCESS != Ret)
    {
        for (i = 0; i < gCfgTunerNum; i++)
        {
            HI_UNF_TUNER_Close(i);
        }

        HI_UNF_TUNER_DeInit();
    }

    return Ret;
}

/* Freq:MHZ  SymbolRate:KHZ  */
HI_S32 HIADP_Tuner_Connect(HI_U32 TunerID, HI_U32 Freq, HI_U32 SymbolRate, HI_U32 ThirdParam)
{
    HI_UNF_TUNER_CONNECT_PARA_S  ConnectPara = {0};

    /* DVB-S/S2 demod: AVL6211 / 3136 */
    if (HI_UNF_TUNER_SIG_TYPE_SAT == g_enSigType[TunerID])
    {
        ConnectPara.enSigType = HI_UNF_TUNER_SIG_TYPE_SAT;
        if (ThirdParam >= HI_UNF_TUNER_FE_POLARIZATION_BUTT)
        {
            ThirdParam = HI_UNF_TUNER_FE_POLARIZATION_H;
        }
        ConnectPara.unConnectPara.stSat.enPolar = ThirdParam;
        ConnectPara.unConnectPara.stSat.u32Freq = Freq * 1000;
        ConnectPara.unConnectPara.stSat.u32SymbolRate = SymbolRate * 1000;
        ConnectPara.unConnectPara.stSat.u32ScrambleValue = 0;
    }
    else if(HI_UNF_TUNER_SIG_TYPE_ABSS == g_enSigType[TunerID])
    {
        ConnectPara.enSigType = HI_UNF_TUNER_SIG_TYPE_ABSS;
        if (ThirdParam >= HI_UNF_TUNER_FE_POLARIZATION_BUTT)
        {
            ThirdParam = HI_UNF_TUNER_FE_POLARIZATION_L;
        }
        ConnectPara.unConnectPara.stSat.enPolar = ThirdParam;
        ConnectPara.unConnectPara.stSat.u32Freq = Freq * 1000;
        ConnectPara.unConnectPara.stSat.u32SymbolRate = SymbolRate * 1000;
        ConnectPara.unConnectPara.stSat.u32ScrambleValue = 0;

    }
    /* DVB-C demod */
    else if ((HI_UNF_TUNER_SIG_TYPE_CAB == g_enSigType[TunerID]) || (HI_UNF_TUNER_SIG_TYPE_J83B == g_enSigType[TunerID]))
    {
        ConnectPara.enSigType = HI_UNF_TUNER_SIG_TYPE_CAB;
        ConnectPara.unConnectPara.stCab.bReverse = 0;

        switch (ThirdParam)
        {
            case 16 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_16;
                break;
            case 32 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_32;
                break;
            case 64 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_64;
                break;
            case 128 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_128;
                break;
            case 256 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_256;
                break;
            case 512 :
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_512;
                break;
            default:
                ConnectPara.unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_64;
        }

        ConnectPara.unConnectPara.stCab.u32Freq = Freq * 1000;
        ConnectPara.unConnectPara.stCab.u32SymbolRate = SymbolRate * 1000;
    }
    /* DVB_T/T2... demod */
    else if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == g_enSigType[TunerID])
                || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == g_enSigType[TunerID])
                || (HI_UNF_TUNER_SIG_TYPE_ISDB_T == g_enSigType[TunerID])
                || (HI_UNF_TUNER_SIG_TYPE_DTMB == g_enSigType[TunerID]))
    {
        ConnectPara.enSigType = g_enSigType[TunerID];
        ConnectPara.unConnectPara.stTer.bReverse = 0;
        ConnectPara.unConnectPara.stTer.u32Freq = Freq * 1000;
        ConnectPara.unConnectPara.stTer.u32BandWidth = SymbolRate;
        ConnectPara.unConnectPara.stTer.enChannelMode = ThirdParam;
        ConnectPara.unConnectPara.stTer.enDVBTPrio = ThirdParam + 1;
    }

    /* connect Tuner*/
    return HI_UNF_TUNER_Connect(TunerID, &ConnectPara, 2000);
}

HI_S32 HIADP_Tuner_GetConnectPara(HI_U32 u32TunerID, HI_UNF_TUNER_CONNECT_PARA_S *pstConnectPara)
{
    if (u32TunerID > gCfgTunerNum)
    {
        sample_common_printf("[%s] u32TunerID invalid\n", __FUNCTION__);
        return HI_FAILURE;
    }
    switch (g_enSigType[u32TunerID])
    {
        case HI_UNF_TUNER_SIG_TYPE_CAB:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_CAB;
            pstConnectPara->unConnectPara.stCab.bReverse = 0;
            pstConnectPara->unConnectPara.stCab.u32Freq = 666000;
            pstConnectPara->unConnectPara.stCab.u32SymbolRate = 6875000;
            pstConnectPara->unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
        case HI_UNF_TUNER_SIG_TYPE_SAT:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_SAT;
            pstConnectPara->unConnectPara.stSat.u32Freq = 3840000;
            pstConnectPara->unConnectPara.stSat.u32SymbolRate = 27500000;
            pstConnectPara->unConnectPara.stSat.enPolar = HI_UNF_TUNER_FE_POLARIZATION_H;
            break;
        case HI_UNF_TUNER_SIG_TYPE_DVB_T:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T;
            pstConnectPara->unConnectPara.stTer.bReverse = 0;
            pstConnectPara->unConnectPara.stTer.u32Freq = 666000;
            pstConnectPara->unConnectPara.stTer.u32BandWidth = 8000;
            break;
        case HI_UNF_TUNER_SIG_TYPE_DVB_T2:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T2;
            pstConnectPara->unConnectPara.stTer.bReverse = 0;
            pstConnectPara->unConnectPara.stTer.u32Freq = 666000;
            pstConnectPara->unConnectPara.stTer.u32BandWidth = 8000;
            break;
        case HI_UNF_TUNER_SIG_TYPE_ISDB_T:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_ISDB_T;
            pstConnectPara->unConnectPara.stTer.bReverse = 0;
            pstConnectPara->unConnectPara.stTer.u32Freq = 666000;
            pstConnectPara->unConnectPara.stTer.u32BandWidth = 6000;
            break;
        case HI_UNF_TUNER_SIG_TYPE_ATSC_T:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_ATSC_T;
            pstConnectPara->unConnectPara.stTer.bReverse = 0;
            pstConnectPara->unConnectPara.stTer.u32Freq = 666000;
            pstConnectPara->unConnectPara.stTer.u32BandWidth = 6000;
            break;
        case HI_UNF_TUNER_SIG_TYPE_DTMB:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_DTMB;
            pstConnectPara->unConnectPara.stTer.bReverse = 0;
            pstConnectPara->unConnectPara.stTer.u32Freq = 666000;
            pstConnectPara->unConnectPara.stTer.u32BandWidth = 6000;
            break;
        case HI_UNF_TUNER_SIG_TYPE_J83B:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_J83B;
            pstConnectPara->unConnectPara.stCab.bReverse = 0;
            pstConnectPara->unConnectPara.stCab.u32Freq = 666000;
            pstConnectPara->unConnectPara.stCab.u32SymbolRate = 5056941;
            pstConnectPara->unConnectPara.stCab.enModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
        case HI_UNF_TUNER_SIG_TYPE_ABSS:
            pstConnectPara->enSigType = HI_UNF_TUNER_SIG_TYPE_ABSS;
            pstConnectPara->unConnectPara.stSat.u32Freq = 1184000;
            pstConnectPara->unConnectPara.stSat.u32SymbolRate = 28800000;
            pstConnectPara->unConnectPara.stSat.enPolar = HI_UNF_TUNER_FE_POLARIZATION_L;
            break;
        case HI_UNF_TUNER_SIG_TYPE_BUTT:
            break;
    }
    return HI_SUCCESS;
}

HI_VOID HIADP_Tuner_DeInit(HI_VOID)
{
    HI_U32 i;
    HI_S32 ret;
    HI_U32 MaxI2cNum;
    HI_UNF_TUNER_ATTR_S TunerAttr;

    ret = HI_UNF_I2C_GetCapability(&MaxI2cNum);
    if (HI_SUCCESS != ret)
    {
        sample_common_printf("[%s] HI_UNF_I2C_GetCapability failed 0x%x\n", __FUNCTION__, ret);
        return;
    }

    for (i = 0; i < gCfgTunerNum; i++)
    {
        ret = HI_UNF_TUNER_GetAttr(i, &TunerAttr);
        if (HI_SUCCESS != ret)
        {
            sample_common_printf("[%s] HI_UNF_TUNER_GetAttr failed 0x%x\n", __FUNCTION__, ret);
        }
        else
        {
            if (TunerAttr.enI2cChannel >= MaxI2cNum)
            {
                HI_UNF_I2C_DestroyGpioI2c(TunerAttr.enI2cChannel);
            }
        }

        HI_UNF_TUNER_Close(i);
    }

    HI_UNF_I2C_DeInit();

    HI_UNF_TUNER_DeInit();
}

