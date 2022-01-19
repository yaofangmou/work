#include "vmm_osal.h"
#include "vmm_memory_common.h"
#include "vmm_memory_preserve.h"
#include "vmm_memlist_manager.h"
#include "vfmw_osal_proc.h"
#include "vmm_custom.h"

/**************************** struction definition  *****************************/
MEM_PRE_ALLOCATION_CTX g_PreMemCtx =
{
    .IsInit      = 0,
    .IsAvailable = 0,
};

#define MAX_TRAVERSAL_NUM   (100)

#define PREPARED_MEMORY_NAME "VDEC_PRE_MEM"
#define RESERVE_SIZE           (0)
#define ALIGN_UP(x,a)          (((x)+(a)-1)&~((a)-1))

/*************************** Internal interface **********************************/
VMM_PRIVATE SINT32 CheckMemInfo(VMM_BUFFER_S *pMemInfo)
{
    SINT32 ErrFlag = 0;

    ErrFlag |= (pMemInfo->Map > 1);
    ErrFlag |= (pMemInfo->Cache > 1);
    ErrFlag |= ((pMemInfo->StartPhyAddr == 0) || (pMemInfo->StartPhyAddr == 0xffffffff));
    ErrFlag |= (pMemInfo->Size == 0);
    ErrFlag |= (pMemInfo->MemType != VMM_MEM_TYPE_PRE_ALLOC);
    ErrFlag |= (pMemInfo->SecFlag != 0);

    if (pMemInfo->Map == 1)
    {
        ErrFlag |= ((pMemInfo->pStartVirAddr == 0) || (pMemInfo->pStartVirAddr == (-1)));
    }
    else
    {
        ErrFlag |= (pMemInfo->pStartVirAddr != 0);
    }

    if (pMemInfo->Cache == 1)
    {
        ErrFlag |= (pMemInfo->Map != 1);
    }

    if (ErrFlag)
    {
        PRINT(VMM_ERROR, "%s, %d, BufName = %s, Phyaddr = 0x%x, VirAddr = %llx, Size = %d, SecFlag = %d, Map = %d, Cache = %d MemType = %d\n",
              __func__, __LINE__, pMemInfo->BufName, pMemInfo->StartPhyAddr, pMemInfo->pStartVirAddr, pMemInfo->Size, pMemInfo->SecFlag,
              pMemInfo->Map, pMemInfo->Cache, pMemInfo->MemType);
    }

    return ErrFlag ? MEM_PRESERVE_INVALID_PARA : VMM_SUCCESS;
}

VMM_PRIVATE SINT32 CheckAllocParam(VMM_BUFFER_S *pMemInfo)
{
    SINT32 ErrFlag = 0;
    SINT32 WarningFlag = 0;

    ErrFlag |= (pMemInfo->Map > 1);
    ErrFlag |= (pMemInfo->Cache > 1);
    ErrFlag |= (pMemInfo->SecFlag > 1);
    ErrFlag |= (pMemInfo->Size == 0);
    //ErrFlag |= (pMemInfo->AlignSize == 0);
    //ErrFlag |= (pMemInfo->UnionNum == 0);
    ErrFlag |= (pMemInfo->MemType != VMM_MEM_TYPE_PRE_ALLOC);

    if (pMemInfo->Cache == 1)
    {
        ErrFlag |= (pMemInfo->Map != 1);
    }

    /*if (pMemInfo->UnionNum != 1)
    {
        WarningFlag |= (pMemInfo->Size >= pMemInfo->AlignSize);
    }*/

    if (ErrFlag)
    {
        PRINT(VMM_ERROR, "%s,%d,BufName = %s, Size = %d, AlignSize = %d, SecFlag = %d, Map = %d, Cache = %d MemType = %d\n",
              __func__,__LINE__,pMemInfo->BufName,pMemInfo->Size,pMemInfo->AlignSize,pMemInfo->SecFlag,
              pMemInfo->Map,pMemInfo->Cache,pMemInfo->MemType);
    }

    if (WarningFlag)
    {
        PRINT(VMM_DBG, "%s,%d,BufName = %s, Size = %d, AlignSize = %d, SecFlag = %d, Map = %d, Cache = %d MemType = %d\n",
              __func__,__LINE__,pMemInfo->BufName,pMemInfo->Size,pMemInfo->AlignSize,pMemInfo->SecFlag,
              pMemInfo->Map,pMemInfo->Cache,pMemInfo->MemType);
    }

    return ErrFlag ? MEM_PRESERVE_INVALID_PARA : VMM_SUCCESS;
}

