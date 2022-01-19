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
#include "hiSDTV100_dvbt2_info.h"
#include "hiSDTV100_dvbt2_core.h"
#include "drv_demod.h"
#include "drv_common.h"
#include "hi_drv_file.h"
#include "hi_drv_proc.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_DVBT2_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus)
{
    HI_U8 u8RegVal = 0x0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    qam_read_byte(u32TunerPort, DVBT2_LOCK_FLAG,&u8RegVal);

    if(u8RegVal & 0x20)
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

static HI_S32 GetSignalInfo_DvbtGuardIntv(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Grd)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Grd)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_32;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_16;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_8;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_4;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtModType(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Cons)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Cons)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QPSK;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_16;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtFFTMode(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8FFT)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8FFT)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_1K;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_2K;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_4K;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_8K;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtFECRate(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8CR)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8CR)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 3:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_7_8;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtHierMod(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Hier)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Hier)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_NO;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA1;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA2;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA4;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtLowPriFECRate(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8CrL)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8CrL)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 3:
            pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enLowPriFECRate = HI_UNF_TUNER_FE_FEC_7_8;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_DvbtTsPriority(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8tsPri)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch (u8tsPri)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enTsPriority = HI_UNF_TUNER_TS_PRIORITY_HP;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enTsPriority = HI_UNF_TUNER_TS_PRIORITY_LP;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enTsPriority = HI_UNF_TUNER_TS_PRIORITY_NONE;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2GuardIntv(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Grd)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Grd)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_32;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_16;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_8;
            break;
        case 3:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_4;
            break;
        case 4:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_128;
            break;
        case 5:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_19_128;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_19_256;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2FFTMode(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8FFT)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8FFT)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_1K;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_2K;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_4K;
            break;
        case 3:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_8K;
            break;
        case 4:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_16K;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enFFTMode = HI_UNF_TUNER_FE_FFT_32K;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2ModeType(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Cons)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Cons)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QPSK;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_16;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enModType = HI_UNF_MOD_TYPE_QAM_256;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2FECRate(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8CR)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8CR)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_3_5;
            break;
        case 2:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 3:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 4:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_4_5;
            break;
        case 5:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        case 6:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_1_3;
            break;
        default:
            pstInfo->unSignalInfo.stTer.enFECRate = HI_UNF_TUNER_FE_FEC_2_5;
            break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2PLPType(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8PLP_Type)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8PLP_Type)
    {
        case 0:
        pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_COM;
        break;
        case 1:
        pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT1;
        break;
        default:
        pstInfo->unSignalInfo.stTer.enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT2;
        break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2PilotPattern(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8PP)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8PP)
    {
        case 0:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP1;
        break;
        case 1:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP2;
        break;
        case 2:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP3;
        break;
        case 3:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP4;
        break;
        case 4:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP5;
        break;
        case 5:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP6;
        break;
        case 6:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP7;
        break;
        default:
        pstInfo->unSignalInfo.stTer.enPilotPattern = HI_UNF_TUNER_T2_PILOT_PATTERN_PP8;
        break;
    }

    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2StreamType(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Strem, HI_U8 u8HemNm)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    switch(u8Strem)
    {
        case 0:
            pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_GFPS;
            break;
        case 1:
            pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_GCS;
            break;
        case 2:
            if (u8HemNm)
            {
                pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_GSE_HEM;
            }
            else
            {
                pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_GSE;
            }
            break;
        case 3:
            if (u8HemNm)
            {
                pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_TS_HEM;
            }
            else
            {
                pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_TS;
            }
            break;
        default:
            pstInfo->unSignalInfo.stTer.enStreamType = HI_UNF_TUNER_TER_STREAM_TYPE_BUTT;
            break;
    }
    return HI_SUCCESS;
}

static HI_S32 GetSignalInfo_Dvbt2Issy(HI_UNF_TUNER_SIGNALINFO_S * pstInfo, HI_U8 u8Issy, HI_U8 u8IssyLong)
{
    HI_TUNER_CHECKPOINTER(pstInfo);

    if (u8Issy)
    {
        if (u8IssyLong)
        {
            pstInfo->unSignalInfo.stTer.enDVBT2ISSY = HI_UNF_TUNER_DVBT2_ISSY_LONG;
        }
        else
        {
            pstInfo->unSignalInfo.stTer.enDVBT2ISSY = HI_UNF_TUNER_DVBT2_ISSY_SHORT;
        }
    }
    else
    {
        pstInfo->unSignalInfo.stTer.enDVBT2ISSY = HI_UNF_TUNER_DVBT2_ISSY_NO;
    }
    return HI_SUCCESS;
}

