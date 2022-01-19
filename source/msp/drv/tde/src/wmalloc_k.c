/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : wmalloc_k.c
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
#include "tde_define.h"
#include "wmalloc.h"

#ifdef HI_BUILD_IN_BOOT
#include "hi_gfx_comm.h"
#include "hi_gfx_debug.h"
#else
#include "tde_hal.h"
#include "tde_debug.h"
#endif
/***************************** Macro Definition ********************************************/


/*************************** Enum Definition ***********************************************/

/*************************** Structure Definition ******************************************/
typedef struct _MemoryBlock
{
    HI_U32          nSize;
    HI_U16          nFree;
    HI_U16          nFirst;
    HI_U16          nUnitSize;
#if HI_TDE_MEMCOUNT_SUPPORT
    HI_U16          nMaxUsed;           /* Max used unit number */
    HI_U16          nMaxNum;            /* Max unit number      */
#endif
    HI_VOID         *pStartAddr;
    struct _MemoryBlock    *pNext;
}MemoryBlock;

typedef enum
{
    UNIT_SIZE_CMD = 0,
    UNIT_SIZE_JOB,
    UNIT_SIZE_NODE,
    UNIT_SIZE_FILTER,
    UNIT_SIZE_BUTT
}UNIT_SIZE_E;

/********************** Global Variable declaration ****************************************/

STATIC MemoryBlock g_struMemBlock[UNIT_SIZE_BUTT];

#ifndef HI_BUILD_IN_BOOT
STATIC spinlock_t s_MemLock;
#endif

/******************************* API declaration *******************************************/

/******************************* API release     *******************************************/

/***************************************************************************************
* func          : MemoryBlockInit
* description   : mem block init
                  CNcomment: CNend\n
* param[in]     :
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
***************************************************************************************/
static HI_S32 MemoryBlockInit(UNIT_SIZE_E eUnitSize, HI_U32 nUnitNum, HI_VOID *pAddr)
{
    HI_U16 i = 0;
    HI_VOID *pData = pAddr;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pAddr, HI_FAILURE);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, nUnitNum, HI_FAILURE);

    if (UNIT_SIZE_CMD == eUnitSize)
    {
        g_struMemBlock[eUnitSize].nUnitSize = CMD_SIZE;
    }
    else if (UNIT_SIZE_JOB == eUnitSize)
    {
        g_struMemBlock[eUnitSize].nUnitSize = JOB_SIZE;
    }
    else if (UNIT_SIZE_NODE == eUnitSize)
    {
        g_struMemBlock[eUnitSize].nUnitSize = NODE_SIZE;
    }
    else if (UNIT_SIZE_FILTER == eUnitSize)
    {
        g_struMemBlock[eUnitSize].nUnitSize = FILTER_SIZE;
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, UNIT_SIZE_BUTT);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, eUnitSize);
        return HI_FAILURE;
    }

    for (i = 1; i < nUnitNum; i++)
    {
        /* Don't flag for last unit,for last unit is ready for assigned,
         * which is say no next unit can be assigned
         */
        *(HI_U16 *)pData = i;

        pData += g_struMemBlock[eUnitSize].nUnitSize;

    }

    g_struMemBlock[eUnitSize].nFirst = 0;
    g_struMemBlock[eUnitSize].nFree = nUnitNum;
    g_struMemBlock[eUnitSize].nSize = nUnitNum * g_struMemBlock[eUnitSize].nUnitSize;
    g_struMemBlock[eUnitSize].pNext = NULL;
    g_struMemBlock[eUnitSize].pStartAddr = pAddr;

#if HI_TDE_MEMCOUNT_SUPPORT
    g_struMemBlock[eUnitSize].nMaxNum = nUnitNum;
    g_struMemBlock[eUnitSize].nMaxUsed = 0;
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : mallocUnit
* description   : alloc from mem unit
                  CNcomment: CNend\n
