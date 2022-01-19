/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : gfx2d_osr.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :


History          :
Date                  Author                Modification
2018/01/01            sdk                   Created file
**************************************************************************************************/

/*********************************add include here************************************************/
#include <linux/module.h>
#include <linux/fs.h>
#include <asm/uaccess.h>

#include "hi_drv_dev.h"
#include "hi_gfx2d_type.h"
#include "hi_gfx_comm_k.h"
#include "gfx2d_ctl.h"
#include "drv_gfx2d_ioctl.h"
#include "gfx2d_config.h"
#include "gfx2d_hal.h"
#include "gfx2d_hal_hwc.h"
#include "hi_gfx2d_errcode.h"
#include "drv_gfx2d_ext.h"
#include "gfx2d_debug.h"
#include "drv_hifb_ext.h"

/***************************** Macro Definition **************************************************/
#define GFX2D_MODULENAME "hi_gfx2d"
#define GFX2D_UINT_MULTIPLY_OVERFLOW(a, b) (0 == a) ? 1 : (UINT_MAX / (a) < (b))

/*************************** Structure Definition ************************************************/

/********************** Global Variable declaration **********************************************/
static HI_U32 mem = 0;
#if 0
module_param(mem, uint, S_IRUGO);
#endif
/******************************* API forward declarations ****************************************/


/******************************* API realization *************************************************/
#ifndef GFX2D_PROC_UNSUPPORT
static HI_VOID GFX2D_PROC_Parse(HI_CHAR *pBuf, HI_U32 *pValue)
{
    HI_CHAR *pReadStr = HI_NULL;
    pReadStr = strstr(pBuf, "=");
    if ((NULL != pReadStr) && (NULL != pValue))
    {
       *pValue = simple_strtoul((pReadStr + 1), (char **)NULL, 0);
    }
    return;
}

