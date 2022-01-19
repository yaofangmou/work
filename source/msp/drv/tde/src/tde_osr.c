/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : tde_osr.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :

History          :
Date                     Author           Modification
2018/01/01               sdk              Created file
************************************************************************************************/

/*********************************add include here**********************************************/
#include <linux/version.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/fcntl.h>
#include <linux/cdev.h>
#include <asm/uaccess.h>
#include <linux/interrupt.h>
#include <linux/poll.h>
#include <linux/workqueue.h>
#include <asm/io.h>
#include "tde_proc.h"
#include "tde_osilist.h"
#include "tde_config.h"
#include "hi_type.h"
#include "tde_debug.h"

/***************************** Macro Definition ********************************************/
#define MKSTR(exp) # exp
#define MKMARCOTOSTR(exp) MKSTR(exp)

HI_U32 g_u32TdeTmpBuf = 0;
module_param(g_u32TdeTmpBuf, uint, S_IRUGO);

MODULE_PARM_DESC(g_u32TdeTmpBuf, "TDE Tmp buffer.");

extern HI_S32  tde_init_module_k(HI_VOID);
extern HI_VOID tde_cleanup_module_k(HI_VOID);
extern HI_S32  tde_open(struct inode *finode, struct file  *ffile);
extern HI_S32  tde_release(struct inode *finode, struct file  *ffile);

extern long tde_ioctl(struct file  *ffile, unsigned int  cmd, unsigned long arg);

#ifdef CONFIG_TDE_PM_ENABLE
extern int tde_suspend(PM_BASEDEV_S *pdev, pm_message_t state);
extern int tde_resume(PM_BASEDEV_S *pdev);
#endif

DECLARE_GFX_NODE("hi_tde", tde_open, tde_release, NULL, tde_ioctl, tde_ioctl, tde_suspend, tde_resume);

/*************************** Enum Definition ***********************************************/

/*************************** Structure Definition ******************************************/

/********************** Global Variable declaration ****************************************/

/******************************* API declaration *******************************************/

/******************************* API release ***********************************************/
#ifndef CONFIG_TDE_VERSION_DISABLE
STATIC HI_VOID HI_GFX_ShowVersionK(HI_BOOL bLoad)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
#if !defined(CONFIG_GFX_COMM_VERSION_DISABLE) && !defined(CONFIG_GFX_COMM_DEBUG_DISABLE) && defined(MODULE)
    if (HI_TRUE == bLoad)
    {
        HI_GFX_Print("Load hi_tde.ko success.\t\t(%s)\n", VERSION_STRING);
    }
    else
    {
        HI_GFX_Print("UnLoad hi_tde.ko success.\t\t(%s)\n", VERSION_STRING);
    }
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