VMM_PRIVATE SINT32 CheckPhyAddrVaild(UADDR PhyAddr)
{
    SINT32 Ret;
    VMM_BUFFER_S *pMemPool;

    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);

    pMemPool = &g_PreMemCtx.MemPool;

    if ((PhyAddr >= pMemPool->StartPhyAddr)
        && (PhyAddr <= (pMemPool->StartPhyAddr + pMemPool->Size)))
    {
        Ret = VMM_SUCCESS;
    }
    else
    {
        PRINT(VMM_ERROR, "%s,%d, Phyaddr 0x%x not in PreAlloc Memory(0x%x-0x%x)!\n",__func__,__LINE__,
              PhyAddr,pMemPool->StartPhyAddr,(pMemPool->StartPhyAddr + pMemPool->Size));
        Ret = MEM_PRESERVE_INVALID_PARA;
    }

    return Ret;
}

VMM_PRIVATE SINT32 CheckBufferOverflow(const VMM_BUFFER_S *pTargetBuf, const VMM_BUFFER_S *pCmpBuf)
{
    if ((pTargetBuf->StartPhyAddr + pTargetBuf->Size) > (pCmpBuf->StartPhyAddr + pCmpBuf->Size))
    {
        return VMM_TRUE;
    }

    return VMM_FALSE;
}

#if 0
VMM_PRIVATE SINT32 IsBufOverlap(const VMM_BUFFER_S *pBufA, const VMM_BUFFER_S *pBufB)
{
    SINT32 OverlapFlag = VMM_FALSE;

    if (pBufB->StartPhyAddr <= pBufA->StartPhyAddr)
    {
        if (pBufA->StartPhyAddr < (pBufB->StartPhyAddr + pBufB->Size))
        {
            OverlapFlag = VMM_TRUE;
        }
    }
    else
    {
        if (pBufB->StartPhyAddr < (pBufA->StartPhyAddr + pBufA->Size))
        {
            OverlapFlag = VMM_TRUE;
        }
    }

    return OverlapFlag;
}
#endif

VMM_PRIVATE SINT32 CheckBufferAlreadyUsed(VMM_BUFFER_S *pTargetBuf)
{
    Mem_Data_S MemDataTmp;
    UINT32 PhyAddrOffset = 0;

    OSAL_FP_memset(&MemDataTmp, 0, sizeof(Mem_Data_S));

    if ((VMM_Memlist_FindNodeByPhyaddr(pTargetBuf->StartPhyAddr, &MemDataTmp) == VMM_SUCCESS) && (MemDataTmp.Status == Node_Status_InUse))
    {
        PRINT(VMM_DBG, "%s,%d, try StartPhyAddr = 0x%x ===> inUse! match MemNode(Phyaddr = 0x%x Size = %d)\n",__func__,__LINE__,pTargetBuf->StartPhyAddr,MemDataTmp.BufInfo.StartPhyAddr,MemDataTmp.BufInfo.Size);

        PhyAddrOffset = pTargetBuf->StartPhyAddr - MemDataTmp.BufInfo.StartPhyAddr;

        /*Fix the StartPhyAddr for next memory block*/
        pTargetBuf->StartPhyAddr += (MemDataTmp.ActualSize - PhyAddrOffset);

        /*Since pTargetBuf->StartPhyAddr will add pTargetBuf->AlignSize in external for loop , Subtract pTargetBuf->AlignSize here*/
        pTargetBuf->StartPhyAddr -= pTargetBuf->AlignSize;

        return VMM_TRUE;
    }

    return VMM_FALSE;
}

