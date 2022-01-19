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
#include "hiSDTV100_config.h"
#include "hiSDTV100_qtc.h"
#include "hiSDTV100_dvbt2_core.h"
#include "hiSDTV100_isdbt_core.h"
#include "hiSDTV100_cab_core.h"
#include "hiSDTV100_sat_core.h"
#include "hi_drv_file.h"
#include "drv_demod.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

static volatile HI_U32 *s_pu32InterQtcReg = NULL;
static MDTV_QTC_CTX_S  s_stDrvFeQtcCtx;
static HI_U32 s_u32WaitCount;

#define HISDTV100_QTC_CTRL_REG_ADD                 ((HI_U32 *)(s_pu32InterQtcReg) + 0x40/4)
#define HISDTV100_QTC_STATUS_REG_ADD               ((HI_U32 *)(s_pu32InterQtcReg) + 0x44/4)
#define HISDTV100_QTC_STARTADDR_REG_ADD        ((HI_U32 *)(s_pu32InterQtcReg) + 0x48/4)
#define HISDTV100_QTC_EDDADDR_REG_ADD          ((HI_U32 *)(s_pu32InterQtcReg) + 0x4c/4)
#define HISDTV100_QTC_GET_CTX()             (&s_stDrvFeQtcCtx)

static HI_S32 HiSDTV100_QTC_ResetDemod(HI_U32 u32TunerPort, HI_BOOL bEnable)
{
    HI_U8 u8RegVal = 0;
    static HI_U8 s_u8RegValRestore = 0;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    if (HI_TRUE == bEnable)
    {
        if((enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_CAB) || (enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_J83B))
        {
            qam_read_byte(u32TunerPort, DVBC_J83B_MAN_RST_CTRL1, &u8RegVal);
            u8RegVal &= ~(3<<3);
            qam_write_byte(u32TunerPort, DVBC_J83B_MAN_RST_CTRL1, u8RegVal);
        }
        else if((enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_DVB_T) || (enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_DVB_T2))
        {
            qam_read_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, &u8RegVal);
            u8RegVal &= ~(1<<3);
            qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, u8RegVal);

            qam_read_byte(u32TunerPort, DVBT2_STATE_WAITS, &s_u8RegValRestore);
            qam_write_byte(u32TunerPort, DVBT2_STATE_WAITS, 0xff);
        }
        else if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_ISDB_T)
        {
            qam_read_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL1, &u8RegVal);
            u8RegVal &= ~(1<<3);
            qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL1, u8RegVal);

            qam_read_byte(u32TunerPort, ISDBT_STATE_WAITS, &s_u8RegValRestore);
            qam_write_byte(u32TunerPort, ISDBT_STATE_WAITS, 0xff);
        }
        else if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_SAT)
        {
            qam_read_byte(u32TunerPort, SAT_MAN_RST_CTRL1, &u8RegVal);
            u8RegVal &= ~(1<<2);
            qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, u8RegVal);

            qam_read_byte(u32TunerPort, SAT_STATE_WAITS, &s_u8RegValRestore);
            qam_write_byte(u32TunerPort, SAT_STATE_WAITS, 0xff);
        }
        else
        {
            LOG_PrintError("Not support for [sigType:%d] now.\n", enCurrentSigType);
            return HI_FAILURE;
        }
        LOG_PrintInfo("Reset demod now...\n");
    }
    else
    {
        if((enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_CAB) || (enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_J83B))
        {
            qam_read_byte(u32TunerPort, DVBC_J83B_MAN_RST_CTRL1, &u8RegVal);
            u8RegVal |= (3<<3);
            qam_write_byte(u32TunerPort, DVBC_J83B_MAN_RST_CTRL1, u8RegVal);
        }
        else if((enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_DVB_T) || (enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_DVB_T2))
        {
            qam_read_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, &u8RegVal);
            u8RegVal |= (1<<3);
            qam_write_byte(u32TunerPort, DVBT2_MAN_RSTN_CTRL1, u8RegVal);

            LOG_PrintInfo("s_u8RegValRestore:%#x\n", s_u8RegValRestore);
            qam_write_byte(u32TunerPort, DVBT2_STATE_WAITS, s_u8RegValRestore);
        }
        else if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_ISDB_T)
        {
            qam_read_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL1, &u8RegVal);
            u8RegVal |= (1<<3);
            qam_write_byte(u32TunerPort, ISDBT_MAN_RSTN_CTRL1, u8RegVal);

            LOG_PrintInfo("s_u8RegValRestore:%#x\n", s_u8RegValRestore);
            qam_write_byte(u32TunerPort, ISDBT_STATE_WAITS, s_u8RegValRestore);
        }
        else if(enCurrentSigType == HI_UNF_TUNER_SIG_TYPE_SAT)
        {
            qam_read_byte(u32TunerPort, SAT_MAN_RST_CTRL1, &u8RegVal);
            u8RegVal |= (1<<2);
            qam_write_byte(u32TunerPort, SAT_MAN_RST_CTRL1, u8RegVal);

            LOG_PrintInfo("s_u8RegValRestore:%#x\n", s_u8RegValRestore);
            qam_write_byte(u32TunerPort, SAT_STATE_WAITS, s_u8RegValRestore);
        }
        else
        {
            LOG_PrintError("Not support for [sigType:%d] now.\n", enCurrentSigType);
            return HI_FAILURE;
        }
        LOG_PrintInfo("Run demod now...\n");
    }

    return HI_SUCCESS;
}

