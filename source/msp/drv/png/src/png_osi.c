/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name           : png_osi.c
Version             : Initial Draft
Author              :
Created             : 2018/01/01
Description         : png osi layer code        CNcomment:png osi≤„ µœ÷
Function List       :


History             :
Date                         Author                     Modification
2018/01/01                   sdk                        Created file
**************************************************************************************************/
#include <linux/interrupt.h>

#include "hi_png_errcode.h"
#include "hi_drv_png.h"
#include "png_define.h"
#include "png_osi.h"
#include "png_osires.h"
#include "png_hal.h"
#include "drv_tde_ext.h"
#include "png_proc.h"
#include "hi_png_config.h"

/** debug file **/
#include "png_debug.h"

#define PNG_RDCBUF_SIZE               (32 * 1024)

#ifdef CONFIG_GFX_PROC_SUPPORT
extern PNG_PROC_INFO_S gs_stPngProcInfo;
#endif

HI_S32 PngOsiSuspend(HI_VOID);
HI_S32 pngOsiResume(HI_VOID);
HI_VOID PngOsiReset(HI_VOID);
static HI_S32 PngOsiClutToRgb(HI_PNG_HANDLE s32Handle);

/* png decoder queue*/
PNG_DECLARE_WAITQUEUE(g_PngWaitQueue);

/* png device lock*/
HI_DECLARE_MUTEX(g_DevMutex);

/* activ handle,hardware handle */
static HI_PNG_HANDLE g_ActiveHandle = 0;

/* rle window physical address*/
HI_U32 g_u32RdcBufPhyaddr = 0;

/* Png device reference count*/
static atomic_t g_PngRef = ATOMIC_INIT(0);

/* flag of png device open */
#define PNG_CHECK_OPEN() do\
    {\
        if (0 == atomic_read(&g_PngRef))\
        {\
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "Png device not open");\
            return HI_ERR_PNG_DEV_NOOPEN;\
        }\
    }while(0)

/********************************************************************************************
* func    : png osi init
* in      : none
* out     : none
* ret     : HI_SUCCESS success
* ret     : HI_ERR_PNG_NOMEM    no memory
* others  :
*********************************************************************************************/
HI_S32 PngOsiInit(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    /* alloc rle window buf */
    s32Ret = PngOsiResAllocMem("PNG_RdcBuf", PNG_RDCBUF_SIZE, 16, &g_u32RdcBufPhyaddr);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResAllocMem,  FAILURE_TAG);
        return s32Ret;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/********************************************************************************************
* func   : png osi deinit
* in     : none
* out    : none
* ret    : none
* others :
*********************************************************************************************/
HI_VOID PngOsiDeinit(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (0 != g_u32RdcBufPhyaddr)
    {
       PngOsiResReleaseMem(g_u32RdcBufPhyaddr);
    }
    g_u32RdcBufPhyaddr = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/********************************************************************************************
* func    : open PNG device
* in      : none
* out     : none
* ret     : HI_SUCCESS  :succes
* others  : before using png moudle, open the device, multi thread/process is support.
*********************************************************************************************/
static TDE_EXPORT_FUNC_S *ps_TdeExportFuncs = NULL;

HI_S32 PngOsiOpen(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (atomic_inc_return(&g_PngRef) == 1)
    {
        ps_TdeExportFuncs = NULL;
        s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_TDE, (HI_VOID **)&ps_TdeExportFuncs);
        if ((NULL == ps_TdeExportFuncs) || (HI_SUCCESS != s32Ret))
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, ps_TdeExportFuncs);
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, s32Ret);
            return HI_FAILURE;
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
EXPORT_SYMBOL(PngOsiOpen);

/********************************************************************************************
* func    : close PNG device
* in      : none
* out     : none
* ret     : none
* others  :
*********************************************************************************************/
HI_VOID PngOsiClose(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (atomic_read(&g_PngRef) == 1)
    {
        PngOsiReset();
    }

    atomic_dec(&g_PngRef);

    if (atomic_read(&g_PngRef) >= 0)
    {
       /**nothing to do**/
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
EXPORT_SYMBOL(PngOsiClose);

/********************************************************************************************
* func    : create decoder
* in      : none
* out     : ps32Handle: ptr to decoder handle
* ret     : HI_SUCCESS: success
* ret     : HI_ERR_PNG_NOOPEN:  device not open
* ret     : HI_ERR_PNG_NOHANDLE no decoder
* ret     : HI_ERR_PNG_NULLPTR: invalid ptr
* others  : can support 32 decoder at most
*********************************************************************************************/
HI_S32 PngOsiCreateDecoder(HI_PNG_HANDLE *ps32Handle)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL == ps32Handle)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, ps32Handle);
        return HI_ERR_PNG_NULLPTR;
    }

    PNG_CHECK_OPEN();

    Ret = PngOsiResAllocHandle(ps32Handle);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return Ret;
}
EXPORT_SYMBOL(PngOsiCreateDecoder);

