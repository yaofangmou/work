/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : tde_osr_k.c
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
#include "hi_kernel_adapt.h"
#include "drv_tde_ext.h"
#include "hi_tde_type.h"
#include "hi_drv_tde.h"
#include "tde_osictl.h"
#include "tde_osilist.h"
#include "tde_hal.h"
#include "tde_handle.h"
#include "wmalloc.h"
#include "tde_adp.h"
#include "hi_gfx_comm_k.h"
#include "hi_reg_common.h"
#include "tde_debug.h"

/***************************** Macro Definition ********************************************/
typedef unsigned long       HI_UL;
#define TDE_NAME            "HI_TDE"

/*************************** Enum Definition ***********************************************/

/*************************** Structure Definition ******************************************/

/********************** Global Variable declaration ****************************************/
STATIC spinlock_t s_taskletlock;
STATIC spinlock_t s_TdeRefLock;

extern struct miscdevice gfx_dev;

#ifdef TDE_HWC_COOPERATE
STATIC HI_U32 g_TdeIrqHandle = 0;
#endif


typedef HI_S32(*TdeCtlPtrFunc)(unsigned long *argp,struct file *ffile);

typedef struct TdeCtlFuncDispatchItem
{
    HI_U32 u32TdeCmd;
    TdeCtlPtrFunc tde_ctl_ptr_func;
}TDE_CTL_FUNC_DISPATCH_ITEM;

