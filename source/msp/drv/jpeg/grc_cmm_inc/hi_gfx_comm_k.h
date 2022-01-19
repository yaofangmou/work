/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : hi_gfx_comm_k.h
Version          : version 2.0
Author           :
Created          : 2018/01/01
Description      : Describes adp file. CNcomment:������ƽ̨���� CNend\n
Function List    :

History          :
Date                 Author                Modification
2018/01/01           sdk
*************************************************************************************************/
#ifndef  _HI_GFX_COMM_K_H_
#define  _HI_GFX_COMM_K_H_

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif /* __cplusplus */
#endif  /* __cplusplus */

/***************************** SDK Version Macro Definition *************************************/

/*********************************add include here***********************************************/
#include "hi_type.h"
#include <linux/version.h>

#if defined(CONFIG_GFX_STB_SDK) || defined(CONFIG_GFX_ANDROID_SDK) || defined(CONFIG_GFX_TV_SDK)
    #include "hi_drv_module.h"

    #if   defined(CHIP_TYPE_hi3712)       \
       || defined(CHIP_TYPE_hi3716m)      \
       || defined(CHIP_TYPE_hi3716mv310)  \
       || defined(CHIP_TYPE_hi3110ev500)  \
       || defined(CHIP_TYPE_hi3716mv320)  \
       || defined(CHIP_TYPE_hi3716mv330)
        #include "drv_dev_ext.h"
    #else
        #include "hi_drv_dev.h"
    #endif

    #include "hi_drv_mmz.h"
    #include "hi_drv_mem.h"
    #include "hi_drv_proc.h"
    #include "hi_drv_sys.h"
    #include "hi_gfx_smmu.h"
#endif

/***************************** Macro Definition *************************************************/
//#define CONFIG_GFX_COMM_PM_DISABLE

#define HI_GFX_REG_MAP(base, size)        ioremap_nocache((base), (size))
#define HI_GFX_REG_UNMAP(base)            iounmap((HI_VOID*)(base))

/** ���嵽Makefile��Android Makefile�� **/
#ifdef CONFIG_GFX_256BYTE_ALIGN
#define GFX_MMZ_ALIGN_BYTES     256
#else
#define GFX_MMZ_ALIGN_BYTES     16
#endif

#define CONFIG_GFX_MAX_MEM_SIZE           (500 * 1024 * 1024)
#define CONFIG_GFX_MIN_MEM_SIZE           (1)

#define HI_GFX_INIT_MUTEX(x)               sema_init(x, 1)
#define HI_GFX_DECLARE_MUTEX(x)            DEFINE_SEMAPHORE(x)