/********************************************************************************************
* func    : destroy decoder
* in      : s32Handle: decoder handle
* out     : none
* ret     : HI_SUCCESS:        success
* ret     : HI_ERR_PNG_NOOPEN: device not open
* ret     : HI_ERR_PNG_INVALID_HANDLE: invalid decoder handle
* others  : relation to HI_PNG_CreateDecoder
*********************************************************************************************/
HI_S32 PngOsiDestroyDecoder(HI_PNG_HANDLE s32Handle)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PNG_CHECK_OPEN();

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {/**not need dfx to debug **/
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    if (HI_PNG_STATE_DECING == pstInstance->eState)
    {
        PNG_UP(&pstInstance->stInstanceLock);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        return HI_ERR_PNG_DEV_BUSY;
    }

    /* release filter buf */
    PngOsiResReleaseMem(pstInstance->u32FilterBufPhyaddr);

    PNG_UP(&pstInstance->stInstanceLock);

    /* release decoder memory */
    PngOsiReleaseBuf(s32Handle);

    /* release decoder */
    PngOsiResReleaseHandle(s32Handle);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
EXPORT_SYMBOL(PngOsiDestroyDecoder);

/********************************************************************************************
* func        : get stream buf
* in          : s32Handle:    decoder handle
* in          : pstBuf->u32Len: buffer size
* out         : pstBuf:         buf info,including physical address and size
* ret         : HI_SUCCESS:     success
* ret         : HI_ERR_PNG_INVALID_HANDL: invalid handle
* ret         : HI_ERR_PNG_NOMEM:      no mem
* ret         : HI_ERR_PNG_NULLPTR:    invalid pter
* others      : with this interface get stream buffer, and writer stram,  if pstBuf->u32Len =0, then
                alloc default size mem, else use pstBuf->u32Len .pstBuf->u32Len  record the actual size
*********************************************************************************************/
HI_S32 PngOsiAllocBuf(HI_PNG_HANDLE s32Handle, HI_PNG_BUF_IOC_S *pstBuf)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_VOID *pViraddr = NULL;
    HI_U32 u32Phyaddr = 0;
    HI_U32 u32Size = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PNG_CHECK_OPEN();

    if (NULL == pstBuf)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstBuf);
        return HI_ERR_PNG_NULLPTR;
    }

    if ((0 == pstBuf->u32Size) || (pstBuf->u32Size > (UINT_MAX - 0xf)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstBuf->u32Size);
        return HI_ERR_PNG_NULLPTR;
    }

    u32Size = ((pstBuf->u32Size + 0xf) & 0xfffffff0);
    u32Phyaddr = pstBuf->u32PhyAddr;

    pViraddr = (HI_VOID *)HI_GFX_KMALLOC(HIGFX_PNG_ID, sizeof(PNG_BUF_HEAD_S), GFP_KERNEL);
    if (NULL == pViraddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pViraddr);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_KMALLOC,  FAILURE_TAG);
        return HI_ERR_PNG_NOMEM;
    }
    HI_GFX_Memset(pViraddr, 0, sizeof(PNG_BUF_HEAD_S));

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_KFREE(HIGFX_PNG_ID, pViraddr);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_KFREE(HIGFX_PNG_ID, pViraddr);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    /* alloc stream buffer ,before decoder not start */
    if (pstInstance->eState != HI_PNG_STATE_NOSTART)
    {
        HI_GFX_KFREE(HIGFX_PNG_ID, pViraddr);
        PNG_UP(&pstInstance->stInstanceLock);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        return HI_ERR_PNG_DEV_BUSY;
    }

    /* refresh handle instance*/
    /* decoder alloc buffer, first time */
    if (0 == pstInstance->u32StartBufPhyAddr)
    {
        pstInstance->u32StartBufPhyAddr = u32Phyaddr;
        pstInstance->pStartBufVir = pViraddr;
    }
    else
    {
        ((PNG_BUF_HEAD_S *)(pstInstance->pEndBufVir))->u32NextPhyaddr = u32Phyaddr;
        ((PNG_BUF_HEAD_S *)(pstInstance->pEndBufVir))->pNextViraddr = pViraddr;
    }

    pstInstance->u32EndBufPhyAddr = u32Phyaddr;
    pstInstance->pEndBufVir = pViraddr;

    ((PNG_BUF_HEAD_S *)(pstInstance->pEndBufVir))->u32BufSize   = u32Size;
    ((PNG_BUF_HEAD_S *)(pstInstance->pEndBufVir))->u32StreamLen = 0;

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
EXPORT_SYMBOL(PngOsiAllocBuf);