STATIC HI_S32 TdeOsrBeginJob(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrBitBlit(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrSolidDraw(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrQuickCopy(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrQuickResize(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrQuickFill(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrQuickDeflicker(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrMbBitBlit(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrEndJob(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrWaitForDone(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrCancelJob(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrBitMapMaskRop(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrBitMapMaskBlend(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrWaitAllDone(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrReset(unsigned long *argp,struct file *ffile);

STATIC HI_S32 TdeOsrSetDeflickerLevel(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrGetDeflickerLevel(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrSetAlphaThreshholdValue(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrGetAlphaThreshholdValue(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrSetAlphaThreshholdState(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrGetAlphaThreshholdState(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrPatternFill(unsigned long *argp,struct file *ffile);
STATIC HI_S32 TdeOsrEnableRegionDeflicker(unsigned long *argp,struct file *ffile);

TDE_CTL_FUNC_DISPATCH_ITEM g_paTdeCtlFuncDispatchItem[] = { { 0 , NULL}, \
    {TDE_BEGIN_JOB ,               TdeOsrBeginJob},                  {TDE_BIT_BLIT,                 TdeOsrBitBlit},       \
    {TDE_SOLID_DRAW,               TdeOsrSolidDraw},                 {TDE_QUICK_COPY,               TdeOsrQuickCopy},     \
    {TDE_QUICK_RESIZE,             TdeOsrQuickResize},               {TDE_QUICK_FILL,               TdeOsrQuickFill},     \
    {TDE_QUICK_DEFLICKER,          TdeOsrQuickDeflicker},            {TDE_MB_BITBLT,                TdeOsrMbBitBlit},     \
    {TDE_END_JOB,                  TdeOsrEndJob},                    {TDE_WAITFORDONE,              TdeOsrWaitForDone},   \
    {TDE_CANCEL_JOB,               TdeOsrCancelJob},                 {TDE_BITMAP_MASKROP,           TdeOsrBitMapMaskRop}, \
    {TDE_BITMAP_MASKBLEND,         TdeOsrBitMapMaskBlend},           {TDE_WAITALLDONE,              TdeOsrWaitAllDone},   \
    {TDE_RESET,                    TdeOsrReset},                     {0, NULL}, \
    {TDE_SET_DEFLICKERLEVEL,       TdeOsrSetDeflickerLevel},         {TDE_GET_DEFLICKERLEVEL,       TdeOsrGetDeflickerLevel},       \
    {TDE_SET_ALPHATHRESHOLD_VALUE, TdeOsrSetAlphaThreshholdValue},   {TDE_GET_ALPHATHRESHOLD_VALUE, TdeOsrGetAlphaThreshholdValue}, \
    {TDE_SET_ALPHATHRESHOLD_STATE, TdeOsrSetAlphaThreshholdState},   {TDE_GET_ALPHATHRESHOLD_STATE, TdeOsrGetAlphaThreshholdState}, \
    {TDE_PATTERN_FILL,             TdeOsrPatternFill},               {TDE_ENABLE_REGIONDEFLICKER ,  TdeOsrEnableRegionDeflicker},   \
    {0, NULL },                                                      {0, NULL }, \
    {0, NULL }
};

#define TDE_IOCTL_FUNC_NUM     (sizeof(g_paTdeCtlFuncDispatchItem) / sizeof(g_paTdeCtlFuncDispatchItem[0]))

#define TDE_CHECK_IOCTL_CMD(cmd)\
    do{\
        if(cmd < 1 || cmd >= TDE_IOCTL_FUNC_NUM)\
        {\
            return -EFAULT;\
        }\
    }while(0)

#define TDE_IOCTL_CHECK_PARA(argp)\
    do{\
        if(NULL == argp)\
        {\
            return -EFAULT;\
        }\
    }while(0)

STATIC int tde_osr_isr(int irq, void *dev_id);
STATIC void tde_tasklet_func(unsigned long int_status);

STATIC atomic_t g_TDECount = ATOMIC_INIT(0);

#ifdef CONFIG_TDE_PM_ENABLE
int tde_suspend(PM_BASEDEV_S *pdev, pm_message_t state);
int tde_resume(PM_BASEDEV_S *pdev);
#endif

#ifdef TDE_TIME_COUNT
TDE_timeval_s g_stTimeStart;
TDE_timeval_s g_stTimeEnd;
HI_U64 g_u64TimeDiff;
#endif

DECLARE_TASKLET(tde_tasklet, tde_tasklet_func, 0);

#ifdef CONFIG_TDE_TDE_EXPORT_FUNC
STATIC TDE_EXPORT_FUNC_S s_TdeExportFuncs =
{
    .pfnTdeModInit          = TDE_DRV_ModInit,
    .pfnTdeModExit          = TDE_DRV_ModExit,
    .pfnTdeOpen             = TdeOsiOpen,
    .pfnTdeClose            = TdeOsiClose,
    .pfnTdeBeginJob         = TdeOsiBeginJobEx,
    .pfnTdeEndJob           = TdeOsiEndJob,
    .pfnTdeCancelJob        = TdeOsiCancelJob,
    .pfnTdeWaitForDone      = TdeOsiWaitForDone,
    .pfnTdeWaitAllDone      = TdeOsiWaitAllDone,
    .pfnTdeQuickCopy        = TdeOsiQuickCopy,
    .pfnTdeQuickFill        = TdeOsiQuickFill,
    .pfnTdeBlit             = TdeOsiBlit,
    .pfnTdeSetDeflickerLevel        = TdeOsiSetDeflickerLevel,
    .pfnTdeEnableRegionDeflicker    = TdeOsiEnableRegionDeflicker,
    .pfnTdeCalScaleRect             = TdeCalScaleRect,
#ifdef CONFIG_TDE_PM_ENABLE
    .pfnTdeSuspend             = tde_suspend,
    .pfnTdeResume             = tde_resume,
#endif
    .pfnTdeQuickCopyEx         = TdeOsiQuickCopyEx,
#ifdef CONFIG_TDE_BLIT_EX
    .pfnTdeSingleBlitEx         = TdeOsiSingleBlitEx,
#endif
    .pfnTdeLockWorkingFlag   = TdeOsiListLockWorkingFlag,
    .pfnTdeUnlockWorkingFlag = TdeOsiListUnlockWorkingFlag,
    .pfnTdeGetWorkingFlag    = TdeOsiListGetWorkingFlag,
    .pfnTdeSetWorkingFlag    = TdeOsiListSetWorkingFlag
};
#endif

/******************************* API declaration *******************************************/

/******************************* API release ***********************************************/
STATIC HI_VOID DRV_TDE_PrintSurfaceInfo(TDE2_SURFACE_S *pstSurface, TDE2_MB_S *pstMbSurface, TDE2_RECT_S *pstRect, TDE2_OPT_S *pstOpt, TDE2_MBOPT_S *pstMbOpt)
{
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");

    if (NULL != pstSurface)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstSurface->u32PhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->enColorFmt);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u32Height);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u32Stride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, pstSurface->pu8ClutPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->bYCbCrClut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->bAlphaMax255);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->bAlphaExt1555);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u8Alpha0);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u8Alpha1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstSurface->u32CbCrPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSurface->u32CbCrStride);

    }

    if (NULL != pstRect)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT,  pstRect->s32Xpos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT,  pstRect->s32Ypos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstRect->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstRect->u32Height);
    }

    if (NULL != pstMbSurface)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbSurface->enMbFmt);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstMbSurface->u32YPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbSurface->u32YWidth);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbSurface->u32YHeight);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbSurface->u32YStride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstMbSurface->u32CbCrPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbSurface->u32CbCrStride);
    }

    if (NULL != pstOpt)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->bResize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enAluCmd);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enRopCode_Color);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enRopCode_Alpha);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enColorKeyMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stAlpha.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stRed.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stGreen.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkARGB.stBlue.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stAlpha.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stY.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCb.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkYCbCr.stCr.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stAlpha.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8CompMin);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8CompMax);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.bCompOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.bCompIgnore);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8CompMask);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8Reserved);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8Reserved1);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->unColorKeyValue.struCkClut.stClut.u8Reserved2);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enClipMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stClipRect.s32Xpos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stClipRect.s32Ypos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stClipRect.u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stClipRect.u32Height);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enDeflickerMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->bResize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enFilterMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enMirror);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->bClutReload);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->u8GlobalAlpha);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->enOutAlphaFrom);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->u32Colorize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.bGlobalAlphaEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.bPixelAlphaEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.bSrc1AlphaPremulti);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.bSrc2AlphaPremulti);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.eBlendCmd);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.eSrc1BlendMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stBlendOpt.eSrc2BlendMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stCscOpt.bICSCUserEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stCscOpt.bICSCParamReload);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stCscOpt.bOCSCUserEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->stCscOpt.bOCSCParamReload);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstOpt->stCscOpt.u32ICSCParamAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstOpt->stCscOpt.u32OCSCParamAddr);
    }

    if (NULL != pstMbOpt)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->enClipMode);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->stClipRect.s32Xpos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->stClipRect.s32Ypos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->stClipRect.u32Height);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->stClipRect.u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->bDeflicker);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->enResize);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->bSetOutAlpha);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstMbOpt->u8OutAlpha);
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    return;
}