/* define QTC HAL Function  */
HI_VOID HiSDTV100_QTC_HAL_ClkEn(HI_U32 u32TunerPort, HI_BOOL bEn)
{
    volatile U_PERI_CRG56 PERI_CRG56;

    PERI_CRG56.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_CRG_RESET_ADDR);
    PERI_CRG56.bits.qtc_cken = (HI_U32)bEn;
    PERI_CRG56.bits.qtc_bus_cken = (HI_U32)bEn;

    if(HI_TRUE == bEn)
    {
        PERI_CRG56.bits.qtc_srst_req = 0x0;
    }
    else
    {
        PERI_CRG56.bits.qtc_srst_req = 0x1;
    }

    /*QAMADC默认是下降沿打数据，QTC需要用上升沿采。
    即QAMADC时钟同相，QTC相位需选择反相。*/
    PERI_CRG56.bits.qtc_clk_pctrl = 1;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CRG_RESET_ADDR, PERI_CRG56.u32);
}

HI_VOID HiSDTV100_QTC_HAL_SetQtcMode(HI_U32 u32TunerPort, MDTV_QTC_MODE_E enMode)
{
#ifndef HI_FPGA_SUPPORT
#if 0
    volatile U_QTC_MODE QTC_MODE;

    QTC_MODE.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_PERI_MODE_ADDR);
    QTC_MODE.bits.qtc_mode = (HI_U32)enMode;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_PERI_MODE_ADDR, QTC_MODE.u32);
#endif
#endif
}

HI_VOID HiSDTV100_QTC_HAL_SetQtcEquatorPath(HI_U32 u32TunerPort, HI_U32 u32Path)
{
#ifndef HI_FPGA_SUPPORT
#if 0
    volatile U_PERI_QTC_EQUA_SEL PERI_QTC_EQUA_SEL;

    PERI_QTC_EQUA_SEL.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_PERI_EQUASEL_ADDR);
    PERI_QTC_EQUA_SEL.bits.peri_qtc_equa_sel = (HI_U32)u32Path;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_PERI_EQUASEL_ADDR, PERI_QTC_EQUA_SEL.u32);
#endif
#endif
}

HI_VOID HiSDTV100_QTC_HAL_SetQtcStartAttr(HI_U32 u32TunerPort, HI_U32 u32Attr)
{
    volatile U_QTC_STARTATTR QTC_STARTATTR;

    QTC_STARTATTR.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_STARTADDR_REG_ADD);
    QTC_STARTATTR.bits.start_addr = u32Attr;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_STARTADDR_REG_ADD, QTC_STARTATTR.u32);

}

HI_VOID HiSDTV100_QTC_HAL_SetQtcEndAttr(HI_U32 u32TunerPort, HI_U32 u32Attr)
{
    volatile U_QTC_ENDATTR QTC_ENDATTR;

    QTC_ENDATTR.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_EDDADDR_REG_ADD);
    QTC_ENDATTR.bits.end_addr = u32Attr;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_EDDADDR_REG_ADD, QTC_ENDATTR.u32);
}

HI_VOID HiSDTV100_QTC_HAL_LoopWriteDisable(HI_U32 u32TunerPort, HI_BOOL bEn)
{
    volatile U_QTC_CTRL QTC_CTRL;

    QTC_CTRL.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_CTRL_REG_ADD);
    QTC_CTRL.bits.loop_write_disable = (HI_U32)bEn;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CTRL_REG_ADD, QTC_CTRL.u32);
}

HI_VOID HiSDTV100_QTC_HAL_IQSelect(HI_U32 u32TunerPort, MDTV_QTC_CHNL_IQ_E enIQ)
{
    volatile U_QTC_CTRL QTC_CTRL;

    QTC_CTRL.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_CTRL_REG_ADD);
    if (HIMDTV_QTC_CHNL_IQ == enIQ)
    {
        QTC_CTRL.bits.data_sel_mode = 1;
    }
    else if (HIMDTV_QTC_CHNL_I == enIQ)
    {
        QTC_CTRL.bits.data_sel_mode = 0;
        QTC_CTRL.bits.iq_sel_mode = 1;
    }
    else
    {
        QTC_CTRL.bits.data_sel_mode = 0;
        QTC_CTRL.bits.iq_sel_mode = 0;
    }
    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CTRL_REG_ADD, QTC_CTRL.u32);
}

HI_VOID HiSDTV100_QTC_HAL_SetDataFmt(HI_U32 u32TunerPort, MDTV_QTC_DATA_FMT_E enFmt)
{
    volatile U_QTC_CTRL QTC_CTRL;

    QTC_CTRL.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_CTRL_REG_ADD);
    QTC_CTRL.bits.data_sel_mode_eff = (HI_U32)enFmt;
    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CTRL_REG_ADD, QTC_CTRL.u32);
}