static HI_S32 DVBT2_GetBerCount(HI_U32 u32TunerPort, HI_U32 *pu32TotalNum)
{
    HI_U8 u8DVBT = 0;
    HI_U32 u32M;
    HI_U32 u32N;
    HI_U8 u8Reg = 0;
    HI_U32 u32FrameNum;
    HI_U8 u8FecType;
    HI_U8 u8CodeRate;

    HI_FuncEnter();

    //frame num
    qam_read_byte(u32TunerPort, DVBT2_FEC_CTRL_T2_S2_2, &u8Reg);
    u32FrameNum = (u8Reg & 0x70) >> 4;   //default = 3

    qam_read_byte(u32TunerPort, DVBT2_CHN_FFT_GI, &u8DVBT);
    if(u8DVBT & 0x80)
    {
        /*BER = error_cnt/(8*204*frams)*/
        HI_U32 au32M[8] = {16, 64, 256, 1024, 4096, 16384, 65536, 262144};
        u32N = 204 * 8;
        u32M = au32M[u32FrameNum];
    }
    else
    {
        /*BER = error_cnt/(N*frams)*/
        //FEC type and code rate
        qam_read_byte(u32TunerPort, DVBT2_PLP_PARAM_DPLP, &u8Reg);
        u8CodeRate = (u8Reg >> 5) & 0x07;
        u8FecType = u8Reg & 0x01; /*0?¡§oo16K LDPC,1?¡§oo64KLDPC*/

        if (u8FecType == 1)
        {
            HI_U32 au32N[8] = {32400, 38880, 43200, 48600, 51840, 54000, 5400, 6480};
            HI_U32 au32M[8] = {32, 64, 128, 256, 512, 1024, 2048, 4096};
            u32N = au32N[u8CodeRate];
            u32M = au32M[u32FrameNum];
        }
        else
        {
            HI_U32 au32N[8] = {7200, 9720, 10800, 11800, 12600, 13320, 5400, 6480};
            HI_U32 au32M[8] = {128, 256, 512, 1024, 2048, 4096, 8192, 16384};
            u32N = au32N[u8CodeRate];
            u32M = au32M[u32FrameNum];
        }
    }

    *pu32TotalNum = u32N * u32M;

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 u8RegVal = 0x0;
    HI_U8 u8RegVal1 = 0,u8RegVal2 = 0,u8RegVal3 = 0,u8RegVal4 = 0;
    HI_U8 u8DVBT,u8Grd,u8FFT,u8Cons,u8CR,u8Hier,u8CrL,u8BW,u8FEC,u8Rotation,u8tsPri;
    HI_U8 u8PLP_Type,u8PP,u8BaseLite,u8Issy,u8IssyLong,u8Strem,u8HemNm;
    HI_U16 u16CellID, u16NetworkID, u16SystemID;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        HI_FuncExit();
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    qam_read_byte(u32TunerPort, DVBT2_CHN_FFT_GI, &u8RegVal);
    u8DVBT = u8RegVal & 0x80;

    if(u8DVBT)//dvbt
    {
        pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T;

        qam_read_byte(u32TunerPort, DVBT2_TPS_DVBT, &u8RegVal1);  //{mod,hier,indepth,cod}
        qam_read_byte(u32TunerPort, DVBT2_CHN_FFT_GI, &u8RegVal2);  //{dvbt,spec,fft_size,gi_mode}
        qam_read_byte(u32TunerPort, DVBT2_COD_LOW, &u8RegVal3);
        qam_read_byte(u32TunerPort, DVBT2_AUTO_DLY, &u8RegVal4);
        u8Grd = (u8RegVal2 & 0x3);
        u8Cons = (u8RegVal1 & 0xc0) >> 6;
        u8FFT = (u8RegVal2 & 0x38) >> 3;
        u8CR = (u8RegVal1 &0x7);
        u8Hier = (u8RegVal1 & 0x30) >> 4;
        u8CrL = (u8RegVal3 & 0x7);
        u8tsPri = (u8RegVal4 & 0x2) >> 1;
        qam_read_byte(u32TunerPort, DVBT2_CELL_ID_H, &u8RegVal1);
        qam_read_byte(u32TunerPort, DVBT2_CELL_ID_L, &u8RegVal2);
        u16CellID = (u8RegVal1 << 8) + u8RegVal2;

        if(u8tsPri == 1)  //High Prior = 0; Low Prior = 1
        {
            qam_read_byte(u32TunerPort, DVBT2_COD_LOW, &u8RegVal1);
            u8CR = (u8RegVal1 &0x7);
        }

        GetSignalInfo_DvbtGuardIntv(pstInfo, u8Grd);
        GetSignalInfo_DvbtModType(pstInfo, u8Cons);
        GetSignalInfo_DvbtFFTMode(pstInfo, u8FFT);
        GetSignalInfo_DvbtFECRate(pstInfo, u8CR);
        GetSignalInfo_DvbtHierMod(pstInfo, u8Hier);
        GetSignalInfo_DvbtLowPriFECRate(pstInfo, u8CrL);
        GetSignalInfo_DvbtTsPriority(pstInfo, u8tsPri);
        pstInfo->unSignalInfo.stTer.u16CellID = u16CellID;

    }
    else//dvbt2
    {
        pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_DVB_T2;

        qam_read_byte(u32TunerPort, DVBT2_TPS, &u8RegVal1);  //{mod,hier,indepth,cod}
        qam_read_byte(u32TunerPort, DVBT2_CHN_FFT_GI, &u8RegVal2);  //{dvbt,spec,fft_size,gi_mode}
        qam_read_byte(u32TunerPort, DVBT2_PLP_PARAM_DPLP, &u8RegVal3);
        u8Grd = (u8RegVal1 & 0x1c) >> 2;
        u8BW = (u8RegVal1 & 0x20) >>5;
        u8FFT = (u8RegVal2 & 0x38) >> 3;
        u8CR = (u8RegVal3 &0xe0) >> 5;
        u8FEC = (u8RegVal3 & 0x1);
        u8Rotation = (u8RegVal3 &0x2) >>1;
        u8Cons = (u8RegVal3 & 0x1c) >> 2;
        qam_read_byte(u32TunerPort, DVBT2_PLP_TYPE_DPLP, &u8RegVal1);
        u8PLP_Type = (u8RegVal1 & 0xe0) >> 5;
        qam_read_byte(u32TunerPort, DVBT2_PP_VERSION, &u8RegVal1);
        u8PP = (u8RegVal1 & 0xf0) >> 4;
        qam_read_byte(u32TunerPort, DVBT2_CELL_ID_H, &u8RegVal1);
        qam_read_byte(u32TunerPort, DVBT2_CELL_ID_L, &u8RegVal2);
        u16CellID = (u8RegVal1 << 8) + u8RegVal2;
        qam_read_byte(u32TunerPort, DVBT2_NETWORK_ID_H, &u8RegVal1);
        qam_read_byte(u32TunerPort, DVBT2_NETWORK_ID_L, &u8RegVal2);
        u16NetworkID = (u8RegVal1 << 8) + u8RegVal2;
        qam_read_byte(u32TunerPort, DVBT2_SYSTEM_ID_H, &u8RegVal1);
        qam_read_byte(u32TunerPort, DVBT2_SYSTEM_ID_L, &u8RegVal2);
        u16SystemID = (u8RegVal1 << 8) + u8RegVal2;
        qam_read_byte(u32TunerPort, DVBT2_TPS, &u8RegVal1);
        u8BaseLite = (u8RegVal1 & 0x2) >> 1;
        qam_read_byte(u32TunerPort, DVBT2_OUTP_AD_RO, &u8RegVal1);
        u8HemNm = u8RegVal1 & 0x01;
        u8Strem = (u8RegVal1 & 0x06) >> 1;
        u8IssyLong = (u8RegVal1 & 0x20) >> 5;
        u8Issy = (u8RegVal1 & 0x40) >> 6;

        GetSignalInfo_Dvbt2GuardIntv(pstInfo, u8Grd);
        GetSignalInfo_Dvbt2FFTMode(pstInfo, u8FFT);
        GetSignalInfo_Dvbt2ModeType(pstInfo, u8Cons);
        GetSignalInfo_Dvbt2FECRate(pstInfo, u8CR);
        GetSignalInfo_Dvbt2PLPType(pstInfo, u8PLP_Type);
        GetSignalInfo_Dvbt2PilotPattern(pstInfo, u8PP);
        GetSignalInfo_Dvbt2StreamType(pstInfo, u8Strem, u8HemNm);
        GetSignalInfo_Dvbt2Issy(pstInfo, u8Issy, u8IssyLong);
        pstInfo->unSignalInfo.stTer.u16CellID = u16CellID;
        pstInfo->unSignalInfo.stTer.u16NetworkID= u16NetworkID;
        pstInfo->unSignalInfo.stTer.u16SystemID= u16SystemID;

        if(u8BW)
        {
            pstInfo->unSignalInfo.stTer.enCarrierMode = HI_UNF_TUNER_TER_EXTEND_CARRIER;
        }
        else
        {
            pstInfo->unSignalInfo.stTer.enCarrierMode = HI_UNF_TUNER_TER_NORMAL_CARRIER;
        }

        if(u8Rotation)
        {
            pstInfo->unSignalInfo.stTer.enConstellationMode = HI_UNF_TUNER_CONSTELLATION_ROTATION;
        }
        else
        {
            pstInfo->unSignalInfo.stTer.enConstellationMode = HI_UNF_TUNER_CONSTELLATION_STANDARD;
        }

        if(u8FEC)
        {
            pstInfo->unSignalInfo.stTer.enFECFrameMode = HI_UNF_TUNER_TER_FEC_FRAME_NORMAL;
        }
        else
        {
            pstInfo->unSignalInfo.stTer.enFECFrameMode = HI_UNF_TUNER_TER_FEC_FRAME_SHORT;
        }

        if (u8BaseLite)
        {
            pstInfo->unSignalInfo.stTer.enChannelMode = HI_UNF_TUNER_TER_MODE_LITE;
        }
        else
        {
            pstInfo->unSignalInfo.stTer.enChannelMode = HI_UNF_TUNER_TER_MODE_BASE;
        }

    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32ErrSum = 0, u32TotalNum = 0;
    HI_U8 u8BerL = 0, u8BerH = 0;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        pu32BER[0] = 0;
        pu32BER[1] = 0;
        pu32BER[2] = 0;
        HI_FuncExit();
        return HI_SUCCESS;
    }

    qam_read_byte(u32TunerPort, DVBT2_FEC_BER_L, &u8BerL);
    qam_read_byte(u32TunerPort, DVBT2_FEC_BER_H, &u8BerH);
    u32ErrSum = (u8BerH << 8) | (u8BerL << 0);

    //tatol count number
    DVBT2_GetBerCount(u32TunerPort, &u32TotalNum);

    pu32BER[0] = tuner_get_div(u32ErrSum, u32TotalNum, 9);
    pu32BER[1] = 0;
    pu32BER[2] = 9;

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetSnr(HI_U32 u32TunerPort, HI_U32* pu32SNR)
{
    HI_U8 u8Snr[2] = {0}, au8RegVal[2] = {0};
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, qam_read_bit(u32TunerPort, DVBT2_LOCK_FLAG, 3, &au8RegVal[0]));  //DVB-T2 tps
    HI_TUNER_CHECK_FUNC_RET(s32Ret, qam_read_bit(u32TunerPort, DVBT2_LOCK_FLAG, 4, &au8RegVal[1]));  //DVB-T tps
    if ((HI_FALSE != au8RegVal[0])&&(HI_FALSE != au8RegVal[1]))
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        *pu32SNR = 0;
        HI_FuncExit();
        return HI_SUCCESS;
    }

    qam_read_byte(u32TunerPort, DVBT2_SNR_L, &u8Snr[0]);
    qam_read_byte(u32TunerPort, DVBT2_SNR_H, &u8Snr[1]);
    *pu32SNR = u8Snr[1] * 256 + u8Snr[0];

    HI_DBG_PrintU32(*pu32SNR);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_U32 u32AgcCtrl,u32AgcPow;
    HI_U8  u8RegVal[2] = {0, 0}, u8RegBit;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    qam_read_bit(u32TunerPort, DVBT2_LOCK_FLAG, 0, &u8RegBit);
    if(!u8RegBit)
    {
        HI_WARN_PrintReg8(DVBT2_LOCK_FLAG, u8RegBit);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    qam_read_byte(u32TunerPort, DVBT2_AGC_CTRL_L,&u8RegVal[0]);
    qam_read_byte(u32TunerPort, DVBT2_AGC_CTRL_H,&u8RegVal[1]);

    u32AgcCtrl = (u8RegVal[0] & 0x0F) + u8RegVal[1] * 16;

    if(u32AgcCtrl >= 3200)
    {
        u32AgcPow = 0;
    }
    else if(u32AgcCtrl <= 640)
    {
        u32AgcPow = 99;
    }
    else
    {
        u32AgcPow = 124 - u32AgcCtrl*80/2048;
    }

    pu32SignalStrength[1] = u32AgcPow;

    HI_DBG_PrintU32(pu32SignalStrength[1]);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb )
{
    HI_S16  s16Err  = 0, s16Fs   = 0;
    HI_S8 s8Status[2] = {0, 0};
    HI_U8 u8BW    = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Symb);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_DVBT2_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    qam_read_byte(u32TunerPort, DVBT2_BAND_WIDTH, &u8BW);
    u8BW = (u8BW >> 4);

    /* freq_offset=(CAR_OFFSET_H*256+CAR_OFFSET_L)/2^8*fs */
    qam_read_byte(u32TunerPort, DVBT2_CAR_OFFSET_L, &s8Status[0]);
    qam_read_byte(u32TunerPort, DVBT2_CAR_OFFSET_H, &s8Status[1]);
    s16Err = (HI_S16)((HI_U16)(s8Status[1] * 256) + (HI_U8)s8Status[0]);

    switch(u8BW)
    {
        case 0:     s16Fs = 1845;       break;
        case 1:     s16Fs = 5714;       break;
        case 2:     s16Fs = 6857;       break;
        case 3:     s16Fs = 8000;       break;
        case 4:     s16Fs = 9143;       break;
        default:    s16Fs = 9143;       break;
    }

    *pu32Freq = ((s16Err * s16Fs) >> 8)/1000;   /*Unit: kHz*/

    /* fs_offset =(tim_offset*4 - (tim_loop_h*256+tim_loop_l)/16)/2^10*fs, Unit: Hz */
    qam_read_byte(u32TunerPort, DVBT2_TIM_LOOP_L, &s8Status[0]);
    qam_read_byte(u32TunerPort, DVBT2_TIM_LOOP_H, &s8Status[1]);   /* used the low 6 bits */
    s16Err = (HI_S16)((HI_U16)((s8Status[1]&0x3f) * 256) + (HI_U8)s8Status[0] - (HI_U16)(1 << (6+8)));
    qam_read_byte(u32TunerPort, DVBT2_TIM_OFFSET, &s8Status[0]);

    *pu32Symb = (((HI_S16)(s8Status[0] * 4) -(s16Err>>4))*s16Fs)>> 10;

    HI_DBG_PrintU32(*pu32Freq);
    HI_DBG_PrintU32(*pu32Symb);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_SetPLPPara(HI_U32 u32TunerPort, HI_UNF_TUNER_TER_PLP_PARA_S *pstPLPPara)
{
    HI_U8 u8PLPIndex = 0, u8CommPLPIndex = 0, u8PLPNum = 0;
    HI_U8 u8RegVal = 0, u8Finded = 0,  i;
    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPLPPara);
    HI_DBG_PrintU32(pstPLPPara->u8PlpId);
    HI_DBG_PrintU32(pstPLPPara->u8CommPlpId);
    HI_DBG_PrintU32(pstPLPPara->u8Combination);

    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 1);

    qam_read_byte(u32TunerPort, DVBT2_NUM_PLP, &u8PLPNum);
    for (i = 0, u8Finded = 0; i < u8PLPNum && u8Finded < 2; i++)
    {
        qam_write_byte(u32TunerPort, DVBT2_PLP_ID0, i);
        qam_read_byte(u32TunerPort, DVBT2_PLP_ID_DPLP, &u8RegVal);
        if (u8RegVal == pstPLPPara->u8PlpId)
        {
            u8Finded++;
            u8PLPIndex = i;
        }
        if (u8RegVal == pstPLPPara->u8CommPlpId)
        {
            u8Finded++;
            u8CommPLPIndex = i;
        }
    }

    HI_DBG_PrintU32(u8PLPIndex);
    HI_DBG_PrintU32(u8CommPLPIndex);

    qam_write_byte(u32TunerPort, DVBT2_PLP_ID0, u8PLPIndex);
    qam_write_byte(u32TunerPort, DVBT2_PLP_ID1, u8CommPLPIndex);
    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 1, (pstPLPPara->u8Combination?HI_TRUE:HI_FALSE));

    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 0);
    DVBT2_HotReset(u32TunerPort);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetPLPInfo(HI_U32 u32TunerPort, HI_U32 u32Index, HI_UNF_TUNER_TER_PLP_INFO_S *pstPLPInfo)
{
    HI_U8 u8RegVal = 0;
    HI_U8 u8PlpType = 0;
    HI_U8 u8PlpId = 0;
    HI_U8 u8PlpGrpId = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPLPInfo);
    HI_DBG_PrintU32(u32Index);

    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 1);

    qam_write_byte(u32TunerPort, DVBT2_PLP_ID0, u32Index);

    qam_read_byte(u32TunerPort, DVBT2_PLP_TYPE_DPLP, &u8RegVal);
    u8PlpType = (u8RegVal & 0xe0) >> 5;
    qam_read_byte(u32TunerPort, DVBT2_PLP_ID_DPLP, &u8PlpId);
    qam_read_byte(u32TunerPort, DVBT2_PLP_GRP_ID_DPLP, &u8PlpGrpId);

    pstPLPInfo->u8PlpId = u8PlpId;
    pstPLPInfo->u8PlpGrpId = u8PlpGrpId;
    if(u8PlpType == 0)
    {
        pstPLPInfo->enPlpType = HI_UNF_TUNER_T2_PLP_TYPE_COM;
    }
    else if(u8PlpType == 1)
    {
        pstPLPInfo->enPlpType = HI_UNF_TUNER_T2_PLP_TYPE_DAT1;
    }
    else
    {
        pstPLPInfo->enPlpType = HI_UNF_TUNER_T2_PLP_TYPE_DAT2;
    }

    HI_DBG_PrintU32(pstPLPInfo->u8PlpId);
    HI_DBG_PrintU32(pstPLPInfo->u8PlpGrpId);
    HI_DBG_PrintU32(pstPLPInfo->enPlpType);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_GetPlpNum(HI_U32 u32TunerPort, HI_U8 *pu8PLPNum)
{
    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8PLPNum);

    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 1);

    qam_read_byte(u32TunerPort, DVBT2_NUM_PLP, pu8PLPNum);

    HI_DBG_PrintU32(*pu8PLPNum);

    HI_FuncExit();
    return HI_SUCCESS;
}

