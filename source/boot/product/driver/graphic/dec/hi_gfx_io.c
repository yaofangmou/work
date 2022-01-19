/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name          : hi_gfx_io.c
Version            : Initial Draft
Author             :
Created            : 2018/01/01
Description        : 数据流操作
Function List      :
History            :
Date                           Author                     Modification
2018/01/01                     sdk                         Created file
**************************************************************************************************/
#include "hi_gfx_io.h"
#include "hi_gfx_comm.h"
#include "hi_gfx_debug.h"

#include "exports.h"

#ifdef HI_BUILD_IN_MINI_BOOT
#include "mmu.h"
#endif
/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/

/********************** Global Variable declaration **********************************************/

/******************************* API declaration **************************************************/


/***************************************************************************************
* func         : HI_GFX_IOCreate
* description  : CNcomment: 创建码流处理句柄 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 HI_GFX_IOCreate(HIGFX_IO_INSTANCE_S* const pstStream, HI_CHAR* pStremBuf, HI_U32 u32StreamLen)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstStream, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pStremBuf, HI_FAILURE);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_VALUE(u32StreamLen, HI_FAILURE);

    pstStream->pAddr = pStremBuf;
    pstStream->u32Length = u32StreamLen;
    pstStream->u32Position = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HI_GFX_IODestroy
* description  : CNcomment: 销毁码流处理句柄 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 HI_GFX_IODestroy(HIGFX_IO_INSTANCE_S* const pstStream)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstStream, HI_FAILURE);

    HI_GFX_Memset(pstStream,0,sizeof(HIGFX_IO_INSTANCE_S));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HI_GFX_IORead
* description : CNcomment: 读码流 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 HI_GFX_IORead(HIGFX_IO_INSTANCE_S* const pstStream, HI_VOID *pBuf, HI_U32 BufLen, HI_U32 *pCopyLen, HI_BOOL *pEndFlag)
{
    HI_U32 Length = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstStream, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pBuf, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pCopyLen, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pEndFlag, HI_FAILURE);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_VALUE(BufLen, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstStream->pAddr, HI_FAILURE);

    if (pstStream->u32Length < pstStream->u32Position)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstStream->u32Length);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstStream->u32Position);
        return HI_FAILURE;
    }

    Length = pstStream->u32Length - pstStream->u32Position;
    if (BufLen < Length)
    {
        *pCopyLen = BufLen;
    }
    else
    {
        *pCopyLen = Length;
    }

    if (0 == *pCopyLen)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pCopyLen);
        return HI_FAILURE;
    }

    #ifdef HI_BUILD_IN_MINI_BOOT
        mmu_cache_enable();
    #else
        dcache_enable(0);
    #endif

    HI_GFX_Memcpy(pBuf,(const HI_VOID*)(pstStream->pAddr + pstStream->u32Position), *pCopyLen);

    #ifdef HI_BUILD_IN_MINI_BOOT
        mmu_cache_disable();
    #else
        dcache_disable();
    #endif

    if (*pCopyLen < BufLen)
    {
        *pEndFlag = HI_TRUE;
    }
    else
    {
        *pEndFlag = HI_FALSE;
    }

    pstStream->u32Position += *pCopyLen;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HI_GFX_IOSeek
* description : CNcomment: 码流回退的位置 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 HI_GFX_IOSeek(HIGFX_IO_INSTANCE_S* const pstStream,HI_U32 Offset)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstStream, HI_FAILURE);

    if (Offset > pstStream->u32Length)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, Offset);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstStream->u32Length);
        return HI_FAILURE;
    }

    pstStream->u32Position = Offset;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
