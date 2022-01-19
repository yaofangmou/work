/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : jpge_proc.c
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

#include "hi_drv_proc.h"
#include "jpge_proc.h"
#include "hi_gfx_comm_k.h"

/** debug file **/
#include "jpge_debug.h"
#include "jpge_hal.h"
/***************************** Macro Definition ************************************************/

#define PROC_JPGE_ENTRY_NAME            "hi_jpge"

/*************************** Structure Definition **********************************************/

/********************** Global Variable declaration ********************************************/

static JPGE_PROC_INFO_S *g_stProcInfo = NULL;

/******************************* API forward declarations **************************************/
static HI_VOID JPGE_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue);

/******************************* API realization ***********************************************/
static HI_S32 JPGE_PROC_Read(struct seq_file *p, HI_VOID *v)
{
   HI_UNUSED(v);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(p, HI_FAILURE);

   PROC_PRINT(p, "++++++++++++++++++++++++++++ jpge info +++++++++++++++++++++++++\n");
   HI_GFX_ProcMsg(p);
   PROC_PRINT(p, "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");

   return HI_SUCCESS;
}

static HI_S32 JPGE_PROC_Write(struct file * file,const char __user * pBuf,size_t count,loff_t *ppos)
{
   HI_U32 LogLevel = 0;
   HI_U32 LogSave  = 0;
   HI_CHAR *pStr = NULL;
   HI_CHAR buf[128] = {'\0'};
   HI_UNUSED(file);
   HI_UNUSED(ppos);
   HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pBuf, 0);

   if (count > sizeof(buf))
   {
      return 0;
   }

   if (copy_from_user(buf, pBuf, count))
   {
      return 0;
   }
   buf[sizeof(buf) - 1] = '\0';

   if (strncmp("help", buf, 4) == 0)
   {
       HI_DRV_PROC_EchoHelper("=======================================================================\n");
       HI_DRV_PROC_EchoHelper("### jpge info:\n");
       HI_DRV_PROC_EchoHelper("### ****************************************************************\n");
       HI_DRV_PROC_EchoHelper("### jpge proc support cmd as follows:\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_level=value > /proc/msp/hi_jpge : set log level\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_save=value > /proc/msp/hi_jpge  : set log save type\n");
       HI_DRV_PROC_EchoHelper("###     echo gfx_log_func=func > /proc/msp/hi_jpge   : set log func\n");
       HI_DRV_PROC_EchoHelper("=======================================================================\n");
       return count;
   }

   if (strncmp("gfx_log_level", buf, 13) == 0)
   {
      JPGE_PROC_Parse(buf,&LogLevel);
      HI_GFX_SetLogLevel(LogLevel);
      return count;
   }

   if (strncmp("gfx_log_save", buf, 12) == 0)
   {
      JPGE_PROC_Parse(buf,&LogSave);
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

static HI_VOID JPGE_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue)
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
 * Function     : JPGE_PROC_Init
 * Description  :  initial jpge proc
 * param[in]    : NA
 * retval       : NA
 *****************************************************************************/
HI_S32 JPGE_PROC_Init(HI_VOID)
{
     GFX_PROC_ITEM_S pProcItem = {0};
     HI_CHAR *pEntry_name = PROC_JPGE_ENTRY_NAME;

     pProcItem.fnRead   = JPGE_PROC_Read;
     pProcItem.fnWrite  = JPGE_PROC_Write;
     pProcItem.fnIoctl  = NULL;

     g_stProcInfo = (JPGE_PROC_INFO_S*)HI_GFX_VMALLOC(HIGFX_JPGENC_ID, sizeof(JPGE_PROC_INFO_S));
     if (NULL == g_stProcInfo)
     {
        return HI_FAILURE;
     }

     HI_GFX_Memset((HI_VOID*)g_stProcInfo, 0x0, sizeof(JPGE_PROC_INFO_S));

     HI_GFX_PROC_AddModule(pEntry_name,&pProcItem,(HI_VOID *)g_stProcInfo);

     return HI_SUCCESS;
}

/*****************************************************************************
 * Function     : JPGE_PROC_DInit
 * Description  : dinitial jpge proc
 * param[in]    : NA
 * retval       : NA
*****************************************************************************/
HI_VOID JPGE_PROC_DInit(HI_VOID)
{
    HI_CHAR *pEntry_name = PROC_JPGE_ENTRY_NAME;

    if (NULL != g_stProcInfo)
    {
       HI_GFX_PROC_RemoveModule(pEntry_name);
       HI_GFX_VFREE(HIGFX_JPGENC_ID, g_stProcInfo);
       g_stProcInfo = NULL;
    }

    return;
}
#endif/**CONFIG_GFX_PROC_SUPPORT**/