HI_S32 GFX2D_OS_ReadProc(struct seq_file *p, HI_VOID *v)
{
    (HI_VOID)GFX2D_CTL_ReadProc(p, v);
    PROC_PRINT(p, "++++++++++++++++++++++++++++ debug msg ++++++++++++++++++++++++++++\n");
    HI_GFX_ProcMsg(p);
    PROC_PRINT(p, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n");
    return HI_SUCCESS;
}

HI_S32 GFX2D_OS_WriteProc(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
{
   HI_U32 LogLevel = 0;
   HI_U32 LogSave  = 0;
   HI_CHAR *pStr = HI_NULL;
   HI_CHAR TmpBuf[128] = {'\0'};
   HI_UNUSED(file);
   HI_UNUSED(ppos);

   if (NULL == buf)
   {
      return 0;
   }

   if (count > sizeof(TmpBuf))
   {
      return 0;
   }

   if (copy_from_user(TmpBuf, buf, count))
   {
      return 0;
   }
   TmpBuf[sizeof(TmpBuf) - 1] = '\0';

   if (strncmp("gfx_log_level", TmpBuf, 13) == 0)
   {
      GFX2D_PROC_Parse(TmpBuf,&LogLevel);
      HI_GFX_SetLogLevel(LogLevel);
      GFX2D_HAL_HWC_SetDebugLevel(LogLevel);
      return count;
   }

   if (strncmp("gfx_log_save", TmpBuf, 12) == 0)
   {
      GFX2D_PROC_Parse(TmpBuf,&LogSave);
      HI_GFX_SetLogSave(LogSave);
      return count;
   }

   if (strncmp("gfx_log_func", TmpBuf, 12) == 0)
   {
      pStr = strstr(TmpBuf, "=");
      HI_GFX_SetLogFunc(pStr);
      return count;
   }

   return count;
}
#endif

HI_S32 GFX2D_OS_Open(struct inode *finode, struct file *ffile)
{
    HI_UNUSED(finode);
    HI_UNUSED(ffile);
    return GFX2D_CTL_Open();
}

HI_S32 GFX2D_OS_Release(struct inode *finode, struct file *ffile)
{
    HI_UNUSED(finode);
    HI_UNUSED(ffile);
    return GFX2D_CTL_Close();
}

static HI_VOID GFX2D_OS_PrintInputMsg(GFX2D_COMPOSE_CMD_HAL_S *pstHalCompose, HI_U32 FenceFd, HI_BOOL InputMsg)
{
    HI_U32 Index = 0;
    HI_U32 PixCompnentCnt = 0;

    if (HI_FALSE == InputMsg)
    {
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->enDevId);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->bSync);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->u32Timeout);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->enType);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->enFmt);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->u32Width);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->u32Height);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->pstDst->u32Color);
       for (Index = 0; Index < HI_GFX_SURFACE_ADDR_CNT; Index++)
       {
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Index);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->pstDst->u32Phyaddr[Index]);
       }
       for (Index = 0; Index < HI_GFX_SURFACE_STRIDE_CNT; Index++)
       {
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Index);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->u32Stride[Index]);
       }
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->bPremulti);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->stCompressInfo.enCompressType);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->pstDst->u32HistogramPhyaddr);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->stAlphaExt.bExtAlpha);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->stAlphaExt.u8Alpha0);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->stAlphaExt.u8Alpha1);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->pstDst->u32PalettePhyaddr);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->s32AcquireFenceFd);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->s32ReleaseFenceFd);
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.u32ComposeCnt);
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->stComposeList.u32BgColor);
       for (Index = 0; Index < pstHalCompose->stComposeList.u32ComposeCnt; Index++)
       {
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Index);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stInRect.s32XPos);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stInRect.s32YPos);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stInRect.u32Width);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stInRect.u32Height);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOutRect.s32XPos);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOutRect.s32YPos);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOutRect.u32Width);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOutRect.u32Height);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stBlend.bCovBlend);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stBlend.bGlobalAlphaEnable);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stBlend.bPixelAlphaEnable);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stBlend.u8GlobalAlpha);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stResize.bResizeEnable);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stOpt.stResize.stFilter.enFilterMode);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.enType);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.enFmt);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32Width);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32Height);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32Color);
           for (PixCompnentCnt = 0; PixCompnentCnt < HI_GFX_SURFACE_ADDR_CNT; PixCompnentCnt++)
           {
               HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, PixCompnentCnt);
               HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32Phyaddr[PixCompnentCnt]);
           }
           for (PixCompnentCnt = 0; PixCompnentCnt < HI_GFX_SURFACE_STRIDE_CNT; PixCompnentCnt++)
           {
               HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, PixCompnentCnt);
               HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32Stride[PixCompnentCnt]);
           }
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.bPremulti);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.stCompressInfo.enCompressType);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32HistogramPhyaddr);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.stAlphaExt.bExtAlpha);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.stAlphaExt.u8Alpha0);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.stAlphaExt.u8Alpha1);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.u32PalettePhyaddr);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.s32AcquireFenceFd);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->stComposeList.pstCompose[Index].stSurface.s32ReleaseFenceFd);
       }
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    }

    if (HI_TRUE == InputMsg)
    {
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
       HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, FenceFd);
       for (Index = 0; Index < HI_GFX2D_MAX_ALPHASUM; Index++)
       {
            HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Index);
            HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstHalCompose->pstDst->ExtInfo.AlphaSum[Index]);
       }
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    }

    return;
}