/***************************************************************************************
* func          : tde_init_module_k
* description   : init tde mod
                  CNcomment: 加载驱动初始化 CNend\n
* param[in]     :
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
***************************************************************************************/
HI_S32 tde_init_module_k(HI_VOID)
{
    HI_S32 Ret = HI_FAILURE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    if (TdeHalInit(TDE_REG_BASEADDR) < 0)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, TdeHalInit, FAILURE_TAG);
        return -1;
    }

#ifndef TDE_HWC_COOPERATE
    if (0 != osal_request_irq(TDE_INTNUM, (irq_handler_t)tde_osr_isr, IRQF_PROBE_SHARED, "tde", NULL))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, osal_request_irq, FAILURE_TAG);
        TdeHalRelease();
        return -1;
    }
#else
    if (0 != osal_request_irq(TDE_INTNUM, (irq_handler_t)tde_osr_isr, IRQF_SHARED, "tde", &g_TdeIrqHandle))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, osal_request_irq, FAILURE_TAG);
        TdeHalRelease();
        return -1;
    }
#endif

    Ret = HI_GFX_SetIrq(HIGFX_TDE_ID, TDE_INTNUM, "tde");
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_SetIrq, Ret);
        tde_cleanup_module_k();
        return Ret;
    }

    TdeOsiListInit();

    Ret = HI_GFX_MODULE_Register(HIGFX_TDE_ID, TDE_NAME, &s_TdeExportFuncs);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_MODULE_Register, Ret);
        tde_cleanup_module_k();
        return Ret;
    }

    spin_lock_init(&s_taskletlock);

    spin_lock_init(&s_TdeRefLock);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return 0;
}

/***************************************************************************************
* func          : tde_cleanup_module_k
* description   : dinit tde mod
                  CNcomment: 去初始化 CNend\n
* param[in]     :
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
***************************************************************************************/
HI_VOID tde_cleanup_module_k(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_MODULE_UnRegister(HIGFX_TDE_ID);

    TdeOsiListTerm();

#ifndef TDE_HWC_COOPERATE
    osal_free_irq(TDE_INTNUM, "tde", NULL);
#else
    osal_free_irq(TDE_INTNUM, "tde", &g_TdeIrqHandle);
#endif

    TdeHalRelease();
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return;
}

HI_S32 tde_open(struct inode *finode, struct file  *ffile)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(finode);
    HI_UNUSED(ffile);

    atomic_inc(&g_TDECount);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_VOID ConvertSurface(TDE2_SURFACE_S *stSrc, TDE2_IOC_SURFACE_S *pstDst)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    if ((NULL != stSrc) && (NULL != pstDst))
    {
       stSrc->bAlphaExt1555    = pstDst->bAlphaExt1555;
       stSrc->bAlphaMax255     = pstDst->bAlphaMax255;
       stSrc->bYCbCrClut       = pstDst->bYCbCrClut;
       stSrc->enColorFmt       = pstDst->enColorFmt;
       stSrc->pu8ClutPhyAddr   = (HI_U8*)(unsigned long)pstDst->u32ClutPhyAddr;
       stSrc->u32CbCrPhyAddr   = pstDst->u32CbCrPhyAddr;
       stSrc->u32CbCrStride    = pstDst->u32CbCrStride;
       stSrc->u32Height        = pstDst->u32Height;
       stSrc->u32PhyAddr       = pstDst->u32PhyAddr;
       stSrc->u32Stride        = pstDst->u32Stride;
       stSrc->u32Width         = pstDst->u32Width;
       stSrc->u8Alpha0         = pstDst->u8Alpha0;
       stSrc->u8Alpha1         = pstDst->u8Alpha1;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return;
}

