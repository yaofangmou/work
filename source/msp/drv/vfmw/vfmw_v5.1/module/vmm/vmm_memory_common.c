#include "vmm_osal.h"
#include "vmm_memory_common.h"

#define MEMORY_ALLOC_LIMIT  (150 * 1024 * 1024)

/*************************** Internal interface **************************/

VMM_PRIVATE SINT32 VMM_Alloc_MMZ(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    D_VMM_ASSERT_RET(BufSize < MEMORY_ALLOC_LIMIT, ERR_VMM_INVALID_PARA);

    Ret = HI_DRV_MMZ_Alloc(pBufferName, NULL, BufSize, 64, &stMMZBuf);

    if ((Ret != VMM_SUCCESS) || (stMMZBuf.u32StartPhyAddr == 0))
    {
        return ERR_VMM_ALLOC_FAILED;
    }

    pOutBufInfo->pStartVirAddr  = (ULONG)stMMZBuf.pu8StartVirAddr;
    pOutBufInfo->StartPhyAddr   = stMMZBuf.u32StartPhyAddr;
    pOutBufInfo->Size           = stMMZBuf.u32Size;
    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pOutBufInfo->StartPhyAddr, pOutBufInfo->pStartVirAddr, pOutBufInfo->Size);

    return Ret;
}

VMM_PRIVATE VOID VMM_Release_MMZ(VMM_BUFFER_S *pBufInfo)
{
    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    stMMZBuf.u32StartPhyAddr  = pBufInfo->StartPhyAddr;
    stMMZBuf.pu8StartVirAddr  = UINT64_PTR(pBufInfo->pStartVirAddr);
    stMMZBuf.u32Size          = pBufInfo->Size;

    HI_DRV_MMZ_Release(&stMMZBuf);
    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pBufInfo->StartPhyAddr, pBufInfo->pStartVirAddr, pBufInfo->Size);

    return;
}

VMM_PRIVATE SINT32 VMM_Map_MMZ(UINT32 IsCached, VMM_BUFFER_S *pBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    stMMZBuf.u32StartPhyAddr = pBufInfo->StartPhyAddr;
    stMMZBuf.u32Size = pBufInfo->Size;

    if (IsCached)
    {
        Ret = HI_DRV_MMZ_MapCache(&stMMZBuf);
    }
    else
    {
        Ret = HI_DRV_MMZ_Map(&stMMZBuf);
    }

    if (Ret == VMM_SUCCESS)
    {
        pBufInfo->pStartVirAddr = (ULONG)stMMZBuf.pu8StartVirAddr;
    }

    return Ret;
}

VMM_PRIVATE VOID VMM_Unmap_MMZ(VMM_BUFFER_S *pBufInfo)
{
    MMZ_BUFFER_S stMMZBuf;
    OSAL_FP_memset(&stMMZBuf, 0, sizeof(MMZ_BUFFER_S));

    stMMZBuf.u32StartPhyAddr = pBufInfo->StartPhyAddr;
    stMMZBuf.pu8StartVirAddr = UINT64_PTR(pBufInfo->pStartVirAddr);
    stMMZBuf.u32Size = pBufInfo->Size;

    HI_DRV_MMZ_Unmap(&stMMZBuf);

    return;
}

VMM_PRIVATE SINT32 VMM_AllocAndMap_MMZ(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = VMM_Alloc_MMZ(pBufferName, BufSize, pOutBufInfo);

    if (Ret != VMM_SUCCESS)
    {
        return ERR_VMM_ALLOC_FAILED;
    }

    Ret = VMM_Map_MMZ(IsCached, pOutBufInfo);

    if (Ret != VMM_SUCCESS)
    {
        VMM_Release_MMZ(pOutBufInfo);

        return ERR_VMM_INVALID_STATE;
    }

    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pOutBufInfo->StartPhyAddr, pOutBufInfo->pStartVirAddr, pOutBufInfo->Size);

    return Ret;
}

VMM_PRIVATE VOID VMM_UnmapAndRelease_MMZ(VMM_BUFFER_S *pBufInfo)
{
    VMM_Unmap_MMZ(pBufInfo);

    VMM_Release_MMZ(pBufInfo);
    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pBufInfo->StartPhyAddr, pBufInfo->pStartVirAddr, pBufInfo->Size);

    return;
}

