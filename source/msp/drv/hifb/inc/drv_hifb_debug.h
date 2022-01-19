/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_debug.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                    Author                Modification
2018/01/01              sdk                   Created file
***************************************************************************************************/
#ifndef __DRV_HIFB_DEBUG_H__
#define __DRV_HIFB_DEBUG_H__


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
HI_VOID DRV_HIFB_OutputMessage(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_U32 Format, ...);
HI_VOID DRV_HIFB_SetLogFunc(HI_CHAR* pFunc);
HI_VOID DRV_HIFB_SetLogLevel(HI_U32 LogLevel);
HI_VOID DRV_HIFB_SetLogSave(HI_U32 LogSave);
HI_VOID DRV_HIFB_ProcMsg(struct seq_file *p);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/**__DRV_HIFB_DEBUG_H__**/