/********************************************************************************************
* func    : release stream buf
* in      : s32Handle:    decoder handle
* out     : none
* ret     : HI_SUCCESS:    success
* ret     : HI_ERR_PNG_NOOPEN:    device not open
* ret     : HI_ERR_PNG_INVALID_HANDLE:    invalid handle
* others  :
*********************************************************************************************/
HI_S32 PngOsiReleaseBuf(HI_PNG_HANDLE s32Handle)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_VOID *pViraddr = NULL;
    HI_VOID *pNextViraddr = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PNG_CHECK_OPEN();

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    if (HI_PNG_STATE_DECING == pstInstance->eState)
    {
        PNG_UP(&pstInstance->stInstanceLock);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        return HI_ERR_PNG_DEV_BUSY;
    }

    pViraddr = pstInstance->pStartBufVir;
    while (NULL != pViraddr)
    {
        pNextViraddr = ((PNG_BUF_HEAD_S *)pViraddr)->pNextViraddr;
        HI_GFX_KFREE(HIGFX_PNG_ID, pViraddr);
        pViraddr = pNextViraddr;
    }

    pstInstance->u32StartBufPhyAddr = 0;
    pstInstance->pStartBufVir = NULL;

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/********************************************************************************************
* func     : set stream len
* in       : s32Handle:  decoder handle
* in       : stBuf:      stream info
* out      :
* ret      : HI_SUCCESS: success
* ret      : HI_ERR_PNG_INVALID_HANDLE:  invalid handle
* ret      : HI_ERR_PNG_INVALID_STREAMLEN:   invalid stream size
* others   : match with HI_PNG_GetBuf.after get stream lenght, set  stream length.
             ther bufer length is the latest stream length,it can't abover the stream length.
*********************************************************************************************/
HI_S32 PngOsiSetStreamLen(HI_PNG_HANDLE s32Handle, HI_U32 u32Phyaddr, HI_U32 u32Len)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    PNG_BUF_HEAD_S *pstBufHead = NULL;
    HI_U32 u32BufPhyaddr = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PNG_CHECK_OPEN();

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    /* before decoder starting, set stream length */
    if (pstInstance->eState != HI_PNG_STATE_NOSTART)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        PNG_UP(&pstInstance->stInstanceLock);
        return HI_ERR_PNG_DEV_BUSY;
    }

    u32BufPhyaddr = pstInstance->u32StartBufPhyAddr;
    pstBufHead = (PNG_BUF_HEAD_S *)(pstInstance->pStartBufVir);

    while ((u32Phyaddr != u32BufPhyaddr) && (0 != u32BufPhyaddr))
    {
        u32BufPhyaddr = pstBufHead->u32NextPhyaddr;
        pstBufHead = (PNG_BUF_HEAD_S *)pstBufHead->pNextViraddr;
    }

    if (NULL == pstBufHead)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstBufHead);
        PNG_UP(&pstInstance->stInstanceLock);
        return HI_ERR_PNG_INVALID_PARAM;
    }
    if (pstBufHead->u32BufSize < u32Len)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstBufHead->u32BufSize);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32Len);
        PNG_UP(&pstInstance->stInstanceLock);
        return HI_ERR_PNG_INVALID_PARAM;
    }

    pstBufHead->u32StreamLen = u32Len;

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

EXPORT_SYMBOL(PngOsiSetStreamLen);

/********************************************************************************************
* func      : get stream length
* in        : s32Handle:      decoder handle
* in        : u32Phyaddr  buf physical address
* out       : pu32Len:                stream length
* ret       : HI_SUCCESS:              success
* ret       : HI_ERR_PNG_NOOPEN:      device not open
* ret       : HI_ERR_PNG_INVALID_HANDLE: invalid handle
* ret       : HI_ERR_PNG_NULLPTR: invalid ptr
* others    :
*********************************************************************************************/
HI_S32 PngOsiGetStreamLen(HI_PNG_HANDLE s32Handle, HI_U32 u32Phyaddr, HI_U32 *pu32Len)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    PNG_BUF_HEAD_S *pstBufHead = NULL;
    HI_U32 u32BufPhyaddr = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    PNG_CHECK_OPEN();

    if (NULL == pu32Len)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pu32Len);
        return HI_ERR_PNG_NULLPTR;
    }

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    u32BufPhyaddr = pstInstance->u32StartBufPhyAddr;
    pstBufHead = (PNG_BUF_HEAD_S *)(pstInstance->pStartBufVir);

    while ((u32Phyaddr != u32BufPhyaddr) && (0 != u32BufPhyaddr))
    {
        u32BufPhyaddr = pstBufHead->u32NextPhyaddr;
        pstBufHead = (PNG_BUF_HEAD_S *)pstBufHead->pNextViraddr;
    }

    if (NULL == pstBufHead)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstBufHead);
        PNG_UP(&pstInstance->stInstanceLock);
        return HI_ERR_PNG_INVALID_PARAM;
    }

    *pu32Len = pstBufHead->u32StreamLen;

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/* get bytes according width and depths */
#define PNG_GETROWBYTES(u32RowBytes, u32PassWidth, u8PixelDepth) \
    do\
    {\
        if (u8PixelDepth >= 8)\
        {\
           u32RowBytes = u32PassWidth * u8PixelDepth >> 3;\
        }\
        else\
        {\
           u32RowBytes = (u32PassWidth * u8PixelDepth + 7) >> 3;\
        }\
    }while(0)

