/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name      : jpeg_drv_hal.h
Version        : Initial Draft
Author         :
Created        : 2018/01/01
Description    :
Function List  :


History        :
Date                 Author                  Modification
2018/01/01            sdk                    Created file
************************************************************************************************/
#ifndef  _JPEG_DRV_HAL_H_
#define  _JPEG_DRV_HAL_H_

/*********************************add include here**********************************************/
#include "hi_type.h"

/***********************************************************************************************/


/***********************************************************************************************/

#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


/***************************** Macro Definition ***********************************************/


/*************************** Structure Definition *********************************************/

/***************************  The enum of Jpeg image format  **********************************/

/********************** Global Variable declaration *******************************************/


/******************************* API declaration **********************************************/
HI_U32 jpeg_reg_read(HI_U32 offset);

HI_VOID jpeg_reg_write(HI_U32 offset, HI_U32 value);

HI_VOID JPEG_HAL_Init(volatile HI_U32 *pu32JpegRegBase);

HI_VOID JPEG_HAL_DInit(HI_VOID);

HI_VOID DRV_JPEG_GetIntStatus(HI_U32 *pIntStatus);

HI_VOID DRV_JPEG_ClearIntStatus(HI_U32 IntStatus);

HI_VOID DRV_JPEG_SetIntMask(HI_U32 IntMask);

#ifndef HI_BUILD_IN_BOOT
/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
#define HI_GFX_Memcpy  JPEG_Memcpy
#define HI_GFX_Memset  JPEG_Memset
HI_VOID JPEG_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize);
HI_VOID JPEG_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize);
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
