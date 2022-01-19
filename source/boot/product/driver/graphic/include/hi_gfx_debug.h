/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : hi_gfx_debug.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                    Author                Modification
2018/01/01              sdk                   Created file
***************************************************************************************************/
#ifndef __HI_GFX_DEBUG_H__
#define __HI_GFX_DEBUG_H__


/*********************************add include here*************************************************/
#include "hi_type.h"

/**************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


/***************************** Macro Definition ***************************************************/
/*************************** Structure Definition *************************************************/
typedef enum tagGfxMsgType
{
    HI_GFX_MSG_ERR_FUNC = 0,
    HI_GFX_MSG_ERR_INT,
    HI_GFX_MSG_ERR_UINT,
    HI_GFX_MSG_ERR_XINT,
    HI_GFX_MSG_ERR_LONG,
    HI_GFX_MSG_ERR_ULONG,
    HI_GFX_MSG_ERR_FLOAT,
    HI_GFX_MSG_ERR_VOID,
    HI_GFX_MSG_ERR_STR,
    HI_GFX_MSG_ERR_INFO,
    HI_GFX_MSG_BEG,
    HI_GFX_MSG_END,
    HI_GFX_MSG_UNF_ENTER_FUNC,
    HI_GFX_MSG_UNF_EXIT_FUNC,
    HI_GFX_MSG_INNER_ENTER_FUNC,
    HI_GFX_MSG_INNER_EXIT_FUNC,
    HI_GFX_MSG_DEBUG_INT,
    HI_GFX_MSG_DEBUG_UINT,
    HI_GFX_MSG_DEBUG_XINT,
    HI_GFX_MSG_DEBUG_LONG,
    HI_GFX_MSG_DEBUG_ULONG,
    HI_GFX_MSG_DEBUG_FLOAT,
    HI_GFX_MSG_DEBUG_VOID,
    HI_GFX_MSG_DEBUG_STR,
    HI_GFX_MSG_DEBUG_INFO,
    HI_GFX_MSG_BUTT,
}HI_GFX_MSG_TYPE_E;

/********************** Global Variable declaration ***********************************************/

/******************************* API declaration **************************************************/
HI_VOID HI_GFX_LogOut(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_CHAR *Format, ...);
HI_VOID HI_GFX_SetFunc(HI_VOID);
HI_VOID HI_GFX_SetLevel(HI_VOID);
HI_VOID HI_GFX_SetLogDebug(HI_VOID);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/**__HI_GFX_DEBUG_H__**/