#if defined(CONFIG_GFX_STB_SDK) || defined(CONFIG_GFX_ANDROID_SDK) || defined(CONFIG_GFX_TV_SDK)

    #define ConvertID(module_id) (module_id + HI_ID_TDE - HIGFX_TDE_ID)

    #ifndef CONFIG_GFX_COMM_PM_DISABLE
        #ifdef CONFIG_COMPAT
            #define DECLARE_GFX_NODE(gfx_name,gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume) \
            static struct file_operations gfx_fops =\
            {\
                .owner          = THIS_MODULE,      \
                .unlocked_ioctl = gfx_ioctl,        \
                .compat_ioctl   = gfx_compat_ioctl, \
                .open           = gfx_open,         \
                .release        = gfx_release,      \
                .mmap           = gfx_mmap          \
            };\
            static PM_BASEOPS_S gfx_drvops = \
            {\
                .suspend      = gfx_suspend, \
                .resume       = gfx_resume   \
            };\
            static PM_DEVICE_S gfx_dev = \
            {\
                .name     = gfx_name,              \
                .minor    = HIMEDIA_DYNAMIC_MINOR, \
                .owner    = THIS_MODULE,           \
                .app_ops  = &gfx_fops,             \
                .base_ops = &gfx_drvops            \
            }
        #else
            #define DECLARE_GFX_NODE(gfx_name,gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume) \
            static struct file_operations gfx_fops =\
            {\
                .owner          = THIS_MODULE,      \
                .unlocked_ioctl = gfx_ioctl,        \
                .open           = gfx_open,         \
                .release        = gfx_release,      \
                .mmap           = gfx_mmap          \
            };\
            static PM_BASEOPS_S gfx_drvops = \
            {\
                .suspend      = gfx_suspend,\
                .resume       = gfx_resume  \
            };\
            static PM_DEVICE_S gfx_dev = \
            {\
                .name     = gfx_name,             \
                .minor    = HIMEDIA_DYNAMIC_MINOR,\
                .owner    = THIS_MODULE,          \
                .app_ops  = &gfx_fops,            \
                .base_ops = &gfx_drvops           \
            }
        #endif
    #else
        #define DECLARE_GFX_NODE(gfx_name, gfx_open, gfx_release, gfx_mmap, gfx_ioctl, gfx_compat_ioctl, gfx_suspend, gfx_resume)  \
        static struct file_operations gfx_fops =\
        {\
            .owner          = THIS_MODULE,      \
            .unlocked_ioctl = gfx_ioctl,        \
            .open           = gfx_open,         \
            .release        = gfx_release,      \
            .mmap           = gfx_mmap          \
        };\
        static PM_BASEOPS_S gfx_drvops = \
        {\
            .suspend      = gfx_suspend,\
            .resume       = gfx_resume  \
        };\
        static PM_DEVICE_S gfx_dev = \
        {\
            .name    = gfx_name,             \
            .minor   = HIMEDIA_DYNAMIC_MINOR,\
            .owner   = THIS_MODULE,          \
            .app_ops = &gfx_fops             \
        }
     #endif

    typedef struct tagGFXMMZBUFFER_S{
        HI_U8  *pu8StartVirAddr;
        HI_U32  u32StartSmmuAddr;
        HI_U32  u32StartPhyAddr;
        HI_U32  u32Size;
        HI_BOOL bSmmu;
    }GFX_MMZ_BUFFER_S;
#endif

/*************************** Enum Definition ****************************************************/
typedef enum tagHIGFX_CHIP_TYPE_E
{
    HIGFX_CHIP_TYPE_HI3716MV100 = 0,   /**< HI3716MV100  */
    HIGFX_CHIP_TYPE_HI3716MV200,       /**< HI3716MV200  */
    HIGFX_CHIP_TYPE_HI3716MV300,       /**< HI3716MV300  */
    HIGFX_CHIP_TYPE_HI3716H,           /**< HI3716H      */
    HIGFX_CHIP_TYPE_HI3716CV100,       /**< HI3716C      */

    HIGFX_CHIP_TYPE_HI3720,            /**< HI3720       */
    HIGFX_CHIP_TYPE_HI3712V300,        /**< X6V300       */
    HIGFX_CHIP_TYPE_HI3715,            /**< HI3715       */

    HIGFX_CHIP_TYPE_HI3716CV200ES,     /**< S40V200      */
    HIGFX_CHIP_TYPE_HI3716CV200,       /**< HI3716CV200  */
    HIGFX_CHIP_TYPE_HI3719MV100,       /**< HI3719MV100  */
    HIGFX_CHIP_TYPE_HI3718CV100,       /**< HI3718CV100  */
    HIGFX_CHIP_TYPE_HI3719CV100,       /**< HI3719CV100  */
    HIGFX_CHIP_TYPE_HI3719MV100_A,     /**< HI3719MV100_A*/
    HIGFX_CHIP_TYPE_HI3716MV400,       /*<  HI3716MV400  */

    HIGFX_CHIP_TYPE_HI3531      = 100, /**< HI3531       */
    HIGFX_CHIP_TYPE_HI3521,            /**< HI3521       */
    HIGFX_CHIP_TYPE_HI3518,            /**< HI3518       */
    HIGFX_CHIP_TYPE_HI3520A,           /**< HI3520A      */
    HIGFX_CHIP_TYPE_HI3520D,           /**< HI3520D      */
    HIGFX_CHIP_TYPE_HI3535,            /**< HI3535       */

    HIGFX_CHIP_TYPE_BUTT        = 400  /**< Invalid Chip */

}HIGFX_CHIP_TYPE_E;