VMM_PRIVATE VOID GetAvailableMemPool(VMM_BUFFER_S *pTargetBuf)
{
    OSAL_FP_memcpy(pTargetBuf, &g_PreMemCtx.MemPool, sizeof(VMM_BUFFER_S));

    if (g_PreMemCtx.ReservedBufValid)
    {
        if (g_PreMemCtx.ReservedBufInfo.StartPhyAddr == g_PreMemCtx.MemPool.StartPhyAddr)
        {
            pTargetBuf->StartPhyAddr = ALIGN_UP(g_PreMemCtx.MemPool.StartPhyAddr + g_PreMemCtx.ReservedBufInfo.Size + RESERVE_SIZE, 16);
            pTargetBuf->Size         = g_PreMemCtx.MemPool.Size - (pTargetBuf->StartPhyAddr - g_PreMemCtx.MemPool.StartPhyAddr);
            if (g_PreMemCtx.MemPool.pStartVirAddr)
            {
                pTargetBuf->pStartVirAddr = g_PreMemCtx.MemPool.pStartVirAddr + (pTargetBuf->StartPhyAddr - g_PreMemCtx.MemPool.StartPhyAddr);
            }
        }
        else
        {
            pTargetBuf->StartPhyAddr = g_PreMemCtx.MemPool.StartPhyAddr;
            pTargetBuf->Size         = g_PreMemCtx.MemPool.Size - g_PreMemCtx.ReservedBufInfo.Size;
            if (g_PreMemCtx.MemPool.pStartVirAddr)
            {
                pTargetBuf->pStartVirAddr = g_PreMemCtx.MemPool.pStartVirAddr;
            }
        }
    }

    PRINT(VMM_DBG, "%s,%d, return availableMemPool: Phyaddr = 0x%x, size = %d\n",__func__,__LINE__,pTargetBuf->StartPhyAddr,pTargetBuf->Size);

    return;
}

VMM_PRIVATE VOID Preserve_ConvertMemDataFirstTime(VMM_BUFFER_S *pBuferInfo, UINT32 TimeConsume, Mem_Data_S *pMemData)
{
    OSAL_FP_memset(pMemData, 0, sizeof(Mem_Data_S));

    pMemData->Status = Node_Status_InUse;
    pMemData->Location = VMM_LOCATION_INSIDE;
    pMemData->UseCnt = 1;
    pMemData->ActualSize = pBuferInfo->Size * pBuferInfo->UnionNum;

    OSAL_FP_memcpy(&pMemData->BufInfo, pBuferInfo, sizeof(VMM_BUFFER_S));

    pMemData->DbgInfo.AllocTimeConsumeInUs = TimeConsume;

    return;
}

VMM_PRIVATE SINT32 MemoryMap(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret;
    UINT32 Offset;

    Ret = CheckPhyAddrVaild(pMemInfo->StartPhyAddr);
    if (Ret != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s,%d, Phyaddr = 0x%x CheckPhyAddrVaild failed! ret = 0x%x\n",__func__,__LINE__,
            pMemInfo->StartPhyAddr,Ret);

        return Ret;
    }

    if (g_PreMemCtx.MemPool.Map)
    {
        if (pMemInfo->Cache != g_PreMemCtx.MemPool.Cache)
        {
            PRINT(VMM_ERROR, "%s,%d, Not support map %s cache now!(Phyaddr = 0x%x)\n",__func__,__LINE__, (g_PreMemCtx.MemPool.Cache ? "without" : "with"), pMemInfo->StartPhyAddr);

            return MEM_PRESERVE_NOT_SUPPORT;
        }
        Offset = pMemInfo->StartPhyAddr - g_PreMemCtx.MemPool.StartPhyAddr;
        pMemInfo->pStartVirAddr = g_PreMemCtx.MemPool.pStartVirAddr + Offset;
    }
    else
    {
        Ret = VMM_Map_Adapt(pMemInfo->Cache, pMemInfo);
        if (Ret == VMM_SUCCESS)
        {
            pMemInfo->Map = 1;
        }
    }

    return Ret;
}

VMM_PRIVATE SINT32 MemoryUnMap(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = CheckPhyAddrVaild(pMemInfo->StartPhyAddr);
    if (Ret != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s,%d, Phyaddr = 0x%x CheckPhyAddrVaild failed! ret = 0x%x\n",__func__,__LINE__,
            pMemInfo->StartPhyAddr,Ret);

        return Ret;
    }

    if (!g_PreMemCtx.MemPool.Map)
    {
        VMM_Unmap_Adapt(pMemInfo);
    }

    pMemInfo->Map   = 0;
    pMemInfo->Cache = 0;
    pMemInfo->pStartVirAddr = NULL;

    return Ret;
}

VMM_PRIVATE VOID UpdateFreeSize(SINT32 IsAlloc, UINT32 Size)
{
    if (IsAlloc)
    {
        g_PreMemCtx.FreeSize -= Size;
    }
    else
    {
        g_PreMemCtx.FreeSize += Size;
    }
}

