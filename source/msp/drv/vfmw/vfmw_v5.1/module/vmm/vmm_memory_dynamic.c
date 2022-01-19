#include "vmm_osal.h"
#include "vmm_memory_common.h"
#include "vmm_memory_dynamic.h"
#include "vmm_memlist_manager.h"
#include "vmm_custom.h"

/*************************** Internal interface **************************/
static VOID Dynamic_ConvertMemDataFirstTime(VMM_BUFFER_S *pBufferInfo, UINT32 TimeConsume, Mem_Data_S *pMemData)
{
    OSAL_FP_memset(pMemData, 0, sizeof(Mem_Data_S));

    pMemData->Status = Node_Status_InUse;
    pMemData->UseCnt = 1;
    pMemData->Location = VMM_LOCATION_INSIDE;
    pMemData->ActualSize = pBufferInfo->Size;     //dynamic alloc do not care pBuferInfo->UnionNum, always default UnionNum = 1;

    OSAL_FP_memcpy(&pMemData->BufInfo, pBufferInfo, sizeof(VMM_BUFFER_S));
    pMemData->BufInfo.AlignSize = pMemData->BufInfo.Size;
    pMemData->BufInfo.UnionNum  = 1;

    pMemData->DbgInfo.AllocTimeConsumeInUs = TimeConsume;

    return;
}