#if 0
HI_S32 HiSDTV100_DVBT2_GetPlpDump(DRV_FE_CTRL_PLPDUMP_S *pstPlpDump)
{
    HI_U8 u8RegVal = 0;
    HI_U8 u8CR = 0, u8FEC = 0, u8Rotation = 0, u8Cons = 0, u8PlpType = 0;

    HI_INFO_TUNER("HiSDTV100_DVBT2_GetPlpDump.\n");

    HI_TUNER_CHECKPOINTER(pstPlpDump);

    /* open the plp read mode*/
    qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 1);

    HiDTV200_I2C_WriteByte(DVBT2_PLP_ID0, pstPlpDump->u8PlpNum);

    qam_read_byte(u32TunerPort,DVBT2_PLP_ID_DPLP, &pstPlpDump->u8PlpId);
    qam_read_byte(u32TunerPort,DVBT2_PLP_GRP_ID_DPLP, &pstPlpDump->u8PlpGrp);
    qam_read_byte(u32TunerPort,DVBT2_PLP_TYPE_DPLP, &u8RegVal);
    u8PlpType = (u8RegVal & (7<<5))>>5;
    switch(u8PlpType)
    {
        case 0:
            pstPlpDump->enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_COM;
            break;
        case 1:
            pstPlpDump->enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT1;
            break;
        case 2:
            pstPlpDump->enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_DAT2;
            break;
        default:
            pstPlpDump->enPLPType = HI_UNF_TUNER_T2_PLP_TYPE_BUTT;
            break;
    }

    qam_read_byte(u32TunerPort,DVBT2_FRM_INTVL_DPLP, &pstPlpDump->u8FrmInternal);
    qam_read_byte(u32TunerPort,DVBT2_TIM_IL_LEN_DPLP, &pstPlpDump->u8TimIlLength);
    qam_read_byte(u32TunerPort,DVBT2_PLP_BLK_MAX_DPLP, &pstPlpDump->u8FecBlkMax);
    qam_read_byte(u32TunerPort,DVBT2_FIRST_FRMIDX_DPLP, &pstPlpDump->u8FirstFrmIdx);
    qam_read_byte(u32TunerPort,DVBT2_PLP_PARAM_DPLP, &u8RegVal);
    u8CR = (u8RegVal & (7<<5)) >> 5;
    u8FEC = (u8RegVal & (1<<0));
    u8Rotation = (u8RegVal & (1<<1)) >>1;
    u8Cons = (u8RegVal & (3<<2)) >> 2;
    if(u8Rotation)
    {
        pstPlpDump->enConstellationMode = HI_UNF_TUNER_CONSTELLATION_ROTATION;
    }
    else
    {
        pstPlpDump->enConstellationMode = HI_UNF_TUNER_CONSTELLATION_STANDARD;
    }

    if(u8FEC)
    {
        pstPlpDump->enFECFrameMode = HI_UNF_TUNER_TER_FEC_FRAME_NORMAL;
    }
    else
    {
        pstPlpDump->enFECFrameMode = HI_UNF_TUNER_TER_FEC_FRAME_SHORT;
    }

    switch(u8Cons)
    {
        case 0:
            pstPlpDump->enModType = HI_UNF_MOD_TYPE_QPSK;
            break;
        case 1:
            pstPlpDump->enModType = HI_UNF_MOD_TYPE_QAM_16;
            break;
        case 2:
            pstPlpDump->enModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
        case 3:
            pstPlpDump->enModType = HI_UNF_MOD_TYPE_QAM_256;
            break;
        default:
            pstPlpDump->enModType = HI_UNF_MOD_TYPE_BUTT;
            break;
    }

    switch(u8CR)
    {
        case 0:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_3_5;
            break;
        case 2:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 3:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 4:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_4_5;
            break;
        case 5:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        case 6:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_1_3;
            break;
        case 7:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FEC_2_5;
            break;
        default:
            pstPlpDump->enFECRate = HI_UNF_TUNER_FE_FECRATE_BUTT;
            break;
    }

    return HI_SUCCESS;
}
#endif