VMM_PRIVATE SINT32 SplitFromExistMemoryBlock(Mem_Data_S *pExistMemBlock, VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = MEM_PRESERVE_FAILURE;
    VMM_BUFFER_S TargetMemInfo;
    VMM_BUFFER_S CmpMemInfo;
    VMM_BUFFER_S *pExistMemInfo = &pExistMemBlock->BufInfo;
    UINT32 ExpectSize = pMemInfo->Size;

    OSAL_FP_memset(&TargetMemInfo, 0, sizeof(VMM_BUFFER_S));
    OSAL_FP_memset(&CmpMemInfo   , 0, sizeof(VMM_BUFFER_S));

    TargetMemInfo.StartPhyAddr = pExistMemInfo->StartPhyAddr + pExistMemInfo->Size;
    TargetMemInfo.Size = ExpectSize;

    CmpMemInfo.StartPhyAddr = pExistMemInfo->StartPhyAddr;
    CmpMemInfo.Size = pExistMemBlock->ActualSize;

    PRINT(VMM_DBG, "%s,%d exist Node (Phyaddr = 0x%x, Size = %d, ActualSize = %d, Status= %d(%d), Location = %d(%d)\n", __func__, __LINE__,
          pExistMemBlock->BufInfo.StartPhyAddr, pExistMemBlock->BufInfo.Size, pExistMemBlock->ActualSize, pExistMemBlock->Status, pExistMemBlock->UseCnt, pExistMemBlock->Location, pExistMemBlock->RefCnt);

    if (CheckBufferOverflow(&TargetMemInfo, &CmpMemInfo) == VMM_FALSE)
    {
        pExistMemInfo->Size += TargetMemInfo.Size;

        if (VMM_Memlist_UpdateBufRec(pExistMemInfo) != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s,%d call VMM_Memlist_UpdateBufRec return failed!\n",__func__,__LINE__);
        }
        else
        {
            pMemInfo->StartPhyAddr  = TargetMemInfo.StartPhyAddr;
            if (pMemInfo->Map)
            {
                if (g_PreMemCtx.MemPool.pStartVirAddr)
                {
                   pMemInfo->pStartVirAddr = TargetMemInfo.StartPhyAddr - g_PreMemCtx.MemPool.StartPhyAddr + g_PreMemCtx.MemPool.pStartVirAddr;
                }
                else
                {
                   VMM_ASSERT(VMM_Map_Adapt(pMemInfo->Cache, pMemInfo) == VMM_SUCCESS);
                }
            }

            VMM_ASSERT(VMM_Memlist_MarkStatus(pExistMemInfo->StartPhyAddr, Node_Status_InUse) == VMM_SUCCESS);

            Ret = VMM_SUCCESS;

            PRINT(VMM_INFO, "%s,%d Small Pieces find success (Phyaddr 0x%x, size %d)\n",__func__,__LINE__,pMemInfo->StartPhyAddr,pMemInfo->Size);
        }
    }
    else
    {
        PRINT(VMM_ERROR, "%s,%d Small Pieces Buffer %s split from exist memory(Phyaddr 0x%x, size %d) overflow!\n",__func__,__LINE__,pMemInfo->BufName,pExistMemBlock->BufInfo.StartPhyAddr,pExistMemBlock->ActualSize);
    }

    return Ret;
}

