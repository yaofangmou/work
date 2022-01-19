#include "vmm.h"
#include "vmm_osal.h"
#include "vmm_memory_common.h"

#ifdef OPS_PRESERVE_SUPPORT
#include "vmm_memory_preserve.h"
#include "sysconfig.h"
#include "vdm_hal.h"
#endif

typedef struct
{
    UINT8           IsUsed                : 1   ; /* [0]  */
    UINT8           Reserved              : 7   ; /* [7..1]  */
} NodeRec;

typedef SINT32(*PFN_GET_MEMINFO)(SINT32 ChanID, VOID *pstMemInfo);

typedef struct
{
#ifdef VFMW_BACK_TUNNEL_SUPPORT
    VMM_BUFFER_S BackTunnelMemPool;
    NodeRec      *pBackTunnelRec;
    UINT32       NodeNum;
    UINT32       NextStartId;
#endif

    PFN_GET_MEMINFO  pFuncGetMemInfo;
} VMM_CUSTOM_GLOBAL_S;


#ifndef CHIP_SUPPORT_HD_WIDTH
#define CHIP_SUPPORT_HD_WIDTH         (1920)
#endif
#ifndef CHIP_SUPPORT_HD_HEIGHT
#define CHIP_SUPPORT_HD_HEIGHT        (1088)
#endif
#ifndef HI_VIDEO_MAX_REF_FRAME_NUM
#define HI_VIDEO_MAX_REF_FRAME_NUM    (6)
#endif
#ifndef HI_VIDEO_MAX_DISP_FRAME_NUM
#define HI_VIDEO_MAX_DISP_FRAME_NUM   (3)
#endif
#ifndef HI_VIDEO_EXTRA_PVR_FRAME_NUM
#define HI_VIDEO_EXTRA_PVR_FRAME_NUM  (0)
#endif
#ifndef HI_VDEC_MAX_INSTANCE
#define HI_VDEC_MAX_INSTANCE          (8)
#endif

#define MMZ_ALIGN_SIZE                (4096)
#define BACK_TUNNEL_NODE_SIZE         (32)

#define MAX_WIDTH               (CHIP_SUPPORT_HD_WIDTH)
#define MAX_HEIGHT              (CHIP_SUPPORT_HD_HEIGHT)
#define MAX_REF_FRM_NUM         (HI_VIDEO_MAX_REF_FRAME_NUM)
#define MAX_EXT_FRM_NUM         (HI_VIDEO_MAX_DISP_FRAME_NUM)
#define EXTRA_PVR_FRM_NUM       (HI_VIDEO_EXTRA_PVR_FRAME_NUM)

#define BACKTUNNEL_MEMORY_NAME  "VDEC_BackTunlBuf"

#define D_MAX(a, b)   ((a) > (b) ? (a) : (b))
#define ALIGN_UP(x,a) (((x)+(a)-1)&~((a)-1))

VMM_PRIVATE VMM_CUSTOM_GLOBAL_S g_CustomCtx;

#ifdef OPS_PRESERVE_SUPPORT
extern MEM_PRE_ALLOCATION_CTX g_PreMemCtx;

VMM_PRIVATE VOID RecordReservedBuf(VMM_BUFFER_S *pReservedBufInfo)
{
    VMM_BUFFER_S *pGlobalMemPool = &g_PreMemCtx.MemPool;

    pReservedBufInfo->StartPhyAddr = pGlobalMemPool->StartPhyAddr;
    if (pGlobalMemPool->Map)
    {
        pReservedBufInfo->pStartVirAddr = pGlobalMemPool->pStartVirAddr;
    }

    return;
}


VMM_PRIVATE VOID UpdateFreezeSize(SINT32 IsFreeze, UINT32 Size)
{
    if (IsFreeze)
    {
        g_PreMemCtx.FreezeSize += Size;
    }
    else
    {
        if (g_PreMemCtx.FreezeSize != 0)
        {
            g_PreMemCtx.FreezeSize -= Size;
        }
    }
}

