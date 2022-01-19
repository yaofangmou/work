#include "hi_type.h"
#include <linux/wait.h>
#include <linux/sched.h>
#include <linux/semaphore.h>
#include <linux/spinlock.h>
#include <linux/fs.h>
#include <linux/mm.h>
#include <linux/rwlock.h>
#include "hi_drv_proc.h"
#include "hi_drv_mmz.h"
#include "hi_osal.h"
#include "hi_math.h"
#include "hi_common.h"
#include "hi_drv_log.h"
#include "hi_drv_mmz.h"
#include "hi_drv_video.h"
#include "drv_win_alg_osal.h"




/************************************************************************/
/* event operation                                                      */
/************************************************************************/
HI_S32 XDP_OSAL_InitEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32 InitVal2)
{
    pEvent->flag_1 = InitVal1;
    pEvent->flag_2 = InitVal2;
    init_waitqueue_head( &(pEvent->queue_head) );
    return OSAL_OK;
}

HI_S32 XDP_OSAL_GiveEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32 InitVal2)
{
    pEvent->flag_1 = InitVal1;
    pEvent->flag_2 = InitVal2;

    wake_up(&(pEvent->queue_head));
    return OSAL_OK;
}

HI_S32 XDP_OSAL_WaitEvent( OSAL_EVENT *pEvent, HI_S32 s32WaitTime )
{
    int l_ret;
    long unsigned int time;
    time = jiffies;
    l_ret = wait_event_timeout( pEvent->queue_head,
                                (pEvent->flag_1 != 0 || pEvent->flag_2 != 0),
                                s32WaitTime );
    if (l_ret == 0
        || pEvent->flag_2 == 1
        || l_ret < 0)
    {
        return OSAL_ERR;
    }
    else
    {
        return OSAL_OK;
    }
}

HI_S32 XDP_OSAL_ResetEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32
                             InitVal2)
{
    pEvent->flag_1 = InitVal1;
    pEvent->flag_2 = InitVal2;

    return OSAL_OK;
}

/************************************************************************/
/* spin lock operation                                                  */
/************************************************************************/
HI_S32 XDP_OSAL_InitSpin(XDP_OSAL_SPIN *pLock)
{
    spin_lock_init(&(pLock->spinlock));
    return HI_SUCCESS;
}

HI_S32 XDP_OSAL_DownSpin(XDP_OSAL_SPIN *pLock)
{
    unsigned long localflag;

    spin_lock_irqsave(&(pLock->spinlock), localflag);
    /* may more than one player access
    flags at the same time. */
    pLock->flags = localflag;
    return HI_SUCCESS;
}

HI_S32 XDP_OSAL_UpSpin(XDP_OSAL_SPIN *pLock)
{
    spin_unlock_irqrestore(&(pLock->spinlock), pLock->flags);

    return HI_SUCCESS;
}

/************************************************************************/
/* memory smmu,mmz operation                                                  */
/************************************************************************/
#ifndef HI_SMMU_SUPPORT
#define HI_DRV_SMMU_Alloc(fmt...) HI_FAILURE
#define HI_DRV_SMMU_Release(fmt...) HI_FAILURE
#define HI_DRV_SMMU_Map(fmt...) HI_FAILURE
#define HI_DRV_SMMU_Unmap(fmt...) HI_FAILURE
#endif

