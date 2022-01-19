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
#include <linux/delay.h>

#include "hiSDTV100.h"
#include "hiSDTV100_sat_core.h"
#include "hiSDTV100_config.h"
#include "hiSDTV100_hal.h"
#include "hiSDTV100_sat_info.h"
#include "hiSDTV100_mcu.h"
#include "drv_tuner_ioctl.h"
#include "drv_gpio_ext.h"
#include "drv_demod.h"
#include "av2011.h"
#include "av2018.h"
#include "RDA5815.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

//#define HISDTV100_SUPPORT_UNICABLE2
//#define HISDTV100_SUPPORT_DISEQC_RECV
#define DISEQC_BI_DIRECTION_REPEAT_TIMES        5
#define DISEQC_OUTPUT_PRINT

#ifdef DISEQC_OUTPUT_PRINT
#define HI_DISEQC_TRACE(...)         printk(__VA_ARGS__)
#else
#define HI_DISEQC_TRACE(...)
#endif

typedef struct tagSAT_CFG_ITEM_S
{
    HI_U16 u16TunerMaxLPF;
    HI_UNF_TUNER_IQSPECTRUM_MODE_E enIQSpectrum;
    HI_UNF_LNBCTRL_DEV_TYPE_E      enLNBCtrlDev;
} SAT_CFG_ITEM_S;

static SAT_CFG_ITEM_S s_stSatCfg = {0};

static HI_U32 hist_cnt, hist_fs[3200], hist_if[3200], hist_time[3200], hist_ok[3200], hist_num, low_cn_cnt, may_sfu, may_sfu_old, may_sfu_tmp;
static const HI_U8 u8SatMcuFirmwareTable[] = {0x02,0x05,0x5C,0xE4,0x90,0x10,0x03,0xF0,0xA3,0xF0,0xA3,0xF0,0x90,0x10,0x08,0xB1,
                       0x0D,0x00,0x00,0x00,0x00,0xE4,0x90,0x10,0x0E,0xF0,0xA3,0xF0,0xA3,0xF0,0xA3,0xF0,
                       0xA3,0xF0,0xA3,0xF0,0x90,0x10,0x16,0xF0,0xA3,0xF0,0x7F,0x57,0x91,0x69,0x90,0x10,
                       0x0C,0xEF,0xF0,0x44,0x80,0xA3,0xF0,0x90,0xFE,0x57,0xF0,0x7F,0x2C,0x91,0x69,0x90,
                       0x10,0x00,0xEF,0xF0,0x7F,0x2D,0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,0xE0,0xFF,0xC3,
                       0x13,0x54,0x07,0xFF,0x90,0x10,0x03,0xF0,0x90,0x10,0x00,0xE0,0xFE,0x13,0x13,0x13,
                       0x54,0x01,0x90,0x10,0x02,0xF0,0xEF,0x24,0xFC,0x50,0x0A,0x60,0x47,0x24,0xFD,0x70,
                       0x02,0x61,0x14,0x81,0x57,0x7F,0x52,0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,0x54,0xFE,
                       0x44,0x01,0xA3,0xF0,0x90,0xFE,0x52,0xF0,0x90,0xFE,0x65,0x74,0x86,0xF0,0x7F,0x61,
                       0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,0x54,0x0F,0x44,0x40,0xA3,0xF0,0x90,0xFE,0x61,
                       0xF0,0x90,0xFE,0x20,0x74,0xFF,0xF0,0x90,0xFE,0x58,0x74,0x80,0xF0,0xE4,0x90,0x10,
                       0x13,0xF0,0x81,0x57,0x90,0xFE,0x65,0x74,0x06,0xF0,0xE4,0x90,0x10,0x15,0xF0,0x90,
                       0x10,0x02,0xE0,0x64,0x01,0x60,0x02,0x41,0xD7,0x7F,0x61,0x91,0x69,0x90,0x10,0x0C,
                       0xEF,0xF0,0x54,0x0F,0x44,0x80,0xA3,0xF0,0x90,0xFE,0x61,0xF0,0x7F,0x5C,0x91,0x69,
                       0x90,0x10,0x14,0xEF,0xF0,0xE0,0xF9,0xC4,0x13,0x13,0x13,0x54,0x01,0x90,0x10,0x01,
                       0xF0,0x64,0x01,0x70,0x6B,0xE9,0xC3,0x94,0x84,0x40,0x0A,0xE9,0xD3,0x94,0x89,0x50,
                       0x04,0x7F,0x01,0x80,0x02,0x7F,0x00,0x90,0x10,0x0F,0xEF,0xF0,0xE9,0xC3,0x94,0x8E,
                       0x40,0x0A,0xE9,0xD3,0x94,0x93,0x50,0x04,0x7F,0x01,0x80,0x02,0x7F,0x00,0x90,0x10,
                       0x0E,0xEF,0xF0,0xE9,0xC3,0x94,0x94,0x40,0x0A,0xE9,0xD3,0x94,0xAD,0x50,0x04,0x7F,
                       0x01,0x80,0x02,0x7F,0x00,0x90,0x10,0x10,0xEF,0xF0,0xE9,0xC3,0x94,0x8A,0x40,0x0D,
                       0x90,0x10,0x14,0xE0,0xD3,0x94,0x8D,0x50,0x04,0x7F,0x01,0x80,0x02,0x7F,0x00,0x90,
                       0x10,0x11,0xEF,0xF0,0x90,0x10,0x14,0xE0,0x54,0x01,0x90,0x10,0x12,0xF0,0x80,0x55,
                       0x90,0x10,0x14,0xE0,0xFF,0xC3,0x94,0x04,0x40,0x0A,0xEF,0xD3,0x94,0x2F,0x50,0x04,
                       0x7F,0x01,0x80,0x02,0x7F,0x00,0x90,0x10,0x0F,0xEF,0xF0,0x90,0x10,0x14,0xE0,0xFF,
                       0xC3,0x94,0x30,0x40,0x0A,0xEF,0xD3,0x94,0x47,0x50,0x04,0x7E,0x01,0x80,0x02,0x7E,
                       0x00,0x90,0x10,0x0E,0xEE,0xF0,0xEF,0xC3,0x94,0x48,0x40,0x0A,0xEF,0xD3,0x94,0x5F,
                       0x50,0x04,0x7E,0x01,0x80,0x02,0x7E,0x00,0x90,0x10,0x10,0xEE,0xF0,0xE4,0xA3,0xF0,
                       0xEF,0x54,0x01,0xA3,0xF0,0x90,0x10,0x01,0xE0,0x70,0x57,0x90,0x10,0x0E,0xE0,0xFF,
                       0x64,0x01,0x60,0x08,0x90,0x10,0x10,0xE0,0x64,0x01,0x70,0x46,0x90,0x10,0x0F,0xE0,
                       0x64,0x01,0x60,0x04,0xEF,0xB4,0x01,0x08,0x90,0x10,0x0D,0x74,0x3F,0xF0,0x80,0x20,
                       0x90,0x10,0x10,0xE0,0xB4,0x01,0x13,0x90,0x10,0x12,0xE0,0x60,0x04,0x7F,0x3F,0x80,
                       0x02,0x7F,0x33,0x90,0x10,0x0D,0xEF,0xF0,0x80,0x06,0x90,0x10,0x0D,0x74,0x5C,0xF0,
                       0x12,0x04,0x5F,0x90,0x10,0x0C,0xEF,0xF0,0x54,0xFE,0xA3,0xF0,0x90,0xFE,0x52,0xF0,
                       0x80,0x73,0x90,0x10,0x01,0xE0,0x64,0x01,0x70,0x6B,0x90,0x10,0x0E,0xE0,0xFF,0x64,
                       0x01,0x60,0x08,0x90,0x10,0x10,0xE0,0x64,0x01,0x70,0x5A,0x90,0x10,0x0F,0xE0,0x64,
                       0x01,0x60,0x04,0xEF,0xB4,0x01,0x08,0x90,0x10,0x0D,0x74,0x3F,0xF0,0x80,0x36,0x90,
                       0x10,0x11,0xE0,0xB4,0x01,0x1A,0x90,0x10,0x14,0xE0,0xFF,0x64,0x8A,0x60,0x04,0xEF,
                       0xB4,0x8B,0x04,0x7F,0x0F,0x80,0x02,0x7F,0x3F,0x90,0x10,0x0D,0xEF,0xF0,0x80,0x15,
                       0x90,0x10,0x10,0xE0,0xB4,0x01,0x08,0x90,0x10,0x0D,0x74,0x32,0xF0,0x80,0x06,0x90,
                       0x10,0x0D,0x74,0x4F,0xF0,0x12,0x04,0x5F,0x90,0x10,0x0C,0xEF,0xF0,0x54,0xFE,0xA3,
                       0xF0,0x90,0xFE,0x52,0xF0,0x7F,0x5B,0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,0x54,0xC0,
                       0xFF,0x64,0x80,0x70,0x55,0x90,0x10,0x13,0xE0,0x70,0x4F,0x90,0x10,0x0E,0xE0,0x64,
                       0x01,0x60,0x06,0xA3,0xE0,0x64,0x01,0x70,0x41,0x7F,0x20,0x91,0x69,0x90,0x10,0x0C,
                       0xEF,0xF0,0x54,0xEF,0xA3,0xF0,0x90,0xFE,0x20,0x74,0xEF,0xF0,0x7F,0x20,0x91,0x69,
                       0x90,0x10,0x0C,0xEF,0xF0,0x54,0xEF,0x44,0x10,0xA3,0xF0,0x90,0xFE,0x20,0xF0,0x90,
                       0x10,0x13,0x74,0x01,0xF0,0x80,0x13,0x7F,0x61,0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,
                       0x54,0x0F,0x44,0x40,0xA3,0xF0,0x90,0xFE,0x61,0xF0,0x90,0x10,0x02,0xE0,0xB4,0x01,
                       0x17,0x90,0x10,0x0F,0xE0,0x60,0x04,0x7F,0x60,0x80,0x02,0x7F,0x80,0x90,0x10,0x0D,
                       0xEF,0xF0,0x90,0xFE,0x58,0xF0,0x81,0x57,0x90,0x10,0x0D,0x74,0x60,0xF0,0x90,0xFE,
                       0x58,0xF0,0x81,0x57,0x90,0x10,0x15,0xE0,0x70,0x1F,0x7F,0x52,0x91,0x69,0x90,0x10,
                       0x0C,0xEF,0xF0,0x54,0xFE,0x44,0x01,0xA3,0xF0,0x90,0xFE,0x52,0xF0,0x90,0xFE,0x65,
                       0x74,0x86,0xF0,0x90,0x10,0x15,0x74,0x01,0xF0,0x7F,0x7E,0x91,0x69,0x90,0x10,0x0C,
                       0xEF,0xF0,0x90,0x10,0x04,0xF0,0x7F,0x7F,0x91,0x69,0x90,0x10,0x0C,0xEF,0xF0,0x54,
                       0x7F,0xF0,0x90,0x10,0x05,0xF0,0xE0,0xFD,0xA3,0xE4,0xF0,0xA3,0xED,0xF0,0xFE,0x90,
                       0x10,0x04,0xE0,0xFD,0xEE,0x90,0x10,0x06,0xF0,0xED,0xA3,0xF0,0xA3,0xE0,0xFC,0xA3,
                       0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,0xE0,0xFF,0x78,0x07,0x91,0xEE,0xA8,0x04,0xA9,0x05,
                       0xAA,0x06,0xAB,0x07,0x90,0x10,0x08,0xE0,0xFC,0xA3,0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,
                       0xE0,0xC3,0x9B,0xFB,0xEE,0x9A,0xFA,0xED,0x99,0xF9,0xEC,0x98,0xF8,0x90,0x10,0x06,
                       0xE0,0xFE,0xA3,0xE0,0xFF,0xE4,0xFC,0xFD,0xEB,0x2F,0xFF,0xEA,0x3E,0xFE,0xED,0x39,
                       0xFD,0xEC,0x38,0xFC,0xA3,0xB1,0x01,0x7F,0x03,0x91,0x69,0x90,0x10,0x17,0xEF,0xF0,
                       0x70,0x41,0x90,0x10,0x08,0xE0,0xFC,0xA3,0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,0xE0,0xFF,
                       0x78,0x07,0x91,0xEE,0xEF,0xE4,0x90,0x10,0x0D,0xEF,0xF0,0x90,0xFE,0x04,0xF0,0x90,
                       0x10,0x08,0xE0,0xFC,0xA3,0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,0xE0,0xFF,0x78,0x0F,0x91,
                       0xEE,0xEF,0xE4,0x90,0x10,0x0D,0xEF,0xF0,0x90,0xFE,0x05,0xF0,0xE4,0x90,0x10,0x16,
                       0xF0,0x80,0x54,0x90,0x10,0x16,0xE0,0xFF,0xB4,0x50,0x06,0x7E,0x00,0x7F,0x00,0x80,
                       0x03,0xEF,0x04,0xFF,0x90,0x10,0x16,0xEF,0xF0,0x64,0x50,0x70,0x3A,0x90,0x10,0x08,
                       0xE0,0xFC,0xA3,0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,0xE0,0xFF,0x78,0x07,0x91,0xEE,0xEF,
                       0xE4,0x90,0x10,0x0D,0xEF,0xF0,0x90,0xFE,0x04,0xF0,0x90,0x10,0x08,0xE0,0xFC,0xA3,
                       0xE0,0xFD,0xA3,0xE0,0xFE,0xA3,0xE0,0xFF,0x78,0x0F,0x91,0xEE,0xEF,0xE4,0x90,0x10,
                       0x0D,0xEF,0xF0,0x90,0xFE,0x05,0xF0,0x7F,0x01,0x7E,0x00,0xB1,0x3E,0x01,0x3B,0x90,
                       0x10,0x0D,0xE0,0x90,0xFE,0x59,0xF0,0x7F,0x52,0x90,0x10,0x18,0xEF,0xF0,0xE4,0xA3,
                       0xF0,0x90,0x10,0x18,0xE0,0x24,0x00,0xFF,0xE4,0x34,0xFE,0x8F,0x82,0xF5,0x83,0xE0,
                       0x90,0x10,0x1A,0xF0,0x90,0x10,0x19,0x74,0x01,0xF0,0x90,0x10,0x18,0xE0,0x24,0x00,
                       0xFF,0xE4,0x34,0xFE,0x8F,0x82,0xF5,0x83,0xE0,0xFF,0x90,0x10,0x19,0xE0,0xFE,0x24,
                       0x1A,0xF5,0x82,0xE4,0x34,0x10,0xF5,0x83,0xEF,0xF0,0xEE,0xB4,0x01,0x0C,0x90,0x10,
                       0x1A,0xE0,0xFD,0xA3,0xE0,0xFF,0x6D,0x70,0x22,0x22,0xEE,0xB4,0x02,0x17,0x90,0x10,
                       0x1A,0xE0,0xFE,0x90,0x10,0x1C,0xE0,0xFF,0x6E,0x60,0x22,0x90,0x10,0x1B,0xE0,0xFE,
                       0xEF,0xB5,0x06,0x07,0x22,0x90,0x10,0x1D,0xE0,0xFF,0x22,0x7F,0x01,0x7E,0x00,0xB1,
                       0x3E,0x90,0x10,0x19,0xE0,0x04,0xF0,0xE0,0xC3,0x94,0x04,0x40,0x9D,0x22,0xE8,0x60,
                       0x0F,0xEC,0xC3,0x13,0xFC,0xED,0x13,0xFD,0xEE,0x13,0xFE,0xEF,0x13,0xFF,0xD8,0xF1,
                       0x22,0xEC,0xF0,0xA3,0xED,0xF0,0xA3,0xEE,0xF0,0xA3,0xEF,0xF0,0x22,0xA8,0x82,0x85,
                       0x83,0xF0,0xD0,0x83,0xD0,0x82,0x12,0x05,0x24,0x12,0x05,0x24,0x12,0x05,0x24,0x12,
                       0x05,0x24,0xE4,0x73,0xE4,0x93,0xA3,0xC5,0x83,0xC5,0xF0,0xC5,0x83,0xC8,0xC5,0x82,
                       0xC8,0xF0,0xA3,0xC5,0x83,0xC5,0xF0,0xC5,0x83,0xC8,0xC5,0x82,0xC8,0x22,0xEF,0x1F,
                       0xAA,0x06,0x70,0x01,0x1E,0x4A,0x60,0x13,0xE4,0xFC,0xFD,0xC3,0xED,0x94,0x7D,0xEC,
                       0x94,0x00,0x50,0xEA,0x0D,0xBD,0x00,0x01,0x0C,0x80,0xF0,0x22,0x78,0x7F,0xE4,0xF6,
                       0xD8,0xFD,0x75,0x81,0x07,0x02,0x05,0x68,0x11,0x03,0x7E,0x00,0x7F,0x00,0x22};