#if 0
#include "hi_drv_tde.h"
#endif
static HI_VOID TDE_ShowCmd(HI_VOID)
{
#if 0
    HI_PRINT("0x%x   /**<-- TDE_BEGIN_JOB                >**/\n",TDE_BEGIN_JOB);
    HI_PRINT("0x%x   /**<-- TDE_BIT_BLIT                 >**/\n",TDE_BIT_BLIT);
    HI_PRINT("0x%x   /**<-- TDE_SOLID_DRAW               >**/\n",TDE_SOLID_DRAW);
    HI_PRINT("0x%x   /**<-- TDE_QUICK_COPY               >**/\n",TDE_QUICK_COPY);
    HI_PRINT("0x%x   /**<-- TDE_QUICK_RESIZE             >**/\n",TDE_QUICK_RESIZE);
    HI_PRINT("0x%x   /**<-- TDE_QUICK_FILL               >**/\n",TDE_QUICK_FILL);
    HI_PRINT("0x%x   /**<-- TDE_QUICK_DEFLICKER          >**/\n",TDE_QUICK_DEFLICKER);
    HI_PRINT("0x%x   /**<-- TDE_MB_BITBLT                >**/\n",TDE_MB_BITBLT);
    HI_PRINT("0x%x   /**<-- TDE_END_JOB                  >**/\n",TDE_END_JOB);
    HI_PRINT("0x%x   /**<-- TDE_WAITFORDONE              >**/\n",TDE_WAITFORDONE);
    HI_PRINT("0x%x   /**<-- TDE_CANCEL_JOB               >**/\n",TDE_CANCEL_JOB);
    HI_PRINT("0x%x   /**<-- TDE_BITMAP_MASKROP           >**/\n",TDE_BITMAP_MASKROP);
    HI_PRINT("0x%x   /**<-- TDE_BITMAP_MASKBLEND         >**/\n",TDE_BITMAP_MASKBLEND);
    HI_PRINT("0x%x   /**<-- TDE_WAITALLDONE              >**/\n",TDE_WAITALLDONE);
    HI_PRINT("0x%x   /**<-- TDE_RESET                    >**/\n",TDE_RESET);
    HI_PRINT("0x%x   /**<-- TDE_TRIGGER_SEL              >**/\n",TDE_TRIGGER_SEL);
    HI_PRINT("0x%x   /**<-- TDE_SET_DEFLICKERLEVEL       >**/\n",TDE_SET_DEFLICKERLEVEL);
    HI_PRINT("0x%x   /**<-- TDE_GET_DEFLICKERLEVEL       >**/\n",TDE_GET_DEFLICKERLEVEL);
    HI_PRINT("0x%x   /**<-- TDE_SET_ALPHATHRESHOLD_VALUE          >**/\n",TDE_SET_ALPHATHRESHOLD_VALUE);
    HI_PRINT("0x%x   /**<-- TDE_GET_ALPHATHRESHOLD_VALUE          >**/\n",TDE_GET_ALPHATHRESHOLD_VALUE);
    HI_PRINT("0x%x   /**<-- TDE_SET_ALPHATHRESHOLD_STATE          >**/\n",TDE_SET_ALPHATHRESHOLD_STATE);
    HI_PRINT("0x%x   /**<-- TDE_GET_ALPHATHRESHOLD_STATE          >**/\n",TDE_GET_ALPHATHRESHOLD_STATE);
    HI_PRINT("0x%x   /**<-- TDE_PATTERN_FILL                      >**/\n",TDE_PATTERN_FILL);
    HI_PRINT("0x%x   /**<-- TDE_ENABLE_REGIONDEFLICKER            >**/\n",TDE_ENABLE_REGIONDEFLICKER);
#endif
    return;
}

/***************************************************************************************
* func          : TDE_DRV_ModInit
* description   : init tde mod
                  CNcomment: 加载驱动初始化 CNend\n
* param[in]     :
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
***************************************************************************************/
HI_S32 TDE_DRV_ModInit(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#ifndef HI_MCE_SUPPORT
    Ret = tde_init_module_k();
    if (0 != Ret)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, tde_init_module_k, FAILURE_TAG);
        return -1;
    }
#endif

#ifdef CONFIG_TDE_PM_ENABLE
    Ret = HI_GFX_PM_Register();
    if (0 != Ret)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_PM_Register, FAILURE_TAG);
        tde_cleanup_module_k();
        return -1;
    }
#endif

#ifdef CONFIG_GFX_PROC_SUPPORT
    Ret = tde_proc_init();
    if (0 != Ret)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, tde_proc_init, FAILURE_TAG);
        tde_cleanup_module_k();
        return -1;
    }
    {
        GFX_PROC_ITEM_S pProcItem = {tde_read_proc, tde_write_proc, NULL};
        HI_GFX_PROC_AddModule("hi_tde", &pProcItem, NULL);
    }
#endif

#ifndef CONFIG_TDE_VERSION_DISABLE
    HI_GFX_ShowVersionK(HI_TRUE);
#endif

    TDE_ShowCmd();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return 0;
}

HI_VOID  TDE_DRV_ModExit(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
#ifdef CONFIG_GFX_PROC_SUPPORT
    HI_GFX_PROC_RemoveModule("hi_tde");
    tde_proc_dinit();
#endif

#ifndef HI_MCE_SUPPORT
    tde_cleanup_module_k();
#endif

#ifdef CONFIG_TDE_PM_ENABLE
    HI_GFX_PM_UnRegister();
#endif

#ifndef CONFIG_TDE_VERSION_DISABLE
    HI_GFX_ShowVersionK(HI_FALSE);
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

#ifdef MODULE
module_init(TDE_DRV_ModInit);
module_exit(TDE_DRV_ModExit);
#endif

#ifdef CONFIG_GFX_PROC_SUPPORT
MODULE_AUTHOR(AUTHOR);
MODULE_DESCRIPTION(DESCRIPTION);
MODULE_LICENSE("GPL");
MODULE_VERSION(TDE_VERSION);
#else
MODULE_AUTHOR("");
MODULE_DESCRIPTION("");
MODULE_LICENSE("GPL");
MODULE_VERSION("");
#endif