HI_S32 XDP_OSAL_AllocateMem(hiXDP_OSAL_MEM_S *pstAddr)
{
    HI_S32 s32Ret = HI_FAILURE;


    XDP_NULL_CHECK_RET(pstAddr);
    if (0x0 == pstAddr->u32Size)
    {
        XDP_ERROR("XDP_OSAL_AllocateMem fail! name %s size %d bsmmu %d bsecure %d size %d\n",
                  pstAddr->aName,
                  pstAddr->u32Size,
                  pstAddr->bSmmu,
                  pstAddr->bSecure, pstAddr->u32Size);
        return HI_FAILURE;
    }
    pstAddr->aName[XDP_MEM_NAME_LEN_MAX - 1] = '\0';

    if (HI_FALSE == XDP_IS_SECURE_MEM(pstAddr))
    {
        if (HI_TRUE == XDP_IS_SMMU_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU;

            s32Ret = HI_DRV_SMMU_Alloc( pstAddr->aName,
                                        pstAddr->u32Size, VDP_MEM_ALIGN, &stMMU);
            if (s32Ret == HI_SUCCESS)
            {
                pstAddr->u32Size = stMMU.u32Size;
                pstAddr->u32PhyAddr = stMMU.u32StartSmmuAddr;
                pstAddr->pu8VirAddr = stMMU.pu8StartVirAddr;

                if (HI_TRUE == pstAddr->bMap)
                {
                    s32Ret = XDP_OSAL_MEMMap(pstAddr);
                }
            }
        }
        else
        {
            MMZ_BUFFER_S stMMZ;

            s32Ret = HI_DRV_MMZ_Alloc( pstAddr->aName, HI_NULL,
                                       pstAddr->u32Size, 0, &stMMZ);
            if (s32Ret == HI_SUCCESS)
            {
                pstAddr->u32Size = stMMZ.u32Size;
                pstAddr->u32PhyAddr = stMMZ.u32StartPhyAddr;
                pstAddr->pu8VirAddr = stMMZ.pu8StartVirAddr;

                if (HI_TRUE == pstAddr->bMap)
                {
                    s32Ret = XDP_OSAL_MEMMap(pstAddr);
                }
            }

        }
    }
    else
    {
        if (XDP_IS_SECURE_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU;

            s32Ret = HI_DRV_SECSMMU_Alloc(pstAddr->aName, pstAddr->u32Size, 16, &stMMU);
            if (s32Ret == HI_SUCCESS)
            {
                pstAddr->u32PhyAddr = stMMU.u32StartSmmuAddr;
                pstAddr->pu8VirAddr = HI_NULL;
            }
        }
        else
        {
            MMZ_BUFFER_S stMMZ;

            s32Ret = HI_DRV_MMZ_Alloc( pstAddr->aName, HI_NULL,
                                       pstAddr->u32Size, 0, &stMMZ);
            if (s32Ret == HI_SUCCESS)
            {
                pstAddr->u32Size = stMMZ.u32Size;
                pstAddr->u32PhyAddr = stMMZ.u32StartPhyAddr;
                pstAddr->pu8VirAddr = stMMZ.pu8StartVirAddr;

                if (HI_TRUE == pstAddr->bMap)
                {
                    s32Ret = XDP_OSAL_MEMMap(pstAddr);
                }
            }
        }
    }

    if (HI_SUCCESS != s32Ret)
    {
        XDP_ERROR("XDP_OSAL_AllocateMem fail! name %s size %d bsmmu %d bsecure %d size %d\n",
                  pstAddr->aName,
                  pstAddr->u32Size,
                  pstAddr->bSmmu,
                  pstAddr->bSecure, pstAddr->u32Size);
    }
    else
    {
        XDP_INFO("alloc mem %s addr %#x vir %p bmap %d bsmmu %d bsec %d size %d\n",
                 pstAddr->aName, pstAddr->u32PhyAddr, pstAddr->pu8VirAddr, pstAddr->bMap, pstAddr->bSmmu,
                 pstAddr->bSecure, pstAddr->u32Size);
    }

    pstAddr->aName[XDP_MEM_NAME_LEN_MAX - 1] = '\0';

    return s32Ret;
}
HI_S32 XDP_OSAL_FreeMem(hiXDP_OSAL_MEM_S *pstAddr)
{
    HI_S32 s32Ret = HI_SUCCESS;

    XDP_NULL_CHECK_RET(pstAddr);

    XDP_INFO("free mem %s addr %#x vir %p bmap %d bsmmu %d bsec %d size %d\n",
             pstAddr->aName, pstAddr->u32PhyAddr, pstAddr->pu8VirAddr, pstAddr->bMap, pstAddr->bSmmu,
             pstAddr->bSecure, pstAddr->u32Size);

    if (0x0 == pstAddr->u32PhyAddr)
    {
        return HI_SUCCESS;
    }

    if (HI_FALSE == XDP_IS_SECURE_MEM(pstAddr))
    {
        if (HI_TRUE == XDP_IS_SMMU_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU;

            if (HI_TRUE == pstAddr->bMap)
            {
                s32Ret = XDP_OSAL_MEMUnmap(pstAddr);
            }
            stMMU.u32StartSmmuAddr = pstAddr->u32PhyAddr;
            stMMU.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMU.u32Size = pstAddr->u32Size;

            s32Ret = HI_DRV_SMMU_Release(&stMMU);
        }
        else
        {
            MMZ_BUFFER_S stMMZ;

            if (HI_TRUE == pstAddr->bMap)
            {
                s32Ret = XDP_OSAL_MEMUnmap(pstAddr);
            }
            stMMZ.u32StartPhyAddr = pstAddr->u32PhyAddr;
            stMMZ.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMZ.u32Size = pstAddr->u32Size;
            HI_DRV_MMZ_Release(&stMMZ);
        }
    }
    else
    {
        if (HI_TRUE == XDP_IS_SMMU_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU;
            if (HI_TRUE == pstAddr->bMap)
            {
                s32Ret = XDP_OSAL_MEMUnmap(pstAddr);
            }

            stMMU.u32StartSmmuAddr = pstAddr->u32PhyAddr;
            stMMU.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMU.u32Size = pstAddr->u32Size;

            s32Ret = HI_DRV_SECSMMU_Release(&stMMU);
        }
        else
        {
            MMZ_BUFFER_S stMMZ;

            if (HI_TRUE == pstAddr->bMap)
            {
                s32Ret = XDP_OSAL_MEMUnmap(pstAddr);
            }

            stMMZ.u32StartPhyAddr = pstAddr->u32PhyAddr;
            stMMZ.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMZ.u32Size = pstAddr->u32Size;
            HI_DRV_MMZ_Release(&stMMZ);
        }
    }

    return s32Ret;
}


