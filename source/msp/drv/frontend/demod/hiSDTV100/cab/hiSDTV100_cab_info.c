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

#include "hiSDTV100_cab_core.h"
#include "hiSDTV100_cab_info.h"
#include "drv_demod.h"
#include "hi_drv_file.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

HI_S32 HiSDTV100_Cab_GetStatus(HI_U32 u32TunerPort, HI_UNF_TUNER_LOCK_STATUS_E *penTunerStatus)
{
    HI_U8 u8RegVal = 0;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(penTunerStatus);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegVal);
            if((u8RegVal & 0xbf) == 0xbf)
            {
                *penTunerStatus = HI_UNF_TUNER_SIGNAL_LOCKED;
            }
            else
            {
                *penTunerStatus = HI_UNF_TUNER_SIGNAL_DROPPED;
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

HI_S32 HiSDTV100_Cab_GetBer(HI_U32 u32TunerPort, HI_U32 *pu32BER)
{
    HI_U8 u8RegVal = 0, u8RegVal1 = 0, u8RegVal2 = 0;
    HI_U32 u32BER = 0;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32BER);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegVal);
            if(0x0 == (u8RegVal & 0x30))
            {
                LOG_PrintInfo("fec_no_ok!\n");
                pu32BER[0] = 0;
                pu32BER[1] = 0;
                pu32BER[2] = 0;
                HI_FuncExit();
                return HI_SUCCESS;
            }

            qam_read_byte(u32TunerPort,DVBC_J83B_ERR_PKT_L, &u8RegVal1);
            qam_read_byte(u32TunerPort,DVBC_J83B_ERR_PKT_H, &u8RegVal2);// Read registers step: First low reg, then high reg
            u8RegVal2 = ( u8RegVal2 & 0x1F );
            u32BER = ( u8RegVal2 << 8 ) | u8RegVal1;
            pu32BER[0] = u32BER;
            pu32BER[1] = 0;
            pu32BER[2] = 0;

            HI_DBG_PrintU32(pu32BER[0]);

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

HI_S32 HiSDTV100_Cab_GetSnr(HI_U32 u32TunerPort, HI_U32 * pu32SNR)
{
    HI_U8  u8RegVal = 0;
    HI_U8  au8RegData[2] = { 0 };
    HI_U32 u32Snr = 0;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SNR);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegVal);
            if(0x0 == (u8RegVal & 0x4))
            {
                LOG_PrintInfo("equ_no_ok!\n");
                HI_FuncExit();
                return HI_SUCCESS;
            }

            qam_read_byte(u32TunerPort, DVBC_J83B_NOISE_POW_L, &au8RegData[0]);
            qam_read_byte(u32TunerPort, DVBC_J83B_NOISE_POW_H, &au8RegData[1]);// Read registers step: First low reg, then high reg
            u32Snr = au8RegData[0] + au8RegData[1]*256;

            *pu32SNR = u32Snr;

            HI_DBG_PrintU32(*pu32SNR);

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

HI_S32 HiSDTV100_Cab_GetSignalStrength(HI_U32 u32TunerPort, HI_U32 *pu32SignalStrength)
{
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32SignalStrength);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            HI_U8  u8RegData = 0;
            HI_U8  au8RegData[2] = { 0 };
            HI_U32 u32TmpSigStrength = 0;

            qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegData);
            if(0x0 == (u8RegData & 0x1))
            {
                LOG_PrintInfo("agc_no_ok! \n");
                HI_FuncExit();
                return HI_SUCCESS;
            }

            qam_read_byte(u32TunerPort, DVBC_J83B_AGC_CTRL_L, &au8RegData[0]);
            qam_read_byte(u32TunerPort, DVBC_J83B_AGC_CTRL_H, &au8RegData[1]);// Read registers step: First low reg, then high reg
            u32TmpSigStrength = au8RegData[0] + (au8RegData[1] & 0x0f)*256;
            if(u32TmpSigStrength <= 419)
            {
                pu32SignalStrength[1] = 99;
            }
            else if(u32TmpSigStrength >= 2498)
            {
                pu32SignalStrength[1] = 10;
            }
            else
            {
                pu32SignalStrength[1] = 117 - u32TmpSigStrength * 89 / 2079;
            }

            HI_DBG_PrintU32(u32TmpSigStrength);
            HI_DBG_PrintU32(pu32SignalStrength[1]);

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

HI_S32 HiSDTV100_Cab_GetSignalInfo(HI_U32 u32TunerPort, HI_UNF_TUNER_SIGNALINFO_S *pstInfo)
{
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pstInfo);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

        pstInfo->enSigType = enCurrentSigType;

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