HI_S32 tde_release(struct inode *finode, struct file  *ffile)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(finode);

    if (atomic_dec_and_test(&g_TDECount))
    {
        if (NULL != ffile)
        {
            TdeFreePendingJob((HI_VOID *)ffile);
        }
    }

    if (atomic_read(&g_TDECount) < 0)
    {
        atomic_set(&g_TDECount, 0);
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return 0;
}

typedef union
{
    TDE_BITBLIT_CMD_S stBlitCmd;
    TDE_SOLIDDRAW_CMD_S stDrawCmd;
    TDE_QUICKDEFLICKER_CMD_S stDeflickerCmd;
    TDE_QUICKCOPY_CMD_S stCopyCmd;
    TDE_QUICKRESIZE_CMD_S stResizeCmd;
    TDE_QUICKFILL_CMD_S stFillCmd;
    TDE_ENDJOB_CMD_S stEndCmd;
    TDE_MBBITBLT_CMD_S stMbBlitCmd;
    TDE_BITMAP_MASKROP_CMD_S stMaskRopCmd;
    TDE_BITMAP_MASKBLEND_CMD_S stMaskBlendCmd;
    TDE_PATTERN_FILL_CMD_S stPatternCmd;
}TDE_IOCTL_CMD_U;

long tde_ioctl(struct file *ffile, unsigned int cmd, unsigned long arg)
{
    HI_U8 u8Cmd = 0;
    void __user *argp = (void __user *)arg;

    u8Cmd = _IOC_NR(cmd);
    TDE_CHECK_IOCTL_CMD(u8Cmd);
    HI_GFX_CHECK_LEFT_UNEQUAL_RIGHT_RETURN_VALUE(cmd, g_paTdeCtlFuncDispatchItem[u8Cmd].u32TdeCmd, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_paTdeCtlFuncDispatchItem[u8Cmd].tde_ctl_ptr_func, HI_FAILURE);

    return g_paTdeCtlFuncDispatchItem[u8Cmd].tde_ctl_ptr_func(argp,ffile);
}

