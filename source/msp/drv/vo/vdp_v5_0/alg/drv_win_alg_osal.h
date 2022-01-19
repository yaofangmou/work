/******************************************************************************

  Copyright (C), 2001-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_win_alg_osal.h
  Version       : Initial Draft
  Author        : zhangtao 00178013
  Created       : 2018/5/30
  Last Modified :
  Description   : drv_win_alg_osal.c header file
  Function List :
  History       :
  1.Date        : 2018/5/30
    Author      : zhangtao 00178013
    Modification: Created file

******************************************************************************/

#ifndef __DRV_WIN_ALG_OSAL_H__
#define __DRV_WIN_ALG_OSAL_H__

/*----------------------------------------------*
 * macros  function                             *
 *----------------------------------------------*/


#define OSAL_OK     0
#define OSAL_ERR   -1

#define EVENT_DONE 1
#define EVENT_UNDO 0
#define XDP_SUPPORT_MEM_MAGIC
#define OSAL_MEM_MAGIC_SIZE (4)
#define OSAL_MEM_MAGIC_NO   (0xF123456F)

#define XDP_SUPPORT_ALG_STAT

#define XDP_ERROR(fmt...) HI_ERR_PRINT(HI_ID_VO, fmt)
#define XDP_WARN(fmt...) HI_WARN_PRINT(HI_ID_VO, fmt)
#define XDP_INFO(fmt...) //printk(fmt)
#define XDP_ASP_INFO(fmt...)

#define XDP_KMALLOC(fmt...)    HI_KMALLOC(HI_ID_VPSS, fmt)
#define XDP_KFREE(ptr)         {HI_KFREE(HI_ID_VPSS, ptr); ptr=HI_NULL;}
#define XDP_VMALLOC(fmt...)    HI_VMALLOC(HI_ID_VPSS, fmt)
#define XDP_VFREE(ptr)         {HI_VFREE(HI_ID_VPSS, ptr); ptr=HI_NULL;}
#define XDP_VFREE_SAFE(ptr)    {if(HI_NULL!=ptr) {HI_VFREE(HI_ID_VPSS, ptr);ptr=HI_NULL;}}
#define XDP_MEM_CLEAR(memblk) do {\
        memset(&(memblk), 0x0, sizeof(memblk));\
    } while (0)

#define XDP_NULL_CHECK_RET(ptr) {\
        if (HI_NULL == ptr) \
        {\
            XDP_ERROR("Null Pointer!\n");\
            return HI_FAILURE;\
        }}
#define XDP_NULL_CHECK(ptr) {\
        if (HI_NULL == ptr) \
        {\
            XDP_ERROR("Null Pointer!\n");\
        }}

#define XDP_RET_CHECK(ret) do {\
        if (HI_SUCCESS != (ret)) \
        {\
            XDP_ERROR("Error return :%d!\n", (ret)); \
        }\
    } while (0)

#define XDP_RET_CHECK_RET(ret) do {\
        if (HI_SUCCESS != (ret)) \
        {\
            XDP_ERROR("Error return :%d!\n", (ret)); \
            return ret;\
        }\
    } while (0)

#define XDP_IS_SMMU_MEM(ptr) (HI_TRUE == ptr->bSmmu)
#define XDP_IS_SECURE_MEM(ptr) (HI_TRUE == ptr->bSecure)
#define XDP_OSAL_MAX(a, b) (((a) > (b)) ? (a) : (b))
#define XDP_OSAL_MIN(a, b) (((a) > (b)) ? (b) : (a))

#define XDP_IS_TILE_FMT(fmt) (\
                               (HI_DRV_PIX_FMT_NV12_TILE == (fmt))\
                               || (HI_DRV_PIX_FMT_NV21_TILE == (fmt))\
                               || (HI_DRV_PIX_FMT_YUV400_TILE == (fmt))\
                               || (HI_DRV_PIX_FMT_NV12_TILE_CMP == (fmt))\
                               || (HI_DRV_PIX_FMT_NV21_TILE_CMP == (fmt)))


/*----------------------------------------------*
 * macros  var                                  *
 *----------------------------------------------*/

#define XDP_MEM_NAME_LEN_MAX 32