long GFX2D_OS_Ioctl(struct file  *ffile, unsigned int cmd, unsigned long arg)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 OverFlow = HI_FALSE;
    HI_U32 StartTimes = 0, EndTimes = 0, RunTimes = 0;
    void __user *argp = (void __user *)arg;
    HI_GFX_TINIT();
    HI_UNUSED(ffile);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(argp,  HI_FAILURE);
    HI_GFX_TSTART(StartTimes);

    if (GFX2D_CTL_CheckOpen() == HI_FALSE)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX2D_CTL_CheckOpen,  FAILURE_TAG);
        return -EFAULT;
    }

    switch (cmd)
    {
        case GFX2D_COMPOSE:
        {
            HI_U32 u32Size = 0;
            GFX2D_COMPOSE_CMD_S stCompose;
            GFX2D_COMPOSE_CMD_HAL_S stHalCompose;
            HIFB_SETTING_INFO stHifbSettingInfo;
            HIFB_EXPORT_FUNC_S* pstHifbFuncs = NULL;

            HI_GFX_Memset(&stCompose,    0x0,   sizeof(GFX2D_COMPOSE_CMD_S));
            HI_GFX_Memset(&stHalCompose, 0x0,   sizeof(GFX2D_COMPOSE_CMD_HAL_S));
            HI_GFX_Memset(&stHifbSettingInfo, 0x0, sizeof(HIFB_SETTING_INFO));

            if (copy_from_user(&stCompose, argp, sizeof(GFX2D_COMPOSE_CMD_S)))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user,  FAILURE_TAG);
                return -EFAULT;
            }

            if (stCompose.enDevId >= HI_GFX2D_DEV_ID_BUTT)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCompose.enDevId);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HI_GFX2D_DEV_ID_BUTT);
                return HI_ERR_GFX2D_INVALID_DEVID;
            }

            if ((0 == stCompose.stComposeList.u32ComposeCnt) || (stCompose.stComposeList.u32ComposeCnt > 7))
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCompose.stComposeList.u32ComposeCnt);
                return HI_ERR_GFX2D_INVALID_COMPOSECNT;
            }

            OverFlow = GFX2D_UINT_MULTIPLY_OVERFLOW(stCompose.stComposeList.u32ComposeCnt, sizeof(HI_GFX2D_COMPOSE_S));
            if (OverFlow)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, OverFlow);
                return HI_ERR_GFX2D_INVALID_COMPOSECNT;
            }
            u32Size = sizeof(HI_GFX2D_COMPOSE_S) * stCompose.stComposeList.u32ComposeCnt;

            stHalCompose.stComposeList.pstCompose = HI_GFX_KMALLOC(HIGFX_GFX2D_ID, u32Size, GFP_KERNEL);
            if (NULL == stHalCompose.stComposeList.pstCompose)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Size);
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_KMALLOC,  HI_ERR_GFX2D_NO_MEM);
                return HI_ERR_GFX2D_NO_MEM;
            }

            stHalCompose.enDevId    = stCompose.enDevId;
            stHalCompose.pstDst     = &(stCompose.stDst);
            stHalCompose.bSync      = stCompose.bSync;
            stHalCompose.u32Timeout = stCompose.u32Timeout;

            if (0 == stCompose.stComposeList.u64Compose)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stCompose.stComposeList.u64Compose);
                HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);
                return -EFAULT;
            }

            if (copy_from_user(stHalCompose.stComposeList.pstCompose, (HI_VOID *)(unsigned long)(stCompose.stComposeList.u64Compose),u32Size))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user,  FAILURE_TAG);
                HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);
                return -EFAULT;
            }

            Ret = HI_DRV_MODULE_GetFunction(HI_ID_FB, (HI_VOID**)&pstHifbFuncs);
            if ( (HI_SUCCESS == Ret) && (NULL != pstHifbFuncs) && (NULL != pstHifbFuncs->pfnHifbGetSettingInfo))
            {
                pstHifbFuncs->pfnHifbGetSettingInfo(0, &stHifbSettingInfo);
            }

            if (((stHalCompose.pstDst->u32Phyaddr[0] <= stHifbSettingInfo.WillWorkAddress) && (stHifbSettingInfo.WillWorkAddress < stHalCompose.pstDst->u32Phyaddr[0] + stHifbSettingInfo.BufferSize)) ||
                ((stHalCompose.pstDst->u32Phyaddr[0] <= stHifbSettingInfo.WorkAddress)     && (stHifbSettingInfo.WorkAddress < stHalCompose.pstDst->u32Phyaddr[0] + stHifbSettingInfo.BufferSize)))
            {
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "========================================");
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.TimelineValue);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.FenceValue);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.FenceRefreshCount);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.RegUpdateCnt);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.DecompressState);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT,  stHalCompose.pstDst->u32Phyaddr[0]);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT,  stHifbSettingInfo.WillWorkAddress);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT,  stHifbSettingInfo.WorkAddress);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.LayerStride);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT,  stHifbSettingInfo.BufferSize);
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "========================================");
            }

            stHalCompose.stComposeList.u32ComposeCnt = stCompose.stComposeList.u32ComposeCnt;
            stHalCompose.stComposeList.u32BgColor    = stCompose.stComposeList.u32BgColor;

            GFX2D_OS_PrintInputMsg(&stHalCompose, stHalCompose.pstDst->s32ReleaseFenceFd, HI_FALSE);

            Ret = GFX2D_CTL_Compose(stHalCompose.enDevId, &stHalCompose.stComposeList, stHalCompose.pstDst, stHalCompose.bSync, stHalCompose.u32Timeout);
            if (HI_SUCCESS != Ret)
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX2D_CTL_Compose,  Ret);
                HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);
                return -EFAULT;
            }

            if (copy_to_user((HI_VOID *)(unsigned long)stCompose.stComposeList.u64Compose, stHalCompose.stComposeList.pstCompose, u32Size))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user,  FAILURE_TAG);
                HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);
                GFX2D_OS_PrintInputMsg(&stHalCompose, stHalCompose.pstDst->s32ReleaseFenceFd, HI_TRUE);
                return -EFAULT;
            }

            GFX2D_OS_PrintInputMsg(&stHalCompose, stHalCompose.pstDst->s32ReleaseFenceFd, HI_TRUE);

            stCompose.stDst.s32ReleaseFenceFd = stHalCompose.pstDst->s32ReleaseFenceFd;

            if (copy_to_user((HI_VOID *)argp, (HI_VOID *)&stCompose, sizeof(GFX2D_COMPOSE_CMD_S)))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_to_user,  FAILURE_TAG);
                HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);
                return -EFAULT;
            }

            HI_GFX_KFREE(HIGFX_GFX2D_ID, stHalCompose.stComposeList.pstCompose);

            HI_GFX_TSTART(EndTimes);
            RunTimes = EndTimes - StartTimes;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
            HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, RunTimes);
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return Ret;

        }
        case GFX2D_WAITALLDONE:
        {
            GFX2D_WAITALLDONE_CMD_S stWaitAllDone;

            if (copy_from_user(&stWaitAllDone, argp, sizeof(GFX2D_WAITALLDONE_CMD_S)))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, copy_from_user,  FAILURE_TAG);
                return -EFAULT;
            }

            if (stWaitAllDone.enDevId >= HI_GFX2D_DEV_ID_BUTT)
            {
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HI_GFX2D_DEV_ID_BUTT);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stWaitAllDone.enDevId);
                return HI_ERR_GFX2D_INVALID_DEVID;
            }

            Ret = GFX2D_CTL_WaitAllDone(stWaitAllDone.enDevId, stWaitAllDone.u32Timeout);

            HI_GFX_TSTART(EndTimes);
            RunTimes = EndTimes - StartTimes;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
            HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, RunTimes);
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return Ret;
        }

        default:
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, cmd);
            return -ENOIOCTLCMD;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_S32 GFX2D_OS_PmSuspend(PM_BASEDEV_S *pstDev, pm_message_t state)
{
    HI_UNUSED(pstDev);
    HI_UNUSED(state);

    (HI_VOID)GFX2D_CTL_WaitAllDone(HI_GFX2D_DEV_ID_0, 0);

    HI_GFX_Print("gfx2d suspend ok\n");
    return HI_SUCCESS;
}