STATIC HI_S32 TdeOsrBeginJob(unsigned long *argp,struct file *ffile)
{
    TDE_HANDLE Handle = -1;
    HI_S32 Ret = HI_FAILURE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    TDE_IOCTL_CHECK_PARA(argp);

    Ret = TdeOsiBeginJob(&Handle,(HI_VOID *)ffile);
    if (Ret < 0)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, TdeOsiBeginJob, Ret);
        return Ret;
    }

    if (copy_to_user(argp, &Handle, sizeof(TDE_HANDLE)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_S32 TdeOsrBitBlit(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stBackGround = {0};
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S *pstBackGround = NULL;
    TDE2_RECT_S *pstBackGroundRect = NULL;
    TDE2_SURFACE_S *pstForeGround = NULL;
    TDE2_RECT_S *pstForeGroundRect = NULL;
    TDE2_OPT_S *pstOpt = NULL;

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stBlitCmd), argp, sizeof(TDE_BITBLIT_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stBackGround, &unCmd.stBlitCmd.stBackGround);
    ConvertSurface(&stForeGround, &unCmd.stBlitCmd.stForeGround);
    ConvertSurface(&stDst, &unCmd.stBlitCmd.stDst);

    pstBackGround       = ((unCmd.stBlitCmd.u32NullIndicator >> 1) & 1) ? NULL : &stBackGround;
    pstBackGroundRect   = ((unCmd.stBlitCmd.u32NullIndicator >> 2) & 1) ? NULL : &unCmd.stBlitCmd.stBackGroundRect;
    pstForeGround       = ((unCmd.stBlitCmd.u32NullIndicator >> 3) & 1) ? NULL : &stForeGround;
    pstForeGroundRect   = ((unCmd.stBlitCmd.u32NullIndicator >> 4) & 1) ? NULL : &unCmd.stBlitCmd.stForeGroundRect;
    pstOpt              = ((unCmd.stBlitCmd.u32NullIndicator >> 7) & 1) ? NULL : &unCmd.stBlitCmd.stOpt;

    DRV_TDE_PrintSurfaceInfo(pstBackGround, NULL, pstBackGroundRect, NULL, NULL);
    DRV_TDE_PrintSurfaceInfo(pstForeGround, NULL, pstForeGroundRect, NULL, NULL);
    DRV_TDE_PrintSurfaceInfo(&stDst, NULL, &unCmd.stBlitCmd.stDstRect, pstOpt, NULL);

    Ret = TdeOsiBlit(unCmd.stBlitCmd.s32Handle,
                     pstBackGround, pstBackGroundRect,
                     pstForeGround, pstForeGroundRect,
                     &stDst, &unCmd.stBlitCmd.stDstRect,
                     pstOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrSolidDraw(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S *pstForeGround = NULL;
    TDE2_RECT_S *pstForeGroundRect = NULL;
    TDE2_FILLCOLOR_S *pstFillColor = NULL;
    TDE2_OPT_S *pstOpt = NULL;

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stDrawCmd), argp, sizeof(TDE_SOLIDDRAW_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stForeGround, &unCmd.stDrawCmd.stForeGround);
    ConvertSurface(&stDst, &unCmd.stDrawCmd.stDst);
    pstForeGround       = ((unCmd.stDrawCmd.u32NullIndicator >> 1) & 1) ? NULL : &stForeGround;
    pstForeGroundRect   = ((unCmd.stDrawCmd.u32NullIndicator >> 2) & 1) ? NULL : &unCmd.stDrawCmd.stForeGroundRect;
    pstFillColor        = ((unCmd.stDrawCmd.u32NullIndicator >> 5) & 1) ? NULL : &unCmd.stDrawCmd.stFillColor;
    pstOpt              = ((unCmd.stDrawCmd.u32NullIndicator >> 6) & 1) ? NULL : &unCmd.stDrawCmd.stOpt;

    DRV_TDE_PrintSurfaceInfo(pstForeGround, NULL, pstForeGroundRect, NULL, NULL);
    DRV_TDE_PrintSurfaceInfo(&stDst, NULL, &unCmd.stBlitCmd.stDstRect, pstOpt, NULL);

    Ret = TdeOsiSolidDraw(unCmd.stDrawCmd.s32Handle, pstForeGround, pstForeGroundRect,
                          &stDst, &unCmd.stDrawCmd.stDstRect, pstFillColor, pstOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrQuickCopy(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S stSrc = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stCopyCmd), argp, sizeof(TDE_QUICKCOPY_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stSrc, &unCmd.stCopyCmd.stSrc);
    ConvertSurface(&stDst, &unCmd.stCopyCmd.stDst);

    DRV_TDE_PrintSurfaceInfo(&stSrc, NULL, &unCmd.stCopyCmd.stSrcRect, NULL, NULL);
    DRV_TDE_PrintSurfaceInfo(&stDst, NULL, &unCmd.stBlitCmd.stDstRect, NULL, NULL);

    Ret = TdeOsiQuickCopy(unCmd.stCopyCmd.s32Handle, &stSrc, &unCmd.stCopyCmd.stSrcRect, &stDst,
                          &unCmd.stCopyCmd.stDstRect);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrQuickResize(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stSrc = {0};
    TDE2_SURFACE_S stDst = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stResizeCmd), argp, sizeof(TDE_QUICKRESIZE_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stSrc, &unCmd.stResizeCmd.stSrc);
    ConvertSurface(&stDst, &unCmd.stResizeCmd.stDst);

    Ret = TdeOsiQuickResize(unCmd.stResizeCmd.s32Handle,
                            &stSrc, &unCmd.stResizeCmd.stSrcRect,
                            &stDst, &unCmd.stResizeCmd.stDstRect);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}
STATIC HI_S32 TdeOsrQuickFill(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stDst = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stFillCmd), argp, sizeof(TDE_QUICKFILL_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stDst, &unCmd.stFillCmd.stDst);

    Ret  = TdeOsiQuickFill(unCmd.stFillCmd.s32Handle,
                           &stDst,
                           &unCmd.stFillCmd.stDstRect,
                           unCmd.stFillCmd.u32FillData);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrQuickDeflicker(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S stSrc = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stDeflickerCmd), argp, sizeof(TDE_QUICKDEFLICKER_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stSrc, &unCmd.stDeflickerCmd.stSrc);
    ConvertSurface(&stDst, &unCmd.stDeflickerCmd.stDst);

    Ret = TdeOsiQuickFlicker(unCmd.stDeflickerCmd.s32Handle,
                             &stSrc,
                             &unCmd.stDeflickerCmd.stSrcRect,
                             &stDst,
                             &unCmd.stDeflickerCmd.stDstRect);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrMbBitBlit(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stDst = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stMbBlitCmd), argp, sizeof(TDE_MBBITBLT_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stDst, &unCmd.stMbBlitCmd.stDst);

    DRV_TDE_PrintSurfaceInfo(NULL, &unCmd.stMbBlitCmd.stMB, &unCmd.stMbBlitCmd.stMbRect, NULL, &unCmd.stMbBlitCmd.stMbOpt);
    DRV_TDE_PrintSurfaceInfo(&stDst, NULL, &unCmd.stMbBlitCmd.stDstRect, NULL, NULL);

    Ret = TdeOsiMbBlit(unCmd.stMbBlitCmd.s32Handle,
                       &unCmd.stMbBlitCmd.stMB,
                       &unCmd.stMbBlitCmd.stMbRect,
                       &stDst,
                       &unCmd.stMbBlitCmd.stDstRect,
                       &unCmd.stMbBlitCmd.stMbOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrEndJob(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stEndCmd), argp, sizeof(TDE_ENDJOB_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiEndJob(unCmd.stEndCmd.s32Handle,
                       unCmd.stEndCmd.bBlock,
                       unCmd.stEndCmd.u32TimeOut,
                       unCmd.stEndCmd.bSync,
                       NULL, NULL);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrWaitForDone(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_HANDLE s32Handle = -1;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&s32Handle, argp, sizeof(TDE_HANDLE)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiWaitForDone(s32Handle, TDE_MAX_WAIT_TIMEOUT);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrCancelJob(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_HANDLE s32Handle = -1;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&s32Handle, argp, sizeof(TDE_HANDLE)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiCancelJob(s32Handle);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrBitMapMaskRop(unsigned long *argp, struct file *ffile)
{
#ifdef CONFIG_TDE_MASKROP_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stBackGround = {0};
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S stMask = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stMaskRopCmd), argp, sizeof(TDE_BITMAP_MASKROP_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stBackGround, &unCmd.stMaskRopCmd.stBackGround);
    ConvertSurface(&stForeGround, &unCmd.stMaskRopCmd.stForeGround);
    ConvertSurface(&stMask, &unCmd.stMaskRopCmd.stMask);
    ConvertSurface(&stDst, &unCmd.stMaskRopCmd.stDst);

    Ret = TdeOsiBitmapMaskRop(unCmd.stMaskRopCmd.s32Handle,
                               &stBackGround, &unCmd.stMaskRopCmd.stBackGroundRect,
                               &stForeGround, &unCmd.stMaskRopCmd.stForeGroundRect,
                               &stMask, &unCmd.stMaskRopCmd.stMaskRect,
                               &stDst, &unCmd.stMaskRopCmd.stDstRect,
                               unCmd.stMaskRopCmd.enRopCode_Color, unCmd.stMaskRopCmd.enRopCode_Alpha);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
#else
    HI_UNUSED(argp);
    HI_UNUSED(ffile);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "mask rop not support");
    return HI_FAILURE;
#endif
}

STATIC HI_S32 TdeOsrBitMapMaskBlend(unsigned long *argp,struct file *ffile)
{
#ifdef CONFIG_TDE_MASKBLEND_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stBackGround = {0};
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};
    TDE2_SURFACE_S stMask = {0};

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stMaskBlendCmd), argp, sizeof(TDE_BITMAP_MASKBLEND_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stBackGround, &unCmd.stMaskBlendCmd.stBackGround);
    ConvertSurface(&stForeGround, &unCmd.stMaskBlendCmd.stForeGround);
    ConvertSurface(&stMask, &unCmd.stMaskBlendCmd.stMask);
    ConvertSurface(&stDst, &unCmd.stMaskBlendCmd.stDst);

     Ret = TdeOsiBitmapMaskBlend(unCmd.stMaskBlendCmd.s32Handle,
                                 &stBackGround, &unCmd.stMaskBlendCmd.stBackGroundRect,
                                 &stForeGround, &unCmd.stMaskBlendCmd.stForeGroundRect,
                                 &stMask, &unCmd.stMaskBlendCmd.stMaskRect,
                                 &stDst, &unCmd.stMaskBlendCmd.stDstRect,
                                 unCmd.stMaskBlendCmd.u8Alpha,
                                 unCmd.stMaskBlendCmd.enBlendMode);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
#else
    HI_UNUSED(argp);
    HI_UNUSED(ffile);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "mask blend not support");
    return HI_FAILURE;
#endif
}

STATIC HI_S32 TdeOsrWaitAllDone(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(argp);
    HI_UNUSED(ffile);

    Ret = TdeOsiWaitAllDone(HI_FALSE);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrReset(unsigned long *argp,struct file *ffile)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(argp);
    HI_UNUSED(ffile);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_S32 TdeOsrSetDeflickerLevel(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_DEFLICKER_LEVEL_E eDeflickerLevel;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&eDeflickerLevel, argp, sizeof(TDE_DEFLICKER_LEVEL_E)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiSetDeflickerLevel(eDeflickerLevel);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrGetDeflickerLevel(unsigned long *argp,struct file *ffile)
{
    TDE_DEFLICKER_LEVEL_E eDeflickerLevel;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (TdeOsiGetDeflickerLevel(&eDeflickerLevel) != HI_SUCCESS)
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, eDeflickerLevel, FAILURE_TAG);
        return HI_FAILURE;
    }

    if (copy_to_user(argp, &eDeflickerLevel, sizeof(TDE_DEFLICKER_LEVEL_E)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_S32 TdeOsrSetAlphaThreshholdValue(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U8 u8ThresholdValue = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&u8ThresholdValue, argp, sizeof(HI_U8)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiSetAlphaThresholdValue(u8ThresholdValue);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrGetAlphaThreshholdValue(unsigned long *argp,struct file *ffile)
{
    HI_U8 u8ThresholdValue = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);
    TDE_IOCTL_CHECK_PARA(argp);


    if (TdeOsiGetAlphaThresholdValue(&u8ThresholdValue))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, TdeOsiGetAlphaThresholdValue, FAILURE_TAG);
        return HI_FAILURE;
    }

    if (copy_to_user(argp, &u8ThresholdValue, sizeof(HI_U8)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_S32 TdeOsrSetAlphaThreshholdState(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_BOOL bEnAlphaThreshold = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);
    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&bEnAlphaThreshold, argp, sizeof(HI_BOOL)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiSetAlphaThresholdState(bEnAlphaThreshold);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrGetAlphaThreshholdState(unsigned long *argp,struct file *ffile)
{
    HI_BOOL bEnAlphaThreshold = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);
    TDE_IOCTL_CHECK_PARA(argp);


    TdeOsiGetAlphaThresholdState(&bEnAlphaThreshold);

    if (copy_to_user(argp, &bEnAlphaThreshold, sizeof(HI_BOOL)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user, FAILURE_TAG);
        return -EFAULT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_S32 TdeOsrPatternFill(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S stBackGround = {0};
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};

    TDE2_RECT_S *pstBackGroundRect = NULL;
    TDE2_RECT_S *pstForeGroundRect = NULL;
    TDE2_RECT_S *pstDstRect = NULL;
    TDE2_PATTERN_FILL_OPT_S *pstOpt = NULL;
    TDE2_SURFACE_S *pstBackGround = NULL;
    TDE2_SURFACE_S *pstForeGround = NULL;
    TDE2_SURFACE_S *pstDst = NULL;

    TDE_IOCTL_CMD_U unCmd;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_GFX_Memset(&unCmd, 0 , sizeof(TDE_IOCTL_CMD_U));
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&(unCmd.stPatternCmd), argp, sizeof(TDE_PATTERN_FILL_CMD_S)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    ConvertSurface(&stBackGround, &unCmd.stPatternCmd.stBackGround);
    ConvertSurface(&stForeGround, &unCmd.stPatternCmd.stForeGround);
    ConvertSurface(&stDst, &unCmd.stPatternCmd.stDst);
    pstBackGround       = ((unCmd.stPatternCmd.u32NullIndicator >> 1) & 1) ? NULL : &stBackGround;
    pstBackGroundRect   = ((unCmd.stPatternCmd.u32NullIndicator >> 2) & 1) ? NULL : &unCmd.stPatternCmd.stBackGroundRect;
    pstForeGround       = ((unCmd.stPatternCmd.u32NullIndicator >> 3) & 1) ? NULL : &stForeGround;
    pstForeGroundRect   = ((unCmd.stPatternCmd.u32NullIndicator >> 4) & 1) ? NULL : &unCmd.stPatternCmd.stForeGroundRect;
    pstDst              = ((unCmd.stPatternCmd.u32NullIndicator >> 5) & 1) ? NULL : &stDst;
    pstDstRect          = ((unCmd.stPatternCmd.u32NullIndicator >> 6) & 1) ? NULL : &unCmd.stPatternCmd.stDstRect;
    pstOpt              = ((unCmd.stPatternCmd.u32NullIndicator >> 7) & 1) ? NULL : &unCmd.stPatternCmd.stOpt;

    Ret = TdeOsiPatternFill(unCmd.stPatternCmd.s32Handle, pstBackGround,
                            pstBackGroundRect, pstForeGround, pstForeGroundRect,
                            pstDst, pstDstRect, pstOpt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}

STATIC HI_S32 TdeOsrEnableRegionDeflicker(unsigned long *argp,struct file *ffile)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_BOOL bRegionDeflicker = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(ffile);

    TDE_IOCTL_CHECK_PARA(argp);


    if (copy_from_user(&bRegionDeflicker, argp, sizeof(HI_BOOL)))
    {
        HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user, FAILURE_TAG);
        return -EFAULT;
    }

    Ret = TdeOsiEnableRegionDeflicker(bRegionDeflicker);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return Ret;
}


#ifdef TDE_COREDUMP_DEBUG
extern volatile HI_U32 *s_pu32BaseVirAddr = NULL;

#define TDE_READ_REG(base, offset) \
    (*(volatile unsigned int   *)((unsigned int)(base) + (offset)))
#endif

STATIC int tde_osr_isr(int irq, void *dev_id)
{
    HI_U32 int_status;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
#ifdef TDE_TIME_COUNT
    (HI_VOID)TDE_gettimeofday(&g_stTimeStart);
#endif
    int_status = TdeHalCtlIntStats();

    if (int_status & TDE_DRV_INT_ERROR)
    {
#ifdef TDE_COREDUMP_DEBUG
        HI_U32 u32ReadStats = 0;
        HI_U32 i;
        for (i = 0; i < 74; i++)
        {
            u32ReadStats = TDE_READ_REG(s_pu32BaseVirAddr, (0x800 + i * 4));
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, (0x800 + i * 4));
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, u32ReadStats);
        }
#endif

        U_PERI_CRG37 unTempValue;
        HI_U32 i;
        unTempValue.u32 = g_pstRegCrg->PERI_CRG37.u32;
        unTempValue.bits.tde_srst_req = 0x1;
        g_pstRegCrg->PERI_CRG37.u32 = unTempValue.u32;
        for (i = 0; i < 100; i++)
        {
            ;
        }
        unTempValue.bits.tde_srst_req = 0x0;
        g_pstRegCrg->PERI_CRG37.u32 = unTempValue.u32;

        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "tde interrupts coredump");
        TdeHalResumeInit();

        return IRQ_HANDLED;
    }
#ifdef TDE_HWC_COOPERATE
    if (int_status & TDE_DRV_INT_TIMEOUT)
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "tde hardware timeout");
        TdeHalResumeInit();
        return IRQ_HANDLED;
    }
#endif
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, int_status);

    tde_tasklet.data = tde_tasklet.data | ((HI_UL)int_status);

    tasklet_schedule(&tde_tasklet);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return IRQ_HANDLED;
}