VMM_PRIVATE SINT32 ConfigReservedSize(UINT32 Size)
{
    VMM_BUFFER_S *pReservedBufInfo;

    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);
    D_VMM_ASSERT_RET(Size <= g_PreMemCtx.MemPool.Size, MEM_PRESERVE_NOT_ENOUGH);

    pReservedBufInfo = &g_PreMemCtx.ReservedBufInfo;

    if (Size == 0)
    {
        if (g_PreMemCtx.ReservedBufValid && (g_PreMemCtx.ReservedBufOutSide == 0))
        {
            UpdateFreezeSize(VMM_FALSE, pReservedBufInfo->Size);

            OSAL_FP_memset(pReservedBufInfo, 0, sizeof(VMM_BUFFER_S));

            g_PreMemCtx.ReservedBufValid = 0;
        }
    }
    else
    {
        if (!g_PreMemCtx.ReservedBufValid)
        {
            pReservedBufInfo->Size = Size;
            RecordReservedBuf(pReservedBufInfo);

            UpdateFreezeSize(VMM_TRUE, pReservedBufInfo->Size);

            g_PreMemCtx.ReservedBufValid = 1;
            g_PreMemCtx.ReservedBufOutSide = 0;
        }
        else if (Size != pReservedBufInfo->Size)
        {
            PRINT(VMM_ERROR, "%s,%d, Config new reserved size(%d) different with old one(%d) not support!!!\n",__func__,__LINE__,Size,g_PreMemCtx.ReservedBufInfo.Size);
        }
    }

    return VMM_SUCCESS;
}

VMM_PRIVATE VOID InitMemNeedParam(VID_STD_E eVidStd, UINT8 BitDepth, MEM_REQ_DESC_S *pMemReq, MEM_NEED_DESC_S *pMemNeed)
{
    OSAL_FP_memset(pMemReq, 0, sizeof(MEM_REQ_DESC_S));
    OSAL_FP_memset(pMemNeed, 0, sizeof(MEM_NEED_DESC_S));

    pMemReq->DecBitDepth  = BitDepth;
    pMemReq->DispBitDepth = BitDepth;
    pMemReq->eVidStd      = eVidStd;
    pMemReq->DecFsWidth   = MAX_WIDTH;
    pMemReq->DecFsHeight  = MAX_HEIGHT;
    pMemReq->DispFsWidth  = MAX_WIDTH;
    pMemReq->DispFsHeight = MAX_HEIGHT;
    pMemReq->ExpectDecNum = MAX_REF_FRM_NUM;
    pMemReq->ExpectPmvNum = MAX_REF_FRM_NUM + 1;

    /*Get Fs Num*/
    pMemNeed->stDecInfo.DecFsNum = MAX_REF_FRM_NUM + MAX_EXT_FRM_NUM + EXTRA_PVR_FRM_NUM;
    pMemNeed->NeedPmv = 1;
    pMemNeed->PmvNum = pMemReq->ExpectPmvNum;

    PRINT(VMM_DBG, "%s, %d, MAX_WIDTH(%d) MAX_HEIGHT(%d) MAX_REF_FRM_NUM(%d) MAX_EXT_FRM_NUM(%d)\n", __func__, __LINE__, MAX_WIDTH, MAX_HEIGHT, MAX_REF_FRM_NUM, MAX_EXT_FRM_NUM, EXTRA_PVR_FRM_NUM);

    return;
}

VMM_PRIVATE UINT32 CalcExtDeiBufSize(VOID)
{
    UINT32 ExtBufSize = 0;
    UINT32 YSize = 0;
    UINT32 CSize = 0;

    YSize = ((MAX_WIDTH+15)/16 * 16)* (MAX_HEIGHT/2*3 + 2);
    CSize = ((MAX_WIDTH/2*2+15)/16 * 16)* (MAX_HEIGHT/2/2*3 + 3);

    ExtBufSize = YSize + CSize + 4;

    ExtBufSize = (ExtBufSize + 15) / 16 * 16;  //vdh must 16 align

    return ExtBufSize;
}