static HI_BOOL CheckGrayPixelDepth(HI_U8 u8PixelDepth)
{
    if ((u8PixelDepth == 1) || (u8PixelDepth == 2) || (u8PixelDepth == 4) || (u8PixelDepth == 8) || (u8PixelDepth == 16))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_BOOL CheckRgbPixelDepth(HI_U8 u8PixelDepth)
{
    if ((u8PixelDepth == 8) || (u8PixelDepth == 16))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_BOOL CheckClutPixelDepth(HI_U8 u8PixelDepth)
{
    if ((u8PixelDepth == 1) || (u8PixelDepth == 2) || (u8PixelDepth == 4) || (u8PixelDepth == 8))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_BOOL CheckAGrayPixelDepth(HI_U8 u8PixelDepth)
{
    if ((u8PixelDepth == 8) || (u8PixelDepth == 16))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_BOOL CheckArgbPixelDepth(HI_U8 u8PixelDepth)
{
    if ((u8PixelDepth == 8) || (u8PixelDepth == 16))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_S32 PngOsiGetPixelBitDepth(HI_PNG_DECINFO_S *pstDecInfo, HI_U8 *pu8BitDepth)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDecInfo, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pu8BitDepth, HI_FAILURE);

    switch (pstDecInfo->stPngInfo.eColorFmt)
    {
        case HI_PNG_IMAGEFMT_GRAY:
        {
            if (HI_FALSE == CheckGrayPixelDepth(pstDecInfo->stPngInfo.u8BitDepth))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckGrayPixelDepth,  FAILURE_TAG);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->stPngInfo.u8BitDepth);
                return HI_ERR_PNG_INVALID_PARAM;
            }

            *pu8BitDepth = pstDecInfo->stPngInfo.u8BitDepth;
            break;
        }
        case HI_PNG_IMAGEFMT_RGB:
        {
            if (HI_FALSE == CheckRgbPixelDepth(pstDecInfo->stPngInfo.u8BitDepth))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckRgbPixelDepth,  FAILURE_TAG);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->stPngInfo.u8BitDepth);
                return HI_ERR_PNG_INVALID_PARAM;
            }
            *pu8BitDepth = pstDecInfo->stPngInfo.u8BitDepth * 3;
            break;
        }
        case HI_PNG_IMAGEFMT_CLUT:
        {
            if (HI_FALSE == CheckClutPixelDepth(pstDecInfo->stPngInfo.u8BitDepth))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckClutPixelDepth,  FAILURE_TAG);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->stPngInfo.u8BitDepth);
                return HI_ERR_PNG_INVALID_PARAM;
            }
            *pu8BitDepth = pstDecInfo->stPngInfo.u8BitDepth;
            break;
        }
        case HI_PNG_IMAGEFMT_AGRAY:
        {
            if (HI_FALSE == CheckAGrayPixelDepth(pstDecInfo->stPngInfo.u8BitDepth))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckAGrayPixelDepth,  FAILURE_TAG);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->stPngInfo.u8BitDepth);
                return HI_ERR_PNG_INVALID_PARAM;
            }
            *pu8BitDepth = pstDecInfo->stPngInfo.u8BitDepth * 2;
            break;
        }
        case HI_PNG_IMAGEFMT_ARGB:
        {
            if (HI_FALSE == CheckArgbPixelDepth(pstDecInfo->stPngInfo.u8BitDepth))
            {
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckArgbPixelDepth,  FAILURE_TAG);
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->stPngInfo.u8BitDepth);
                return HI_ERR_PNG_INVALID_PARAM;
            }
            *pu8BitDepth = pstDecInfo->stPngInfo.u8BitDepth * 4;
            break;
        }
        default:
        {
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "PngOsiGetPixelBitDepth failure");
            return HI_ERR_PNG_INVALID_PARAM;
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_BOOL CheckAddr(HI_U32 u32Phyaddr)
{
    if ((0 != u32Phyaddr) && (0 == (u32Phyaddr & 0xf)))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_BOOL CheckStride(HI_U32 u32Stride)
{
    if ((0 != u32Stride) && (0 == (u32Stride & 0xf)))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_VOID UpdateTransInfo(HI_U16 *pu16Value, HI_U8 u8BitDepth)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pu16Value);

    if (u8BitDepth == 1)
    {
        *pu16Value *= 0xff;
    }
    else if (u8BitDepth == 2)
    {
        *pu16Value *= 0x55;
    }
    else
    {
        *pu16Value *= 0x11;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/********************************************************************************************
* func    : start decodr
* in      : s32Handle:  decoder handle
* in      : stDecInfo   decoder info
* out     :
* ret     : HI_SUCCESS  success
* ret     : HI_ERR_PNG_INVALID_HANDLE   invalid handle
* ret     : HI_ERR_PNG_NOMEM    no mem
* others  :
*********************************************************************************************/
HI_S32 PngOsiDecode(HI_PNG_HANDLE s32Handle, HI_PNG_DECINFO_S *pstDecInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_U32 u32FltPhyaddr = 0;
    HI_U32 u32RowBytes = 0;
    HI_U8 u8PixelDepth = 0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDecInfo, HI_ERR_PNG_NULLPTR);

    PNG_CHECK_OPEN();

    if (HI_FALSE == CheckAddr(pstDecInfo->u32Phyaddr))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, pstDecInfo->u32Phyaddr);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckAddr, FAILURE_TAG);
        return HI_ERR_PNG_INVALID_PARAM;
    }

    if (HI_FALSE == CheckStride(pstDecInfo->u32Stride))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecInfo->u32Stride);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CheckStride,  FAILURE_TAG);
        return HI_ERR_PNG_INVALID_PARAM;
    }

    /* alloc filter buf */
    s32Ret = PngOsiGetPixelBitDepth(pstDecInfo, &u8PixelDepth);
    if (s32Ret != HI_SUCCESS)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiGetPixelBitDepth,  FAILURE_TAG);
        return s32Ret;
    }

    PNG_GETROWBYTES(u32RowBytes, pstDecInfo->stPngInfo.u32Width, u8PixelDepth);

    if ((0 == u32RowBytes) || (u32RowBytes > (INT_MAX - 0xf)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32RowBytes);
        return s32Ret;
    }
    u32RowBytes = (u32RowBytes + 0xf) & ~0xf;

    s32Ret = PngOsiResAllocMem("PNG_FilterBuf", u32RowBytes, 16, &u32FltPhyaddr);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u32RowBytes);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResAllocMem, s32Ret);
        return s32Ret;
    }

    /* alloc device lock, attention release it after decoding*/
    PNG_DOWN_INTERRUPTIBLE(&g_DevMutex, s32Ret);
    if (s32Ret < 0)
    {
        PngOsiResReleaseMem(u32FltPhyaddr);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        PngOsiResReleaseMem(u32FltPhyaddr);
        PNG_UP(&g_DevMutex);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        PngOsiResReleaseMem(u32FltPhyaddr);
        PNG_UP(&g_DevMutex);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    pstInstance->eState = HI_PNG_STATE_DECING;

    /* no stream buf */
    if (0 == pstInstance->u32StartBufPhyAddr)
    {
        pstInstance->eState = HI_PNG_STATE_ERR;
        PngOsiResReleaseMem(u32FltPhyaddr);
        PNG_UP(&pstInstance->stInstanceLock);
        PNG_UP(&g_DevMutex);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, pstInstance->u32StartBufPhyAddr);
        return HI_ERR_PNG_NOSTREAM;
    }

    pstInstance->bSync          = pstDecInfo->bSync;
    pstInstance->u32Phyaddr     = pstDecInfo->u32Phyaddr;
    pstInstance->u32Stride      = pstDecInfo->u32Stride;
    pstInstance->u32ClutPhyaddr = pstDecInfo->stTransform.u32ClutPhyaddr;
    pstInstance->bClutAlpha     = pstDecInfo->stTransform.bClutAlpha;
    pstInstance->u32Transform   = pstDecInfo->stTransform.u32Transform;
    pstInstance->eOutFmt        = pstDecInfo->stTransform.eOutFmt;
    pstInstance->u32FilterBufPhyaddr = u32FltPhyaddr;

    HI_GFX_Memcpy(&(pstInstance->stPngInfo), &pstDecInfo->stPngInfo, sizeof(HI_PNG_INFO_S));

    pstInstance->u32HwUseBufPhyAddr = pstInstance->u32StartBufPhyAddr;
    pstInstance->pHwUseBufVir       = pstInstance->pStartBufVir;

    /* recoder active decoder */
    g_ActiveHandle = s32Handle;

    PngHalOpen();

    /* confiture registre, config png basic info*/
    PngHalSetImgInfo(pstDecInfo->stPngInfo);