HI_S32 GFX2D_OS_PmResume(PM_BASEDEV_S *pstDev)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_UNUSED(pstDev);

    s32Ret = GFX2D_CTL_Resume();

    HI_GFX_Print("gfx2d resume %s\n", (s32Ret == HI_SUCCESS) ? "OK":"NOK");
    return HI_SUCCESS;
}

DECLARE_GFX_NODE(GFX2D_MODULENAME, GFX2D_OS_Open,  GFX2D_OS_Release,   NULL, GFX2D_OS_Ioctl,\
                                   GFX2D_OS_Ioctl, GFX2D_OS_PmSuspend, GFX2D_OS_PmResume);

static GFX2D_EXPORT_FUNC_S s_Gfx2dExportFuncs =
{
    .pfnGfx2dModInit          = GFX2D_OS_ModInit,
    .pfnGfx2dModExit          = GFX2D_OS_ModExit,
    .pfnGfx2dSuspend          = GFX2D_OS_PmSuspend,
    .pfnGfx2dResume           = GFX2D_OS_PmResume,
};

static HI_VOID HI_GFX_ShowVersionK(HI_BOOL bLoad)
{
#if !defined(CONFIG_GFX_COMM_VERSION_DISABLE) && !defined(CONFIG_GFX_COMM_DEBUG_DISABLE) && defined(MODULE)
    if (HI_TRUE == bLoad)
    {
        HI_GFX_Print("Load hi_gfx2d.ko success.\t\t(%s)\n", VERSION_STRING);
    }
    else
    {
        HI_GFX_Print("UnLoad hi_gfx2d.ko success.\t(%s)\n", VERSION_STRING);
    }
#endif
}

