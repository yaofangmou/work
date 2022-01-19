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
#include "hiSDTV100_isdbt_core.h"
#include "hiSDTV100_hal.h"
#include "drv_demod.h"
#include "drv_tuner_ioctl.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

static ISDBT_PARA_S s_stIsdbtPara;

static HI_VOID ISDBT_CoolReset(HI_U32 u32TunerPort)
{
    U_MDTV_RESET isdbt_reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, ISDBT_RSTN_CTRL, &(isdbt_reset.u8));
    isdbt_reset.bits.cool_reset = 0x0;
    qam_write_byte(u32TunerPort, ISDBT_RSTN_CTRL, isdbt_reset.u8);
    msleep(1);//udelay(20);
    qam_read_byte(u32TunerPort, ISDBT_RSTN_CTRL , &(isdbt_reset.u8));
    isdbt_reset.bits.cool_reset = 0x1;
    qam_write_byte(u32TunerPort, ISDBT_RSTN_CTRL, isdbt_reset.u8);

    HI_FuncExit();
}

/* Only reset logic, the values of the registers are const */
static HI_VOID ISDBT_HotReset(HI_U32 u32TunerPort)
{
    U_MDTV_RESET isdbt_reset;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, ISDBT_RSTN_CTRL, &(isdbt_reset.u8));
    isdbt_reset.bits.hot_reset = 0x0;
    qam_write_byte(u32TunerPort, ISDBT_RSTN_CTRL, isdbt_reset.u8);
    msleep(1);//udelay(20);
    qam_read_byte(u32TunerPort, ISDBT_RSTN_CTRL , &(isdbt_reset.u8));
    isdbt_reset.bits.hot_reset = 0x1;
    qam_write_byte(u32TunerPort, ISDBT_RSTN_CTRL, isdbt_reset.u8);

    HI_FuncExit();
}