static HI_VOID Sat_HotReset(HI_U32 u32TunerPort)
{
    U_MDTV_RESET unReset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, SAT_RSTN_CTRL, &(unReset.u8));
    unReset.bits.hot_reset = 0x0;
    qam_write_byte(u32TunerPort, SAT_RSTN_CTRL, unReset.u8);

    tuner_mdelay(1);

    qam_read_byte(u32TunerPort, SAT_RSTN_CTRL , &(unReset.u8));
    unReset.bits.hot_reset = 0x1;
    qam_write_byte(u32TunerPort, SAT_RSTN_CTRL, unReset.u8);

    HI_FuncExit();
}

static HI_S32 Sat_ClkCfg(HI_U32 u32TunerPort)
{
    HI_U32 u32DemodClk = 0;
    HI_U32 u32FecClk = 0;
    HI_U8 u8RegVal = 0;
#ifndef HI_FPGA_SUPPORT
    volatile U_PERI_CRG57 demod_crg;
#endif

    HI_FuncEnter();

#ifdef HI_FPGA_SUPPORT
    u32DemodClk    = 44907;
    u32FecClk = 60000;
#else
    HI_DBG_PrintH32(g_pstRegCrg->PERI_CRG57.u32);
    demod_crg.u32 = g_pstRegCrg->PERI_CRG57.u32;
    HI_DBG_PrintU32(demod_crg.bits.adc_s_clk_sel);
    if (demod_crg.bits.adc_s_clk_sel)
    {
        u32DemodClk    = 150000;
    }
    else
    {
        u32DemodClk    = 135000;
    }
    u32FecClk = 240000;
#endif

    /* demod clk */
    HI_DBG_PrintU32(u32DemodClk);
    qam_write_byte(u32TunerPort, SAT_DEMO_FREQ_L, (u32DemodClk & 0xFF));
    qam_write_byte(u32TunerPort, SAT_DEMO_FREQ_M, (u32DemodClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, SAT_DEMO_FREQ_H, (u32DemodClk>>16) & 0x03);

    /* fec clk */
    HI_DBG_PrintU32(u32FecClk);
    qam_write_byte(u32TunerPort, SAT_FEC_FREQ_L, (u32FecClk & 0xFF));
    qam_write_byte(u32TunerPort, SAT_FEC_FREQ_M, (u32FecClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, SAT_FEC_FREQ_H, (u32FecClk>>16) & 0x03);

    /* clk_sel */
    qam_read_byte(u32TunerPort, SAT_CLK_SEL, &u8RegVal);
    u8RegVal &= ~(0x1f<<3);
    u8RegVal |= 0x11<<3;
    qam_write_byte(u32TunerPort, SAT_CLK_SEL, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 Sat_SetSymRate(HI_U32 u32TunerPort, HI_U32 u32SymRate)  /* u32SymRate unit hz */
{
    HI_U8 u8RegVal = 0;
    HI_U16 u16CenterShiftValue = 0;

    HI_FuncEnter();
    HI_DBG_PrintU32(u32SymRate);

    if(0 == u32SymRate)
    {
        LOG_PrintInfo("u32SymRate:0.\n");
        HI_FuncExit();
        return HI_SUCCESS;
    }

    if(u32SymRate >= 6000000)
    {
        qam_read_byte(u32TunerPort, SAT_TS_CTRL4,&u8RegVal);
        u8RegVal |=1<<6;
        qam_write_byte(u32TunerPort, SAT_TS_CTRL4,u8RegVal);
    }
    else
    {
        qam_read_byte(u32TunerPort, SAT_TS_CTRL4,&u8RegVal);
        u8RegVal &=0x80;
        u8RegVal +=31;
        qam_write_byte(u32TunerPort, SAT_TS_CTRL4,u8RegVal);
        u8RegVal = 0;
        qam_write_byte(u32TunerPort, SAT_TS_CLK_DIV_F_L,u8RegVal);
        qam_write_byte(u32TunerPort, SAT_TS_CLK_DIV_F_H,u8RegVal);
    }

    /* config symbol rate */
    u32SymRate = (u32SymRate / 1000) & 0x1ffff;
    qam_write_byte(u32TunerPort, SAT_FS_L, (HI_U8)(u32SymRate & 0xff));
    qam_write_byte(u32TunerPort, SAT_FS_M, (HI_U8)((u32SymRate & 0xff00) >> 8));
    qam_read_byte(u32TunerPort, SAT_FS_H,&u8RegVal);
    u8RegVal &= 0xFE;
    u8RegVal |= (HI_U8)((u32SymRate & 0x10000) >> 16);
    qam_write_byte(u32TunerPort, SAT_FS_H, u8RegVal);

    if(u32SymRate <= 5000)
    {
        u16CenterShiftValue = 4000;
    }
    HI_DBG_PrintU32(u16CenterShiftValue);

    /* There is a small carrier frequency drift, symbol rate tracking speed is not fast enough, leading to occasional loss of lock */
    /* 0x54[7:5]=3->7 */
    qam_read_byte(u32TunerPort, SAT_SCAN_STEP_FB, &u8RegVal);
    if(u32SymRate <= 5000)
    {
        u8RegVal &= 0x0f;
        u8RegVal |= 0x70;
    }
    else
    {
        u8RegVal &= 0x0f;
        u8RegVal |= 0x30;
    }
    qam_write_byte(u32TunerPort, SAT_SCAN_STEP_FB, u8RegVal);

    if(u32SymRate <= 3500)
    {
        /* symbrate <=3.5Mhz,max blindscan carrier error set 3MHz */
        qam_read_byte(u32TunerPort, SAT_CBS_FC_CTRL, &u8RegVal);
        u8RegVal &= 0x3F;
        qam_write_byte(u32TunerPort, SAT_CBS_FC_CTRL, u8RegVal);
    }
    else
    {
        /* symbrate >3.5Mhz,max blindscan carrier error set 5MHz */
        qam_read_byte(u32TunerPort, SAT_CBS_FC_CTRL, &u8RegVal);
        u8RegVal &= 0x3F;
        u8RegVal |= (0x2 << 6);
        qam_write_byte(u32TunerPort, SAT_CBS_FC_CTRL, u8RegVal);
    }

    qam_write_byte(u32TunerPort, SAT_CENT_FREQ_L, (HI_U8)(u16CenterShiftValue&0xff));
    qam_write_byte(u32TunerPort, SAT_CENT_FREQ_H, (HI_U8)((u16CenterShiftValue>>8)&0xff));

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_VOID Sat_VcmTsClk(HI_U32 u32TunerPort, HI_U32 u32Fs)
{
    HI_U8 u8RegVal = 0, u8FecL = 0,u8FecM = 0,u8FecH = 0;
    HI_U32 u32FecClk=0,u32ClkRatio=0;
    HI_U8 u8IsCCM = 0, u8IsSyncOK = 0, u8IsiNum = 0;

    HI_FuncEnter();
    HI_DBG_PrintU32(u32Fs);

    qam_read_bit(u32TunerPort, SAT_TS_CTRL3, 7, &u8IsCCM);//read bit7=0 mean vcm
    qam_read_bit(u32TunerPort, SAT_CR_STATE, 0, &u8IsSyncOK);//read bit0=1 mean sync ok

    qam_read_byte(u32TunerPort, SAT_ISI_NUM, &u8RegVal);
    u8IsiNum = u8RegVal & 0x3f;

    if((!u8IsCCM && u8IsSyncOK) || (u8IsiNum > 1))
    {
        qam_read_byte(u32TunerPort, SAT_FEC_FREQ_L,&u8FecL);
        qam_read_byte(u32TunerPort, SAT_FEC_FREQ_M,&u8FecM);
        qam_read_byte(u32TunerPort, SAT_FEC_FREQ_H,&u8FecH);
        u32FecClk = u8FecL + u8FecM*256 + u8FecH*65536;

        u32ClkRatio = u32FecClk*8*256/((u32Fs/1000*5)>118000?118000:(u32Fs/1000*5));
        qam_read_byte(u32TunerPort, SAT_TS_CTRL4,&u8RegVal);
        u8RegVal &= 0xC0;
        u8RegVal |= ((u32ClkRatio /256)>31)?31:(u32ClkRatio /256);
        qam_write_byte(u32TunerPort, SAT_TS_CTRL4,u8RegVal);

        qam_write_byte(u32TunerPort, SAT_TS_CLK_DIV_F_H,(HI_U8)(u32ClkRatio % 256));

        Sat_HotReset(u32TunerPort);
    }

    HI_FuncExit();
    return;
}

static HI_S32 Sat_SetPf(HI_U32 u32TunerPort, HI_U32 u32SymbolRate/*KHz*/)
{
    HI_U32 u32LPFKHz;

    HI_FuncEnter();

    //u32LPFKHz = (u32SymbolRate * 75 / 10000000 + 40) * 100;
    u32LPFKHz = u32SymbolRate;

    HI_DBG_PrintU32(s_stSatCfg.u16TunerMaxLPF);

    if (u32LPFKHz >= s_stSatCfg.u16TunerMaxLPF * 1000)
    {
        u32LPFKHz = s_stSatCfg.u16TunerMaxLPF * 1000;
    }
    switch(g_stTunerOps[u32TunerPort].enTunerDevType)
    {
#if defined(TUNER_DEV_TYPE_AV2011)
        case HI_UNF_TUNER_DEV_TYPE_AV2011:
            av2011_set_lpf(u32TunerPort, u32LPFKHz);
            break;
#endif
#if defined(TUNER_DEV_TYPE_AV2018)
        case HI_UNF_TUNER_DEV_TYPE_AV2018:
            av2018_set_lpf(u32TunerPort, u32LPFKHz);
            break;
#endif
        default:
            break;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_Init(HI_U32 u32TunerPort, HI_U8 u8I2cChannel, HI_UNF_TUNER_DEV_TYPE_E enTunerType)
{
    HI_S32 s32Ret = HI_SUCCESS;
    U_HiDTV200_MOD_CTRL unModCtrl;
    U_ADC_AGC_CTRL unAdcAgcCtrl;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();

    /* choose mod: 0-dtmb/1-dvbt/2-dvbc/3-j83b/4-atsc/5-isdbt/6-dvbs */
    qam_read_byte(u32TunerPort, SAT_CHN_SEL, &(unModCtrl.u8));
    unModCtrl.bits.mode = 0x6;
    qam_write_byte(u32TunerPort, SAT_CHN_SEL, unModCtrl.u8);
    HI_DBG_PrintReg8(SAT_CHN_SEL, unModCtrl.u8);

#ifndef HI_FPGA_SUPPORT
    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_MCU_LoadFirmware(u32TunerPort, u8SatMcuFirmwareTable,
                                             sizeof(u8SatMcuFirmwareTable)/sizeof(u8SatMcuFirmwareTable[0])));
    RESET_MCU(u32TunerPort);
#endif

    HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_ClkCfg(u32TunerPort));

    /* ADC/AGC ctrl */
    qam_read_byte(u32TunerPort, SAT_AGC_CTRL, &(unAdcAgcCtrl.u8));
    unAdcAgcCtrl.bits.c_adc_twos  = 0x1; //complement
    unAdcAgcCtrl.bits.c_iq_swap   = 0x0; //IQ normal
    qam_write_byte(u32TunerPort, SAT_AGC_CTRL, unAdcAgcCtrl.u8);
    HI_DBG_PrintReg8(SAT_AGC_CTRL, unAdcAgcCtrl.u8);

    qam_write_byte(u32TunerPort, SAT_AGC_GOAL, 0x1c);

    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, 0x7);

#ifdef HI_FPGA_SUPPORT
    qam_write_bit(u32TunerPort, SAT_AGC_CTRL, 3, 1);
#endif

    qam_read_byte(u32TunerPort, SAT_CBS_TH_1, &u8RegVal);
    u8RegVal &= ~(0x3F<<0);
    u8RegVal |= 0x1C;
    qam_write_byte(u32TunerPort, SAT_CBS_TH_1, u8RegVal);

#if defined(TUNER_DEV_TYPE_RDA5815)
    RDA5815_init_tuner(u32TunerPort);
#endif

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SetScramble(HI_U32 u32TunerPort, HI_U32 u32ScrambleN)
{
    HI_U8  u8RegVal = 0;
    HI_U32 i = 0, u32New = 0;
    HI_U8 u8Bit0Value = 0, u8Bit7Value = 0;
    HI_U32 u32ScrambleCode = 1;

    HI_FuncEnter();
    HI_DBG_PrintU32(u32ScrambleN);

    for(i = 0; i < u32ScrambleN; i++)
    {
        u8Bit0Value = u32ScrambleCode & 0x1;
        u8Bit7Value = (u32ScrambleCode >> 7) & 0x1;
        u32New = (u8Bit0Value + u8Bit7Value) % 2;
        u32ScrambleCode = (u32ScrambleCode >> 1) | (u32New << 17);
    }

    HI_DBG_PrintU32(u32ScrambleCode);

    u8RegVal = u32ScrambleCode & 0xff;
    qam_write_byte(u32TunerPort, SAT_XREG_INIT_LOW,u8RegVal);

    u8RegVal = (u32ScrambleCode >> 8) & 0xff;
    qam_write_byte(u32TunerPort, SAT_XREG_INIT_MID,u8RegVal);

    qam_read_byte(u32TunerPort, SAT_XREG_INIT_HI,&u8RegVal);
    u8RegVal = u8RegVal & 0xfc;
    u8RegVal = u8RegVal | ((u32ScrambleCode >> 16) & 0x3);
    qam_write_byte(u32TunerPort, SAT_XREG_INIT_HI,u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_LockTpBs(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pTp)
{
    HI_U8  i = 0, u8TpNum = 0, u8RegVal = 0, u8RegValL = 0, u8RegValH = 0, u8FsGrade = 0, u8OldBwMax = 0, u8ReliablityMax = 0, u8Reliablity = 0;
    HI_U8 u8FsMSB = 0;
    HI_U32 u32FsCur = 0, u32CbsFs = 0, u32TimeCnt = 0, u32FecOkWait = 0, u32LPFKHz;
    HI_S16 s16FcTrue = 0, s16CbsFc = 0, s16CenterShiftKHz = 0;
    HI_U16 u16FcTrue = 0;
    HI_S32  s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pTp);

    /* cfg to first isi stream to output */
    qam_read_byte(u32TunerPort, SAT_TS_CTRL4, &u8RegVal);
    u8RegVal = u8RegVal & 0x7F;
    qam_write_byte(u32TunerPort, SAT_TS_CTRL4, u8RegVal);

    /* restore carrier recovery max bandwith */
    qam_read_byte(u32TunerPort, SAT_CR_BW_MAX, &u8OldBwMax);
    qam_write_byte(u32TunerPort, SAT_CR_BW_MAX, 0x12);

    qam_write_byte(u32TunerPort, SAT_FEC_CTRL_S2, 0x14);

    /* close self reset */
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, 0x3);
    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0xff);

    /* cfg fs */
    u32FsCur = pTp->unSRBW.u32SymbolRate;
    /* u8FsGrade,unit Hz */
    if (u32FsCur< 2000000)
    {
        u8FsGrade=0;
    }
    else if (u32FsCur>=2000000 && u32FsCur<3000000)
    {
        u8FsGrade=1;
    }
    else if (u32FsCur>=3000000 && u32FsCur<4900000)
    {
        u8FsGrade=2;
    }
    else if (u32FsCur>=4900000 && u32FsCur<8000000)
    {
        u8FsGrade=3;
    }
    else if (u32FsCur>=8000000 && u32FsCur<15000000)
    {
        u8FsGrade=4;
    }
    else
    {
        u8FsGrade=5;
    }
    Sat_SetSymRate(u32TunerPort, u32FsCur);

    /* read cent freq */
    qam_read_byte(u32TunerPort, SAT_CENT_FREQ_L, &u8RegValL);
    qam_read_byte(u32TunerPort, SAT_CENT_FREQ_H, &u8RegValH);
    s16FcTrue = (HI_S16) (u8RegValL + (u8RegValH<<8));
    s16CenterShiftKHz = (HI_UNF_TUNER_IQSPECTRUM_INVERT == s_stSatCfg.enIQSpectrum)?(-s16FcTrue):(s16FcTrue);

    if(HI_UNF_TUNER_IQSPECTRUM_INVERT == s_stSatCfg.enIQSpectrum)
    {
        LOG_PrintDebug("enIQSpectrum:IQ invert\n");
    }
    else
    {
        LOG_PrintDebug("enIQSpectrum:IQ normal\n");
    }

    if (HI_UNF_TUNER_DEV_TYPE_RDA5815 == g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32SymbolRate = u32FsCur;
    }
    else
    {
        u32LPFKHz = u32FsCur/10*7/1000 +abs(s16CenterShiftKHz)+5000;
        u32LPFKHz = u32LPFKHz * 75 / 100 + 4000;
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_SetPf(u32TunerPort, u32LPFKHz));
    }

    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel, pTp->u32Frequency - s16CenterShiftKHz));

    tuner_mdelay(2);

    /* bs with symbrate known */
    qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0xc0);
    Sat_HotReset(u32TunerPort);

    /* wait cbs finish */
    u32TimeCnt = 0;
    do
    {
        tuner_mdelay(2);
        u32TimeCnt += 2;
        qam_read_bit(u32TunerPort, SAT_CBS_FINISH, 0, &u8RegVal);
    }
#ifdef HI_FPGA_SUPPORT
    while(!u8RegVal && u32TimeCnt < 600);
#else
    while(!u8RegVal && u32TimeCnt < 300);
#endif
    HI_DBG_PrintReg8(SAT_CBS_FINISH, u8RegVal);

    /* calc bs tp num */
    u8TpNum = 0;
    if(u8RegVal)
    {
        qam_read_byte(u32TunerPort, SAT_CBS_R2_NUM, &u8RegVal);
        u8TpNum = u8RegVal & 0x3f;
    }

    if(u8TpNum > 0)
    {
        u8ReliablityMax = 0;
        qam_read_byte(u32TunerPort, SAT_CBS_CTRL_REG, &u8RegVal);

        /* calc max reliability */
        for(i = 0; i < u8TpNum; i++)
        {
            qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, (u8RegVal & 0xc0) | i);
            qam_read_byte(u32TunerPort, SAT_CBS_RELIABILITY1, &u8Reliablity);

            if(u8Reliablity > u8ReliablityMax)
            {
                u8ReliablityMax = u8Reliablity;
                /* fc,unit:kHz */
                qam_read_byte(u32TunerPort, SAT_CBS_FC_L, &u8RegValL);
                qam_read_byte(u32TunerPort, SAT_CBS_FC_H, &u8RegValH);
                s16CbsFc = (HI_S16)(u8RegValL + (u8RegValH << 8));

                /* fs,unit:kHz */
                qam_read_byte(u32TunerPort, SAT_CBS_FS_L, &u8RegValL);
                qam_read_byte(u32TunerPort, SAT_CBS_FS_H, &u8RegValH);
                qam_read_byte(u32TunerPort, SAT_CBS_FS_MSB, &u8FsMSB);
                u8FsMSB = (u8FsMSB&(0x1<<7))?1:0;
                u32CbsFs = u8RegValL + (u8RegValH<<8) + (u8FsMSB<<16);
            }
        }

        /* config fs to reg */
        Sat_SetSymRate(u32TunerPort, u32CbsFs * 1000);

        /* config fc to reg */
        s16FcTrue += s16CbsFc;
        HI_DBG_PrintU32(s16FcTrue);

        u16FcTrue = (HI_U16)s16FcTrue;
        qam_write_byte(u32TunerPort, SAT_CENT_FREQ_L, u16FcTrue & 0xff);
        qam_write_byte(u32TunerPort, SAT_CENT_FREQ_H, (u16FcTrue>>8) & 0xff);

        /* close bs and write addr to zero */
        qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x00);

        tuner_mdelay(10);
        Sat_HotReset(u32TunerPort);

        /* wait fec ok */
        u32FecOkWait = (320 - u8FsGrade * 20) * 2 + 600;
        u32TimeCnt = 0;
        do
        {
            tuner_mdelay(2);
            u32TimeCnt += 2;
            qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 5, &u8RegVal);
        } while(!u8RegVal && (u32TimeCnt < u32FecOkWait));

        HI_DBG_PrintReg8(SAT_LOCK_FLAG, u8RegVal);
    }
    else
    {
        /* close bs and write addr to zero */
        qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x00);
        Sat_HotReset(u32TunerPort);
    }

    if (u8RegVal)
    {
        Sat_VcmTsClk(u32TunerPort, u32FsCur);
    }

    qam_write_byte(u32TunerPort, SAT_CR_BW_MAX, u8OldBwMax);

    /* open self reset */
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, 0x7);
    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0x1b);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_DBG_PrintU32(pstChannel->u32Frequency);
    HI_DBG_PrintU32(pstChannel->unSRBW.u32SymbolRate);
    HI_DBG_PrintU32(pstChannel->u32ScrambleValue);

    START_MCU(u32TunerPort);

    Sat_HotReset(u32TunerPort);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_SetScramble(u32TunerPort, pstChannel->u32ScrambleValue));

    HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_LockTpBs(u32TunerPort, pstChannel));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_DeInit(HI_U32 u32TunerPort)
{

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SetSatAttr(HI_U32 u32TunerPort, HI_UNF_TUNER_SAT_ATTR_S *pstSatTunerAttr)
{
    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstSatTunerAttr);

    /*print frontend attr info*/
    HI_DBG_PrintU32(pstSatTunerAttr->u32DemodClk);
    HI_DBG_PrintU32(pstSatTunerAttr->u16TunerMaxLPF);
    HI_DBG_PrintU32(pstSatTunerAttr->u16TunerI2CClk);
    HI_DBG_PrintU32(pstSatTunerAttr->enRFAGC);
    HI_DBG_PrintU32(pstSatTunerAttr->enIQSpectrum);
    HI_DBG_PrintU32(pstSatTunerAttr->enTSClkPolar);
    HI_DBG_PrintU32(pstSatTunerAttr->enTSFormat);
    HI_DBG_PrintU32(pstSatTunerAttr->enTSSerialPIN);
    HI_DBG_PrintU32(pstSatTunerAttr->enDiSEqCWave);
    HI_DBG_PrintU32(pstSatTunerAttr->enLNBCtrlDev);
    HI_DBG_PrintU32(pstSatTunerAttr->u16LNBDevAddress);

    switch (pstSatTunerAttr->enRFAGC)
    {
        case HI_UNF_TUNER_RFAGC_NORMAL:
            qam_write_bit(u32TunerPort, SAT_AGC_CTRL, 1, 0);
            LOG_PrintInfo("PDM normal.\n");
            break;
        case HI_UNF_TUNER_RFAGC_INVERT:
        default:
            qam_write_bit(u32TunerPort, SAT_AGC_CTRL, 1, 1);
            LOG_PrintInfo("PDM invert.\n");
            break;
    }
    s_stSatCfg.enIQSpectrum = pstSatTunerAttr->enIQSpectrum;
    s_stSatCfg.u16TunerMaxLPF = pstSatTunerAttr->u16TunerMaxLPF;
    s_stSatCfg.enLNBCtrlDev = pstSatTunerAttr->enLNBCtrlDev;

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SetLnbOut(HI_U32 u32TunerPort, TUNER_LNB_OUT_E enOut)
{
#define HI_LNB_EN_GPIO_NO       40
#define HI_LNB_HV_SEL_GPIO_NO   38

    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_DBG_PrintU32(enOut);

    switch(s_stSatCfg.enLNBCtrlDev)
    {
        case HI_UNF_LNBCTRL_DEV_TYPE_MPS8125:
            switch (enOut)
            {
                case TUNER_LNB_OUT_13V:
                case TUNER_LNB_OUT_14V:
                    s32Ret  = HI_DRV_GPIO_SetDirBit(HI_LNB_EN_GPIO_NO, HI_FALSE);
                    s32Ret |= HI_DRV_GPIO_SetDirBit(HI_LNB_HV_SEL_GPIO_NO, HI_FALSE);
                    s32Ret |= HI_DRV_GPIO_WriteBit(HI_LNB_HV_SEL_GPIO_NO, 0);
                    //printk("<--TUNER_LNB_OUT_13V.\n");
                    break;
                case TUNER_LNB_OUT_18V:
                case TUNER_LNB_OUT_19V:
                    s32Ret  = HI_DRV_GPIO_SetDirBit(HI_LNB_EN_GPIO_NO, HI_FALSE);
                    s32Ret |= HI_DRV_GPIO_SetDirBit(HI_LNB_HV_SEL_GPIO_NO, HI_FALSE);
                    s32Ret |= HI_DRV_GPIO_WriteBit(HI_LNB_HV_SEL_GPIO_NO, 1);
                    //printk("<--TUNER_LNB_OUT_18V.\n");
                    break;
                case TUNER_LNB_OUT_0V:
                /* now jump to TUNER_LNB_OUT_BUTT */
                case TUNER_LNB_OUT_BUTT:
                /* now jump to default */
                default:
                    HI_WARN_PrintU32(enOut);
                    HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_PARA);
                    return HI_ERR_TUNER_INVALID_PARA;
            }
            break;
        default:
            break;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 HiSDTV100_Sat_GetDemodClk(HI_U32 u32TunerPort, HI_U32 *pu32DemodClk)
{
    HI_U8 u8ClkL=0,u8ClkM=0,u8ClkH=0;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_L, &u8ClkL);
    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_M, &u8ClkM);
    qam_read_byte(u32TunerPort, SAT_DEMO_FREQ_H, &u8ClkH);

    *pu32DemodClk = ((u8ClkH&0x3)<<16) + (u8ClkM<<8) + u8ClkL;
    HI_DBG_PrintU32(*pu32DemodClk);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SendContinuous22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U16  u16DiseqcRatio = 0;
    HI_U32 u32DemodClk = 0;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_DBG_PrintU32(u32Continuous22K);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetDemodClk(u32TunerPort, &u32DemodClk));

    u16DiseqcRatio = (HI_U16)((u32DemodClk / 22) & 0xffff);
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_L, (HI_U8)(u16DiseqcRatio & 0xff));
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_H, (HI_U8)((u16DiseqcRatio & 0xff00) >> 8));

    qam_read_byte(u32TunerPort, SAT_DSEC_TX_CTRL, &u8RegVal);
    u8RegVal &= ~(0x7<<1);
    if(u32Continuous22K)
    {
        u8RegVal |= (1 << 1);
    }

    msleep_interruptible(10);
    qam_write_byte(u32TunerPort, SAT_DSEC_TX_CTRL, u8RegVal);
    HI_DBG_PrintReg8(SAT_DSEC_TX_CTRL, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SendTone(HI_U32 u32TunerPort, HI_U32 u32Tone)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U16  u16DiseqcRatio = 0;
    HI_U32 u32DemodClk = 0;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_DBG_PrintU32(u32Tone);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetDemodClk(u32TunerPort, &u32DemodClk));

    u16DiseqcRatio = (HI_U16)((u32DemodClk / 22) & 0xffff);
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_L, (HI_U8)(u16DiseqcRatio & 0xff));
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_H, (HI_U8)((u16DiseqcRatio & 0xff00) >> 8));

    qam_read_byte(u32TunerPort, SAT_DSEC_TX_CTRL, &u8RegVal);
    u8RegVal &= ~(0x7<<1);
    if(u32Tone)
    {
        u8RegVal |= (1 << 2);
    }
    else
    {
        u8RegVal |= (0x3 << 1);
    }
    msleep_interruptible(10);
    qam_write_byte(u32TunerPort, SAT_DSEC_TX_CTRL, u8RegVal);
    HI_DBG_PrintReg8(SAT_DSEC_TX_CTRL, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

#ifdef HISDTV100_SUPPORT_DISEQC_RECV
//when sending DiSEqC,bOpen = TRUE
//when receiving DiSEqC,bOpen = FALSE
static HI_S32 LNB_SetDgate(HI_U32 u32TunerPort, HI_BOOL bOpen)
{
#define     HI_DISEQC2X_DGATE_GPIO      39

    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();

    //lnbh25_set_ten(u32TunerPort, bOpen, HI_DISEQC2X_DGATE_GPIO);
    s32Ret  = HI_DRV_GPIO_SetDirBit(HI_DISEQC2X_DGATE_GPIO, HI_FALSE);
    if (bOpen)
    {
        s32Ret |= HI_DRV_GPIO_WriteBit(HI_DISEQC2X_DGATE_GPIO, 1);
    }
    else
    {
        s32Ret |= HI_DRV_GPIO_WriteBit(HI_DISEQC2X_DGATE_GPIO, 0);
    }

    HI_FuncExit();
    return s32Ret;
}
#endif

HI_S32 DiSEqC_Reset(HI_U32 u32TunerPort)
{
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, SAT_MAN_RST_CTRL1, &u8RegVal);
    u8RegVal &= ~(0x1 << 1);
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, u8RegVal);
    tuner_mdelay(1);
    u8RegVal |= (0x1 << 1);
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 Sat_ReadSendMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_SENDMSG_S *pstSendMsg)
{
    HI_U8 i = 0;
    HI_U8 u8Temp = 0;
    HI_U8 rx_err_bit = 0;
    HI_U8 rx_err_silent = 0;    //diseqc输入持续为低超过192ms
    HI_U8 rx_err_overflow = 0;  //接收数据超过8字节
    HI_U8 rx_err_par = 0;       //奇偶校验错误
    HI_U8 rx_msg_done = 0;       //消息接收完指示
    HI_U8 rx_err_byte = 0;
    HI_U8 rx_silent_time = 0;   //diseqc输入持续为低电平的时间：rx_silent_time*16ms
    HI_U8 num_rx_byte = 0;      //接收的字节数
    HI_U8 rx_listen = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstSendMsg);
    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);

    // set dsec_rd_sel
    qam_read_byte(u32TunerPort,  SAT_DSEC_EN, &u8Temp);
    u8Temp = u8Temp | 0x20;
    qam_write_byte(u32TunerPort, SAT_DSEC_EN, u8Temp);

    //read rx int state
    qam_read_byte(u32TunerPort, SAT_INT_STATE, &u8Temp);
    rx_err_bit = (u8Temp & 0x40) >> 6;
    rx_err_byte = (u8Temp & 0x20) >> 5;
    rx_err_silent = (u8Temp & 0x10) >> 4;
    rx_err_overflow = (u8Temp & 0x8) >> 3;
    rx_err_par = (u8Temp & 0x04) >> 2;
    rx_msg_done = (u8Temp & 0x02) >> 1;

    if (rx_err_bit || rx_err_silent || rx_err_overflow || rx_err_par
        || (rx_msg_done != 1) || rx_err_byte)
    {
        HI_WARN_PrintReg8(SAT_INT_STATE, u8Temp);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_POST_LISTEN);
        HI_FuncExit();
        return HI_ERR_TUNER_DISEQC_POST_LISTEN;
    }

    //read rx byte
    qam_read_byte(u32TunerPort, SAT_RX_STATE, &u8Temp);
    rx_silent_time = (u8Temp & 0xf0) >> 4 ;
    num_rx_byte = u8Temp & 0x0f ;
    if (num_rx_byte != pstSendMsg->u8Length)
    {
        HI_WARN_PrintU32(num_rx_byte);
        HI_WARN_PrintU32(pstSendMsg->u8Length);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_POST_LISTEN);
        return HI_ERR_TUNER_DISEQC_POST_LISTEN;
    }

    //read listen data
    for (i = 0; i < num_rx_byte; i++)
    {
        u8Temp = 0x88 | i;
        qam_write_byte(u32TunerPort, SAT_DSEC_ADDR, u8Temp);    // write data addr
        qam_read_byte(u32TunerPort, SAT_DSEC_DATA, &rx_listen); // read rx data

        HI_DISEQC_TRACE("[core]%d, SEND = 0x%x, LISTEN = 0x%x.\n", i, pstSendMsg->au8Msg[i], rx_listen);

        if (rx_listen != pstSendMsg->au8Msg[i])
        {
            HI_WARN_PrintU32(rx_listen);
            HI_WARN_PrintU32(pstSendMsg->au8Msg[i]);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_POST_LISTEN);
            return HI_ERR_TUNER_DISEQC_POST_LISTEN;
        }
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 Sat_ReadRecvMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_RECVMSG_S *pstRecvMsg)
{
    HI_U8 i = 0;
    HI_U8 u8Temp = 0;
    HI_U8 num_rx_byte = 0;      //receive message length
    HI_U8 rx_data = 0;
    HI_U8 rx_silent_time = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstRecvMsg);
    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);

    //read rx byte
    qam_read_byte(u32TunerPort, SAT_RX_STATE, &u8Temp);
    rx_silent_time = (u8Temp & 0xf0) >> 4;
    num_rx_byte = u8Temp & 0x0f;
    if (num_rx_byte != pstRecvMsg->u8Length)
    {
        LOG_PrintInfo("Diseqc rx message mismatch, Length: %d -- %d.\n", num_rx_byte, pstRecvMsg->u8Length);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_RECV_LENGTH);
        HI_FuncExit();
        return HI_ERR_TUNER_DISEQC_RECV_LENGTH;
    }

    //read listen data
    for (i = 0; i < num_rx_byte; i++)
    {
        u8Temp = 0x88 | i;
        qam_write_byte(u32TunerPort, SAT_DSEC_ADDR, u8Temp);    // write data addr
        qam_read_byte(u32TunerPort, SAT_DSEC_DATA, &rx_data);   // read rx data

        HI_DISEQC_TRACE("[core]#%d, rx_data = 0x%x\n", i, rx_data);
        pstRecvMsg->au8Msg[i] = rx_data;
    }

    pstRecvMsg->u8Length = num_rx_byte;
    pstRecvMsg->enStatus = HI_UNF_TUNER_DISEQC_RECV_OK;

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_DiSEqCSendMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_SENDMSG_S *pstSendMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U16  u16DiseqcRatio = 0;
    HI_U32 i = 0, u32DemodClk = 0, u32SendBfTimeUs = 0, u32SendAfTimeUs = 0;
    HI_U8 u8RegVal = 0, u8DsecTxCtrl = 0, u8TxWaitBf = 0, u8TxWaitAft = 0;
    //struct timeval stStartTime,stEndTime;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstSendMsg);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, HiSDTV100_Sat_GetDemodClk(u32TunerPort, &u32DemodClk));
    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);

    u16DiseqcRatio = (HI_U16)((u32DemodClk / 22) & 0xffff);
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_L, (HI_U8)(u16DiseqcRatio & 0xff));
    qam_write_byte(u32TunerPort, SAT_DSEC_RATIO_H, (HI_U8)((u16DiseqcRatio & 0xff00) >> 8));

    /* config diseqc to free mode */
    qam_read_byte(u32TunerPort, SAT_DSEC_TX_CTRL, &u8RegVal);
    u8RegVal &= ~(0x7<<1);
    qam_write_byte(u32TunerPort, SAT_DSEC_TX_CTRL, u8RegVal);