/***************************************** External Function ******************************************/
UINT32 Custom_GetPreMemSize(VOID)
{
    UINT32 ExtSize = 0;
    UINT32 TargetSize, TotalH264, TotalH265;

    MEM_REQ_DESC_S  MemReq = {0};
    MEM_NEED_DESC_S MemNeed_H264_8Bit = {0};
    MEM_NEED_DESC_S MemNeed_H265_10Bit = {0};

    /*H264 8bit*/
    InitMemNeedParam(VFMW_H264, 8, &MemReq, &MemNeed_H264_8Bit);
    if (VDMDRV_DeriveMemSize(&MemReq, &MemNeed_H264_8Bit) != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s,%d, call VDMDRV_DeriveMemSize failed!\n", __func__, __LINE__);
        return 0;
    }

    /*H265 10bit*/
    InitMemNeedParam(VFMW_HEVC, 10, &MemReq, &MemNeed_H265_10Bit);
    if (VDMDRV_DeriveMemSize(&MemReq, &MemNeed_H265_10Bit) != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s,%d, call VDMDRV_DeriveMemSize failed!\n", __func__, __LINE__);
        return 0;
    }

    ExtSize = CalcExtDeiBufSize();//MemNeed_H264_8Bit.stDecInfo.DecFsSize * 3 / 2;        /*8bit 时 DEI 占 3 * 0.5 个帧存大小*/
    TotalH264 = MemNeed_H264_8Bit.stDecInfo.DecFsSize * MemNeed_H264_8Bit.stDecInfo.DecFsNum
                + MemNeed_H264_8Bit.PmvSize * MemNeed_H264_8Bit.PmvNum
                + ExtSize;

    TotalH265 = MemNeed_H265_10Bit.stDecInfo.DecFsSize * MemNeed_H265_10Bit.stDecInfo.DecFsNum
                + MemNeed_H265_10Bit.PmvSize * MemNeed_H265_10Bit.PmvNum;

    TargetSize = D_MAX(TotalH264, TotalH265);
    TargetSize = ALIGN_UP(TargetSize, MMZ_ALIGN_SIZE);

    PRINT(VMM_DBG, "\n%s,%d, PreMemSize = %d  (h264 8bit = %d, h265 10bit = %d)  alignSize = %d\n", __func__, __LINE__, TargetSize, TotalH264, TotalH265, MMZ_ALIGN_SIZE);
    PRINT(VMM_DBG, "%s,%d, H264==>DEI ExtSize = %d, DecFsSize = %d Num = %d; PmvSize = %d, Num = %d\n", __func__, __LINE__,
        ExtSize,MemNeed_H264_8Bit.stDecInfo.DecFsSize,MemNeed_H264_8Bit.stDecInfo.DecFsNum,
        MemNeed_H264_8Bit.PmvSize,MemNeed_H264_8Bit.PmvNum);
    PRINT(VMM_DBG, "%s,%d, H265==>                  DecFsSize = %d Num = %d; PmvSize = %d, Num = %d\n", __func__, __LINE__,
        MemNeed_H265_10Bit.stDecInfo.DecFsSize,MemNeed_H265_10Bit.stDecInfo.DecFsNum,
        MemNeed_H265_10Bit.PmvSize,MemNeed_H265_10Bit.PmvNum);

    return TargetSize;
}

