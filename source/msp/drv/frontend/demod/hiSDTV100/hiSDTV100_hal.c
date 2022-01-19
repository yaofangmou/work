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
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/math64.h>
#include <linux/hikapi.h>
#include <asm/io.h>

#include "hiSDTV100.h"
#include "hiSDTV100_config.h"
#include "drv_demod.h"
#include "hi_reg_common.h"
//#include "hi_reg_crg.h"

#define ADC_I2C_CHANNEL 4
#define ADC_I2C_ADDR 0x90

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_DemAddrCfg(HI_U32 u32DevAddr)
{
    volatile U_PERI_QAM qam_addr_cfg;

    qam_addr_cfg.u32 = g_pstRegPeri->PERI_QAM.u32;
    qam_addr_cfg.bits.qam_dev_addr = ((u32DevAddr >> 1) & 0x3);
    g_pstRegPeri->PERI_QAM.u32 = qam_addr_cfg.u32;

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_CrgCfg(HI_UNF_TUNER_SIG_TYPE_E enSigType)
{
#ifndef HI_FPGA_SUPPORT
    /* CRG config */
    volatile U_PERI_CRG57    demod_crg;

    /* I2C rst cken */
    demod_crg.u32 = g_pstRegCrg->PERI_CRG57.u32;
    /*adc i2c soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_i2c_srst_req = 0x1;
    /* adc i channel soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_i_srst_req = 0x1;
    /* adc q channel soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_q_srst_req = 0x1;
    /* dem soft reset
        0: not reset;
        1: reset */
    demod_crg.bits.chn_srst_req = 0x1;
    /* dem axi clk
        0: turn off;
        1: turn on */
    demod_crg.bits.dem_axi_cken = 0x1;
    /* dem adc clk
        0: off;
        1: on*/
    demod_crg.bits.dem_adc_cken = 0x1;
    /* dem clk
        0: off;
        1: on*/
    demod_crg.bits.dem_cken = 0x1;
    /* fec clk
        0: off;
        1: on*/
    demod_crg.bits.dem_fec_cken = 0x1;
    g_pstRegCrg->PERI_CRG57.u32 = demod_crg.u32 ;
    HI_DBG_PrintU32(g_pstRegCrg->PERI_CRG57.u32);

    demod_crg.u32 = g_pstRegCrg->PERI_CRG57.u32;
    switch(enSigType)
    {
        case HI_UNF_TUNER_SIG_TYPE_DVB_T:
        case HI_UNF_TUNER_SIG_TYPE_DVB_T2:
        case HI_UNF_TUNER_SIG_TYPE_ISDB_T:
            /* dem i2c clk sel
                0: dem_t;
                1: dem_c
                2: dem_s
                3: reserved*/
            demod_crg.bits.dem_i2c_clk_sel = 0x0;
            /* dem adc clk sel
                0: adc_tc;
                1: adc_s*/
            demod_crg.bits.adc_clk_sel = 0x0;
            /* dem_t clk sel
                0: 60MHz;
                1: 63MHz*/
            demod_crg.bits.dem_t_clk_sel = 0x0;
            /* dem_c clk sel
                0: 90MHz;
                1: 100MHz*/
            demod_crg.bits.dem_c_clk_sel = 0x0;
            /* adc_s clk sel
                0: 135MHz;
                1: 150MHz*/
            demod_crg.bits.adc_s_clk_sel = 0x0;
            /* adc clk phase cfg
                0: normal phase;
                1: invert phase*/
            demod_crg.bits.adc_clk_pctrl = 0x0;
            break;
        case HI_UNF_TUNER_SIG_TYPE_CAB:
        case HI_UNF_TUNER_SIG_TYPE_J83B:
            /* dem i2c clk sel
                0: dem_t;
                1: dem_c
                2: dem_s
                3: reserved*/
            demod_crg.bits.dem_i2c_clk_sel = 0x1;
            /* dem adc clk sel
                0: adc_tc;
                1: adc_s*/
            demod_crg.bits.adc_clk_sel = 0x0;
            /* dem_t clk sel
                0: 60MHz;
                1: 63MHz*/
            demod_crg.bits.dem_t_clk_sel = 0x0;
            /* dem_c clk sel
                0: 90MHz;
                1: 100MHz*/
            demod_crg.bits.dem_c_clk_sel = 0x0;
            /* adc_s clk sel
                0: 135MHz;
                1: 150MHz*/
            demod_crg.bits.adc_s_clk_sel = 0x0;
            /* adc clk phase cfg
                0: normal phase;
                1: invert phase*/
            demod_crg.bits.adc_clk_pctrl = 0x0;
            break;
        case HI_UNF_TUNER_SIG_TYPE_SAT:
            /* dem i2c clk sel
                0: dem_t;
                1: dem_c
                2: dem_s
                3: reserved*/
            demod_crg.bits.dem_i2c_clk_sel = 0x2;
            /* dem adc clk sel
                0: adc_tc;
                1: adc_s*/
            demod_crg.bits.adc_clk_sel = 0x1;
            /* dem_t clk sel
                0: 60MHz;
                1: 63MHz*/
            demod_crg.bits.dem_t_clk_sel = 0x0;
            /* dem_c clk sel
                0: 90MHz;
                1: 100MHz*/
            demod_crg.bits.dem_c_clk_sel = 0x0;
            /* adc_s clk sel
                0: 135MHz;
                1: 150MHz*/
            demod_crg.bits.adc_s_clk_sel = 0x0;
            /* adc clk phase cfg
                0: normal phase;
                1: invert phase*/
            demod_crg.bits.adc_clk_pctrl = 0x0;
            break;
        default:
            HI_WARN_PrintU32(enSigType);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_INVALID_SIGTYPE);
            return HI_ERR_TUNER_INVALID_SIGTYPE;
    }
    g_pstRegCrg->PERI_CRG57.u32 = demod_crg.u32 ;

    demod_crg.u32 = g_pstRegCrg->PERI_CRG57.u32;
    /*adc i2c soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_i2c_srst_req = 0x0;
    /* adc i channel soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_i_srst_req = 0x0;
    /* adc q channel soft reset:
        0: not reset;
        1: reset */
    demod_crg.bits.adc_q_srst_req = 0x0;
    /* dem soft reset
        0: not reset;
        1: reset */
    demod_crg.bits.chn_srst_req = 0x0;
    /* dem axi clk
        0: turn off;
        1: turn on */
    demod_crg.bits.dem_axi_cken = 0x1;
    /* dem adc clk
        0: off;
        1: on*/
    demod_crg.bits.dem_adc_cken = 0x1;
    /* dem clk
        0: off;
        1: on*/
    demod_crg.bits.dem_cken = 0x1;
    /* fec clk
        0: off;
        1: on*/
    demod_crg.bits.dem_fec_cken = 0x1;
    g_pstRegCrg->PERI_CRG57.u32 = demod_crg.u32 ;

    /* mde2_clk_sel  0:24M;1:200M;2:240M;*/
    g_pstRegCrg->PERI_CRG22.bits.mde2_clk_sel = 1;
#endif
    return HI_SUCCESS;
}

