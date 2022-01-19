/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : jpeg_drv_proc.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      : release jpeg proc debug
Function List    :

History          :
Date                        Author                     Modification
2018/01/01                   sdk                       Created file
************************************************************************************************/

/*********************************add include here**********************************************/
#ifdef CONFIG_GFX_PROC_SUPPORT
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

#include "hi_drv_jpeg.h"
#include "hi_drv_proc.h"
#include "hi_gfx_comm_k.h"

/** debug file **/
#include "jpeg_drv_debug.h"
#include "jpeg_drv_hal.h"
/***************************** Macro Definition ************************************************/

#define PROC_JPEG_ENTRY_NAME            "hi_jpeg"

/*************************** Structure Definition **********************************************/

/********************** Global Variable declaration ********************************************/

HI_JPEG_PROC_INFO_S *g_stJpegDecProcInfo = NULL;

/******************************* API forward declarations **************************************/
static HI_VOID JPEG_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue);

/******************************* API realization ***********************************************/
static HI_S32 JPEG_PROC_Read(struct seq_file *p, HI_VOID *v)
{
   DRV_PROC_ITEM_S *item  = NULL;
   HI_JPEG_PROC_INFO_S *procinfo = NULL;
   HI_UNUSED(v);

   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_stJpegDecProcInfo, HI_FAILURE);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(p, HI_FAILURE);
   item = (DRV_PROC_ITEM_S *)(p->private);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(item, HI_FAILURE);
   procinfo = (HI_JPEG_PROC_INFO_S *)(item->data);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(procinfo, HI_FAILURE);

   PROC_PRINT(p, "++++++++++++++++++++++++++<--debug_api-->++++++++++++++++++++++++++\n");
   PROC_PRINT(p, "gfx_debug_level = %u\n",   g_stJpegDecProcInfo->DebugLevel);
   PROC_PRINT(p, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

   PROC_PRINT(p, "++++++++++++++++++++++++++<--debug_drv-->++++++++++++++++++++++++++\n");
   HI_GFX_ProcMsg(p);
   PROC_PRINT(p, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

   PROC_PRINT(p, "+++++++++++++++++++++++++<--decode_state-->+++++++++++++++++++++++++\n");
   PROC_PRINT(p, "decode lock times\t: %d\n",     procinfo->DecLockTimes);
   PROC_PRINT(p, "decode pthread nums\t: %u\n",   procinfo->DecPthreadNums);
   PROC_PRINT(p, "continue open times\t: %u\n",   procinfo->OpenDevConTimes);
   PROC_PRINT(p, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

   return HI_SUCCESS;
}

static HI_S32 JPEG_PROC_Write(struct file * file,const char __user * pBuf,size_t count,loff_t *ppos)
{
   HI_U32 LogLevel = 0;
   HI_U32 LogSave  = 0;
   HI_CHAR *pStr = HI_NULL;
   HI_CHAR buf[128] = {'\0'};
   HI_UNUSED(file);
   HI_UNUSED(ppos);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_stJpegDecProcInfo, 0);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pBuf, 0);

   if (count > sizeof(buf))
   {
      HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, count);
      HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, sizeof(buf));
      return 0;
   }

   if (copy_from_user(buf, pBuf, count))
   {
      return 0;
   }
   buf[sizeof(buf) - 1] = '\0';

   if (strncmp("help", buf, 4) == 0)
   {
       HI_DRV_PROC_EchoHelper("=================================================================================\n");
       HI_DRV_PROC_EchoHelper("### jpeg info:\n");
       HI_DRV_PROC_EchoHelper("### ************************************************************************\n");
       HI_DRV_PROC_EchoHelper("### jpeg proc support cmd as follows:\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_debug_level=value > /proc/msp/hi_jpeg : set api debug level\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_level=value > /proc/msp/hi_jpeg : set log level\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_save=value > /proc/msp/hi_jpeg  : set log save type\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_func=func > /proc/msp/hi_jpeg   : set log func\n");
       HI_DRV_PROC_EchoHelper("=================================================================================\n");
       return count;
   }

   if (strncmp("gfx_debug_level", buf, 15) == 0)
   {
      JPEG_PROC_Parse(buf,&(g_stJpegDecProcInfo->DebugLevel));
      return count;
   }

   if (strncmp("gfx_log_level", buf, 13) == 0)
   {
      JPEG_PROC_Parse(buf,&LogLevel);
      HI_GFX_SetLogLevel(LogLevel);
      return count;
   }

   if (strncmp("gfx_log_save", buf, 12) == 0)
   {
      JPEG_PROC_Parse(buf,&LogSave);
      HI_GFX_SetLogSave(LogSave);
      return count;
   }

   if (strncmp("gfx_log_func", buf, 12) == 0)
   {
      pStr = strstr(buf, "=");
      HI_GFX_SetLogFunc(pStr);
      return count;
   }

   return count;
}