HI_S32 HiSDTV100_DVBT2_GetCIR(HI_U32 u32TunerPort, HI_U32 u32DataLen)
{
#ifdef HI_PROC_SUPPORT
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8  u8RegVal = 0;
    HI_U32 u32WaitCnt = 1000;
    HI_U32 i = 0, j = 0;
    HI_U8 acRawData[3] = {0};
    HI_U8 au8Val[4] = {0};
    struct file *pstFile = NULL;
    HI_CHAR acFilePath[DVBT2_FILE_NAME_LEN] = {0};
    HI_CHAR acFilePathAndName[DVBT2_FILE_NAME_LEN] = {0};
    struct tm stNow;
    HI_S32 s32WriteLen = 0, s32WriteTotalLen = 0;
    HI_U8 u8WriteBuf[64] = {0};

    HI_FuncEnter();

    HI_DRV_PROC_EchoHelper("Get CIR,now...Waiting...\n");

    qam_read_byte(u32TunerPort, DVBT2_AXI_CHN_ORDER, &u8RegVal);
    u8RegVal = (u8RegVal & 0xf8) | 3;
    qam_write_byte(u32TunerPort, DVBT2_AXI_CHN_ORDER, u8RegVal);

    qam_write_byte(u32TunerPort, DVBT2_VEC_SEL, 0x78);

    /* 3.1 open catch reset */
    qam_read_byte(u32TunerPort, DVBT2_AXI_RSTN, &u8RegVal);
    u8RegVal |= (1<<0);
    qam_write_byte(u32TunerPort, DVBT2_AXI_RSTN, u8RegVal);

    /* 3.2 select the DVBT2 clock */
    qam_read_byte(u32TunerPort, DVBT2_AXI_CHN_ORDER, &u8RegVal);
    u8RegVal &= ~(7<<0);
    u8RegVal |= (3<<0);
    qam_write_byte(u32TunerPort, DVBT2_AXI_CHN_ORDER, u8RegVal);

    /* 3.3 config catch_ena */
    qam_write_byte(u32TunerPort, DVBT2_CIR_CTRL, 0);

    /* 4.config mode & catch_ena */
    qam_write_byte(u32TunerPort, DVBT2_CIR_CTRL, 0x04);

    tuner_mdelay(1);

    /* 6.wait for catch end */
    qam_read_byte(u32TunerPort, DVBT2_CIR_CTRL, &u8RegVal);
    while(((u8RegVal & 0x02) == 0x00) && (u32WaitCnt > 0))
    {
        tuner_mdelay(1);
        qam_read_byte(u32TunerPort, DVBT2_CIR_CTRL, &u8RegVal);
        u32WaitCnt --;
    }

    if (!u32WaitCnt)
    {
        LOG_PrintWarning("wait for catch end timeout!\n");
        HI_ERR_PrintErrCode(HI_ERR_TUNER_CATCH_TIMEOUT);
        return HI_ERR_TUNER_CATCH_TIMEOUT;
    }

    /* 7.deal with file path */
    s32Ret = HI_DRV_FILE_GetStorePath(acFilePath, 128);
    if (HI_SUCCESS != s32Ret)
    {
        LOG_PrintError("Get path failed.\n");
        goto exit;
    }
    HI_DBG_PrintStr(acFilePath);

    /* 8.deal with file name */
    time_to_tm(get_seconds(), 0, &stNow);
    s32Ret = snprintf(acFilePathAndName, sizeof(acFilePathAndName),"%s/%s_%04u-%02u-%02u_%02u-%02u-%02u.%s",
                acFilePath,
                DVBT2_CIR_FILE_NAME,
                (HI_U32)(stNow.tm_year+1900),
                stNow.tm_mon+1,
                stNow.tm_mday,
                stNow.tm_hour,
                stNow.tm_min,
                stNow.tm_sec,
                DVBT2_FILE_POSTFIX);
    if (HI_SUCCESS > s32Ret)
    {
        acFilePathAndName[sizeof(acFilePathAndName) -1] = '\0';
        HI_ERR_PrintStr(acFilePathAndName);
        goto exit;
    }

    /* 9.open file */
    pstFile = HI_DRV_FILE_Open(acFilePathAndName, O_RDWR|O_CREAT|O_TRUNC);
    if (pstFile == NULL)
    {
        LOG_PrintError("HI_DRV_FILE_Open failure!\n");
        goto exit;
    }

    /* 10.write the name of col to file */
    memset(u8WriteBuf,0,sizeof(u8WriteBuf));
    snprintf(u8WriteBuf,sizeof(u8WriteBuf),"%6s,%6s\n", "Index", "Data");
    s32WriteLen = HI_DRV_FILE_Write(pstFile, (HI_U8 *)u8WriteBuf, strlen(u8WriteBuf));
    if (strlen(u8WriteBuf) != s32WriteLen)
    {
        HI_DRV_FILE_Close(pstFile);
        LOG_PrintError("Only write CIR data(writed=%dB, total=%dB) to [%s].\n", s32WriteLen, strlen(u8WriteBuf), acFilePathAndName);
        goto close_file;
    }
    s32WriteTotalLen = s32WriteLen;

    /* 11.read smp from data */
    for (i=0; i<DVBT2_SAMPLE_DATA_CNT; i++)
    {
        for (j=0; j<3; j++)
        {
            qam_read_byte(u32TunerPort, DVBT2_CIR_DATA, &(acRawData[j]));
        }

        au8Val[0] = ((acRawData[2] >>2)&0x3F);
        au8Val[1] = (acRawData[2] & 0x3) * 16 + (acRawData[1]&0xF0)/16;
        au8Val[2] = (acRawData[1] & 0x0F) * 4 + (acRawData[0]&0xC0)/64;
        au8Val[3] = (acRawData[0] & 0x3F);

        memset(u8WriteBuf,0,sizeof(u8WriteBuf));
        snprintf(u8WriteBuf,sizeof(u8WriteBuf),"%d,%d\n%d,%d\n%d,%d\n%d,%d\n", i*4, au8Val[0], i*4+1, au8Val[1], i*4+2, au8Val[2], i*4+3, au8Val[3]);
        HI_DRV_PROC_EchoHelper("%s", u8WriteBuf);
        s32WriteLen = HI_DRV_FILE_Write(pstFile, (HI_U8 *)u8WriteBuf, strlen(u8WriteBuf));
        if (strlen(u8WriteBuf) != s32WriteLen)
        {
            HI_DRV_FILE_Close(pstFile);
            LOG_PrintError("Only write CIR data(writed=%dB, total=%dB) to [%s].\n", s32WriteLen, strlen(u8WriteBuf), acFilePathAndName);
            goto close_file;
        }
        s32WriteTotalLen += s32WriteLen;
    }

close_file:

    /* 12. close file */
    HI_DRV_FILE_Close(pstFile);
    HI_DRV_PROC_EchoHelper("Write %dB to %s successfully.\n", s32WriteTotalLen, acFilePathAndName);

exit:

    /* 13. close catch reset */
    qam_read_byte(u32TunerPort, DVBT2_AXI_RSTN, &u8RegVal);
    u8RegVal &= ~(1<<0);
    qam_write_byte(u32TunerPort, DVBT2_AXI_RSTN, u8RegVal);
    HI_FuncExit();
#endif
    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