/*----------------------------------------------*
 * external variables                           *
 *----------------------------------------------*/

/*----------------------------------------------*
 * external routine prototypes                  *
 *----------------------------------------------*/

/*----------------------------------------------*
 * internal routine prototypes                  *
 *----------------------------------------------*/
typedef struct hiKERN_EVENT_S
{
    wait_queue_head_t   queue_head;
    HI_S32              flag_1;
    HI_S32              flag_2;
} KERN_EVENT_S;

typedef  KERN_EVENT_S           OSAL_EVENT;

typedef struct XDP_OSAL_SPIN_tag
{
    spinlock_t spinlock;
    unsigned long flags;
} XDP_OSAL_SPIN;

typedef struct hiXDP_OSAL_Addr_tag
{
    HI_U8  aName[XDP_MEM_NAME_LEN_MAX];
    HI_U32 u32Size;
    HI_U32 u32PhyAddr;
    HI_U8  *pu8VirAddr;
    HI_BOOL bSmmu;
    HI_BOOL bSecure;
    HI_BOOL bMap;
#ifdef XDP_SUPPORT_MEM_MAGIC
    HI_U32 u32Magic;
#endif
} hiXDP_OSAL_MEM_S;

typedef struct list_head LIST;



/*----------------------------------------------*
 * project-wide global variables                *
 *----------------------------------------------*/

/*----------------------------------------------*
 * module-wide global variables                 *
 *----------------------------------------------*/

/*----------------------------------------------*
 * constants                                    *
 *----------------------------------------------*/


/*----------------------------------------------*
 * routines' implementations                    *
 *----------------------------------------------*/
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */


 HI_S32 XDP_OSAL_AllocateMem(hiXDP_OSAL_MEM_S *pstAddr);
 HI_S32 XDP_OSAL_DownSpin(XDP_OSAL_SPIN *pLock);
 HI_S32 XDP_OSAL_FreeMem(hiXDP_OSAL_MEM_S *pstAddr);
 HI_S32 XDP_OSAL_GiveEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32 InitVal2);
 HI_S32 XDP_OSAL_InitEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32 InitVal2);
 HI_S32 XDP_OSAL_InitSpin(XDP_OSAL_SPIN *pLock);
 HI_S32 XDP_OSAL_MEMMap(hiXDP_OSAL_MEM_S *pstAddr);
 HI_S32 XDP_OSAL_MEMUnmap(hiXDP_OSAL_MEM_S *pstAddr);
 HI_S32 XDP_OSAL_ResetEvent( OSAL_EVENT *pEvent, HI_S32 InitVal1, HI_S32 InitVal2);
 HI_S32 XDP_OSAL_UpSpin(XDP_OSAL_SPIN *pLock);
 HI_S32 XDP_OSAL_WaitEvent( OSAL_EVENT *pEvent, HI_S32 s32WaitTime );
#ifndef XDP_SUPPORT_MEM_MAGIC
#define XDP_OSAL_MemAddMagic(a, b)
#define XDP_OSAL_MemCheckMagic(a)
#define XDP_OSAL_MemGetMagicSize(a) (0)
#else
 HI_S32 XDP_OSAL_MemAddMagic(hiXDP_OSAL_MEM_S *pstBuf, HI_U32 u32Magic);
 HI_S32 XDP_OSAL_MemCheckMagic(hiXDP_OSAL_MEM_S *pstBuf);
 HI_U32 XDP_OSAL_MemGetMagicSize(hiXDP_OSAL_MEM_S *pstBuf);
#endif

#ifdef XDP_SUPPORT_ALG_STAT
HI_U64 XDP_OSAL_GetTimeUS(void);
#endif

 HI_S32 XDP_OSAL_GetTileYvalue(HI_DRV_PIXEL_BITWIDTH_E enImgPixWidth,
                               HI_U32 u32Posx, HI_U32 u32Posy,
                               HI_U8 *pu8TileY, HI_U32 u32TileYStrd,
                               HI_U8 *pu8TileY2Bit, HI_U32 u32Tile2BitYStrd,
                               HI_U8 *pu8Yvalue);
#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */


#endif /* __DRV_WIN_ALG_OSAL_H__ */