VMM_PRIVATE SINT32 Partition_Normal(VMM_BUFFER_S *pMemInfo)
{
    SINT32 i;
    SINT32 Ret = MEM_PRESERVE_ALLOC_FAILED;
    SINT32 IsFind = 0;
    UINT32 AlignSize  = pMemInfo->AlignSize;

    VMM_BUFFER_S AvailableMemPool;
    VMM_BUFFER_S TargetBufInfo;

    GetAvailableMemPool(&AvailableMemPool);

    OSAL_FP_memset(&TargetBufInfo, 0, sizeof(VMM_BUFFER_S));

    TargetBufInfo.StartPhyAddr = AvailableMemPool.StartPhyAddr;
    TargetBufInfo.AlignSize    = AlignSize;
    TargetBufInfo.Size         = pMemInfo->Size * pMemInfo->UnionNum;

    for (i = 0; i < MAX_TRAVERSAL_NUM; i++, TargetBufInfo.StartPhyAddr += AlignSize)
    {
         PRINT(VMM_DBG, "%s,%d, i = %d try StartPhyAddr = 0x%x\n",__func__,__LINE__,i,TargetBufInfo.StartPhyAddr);
         if (CheckBufferOverflow(&TargetBufInfo, &AvailableMemPool))
         {
             PRINT(VMM_DBG, "%s,%d, i = %d try StartPhyAddr = 0x%x, overflow!\n",__func__,__LINE__,i,TargetBufInfo.StartPhyAddr);
             break;
         }

         if (CheckBufferAlreadyUsed(&TargetBufInfo))
         {
             /*if buffer TargetMemInfo is already used by DEI or so on,
             the StartPhyaddr will updata in function CheckBufferAlreadyUsed*/
             continue;
         }

         if (VMM_Memlist_IsOneBlockExist(&TargetBufInfo) == VMM_FALSE)
         {
             PRINT(VMM_DBG, "%s,%d, find success StartPhyAddr = 0x%x size = %d\n",__func__,__LINE__,TargetBufInfo.StartPhyAddr,TargetBufInfo.Size);
             IsFind = 1;
             pMemInfo->StartPhyAddr  = TargetBufInfo.StartPhyAddr;
             if (pMemInfo->Map)
             {
                 if (AvailableMemPool.pStartVirAddr)
                 {
                    pMemInfo->pStartVirAddr = TargetBufInfo.StartPhyAddr - AvailableMemPool.StartPhyAddr + AvailableMemPool.pStartVirAddr;
                 }
                 else
                 {
                    VMM_ASSERT(VMM_Map_Adapt(pMemInfo->Cache, pMemInfo) == VMM_SUCCESS);
                 }
             }
             break;
         }
    }

    if (i == MAX_TRAVERSAL_NUM)
    {
        PRINT(VMM_ERROR, "%s, %d, try time out! Maybe something wrong! Curent AlignSize = %d, expect size = %d, Mempool size = %d(Available %d), freeSize = %d\n", __func__, __LINE__,
              AlignSize, pMemInfo->Size, g_PreMemCtx.MemPool.Size, AvailableMemPool.Size, g_PreMemCtx.FreeSize);
    }

    if (IsFind == 1)
    {
        if (pMemInfo->SupplementInfo.IsValid)
        {
            Ret = Custom_GetBackTunlBuf(pMemInfo);
        }
        else
        {
            Ret = VMM_SUCCESS;
        }
    }

    return (Ret == VMM_SUCCESS) ?  VMM_SUCCESS : MEM_PRESERVE_ALLOC_FAILED;
}

VMM_PRIVATE SINT32 Partition_SmallPieces(VMM_BUFFER_S *pMemInfo, SINT32 *pIsNewNode)
{
    SINT32 Ret;
    Mem_Data_S  MemDataTmp;

    OSAL_FP_memset(&MemDataTmp, 0, sizeof(Mem_Data_S));

    if (VMM_Memlist_FindNodeCanBeSplit(pMemInfo->Size, pMemInfo->PrivID, &MemDataTmp) == VMM_SUCCESS)
    {
        *pIsNewNode = 0;
        Ret = SplitFromExistMemoryBlock(&MemDataTmp, pMemInfo);
    }
    else
    {
        *pIsNewNode = 1;
        Ret = Partition_Normal(pMemInfo);
    }

    return Ret;
}

VMM_PRIVATE SINT32 MemoryPartition(VMM_BUFFER_S *pMemInfo, SINT32 *pIsNewNode)
{
    SINT32 Ret;
    UINT32 ExpectSize = pMemInfo->Size;

    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);
    D_VMM_ASSERT_RET(pIsNewNode != NULL, MEM_PRESERVE_INVALID_PARA);

    if (CheckAllocParam(pMemInfo) != VMM_SUCCESS)
    {
        return MEM_PRESERVE_INVALID_PARA;
    }

    if (pMemInfo->SecFlag)
    {
        PRINT(VMM_ERROR, "%s,%d,BufName = %s, not support Sec Memory Map!\n",__func__,__LINE__,pMemInfo->BufName);
        return MEM_PRESERVE_NOT_SUPPORT;
    }

    if (pMemInfo->Size > g_PreMemCtx.MemPool.Size)
    {
        PRINT(VMM_ERROR, "%s,%d,BufName = %s, Size = %d larger than MemPool size %d invalid!\n",__func__,__LINE__,pMemInfo->BufName,pMemInfo->Size,g_PreMemCtx.MemPool.Size);
        return MEM_PRESERVE_NOT_ENOUGH;
    }

    if (Custom_SupplementBufDetail(pMemInfo) != VMM_SUCCESS)
    {
        return MEM_PRESERVE_INVALID_PARA;
    }

    if (ExpectSize == pMemInfo->AlignSize)
    {
        Ret = Partition_Normal(pMemInfo);
    }
    else if (ExpectSize < pMemInfo->AlignSize)
    {
        Ret = Partition_SmallPieces(pMemInfo, pIsNewNode);
    }
    else  /*ExpectSize > AlignSize not support*/
    {
        PRINT(VMM_ERROR, "%s,%d,ExpectSize = %d, AlignSize = %d invalid!\n",__func__,__LINE__,ExpectSize, pMemInfo->AlignSize);
        Ret = MEM_PRESERVE_NOT_SUPPORT;
    }

    return Ret;
}

