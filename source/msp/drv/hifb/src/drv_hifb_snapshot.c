/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name      : drv_hifb_snapshot.c
Version        : Initial Draft
Author         :
Created        : 2018/01/01
Description    :
Function List  :


History         :
Date                  Author                Modification
2018/01/01            sdk                   Created file
***************************************************************************************************/

/*********************************add include here*************************************************/
#if defined(CONFIG_GFX_PROC_SUPPORT) || defined(CONFIG_HIFB_CAPTURE_BMP_SUPPORT)
#include <linux/string.h>
#include "hifb.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_proc.h"
#include "hi_drv_file.h"
#include "drv_hifb_debug.h"
#include "drv_hifb_wbc.h"

/***************************** Macro Definition ***************************************************/
#ifdef CFG_HIFB_ANDROID_SUPPORT
#define CONFIG_HIFB_SAVE_DIR      "/data"
#else
#define CONFIG_HIFB_SAVE_DIR      "/tmp"
#endif
#endif

#if defined(CONFIG_GFX_PROC_SUPPORT) && defined(CONFIG_HIFB_CAPTURE_BMP_SUPPORT)
/*************************** Structure Definition *************************************************/
typedef struct  tagBITMAPFILEHEADER{
    HI_U16 u16Type;                /*文件类型，设为0x4D42                   */
    HI_U32 u32Size;                /*文件大小，像素数据加上头文件大小sizeof */
    HI_U16 u16Reserved1;           /*保留位                                 */
    HI_U16 u16Reserved2;           /*保留位                                 */
    HI_U32 u32OffBits;             /*文件头到实际位图数据的偏移量           */
}__attribute__((packed)) BMP_BMFHEADER_S;

typedef  struct tagBITMAPINFOHEADER{
    HI_U32 u32Size;             /*位图信息头的大小,sizeof(BMP_BMIHEADER_S) */
    HI_U32 u32Width;            /*图像宽度                                 */
    HI_U32 u32Height;           /*图像高度                                 */
    HI_U16 u32Planes;           /*位图位面数，设为1                        */
    HI_U16 u32PixbitCount;      /*每个像素的位数，如RGB8888就是32          */
    HI_U32 u32Compression;      /*位图数据压缩类型，设为0，表示不会压缩    */
    HI_U32 u32SizeImage;        /*位图数据大小，设为0                      */
    HI_U32 u32XPelsPerMeter;    /*位图水平分辨率，与图像宽度相同           */
    HI_U32 u32YPelsPerMeter;    /*位图垂直分辨率，与图像高度相同           */
    HI_U32 u32ClrUsed;          /*说明位图实际使用的彩色表中的颜色索引数，设为0*/
    HI_U32 u32ClrImportant;     /*对图像显示很重要的颜色索引数，设为0      */
} BMP_BMIHEADER_S;

/********************** Global Variable declaration ***********************************************/

extern DRV_HIFB_WBC_GFX_S g_stGfxWbc2;
extern HIFB_DRV_TDEOPS_S g_stGfx2dCallBackFunction;

/******************************* API declaration **************************************************/

extern HI_U32 DRV_HIFB_MEM_GetBppByFmt(HIFB_COLOR_FMT_E enColorFmt);

/******************************* API realization **************************************************/
static inline HI_VOID HIFB_SnapshotPrint(HIFB_BUFFER_S *pstSrcBuffer, HIFB_BUFFER_S *pstDstBuffer)
{
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstSrcBuffer->stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcBuffer->stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcBuffer->stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcBuffer->stCanvas.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstDstBuffer->stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDstBuffer->stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDstBuffer->stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDstBuffer->stCanvas.u32Pitch);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    return;
}

static inline HI_S32 HIFB_SNAPSHOT_CopyDispbufToSaveBuf(HIFB_PAR_S *pstPar, HI_U32 CmpStride, HIFB_BUFFER_S *pstSrcBuffer,HIFB_BUFFER_S *pstDstBuffer, HI_BOOL CaptureData)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_BUFFER_S stSrcBuffer;
    HIFB_BUFFER_S stDstBuffer;
    HIFB_BLIT_OPT_S stBlitOpt;
#ifndef CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE
    HI_U32 HeadSize  = 0;
    HI_U32 ARHeadDdr = 0;
    HI_U32 ARDataDdr = 0;
    HI_U32 GBHeadDdr = 0;
    HI_U32 GBDataDdr = 0;