#ifdef HI_SMMU_SUPPORT
VMM_PRIVATE SINT32 VMM_Alloc_SMMU(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    D_VMM_ASSERT_RET(BufSize < MEMORY_ALLOC_LIMIT, ERR_VMM_INVALID_PARA);

    Ret = HI_DRV_SMMU_Alloc(pBufferName, BufSize, 64, &stSMMUBuf);

    if ((Ret != VMM_SUCCESS) || (stSMMUBuf.u32StartSmmuAddr == 0))
    {
        return ERR_VMM_ALLOC_FAILED;
    }

    pOutBufInfo->pStartVirAddr  = (ULONG)stSMMUBuf.pu8StartVirAddr;
    pOutBufInfo->StartPhyAddr   = stSMMUBuf.u32StartSmmuAddr;
    pOutBufInfo->Size           = stSMMUBuf.u32Size;

    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pOutBufInfo->StartPhyAddr, pOutBufInfo->pStartVirAddr, pOutBufInfo->Size);

    return Ret;
}

VMM_PRIVATE VOID VMM_Release_SMMU(VMM_BUFFER_S *pBufInfo)
{
    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    stSMMUBuf.u32StartSmmuAddr = pBufInfo->StartPhyAddr;
    stSMMUBuf.pu8StartVirAddr  = UINT64_PTR(pBufInfo->pStartVirAddr);
    stSMMUBuf.u32Size          = pBufInfo->Size;

    HI_DRV_SMMU_Release(&stSMMUBuf);
    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pBufInfo->StartPhyAddr, pBufInfo->pStartVirAddr, pBufInfo->Size);

    return;
}

VMM_PRIVATE SINT32 VMM_Map_SMMU(UINT32 IsCached, VMM_BUFFER_S *pBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;
    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    stSMMUBuf.u32StartSmmuAddr = pBufInfo->StartPhyAddr;
    stSMMUBuf.u32Size          = pBufInfo->Size;

    if (IsCached)
    {
        Ret = HI_DRV_SMMU_MapCache(&stSMMUBuf);
    }
    else
    {
        Ret = HI_DRV_SMMU_Map(&stSMMUBuf);
    }

    if (Ret == VMM_SUCCESS)
    {
        pBufInfo->pStartVirAddr  = (ULONG)stSMMUBuf.pu8StartVirAddr;
    }

    return Ret;
}

VMM_PRIVATE VOID VMM_Unmap_SMMU(VMM_BUFFER_S *pBufInfo)
{
    SMMU_BUFFER_S stSMMUBuf;
    OSAL_FP_memset(&stSMMUBuf, 0, sizeof(SMMU_BUFFER_S));

    stSMMUBuf.u32StartSmmuAddr = pBufInfo->StartPhyAddr;
    stSMMUBuf.pu8StartVirAddr  = UINT64_PTR(pBufInfo->pStartVirAddr);
    stSMMUBuf.u32Size          = pBufInfo->Size;

    HI_DRV_SMMU_Unmap(&stSMMUBuf);

    return;
}

VMM_PRIVATE SINT32 VMM_AllocAndMap_SMMU(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = VMM_Alloc_SMMU(pBufferName, BufSize, pOutBufInfo);

    if (Ret != VMM_SUCCESS)
    {
        return ERR_VMM_ALLOC_FAILED;
    }

    Ret = VMM_Map_SMMU(IsCached, pOutBufInfo);

    if (Ret != VMM_SUCCESS)
    {
        VMM_Release_SMMU(pOutBufInfo);

        return ERR_VMM_INVALID_STATE;
    }

    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pOutBufInfo->StartPhyAddr, pOutBufInfo->pStartVirAddr, pOutBufInfo->Size);

    return Ret;
}

VMM_PRIVATE VOID VMM_UnmapAndRelease_SMMU(VMM_BUFFER_S *pBufInfo)
{
    VMM_Unmap_SMMU(pBufInfo);

    VMM_Release_SMMU(pBufInfo);
    PRINT(VMM_DBG, "%s,%d, Phyaddr = 0x%x, VirAddr = 0x%lx, Size = %d\n", __func__, __LINE__,
          pBufInfo->StartPhyAddr, pBufInfo->pStartVirAddr, pBufInfo->Size);

    return;
}
#endif


