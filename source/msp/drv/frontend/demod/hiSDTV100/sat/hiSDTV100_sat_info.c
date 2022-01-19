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
#include "hiSDTV100_sat_info.h"
#include "hiSDTV100_sat_core.h"
#include "hiSDTV100_config.h"
#include "drv_demod.h"
#include "drv_common.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

typedef struct hiSAT_DEMOD_FEC_INFO_S
{
    HI_UNF_MODULATION_TYPE_E enModType;
    HI_UNF_TUNER_FE_FECRATE_E enFECRate;
} SAT_DEMOD_FEC_INFO_S;

HI_S32 HiSDTV100_Sat_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus)
{
    HI_U8 u8RegBit = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 5, &u8RegBit);

    if(u8RegBit)
    {
        *penTunerStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
    }
    else
    {
        *penTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_GetBerDVBS(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_U8 u8RegVal = 0, u8RegValL = 0, u8RegValH = 0;
    HI_U32 u32TotalNum = 0, u32TotalErr = 0, u32FramNum = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    qam_read_byte(u32TunerPort, SAT_FEC_CTRL_BER, &u8RegVal);
    switch((u8RegVal>>4) & 0x7)
    {
        case 0:
            u32FramNum = 0x10;
            break;
        case 1:
            u32FramNum = 0x40;
            break;
        case 2:
            u32FramNum = 0x100;
            break;
        case 3:
            u32FramNum = 0x400;
            break;
        case 4:
            u32FramNum = 0x1000;
            break;
        case 5:
            u32FramNum = 0x4000;
            break;
        case 6:
            u32FramNum = 0x10000;
            break;
        default:
            u32FramNum = 0x40000;
            break;
    }
    u32TotalNum = u32FramNum*204*8;

    qam_read_byte(u32TunerPort, SAT_FEC_BER_L, &u8RegValL);
    qam_read_byte(u32TunerPort, SAT_FEC_BER_H, &u8RegValH);
    u32TotalErr = (u8RegValH<<7) + u8RegValL;

    pu32BER[0] = u32TotalErr * 100000 / u32TotalNum * 10000;
    pu32BER[1] = 0;
    pu32BER[2] = 9;

    HI_INFO_TUNER("(* pu32BER)[0]:%d.\n",pu32BER[0]);
    HI_INFO_TUNER("(* pu32BER)[1]:%d.\n",pu32BER[1]);
    HI_INFO_TUNER("(* pu32BER)[2]:%d.\n",pu32BER[2]);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_GetBerDVBS2_S2X(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_U8 u8RegVal = 0, u8RegValL = 0, u8RegValH = 0, u8ModCod = 0, u8PlsCode = 0;
    HI_U32 n = 0, u32FramNum = 0, u32TotalNum = 0, u32TotalErr = 0;
    HI_U32 au32FramNumTable[] = {0x04, 0x10, 0x80, 0x100, 0x800, 0x1000, 0x8000, 0xffff};
    HI_U32 auS2NomalModCod[] = {
            16200, 21600, 25920, 32400, 38880,   43200, 48600, 51840, 54000, 57600,
            58320, 38880, 43200, 48600, 54000,   57600, 58320, 43200, 48600, 51840,
            54000, 57600, 58320, 48600, 51840,   54000, 57600, 58320};
    HI_U32 auS2ShortModCod[] = {
            3240,  5400,  6480,  7200,  9720,    10800, 11880, 12600, 13320, 14400,
            14400, 9720,  10800, 11880, 13320,   14400, 14400, 10800, 11880, 12600,
            13320, 14400, 14400, 11880, 12600,   13320, 14400};
    HI_U32 auS2XNomalModCod[] = {
            18720, 29160, 35640, 36000, 37440,   41400, 45000, 46800, 32400, 34560,
            36000, 37440, 38880, 38880, 40320,   41400, 43200, 45000, 46800, 50400,
            55440, 43200, 0,     46080, 47520,   50400};
    HI_U32 auS2XShortModCod[] = {
            3960,  4320,  5040,  7560,  8640,    11520, 7560,  8640,  9360,   11520,
            7560,  8640,  9360,  9720,  11520,   10800, 11520};

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8PlsCode);
    if (u8PlsCode & 0x80) //DVB-S2X
    {
        u8ModCod = ((u8PlsCode & 0x7e) >> 1);
        if (u8ModCod >= 2 && u8ModCod <= 0x1B)
        {
            n = auS2XNomalModCod[u8ModCod-2];
        }
        else if (u8ModCod >= 0x2C && u8ModCod <= 0x3c)
        {
            n = auS2XShortModCod[u8ModCod-0x2C];
        }
        else
        {
            n = 0;
        }
    }
    else //DVB-S2
    {
        u8ModCod = (u8PlsCode >> 2) & 0x1F;
        if (u8PlsCode & 0x02)
        {
            if (u8ModCod >= 1 && u8ModCod <= 27)
            {
                n = auS2ShortModCod[u8ModCod - 1];
            }
            else
            {
                n = 14400;
            }
        }
        else
        {
            if (u8ModCod >= 1 && u8ModCod <= 28)
            {
                n = auS2NomalModCod[u8ModCod - 1];
            }
            else
            {
                n = 583200;
            }
        }
    }

    qam_read_byte(u32TunerPort, SAT_FEC_CTRL_BER, &u8RegVal);
    u32FramNum = au32FramNumTable[(u8RegVal >> 4) & 0x7];

    u32TotalNum = n*u32FramNum;
    qam_read_byte(u32TunerPort, SAT_FEC_BER_L, &u8RegValL);
    qam_read_byte(u32TunerPort, SAT_FEC_BER_H, &u8RegValH);
    u32TotalErr = (u8RegValH<<8) + u8RegValL;

    if (u32TotalNum != 0)
    {
        pu32BER[0] = tuner_get_div(u32TotalErr, u32TotalNum, 9);
        pu32BER[1] = 0;
        pu32BER[2] = 9;
    }
    else
    {
        pu32BER[0] = 0;
        pu32BER[1] = 0;
        pu32BER[2] = 0;
        HI_WARN_PrintU32(u32TotalNum);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_GETBER);
        return HI_ERR_TUNER_FAILED_GETBER;
    }
    HI_INFO_PrintU32(pu32BER[0]);
    HI_INFO_PrintU32(pu32BER[1]);
    HI_INFO_PrintU32(pu32BER[2]);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    HI_U8 u8RegBit = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetStatus(u32TunerPort, &enTunerStatus));

    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        pu32BER[0] = 0;
        pu32BER[1] = 0;
        pu32BER[2] = 0;
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        HI_FuncExit();
        return HI_SUCCESS;
    }

    qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 3, &u8RegBit);
    if(u8RegBit)//DVB-S2X/DVB-S2
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_GetBerDVBS2_S2X(u32TunerPort, pu32BER));
    }
    else//DVB-S
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_GetBerDVBS(u32TunerPort, pu32BER));
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR)
{
    HI_U8 au8RegVal[2] = {0};
    HI_U8 u8Times = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    do
    {
        qam_read_byte(u32TunerPort, SAT_NOISE_POW_L, &au8RegVal[0]);
        qam_read_byte(u32TunerPort, SAT_NOISE_POW_H, &au8RegVal[1]);
        u8Times++;
    }while(!(au8RegVal[1] & (1 << 7)) && (u8Times < 10));

    if (!(au8RegVal[1] & (1 << 7)) && (10 == u8Times))
    {
        LOG_PrintWarning("CNR is not finished,u8Times:%d/10.\n",u8Times);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_GETSNR);
        return HI_ERR_TUNER_FAILED_GETSNR;
    }

    *pu32SNR = ((au8RegVal[1] & 0x7f) << 8) + au8RegVal[0];
    HI_DBG_PrintU32(*pu32SNR);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_U8 au8RegVal[2] = {0};

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    qam_read_byte(u32TunerPort, SAT_AGC_CTRL_L, &au8RegVal[0]);
    qam_read_byte(u32TunerPort, SAT_AGC_CTRL_H, &au8RegVal[1]);

    if (au8RegVal[1] >> 7)
    {
        pu32SignalStrength[1] = ((au8RegVal[1] & 0x0f) << 8) + au8RegVal[0];
    }
    else
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }
    pu32SignalStrength[0] = 0;
    pu32SignalStrength[2] = 0;

    HI_DBG_PrintU32(pu32SignalStrength[1]);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_GetSignalInfoDVBS(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    pstInfo->unSignalInfo.stSat.enSATType = HI_UNF_TUNER_FE_DVBS;
    pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_QPSK;
    pstInfo->unSignalInfo.stSat.enCodeModulation = HI_UNF_TUNER_CODE_MODULATION_CCM;
    qam_read_byte(u32TunerPort, SAT_PARAM_DVBS, &u8RegVal);
    switch(u8RegVal & 0x7)
    {
        case 0:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 2:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 3:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        case 4:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_7_8;
            break;
        case 5:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FEC_6_7;
            break;
        default:
            pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FECRATE_BUTT;
            break;
    }

    HI_DBG_PrintU32(pstInfo->unSignalInfo.stSat.enModType);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stSat.enFECRate);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_ConvertPlsCodeDVBS2X(HI_U8 u8PlsCode, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_U8 u8ModCode = ((u8PlsCode & 0x7e) >> 1);
    SAT_DEMOD_FEC_INFO_S astNormalModFecInfo[] =
    {
        {HI_UNF_MOD_TYPE_VLSNR_SET1, HI_UNF_TUNER_FE_FEC_AUTO}, //PLS_CODE[6:1]=0x0
        {HI_UNF_MOD_TYPE_VLSNR_SET2, HI_UNF_TUNER_FE_FEC_AUTO}, //PLS_CODE[6:1]=0x1
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_13_45},      //PLS_CODE[6:1]=0x2
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_9_20},       //PLS_CODE[6:1]=0x3
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_11_20},      //PLS_CODE[6:1]=0x4
        {HI_UNF_MOD_TYPE_8APSK, HI_UNF_TUNER_FE_FEC_5_9_L},     //PLS_CODE[6:1]=0x5
        {HI_UNF_MOD_TYPE_8APSK, HI_UNF_TUNER_FE_FEC_26_45_L},   //PLS_CODE[6:1]=0x6
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_23_36},      //PLS_CODE[6:1]=0x7
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_25_36},      //PLS_CODE[6:1]=0x8
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_13_18},      //PLS_CODE[6:1]=0x9
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_1_2_L},    //PLS_CODE[6:1]=0xa
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_8_15_L},   //PLS_CODE[6:1]=0xb
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_5_9_L},    //PLS_CODE[6:1]=0xc
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_26_45},    //PLS_CODE[6:1]=0xd
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_3_5},      //PLS_CODE[6:1]=0xe
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_3_5_L},    //PLS_CODE[6:1]=0xf
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_28_45},    //PLS_CODE[6:1]=0x10
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_23_36},    //PLS_CODE[6:1]=0x11
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_2_3_L},    //PLS_CODE[6:1]=0x12
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_25_36},    //PLS_CODE[6:1]=0x13
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_13_18},    //PLS_CODE[6:1]=0x14
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_7_9},      //PLS_CODE[6:1]=0x15
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_77_90},    //PLS_CODE[6:1]=0x16
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_2_3_L},    //PLS_CODE[6:1]=0x17
        {HI_UNF_MOD_TYPE_BUTT, HI_UNF_TUNER_FE_FECRATE_BUTT},   //PLS_CODE[6:1]=0x18
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_32_45},    //PLS_CODE[6:1]=0x19
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_11_15},    //PLS_CODE[6:1]=0x1a
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_7_9},      //PLS_CODE[6:1]=0x1b
        {HI_UNF_MOD_TYPE_BUTT, HI_UNF_TUNER_FE_FECRATE_BUTT}
    };
    SAT_DEMOD_FEC_INFO_S astShortModFecInfo[] =
    {
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_11_45},      //PLS_CODE[6:1]=0x2c
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_4_15},       //PLS_CODE[6:1]=0x2d
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_14_45},      //PLS_CODE[6:1]=0x2e
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_7_15},       //PLS_CODE[6:1]=0x2f
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_8_15},       //PLS_CODE[6:1]=0x30
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_32_45},      //PLS_CODE[6:1]=0x31
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_7_15},       //PLS_CODE[6:1]=0x32
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_8_15},       //PLS_CODE[6:1]=0x33
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_26_45},      //PLS_CODE[6:1]=0x34
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_32_45},      //PLS_CODE[6:1]=0x35
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_7_15},     //PLS_CODE[6:1]=0x36
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_8_15},     //PLS_CODE[6:1]=0x37
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_26_45},    //PLS_CODE[6:1]=0x38
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_3_5},      //PLS_CODE[6:1]=0x39
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_32_45},    //PLS_CODE[6:1]=0x3a
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_2_3},      //PLS_CODE[6:1]=0x3b
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_32_45},    //PLS_CODE[6:1]=0x3c
        {HI_UNF_MOD_TYPE_BUTT, HI_UNF_TUNER_FE_FECRATE_BUTT}
    };

    HI_FuncEnter();

    if (u8ModCode < (sizeof(astNormalModFecInfo) / sizeof(astNormalModFecInfo[0]) - 1))
    {
        pstInfo->unSignalInfo.stSat.enModType = astNormalModFecInfo[u8ModCode].enModType;
        pstInfo->unSignalInfo.stSat.enFECRate = astNormalModFecInfo[u8ModCode].enFECRate;
        pstInfo->unSignalInfo.stSat.enFECFrameMode = HI_UNF_TUNER_SAT_FEC_FRAME_NORMAL;
    }
    else if(u8ModCode >= 0x2c && ((u8ModCode - 0x2c) < (sizeof(astShortModFecInfo) / sizeof(astShortModFecInfo[0]) - 1)))
    {
        pstInfo->unSignalInfo.stSat.enModType = astShortModFecInfo[u8ModCode-0x2c].enModType;
        pstInfo->unSignalInfo.stSat.enFECRate = astShortModFecInfo[u8ModCode-0x2c].enFECRate;
        pstInfo->unSignalInfo.stSat.enFECFrameMode = HI_UNF_TUNER_SAT_FEC_FRAME_SHORT;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enModType = HI_UNF_MOD_TYPE_BUTT;
        pstInfo->unSignalInfo.stSat.enFECRate = HI_UNF_TUNER_FE_FECRATE_BUTT;
        pstInfo->unSignalInfo.stSat.enFECFrameMode = HI_UNF_TUNER_SAT_FEC_FRAME_BUTT;
        HI_WARN_PrintU32(u8ModCode);
    }

    if (u8PlsCode & 0x01)
    {
        pstInfo->unSignalInfo.stSat.enPilot = HI_UNF_TUNER_PILOT_ON;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enPilot = HI_UNF_TUNER_PILOT_OFF;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_ConvertPlsCodeDVBS2(HI_U8 u8PlsCode, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_U8 u8ModCode = ((u8PlsCode & 0x7c) >> 2);

    SAT_DEMOD_FEC_INFO_S astModFecInfo[] =
    {
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_AUTO},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_1_4},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_1_3},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_2_5},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_1_2},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_3_5},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_2_3},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_3_4},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_4_5},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_5_6},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_8_9},
        {HI_UNF_MOD_TYPE_QPSK, HI_UNF_TUNER_FE_FEC_9_10},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_3_5},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_2_3},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_3_4},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_5_6},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_8_9},
        {HI_UNF_MOD_TYPE_8PSK, HI_UNF_TUNER_FE_FEC_9_10},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_2_3},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_3_4},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_4_5},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_5_6},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_8_9},
        {HI_UNF_MOD_TYPE_16APSK, HI_UNF_TUNER_FE_FEC_9_10},
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_3_4},
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_4_5},
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_5_6},
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_8_9},
        {HI_UNF_MOD_TYPE_32APSK, HI_UNF_TUNER_FE_FEC_9_10},
        {HI_UNF_MOD_TYPE_BUTT, HI_UNF_TUNER_FE_FECRATE_BUTT}
    };

    HI_FuncEnter();

    if (u8ModCode < (sizeof(astModFecInfo) / sizeof(astModFecInfo[0]) - 1))
    {
        pstInfo->unSignalInfo.stSat.enModType = astModFecInfo[u8ModCode].enModType;
        pstInfo->unSignalInfo.stSat.enFECRate = astModFecInfo[u8ModCode].enFECRate;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enModType = astModFecInfo[sizeof(astModFecInfo) / sizeof(astModFecInfo[0]) - 1].enModType;
        pstInfo->unSignalInfo.stSat.enFECRate = astModFecInfo[sizeof(astModFecInfo) / sizeof(astModFecInfo[0]) - 1].enFECRate;
        HI_WARN_PrintU32(u8ModCode);
    }

    if (u8PlsCode & 0x02)
    {
        pstInfo->unSignalInfo.stSat.enFECFrameMode = HI_UNF_TUNER_SAT_FEC_FRAME_SHORT;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enFECFrameMode = HI_UNF_TUNER_SAT_FEC_FRAME_NORMAL;
    }

    if (u8PlsCode & 0x01)
    {
        pstInfo->unSignalInfo.stSat.enPilot = HI_UNF_TUNER_PILOT_ON;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enPilot = HI_UNF_TUNER_PILOT_OFF;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_GetSignalInfoDVBS2_S2X(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32StreamIndex = 0, u32TotalStreamNum = 0;
    HI_U8 u8RegVal = 0, u8IsiId = 0, u8CurIsiId = 0, u8IsCCM = 0, u8PlsCode = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetTotalStream(u32TunerPort, &u32TotalStreamNum));

    //config to read the matype of isi id.
    qam_read_bit(u32TunerPort, SAT_TS_CTRL3, 7, &u8IsCCM);//is_ccm
    if (!u8IsCCM)
    {
        pstInfo->unSignalInfo.stSat.enCodeModulation = HI_UNF_TUNER_CODE_MODULATION_VCM_ACM;
    }
    else if(u32TotalStreamNum >= 2)
    {
        pstInfo->unSignalInfo.stSat.enCodeModulation = HI_UNF_TUNER_CODE_MODULATION_MULTISTREAM;
    }
    else
    {
        pstInfo->unSignalInfo.stSat.enCodeModulation = HI_UNF_TUNER_CODE_MODULATION_CCM;
    }

    /* output first isi or isi_sel*/
    qam_read_bit(u32TunerPort, SAT_TS_CTRL4, 7, &u8RegVal);
    if(u8RegVal)
    {
        /* read isi_sel */
        qam_read_byte(u32TunerPort, SAT_ISI_SEL, &u8IsiId);
        for(u32StreamIndex = 0; u32StreamIndex < u32TotalStreamNum; u32StreamIndex++)
        {
            HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetIsiID(u32TunerPort, (HI_U8)u32StreamIndex, &u8CurIsiId));
            if (u8CurIsiId == u8IsiId)
            {
                HI_INFO_PrintU32(u8IsiId);
                break;
            }
        }
        if (u32StreamIndex == u32TotalStreamNum)
        {
            LOG_PrintWarning("Not find u8IsiId:%d, please get isi id first.\n", u8IsiId);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_GETISIID);
            return HI_ERR_TUNER_FAILED_GETISIID;
        }
    }
    else
    {
        u32StreamIndex = 0;
    }

    //低于CN门限的DVBS2频点，偶尔能FEC锁定，但ISI寄存器信息可能为芯片内部初始值(不可靠)，Modcod需读0x5c寄存器
    if (0 == u32TotalStreamNum)
    {
        qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8PlsCode);
    }
    else
    {
        //get pls_code
        qam_read_byte(u32TunerPort, SAT_TS_CTRL3, &u8RegVal);
        u8RegVal &= 0x80;
        u8RegVal |= (2<<5);
        u8RegVal |= (u32StreamIndex & 0x1F);
        qam_write_byte(u32TunerPort, SAT_TS_CTRL3, u8RegVal);
        qam_read_byte(u32TunerPort, SAT_MATTYPE, &u8PlsCode);
    }
    HI_INFO_TUNER("u8PlsCode:%d\n", u8PlsCode);

    if (u8PlsCode & 0x80) //DVBS2X
    {
        pstInfo->unSignalInfo.stSat.enSATType = HI_UNF_TUNER_FE_DVBS2X;
        Sat_ConvertPlsCodeDVBS2X(u8PlsCode, pstInfo);
    }
    else //DVBS2
    {
        pstInfo->unSignalInfo.stSat.enSATType = HI_UNF_TUNER_FE_DVBS2;
        Sat_ConvertPlsCodeDVBS2(u8PlsCode, pstInfo);
    }

    qam_read_byte(u32TunerPort, SAT_TS_CTRL3, &u8RegVal);
    u8RegVal &= 0x80;
    u8RegVal |= 1 << 5;
    u8RegVal |= (u32StreamIndex & 0x1F);
    qam_write_byte(u32TunerPort, SAT_TS_CTRL3, u8RegVal);
    qam_read_byte(u32TunerPort, SAT_MATTYPE, &u8RegVal);
    switch (u8RegVal >> 6)
    {
        case 0:
            pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_GENERIC_PACKETIZED;
            break;
        case 1:
            pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_GENERIC_CONTINUOUS;
            break;
        case 2:
            if (u8RegVal & 0x20)
                pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_GSE_LITE_HEM;
            else
                pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_GSE_HEM;
            break;
        case 3:
            pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_TRANSPORT;
            break;
        default:
            pstInfo->unSignalInfo.stSat.enStreamType = HI_UNF_TUNER_SAT_STREAM_TYPE_BUTT;
            break;
    }
    HI_INFO_PrintReg8(SAT_MATTYPE, u8RegVal);

    qam_read_byte(u32TunerPort, SAT_GS_OUT, &u8RegVal);
    switch ((u8RegVal & 0x70) >> 4)
    {
        case 0:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_35;
            break;
        case 1:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_25;
            break;
        case 2:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_20;
            break;
        case 4:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_15;
            break;
        case 5:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_10;
            break;
        case 6:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_05;
            break;
        default:
            pstInfo->unSignalInfo.stSat.enRollOff = HI_UNF_TUNER_ROLLOFF_BUTT;
            break;
    }

    HI_DBG_PrintU32(pstInfo->unSignalInfo.stSat.enModType);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stSat.enFECRate);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stSat.enFECFrameMode);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    HI_U8 u8RegBit = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_SAT;
    qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 3, &u8RegBit);//sync
    if (u8RegBit)
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_GetSignalInfoDVBS2_S2X(u32TunerPort, pstInfo));
    }
    else//DVB-S
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_GetSignalInfoDVBS(u32TunerPort, pstInfo));
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb )
{
    HI_U8 u8Reg_L = 0, u8Reg_H = 0, u8Reg_M = 0;
    HI_U32 u32SymbKHz = 0,u32DemoKHz;
    HI_S32 s32ValueKHz = 0,s32FsDeltaKHz;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Freq);
    HI_TUNER_CHECKPOINTER(pu32Symb);

    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_L, &u8Reg_L);
    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_M, &u8Reg_M);
    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_H, &u8Reg_H);
    u8Reg_H &= 0x3;
    u32DemoKHz = (u8Reg_H << 16) + (u8Reg_M << 8) + u8Reg_L;

    qam_read_byte(u32TunerPort, SAT_FREQ_OFFSET_FC_L, &u8Reg_L);
    qam_read_byte(u32TunerPort, SAT_FREQ_OFFSET_FC_H, &u8Reg_H);
    s32ValueKHz = u8Reg_H * 256 + u8Reg_L;
    if (s32ValueKHz >= 32768)
    {
        s32ValueKHz -= 65536;
    }
    *pu32Freq = s32ValueKHz * ((HI_S32)u32DemoKHz)/(1<<17);

    qam_read_byte(u32TunerPort, SAT_FS_L, &u8Reg_L);
    qam_read_byte(u32TunerPort, SAT_FS_M, &u8Reg_M);
    qam_read_byte(u32TunerPort, SAT_FS_H, &u8Reg_H);
    u8Reg_H &= 0x1;
    u32SymbKHz = (u8Reg_H << 16) + (u8Reg_M << 8) + u8Reg_L;

    qam_read_byte(u32TunerPort, SAT_FS_OFFSET_FC_L, &u8Reg_L);
    qam_read_byte(u32TunerPort, SAT_FS_OFFSET_FC_H, &u8Reg_H);
    s32ValueKHz = u8Reg_H * 256 + u8Reg_L;
    if (s32ValueKHz >= 32768)
    {
        s32ValueKHz -= 65536;
    }
    s32FsDeltaKHz = (HI_S64)s32ValueKHz * u32DemoKHz/(1<<22) ;
    *pu32Symb = (HI_U32)((HI_S32)u32SymbKHz + s32FsDeltaKHz);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetTotalStream(HI_U32 u32TunerPort, HI_U32 *pu32TotalStream)
{
    HI_U32 u32DelayMs = 100;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32TotalStream);

    qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 3, &u8RegVal);
    if(!u8RegVal)
    {
        HI_INFO_TUNER("Not DVBS2 signal, or Not locked yet.\n");
        *pu32TotalStream = 0;
        return HI_SUCCESS;
    }

    //research isi id
    qam_write_bit(u32TunerPort, SAT_TS_PARALL_CTRL, 7, 1);
    while(u32DelayMs)
    {
        qam_read_byte(u32TunerPort, SAT_ISI_NUM, &u8RegVal);
        if(u8RegVal & 0x3F)
        {
            break;
        }

        tuner_mdelay(2);
        u32DelayMs -= 2;
    }

    if(!u32DelayMs)
    {
        *pu32TotalStream = 0;
        LOG_PrintWarning("ISI num is 0.\n");
        return HI_SUCCESS;
    }

    //config to read the matype of isi id.
    qam_read_byte(u32TunerPort, SAT_TS_CTRL3, &u8RegVal);
    u8RegVal &= ~(0x7F);
    u8RegVal |= (1<<5);
    qam_write_byte(u32TunerPort, SAT_TS_CTRL3, u8RegVal);

    qam_read_bit(u32TunerPort, SAT_MATTYPE, 5, &u8RegVal);
    if(u8RegVal)
    {
        LOG_PrintInfo("DVBS2 SIS mode.\n");
        *pu32TotalStream = 1;
    }
    else
    {
        LOG_PrintInfo("DVBS2 MIS mode.\n");
        tuner_mdelay(u32DelayMs);
        qam_read_byte(u32TunerPort, SAT_ISI_NUM, &u8RegVal);
        *pu32TotalStream = (HI_U32)(u8RegVal & 0x3F);
    }

    HI_DBG_PrintU32(*pu32TotalStream);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetIsiID(HI_U32 u32TunerPort, HI_U8 u8Stream, HI_U8 *pu8IsiId)
{
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8IsiId);

    HI_DBG_PrintU32(u8Stream);

    //config to select stream id
    qam_read_byte(u32TunerPort, SAT_TS_CTRL3, &u8RegVal);
    u8RegVal &= ~(0x7F);
    u8RegVal |= (u8Stream & 0x1F);
    qam_write_byte(u32TunerPort, SAT_TS_CTRL3, u8RegVal);
    tuner_mdelay(5);
    qam_read_byte(u32TunerPort, SAT_MATTYPE, pu8IsiId);

    HI_DBG_PrintU32(*pu8IsiId);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SetIsiID(HI_U32 u32TunerPort, HI_U8 u8IsiId)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_U8 i = 0, u8TotalStreamNum = 0, u8CurIsiId = 0;

    HI_FuncEnter();

    HI_DBG_PrintU32(u8IsiId);

    //check ISI id first
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetTotalStream(u32TunerPort, (HI_U32 *)&u8TotalStreamNum));
    for(i=0; i<u8TotalStreamNum; i++)
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetIsiID(u32TunerPort, (HI_U8)i, &u8CurIsiId));
        if (u8CurIsiId != u8IsiId)
        {
            continue;
        }
        else
        {
            HI_DBG_PrintU32(u8IsiId);
            break;
        }
    }
    if (i == u8TotalStreamNum)
    {
        LOG_PrintWarning("Not find u8IsiId:%d, please get isi id first.\n", u8IsiId);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_GETISIID);
        return HI_ERR_TUNER_FAILED_GETISIID;
    }

    qam_write_bit(u32TunerPort, SAT_TS_CTRL4, 7, 1);
    qam_write_byte(u32TunerPort, SAT_ISI_SEL, u8IsiId);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetSampleData(HI_U32 u32TunerPort, TUNER_DATA_SRC_E enDataSrc, HI_U32 u32DataLen, HI_UNF_TUNER_SAMPLE_DATA_S *pstData)
{
    HI_U8 status = 0;
    HI_U32 i = 0, j = 0;
    HI_U8 data_l = 0, data_m = 0, data_h = 0;
    HI_U32 u32WaitCnt = 1000;
    qam_read_byte(u32TunerPort, SAT_CATCH_CLK_SEL, &status);
    status = (status & 0xf8) | 4;
    qam_write_byte(u32TunerPort, SAT_CATCH_CLK_SEL, status);

    //release catch_rst
    qam_read_byte(u32TunerPort, SAT_AXI_RSTN, &status);
    status = status | 0x01 ;
    qam_write_byte(u32TunerPort, SAT_AXI_RSTN, status);

    for (i = 0; i < (u32DataLen + SAT_SAMPLE_DATA_CNT - 1) / SAT_SAMPLE_DATA_CNT; i++)
    {
        tuner_mdelay(1);
        //2. init
        status = 0x00; // cfg_catch_en = 0, cfg_test_mode = 0
        qam_write_byte(u32TunerPort,SAT_CATCH_CTRL, status);

        //dvbs catch_start off
        qam_read_byte(u32TunerPort,SAT_DEMO_FREQ_H,&status);
        status = status & 0xfb ;
        qam_write_byte(u32TunerPort,SAT_DEMO_FREQ_H, status);

        //4. config mode & catch_ena
        status = 0x04; // cfg_catch_en = 1, cfg_test_mode = 0
        qam_write_byte(u32TunerPort,SAT_CATCH_CTRL, status);

        //dvbs catch_start on
        tuner_mdelay(1);

        qam_read_byte(u32TunerPort,SAT_DEMO_FREQ_H,&status);
        status = (status & 0xe7) | (0 << 3) | 0x04 ;
        qam_write_byte(u32TunerPort,SAT_DEMO_FREQ_H, status);

        //5. wait for catch end
        tuner_mdelay(1);
        qam_read_byte(u32TunerPort,SAT_CATCH_CTRL,&status);

        while((status & 0x02) == 0x00 && u32WaitCnt > 0)
        {
            tuner_mdelay(1);
            u32WaitCnt--;
            qam_read_byte(u32TunerPort,SAT_CATCH_CTRL,&status);
        }
        if (!u32WaitCnt)
        {
            LOG_PrintWarning("wait for catch end timeout!\n");
            HI_ERR_PrintErrCode(HI_ERR_TUNER_CATCH_TIMEOUT);
            return HI_ERR_TUNER_CATCH_TIMEOUT;
        }
        //6. read smp from data

        for (j=0;j<1024 && i*SAT_SAMPLE_DATA_CNT+j<u32DataLen;j++)
        {
            qam_read_byte(u32TunerPort, SAT_CATCH_DATA, &data_l);
            qam_read_byte(u32TunerPort, SAT_CATCH_DATA, &data_m);
            qam_read_byte(u32TunerPort, SAT_CATCH_DATA, &data_h);
            //HI_PRINT("%d,%d,%d\n", data_l, data_m, data_h);
            pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataQP = data_l;
            if(pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataQP >= 128)
            {
                pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataQP -= 256;
            }

            pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataIP = data_m;
            if(pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataIP >= 128)
            {
                pstData[i*SAT_SAMPLE_DATA_CNT+j].s32DataIP -= 256;
            }
        }
    }
    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