#if 1
    /* revise transparency info : if 1/2/4bit gray , then convert it to 8bit*/
    if (   (pstDecInfo->stPngInfo.eColorFmt == HI_PNG_IMAGEFMT_GRAY)
        && (pstDecInfo->stPngInfo.u8BitDepth < 8)
        && (pstDecInfo->stTransform.u32Transform & HI_PNG_TRANSFORM_GRAY124TO8))
    {
        UpdateTransInfo(&pstDecInfo->stTransform.sTrnsInfo.u16Blue, pstDecInfo->stPngInfo.u8BitDepth);
    }

    if (pstDecInfo->stPngInfo.eColorFmt == HI_PNG_IMAGEFMT_GRAY)
    {
        pstDecInfo->stTransform.sTrnsInfo.u16Red = pstDecInfo->stTransform.sTrnsInfo.u16Blue;
        pstDecInfo->stTransform.sTrnsInfo.u16Green = pstDecInfo->stTransform.sTrnsInfo.u16Blue;
    }
#endif

    /* set convert fmt */
    PngHalSetTransform(pstDecInfo->stTransform);

    /* set bilter buffer address*/
    PngHalSetFltAddr(u32FltPhyaddr, u32RowBytes);

    /* set target buf and stride*/
    PngHalSetTgt(pstDecInfo->u32Phyaddr, pstDecInfo->u32Stride);

    /* set stream buf address*/
    PngHalSetStreamBuf(pstInstance->u32HwUseBufPhyAddr,
                       ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->u32BufSize);

    /* set stream buffer address*/
    PngHalSetStreamAddr(pstInstance->u32HwUseBufPhyAddr,
                        ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->u32StreamLen);