static HI_S32 ISDBT_AxiEn(HI_U32 u32TunerPort, HI_BOOL bEn)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32PhyBaseAddr = 0x0;
    HI_U8  u8BaseAddr0,u8BaseAddr1,u8BaseAddr2,u8BaseAddr3;

    HI_FuncEnter();

    if ((HI_TRUE == bEn) && (HI_FALSE ==  s_stIsdbtPara.bIsdbtBufInit))
    {
        LOG_PrintInfo("start to malloc ISDBT memory...\n");
        HI_TUNER_CHECK_FUNC_RET(s32Ret, HI_DRV_MMZ_AllocAndMap("HiMDTV_ISDBT", MMZ_OTHERS, HiISDBT_RAW_BUF_SIZE, 0, &s_stIsdbtPara.stIsdbtBuf));
        memset((HI_VOID *)s_stIsdbtPara.stIsdbtBuf.pu8StartVirAddr, 0, HiISDBT_RAW_BUF_SIZE);

        if (!s_stIsdbtPara.stIsdbtBuf.pu8StartVirAddr)
        {
            HI_ERR_PrintErrCode(HI_ERR_TUNER_FAILED_ALLOC_MEM);
            HI_FuncExit();
            return HI_ERR_TUNER_FAILED_ALLOC_MEM;
        }
        HI_DBG_PrintU64(s_stIsdbtPara.stIsdbtBuf.pu8StartVirAddr);
        HI_DBG_PrintU32(s_stIsdbtPara.stIsdbtBuf.u32StartPhyAddr);
        u32PhyBaseAddr = ((((HI_U32)s_stIsdbtPara.stIsdbtBuf.u32StartPhyAddr) & 0xffffff00U) + 0x100); //(BaseAddr/256+1)*256

        u8BaseAddr0 = (u32PhyBaseAddr)&0xff;         //The lowest bit
        u8BaseAddr1 = (u32PhyBaseAddr>>8)&0xff;
        u8BaseAddr2 = (u32PhyBaseAddr>>16)&0xff;
        u8BaseAddr3 = (u32PhyBaseAddr>>24)&0xff;

        qam_write_byte(u32TunerPort, ISDBT_AXI_BASE_ADDR0, u8BaseAddr3);
        qam_write_byte(u32TunerPort, ISDBT_AXI_BASE_ADDR1, u8BaseAddr2);
        qam_write_byte(u32TunerPort, ISDBT_AXI_BASE_ADDR2, u8BaseAddr1);
        qam_write_byte(u32TunerPort, ISDBT_AXI_BASE_ADDR3, u8BaseAddr0);

        /* AXI hold */
        qam_write_byte(u32TunerPort, ISDBT_AXI_RSTN, 0x80);

        /* reset all of module of demod */
        qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL0, 0xff);

    }
    else
    {
        qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL0, 0xf0);
        msleep(1);

        /* AXI release */
        qam_write_byte(u32TunerPort, ISDBT_AXI_RSTN, 0x0);
        LOG_PrintInfo("release AXI successfully...\n");
    }

    s_stIsdbtPara.bIsdbtBufInit= bEn;

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 ISDBT_ClkCfg(HI_U32 u32TunerPort)
{
    HI_U8 u8RegValue = 0;
    HI_U32 u32DemodClk = 0;
    HI_U32 u32AdcClk = 0;
    HI_U32 u32IFClk = 0;
    U_ADC_AGC_CTRL unAdcAgcCtrl;
    HI_U8 u8RegVal = 0;

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
    qam_read_byte(u32TunerPort, ISDBT_CLK_SEL, &u8RegVal);
    u8RegVal &= ~(0x1f<<3);
    u8RegVal |= 0x18<<3;
    qam_write_byte(u32TunerPort, ISDBT_CLK_SEL, u8RegVal);

    /* demod clk */
    HI_DBG_PrintU32(u32DemodClk);
    qam_write_byte(u32TunerPort, ISDBT_CLK_DEMO_L, (u32DemodClk & 0xFF));
    qam_write_byte(u32TunerPort, ISDBT_CLK_DEMO_M, (u32DemodClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, ISDBT_CLK_DEMO_H, (u32DemodClk>>16) & 0x03);

    /* adc clk */
    HI_DBG_PrintU32(u32AdcClk);
    qam_write_byte(u32TunerPort, ISDBT_CLK_ADC_L, (u32AdcClk & 0xFF));
    qam_write_byte(u32TunerPort, ISDBT_CLK_ADC_M, (u32AdcClk>>8) & 0xFF);
    qam_write_byte(u32TunerPort, ISDBT_CLK_ADC_H, (u32AdcClk>>16) & 0x03);

    switch(g_stTunerOps[u32TunerPort].enTunerDevType)
    {
        case HI_UNF_TUNER_DEV_TYPE_MXL661:
            u32IFClk = 5000;//5380
            break;
        default:
            u32IFClk = 5000;
            break;
    }
    /* IF clk */
    HI_DBG_PrintU32(u32IFClk);
    qam_write_byte(u32TunerPort, ISDBT_IF_FREQ_L, (u32IFClk & 0xFF));
    qam_write_byte(u32TunerPort, ISDBT_IF_FREQ_H, (u32IFClk>>8) & 0xFF);

    /* ADC/AGC ctrl */
    qam_read_byte(u32TunerPort, ISDBT_AGC_CTRL, &(unAdcAgcCtrl.u8));
    unAdcAgcCtrl.bits.c_adc_twos  = 0x1; //complement
    unAdcAgcCtrl.bits.c_iq_swap   = 0x0; //I
    qam_write_byte(u32TunerPort, ISDBT_AGC_CTRL, unAdcAgcCtrl.u8);
    HI_DBG_PrintReg8(ISDBT_AGC_CTRL, unAdcAgcCtrl.u8);

#ifdef HI_FPGA_SUPPORT
    qam_write_byte(u32TunerPort, ISDBT_AGC_GOAL, 0xa);
#else
    qam_write_byte(u32TunerPort, ISDBT_AGC_GOAL, 0xd);
#endif

    qam_write_byte(u32TunerPort, ISDBT_THRES, 0x31);

    qam_write_byte(u32TunerPort, ISDBT_DAGC_REF, 0x5a);

    qam_read_byte(u32TunerPort, ISDBT_LOOP_BW, &u8RegValue);
    u8RegValue |= 0x33;
    qam_write_byte(u32TunerPort, ISDBT_LOOP_BW, 0x33);

    HI_FuncExit();
    return HI_SUCCESS;
}

static HI_S32 ISDBT_ExtRegCfg(HI_U32 u32TunerPort)
{
    HI_U8 u8RegValue = 0;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, ISDBT_SP_CTRL, &u8RegValue);
    u8RegValue &= ~(1<<5);
    qam_write_byte(u32TunerPort, ISDBT_SP_CTRL, u8RegValue);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_Init(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;
    U_HiDTV200_MOD_CTRL unModCtrl;

    HI_FuncEnter();

    /* choose mod: 0-dtmb/1-dvbt/2-dvbc/3-j83b/4-atsc/5-isdbt */
    qam_read_byte(u32TunerPort, ISDBT_CHN_SEL, &(unModCtrl.u8));
    unModCtrl.bits.mode = 0x5;
    qam_write_byte(u32TunerPort, ISDBT_CHN_SEL, unModCtrl.u8);
    LOG_PrintDebug("unModCtrl=%#x\n",unModCtrl.u8);

    ISDBT_CoolReset(u32TunerPort);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_AxiEn(u32TunerPort, HI_TRUE));

    //RESET_MCU(u32TunerPort);

    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_ClkCfg(u32TunerPort));
    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_ExtRegCfg(u32TunerPort));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_Connect(HI_U32 u32TunerPort, TUNER_ACC_QAM_PARAMS_S *pstChannel)
{
    U_HiDTV200_MFSEL_CTRL  unMfselCtrl;
    U_HiDTV200_BW_CTRL     unBwCtrl;
    HI_U8 i = 0, u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstChannel);

    HI_DBG_PrintU32(pstChannel->unSRBW.u32BandWidth);

    /* mf_sel */
    qam_read_byte(u32TunerPort, ISDBT_MF_SEL, &(unMfselCtrl.u8));
    unMfselCtrl.bits.my_sel   = 0x7;
    qam_write_byte(u32TunerPort, ISDBT_MF_SEL, unMfselCtrl.u8);

    /* bandwidth setting */
    qam_read_byte(u32TunerPort, ISDBT_BAND_WIDTH, &unBwCtrl.u8);
    switch(pstChannel->unSRBW.u32BandWidth)
    {
        case 6000:
            unBwCtrl.bits.bw = 0xa;  //MHz
            break;
        case 7000:
            unBwCtrl.bits.bw = 0xb;  //MHz
            break;
        case 8000:
        default:
            unBwCtrl.bits.bw = 0xc;  //MHz
            break;
    }
    qam_write_byte(u32TunerPort, ISDBT_BAND_WIDTH, unBwCtrl.u8);

    ISDBT_HotReset(u32TunerPort);

    /* check whether sync ok,max timeout = 300ms */
    for(i=0; i<15; i++)
    {
        qam_read_byte(u32TunerPort, ISDBT_LOCK_FLAG, &u8RegVal);
        if(u8RegVal & 0x2)
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
        LOG_PrintInfo("sync not ok\n");
        pstChannel->enSyncLockStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
        return HI_SUCCESS;
    }

    HI_FuncExit();
    return HI_SUCCESS;
}