SINT32 Custom_AllocMemPreProcess(VMM_NOTICE_PARAM_S *pNoticeParam)
{
    SINT32 Ret;
    UINT32 TotalNeedSize = 0;
    UINT32 TotalValidSize = 0;   /*except DEI reserve buffer size*/
    VFMW_DEI_MEM_INFO_S DeiMemInfo;

    D_VMM_ASSERT_RET(pNoticeParam != NULL, VMM_FAILURE);

    /*1. Call ExtIntf to get Dei MemSize*/
    OSAL_FP_memset(&DeiMemInfo, 0, sizeof(VFMW_DEI_MEM_INFO_S));
    DeiMemInfo.Width    = pNoticeParam->MemInfo.DecFsWidth;
    DeiMemInfo.Height   = pNoticeParam->MemInfo.DecFsHeight;
    DeiMemInfo.BitDepth = pNoticeParam->MemInfo.BitDepth;

    Ret = pNoticeParam->pExtIntf(pNoticeParam->ChanId, &DeiMemInfo);
    if (Ret != VMM_SUCCESS)
    {
        PRINT(VMM_ERROR, "%s call pExtIntf failed.\n", __func__);
        return VMM_FAILURE;
    }

    PRINT(VMM_DEI, "%s call pExtIntf success. DeiSize = %d\n", __func__, DeiMemInfo.DeiMemSize);

    /*2. Set VMM to Reserve Dei buffer*/
    Ret = ConfigReservedSize(DeiMemInfo.DeiMemSize);

    /*3. Check if total Need bufferSize larger than PreAlloc*/
    TotalNeedSize =  pNoticeParam->MemInfo.DecFsSize * pNoticeParam->MemInfo.ExpectDecFsNum
                   + pNoticeParam->MemInfo.PmvSize * pNoticeParam->MemInfo.ExpectPmvNum;
    TotalValidSize = g_PreMemCtx.MemPool.Size - DeiMemInfo.DeiMemSize;
    if (TotalNeedSize > TotalValidSize)
    {
        if (DeiMemInfo.DeiMemSize > CalcExtDeiBufSize())
        {
            PRINT(VMM_ALWS, "%s,%d, Error:VDP return Dei BufferSize(%d) larger than VFMW reserve(%d)!!!\n", __func__, __LINE__,DeiMemInfo.DeiMemSize,CalcExtDeiBufSize());
        }

        PRINT(VMM_ALWS, "\n%s Current NeedSize = %d, ValidSize = %d (DeiBufSize = %d)not enough!!!!!! Becareful!!\n", __func__,TotalNeedSize,TotalValidSize,DeiMemInfo.DeiMemSize);
        PRINT(VMM_ALWS, "%s Current config MaxW %d, MaxH %d MaxRefNum = %d, but now WxH = %dx%d, RefNum = %d, BitDepth = %d\n\n", __func__,
                       MAX_WIDTH, MAX_HEIGHT, MAX_REF_FRM_NUM, pNoticeParam->MemInfo.DecFsWidth, pNoticeParam->MemInfo.DecFsHeight,
                       pNoticeParam->MemInfo.ExpectDecFsNum - MAX_EXT_FRM_NUM - EXTRA_PVR_FRM_NUM, pNoticeParam->MemInfo.BitDepth);
    }

    return Ret;
}


SINT32 Custom_GetReservedBuf(VMM_BUFFER_S *pMemInfo)
{
    D_VMM_ASSERT_RET(g_PreMemCtx.ReservedBufValid == 1,MEM_PRESERVE_STATE_ABNORMAL);
    D_VMM_ASSERT_RET(g_PreMemCtx.ReservedBufInfo.Size == pMemInfo->Size, MEM_PRESERVE_INVALID_PARA);
    D_VMM_ASSERT_RET(g_PreMemCtx.FreezeSize == pMemInfo->Size, MEM_PRESERVE_NOT_ENOUGH);

    pMemInfo->MemType      = VMM_MEM_TYPE_EXT_RESERVE;
    pMemInfo->StartPhyAddr = g_PreMemCtx.ReservedBufInfo.StartPhyAddr;
    if (pMemInfo->Map)
    {
        pMemInfo->pStartVirAddr = g_PreMemCtx.ReservedBufInfo.pStartVirAddr;
    }

    UpdateFreezeSize(VMM_FALSE, pMemInfo->Size);

    g_PreMemCtx.ReservedBufOutSide = 1;

    PRINT(VMM_DEI, "%s Get DeiSize = %d\n", __func__, pMemInfo->Size);

    return VMM_SUCCESS;
}