typedef enum tagHIGFX_MODE_ID_E
{
    HIGFX_TDE_ID      = 0,    /**< TDE ID          */
    HIGFX_JPGDEC_ID,          /**< JPEG DECODE ID  */
    HIGFX_JPGENC_ID,          /**< JPEG_ENCODE ID  */
    HIGFX_FB_ID,              /**<  FRAMEBUFFER ID */
    HIGFX_PNG_ID,             /**< PNG ID          */
    HIGFX_HIGO_ID,
    HIGFX_GFX2D_ID,
    HIGFX_BUTT_ID,
}HIGFX_MODE_ID_E;

/*************************** Structure Definition ***********************************************/
typedef struct struGFX_PROC_ITEM
{
    HI_S32 (*fnRead)(struct seq_file *, HI_VOID *);
    HI_S32 (*fnWrite)(struct file * file,  const char __user * buf, size_t count, loff_t *ppos);
    HI_S32 (*fnIoctl)(struct seq_file *, HI_U32 cmd, HI_U32 arg);
}GFX_PROC_ITEM_S;

/********************** Global Variable declaration *********************************************/

extern unsigned long long sched_clock(void);

/******************************* API declaration ************************************************/

/***************************************************************************
* func           : HI_GFX_SetIrq
* description    : set irq to cpu
                   CNcomment: ���жϺŰ󶨵���Ӧ��CPU�� CNend\n
* param[in]      : u32ModId   CNcomment: ģ��ID CNend\n
* param[in]      : u32IrqNum  CNcomment: �жϺ� CNend\n
* retval         : HI_SUCCESS �ɹ�
* retval         : HI_FAILURE ʧ��
* others:        : NA
****************************************************************************/
static inline HI_S32 HI_GFX_SetIrq(HI_U32 u32ModId, HI_U32 u32IrqNum, const HI_CHAR* pIrqName)
{
#ifdef CONFIG_GFX_STB_SDK
    HI_S32 s32Ret = HI_SUCCESS;

    if (NULL == pIrqName)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    s32Ret = HI_DRV_SYS_SetIrqAffinity(ConvertID(u32ModId), u32IrqNum, pIrqName);
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }
#else
    HI_UNUSED(u32ModId);
    HI_UNUSED(u32IrqNum);
    HI_UNUSED(pIrqName);
#endif
    return HI_SUCCESS;
}

/***************************************************************************
* func          : HI_GFX_GetTimeStamp
* description   : get time function.
                        CNcomment:��ȡʱ�亯�� CNend\n
* param[out]    : pu32TimeMs  CNcomment: ��ȡms CNend\n
* param[out]    : pu32TimeUs  CNcomment: ��ȡus CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_S32 HI_GFX_GetTimeStamp(HI_U32 *pu32TimeMs, HI_U32 *pu32TimeUs)
{
    HI_U64 u64TimeNow = 0;
    HI_UNUSED(pu32TimeUs);

    if (HI_NULL == pu32TimeMs)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    u64TimeNow = sched_clock();

    do_div(u64TimeNow, (HI_U64)1000000);

    if (u64TimeNow > UINT_MAX)
    {
        *pu32TimeMs = UINT_MAX;
    }
    else
    {
        *pu32TimeMs = (HI_U32)u64TimeNow;
    }

    return HI_SUCCESS;
}

/***************************************************************************
* func          : HI_GFX_KZALLOC
* description   : kzalloc buffer
* retval        : mem address
* others:       : NA
****************************************************************************/
#ifdef CONFIG_GFX_STB_SDK
static inline HI_VOID* HI_GFX_KZALLOC(HI_U32 u32ModuleId, HI_U32 u32Size, HI_S32 s32Flags)
{
    HI_VOID* pBuf = NULL;

    if ((u32Size > CONFIG_GFX_MIN_MEM_SIZE) && (u32Size < CONFIG_GFX_MAX_MEM_SIZE))
    {
       pBuf = HI_KZALLOC(ConvertID(u32ModuleId), u32Size, s32Flags);
    }

    return pBuf;
}
#endif

