/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name       : drv_hifb_dmabuf.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                      Author                  Modification
2018/01/01                 sdk                    Created file
**************************************************************************************************/
#ifdef CONFIG_DMA_SHARED_BUFFER

/*********************************add include here************************************************/
#include <linux/version.h>
#include <linux/dma-buf.h>
#include <linux/highmem.h>
#include <linux/memblock.h>
#include <linux/slab.h>

#include "hi_gfx_comm_k.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_debug.h"

/***************************** Macro Definition **************************************************/

/*************************** Structure Definition ************************************************/
struct hifb_memblock_pdata{
    phys_addr_t phys_base;
    unsigned long size;
    struct device *dev;
    enum dma_data_direction direction;
    struct sg_table *pfbtable;
};

/********************** Global Variable declaration **********************************************/

/******************************* API declaration *************************************************/
static struct sg_table *hifb_memblock_map(struct dma_buf_attachment *attach, enum dma_data_direction direction)
{
    HI_S32 Ret = 0;
    struct hifb_memblock_pdata *pfbdata = NULL;
    unsigned long pfbfn = 0;
    struct page *pfbage = NULL;
    struct sg_table *pfbtable = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(attach, NULL);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(attach->dmabuf, NULL);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(attach->dmabuf->priv, NULL);

    pfbdata = attach->dmabuf->priv;
    pfbfn   = PFN_DOWN(pfbdata->phys_base);
    pfbage  = pfn_to_page(pfbfn);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pfbage, NULL);

    if (NULL != pfbdata->pfbtable)
    {
        if ((pfbdata->dev == attach->dev) && (pfbdata->direction == direction))
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            /* it has been map before, return directly */
            return pfbdata->pfbtable;
        }
        else
        {
            /* need to remap, so free the reserved map pointer */
            dma_unmap_sg(pfbdata->dev, pfbdata->pfbtable->sgl, 1, pfbdata->direction);
            sg_free_table(pfbdata->pfbtable);
            HI_GFX_KFREE(HIGFX_FB_ID,pfbdata->pfbtable);
            pfbdata->pfbtable = NULL;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
    }

    pfbtable = HI_GFX_KZALLOC(HIGFX_FB_ID, sizeof(*pfbtable), GFP_KERNEL);
    if (!pfbtable)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_KZALLOC, FAILURE_TAG);
        return ERR_PTR(-ENOMEM);
    }

    Ret = sg_alloc_table(pfbtable, 1, GFP_KERNEL);
    if (Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, sg_alloc_table, Ret);
        goto err;
    }

    sg_set_page(pfbtable->sgl, pfbage, attach->dmabuf->size, 0);
    dma_map_sg(attach->dev, pfbtable->sgl, 1, direction);

    /* save the map condition and table pointer */
    pfbdata->pfbtable = pfbtable;
    pfbdata->dev = attach->dev;
    pfbdata->direction = direction;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return pfbtable;

err:
    HI_GFX_KFREE(HIGFX_FB_ID,pfbtable);
    return ERR_PTR(Ret);
}

static void hifb_memblock_unmap(struct dma_buf_attachment *attach, struct sg_table *pfbtable, enum dma_data_direction direction)
{
    HI_UNUSED(attach);
    HI_UNUSED(direction);
    HI_UNUSED(pfbtable);
    /* it will be unmap in release function */
    return;
}

static void __init_memblock hifb_memblock_release(struct dma_buf *buf)
{
    struct hifb_memblock_pdata *pfbdata = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(buf);
    pfbdata = buf->priv;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pfbdata);

    /* unmap the memory if mapped before */
    if (NULL != pfbdata->pfbtable)
    {
        dma_unmap_sg(pfbdata->dev, pfbdata->pfbtable->sgl, 1, pfbdata->direction);
        sg_free_table(pfbdata->pfbtable);
        HI_GFX_KFREE(HIGFX_FB_ID, pfbdata->pfbtable);
        pfbdata->pfbtable = NULL;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_KFREE(HIGFX_FB_ID, pfbdata);
    buf->priv = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static void *hifb_memblock_do_kmap(struct dma_buf *buf, unsigned long pgoffset, bool atomic)
{
    struct hifb_memblock_pdata *pfbdata = NULL;
    unsigned long pfbfn = 0;
    struct page *pfbage = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(buf, NULL);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(buf->priv, NULL);
    pfbdata = buf->priv;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(pgoffset, pfbdata->size, NULL);

    pfbfn = PFN_DOWN(pfbdata->phys_base) + pgoffset;
    pfbage = pfn_to_page(pfbfn);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pfbage, NULL);

    if (atomic)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return kmap_atomic(pfbage);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return kmap(pfbage);
}

