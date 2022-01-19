/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name          : hi_gfx_decode.c
Version            : Initial Draft
Author             :
Created            : 2018/01/01
Description        : decode images
                     CNcomment: 解码图片 CNend\n
Function List      :
History            :
Date                            Author                     Modification
2018/01/01                      sdk                        Created file
*************************************************************************************************/


/***************************** add include here**************************************************/
#include "jpeg_decode.h"
#include "bmp_decode.h"

#include "hi_gfx_comm.h"
#include "hi_gfx_mem.h"
#include "hi_gfx_decode.h"
#include "hi_gfx_surface.h"
#include "hi_gfx_layer.h"

#include "hi_drv_disp.h"
#include "drv_disp_ext.h"

/***************************** Macro Definition *************************************************/
#include "hi_gfx_debug.h"
extern HI_U32 log_debug;

/***************************** Structure Definition *********************************************/
typedef enum tagGFX_IMGTYPE_E
{
    DEC_IMGTYPE_JPEG = 0,
    DEC_IMGTYPE_BMP,
    DEC_IMGTPYE_BUTT
}GFX_IMGTYPE_E;

typedef struct tagGFX_DEC_INSTANCE_S
{
    HI_U32  DecHandle;
    HI_S32 (*CreateDecode)  (HI_U32 *puDecHandle,HI_CHAR* pSrcBuf,HI_U32 u32SrcLen);
    HI_S32 (*DestroyDecode) (HI_U32 DecHandle);
    HI_S32 (*GetImageInfo)  (HI_U32 DecHandle, HI_HANDLE hSurface);
    HI_S32 (*StartDecode)   (HI_U32 DecHandle, HI_HANDLE hSurface);
}GFX_DEC_INSTANCE_S;

/***************************** Global Variable declaration **************************************/

/***************************** API forward declarations *****************************************/

static inline GFX_IMGTYPE_E GetImageType(HI_CHAR* pSrcAddr);
static HI_S32 GFX_CreateDecode(HI_HANDLE *pDecHandle,HI_CHAR* pSrcAddr,HI_U32 u32SrcLen);
static HI_S32 GFX_StartDecode(HI_HANDLE DecHandle,HI_HANDLE *pSurface);
static HI_S32 GFX_DestroyDecode(HI_HANDLE DecHandle);

/***************************** API realization **************************************************/
/***************************************************************************************
* func          : HI_GFX_DecImg
* description   : decode imag to surface
                  CNcomment: 解码图片到surface
                             只能支持24/32位的bmp图片和baseline格式的jpeg两种格式的图片解码，CNend\n
* param[in]     : DataBuf    CNcomment: 保存图片数据buffer CNend\n
* param[in]     : DataLen    CNcomment: 图片数据大小 CNend\n
* retval        : HI_SUCCESS
* retval        : HI_FAILURE
* others:       : NA
***************************************************************************************/
HI_S32 HI_GFX_DecImg(HI_U32 DataBuf, HI_U32 DataLen, HI_HANDLE *pSurface)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_HANDLE hDecHandle = HI_GFX_INVALID_HANDLE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_ENTER_FUNC);

    if ((0 == DataBuf) || (DataLen <= 4) || (NULL == pSurface))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, DataBuf);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, DataLen);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pSurface);
        return HI_FAILURE;
    }

    Ret = GFX_CreateDecode(&hDecHandle,(HI_CHAR*)DataBuf,DataLen);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX_CreateDecode, Ret);
        return HI_FAILURE;
    }

    Ret = GFX_StartDecode(hDecHandle, pSurface);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX_StartDecode, Ret);
        (HI_VOID)GFX_DestroyDecode(hDecHandle);
        return HI_FAILURE;
    }

    Ret = GFX_DestroyDecode(hDecHandle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFX_DestroyDecode, Ret);
        if (HI_GFX_INVALID_HANDLE != *pSurface)
        {
            HI_GFX_FreeSurface(*pSurface);
            *pSurface = HI_GFX_INVALID_HANDLE;
        }
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_UNF_EXIT_FUNC);

    return HI_SUCCESS;
}