#if defined(CONFIG_GFX_STB_SDK) || defined(CONFIG_GFX_ANDROID_SDK) || defined(CONFIG_GFX_TV_SDK)
/***************************************************************************
* func          : HI_GFX_KMALLOC
* description   : kmalloc buffer
* retval        : mem address
* others:       : NA
****************************************************************************/
static inline HI_VOID* HI_GFX_KMALLOC(HI_U32 u32ModuleId, HI_U32 u32Size, HI_S32 s32Flags)
{
    HI_VOID* pBuf = NULL;

    if ((u32Size > CONFIG_GFX_MIN_MEM_SIZE) && (u32Size < CONFIG_GFX_MAX_MEM_SIZE))
    {
        pBuf = HI_KMALLOC(ConvertID(u32ModuleId), u32Size, s32Flags);
    }

    return pBuf;
}

/***************************************************************************
* func          : HI_GFX_VMALLOC
* description   : vmalloc buffer
* retval        : mem address
* others:       : NA
****************************************************************************/
static inline HI_VOID* HI_GFX_VMALLOC(HI_U32 u32ModuleId, HI_U32 u32Size)
{
    HI_VOID* pBuf = NULL;

    if ((u32Size > CONFIG_GFX_MIN_MEM_SIZE) && (u32Size < CONFIG_GFX_MAX_MEM_SIZE))
    {
        pBuf = HI_VMALLOC(ConvertID(u32ModuleId), u32Size);
    }

    return pBuf;
}

/***************************************************************************
* func          : HI_GFX_KFREE
* description   : free buffer
* retval        : NA
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_KFREE(HI_U32 u32ModuleId, HI_VOID* pBuf)
{
    if (NULL != pBuf)
    {
        HI_KFREE(ConvertID(u32ModuleId), pBuf);
    }

    return;
}

/***************************************************************************
* func          : HI_GFX_VFREE
* description   : vfree buffer
* retval        : NA
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_VFREE(HI_U32 u32ModuleId, HI_VOID* pBuf)
{
    if (NULL != pBuf)
    {
        HI_VFREE(ConvertID(u32ModuleId), pBuf);
    }

    return;
}

/***************************************************************************
* func          : HI_GFX_FreeMem
* description   : free the mem that has alloced
                  CNcomment: �ͷŷ�������ڴ� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_FreeMem(HI_U32 u32Phyaddr, HI_BOOL bMmu)
{
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    if (0 != u32Phyaddr)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (bMmu)
        {
            stSMMUBuffer.u32StartSmmuAddr = u32Phyaddr;
            HI_DRV_SMMU_Release(&stSMMUBuffer);
        }
        else
#endif
        {
            stMMZBuffer.u32StartPhyAddr  = u32Phyaddr;
            HI_DRV_MMZ_Release(&stMMZBuffer);
        }
    }
    return;
}

/***************************************************************************
* func          : HI_GFX_AllocMem
* description   : alloc the mem that need
                  CNcomment: ������Ҫ���ڴ� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_U32 HI_GFX_AllocMem(HI_CHAR *pName, HI_CHAR* pZoneName, HI_U32 u32LayerSize, HI_BOOL *pbMmu)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 addr   = 0;
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    HI_UNUSED(pZoneName);

    if ((NULL != pbMmu) && (u32LayerSize > CONFIG_GFX_MIN_MEM_SIZE) && (u32LayerSize < CONFIG_GFX_MAX_MEM_SIZE))
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if ( (NULL != pZoneName) && (0 == strncmp(pZoneName, "iommu", strlen("iommu"))) )
        {
            s32Ret = HI_DRV_SMMU_Alloc(pName,u32LayerSize,GFX_MMZ_ALIGN_BYTES,&stSMMUBuffer);
            *pbMmu = HI_TRUE;
            addr = stSMMUBuffer.u32StartSmmuAddr;
        }
        else
#endif
        {
           s32Ret = HI_DRV_MMZ_Alloc(pName, NULL,u32LayerSize,GFX_MMZ_ALIGN_BYTES,&stMMZBuffer);
           *pbMmu = HI_FALSE;
           addr   = stMMZBuffer.u32StartPhyAddr;
        }
    }
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return 0;
    }

    return addr;
}

/***************************************************************************
* func          : HI_GFX_MapMmzToSmmu
* description   :
                  CNcomment: map mmz to smmu CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_U32 HI_GFX_MapMmzToSmmu(HI_U32 u32PhyAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_U32 SmmuAddr = 0;
    MMZ_BUFFER_S stsMBuf = {0};

    if (0 != u32PhyAddr)
    {
        stsMBuf.u32StartPhyAddr = u32PhyAddr;
        SmmuAddr = HI_DRV_MMZ_MapToSmmu(&stsMBuf);
    }

    return SmmuAddr;
#else
    return u32PhyAddr;
#endif
}

/***************************************************************************
* func          : HI_GFX_UnMapSmmu
* description   :
                  CNcomment: un map mmz to smmu CNend\n
* retval        : smmu mem
* others:       : NA
****************************************************************************/
static inline HI_S32 HI_GFX_UnMapSmmu(HI_U32 u32SmmuAddr)
{
#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_S32 Ret = HI_FAILURE;
    SMMU_BUFFER_S stsMBuf = {0};

    if (0 != u32SmmuAddr)
    {
        stsMBuf.u32StartSmmuAddr = u32SmmuAddr;
        Ret = HI_DRV_MMZ_UnmapFromSmmu(&stsMBuf);
    }

    return Ret;
#else
    return HI_SUCCESS;
#endif
}


