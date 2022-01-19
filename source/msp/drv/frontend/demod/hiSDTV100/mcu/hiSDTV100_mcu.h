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
#ifndef __HISDTV100_MCU_H__
#define __HISDTV100_MCU_H__

#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define MCU_MEM_DMA_DATA        0x19
#define MCU_MEM_DMA_H8          0x1A
#define MCU_MEM_DMA_L8          0x1B
#define MCU_CORE_CTRL           0x1D
#define MCU_ARBITER_CTRL        0x1E

/*MCU RAM and code use the same addr:0~0x1FFF
0~0xFFF:Code
0x1000~0x1FFF:Ram*/
#define MCU_RAM(x) ((HI_U16)(0x1FFF-(HI_U16)x))
#define MCU_RAM_ADDR_TUNER_TYPE        (0x0000)  //tuner type,1-Sixxxx; 2-MXLxxxx

#define ENABLE_MCU(en) \
    do{  \
        HiSDTV100_MCU_Enable(en);   \
    }while(0)

#ifdef HI_FPGA_SUPPORT
    #define RESET_MCU(u32TunerPort)
#else
    #define RESET_MCU(u32TunerPort) \
    ({ \
        if (HiSDTV100_MCU_Status())    \
        {   \
            qam_write_byte(u32TunerPort, MCU_CORE_CTRL, 0x44); \
            HI_INFO_TUNER("MCU is stoped.\n"); \
        }   \
    })
#endif

#ifdef HI_FPGA_SUPPORT
    #define START_MCU(u32TunerPort)
#else
    #define START_MCU(u32TunerPort) \
    ({ \
        if (HiSDTV100_MCU_Status())    \
        {   \
            qam_write_byte(u32TunerPort, MCU_CORE_CTRL, 0x33); \
            HI_INFO_TUNER("MCU is started.\n"); \
        }   \
    })
#endif

#if 0
/*暂停MCU的运行，用于防止I2C总线读写冲突*/
#if defined(CHIP_TYPE_hi3751v811)
#define HOLD_MCU
({ \
    dem_write_byte_no_hold(MCU_ARBITER_CTRL, 0); \
})
#else
    #define HOLD_MCU
#endif

/*运行MCU，用于暂停MCU后继续运行MCU的情况*/
#if defined(CHIP_TYPE_hi3751v811)
#define RUN_MCU \
({ \
    dem_write_byte_no_hold(MCU_ARBITER_CTRL, 1); \
})
#else
    #define RUN_MCU
#endif
#endif

HI_S32 HiSDTV100_MCU_RAM_ReadByte(HI_U32 u32TunerPort, HI_U16 u16RamAddr, HI_U8* pu8RamValue);
HI_S32 HiSDTV100_MCU_RAM_WriteByte(HI_U32 u32TunerPort, HI_U16 u16RamAddr, HI_U8 u8RamValue);
HI_S32 HiSDTV100_MCU_LoadFirmware(HI_U32 u32TunerPort, const HI_U8 *pu8MCUTable, HI_U32 u32TableSize);
HI_VOID HiSDTV100_MCU_Enable(HI_BOOL bEnable);
HI_BOOL HiSDTV100_MCU_Status(HI_VOID);
HI_S32 DEMOD_ADP_HiSDTV100_MCU_Operate(HI_U32 u32TunerPort, const HI_CHAR *pMcuCmd);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

