/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : hi_gfx_debug.c
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
#include <stdarg.h>
#include "exports.h"
#include "hi_gfx_debug.h"
#include "hi_gfx_comm.h"
/***************************** Macro Definition ***************************************************/
#define MSG_LENGTH_MAX            256
/*************************** Structure Definition *************************************************/


/********************** Global Variable declaration ***********************************************/
static HI_CHAR log_func[MSG_LENGTH_MAX] = "all";
static HI_U32 log_level = 1;
HI_U32 log_debug = 0;

/******************************* API declaration **************************************************/

#ifdef HI_BUILD_IN_MINI_BOOT
extern int vsnrprintf(char *str, size_t size, const char *format, va_list ap);
#endif
/******************************* API relese *******************************************************/
static HI_VOID OutputMessage(HI_CHAR* pLogStr, HI_GFX_MSG_TYPE_E eMsgType)
{
    switch (eMsgType)
    {
        case HI_GFX_MSG_ERR_FUNC:
        case HI_GFX_MSG_ERR_INT:
        case HI_GFX_MSG_ERR_UINT:
        case HI_GFX_MSG_ERR_XINT:
        case HI_GFX_MSG_ERR_LONG:
        case HI_GFX_MSG_ERR_ULONG:
        case HI_GFX_MSG_ERR_FLOAT:
        case HI_GFX_MSG_ERR_VOID:
        case HI_GFX_MSG_ERR_STR:
        case HI_GFX_MSG_ERR_INFO:
             if ((1 == log_level) || (4 == log_level))
             {
                 HI_GFX_Print("%s", pLogStr);
             }
             break;
        case HI_GFX_MSG_BEG:
        case HI_GFX_MSG_END:
             if ((log_level > 1) && (log_level < 5))
             {
                 HI_GFX_Print("%s", pLogStr);
             }
             break;
        case HI_GFX_MSG_UNF_ENTER_FUNC:
        case HI_GFX_MSG_UNF_EXIT_FUNC:
        case HI_GFX_MSG_INNER_ENTER_FUNC:
        case HI_GFX_MSG_INNER_EXIT_FUNC:
             if ((2 == log_level) || (4 == log_level))
             {
                 HI_GFX_Print("%s", pLogStr);
             }
             break;
        case HI_GFX_MSG_DEBUG_INT:
        case HI_GFX_MSG_DEBUG_UINT:
        case HI_GFX_MSG_DEBUG_XINT:
        case HI_GFX_MSG_DEBUG_LONG:
        case HI_GFX_MSG_DEBUG_ULONG:
        case HI_GFX_MSG_DEBUG_FLOAT:
        case HI_GFX_MSG_DEBUG_VOID:
        case HI_GFX_MSG_DEBUG_STR:
        case HI_GFX_MSG_DEBUG_INFO:
            if ((3 == log_level) || (4 == log_level))
            {
                HI_GFX_Print("%s", pLogStr);
            }
            break;
        default:
            break;
    }

    return;
}

static HI_VOID FormatMessage(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, HI_CHAR *Format)
{
    HI_CHAR LogStr[MSG_LENGTH_MAX + 1] = {'\0'};

    switch (eMsgType)
    {
        case HI_GFX_MSG_BEG:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo-beg][line] :===============================================================\n");
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_END:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo-end][line] :===============================================================\n");
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        default:
             break;
    }

    switch (eMsgType)
    {
        case HI_GFX_MSG_UNF_ENTER_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo][func] : %s[%d] : >>>>>>>>>>>>>>>>[enter]\n", pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_UNF_EXIT_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo][func] : %s[%d] : >>>>>>>>>>>>>>>>[exit]\n", pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_INNER_ENTER_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo][func] : %s[%d] : ===============>[enter]\n", pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_INNER_EXIT_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-logo][func] : %s[%d] : ===============>[exit]\n", pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        default:
             break;
    }

    switch (eMsgType)
    {
        case HI_GFX_MSG_ERR_FUNC:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "call %s -> return %s = [0x%08x]");
             return;
        case HI_GFX_MSG_ERR_INT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %d");
             return;
        case HI_GFX_MSG_ERR_UINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %u");
             return;
        case HI_GFX_MSG_ERR_XINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = 0x%x");
             return;
        case HI_GFX_MSG_ERR_LONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %lld");
             return;
        case HI_GFX_MSG_ERR_ULONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %llu");
             return;
        case HI_GFX_MSG_ERR_VOID:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %p");
             return;
        case HI_GFX_MSG_ERR_STR:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "%s = %s");
             return;
        case HI_GFX_MSG_ERR_INFO:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][err] : %s[%d] -> %s\n", pFunc, Line, "<%s>");
             return;
        default:
             break;
    }

    switch (eMsgType)
    {
        case HI_GFX_MSG_DEBUG_INT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %d");
             return;
        case HI_GFX_MSG_DEBUG_UINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %u");
             return;
        case HI_GFX_MSG_DEBUG_XINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = 0x%x");
             return;
        case HI_GFX_MSG_DEBUG_LONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %lld");
             return;
        case HI_GFX_MSG_DEBUG_ULONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %llu");
             return;
        case HI_GFX_MSG_DEBUG_VOID:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %p");
             return;
        case HI_GFX_MSG_DEBUG_STR:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "%s = %s");
             return;
        case HI_GFX_MSG_DEBUG_INFO:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-logo][debug] : %s[%d] -> %s\n", pFunc, Line, "<%s>");
             return;
        default:
             break;
    }

    return;
}