static HI_VOID JPEG_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue)
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

/*****************************************************************************
 * Function     : JPEG_PROC_Init
 * Description  :  initial jpeg proc
 * param[in]    : NA
 * retval       : NA
 *****************************************************************************/
HI_S32 JPEG_PROC_Init(HI_VOID)
{
     GFX_PROC_ITEM_S pProcItem = {0};
     HI_CHAR *pEntry_name = PROC_JPEG_ENTRY_NAME;

     pProcItem.fnRead   = JPEG_PROC_Read;
     pProcItem.fnWrite  = JPEG_PROC_Write;
     pProcItem.fnIoctl  = NULL;

     g_stJpegDecProcInfo = (HI_JPEG_PROC_INFO_S*)HI_GFX_VMALLOC(HIGFX_JPGDEC_ID, sizeof(HI_JPEG_PROC_INFO_S));
     if (NULL == g_stJpegDecProcInfo)
     {
        return HI_FAILURE;
     }

     HI_GFX_Memset((HI_VOID*)g_stJpegDecProcInfo, 0x0, sizeof(HI_JPEG_PROC_INFO_S));

     HI_GFX_PROC_AddModule(pEntry_name,&pProcItem,(HI_VOID *)g_stJpegDecProcInfo);

     return HI_SUCCESS;
}

/*****************************************************************************
 * Function     : JPEG_PROC_DInit
 * Description  :  dinitial jpeg proc
 * param[in]    : NA
 * retval       : NA
*****************************************************************************/
HI_VOID JPEG_PROC_DInit(HI_VOID)
{
    HI_CHAR *pEntry_name = PROC_JPEG_ENTRY_NAME;

    if (NULL != g_stJpegDecProcInfo)
    {
       HI_GFX_PROC_RemoveModule(pEntry_name);
       HI_GFX_VFREE(HIGFX_JPGDEC_ID, g_stJpegDecProcInfo);
       g_stJpegDecProcInfo = NULL;
    }

    return;
}

/*****************************************************************************
 * Function     : JPEG_PROC_SetPthreadNum
 * Description  : set jpeg decode pthread numbers
 * param[in]    : PthreadNums
 * retval       : NA
*****************************************************************************/
HI_VOID JPEG_PROC_SetPthreadNum(HI_U32 PthreadNums)
{
    if (NULL != g_stJpegDecProcInfo)
    {
       g_stJpegDecProcInfo->DecPthreadNums = PthreadNums;
    }

    return;
}

/*****************************************************************************
 * Function     : JPEG_PROC_SetDecLockTimes
 * Description  : set jpeg decode has been lock times
 * param[in]    : PthreadNums
 * retval       : NA
*****************************************************************************/
HI_VOID JPEG_PROC_SetDecLockTimes(HI_U32 LockTimes)
{
    if (NULL != g_stJpegDecProcInfo)
    {
       g_stJpegDecProcInfo->DecLockTimes = LockTimes;
    }

    return;
}

/*****************************************************************************
 * Function     : JPEG_PROC_SetOpenDevCnt
 * Description  : set jpeg decode has been open times
 * param[in]    : PthreadNums
 * retval       : NA
*****************************************************************************/
HI_VOID JPEG_PROC_SetOpenDevCnt(HI_S32 OpenTimes)
{
    if (NULL != g_stJpegDecProcInfo)
    {
       g_stJpegDecProcInfo->OpenDevConTimes += OpenTimes;
    }

    return;
}
#endif/**CONFIG_GFX_PROC_SUPPORT**/