SINT32 Custom_PutReservedBuf(VMM_BUFFER_S *pMemInfo)
{
    D_VMM_ASSERT_RET(g_PreMemCtx.IsInit == 1, MEM_PRESERVE_NOT_INIT);
    D_VMM_ASSERT_RET(g_PreMemCtx.IsAvailable == 1, MEM_PRESERVE_NOT_AVAILABLE);

    g_PreMemCtx.ReservedBufOutSide = 0;

    PRINT(VMM_DEI, "%s Put DeiSize = %d\n", __func__, pMemInfo->Size);

    return ConfigReservedSize(0);
}

SINT32 Custom_SupplementBufDetail(VMM_BUFFER_S *pBufInfo)
{
    SINT32 ChanID;
    VFMW_MEM_TYPE_E MemType;
    CHAN_MEM_INFO_S MemInfo;

    D_VMM_ASSERT_RET(pBufInfo != NULL, MEM_PRESERVE_INVALID_PARA);

    MemType = GET_MEM_ID_BY_UID((UINT64)pBufInfo->PrivID);

    if (MemType == VFMW_MEM_TYPE_PMV)
    {
        D_VMM_ASSERT_RET(g_CustomCtx.pFuncGetMemInfo != NULL, MEM_PRESERVE_STATE_ABNORMAL);

        ChanID = GET_CHAN_UID((UINT64)pBufInfo->PrivID);

        if (g_CustomCtx.pFuncGetMemInfo(ChanID, &MemInfo) != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s call g_pFuncGetMemInfo failed! Can't get PMV buffer Detail!(AlignSize & UnionNum)!\n", __func__);

            return MEM_PRESERVE_ALLOC_FAILED;
        }

        pBufInfo->AlignSize = MemInfo.DecFsSize;
        pBufInfo->UnionNum  = MemInfo.ExpectPmvNum;
    }
    else
    {
        pBufInfo->AlignSize = pBufInfo->Size;
        pBufInfo->UnionNum  = 1;
    }

    return VMM_SUCCESS;
}
#endif

#ifdef VFMW_BACK_TUNNEL_SUPPORT
VMM_PRIVATE UINT32 GetBackTunnelMemSize(VOID)
{
    UINT32 TargetSize;
    UINT32 MaxFrameNum;

    MaxFrameNum = MAX_REF_FRM_NUM + MAX_EXT_FRM_NUM + EXTRA_PVR_FRM_NUM;

    TargetSize = BACK_TUNNEL_NODE_SIZE * MaxFrameNum * HI_VDEC_MAX_INSTANCE;

    TargetSize = ALIGN_UP(TargetSize, MMZ_ALIGN_SIZE);

    return TargetSize;
}

VMM_PRIVATE SINT32 AllocAndMapBackTunlBuf(VOID)
{
    SINT32 Ret = VMM_SUCCESS;
    UINT32 BackTunnelBufSize = 0;
    VMM_BUFFER_S OutBufInfo;
    BackTunnelBufSize = GetBackTunnelMemSize();

    if (BackTunnelBufSize != 0)
    {
        Ret = VMM_AllocAndMap_Adapt(BACKTUNNEL_MEMORY_NAME, BackTunnelBufSize, 0, &OutBufInfo);
        if (Ret != VMM_SUCCESS)
        {
            PRINT(VMM_ALWS, "%s,%d, Alloc and Map BackTunnel global memory failed! size = %d(KB)\n", __func__, __LINE__, BackTunnelBufSize/1024);

            OSAL_FP_memset(&OutBufInfo, 0, sizeof(VMM_BUFFER_S));
        }
        else
        {
            if (MEM_AddMemRecord(OutBufInfo.StartPhyAddr, (VOID *)OutBufInfo.pStartVirAddr, OutBufInfo.Size) != VMM_SUCCESS)
            {
                PRINT(VMM_ERROR, "%s,%d, WARNING:MEM_AddMemRecord return Failed!\n", __func__, __LINE__);
            }
        }
    }
    else
    {
        PRINT(VMM_ERROR, "%s,%d, support BackTunnel, but BackTunnelMemSize = %d !\n", __func__, __LINE__, BackTunnelBufSize);

        OSAL_FP_memset(&OutBufInfo, 0, sizeof(VMM_BUFFER_S));
    }

    OSAL_FP_memcpy(&g_CustomCtx.BackTunnelMemPool, &OutBufInfo, sizeof(VMM_BUFFER_S));

    return Ret;
}