HI_VOID HiSDTV100_QTC_HAL_CollectEn(HI_U32 u32TunerPort, HI_BOOL bEn)
{
    volatile U_QTC_CTRL QTC_CTRL;

    QTC_CTRL.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_CTRL_REG_ADD);
    QTC_CTRL.bits.collect_en = (HI_U32)bEn;
    QTC_CTRL.bits.overflow_stop_en = 1;
    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CTRL_REG_ADD, QTC_CTRL.u32);
}

HI_VOID HiSDTV100_QTC_HAL_CtrlClear(HI_U32 u32TunerPort)
{
    volatile U_QTC_CTRL QTC_CTRL;

    QTC_CTRL.u32 = 0x0;

    HISDTV100_QTC_RegWrite(HISDTV100_QTC_CTRL_REG_ADD, QTC_CTRL.u32);
}

HI_BOOL HiSDTV100_QTC_HAL_GetEndFlag(HI_U32 u32TunerPort)
{
    volatile U_QTC_STATUS QTC_STATUS;

    QTC_STATUS.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_STATUS_REG_ADD);

    return (QTC_STATUS.bits.dump_end ? HI_TRUE : HI_FALSE);
}

HI_BOOL HiSDTV100_QTC_HAL_GetOverFlow(HI_U32 u32TunerPort)
{
    volatile U_QTC_STATUS QTC_STATUS;

    QTC_STATUS.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_STATUS_REG_ADD);

    return (QTC_STATUS.bits.overflow ? HI_TRUE : HI_FALSE);
}

HI_U32 HiSDTV100_QTC_HAL_GetCurWriteAddr(HI_U32 u32TunerPort)
{
    volatile U_QTC_STATUS QTC_STATUS;

    QTC_STATUS.u32 = HISDTV100_QTC_RegRead(HISDTV100_QTC_STATUS_REG_ADD);

    return (QTC_STATUS.bits.cur_wr_addr<<7);
}

/* End of QTC HAL Function  */

HI_S32 HiSDTV100_QTC_Init(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB)
{
    HI_S32 s32Ret = 0;
    MDTV_QTC_CTX_S *pstQtcCtx = NULL;

    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    pstQtcCtx->bQtcEndFlag = HI_FALSE;
    s_u32WaitCount = 0;

    if(HI_TRUE == pstQtcCtx->bInit)
    {
        LOG_PrintInfo("DRV FE QTC have already init! \n");
        return HI_SUCCESS;
    }

    memset(pstQtcCtx, 0, sizeof(MDTV_QTC_CTX_S));

    /*对系统寄存器作映射，以便后续访问*/
    if (NULL == s_pu32InterQtcReg)
    {
        s_pu32InterQtcReg = (HI_U32 *)ioremap_nocache(HISDTV100_QTC_REGS_BASE_ADDR, HISDTV100_QTC_REGS_SIZE);
        if (NULL == s_pu32InterQtcReg)
        {
            LOG_PrintError("DRV FE QTC ioremap failure!\n");
            return HI_FAILURE;
        }
    }

    /*申请采集的内存*/
    s32Ret = HI_DRV_MMZ_Alloc("DRV_FE_QTC_FB", NULL, u32QtcBuffSizeMB<<20,
                                                0, &pstQtcCtx->stFrameBuffer);
    if (HI_SUCCESS != s32Ret)
    {
        pstQtcCtx->stFrameBuffer.u32StartPhyAddr = 0;
        HI_ERR_PrintFuncResult(HI_DRV_MMZ_Alloc, s32Ret);
        return HI_FAILURE;
    }

    s32Ret = HI_DRV_MMZ_MapCache(&pstQtcCtx->stFrameBuffer);
    if (HI_SUCCESS != s32Ret)
    {
        pstQtcCtx->stFrameBuffer.u32StartPhyAddr = 0;
        HI_ERR_PrintFuncResult(HI_DRV_MMZ_MapCache, s32Ret);
        HI_DRV_MMZ_Release(&pstQtcCtx->stFrameBuffer);
        return HI_FAILURE;
    }

    pstQtcCtx->bInit = HI_TRUE;
    LOG_PrintInfo("DRV FE QTC init OK! \n");

    return HI_SUCCESS;
}

HI_VOID HiSDTV100_QTC_DeInit(HI_U32 u32TunerPort)
{
    MDTV_QTC_CTX_S *pstQtcCtx;

    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    HiSDTV100_QTC_HAL_ClkEn(u32TunerPort, HI_FALSE);
    LOG_PrintInfo("DRV FE QTC deInit OK, release buffer OK!\n");

    HI_DRV_MMZ_Unmap(&pstQtcCtx->stFrameBuffer);
    HI_DRV_MMZ_Release(&pstQtcCtx->stFrameBuffer);

    memset(pstQtcCtx, 0, sizeof(MDTV_QTC_CTX_S));
    pstQtcCtx->bInit = HI_FALSE;
}