#endif
    HI_GFX_Memset(&stSrcBuffer, 0, sizeof(stSrcBuffer));
    HI_GFX_Memset(&stDstBuffer, 0, sizeof(stDstBuffer));
    HI_GFX_Memcpy(&stSrcBuffer, pstSrcBuffer, sizeof(HIFB_BUFFER_S));
    HI_GFX_Memcpy(&stDstBuffer, pstDstBuffer, sizeof(HIFB_BUFFER_S));

    HI_GFX_Memset(&stBlitOpt,0,sizeof(stBlitOpt));
    stBlitOpt.bBlock = HI_TRUE;

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy, HI_FAILURE);

    if (HI_TRUE == CaptureData)
    {
        Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
        return (Ret < 0) ? (HI_FAILURE) : (HI_SUCCESS);
    }

    if (HI_FALSE == pstPar->bDeCompress)
    {
        pstPar->stFrameInfo.bBlitBlock = stBlitOpt.bBlock;
        pstPar->stFrameInfo.BlockTime  = CONFIG_BLOCK_TIME;
        Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_Blit(&stSrcBuffer, &stDstBuffer, &stBlitOpt, HI_TRUE);
        HIFB_SnapshotPrint(&stSrcBuffer, &stDstBuffer);
        return (Ret < 0) ? (HI_FAILURE) : (HI_SUCCESS);
    }

