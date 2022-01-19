/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : gfx2d_debug.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                    Author                Modification
2018/01/01              sdk                   Created file
***************************************************************************************************/
#ifndef __GFX2D_DEBUG_H__
#define __GFX2D_DEBUG_H__


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
typedef enum tagGFX2D_DEBUG_LEVEL_E
{
    GFX2D_DEBUG_CLOSE_LEVEL_0 = 0,
    GFX2D_DEBUG_ERR_LEVEL_1,
    GFX2D_DEBUG_FUNC_LEVEL_2,
    GFX2D_DEBUG_VALUE_LEVEL_3,
    GFX2D_DEBUG_ALL_LEVEL_4,
    GFX2D_DEBUG_NODE_LEVEL_5,
    GFX2D_DEBUG_LEVEL_BUTT,
}GFX2D_DEBUG_LEVEL_E;

/********************** Global Variable declaration ***********************************************/

/******************************* API declaration **************************************************/
HI_VOID DRV_GFX2D_OutputMessage(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_U32 Format, ...);
HI_VOID DRV_GFX2D_SetLogFunc(HI_CHAR* pFunc);
HI_VOID DRV_GFX2D_SetLogLevel(HI_U32 LogLevel);
HI_VOID DRV_GFX2D_SetLogSave(HI_U32 LogSave);
HI_VOID DRV_GFX2D_ProcMsg(struct seq_file *p);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/**__GFX2D_DEBUG_H__**/