#ifdef HISDTV100_SUPPORT_DISEQC_RECV
    /* config to diseqc listen */
    qam_read_byte(u32TunerPort, SAT_DSEC_EN, &u8RegVal);
    u8RegVal |= (1<<6);
    qam_write_byte(u32TunerPort, SAT_DSEC_EN, u8RegVal);
#endif

    for (i = 0; i < pstSendMsg->u8Length; i++)
    {
        qam_write_byte(u32TunerPort, SAT_DSEC_DATA, pstSendMsg->au8Msg[i]);
        qam_write_byte(u32TunerPort, SAT_DSEC_ADDR, i);
    }

    qam_read_byte(u32TunerPort, SAT_DSEC_TX_CTRL, &u8RegVal);
    u8RegVal &= ~(0x7 << 4);
    u8RegVal |= (1<<3);//config to send diseqc msg
    u8RegVal |= (((pstSendMsg->u8Length - 1) & 7) << 4);//config to send diseqc length
#ifdef HISDTV100_SUPPORT_UNICABLE2
    if ((pstSendMsg->au8Msg[0] == ODU_UB_INUSE)
        || (pstSendMsg->au8Msg[0] == ODU_UB_FREQ))
    {
        u8RegVal |= (1<<7);
    }
#endif
    u8DsecTxCtrl = u8RegVal;

    /* get the time of before send and after send,unit:us */
    qam_read_byte(u32TunerPort, SAT_TX_TWAIT, &u8RegVal);
    u8TxWaitBf = ((u8RegVal & 0xf0) >> 4);
    u8TxWaitAft = (u8RegVal & 0x0f);
    if(u8TxWaitBf < 8)
    {
        u32SendBfTimeUs = u8TxWaitBf*500;
    }
    else
    {
        u32SendBfTimeUs = (u8TxWaitBf-4)*1000;
    }

    if(u8TxWaitAft < 8)
    {
        u32SendAfTimeUs = u8TxWaitAft*500;
    }
    else
    {
        u32SendAfTimeUs = (u8TxWaitAft - 4)*1000;
    }

    //when voltage rise from 13V to 18V,3.6ms is needed
    tuner_mdelay(2);

