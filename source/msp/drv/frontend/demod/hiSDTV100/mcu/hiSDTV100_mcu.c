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
#include "hi_type.h"
#include "hiSDTV100.h"
#include "hiSDTV100_config.h"
#include "hiSDTV100_mcu.h"
#include "drv_demod.h"
#include "hi_drv_file.h"
#include "hi_drv_mem.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

static HI_BOOL s_bMcuRunEnable;

#ifdef HI_PROC_SUPPORT
static HI_S32 MCU_ParseLine( HI_CHAR *pStrSrc, HI_U32 u32StrLen, HI_CHAR *pMcuTable, HI_U32 *pu32McuTableSize)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_CHAR acOneLineBuf[64] = {0};
    HI_U32 u32SrcIndex = 0, u32LineIndex = 0, u32McuIndex = 0;
    HI_CHAR *pDealStrSrc = pStrSrc;
    HI_BOOL u8DealOneLineFlag = HI_FALSE;

    HI_TUNER_CHECKPOINTER(pStrSrc);
    HI_TUNER_CHECKPOINTER(pMcuTable);
    HI_TUNER_CHECKPOINTER(pu32McuTableSize);

    while(u32SrcIndex < u32StrLen)
    {
        u8DealOneLineFlag = HI_FALSE;
        if ((acOneLineBuf[u32LineIndex] = *(pDealStrSrc + u32SrcIndex)) == '\n')
        {
            /*find '\n', so deal with this line*/
            if (strlen(acOneLineBuf) < 20)
            {
                u32SrcIndex++;
                u32LineIndex=0;
                continue;
            }

            HI_DBG_PrintStr(acOneLineBuf);
            s32Ret= sscanf(acOneLineBuf, "%*s%x", (HI_U32*)(pMcuTable+u32McuIndex));
            if(HI_FAILURE == s32Ret)
            {
                LOG_PrintError("sscanf err!\n");
                return s32Ret;
            }
            LOG_PrintInfo("*(pMcuTable+%d):%#x\n", u32McuIndex, *(pMcuTable+u32McuIndex));

            u32LineIndex = 0;
            u32McuIndex++;
            u8DealOneLineFlag = HI_TRUE;
        }
        if (HI_FALSE == u8DealOneLineFlag)
        {
            u32LineIndex++;
        }
        u32SrcIndex++;

        if (u32LineIndex >= sizeof(acOneLineBuf))
        {
            LOG_PrintError("Out of acOneLineBuf(%d), current u32LineIndex:%d\n", sizeof(acOneLineBuf), u32LineIndex);
            return HI_FAILURE;
        }

        if (u32McuIndex > *pu32McuTableSize)
        {
            LOG_PrintError("Out of u32McuSize(%d), current u32McuIndex:%d\n", * pu32McuTableSize, u32McuIndex);
            return HI_FAILURE;
        }
    }

    *pu32McuTableSize = u32McuIndex;
    HI_PRINT("u32McuSize:%d\n", *pu32McuTableSize);

    return HI_SUCCESS;
}
#endif
HI_S32 HiSDTV100_MCU_RAM_ReadByte(HI_U32 u32TunerPort, HI_U16 u16RamAddr, HI_U8* pu8RamValue)
{
    HI_S32 s32Ret = HI_SUCCESS;
    TUNER_I2C_DATA_S stI2cDataStr = {0};
    HI_U8 au8DataRecvBuf[1] = {0};
    HI_U8 u8RegAddr = 0;

    HI_FuncEnter();
    HI_DBG_PrintH32(u16RamAddr);

    qam_write_byte(u32TunerPort, MCU_MEM_DMA_L8, (u16RamAddr&0xFF));
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_H8, ((u16RamAddr>>8)&0xFF));
    u8RegAddr = MCU_MEM_DMA_DATA;

    stI2cDataStr.pu8ReceiveBuf = au8DataRecvBuf;
    stI2cDataStr.u32ReceiveLength = 1;
    stI2cDataStr.pu8SendBuf = &u8RegAddr;
    stI2cDataStr.u32SendLength = 1;

    HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_receive_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));

    *pu8RamValue = *(stI2cDataStr.pu8ReceiveBuf);

    HI_DBG_PrintH32(*pu8RamValue);

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_MCU_RAM_WriteByte(HI_U32 u32TunerPort, HI_U16 u16RamAddr, HI_U8 u8RamValue)
{
    HI_S32 s32Ret = HI_SUCCESS;
    TUNER_I2C_DATA_S stI2cDataStr = {0};
    HI_U8 au8SendData[2] = {0};

    HI_FuncEnter();
    HI_DBG_PrintH32(u16RamAddr);
    HI_DBG_PrintH32(u8RamValue);

    qam_write_byte(u32TunerPort, MCU_MEM_DMA_L8, (u16RamAddr&0xFF));
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_H8, ((u16RamAddr>>8)&0xFF));

    au8SendData[0] = MCU_MEM_DMA_DATA;
    au8SendData[1] = u8RamValue;
    stI2cDataStr.pu8ReceiveBuf = HI_NULL;
    stI2cDataStr.u32ReceiveLength = 0;
    stI2cDataStr.pu8SendBuf = au8SendData;
    stI2cDataStr.u32SendLength = 1 + 1;

    HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_send_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));

    HI_FuncExit();
    return HI_SUCCESS;
}