/***************************************************************************
* func          : HI_GFX_Map
* description   :
                  CNcomment: ӳ�䲻��cache�������ڴ� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_VOID *HI_GFX_Map(HI_U32 u32PhyAddr,HI_U32 size, HI_BOOL bMmu)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U8* pu8VirDdr = NULL;
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    HI_UNUSED(size);

    if (0 != u32PhyAddr)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (bMmu)
        {
            stSMMUBuffer.u32StartSmmuAddr = u32PhyAddr;
            s32Ret = HI_DRV_SMMU_Map(&stSMMUBuffer);
            pu8VirDdr = stSMMUBuffer.pu8StartVirAddr;
        }
        else
#endif
        {
            stMMZBuffer.u32StartPhyAddr  = u32PhyAddr;
            s32Ret = HI_DRV_MMZ_Map(&stMMZBuffer);
            pu8VirDdr = stMMZBuffer.pu8StartVirAddr;
        }
    }
    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return NULL;
    }

    return ((unsigned char *)pu8VirDdr);
}

/***************************************************************************
* func          : HI_GFX_MapCached
* description   :
                  CNcomment: ӳ���cache�������ڴ� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_VOID *HI_GFX_MapCached(HI_U32 u32PhyAddr,HI_U32 size, HI_BOOL bMmu)
{
    HI_S32 s32Ret    = HI_SUCCESS;
    HI_U8* pu8VirDdr = NULL;
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    HI_UNUSED(size);

    if (0 != u32PhyAddr)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (bMmu)
        {
            stSMMUBuffer.u32StartSmmuAddr = u32PhyAddr;
            s32Ret = HI_DRV_SMMU_MapCache(&stSMMUBuffer);
            pu8VirDdr = stSMMUBuffer.pu8StartVirAddr;
        }
        else
#endif
        {
            stMMZBuffer.u32StartPhyAddr  = u32PhyAddr;
            s32Ret = HI_DRV_MMZ_MapCache(&stMMZBuffer);
            pu8VirDdr = stMMZBuffer.pu8StartVirAddr;
        }
    }

    if (HI_SUCCESS != s32Ret)
    {
        HI_GFX_Print("[module-gfx][err] : %s %d failure\n",__FUNCTION__,__LINE__);
        return NULL;
    }

    return ((unsigned char *)pu8VirDdr);
}

/***************************************************************************
* func            : HI_GFX_Flush
* description     :
                    CNcomment: ��ַ����ˢ�� CNend\n
* retval          : HI_SUCCESS �ɹ�
* retval          : HI_FAILURE ʧ��
* others:         : NA
****************************************************************************/
static inline HI_VOID HI_GFX_Flush(GFX_MMZ_BUFFER_S *stFlushBuf, HI_BOOL bMmu)
{
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    if (NULL != stFlushBuf)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (bMmu)
        {
            stSMMUBuffer.u32Size = stFlushBuf->u32Size;
            stSMMUBuffer.pu8StartVirAddr  = stFlushBuf->pu8StartVirAddr;
            stSMMUBuffer.u32StartSmmuAddr = stFlushBuf->u32StartSmmuAddr;
            (HI_VOID)HI_DRV_SMMU_Flush(&stSMMUBuffer);
        }
        else
#endif
        {
            stMMZBuffer.u32Size = stFlushBuf->u32Size;
            stMMZBuffer.pu8StartVirAddr = stFlushBuf->pu8StartVirAddr;
            stMMZBuffer.u32StartPhyAddr = stFlushBuf->u32StartPhyAddr;
            (HI_VOID)HI_DRV_MMZ_Flush(&stMMZBuffer);
        }
    }

    return;
}


