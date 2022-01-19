/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : jpeg_drv_hal.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      : ²Ù×÷¼Ä´æÆ÷
Function List    :


History          :
Date                  Author                Modification
2018/01/01            sdk                   Created file
**************************************************************************************************/

/*********************************add include here************************************************/
#include "hi_jpeg_config.h"
#include "hi_jpeg_reg.h"

#include "jpeg_drv_hal.h"
#include "jpeg_drv_debug.h"
/***************************** Macro Definition **************************************************/


/*************************** Structure Definition ************************************************/

/********************** Global Variable declaration **********************************************/

static volatile HI_U32 *s_pu32JpgRegAddr = NULL;

/******************************* API forward declarations ****************************************/

/******************************* API realization *************************************************/
HI_U32 jpeg_reg_read(HI_U32 offset)
{
    if ((NULL != s_pu32JpgRegAddr) && (offset < (JPGD_REG_LENGTH - 4)))
    {
        return (*(volatile HI_U32 *)((s_pu32JpgRegAddr) + (offset) / 4));
    }
    return 0;
}

HI_VOID jpeg_reg_write(HI_U32 offset, HI_U32 value)
{
    if ((NULL != s_pu32JpgRegAddr) && (offset < (JPGD_REG_LENGTH - 4)))
    {
        (*(volatile HI_U32 *)((s_pu32JpgRegAddr) + (offset) / 4) = (value));
    }
    return;
}

HI_VOID jpeg_reg_writebuf(const HI_VOID *pInMem,HI_S32 s32PhyOff,HI_U32 u32Bytes)
{
#ifdef CONFIG_JPEG_WRITE_SUPPORT/** now not has been defined **/
    HI_U32 u32Cnt = 0;
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(0, s_pu32JpgRegAddr);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pInMem);
    HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_NOVALUE(JPGD_REG_LENGTH - 4,(s32PhyOff + u32Bytes));

    for (u32Cnt = 0; u32Cnt < u32Bytes; u32Cnt += 4)
    {
        *(volatile int *)((s_pu32JpgRegAddr) + (s32PhyOff + u32Cnt) / 4) = *(int *)((char*)pInMem + u32Cnt);
    }
#else
    HI_UNUSED(pInMem);
    HI_UNUSED(s32PhyOff);
    HI_UNUSED(u32Bytes);
#endif
    return;
}

HI_VOID JPEG_HAL_Init(volatile HI_U32 *pu32JpegRegBase)
{
    if (NULL != pu32JpegRegBase)
    {
       s_pu32JpgRegAddr = pu32JpegRegBase;
    }
    return;
}

HI_VOID JPEG_HAL_DInit(HI_VOID)
{
    s_pu32JpgRegAddr = 0;
    return;
}

HI_VOID DRV_JPEG_GetIntStatus(HI_U32 *pIntStatus)
{
    if (NULL != pIntStatus)
    {
        *pIntStatus = jpeg_reg_read(JPGD_REG_INT);
    }
    return;
}

HI_VOID DRV_JPEG_ClearIntStatus(HI_U32 IntStatus)
{
    jpeg_reg_write(JPGD_REG_INT, IntStatus);
    return;
}

HI_VOID DRV_JPEG_SetIntMask(HI_U32 IntMask)
{
    jpeg_reg_write(JPGD_REG_INTMASK, IntMask);
    return;
}

#ifndef HI_BUILD_IN_BOOT
/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
HI_VOID JPEG_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize)
{
    if ((NULL != pDst) && (NULL != pSrc) && (0 != SrcSize)) { memcpy(pDst, pSrc, SrcSize); }
}

HI_VOID JPEG_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize)
{
    if ((NULL != pDst) && (0 != DstSize)) { memset(pDst, InitValue, DstSize); }
}
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/
#endif