HI_VOID HI_GFX_LogOut(const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, const HI_CHAR *Format, ...)
{
    va_list args;
    HI_U32 MsgLen = 0;
    HI_CHAR LogStr[MSG_LENGTH_MAX + 1] = {'\0'};
    HI_CHAR TmpFormat[MSG_LENGTH_MAX + 1] = {'\0'};

    if (NULL == pFunc)
    {
        HI_GFX_Print("[module-gfx-logo] : input func pointer %p\n",pFunc);
        return;
    }

    if ((HI_GFX_MSG_BEG == eMsgType) || (HI_GFX_MSG_END == eMsgType))
    {
        FormatMessage(pFunc, Line, eMsgType, TmpFormat);
        return;
    }

    if (0 == strncmp(log_func, "all", 3))
    {
        FormatMessage(pFunc, Line, eMsgType, TmpFormat);
        if ((HI_GFX_MSG_UNF_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_UNF_EXIT_FUNC == eMsgType) || (HI_GFX_MSG_INNER_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_INNER_EXIT_FUNC == eMsgType))
        {
            return;
        }
        goto OUT_MSG;
    }

    if (0 == strncmp(log_func, pFunc, strlen(pFunc)))
    {
        FormatMessage(pFunc, Line, eMsgType, TmpFormat);
        if ((HI_GFX_MSG_UNF_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_UNF_EXIT_FUNC == eMsgType) || (HI_GFX_MSG_INNER_ENTER_FUNC == eMsgType) || (HI_GFX_MSG_INNER_EXIT_FUNC == eMsgType))
        {
            return;
        }
        goto OUT_MSG;
    }

    return;

OUT_MSG:
    TmpFormat[MSG_LENGTH_MAX] = '\0';

    va_start(args, Format);
    MsgLen = vsnrprintf(LogStr, MSG_LENGTH_MAX, TmpFormat, args);
    va_end(args);

    HI_UNUSED(MsgLen);
    LogStr[MSG_LENGTH_MAX] = '\0';
    OutputMessage(LogStr, eMsgType);

    return;
}

HI_VOID HI_GFX_SetLevel(HI_VOID)
{
#ifndef HI_BUILD_IN_MINI_BOOT
    HI_CHAR *pString = NULL;
    if (NULL != (pString = getenv("gfx_log_level")))
    {
		log_level = (HI_U32)simple_strtoul(pString, NULL, 15);
    }
    if (log_level > 10)
    {
        log_level = 0;
    }
#if 0
    HI_GFX_Print("\n=============================================================\n");
    HI_GFX_Print("log_level = %d\n",log_level);
    HI_GFX_Print("=============================================================\n");
#endif
#endif
    return;
}

HI_VOID HI_GFX_SetLogDebug(HI_VOID)
{
#ifndef HI_BUILD_IN_MINI_BOOT
    HI_CHAR *pString = NULL;
    if (NULL != (pString = getenv("gfx_log_debug")))
    {
        log_debug = (HI_U32)simple_strtoul(pString, NULL, 15);
    }
    if (log_debug > 10)
    {
        log_debug = 0;
    }
#if 0
    HI_GFX_Print("\n=============================================================\n");
    HI_GFX_Print("log_debug = %d\n",log_debug);
    HI_GFX_Print("=============================================================\n");
#endif
#endif
    return;
}

HI_VOID HI_GFX_SetFunc(HI_VOID)
{
#ifndef HI_BUILD_IN_MINI_BOOT
    HI_CHAR *pString = NULL;
    if (NULL == (pString = getenv("gfx_log_func")))
    {
        return;
    }

    if (strlen(pString) > 30)
    {
        return;
    }

    strncpy(log_func, pString, sizeof(log_func) - 1);
    log_func[sizeof(log_func) - 1] = '\0';
#if 0
    HI_GFX_Print("\n=============================================================\n");
    HI_GFX_Print("log_func = %s\n",log_func);
    HI_GFX_Print("=============================================================\n");
#endif
#endif
    return;
}