HI_S32 HiSDTV100_MCU_LoadFirmware(HI_U32 u32TunerPort, const HI_U8 *pu8MCUTable, HI_U32 u32TableSize)
{
    struct timeval stStartTime,stEndTime;
    HI_U32 i = 0,u32Total = 0,u32Row = 0,u32Left = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    TUNER_I2C_DATA_S stI2cDataStr = {0};
    HI_U8 au8DataRecvBuf[16] = {0};
    HI_U8 au8SendData[17] = {0};
    HI_U8 u8RegAddr = 0;

    HI_FuncEnter();
    HI_TUNER_CHECKPOINTER(pu8MCUTable);

    do_gettimeofday(&stStartTime);
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_L8,0);
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_H8,0);

    u32Total = u32TableSize;
    u32Left = u32Total % 16;
    u32Row = u32Total / 16;
    HI_DBG_PrintU32(u32Total);
    HI_DBG_PrintU32(u32Left);
    HI_DBG_PrintU32(u32Row);

    for(i = 0; i < u32Row; i++)
    {
        au8SendData[0] = MCU_MEM_DMA_DATA;
        memcpy(&au8SendData[1], &(pu8MCUTable[i*16]), sizeof(au8SendData) - 1);

        stI2cDataStr.pu8ReceiveBuf = HI_NULL;
        stI2cDataStr.u32ReceiveLength = 0;
        stI2cDataStr.pu8SendBuf = au8SendData;
        stI2cDataStr.u32SendLength = 16 + 1;

        HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_send_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));
    }

    if(u32Left)
    {
        au8SendData[0] = MCU_MEM_DMA_DATA;
        memcpy(&au8SendData[1], &(pu8MCUTable[i*16]), u32Left);

        stI2cDataStr.pu8ReceiveBuf = HI_NULL;
        stI2cDataStr.u32ReceiveLength = 0;
        stI2cDataStr.pu8SendBuf = au8SendData;
        stI2cDataStr.u32SendLength = u32Left + 1;

        HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_send_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));
    }

    /*验证下载的固件是否正确*/
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_L8,0);
    qam_write_byte(u32TunerPort, MCU_MEM_DMA_H8,0);
    u8RegAddr = MCU_MEM_DMA_DATA;
    for(i = 0 ;i < u32Row; i++)
    {
        stI2cDataStr.pu8ReceiveBuf = au8DataRecvBuf;
        stI2cDataStr.u32ReceiveLength = 16;
        stI2cDataStr.pu8SendBuf = &u8RegAddr;
        stI2cDataStr.u32SendLength = 1;

        HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_receive_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));

        if(0 != memcmp(au8DataRecvBuf,&(pu8MCUTable[i*16]),16))
        {
            HI_WARN_PrintBlock(au8DataRecvBuf, 16);
            HI_WARN_PrintBlock(&pu8MCUTable[i*16], 16);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_MCU_DOWNLOAD);
            return HI_ERR_TUNER_MCU_DOWNLOAD;
        }
    }

    if(u32Left)
    {
        stI2cDataStr.pu8ReceiveBuf = au8DataRecvBuf;
        stI2cDataStr.u32ReceiveLength = u32Left;
        stI2cDataStr.pu8SendBuf = &u8RegAddr;
        stI2cDataStr.u32SendLength = 1;

        HI_TUNER_CHECK_FUNC_RET(s32Ret, tuner_i2c_receive_data(HI_DEMOD_I2C_CHAN_NUM, HI_DEMOD_I2C_DEV_ADDR, &stI2cDataStr));

        if(0 != memcmp(au8DataRecvBuf,&(pu8MCUTable[u32Row*16]),u32Left))
        {
            HI_WARN_PrintBlock(au8DataRecvBuf, u32Left);
            HI_WARN_PrintBlock(&pu8MCUTable[u32Row*16], u32Left);
            HI_ERR_PrintErrCode(HI_ERR_TUNER_MCU_DOWNLOAD);
            return HI_ERR_TUNER_MCU_DOWNLOAD;
        }
    }

    do_gettimeofday(&stEndTime);
    u32Total = (stEndTime.tv_sec-stStartTime.tv_sec)*1000+(stEndTime.tv_usec-stStartTime.tv_usec)/1000;
    LOG_PrintInfo("download firmware use %d ms.\n",u32Total);

    ENABLE_MCU(HI_TRUE);

    HI_FuncExit();
    return HI_SUCCESS;
}

