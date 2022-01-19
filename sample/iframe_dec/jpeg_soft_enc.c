/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name       : sample_enc_api.c
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                Author              Modification
2018/01/01          sdk                 Created file
*************************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <setjmp.h>
#include <sys/time.h>

#include "hi_type.h"
#include "hi_jpge_api.h"
#include "hi_jpge_type.h"
#include "hi_jpge_errcode.h"

#include "hi_tde_api.h"
#include "hi_tde_errcode.h"
#include "hi_tde_type.h"

#include "jpeglib.h"
#include "jerror.h"
#include "jpeg_soft_enc.h"

#include "hi_common.h"

/***************************** Macro Definition *************************************************/
#define SAMPLE_TRACE                  printf

/*************************** Structure Definition ***********************************************/

typedef struct tagJPEG_MYERR_S
{
    struct jpeg_error_mgr pub;
}JPEG_MYERR_S;

typedef struct tagSAMPLE_JPGE_INFO_S
{
    HI_U32  YuvSampleType;
    HI_U32  YuvFmtType;
    HI_U32  Qlevel;

    HI_U32  Width[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  Height[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  Stride[JPGE_INPUT_COMPONENT_NUM];
    HI_U32  PhyBuf[JPGE_INPUT_COMPONENT_NUM];

    HI_U32  OutWidth;
    HI_U32  OutHeight;
    HI_U32  OutStride;
    HI_U32  OutPhyBuf;
    HI_CHAR *pOutVirBuf;
    HI_CHAR *pOutFileName;
}SAMPLE_JPGE_INFO_S;

/********************** Global Variable declaration *********************************************/

static jmp_buf gs_enc_setjmp_buffer;

/******************************* API declaration ************************************************/
static TDE2_MB_COLOR_FMT_E GetTdeFmt(HI_U32 YuvFmtType)
{
    if (JPGE_INPUT_FMT_YUV420 == YuvFmtType)
    {
        return TDE2_MB_COLOR_FMT_JPG_YCbCr420MBP;
    }

    return TDE2_MB_COLOR_FMT_BUTT;
}

static HI_S32 YuvToRgb(SAMPLE_JPGE_INFO_S *pstInputInfo)
{
    HI_S32 Ret =  HI_SUCCESS;
    TDE2_MB_S SrcSurface;
    TDE2_SURFACE_S DstSurface;
    TDE2_RECT_S SrcRect,DstRect;
    TDE2_MBOPT_S stMbOpt;
    TDE_HANDLE s32Handle;

    if (JPGE_INPUT_FMT_YUV420 != pstInputInfo->YuvFmtType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (JPGE_INPUT_SAMPLER_SEMIPLANNAR != pstInputInfo->YuvSampleType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    memset(&SrcRect,    0,   sizeof(SrcRect));
    memset(&DstRect,    0,   sizeof(DstRect));
    memset(&SrcSurface, 0,   sizeof(SrcSurface));
    memset(&DstSurface, 0,   sizeof(DstSurface));
    memset(&stMbOpt,    0,   sizeof(stMbOpt));

    SrcSurface.u32YWidth      = pstInputInfo->Width[0];
    SrcSurface.u32YHeight     = pstInputInfo->Height[0];
    SrcSurface.u32YStride     = pstInputInfo->Stride[0];
    SrcSurface.u32CbCrStride  = pstInputInfo->Stride[1];
    SrcSurface.u32YPhyAddr    = pstInputInfo->PhyBuf[0];
    SrcSurface.u32CbCrPhyAddr = pstInputInfo->PhyBuf[1];
    SrcSurface.enMbFmt        = GetTdeFmt(pstInputInfo->YuvFmtType);

    DstSurface.u32Width       = pstInputInfo->Width[0];
    DstSurface.u32Height      = pstInputInfo->Height[0];
    DstSurface.u32Stride      = pstInputInfo->OutStride;
    DstSurface.u32PhyAddr     = pstInputInfo->OutPhyBuf;
    DstSurface.enColorFmt     = TDE2_COLOR_FMT_BGR888;
    DstSurface.pu8ClutPhyAddr = NULL;
    DstSurface.bYCbCrClut     = HI_FALSE;
    DstSurface.bAlphaMax255   = HI_TRUE;
    DstSurface.bAlphaExt1555  = HI_TRUE;
    DstSurface.u8Alpha0       = 0;
    DstSurface.u8Alpha1       = 255;
    DstSurface.u32CbCrPhyAddr = 0;
    DstSurface.u32CbCrStride  = 0;

    SrcRect.s32Xpos   = 0;
    SrcRect.s32Ypos   = 0;
    SrcRect.u32Width  = SrcSurface.u32YWidth;
    SrcRect.u32Height = SrcSurface.u32YHeight;
    DstRect.s32Xpos   = 0;
    DstRect.s32Ypos   = 0;
    DstRect.u32Width  = DstSurface.u32Width;
    DstRect.u32Height = DstSurface.u32Height;

    Ret = HI_TDE_Open();
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    s32Handle = HI_TDE2_BeginJob();
    if (HI_ERR_TDE_INVALID_HANDLE == s32Handle)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        HI_TDE_Close();
        return HI_FAILURE;
    }

    stMbOpt.enResize = TDE2_MBRESIZE_NONE;
    Ret = HI_TDE2_MbBlit(s32Handle, &SrcSurface, &SrcRect, &DstSurface, &DstRect, &stMbOpt);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        HI_TDE_Close();
        return HI_FAILURE;
    }

    Ret = HI_TDE2_EndJob(s32Handle, HI_TRUE, HI_TRUE, 1000);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        HI_TDE_Close();
        return HI_FAILURE;
    }

    HI_TDE_Close();

    return HI_SUCCESS;
}

/****************************************************************************
* func          : jpeg_enc_err
* description   : CNcomment: ���������� CNend\n
* param[in]     : NA
* retval        : NA
* others:       : NA
******************************************************************************/
static HI_VOID jpeg_enc_err(j_common_ptr cinfo)
{
    (*cinfo->err->output_message)(cinfo);
    longjmp(gs_enc_setjmp_buffer, 1);
}

/****************************************************************************
* func          : JPEG_SoftEncToFile
* description   : CNcomment: JPEG������� CNend\n
* param[in]     : NA
* retval        : NA
* others:       : NA
******************************************************************************/
static HI_S32 JPEG_SoftEncToFile(SAMPLE_JPGE_INFO_S *pstInputInfo)
{
    struct jpeg_compress_struct cinfo;
    JPEG_MYERR_S jerr;
    FILE *pOutFile    = NULL;
    JSAMPROW pRowBuf[1];
    HI_S32 Quality = 80;
    HI_S32 EncSuccess = HI_SUCCESS;
    HI_CHAR* pInputData = NULL;

    pOutFile = fopen(pstInputInfo->pOutFileName, "wb+");
    if (NULL == pOutFile)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    cinfo.err = jpeg_std_error(&jerr.pub);
    jerr.pub.error_exit = jpeg_enc_err;

    if (setjmp(gs_enc_setjmp_buffer))
    {
        EncSuccess = HI_FAILURE;
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ENCODE_EXIT;
    }

    jpeg_create_compress(&cinfo);

    jpeg_stdio_dest(&cinfo, pOutFile);

    cinfo.image_width      = pstInputInfo->OutWidth;
    cinfo.image_height     = pstInputInfo->OutHeight;
    cinfo.in_color_space   = JCS_RGB;
    cinfo.input_components = 3;

    jpeg_set_defaults(&cinfo);

    if ((0 == pstInputInfo->Qlevel) || (pstInputInfo->Qlevel >= 100))
    {
        Quality = 80;
    }
    else
    {
        Quality = pstInputInfo->Qlevel;
    }

    jpeg_set_quality(&cinfo, Quality, TRUE);

    jpeg_start_compress(&cinfo, TRUE);

    pInputData = pstInputInfo->pOutVirBuf;

    while (cinfo.next_scanline < cinfo.image_height)
    {
        pRowBuf[0] = (JSAMPLE FAR*)(&(pInputData[cinfo.next_scanline * pstInputInfo->OutStride]));
        jpeg_write_scanlines(&cinfo, pRowBuf, 1);
    }

    jpeg_finish_compress(&cinfo);

ENCODE_EXIT:

    jpeg_destroy_compress(&cinfo);

    if (NULL != pOutFile)
    {
        fclose(pOutFile);
        pOutFile = NULL;
    }

    return EncSuccess;
}

/****************************************************************************
* func          : JPEG_SoftEncToMem
* description   : CNcomment: JPEG������� CNend\n
* param[in]     : NA
* retval        : NA
* others:       : NA
******************************************************************************/
static HI_S32 JPEG_SoftEncToMem(SAMPLE_JPGE_INFO_S *pstInputInfo, HI_U8 **ppOutBuffer, HI_U32 *pBufferSize)
{
    struct jpeg_compress_struct cinfo;
    JPEG_MYERR_S jerr;
    JSAMPROW pRowBuf[1];
    HI_S32 Quality = 80;
    HI_S32 EncSuccess = HI_SUCCESS;
    HI_CHAR* pInputData = NULL;
    HI_U64 OutBufferSize = 0;

    cinfo.err = jpeg_std_error(&jerr.pub);
    jerr.pub.error_exit = jpeg_enc_err;

    if (setjmp(gs_enc_setjmp_buffer))
    {
        EncSuccess = HI_FAILURE;
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ENCODE_EXIT;
    }

    jpeg_create_compress(&cinfo);

    jpeg_mem_dest(&cinfo, ppOutBuffer, (long unsigned int *)&OutBufferSize);

    cinfo.image_width      = pstInputInfo->OutWidth;
    cinfo.image_height     = pstInputInfo->OutHeight;
    cinfo.in_color_space   = JCS_RGB;
    cinfo.input_components = 3;

    jpeg_set_defaults(&cinfo);

    if ((0 == pstInputInfo->Qlevel) || (pstInputInfo->Qlevel >= 100))
    {
        Quality = 80;
    }
    else
    {
        Quality = pstInputInfo->Qlevel;
    }

    jpeg_set_quality(&cinfo, Quality, TRUE);

    jpeg_start_compress(&cinfo, TRUE);

    pInputData = pstInputInfo->pOutVirBuf;

    while (cinfo.next_scanline < cinfo.image_height)
    {
        pRowBuf[0] = (JSAMPLE FAR*)(&(pInputData[cinfo.next_scanline * pstInputInfo->OutStride]));
        jpeg_write_scanlines(&cinfo, pRowBuf, 1);
    }

    jpeg_finish_compress(&cinfo);

    if (OutBufferSize > 0xffffffff)
    {
        SAMPLE_TRACE("outbuffer is too large\n");
        goto FREE_BUFFER;
    }

    *pBufferSize = OutBufferSize;

ENCODE_EXIT:

    jpeg_destroy_compress(&cinfo);

    return EncSuccess;

FREE_BUFFER:
    free(ppOutBuffer);
    ppOutBuffer = HI_NULL;

    return HI_FAILURE;
}


/****************************************************************************
* func          : HI_SAMPLE_Encode
* description   : CNcomment: �����jpegͼƬ CNend\n
* param[in]     : ֻ֧��YUV420 SP��ʽ������
* retval        : NA
* others:       : NA
******************************************************************************/
HI_S32 JPEG_Soft_EncToFile(HI_CHAR *pOutFileName, SAMPLE_VIDEO_FREMAE_INFO_S *pstVideoFrameInfo)
{
    HI_S32 Ret = HI_SUCCESS;
    SAMPLE_JPGE_INFO_S stJpgeInput;

    if ((NULL == pOutFileName) || (NULL == pstVideoFrameInfo))
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (pstVideoFrameInfo->Stride[0] != pstVideoFrameInfo->Stride[1])
    {/** it is not yuv420 sp **/
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (0 != pstVideoFrameInfo->PhyBuf[2])
    {/** it is not yuv420 sp **/
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (JPGE_INPUT_FMT_YUV420 != pstVideoFrameInfo->YuvFmtType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (JPGE_INPUT_SAMPLER_SEMIPLANNAR != pstVideoFrameInfo->YuvSampleType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    memset(&stJpgeInput,0,sizeof(stJpgeInput));

    stJpgeInput.YuvFmtType    = pstVideoFrameInfo->YuvFmtType;
    stJpgeInput.YuvSampleType = pstVideoFrameInfo->YuvSampleType;
    stJpgeInput.Qlevel        = pstVideoFrameInfo->Qlevel;

    stJpgeInput.Width[0]  = pstVideoFrameInfo->Width[0];
    stJpgeInput.Height[0] = pstVideoFrameInfo->Height[0];
    stJpgeInput.Stride[0] = pstVideoFrameInfo->Stride[0];
    stJpgeInput.PhyBuf[0] = pstVideoFrameInfo->PhyBuf[0];

    stJpgeInput.Width[1]  = pstVideoFrameInfo->Width[1];
    stJpgeInput.Height[1] = pstVideoFrameInfo->Height[1];
    stJpgeInput.Stride[1] = pstVideoFrameInfo->Stride[1];
    stJpgeInput.PhyBuf[1] = pstVideoFrameInfo->PhyBuf[1];

    stJpgeInput.pOutFileName = pOutFileName;
    stJpgeInput.OutWidth  = pstVideoFrameInfo->Width[0];
    stJpgeInput.OutHeight = pstVideoFrameInfo->Height[0];
    stJpgeInput.OutStride = (stJpgeInput.OutWidth * 3 + 16 - 1) & (~(16 - 1));

    stJpgeInput.OutPhyBuf = (HI_U32)HI_MMZ_New(stJpgeInput.OutStride * stJpgeInput.OutHeight, 64, NULL, "sample_enc_jpeg");
    if (0 == stJpgeInput.OutPhyBuf)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    stJpgeInput.pOutVirBuf = (HI_CHAR*)HI_MMZ_Map(stJpgeInput.OutPhyBuf, HI_FALSE);
    if (NULL == stJpgeInput.pOutVirBuf)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    Ret = YuvToRgb(&stJpgeInput);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    Ret = JPEG_SoftEncToFile(&stJpgeInput);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    if (NULL != stJpgeInput.pOutVirBuf)
    {
        HI_MMZ_Unmap(stJpgeInput.OutPhyBuf);
    }

    if (0 != stJpgeInput.OutPhyBuf)
    {
        HI_MMZ_Delete(stJpgeInput.OutPhyBuf);
    }

    return HI_SUCCESS;

ERR_EXIT:
    if (NULL != stJpgeInput.pOutVirBuf)
    {
        HI_MMZ_Unmap(stJpgeInput.OutPhyBuf);
    }

    if (0 != stJpgeInput.OutPhyBuf)
    {
        HI_MMZ_Delete(stJpgeInput.OutPhyBuf);
    }

    SAMPLE_TRACE("save %s failure\n",stJpgeInput.pOutFileName);

    return HI_FAILURE;
}

/****************************************************************************
* func          : HI_SAMPLE_Encode
* description   : CNcomment: �����jpegͼƬ CNend\n
* param[in]     : ֻ֧��YUV420 SP��ʽ������
* retval        : NA
* others:       : NA
******************************************************************************/
HI_S32 JPEG_Soft_EncToMem(SAMPLE_VIDEO_FREMAE_INFO_S *pstVideoFrameInfo, HI_U8 **ppOutBuffer, HI_U32 *pBufferSize)
{
    HI_S32 Ret = HI_SUCCESS;
    SAMPLE_JPGE_INFO_S stJpgeInput;

    if (NULL == pstVideoFrameInfo)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (pstVideoFrameInfo->Stride[0] != pstVideoFrameInfo->Stride[1])
    {/** it is not yuv420 sp **/
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (0 != pstVideoFrameInfo->PhyBuf[2])
    {/** it is not yuv420 sp **/
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (JPGE_INPUT_FMT_YUV420 != pstVideoFrameInfo->YuvFmtType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    if (JPGE_INPUT_SAMPLER_SEMIPLANNAR != pstVideoFrameInfo->YuvSampleType)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        return HI_FAILURE;
    }

    memset(&stJpgeInput,0,sizeof(stJpgeInput));

    stJpgeInput.YuvFmtType    = pstVideoFrameInfo->YuvFmtType;
    stJpgeInput.YuvSampleType = pstVideoFrameInfo->YuvSampleType;
    stJpgeInput.Qlevel        = pstVideoFrameInfo->Qlevel;

    stJpgeInput.Width[0]  = pstVideoFrameInfo->Width[0];
    stJpgeInput.Height[0] = pstVideoFrameInfo->Height[0];
    stJpgeInput.Stride[0] = pstVideoFrameInfo->Stride[0];
    stJpgeInput.PhyBuf[0] = pstVideoFrameInfo->PhyBuf[0];

    stJpgeInput.Width[1]  = pstVideoFrameInfo->Width[1];
    stJpgeInput.Height[1] = pstVideoFrameInfo->Height[1];
    stJpgeInput.Stride[1] = pstVideoFrameInfo->Stride[1];
    stJpgeInput.PhyBuf[1] = pstVideoFrameInfo->PhyBuf[1];

    stJpgeInput.OutWidth  = pstVideoFrameInfo->Width[0];
    stJpgeInput.OutHeight = pstVideoFrameInfo->Height[0];
    stJpgeInput.OutStride = (stJpgeInput.OutWidth * 3 + 16 - 1) & (~(16 - 1));

    stJpgeInput.OutPhyBuf = (HI_U32)HI_MMZ_New(stJpgeInput.OutStride * stJpgeInput.OutHeight, 64, NULL, "sample_enc_jpeg");
    if (0 == stJpgeInput.OutPhyBuf)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    stJpgeInput.pOutVirBuf = (HI_CHAR*)HI_MMZ_Map(stJpgeInput.OutPhyBuf, HI_FALSE);
    if (NULL == stJpgeInput.pOutVirBuf)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    Ret = YuvToRgb(&stJpgeInput);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    Ret = JPEG_SoftEncToMem(&stJpgeInput, ppOutBuffer, pBufferSize);
    if (HI_SUCCESS != Ret)
    {
        SAMPLE_TRACE("\n[%s %d] --------->failure\n",__FUNCTION__,__LINE__);
        goto ERR_EXIT;
    }

    printf("OutBufferSize:%u\n", *pBufferSize);

    if (NULL != stJpgeInput.pOutVirBuf)
    {
        HI_MMZ_Unmap(stJpgeInput.OutPhyBuf);
    }

    if (0 != stJpgeInput.OutPhyBuf)
    {
        HI_MMZ_Delete(stJpgeInput.OutPhyBuf);
    }

    return HI_SUCCESS;

ERR_EXIT:
    if (NULL != stJpgeInput.pOutVirBuf)
    {
        HI_MMZ_Unmap(stJpgeInput.OutPhyBuf);
    }

    if (0 != stJpgeInput.OutPhyBuf)
    {
        HI_MMZ_Delete(stJpgeInput.OutPhyBuf);
    }

    SAMPLE_TRACE("enc failure\n");

    return HI_FAILURE;
}

