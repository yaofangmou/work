/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : sample_enc_api.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                Author              Modification
2018/01/01          sdk                 Created file
*************************************************************************************************/

#ifndef __SAMPLE_ENC_API_H__
#define __SAMPLE_ENC_API_H__


/*********************************add include here***********************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <setjmp.h>
#include <sys/time.h>
#include "hi_type.h"

/***********************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
       extern "C"
    {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ***********************************************/
#define JPGE_INPUT_FMT_YUV420               0
#define JPGE_INPUT_SAMPLER_SEMIPLANNAR      0
#define JPGE_INPUT_COMPONENT_NUM            3

/*************************** Structure Definition *********************************************/
typedef struct tagSAMPLE_VIDEO_FREMAE_INFO_S
{
    HI_U32  YuvSampleType;
    HI_U32  YuvFmtType;
    HI_U32  Qlevel;

    HI_U32  Width[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  Height[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  Stride[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  PhyBuf[JPGE_INPUT_COMPONENT_NUM];
}SAMPLE_VIDEO_FREMAE_INFO_S;

/******************************* API declaration **********************************************/
/****************************************************************************
* func          : JPEG_Soft_EncToFile
* description   : CNcomment: ??????jpeg?????????? CNend\n
* param[in]     : ??????YUV420 SP??????????
* retval        : NA
* others:       : NA
******************************************************************************/
HI_S32 JPEG_Soft_EncToFile(HI_CHAR *pOutFileName, SAMPLE_VIDEO_FREMAE_INFO_S *pstVideoFrameInfo);

/****************************************************************************
* func          : JPEG_Soft_EncToMem
* description   : CNcomment: ??????jpeg?????????? CNend\n
* param[in]     : ??????YUV420 SP??????????
* retval        : NA
* others:       : NA
******************************************************************************/
HI_S32 JPEG_Soft_EncToMem(SAMPLE_VIDEO_FREMAE_INFO_S *pstVideoFrameInfo, HI_U8 **ppOutBuffer, HI_U32 *pBufferSize);

#ifdef __cplusplus

#if __cplusplus

        }
#endif
#endif /* __cplusplus */


#endif /* __SAMPLE_ENC_API_H__*/