inline HI_VOID HiSDTV100_MCU_Enable(HI_BOOL bEnable)
{
    if (HI_TRUE == bEnable)
    {
        s_bMcuRunEnable = HI_TRUE;
    }
    else
    {
        s_bMcuRunEnable = HI_FALSE;
    }
    HI_PRINT("MCU status:%s.Driver have the permit to operate mcu.\n", s_bMcuRunEnable?"ON":"OFF");
}

inline HI_BOOL HiSDTV100_MCU_Status(HI_VOID)
{
    return s_bMcuRunEnable;
}

#ifdef HI_PROC_SUPPORT
HI_S32 HiSDTV100_ADP_MCU_Operate(HI_U32 u32TunerPort, const HI_CHAR *pMcuCmd)
{
    HI_S32 s32Ret = HI_SUCCESS;
    struct file *pFile = NULL;
    HI_S32 s32FileLen = 0, s32ReadLen = 0;
    HI_CHAR* pacReadBuf = NULL;//acReadBuf;
    HI_CHAR* pacMcuTableBuf = NULL;
    HI_U32 u32McuTableSize = 0;
    HI_U32 i = 0;
    HI_CHAR acMcuFilePath[32] = {0};
    HI_CHAR* pacMcuFileName = "Conved_i2c_w_set_port1.tcl";
    HI_CHAR acMcuFilePathAndName[64]  = {0};

    HI_TUNER_CHECKPOINTER(pMcuCmd);

    if (strncmp("update", pMcuCmd, strlen("update")) == 0)
    {
        /*get the path of  mcu tcl file*/
        s32Ret = HI_DRV_FILE_GetStorePath(acMcuFilePath, sizeof(acMcuFilePath));
        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_PrintFuncResult(HI_DRV_FILE_GetStorePath, s32Ret);
            return HI_FAILURE;
        }

        s32Ret = snprintf(acMcuFilePathAndName, sizeof(acMcuFilePathAndName),"%s/%s",acMcuFilePath,pacMcuFileName);
        if (HI_SUCCESS > s32Ret)
        {
            acMcuFilePathAndName[sizeof(acMcuFilePathAndName) -1] = '\0';
            HI_ERR_PrintStr(acMcuFilePathAndName);
            return HI_FAILURE;
        }

        HI_PRINT("Now,read %s...\n", acMcuFilePathAndName);

        /*read mcu tcl file*/
        pFile = HI_DRV_FILE_Open(acMcuFilePathAndName, O_RDONLY);
        if (pFile == NULL)
        {
            LOG_PrintError("HI_DRV_FILE_Open [%s] failure!\nPlease check out MCU file:%s at %s.\n", acMcuFilePathAndName, pacMcuFileName, acMcuFilePath);
            return HI_FAILURE;
        }

        HI_DRV_FILE_Lseek(pFile, 0, SEEK_END);
        s32FileLen = HI_DRV_FILE_Lseek(pFile, 0, SEEK_CUR);
        HI_DRV_FILE_Lseek(pFile, 0, SEEK_SET);
        HI_PRINT("The size of [%s] is %d byte.\n", acMcuFilePathAndName, s32FileLen);

        /*need to malloc new buffer*/
        pacReadBuf = (HI_CHAR*)HI_VMALLOC(HI_ID_TUNER, s32FileLen);
        if (NULL == pacReadBuf)
        {
            LOG_PrintError("HI_VMALLOC memory size:%d failed.\n", s32FileLen);
            goto out_close;
        }
        memset(pacReadBuf, 0, s32FileLen);

        s32ReadLen = HI_DRV_FILE_Read(pFile, (HI_U8 *)pacReadBuf, s32FileLen);
        if (s32FileLen != s32ReadLen)
        {
            LOG_PrintError("HI_DRV_FILE_Read failed, s32FileLen:%d, s32ReadLen:%d.\n", s32FileLen, s32ReadLen);
            goto out_read_buffer_free;
        }

        HI_DBG_PrintS32(s32ReadLen);

        /*parse mcu tcl file*/
        pacMcuTableBuf = (HI_CHAR*)HI_VMALLOC(HI_ID_TUNER, (1<<12));    /*The current mcu of chip memory is 4KB.*/
        if (NULL == pacReadBuf)
        {
            LOG_PrintError("HI_VMALLOC memory size:%d failed.\n", s32FileLen);
            goto out_read_buffer_free;
        }

        u32McuTableSize = (1<<12);
        s32Ret = MCU_ParseLine(pacReadBuf, s32ReadLen, pacMcuTableBuf, &u32McuTableSize);
        if (s32Ret != HI_SUCCESS)
        {
            LOG_PrintError("DRV_FE_ParseLine failed\n", s32ReadLen);
            goto out_mcu_table_free;
        }

        /*print mcu table*/
        HI_PRINT("McuTable:");
        HI_PRINT("\n  addr ");
        for(i = 0;i <= 0x0F;i++)
        {
            HI_PRINT("%2x ",i);
        }

        for (i=0; i<u32McuTableSize; i++)
        {
            if(i % 16 == 0)
            {
                HI_PRINT("\n %04x0:",i/16);
            }
            HI_PRINT("%2x ", *(pacMcuTableBuf+i));
        }
        HI_PRINT("\n\n");

        /*reload mcu table*/
        RESET_MCU(u32TunerPort);
        s32Ret = HiSDTV100_MCU_LoadFirmware(u32TunerPort, pacMcuTableBuf, u32McuTableSize);
        if(HI_FAILURE == s32Ret)
        {
            HI_ERR_PrintFuncResult(HiSDTV100_MCU_LoadFirmware, s32Ret);
            goto out_mcu_table_free;
        }
        START_MCU(u32TunerPort);

out_mcu_table_free:
        HI_VFREE(HI_ID_TUNER, pacMcuTableBuf);

out_read_buffer_free:
        if (pacReadBuf)
        {
            HI_VFREE(HI_ID_TUNER, pacReadBuf);
        }

out_close:
        HI_DRV_FILE_Close(pFile);

    }
    else if (strncmp("off", pMcuCmd, strlen("off")) == 0)
    {
        ENABLE_MCU(HI_TRUE);
        RESET_MCU(u32TunerPort);
        ENABLE_MCU(HI_FALSE);
    }
    else if (strncmp("on", pMcuCmd, strlen("on")) == 0)
    {
        ENABLE_MCU(HI_TRUE);
        START_MCU(u32TunerPort);
    }
    else
    {
        LOG_PrintError("Unknow cmd:%s\n", pMcuCmd);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}
#endif
#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