HI_S32 XDP_OSAL_MEMMap(hiXDP_OSAL_MEM_S *pstAddr)
{
    HI_S32 s32Ret = HI_FAILURE;

    if (HI_FALSE == XDP_IS_SECURE_MEM(pstAddr))
    {
        if (HI_TRUE == XDP_IS_SMMU_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU = {0};

            stMMU.u32StartSmmuAddr = pstAddr->u32PhyAddr;
            s32Ret = HI_DRV_SMMU_Map(&stMMU);
            if (HI_SUCCESS == s32Ret)
            {
                pstAddr->pu8VirAddr = stMMU.pu8StartVirAddr;
            }
            else
            {
                pstAddr->pu8VirAddr = HI_NULL;
                XDP_ERROR("HI_DRV_SMMU_Map alloc failed\n");
            }
        }
        else
        {
            MMZ_BUFFER_S stMMZ = {0};

            stMMZ.u32StartPhyAddr = pstAddr->u32PhyAddr;
            s32Ret = HI_DRV_MMZ_Map(&stMMZ);

            if (HI_SUCCESS == s32Ret)
            {
                pstAddr->pu8VirAddr = stMMZ.pu8StartVirAddr;
            }
            else
            {
                pstAddr->pu8VirAddr = HI_NULL;
                XDP_ERROR("HI_DRV_MMZ_Map alloc failed\n");
            }
        }
    }
    else
    {
        XDP_ERROR("Can not map in secure mode!\n");
    }
    return s32Ret;
}