static void *hifb_memblock_kmap_atomic(struct dma_buf *buf,unsigned long pgoffset)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return hifb_memblock_do_kmap(buf, pgoffset, true);
}

static void hifb_memblock_kunmap_atomic(struct dma_buf *buf,unsigned long pgoffset, void *vaddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_UNUSED(buf);
    HI_UNUSED(pgoffset);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(vaddr);
    kunmap_atomic(vaddr);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static void *hifb_memblock_kmap(struct dma_buf *buf, unsigned long pgoffset)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return hifb_memblock_do_kmap(buf, pgoffset, false);
}

static void hifb_memblock_kunmap(struct dma_buf *buf, unsigned long pgoffset,void *vaddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_UNUSED(buf);
    HI_UNUSED(pgoffset);

    if (NULL != vaddr)
    {
        kunmap(vaddr);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline int hifb_valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return (pfn + (size >> PAGE_SHIFT)) <= (1 + (PHYS_MASK >> PAGE_SHIFT));
}

static int hifb_memblock_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
{
    HI_U32 Size = 0;
    struct hifb_memblock_pdata *pfbdata = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(buf, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(vma, HI_FAILURE);
    pfbdata = buf->priv;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pfbdata, HI_FAILURE);

    if (0 == pfbdata->phys_base)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pfbdata->phys_base);
        return -1;
    }

    Size = vma->vm_end - vma->vm_start;
    if ((0 == Size) || (Size > pfbdata->size))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Size);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_ULONG, pfbdata->size);
        return -1;
    }

    if (!hifb_valid_mmap_phys_addr_range(vma->vm_pgoff, Size))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, hifb_valid_mmap_phys_addr_range, FAILURE_TAG);
        return -1;
    }

    vma->vm_page_prot =  pgprot_writecombine(vma->vm_page_prot);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return remap_pfn_range(vma, vma->vm_start, PFN_DOWN(pfbdata->phys_base) + vma->vm_pgoff, Size, vma->vm_page_prot);
}


struct dma_buf_ops hifb_memblock_ops = {
    .map_dma_buf     = hifb_memblock_map,
    .unmap_dma_buf   = hifb_memblock_unmap,
    .release         = hifb_memblock_release,
    .kmap_atomic     = hifb_memblock_kmap_atomic,
    .kunmap_atomic   = hifb_memblock_kunmap_atomic,
    .kmap            = hifb_memblock_kmap,
    .kunmap          = hifb_memblock_kunmap,
    .mmap            = hifb_memblock_mmap,
};

struct dma_buf *DRV_HIFB_DMABUF_MemBlockExport(phys_addr_t phys_base, size_t size, int flags)
{
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0))
    struct dma_buf_export_info stExportInfo;
#endif
    struct dma_buf *pfbbuf = NULL;
    struct hifb_memblock_pdata *pfbdata = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (PAGE_ALIGN(phys_base) != phys_base || PAGE_ALIGN(size) != size)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, phys_base);
        return ERR_PTR(-EINVAL);
    }

    pfbdata = HI_GFX_KZALLOC(HIGFX_FB_ID,sizeof(struct hifb_memblock_pdata), GFP_KERNEL);
    if (NULL == pfbdata)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_KZALLOC, FAILURE_TAG);
        return ERR_PTR(-ENOMEM);
    }

    pfbdata->phys_base = phys_base;
    pfbdata->size      = size;

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0))
    stExportInfo.priv  = pfbdata;
    stExportInfo.ops   = &hifb_memblock_ops;
    stExportInfo.size  = size;
    stExportInfo.flags = flags;
    stExportInfo.resv  = NULL;
    stExportInfo.owner = NULL;
    stExportInfo.exp_name = NULL;
    pfbbuf = dma_buf_export(&stExportInfo);
#else
    pfbbuf = dma_buf_export(pfbdata, &hifb_memblock_ops, size, flags, NULL);
#endif
    if (IS_ERR(pfbbuf))
    {
        HI_GFX_KFREE(HIGFX_FB_ID,pfbdata);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pfbbuf);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return pfbbuf;
}
#endif
