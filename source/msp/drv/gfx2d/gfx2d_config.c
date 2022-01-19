/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name        : gfx2d_config.c
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
#include "gfx2d_config.h"
#include "hi_gfx_comm_k.h"
#include "gfx2d_debug.h"


/***************************** Macro Definition **************************************************/
/** the node size is equal to register size that from 0x0 to TDE_INTMASK **/
#if (HWC_VERSION) >= 0x500
#define GFX2D_CONFIG_NODE_SIZE     (1536)
#else
#define GFX2D_CONFIG_NODE_SIZE     (1024)
#endif

#define GFX2D_CONFIG_MAX_MEMSIZE   (0x100000)

/** maybe not need 60, async: 3buffer need 3, sync: need 1**/
/** 分配60个节点内存 **/
#ifdef CFG_HI_GFX2D_MEM_SIZE
    #if (CFG_HI_GFX2D_MEM_SIZE) <= 0x0 || (CFG_HI_GFX2D_MEM_SIZE) >= (GFX2D_CONFIG_MAX_MEMSIZE)
        #define GFX2D_CONFIG_DEFAULT_MEMSIZE  (60 * (GFX2D_CONFIG_NODE_SIZE))
    #else
        #define GFX2D_CONFIG_DEFAULT_MEMSIZE  (CFG_HI_GFX2D_MEM_SIZE)
    #endif
#else
    #define GFX2D_CONFIG_DEFAULT_MEMSIZE      (60 * (GFX2D_CONFIG_NODE_SIZE))
#endif

/*************************** Structure Definition ************************************************/


/********************** Global Variable declaration **********************************************/
static HI_U32 gs_u32MemSize = (GFX2D_CONFIG_DEFAULT_MEMSIZE);

#ifndef GFX2D_PROC_UNSUPPORT
static HI_U32 gs_u32StartTimeMs = 0;
static HI_U32 gs_u32StartTimeUs = 0;
static HI_U32 gs_u32EndTimeMs = 0;
static HI_U32 gs_u32EndTimeUs = 0;
#endif

/******************************* API forward declarations ****************************************/

/******************************* API realization *************************************************/
/*****************************************************************************
 * func         : GFX2D_CONFIG_SetMemSize
 * description  : calc node memsize
                  1. first, use insmod memsize
                  2. second, use make menuconfig memsize
                  3. third, use default size.
                  CNcomment: 计算节点内存大小 CNend\n
 * param[in]    : u32MemSize  CNcomment: 内存大小 CNend\n
                  Mem size(KByte)
 * retval       : NA
 * others:      : NA
 *****************************************************************************/
HI_S32 GFX2D_CONFIG_SetMemSize(HI_U32 u32MemSize)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (0 == u32MemSize)
    {
        gs_u32MemSize = (GFX2D_CONFIG_DEFAULT_MEMSIZE);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_u32MemSize);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (u32MemSize < (GFX2D_CONFIG_NODE_SIZE))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, GFX2D_CONFIG_NODE_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32MemSize);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "Mem not enough to work");
        return HI_FAILURE;
    }
    else if (u32MemSize > (GFX2D_CONFIG_MAX_MEMSIZE))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, GFX2D_CONFIG_MAX_MEMSIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32MemSize);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "No enough mem!");
        return HI_FAILURE;
    }
    else
    {
        gs_u32MemSize = u32MemSize;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_u32MemSize);
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32MemSize);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_U32 GFX2D_CONFIG_GetMemSize(HI_VOID)
{
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_u32MemSize);
    return gs_u32MemSize;
}


HI_U32 GFX2D_CONFIG_GetNodeNum(HI_VOID)
{
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, gs_u32MemSize);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, GFX2D_CONFIG_NODE_SIZE);
    return gs_u32MemSize / (GFX2D_CONFIG_NODE_SIZE);
}

#ifndef GFX2D_PROC_UNSUPPORT
HI_VOID GFX2D_CONFIG_StartTime(HI_VOID)
{
    HI_GFX_GetTimeStamp(&gs_u32StartTimeMs, &gs_u32StartTimeUs);
}

HI_U32 GFX2D_CONFIG_EndTime(HI_VOID)
{
    HI_U32 Times = 0;

    HI_GFX_GetTimeStamp(&gs_u32EndTimeMs, &gs_u32EndTimeUs);
    if (gs_u32EndTimeMs < gs_u32StartTimeMs)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return 0;
    }
    Times = (gs_u32EndTimeMs - gs_u32StartTimeMs) * 1000 + (gs_u32EndTimeUs - gs_u32StartTimeUs);

    return Times;
}
#endif
