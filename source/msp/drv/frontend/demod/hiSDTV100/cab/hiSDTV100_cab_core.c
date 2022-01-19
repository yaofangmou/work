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
#include "hiSDTV100_hal.h"
#include "hiSDTV100_mcu.h"

#include "hiSDTV100_cab_core.h"
#include "drv_demod.h"
#include "mxl661.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

static const HI_U8 u8J83BMcuFirmwareTable[] = {
                        0x02,0x02,0x9C,0x90,0xFE,0xD5,0x74,0xA7,0xF0,0x90,0xFE,0x8C,0x74,0x6C,0xF0,0xE4,
                       0xF5,0x10,0x75,0x0C,0x70,0x75,0x0B,0x17,0xF5,0x0A,0xF5,0x09,0x90,0xFE,0x2C,0xE0,
                       0xF5,0x08,0x7F,0x08,0x7E,0x00,0x51,0x2A,0x90,0xFE,0x2C,0xE0,0xFF,0xB5,0x08,0xEC,
                       0xE5,0x08,0x54,0x02,0xF5,0x0D,0xE5,0x08,0x54,0x04,0xF5,0x0E,0xE5,0x08,0x54,0x20,
                       0xF5,0x0F,0xE5,0x10,0x14,0x60,0x7C,0x14,0x70,0x02,0x01,0xD8,0x24,0x02,0x60,0x02,
                       0x21,0x44,0xE5,0x0D,0x70,0x02,0x21,0x44,0x7F,0x14,0x7E,0x00,0x51,0x2A,0x90,0xFE,
                       0x6C,0xE0,0xFF,0x64,0x7F,0x60,0x05,0xEF,0x64,0x81,0x70,0x21,0xE4,0xF5,0x10,0x90,
                       0xFE,0x2E,0xE0,0xF5,0x12,0x54,0xFD,0x44,0x01,0xF5,0x12,0xF0,0x7F,0x05,0x7E,0x00,
                       0x51,0x2A,0x43,0x12,0x03,0x90,0xFE,0x2E,0xE5,0x12,0xF0,0x21,0x44,0x7F,0x8C,0x7E,
                       0x00,0x51,0x2A,0x90,0xFE,0x69,0xE0,0xFD,0x90,0xFE,0x68,0xE0,0x54,0xC0,0x75,0xF0,
                       0x04,0xA4,0x7C,0x00,0x2D,0xFF,0xEC,0x35,0xF0,0xFE,0xC3,0xEF,0x94,0x8C,0xEE,0x94,
                       0x00,0x90,0xFE,0x83,0x40,0x05,0x74,0x91,0xF0,0x80,0x03,0x74,0x92,0xF0,0x75,0x10,
                       0x01,0x21,0x44,0xE5,0x0F,0x60,0x0B,0x75,0x10,0x02,0x90,0xFE,0x8C,0x74,0x6F,0xF0,
                       0x80,0x72,0xE5,0x0D,0x70,0x6E,0x80,0x54,0xE4,0xFF,0xFE,0xFD,0xFC,0xAB,0x0C,0xAA,
                       0x0B,0xA9,0x0A,0xA8,0x09,0xD3,0x51,0x8B,0x40,0x3E,0xE5,0x0C,0x24,0xFF,0xF5,0x0C,
                       0xE5,0x0B,0x34,0xFF,0xF5,0x0B,0xE5,0x0A,0x34,0xFF,0xF5,0x0A,0xE5,0x09,0x34,0xFF,
                       0xF5,0x09,0x90,0xFE,0x8A,0xE0,0xFF,0xA3,0xE0,0x70,0x0C,0xEF,0xD3,0x94,0x09,0x50,
                       0x06,0xE5,0x11,0x04,0xFF,0x80,0x02,0x7F,0x00,0x8F,0x11,0xE5,0x11,0xC3,0x94,0x10,
                       0x40,0x06,0x90,0xFE,0xD5,0x74,0x67,0xF0,0xE5,0x0D,0x70,0x18,0xF5,0x10,0x75,0x0C,
                       0x70,0x75,0x0B,0x17,0xF5,0x0A,0xF5,0x09,0x90,0xFE,0x8C,0x74,0x6C,0xF0,0x90,0xFE,
                       0xD5,0x74,0xA7,0xF0,0x7F,0x0A,0x7E,0x00,0x51,0x2A,0x01,0x1C,0xE4,0xF5,0x0A,0x7F,
                       0x2C,0x31,0xC8,0x8F,0x09,0x7F,0x2D,0x31,0xC8,0x8F,0x08,0x53,0x08,0x0E,0x7F,0x49,
                       0x31,0xC8,0x8F,0x0B,0xE5,0x08,0x64,0x0E,0x60,0x1A,0xE4,0xF5,0x0A,0x7F,0x4A,0x31,
                       0xC8,0x8F,0x0D,0xE5,0x0D,0x20,0xE3,0x48,0x54,0xF7,0x44,0x08,0xF5,0x0D,0x90,0xFE,
                       0x4A,0xF0,0x80,0x3C,0xE5,0x0B,0xD3,0x95,0x0C,0x40,0x07,0xE5,0x0B,0x95,0x0C,0xFF,
                       0x80,0x06,0xC3,0xE5,0x0C,0x95,0x0B,0xFF,0xE5,0x0A,0xB4,0x01,0x15,0xEF,0xD3,0x94,
                       0x40,0x40,0x0F,0x7F,0x4A,0x31,0xC8,0x8F,0x0D,0x53,0x0D,0xF7,0x90,0xFE,0x4A,0xE5,
                       0x0D,0xF0,0xE5,0x0A,0x70,0x07,0xE5,0x0B,0x60,0x03,0x75,0x0A,0x01,0x85,0x0B,0x0C,
                       0x7F,0x1E,0x7E,0x00,0x51,0x52,0x80,0x87,0x8F,0x0E,0xE4,0xF5,0x0F,0x2F,0xFF,0xE4,
                       0x34,0xFE,0x8F,0x82,0xF5,0x83,0xE0,0xF5,0x10,0x7F,0x0A,0x7E,0x00,0x51,0x52,0x75,
                       0x0F,0x01,0xE4,0x25,0x0E,0xFF,0xE4,0x34,0xFE,0x8F,0x82,0xF5,0x83,0xE0,0xFF,0x74,
                       0x10,0x25,0x0F,0xF8,0xA6,0x07,0xE5,0x0F,0xB4,0x01,0x09,0xE5,0x11,0x65,0x10,0x70,
                       0x19,0xAF,0x11,0x22,0xE5,0x0F,0xB4,0x02,0x0E,0xE5,0x12,0x65,0x10,0x60,0x05,0xE5,
                       0x12,0xB5,0x11,0x06,0xAF,0x12,0x22,0xAF,0x13,0x22,0x7F,0x0A,0x7E,0x00,0x51,0x52,
                       0x05,0x0F,0xE5,0x0F,0xC3,0x94,0x04,0x40,0xB9,0x22,0xE4,0xFD,0xFC,0xC3,0xED,0x9F,
                       0xEC,0x9E,0x50,0x1D,0xE4,0xFB,0xFA,0x05,0x14,0xE5,0x14,0x70,0x02,0x05,0x13,0x0B,
                       0xBB,0x00,0x01,0x0A,0xBA,0x03,0xF0,0xBB,0xE8,0xED,0x0D,0xBD,0x00,0x01,0x0C,0x80,
                       0xDC,0x22,0xEF,0x1F,0xAA,0x06,0x70,0x01,0x1E,0x4A,0x60,0x13,0xE4,0xFC,0xFD,0xC3,
                       0xED,0x94,0x7D,0xEC,0x94,0x00,0x50,0xEA,0x0D,0xBD,0x00,0x01,0x0C,0x80,0xF0,0x22,
                       0x90,0xFE,0x00,0xE0,0xFF,0xE0,0xFE,0xEF,0xB5,0x06,0xF5,0x53,0x07,0xE0,0xBF,0x80,
                       0x04,0x11,0x03,0x80,0x02,0x31,0x4C,0xE4,0xFE,0xFF,0x22,0xEB,0x9F,0xF5,0xF0,0xEA,
                       0x9E,0x42,0xF0,0xE9,0x9D,0x42,0xF0,0xE8,0x9C,0x45,0xF0,0x22,0x78,0x7F,0xE4,0xF6,
                       0xD8,0xFD,0x75,0x81,0x14,0x02,0x02,0x70};