HI_S32 HiSDTV100_Cab_GetFreqSymbOffset(HI_U32 u32TunerPort, HI_U32 * pu32Freq, HI_U32 * pu32Symb )
{
    HI_U8  u8RegVal = 0;
    HI_U32 u32Freq = 0;
    HI_S32 s32FreqOffset = 0;
    HI_U8  au8RegData[2] = { 0 };
    HI_S32 s32RealSymb = 0;
    HI_UNF_TUNER_SIG_TYPE_E enCurrentSigType = HiSDTV100_GetDevSigType(u32TunerPort);

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu32Symb);

    if ((HI_UNF_TUNER_SIG_TYPE_CAB == enCurrentSigType) || (HI_UNF_TUNER_SIG_TYPE_J83B == enCurrentSigType))
    {
        #if defined(HISDTV100_SUPPORT_DVBC) || defined(HISDTV100_SUPPORT_J83B)

            qam_read_byte(u32TunerPort, DVBC_J83B_LOCK_FLAG, &u8RegVal);
            if(0x0 == (u8RegVal & 0x30))
            {
                LOG_PrintInfo("fec_no_ok!\n");
                HI_FuncExit();
                return HI_SUCCESS;
            }

            /* calc freq */
            qam_read_byte(u32TunerPort, DVBC_J83B_FREQ_DEV_L, &au8RegData[0]);
            qam_read_byte(u32TunerPort, DVBC_J83B_FREQ_DEV_H, &au8RegData[1]);// Read registers step: First low reg, then high reg
            u32Freq = au8RegData[0] + au8RegData[1]*256;
            if(u32Freq >= 32768)
            {
                s32FreqOffset = u32Freq - 65536;
            }
            else
            {
                s32FreqOffset = u32Freq;
            }

            *pu32Symb = s32FreqOffset;
            HI_DBG_PrintU32(s32FreqOffset);

            /* calc symbolrate */
            qam_read_byte(u32TunerPort, DVBC_J83B_FS_L, &au8RegData[0]);
            qam_read_byte(u32TunerPort, DVBC_J83B_FS_H, &au8RegData[1]);

            s32RealSymb = au8RegData[0] + au8RegData[1]*256;

            *pu32Symb = s32RealSymb;
            HI_DBG_PrintU32(s32RealSymb);

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

HI_S32 HiSDTV100_Cab_GetSampleData(HI_U32 u32TunerPort, TUNER_DATA_SRC_E enDataSrc, HI_U32 u32DataLen, HI_UNF_TUNER_SAMPLE_DATA_S *pstData)
{
    HI_U8 status = 0;
    HI_U32 i = 0, j = 0;
    HI_U8 data_l = 0, data_m = 0, data_h = 0;
    HI_U32 u32WaitCnt = 1000, u32Temp = 0;

    HI_FuncEnter();

    qam_read_byte(u32TunerPort, DVBC_J83B_CATCH_CLK_SEL, &status);
    status = (status & 0xf8) | 0;
    qam_write_byte(u32TunerPort, DVBC_J83B_CATCH_CLK_SEL, status);

    //release catch_rst
    qam_read_byte(u32TunerPort, DVBC_J83B_AXI_RSTN, &status);
    status = status | 0x01 ;
    qam_write_byte(u32TunerPort, DVBC_J83B_AXI_RSTN, status);
    for (i = 0; i < (u32DataLen + CAB_SAMPLE_DATA_CNT - 1) / CAB_SAMPLE_DATA_CNT; i++)
    {
        tuner_mdelay(1);
        //2. init
        status = 0x00; // cfg_catch_en = 0, cfg_test_mode = 0
        qam_write_byte(u32TunerPort,DVBC_J83B_CATCH_EN, status);

        //dvbc catch_start off
        qam_read_byte(u32TunerPort,DVBC_J83B_CATCH_CTRL,&status);
        status = status & 0x7f ;
        qam_write_byte(u32TunerPort,DVBC_J83B_CATCH_CTRL, status);

        //4. config mode & catch_ena
        status = 0x04 | 0; // cfg_catch_en = 1, cfg_test_mode = mode
        qam_write_byte(u32TunerPort,DVBC_J83B_CATCH_EN, status);

        //dvbs catch_start on
        tuner_mdelay(1);

        qam_read_byte(u32TunerPort,DVBC_J83B_CATCH_CTRL,&status);
        status = status | 0x80 ;
        qam_write_byte(u32TunerPort,DVBC_J83B_CATCH_CTRL, status);

        //5. wait for catch end
        tuner_mdelay(1);
        qam_read_byte(u32TunerPort,DVBC_J83B_CATCH_EN,&status);

        while((status & 0x02) == 0x00 && u32WaitCnt > 0)
        {
            tuner_mdelay(1);
            u32WaitCnt--;
            qam_read_byte(u32TunerPort,DVBC_J83B_CATCH_EN,&status);
        }
        if (!u32WaitCnt)
        {
            LOG_PrintWarning("wait for catch end timeout!\n");
            HI_ERR_PrintErrCode(HI_ERR_TUNER_CATCH_TIMEOUT);
            return HI_ERR_TUNER_CATCH_TIMEOUT;
        }
        //6. read smp from data

        for (j = 0; j < CAB_SAMPLE_DATA_CNT && i * CAB_SAMPLE_DATA_CNT + j < u32DataLen; j++)
        {
            qam_read_byte(u32TunerPort, DVBC_J83B_CATCH_DATA, &data_l);
            qam_read_byte(u32TunerPort, DVBC_J83B_CATCH_DATA, &data_m);
            qam_read_byte(u32TunerPort, DVBC_J83B_CATCH_DATA, &data_h);
            u32Temp = (data_h << 16) | (data_m << 8) | data_l;
            //HI_PRINT("%d,%d,%d\n", data_l, data_m, data_h);
            pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataQP = u32Temp & 0x3ff;
            if(pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataQP >= 512)
            {
                pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataQP -= 1024;
            }

            pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataIP = (u32Temp >> 10) & 0x3ff;
            if(pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataIP >= 512)
            {
                pstData[i * CAB_SAMPLE_DATA_CNT + j].s32DataIP -= 1024;
            }
        }
    }

    HI_FuncExit();
    return HI_SUCCESS;
}



#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