HI_S32 HiSDTV100_QTC_Dump(HI_U32 u32TunerPort, HI_BOOL bLoopWirteDisable)
{
    MDTV_QTC_CTX_S *pstQtcCtx;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType;

    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    /* unreset qtc */
    HiSDTV100_QTC_HAL_ClkEn(u32TunerPort, HI_TRUE);

    /*配置采集模式*/
    HiSDTV100_QTC_HAL_SetQtcMode(u32TunerPort, HIMDTV_QTC_MODE_AIF_ADC);

    HiSDTV100_QTC_HAL_SetQtcEquatorPath(u32TunerPort, 0);
    HiSDTV100_QTC_HAL_CtrlClear(u32TunerPort);

    //HISDTV100_QTC_RegWrite(HISDTV100_QTC_PERI_VBI_CTRL_ADDR, 0x01);
    //HI_INFO_TUNER("DRV_FE_QTC_PERI_VBI_CTRL_ADD:%#x\n", HISDTV100_QTC_RegRead(HISDTV100_QTC_PERI_VBI_CTRL_ADDR));

    /*配置采集的内存首地址和尾地址*/
    LOG_PrintDebug("QTC Buf PhyAddr: StartPhyAddr = %#-8x, EndPhyAddr = %#-8x!\n",\
                        pstQtcCtx->stFrameBuffer.u32StartPhyAddr,
                        pstQtcCtx->stFrameBuffer.u32StartPhyAddr + pstQtcCtx->stFrameBuffer.u32Size);
    LOG_PrintDebug("QTC Buf VirAddr: StartVirAddr = %#-8x, EndVirAddr = %#-8x!\n",\
                        pstQtcCtx->stFrameBuffer.pu8StartVirAddr,
                        pstQtcCtx->stFrameBuffer.pu8StartVirAddr + pstQtcCtx->stFrameBuffer.u32Size);
    HiSDTV100_QTC_HAL_SetQtcStartAttr(u32TunerPort, pstQtcCtx->stFrameBuffer.u32StartPhyAddr);
    HiSDTV100_QTC_HAL_SetQtcEndAttr(u32TunerPort, pstQtcCtx->stFrameBuffer.u32StartPhyAddr + pstQtcCtx->stFrameBuffer.u32Size);

    /*配置数据是否循环写*/
    HiSDTV100_QTC_HAL_LoopWriteDisable(u32TunerPort, bLoopWirteDisable);

    if (HI_UNF_TUNER_SIG_TYPE_SAT ==  enCurrentSigType)
    {
        /*IQ通道选择*/
        HiSDTV100_QTC_HAL_IQSelect(u32TunerPort, HIMDTV_QTC_CHNL_IQ);

        /*配置QTC写入DDR数据格式*/
        HiSDTV100_QTC_HAL_SetDataFmt(u32TunerPort, HIMDTV_QTC_DATA_FMT_16BIT);
    }
    else
    {
        /*IQ通道选择*/
        HiSDTV100_QTC_HAL_IQSelect(u32TunerPort, HIMDTV_QTC_CHNL_I);

        /*配置QTC写入DDR数据格式*/
        HiSDTV100_QTC_HAL_SetDataFmt(u32TunerPort, HIMDTV_QTC_DATA_FMT_128BIT);
    }
    /*采集使能信号*/
    HiSDTV100_QTC_HAL_CollectEn(u32TunerPort, HI_TRUE);

    LOG_PrintInfo("FE QTC start to dump...Waiting...Waiting...\n");

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_QTC_Check_EndFlag(HI_U32 u32TunerPort, HI_BOOL *pbFlag)
{
    MDTV_QTC_CTX_S *pstQtcCtx;
    HI_BOOL bFlag;

    pstQtcCtx = HISDTV100_QTC_GET_CTX();

    if(s_u32WaitCount >= 30000)
    {
        LOG_PrintError("Wait too long!Make sure you can lock the demod.\n");
        HiSDTV100_QTC_DeInit(u32TunerPort);
        return HI_FAILURE;
    }

    bFlag = HiSDTV100_QTC_HAL_GetEndFlag(u32TunerPort);
    if(HI_FALSE == bFlag)
    {
        s_u32WaitCount++;
        *pbFlag = bFlag;
        return HI_SUCCESS;
    }

    *pbFlag = bFlag;
    pstQtcCtx->bQtcEndFlag = bFlag;
    LOG_PrintInfo("FE QTC dump end!Elapse:%d ms.\n",s_u32WaitCount*2);

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_QTC_GetState(HI_U32 u32TunerPort, HI_BOOL *pbState)
{
    MDTV_QTC_CTX_S *pstQtcCtx;

    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    *pbState = pstQtcCtx->bQtcEndFlag;

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_QTC_GetFilePathAndName(HI_U32 u32Tunerport, HI_CHAR *acQtcFilePathAndName, HI_U32 u32FileNameLen)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_CHAR acQtcFilePath[HISDTV100_QTC_FILE_NAME_LEN] = {0};
    const HI_PCHAR apSignalTypeString[] ={"DVB-C","DVB-S","DVB-T","DVB-T2","ISDB-T","ATSC-T","DTMB","J83B","ABSS","BUTT"};
    HI_U8 u8SigTypeIndex = 0;
    struct tm now;

    for (u8SigTypeIndex = 0; u8SigTypeIndex < sizeof(apSignalTypeString)/sizeof(apSignalTypeString[0]) - 1; u8SigTypeIndex++)
    {
        if (g_stTunerOps[u32Tunerport].enSigType & (1 << u8SigTypeIndex))
        {
            break;
        }
    }

    /*处理存储路径*/
    s32Ret = HI_DRV_FILE_GetStorePath(acQtcFilePath, HISDTV100_QTC_FILE_NAME_LEN);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HI_DRV_FILE_GetStorePath, s32Ret);
        return s32Ret;
    }
    HI_DBG_PrintStr(acQtcFilePath);

    time_to_tm(get_seconds(), 0, &now);
    s32Ret = snprintf(acQtcFilePathAndName, u32FileNameLen,"%s/%s_%s_%dkHz_%04u-%02u-%02u_%02u-%02u-%02u.%s",
                acQtcFilePath,
                HISDTV100_QTC_FILE_NAME,
                apSignalTypeString[u8SigTypeIndex],
                g_stTunerOps[u32Tunerport].stCurrPara.u32Frequency,
                (HI_U32)(now.tm_year+1900),
                now.tm_mon+1,
                now.tm_mday,
                now.tm_hour,
                now.tm_min,
                now.tm_sec,
                HISDTV100_QTC_FILE_POSTFIX);
    if (HI_SUCCESS > s32Ret)
    {
        acQtcFilePathAndName[sizeof(acQtcFilePathAndName) -1] = '\0';
        HI_ERR_PrintStr(acQtcFilePathAndName);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_QTC_WriteDataToFile(HI_U32 u32TunerPort, const HI_S8* ps8FileName, HI_S8* ps8Buf, HI_U32 u32Len)
{
    struct file *fp = NULL;
    HI_S32 s32WriteLen = 0;

    if (ps8FileName == NULL || ps8Buf == NULL)
    {
        HI_ERR_TUNER("para is invalid!\n");
        return HI_FAILURE;
    }

    HI_INFO_TUNER("Start write QTC data(size:%dByte) to [%s]...Waiting...\n", u32Len, ps8FileName);

    fp = HI_DRV_FILE_Open(ps8FileName, O_RDWR|O_CREAT|O_TRUNC);
    if (fp == NULL)
    {
        LOG_PrintError("HI_DRV_FILE_Open failure!\n");
        return HI_FAILURE;
    }

    s32WriteLen = HI_DRV_FILE_Write(fp, (HI_U8 *)ps8Buf, u32Len);
    if (u32Len != s32WriteLen)
    {
        HI_DRV_FILE_Close(fp);
        LOG_PrintError("Only write QTC data(writed=%dKB, total=%dKB) to [%s].\n", s32WriteLen/1024, u32Len/1024, ps8FileName);
        return HI_FAILURE;
    }

    HI_DRV_FILE_Close(fp);

    HI_PRINT("Write QTC data(writed=%dKB, total=%dKB) to [%s] successfully.\n", s32WriteLen/1024, u32Len/1024, ps8FileName);

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_QTC_GetQtcData(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_BOOL bQtcEndFlag = HI_FALSE;
    MDTV_QTC_CTX_S *pstQtcCtx = NULL;
    HI_CHAR acQtcFilePathAndName[HISDTV100_QTC_FILE_NAME_LEN]  = {0};

    /*1.系统寄存器映射、初始化内存空间等工作*/
    s32Ret = HiSDTV100_QTC_Init(u32TunerPort, u32QtcBuffSizeMB);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_Init, s32Ret);
        goto out;
    }

    /*2.配置QTC，并启动采集*/
    s32Ret = HiSDTV100_QTC_Dump(u32TunerPort, HI_TRUE);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_Dump, s32Ret);
        goto out;
    }

    /*3.查询是否采集完成*/
    while(bQtcEndFlag == HI_FALSE)
    {
        s32Ret = HiSDTV100_QTC_Check_EndFlag(u32TunerPort, &bQtcEndFlag);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_Check_EndFlag, s32Ret);
            goto out;
        }
        msleep(2);
    }

    /*4.处理存储路径*/
    s32Ret = HiSDTV100_QTC_GetFilePathAndName(u32TunerPort, acQtcFilePathAndName, HISDTV100_QTC_FILE_NAME_LEN);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetFilePathAndName, s32Ret);
        goto out;
    }

    /*5.将采集的数据写入文件*/
    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    s32Ret = HiSDTV100_QTC_WriteDataToFile(u32TunerPort, acQtcFilePathAndName,
                                                            (HI_S8*)pstQtcCtx->stFrameBuffer.pu8StartVirAddr,
                                                            pstQtcCtx->stFrameBuffer.u32Size);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_WriteDataToFile, s32Ret);
        goto out;
    }

 out:
    /*6.进行系统寄存器反映射*/
    HiSDTV100_QTC_DeInit(u32TunerPort);

