/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : gfx2d_fence.c
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
#ifdef GFX2D_FENCE_SUPPORT
#include <linux/ctype.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/delay.h>
#include <linux/slab.h>
#include <linux/mm.h>
#include <linux/time.h>
#include <linux/fb.h>
#include <asm/uaccess.h>
#include <linux/file.h>
#include <asm/types.h>
#include <asm/stat.h>
#include <asm/fcntl.h>

#include "gfx2d_fence.h"
#include "gfx2d_debug.h"

#include "sw_sync.h"

#include "hi_gfx_comm_k.h"
/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/


/********************** Global Variable declaration **********************************************/

static HI_U32 gs_u32FenceValue = 0;
static HI_U32 gs_u32TimelineValue  = 0;
static struct sw_sync_timeline *gs_pstTimeline = NULL;

/******************************* API forward declarations ****************************************/

/******************************* API realization *************************************************/
HI_S32 GFX2D_FENCE_Open(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    gs_pstTimeline = sw_sync_timeline_create("gfx2d-sync");
#else
    gs_pstTimeline = hi_sw_sync_timeline_create("gfx2d-sync");
#endif
    if (NULL == gs_pstTimeline)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, gs_pstTimeline);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID GFX2D_FENCE_Close(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (NULL != gs_pstTimeline)
    {
      #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
         sync_timeline_destroy(&gs_pstTimeline->obj);
      #else
         hi_sync_timeline_destroy(&gs_pstTimeline->obj);
      #endif
    }

    gs_pstTimeline = NULL;
    gs_u32FenceValue = 0;
    gs_u32TimelineValue = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 GFX2D_FENCE_Create(const char *name)
{
    HI_S32 fd = -1;
    struct sync_pt *pt = NULL;
#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    struct sync_fence *fence = NULL;
#else
    struct sync_file *fence = NULL;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((NULL == gs_pstTimeline) || (NULL == name))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, gs_pstTimeline);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, name);
        return HI_FAILURE;
    }

    fd = get_unused_fd_flags(0);
    if (fd < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, get_unused_fd_flags,  FAILURE_TAG);
        return fd;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    pt = sw_sync_pt_create(gs_pstTimeline, ++gs_u32FenceValue);
#else
    pt = hi_sw_sync_pt_create(gs_pstTimeline, ++gs_u32FenceValue);
#endif
    if (NULL == pt)
    {
        gs_u32FenceValue--;
        put_unused_fd(fd);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hi_sw_sync_pt_create,  FAILURE_TAG);
        return -ENOMEM;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    fence = sync_fence_create(name, pt);
#else
    fence = sync_file_create(&pt->base);
#endif
    if (NULL == fence)
    {
      #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
        sync_pt_free(pt);
      #else
        hi_sync_pt_free(pt);
      #endif

        put_unused_fd(fd);

        gs_u32FenceValue--;

        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, sync_file_create,  FAILURE_TAG);

        return -ENOMEM;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    sync_fence_install(fence, fd);
#else
    fd_install(fd, fence->file);
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return fd;
}

HI_VOID GFX2D_FENCE_Destroy(HI_S32 fd)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (fd >= 0)
    {
       put_unused_fd(fd);
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

#define GFX2D_FENCE_TIMEOUT 3000

HI_S32 GFX2D_FENCE_Wait(HI_S32 fd)
{
    HI_S32 s32Ret = HI_SUCCESS;
#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    struct sync_fence *fence = NULL;
#else
    struct sync_file *fence = NULL;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (fd < 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, fd);
        return HI_FAILURE;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    fence = sync_fence_fdget(fd);
#else
    fence = sync_file_fdget(fd);
#endif
    if (NULL == fence)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, sync_file_fdget,  FAILURE_TAG);
        return HI_FAILURE;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    s32Ret = sync_fence_wait(fence, GFX2D_FENCE_TIMEOUT);
#else
    s32Ret = fence_wait_timeout(fence->fence, true, GFX2D_FENCE_TIMEOUT);
#endif
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, fence_wait_timeout, s32Ret);
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    sync_fence_put(fence);
#else
    fput(fence->file);
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return 0;
}

HI_S32 GFX2D_FENCE_WakeUp(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (NULL == gs_pstTimeline)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, gs_pstTimeline);
        return HI_FAILURE;
    }

#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0)
    sw_sync_timeline_inc(gs_pstTimeline, 1);
#else
    hi_sw_sync_timeline_inc(gs_pstTimeline, 1);
#endif

    gs_u32TimelineValue++;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_u32TimelineValue);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID GFX2D_FENCE_ReadProc(struct seq_file *p, HI_VOID *v)
{
    HI_UNUSED(v);
    if (NULL != p)
    {
        PROC_PRINT(p, "---------------------GFX2D Fence Info--------------------\n");
        PROC_PRINT(p, "FenceValue\t:%u\n", gs_u32FenceValue);
        PROC_PRINT(p, "TimeLineValue\t:%u\n", gs_u32TimelineValue);
    }

    return;
}

#endif