#ifdef CONFIG_GFX_PROC_SUPPORT
    gs_stPngProcInfo.eColorFmt       = pstInstance->stPngInfo.eColorFmt;
    gs_stPngProcInfo.eState          = pstInstance->eState;
    gs_stPngProcInfo.u32FlterPhyaddr = pstInstance->u32FilterBufPhyaddr;
    gs_stPngProcInfo.u32Size         = u32RowBytes;
    gs_stPngProcInfo.u32Height       = pstInstance->stPngInfo.u32Height;
    gs_stPngProcInfo.u32Width        = pstInstance->stPngInfo.u32Width;
    gs_stPngProcInfo.u32StreamBufPhyaddr = pstInstance->u32StartBufPhyAddr;
    gs_stPngProcInfo.u8BitDepth          = pstInstance->stPngInfo.u8BitDepth;
    gs_stPngProcInfo.u32ImagePhyaddr     = pstInstance->u32Phyaddr;
    gs_stPngProcInfo.u32Stride           = pstInstance->u32Stride;
    gs_stPngProcInfo.u32Transform        = pstInstance->u32Transform;
    gs_stPngProcInfo.bSync               = pstInstance->bSync;
    gs_stPngProcInfo.u16TrnsColorRed     = pstDecInfo->stTransform.sTrnsInfo.u16Red;
    gs_stPngProcInfo.u16TrnsColorGreen   = pstDecInfo->stTransform.sTrnsInfo.u16Green;
    gs_stPngProcInfo.u16TrnsColorBlue    = pstDecInfo->stTransform.sTrnsInfo.u16Blue;
    gs_stPngProcInfo.u16Filler           = pstDecInfo->stTransform.u16Filler;
#endif

    /* start to decoder*/
    PngHalStartDecode();
    /* wait until decoding */

    if (HI_FALSE == pstDecInfo->bSync)
    {
        PNG_UP(&pstInstance->stInstanceLock);

        PNG_UP(&g_DevMutex);

        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    s32Ret = PNG_WAIT_EVENT_INTERRUPTIBLE_TIMEOUT(g_PngWaitQueue, (HI_PNG_STATE_DECING != pstInstance->eState), msecs_to_jiffies(2000));
    if (s32Ret <= 0)
    {
        pstInstance->eState = HI_PNG_STATE_ERR;
        PNG_UP(&pstInstance->stInstanceLock);
        PNG_UP(&g_DevMutex);

        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_WAIT_EVENT_INTERRUPTIBLE_TIMEOUT,  FAILURE_TAG);
        return HI_ERR_PNG_INTERRUPT;
    }

    /* release hardware device */
    PNG_UP(&g_DevMutex);

    if (HI_PNG_STATE_FINISH != pstInstance->eState)
    {
        PNG_UP(&pstInstance->stInstanceLock);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        return HI_PNG_ERR_INTERNAL;
    }

    /* conver clut to RGB */
    if (   (HI_PNG_IMAGEFMT_CLUT == pstDecInfo->stPngInfo.eColorFmt)
        && (pstDecInfo->stTransform.u32Transform & HI_PNG_TRANSFORM_CLUT2RGB))
    {
        s32Ret = PngOsiClutToRgb(s32Handle);
        if (s32Ret < 0)
        {
            pstInstance->eState = HI_PNG_STATE_ERR;
        }
    }

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
EXPORT_SYMBOL(PngOsiDecode);

static TDE2_COLOR_FMT_E g_ClutToRgbTable[64] =
{
    TDE2_COLOR_FMT_ABGR4444, TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGRA4444, TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_ARGB4444, TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGBA4444, TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_ABGR1555, TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGRA1555, TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_ARGB1555, TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGBA1555, TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_BGR565,   TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGR565,   TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_RGB565,   TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGB565,   TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_BGR555,   TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGR555,   TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_RGB555,   TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGB555,   TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_BGR444,   TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGR444,   TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_RGB444,   TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGB444,   TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_ABGR8888, TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGRA8888, TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_ARGB8888, TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGBA8888, TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_ABGR8888, TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGRA8888, TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_ARGB8888, TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGBA8888, TDE2_COLOR_FMT_RGB888,
    TDE2_COLOR_FMT_ABGR8888, TDE2_COLOR_FMT_BGR888, TDE2_COLOR_FMT_BGRA8888, TDE2_COLOR_FMT_BGR888,
    TDE2_COLOR_FMT_ARGB8888, TDE2_COLOR_FMT_RGB888, TDE2_COLOR_FMT_RGBA8888, TDE2_COLOR_FMT_RGB888
};

static TDE2_COLOR_FMT_E GetCorlorFmtFormBitDepth(HI_U8 u8BitDepth)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    switch (u8BitDepth)
    {
        case 1:
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return TDE2_COLOR_FMT_CLUT1;
        }
        case 2:
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return TDE2_COLOR_FMT_CLUT2;
        }
        case 4:
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return TDE2_COLOR_FMT_CLUT4;
        }
        case 8:
        default:
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return TDE2_COLOR_FMT_CLUT8;
        }
    }
}