#ifdef HISDTV100_SUPPORT_DISEQC_RECV
    //dgate config off
    HI_TUNER_CHECK_FUNC_RET(s32Ret, LNB_SetDgate(u32TunerPort, HI_FALSE));

    /* listen to diseqc bus */
    for (i = 0; i < 2; i++)
    {
        tuner_udelay(1400);
        qam_read_bit(u32TunerPort, SAT_RX_TWAIT, 2, &u8RegVal);
        if (u8RegVal)
        {
            LOG_PrintWarning("DiSEqC bus is busy,i:\n",i);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_BUSY);
            return HI_ERR_TUNER_DISEQC_BUSY;
        }
    }

    //dgate config on,prepare to send DiSEqC
    HI_TUNER_CHECK_FUNC_RET(s32Ret, LNB_SetDgate(u32TunerPort, HI_TRUE));
#endif

    //start sending DiSEqC message.
    qam_write_byte(u32TunerPort, SAT_DSEC_TX_CTRL, u8DsecTxCtrl);
    //do_gettimeofday(&stEndTime);
    //u32Total1 = (stEndTime.tv_sec-stStartTime.tv_sec)*1000000+(stEndTime.tv_usec-stStartTime.tv_usec);

    //do_gettimeofday(&stStartTime);
    tuner_udelay(u32SendBfTimeUs  + pstSendMsg->u8Length * 13500 + 500); //时间需再调

#ifdef HISDTV100_SUPPORT_DISEQC_RECV
    tuner_mdelay(1);
    HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_ReadSendMsg(u32TunerPort, pstSendMsg));

    //dgate config off,in order to make DiSEqC will be received
    HI_TUNER_CHECK_FUNC_RET(s32Ret, LNB_SetDgate(u32TunerPort, HI_FALSE));