VMM_PRIVATE SINT32 ConfigMemPool(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_PRESERVE_NULL_PTR);

    if (g_PreMemCtx.IsAvailable == 1)
    {
        PRINT(VMM_ERROR, "%s, %d Not support config multi memory pools now!\n", __func__, __LINE__);
        Ret = MEM_PRESERVE_NOT_SUPPORT;

        goto exit;
    }

    if (CheckMemInfo(pMemInfo) != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s, %d CheckMemInfo failed!\n", __func__, __LINE__);
        Ret = MEM_PRESERVE_INVALID_PARA;

        goto exit;
    }

    OSAL_FP_memcpy(&g_PreMemCtx.MemPool, pMemInfo, sizeof(VMM_BUFFER_S));
    g_PreMemCtx.FreeSize    = pMemInfo->Size;
    g_PreMemCtx.FreezeSize  = 0;
    g_PreMemCtx.IsAvailable = 1;

exit:
    return Ret;
}

static SINT32 AllocAndMapPreMem(UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    D_VMM_ASSERT_RET(pOutBufInfo != HI_NULL, MEM_PRESERVE_INVALID_PARA);

    OSAL_FP_memset(pOutBufInfo, 0, sizeof(VMM_BUFFER_S));

    s32Ret = VMM_Alloc_Adapt(PREPARED_MEMORY_NAME, BufSize, pOutBufInfo);
    if (s32Ret == HI_SUCCESS)
    {
        pOutBufInfo->MemType        = VMM_MEM_TYPE_PRE_ALLOC;
        pOutBufInfo->AlignSize      = pOutBufInfo->Size;
        pOutBufInfo->UnionNum       = 1;

        OSAL_FP_snprintf(pOutBufInfo->BufName, VMM_MAX_NAME_LEN, "%s", PREPARED_MEMORY_NAME);
        pOutBufInfo->BufName[sizeof(PREPARED_MEMORY_NAME) - 1] = '\0';

        PRINT(VMM_DBG, "%s,%d, PrmMemory: BufName = %s, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d alloc success!\n", __func__, __LINE__,
                         pOutBufInfo->BufName, pOutBufInfo->StartPhyAddr, pOutBufInfo->pStartVirAddr, pOutBufInfo->Size);
    }

    return s32Ret;
}

HI_VOID UnmapAndReleasePreMem(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_ASSERT(pBufInfo != HI_NULL);

    VMM_Release_Adapt(pBufInfo);

    return;
}

static SINT32 PreMemInit(VOID)
{
    SINT32 Ret = VMM_SUCCESS;
    UINT32 PreMemSize = 0;
    VMM_INVOKE_ATTR_S InVokeAttr;
    VMM_BUFFER_S *pBuffer = &InVokeAttr.AttrUnion.BufInfo;

    PreMemSize = Custom_GetPreMemSize();
    D_VMM_ASSERT_RET(PreMemSize != 0, MEM_PRESERVE_STATE_ABNORMAL);

    if (AllocAndMapPreMem(PreMemSize, pBuffer) != VMM_SUCCESS)
    {
        Ret = MEM_PRESERVE_ALLOC_FAILED;
        PRINT(VMM_FATAL, "%s,%d, Prm Memory Size = %d alloc failed!!\n", __func__, __LINE__,PreMemSize);

        goto exit0;
    }
    else
    {
        PRINT(VMM_DBG, "%s,%d, AllocAndMapPreMem success!==> bufferSize = %d\n",__func__,__LINE__,pBuffer->Size);
    }

    InVokeAttr.Type = VMM_INVOKE_CONFIG_MEM_POOL;
    if (VMM_Preserve_Invoke(&InVokeAttr) != VMM_SUCCESS)
    {
        Ret = MEM_PRESERVE_FAILURE;
        goto exit1;
    }

    MEM_AddMemRecord(pBuffer->StartPhyAddr, (VOID *)pBuffer->pStartVirAddr, pBuffer->Size);

    return Ret;

exit1:
    UnmapAndReleasePreMem(pBuffer);
exit0:
    return Ret;
}