VMM_PRIVATE VOID UnmapAndReleaseBackTunlBuf(VOID)
{
    VMM_BUFFER_S *pBackTunnelBuf = &g_CustomCtx.BackTunnelMemPool;

    if (pBackTunnelBuf->StartPhyAddr != 0)
    {
       if (MEM_DelMemRecord(pBackTunnelBuf->StartPhyAddr, (VOID *)pBackTunnelBuf->pStartVirAddr, pBackTunnelBuf->Size) != VMM_SUCCESS)
       {
           PRINT(VMM_ERROR, "%s,%d, WARNING:MEM_DelMemRecord return Failed!\n", __func__, __LINE__);
       }

       VMM_UnmapAndRelease_Adapt(pBackTunnelBuf);

       OSAL_FP_memset(pBackTunnelBuf, 0, sizeof(VMM_BUFFER_S));
    }

    return;
}

VMM_PRIVATE SINT32 AllocBackTunlRec(VOID)
{
    SINT32 Ret = VMM_SUCCESS;
    SINT32 NodeNum;
    SINT32 Size;
    NodeRec *pBackTunlRec;
    VMM_BUFFER_S *pBackTunnelBuf = &g_CustomCtx.BackTunnelMemPool;

    if (pBackTunnelBuf->StartPhyAddr == 0 || pBackTunnelBuf->Size == 0)
    {
        PRINT(VMM_ERROR, "%s,%d, Error:g_BackTunnelMemPool invalid!\n", __func__, __LINE__);
        return VMM_FAILURE;
    }

    NodeNum = pBackTunnelBuf->Size / BACK_TUNNEL_NODE_SIZE;
    if (NodeNum == 0)
    {
        PRINT(VMM_ERROR, "%s,%d, Error:NodeNum = %d invalid! BufSize = %d, each NodeSize = %d\n", __func__, __LINE__,
            NodeNum, pBackTunnelBuf->Size, BACK_TUNNEL_NODE_SIZE);
        return VMM_FAILURE;
    }

    Size = sizeof(NodeRec) * NodeNum;
    pBackTunlRec = (NodeRec*)OSAL_FP_alloc_virmem(Size);
    if (!pBackTunlRec)
    {
        PRINT(VMM_ERROR, "%s,%d, Error: alloc BackTunlRec virMem failed! size = %d\n", __func__, __LINE__,sizeof(NodeRec) * NodeNum);
        return VMM_FAILURE;
    }

    //init Recoard
    OSAL_FP_memset(pBackTunlRec, 0, Size);

    g_CustomCtx.pBackTunnelRec = pBackTunlRec;
    g_CustomCtx.NodeNum        = NodeNum;
    g_CustomCtx.NextStartId    = 0;

    return Ret;
}

VMM_PRIVATE VOID ReleaseBackTunlRec(VOID)
{
    if (g_CustomCtx.pBackTunnelRec)
    {
        OSAL_FP_free_virmem(g_CustomCtx.pBackTunnelRec);

        g_CustomCtx.pBackTunnelRec = NULL;
        g_CustomCtx.NodeNum        = 0;
        g_CustomCtx.NextStartId    = 0;
    }

    return;
}