#ifdef CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE
    HI_UNUSED(CmpStride);
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
#else
    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_STRIDE,0, stDstBuffer.stCanvas.u32Height,CmpStride, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_PARA_CHECK_SUPPORT, Ret);
        return HI_FAILURE;
    }

    HeadSize  = (16 * stDstBuffer.stCanvas.u32Height + 0xff) & 0xffffff00;
    ARHeadDdr = stDstBuffer.stCanvas.u32PhyAddr;

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(ARHeadDdr,HeadSize,HI_FAILURE);
    ARDataDdr = ARHeadDdr + HeadSize;

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(ARHeadDdr,(CmpStride * stDstBuffer.stCanvas.u32Height),HI_FAILURE);
    GBHeadDdr = ARDataDdr + CmpStride * stDstBuffer.stCanvas.u32Height;

    HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(GBHeadDdr,HeadSize,HI_FAILURE);
    GBDataDdr = GBHeadDdr + HeadSize;

    stSrcBuffer.stCanvas.u32PhyAddr = pstPar->stRunInfo.CurScreenAddr;
    stSrcBuffer.stCanvas.u32Width   = 4;
    stSrcBuffer.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stSrcBuffer.stCanvas.u32Pitch   = 16;
    stSrcBuffer.stCanvas.enFmt      = HIFB_FMT_ARGB8888;
    stSrcBuffer.UpdateRect.x = 0;
    stSrcBuffer.UpdateRect.y = 0;
    stSrcBuffer.UpdateRect.w = stSrcBuffer.stCanvas.u32Width;
    stSrcBuffer.UpdateRect.h = stSrcBuffer.stCanvas.u32Height;

    HI_GFX_Memcpy(&stDstBuffer, &stSrcBuffer, sizeof(HIFB_BUFFER_S));
    stDstBuffer.stCanvas.u32PhyAddr = ARHeadDdr;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stSrcBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stDstBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Pitch);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_QuickCopy, Ret);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(stSrcBuffer.stCanvas.u32PhyAddr,HeadSize,HI_FAILURE);
    stSrcBuffer.stCanvas.u32PhyAddr = stSrcBuffer.stCanvas.u32PhyAddr + HeadSize;

    stSrcBuffer.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stSrcBuffer.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stSrcBuffer.stCanvas.u32Pitch   = CmpStride;
    stSrcBuffer.stCanvas.enFmt      = HIFB_FMT_ARGB1555;
    stSrcBuffer.UpdateRect.x = 0;
    stSrcBuffer.UpdateRect.y = 0;
    stSrcBuffer.UpdateRect.w = stSrcBuffer.stCanvas.u32Width;
    stSrcBuffer.UpdateRect.h = stSrcBuffer.stCanvas.u32Height;

    HI_GFX_Memcpy(&stDstBuffer, &stSrcBuffer, sizeof(HIFB_BUFFER_S));
    stDstBuffer.stCanvas.u32PhyAddr = ARDataDdr;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stSrcBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stDstBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Pitch);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_QuickCopy, Ret);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(stSrcBuffer.stCanvas.u32PhyAddr,(CmpStride * stSrcBuffer.stCanvas.u32Height),HI_FAILURE);
    stSrcBuffer.stCanvas.u32PhyAddr = stSrcBuffer.stCanvas.u32PhyAddr + CmpStride * stSrcBuffer.stCanvas.u32Height;

    stSrcBuffer.stCanvas.u32Width   = 4;
    stSrcBuffer.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stSrcBuffer.stCanvas.u32Pitch   = 16;
    stSrcBuffer.stCanvas.enFmt      = HIFB_FMT_ARGB8888;
    stSrcBuffer.UpdateRect.x = 0;
    stSrcBuffer.UpdateRect.y = 0;
    stSrcBuffer.UpdateRect.w = stSrcBuffer.stCanvas.u32Width;
    stSrcBuffer.UpdateRect.h = stSrcBuffer.stCanvas.u32Height;

    HI_GFX_Memcpy(&stDstBuffer, &stSrcBuffer, sizeof(HIFB_BUFFER_S));
    stDstBuffer.stCanvas.u32PhyAddr = GBHeadDdr;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stSrcBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stDstBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Pitch);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_QuickCopy, Ret);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(stSrcBuffer.stCanvas.u32PhyAddr,HeadSize,HI_FAILURE);
    stSrcBuffer.stCanvas.u32PhyAddr = stSrcBuffer.stCanvas.u32PhyAddr + HeadSize;

    stSrcBuffer.stCanvas.u32Width  = pstPar->stExtendInfo.DisplayWidth;
    stSrcBuffer.stCanvas.u32Height = pstPar->stExtendInfo.DisplayHeight;
    stSrcBuffer.stCanvas.u32Pitch  = CmpStride;
    stSrcBuffer.stCanvas.enFmt     = HIFB_FMT_ARGB1555;
    stSrcBuffer.UpdateRect.x = 0;
    stSrcBuffer.UpdateRect.y = 0;
    stSrcBuffer.UpdateRect.w = stSrcBuffer.stCanvas.u32Width;
    stSrcBuffer.UpdateRect.h = stSrcBuffer.stCanvas.u32Height;

    HI_GFX_Memcpy(&stDstBuffer, &stSrcBuffer, sizeof(HIFB_BUFFER_S));
    stDstBuffer.stCanvas.u32PhyAddr = GBDataDdr;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stSrcBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, (unsigned long)stDstBuffer.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stSrcBuffer.stCanvas.u32Pitch);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,"===========================================");
    Ret = g_stGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stSrcBuffer, &stDstBuffer, HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_GFX2D_QuickCopy, Ret);
        return HI_FAILURE;
    }
 #endif

    return Ret;
}

