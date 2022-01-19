/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name          : hi_gfx_mem.c
Version            : Initial Draft
Author             :
Created            : 2018/01/01
Description        : memory manage
                     CNcomment: 内存管理 CNend\n
Function List      :
History            :
Date                          Author                     Modification
2018/01/01                    sdk                        Created file
************************************************************************************************/


/*********************************add include here**********************************************/
#include "hi_gfx_mem.h"
#include "hi_gfx_comm.h"
#include "hi_gfx_debug.h"

#include "hi_common.h"
#include "hi_drv_pdm.h"
/***************************** Macro Definition ************************************************/

#define CONFIG_GFX_RESERVE_SIZE               10
//#define CONFIG_MEM_DEBUG

/*************************** Structure Definition **********************************************/

/********************** Global Variable declaration ********************************************/
static HI_CHAR gs_CmpData[CONFIG_GFX_RESERVE_SIZE] = {0x0,0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9};
extern HI_U32 log_debug;

/**********************       API realization       ********************************************/
/*****************************************************************************
* func         : BOOT_GFX_RESERVE_Alloc
* description  : 分配保留内存
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_CHAR* BOOT_GFX_RESERVE_Alloc(HI_U32 u32Size,HI_CHAR* pModuleName)
{
    HI_S32 Cnt = 0;
    HI_CHAR* TmpBuf = NULL;
    HI_S32 Ret = HI_SUCCESS;
    MMZ_BUFFER_S stMBuf;
    HI_UNUSED(TmpBuf);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (0 == u32Size)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Size);
        return NULL;
    }
    HI_GFX_Memset(&stMBuf,0x0,sizeof(stMBuf));

    Ret = HI_DRV_PDM_AllocReserveMem(pModuleName, (u32Size + CONFIG_GFX_RESERVE_SIZE), &stMBuf.u32StartPhyAddr);
    if ((HI_SUCCESS != Ret) || (0 == stMBuf.u32StartPhyAddr))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Size);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "CONFIG_GFX_RESERVE_SIZE = 10");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_PDM_AllocReserveMem, Ret);
        return NULL;
    }

    HI_GFX_Memcpy((HI_CHAR*)stMBuf.u32StartPhyAddr,gs_CmpData,CONFIG_GFX_RESERVE_SIZE);
    HI_GFX_Memcpy((HI_CHAR*)(stMBuf.u32StartPhyAddr + u32Size),gs_CmpData,CONFIG_GFX_RESERVE_SIZE);

    if (HI_GFX_DEBUG_LEVEL_4 == log_debug)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "i am here");
        TmpBuf = (HI_CHAR*)stMBuf.u32StartPhyAddr;
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("initial first 10bytes data\n");
        for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
        {
            HI_GFX_Print("0x%x ",TmpBuf[Cnt]);
        }
        HI_GFX_Print("\n+++++++++++++++++++++++++++++++++++++++++++++\n");

        TmpBuf = (HI_CHAR*)(stMBuf.u32StartPhyAddr + u32Size);
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("initial last 10bytes data\n");
        for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
        {
            HI_GFX_Print("0x%x ",TmpBuf[Cnt]);
        }
        HI_GFX_Print("\n+++++++++++++++++++++++++++++++++++++++++++++\n");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return (HI_CHAR*)stMBuf.u32StartPhyAddr;
}

/*****************************************************************************
* func         : BOOT_GFX_MMZ_Alloc
* description  : 分配连续的物理地址，boot下连续地址也可以做虚拟地址，可直接读写
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_CHAR* BOOT_GFX_MMZ_Alloc(HI_U32 u32Size)
{
    HI_S32 Cnt = 0;
    HI_CHAR* TmpBuf = NULL;
    HI_S32 s32Ret = HI_SUCCESS;
    MMZ_BUFFER_S stMBuf;
    HI_UNUSED(TmpBuf);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (0 == u32Size)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Size);
        return NULL;
    }
    HI_GFX_Memset(&stMBuf,0x0,sizeof(stMBuf));

    s32Ret = HI_MEM_Alloc(&stMBuf.u32StartPhyAddr, (u32Size + CONFIG_GFX_RESERVE_SIZE));
    if ((HI_SUCCESS != s32Ret) || (0 == stMBuf.u32StartPhyAddr))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Size);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "CONFIG_GFX_RESERVE_SIZE = 10");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_MEM_Alloc, s32Ret);
        return NULL;
    }

    HI_GFX_Memcpy((HI_CHAR*)stMBuf.u32StartPhyAddr,gs_CmpData,CONFIG_GFX_RESERVE_SIZE);
    HI_GFX_Memcpy((HI_CHAR*)(stMBuf.u32StartPhyAddr + u32Size),gs_CmpData,CONFIG_GFX_RESERVE_SIZE);

    if (HI_GFX_DEBUG_LEVEL_4 == log_debug)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "i am here");
        TmpBuf = (HI_CHAR*)stMBuf.u32StartPhyAddr;
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("initial first 10bytes data\n");
        for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
        {
            HI_GFX_Print("0x%x ",TmpBuf[Cnt]);
        }
        HI_GFX_Print("\n+++++++++++++++++++++++++++++++++++++++++++++\n");

        TmpBuf = (HI_CHAR*)(stMBuf.u32StartPhyAddr + u32Size);
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("initial last 10bytes data\n");
        for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
        {
            HI_GFX_Print("0x%x ",TmpBuf[Cnt]);
        }
        HI_GFX_Print("\n+++++++++++++++++++++++++++++++++++++++++++++\n");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return (HI_CHAR*)stMBuf.u32StartPhyAddr;
}


/*****************************************************************************
* func         : BOOT_GFX_MMZ_Free
* description  : 释放地址
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_VOID BOOT_GFX_MMZ_Free(HI_CHAR* pPhyAddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (NULL != pPhyAddr)
    {
       HI_MEM_Free((HI_VOID*)pPhyAddr);
       pPhyAddr = NULL;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/*****************************************************************************
* func         : BOOT_GFX_Malloc
* description  : 使用malloc分配内存，使用完释放给其它功能使用,小内存
                 使用该接口比如handle等，减少内存碎片
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_CHAR* BOOT_GFX_Malloc(HI_U32 u32Size)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (0 == u32Size)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, u32Size);
        return NULL;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return (HI_CHAR*)malloc(u32Size);
}

/*****************************************************************************
* func         : BOOT_GFX_Free
* description  : 释放地址
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_VOID BOOT_GFX_Free(HI_CHAR* pVirAddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (NULL != pVirAddr)
    {
        free(pVirAddr);
        pVirAddr = NULL;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/*****************************************************************************
* func         : BOOT_GFX_Memcmp
* description  : 地址内容校验，这里的地址必须是本模块分配的，约定俗成的，会多分配
                 10个字节作为是否内存越界校验
* retval       : HI_SUCCESS
* retval       : HI_FAILURE
*****************************************************************************/
HI_VOID BOOT_GFX_Memcmp(HI_CHAR* pPhyAddr, HI_U32 Size)
{
    HI_S32 Cnt = 0;
    HI_CHAR* TmpBuf = NULL;
    HI_BOOL MemOk = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pPhyAddr);

    if ((0 == Size) || (Size <= CONFIG_GFX_RESERVE_SIZE))
    {
        HI_GFX_Print("%s[%d] : Size = %d\n",__FUNCTION__,__LINE__,Size);
        HI_GFX_Print("%s[%d] : CONFIG_GFX_RESERVE_SIZE = %d\n",__FUNCTION__,__LINE__,CONFIG_GFX_RESERVE_SIZE);
        return;
    }

    TmpBuf = pPhyAddr;
    for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
    {
       if (TmpBuf[Cnt] != gs_CmpData[Cnt])
       {
           MemOk = HI_TRUE;
           break;
       }
    }

    if (HI_FALSE == MemOk)
    {
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("the memory has not been used\n");
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
    }

    MemOk = HI_FALSE;
    TmpBuf = pPhyAddr + Size;
    for (Cnt = 0; Cnt < CONFIG_GFX_RESERVE_SIZE; Cnt++)
    {
       if (TmpBuf[Cnt] != gs_CmpData[Cnt])
       {
           MemOk = HI_TRUE;
           break;
       }
    }

    if (HI_TRUE == MemOk)
    {
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
        HI_GFX_Print("the memory be write wrong data\n");
        HI_GFX_Print("+++++++++++++++++++++++++++++++++++++++++++++\n");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return;
}

/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
HI_VOID HI_GFX_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize)
{
    if ((NULL != pDst) && (0 != DstSize)) { memset(pDst, InitValue, DstSize); }
    return;
}

HI_VOID HI_GFX_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize)
{
    if ((NULL != pDst) && (NULL != pSrc) && (0 != SrcSize)) { memcpy(pDst, pSrc, SrcSize); }
    return;
}
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/