/* png hardwart not support clut to rgb, instead of TDE */
HI_S32 PngOsiClutToRgb(HI_PNG_HANDLE s32Handle)
{
    TDE_HANDLE s32TdeHandle = -1;
    TDE2_SURFACE_S stForeGround = {0};
    TDE2_SURFACE_S stDst = {0};
    TDE2_RECT_S stRect = {0};
    TDE2_OPT_S stOpt = {0};
    HI_U8 u8Index = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_SIZE_T clutPhyaddr;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance,  FAILURE_TAG);
        return s32Ret;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs->pfnTdeOpen, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs->pfnTdeBeginJob, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs->pfnTdeClose, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs->pfnTdeBlit, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_TdeExportFuncs->pfnTdeEndJob, HI_FAILURE);

    s32Ret = ps_TdeExportFuncs->pfnTdeOpen();
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, ps_TdeExportFuncs->pfnTdeOpen, s32Ret);
        return HI_PNG_ERR_INTERNAL;
    }

    s32Ret = ps_TdeExportFuncs->pfnTdeBeginJob(&s32TdeHandle);
    if (s32Ret < 0)
    {
        ps_TdeExportFuncs->pfnTdeClose();
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, ps_TdeExportFuncs->pfnTdeBeginJob, s32Ret);
        return HI_PNG_ERR_INTERNAL;
    }

    stForeGround.u32PhyAddr = pstInstance->u32Phyaddr;
    stForeGround.u32Stride  = pstInstance->u32Stride;
    stForeGround.u32Width   = pstInstance->stPngInfo.u32Width;
    stForeGround.u32Height  = pstInstance->stPngInfo.u32Height;
    clutPhyaddr             = pstInstance->u32ClutPhyaddr;
    stForeGround.pu8ClutPhyAddr = (HI_U8 *)clutPhyaddr;
    stForeGround.bAlphaMax255   = HI_TRUE;

    stForeGround.enColorFmt = GetCorlorFmtFormBitDepth(pstInstance->stPngInfo.u8BitDepth);

    if ((pstInstance->u32Transform & HI_PNG_TRANSFORM_STRIPALPHA) || !pstInstance->bClutAlpha)
    {
        u8Index |= 0x1;
    }

    if (pstInstance->u32Transform & HI_PNG_TRANSFORM_SWAPALPHA)
    {
        u8Index |= (0x1 << 1);
    }

    if (pstInstance->u32Transform & HI_PNG_TRANSFORM_BGR2RGB)
    {
        u8Index |= (0x1 << 2);
    }

    if (pstInstance->u32Transform & HI_PNG_TRANSFORM_8TO4)
    {
        u8Index |= (pstInstance->eOutFmt << 3);
    }
    else
    {
        u8Index |= (0x5 << 3);
    }

    HI_GFX_Memcpy(&stDst, &stForeGround, sizeof(TDE2_SURFACE_S));

    if (u8Index >= 64)
    {
       ps_TdeExportFuncs->pfnTdeClose();
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, u8Index);
       return HI_PNG_ERR_INTERNAL;
    }

    stDst.enColorFmt = g_ClutToRgbTable[u8Index];

    stRect.u32Width = pstInstance->stPngInfo.u32Width;
    stRect.u32Height = pstInstance->stPngInfo.u32Height;

    stOpt.bClutReload = HI_TRUE;
    stOpt.enOutAlphaFrom = TDE2_OUTALPHA_FROM_FOREGROUND;
    s32Ret = ps_TdeExportFuncs->pfnTdeBlit(s32TdeHandle, NULL, NULL, &stForeGround, &stRect, &stDst, &stRect, &stOpt);
    if (s32Ret < 0)
    {
        ps_TdeExportFuncs->pfnTdeCancelJob(s32TdeHandle);
        ps_TdeExportFuncs->pfnTdeClose();
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, ps_TdeExportFuncs->pfnTdeBlit, s32Ret);
        return HI_PNG_ERR_INTERNAL;
    }

    s32Ret = ps_TdeExportFuncs->pfnTdeEndJob(s32TdeHandle, HI_TRUE, 100, HI_FALSE, NULL, NULL);
    if (s32Ret < 0)
    {
        ps_TdeExportFuncs->pfnTdeCancelJob(s32TdeHandle);
        ps_TdeExportFuncs->pfnTdeClose();
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, ps_TdeExportFuncs->pfnTdeEndJob, s32Ret);
        return HI_PNG_ERR_INTERNAL;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