static VOID PreMemDeInit(VOID)
{
    D_VMM_ASSERT(g_PreMemCtx.IsInit != 0);
    D_VMM_ASSERT(g_PreMemCtx.IsAvailable != 0);

    MEM_DelMemRecord(g_PreMemCtx.MemPool.StartPhyAddr, (VOID *)g_PreMemCtx.MemPool.pStartVirAddr, g_PreMemCtx.MemPool.Size);

    UnmapAndReleasePreMem(&g_PreMemCtx.MemPool);

    return ;
}
/***************************  External Interface *********************************/
SINT32 VMM_Preserve_Init(VOID *pArgs)
{
    if (g_PreMemCtx.IsInit == 0)
    {
        OSAL_FP_memset(&g_PreMemCtx, 0, sizeof(MEM_PRE_ALLOCATION_CTX));

        if (Custom_Init(pArgs) != VMM_SUCCESS)
        {
            return VMM_FAILURE;
        }

        g_PreMemCtx.IsInit = 1;

    #ifdef VCODEC_UT_ENABLE
        VMM_Memlist_Init();
    #endif

        if (PreMemInit() != VMM_SUCCESS)
        {
            Custom_Deinit();

            OSAL_FP_memset(&g_PreMemCtx, 0, sizeof(MEM_PRE_ALLOCATION_CTX));

            return VMM_FAILURE;
        }
    }

    return VMM_SUCCESS;
}

VOID VMM_Preserve_Deinit(VOID)
{
    if (g_PreMemCtx.IsInit)
    {
        PreMemDeInit();

        OSAL_FP_memset(&g_PreMemCtx, 0, sizeof(MEM_PRE_ALLOCATION_CTX));

        g_PreMemCtx.IsInit = 0;

    #ifdef VCODEC_UT_ENABLE
        VMM_Memlist_Deinit();
    #endif

        Custom_Deinit();
    }

    return;
}

SINT32 VMM_Preserve_Alloc(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    UINT32 StartTime = 0;
    UINT32 StopTime = 0;
    SINT32 IsNewNode = 1;
    Mem_Data_S MemData;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_PRESERVE_NULL_PTR);

    StartTime = OSAL_FP_get_time_us();
    Ret = MemoryPartition(pMemInfo, &IsNewNode);
    StopTime  = OSAL_FP_get_time_us();

    if (Ret == VMM_SUCCESS && IsNewNode)
    {
        PRINT(VMM_INFO, "%s,%d, Alloc Buffer %s, Phyaddr = 0x%x, size = %d success!\n",__func__,__LINE__,pMemInfo->BufName,pMemInfo->StartPhyAddr,pMemInfo->Size);

        Preserve_ConvertMemDataFirstTime(pMemInfo, StopTime - StartTime, &MemData);

        Ret = VMM_Memlist_AddNode(&MemData);

        if (Ret == VMM_SUCCESS)
        {
            UpdateFreeSize(VMM_TRUE, MemData.ActualSize);
        }
        else
        {
            PRINT(VMM_ERROR, "%s,%d,add Memlist failed!, Name = '%s', Size = %d,return 0x%x\n", __func__, __LINE__, pMemInfo->BufName, pMemInfo->Size,Ret);

            /*The partitioned memory is valid just when it's successfully added to Memlist, so here do not need to release*/
            if (pMemInfo->SupplementInfo.IsValid)
            {
                Custom_PutBackTunlBuf(pMemInfo);
            }
        }
    }
    else if (Ret == MEM_PRESERVE_ALLOC_FAILED)
    {
        Ret = ERR_VMM_MSG_NEED_REPROCESS;
    }

    return Ret;
}

SINT32 VMM_Preserve_Release(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret;
    Mem_Data_S Data = {0};
    VMM_BUFFER_SUPPLEMENT_S *pSubBufInfo = &Data.BufInfo.SupplementInfo;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_PRESERVE_NULL_PTR);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);

    Ret = VMM_Memlist_FindNodeByPhyaddr(pMemInfo->StartPhyAddr, &Data);
    if (Ret != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s, %d, BuferAddr = 0x%x, Size = %d can't find in Memlist\n", __func__, __LINE__, pMemInfo->StartPhyAddr, pMemInfo->Size);

        return MEM_PRESERVE_INVALID_PARA;
    }

    if (Data.BufInfo.Map && (g_PreMemCtx.MemPool.Map == 0))
    {
        VMM_Unmap_Adapt(&Data.BufInfo);
    }

    if (pSubBufInfo->IsValid)
    {
        Custom_PutBackTunlBuf(pMemInfo);
    }

    Ret = VMM_Memlist_DeleteNodeByPhyaddr(pMemInfo->StartPhyAddr);
    if (Ret == VMM_SUCCESS)
    {
        UpdateFreeSize(VMM_FALSE, Data.ActualSize);
    }
    else
    {
        PRINT(VMM_ERROR, "%s, %d, Delete Memlist failed! BuferAddr = 0x%x, Size = %d\n", __func__, __LINE__, pMemInfo->StartPhyAddr, pMemInfo->Size);
    }

    return Ret;
}

