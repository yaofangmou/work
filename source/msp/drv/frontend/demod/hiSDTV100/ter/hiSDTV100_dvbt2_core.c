/******************************************************************************

  Copyright (C), 2016-2050, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2017/05/18
  Description   :
  History       :
  1.Date        : 2017/05/18
    Modification: Created file
******************************************************************************/
#include "hiSDTV100.h"
#include "hiSDTV100_dvbt2_core.h"
#include "hiSDTV100_hal.h"
#include "hiSDTV100_mcu.h"
#include "drv_demod.h"

static DVBT2_PARA_S s_stDvbt2Para;
static const HI_U8 u8Dvbt2McuFirmwareTable[] = {0x02,0x02,0xFB,0xE4,0xF5,0x09,0x90,0xFE,0x2C,0xE0,0xFF,0xC3,0x13,0x54,0x01,0xFE,
                       0xEF,0x13,0x13,0x13,0x54,0x01,0xF9,0xEF,0xC4,0x54,0x01,0xF5,0x08,0xEF,0xC4,0x13,
                       0x54,0x01,0xFD,0xE5,0x09,0x14,0x70,0x02,0x21,0x29,0x14,0x70,0x02,0x41,0x4C,0x14,
                       0x70,0x02,0x41,0xA9,0x14,0x70,0x02,0x41,0xBF,0x24,0x04,0x60,0x02,0x41,0xCB,0xEE,
                       0x64,0x01,0x60,0x02,0x41,0xCB,0x90,0xFE,0x85,0xE0,0xFC,0xC4,0x13,0x13,0x13,0x54,
                       0x01,0xFC,0xE0,0xFB,0x13,0x13,0x13,0x54,0x07,0xF5,0x0B,0x90,0xFE,0x6A,0xE0,0xFF,
                       0x54,0x9F,0x44,0x20,0xF0,0x90,0xFE,0x51,0xE0,0xFB,0xC4,0x13,0x13,0x13,0x54,0x01,
                       0xFB,0xEC,0x64,0x01,0x70,0x53,0xBB,0x01,0x08,0x90,0xFE,0x61,0x74,0x8B,0xF0,0x80,
                       0x06,0x90,0xFE,0x61,0x74,0x8A,0xF0,0x90,0xFE,0x42,0x74,0x5A,0xF0,0x90,0xFE,0x66,
                       0xE0,0xFF,0x44,0x10,0xF0,0xA3,0x74,0x10,0xF0,0x90,0xFE,0x74,0xE0,0xFF,0x54,0xF9,
                       0x44,0x02,0xF0,0x90,0xFE,0x85,0xE0,0x54,0x03,0xF5,0x0C,0x90,0xFE,0x7D,0xE0,0xFF,
                       0xE5,0x0C,0xC3,0x94,0x02,0x50,0x06,0xEF,0x54,0xFB,0xF0,0x80,0x07,0xEF,0x44,0x04,
                       0x90,0xFE,0x7D,0xF0,0x75,0x09,0x03,0x41,0xCB,0xBB,0x01,0x08,0x90,0xFE,0x62,0x74,
                       0x83,0xF0,0x80,0x06,0x90,0xFE,0x62,0x74,0x8B,0xF0,0x90,0xFE,0x42,0x74,0x50,0xF0,
                       0x90,0xFE,0x66,0xE0,0xFF,0x54,0xEF,0xF0,0x90,0xFE,0x7D,0xE0,0xFF,0x44,0x04,0xF0,
                       0xE5,0x0B,0xD3,0x94,0x02,0x40,0x0E,0x90,0xFE,0x67,0x74,0x66,0xF0,0x90,0xFE,0x61,
                       0x74,0x8B,0xF0,0x80,0x1F,0xE5,0x0B,0xB4,0x02,0x0E,0x90,0xFE,0x67,0x74,0x55,0xF0,
                       0x90,0xFE,0x61,0x74,0x8A,0xF0,0x80,0x0C,0x90,0xFE,0x67,0x74,0x44,0xF0,0x90,0xFE,
                       0x61,0x74,0x8A,0xF0,0x75,0x09,0x01,0x41,0xCB,0x90,0xFE,0xB3,0xE0,0xFC,0xC4,0x13,
                       0x13,0x54,0x01,0xFC,0xEE,0x70,0x0B,0x90,0xFE,0x42,0x74,0x5A,0xF0,0xE4,0xF5,0x09,
                       0x41,0xCB,0xEC,0x64,0x01,0x60,0x02,0x41,0xCB,0x90,0xFE,0xB8,0xE0,0xFC,0xC4,0x54,
                       0x0F,0xF5,0x0A,0x90,0xFE,0xB3,0xE0,0xFC,0x13,0x13,0x54,0x07,0xF5,0x0C,0x90,0xFE,
                       0x86,0xE0,0xFC,0xC4,0x54,0x01,0xFC,0x90,0xFE,0xB5,0xE0,0x54,0x0F,0xF5,0x0D,0xE5,
                       0x0B,0xB4,0x05,0x08,0xE5,0x0A,0xB4,0x01,0x03,0xEC,0x60,0x04,0xE5,0x0A,0x70,0x0A,
                       0x90,0xFE,0x74,0xE0,0xFF,0x44,0x06,0xF0,0x80,0x0A,0x90,0xFE,0x74,0xE0,0xFF,0x54,
                       0xF9,0x44,0x02,0xF0,0xE5,0x0B,0xD3,0x94,0x02,0x40,0x57,0xE5,0x0D,0xB4,0x03,0x12,
                       0xE5,0x0B,0xB4,0x03,0x04,0x7C,0x96,0x80,0x02,0x7C,0xA7,0x90,0xFE,0x67,0xEC,0xF0,
                       0x41,0x47,0xE5,0x0D,0xB4,0x02,0x12,0xE5,0x0B,0xB4,0x03,0x04,0x7C,0x85,0x80,0x02,
                       0x7C,0x96,0x90,0xFE,0x67,0xEC,0xF0,0x80,0x7E,0xE5,0x0D,0xB4,0x01,0x12,0xE5,0x0B,
                       0xB4,0x03,0x04,0x7C,0x75,0x80,0x02,0x7C,0x86,0x90,0xFE,0x67,0xEC,0xF0,0x80,0x67,
                       0xE5,0x0B,0xB4,0x03,0x04,0x7C,0x65,0x80,0x02,0x7C,0x76,0x90,0xFE,0x67,0xEC,0xF0,
                       0x80,0x55,0xE5,0x0D,0xB4,0x03,0x12,0xE5,0x0B,0xB4,0x02,0x04,0x7C,0x86,0x80,0x02,
                       0x7C,0x75,0x90,0xFE,0x67,0xEC,0xF0,0x80,0x3E,0xE5,0x0D,0xB4,0x02,0x12,0xE5,0x0B,
                       0xB4,0x02,0x04,0x7C,0x75,0x80,0x02,0x7C,0x65,0x90,0xFE,0x67,0xEC,0xF0,0x80,0x27,
                       0xE5,0x0D,0xB4,0x01,0x12,0xE5,0x0B,0xB4,0x02,0x04,0x7C,0x65,0x80,0x02,0x7C,0x54,
                       0x90,0xFE,0x67,0xEC,0xF0,0x80,0x10,0xE5,0x0B,0xB4,0x02,0x04,0x7C,0x55,0x80,0x02,
                       0x7C,0x44,0x90,0xFE,0x67,0xEC,0xF0,0x75,0x09,0x02,0x80,0x7F,0xEE,0x70,0x0B,0x90,
                       0xFE,0x42,0x74,0x5A,0xF0,0xE4,0xF5,0x09,0x80,0x71,0xE9,0x64,0x01,0x70,0x6C,0xE5,
                       0x0A,0x64,0x07,0x70,0x1E,0xE5,0x0D,0xB4,0x03,0x04,0x7C,0x00,0x80,0x02,0x7C,0x10,
                       0x90,0xFE,0x67,0xEC,0xF0,0x90,0xFE,0x75,0x74,0xBE,0xF0,0x90,0xFE,0x61,0x74,0x8A,
                       0xF0,0x80,0x12,0x90,0xFE,0x67,0x74,0x21,0xF0,0x90,0xFE,0x75,0x74,0xFE,0xF0,0x90,
                       0xFE,0x61,0x74,0x8B,0xF0,0x90,0xFE,0x66,0xE0,0xFF,0x44,0x10,0xF0,0x90,0xFE,0x6A,
                       0xE0,0x44,0x60,0xF0,0x75,0x09,0x03,0x80,0x22,0xEE,0x70,0x0B,0x90,0xFE,0x42,0x74,
                       0x5A,0xF0,0xE4,0xF5,0x09,0x80,0x14,0xBD,0x01,0x11,0x75,0x09,0x04,0x80,0x0C,0xEE,
                       0x70,0x09,0x90,0xFE,0x42,0x74,0x5A,0xF0,0xE4,0xF5,0x09,0x7F,0x08,0x7E,0x00,0x51,
                       0xD3,0x01,0x06,0xE4,0xFD,0xFC,0xC3,0xED,0x9F,0xEC,0x9E,0x50,0x1D,0xE4,0xFB,0xFA,
                       0x05,0x0F,0xE5,0x0F,0x70,0x02,0x05,0x0E,0x0B,0xBB,0x00,0x01,0x0A,0xBA,0x03,0xF0,
                       0xBB,0xE8,0xED,0x0D,0xBD,0x00,0x01,0x0C,0x80,0xDC,0x22,0x78,0x7F,0xE4,0xF6,0xD8,
                       0xFD,0x75,0x81,0x0F,0x02,0x00,0x03};

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_VOID DVBT2_CoolReset(HI_U32 u32TunerPort)
{
    U_MDTV_RESET    uDvbt2Reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, DVBT2_RSTN_CTRL, &(uDvbt2Reset.u8));
    uDvbt2Reset.bits.cool_reset = 0x0;
    qam_write_byte(u32TunerPort, DVBT2_RSTN_CTRL, uDvbt2Reset.u8);
    msleep(1);//udelay(20);
    qam_read_byte(u32TunerPort, DVBT2_RSTN_CTRL , &(uDvbt2Reset.u8));
    uDvbt2Reset.bits.cool_reset = 0x1;
    qam_write_byte(u32TunerPort, DVBT2_RSTN_CTRL, uDvbt2Reset.u8);

    HI_FuncExit();
}