#endif
    //do_gettimeofday(&stEndTime);
    //u32Total2 = (stEndTime.tv_sec-stStartTime.tv_sec)*1000000+(stEndTime.tv_usec-stStartTime.tv_usec);
    //printk("<------HiSDTV100_Sat_DiSEqCSendMsg u32Total1:%d us,u32Total2:%d.\n",u32Total1,u32Total2);

    //发送后等待时间，不可删除，单向命令需要此等待时间
    tuner_udelay(u32SendAfTimeUs + 5000);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_DiSEqCRecvMsg(HI_U32 u32TunerPort, HI_UNF_TUNER_DISEQC_RECVMSG_S *pstRecvMsg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32TotalWaitTime = 0/*,i*/;
    HI_U8 u8RegVal = 0;
    //HI_U8 u8ByteNum = 0;
    HI_U8 u8RxErrBit = 0;
    HI_U8 u8RxErrSilent = 0;    //diseqc输入持续为低超过192ms
    HI_U8 u8RxErrOverflow = 0;  //接收数据超过8字节
    HI_U8 u8RxErrPar = 0;       //奇偶校验错误
    HI_U8 u8RxMsgDone = 0;       //消息接收完指示
    HI_U8 u8RxErrByte = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstRecvMsg);
    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);

    if(pstRecvMsg->u8Length == 0)
    {
        HI_WARN_PrintU32(pstRecvMsg->u8Length);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_PARA);
        return HI_ERR_TUNER_INVALID_PARA;
    }

    //config to read diseqc msg
    qam_read_byte(u32TunerPort, SAT_DSEC_EN, &u8RegVal);
    u8RegVal &= ~(1<<5);
    qam_write_byte(u32TunerPort, SAT_DSEC_EN, u8RegVal);

    //DiSEqC response timeout = 192ms
    qam_read_byte(u32TunerPort, SAT_TX_IMP_ENV, &u8RegVal);
    u8RegVal &= ~(0xf << 4);
    u8RegVal |= (0xc << 4);
    qam_write_byte(u32TunerPort, SAT_TX_IMP_ENV, u8RegVal);

    /* config timeout */
    u32TotalWaitTime = 0;
    while (u32TotalWaitTime < 300)
    {
        qam_read_byte(u32TunerPort, SAT_INT_STATE, &u8RegVal);
        u8RxErrBit = (u8RegVal & 0x40) >> 6;
        u8RxErrByte = (u8RegVal & 0x20) >> 5;
        u8RxErrSilent = (u8RegVal & 0x10) >> 4;
        u8RxErrOverflow = (u8RegVal & 0x8) >> 3;
        u8RxErrPar = (u8RegVal & 0x4) >> 2;
        u8RxMsgDone = (u8RegVal & 0x2) >> 1;
        //rx_err_silent
        if (u8RxErrSilent)
        {
            LOG_PrintWarning("No byte received in 192ms!\n");
            HI_WARN_PrintU32(u32TotalWaitTime);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_RECV_TIMEOUT);
            return HI_ERR_TUNER_DISEQC_RECV_TIMEOUT;
        }
        //rx_err_bit || rx_err_byte || rx_err_overflow || rx_err_par
        else if (u8RxErrBit || u8RxErrByte || u8RxErrOverflow || u8RxErrPar)    //接收信息有误
        {
            LOG_PrintWarning("DiSEqC rx message error!\n");
            HI_WARN_PrintReg8(SAT_INT_STATE, u8RegVal);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_DISEQC_RECV_STATE);
            return HI_ERR_TUNER_DISEQC_RECV_STATE;
        }
        //rx_message
        else if (u8RxMsgDone)
        {
            break;
        }

        u32TotalWaitTime += 3;
        tuner_mdelay(3);
    }

    if (u32TotalWaitTime >= 300)
    {
        pstRecvMsg->enStatus = HI_UNF_TUNER_DISEQC_RECV_TIMEOUT;
        LOG_PrintWarning("DiSEqC rx message timeout!\n");
        HI_WARN_PrintReg8(SAT_INT_STATE, u8RegVal);
        return HI_ERR_TUNER_DISEQC_RECV_TIMEOUT;
    }

    HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_ReadRecvMsg(u32TunerPort, pstRecvMsg));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_SetFuncMode(HI_U32 u32TunerPort, TUNER_FUNC_MODE_E enFuncMode)
{

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_BlindscanInit(HI_U32 u32TunerPort, TUNER_BLINDSCAN_INITPARA_S *pstPara)
{
    HI_TUNER_CHECKPOINTER(pstPara);

    RESET_MCU(u32TunerPort);

    LOG_PrintInfo("Begin to BS, so reset MCU.\n");

    return HI_SUCCESS;
}

static HI_U32 Sat_BSOneWindow(HI_U32 u32TunerPort, HI_U32 u32FreqCenter, HI_U32 u32LpfBwWindow, HI_UNF_TUNER_SAT_TPINFO_S *pstChannel, HI_U16* pu16TpNum)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_U8 u8FsMSB = 0;
    HI_U8 i = 0, u8RegVal = 0, u8RegValL = 0, u8RegValH = 0;
    HI_U8  u8Reliablity = 0;
    HI_S16  s16FcOffsetBs = 0;
    HI_U16 u16TpNum = 0;
    HI_U32  u32TimeCnt = 0, u32FsBs = 0,u32LPFKHz;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_DBG_PrintU32(u32FreqCenter);
    HI_DBG_PrintU32(u32LpfBwWindow);

    /* u32FreqCenter,unit:kHz */
    if (HI_UNF_TUNER_DEV_TYPE_RDA5815 == g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        /* u32LpfBwWindow,unit:kHz */
        g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32SymbolRate = u32LpfBwWindow * 1000;
    }
    else
    {
        u32LPFKHz = u32LpfBwWindow * 75 / 100 + 4000;
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_SetPf(u32TunerPort, u32LPFKHz));
    }

    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel, u32FreqCenter*1000);

    tuner_mdelay(12);
    Sat_HotReset(u32TunerPort);

    /* wait cbs finish */
    u32TimeCnt = 0;
    do
    {
        tuner_mdelay(2);
        u32TimeCnt += 2;
        qam_read_bit(u32TunerPort, SAT_CBS_FINISH, 0, &u8RegVal);
    }
#ifdef HI_FPGA_SUPPORT
    while(!u8RegVal && u32TimeCnt < 900);
#else
    while(!u8RegVal && u32TimeCnt < 3000);
#endif

    /* calc bs tp num */
    u16TpNum = 0;
    if(u8RegVal)
    {
        qam_read_byte(u32TunerPort, SAT_CBS_R2_NUM, &u8RegVal);
        u16TpNum = (HI_U16)(u8RegVal & 0x3f);
    }
    HI_DBG_PrintU32(u16TpNum);

    if(u16TpNum)
    {
        qam_read_byte(u32TunerPort, SAT_CBS_CTRL_REG, &u8RegVal);

        /* calc max reliability */
        for(i = 0; i < u16TpNum; i++)
        {
            qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, (u8RegVal & 0xc0) | i);

            /* fc,unit:kHz */
            qam_read_byte(u32TunerPort, SAT_CBS_FC_L, &u8RegValL);
            qam_read_byte(u32TunerPort, SAT_CBS_FC_H, &u8RegValH);
            s16FcOffsetBs = (HI_S16)(u8RegValL + (u8RegValH << 8));

            if(HI_UNF_TUNER_IQSPECTRUM_INVERT == s_stSatCfg.enIQSpectrum)
            {
                s16FcOffsetBs = -s16FcOffsetBs;
            }
            pstChannel->u32Freq = (u32FreqCenter * 1000) + s16FcOffsetBs;

            /* fs,unit:kHz */
            qam_read_byte(u32TunerPort, SAT_CBS_FS_L, &u8RegValL);
            qam_read_byte(u32TunerPort, SAT_CBS_FS_H, &u8RegValH);
            qam_read_byte(u32TunerPort, SAT_CBS_FS_MSB, &u8FsMSB);
            u8FsMSB = (u8FsMSB&(0x1<<7))?1:0;
            u32FsBs = u8RegValL+ (u8RegValH<<8) + (u8FsMSB<<16);
            pstChannel->u32SymbolRate = u32FsBs * 1000;

            qam_read_byte(u32TunerPort, SAT_CBS_RELIABILITY1, &u8Reliablity);
            pstChannel->cbs_reliablity = u8Reliablity;
            pstChannel++;
        }
    }

    *pu16TpNum = u16TpNum;
    HI_DBG_PrintU32(*pu16TpNum);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_BlindscanAction(HI_U32 u32TunerPort, TUNER_BLINDSCAN_PARA_S *pstPara)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstPara);

    /* close self reset */
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, 0x3);
    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0xff);

    /* enable bs,fs and fc unkown */
    qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x80);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_BSOneWindow(u32TunerPort, pstPara->u32CentreFreq, SAT_BS_WINDOW_STEP_KHZ, pstPara->unResult.astSat, &(pstPara->u16Count)));

    /* cbs_rd_addr set to zero */
    qam_read_byte(u32TunerPort, SAT_CBS_CTRL_REG, &u8RegVal);
    u8RegVal &= ~(0x3f<<0);
    qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, u8RegVal);

    /* open self reset */
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, 0x7);
    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0x1b);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_VOID Sat_TpVerify_DelHistoryTp(HI_U32 u32TunerPort, HI_U32 fec_ok_cnt, HI_U32 fec_no_ok_cnt)
{
    HI_U32 point_tmp = 0, i = 0;

    HI_FuncEnter();
    HI_DBG_PrintU32(fec_ok_cnt);
    HI_DBG_PrintU32(fec_no_ok_cnt);

    if((fec_ok_cnt == 0)  && (fec_no_ok_cnt == 0))
    {
        hist_cnt += 1;
        may_sfu_old = may_sfu;
        may_sfu = 0;
        low_cn_cnt = 0;

        /* discard too old histroy, and move histroy */
        point_tmp = 0;
        if(hist_num > 0)
        {
            for(i = 0; i < hist_num; i++)
            {
                if(hist_time[i] + 8 >= hist_cnt)
                {
                    hist_if[point_tmp] = hist_if[i];
                    hist_fs[point_tmp] = hist_fs[i];
                    hist_time[point_tmp] = hist_time[i];
                    hist_ok[point_tmp] = hist_ok[i];
                    point_tmp += 1;
                }
            }
        }
        hist_num = point_tmp;
    }

    HI_FuncExit();
    return;
}

