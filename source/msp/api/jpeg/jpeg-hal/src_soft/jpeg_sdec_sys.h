/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : jpeg_sdec_sys.h
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :

History          :
Date                     Author           Modification
2018/01/01               sdk              Created file
************************************************************************************************/
#ifndef __JPEG_SDEC_SYS_H__
#define __JPEG_SDEC_SYS_H__

/*********************************add include here**********************************************/
#include "hi_type.h"
/***********************************************************************************************/

#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


    /***************************** Macro Definition ********************************************/
    #ifdef HI_GFX_Memcpy
    #undef HI_GFX_Memcpy
    #endif
    #ifdef HI_GFX_Memset
    #undef HI_GFX_Memset
    #endif
    #ifdef HI_GFX_Snprintf
    #undef HI_GFX_Snprintf
    #endif
    #define HI_GFX_Memcpy       JPEG_SDEC_Memcpy
    #define HI_GFX_Memset       JPEG_SDEC_Memset
    #define HI_GFX_Snprintf     JPEG_SDEC_Snprintf

     /*************************** Enum Definition **********************************************/


    /*************************** Structure Definition ******************************************/

    /********************** Global Variable declaration ****************************************/

    /******************************* API declaration *******************************************/
    HI_VOID JPEG_SDEC_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize);
    HI_VOID JPEG_SDEC_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize);
    HI_VOID JPEG_SDEC_Snprintf(HI_CHAR *pStr, HI_U32 Size, const HI_CHAR *Format, ...);
    /*******************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
#endif /* __JPEG_SDEC_SYS_H__*/