static SINT32 VMM_AllocAndMap(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_MEM_TYPE_E MemType, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            Ret = VMM_AllocAndMap_Adapt(pBufferName, BufSize, IsCached, pOutBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            Ret = VMM_AllocAndMap_ForceMMZ(pBufferName, BufSize, IsCached, pOutBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return Ret;
}

static VOID VMM_UnmapAndRelease(VMM_BUFFER_S *pBufInfo)
{
    VMM_MEM_TYPE_E MemType = pBufInfo->MemType;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            VMM_UnmapAndRelease_Adapt(pBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            VMM_UnmapAndRelease_ForceMMZ(pBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return;
}

static SINT32 VMM_Alloc(SINT8 *pBufferName, UINT32 BufSize, VMM_MEM_TYPE_E MemType, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            Ret = VMM_Alloc_Adapt(pBufferName, BufSize, pOutBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            Ret = VMM_Alloc_ForceMMZ(pBufferName, BufSize, pOutBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s, %d, memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return Ret;
}

static VOID VMM_Release(VMM_BUFFER_S *pBufInfo)
{
    VMM_MEM_TYPE_E MemType = pBufInfo->MemType;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            VMM_Release_Adapt(pBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            VMM_Release_ForceMMZ(pBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return;
}

static SINT32 VMM_Map(UINT32 IsCached, VMM_BUFFER_S *pBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    VMM_MEM_TYPE_E MemType = pBufInfo->MemType;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            Ret = VMM_Map_Adapt(IsCached, pBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            Ret = VMM_Map_ForceMMZ(IsCached, pBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return Ret;
}

static VOID VMM_Unmap(VMM_BUFFER_S *pBufInfo)
{
    VMM_MEM_TYPE_E MemType = pBufInfo->MemType;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            VMM_Unmap_Adapt(pBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            VMM_Unmap_ForceMMZ(pBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return;
}

#ifdef HI_TEE_SUPPORT
static SINT32 VMM_Alloc_MMZ_SEC(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    Ret = HI_DRV_SECMMZ_Alloc(pBufferName, BufSize, 64, &stMMZBuf);

    if ((Ret != VMM_SUCCESS) || (stMMZBuf.u32StartPhyAddr == 0))
    {
        return MEM_DYNAMIC_ALLOC_FAILED;
    }

    pOutBufInfo->pStartVirAddr = (ULONG)stMMZBuf.pu8StartVirAddr;
    pOutBufInfo->StartPhyAddr = stMMZBuf.u32StartPhyAddr;
    pOutBufInfo->Size = stMMZBuf.u32Size;

    return Ret;
}

static VOID VMM_Release_MMZ_SEC(VMM_BUFFER_S *pBufInfo)
{
    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    stMMZBuf.u32StartPhyAddr  = pBufInfo->StartPhyAddr;
    stMMZBuf.pu8StartVirAddr  = UINT64_PTR(pBufInfo->pStartVirAddr);
    stMMZBuf.u32Size          = pBufInfo->Size;

    HI_DRV_SECMMZ_Release(&stMMZBuf);

    return;
}

#ifdef HI_SMMU_SUPPORT
static SINT32 VMM_Alloc_SMMU_SEC(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    Ret = HI_DRV_SECSMMU_Alloc(pBufferName, BufSize, 64, &stSMMUBuf);

    if ((Ret != VMM_SUCCESS) || (stSMMUBuf.u32StartSmmuAddr == 0))
    {
        return MEM_DYNAMIC_ALLOC_FAILED;
    }

    pOutBufInfo->pStartVirAddr  = (ULONG)stSMMUBuf.pu8StartVirAddr;
    pOutBufInfo->StartPhyAddr   = stSMMUBuf.u32StartSmmuAddr;
    pOutBufInfo->Size           = stSMMUBuf.u32Size;

    return Ret;
}

static VOID VMM_Release_SMMU_SEC(VMM_BUFFER_S *pBufInfo)
{
    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    stSMMUBuf.u32StartSmmuAddr = pBufInfo->StartPhyAddr;
    stSMMUBuf.pu8StartVirAddr  = UINT64_PTR(pBufInfo->pStartVirAddr);
    stSMMUBuf.u32Size          = pBufInfo->Size;

    HI_DRV_SECSMMU_Release(&stSMMUBuf);

    return;
}
#endif

static SINT32 VMM_Alloc_SEC_ForceMMZ(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = VMM_Alloc_MMZ_SEC(pBufferName, BufSize, pOutBufInfo);

    return Ret;
}

static VOID VMM_Release_SEC_ForceMMZ(VMM_BUFFER_S *pBufInfo)
{
    VMM_Release_MMZ_SEC(pBufInfo);

    return;
}

static SINT32 VMM_Alloc_SEC_Adapt(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

#ifdef HI_SMMU_SUPPORT
    Ret = VMM_Alloc_SMMU_SEC(pBufferName, BufSize, pOutBufInfo);
#else
    Ret = VMM_Alloc_MMZ_SEC(pBufferName, BufSize, pOutBufInfo);
#endif

    return Ret;
}

static VOID VMM_Release_SEC_Adapt(VMM_BUFFER_S *pBufInfo)
{
#ifdef HI_SMMU_SUPPORT
    VMM_Release_SMMU_SEC(pBufInfo);
#else
    VMM_Release_MMZ_SEC(pBufInfo);
#endif

    return;
}

static SINT32 VMM_Alloc_SEC(SINT8 *pBufferName, UINT32 BufSize, VMM_MEM_TYPE_E MemType, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            Ret = VMM_Alloc_SEC_Adapt(pBufferName, BufSize, pOutBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            Ret = VMM_Alloc_SEC_ForceMMZ(pBufferName, BufSize, pOutBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return Ret;
}

static VOID VMM_Release_SEC(VMM_BUFFER_S *pBufInfo)
{
    VMM_MEM_TYPE_E MemType = pBufInfo->MemType;

    switch (MemType)
    {
        case VMM_MEM_TYPE_SYS_ADAPT:
            VMM_Release_SEC_Adapt(pBufInfo);
            break;

        case VMM_MEM_TYPE_FORCE_MMZ:
            VMM_Release_SEC_ForceMMZ(pBufInfo);
            break;

        default:
            PRINT(VMM_ERROR, "%s,%d,memType (%d) not support\n", __func__, __LINE__, MemType);
            break;
    }

    return;
}
#endif

static SINT32 VMM_Alloc_MainBuf(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    if (pMemInfo->SecFlag)
    {
#ifdef HI_TEE_SUPPORT
        Ret = VMM_Alloc_SEC(pMemInfo->BufName, pMemInfo->Size, pMemInfo->MemType, pMemInfo);

        if (Ret != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s,%d, ERROR: Alloc sec mem %s size %d failed.\n", __func__, __LINE__, pMemInfo->BufName, pMemInfo->Size);
        }
        else
        {
            pMemInfo->pStartVirAddr = (pMemInfo->Map) ? (ULONG)pMemInfo->StartPhyAddr : 0;
        }
#else
        PRINT(VMM_ERROR,"%s,%d, this chip not support TEE!", __func__, __LINE__);

        Ret = ERR_VMM_NOT_SUPPORT;
#endif
    }
    else
    {
        if (pMemInfo->Map)
        {
            Ret = VMM_AllocAndMap(pMemInfo->BufName, pMemInfo->Size, pMemInfo->Cache, pMemInfo->MemType, pMemInfo);
        }
        else
        {
            Ret = VMM_Alloc(pMemInfo->BufName, pMemInfo->Size, pMemInfo->MemType, pMemInfo);
        }

        if (Ret == VMM_SUCCESS)
        {
            if (MEM_AddMemRecord(pMemInfo->StartPhyAddr, (VOID *)pMemInfo->pStartVirAddr, pMemInfo->Size) != VMM_SUCCESS)
            {
                PRINT(VMM_ERROR, "%s,%d, WARNING:MEM_AddMemRecord return Failed!\n", __func__, __LINE__);
            }
        }
    }

    return Ret;
}

static VOID VMM_Release_MainBuf(VMM_BUFFER_S *pMemInfo)
{
    if (pMemInfo->SecFlag)
    {
#ifdef HI_TEE_SUPPORT
        VMM_Release_SEC(pMemInfo);
#else
        PRINT(VMM_ERROR,"%s,%d, this chip not support TEE!", __func__, __LINE__);

        return;
#endif
    }
    else
    {
        if (MEM_DelMemRecord(pMemInfo->StartPhyAddr, (VOID *)pMemInfo->pStartVirAddr, pMemInfo->Size) != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s,%d, WARNING:MEM_DelMemRecord return Failed!\n", __func__, __LINE__);
        }

        if (pMemInfo->Map)
        {
            VMM_UnmapAndRelease(pMemInfo);
        }
        else
        {
            VMM_Release(pMemInfo);
        }
    }

    return;
}


static SINT32 VMM_Entry_Alloc(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    Ret = VMM_Alloc_MainBuf(pMemInfo);
    if (Ret != VMM_SUCCESS)
    {
        goto error0;
    }

    if (pMemInfo->SupplementInfo.IsValid)
    {
        Ret = Custom_GetBackTunlBuf(pMemInfo);
        if (Ret != VMM_SUCCESS)
        {
            goto error1;
        }
    }

    return Ret;

error1:
    VMM_Release_MainBuf(pMemInfo);
    pMemInfo->StartPhyAddr  = 0;
    pMemInfo->pStartVirAddr = 0;

error0:
    return Ret;
}

static SINT32 VMM_Entry_Release(VMM_BUFFER_S *pMemInfo)
{
    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    VMM_Release_MainBuf(pMemInfo);
    if (pMemInfo->SupplementInfo.IsValid)
    {
        Custom_PutBackTunlBuf(pMemInfo);
    }

    return VMM_SUCCESS;
}

static SINT32 VMM_Entry_Map(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    VMM_ASSERT(pMemInfo->Map == 0);

    if (pMemInfo->SecFlag)
    {
        PRINT(VMM_ERROR, "%s,%d, WARNING:SEC MEMORY NOT SUPPORT MAP VirAddr.\n", __func__, __LINE__);

        return MEM_DYNAMIC_NOT_SUPPORT;
    }

    if (pMemInfo->pStartVirAddr != 0)
    {
        PRINT(VMM_ERROR, "%s,%d, WARNING:BufName = %s, pStartVirAddr = 0x%llx already map!\n", __func__, __LINE__,
              pMemInfo->BufName, pMemInfo->pStartVirAddr);

        return MEM_DYNAMIC_MAP_FAILED;
    }

    Ret = VMM_Map(pMemInfo->Cache, pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        pMemInfo->Map = 1;
    }

    return Ret;
}

static SINT32 VMM_Entry_Unmap(VMM_BUFFER_S *pMemInfo)
{
    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    VMM_ASSERT(pMemInfo->Map == 1);

    if (pMemInfo->SecFlag)
    {
        PRINT(VMM_ERROR, "%s,%d, WARNING:SEC MEMORY NOT SUPPORT MAP VirAddr.\n", __func__, __LINE__);

        return MEM_DYNAMIC_NOT_SUPPORT;
    }

    VMM_Unmap(pMemInfo);

    pMemInfo->Map = 0;
    pMemInfo->Cache = 0;
    pMemInfo->pStartVirAddr = 0;

    return VMM_SUCCESS;
}

/***************************  External Interface *********************************/
SINT32 VMM_Dynamic_Alloc(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    UINT32 StartTime = 0;
    UINT32 StopTime = 0;
    Mem_Data_S MemData;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    StartTime = OSAL_FP_get_time_us();
    Ret = VMM_Entry_Alloc(pMemInfo);
    StopTime  = OSAL_FP_get_time_us();

    if (Ret == VMM_SUCCESS)
    {
        Dynamic_ConvertMemDataFirstTime(pMemInfo, StopTime - StartTime, &MemData);

        Ret = VMM_Memlist_AddNode(&MemData);

        if (Ret != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s,%d,add Memlist failed!, Name = '%s', Size = %d\n", __func__, __LINE__, pMemInfo->BufName, pMemInfo->Size);

            if (VMM_Entry_Release(pMemInfo) != VMM_SUCCESS)
            {
                PRINT(VMM_ERROR, "%s,%d, Memlist AddNode failed!, BufferName = '%s', BuferAddr = 0x%x, Size = %d\n", __func__, __LINE__,
                      pMemInfo->BufName, pMemInfo->StartPhyAddr, pMemInfo->Size);
            }
        }
    }
    else if (Ret == MEM_DYNAMIC_ALLOC_FAILED)
    {
        Ret = ERR_VMM_MSG_NEED_REPROCESS;
    }

    return Ret;
}

SINT32 VMM_Dynamic_Release(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret;

    D_VMM_CHECK_PTR_RET(pMemInfo, MEM_DYNAMIC_NULL_PTR);

    Ret = VMM_Entry_Release(pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        if (VMM_Memlist_DeleteNodeByPhyaddr(pMemInfo->StartPhyAddr) != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s,%d,Delete Memlist failed!, BuferAddr = 0x%x, Size = %d\n", __func__, __LINE__, pMemInfo->StartPhyAddr, pMemInfo->Size);
        }
    }

    return Ret;
}

SINT32 VMM_Dynamic_Map(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = VMM_Entry_Map(pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        VMM_ASSERT(VMM_Memlist_UpdateBufRec(pMemInfo) == VMM_SUCCESS);
    }

    return Ret;
}

SINT32 VMM_Dynamic_Unmap(VMM_BUFFER_S *pMemInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = VMM_Entry_Unmap(pMemInfo);

    if (Ret == VMM_SUCCESS)
    {
        VMM_ASSERT(VMM_Memlist_UpdateBufRec(pMemInfo) == VMM_SUCCESS);
    }

    return Ret;
}

SINT32 VMM_Dynamic_Init(VOID *pArgs)
{
    if (Custom_Init(pArgs) != VMM_SUCCESS)
    {
        return VMM_FAILURE;
    }

    return VMM_SUCCESS;
}

VOID VMM_Dynamic_Deinit(VOID)
{
    Custom_Deinit();

    return;
}

SINT32 VMM_Dynamic_Invoke(VMM_INVOKE_ATTR_S *pParam)
{
    PRINT(VMM_DBG, "%s,%d,Dynamic Module not support each invoke type.\n",__func__,__LINE__);

    return MEM_DYNAMIC_NOT_SUPPORT;
}

VOID VMM_Dynamic_ReadProc(VOID *p)
{
    return;
}