static HI_S32 GFX_CreateDecode(HI_HANDLE *pDecHandle,HI_CHAR* pSrcAddr,HI_U32 u32SrcLen)
{
    HI_S32 Ret = HI_SUCCESS;
    GFX_IMGTYPE_E ImgType = DEC_IMGTYPE_JPEG;
    GFX_DEC_INSTANCE_S *pstDecInstance = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pDecHandle, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pSrcAddr, HI_FAILURE);

    pstDecInstance = (GFX_DEC_INSTANCE_S*)HI_GFX_Malloc(sizeof(GFX_DEC_INSTANCE_S),"decode-handle");
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDecInstance, HI_FAILURE);

    *pDecHandle = (HI_HANDLE)pstDecInstance;
    HI_GFX_Memset((HI_VOID*)pstDecInstance,0x0,sizeof(GFX_DEC_INSTANCE_S));

    ImgType = GetImageType(pSrcAddr);
    if (DEC_IMGTYPE_JPEG == ImgType)
    {
        pstDecInstance->CreateDecode   = JPEG_ADP_CreateDecode;
        pstDecInstance->DestroyDecode  = JPEG_ADP_DestroyDecode;
        pstDecInstance->GetImageInfo   = JPEG_ADP_GetImgInfo;
        pstDecInstance->StartDecode    = JPEG_ADP_StartDecode;
    }
    else if (DEC_IMGTYPE_BMP == ImgType)
    {
        pstDecInstance->CreateDecode   = BMP_ADP_CreateDecode;
        pstDecInstance->DestroyDecode  = BMP_ADP_DestroyDecode;
        pstDecInstance->GetImageInfo   = BMP_ADP_GetImgInfo;
        pstDecInstance->StartDecode    = BMP_ADP_StartDecode;
    }
    else
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GetImageType, Ret);
        goto ERROR_EXIT;
    }

    Ret = pstDecInstance->CreateDecode(&(pstDecInstance->DecHandle),pSrcAddr,u32SrcLen);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, CreateDecode, Ret);
        goto ERROR_EXIT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return HI_SUCCESS;

ERROR_EXIT:

    if (NULL != pstDecInstance)
    {
        HI_GFX_Free((HI_CHAR*)pstDecInstance);
        pstDecInstance = NULL;
    }

    *pDecHandle = HI_GFX_INVALID_HANDLE;

    return HI_FAILURE;
}

static inline GFX_IMGTYPE_E GetImageType(HI_CHAR* pSrcAddr)
{
    HI_CHAR HeadInfo[4] = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL == pSrcAddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pSrcAddr);
        return DEC_IMGTPYE_BUTT;
    }

    HI_GFX_Memcpy(HeadInfo,pSrcAddr,4);

    if ((0xFF == *((HI_U8*)HeadInfo)) && (0xD8 == *((HI_U8*)(HeadInfo + 1))))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return DEC_IMGTYPE_JPEG;
    }

    if ((0x42 == *((HI_U8*)HeadInfo)) && (0x4d == *((HI_U8*)(HeadInfo + 1))))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return DEC_IMGTYPE_BMP;
    }

    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "input image is not jpeg or bmp type");

    return DEC_IMGTPYE_BUTT;
}

static HI_S32 GFX_StartDecode(HI_HANDLE DecHandle,HI_HANDLE *pSurface)
{
    HI_S32 Ret     = HI_SUCCESS;
    HI_U32 MemSize = 0;
    HI_LOGO_SURFACE_S *pstDecSurface = NULL;
    HI_HANDLE hSurface = HI_GFX_INVALID_HANDLE;
    GFX_DEC_INSTANCE_S *pstDecInstance = (GFX_DEC_INSTANCE_S*)DecHandle;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDecInstance, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pSurface, HI_FAILURE);

    /** create decode surface
     ** 创建解码surface
     **/
    hSurface = (HI_HANDLE)HI_GFX_Malloc(sizeof(HI_LOGO_SURFACE_S),"decode-surface-handle");
    if (NULL == (HI_VOID*)hSurface)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }
    else
    {
        *pSurface = hSurface;
        pstDecSurface = (HI_LOGO_SURFACE_S*)hSurface;
    }
    HI_GFX_Memset((HI_VOID*)hSurface,0x0,sizeof(HI_LOGO_SURFACE_S));

    /** get image information
     ** 获取图片信息
     **/
    Ret = pstDecInstance->GetImageInfo(pstDecInstance->DecHandle,hSurface);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GetImageInfo, Ret);
        goto ERROR_EXIT;
    }

    /** calc dec surface need memory size
     ** 计算需要分配的内存大小
     **/
    if ((0 == (pstDecSurface->u32Size[0])) || ((pstDecSurface->u32Size[0]) > (UINT_MAX - (pstDecSurface->u32Size[1]))))
    {
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecSurface->u32Size[0]);
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecSurface->u32Size[1]);
        goto ERROR_EXIT;
    }
    MemSize = pstDecSurface->u32Size[0] + pstDecSurface->u32Size[1];
    if ((MemSize) > (UINT_MAX - (pstDecSurface->u32Size[2])))
    {
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, MemSize);
        HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, pstDecSurface->u32Size[2]);
        goto ERROR_EXIT;
    }
    MemSize = MemSize + pstDecSurface->u32Size[2];
    if (0 == MemSize)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, MemSize);
        goto ERROR_EXIT;
    }

    /** alloc dec y_buf. u_buf. v_buf
     ** 计算解码需要的buffer
     **/
    pstDecSurface->pPhyAddr[0] = (HI_CHAR*)HI_GFX_MMZ_Malloc(MemSize, "decode-out-buf");
    pstDecSurface->pVirAddr[0] = pstDecSurface->pPhyAddr[0];
    if (NULL == pstDecSurface->pPhyAddr[0])
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, MemSize);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_MMZ_Malloc, FAILURE_TAG);
        goto ERROR_EXIT;
    }

    if (HI_GFX_DEBUG_LEVEL_3 == log_debug)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "i am here");
        HI_GFX_Memset(pstDecSurface->pPhyAddr[0], 0xaa, MemSize);
    }

    pstDecSurface->pPhyAddr[1] = pstDecSurface->pPhyAddr[0] + pstDecSurface->u32Size[0];
    pstDecSurface->pVirAddr[1] = pstDecSurface->pVirAddr[0] + pstDecSurface->u32Size[0];
    pstDecSurface->pPhyAddr[2] = pstDecSurface->pPhyAddr[1] + pstDecSurface->u32Size[0] + pstDecSurface->u32Size[1];
    pstDecSurface->pVirAddr[2] = pstDecSurface->pVirAddr[1] + pstDecSurface->u32Size[0] + pstDecSurface->u32Size[1];

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================================================");
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input image information");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, pstDecSurface->pPhyAddr[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, pstDecSurface->pPhyAddr[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, pstDecSurface->pPhyAddr[2]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Width[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Height[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Stride[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Width[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Height[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Stride[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Size[0]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->u32Size[1]);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDecSurface->enPixelFormat);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================================================");

    /** decode image data to decode surface
     ** 将图片数据解码输出到解码surface中
     **/
    Ret = pstDecInstance->StartDecode(pstDecInstance->DecHandle,hSurface);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pstDecInstance->StartDecode, Ret);
        goto ERROR_EXIT;
    }

    if (HI_GFX_DEBUG_LEVEL_4 == log_debug)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "i am here");
        HI_GFX_Memcmp(pstDecSurface->pPhyAddr[0], MemSize);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return HI_SUCCESS;