static HI_S32 Sat_TpVerify_MarkSameTp(HI_U32 u32TunerPort, HI_U32 if_cur, HI_U32 fs_kHz, HI_U32 *hist_is_ok, HI_U32 *eq_fs_no_cnt, HI_U32 *eq_fs_no_cnt2)
{
    HI_U32 i = 0, fs_dlt = 0, if_dlt = 0, equal_fs = 0, equal_if = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(hist_is_ok);
    HI_TUNER_CHECKPOINTER(eq_fs_no_cnt);
    HI_TUNER_CHECKPOINTER(eq_fs_no_cnt2);

    HI_DBG_PrintU32(if_cur);
    HI_DBG_PrintU32(fs_kHz);

    /* analyse same tp */
    *eq_fs_no_cnt = 0;
    *eq_fs_no_cnt2 = 0;
    *hist_is_ok = 0;

    if(hist_num > 0)
    {
        for(i = 0; i < hist_num; i++)
        {
            fs_dlt = abs((HI_S32)hist_fs[i] - (HI_S32)fs_kHz)*1000/fs_kHz;
            if_dlt = abs((HI_S32)hist_if[i] - (HI_S32)if_cur);

            if(fs_dlt < 4)
            {
                equal_fs = 1;
                if(hist_time[i] + 4 >= hist_cnt)    //only for sfu
                {
                    *eq_fs_no_cnt  += !hist_ok[i]  ?  1  :  0;   //统计最近多轮的同符号率但不OK
                    *eq_fs_no_cnt2 += !hist_ok[i] && (hist_time[i]== hist_cnt) ? 1 : 0;   //only for sfu, current band fs equal
                }
            }
            else
            {
                equal_fs = 0;
            }

            if(if_dlt < (fs_kHz*20/100+800))
            {
                equal_if = 1;
            }
            else
            {
                equal_if = 0;
            }

            if(equal_if && equal_fs)
            {
                if(hist_ok[i])
                {
                    *hist_is_ok = 1;
                    //hist_no_ok = 0;
                }
                else if(!*(hist_is_ok) && !hist_ok[i])
                {
                    //hist_no_ok = 1;
                }
            }
        }
    }
    /* histroy analysis, end */

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_TpVerify_MarkWhetherSfu(
    HI_U32 u32TunerPort,
    HI_U32 fec_ok_cnt,
    HI_U32 tp_all,
    HI_U32 eq_fs_no_cnt,
    HI_U32 eq_fs_no_cnt2,
    HI_U32 fs_kHz,
    HI_U32 pre_reliablity,
    HI_U32 base_reliable,
    HI_U32 *tim_ok_wait)
{
    HI_S32 reliablity_t1 = 0;
    HI_U32 fs_grade = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(tim_ok_wait);

    HI_DBG_PrintU32(fec_ok_cnt);
    HI_DBG_PrintU32(tp_all);
    HI_DBG_PrintU32(eq_fs_no_cnt);
    HI_DBG_PrintU32(eq_fs_no_cnt2);
    HI_DBG_PrintU32(fs_kHz);
    HI_DBG_PrintU32(pre_reliablity);
    HI_DBG_PrintU32(base_reliable);

    if(fec_ok_cnt >= 2)
    {
        may_sfu = 0;
        may_sfu_old = 0;
    }

    /* sfu discard */
    if(tp_all > 120)
    {
        may_sfu_tmp = (low_cn_cnt > 8);
    }
    else if(tp_all > 85)
    {
        may_sfu_tmp = (low_cn_cnt > 12);
    }
    else if(tp_all > 60 || may_sfu_old)
    {
        may_sfu_tmp = (low_cn_cnt > 14) && (eq_fs_no_cnt > 10);
    }
    else if(tp_all > 48)
    {
        may_sfu_tmp = (low_cn_cnt > 20) && (eq_fs_no_cnt > 12);
    }
    else
    {
        may_sfu_tmp = (low_cn_cnt > 30) && (eq_fs_no_cnt > 15);
    }

    may_sfu = may_sfu ||  ((fec_ok_cnt <= 1) && may_sfu_tmp);

    if (fs_kHz < 1500)
    {
        fs_grade = 0;
    }
    else if (fs_kHz < 2000)
    {
        fs_grade = 1;
    }
    else if (fs_kHz < 2600)
    {
        fs_grade = 2;
    }
    else if (fs_kHz < 3500)
    {
        fs_grade = 3;
    }
    else if (fs_kHz < 5000)
    {
        fs_grade = 4;
    }
    else
    {
        fs_grade = 5;
    }

    *tim_ok_wait = 30 + 50000/fs_kHz;

    reliablity_t1 = (HI_S32)(pre_reliablity + fs_grade) - (HI_S32)(low_cn_cnt/4 + eq_fs_no_cnt/8 + eq_fs_no_cnt2/4);
    if(reliablity_t1 < 0)
    {
        reliablity_t1 = 0;
    }

    if((may_sfu && reliablity_t1  < base_reliable * 120/100)  || (fec_ok_cnt==2 && low_cn_cnt > 30 && reliablity_t1 < base_reliable))
    {
        return HI_FAILURE;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_TpVerify_SetTuner(HI_U32 u32TunerPort, TUNER_TP_VERIFY_PARAMS_S * pstChannel)
{
    HI_U8 U8RegVal = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32LPFKHz;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    /* close FEC self reset */
    qam_read_byte(u32TunerPort, SAT_MAN_RST_CTRL1, &U8RegVal);
    U8RegVal &= 0xFB;
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, U8RegVal);
    qam_write_byte(u32TunerPort, SAT_FEC_CTRL_S2, 0x14);//Limit the times of LDPC iterative

    if (HI_UNF_TUNER_DEV_TYPE_RDA5815 == g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        /* u32LpfBwWindow,unit:kHz */
        g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32SymbolRate = pstChannel->u32SymbolRate;
    }
    else
    {
        u32LPFKHz = pstChannel->u32SymbolRate/10*9/1000;
        u32LPFKHz = u32LPFKHz * 75 / 100 + 4000;
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_SetPf(u32TunerPort, u32LPFKHz));
    }
    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel, pstChannel->u32Frequency);

    tuner_mdelay(8);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_TpVerify_FirstCheckLockStatus(
    HI_U32 u32TunerPort,
    HI_U8 average_num,
    HI_U32 fs_cur,
    HI_U32 fs_kHz,
    HI_U32 tim_ok_wait,
    HI_U8 *tim_ok_bit,
    HI_U8 *s2_sync_bit,
    HI_U8 *scan_ok_bit,
    HI_U8 *low_cn,
    HI_S32 *mean_fc,
    HI_S32 *mean_fs,
    HI_S32 *mean_reliable,
    HI_U8 *may_low_cn)
{
    HI_U8 sum_num = 0, try_one = 0, try_one_old = 0, m = 0, j = 0, temp_TPnum = 0, tempL = 0, tempH = 0, max_finded = 0, max_reliablity = 0, read_reliable = 0, u8Temp = 0, valid_tp = 0, may_low_quit_num = 3;
    HI_U8 u8RegVal = 0;
    HI_S16 cbs_fc = 0, cbs_fc_sel = 0;
    HI_U16 u16MeanFs = 0;
    HI_S32 sum_fc = 0, sum_fs = 0, sum_reliable = 0, fc_reg[32] = {0}, acc_fc = 0;
    HI_U32 time_cnt = 0, rb_reg[32] = {0}, cbs_fs = 0, dlt_fs = 0, cbs_fs_sel = 0, acc_rb = 0, rb_pow = 0, base_reliable_s1 = 42;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(s2_sync_bit);
    HI_TUNER_CHECKPOINTER(scan_ok_bit);
    HI_TUNER_CHECKPOINTER(low_cn);
    HI_TUNER_CHECKPOINTER(mean_fc);
    HI_TUNER_CHECKPOINTER(mean_fs);
    HI_TUNER_CHECKPOINTER(mean_reliable);
    HI_TUNER_CHECKPOINTER(may_low_cn);

    HI_DBG_PrintU32(average_num);
    HI_DBG_PrintU32(fs_cur);
    HI_DBG_PrintU32(fs_kHz);
    HI_DBG_PrintU32(tim_ok_wait);

    sum_num = 0;
    sum_fc = 0;
    sum_fs = 0;
    sum_reliable = 0;

    try_one = 0;
    try_one_old = 0;
    *s2_sync_bit= 0;
    *scan_ok_bit = 0;

    qam_write_byte(u32TunerPort, SAT_CR_BW_MAX, 0x12);

    /* Multiple blindscan to calculate carrier error mean */
    for(m=0; m<average_num; m++)
    {
        /* if failed, some registers  are modified, so need to rewrite key registers */
        if((m == 0) || (try_one != try_one_old))
        {
            try_one_old = try_one;

            qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0xc0);
            Sat_SetSymRate(u32TunerPort, fs_cur );
            qam_write_byte(u32TunerPort, SAT_CENT_FREQ_L, 0x00);    //setSymrate has carrier center offset, but when blindscan, should not add offset
            qam_write_byte(u32TunerPort, SAT_CENT_FREQ_H, 0x00);
        }

        /* reset system or module */
        if(m==0)
        {
            Sat_HotReset(u32TunerPort);
        }
        else
        {
            qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL0, 0x81);   //reset module except agc and fsk
            qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL0, 0xff);   //remove reset
        }

        /* wait cbs finish */
        time_cnt = 0;
        /* wait for blindscan finished */
        do
        {
            tuner_mdelay(5);
            time_cnt += 5;
            qam_read_bit(u32TunerPort, SAT_CBS_FINISH, 0, &u8RegVal);
        }
        while(!u8RegVal && (time_cnt < 600));

        /* read TP num */
        temp_TPnum = 0;
        /* cbs_finish: flag is set means ok, then read the number of TPs */
        if(u8RegVal)
        {
            qam_read_byte(u32TunerPort, SAT_CBS_R2_NUM, &tempL);
            temp_TPnum = tempL & 0x3f;
        }

        max_finded = 0;
        max_reliablity = 0;

        memset(rb_reg, 0, 32*sizeof(HI_U32));
        memset(fc_reg, 0, 32*sizeof(HI_S32));

        // TP数目非0即盲扫成功，则记录所有有效TP，同时找可靠度最高的有效TP
        if(temp_TPnum != 0)
        {
            //逐一读出TP信息
            for(j = 0; j < temp_TPnum; j++)
            {
                qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0xc0 | j);
                qam_read_byte(u32TunerPort, SAT_CBS_RELIABILITY1, &read_reliable);

                //求载波误差
                qam_read_byte(u32TunerPort, SAT_CBS_FC_L, &tempL);
                qam_read_byte(u32TunerPort, SAT_CBS_FC_H, &tempH);
                cbs_fc = (HI_S16) (tempL + (tempH<<8));

                //求符号率误差
                qam_read_byte(u32TunerPort, SAT_CBS_FS_L, &tempL);
                qam_read_byte(u32TunerPort, SAT_CBS_FS_H, &tempH);
                qam_read_byte(u32TunerPort, SAT_CBS_FS_MSB, &u8Temp);
                u8Temp = (u8Temp >> 7) & 0x1;
                cbs_fs = tempL + (tempH<<8) + (u8Temp<<16);
                dlt_fs = abs((HI_S32)cbs_fs - (HI_S32)fs_kHz);

                valid_tp = (abs(cbs_fc) < (fs_kHz*23/100)) && (dlt_fs <= (fs_kHz/1000+3)) && (read_reliable >= 28);

                //找可靠度最高的3个有效TP
                if(valid_tp)
                {
                    if(read_reliable > max_reliablity)
                    {
                        max_finded = 1;
                        rb_reg[3] = rb_reg[2];
                        rb_reg[2] = rb_reg[1];
                        rb_reg[1] = read_reliable;
                        max_reliablity = read_reliable;

                        fc_reg[3] = fc_reg[2];
                        fc_reg[2] = fc_reg[1];
                        fc_reg[1] = (HI_S32)cbs_fc;
                        cbs_fs_sel = cbs_fs;
                    }
                    else if(read_reliable > rb_reg[2])
                    {
                        rb_reg[3] = rb_reg[2];
                        rb_reg[2] = read_reliable;

                        fc_reg[3] = fc_reg[2];
                        fc_reg[2] = (HI_S32)cbs_fc;
                    }
                    else if(read_reliable > rb_reg[3])
                    {
                        rb_reg[3] = read_reliable;

                        fc_reg[3] = (HI_S32)cbs_fc;
                    }
                }
            }

            //先做一次盲扫的多个TP信息合成(根据可靠度平方加权，以降低误差），再多次盲扫取平均
            if(max_finded)
            {
                acc_fc = 0;
                acc_rb = 0;

                //一次盲扫的多个信息合成(根据可靠度平方加权)，以降低误差
                for(j = 1; j <= 3; j++)
                {
                    rb_pow  = ((rb_reg[j] * rb_reg[j]) >> 3);    // 除8是为了防止数据累加后过大溢出
                    acc_rb += rb_pow;
                    acc_fc += fc_reg[j] * (HI_S32)rb_pow;
                }

                if(0 != acc_rb)
                {
                    if(acc_fc>=0)
                    {
                        cbs_fc_sel =  (HI_S16)( acc_fc / acc_rb);
                    }
                    else
                    {
                        cbs_fc_sel = -(HI_S16)(-acc_fc / acc_rb);  //负数参与除法运算时，需先转换为正数，然后将结果转化为负数
                    }
                }


                //多次盲扫平均
                sum_num +=1;
                sum_fc += (HI_S32)cbs_fc_sel;
                sum_fs += cbs_fs_sel;
                sum_reliable += max_reliablity;
                *mean_fc = sum_fc/sum_num;
                *mean_fs = sum_fs/sum_num;
                *mean_reliable = sum_reliable/sum_num;
            }

            if(max_finded && !try_one && (fs_kHz >= 3000 || may_sfu))
            {
                try_one = 1;
                qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x00);    //关闭盲扫，Ram地址为0
                Sat_SetSymRate(u32TunerPort, *mean_fs*1000);

                HI_DBG_PrintU32(*mean_fc);
                if (*mean_fc>=0)
                {
                    u16MeanFs = (HI_U16)*mean_fc;
                }
                else
                {
                    u16MeanFs = (HI_U16)(abs(*mean_fc));
                    u16MeanFs = (~u16MeanFs ) + 1;
                }
                HI_DBG_PrintU32(u16MeanFs);

                qam_write_byte(u32TunerPort, SAT_CENT_FREQ_L, u16MeanFs & 0xff);
                qam_write_byte(u32TunerPort, SAT_CENT_FREQ_H, (u16MeanFs>>8) & 0xff);
                Sat_HotReset(u32TunerPort);      //reset man_ctrl state

                //wait for timing ok
                time_cnt = 0;
                do
                {
                    tuner_mdelay(5);
                    time_cnt += 5;
                    qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 2, tim_ok_bit);
                }while(!(*tim_ok_bit) && (time_cnt < tim_ok_wait));

                HI_DBG_PrintU32(*tim_ok_bit);

                //等待SCAN-OK或S2同步
                if(*tim_ok_bit)
                {
                    time_cnt = 0;
                    do
                    {
                        tuner_mdelay(5);
                        time_cnt += 5;
                        qam_read_byte(u32TunerPort, SAT_CR_STATE, &u8Temp);   //scan_state
                        *scan_ok_bit = (u8Temp>>1) & 0x1;
                        *s2_sync_bit = (u8Temp>>0) & 0x1;
                    }while(!(*scan_ok_bit) && !(*s2_sync_bit) && time_cnt < (170000/fs_kHz));  //170000可保证覆盖QPSK的5个帧头
                }
                HI_DBG_PrintU32(*scan_ok_bit);
                HI_DBG_PrintU32(*s2_sync_bit);
            }
        }

        // 如果盲扫没找到、或没有有效TP、或定时不OK、或S1信号且SCAN未OK且可靠度太低，则may_low_cn加1
        if(temp_TPnum==0 || !max_finded || (try_one && !try_one_old && !(*tim_ok_bit)) || (try_one && !(*s2_sync_bit) && !(*scan_ok_bit) && *mean_reliable < base_reliable_s1))  //注:假设定时OK后，s2_sync_bit检测准确度很高
        {

            *may_low_cn += 1;
            if(*may_low_cn >= may_low_quit_num) // 如果may_low_cn大于门限，则放弃
            {
                *low_cn = 1;
                low_cn_cnt +=1;
            }
        }

        if(*low_cn || *s2_sync_bit || *scan_ok_bit)    //跳出多次盲扫
        {
            break;
        }
    }
    //多次盲扫结束

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_TpVerify_SecondCheckLockStatus(
    HI_U32 u32TunerPort,
    HI_U8 old_bw_max,
    HI_S32 mean_fs,
    HI_S32 mean_fc,
    HI_S32 mean_reliable,
    HI_U32 fs_kHz,
    HI_U32 hist_is_ok,
    HI_U32 fec_ok_cnt,
    HI_U32 base_reliable,
    HI_U32 i,
    HI_U32 tim_ok_wait,
    HI_U8 *tim_ok_bit,
    HI_U8 *fec_ok_bit,
    HI_U8 *may_low_cn,
    HI_U8 *low_cn,
    HI_U8 *s2_sync_bit,
    HI_U8 *scan_ok_bit,
    HI_U32 *fec_ok_wait,
    HI_U32 *chance_2)
{
    HI_U8 u8Temp = 0, may_low_quit_num = 3, tempL = 0, tempH = 0, u8IsiNum = 0;
    HI_U16 u16MeanFs = 0;
    HI_U32 time_cnt = 0, chance_2a = 0, again_up = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(fec_ok_bit);
    HI_TUNER_CHECKPOINTER(may_low_cn);
    HI_TUNER_CHECKPOINTER(low_cn);
    HI_TUNER_CHECKPOINTER(s2_sync_bit);
    HI_TUNER_CHECKPOINTER(scan_ok_bit);
    HI_TUNER_CHECKPOINTER(fec_ok_wait);
    HI_TUNER_CHECKPOINTER(chance_2);

    HI_DBG_PrintU32(old_bw_max);
    HI_DBG_PrintU32(mean_fs);
    HI_DBG_PrintU32(mean_fc);
    HI_DBG_PrintU32(mean_reliable);
    HI_DBG_PrintU32(fs_kHz);
    HI_DBG_PrintU32(hist_is_ok);
    HI_DBG_PrintU32(fec_ok_cnt);
    HI_DBG_PrintU32(base_reliable);
    HI_DBG_PrintU32(i);
    HI_DBG_PrintU32(tim_ok_wait);

    //if is dvb-s2, needn't restart system,   else reset fs and fc, then restart
    if(!(*s2_sync_bit) && !(*scan_ok_bit))    //如果前面试时，已发现为S1，则复位并等待定时OK
    {
        qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x00);    //关闭盲扫，Ram地址为0
        Sat_SetSymRate(u32TunerPort, mean_fs*1000);

        HI_DBG_PrintU32(mean_fc);
        if (mean_fc>=0)
        {
            u16MeanFs = (HI_U16)mean_fc;
        }
        else
        {
            u16MeanFs = (HI_U16)(abs(mean_fc));
            u16MeanFs = (~u16MeanFs ) + 1;
        }
        HI_DBG_PrintU32(u16MeanFs);

        qam_write_byte(u32TunerPort, SAT_CENT_FREQ_L, u16MeanFs & 0xff);
        qam_write_byte(u32TunerPort, SAT_CENT_FREQ_H, (u16MeanFs>>8) & 0xff);
        //reset man_ctrl state
        Sat_HotReset(u32TunerPort);

        time_cnt = 0;
        //等待定时OK
        do
        {
            tuner_mdelay(5);
            time_cnt += 5;
            qam_read_bit(u32TunerPort, SAT_LOCK_FLAG, 2, tim_ok_bit);
        }while(!(*tim_ok_bit) && (time_cnt < (tim_ok_wait + 10)));  //add 10ms for agc
    }
    HI_DBG_PrintU32(*tim_ok_bit);

    if(*tim_ok_bit)
    {
        qam_write_byte(u32TunerPort, SAT_CR_BW_MAX, old_bw_max);
        time_cnt = 0;
        //等待FEC-OK
        do
        {
            tuner_mdelay(5);
            time_cnt += 5;

            qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8Temp);
            *s2_sync_bit = (u8Temp>>3) & 0x1;
            *fec_ok_bit  = (u8Temp>>5) & 0x1;

            if(*s2_sync_bit)
            {
                *fec_ok_wait = 800 + 500000/fs_kHz;  //有些modcod在CN门限时很难锁定
            }
            else
            {
                *fec_ok_wait = 130 + 500000/fs_kHz;  //当为假TP时，此处为影响盲扫速度的关键点 ,asic版本参数可以再取小一些
                qam_read_byte(u32TunerPort, SAT_NOISE_POW_L, &tempL); //去除4G干扰信号
                qam_read_byte(u32TunerPort, SAT_NOISE_POW_H, &tempH);

                if(*fec_ok_bit)
                {
                    tuner_mdelay(10);
                    qam_read_byte(u32TunerPort, SAT_NOISE_POW_L, &tempL); //去除4G干扰信号
                    qam_read_byte(u32TunerPort, SAT_NOISE_POW_H, &tempH);

                    tuner_mdelay(10);
                    qam_read_byte(u32TunerPort, SAT_NOISE_POW_L, &tempL); //去除4G干扰信号
                    qam_read_byte(u32TunerPort, SAT_NOISE_POW_H, &tempH);
                    HI_DBG_PrintU32(fs_kHz);
                    HI_DBG_PrintReg8(SAT_NOISE_POW_L, tempL);
                    HI_DBG_PrintReg8(SAT_NOISE_POW_H, tempH);
                }

                if(*fec_ok_bit && (tempL==0) && (tempH==0))
                {
                    *fec_ok_bit = 0;
                    if(time_cnt > 100)
                    {
                        break;
                    }
                }
            }
        }while(!(*fec_ok_bit) && (time_cnt < *fec_ok_wait));
        HI_DBG_PrintU32(*s2_sync_bit);
        HI_DBG_PrintU32(*fec_ok_bit);
        HI_DBG_PrintU32(*fec_ok_wait);

        if((*s2_sync_bit) && (*fec_ok_bit))
        {
                time_cnt = 0;
                do
                {
                    tuner_mdelay(5);
                    time_cnt += 5;
                    qam_read_byte(u32TunerPort, SAT_ISI_NUM, &u8IsiNum);
                    u8IsiNum = u8IsiNum & 0x3f;
                    if(u8IsiNum > 0)
                    {
                        break;
                    }
                } while(time_cnt < 30);
                HI_DBG_PrintU32(u8IsiNum);

                if(u8IsiNum == 0)
                {
                    *fec_ok_bit = 0;
                }
        }
        HI_DBG_PrintU32(*fec_ok_bit);

    }

    // 如果定时不OK、或fec_ok_bit不OK，则may_low_cn加1
    if(!(*tim_ok_bit) || !(*fec_ok_bit))  //注:假设定时OK后，s2_sync_bit检测准确度很高
    {
        (*may_low_cn) += 1;
        if(*may_low_cn >= may_low_quit_num) // 如果may_low_cn大于门限，则放弃
        {
            //quit_point = 2;
            *low_cn = 1;
            low_cn_cnt +=1;
        }
    }

    //如果fec_ok_cnt=0，可能是用设备测试极限盲扫能力，则允许更容易给下一次机会
    again_up = (fec_ok_cnt == 0)  ?  3  :  8;
    // 逐渐加大重试的难度
    again_up = again_up * (i+1);
    //低符号率太耗时，提高给下一次机会的难度
    if (fs_kHz <1500)
    {
        chance_2a = mean_reliable > (base_reliable + again_up + low_cn_cnt*17/10);
    }
    else if(fs_kHz <2000)
    {
        chance_2a = mean_reliable > (base_reliable + again_up + low_cn_cnt*14/10);
    }
    else if(fs_kHz <3000)
    {
        chance_2a = mean_reliable > (base_reliable + again_up + low_cn_cnt*12/10);
    }
    else if(fs_kHz <5000)
    {
        chance_2a = mean_reliable > (base_reliable + again_up + low_cn_cnt);
    }
    else
    {
        chance_2a = mean_reliable > (base_reliable + again_up + low_cn_cnt);
    }

    *chance_2 = chance_2a;

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 Sat_TpVerify_Exit(
    HI_U32 u32TunerPort,
    HI_U8 fec_ok_bit,
    HI_U8 s2_sync_bit,
    HI_U8 scan_ok_bit,
    HI_U8 low_cn,
    HI_S32 mean_fc,
    HI_S32 mean_fs,
    HI_U32 fs_kHz,
    HI_U32 *if_cur,
    TUNER_TP_VERIFY_PARAMS_S *pstChannel)
{
    HI_U8 tempL = 0, tempH = 0,u8Temp = 0;
    HI_S16 s16temp = 0, freq_err = 0;
    HI_S32 s32temp = 0, freq_tr = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(if_cur);
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_DBG_PrintU32(fec_ok_bit);
    HI_DBG_PrintU32(s2_sync_bit);
    HI_DBG_PrintU32(scan_ok_bit);
    HI_DBG_PrintU32(low_cn);
    HI_DBG_PrintU32(mean_fc);
    HI_DBG_PrintU32(mean_fs);
    HI_DBG_PrintU32(fs_kHz);

    if(hist_num<3200)
    {
        hist_fs[hist_num] = fs_kHz;
        hist_if[hist_num] = *if_cur;
        hist_ok[hist_num] = fec_ok_bit;
        hist_time[hist_num] = hist_cnt;
        hist_num += 1;
    }

    qam_read_byte(u32TunerPort, SAT_CBS_CTRL_REG, &tempH);
    qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &tempL);

    if(!s2_sync_bit && !scan_ok_bit && !low_cn)
    {
        low_cn_cnt += 1;
    }

    if(fec_ok_bit)
    {
        //读锁定后残余载波误差（相对fs），并转到绝对kHz，再加已知误差，得最终误差
        qam_read_byte(u32TunerPort, SAT_TR_FREQ_FB_L, &tempL);
        qam_read_byte(u32TunerPort, SAT_TR_FREQ_FB_H, &tempH);
        s16temp = tempL + (tempH<<8);
        s32temp = (HI_S32)(s16temp);
        freq_tr = (s32temp * (HI_S32)(fs_kHz))/65536;
        freq_err = mean_fc  + freq_tr;

        //根据频谱反转，调整载波误差
        freq_err = ((HI_UNF_TUNER_IQSPECTRUM_INVERT == s_stSatCfg.enIQSpectrum) ? (-freq_err) : freq_err);
        pstChannel->u32Frequency  += freq_err;
        pstChannel->u32SymbolRate = mean_fs*1000;
        *if_cur = pstChannel->u32Frequency;
    }

    //恢复FEC自复位
    qam_read_byte(u32TunerPort, SAT_MAN_RST_CTRL1, &u8Temp);
    u8Temp |= 0x4;
    qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, u8Temp);

    if(fec_ok_bit)
    {
        pstChannel->fec_ok_cnt += 1;
        HI_DBG_PrintU32(pstChannel->fec_ok_cnt);
    }
    else
    {
        pstChannel->fec_no_ok_cnt += 1;
        HI_DBG_PrintU32(pstChannel->fec_no_ok_cnt);
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_TpVerify(HI_U32 u32TunerPort, TUNER_TP_VERIFY_PARAMS_S * pstChannel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8 tim_ok_bit = 0, s2_sync_bit = 0, fec_ok_bit = 0, scan_ok_bit = 0, may_low_cn = 0, average_num = 6, low_cn = 0, old_rst_wait = 0, old_bw_max = 0, u8RegVal = 0;
    HI_S32 mean_fc = 0, mean_fs = 0, mean_reliable = 0;
    HI_U32 i = 0, fs_cur = 0, tim_ok_wait = 0, fec_ok_wait = 0, pre_reliablity = 0, tp_all = 0, chance_2 = 0, if_cur = 0, fs_kHz = 0, fec_ok_cnt = 0, fec_no_ok_cnt = 0, hist_is_ok = 0, eq_fs_no_cnt = 0, eq_fs_no_cnt2 = 0, base_reliable = 28;

    if_cur = pstChannel->u32Frequency;
    fs_cur = pstChannel->u32SymbolRate;
    pre_reliablity = pstChannel->cbs_reliablity;
    fec_ok_cnt = pstChannel->fec_ok_cnt;
    fec_no_ok_cnt =pstChannel->fec_no_ok_cnt;
    tp_all = pstChannel->CBS_TH;

    fs_kHz = fs_cur / 1000;
    if(fs_kHz == 0)
    {
        goto return_proc;
    }

    Sat_TpVerify_DelHistoryTp(u32TunerPort, fec_ok_cnt, fec_no_ok_cnt);

    s32Ret = Sat_TpVerify_MarkSameTp(u32TunerPort, if_cur, fs_kHz, &hist_is_ok, &eq_fs_no_cnt, &eq_fs_no_cnt2);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PrintFuncResult(Sat_TpVerify_MarkSameTp, s32Ret);
        goto return_proc;
    }

    s32Ret = Sat_TpVerify_MarkWhetherSfu(
        u32TunerPort,
        fec_ok_cnt,
        tp_all,
        eq_fs_no_cnt,
        eq_fs_no_cnt2,
        fs_kHz,
        pre_reliablity,
        base_reliable,
        &tim_ok_wait);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PrintFuncResult(Sat_TpVerify_MarkWhetherSfu, s32Ret);
        goto return_proc;
    }

    s32Ret = Sat_TpVerify_SetTuner(u32TunerPort, pstChannel);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PrintFuncResult(Sat_TpVerify_SetTuner, s32Ret);
        goto return_proc;
    }

    if (fs_kHz < 6000)
    {
        average_num = 2;
    }
    else if(fs_kHz <12000)
    {
        average_num = 3;
    }
    else if(fs_kHz <24000)
    {
        average_num = 4;
    }
    else
    {
        average_num = 6;
    }

    qam_read_byte(u32TunerPort, SAT_STATE_WAITS, &old_rst_wait);
    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0xff);   //加长自复位的等待时间
    qam_read_byte(u32TunerPort, SAT_CR_BW_MAX, &old_bw_max);

    qam_read_byte(u32TunerPort, SAT_CBS_FO_CTRL, &u8RegVal);
    qam_write_byte(u32TunerPort, SAT_CBS_FO_CTRL, u8RegVal | 0x08);   // 关闭去重复功能
    may_low_cn = 0;
    low_cn = 0;

    for (i = 0; i < 3; i++)
    {
        s32Ret = Sat_TpVerify_FirstCheckLockStatus(
            u32TunerPort,
            average_num,
            fs_cur,
            fs_kHz,
            tim_ok_wait,
            &tim_ok_bit,
            &s2_sync_bit,
            &scan_ok_bit,
            &low_cn,
            &mean_fc,
            &mean_fs,
            &mean_reliable,
            &may_low_cn);
        if (HI_SUCCESS != s32Ret)
        {
            HI_WARN_PrintFuncResult(Sat_TpVerify_FirstCheckLockStatus, s32Ret);
            goto return_proc;
        }

        if(low_cn)
        {
            break;
        }

        s32Ret = Sat_TpVerify_SecondCheckLockStatus(
            u32TunerPort,
            old_bw_max,
            mean_fs,
            mean_fc,
            mean_reliable,
            fs_kHz,
            hist_is_ok,
            fec_ok_cnt,
            base_reliable,
            i,
            tim_ok_wait,
            &tim_ok_bit,
            &fec_ok_bit,
            &may_low_cn,
            &low_cn,
            &s2_sync_bit,
            &scan_ok_bit,
            &fec_ok_wait,
            &chance_2);
        if (HI_SUCCESS != s32Ret)
        {
            HI_WARN_PrintFuncResult(Sat_TpVerify_SecondCheckLockStatus, s32Ret);
            goto return_proc;
        }

        if(fec_ok_bit || low_cn || (!hist_is_ok && (may_sfu || !chance_2))) //不满足再试条件
        {
            break;
        }
    }

    qam_write_byte(u32TunerPort, SAT_STATE_WAITS, old_rst_wait);
    qam_write_byte(u32TunerPort, SAT_CR_BW_MAX, old_bw_max);