STATIC void tde_tasklet_func(unsigned long int_status)
{
    HI_SIZE_T lockflags;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    TDE_LOCK(&s_taskletlock, lockflags);
    tde_tasklet.data &= (~int_status);
    TDE_UNLOCK(&s_taskletlock, lockflags);

#ifdef TDE_TIME_COUNT
    (HI_VOID)TDE_gettimeofday(&g_stTimeEnd);

    g_u64TimeDiff = (g_stTimeEnd.tv_sec - g_stTimeStart.tv_sec) * 1000000
                    + (g_stTimeEnd.tv_usec - g_stTimeStart.tv_usec);
#endif

#ifdef TDE_HWC_COOPERATE
    if (int_status & TDE_DRV_INT_NODE)
    {
        TdeOsiListNodeComp();
    }
    TdeOsiListComp();
#else
    if (int_status & TDE_DRV_INT_NODE)
    {
        TdeOsiListNodeComp();
    }
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
}

#ifdef CONFIG_TDE_PM_ENABLE
HI_S32 tde_suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(pdev);
    HI_UNUSED(state);


    TdeOsiWaitAllDone(HI_FALSE);

    TdeHalSuspend();

    HI_PRINT("tde suspend ok\n");

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_S32 tde_resume(PM_BASEDEV_S *pdev)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    HI_UNUSED(pdev);

    if (atomic_read(&g_TDECount) > 0)
    {
        TdeHalResumeInit();
    }

    HI_PRINT("tde resume ok\n");

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/*****************************************************************************
 Prototype       : TdeOsiOpen
 Description     : open TDE equipment
 Input           :
 Output          : None
 Return Value    :
*****************************************************************************/
HI_S32 TdeOsiOpen(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    Ret = tde_open(NULL, NULL);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return Ret;
}

/*****************************************************************************
 Prototype       : TdeOsiClose
 Description     : close TDE equipment
 Input           :
 Output          : None
 Return Value    :
*****************************************************************************/
HI_S32 TdeOsiClose(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);
    Ret = tde_release(NULL, NULL);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);
    return Ret;
}

EXPORT_SYMBOL(TdeOsiOpen);
EXPORT_SYMBOL(TdeOsiClose);
EXPORT_SYMBOL(tde_init_module_k);
EXPORT_SYMBOL(tde_cleanup_module_k);

#ifndef MODULE
EXPORT_SYMBOL(tde_suspend);
EXPORT_SYMBOL(tde_resume);
#endif
EXPORT_SYMBOL(tde_ioctl);
EXPORT_SYMBOL(tde_open);
EXPORT_SYMBOL(tde_release);