ERROR_EXIT:

    if (HI_GFX_INVALID_HANDLE != hSurface)
    {
        HI_GFX_FreeSurface(hSurface);
    }

    *pSurface = HI_GFX_INVALID_HANDLE;

    return HI_FAILURE;
}

static HI_S32 GFX_DestroyDecode(HI_HANDLE DecHandle)
{
    HI_S32 Ret = HI_SUCCESS;
    GFX_DEC_INSTANCE_S *pstDecInstance = (GFX_DEC_INSTANCE_S*)DecHandle;
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDecInstance, HI_FAILURE);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    Ret = pstDecInstance->DestroyDecode(pstDecInstance->DecHandle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pstDecInstance->DestroyDecode, Ret);
        HI_GFX_Free((HI_CHAR*)pstDecInstance);
        return HI_FAILURE;
    }

    HI_GFX_Free((HI_CHAR*)pstDecInstance);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

    return HI_SUCCESS;
}


/*****************************************************************************
* func	       :  HI_BOOT_GFX_IsSupport4KLOGO
* description  :  check whether this decode surface can support 4k output
                  CNcomment:判断这个解码surface是否支持4K输出CNend\n
*para[in]      : DecSurface
*para[ou]      : pSupport4k
* retval	   :  HI_SUCCESS
                  HI_FAILURE
* others:	   :  NA
*****************************************************************************/
HI_VOID HI_BOOT_GFX_IsSupport4KLOGO(HI_HANDLE DecSurface, HI_BOOL *pSupport4k)
{
     HI_DISP_DISPLAY_INFO_S stInfo = {0};
     HI_LOGO_SURFACE_S *pstSrcSurface = (HI_LOGO_SURFACE_S *)DecSurface;
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstSrcSurface);
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pSupport4k);
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_DISP_GetDisplayInfo(HI_DRV_DISPLAY_1, &stInfo);

#ifdef CONFIG_GFX_SUPPORT_VO_4K
     if (   (CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH == pstSrcSurface->u32Width[0] || CONFIG_GFX_DISP_4K_VIRTUAL_WIDTH == pstSrcSurface->u32Width[0])
         && (CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH == stInfo.stFmtResolution.s32Width || CONFIG_GFX_DISP_4K_VIRTUAL_WIDTH == stInfo.stFmtResolution.s32Width)
         && (CONFIG_GFX_DISP_4K_VIRTUAL_HEIGHT == pstSrcSurface->u32Height[0])
         && (CONFIG_GFX_DISP_4K_VIRTUAL_HEIGHT == stInfo.stFmtResolution.s32Height))
     {
          *pSupport4k = HI_TRUE;
     }
     else
#endif
     {
          *pSupport4k = HI_FALSE;
     }

     HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================================================");
     HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcSurface->u32Width[0]);
     HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcSurface->u32Height[0]);
     HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInfo.stFmtResolution.s32Width);
     HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInfo.stFmtResolution.s32Height);
     HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================================================");

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);

     return;
}