HI_S32 XDP_OSAL_MEMUnmap(hiXDP_OSAL_MEM_S *pstAddr)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (HI_FALSE == XDP_IS_SECURE_MEM(pstAddr))
    {
        if (HI_TRUE == XDP_IS_SMMU_MEM(pstAddr))
        {
            SMMU_BUFFER_S stMMU = {0};

            stMMU.u32StartSmmuAddr = pstAddr->u32PhyAddr;
            stMMU.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMU.u32Size         = pstAddr->u32Size;

            s32Ret = HI_DRV_SMMU_Unmap(&stMMU);
        }
        else
        {
            MMZ_BUFFER_S stMMZ = {0};

            stMMZ.u32StartPhyAddr = pstAddr->u32PhyAddr;
            stMMZ.pu8StartVirAddr = pstAddr->pu8VirAddr;
            stMMZ.u32Size = pstAddr->u32Size;
            HI_DRV_MMZ_Unmap(&stMMZ);
        }
    }
    else
    {
        XDP_ERROR("Can not unmap in secure mode!\n");
    }

    return s32Ret;
}
#if 0
HI_S32 VPSS_OSAL_ReAllocateMem(hiXDP_OSAL_MEM_S *pstSrcBuf, hiXDP_OSAL_MEM_S *pstDstBufInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if ((pstSrcBuf->u32Size > pstDstBufInfo->u32Size)
        || (pstSrcBuf->bSecure != pstDstBufInfo->bSecure))
    {
        XDP_ERROR("invalid buf info: cur-size %u, pre-size %u, new-Secure %d\n",
                  pstSrcBuf->u32Size,
                  pstDstBufInfo->u32Size,
                  pstSrcBuf->bSecure);
        return HI_FAILURE;
    }
    XDP_INFO("buf  size %d to %d\n", pstSrcBuf->u32Size, pstDstBufInfo->u32Size);
    s32Ret = XDP_OSAL_FreeMem(pstSrcBuf);
    if (HI_SUCCESS == s32Ret)
    {
        pstSrcBuf->u32Size = pstDstBufInfo->u32Size;
        pstSrcBuf->bSmmu = pstDstBufInfo->bSmmu;
        pstSrcBuf->bSecure = pstDstBufInfo->bSecure;
        pstSrcBuf->bMap = pstDstBufInfo->bMap;
        strncpy(pstSrcBuf->aName, pstDstBufInfo->aName, XDP_MEM_NAME_LEN_MAX);
        s32Ret = XDP_OSAL_AllocateMem(pstSrcBuf);
        if (HI_SUCCESS != s32Ret)
        {
            XDP_ERROR("allocat %s fail!\n", pstSrcBuf->aName);
        }
    }
    else
    {
        XDP_ERROR("free buf %s fail!\n", pstSrcBuf->aName);
    }
    return s32Ret;
}
#endif

#ifdef XDP_SUPPORT_MEM_MAGIC

HI_U32 XDP_OSAL_MemGetMagicSize(hiXDP_OSAL_MEM_S *pstBuf)
{
    (HI_VOID)pstBuf;

    return OSAL_MEM_MAGIC_SIZE; //4bytes reserverd for magic
}

HI_S32 XDP_OSAL_MemAddMagic(hiXDP_OSAL_MEM_S *pstBuf, HI_U32 u32Magic)
{
    HI_BOOL bReMap = HI_FALSE;
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 *pMagic = HI_NULL;

    XDP_NULL_CHECK_RET(pstBuf);

    if (HI_FALSE == pstBuf->bMap)
    {
        s32Ret = XDP_OSAL_MEMMap(pstBuf);
        XDP_RET_CHECK_RET(s32Ret);
        bReMap = HI_TRUE;
    }

    pMagic = (HI_U32 *)((HI_U32)pstBuf->pu8VirAddr + (pstBuf->u32Size - XDP_OSAL_MemGetMagicSize(pstBuf)));

    if (HI_NULL == pMagic)
    {
        if (HI_TRUE == bReMap)
        {
            XDP_OSAL_MEMUnmap(pstBuf);
            bReMap = HI_FALSE;
        }
    }
    XDP_NULL_CHECK_RET(pMagic);

    *pMagic = u32Magic;
     pstBuf->u32Magic = u32Magic;

    if (HI_TRUE == bReMap)
    {
        s32Ret = XDP_OSAL_MEMUnmap(pstBuf);
        bReMap = HI_FALSE;
        XDP_RET_CHECK_RET(s32Ret);
    }

    return HI_SUCCESS;
}