HI_S32 HiSDTV100_ISDBT_DeInit(HI_U32 u32TunerPort)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_FuncEnter();
    HI_TUNER_CHECK_FUNC_RET(s32Ret, ISDBT_AxiEn(u32TunerPort, HI_FALSE));

    HI_DRV_MMZ_UnmapAndRelease(&s_stIsdbtPara.stIsdbtBuf);
    s_stIsdbtPara.stIsdbtBuf.u32StartPhyAddr = 0;
    s_stIsdbtPara.stIsdbtBuf.pu8StartVirAddr = 0;

    LOG_PrintInfo("DisConnect successfully.\n");

    HI_FuncExit();
    return HI_SUCCESS;
}


HI_S32 HiSDTV100_ISDBT_Standby(HI_U32 u32TunerPort, HI_U32 u32Standby)
{
    HI_FuncEnter();
    if(0 == u32Standby)
    {
        qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL0, 0xff);
        HI_PRINT("wake up\n");
    }
    else
    {
        qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL0, 0xf0);
        msleep(1);
        HI_PRINT("standby\n");
    }

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ISDBT_Monitorlayer(HI_U32 u32TunerPort, HI_UNF_TUNER_MONITOR_LAYERS_CONFIG_S *pstMonitorLayersConfig)
{
    HI_U8 u8RegVal = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstMonitorLayersConfig);
    HI_DBG_PrintU32(pstMonitorLayersConfig->enMonitorLayer);

    /* clear first */
    qam_read_byte(u32TunerPort, ISDBT_PART_HIER, &u8RegVal);
    u8RegVal &= ~(7 << 5);
    //HiMDTV_I2C_WriteByte(ISDBT_PART_HIER, u8Temp);
    qam_write_byte(u32TunerPort, ISDBT_THRES, 0x31);

    switch (pstMonitorLayersConfig->enMonitorLayer)
    {
        case HI_UNF_TUNER_ISDBT_MONITOR_LAYER_A:
            u8RegVal |= 1 << 5;
            qam_write_byte(u32TunerPort, ISDBT_THRES, 0x00);
            break;
        case HI_UNF_TUNER_ISDBT_MONITOR_LAYER_B:
            u8RegVal |= 1 << 6;
            break;
        case HI_UNF_TUNER_ISDBT_MONITOR_LAYER_C:
            u8RegVal |= 1 << 7;
            break;
        case HI_UNF_TUNER_ISDBT_MONITOR_LAYER_ALL:
        /*now jump to default*/
        default:
            u8RegVal |= 7 << 5;
            break;
    }

    HI_DBG_PrintReg8(ISDBT_PART_HIER, u8RegVal);
    qam_write_byte(u32TunerPort, ISDBT_PART_HIER, u8RegVal);

    HI_FuncExit();
    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */
