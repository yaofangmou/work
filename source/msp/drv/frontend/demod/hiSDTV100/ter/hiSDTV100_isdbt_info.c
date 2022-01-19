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
#include "hiSDTV100_isdbt_info.h"
#include "hiSDTV100_isdbt_core.h"
#include "hi_drv_file.h"
#include "drv_demod.h"
#include "drv_common.h"
#include "hi_drv_proc.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_ISDBT_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus)
{
    HI_U8 u8RegVal = 0x0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    /* 0x2d bit4~bit1 */
    qam_read_byte(u32TunerPort, ISDBT_TUNER_SEL, &u8RegVal);
    u8RegVal &= (0xf<<1);
    if((0x7<<1) == u8RegVal)
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

static HI_S32 ISDBT_getLayerInfo(HI_U16 u16LayerReg, HI_UNF_TUNER_ISDBT_LAYERS_INFO_S *pstIsdbtLayersInfoBits)
{
    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstIsdbtLayersInfoBits);

    pstIsdbtLayersInfoBits->u8LayerSegNum = u16LayerReg & 0xf;
    if (0xf == pstIsdbtLayersInfoBits->u8LayerSegNum)
    {
        pstIsdbtLayersInfoBits->u8LayerSegNum = 0;
    }

    HI_DBG_PrintU32(u16LayerReg);
    switch ((u16LayerReg & (0x7 << 10)) >> 10)
    {
        case 0:
            pstIsdbtLayersInfoBits->enLayerModType = HI_UNF_MOD_TYPE_DQPSK;
            break;
        case 1:
            pstIsdbtLayersInfoBits->enLayerModType = HI_UNF_MOD_TYPE_QPSK;
            break;
        case 2:
            pstIsdbtLayersInfoBits->enLayerModType = HI_UNF_MOD_TYPE_QAM_16;
            break;
        case 3:
            pstIsdbtLayersInfoBits->enLayerModType = HI_UNF_MOD_TYPE_QAM_64;
            break;
        default:
            pstIsdbtLayersInfoBits->enLayerModType = HI_UNF_MOD_TYPE_DEFAULT;
            break;
    }

    switch((u16LayerReg & (0x7 << 7)) >> 7)
    {
        case 0:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_1_2;
            break;
        case 1:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_2_3;
            break;
        case 2:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_3_4;
            break;
        case 3:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_5_6;
            break;
        case 4:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_7_8;
            break;
        default:
            pstIsdbtLayersInfoBits->enLayerFECRate = HI_UNF_TUNER_FE_FEC_AUTO;
            break;
    }

    switch((u16LayerReg & (0x7 << 4)) >> 4)
    {
        case 0:
            pstIsdbtLayersInfoBits->enLayerHierMod = HI_UNF_TUNER_FE_HIERARCHY_NO;
            break;
        case 1:
            pstIsdbtLayersInfoBits->enLayerHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA1;
            break;
        case 2:
            pstIsdbtLayersInfoBits->enLayerHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA2;
            break;
        case 3:
            pstIsdbtLayersInfoBits->enLayerHierMod = HI_UNF_TUNER_FE_HIERARCHY_ALHPA4;
            break;
      default:
            pstIsdbtLayersInfoBits->enLayerHierMod = HI_UNF_TUNER_FE_HIERARCHY_NO;
            break;
    }

    HI_DBG_PrintU32(pstIsdbtLayersInfoBits->u8LayerSegNum);
    HI_DBG_PrintU32(pstIsdbtLayersInfoBits->enLayerModType);
    HI_DBG_PrintU32(pstIsdbtLayersInfoBits->enLayerFECRate);
    HI_DBG_PrintU32(pstIsdbtLayersInfoBits->enLayerHierMod);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_U8 hier_a_l = 0,hier_a_h = 0,hier_b_l = 0,hier_b_h = 0,hier_c_l = 0,hier_c_h = 0;
    HI_U16 hier_a = 0,hier_b = 0,hier_c = 0;
    HI_UNF_TUNER_TMCC_INFO_S stTMCCInfo;
    HI_U8 u8RegVal = 0, u8GuardIntv = 0, u8FFT = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    memset(&stTMCCInfo,0,sizeof(HI_UNF_TUNER_TMCC_INFO_S));

    qam_read_byte(u32TunerPort, ISDBT_TMCC_1, &u8RegVal);
    stTMCCInfo.u8EmergencyFlag = (u8RegVal & 0x80) >> 7;
    stTMCCInfo.u8PhaseShiftCorr= u8RegVal & 0x07;
    qam_read_byte(u32TunerPort, ISDBT_CHN_FFT_GI, &u8RegVal);
    u8GuardIntv = u8RegVal & 0x07;
    u8FFT = (u8RegVal & 0x38) >> 3;

    qam_read_byte(u32TunerPort, ISDBT_TMCC_2, &hier_a_l);
    qam_read_byte(u32TunerPort, ISDBT_TMCC_3, &hier_a_h);
    stTMCCInfo.u8PartialFlag = (hier_a_h & 0x80) >> 7;
    hier_a_h &= (0x1f);
    hier_a = (hier_a_h << 8) + hier_a_l;

    qam_read_byte(u32TunerPort, ISDBT_TMCC_4, &hier_b_l);
    qam_read_byte(u32TunerPort, ISDBT_TMCC_5, &hier_b_h);
    hier_b_h &= (0x1f);
    hier_b = (hier_b_h << 8) + hier_b_l;

    qam_read_byte(u32TunerPort, ISDBT_TMCC_6, &hier_c_l);
    qam_read_byte(u32TunerPort, ISDBT_TMCC_7, &hier_c_h);
    hier_c_h &= (0x1f);
    hier_c = (hier_c_h << 8) + hier_c_l;

    pstInfo->enSigType = HI_UNF_TUNER_SIG_TYPE_ISDB_T;

    if(0x0f == (hier_a_l & 0x0f))
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerAExist = 0;
    }
    else
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerAExist = 1;
    }

    if(0x0f == (hier_b_l & 0x0f))
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerBExist = 0;
    }
    else
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerBExist = 1;
    }
    if(0x0f == (hier_c_l & 0x0f))
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerCExist = 0;
    }
    else
    {
        pstInfo->unSignalInfo.stIsdbT.unISDBTLayers.bits.u8LayerCExist = 1;
    }

    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_getLayerInfo(hier_a, &(stTMCCInfo.stIsdbtLayersAInfoBits)));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_getLayerInfo(hier_b, &(stTMCCInfo.stIsdbtLayersBInfoBits)));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_getLayerInfo(hier_c, &(stTMCCInfo.stIsdbtLayersCInfoBits)));

    HI_DBG_PrintU32(stTMCCInfo.u8EmergencyFlag);
    HI_DBG_PrintU32(stTMCCInfo.u8PhaseShiftCorr);
    HI_DBG_PrintU32(stTMCCInfo.u8PartialFlag);

    memcpy(&(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo),&stTMCCInfo,sizeof(HI_UNF_TUNER_TMCC_INFO_S));

    switch (u8GuardIntv)
    {
        case 0:
            pstInfo->unSignalInfo.stIsdbT.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_32;
            break;
        case 1:
            pstInfo->unSignalInfo.stIsdbT.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_16;
            break;
        case 2:
            pstInfo->unSignalInfo.stIsdbT.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_8;
            break;
        case 3:
            pstInfo->unSignalInfo.stIsdbT.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_1_4;
            break;
        default:
            pstInfo->unSignalInfo.stIsdbT.enGuardIntv = HI_UNF_TUNER_FE_GUARD_INTV_BUTT;
            break;
    }
    switch (u8FFT)
    {
        case 0:
            pstInfo->unSignalInfo.stIsdbT.enFFTMode = HI_UNF_TUNER_FE_FFT_1K;
            break;
        case 1:
            pstInfo->unSignalInfo.stIsdbT.enFFTMode = HI_UNF_TUNER_FE_FFT_2K;
            break;
        case 2:
            pstInfo->unSignalInfo.stIsdbT.enFFTMode = HI_UNF_TUNER_FE_FFT_4K;
            break;
        case 3:
            pstInfo->unSignalInfo.stIsdbT.enFFTMode = HI_UNF_TUNER_FE_FFT_8K;
            break;
        default:
            pstInfo->unSignalInfo.stIsdbT.enFFTMode = HI_UNF_TUNER_FE_FFT_BUTT;
            break;
    }

    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersAInfoBits.enLayerModType);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersAInfoBits.enLayerFECRate);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersAInfoBits.enLayerHierMod);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersBInfoBits.enLayerModType);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersBInfoBits.enLayerFECRate);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersBInfoBits.enLayerHierMod);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersCInfoBits.enLayerModType);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersCInfoBits.enLayerFECRate);
    HI_DBG_PrintU32(pstInfo->unSignalInfo.stIsdbT.stISDBTTMCCInfo.stIsdbtLayersCInfoBits.enLayerHierMod);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8  u8RegValL = 0, u8RegValH = 0;
    HI_U32 u32FrameNum = 0;
    HI_U16 u16ErrorCnt = 0;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    HI_U32 au32M[8] = {16, 64, 256, 1024, 4096, 16384, 65536, 262144};

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        pu32BER[0] = 0;
        pu32BER[1] = 0;
        pu32BER[2] = 0;
        HI_FuncExit();
        return HI_SUCCESS;
    }

    qam_read_byte(u32TunerPort, ISDBT_FEC_BER_L, &u8RegValL);
    qam_read_byte(u32TunerPort, ISDBT_FEC_BER_H, &u8RegValH);
    u16ErrorCnt = (u8RegValH << 8) + u8RegValL;
    qam_read_byte(u32TunerPort, ISDBT_BER_CTRL, &u8RegValL);      /* the total number of frames */
    u32FrameNum = (u8RegValL & 0x70) >> 4;

    pu32BER[0] = tuner_get_div(u16ErrorCnt, au32M[u32FrameNum]*8*204, 9);
    pu32BER[1] = 0;
    pu32BER[2] = 9;

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR)
{
    HI_U8  au8RegVal[2] = { 0 }, u8RegBit = 0;
    HI_U32 u32Snr = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    qam_read_bit(u32TunerPort, ISDBT_LOCK_FLAG, 4, &u8RegBit);
    if(!u8RegBit)
    {
        HI_WARN_PrintReg8(ISDBT_LOCK_FLAG, u8RegBit);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        *pu32SNR = 0;
        return HI_SUCCESS;
    }

    qam_read_byte(u32TunerPort, ISDBT_SNR_L, &au8RegVal[0]);
    qam_read_byte(u32TunerPort, ISDBT_SNR_H, &au8RegVal[1]);
    u32Snr =au8RegVal[1]*256 +  au8RegVal[0];

    *pu32SNR = u32Snr;

    HI_DBG_PrintU32(u32Snr);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_U32 i ;
    HI_U8  au8RegVal[2] = { 0 }, u8RegBit = 0;
    HI_U32 u32TmpSigStrength = 0;
    HI_U32 u32SumSigStrength = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    qam_read_bit(u32TunerPort, ISDBT_LOCK_FLAG, 0, &u8RegBit);
    if(!u8RegBit)
    {
        HI_WARN_PrintReg8(ISDBT_LOCK_FLAG, u8RegBit);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    pu32SignalStrength[0] = 0;
    pu32SignalStrength[2] = 0;

    for ( i = 0; i < 64; i++ )
    {
        qam_read_byte(u32TunerPort, ISDBT_AGC_CTRL_L, &au8RegVal[0]);
        qam_read_byte(u32TunerPort, ISDBT_AGC_CTRL_H, &au8RegVal[1]);
        u32TmpSigStrength = (au8RegVal[1] & 0x0f)*256 + au8RegVal[0];

        u32SumSigStrength += u32TmpSigStrength;
    }
    u32TmpSigStrength = u32SumSigStrength >> 6;
    pu32SignalStrength[1] = u32TmpSigStrength;

    HI_DBG_PrintU32(pu32SignalStrength[1] );

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32FreqKHz, HI_U32 * pu32Symb)
{
    HI_U8  u8RegVal = 0;
    HI_U8  au8RegVal[2] = { 0 };
    HI_S32 s32FreqOffset = 0;
    HI_S32 s32RealSymb = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_UNF_TUNER_LOCK_STATUS_E enTunerStatus;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Symb);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_ISDBT_GetStatus(u32TunerPort, &enTunerStatus));
    if (HI_UNF_TUNER_SIGNAL_LOCKED != enTunerStatus)
    {
        HI_ERR_PrintErrCode(HI_ERR_TUNER_NOT_CONNECT);
        return HI_ERR_TUNER_NOT_CONNECT;
    }

    /* calculate freq */
    /* freq_offset=(CAR_OFFSET_H * 256 + CAR_OFFSET_L) / 2 ^ 8 * fs, Unit : Hz*/
    qam_read_byte(u32TunerPort, ISDBT_CAR_OFFSET_L, &au8RegVal[0]);
    qam_read_byte(u32TunerPort, ISDBT_CAR_OFFSET_H, &au8RegVal[1]);
    HI_DBG_PrintReg8(ISDBT_CAR_OFFSET_L, au8RegVal[0]);
    HI_DBG_PrintReg8(ISDBT_CAR_OFFSET_H, au8RegVal[1]);
    s32FreqOffset = ((au8RegVal[1] << 8) + au8RegVal[0]);

    /* if negative number */
    if(s32FreqOffset >= 32768)
    {
        s32FreqOffset =   s32FreqOffset - 65536;
    }

    /* calculate freq and symbol rate according different fs */
    qam_read_byte(u32TunerPort, ISDBT_BAND_WIDTH, &u8RegVal);
    switch((u8RegVal >> 4) & 0x0f)
    {
        /* 6MHz */
        case 10:
            s32FreqOffset = s32FreqOffset * 6857;
            s32RealSymb = 6857;
            break;
        /* 7MHz */
        case 11:
            s32FreqOffset = s32FreqOffset * 8000;
            s32RealSymb = 8000;
            break;
        /* 8MHz */
        case 12:
            s32FreqOffset = s32FreqOffset * 9143;
            s32RealSymb = 9143;
            break;
        default:
            HI_WARN_PrintReg8(ISDBT_BAND_WIDTH, u8RegVal);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
    }

    s32FreqOffset = s32FreqOffset >> 18;    /* Unit : kHz */

    *pu32FreqKHz = s32FreqOffset;
    *pu32Symb = s32RealSymb;

    HI_DBG_PrintU32(*pu32FreqKHz);
    HI_DBG_PrintU32(*pu32Symb);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_GetCIR(HI_U32 u32TunerPort, HI_U32 u32DataLen)
{
#ifdef HI_PROC_SUPPORT
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8  u8RegVal = 0;
    HI_U32 u32WaitCnt = 1000;
    HI_U32 i = 0, j = 0;
    HI_U8 acRawData[3] = {0};
    HI_U8 au8Val[4] = {0};
    struct file *pstFile = NULL;
    HI_CHAR acFilePath[ISDBT_FILE_NAME_LEN] = {0};
    HI_CHAR acFilePathAndName[ISDBT_FILE_NAME_LEN] = {0};
    struct tm stNow;
    HI_S32 s32WriteLen = 0, s32WriteTotalLen = 0;
    HI_U8 u8WriteBuf[64] = {0};
    HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S stMonitorLayersConfig;
    HI_U8  u8StoreLayerInfo = 0;

    HI_FuncEnter();
    LOG_PrintInfo("Get CIR,now...Waiting...\n");

    qam_read_byte(u32TunerPort, ISDBT_PART_HIER, &u8StoreLayerInfo);
    LOG_PrintInfo("Config to layer A...\n");
    stMonitorLayersConfig.enMonitorLayer = HI_UNF_TUNER_ISDBT_MONITOR_LAYER_A;
    s32Ret = HiSDTV100_ISDBT_Monitorlayer(u32TunerPort, &stMonitorLayersConfig);
    if (s32Ret != HI_SUCCESS)
    {
        LOG_PrintError("HiDTV100_ISDBT_Monitor_layer failed.\n");
        HI_FuncExit();
        return HI_FAILURE;
    }
    qam_read_byte(u32TunerPort, ISDBT_PART_HIER, &u8RegVal);
    HI_DRV_PROC_EchoHelper("ISDBT_PART_HIER = 0x%x, Now delay 2s before cir!\n",u8RegVal);
    msleep(2000);

    qam_write_byte(u32TunerPort, ISDBT_VEC_SEL, 0x78);

    /* 3.1 open catch reset */
    qam_read_byte(u32TunerPort, ISDBT_AXI_RSTN, &u8RegVal);
    u8RegVal |= (1<<0);
    qam_write_byte(u32TunerPort, ISDBT_AXI_RSTN, u8RegVal);

    /* 3.2 select the ATSC clock */
    qam_read_byte(u32TunerPort, ISDBT_AXI_CHN_ORDER, &u8RegVal);
    u8RegVal &= ~(7<<0);
    u8RegVal |= (3<<0);
    qam_write_byte(u32TunerPort, ISDBT_AXI_CHN_ORDER, u8RegVal);

    /* 3.3 config catch_ena */
    qam_write_byte(u32TunerPort, ISDBT_CIR_CTRL, 0);

    /* 4.config mode & catch_ena */
    qam_write_byte(u32TunerPort, ISDBT_CIR_CTRL, 0x04);

    tuner_mdelay(1);

    /* 6.wait for catch end */
    qam_read_byte(u32TunerPort, ISDBT_CIR_CTRL, &u8RegVal);
    while(((u8RegVal & 0x02) == 0x00) && (u32WaitCnt > 0))
    {
        tuner_mdelay(1);
        qam_read_byte(u32TunerPort, ISDBT_CIR_CTRL, &u8RegVal);
        HI_DBG_PrintReg8(ISDBT_CIR_CTRL, u8RegVal);
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
        LOG_PrintError("Get path failed\n");
        goto exit;
    }
    HI_DBG_PrintStr(acFilePath);

    /* 8.deal with file name */
    time_to_tm(get_seconds(), 0, &stNow);
    s32Ret = snprintf(acFilePathAndName, sizeof(acFilePathAndName),"%s/%s_%04u-%02u-%02u_%02u-%02u-%02u.%s",
                acFilePath,
                ISDBT_CIR_FILE_NAME,
                (HI_U32)(stNow.tm_year+1900),
                stNow.tm_mon+1,
                stNow.tm_mday,
                stNow.tm_hour,
                stNow.tm_min,
                stNow.tm_sec,
                ISDBT_FILE_POSTFIX);
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
    for (i=0; i<ISDBT_SAMPLE_DATA_CNT; i++)
    {
        for (j=0; j<3; j++)
        {
            qam_read_byte(u32TunerPort, ISDBT_CIR_DATA, &(acRawData[j]));
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

    /* 13.config layer to old status */
    HI_DRV_PROC_EchoHelper("Config layer to old status.u8StoreLayerInfo:%#x\n", u8StoreLayerInfo);
    qam_read_byte(u32TunerPort, ISDBT_PART_HIER, &u8RegVal);
    u8RegVal &= ~(0x7<<5);
    u8StoreLayerInfo &= ~(0x1f<<0);
    u8RegVal |= u8StoreLayerInfo;
    qam_write_byte(u32TunerPort, ISDBT_PART_HIER, u8RegVal);

    /* 14. close catch reset */
    qam_read_byte(u32TunerPort, ISDBT_AXI_RSTN, &u8RegVal);
    u8RegVal &= ~(1<<0);
    qam_write_byte(u32TunerPort, ISDBT_AXI_RSTN, u8RegVal);
    HI_FuncExit();
#endif
    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