HI_S32 XDP_OSAL_MemCheckMagic(hiXDP_OSAL_MEM_S *pstBuf)
{
    HI_BOOL bReMap = HI_FALSE;
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 *pMagic = HI_NULL;
    HI_U32 u32CurMagic = ~OSAL_MEM_MAGIC_NO;

    XDP_NULL_CHECK_RET(pstBuf);

    if (HI_FALSE == pstBuf->bMap)
    {
        s32Ret = XDP_OSAL_MEMMap(pstBuf);
        XDP_RET_CHECK_RET(s32Ret);
        bReMap = HI_TRUE;
    }

    pMagic = (HI_U32 *)((HI_U32)pstBuf->pu8VirAddr + (pstBuf->u32Size - XDP_OSAL_MemGetMagicSize(pstBuf)));

    if (HI_NULL == pMagic)
    {
        if (HI_TRUE == bReMap)
        {
            XDP_OSAL_MEMUnmap(pstBuf);
            bReMap = HI_FALSE;
        }
    }
    XDP_NULL_CHECK_RET(pMagic);

    u32CurMagic = *pMagic;
    if (u32CurMagic != pstBuf->u32Magic)
    {
        XDP_ERROR("Magic check fail, name %s exp %#08x cur %#08x\n", pstBuf->aName, pstBuf->u32Magic, u32CurMagic);
        if (HI_TRUE == bReMap)
        {
            s32Ret = XDP_OSAL_MEMUnmap(pstBuf);
            bReMap = HI_FALSE;
            XDP_RET_CHECK_RET(s32Ret);
        }
        return HI_FAILURE;
    }
    else
    {
//        HI_PRINT("Magic check success! name %s\n", pstBuf->aName);
    }

    if (HI_TRUE == bReMap)
    {
        s32Ret = XDP_OSAL_MEMUnmap(pstBuf);
        bReMap = HI_FALSE;
        XDP_RET_CHECK_RET(s32Ret);
    }

    return HI_SUCCESS;
}
#endif


#ifdef XDP_SUPPORT_ALG_STAT
HI_U64 XDP_OSAL_GetTimeUS(void)
{
    struct timeval stTime;
    do_gettimeofday(&stTime);
    return  ((stTime.tv_sec * 1000000LLU) + stTime.tv_usec);
}
#endif

static HI_U32 g_u32OsalYBlock[4][16] = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
    {4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11},
    {8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7},
    {12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3}
};

static HI_U32 g_u32OsalCBlock[4][8]  = {{0, 1, 2, 3, 4, 5, 6, 7},
    {4, 5, 6, 7, 0, 1, 2, 3},
    {0, 1, 2, 3, 4, 5, 6, 7},
    {4, 5, 6, 7, 0, 1, 2, 3}
};

HI_S32 XDP_OSAL_GetTileYvalue(HI_DRV_PIXEL_BITWIDTH_E enImgPixWidth,
                               HI_U32 u32Posx, HI_U32 u32Posy,
                               HI_U8 *pu8TileY, HI_U32 u32TileYStrd,
                               HI_U8 *pu8TileY2Bit, HI_U32 u32Tile2BitYStrd,
                               HI_U8 *pu8Yvalue)
{
#define TILE_YW  (64)
#define TILE_YH  (16)

    HI_U8 *pu8MapAddr = NULL;
    HI_U32 u32BitShiftNum = 0;
    HI_U8 u8YvalueTmp = 0;

    XDP_NULL_CHECK_RET(pu8TileY);
    XDP_NULL_CHECK_RET(pu8Yvalue);
    if (enImgPixWidth == HI_DRV_PIXEL_BITWIDTH_10BIT)
    {
        XDP_NULL_CHECK_RET(pu8TileY2Bit);
    }

    if (enImgPixWidth == HI_DRV_PIXEL_BITWIDTH_8BIT)
    {
        u32BitShiftNum = 0;
    }
    else
    {
        XDP_ERROR("Do not support bitwidth format %d\n", enImgPixWidth);
        return HI_FAILURE;
    }

    pu8MapAddr = pu8TileY
                 + (u32Posy / TILE_YH) * (u32TileYStrd * TILE_YH)
                 + (u32Posx / TILE_YW) * (TILE_YW * TILE_YH)
                 + (g_u32OsalYBlock[(u32Posx % (TILE_YW * 4)) / TILE_YW][u32Posy % TILE_YH]) * TILE_YW
                 + (u32Posx % TILE_YW);

    u8YvalueTmp = (*(pu8MapAddr)) << u32BitShiftNum;
    *pu8Yvalue = u8YvalueTmp;

#undef TILE_YW
#undef TILE_YH
    return HI_SUCCESS;
}

