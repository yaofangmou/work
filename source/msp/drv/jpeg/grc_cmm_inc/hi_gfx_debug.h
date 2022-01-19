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
Description     : this file only use by drv_mod_debug.c
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

/********************** Global Variable declaration ***********************************************/

/******************************* API declaration **************************************************/
#ifndef CONFIG_USE_SDK_LOG
static HI_VOID OutputMessageToFile(HI_CHAR* pMsg)
{
    HI_UNUSED(pMsg);
    return;
}

static HI_VOID OutputMessage(HI_CHAR* pMsg, HI_GFX_MSG_TYPE_E eMsgType)
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
                if (0 == log_save)
                {
                    HI_GFX_Print("%s",pMsg);
                }
                if (1 == log_save)
                {
                    OutputMessageToFile(pMsg);
                }
             }
             break;
        case HI_GFX_MSG_BEG:
        case HI_GFX_MSG_END:
             if ((log_level > 1) && (log_level < 5))
             {
                if (0 == log_save)
                {
                    HI_GFX_Print("%s",pMsg);
                }
                if (1 == log_save)
                {
                    OutputMessageToFile(pMsg);
                }
             }
             break;
        case HI_GFX_MSG_UNF_ENTER_FUNC:
        case HI_GFX_MSG_UNF_EXIT_FUNC:
        case HI_GFX_MSG_INNER_ENTER_FUNC:
        case HI_GFX_MSG_INNER_EXIT_FUNC:
             if ((2 == log_level) || (4 == log_level))
             {
                if (0 == log_save)
                {
                    HI_GFX_Print("%s",pMsg);
                }
                if (1 == log_save)
                {
                    OutputMessageToFile(pMsg);
                }
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
               if (0 == log_save)
               {
                   HI_GFX_Print("%s",pMsg);
               }
               if (1 == log_save)
               {
                   OutputMessageToFile(pMsg);
               }
            }
            break;
        default:
            break;
    }

    return;
}

static HI_VOID FormatMessage(const HI_CHAR* pMod, const HI_CHAR* pFunc, const HI_U32 Line, const HI_GFX_MSG_TYPE_E eMsgType, HI_CHAR *Format, HI_BOOL *pLogErr, HI_BOOL *pLogFunc, HI_BOOL *pLogValue)
{
    HI_CHAR LogStr[MSG_LENGTH_MAX + 1] = {'\0'};

    if (0 == log_level)
    {
        return;
    }

    *pLogErr = HI_TRUE;
    switch (eMsgType)
    {
        case HI_GFX_MSG_ERR_FUNC:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "call %s -> return %s = [0x%08X]");
             return;
        case HI_GFX_MSG_ERR_INT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %d");
             return;
        case HI_GFX_MSG_ERR_UINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %u");
             return;
        case HI_GFX_MSG_ERR_XINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = 0x%X");
             return;
        case HI_GFX_MSG_ERR_LONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %lld");
             return;
        case HI_GFX_MSG_ERR_ULONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %llu");
             return;
        case HI_GFX_MSG_ERR_VOID:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %p");
             return;
        case HI_GFX_MSG_ERR_STR:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %s");
             return;
        case HI_GFX_MSG_ERR_INFO:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][err] : %s[%d] -> %s\n",pMod, pFunc, Line, "<%s>");
             return;
        default:
             break;
    }
    *pLogErr = HI_FALSE;

    /** the follows debug dispose should care performance, if not open debug level, not need format strings **/
    /** 底下debug处理需要注意对性能的影响，级别没有打开不需要处理，这里不单单考虑宏开关控制，这样对性能影响最小**/
    if (1 == log_level)
    {
        return;
    }

    *pLogFunc = HI_TRUE;
    switch (eMsgType)
    {
        case HI_GFX_MSG_BEG:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s-beg][line] :===============================================================\n",pMod);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_END:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s-end][line] :===============================================================\n",pMod);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        default:
             break;
    }

    switch (eMsgType)
    {
        case HI_GFX_MSG_UNF_ENTER_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s][func] : %s[%d] : >>>>>>>>>>>>>>>>[enter]\n",pMod, pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_UNF_EXIT_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s][func] : %s[%d] : >>>>>>>>>>>>>>>>[exit]\n",pMod, pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_INNER_ENTER_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s][func] : %s[%d] : ===============>[enter]\n",pMod, pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        case HI_GFX_MSG_INNER_EXIT_FUNC:
             snprintf(LogStr, MSG_LENGTH_MAX, "[module-gfx-%s][func] : %s[%d] : ===============>[exit]\n",pMod, pFunc, Line);
             LogStr[MSG_LENGTH_MAX] = '\0';
             return OutputMessage(LogStr, eMsgType);
        default:
             break;
    }
    *pLogFunc = HI_FALSE;

    if (2 == log_level)
    {
        return;
    }

    *pLogValue = HI_TRUE;
    switch (eMsgType)
    {
        case HI_GFX_MSG_DEBUG_INT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %d");
             return;
        case HI_GFX_MSG_DEBUG_UINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %u");
             return;
        case HI_GFX_MSG_DEBUG_XINT:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = 0x%X");
             return;
        case HI_GFX_MSG_DEBUG_LONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %lld");
             return;
        case HI_GFX_MSG_DEBUG_ULONG:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %llu");
             return;
        case HI_GFX_MSG_DEBUG_VOID:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %p");
             return;
        case HI_GFX_MSG_DEBUG_STR:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "%s = %s");
             return;
        case HI_GFX_MSG_DEBUG_INFO:
             snprintf(Format, MSG_LENGTH_MAX, "[module-gfx-%s][debug] : %s[%d] -> %s\n",pMod, pFunc, Line, "<%s>");
             return;
        default:
             break;
    }
    *pLogValue = HI_FALSE;

    return;
}
#endif

static inline HI_VOID DRV_GFX_SetLogFunc(const HI_CHAR* pMod, HI_CHAR* pFunc)
{
    if ((NULL != pFunc) && (NULL != pMod) && (strlen(pFunc) < 50))
    {
        strncpy(log_func, pFunc + 1, sizeof(log_func) - 1);
        log_func[sizeof(log_func) - 1] = '\0';
    }
    return;
}

static inline HI_VOID DRV_GFX_SetLogLevel(HI_U32 LogLevel)
{
    log_level = LogLevel;
    return;
}

static inline HI_VOID DRV_GFX_SetLogSave(HI_U32 LogSave)
{
    log_save = LogSave;
    return;
}

#ifdef CONFIG_GFX_PROC_SUPPORT
static inline HI_VOID DRV_GFX_ProcMsg(struct seq_file *p)
{
    if (NULL != p)
    {
        PROC_PRINT(p, "gfx_log_level\t: %u\n",   log_level);
        PROC_PRINT(p, "gfx_log_save\t: %u\n",    log_save);
        PROC_PRINT(p, "gfx_log_func\t: %s\n",    log_func);
    }
    return;
}
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif/**__HI_GFX_DEBUG_H__**/
