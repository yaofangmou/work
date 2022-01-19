/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name           : png_proc.c
Version             : Initial Draft
Author              :
Created             : 2018/01/01
Description         : png proc infomation
Function List       :


History             :
Date                         Author                     Modification
2018/01/01                   sdk                        Created file
**************************************************************************************************/
#ifdef CONFIG_GFX_PROC_SUPPORT

#include <linux/module.h>
#include <linux/fs.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/slab.h>

#include "hi_drv_proc.h"

#include "png_proc.h"
#include "png_define.h"

/** debug file **/
#include "png_debug.h"

PNG_PROC_INFO_S gs_stPngProcInfo = {0};
static HI_BOOL gs_bPngProcOn = HI_FALSE;

static HI_CHAR *gs_decstate[HI_PNG_STATE_BUTT + 1] =
{
    "Nostart",
    "Decoding",
    "Finish",
    "Err",
    "Unknown"
};

static HI_CHAR *gs_decfmt[] =
{
    "Gray",
    "Unknown",
    "RGB",
    "Clut",
    "AGray",
    "Unknown",
    "ARGB"
};

extern HI_VOID PngOsiShowInstanceState(struct seq_file *p);
static HI_VOID PNG_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue);

HI_S32 PNG_Read_Proc(struct seq_file *p, HI_VOID *v)
{
    DRV_PROC_ITEM_S *item = NULL;
    PNG_PROC_INFO_S *procinfo = NULL;
    HI_UNUSED(v);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(p, HI_FAILURE);
    item = (DRV_PROC_ITEM_S *)(p->private);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(item, HI_FAILURE);
    procinfo = (PNG_PROC_INFO_S *)(item->data);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(procinfo, HI_FAILURE);

    PROC_PRINT(p, "width\t\t:%u\n",  procinfo->u32Width);
    PROC_PRINT(p, "height\t\t:%u\n", procinfo->u32Height);
    if (procinfo->eColorFmt < sizeof(gs_decfmt)/sizeof(gs_decfmt[0]))
    {
        PROC_PRINT(p, "fmt\t\t:%s\n", gs_decfmt[procinfo->eColorFmt]);
    }
    PROC_PRINT(p, "bitdepth\t:%d\n",    procinfo->u8BitDepth);
    PROC_PRINT(p, "transform\t:0x%x\n", procinfo->u32Transform);
    PROC_PRINT(p, "sync\t\t:%s\n", procinfo->bSync ? ("YES") : ("NO"));
    if (procinfo->eState < (HI_PNG_STATE_BUTT + 1))
    {
        PROC_PRINT(p, "state\t\t:%s\n", gs_decstate[procinfo->eState]);
    }
    PROC_PRINT(p, "filter buf addr\t:0x%x\n", procinfo->u32FlterPhyaddr);
    PROC_PRINT(p, "filter buf size\t:0x%x\n", procinfo->u32Size);
    PROC_PRINT(p, "stream buf addr\t:0x%x\n", procinfo->u32StreamBufPhyaddr);
    PROC_PRINT(p, "dst addr\t:0x%x\n",        procinfo->u32ImagePhyaddr);
    PROC_PRINT(p, "dst stride\t:0x%x\n",      procinfo->u32Stride);
    PROC_PRINT(p, "transcolor\t:0x%x%x%x\n",  procinfo->u16TrnsColorRed, procinfo->u16TrnsColorGreen, procinfo->u16TrnsColorBlue);
    PROC_PRINT(p, "filler\t\t:0x%x\n",        procinfo->u16Filler);

    PngOsiShowInstanceState(p);


    PROC_PRINT(p, "++++++++++++++++++++++++++++ debug msg ++++++++++++++++++++++++++++\n");
    HI_GFX_ProcMsg(p);
    PROC_PRINT(p, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

    return HI_SUCCESS;
}

HI_S32 PNG_Write_Proc(struct file *file, const char __user *pBuf, size_t count, loff_t *ppos)
{
    HI_U32 LogLevel = 0;
    HI_U32 LogSave  = 0;
    HI_CHAR *pStr = NULL;
    HI_CHAR TmpBuf[128] = {'\0'};
    HI_UNUSED(file);
    HI_UNUSED(ppos);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pBuf, 0);

    if (count > sizeof(TmpBuf))
    {
        return 0;
    }

    if (copy_from_user(TmpBuf, pBuf, count))
    {
        return 0;
    }
    TmpBuf[sizeof(TmpBuf) - 1] = '\0';

    if (strncmp("help", TmpBuf, 4) == 0)
    {
        HI_DRV_PROC_EchoHelper("=======================================================================\n");
        HI_DRV_PROC_EchoHelper("### png info:\n");
        HI_DRV_PROC_EchoHelper("### ****************************************************************\n");
        HI_DRV_PROC_EchoHelper("### png proc support cmd as follows:\n");
        HI_DRV_PROC_EchoHelper("###     echo gfx_log_level=value > /proc/msp/hi_png : set log level\n");
        HI_DRV_PROC_EchoHelper("###     echo gfx_log_save=value > /proc/msp/hi_png  : set log save type\n");
        HI_DRV_PROC_EchoHelper("###     echo gfx_log_func=func > /proc/msp/hi_png   : set log func\n");
        HI_DRV_PROC_EchoHelper("=======================================================================\n");
        return 0;
    }

    if (strncmp("gfx_log_level", TmpBuf, 13) == 0)
    {
       PNG_PROC_Parse(TmpBuf,&LogLevel);
       HI_GFX_SetLogLevel(LogLevel);
       return 0;
    }

    if (strncmp("gfx_log_save", TmpBuf, 12) == 0)
    {
       PNG_PROC_Parse(TmpBuf,&LogSave);
       HI_GFX_SetLogSave(LogSave);
       return 0;
    }

    if (strncmp("gfx_log_func", TmpBuf, 12) == 0)
    {
       pStr = strstr(TmpBuf, "=");
       HI_GFX_SetLogFunc(pStr);
       return 0;
    }

    return 0;
}

static HI_VOID PNG_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue)
{
    HI_CHAR *pReadStr = NULL;

    pReadStr = strstr(pBuf, "=");
    if (NULL == pReadStr)
    {
        return;
    }

    *pValue = simple_strtoul((pReadStr + 1), (char **)NULL, 0);

    return;
}

HI_VOID PNG_ProcInit(HI_VOID)
{
    GFX_PROC_ITEM_S pProcItem = {PNG_Read_Proc, PNG_Write_Proc, NULL};
    HI_GFX_PROC_AddModule("hi_png", &pProcItem, &gs_stPngProcInfo);
    return;
}

HI_VOID PNG_ProcCleanup(HI_VOID)
{
    HI_GFX_PROC_RemoveModule("hi_png");
    return;
}

HI_BOOL PNG_IsProcOn(HI_VOID)
{
    return gs_bPngProcOn;
}
#endif