VMM_PRIVATE SINT32 InitBackTunlCtx(VOID)
{
    SINT32 Ret = VMM_SUCCESS;

    Ret = AllocAndMapBackTunlBuf();
    if (Ret != VMM_SUCCESS)
    {
        return Ret;
    }

    Ret = AllocBackTunlRec();
    if (Ret != VMM_SUCCESS)
    {
        UnmapAndReleaseBackTunlBuf();
    }

    return Ret;
}

VMM_PRIVATE VOID DeinitBackTunlCtx(VOID)
{
    ReleaseBackTunlRec();

    UnmapAndReleaseBackTunlBuf();

    return;
}
#endif

SINT32 Custom_GetBackTunlBuf(VMM_BUFFER_S *pBufInfo)
{
    SINT32 Ret = VMM_FAILURE;
#ifdef VFMW_BACK_TUNNEL_SUPPORT
    SINT8  Flag = 0;
    UINT32 i;
    UINT32 j;
    VMM_BUFFER_NODE_S *pBackTunlBuf;

    D_VMM_ASSERT_RET(pBufInfo != NULL, VMM_FAILURE);

    for (i = g_CustomCtx.NextStartId, j = 0; j < g_CustomCtx.NodeNum; i++,j++)
    {
        if (i >= g_CustomCtx.NodeNum)
        {
            i = 0;
        }

        if (g_CustomCtx.pBackTunnelRec[i].IsUsed == 0)
        {
            Flag = 1;
            g_CustomCtx.pBackTunnelRec[i].IsUsed = 1;
            g_CustomCtx.NextStartId = i + 1;

            break;
        }
    }

    if (Flag)
    {
        pBackTunlBuf = &pBufInfo->SupplementInfo.BackTunelBuf;
        OSAL_FP_memset(pBackTunlBuf, 0, sizeof(VMM_BUFFER_NODE_S));

        pBackTunlBuf->StartPhyAddr  = g_CustomCtx.BackTunnelMemPool.StartPhyAddr + i * BACK_TUNNEL_NODE_SIZE;
        pBackTunlBuf->pStartVirAddr = g_CustomCtx.BackTunnelMemPool.pStartVirAddr+ i * BACK_TUNNEL_NODE_SIZE;
        pBackTunlBuf->Size          = BACK_TUNNEL_NODE_SIZE;
        pBackTunlBuf->Map           = 1;

        OSAL_FP_snprintf(pBackTunlBuf->BufName, VMM_MAX_NAME_LEN, "%s_%d", BACKTUNNEL_MEMORY_NAME, i);
        pBackTunlBuf->BufName[sizeof(pBackTunlBuf->BufName) - 1] = '\0';

        Ret = VMM_SUCCESS;
    }
    else
    {
        PRINT(VMM_ERROR, "%s,%d, Error: Can't find valid BackTunnel Node! Node Num = %d\n", __func__, __LINE__, g_CustomCtx.NodeNum);
    }
#else
    PRINT(VMM_ERROR, "%s,%d, Error: Current Cfg not support BackTunnel!! Not define VFMW_BACK_TUNNEL_SUPPORT!\n", __func__, __LINE__);
#endif
    return Ret;
}