HI_VOID PngOsiIntHandle(HI_U32 u32Int)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    s32Ret = PngOsiResGetInstance(g_ActiveHandle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return;
    }

    if (HI_PNG_STATE_DECING != pstInstance->eState)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, pstInstance->eState);
        return;
    }

    /* interrupt for decoder finish the task */
    if (u32Int & PNG_INT_FINISH_MASK)
    {
        pstInstance->eState = HI_PNG_STATE_FINISH;

#ifdef CONFIG_GFX_PROC_SUPPORT
        if (PNG_IsProcOn())
        {
            gs_stPngProcInfo.eState = HI_PNG_STATE_FINISH;
        }
#endif

        PngHalSetClock(HI_FALSE);

        if (pstInstance->bSync || pstInstance->bInBlockQuery)
        {
            PNG_WAKE_UP_INTERRUPTIBLE(&g_PngWaitQueue);
        }

        if (!pstInstance->bSync)
        {
            PNG_UP(&g_DevMutex);
        }

        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    /* error interrout */
    if (u32Int & PNG_INT_ERR_MASK)
    {
        pstInstance->eState = HI_PNG_STATE_ERR;

#ifdef CONFIG_GFX_PROC_SUPPORT
        if (PNG_IsProcOn())
        {
            gs_stPngProcInfo.eState = HI_PNG_STATE_ERR;
        }
#endif

        /* hard reset  */
        if (pstInstance->bSync || pstInstance->bInBlockQuery)
        {
            PNG_WAKE_UP_INTERRUPTIBLE(&g_PngWaitQueue);
        }

        if (!pstInstance->bSync)
        {
            PNG_UP(&g_DevMutex);
        }
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    /* int for send stream */
    if (u32Int & PNG_INT_RESUME_MASK)
    {
        pstInstance->u32HwUseBufPhyAddr = ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->u32NextPhyaddr;
        pstInstance->pHwUseBufVir       = ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->pNextViraddr;

        if (pstInstance->u32HwUseBufPhyAddr && ((PNG_BUF_HEAD_S *)pstInstance->pHwUseBufVir)->u32StreamLen)
        {
            /* set stream buf address*/
            PngHalSetStreamBuf(pstInstance->u32HwUseBufPhyAddr,
                               ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->u32BufSize);

            /* set stream address*/
            PngHalSetStreamAddr(pstInstance->u32HwUseBufPhyAddr,
                                ((PNG_BUF_HEAD_S *)(pstInstance->pHwUseBufVir))->u32StreamLen);

            /* start send stream */
            PngHalResumeDecode();
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/********************************************************************************************
* func   : get decoding result
* in     : s32Handle       decoder handle
* in     : bBlock:         wether block
* out    : peDecResult:    decoding result
* ret    : HI_SUCCESS:     success
* ret    : HI_ERR_PNG_INVALID_HANDLE: invalid handle
* others :
*********************************************************************************************/
HI_S32 PngOsiGetResult(HI_PNG_HANDLE s32Handle, HI_BOOL bBlock, HI_PNG_STATE_E *peDecResult)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PNG_INSTANCE_S *pstInstance = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(peDecResult, HI_FAILURE);

    PNG_CHECK_OPEN();

    s32Ret = PngOsiResGetInstance(s32Handle, &pstInstance);
    if ((HI_SUCCESS != s32Ret) || (NULL == pstInstance))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PngOsiResGetInstance, s32Ret);
        return s32Ret;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    if (bBlock)
    {
        pstInstance->bInBlockQuery = HI_TRUE;
        PNG_WAIT_EVENT_INTERRUPTIBLE_TIMEOUT(g_PngWaitQueue, (HI_PNG_STATE_DECING != pstInstance->eState), (10000 * HZ / 1000));
        pstInstance->bInBlockQuery = HI_FALSE;
    }

    if (HI_PNG_STATE_FINISH != pstInstance->eState)
    {
        *peDecResult = pstInstance->eState;

        PNG_UP(&pstInstance->stInstanceLock);

        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    *peDecResult = pstInstance->eState;

    PNG_UP(&pstInstance->stInstanceLock);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
EXPORT_SYMBOL(PngOsiGetResult);

int PngOsiSuspend(HI_VOID)
{
    PNG_INSTANCE_S *pstInstance = NULL;
    HI_S32 s32Ret = HI_SUCCESS;

    if ((g_ActiveHandle <= 0) || (g_ActiveHandle > PNG_MAX_HANDLE))
    {
        HI_GFX_Print("png suspend ok\n");
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    s32Ret = PngOsiResGetInstance(g_ActiveHandle, &pstInstance);
    if ((s32Ret < 0) || (NULL == pstInstance))
    {
        HI_GFX_Print("png suspend ok\n");
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    PNG_DOWN_INTERRUPTIBLE(&pstInstance->stInstanceLock, s32Ret);
    if (s32Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, PNG_DOWN_INTERRUPTIBLE, s32Ret);
        return HI_ERR_PNG_INTERRUPT;
    }

    pstInstance->bInBlockQuery = HI_TRUE;

    PNG_UP(&pstInstance->stInstanceLock);

    s32Ret = wait_event_interruptible_timeout(g_PngWaitQueue, HI_PNG_STATE_DECING != pstInstance->eState, 1000);
    if (s32Ret <= 0)
    {
        HI_GFX_Print("\n");
    }

    pstInstance->bInBlockQuery = HI_FALSE;

    PngHalSetClock(HI_FALSE);

    HI_GFX_Print("png suspend ok\n");

    return HI_SUCCESS;
}

/* resume */
int pngOsiResume(HI_VOID)
{
    /* resume */
    if (atomic_read(&g_PngRef) > 0)
    {
        //PngHalReset();
        PngHalSetClock(HI_TRUE);
        /* set rle window address */
        PngHalSetRdcAddr(g_u32RdcBufPhyaddr);

        PngHalSetAxiAndTimeout();

        /* open all interrupt*/
        PngHalSetIntmask(0xffffffff);

        /* set err strategy: stopping when error is occoured */
        PngHalSetErrmode(0xffff0000);
    }

    HI_GFX_Print("png resume ok\n");

    return HI_SUCCESS;
}

HI_VOID PngOsiReset(HI_VOID)
{
    HI_U32 i = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    for (i = 0; i < PNG_MAX_HANDLE; i++)
    {
        PngOsiDestroyDecoder(i + 1);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