* param[in]     :
* retval        : ddr
* others:       : NA
***************************************************************************************/
static HI_VOID *mallocUnit(UNIT_SIZE_E eUnitSize)
{
#ifndef HI_BUILD_IN_BOOT
    HI_SIZE_T lockflags = 0;
#endif
    MemoryBlock *pBlock = NULL;
    HI_U8 *pFree = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    TDE_LOCK(&s_MemLock, lockflags);

    pBlock = &g_struMemBlock[eUnitSize];

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nUnitSize);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFree);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFirst);

    if (!pBlock->nFree)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFree);
        TDE_UNLOCK(&s_MemLock, lockflags);
        return NULL;
    }

    pFree = pBlock->pStartAddr + pBlock->nFirst * pBlock->nUnitSize;
    pBlock->nFirst = *(HI_U16 *)pFree;
    pBlock->nFree--;

#if HI_TDE_MEMCOUNT_SUPPORT
    if ((g_struMemBlock[eUnitSize].nMaxNum - pBlock->nFree) > g_struMemBlock[eUnitSize].nMaxUsed)
    {
        g_struMemBlock[eUnitSize].nMaxUsed = g_struMemBlock[eUnitSize].nMaxNum - pBlock->nFree;
    }
#endif

    TDE_UNLOCK(&s_MemLock, lockflags);

    HI_GFX_Memset(pFree, 0, pBlock->nUnitSize);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return pFree;
}

/***************************************************************************************
* func          : wmalloc
* description   : alloc from mempool
                  CNcomment: CNend\n
* param[in]     :
* retval        : ddr
* others:       : NA
***************************************************************************************/
static HI_VOID *wmalloc(HI_SIZE_T size)
{
    UNIT_SIZE_E i = 0;
    HI_VOID *pMalloc = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, size, NULL);
    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(size, FILTER_SIZE, NULL);

    if (size <= CMD_SIZE)
    {
        for (i = UNIT_SIZE_CMD; i < UNIT_SIZE_BUTT; i++)
        {
            pMalloc = mallocUnit(i);
            if (NULL != pMalloc)
            {
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return pMalloc;
            }
        }
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CMD_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        return NULL;
    }
    else if (size <= JOB_SIZE)
    {
        for (i = UNIT_SIZE_JOB; i < UNIT_SIZE_BUTT; i++)
        {
            pMalloc = mallocUnit(i);
            if (NULL != pMalloc)
            {
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return pMalloc;
            }
        }
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, JOB_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        return NULL;
    }
    else if (size <= NODE_SIZE)
    {
        for (i = UNIT_SIZE_NODE; i < UNIT_SIZE_BUTT; i++)
        {
            pMalloc = mallocUnit(i);
            if (NULL != pMalloc)
            {
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return pMalloc;
            }
        }
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, NODE_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        return NULL;
    }
    else
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return mallocUnit(UNIT_SIZE_FILTER);
    }
}

static HI_S32 freeUnit(UNIT_SIZE_E eUnitSize, HI_VOID *ptr)
{
#ifndef HI_BUILD_IN_BOOT
    HI_SIZE_T lockflags = 0;
#endif
    MemoryBlock *pBlock = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    TDE_LOCK(&s_MemLock, lockflags);

    pBlock = &g_struMemBlock[eUnitSize];

    if ((ptr < pBlock->pStartAddr) || (ptr >= (pBlock->pStartAddr + pBlock->nSize)))
    {
        TDE_UNLOCK(&s_MemLock, lockflags);
        return HI_FAILURE;
    }

    pBlock->nFree++;
    *(HI_U16 *)ptr = pBlock->nFirst; /* point to next unit can be assigned */

    if (0 == pBlock->nUnitSize)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pBlock->nUnitSize);
        TDE_UNLOCK(&s_MemLock, lockflags);
        return HI_FAILURE;
    }

    pBlock->nFirst = (ptr - pBlock->pStartAddr) / pBlock->nUnitSize;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFree);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFree);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pBlock->nFree);

    TDE_UNLOCK(&s_MemLock, lockflags);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 wfree(HI_VOID *ptr)
{
    UNIT_SIZE_E i = UNIT_SIZE_CMD;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    for (i = UNIT_SIZE_CMD; i < UNIT_SIZE_BUTT; i++)
    {
        if (HI_SUCCESS == freeUnit(i, ptr))
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HI_SUCCESS;
        }
    }

    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, ptr);
    HI_GFX_OutMiniErrFuncMsg(HI_GFX_MSG_ERR_FUNC, freeUnit, FAILURE_TAG);
    return HI_FAILURE;
}