/***************************************************************************
* func             : HI_GFX_Unmap
* description      : un map phy ddr
                     CNcomment: ��ӳ�������ַ CNend\n
* retval           : HI_SUCCESS �ɹ�
* retval           : HI_FAILURE ʧ��
* others:         : NA
****************************************************************************/
static inline HI_S32 HI_GFX_Unmap(HI_VOID *pViraddr, HI_BOOL bMmu)
{
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

    if (NULL != pViraddr)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (bMmu)
        {
            stSMMUBuffer.pu8StartVirAddr = (HI_U8*)pViraddr;
            HI_DRV_SMMU_Unmap(&stSMMUBuffer);
        }
        else
#endif
        {
            stMMZBuffer.pu8StartVirAddr = (HI_U8*)pViraddr;
            HI_DRV_MMZ_Unmap(&stMMZBuffer);
        }
    }

    return HI_SUCCESS;
}

/***************************************************************************
* func          : HI_GFX_AllocAndMap
* description   : alloc the mem that need
                  CNcomment: ������Ҫ���ڴ� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_S32 HI_GFX_AllocAndMap(const HI_CHAR *pName, HI_CHAR* pZoneName, HI_U32 u32LayerSize, HI_S32 s32Align, GFX_MMZ_BUFFER_S *pstBuf)
{
    HI_S32 s32Ret = HI_FAILURE;
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif
    HI_UNUSED(pZoneName);

    if ((u32LayerSize > CONFIG_GFX_MIN_MEM_SIZE) && (u32LayerSize < CONFIG_GFX_MAX_MEM_SIZE) && (NULL != pstBuf))
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if( (NULL != pZoneName) && (0 == strncmp(pZoneName, "iommu", strlen("iommu"))) )
        {
            s32Ret = HI_DRV_SMMU_AllocAndMap(pName, u32LayerSize, s32Align, &stSMMUBuffer);
            pstBuf->pu8StartVirAddr   = stSMMUBuffer.pu8StartVirAddr;
            pstBuf->u32StartSmmuAddr  = stSMMUBuffer.u32StartSmmuAddr;
            pstBuf->u32Size           = stSMMUBuffer.u32Size;
            pstBuf->bSmmu             = HI_TRUE;
        }
        else
#endif
        {
            s32Ret = HI_DRV_MMZ_AllocAndMap(pName, NULL, u32LayerSize, s32Align, &stMMZBuffer);
            pstBuf->pu8StartVirAddr   = stMMZBuffer.pu8StartVirAddr;
            pstBuf->u32StartPhyAddr   = stMMZBuffer.u32StartPhyAddr;
            pstBuf->u32Size           = stMMZBuffer.u32Size;
            pstBuf->bSmmu             = HI_FALSE;
        }
    }

    return s32Ret;
}

/***************************************************************************
* func          : HI_GFX_UnmapAndRelease
* description   : un map and release phy ddr
                  CNcomment: ��ӳ�䲢�ͷ������ַ CNend\n
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_UnmapAndRelease(GFX_MMZ_BUFFER_S *pstBuf)
{
    MMZ_BUFFER_S  stMMZBuffer  = {0};
#ifdef CONFIG_GFX_MMU_SUPPORT
    SMMU_BUFFER_S stSMMUBuffer = {0};
#endif

    if (NULL != pstBuf)
    {
#ifdef CONFIG_GFX_MMU_SUPPORT
        if (pstBuf->bSmmu)
        {
            stSMMUBuffer.pu8StartVirAddr  = pstBuf->pu8StartVirAddr;
            stSMMUBuffer.u32StartSmmuAddr = pstBuf->u32StartSmmuAddr;
            stSMMUBuffer.u32Size          = pstBuf->u32Size;
            HI_DRV_SMMU_UnmapAndRelease(&stSMMUBuffer);
        }
#endif
        {
            stMMZBuffer.pu8StartVirAddr = pstBuf->pu8StartVirAddr;
            stMMZBuffer.u32StartPhyAddr = pstBuf->u32StartPhyAddr;
            stMMZBuffer.u32Size         = pstBuf->u32Size;
            HI_DRV_MMZ_UnmapAndRelease(&stMMZBuffer);
        }
    }

    return;
}

/***************************************************************************
* func          : HI_GFX_PROC_AddModule
* description   : register proc module
                  CNcomment: proc��Ϣע�� CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_PROC_AddModule(HI_CHAR * pEntry_name, GFX_PROC_ITEM_S* pProcItem, HI_VOID *pData)
{
#ifndef  CONFIG_GFX_COMM_PROC_DISABLE
    DRV_PROC_EX_S stProcItem;
    if ((NULL != pEntry_name) && (NULL != pProcItem))
    {
        stProcItem.fnIoctl = pProcItem->fnIoctl;
        stProcItem.fnRead  = pProcItem->fnRead;
        stProcItem.fnWrite = pProcItem->fnWrite;
        HI_DRV_PROC_AddModule(pEntry_name, &stProcItem, pData);
    }
#else
    HI_UNUSED(pEntry_name);
    HI_UNUSED(pProcItem);
    HI_UNUSED(pData);
#endif
    return;
}

/***************************************************************************
* func          : HI_GFX_PROC_RemoveModule
* description   : remove proc module
                  CNcomment: ɾ��ע�����proc CNend\n
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_VOID HI_GFX_PROC_RemoveModule(HI_CHAR *pEntry_name)
{
#ifndef  CONFIG_GFX_COMM_PROC_DISABLE
    if (NULL != pEntry_name)
    {
       HI_DRV_PROC_RemoveModule(pEntry_name);
    }
#endif
}

/***************************************************************************
* func          : HI_GFX_MODULE_Register
* description   : ע��ģ��
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_S32 HI_GFX_MODULE_Register(HI_U32 u32ModuleID, const HI_CHAR * pszModuleName, HI_VOID *pData)
{
    HI_S32 Ret = HI_FAILURE;

    if ((NULL != pszModuleName) && (NULL != pData))
    {
       Ret = HI_DRV_MODULE_Register(ConvertID(u32ModuleID), pszModuleName, pData);
    }

    return Ret;
}

/***************************************************************************
* func          : HI_GFX_MODULE_UnRegister
* description   : ɾ��ģ��
* retval        : HI_SUCCESS �ɹ�
* retval        : HI_FAILURE ʧ��
* others:       : NA
****************************************************************************/
static inline HI_S32 HI_GFX_MODULE_UnRegister(HI_U32 u32ModuleID)
{
    return HI_DRV_MODULE_UnRegister(ConvertID(u32ModuleID));
}

#define HI_GFX_PM_Register()        HI_DRV_PM_Register(&gfx_dev);

#define HI_GFX_PM_UnRegister()      HI_DRV_PM_UnRegister(&gfx_dev);

#endif

/** @} */  /*! <!-- API declaration end */
#ifdef __cplusplus
 #if __cplusplus
}
 #endif /* __cplusplus */
#endif  /* __cplusplus */
#endif /*_HI_GFX_COMM_K_H_ */