static HI_VOID GFX2D_ShowCmd(HI_VOID)
{
#if 0
    HI_GFX_Print("0x%x   /**<-- GFX2D_COMPOSE                >**/\n",GFX2D_COMPOSE);
    HI_GFX_Print("0x%x   /**<-- GFX2D_WAITALLDONE            >**/\n",GFX2D_WAITALLDONE);
#endif
    return;
}

HI_S32 GFX2D_OS_ModInit(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
#ifndef GFX2D_PROC_UNSUPPORT
    GFX_PROC_ITEM_S stProcItem =
    {
        .fnRead  = GFX2D_OS_ReadProc,
        .fnWrite = GFX2D_OS_WriteProc,
        .fnIoctl = NULL,
    };
#endif

    s32Ret = HI_GFX_MODULE_Register(HIGFX_GFX2D_ID, "HI_GFX2D", &s_Gfx2dExportFuncs);
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_MODULE_Register, s32Ret);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "Register module failed");
        return HI_FAILURE;
    }

    s32Ret = GFX2D_CONFIG_SetMemSize(mem);
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX2D_CONFIG_SetMemSize, s32Ret);
        HI_GFX_MODULE_UnRegister(HIGFX_GFX2D_ID);
        return HI_FAILURE;
    }

    s32Ret = GFX2D_CTL_Init();
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX2D_CTL_Init, s32Ret);
        HI_GFX_MODULE_UnRegister(HIGFX_GFX2D_ID);
        return HI_FAILURE;
    }

    s32Ret = HI_GFX_PM_Register();
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_PM_Register, s32Ret);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "Register module failed");
        GFX2D_CTL_Deinit();
        HI_GFX_MODULE_UnRegister(HIGFX_GFX2D_ID);
        return HI_FAILURE;
    }

#ifndef GFX2D_PROC_UNSUPPORT
    HI_GFX_PROC_AddModule(GFX2D_MODULENAME, &stProcItem, NULL);
#endif

    HI_GFX_ShowVersionK(HI_TRUE);

    GFX2D_ShowCmd();

    return HI_SUCCESS;
}

HI_VOID GFX2D_OS_ModExit(HI_VOID)
{
#ifndef GFX2D_PROC_UNSUPPORT
    HI_GFX_PROC_RemoveModule(GFX2D_MODULENAME);
#endif

    (HI_VOID)HI_GFX_PM_UnRegister();

    GFX2D_CTL_Deinit();

    HI_GFX_MODULE_UnRegister(HIGFX_GFX2D_ID);

    HI_GFX_ShowVersionK(HI_FALSE);
    return;
}

#ifdef MODULE
module_init(GFX2D_OS_ModInit);
module_exit(GFX2D_OS_ModExit);
#endif

MODULE_AUTHOR("Digital Media Team, Hisilicon crop.");
MODULE_DESCRIPTION("Hisilicon GFX2D Device driver for 3716CV200");
MODULE_LICENSE("GPL");
MODULE_VERSION("V1.0.0.0");