static inline HI_VOID HIFB_SNAPSHOT_WriteDispDataToFile(HI_BOOL bDeCompress, HI_CHAR* pData, HI_U32 BufSize, HI_U32 Width, HI_U32 Height, HI_U32 Stride, HI_BOOL CaptureData)
{
    HI_U32 Row = 0;
    HI_S8 *pTemp = NULL;
    static HI_S32 Cnt = 0;
    struct file* pFileFd = NULL;
    BMP_BMFHEADER_S sBmpHeader;
    BMP_BMIHEADER_S sBmpInfoHeader;
    HI_CHAR SaveFileName[HIFB_FILE_PATH_MAX_LEN] = {'\0'};
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pData);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_NOVALUE(BufSize);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_NOVALUE(Width);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_NOVALUE(Height);
    HI_GFX_CHECK_EQUAL_ZERO_RETURN_NOVALUE(Stride);

    HI_GFX_Memset(&sBmpHeader,    0x0, sizeof(sBmpHeader));
    HI_GFX_Memset(&sBmpInfoHeader,0x0, sizeof(sBmpInfoHeader));

    sBmpHeader.u16Type              = 0x4D42;
    sBmpHeader.u32Size              = BufSize + sizeof(BMP_BMFHEADER_S) + sizeof(BMP_BMIHEADER_S);
    sBmpHeader.u16Reserved1         = 0;
    sBmpHeader.u16Reserved2         = 0;
    sBmpHeader.u32OffBits           = sizeof(BMP_BMFHEADER_S) + sizeof(BMP_BMIHEADER_S);

    sBmpInfoHeader.u32Size          = sizeof(BMP_BMIHEADER_S);
    sBmpInfoHeader.u32Width         = Width;
    sBmpInfoHeader.u32Height        = Height;
    sBmpInfoHeader.u32Planes        = 1;
    sBmpInfoHeader.u32PixbitCount   = (720 == Width) ? 32 : 24;
    sBmpInfoHeader.u32Compression   = 0;
    sBmpInfoHeader.u32SizeImage     = 0;
    sBmpInfoHeader.u32XPelsPerMeter = Width;
    sBmpInfoHeader.u32YPelsPerMeter = Height;
    sBmpInfoHeader.u32ClrUsed       = 0;
    sBmpInfoHeader.u32ClrImportant  = 0;

    Cnt++;
    if (Cnt > 100) { Cnt = 0;}

    if (HI_TRUE == CaptureData)
    {
         snprintf(SaveFileName, sizeof(SaveFileName), "%s/hifb_snapshot_%d_%d_%d_num%d.data", CONFIG_HIFB_SAVE_DIR, Width, Height, Stride, Cnt);
    }
    else if (HI_TRUE == bDeCompress)
    {
         snprintf(SaveFileName, sizeof(SaveFileName), "%s/hifb_snapshot_%d_%d_%d_num%d.cmp", CONFIG_HIFB_SAVE_DIR, Width, Height, Stride, Cnt);
    }
    else
    {
         snprintf(SaveFileName, sizeof(SaveFileName), "%s/hifb_snapshot_%d_%d_%d_num%d.bmp", CONFIG_HIFB_SAVE_DIR, Width, Height, Stride, Cnt);
    }
    SaveFileName[sizeof(SaveFileName) - 1] = '\0';

    pFileFd = filp_open(SaveFileName, O_WRONLY | O_CREAT | O_LARGEFILE, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);
    if (IS_ERR(pFileFd))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, filp_open, FAILURE_TAG);
        return;
    }

    if (HI_TRUE == bDeCompress)
    {
#ifdef CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE
        for (Row = 0; Row < Height; Row++)
        {
             pTemp = pData + Row * Stride;
             HI_DRV_FILE_Write(pFileFd, (HI_S8*)pTemp, Stride);
        }
#else
        HI_DRV_FILE_Write(pFileFd, (HI_S8*)pData, BufSize);
#endif
        goto FINISH_SAVE;
    }

    if (HI_TRUE == CaptureData)
    {/** save argb data **/
        HI_DRV_FILE_Write(pFileFd, (HI_S8*)pData, BufSize);
        goto FINISH_SAVE;
    }

    if (sizeof(BMP_BMFHEADER_S) != HI_DRV_FILE_Write(pFileFd, (HI_S8*)&sBmpHeader, sizeof(BMP_BMFHEADER_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_FILE_Write, FAILURE_TAG);
        goto FINISH_SAVE;
    }

    if (sizeof(BMP_BMIHEADER_S) != HI_DRV_FILE_Write(pFileFd, (HI_S8*)&sBmpInfoHeader, sizeof(BMP_BMIHEADER_S)))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_FILE_Write, FAILURE_TAG);
        goto FINISH_SAVE;
    }

    Row   = Height;
    pTemp = pData;
    pTemp += (Stride * (Height - 1));
    while (Row)
    {
        HI_DRV_FILE_Write(pFileFd, (HI_S8*)pTemp, Stride);
        pTemp -= Stride;
        Row--;
    }

FINISH_SAVE:
    if (NULL != pFileFd)
    {
       HI_DRV_FILE_Close(pFileFd);
    }

    HI_GFX_Print("success to capture fb, store in file %s\n", SaveFileName);
    return;
}