#if 0
    /*当返回错误时，打印调试信息*/
    LOG_PrintError("HIMDTV_QTC_CTRL_REG_ADD:%#x\n", HISDTV100_QTC_RegRead(HISDTV100_QTC_CTRL_REG_ADD));
    LOG_PrintError("HIMDTV_QTC_STATUS_REG_ADD:%#x\n", HISDTV100_QTC_RegRead(HISDTV100_QTC_STATUS_REG_ADD));
#endif

    return s32Ret;
}


HI_S32 HiSDTV100_QTC_GetQtcDataLoopMode(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB, HI_U32 u32RecordFileSizeMB)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_CHAR acQtcFilePathAndName[HISDTV100_QTC_FILE_NAME_LEN]  = {0};
    HI_U32 u32StartWritePhyAddr = 0;
    HI_U32 u32CurWritePhyAddr = 0;
    HI_U32 u32LastWritePhyAddr = 0;
    HI_U64 u64WriteDataSize = 0;
    HI_U64 u64RecordFileSize = 0;
    MDTV_QTC_CTX_S *pstQtcCtx = NULL;
    struct timeval stStartTime,stEndTime;
    struct file *fp = NULL;

    u64RecordFileSize = (HI_U64)u32RecordFileSizeMB;
    u64RecordFileSize = u64RecordFileSize<<20;

    /*处理存储路径*/
    s32Ret = HiSDTV100_QTC_GetFilePathAndName(u32TunerPort, acQtcFilePathAndName, HISDTV100_QTC_FILE_NAME_LEN);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetFilePathAndName, s32Ret);
        return HI_FAILURE;
    }

    fp = HI_DRV_FILE_Open(acQtcFilePathAndName, O_RDWR|O_CREAT|O_TRUNC);
    if (fp == NULL)
    {
        HI_ERR_PrintFuncResult(HI_DRV_FILE_Open, s32Ret);
        return HI_FAILURE;
    }

    /*1.系统寄存器映射、初始化内存空间等工作*/
    s32Ret = HiSDTV100_QTC_Init(u32TunerPort, u32QtcBuffSizeMB);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_Init, s32Ret);
        HI_DRV_FILE_Close(fp);
        return HI_FAILURE;
    }

    /*2.配置QTC，并启动采集*/
    s32Ret = HiSDTV100_QTC_Dump(u32TunerPort, HI_FALSE);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_Dump, s32Ret);
        HI_DRV_FILE_Close(fp);
        HiSDTV100_QTC_DeInit(u32TunerPort);
        return HI_FAILURE;
    }

    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    u32StartWritePhyAddr = pstQtcCtx->stFrameBuffer.u32StartPhyAddr;
    u32LastWritePhyAddr = u32StartWritePhyAddr;
    u64WriteDataSize = 0;

    do_gettimeofday(&stStartTime);
    while(u64WriteDataSize < u64RecordFileSize)
    {
        u32CurWritePhyAddr = HiSDTV100_QTC_HAL_GetCurWriteAddr(u32TunerPort);
        HI_PRINT("u32CurWritePhyAddr:%#-8x\n", u32CurWritePhyAddr);
        if (u32LastWritePhyAddr < u32CurWritePhyAddr)
        {
            HI_S32 u32WriteLength = u32CurWritePhyAddr - u32LastWritePhyAddr;
            HI_U8 *psBuf = (HI_U8 *)(pstQtcCtx->stFrameBuffer.pu8StartVirAddr + u32LastWritePhyAddr - u32StartWritePhyAddr);
            HI_S32 s32WriteLen = HI_DRV_FILE_Write(fp, (HI_U8 *)psBuf, u32WriteLength);
            if (s32WriteLen < 0)
            {
                HI_ERR_PrintFuncResult(HI_DRV_FILE_Write, s32WriteLen);
                s32Ret = HI_FAILURE;
                break;
            }
            u32LastWritePhyAddr += s32WriteLen;
            u64WriteDataSize += s32WriteLen;
            HI_PRINT("Write QTC data(writed=%dKB, total=%dKB) to [%s] successfully.\n", s32WriteLen/1024, u32WriteLength/1024, acQtcFilePathAndName);
        }
        else if (u32LastWritePhyAddr > u32CurWritePhyAddr)
        {
            HI_S32 u32WriteLength = (u32StartWritePhyAddr + pstQtcCtx->stFrameBuffer.u32Size) - u32LastWritePhyAddr;
            HI_U8 *psBuf = (HI_U8 *)(pstQtcCtx->stFrameBuffer.pu8StartVirAddr + u32LastWritePhyAddr - u32StartWritePhyAddr);
            HI_S32 s32WriteLen = HI_DRV_FILE_Write(fp, psBuf, u32WriteLength);
            if (s32WriteLen <= 0)
            {
                HI_ERR_PrintFuncResult(HI_DRV_FILE_Write, s32WriteLen);
                s32Ret = HI_FAILURE;
                break;
            }
            u32LastWritePhyAddr = u32StartWritePhyAddr;
            u64WriteDataSize += u32WriteLength;
            HI_PRINT("Write QTC data(writed=%dKB, total=%dKB) to [%s] successfully.\n", s32WriteLen/1024, u32WriteLength/1024, acQtcFilePathAndName);
        }
        else //u32LastWritePhyAddr == u32CurWritePhyAddr
        {
            if(HiSDTV100_QTC_HAL_GetOverFlow(u32TunerPort))
            {
                LOG_PrintError("QTC over flowed!.\n");
                s32Ret = HI_FAILURE;
                break;
            }
        }

        HI_PRINT("Write completion:%d %%\n\n", ((HI_U32)(u64WriteDataSize>>10)*100/(u32RecordFileSizeMB*1024)));
    }
    do_gettimeofday(&stEndTime);
    HI_PRINT("DRV_FE_QTC_WriteDataToFile used %ld ms.\n", (stEndTime.tv_sec-stStartTime.tv_sec)*1000+(stEndTime.tv_usec-stStartTime.tv_usec)/1000);

    HI_DRV_FILE_Close(fp);
    HiSDTV100_QTC_HAL_CollectEn(u32TunerPort, HI_FALSE);

    HiSDTV100_QTC_DeInit(u32TunerPort);
    return s32Ret;
}