SINT32 VMM_Preserve_Map(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_PRESERVE_NULL_PTR);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);

    Ret = MemoryMap(pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        VMM_ASSERT(VMM_Memlist_UpdateBufRec(pMemInfo) == VMM_SUCCESS);
    }

    return Ret;
}

SINT32 VMM_Preserve_Unmap(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_PRESERVE_NULL_PTR);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);

    Ret = MemoryUnMap(pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        VMM_ASSERT(VMM_Memlist_UpdateBufRec(pMemInfo) == VMM_SUCCESS);
    }

    return Ret;
}

SINT32 VMM_Preserve_Invoke(VMM_INVOKE_ATTR_S *pParam)
{
    SINT32 Ret = MEM_PRESERVE_NOT_SUPPORT;

    D_VMM_CHECK_PTR_RET(pParam, MEM_PRESERVE_NULL_PTR);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);

    switch (pParam->Type)
    {
        case VMM_INVOKE_CONFIG_MEM_POOL:
            Ret = ConfigMemPool(&pParam->AttrUnion.BufInfo);
            break;

        case VMM_INVOKE_NOTICE_ALLOC:
            Ret = Custom_AllocMemPreProcess(&pParam->AttrUnion.NoticeParam);
            break;

        case VMM_INVOKE_GET_RESERVED_BUF:
            Ret = Custom_GetReservedBuf(&pParam->AttrUnion.BufInfo);
            break;

        case VMM_INVOKE_PUT_RESERVED_BUF:
            Ret = Custom_PutReservedBuf(&pParam->AttrUnion.BufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d, Type = %d not support!\n", __func__, __LINE__, pParam->Type);
            break;
    }

    return Ret;
}

VOID VMM_Preserve_ReadProc(VOID *p)
{
#ifdef HI_PROC_SUPPORT
    D_VMM_CHECK_PTR(p);

    //statistics info
    PROC_PRINT(p, "================================================= Preserve Mem ========================================================= \n");
    PROC_PRINT(p, "IsAvailable                     : %d\n", g_PreMemCtx.IsAvailable);
    PROC_PRINT(p, "PhyAddr/pVirAddr                : 0x%x / %lx\n", g_PreMemCtx.MemPool.StartPhyAddr, g_PreMemCtx.MemPool.pStartVirAddr);
    PROC_PRINT(p, "Size                            : %d(KB)\n", g_PreMemCtx.MemPool.Size / 1024);
    PROC_PRINT(p, "FreeSize/FreezeSize             : %d/%d (KB)\n", g_PreMemCtx.FreeSize/1024,g_PreMemCtx.FreezeSize/1024);

    if (g_PreMemCtx.ReservedBufValid)
    {
        PROC_PRINT(p, "Reserved PhyAddr/pVirAddr       : 0x%x / %lx\n", g_PreMemCtx.ReservedBufInfo.StartPhyAddr,g_PreMemCtx.ReservedBufInfo.pStartVirAddr);
        PROC_PRINT(p, "Reserved Size                   : %d(KB)\n", g_PreMemCtx.ReservedBufInfo.Size / 1024);
        PROC_PRINT(p, "ReservedBuf OutSide             : %d\n", g_PreMemCtx.ReservedBufOutSide);
    }
#endif
    return;
}

#ifdef VCODEC_UT_ENABLE
EXPORT_SYMBOL(g_PreMemCtx);
EXPORT_SYMBOL(VMM_Preserve_Init);
EXPORT_SYMBOL(VMM_Preserve_Deinit);
EXPORT_SYMBOL(VMM_Preserve_Alloc);
EXPORT_SYMBOL(VMM_Preserve_Release);
EXPORT_SYMBOL(VMM_Preserve_Map);
EXPORT_SYMBOL(VMM_Preserve_Unmap);
EXPORT_SYMBOL(VMM_Preserve_Invoke);
EXPORT_SYMBOL(VMM_Preserve_ReadProc);
#endif