/***************************  External Interface *********************************/

SINT32 VMM_Alloc_ForceMMZ(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    D_VMM_CHECK_PTR_RET(pBufferName, ERR_VMM_NULL_PTR);
    D_VMM_CHECK_PTR_RET(pOutBufInfo, ERR_VMM_NULL_PTR);

    return VMM_Alloc_MMZ(pBufferName, BufSize, pOutBufInfo);
}

VOID VMM_Release_ForceMMZ(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

    return VMM_Release_MMZ(pBufInfo);
}

SINT32 VMM_Map_ForceMMZ(UINT32 IsCached, VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR_RET(pBufInfo, ERR_VMM_NULL_PTR);

    return VMM_Map_MMZ(IsCached, pBufInfo);
}

VOID VMM_Unmap_ForceMMZ(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

    VMM_Unmap_MMZ(pBufInfo);

    return;
}

SINT32 VMM_AllocAndMap_ForceMMZ(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pBufferName, ERR_VMM_NULL_PTR);
    D_VMM_CHECK_PTR_RET(pOutBufInfo, ERR_VMM_NULL_PTR);

    Ret = VMM_AllocAndMap_MMZ(pBufferName, BufSize, IsCached, pOutBufInfo);

    return Ret;
}

VOID VMM_UnmapAndRelease_ForceMMZ(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

    return VMM_UnmapAndRelease_MMZ(pBufInfo);
}


SINT32 VMM_Alloc_Adapt(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pBufferName, ERR_VMM_NULL_PTR);
    D_VMM_CHECK_PTR_RET(pOutBufInfo, ERR_VMM_NULL_PTR);

#ifdef HI_SMMU_SUPPORT
    Ret = VMM_Alloc_SMMU(pBufferName, BufSize, pOutBufInfo);
#else
    Ret = VMM_Alloc_MMZ(pBufferName, BufSize, pOutBufInfo);
#endif

    return Ret;
}

VOID VMM_Release_Adapt(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

#ifdef HI_SMMU_SUPPORT
    VMM_Release_SMMU(pBufInfo);
#else
    VMM_Release_MMZ(pBufInfo);
#endif

    return;
}

SINT32 VMM_Map_Adapt(UINT32 IsCached, VMM_BUFFER_S *pBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pBufInfo, ERR_VMM_NULL_PTR);

#ifdef HI_SMMU_SUPPORT
    Ret = VMM_Map_SMMU(IsCached, pBufInfo);
#else
    Ret = VMM_Map_MMZ(IsCached, pBufInfo);
#endif

    return Ret;
}

VOID VMM_Unmap_Adapt(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

#ifdef HI_SMMU_SUPPORT
    VMM_Unmap_SMMU(pBufInfo);
#else
    VMM_Unmap_MMZ(pBufInfo);
#endif

    return;
}

SINT32 VMM_AllocAndMap_Adapt(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo)
{
    SINT32 Ret = VMM_SUCCESS;

    D_VMM_CHECK_PTR_RET(pBufferName, ERR_VMM_NULL_PTR);
    D_VMM_CHECK_PTR_RET(pOutBufInfo, ERR_VMM_NULL_PTR);

#ifdef HI_SMMU_SUPPORT
    Ret = VMM_AllocAndMap_SMMU(pBufferName, BufSize, IsCached, pOutBufInfo);
#else
    Ret = VMM_AllocAndMap_MMZ(pBufferName, BufSize, IsCached, pOutBufInfo);
#endif

    return Ret;
}

VOID VMM_UnmapAndRelease_Adapt(VMM_BUFFER_S *pBufInfo)
{
    D_VMM_CHECK_PTR(pBufInfo);

#ifdef HI_SMMU_SUPPORT
    VMM_UnmapAndRelease_SMMU(pBufInfo);
#else
    VMM_UnmapAndRelease_MMZ(pBufInfo);
#endif

    return;
}


