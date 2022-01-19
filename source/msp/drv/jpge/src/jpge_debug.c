/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : jpge_debug.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                       Author                 Modification
2018/01/01                 sdk                    Created file
***************************************************************************************************/

/*********************************add include here*************************************************/
#include <linux/string.h>
#include <linux/seq_file.h>
#include <linux/kernel.h>
#include <linux/string.h>

#ifdef CONFIG_GFX_PROC_SUPPORT
#include "hi_drv_proc.h"
#endif
#include "hi_type.h"

/***************************** Macro Definition ***************************************************/

#define MSG_LENGTH_MAX       256

/*************************** Structure Definition *************************************************/


/********************** Global Variable declaration ***********************************************/
static HI_CHAR log_func[MSG_LENGTH_MAX] = "all";
static HI_U32 log_level = 1;
static HI_U32 log_save  = 0;

#include "jpge_debug.h"
#include "hi_gfx_debug.h"
/******************************* API declaration **************************************************/

/******************************* API relese *******************************************************/
#ifndef CONFIG_USE_SDK_LOG
HI_VOID DRV_JPGE_OutputMessage(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_U32 Format, ...)
{
    va_list args;
    HI_U32 MsgLen = 0;
    HI_BOOL LogErr   = HI_FALSE;
    HI_BOOL LogFunc  = HI_FALSE;
    HI_BOOL LogValue = HI_FALSE;
    HI_CHAR LogStr[MSG_LENGTH_MAX + 1] = {'\0'};
    HI_CHAR TmpFormat[MSG_LENGTH_MAX + 1] = {'\0'};

    if (NULL == pFunc)
    {
        HI_GFX_Print("[module-gfx-jpge][err] : input func pointer %p\n",pFunc);
        return;
    }

    if ((HI_GFX_MSG_BEG == eMsgType) || (HI_GFX_MSG_END == eMsgType))
    {
        FormatMessage("jpge", pFunc, Line, eMsgType, TmpFormat, &LogErr, &LogFunc, &LogValue);
        return;
    }

    if (0 == strncmp(log_func, "all", 3))
    {
        FormatMessage("jpge", pFunc, Line, eMsgType, TmpFormat, &LogErr, &LogFunc, &LogValue);
        if ((HI_GFX_MSG_UNF_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_UNF_EXIT_FUNC == eMsgType) || (HI_GFX_MSG_INNER_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_INNER_EXIT_FUNC == eMsgType))
        {
            return;
        }
        goto OUT_MSG;
    }

    if (0 == strncmp(log_func, pFunc, strlen(pFunc)))
    {
        FormatMessage("jpge", pFunc, Line, eMsgType, TmpFormat, &LogErr, &LogFunc, &LogValue);
        if ((HI_GFX_MSG_UNF_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_UNF_EXIT_FUNC == eMsgType) || (HI_GFX_MSG_INNER_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_INNER_EXIT_FUNC == eMsgType))
        {
            return;
        }
        goto OUT_MSG;
    }

    return;

OUT_MSG:

    /** the follows debug dispose should care performance, if not open debug level, not need format strings **/
    /** 底下debug处理需要注意对性能的影响，级别没有打开不需要处理，这里不单单考虑宏开关控制，这样对性能影响最小**/
    if (0 == log_level)
    {
        return;
    }

    if ((1 == log_level) && (HI_FALSE == LogErr))
    {
        return;
    }

    if ((2 == log_level) && (HI_FALSE == LogFunc))
    {
        return;
    }

    if ((3 == log_level) && (HI_FALSE == LogValue))
    {
        return;
    }

    TmpFormat[MSG_LENGTH_MAX] = '\0';

    if (Format <= 3)
    {
        va_start(args, Format);/**获取format之后第一个变参的首地址**/
        MsgLen = vsnprintf(LogStr, MSG_LENGTH_MAX, TmpFormat, args);
        va_end(args);

        HI_UNUSED(MsgLen);
        LogStr[MSG_LENGTH_MAX] = '\0';
        OutputMessage(LogStr, eMsgType);
    }

    return;
}
#endif

HI_VOID DRV_JPGE_SetLogFunc(HI_CHAR* pFunc)
{
    DRV_GFX_SetLogFunc("jpge", pFunc);
    return;
}

HI_VOID DRV_JPGE_SetLogLevel(HI_U32 LogLevel)
{
    log_level = LogLevel;
    return;
}

HI_VOID DRV_JPGE_SetLogSave(HI_U32 LogSave)
{
    DRV_GFX_SetLogSave(LogSave);
    return;
}

#ifdef CONFIG_GFX_PROC_SUPPORT
HI_VOID DRV_JPGE_ProcMsg(struct seq_file *p)
{
    DRV_GFX_ProcMsg(p);
}
#endif