return_proc:
    s32Ret = Sat_TpVerify_Exit(
        u32TunerPort,
        fec_ok_bit,
        s2_sync_bit,
        scan_ok_bit,
        low_cn,
        mean_fc,
        mean_fs,
        fs_kHz,
        &if_cur,
        pstChannel);
    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_PrintFuncResult(Sat_TpVerify_Exit, s32Ret);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_BLINDSAN_TPVERIFY);
        return HI_ERR_TUNER_BLINDSAN_TPVERIFY;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_Sat_GetAgc(HI_U32 u32TunerPort, HI_U32 u32FreqCenter,HI_U32 *pu32Agc)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_U8 u8AgcSpeedRegVal = 0;
    HI_U8 au8RegVal[2] = {0};

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Agc);

    qam_write_byte(u32TunerPort, SAT_CBS_CTRL_REG, 0x80);

    if (HI_UNF_TUNER_DEV_TYPE_RDA5815 == g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32SymbolRate = 30000;
    }
    else
    {
        HI_TUNER_CHECK_FUNC_RET(s32Ret, Sat_SetPf(u32TunerPort, 15000));
    }
    HI_TUNER_CHECKFUNCTION(g_stTunerOps[u32TunerPort].set_tuner);
    g_stTunerOps[u32TunerPort].set_tuner(u32TunerPort, g_stTunerOps[u32TunerPort].enI2cChannel, u32FreqCenter*1000);

    Sat_SetSymRate(u32TunerPort, 30000000);

    qam_read_byte(u32TunerPort, SAT_AGC_SPEED_BOUND,&u8AgcSpeedRegVal);
    HI_DBG_PrintReg8(SAT_AGC_SPEED_BOUND, u8AgcSpeedRegVal);
    qam_write_byte(u32TunerPort, SAT_AGC_SPEED_BOUND,0x7f);

    tuner_mdelay(20);

    qam_read_byte(u32TunerPort, SAT_AGC_CTRL_L, &au8RegVal[0]);
    qam_read_byte(u32TunerPort, SAT_AGC_CTRL_H, &au8RegVal[1]);

    if (au8RegVal[1] >> 7)
    {
        *pu32Agc = ((au8RegVal[1] & 0x0f) << 8) + au8RegVal[0];
    }
    else
    {
        *pu32Agc = 0x77777777;
    }

    qam_write_byte(u32TunerPort, SAT_AGC_SPEED_BOUND,u8AgcSpeedRegVal);

    HI_DBG_PrintH32(*pu32Agc);

    HI_FuncExit();
    return HI_SUCCESS;
}

