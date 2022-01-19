/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : jpeg_drv_debug.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                    Author                Modification
2018/01/01              sdk                   Created file
***************************************************************************************************/
#ifndef __JPEG_DRV_DEBUG_H__
#define __JPEG_DRV_DEBUG_H__


/*********************************add include here*************************************************/
#include <linux/seq_file.h>
#include "hi_type.h"
#include "hi_gfx_sys_k.h"

/**************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ***************************************************/

/*************************** Structure Definition *************************************************/


/********************** Global Variable declaration ***********************************************/

/******************************* API declaration **************************************************/
HI_VOID DRV_JPEG_OutputMessage(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_U32 Format, ...);
HI_VOID DRV_JPEG_SetLogFunc(HI_CHAR* pFunc);
HI_VOID DRV_JPEG_SetLogLevel(HI_U32 LogLevel);
HI_VOID DRV_JPEG_SetLogSave(HI_U32 LogSave);
HI_VOID DRV_JPEG_ProcMsg(struct seq_file *p);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/**__JPEG_DRV_DEBUG_H__**/