HI_S32 XDP_OSAL_Tile2Linear(HI_U32 u32Width, HI_U32 u32Height,
                            HI_DRV_PIXEL_BITWIDTH_E enBitWidth,
                            HI_U8 *pu8TileAddrY, HI_U8 *pu8TileAddrC, HI_U32 u32TilePixelStride,
                            HI_U8 *pu8LinearPixel, HI_U32 u32LineraPixelStride)
{
#define TILE_YW  (64)
#define TILE_YH  (16)
#define TILE_CW  TILE_YW
#define TILE_CH  (TILE_YH/2)

    HI_U8 *pu8MapAddr = NULL;
    HI_U32 u32BitShiftNum = 0;
    HI_U32 u32Offset = 0;
    HI_U32 u32CDataOffset = 0;
    HI_U32 u32Posy, u32Posx;

    XDP_NULL_CHECK_RET(pu8TileAddrY);
    XDP_NULL_CHECK_RET(pu8LinearPixel);

    if ((enBitWidth == HI_DRV_PIXEL_BITWIDTH_8BIT) || (enBitWidth == HI_DRV_PIXEL_BITWIDTH_10BIT))
    {
        u32BitShiftNum = 0;
    }
    else
    {
        XDP_ERROR("Do not support bitwidth format %d\n", enBitWidth);
        return HI_FAILURE;
    }

    for (u32Posy = 0; u32Posy < u32Height; u32Posy++)
    {
        for (u32Posx = 0; u32Posx < u32Width; u32Posx += 64)
        {

            u32Offset =  (u32Posy / TILE_YH) * (u32TilePixelStride * TILE_YH)
                         + (u32Posx / TILE_YW) * (TILE_YW * TILE_YH)
                         + (g_u32OsalYBlock[(u32Posx % (TILE_YW * 4)) / TILE_YW][u32Posy % TILE_YH]) * TILE_YW
                         + (u32Posx % TILE_YW);
            pu8MapAddr = pu8TileAddrY + u32Offset;
            memcpy(pu8LinearPixel + u32Posy * u32LineraPixelStride + u32Posx, pu8MapAddr, 64);
        }
    }

    u32CDataOffset = u32Height * u32LineraPixelStride;
    pu8LinearPixel += u32CDataOffset;

    for (u32Posy = 0; u32Posy < u32Height / 2; u32Posy++)
    {
        for (u32Posx = 0; u32Posx < u32Width; u32Posx += 64)
        {
            u32Offset = (u32Posy / TILE_CH) * (u32TilePixelStride * TILE_CH)
                        + (u32Posx / TILE_CW) * (TILE_CW * TILE_CH)
                        + (g_u32OsalCBlock[(u32Posx % (TILE_CW * 4)) / TILE_CW][u32Posy % TILE_CH]) * TILE_CW
                        + (u32Posx % TILE_CW);
            pu8MapAddr = pu8TileAddrC + u32Offset;
            memcpy(pu8LinearPixel +  u32Posy * u32LineraPixelStride + u32Posx, pu8MapAddr, 64);
        }
    }


#undef TILE_YW
#undef TILE_YH
#undef TILE_CW
#undef TILE_CH

    return HI_SUCCESS;
}