//读取20次2C寄存器，如果FEC都能锁定，信号为好；一次都锁不定，信号为极差；其他情况，信号为一般。
#define READ_FEC_MAX_TIME       (20)      //读取20次
#define READ_FEC_INTERVAL_TIME  (2)       //间隔2ms

//当发送UnicableII命令之后，FEC需要一段时间才能检测到信号的变化。这里设置为120ms，后续可能会缩短。
#define WAIT_FEC_CHANGE (120)

static HI_U32 g_u32SigStat = 0;
/*HI_U32 u32TimeMs1;
HI_U32 u32TimeMs2;
HI_U32 u32TimeMs3;*/

HI_S32 HiSDTV100_UNIC_GetSigStat(HI_U32 u32TunerPort, HI_U32 *pu32SigStat)
{
    HI_U8 u8Temp = 0;
    HI_U8 i = 0;
    HI_U8 u8LockTimes = 0;

    HI_FuncEnter();

    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);
    for (i = 0; i < READ_FEC_MAX_TIME; i++)
    {
        qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8Temp);
        if (u8Temp & 0x20)
        {
            u8LockTimes++;
        }
        tuner_mdelay(READ_FEC_INTERVAL_TIME);
    }

    if (u8LockTimes == READ_FEC_MAX_TIME)
    {
        *pu32SigStat = TUNER_SIGNAL_GOOD;              //信号很好
    }
    else if (u8LockTimes < 3)
    {
        *pu32SigStat = TUNER_SIGNAL_BAD;               //信号极差
    }
    else
    {
        *pu32SigStat = TUNER_SIGNAL_NORMAL;            //信号一般
    }

    HI_DISEQC_TRACE("[core]%d: locked times: %d/%d.\n", __LINE__, u8LockTimes, READ_FEC_MAX_TIME);
    g_u32SigStat = *pu32SigStat;
    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_UNIC_ClearChangeFlag(HI_U32 u32TunerPort)
{
    HI_U8 u8LockFlag = 0;
    HI_U32 u32TimeUsed = 0;
    const HI_U32 u32TotalTime = 200;

    HI_FuncEnter();

    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);
    if (g_u32SigStat == TUNER_SIGNAL_BAD)
    {
        HI_DISEQC_TRACE("[core]%d, Signal is bad, return.\n",__LINE__);
        return HI_SUCCESS;
    }
    //写清2B寄存器，并暂存信号状态。
    for (u32TimeUsed = 0; u32TimeUsed < u32TotalTime; u32TimeUsed += READ_FEC_INTERVAL_TIME)
    {
        qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
        HI_DISEQC_TRACE("[core]%d, lockflag 0x%x.\n", __LINE__, u8LockFlag);
        if (u8LockFlag & 0x20)
        {
            qam_write_byte(u32TunerPort, SAT_SIG_CHANGE, 1);
            break;
        }
        tuner_mdelay(5);
    }
    if (u32TimeUsed >= u32TotalTime)
    {
        HI_DISEQC_TRACE("[core]Clear signal_change register Fail.\n");
        return HI_FAILURE;
    }
    else
        HI_DISEQC_TRACE("[core]Clear signal_change register Success.\n");

    //SYS_GetTimeStampMs(&u32TimeMs1);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_VOID HiSDTV100_UNIC_DelayBySymb(HI_U32 u32TunerPort, HI_U32 u32SymbRate_kHz, HI_U32 *pu32DelayMs)
{
    HI_U8 fs_grade;

    if (u32SymbRate_kHz < 2000)            fs_grade = 0;
    else if (u32SymbRate_kHz < 3000)       fs_grade = 1;
    else if (u32SymbRate_kHz < 4900)       fs_grade = 2;
    else if (u32SymbRate_kHz < 8000)       fs_grade = 3;
    else if (u32SymbRate_kHz <15000)       fs_grade = 4;
    else                                   fs_grade = 5;

    *pu32DelayMs = (320 - fs_grade * 20) * 2 + 600;
    return;
}

HI_S32 HiSDTV100_UNIC_CheckTPChange( HI_U32 u32TunerPort, HI_U32 u32SymbRateKHz, HI_U32 au32Chanchange[3])
{
    TUNER_SIGNALSTAT_E enSigStat;
    HI_U32 u32WaitMs = 0;
    HI_U32 u32TimeUsed = 0;
    //HI_S32 i;
    HI_BOOL bChanChange = HI_FALSE;
    HI_BOOL bChanLocked = HI_FALSE;
    HI_U8 u8SigChange = 0;
    HI_U8 u8LockFlag = 0;
    //HI_U8 u8ManStat = 0;
    HI_U8 u8ModCod = 0;

    HI_FuncEnter();

    enSigStat = (TUNER_SIGNALSTAT_E)au32Chanchange[0];
    HI_DISEQC_TRACE("[core]Enter %s.\n",__func__);

    if (enSigStat == TUNER_SIGNAL_GOOD)
    {
        //SYS_GetTimeStampMs(&u32TimeMs3);
        //printk("Good: time1 %d, time2 %d, time3 %d.\n", u32TimeMs1, u32TimeMs2, u32TimeMs3);

        //!!!Wait 120ms for demod can notify the signal change,100ms sometimes is not enough.
        tuner_mdelay(WAIT_FEC_CHANGE);

        qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
        qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8ModCod);
        qam_read_byte(u32TunerPort, SAT_SIG_CHANGE, &u8SigChange);
        HI_DISEQC_TRACE("[core]Good: u8SigChange[0x%x], u8LockFlag[0x%x], [%d-%s], TIME_COST %d.\n", u8SigChange, u8LockFlag,
            u8ModCod, u8ModCod==0x1c?"QPSK 3/4":(u8ModCod==0x30?"8PSK 3/5":"Unkown"), u32WaitMs);

        if ((u8SigChange & 0x08) && (u8SigChange & 0x40))  //lock_flag_chg == 1
        {
            bChanChange = HI_TRUE;
        }

        au32Chanchange[0] = (HI_U32)bChanChange;
        HI_DISEQC_TRACE("[core]%d: bChanChange %s.\n", __LINE__, bChanChange?"True":"False");
    }
    else if (enSigStat == TUNER_SIGNAL_NORMAL)
    {
        if (au32Chanchange[1] == TUNER_NORMALSIGNAL_FIRST)
        {
            //!!!Wait 120ms for demod can notify the signal change,100ms sometimes is not enough.
            tuner_mdelay(WAIT_FEC_CHANGE);

            HiSDTV100_UNIC_DelayBySymb(u32TunerPort, au32Chanchange[2], &u32WaitMs);

            u32TimeUsed = 0;
            for (u32TimeUsed = 0; u32TimeUsed < u32WaitMs; u32TimeUsed += READ_FEC_INTERVAL_TIME)
            {
                qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
                if (u8LockFlag & 0x20)
                {
                    qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8ModCod);
                    HI_DISEQC_TRACE("[core]%d: u8LockFlag 0x%x, TIME_COST %d, [%d-%s].\n", __LINE__, u8LockFlag, u32TimeUsed + u32WaitMs,
                        u8ModCod, u8ModCod==0x1c?"QPSK 3/4":(u8ModCod==0x30?"8PSK 3/5":"Unkown"));
                    bChanLocked = HI_TRUE;
                    break;
                }
                tuner_mdelay(READ_FEC_INTERVAL_TIME);
            }

            au32Chanchange[0] = (HI_U32)bChanLocked;
            HI_DISEQC_TRACE("[core]%d: bChanLocked %s.\n", __LINE__, bChanLocked?"True":"False");
        }
        else if (au32Chanchange[1] == TUNER_NORMALSIGNAL_SECOND)
        {
            HiSDTV100_UNIC_DelayBySymb(u32TunerPort, u32SymbRateKHz, &u32WaitMs);
            bChanLocked = au32Chanchange[2];
            if (bChanLocked == HI_FALSE)
            {
                for (u32TimeUsed = 0; u32TimeUsed < u32WaitMs; u32TimeUsed += READ_FEC_INTERVAL_TIME)
                {
                    qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
                    if (u8LockFlag & 0x20)
                    {
                        qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8ModCod);
                        HI_DISEQC_TRACE("[core]%d: u8LockFlag 0x%x, TIME_COST %d, [%d-%s].\n", __LINE__, u8LockFlag, u32TimeUsed,
                            u8ModCod, u8ModCod==0x1c?"QPSK 3/4":(u8ModCod==0x30?"8PSK 3/5":"Unkown"));
                        bChanChange = HI_TRUE;
                        break;
                    }
                    tuner_mdelay(READ_FEC_INTERVAL_TIME);
                }
                if (u32TimeUsed >= u32WaitMs)
                {
                    bChanChange = HI_TRUE;
                    HI_DISEQC_TRACE("[core]%d: u32TimeUsed %d, u32WaitMs %d.\n", __LINE__, u32TimeUsed, u32WaitMs);
                }
            }
            else if (bChanLocked == HI_TRUE)
            {
                for (u32TimeUsed = 0; u32TimeUsed < u32WaitMs; u32TimeUsed += READ_FEC_INTERVAL_TIME)
                {
                    qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
                    if (u8LockFlag & 0x20)
                    {
                        HI_DISEQC_TRACE("[core]%d: u8LockFlag 0x%x, TIME_COST %d.\n", __LINE__, u8LockFlag, u32TimeUsed);
                        break;
                    }
                    tuner_mdelay(READ_FEC_INTERVAL_TIME);
                }
                if (u8LockFlag & 0x20)
                {
                    qam_read_byte(u32TunerPort, SAT_SIG_CHANGE, &u8SigChange);
                    qam_read_byte(u32TunerPort, SAT_PLS_CODE, &u8ModCod);
                    HI_DISEQC_TRACE("[core]%d: u8SigChange 0x%x, u8LockFlag 0x%x, [%d-%s].\n", __LINE__, u8SigChange, u8LockFlag,
                        u8ModCod, u8ModCod==0x1c?"QPSK 3/4":(u8ModCod==0x30?"8PSK 3/5":"Unkown"));
                    if ((u8SigChange & 0x20) || (u8SigChange & 0x10))
                    {
                        bChanChange = HI_TRUE;
                    }
                }
                else
                {
                    bChanChange = HI_TRUE;
                }
            }
            else
            {
                HI_WARN_PrintU32(au32Chanchange[2]);
                HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_PARA);
                return HI_ERR_TUNER_INVALID_PARA;
            }

            au32Chanchange[0] = (HI_U32)bChanChange;
            HI_DISEQC_TRACE("[core]%d: bChanChange %s.\n", __LINE__, bChanChange?"True":"False");
        }
        else
        {
            HI_WARN_PrintU32(au32Chanchange[1]);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_PARA);
            return HI_ERR_TUNER_INVALID_PARA;
        }
    }
    else if (enSigStat == TUNER_SIGNAL_BAD)
    {
        HiSDTV100_UNIC_DelayBySymb(u32TunerPort, u32SymbRateKHz, &u32WaitMs);

        for (u32TimeUsed = 0; u32TimeUsed < u32WaitMs + 20; u32TimeUsed += READ_FEC_INTERVAL_TIME)
        {
            qam_read_byte(u32TunerPort, SAT_LOCK_FLAG, &u8LockFlag);
            if (u8LockFlag & 0x20)
            {
                HI_DISEQC_TRACE("[core]%d: u8LockFlag 0x%x, TIME_COST %d.\n",__LINE__, u8LockFlag, u32TimeUsed);
                bChanChange = HI_TRUE;
                break;
            }
            tuner_mdelay(READ_FEC_INTERVAL_TIME);
        }

        au32Chanchange[0] = (HI_U32)bChanChange;
        HI_DISEQC_TRACE("[core]%d: bChanChange %s.\n", __LINE__, bChanChange?"True":"False");
    }
    else
    {
        HI_WARN_PrintU32(enSigStat);
        HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_PARA);
        return HI_ERR_TUNER_INVALID_PARA;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