#ifndef HI_FPGA_SUPPORT
static HI_S32 adc_write_byte(HI_U8 u8RegAddr, HI_U8 u8RegVal)
{
    return HI_DRV_I2C_Write(ADC_I2C_CHANNEL, ADC_I2C_ADDR, u8RegAddr, 1, &u8RegVal, 1);
}
#endif

//qamadc perictrl
//ADC start
/*
1.Ramping up the ADC power supplies
2.Set the opm to be 00 after having the stable ADC supply
3.Assert the I2C reset (i2c_resetz) as low for at least 4ns (the pulse width can be extended if 4ns is too short in your design), then set to high
4.Then, set opm as 11 for normal operation
5.After the opm becomes 11, the foreground calibration cycle will start and this cycle will be ended when the signal "adcrdy" is asserted.
*/
HI_S32 HiSDTV100_PeriCfg(HI_U32 u32TunerPort, HI_BOOL bEnable)
{
#ifndef HI_FPGA_SUPPORT
    volatile U_PERI_QAM_ADC0 qam_adc0_peri_cfg;
    HI_U32 i=0;

    if(HI_TRUE == bEnable)
    {
        adc_write_byte(0x82, 0xff);
        adc_write_byte(0xc2, 0xff);
        adc_write_byte(0x8c, 0x0f);
        adc_write_byte(0xcc, 0x0f);

        /* tuner clk 0:24M;1:16M;2:27M */
        g_pstRegSysCtrl->SC_MCU_CRG_CTRL.bits.tuner_clk_sel = 0;
        /* tuner clk en 0:off; 1:on */
#ifdef HI_SOC_TUNER_CLOCK
        g_pstRegSysCtrl->SC_MCU_CRG_CTRL.bits.tuner_cken = 1;
#else
        g_pstRegSysCtrl->SC_MCU_CRG_CTRL.bits.tuner_cken = 0;
#endif

        g_pstRegPeri->PERI_QAM_ADC0.bits.qamadc_mode_sel = 0;//0x104[10:8]

        /* ADC reset */
        g_pstRegCrg->PERI_CRG57.bits.adc_i_srst_req = 1;
        g_pstRegCrg->PERI_CRG57.bits.adc_i_srst_req = 0;

        /* ADC enable */
        g_pstRegPeri->PERI_QAM_ADC0.bits.qamadc_cal_en = 0;
        g_pstRegPeri->PERI_QAM_ADC0.bits.qamadc_cal_en = 1;

        while(i<10)
        {
            qam_adc0_peri_cfg.u32 = g_pstRegPeri->PERI_QAM_ADC0.u32;
            if(qam_adc0_peri_cfg.bits.qamadc_rdy == 1)
            {
                LOG_PrintInfo("QAM-ADC is ready.\n");
                break;
            }
            else
            {
                LOG_PrintWarning("Start QAM-ADC failed, retry times:%d!\n", i);
                i++;
                msleep(10);
            }
        }

        if (i>=10)
        {
            LOG_PrintError("Start QAM-ADC failed, please check!\n");
            return HI_FAILURE;
        }
    }
    else
    {
        adc_write_byte(0x82, 0xc0);
        adc_write_byte(0xc2, 0xc0);
        adc_write_byte(0x8c, 0x00);
        adc_write_byte(0xcc, 0x00);
    }
#endif

    return HI_SUCCESS;
}

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