HI_VOID HI_UNF_HIFB_CaptureImgFromLayer(HI_U32 u32LayerID, HI_U32 LineLength, HI_BOOL CaptureData)
{
    struct fb_info *info = NULL;
    HIFB_PAR_S *pstPar = NULL;
    HI_S32 Ret = HI_SUCCESS;
    HI_S8 *pData = NULL;
    HI_U32 u32BufSize = 0;
    HI_U32 u32Bpp = 0;
    HI_U32 CmpStride = 0;
    HI_U32 Stride = 0;
    HI_U32 WbcWriteAddr = 0;
    HI_U32 WbcStride = 0;
    HIFB_BUFFER_S stSrcBuffer, stDstBuffer;
    HI_CHAR MemZoneName[HIFB_FILE_NAME_MAX_LEN]= {'\0'};

    if (OPTM_SLAVER_LAYERID == u32LayerID)
    {
        DRV_HIFB_HAL_WBC_GetLayerAddr(OPTM_VDP_LAYER_WBC_GP0, &WbcWriteAddr, &WbcStride);
        u32BufSize = WbcStride * g_stGfxWbc2.stOutRect.h;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
        if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
        {
            if (NULL != g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr)
            {
                pData = (HI_S8*)g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr;
            }
        }
        else
#endif
        {
            if (NULL != g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr)
            {
                pData = (HI_S8*)(g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr + (WbcWriteAddr - g_stGfxWbc2.u32WBCBuffer[0]));
            }
        }

        HIFB_SNAPSHOT_WriteDispDataToFile(HI_FALSE,  \
                                          pData,     \
                                          u32BufSize,\
                                          g_stGfxWbc2.stOutRect.w, \
                                          g_stGfxWbc2.stOutRect.h, \
                                          WbcStride, \
                                          CaptureData);
        return;
    }

    HI_GFX_Memset(&stSrcBuffer, 0x0, sizeof(stSrcBuffer));
    HI_GFX_Memset(&stDstBuffer, 0x0, sizeof(stDstBuffer));

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(u32LayerID);
    info = s_stLayer[u32LayerID].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    pstPar = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);

    stSrcBuffer.stCanvas.enFmt      = pstPar->stExtendInfo.enColFmt;
    stSrcBuffer.stCanvas.u32Width   = pstPar->stExtendInfo.DisplayWidth;
    stSrcBuffer.stCanvas.u32Height  = pstPar->stExtendInfo.DisplayHeight;
    stSrcBuffer.stCanvas.u32PhyAddr = pstPar->stRunInfo.CurScreenAddr;
    stSrcBuffer.stCanvas.u32Pitch   = LineLength;
    if (HIFB_LAYER_BUF_NONE == pstPar->stExtendInfo.enBufMode)
    {
        stSrcBuffer.stCanvas.enFmt    = pstPar->stDispInfo.stUserBuffer.stCanvas.enFmt;
        stSrcBuffer.stCanvas.u32Pitch = pstPar->stDispInfo.stUserBuffer.stCanvas.u32Pitch;
    }

    if ((HI_TRUE == pstPar->st3DInfo.IsStereo) && (HIFB_STEREO_FRMPACKING != pstPar->st3DInfo.StereoMode))
    {
        HI_GFX_Memcpy(&stSrcBuffer.stCanvas, &pstPar->st3DInfo.st3DSurface, sizeof(stSrcBuffer.stCanvas));
    }

    stSrcBuffer.UpdateRect.x = 0;
    stSrcBuffer.UpdateRect.y = 0;
    stSrcBuffer.UpdateRect.w = stSrcBuffer.stCanvas.u32Width;
    stSrcBuffer.UpdateRect.h = stSrcBuffer.stCanvas.u32Height;

    HI_GFX_Memcpy(&stDstBuffer, &stSrcBuffer, sizeof(HIFB_BUFFER_S));
    if ((HI_TRUE == pstPar->bDeCompress) || (HI_TRUE == CaptureData))
    {
        stDstBuffer.stCanvas.enFmt = HIFB_FMT_ARGB8888;
    }
    else
    {
        stDstBuffer.stCanvas.enFmt = HIFB_FMT_RGB888;
    }

    u32Bpp = DRV_HIFB_MEM_GetBppByFmt(stDstBuffer.stCanvas.enFmt);
    Stride = CONIFG_HIFB_GetMaxStride(stSrcBuffer.stCanvas.u32Width,u32Bpp,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);

    stDstBuffer.stCanvas.u32Pitch = (HI_FALSE == pstPar->bDeCompress) ? (Stride) : (CmpStride);

    u32BufSize = HI_HIFB_GetMemSize(Stride,stSrcBuffer.stCanvas.u32Height);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(u32BufSize, 0);

    snprintf(MemZoneName, sizeof(MemZoneName),"hifb%d_snapshot", u32LayerID);
    MemZoneName[sizeof(MemZoneName) - 1] = '\0';

    stDstBuffer.stCanvas.u32PhyAddr = DRV_HIFB_MEM_Alloc(MemZoneName, "iommu", u32BufSize);
    if (0 == stDstBuffer.stCanvas.u32PhyAddr)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_MEM_Alloc, FAILURE_TAG);
        return;
    }

    pData = (HI_S8*)DRV_HIFB_MEM_Map(stDstBuffer.stCanvas.u32PhyAddr);
    if (NULL == pData)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_MEM_Map, FAILURE_TAG);
        goto ERR_EXIT;
    }
    HI_GFX_Memset(pData, 0x0, u32BufSize);

    Ret = HIFB_SNAPSHOT_CopyDispbufToSaveBuf(pstPar,CmpStride,&stSrcBuffer, &stDstBuffer, CaptureData);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_SNAPSHOT_CopyDispbufToSaveBuf, FAILURE_TAG);
        goto ERR_EXIT;
    }

    HIFB_SNAPSHOT_WriteDispDataToFile(pstPar->bDeCompress, \
                                      pData,               \
                                      u32BufSize,          \
                                      stDstBuffer.stCanvas.u32Width, \
                                      stDstBuffer.stCanvas.u32Height,\
                                      stDstBuffer.stCanvas.u32Pitch, \
                                      CaptureData);