/***************************************************************************************
* func          : TDE_MALLOC
* description   : alloc from mempool
                  CNcomment: CNend\n
* param[in]     :
* retval        : ddr
* others:       : NA
***************************************************************************************/
HI_VOID *TDE_MALLOC(HI_U32 size)
{
    HI_VOID *ptr = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    ptr = (HI_VOID *)wmalloc(size);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return ptr;
}

HI_VOID TDE_FREE(HI_VOID *ptr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL != ptr)
    {
        wfree(ptr);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/************************all before is unrelated with tde, can be transplant to other modules ************************/

/************************ The follow is related with tde encapsulation******************************************/
#define TDE_MIN_BUFFER      ((FILTER_SIZE) * HI_TDE_FILTER_NUM + ((CMD_SIZE) + (NODE_SIZE) + (JOB_SIZE)) * 2)
#define TDE_MAX_BUFFER      1024 * 1024

STATIC HI_U32 g_u32MemPoolPhyAddr = 0;
STATIC HI_VOID *g_pMemPoolVrtAddr = NULL;
STATIC HI_U32 g_u32TdeBuf = 0;

#ifdef HI_BUILD_IN_BOOT
/** boot下内存优化 **/
#define HI_TDE_CMD_NUM      20
#define HI_TDE_JOB_NUM      1
#define HI_TDE_NODE_NUM     20
#else
#define HI_TDE_CMD_NUM      (((g_u32TdeBuf)  - (FILTER_SIZE) * HI_TDE_FILTER_NUM) / ((CMD_SIZE) + (NODE_SIZE) + (JOB_SIZE)))
#define HI_TDE_JOB_NUM      HI_TDE_CMD_NUM
#define HI_TDE_NODE_NUM     HI_TDE_CMD_NUM
#endif

#define TDE_CMD_OFFSET      0
#define TDE_JOB_OFFSET      ((HI_TDE_CMD_NUM) * CMD_SIZE)
#define TDE_NODE_OFFSET     (TDE_JOB_OFFSET + ((HI_TDE_JOB_NUM) * JOB_SIZE))
#define TDE_FILTER_OFFSET   (TDE_NODE_OFFSET + ((HI_TDE_NODE_NUM) * NODE_SIZE))
#define TDE_MEMPOOL_SIZE    ((HI_TDE_CMD_NUM) * CMD_SIZE + (HI_TDE_JOB_NUM) * JOB_SIZE + (HI_TDE_NODE_NUM) * NODE_SIZE +(HI_TDE_FILTER_NUM) * FILTER_SIZE)

#ifdef HI_BUILD_IN_BOOT
#if !defined(HI_TDE_BUFFER)
#define HI_TDE_BUFFER 0x20000
#endif
#endif

/***************************************************************************************
* func          : wmeminit
* description   : mem init
                  CNcomment: CNend\n
* param[in]     :
* retval        : HI_SUCCESS 成功
* retval        : HI_FAILURE 失败
* others:       : NA
***************************************************************************************/
HI_S32 wmeminit(void)
{
#ifndef HI_BUILD_IN_BOOT
    HI_BOOL bMmu = HI_FALSE;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (HI_TDE_BUFFER > TDE_MAX_BUFFER)
    {
        g_u32TdeBuf = TDE_MAX_BUFFER;
    }
    else if (HI_TDE_BUFFER < TDE_MIN_BUFFER)
    {
        g_u32TdeBuf = TDE_MIN_BUFFER;
    }
    else
    {
         g_u32TdeBuf = HI_TDE_BUFFER;
    }

#ifdef HI_BUILD_IN_BOOT

    g_u32MemPoolPhyAddr = (HI_U32)HI_GFX_MMZ_Malloc(TDE_MEMPOOL_SIZE, "TDE_MemPool");
    g_pMemPoolVrtAddr   = (HI_VOID *)(unsigned long)g_u32MemPoolPhyAddr;
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, g_u32MemPoolPhyAddr, HI_FAILURE);

#else

    g_u32MemPoolPhyAddr = HI_GFX_AllocMem("TDE_MemPool", NULL, TDE_MEMPOOL_SIZE, &bMmu);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, g_u32MemPoolPhyAddr, HI_FAILURE);

   #ifdef TDE_CACH_STRATEGY
    g_pMemPoolVrtAddr = HI_GFX_MapCached(g_u32MemPoolPhyAddr, TDE_MEMPOOL_SIZE, bMmu);
   #else
    g_pMemPoolVrtAddr = HI_GFX_Map(g_u32MemPoolPhyAddr, TDE_MEMPOOL_SIZE, bMmu);
   #endif
   if (NULL == g_pMemPoolVrtAddr)
   {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, g_pMemPoolVrtAddr);
       HI_GFX_FreeMem(g_u32MemPoolPhyAddr, bMmu);
       return HI_FAILURE;
   }

   spin_lock_init(&s_MemLock);