VOID  Custom_PutBackTunlBuf(VMM_BUFFER_S *pBufInfo)
{
#ifdef VFMW_BACK_TUNNEL_SUPPORT
    UINT32 Id;
    UINT32 Diff;
    VMM_BUFFER_NODE_S *pBackTunlBuf;

    D_VMM_ASSERT(pBufInfo != NULL);
    D_VMM_ASSERT(g_CustomCtx.BackTunnelMemPool.StartPhyAddr != 0);
    D_VMM_ASSERT(g_CustomCtx.BackTunnelMemPool.StartPhyAddr != 0xffffffff);

    pBackTunlBuf = &pBufInfo->SupplementInfo.BackTunelBuf;

    Diff = pBackTunlBuf->StartPhyAddr - g_CustomCtx.BackTunnelMemPool.StartPhyAddr;

    if (Diff % BACK_TUNNEL_NODE_SIZE)
    {
        PRINT(VMM_ERROR, "%s,%d, Error: Input BackTunnel Buf Phyaddr = 0x%x not align with %d\n", __func__, __LINE__,
            pBackTunlBuf->StartPhyAddr, BACK_TUNNEL_NODE_SIZE);

        return;
    }

    Id = Diff / BACK_TUNNEL_NODE_SIZE;
    D_VMM_ASSERT(g_CustomCtx.pBackTunnelRec[Id].IsUsed == 1);

    g_CustomCtx.pBackTunnelRec[Id].IsUsed = 0;
    g_CustomCtx.NextStartId = Id;
#endif

    return;
}

#if 0
ULONG Custom_GetReTunnelVirAddr(VMM_BUFFER_S *pBufInfo)
{
    ULONG  ReTunnelVirAddr = 0;
    SINT32 ChanID;
    VFMW_MEM_TYPE_E MemType;
    CHAN_MEM_INFO_S MemInfo;

    D_VMM_ASSERT_RET(pBufInfo != NULL, 0);

    MemType = GET_MEM_ID_BY_UID(pBufInfo->PrivID);

    if ((MemType == VFMW_MEM_TYPE_DEC || MemType == VFMW_MEM_TYPE_DISP) && (pBufInfo->Map))
    {
        D_VMM_ASSERT_RET(g_pFuncGetMemInfo != NULL, 0);

        ChanID = GET_CHAN_UID(pBufInfo->PrivID);

        if (g_pFuncGetMemInfo(ChanID, &MemInfo) != VMM_SUCCESS)
        {
            PRINT(VMM_ERROR, "%s call g_pFuncGetMemInfo failed! Can't get PMV buffer Detail!(AlignSize & UnionNum)!\n", __func__);

            return 0;
        }

        if (MemInfo.BackLineNumOffset != 0)
        {
            ReTunnelVirAddr = pBufInfo->pStartVirAddr + MemInfo.BackLineNumOffset;
        }
    }

    return ReTunnelVirAddr;

}
#endif

SINT32 Custom_Init(VOID *pArgs)
{
    SINT32 Ret = VMM_SUCCESS;

    VMM_CALL_FUN_PTR_S *pfCallback = (VMM_CALL_FUN_PTR_S*)pArgs;

    OSAL_FP_memset(&g_CustomCtx, 0, sizeof(VMM_CUSTOM_GLOBAL_S));

    if (!pfCallback)
    {
        PRINT(VMM_ERROR, "%s,%d, pfCallback = %p invalid!!\n", __func__, __LINE__, pfCallback);

        return VMM_FAILURE;
    }
    else
    {
        if (!pfCallback->pfun_Vmm_GetBufDetail)
        {
            PRINT(VMM_ERROR, "%s,%d, pfun_Vmm_GetBufDetail = %p invalid!!\n", __func__, __LINE__, pfCallback->pfun_Vmm_GetBufDetail);

            return VMM_FAILURE;
        }
    }

    g_CustomCtx.pFuncGetMemInfo = pfCallback->pfun_Vmm_GetBufDetail;

#ifdef VFMW_BACK_TUNNEL_SUPPORT
    Ret = InitBackTunlCtx();
    if (Ret != VMM_SUCCESS)
    {
        g_CustomCtx.pFuncGetMemInfo = NULL;
    }
#endif

    return Ret;
}

VOID Custom_Deinit(VOID)
{
#ifdef VFMW_BACK_TUNNEL_SUPPORT
    DeinitBackTunlCtx();
#endif

    g_CustomCtx.pFuncGetMemInfo = NULL;

    return;
}