HI_S32 HiSDTV100_QTC_GetStorageRWSpeed(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB, HI_U32 u32RecordFileSizeMB, HI_U32 *pu32WSpeed)
{
    HI_U8 i = 0;
    HI_S32 s32Ret = HI_FAILURE;
    MDTV_QTC_CTX_S *pstQtcCtx = NULL;
    HI_CHAR acQtcFilePath[HISDTV100_QTC_FILE_NAME_LEN] = {0};
    HI_CHAR acQtcFilePathAndName[HISDTV100_QTC_FILE_NAME_LEN]  = {0};
    struct tm now;
    struct timeval stStartTime,stEndTime;
    HI_U32 u32RWFileTimeUsed = 0;
    HI_U32 u32RWFileTotalTimeUsed = 0, u32WriteCnt = 0;
    HI_CHAR acSystemCmd[HISDTV100_QTC_FILE_NAME_LEN] = {0};
    char *argv[] = {"/bin/sh", "-c", acSystemCmd, NULL};
    char *envp[] = {"HOME=/","TERM=linux","PATH=/sbin:/usr/sbin:/bin:/usr/bin",NULL};

    HI_PRINT("start block write performance test......\n\n");
    /*1.系统寄存器映射、初始化内存空间等工作*/
    s32Ret = HiSDTV100_QTC_Init(u32TunerPort, u32QtcBuffSizeMB);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_Init, s32Ret);
        goto out;
    }

    /*2.处理存储路径*/
    s32Ret = HI_DRV_FILE_GetStorePath(acQtcFilePath, HISDTV100_QTC_FILE_NAME_LEN);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HI_DRV_FILE_GetStorePath, s32Ret);
        goto out;
    }
    HI_DBG_PrintStr(acQtcFilePath);

    time_to_tm(get_seconds(), 0, &now);
    s32Ret = snprintf(acQtcFilePathAndName, sizeof(acQtcFilePathAndName),"%s/%s_%04u-%02u-%02u_%02u-%02u-%02u.%s",
                acQtcFilePath,
                HISDTV100_QTC_FILE_NAME,
                (HI_U32)(now.tm_year+1900),
                now.tm_mon+1,
                now.tm_mday,
                now.tm_hour,
                now.tm_min,
                now.tm_sec,
                HISDTV100_QTC_FILE_POSTFIX);
    if (HI_SUCCESS > s32Ret)
    {
        acQtcFilePathAndName[sizeof(acQtcFilePathAndName) -1] = '\0';
        HI_ERR_PrintStr(acQtcFilePathAndName);
        goto out;
    }

    /*3.测试存储介质的写性能*/
    pstQtcCtx = HISDTV100_QTC_GET_CTX();
    LOG_PrintDebug("QTC Buf PhyAddr: StartPhyAddr = %#-8x, EndPhyAddr = %#-8x!\n",\
                        pstQtcCtx->stFrameBuffer.u32StartPhyAddr,
                        pstQtcCtx->stFrameBuffer.u32StartPhyAddr + pstQtcCtx->stFrameBuffer.u32Size);
    LOG_PrintDebug("QTC Buf VirAddr: StartVirAddr = %#-8x, EndVirAddr = %#-8x!\n",\
                        pstQtcCtx->stFrameBuffer.pu8StartVirAddr,
                        pstQtcCtx->stFrameBuffer.pu8StartVirAddr + pstQtcCtx->stFrameBuffer.u32Size);
    memset(pstQtcCtx->stFrameBuffer.pu8StartVirAddr, 0x55, pstQtcCtx->stFrameBuffer.u32Size);

    u32WriteCnt = u32RecordFileSizeMB/u32QtcBuffSizeMB + !!(u32RecordFileSizeMB%u32QtcBuffSizeMB);
    u32WriteCnt = u32WriteCnt < HISDTV100_TEST_RW_CNT ? u32WriteCnt : HISDTV100_TEST_RW_CNT;
    for (i=0; i<u32WriteCnt; i++)
    {
        LOG_PrintInfo("write %d times starting...\n", i);
        do_gettimeofday(&stStartTime);
        s32Ret = HiSDTV100_QTC_WriteDataToFile(u32TunerPort, acQtcFilePathAndName,
                                                                (HI_S8*)(pstQtcCtx->stFrameBuffer.pu8StartVirAddr),   /*此处要转换为虚拟地址*/
                                                                pstQtcCtx->stFrameBuffer.u32Size);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_WriteDataToFile, s32Ret);
            goto out;
        }
        do_gettimeofday(&stEndTime);
        u32RWFileTimeUsed = (stEndTime.tv_sec-stStartTime.tv_sec)*1000+(stEndTime.tv_usec-stStartTime.tv_usec)/1000;
        LOG_PrintInfo("write %d times end. used %d ms.\n\n", i, u32RWFileTimeUsed);
        u32RWFileTotalTimeUsed += u32RWFileTimeUsed;
    }
    HI_DBG_PrintH32(pstQtcCtx->stFrameBuffer.u32Size);
    if (0 == u32RWFileTotalTimeUsed)
    {
        LOG_PrintError("u32RWFileTotalTimeUsed is zero.\n");
        goto out;
    }
    else
    {
        *pu32WSpeed = (pstQtcCtx->stFrameBuffer.u32Size>>10)*1000*u32WriteCnt/u32RWFileTotalTimeUsed;
    }
    HI_PRINT("write performance: use average time:%d ms, speed %d KB/s.\n\n", u32RWFileTotalTimeUsed/HISDTV100_TEST_RW_CNT, *pu32WSpeed);

 out:
    /*4.进行系统寄存器反映射*/
    HiSDTV100_QTC_DeInit(u32TunerPort);

    /*5.删除创建的文件*/
    memset(acSystemCmd, 0, sizeof(acSystemCmd));
    snprintf(acSystemCmd, sizeof(acSystemCmd), "rm -rvf %s", acQtcFilePathAndName);
    call_usermodehelper(argv[0], argv, envp, UMH_WAIT_PROC);

    return HI_SUCCESS;
}