HI_VOID DVBT2_HotReset(HI_U32 u32TunerPort)
{
    U_MDTV_RESET    uDvbt2Reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, DVBT2_RSTN_CTRL, &(uDvbt2Reset.u8));
    uDvbt2Reset.bits.hot_reset = 0x0;
    qam_write_byte(u32TunerPort, DVBT2_RSTN_CTRL, uDvbt2Reset.u8);
    msleep(1);//udelay(20);
    qam_read_byte(u32TunerPort, DVBT2_RSTN_CTRL , &(uDvbt2Reset.u8));
    uDvbt2Reset.bits.hot_reset = 0x1;
    qam_write_byte(u32TunerPort, DVBT2_RSTN_CTRL, uDvbt2Reset.u8);

    HI_FuncExit();
}

static HI_S32 DVBT2_AxiEn(HI_U32 u32TunerPort, HI_BOOL bEn)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32PhyBaseAddr = 0x0;
    HI_U8  u8BaseAddr[4] = {0};

    HI_FuncEnter();

    if ((HI_TRUE == bEn) && (HI_FALSE ==  s_stDvbt2Para.bDvbt2BufInit))
    {
        LOG_PrintInfo("start to malloc DVBT2 memory...\n");
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HI_DRV_MMZ_AllocAndMap("HiDTV200_DVBT2", MMZ_OTHERS, DVBT2_RAW_BUF_SIZE, 0, &s_stDvbt2Para.stDvbt2Buf));
        memset((HI_VOID *)s_stDvbt2Para.stDvbt2Buf.pu8StartVirAddr, 0, DVBT2_RAW_BUF_SIZE);

        if (!s_stDvbt2Para.stDvbt2Buf.pu8StartVirAddr)
        {
            HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_ALLOC_MEM);
            return HI_ERR_TUNER_FAILED_ALLOC_MEM;
        }
        HI_DBG_PrintU64(s_stDvbt2Para.stDvbt2Buf.pu8StartVirAddr);
        HI_DBG_PrintU32(s_stDvbt2Para.stDvbt2Buf.u32StartPhyAddr);
        u32PhyBaseAddr = ((((HI_U32)s_stDvbt2Para.stDvbt2Buf.u32StartPhyAddr) & 0xffffff00U) + 0x100); //(BaseAddr/256+1)*256

        u8BaseAddr[0] = (u32PhyBaseAddr)&0xff;         //The lowest bit
        u8BaseAddr[1] = (u32PhyBaseAddr>>8)&0xff;
        u8BaseAddr[2] = (u32PhyBaseAddr>>16)&0xff;
        u8BaseAddr[3] = (u32PhyBaseAddr>>24)&0xff;

        qam_write_byte(u32TunerPort, DVBT2_AXI_BASE_ADDR0, u8BaseAddr[3]);
        qam_write_byte(u32TunerPort, DVBT2_AXI_BASE_ADDR1, u8BaseAddr[2]);
        qam_write_byte(u32TunerPort, DVBT2_AXI_BASE_ADDR2, u8BaseAddr[1]);
        qam_write_byte(u32TunerPort, DVBT2_AXI_BASE_ADDR3, u8BaseAddr[0]);

        /* AXI hold */
        qam_write_byte(u32TunerPort, DVBT2_AXI_RSTN, 0x80);

        /* reset all of module of demod */
        qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL0, 0xff);
    }
    else
    {
        qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL0, 0xf0);
        msleep(1);

        /* AXI release */
        qam_write_byte(u32TunerPort, DVBT2_AXI_RSTN, 0x00);
        LOG_PrintInfo("release AXI successfully...\n");
    }

    s_stDvbt2Para.bDvbt2BufInit = bEn;

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 DVBT2_ClkCfg(HI_U32 u32TunerPort)
{
    HI_U8 u8RegVal = 0;
    HI_U32 u32DemodClk = 0;
    HI_U32 u32AdcClk = 0;
    HI_U32 u32IFClk = 0;

    HI_FuncEnter();

#ifdef HI_FPGA_SUPPORT
    u32DemodClk    = 55000;
    u32AdcClk    = 29167;
#else
    u32DemodClk    = 60000;
    u32AdcClk    = 30000;
#endif

    u32IFClk = 5000;

    /*clk_sel*/
    qam_read_byte(u32TunerPort, DVBT2_CLK_SEL, &u8RegVal);
    u8RegVal &= ~(0x1f<<3);
    u8RegVal |= 0x18<<3;
    qam_write_byte(u32TunerPort, DVBT2_CLK_SEL, u8RegVal);

    /* demod clk */
    HI_DBG_PrintU32(u32DemodClk);
    qam_write_byte(u32TunerPort, DVBT2_CLK_DEMO_L, (u32DemodClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBT2_CLK_DEMO_M, (u32DemodClk>>8) & 0xFF);

    qam_read_byte(u32TunerPort, DVBT2_RSTN_CTRL, &u8RegVal);
    u8RegVal = (u8RegVal & 0xCF) | (((u32DemodClk>>16) & 0x03) << 4);
    qam_write_byte(u32TunerPort, DVBT2_RSTN_CTRL, u8RegVal);

    /* adc clk */
    HI_DBG_PrintU32(u32AdcClk);
    qam_write_byte(u32TunerPort, DVBT2_CLK_ADC_L, (u32AdcClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBT2_CLK_ADC_M, (u32AdcClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, DVBT2_CLK_ADC_H, (u32AdcClk>>16) & 0x03);

    switch(g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        default:
            u32IFClk = 5000;
            break;
    }
    /* IF clk */
    HI_DBG_PrintU32(u32IFClk);
    qam_write_byte(u32TunerPort, DVBT2_IF_FREQ_L, (u32IFClk & 0xFF));
    qam_write_byte(u32TunerPort, DVBT2_IF_FREQ_H, (u32IFClk>>8) & 0xFF);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 DVBT2_ExtRegCfg(HI_U32 u32TunerPort)
{
    HI_FuncEnter();


    qam_write_byte(u32TunerPort, DVBT2_OUTP_PLL2, 0x80);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_Init(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;
#ifndef HI_FPGA_SUPPORT
    HI_U8 u8RegVal = 0;
#endif
    U_HiDTV200_MOD_CTRL unModCtrl;

    HI_FuncEnter();

    /* choose mod: 0-dtmb/1-dvbt/2-dvbc/3-j83b/4-atsc/5-isdbt */
    qam_read_byte(u32TunerPort, DVBT2_CHN_SEL, &(unModCtrl.u8));
    unModCtrl.bits.mode = 0x01;
    qam_write_byte(u32TunerPort, DVBT2_CHN_SEL, unModCtrl.u8);
    HI_DBG_PrintReg8(DVBT2_CHN_SEL, unModCtrl.u8);

    DVBT2_CoolReset(u32TunerPort);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, DVBT2_AxiEn(u32TunerPort, HI_TRUE));

#ifndef HI_FPGA_SUPPORT
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_MCU_LoadFirmware(u32TunerPort, u8Dvbt2McuFirmwareTable,
                                             sizeof(u8Dvbt2McuFirmwareTable)/sizeof(u8Dvbt2McuFirmwareTable[0])));
    RESET_MCU(u32TunerPort);
    /*switch(g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        case HI_UNF_TUNER_DEV_TYPE_MXL661:
            HiDTV200_MCU_RAM_WriteByte(MCU_RAM(MCU_RAM_ADDR_TUNER_TYPE), 2);
            break;
        case HI_UNF_TUNER_DEV_TYPE_SI2151:
            HiDTV200_MCU_RAM_WriteByte(MCU_RAM(MCU_RAM_ADDR_TUNER_TYPE), 1);
            break;
        default:
            break;
    }*/
    HiSDTV100_MCU_RAM_ReadByte(u32TunerPort, MCU_RAM(MCU_RAM_ADDR_TUNER_TYPE), &u8RegVal);
    LOG_PrintDebug("Read RAM(%#x):%#x\n", MCU_RAM(MCU_RAM_ADDR_TUNER_TYPE), u8RegVal);
#endif
    HI_TUNER_CHECK_FUNC_RET(s32Ret, DVBT2_ClkCfg(u32TunerPort));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, DVBT2_ExtRegCfg(u32TunerPort));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    HI_U8 u8RegVal = 0;
    HI_U32 u32BandWidth;
    HI_U8 i = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    LOG_PrintDebug("pstChannel->u32Frequency:%d, pstChannel->unSRBW.u32BandWidth:%d, pstChannel->u8DVBTMode:%s\n",
                                        pstChannel->u32Frequency,
                                        pstChannel->unSRBW.u32BandWidth,
                                        (pstChannel->u8DVBTMode)?"DVB-T":"DVB-T2");

    START_MCU(u32TunerPort);

    /* 1-only search t,0-t2 only, 2-both */
    qam_read_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, &u8RegVal);
    u8RegVal = (u8RegVal & 0x9F) | (pstChannel->u8DVBTMode << 5) ;
    qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, u8RegVal);

    /* BandWidth select */
    switch(pstChannel->unSRBW.u32BandWidth)
    {
        case 1700:
            u32BandWidth = 0;
            break;
        case 5000:
            u32BandWidth = 1;
            break;
        case 6000:
            u32BandWidth = 2;
            break;
        case 7000:
            u32BandWidth = 3;
            break;
        case 8000:
        //Now jump to default
        default:
            u32BandWidth = 4;
            break;
    }
    qam_read_byte(u32TunerPort, DVBT2_BAND_WIDTH, &u8RegVal);
    u8RegVal = (u8RegVal & 0x0f) | (u32BandWidth <<4);
    qam_write_byte(u32TunerPort, DVBT2_BAND_WIDTH, u8RegVal);

    /* Mf select */
    qam_read_byte(u32TunerPort, DVBT2_DAGC_CTRL_1, &u8RegVal);
    u8RegVal = (u8RegVal & 0xF0) | 0x09;
    qam_write_byte(u32TunerPort, DVBT2_DAGC_CTRL_1, u8RegVal);

    /* DVB-T */
    if(pstChannel->u8DVBTMode == 1)
    {
        qam_read_byte(u32TunerPort, DVBT2_TMCC_AC, &u8RegVal);
        u8RegVal = u8RegVal & 0xFB;
        qam_write_byte(u32TunerPort, DVBT2_TMCC_AC, u8RegVal);

        /* select to search high prior stream or low; Now default to search high prior stream*/
        if((pstChannel->unTer.enDVBT == HI_UNF_TUNER_TS_PRIORITY_HP)
               ||(pstChannel->unTer.enDVBT == HI_UNF_TUNER_TS_PRIORITY_NONE))
        {
            qam_read_byte(u32TunerPort, DVBT2_AUTO_DLY, &u8RegVal);
            u8RegVal = u8RegVal & 0xFD;
            qam_write_byte(u32TunerPort, DVBT2_AUTO_DLY, u8RegVal);
        }
        else if(pstChannel->unTer.enDVBT == HI_UNF_TUNER_TS_PRIORITY_LP)
        {
            qam_read_byte(u32TunerPort, DVBT2_AUTO_DLY, &u8RegVal);
            u8RegVal = u8RegVal | 0x02;
            qam_write_byte(u32TunerPort, DVBT2_AUTO_DLY, u8RegVal);
        }
        else
        {
            LOG_PrintWarning("DVBT: wrong to search high prior stream or low!\n");
        }
    }
    else
    {
        qam_read_byte(u32TunerPort, DVBT2_TMCC_AC, &u8RegVal);
        u8RegVal = u8RegVal | 0x04;
        qam_write_byte(u32TunerPort, DVBT2_TMCC_AC, u8RegVal);

        /* set PLP */
        HI_DBG_PrintU32(pstChannel->unTer.stDVBT2Param.u8PlpId);
        HI_DBG_PrintU32(pstChannel->unTer.stDVBT2Param.u8CommPlpId);
        HI_DBG_PrintU32(pstChannel->unTer.stDVBT2Param.u8Combination);
        qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 1, 0);
        u8RegVal = pstChannel->unTer.stDVBT2Param.u8PlpId;
        qam_write_byte(u32TunerPort, DVBT2_PLP_ID0, u8RegVal);
        u8RegVal = pstChannel->unTer.stDVBT2Param.u8CommPlpId;
        qam_write_byte(u32TunerPort, DVBT2_PLP_ID1, u8RegVal);
        u8RegVal = pstChannel->unTer.stDVBT2Param.u8Combination ? 1 : 0;
        qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 1, u8RegVal);
        qam_write_bit(u32TunerPort, DVBT2_PLP_CTRL, 0, 0);
    }

    DVBT2_HotReset(u32TunerPort);

    /* check whether sync ok,max timeout = 500ms */
    for(i=0; i<25; i++)
    {
        if (i<=15)
        {
            qam_read_byte(u32TunerPort, DVBT2_T2_THRES, &u8RegVal);
            u8RegVal &= ~(0x7<<0);
            u8RegVal |= 2;
            qam_write_byte(u32TunerPort, DVBT2_T2_THRES, u8RegVal);
        }
        else
        {
            qam_read_byte(u32TunerPort, DVBT2_T2_THRES, &u8RegVal);
            u8RegVal &= ~(0x7<<0);
            u8RegVal |= 1;
            qam_write_byte(u32TunerPort, DVBT2_T2_THRES, u8RegVal);
        }

        qam_read_byte(u32TunerPort, DVBT2_LOCK_FLAG, &u8RegVal);
        if(u8RegVal & 0x2)
        {
            break;
        }
        else
        {
            msleep(20);
        }
    }

    /* sync not ok in 500ms */
    if(i >= 25)
    {
        LOG_PrintInfo("sync not ok\n");
        pstChannel->enSyncLockStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_DeInit(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECK_FUNC_RET(s32Ret, DVBT2_AxiEn(u32TunerPort, HI_FALSE));

    HI_DRV_MMZ_UnmapAndRelease(&s_stDvbt2Para.stDvbt2Buf);
    s_stDvbt2Para.stDvbt2Buf.u32StartPhyAddr = 0;
    s_stDvbt2Para.stDvbt2Buf.pu8StartVirAddr = 0;

    LOG_PrintInfo("DisConnect successfully.\n");

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_DVBT2_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{
    HI_FuncEnter();

    if(0 == u32Standby)
    {
        qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL0, 0xff);
        HI_PRINT("wake up\n");
    }
    else
    {
        qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL0, 0xf0);
        msleep(1);
        HI_PRINT("standby\n");
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