static HI_VOID Cab_CoolReset(HI_U32 u32TunerPort)
{
    U_QAMCT_RESET        qamct_reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, &(qamct_reset.u8));
    qamct_reset.bits.cool_reset = 0x0;
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, qamct_reset.u8);
    msleep(2);
    qam_read_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H , &(qamct_reset.u8));
    qamct_reset.bits.cool_reset = 0x1;
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, qamct_reset.u8);

    HI_FuncExit();
}

static HI_VOID Cab_HotReset(HI_U32 u32TunerPort)
{
    U_QAMCT_RESET        qamct_reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, &(qamct_reset.u8));
    qamct_reset.bits.hot_reset = 0x0;
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, qamct_reset.u8);
    msleep(2);
    qam_read_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H , &(qamct_reset.u8));
    qamct_reset.bits.hot_reset = 0x1;
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, qamct_reset.u8);

    HI_FuncExit();
}

static HI_S32 Cab_ClkCfg(HI_U32 u32TunerPort)
{
    HI_U32 u32DemodClk = 0, u32AdcClk = 0, u32IFClk = 0;
    U_ADC_AGC_CTRL unAdcAgcCtrl;
    U_QAMC_FDEMO_H unQamFdemoH;
    U_QAMC_FADC_H unQamFadcH;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();

    #ifdef HI_FPGA_SUPPORT
        u32DemodClk = 64000;
        u32AdcClk = 29167;
    #else
        u32DemodClk = 90000;
        u32AdcClk = 30000;
    #endif
    u32IFClk = 5000;

    /* demod clk */
    HI_DBG_PrintU32(u32DemodClk);
    qam_read_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, &(unQamFdemoH.u8));
    unQamFdemoH.bits.fdemo_h = (u32DemodClk>>16) & 0x03;
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FREQ_L, (u32DemodClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FREQ_M, (u32DemodClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, DVBC_J83B_DEMO_FEC_FREQ_H, unQamFdemoH.u8);

    /* adc clk */
    HI_DBG_PrintU32(u32AdcClk);
    qam_read_byte(u32TunerPort, DVBC_J83B_TR_LOOP_CTRL, &(unQamFadcH.u8));
    unQamFadcH.bits.fadc_h = (u32AdcClk>>16) & 0x03;
    qam_write_byte(u32TunerPort, DVBC_J83B_FREQ_ADC_L, (u32AdcClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBC_J83B_FREQ_ADC_M, (u32AdcClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, DVBC_J83B_TR_LOOP_CTRL, unQamFadcH.u8);

    /* IF clk */
    HI_DBG_PrintU32(u32IFClk);
    qam_write_byte(u32TunerPort, DVBC_J83B_FREQ_DEV_L, (u32IFClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBC_J83B_FREQ_DEV_H, (u32IFClk>>8) & 0xFF);

    /* ADC/AGC ctrl */
    qam_read_byte(u32TunerPort, DVBC_J83B_AGC_CTRL, &(unAdcAgcCtrl.u8));
    unAdcAgcCtrl.bits.c_adc_twos  = 0x1; //complement
    unAdcAgcCtrl.bits.c_iq_swap   = 0x0; //I
    qam_write_byte(u32TunerPort, DVBC_J83B_AGC_CTRL, unAdcAgcCtrl.u8);
    HI_DBG_PrintReg8(DVBC_J83B_AGC_CTRL, unAdcAgcCtrl.u8);

    /*clk_sel*/
    qam_read_byte(u32TunerPort, DVBC_CLK_SEL, &u8RegVal);
    u8RegVal &= ~(0x1f<<3);
    u8RegVal |= 0xc<<3;
    qam_write_byte(u32TunerPort, DVBC_CLK_SEL, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Cab_ExtRegCfg(HI_U32 u32TunerPort)
{
    //HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 u8RegVal = 0;
    U_QAMC_SF_RMV_CTRL unSFRmvCtrl;
    U_QAMC_TR_CR_CTRL unTRCRCtrl;

    HI_FuncEnter();

    /* if boards are different from the FPGA in Hangzhou, we need to adjust the AGC GOAL */
    #ifdef HI_FPGA_SUPPORT
        qam_write_byte(u32TunerPort, DVBC_J83B_AGC_GOAL, 0x15);
    #else
        qam_write_byte(u32TunerPort, DVBC_J83B_AGC_GOAL, 0x1a);
    #endif

    qam_read_byte(u32TunerPort, DVBC_J83B_SF_RMV_CTRL, &(unSFRmvCtrl.u8));
    unSFRmvCtrl.bits.sf_rmv = 1;
    qam_write_byte(u32TunerPort, DVBC_J83B_SF_RMV_CTRL, unSFRmvCtrl.u8);

    qam_read_byte(u32TunerPort, DVBC_J83B_TR_CR_CTRL, &(unTRCRCtrl.u8));
    unTRCRCtrl.bits.scan_fs = 0;
    qam_write_byte(u32TunerPort, DVBC_J83B_TR_CR_CTRL, unTRCRCtrl.u8);

    if (HI_UNF_TUNER_SIG_TYPE_CAB == g_stTunerOps[u32TunerPort].enSigType)
    {
        qam_read_byte(u32TunerPort, DVBC_J83B_PT_CTRL, &u8RegVal);
        u8RegVal = (u8RegVal & 0xf8) | 0x01;
        qam_write_byte(u32TunerPort, DVBC_J83B_PT_CTRL, u8RegVal);
    }
    else
    {
        qam_read_byte(u32TunerPort, DVBC_J83B_PT_CTRL, &u8RegVal);
        u8RegVal = (u8RegVal & 0xf8) | 0x02;
        qam_write_byte(u32TunerPort, DVBC_J83B_PT_CTRL, u8RegVal);
    }

    HI_FuncExit();
    return HI_SUCCESS;
}


HI_S32 HiSDTV100_Cab_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel,  HI_UNF_TUNER_DEV_TYPE_E enTunerType)
{
    HI_S32 s32Ret = HI_SUCCESS;
    U_HiDTV200_MOD_CTRL unModCtrl;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_DBG_PrintU32(u8I2cChannel);
    HI_DBG_PrintU32(enTunerType);

    /* choose mod: 0-dtmb/1-dvbt/2-dvbc/3-j83b/4-atsc/5-isdbt */
    qam_read_byte(u32TunerPort, DVBC_J83B_CHN_SEL, &(unModCtrl.u8));
    if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_J83B)
        unModCtrl.bits.mode = 0x3;
    else if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_CAB)
        unModCtrl.bits.mode = 0x2;
    qam_write_byte(u32TunerPort, DVBC_J83B_CHN_SEL, unModCtrl.u8);

    Cab_CoolReset(u32TunerPort);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)
            HI_TUNER_CHECK_FUNC_RET(s32Ret, Cab_ClkCfg(u32TunerPort));
            HI_TUNER_CHECK_FUNC_RET(s32Ret, Cab_ExtRegCfg(u32TunerPort));
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

    #ifndef HI_FPGA_SUPPORT
    #if 0
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_MCU_LoadFirmware(u32TunerPort, u8J83BMcuFirmwareTable,
                                             sizeof(u8J83BMcuFirmwareTable)/sizeof(u8J83BMcuFirmwareTable[0])));

        RESET_MCU(u32TunerPort);
    #endif
    #endif

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

HI_S32 HiSDTV100_Cab_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32SymbolRate = 0;
    HI_U32 i = 0;
    U_QAMC_MODU_MODE qamc_modu_mode;
    HI_U8 u8RegVal = 0;
    HI_U8 u8I2cChannel = g_stTunerOps[u32TunerPort].enI2cChannel;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_DBG_PrintU32(pstChannel->u32Frequency);
    HI_DBG_PrintU32(pstChannel->unSRBW.u32SymbolRate);
    HI_DBG_PrintU32(pstChannel->enQamType);

    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, u8I2cChannel, pstChannel->u32Frequency));

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            /* after set tuner,delay 20ms befor setting demod */
            msleep(20);

            u32SymbolRate = pstChannel->unSRBW.u32SymbolRate / 1000; //kHz

            /* Qam */
            qam_read_byte(u32TunerPort, DVBC_J83B_EQU_CTRL, &(qamc_modu_mode.u8));
            switch(pstChannel->enQamType)
            {
                case QAM_TYPE_16:
                {
                    qamc_modu_mode.bits.modu_mode = 0x4;
                    break;
                }
                case QAM_TYPE_32:
                {
                    qamc_modu_mode.bits.modu_mode = 0x5;
                    break;
                }
                case QAM_TYPE_64:
                {
                    qamc_modu_mode.bits.modu_mode = 0x6;
                    break;
                }
                case QAM_TYPE_128:
                {
                    qamc_modu_mode.bits.modu_mode = 0x7;
                    break;
                }
                case QAM_TYPE_256:
                {
                    qamc_modu_mode.bits.modu_mode = 0x8;
                    break;
                }
                default:
                {
                    qamc_modu_mode.bits.modu_mode = 0x6;
                    break;
                }
            }
            qam_write_byte(u32TunerPort, DVBC_J83B_EQU_CTRL, qamc_modu_mode.u8);

            /* symbolRate */
            qam_write_byte(u32TunerPort, DVBC_J83B_FS_L, u32SymbolRate & 0xFF);
            qam_write_byte(u32TunerPort, DVBC_J83B_FS_H, (u32SymbolRate>>8) & 0xFF);

            /* auto spec inv */
            qam_read_byte(u32TunerPort, DVBC_J83B_TOUT_CTRL, &u8RegVal);
            u8RegVal &= ~(1<<0);
            qam_write_byte(u32TunerPort, DVBC_J83B_TOUT_CTRL, u8RegVal);

            /* hiMDTV cab reset */
            Cab_HotReset(u32TunerPort);

            START_MCU(u32TunerPort);

            //state HiDVBC
            /* check whether sync ok,max timeout = 300ms */
            for(i=0; i<15; i++)
            {
                qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegVal);
                if(u8RegVal & 0x8)
                {
                    break;
                }
                else
                {
                    msleep(20);
                }
            }

            /* sync not ok in 300ms */
            if(i >= 15)
            {
                LOG_PrintInfo("sync not ok!\n");
                pstChannel->enSyncLockStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
                return HI_SUCCESS;
            }
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

HI_S32 HiSDTV100_Cab_DeInit(HI_U32 u32TunerPort)
{
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)
            RESET_MCU(u32TunerPort);
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

HI_S32 HiSDTV100_Cab_SetSigType(HI_U32 u32TunerPort, HI_UNF_TUNER_SIG_TYPE_E enSigType)
{
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

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

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