HI_S32 HiSDTV100_ADP_QTC_GetDataContinues(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB, HI_U32 u32RecordFileSizeMB)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32WSpeed = 0, u32ADCSpeed = 0;

    if (0 == u32QtcBuffSizeMB)
    {
        LOG_PrintError("u32MaxMemSize is zero!\n");
        return HI_FAILURE;
    }

    if (u32RecordFileSizeMB > (1024 *1024) )
    {
        LOG_PrintError("Not support single file greater than 1TB!\n");
        return HI_FAILURE;
    }

    if (0 == u32RecordFileSizeMB)
    {
        s32Ret = HiSDTV100_QTC_GetQtcData(u32TunerPort, u32QtcBuffSizeMB);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetQtcData, s32Ret);
            return HI_FAILURE;
        }
        return HI_SUCCESS;
    }

    if (HI_UNF_TUNER_SIG_TYPE_SAT == g_stTunerOps[u32TunerPort].enSigType)
    {
        u32ADCSpeed = 270*1024; /* 135M*16bit/8=270MBit/s */
    }
    else
    {
        u32ADCSpeed = 45*1024; /* 30M*12bit/8=45MBit/s */
    }

    s32Ret = HiSDTV100_QTC_GetStorageRWSpeed(u32TunerPort, u32QtcBuffSizeMB, u32RecordFileSizeMB, &u32WSpeed);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetStorageRWSpeed, s32Ret);
        return HI_FAILURE;
    }

    /*测试时，发现没有存储介质可以写或已满，所以速度为0*/
    if (0 == u32WSpeed)
    {
        LOG_PrintError("No storage device found or storage device is full!\n");
        return HI_FAILURE;
    }
    /*若写速度小于等于ADC速率,那么只把RAM的数据拷贝写一次。*/
    else if (u32WSpeed <= u32ADCSpeed)
    {
        HI_U32 u32WriteCnt, i;
        struct timeval stStartTime,stEndTime;
        HI_U32 u32RWFileTimeUsed = 0;

        u32WriteCnt = u32RecordFileSizeMB/u32QtcBuffSizeMB + !!(u32RecordFileSizeMB%u32QtcBuffSizeMB);
        HI_PRINT("The speed of current data storage device  is too low(%d kB/s)!So record %d kB to data storage device %d times!\n\n",
                        u32WSpeed, u32QtcBuffSizeMB<<10, u32WriteCnt);
        for (i = 0; i<u32WriteCnt; i++)
        {
            HI_PRINT("write %d times starting...Remain %d times.\n", i, u32WriteCnt - i - 1);
            do_gettimeofday(&stStartTime);
            s32Ret = HiSDTV100_QTC_GetQtcData(u32TunerPort, u32QtcBuffSizeMB);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetQtcData, s32Ret);
                return HI_FAILURE;
            }
            do_gettimeofday(&stEndTime);
            u32RWFileTimeUsed = (stEndTime.tv_sec-stStartTime.tv_sec)*1000+(stEndTime.tv_usec-stStartTime.tv_usec)/1000;
            HI_PRINT("write %d times end, remain %d times. used %d ms.\n\n", i, u32WriteCnt -i - 1, u32RWFileTimeUsed);
        }
        return HI_SUCCESS;
    }
    /*若写速度大于ADC速率,那么写的数据量可以应付ADC输入的数据量。*/
    else
    {
        s32Ret = HiSDTV100_QTC_ResetDemod(u32TunerPort, HI_TRUE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_ResetDemod, s32Ret);
            return s32Ret;
        }

        s32Ret = HiSDTV100_QTC_GetQtcDataLoopMode(u32TunerPort, u32QtcBuffSizeMB, u32RecordFileSizeMB);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_GetQtcDataLoopMode, s32Ret);
            /* Not return, continue and release reset demod */
        }

        s32Ret = HiSDTV100_QTC_ResetDemod(u32TunerPort, HI_FALSE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_QTC_ResetDemod, s32Ret);
            return s32Ret;
        }
    }
    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

