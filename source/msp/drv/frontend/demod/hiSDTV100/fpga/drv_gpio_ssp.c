/******************************************************************************

  Copyright (C), 2012-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_gpio_ssp.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2012/12/23
  Description   :
  History       :
  1.Date        : 2012/12/23
    Author      :
    Modification: Created file
******************************************************************************/
//#include <mach/platform.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <linux/fs.h>
#include <linux/module.h>
#include <linux/delay.h>

#include "hi_type.h"
#include "hi_drv_dev.h"
#include "hi_drv_module.h"
#include "drv_gpio_ssp_ext.h"
#include "drv_gpio_ext.h"
#include "drv_demod.h"
#include "drv_tuner_ioctl.h"

#define GPIOSSP_DRV_SET_GPIO_OUT(group, bit) \
    do {\
        HI_S32 s32Ret;\
        \
        s32Ret = s_tuner_pGpioFunc->pfnGpioDirSetBit(group*8 + bit, 0);\
        if (HI_SUCCESS != s32Ret)\
        {\
            HI_ERR_TUNER("Set Gpio Spi Output failure!\n");\
            return HI_FAILURE;\
        }\
    } while(0)
    
#define GPIOSSP_DRV_SET_GPIO_IN(group, bit) \
    do {\
        HI_S32 s32Ret;\
        \
        s32Ret = s_tuner_pGpioFunc->pfnGpioDirSetBit(group*8 + bit, 1);\
        if (HI_SUCCESS != s32Ret)\
        {\
            HI_ERR_TUNER("Set Gpio Spi Input failure!\n");\
            return HI_FAILURE;\
        }\
    } while(0)

#define GPIOSSP_DRV_SET_GPIO_H(group, bit) \
    do {\
        HI_S32 s32Ret;\
        \
        s32Ret = s_tuner_pGpioFunc->pfnGpioWriteBit(group*8 + bit, 1);\
        if (HI_SUCCESS != s32Ret)\
        {\
            HI_ERR_TUNER("Write Gpio Spi High failure!\n");\
            return HI_FAILURE;\
        }\
    } while(0)
    
#define GPIOSSP_DRV_SET_GPIO_L(group, bit) \
    do {\
        HI_S32 s32Ret;\
        \
        s32Ret = s_tuner_pGpioFunc->pfnGpioWriteBit(group*8 + bit, 0);\
        if (HI_SUCCESS != s32Ret)\
        {\
            HI_ERR_TUNER("Write Gpio Spi Low failure!\n");\
            return HI_FAILURE;\
        }\
    } while(0)
    
#define GPIOSSP_DRV_GET_GPIO(group, bit, pdata) \
    do {\
        HI_S32 s32Ret;\
        \
        s32Ret = s_tuner_pGpioFunc->pfnGpioReadBit(group*8 + bit, pdata);\
        if (HI_SUCCESS != s32Ret)\
        {\
            HI_ERR_TUNER("Read Gpio Spi failure!\n");\
            return HI_FAILURE;\
        }\
    } while(0)

HI_S32 GPIOSSP_Read(GPIOSSP_INFO_S *pstInfo)
{
    HI_ERR_TUNER("Not support gpio spi read now!\n");
    return HI_FAILURE;
}

HI_S32 GPIOSSP_Write(GPIOSSP_INFO_S *pstInfo)
{
    HI_U32 i, j;

    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);   /*cs out*/
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit); /*clk out*/    
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di out*/
    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);     /*cs to 1*/
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);   /*clk to 1*/    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);   /*di to 1*/

    GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);     /*cs to 0*/

    for (i = 0; i < pstInfo->u32Size; i++)
    {
        for (j = 0; j < 8; j++)
        {
            if((*(pstInfo->pu8Data + i) << j) & 0x80)
            {
                GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 1*/
            }
            else
            {
                GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 0*/
            }
            
            GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 0*/ 
            udelay(20);
            GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/ 
            udelay(20);
        }
    }

    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);               /*cs to 1*/
    
    return HI_SUCCESS;
}

HI_S32 GPIOSSP_EXT_Read(GPIOSSP_EXT_INFO_S *pstInfo)
{
    HI_U32 u32TmpData;
    HI_U32 u32ReadData;
    HI_U32 u32ReadBit;
    HI_U32 i;
    
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);     /*cs out*/
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);   /*clk out*/    
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);   /*di out*/
    GPIOSSP_DRV_SET_GPIO_IN(pstInfo->u32DoutGpioGroup, pstInfo->u32DoutGpioBit);  /*do in*/
    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);       /*cs to 1*/
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);     /*di to 1*/    

    udelay(20);

    GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);       /*cs to 0*/  

    //write 16 bit addr + 8 bit operate code;
    u32TmpData = (pstInfo->u32Addr << 8) + 0x80;
    for(i = 0; i < 24; i++)
    {    
        if((u32TmpData << i) & 0x800000)
        {                 
            GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 1*/
        }
        else
        {                 
            GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 0*/
        }
        
        GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 0*/ 
        udelay(20);
        GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/ 
        udelay(20);
    }

    //read 32 bit data
    u32ReadData = 0;
    for(i = 0; i < 32; i++)
    {
        GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 0*/ 
        udelay(20);
        GPIOSSP_DRV_GET_GPIO(pstInfo->u32DoutGpioGroup, pstInfo->u32DoutGpioBit, &u32ReadBit);
        
        u32ReadData += (u32ReadBit << (31 - i));
        GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/  
        udelay(20);
    }
    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);           /*cs to 1*/
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);         /*di to 1*/
    udelay(10);

    *(pstInfo->pu32Data) = u32ReadData;

    return HI_SUCCESS;
}

HI_S32 GPIOSSP_EXT_Write(GPIOSSP_EXT_INFO_S *pstInfo)
{
    HI_U32 u32TmpData;
    HI_U32 i;
    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);       /*cs to 1*/
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);     /*di to 1*/
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);     /*cs out*/
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);   /*clk out*/    
    GPIOSSP_DRV_SET_GPIO_OUT(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);   /*di out*/
    GPIOSSP_DRV_SET_GPIO_IN(pstInfo->u32DoutGpioGroup, pstInfo->u32DoutGpioBit);  /*do in*/
    
    GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);       /*cs to 0*/   
    
    //write 16 bit addr + 8 bit operate code;
    u32TmpData = pstInfo->u32Addr << 8;
    for(i = 0; i < 24; i++)
    {    
        if((u32TmpData << i) & 0x800000)
        {                 
            GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 1*/
        }
        else
        {                  
            GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 0*/
        }
        
        GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 0*/ 
        udelay(20);
        GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/ 
        udelay(20);
    } 
    
    //write 32 bit data
    u32TmpData = *(pstInfo->pu32Data);
    for(i = 0; i < 32; i++)
    {    
        if((u32TmpData << i) & 0x80000000)
        {                 
            GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 1*/
        }
        else
        {                  
            GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit); /*di to 0*/
        }
        
        GPIOSSP_DRV_SET_GPIO_L(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 0*/ 
        udelay(20);
        GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32ClkGpioGroup, pstInfo->u32ClkGpioBit);     /*clk to 1*/ 
        udelay(20);
    }
    
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32CsGpioGroup, pstInfo->u32CsGpioBit);           /*cs to 1*/
    GPIOSSP_DRV_SET_GPIO_H(pstInfo->u32DinGpioGroup, pstInfo->u32DinGpioBit);         /*di to 1*/    
    udelay(10);

    return HI_SUCCESS;
}



