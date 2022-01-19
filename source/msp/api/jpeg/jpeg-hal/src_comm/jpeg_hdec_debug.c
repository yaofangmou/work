/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
****************************************************************************************************
File Name        : jpeg_hdec_debug.c
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :


History          :
Date                        Author                     Modification
2018/01/01                   sdk                       Created file
***************************************************************************************************/

/*********************************add include here*************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef CONFIG_JPEG_ADD_GOOGLEFUNCTION
#include <cutils/log.h>
#include <cutils/properties.h>
#endif

#include "jpeg_hdec_hal.h"
#include "jpeg_hdec_api.h"

#include "hi_gfx_comm.h"

/**************************************************************************************************/


/***************************** Macro Definition ***************************************************/
#define JPEG_PATH_MAX_LEN                 256

#define DADA_WRITE( file,fmt, args... )\
     do { \
          fprintf(file,fmt, ##args );\
     } while (0)

#ifdef CONFIG_JPEG_ADD_GOOGLEFUNCTION
    #define SAVE_JPEG_FILE_DIR              "/mnt/sdcard/Pictures"
    #define SAVE_MJPEG_FILE_DIR             "/mnt/sdcard/Pictures"
    #define SAVE_YUVSP_FILE_DIR             "/mnt/sdcard/Pictures"
    #define SAVE_BMP_FILE_DIR               "/mnt/sdcard/Pictures"
#else
    #define SAVE_JPEG_FILE_DIR              "/tmp"
    #define SAVE_MJPEG_FILE_DIR             "/tmp"
    #define SAVE_YUVSP_FILE_DIR             "/tmp"
    #define SAVE_BMP_FILE_DIR               "/tmp"
#endif

#ifdef LOG_TAG
#undef LOG_TAG
#endif

#define LOG_TAG "libhi_gfx"
/*************************** Structure Definition *************************************************/

typedef struct  tagBITMAPFILEHEADER
{
    HI_U16 u16Type;
    HI_U32 u32Size;
    HI_U16 u16Reserved1;
    HI_U16 u16Reserved2;
    HI_U32 u32OffBits;
}__attribute__((packed)) BMP_BMFHEADER_S;

typedef  struct tagBITMAPINFOHEADER
{
    HI_U32 u32Size;
    HI_U32 u32Width;
    HI_U32 u32Height;
    HI_U16 u32Planes;
    HI_U16 u32PixbitCount;
    HI_U32 u32Compression;
    HI_U32 u32SizeImage;
    HI_U32 u32XPelsPerMeter;
    HI_U32 u32YPelsPerMeter;
    HI_U32 u32ClrUsed;
    HI_U32 u32ClrImportant;
} BMP_BMIHEADER_S;
/********************** Global Variable declaration ***********************************************/


/********************** API forward declarations    ***********************************************/

/**********************       API realization       ***********************************************/


/******************************* API realization **************************************************/
HI_VOID JPEG_HDEC_WhetherDebug(HI_U32* pLogLevel)
{
    FILE *pFile = NULL;
    HI_U32 ReadBytes = 0;
    HI_CHAR pStr[JPEG_PATH_MAX_LEN] = {'\0'};
    HI_CHAR *pNeedStr = NULL;

    if (NULL == pLogLevel)
    {
        return;
    }

    pFile = fopen("/proc/msp/hi_jpeg", "r");
    if (NULL == pFile)
    {
        HI_GFX_Print("++++ open /proc/msp/hi_jpeg failure\n");
        return;
    }

    ReadBytes = fread(pStr, 1, JPEG_PATH_MAX_LEN - 1, pFile);
    if (ReadBytes < JPEG_PATH_MAX_LEN - 1)
    {
        goto FINISH_PARSE;
    }

    pNeedStr = strstr(pStr, "=");
    if (NULL == pNeedStr)
    {
        goto FINISH_PARSE;
    }

    ReadBytes = strlen(pNeedStr);
    if (ReadBytes > 5)
    {
        pNeedStr += 2;
        pNeedStr[1] = '\0';
        *pLogLevel = atoi(pNeedStr);

    }

FINISH_PARSE:
    if (NULL != pFile)
    {
        fclose(pFile);
    }

    return;
}

HI_VOID JPEG_DEC_SaveInputFile(HI_CHAR* pInputStrem, HI_U32 StreamSize, HI_BOOL bFinishRead)
{
    HI_S32 WriteLen = 0;
    HI_U32 LogLevel = 0;
    static HI_BOOL bFirstStart = HI_TRUE;
    static HI_S32 Cnt = 0;
    static HI_S32 Fd = -1;
    static HI_CHAR FileName[JPEG_PATH_MAX_LEN] = {'\0'};

    JPEG_HDEC_WhetherDebug(&LogLevel);
    if (2 != LogLevel)
    {
        return;
    }

    if ((NULL == pInputStrem) || (0 == StreamSize) || (StreamSize < 2))
    {
        goto FINISH_EXIT;
    }

    if ((HI_TRUE == bFirstStart) && (-1 == Fd))
    {
        bFirstStart = HI_FALSE;
        if ((0xFF != pInputStrem[0]) || (0xD8 != pInputStrem[1]))
        {
            goto FINISH_EXIT;
        }

        Cnt = (Cnt >= 100) ? (0) : (Cnt + 1);
        snprintf(FileName, JPEG_PATH_MAX_LEN, "%s/input_stream_%d.jpg", SAVE_JPEG_FILE_DIR, Cnt);
        FileName[JPEG_PATH_MAX_LEN - 1] = '\0';
        Fd = open(FileName, O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
    }

    if (-1 == Fd)
    {
       HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
       goto FINISH_EXIT;
    }

    WriteLen = write(Fd, (HI_VOID*)pInputStrem, StreamSize);
    HI_UNUSED(WriteLen);

    if ((HI_TRUE == bFinishRead) && (-1 != Fd))
    {
        close(Fd);
        Fd = -1;
        bFirstStart = HI_TRUE;
        HI_GFX_Print("\n=====================================================================\n");
        HI_GFX_Print("save %s success\n",FileName);
        HI_GFX_Print("=====================================================================\n");
    }

    return;
FINISH_EXIT:
    if (-1 != Fd)
    {
       close(Fd);
    }

    Fd = -1;
    bFirstStart = HI_TRUE;

    HI_GFX_Print("\n=====================================================================\n");
    HI_GFX_Print("save %s failure\n",FileName);
    HI_GFX_Print("=====================================================================\n");
    return;
}

HI_VOID JPEG_DEC_SaveInputMjpeg(HI_CHAR* pInputStrem, HI_U32 StreamSize)
{
    HI_S32 Fd = -1;
    HI_S32 WriteLen = 0;
    HI_U32 LogLevel = 0;
    HI_CHAR FileName[JPEG_PATH_MAX_LEN] = {'\0'};

    JPEG_HDEC_WhetherDebug(&LogLevel);
    if (3 != LogLevel)
    {
        return;
    }

    if ((NULL == pInputStrem) || (0 == StreamSize))
    {
       goto FINISH_EXIT;
    }

    snprintf(FileName, JPEG_PATH_MAX_LEN, "%s/input_mjpeg_stream.avi", SAVE_MJPEG_FILE_DIR);
    FileName[JPEG_PATH_MAX_LEN - 1] = '\0';

    Fd = open(FileName, O_CREAT | O_WRONLY | O_APPEND, S_IRUSR | S_IWUSR);
    if (-1 == Fd)
    {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        return;
    }

    //WriteLen = write(Fd, &StreamSize, 4);
    WriteLen = write(Fd, (HI_VOID*)pInputStrem, StreamSize);
    HI_UNUSED(WriteLen);

    HI_GFX_Print("\n=====================================================================\n");
    HI_GFX_Print("save %s success\n",FileName);
    HI_GFX_Print("=====================================================================\n");

FINISH_EXIT:
    if (-1 != Fd)
    {
       close(Fd);
    }

    return;
}

static HI_VOID GetBmpData(HI_CHAR* pDst,HI_U32 DstStride,HI_CHAR* pSrc,HI_U32 Width,HI_U32 Height,HI_U32 Stride, HI_U32 Offset)
{
    HI_U32 Row = 0;
    HI_U32 Col = 0;
    HI_U8 *pSrcTmp = NULL;
    HI_U8 *pDstTmp = NULL;

    for (Row = 0; Row < Height; Row++)
    {
        pSrcTmp = (HI_U8*)pSrc - Row * Stride;
        pDstTmp = (HI_U8*)pDst + Row * DstStride;

        for (Col = 0; Col < Width; Col++)
        {
           pDstTmp[0] = pSrcTmp[2];
           pDstTmp[1] = pSrcTmp[1];
           pDstTmp[2] = pSrcTmp[0];
           pDstTmp[3] = pSrcTmp[3];
           pSrcTmp += Offset;
           pDstTmp += 4;
        }
    }

    return;
}

static HI_VOID SaveBmp(HI_CHAR* DataVir,HI_U32 Width,HI_U32 Height,HI_U32 Stride, HI_U32 Offset, HI_JPEG_FMT_E eFmt)
{
     HI_S32 Fd = -1;
     HI_S32 WriteLen = 0;
     HI_U32 BmpStride = 0;
     HI_CHAR* pDst = NULL;
     HI_CHAR FileName[JPEG_PATH_MAX_LEN] = {'\0'};
     BMP_BMFHEADER_S sBmpHeader;
     BMP_BMIHEADER_S sBmpInfoHeader;
     static HI_U32 BmpCnt = 0;

     HI_GFX_Memset(&sBmpHeader,0x0,sizeof(BMP_BMFHEADER_S));
     HI_GFX_Memset(&sBmpInfoHeader,0x0,sizeof(BMP_BMIHEADER_S));

     BmpStride = (Width * 4 + 4 - 1) & (~(4 - 1));
     sBmpHeader.u16Type = 0x4D42;
     sBmpHeader.u32Size = (BmpStride * Height) + sizeof(BMP_BMFHEADER_S) + sizeof(BMP_BMIHEADER_S);
     sBmpHeader.u16Reserved1 = 0;
     sBmpHeader.u16Reserved2 = 0;
     sBmpHeader.u32OffBits   = sizeof(BMP_BMFHEADER_S) + sizeof(BMP_BMIHEADER_S);

     sBmpInfoHeader.u32Size          = sizeof(BMP_BMIHEADER_S);
     sBmpInfoHeader.u32Width         = Width;
     sBmpInfoHeader.u32Height        = Height;
     sBmpInfoHeader.u32Planes        = 1;
     sBmpInfoHeader.u32PixbitCount   = 32;
     sBmpInfoHeader.u32Compression   = 0;
     sBmpInfoHeader.u32SizeImage     = 0;
     sBmpInfoHeader.u32XPelsPerMeter = Width;
     sBmpInfoHeader.u32YPelsPerMeter = Height;
     sBmpInfoHeader.u32ClrUsed       = 0;
     sBmpInfoHeader.u32ClrImportant  = 0;

     if ((Height > 8192) || (BmpStride > (8192 * 4)) || (0 == BmpStride * Height))
     {
         HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
         return;
     }

     pDst = calloc(BmpStride * Height,1);
     if (NULL == pDst)
     {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        return;
     }

     GetBmpData(pDst,BmpStride,DataVir + (Stride * (Height - 1)), Width, Height, Stride, Offset);

     BmpCnt = (BmpCnt >= 100) ? (0) : (BmpCnt + 1);

     snprintf(FileName, JPEG_PATH_MAX_LEN, "%s/pictures_%d.bmp", SAVE_BMP_FILE_DIR, BmpCnt);
     FileName[JPEG_PATH_MAX_LEN - 1] = '\0';

     Fd = open(FileName, O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
     if (-1 == Fd)
     {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        goto FINISH_EXIT;
     }

     WriteLen = write(Fd, (HI_VOID*)&sBmpHeader, sizeof(BMP_BMFHEADER_S));
     HI_UNUSED(WriteLen);
     WriteLen = write(Fd, (HI_VOID*)&sBmpInfoHeader, sizeof(BMP_BMIHEADER_S));
     HI_UNUSED(WriteLen);
     WriteLen = write(Fd, (HI_VOID*)pDst, BmpStride * Height);
     HI_UNUSED(WriteLen);

     HI_GFX_Print("\n========================================================\n");
     HI_GFX_Print("save w:%d h:%d s:%d offset:%d %s success\n",Width, Height, Stride, Offset, FileName);
     HI_GFX_Print("========================================================\n");

FINISH_EXIT:
     if (-1 != Fd)
     {
        close(Fd);
     }

     if (NULL != pDst)
     {
        free(pDst);
     }

     return;
}

HI_VOID JPEG_DEC_SaveBmp(JPEG_HDEC_HANDLE_S_PTR pJpegHandle)
{
    HI_U32 Stride = 0;
    HI_U32 Offset = 4;

    if (NULL == pJpegHandle)
    {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        return;
    }

    if (5 != pJpegHandle->LogLevel)
    {
        return;
    }

    if (  (HI_JPEG_FMT_ARGB_8888 != pJpegHandle->stImgInfo.output_color_space)
        &&(HI_JPEG_FMT_BGRA_8888 != pJpegHandle->stImgInfo.output_color_space)
        &&(HI_JPEG_FMT_ABGR_8888 != pJpegHandle->stImgInfo.output_color_space)
        &&(HI_JPEG_FMT_RGBA_8888 != pJpegHandle->stImgInfo.output_color_space)
        &&(HI_JPEG_FMT_RGB_888   != pJpegHandle->stImgInfo.output_color_space)
        &&(HI_JPEG_FMT_BGR_888   != pJpegHandle->stImgInfo.output_color_space))
    {
        HI_GFX_Print("++++++++++%s %d %d\n",__FUNCTION__,__LINE__,pJpegHandle->stImgInfo.output_color_space);
        return;
    }

    if (NULL == pJpegHandle->stOutSurface.BufVir[0])
    {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        return;
    }

    if (HI_TRUE == pJpegHandle->bOutUsrBuf)
    {
        Stride = pJpegHandle->stOutSurface.Stride[0];
    }
    else
    {
        Stride = pJpegHandle->stJpegSofInfo.DecOutStride;
    }

    if (  (HI_JPEG_FMT_ARGB_8888 == pJpegHandle->stImgInfo.output_color_space)
        ||(HI_JPEG_FMT_BGRA_8888 == pJpegHandle->stImgInfo.output_color_space)
        ||(HI_JPEG_FMT_ABGR_8888 == pJpegHandle->stImgInfo.output_color_space)
        ||(HI_JPEG_FMT_RGBA_8888 == pJpegHandle->stImgInfo.output_color_space))
    {
        Offset = 4;
    }
    else
    {
        Offset = 3;
    }

    SaveBmp(pJpegHandle->stOutSurface.BufVir[0],
            pJpegHandle->stOutSurface.stCropRect.w,
            pJpegHandle->stOutSurface.stCropRect.h,
            Stride, Offset,
            pJpegHandle->stImgInfo.output_color_space);

     return;
}

static HI_VOID SaveYuvSp(HI_CHAR* pYStream, HI_S32 YWidth, HI_S32 YHeight, HI_S32 YStride,
                         HI_CHAR* pUVStream,HI_S32 UVWidth,HI_S32 UVHeight,HI_S32 UVStride,
                         HI_JPEG_FMT_E eFmt)
{
     HI_CHAR pFileName[JPEG_PATH_MAX_LEN] = {'\0'};
     HI_CHAR pHdrName[JPEG_PATH_MAX_LEN] = {'\0'};
     HI_CHAR pStr[JPEG_PATH_MAX_LEN] = {'\0'};
     HI_S32 s32Cnt  = 0;
     HI_S32 s32Cnt1 = 0;
     HI_S32 FileFd = -1;
     HI_S32 HdrFd = -1;
     HI_S32 WriteLen = 0;
     HI_CHAR *pTmp  = NULL;
     HI_CHAR pTmpCbCr[10000] = {'\0'};
     static HI_U32 YuvSpCnt = 0;

     YuvSpCnt = (YuvSpCnt >= 100) ? (0) : (YuvSpCnt + 1);

     snprintf(pFileName, JPEG_PATH_MAX_LEN, "%s/pictures_%d.yuv",SAVE_YUVSP_FILE_DIR,YuvSpCnt);
     pFileName[JPEG_PATH_MAX_LEN - 1] = '\0';

     FileFd = open(pFileName, O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
     if (-1 == FileFd)
     {
        HI_GFX_Print("open %s failure\n",pFileName);
        goto FINISH_EXIT;
     }

     snprintf(pHdrName, JPEG_PATH_MAX_LEN, "%s/pictures_%d.hdr", SAVE_YUVSP_FILE_DIR,YuvSpCnt);
     pHdrName[JPEG_PATH_MAX_LEN - 1] = '\0';

     HdrFd = open(pHdrName, O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
     if (-1 == HdrFd)
     {
        HI_GFX_Print("open %s failure\n",pHdrName);
        goto FINISH_EXIT;
     }

     /**<-- save y data >**/
     if ((NULL == pYStream) || (0 == YWidth))
     {
        HI_GFX_Print("+++++%s %d\n",__FUNCTION__,__LINE__);
        goto FINISH_EXIT;
     }

     pTmp = pYStream;
     for (s32Cnt = 0; s32Cnt < YHeight; s32Cnt++)
     {
         WriteLen = write(FileFd, (HI_VOID*)pTmp, YWidth);
         HI_UNUSED(WriteLen);
         pTmp += YStride;
     }

     /**<-- save uv data >**/
     if ((NULL == pUVStream) || (0 == UVWidth) || (UVWidth >= (HI_S32)sizeof(pTmpCbCr)))
     {
        goto SAVE_HDR_FINISH_EXIT;
     }

     /**<-- save u data >**/
     pTmp = pUVStream;
     for (s32Cnt = 0; s32Cnt < UVHeight; s32Cnt++)
     {
         for (s32Cnt1 = 0; s32Cnt1 < UVWidth; s32Cnt1++)
         {
             pTmpCbCr[s32Cnt1] = pTmp[2 * s32Cnt1 + 1];
         }
         WriteLen = write(FileFd, (HI_VOID*)pTmpCbCr, UVWidth);
         HI_UNUSED(WriteLen);
         pTmp += UVStride;
     }

     /**<-- save v data >**/
     pTmp = pUVStream;
     for (s32Cnt = 0; s32Cnt < UVHeight; s32Cnt++)
     {
         for (s32Cnt1 = 0; s32Cnt1 < UVWidth; s32Cnt1++)
         {
             pTmpCbCr[s32Cnt1] = pTmp[2*s32Cnt1 + 0];
         }
         WriteLen = write(FileFd, (HI_VOID*)pTmpCbCr, UVWidth);
         HI_UNUSED(WriteLen);
         pTmp += UVStride;
     }

SAVE_HDR_FINISH_EXIT:
     /**<-- save hdr data >**/
     switch (eFmt)
     {
         case HI_JPEG_FMT_YUV400:
             HI_GFX_Memset(pStr, '\0', sizeof(pStr));
             snprintf(pStr, sizeof(pStr), "%s", "format = \"Y\" ;\n");
             WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
             HI_UNUSED(WriteLen);
             break;
         case HI_JPEG_FMT_YUV420:
             HI_GFX_Memset(pStr, '\0', sizeof(pStr));
             snprintf(pStr, sizeof(pStr), "%s", "format = \"YUV420\" ;\n");
             WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
             HI_UNUSED(WriteLen);
             break;
         case HI_JPEG_FMT_YUV422_12:
             HI_GFX_Memset(pStr, '\0', sizeof(pStr));
             snprintf(pStr, sizeof(pStr), "%s", "format = \"YUV422\" ;\n");
             WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
             HI_UNUSED(WriteLen);
             break;
         case HI_JPEG_FMT_YUV422_21:
             HI_GFX_Memset(pStr, '\0', sizeof(pStr));
             snprintf(pStr, sizeof(pStr), "%s", "format = \"YUV422\" ;\n");
             WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
             HI_UNUSED(WriteLen);
             break;
         case HI_JPEG_FMT_YUV444:
             HI_GFX_Memset(pStr, '\0', sizeof(pStr));
             snprintf(pStr, sizeof(pStr), "%s", "format = \"YUV444\" ;\n");
             WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
             HI_UNUSED(WriteLen);
             break;
         default:
             HI_GFX_Print("format is unknow ;\n");
             goto FINISH_EXIT;
     }

     HI_GFX_Memset(pStr, '\0', sizeof(pStr));
     snprintf(pStr, sizeof(pStr), "%s", "offset = 0 ;\n");
     WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof("offset = 0 ;\n"));
     HI_UNUSED(WriteLen);

     HI_GFX_Memset(pStr, '\0', sizeof(pStr));
     snprintf(pStr, sizeof(pStr), "width = %d ;\n",   YWidth);
     WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
     HI_UNUSED(WriteLen);

     HI_GFX_Memset(pStr, '\0', sizeof(pStr));
     snprintf(pStr, sizeof(pStr), "height = %d ;\n",  YHeight);
     WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
     HI_UNUSED(WriteLen);

     HI_GFX_Memset(pStr, '\0', sizeof(pStr));
     snprintf(pStr, sizeof(pStr), "framerate = 50 ;\n");
     WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
     HI_UNUSED(WriteLen);

     HI_GFX_Memset(pStr, '\0', sizeof(pStr));
     snprintf(pStr, sizeof(pStr), "loop = 1 ;\n");
     WriteLen = write(HdrFd, (HI_VOID*)pStr, sizeof(pStr));
     HI_UNUSED(WriteLen);

     HI_GFX_Print("\n=====================================================================\n");
     HI_GFX_Print("save %s success\n",pFileName);
     HI_GFX_Print("save %s success\n",pHdrName);
     HI_GFX_Print("=====================================================================\n");

FINISH_EXIT:
     if (-1 != FileFd)
     {
        close(FileFd);
     }

     if (-1 != HdrFd)
     {
        close(HdrFd);
     }

     return;
}

HI_VOID JPEG_DEC_SaveYuvSp(JPEG_HDEC_HANDLE_S_PTR pJpegHandle)
{
    if (NULL == pJpegHandle)
    {
        HI_GFX_Print("++++++++++%s %d\n",__FUNCTION__,__LINE__);
        return;
    }

    if (4 != pJpegHandle->LogLevel)
    {
        return;
    }

    if (NULL == pJpegHandle->stDecSurface.BufVir[0])
    {
#ifdef CONFIG_GFX_MEM_ION
        pJpegHandle->stDecSurface.BufVir[0] = (HI_CHAR*)HI_GFX_Map(pJpegHandle->MemDev,pJpegHandle->stDecSurface.BufPhy[0], pJpegHandle->pMiddleMemHandle);
#else
        pJpegHandle->stDecSurface.BufVir[0] = (HI_CHAR*)HI_GFX_Map(pJpegHandle->stDecSurface.BufPhy[0], HI_TRUE);
#endif
    }

    if (NULL == pJpegHandle->stDecSurface.BufVir[0])
    {
        return;
    }

    SaveYuvSp(pJpegHandle->stDecSurface.BufVir[0],
              pJpegHandle->stJpegSofInfo.u32YWidth,
              pJpegHandle->stJpegSofInfo.u32YHeight,
              pJpegHandle->stJpegSofInfo.u32YStride,
              pJpegHandle->stDecSurface.BufVir[0] + pJpegHandle->stJpegSofInfo.u32YSize,
              pJpegHandle->stJpegSofInfo.u32CWidth,
              pJpegHandle->stJpegSofInfo.u32CHeight,
              pJpegHandle->stJpegSofInfo.u32CbCrStride,
              pJpegHandle->stImgInfo.jpeg_color_space);

#ifdef CONFIG_GFX_MEM_ION
    (HI_VOID)HI_GFX_Unmap(pJpegHandle->MemDev,pJpegHandle->stDecSurface.BufPhy[0], pJpegHandle->pMiddleMemHandle);
#else
    (HI_VOID)HI_GFX_Unmap(pJpegHandle->stDecSurface.BufPhy[0], HI_TRUE);
#endif

     return;
}

static HI_VOID PrintImageInfo(JPEG_HDEC_HANDLE_S_PTR pJpegHandle)
{
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("input jpeg information:\n");
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");

    HI_GFX_Print("input [w,h]      : [%d,%d]\n",pJpegHandle->stImgInfo.image_width,pJpegHandle->stImgInfo.image_height);
    HI_GFX_Print("scale times      : %d\n",     pJpegHandle->stImgInfo.scale_denom);
    HI_GFX_Print("data_precision   : %d\n",     pJpegHandle->stImgInfo.data_precision);
    HI_GFX_Print("arith_code       : %s\n",    (HI_TRUE == pJpegHandle->stImgInfo.arith_code) ? "HI_TRUE" : "HI_FALSE");
    HI_GFX_Print("progressive_mode : %s\n",    (HI_TRUE == pJpegHandle->stImgInfo.progressive_mode) ? "HI_TRUE" : "HI_FALSE");
    switch (pJpegHandle->stImgInfo.jpeg_color_space)
    {
         case HI_JPEG_FMT_YUV400:
             HI_GFX_Print("input color      : yuv400\n");
             break;
         case HI_JPEG_FMT_YUV420:
             HI_GFX_Print("input color      : yuv420\n");
             break;
         case HI_JPEG_FMT_YUV422_12:
             HI_GFX_Print("input color      : yuv422_12\n");
             break;
         case HI_JPEG_FMT_YUV422_21:
             HI_GFX_Print("input color      : yuv422_21\n");
             break;
         case HI_JPEG_FMT_YUV444:
             HI_GFX_Print("input color      : yuv444\n");
             break;
         case HI_JPEG_FMT_YCCK:
             HI_GFX_Print("input color      : YCCK\n");
             break;
         case HI_JPEG_FMT_CMYK:
             HI_GFX_Print("input color      : CMYK\n");
             break;
         case HI_JPEG_FMT_RGB_888:
             HI_GFX_Print("input color      : adobe rgb\n");
             break;
         default:
             HI_GFX_Print("input color      : format is unknow\n");
             break;
    }
    return;
}

static HI_VOID PrintOutInfo(JPEG_HDEC_HANDLE_S_PTR pJpegHandle)
{
    HI_U32 Stride = 0;
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("output jpeg information:\n");
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");

    if (HI_TRUE == pJpegHandle->bOutUsrBuf)
    {
        Stride = pJpegHandle->stOutSurface.Stride[0];
    }
    else
    {
        Stride = pJpegHandle->stJpegSofInfo.DecOutStride;
    }

    if ((HI_TRUE == pJpegHandle->bOutYCbCrSP) || (HI_TRUE == pJpegHandle->bOutYUV420SP))
    {
        HI_GFX_Print("output [y_w,y_h]           : [%d,%d]\n",pJpegHandle->stJpegSofInfo.u32YWidth,pJpegHandle->stJpegSofInfo.u32YHeight);
        HI_GFX_Print("output [y_stride,y_size]   : [%d,%d]\n",pJpegHandle->stJpegSofInfo.u32YStride,pJpegHandle->stJpegSofInfo.u32YSize);
        HI_GFX_Print("output [uv_w,uv_h]         : [%d,%d]\n",pJpegHandle->stJpegSofInfo.u32CWidth,pJpegHandle->stJpegSofInfo.u32CHeight);
        HI_GFX_Print("output [uv_stride,uv_size] : [%d,%d]\n",pJpegHandle->stJpegSofInfo.u32CbCrStride,pJpegHandle->stJpegSofInfo.u32CSize);
    }
    else
    {
        HI_GFX_Print("output [w,h]               : [%d,%d]\n",pJpegHandle->stImgInfo.output_width,pJpegHandle->stImgInfo.output_height);
        HI_GFX_Print("output [stride,size]       : [%d,%d]\n",Stride,pJpegHandle->stImgInfo.output_height * Stride);
    }

    HI_GFX_Print("dec to xrgb                : %s\n",    (HI_TRUE == pJpegHandle->bDecOutColorSpaecXRGB) ? "HI_TRUE" : "HI_FALSE");
    HI_GFX_Print("finish hard dec            : %s\n",    (HI_TRUE == pJpegHandle->bHdecSuccess) ? "HI_TRUE" : "HI_FALSE");
    HI_GFX_Print("finish hard csc            : %s\n",    (HI_TRUE == pJpegHandle->bCSCEnd) ? "HI_TRUE" : "HI_FALSE");

    switch (pJpegHandle->stImgInfo.output_color_space)
    {
         case HI_JPEG_FMT_YUV400:
             HI_GFX_Print("output color               : yuv400\n");
             break;
         case HI_JPEG_FMT_YUV420:
             HI_GFX_Print("output color               : yuv420\n");
             break;
         case HI_JPEG_FMT_YUV422_12:
             HI_GFX_Print("output color               : yuv422_12\n");
             break;
         case HI_JPEG_FMT_YUV422_21:
             HI_GFX_Print("output color               : yuv422_21\n");
             break;
         case HI_JPEG_FMT_YUV444:
             HI_GFX_Print("output color               : yuv444\n");
             break;
         case HI_JPEG_FMT_YCCK:
             HI_GFX_Print("output color               : YCCK\n");
             break;
         case HI_JPEG_FMT_CMYK:
             HI_GFX_Print("output color               : CMYK\n");
             break;
         case HI_JPEG_FMT_RGB_888:
             HI_GFX_Print("output color               : RGB888\n");
             break;
         case HI_JPEG_FMT_BGR_888:
             HI_GFX_Print("output color               : BGR888\n");
             break;
         case HI_JPEG_FMT_RGB_565:
             HI_GFX_Print("output color               : RGB565\n");
             break;
         case HI_JPEG_FMT_BGR_565:
             HI_GFX_Print("output color               : BGR565\n");
             break;
         case HI_JPEG_FMT_ARGB_8888:
             HI_GFX_Print("output color               : ARGB8888\n");
             break;
         case HI_JPEG_FMT_ABGR_8888:
             HI_GFX_Print("output color               : ABGR8888\n");
             break;
         case HI_JPEG_FMT_ARGB_1555:
             HI_GFX_Print("output color               : ARGB1555\n");
             break;
         default:
             HI_GFX_Print("output color               : format is unknow\n");
             break;
    }
    return;
}

static HI_VOID PrintSupportHardDec(JPEG_HDEC_HANDLE_S_PTR pJpegHandle)
{
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("whether support hard decode:\n");
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");

    if (HI_TRUE == pJpegHandle->bHdecSuccess)
    {
        HI_GFX_Print("hard decode success\n");
    }
    else
    {
        HI_GFX_Print("soft decode success\n");
        HI_GFX_Print("seek to soft        : %s\n",(HI_TRUE == pJpegHandle->stProcInfo.SupportSeekToSoft) ? "HI_TRUE" : "HI_FALSE");
    }

    if (HI_TRUE == pJpegHandle->stProcInfo.SupportSeekToSoft)
    {
        HI_GFX_Print("cur input buf       : %p\n",pJpegHandle->stImgInfo.next_input_byte);
        HI_GFX_Print("cur reserve bytes   : %d\n",pJpegHandle->stImgInfo.bytes_in_buffer);
        HI_GFX_Print("seek pos            : %d\n",pJpegHandle->stImgInfo.curpos_in_buffer);
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.LowDelaySupport)
    {
       HI_GFX_Print("can not support lowdelay\n");
       return;
    }

    if (HI_FALSE != pJpegHandle->stProcInfo.LackOfValidData)
    {
       HI_GFX_Print("can not support lack of valid data\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.DriSupport)
    {
       HI_GFX_Print("can not support dri mark\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.HufNumSupport)
    {
       HI_GFX_Print("can not support more num table\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.ScaleSupport)
    {
       HI_GFX_Print("can not support other scale\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.SampleFactorSupport)
    {
       HI_GFX_Print("can not support factor\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.InputImgSizeSupport)
    {
       HI_GFX_Print("can not support large size\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.OutColorSpaceSupport)
    {
       HI_GFX_Print("can not support other color\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.OpenDevSuccess)
    {
       HI_GFX_Print("open jpeg dev failure\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.GetDevSuccess)
    {
       HI_GFX_Print("get jpeg dev failure\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.OpenCscDevSuccess)
    {
       HI_GFX_Print("open csc dev failure\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.OpenIonDevSuccess)
    {
       HI_GFX_Print("open ion dev failure\n");
       return;
    }

    if (HI_FALSE == pJpegHandle->stProcInfo.AllocMemSuccess)
    {
       HI_GFX_Print("not enough memory\n");
       return;
    }

    return;
}

HI_VOID JPEG_DEC_PrintProcMsg(HI_ULONG DecHandle)
{
    HI_U32 CallFuncIndex = 0;
    JPEG_HDEC_HANDLE_S_PTR pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)DecHandle;
    if (NULL == pJpegHandle)
    {
        return;
    }

    if (1 != pJpegHandle->LogLevel)
    {
        return;
    }

    if (HI_FALSE == pJpegHandle->bCheckedSupportHardDec)
    {
        return;
    }
    HI_GFX_Print("=====================================================================\n");

    if (HI_TRUE == pJpegHandle->stProcInfo.UseStandardLibDec)
    {
       HI_GFX_Print("use standard jpeg lib decode\n");
    }
    else
    {
       HI_GFX_Print("use hisi hard decode lib for mjpeg\n");
    }

    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("decode cost times\n");
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("soft dec cost times : %dms\n", pJpegHandle->stProcInfo.SoftDectTimes);
    HI_GFX_Print("hard dec cost times : %dms\n", pJpegHandle->stProcInfo.HardDecTimes);
    HI_GFX_Print("from create to destory cost times : %dms\n", pJpegHandle->stProcInfo.DecCostTimes);

    PrintImageInfo(pJpegHandle);
    PrintOutInfo(pJpegHandle);
    PrintSupportHardDec(pJpegHandle);

    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    HI_GFX_Print("call func and num = %d\n",pJpegHandle->CallFuncNum);
    HI_GFX_Print("++++++++++++++++++++++++++++++++++++++++++\n");
    for (CallFuncIndex = 0; (CallFuncIndex < pJpegHandle->CallFuncNum) && (CallFuncIndex < CONFIG_JPEG_CALL_FUNC_NUM); CallFuncIndex++)
    {
        if (CallFuncIndex != pJpegHandle->CallFuncNum - 1)
        {
            HI_GFX_Print("(%s-%d) -> ", pJpegHandle->CallFunc[CallFuncIndex], pJpegHandle->CallFuncLine[CallFuncIndex]);
        }
        else
        {
            HI_GFX_Print("(%s-%d)", pJpegHandle->CallFunc[CallFuncIndex], pJpegHandle->CallFuncLine[CallFuncIndex]);
        }
#ifndef CONFIG_JPEG_ADD_GOOGLEFUNCTION
        if (1 == CallFuncIndex % 2)
        {
            HI_GFX_Print("\n");
        }
#endif
    }

#ifndef CONFIG_JPEG_ADD_GOOGLEFUNCTION
    HI_GFX_Print("\n=====================================================================\n");
#else
    HI_GFX_Print("=====================================================================\n");
#endif
}