ERR_EXIT:
    if (NULL != pData)
    {
        DRV_HIFB_MEM_UnMap((HI_VOID*)pData);
    }

    if (0 != stDstBuffer.stCanvas.u32PhyAddr)
    {
        DRV_HIFB_MEM_Free(stDstBuffer.stCanvas.u32PhyAddr,HI_TRUE);
    }

    return;
}
#endif

#ifdef CONFIG_GFX_PROC_SUPPORT
extern HIFB_DRV_OPS_S g_stDrvAdpCallBackFunction;
HI_VOID DRV_HIFB_SNAPSHOT_CaptureRegister(HI_VOID)
{
    HI_U32 Index = 0;
    HI_U32 Loop = (CONFIG_VDP_SIZE) / 16;
    static HI_U32 Cnt = 0;
    HI_U32* pRegBuf = NULL;
    struct file* pFileFd = NULL;
    HI_CHAR pStr[HIFB_FILE_PATH_MAX_LEN] = {'\0'};
    HI_CHAR SaveFileName[HIFB_FILE_PATH_MAX_LEN] = {'\0'};

    pRegBuf = (HI_U32*)HI_GFX_VMALLOC(HIGFX_FB_ID, (CONFIG_VDP_SIZE));
    if (NULL == pRegBuf)
    {
        return;
    }

    HI_GFX_Memset(pRegBuf, '\0', (CONFIG_VDP_SIZE));
    g_stDrvAdpCallBackFunction.DRV_HIFB_ADP_ReadRegister(0, pRegBuf);

    Cnt = (Cnt >= 100)?(0):(Cnt + 1);
    snprintf(SaveFileName, sizeof(SaveFileName), "%s/hifb_snapshot_%d.data", CONFIG_HIFB_SAVE_DIR,Cnt);
    SaveFileName[sizeof(SaveFileName) - 1] = '\0';

    pFileFd = filp_open(SaveFileName, O_WRONLY | O_CREAT | O_LARGEFILE, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);
    if (IS_ERR(pFileFd))
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, filp_open, FAILURE_TAG);
        HI_GFX_VFREE(HIGFX_FB_ID, pRegBuf);
        return;
    }

    for (Index = 0; Index < Loop; Index++)
    {
        snprintf(pStr, sizeof(pStr), "%04x: %08x %08x %08x %08x\n", Index * 16, *(pRegBuf + Index * 4),*(pRegBuf + Index * 4 + 1),*(pRegBuf + Index * 4 + 2),*(pRegBuf + Index * 4 + 3));
        HI_DRV_FILE_Write(pFileFd, (HI_S8*)pStr, 42);
    }

    HI_DRV_FILE_Close(pFileFd);
    HI_GFX_VFREE(HIGFX_FB_ID, pRegBuf);

    HI_GFX_Print("success to capture more, store in file %s\n", SaveFileName);
    return;
}
#endif