#endif

    MemoryBlockInit(UNIT_SIZE_CMD,    HI_TDE_CMD_NUM,    (g_pMemPoolVrtAddr));
    MemoryBlockInit(UNIT_SIZE_JOB,    HI_TDE_JOB_NUM,    (g_pMemPoolVrtAddr + TDE_JOB_OFFSET));
    MemoryBlockInit(UNIT_SIZE_NODE,   HI_TDE_NODE_NUM,   (g_pMemPoolVrtAddr + TDE_NODE_OFFSET));
    MemoryBlockInit(UNIT_SIZE_FILTER, HI_TDE_FILTER_NUM, (g_pMemPoolVrtAddr + TDE_FILTER_OFFSET));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID wmemterm(void)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#ifndef HI_BUILD_IN_BOOT
    if (NULL != g_pMemPoolVrtAddr)
    {
       HI_GFX_Unmap (g_pMemPoolVrtAddr, HI_FALSE);
    }

    if (0 != g_u32MemPoolPhyAddr)
    {
       HI_GFX_FreeMem( g_u32MemPoolPhyAddr, HI_FALSE);
    }
#endif

    g_u32MemPoolPhyAddr = 0;
    g_pMemPoolVrtAddr   = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_U32 wgetphy(HI_VOID *ptr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if ((NULL == ptr) || (ptr < g_pMemPoolVrtAddr) || (ptr >= (g_pMemPoolVrtAddr + TDE_MEMPOOL_SIZE)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, ptr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, TDE_MEMPOOL_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, g_pMemPoolVrtAddr);
        return 0;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return (g_u32MemPoolPhyAddr + (ptr - g_pMemPoolVrtAddr));
}

HI_VOID *wgetvrt(HI_U32 phyaddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if ((phyaddr < g_u32MemPoolPhyAddr) || (phyaddr >= (g_u32MemPoolPhyAddr + TDE_MEMPOOL_SIZE)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, TDE_MEMPOOL_SIZE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, phyaddr);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, g_u32MemPoolPhyAddr);
        return NULL;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return (HI_VOID *)(g_pMemPoolVrtAddr + (phyaddr - g_u32MemPoolPhyAddr));
}

HI_U32 wgetfreenum(HI_VOID)
{
    UNIT_SIZE_E eUnitSize = 0;
    HI_U32 u32FreeUnitNum = g_struMemBlock[eUnitSize].nFree;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    for (eUnitSize = UNIT_SIZE_CMD; eUnitSize < UNIT_SIZE_FILTER; eUnitSize++)
    {
        u32FreeUnitNum = (u32FreeUnitNum > g_struMemBlock[eUnitSize].nFree) ? g_struMemBlock[eUnitSize].nFree : u32FreeUnitNum;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return u32FreeUnitNum;
}

#ifndef HI_BUILD_IN_BOOT

#ifdef CONFIG_GFX_PROC_SUPPORT
struct seq_file *wprintinfo(struct seq_file *page)
{
#if HI_TDE_MEMCOUNT_SUPPORT
    HI_U32 u32MaxUsedCmd    = g_struMemBlock[UNIT_SIZE_CMD].nMaxUsed;
    HI_U32 u32MaxUsedJob    = g_struMemBlock[UNIT_SIZE_JOB].nMaxUsed;
    HI_U32 u32MaxUsedNode   = g_struMemBlock[UNIT_SIZE_NODE].nMaxUsed;
    HI_U32 u32MaxUsedFilter = g_struMemBlock[UNIT_SIZE_FILTER].nMaxUsed;
#else
    HI_U32 u32FreeCmd     = g_struMemBlock[UNIT_SIZE_CMD].nFree;
    HI_U32 u32FreeJob     = g_struMemBlock[UNIT_SIZE_JOB].nFree;
    HI_U32 u32FreeNode    = g_struMemBlock[UNIT_SIZE_NODE].nFree;
    HI_U32 u32FreeFilter  = g_struMemBlock[UNIT_SIZE_FILTER].nFree;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
#ifndef CONFIG_TDE_STR_DISABLE
    if (NULL != page)
    {
        PROC_PRINT(page, "------------------------------- Hisilicon TDE Memory Pool Info -------------------------------\n");
        #if HI_TDE_MEMCOUNT_SUPPORT
        PROC_PRINT(page, "     Type         Total       MaxUsed\n");
        PROC_PRINT(page, "[Unit %d   ]   %8u  %8u\n",  CMD_SIZE,                HI_TDE_CMD_NUM,         u32MaxUsedCmd);
        PROC_PRINT(page, "[Unit %d   ]   %8u  %8u\n",  JOB_SIZE,                HI_TDE_JOB_NUM,         u32MaxUsedJob);
        PROC_PRINT(page, "[Unit %d ]  %8u  %8u\n",     NODE_SIZE,               HI_TDE_NODE_NUM,        u32MaxUsedJob);
        PROC_PRINT(page, "[Unit %d ]  %8u  %8u\n",     FILTER_SIZE,             HI_TDE_FILTER_NUM,      u32MaxUsedFilter);
        PROC_PRINT(page, "[Total     ]   %8uK %8uK\n", TDE_MEMPOOL_SIZE / 1024, (CMD_SIZE * u32MaxUsedCmd + JOB_SIZE * u32MaxUsedJob + NODE_SIZE * u32MaxUsedNode + FILTER_SIZE * u32MaxUsedFilter) / 1024);
        #else
        PROC_PRINT(page, "     Type         Total       Used\n");
        PROC_PRINT(page, "[Unit %d   ]   %8u  %8u\n",  CMD_SIZE,                HI_TDE_CMD_NUM,          HI_TDE_CMD_NUM - u32FreeCmd);
        PROC_PRINT(page, "[Unit %d   ]   %8u  %8u\n",  JOB_SIZE,                HI_TDE_JOB_NUM,          HI_TDE_JOB_NUM - u32FreeJob);
        PROC_PRINT(page, "[Unit %d ]   %8u  %8u\n",    NODE_SIZE,               HI_TDE_NODE_NUM,         HI_TDE_NODE_NUM - u32FreeNode);
        PROC_PRINT(page, "[Unit %d ]   %8u  %8u\n",    FILTER_SIZE,             HI_TDE_FILTER_NUM,       HI_TDE_FILTER_NUM - u32FreeFilter);
        PROC_PRINT(page, "[Total     ]   %8uK %8uK\n", TDE_MEMPOOL_SIZE / 1024, (TDE_MEMPOOL_SIZE - (CMD_SIZE * u32FreeCmd + JOB_SIZE * u32FreeJob + NODE_SIZE * u32FreeNode + FILTER_SIZE * u32FreeFilter)) / 1024);
        #endif
    }
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return page;
}
#endif

#endif
