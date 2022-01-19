/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hi_pvr_fifo.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2008/04/24
  Description   : BUFFER module
  History       :
  1.Date        : 2008/04/24
    Author      : sdk
    Modification: Created file

******************************************************************************/

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/mount.h>
#include <fcntl.h>
#include <limits.h>


#include "hi_type.h"
#include "pvr_debug.h"
#include "hi_pvr_fifo.h"
#include "hi_adpt_thread.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define PACKET_IDENTIFIER(a, b)         ((HI_U32)((((a) & 0x1f) << 8) | ((b) & 0xff)))

#define PVR_HISI_DEFAULT_FILE_NODE_SIZE (4000LLU*1024*1024)
/** */
typedef enum hiPVR_FILE_NAME_FMT_E
{
    PVR_FILE_NAME_FMT_HISI,

    PVR_FILE_NAME_FMT_BUTT
} PVR_FILE_NAME_FMT_E;

typedef struct hiPVR_FILE_S
{
    HI_BOOL bOpened;
    HI_S32     systemFd;
    HI_S32     openMode;

    HI_U64  u64CycMaxSize;

    HI_U64  u64FileNodeSize;
    HI_U64  u64StartOfCurFd;   /* = u64FileNodeSize * nodIdx, prevent data from calculating again, save it */
    HI_U64  u64SeekOffset;
    HI_U64  u64LastWPtrEnd;
    HI_CHAR szFileName[PVR_MAX_FILENAME_LEN];
    PVR_FILE_NAME_FMT_E enFileNameFmt;
} PVR_FILE_S, *PVR_FILE_HANDLE;

static PVR_FILE_S g_stPvrFiles[PVR_FILE_MAX_FILE];
HI_U64 g_u64PVR_FileNodeMaxSize = 4000LLU*1024*1024;

#define PVRFileGetNodeIdx(offset, nodeSize)  ((offset)/(nodeSize))
#define PVRFileGetNodeOffset(offset, nodeSize)  ((offset)%(nodeSize))
#define PVRFileOffsetMatchNode(offset, nodeStartOffset, nodeSize) (((offset) >= (nodeStartOffset)) && ((offset) < ((nodeStartOffset) + (nodeSize))))

#define PVRFileGetRealFNameHisi(fileName, realName, nodeIdx) do {\
        if (0 == nodeIdx)\
        {\
            memset(realName, 0x00, PVR_MAX_FILENAME_LEN);\
            snprintf(realName, PVR_MAX_FILENAME_LEN,"%s", fileName); \
            realName[PVR_MAX_FILENAME_LEN - 1] = '\0';\
        }\
        else\
        {\
            HI_CHAR szTempStr[PVR_MAX_FILENAME_LEN + 16] = {0};\
            memset(realName, 0x00, PVR_MAX_FILENAME_LEN);\
            snprintf(szTempStr, PVR_MAX_FILENAME_LEN + 16,"%s.%04d.ts", fileName, nodeIdx); \
            memcpy(realName, szTempStr, PVR_MAX_FILENAME_LEN);\
            realName[PVR_MAX_FILENAME_LEN - 1] = '\0';\
        }\
    }while(0)

volatile PVR_FILE_HANDLE PVR_GetPvrFiles(HI_U32 id)
{
    return &g_stPvrFiles[id];
}

HI_S32 PVRFileGetOffsetFName(PVR_FILE64 file, HI_U64 offset, HI_CHAR* pRealName)
{
    HI_S32 pvrFd = -1;
    HI_U32 nodeIdx = 0;
    PVR_FILE_S* pPvrFile = HI_NULL;

    HI_PVR_LOG_ENTER();

    PVR_CHECK_POINTER(pRealName);

    pvrFd = PVRFileGetPVRFd(file);

    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);

    pPvrFile = PVR_GetPvrFiles(pvrFd);
    nodeIdx = (HI_U32)PVRFileGetNodeIdx(offset, pPvrFile->u64FileNodeSize);
    PVRFileGetRealFNameHisi(pPvrFile->szFileName, pRealName, (HI_S32)nodeIdx);

    HI_PVR_LOG_EXIT();

    return HI_SUCCESS;
}



ssize_t PVR_READALL(void* buf, size_t size, PVR_FILE fd,  off64_t offset)
{
    ssize_t nread = 0;
    ssize_t n = 0;
    HI_U8* pMem = HI_NULL;

    HI_PVR_DEBUG_ENTER();
    if ((0 == size) || (HI_NULL == buf) || (PVR_FILE_INVALID_FILE == fd))
    {
        HI_ERR_PVR("some parameters is invalid! size(%d), buf(%p), fd(%d)\n", size, buf, fd);
        HI_PVR_DEBUG_EXIT();
        return 0;
    }
    pMem = (HI_U8 *)buf;
    do
    {
        if ((n = (ssize_t)PVR_READ((void*)(pMem + nread), ((size) - (size_t)nread), fd, offset + (off64_t)nread)) == (-1))
        {
            if (EINTR == errno)
            {
                HI_WARN_PVR("read err @EINTR\n");
                continue;
            }
            else
            {
                HI_INFO_PVR("read err!\n");
                return -1;
            }
        }

        if (0 == n) /* EOF */
        {
            HI_INFO_PVR("read to end!\n");
            return (ssize_t)nread;
        }

        nread += n;
        if (nread < (ssize_t)size)
        {
            HI_WARN_PVR("read ok @ less\n");
        }
    }while (nread < (ssize_t)size);

    HI_PVR_DEBUG_EXIT();
    return (ssize_t)nread;
}

/*****************************************************************************
 Prototype       : PVR_CHECK_FILE_EXIST
 Description     : check file exist
 Input           : pszFileName  **
 Output          : None
 Return Value    :
 Global Variable
    Read Only    :
    Read & Write :
  History
  1.Date         : 2008/4/26
    Author       : sdk
    Modification : Created function

*****************************************************************************/
HI_BOOL PVR_CHECK_FILE_EXIST(const HI_CHAR* pszFileName)
{
    HI_S32 fd = -1;

    HI_PVR_DEBUG_ENTER();

    if (HI_NULL == pszFileName)
    {
        HI_ERR_PVR("file name is null!\n");
        return HI_FALSE;
    }

    fd = open(pszFileName, O_RDONLY);
    if (0 > fd)
    {
        HI_WARN_PVR("open file failed!\n");
        return HI_FALSE;
    }
    else
    {
        close(fd);
        HI_PVR_DEBUG_EXIT();
        return HI_TRUE;
    }
}

HI_VOID PVR_REMOVE_FILE64(const HI_CHAR* pszFileName)
{
    HI_S32 nodeIdx = 0;
    HI_CHAR  fNameReal[PVR_MAX_FILENAME_LEN] = {0};

    HI_PVR_LOG_ENTER();

    if (HI_NULL == pszFileName)
    {
        HI_ERR_PVR("file name is null!\n");
        return;
    }

    PVRFileGetRealFNameHisi(pszFileName, fNameReal, nodeIdx);

    while (PVR_CHECK_FILE_EXIST(fNameReal))
    {
        (HI_VOID)PVR_REMOVE(fNameReal);

        nodeIdx++;
        PVRFileGetRealFNameHisi(pszFileName, fNameReal, nodeIdx);
    };

    HI_PVR_LOG_EXIT();

    return;
}

HI_U64 PVR_FILE_GetFileSize64(const HI_CHAR* pszFileName)
{
    HI_S64      size = 0;
    PVR_FILE    fd = PVR_FILE_INVALID_FILE;
    HI_S32      nodeIdx = 0;
    HI_U64      nodeSize = 0;
    HI_CHAR     fNameReal[PVR_MAX_FILENAME_LEN] = {0};
    HI_S32      s32Length = 0;
    HI_U32      u32MagicCode = 0;

    HI_PVR_LOG_ENTER();

    if (HI_NULL == pszFileName)
    {
        HI_ERR_PVR("file name is null!\n");
        return 0;
    }

    PVRFileGetRealFNameHisi(pszFileName, fNameReal, nodeIdx);

    while (PVR_CHECK_FILE_EXIST(fNameReal))
    {
        fd = pvr_open(pszFileName, PVR_FOPEN_MODE_DATA_READ, 0777);
        if (PVR_FILE_INVALID_FILE != fd)
        {
            nodeSize = (HI_S64)pvr_lseek(fd, 0, SEEK_END);
        }
        else
        {
            nodeSize = 0;
        }

        if (sizeof(HI_U32) == nodeSize)
        {
            s32Length = PVR_READ(&u32MagicCode, sizeof(HI_U32), fd, 0);
            if (sizeof(HI_U32) != s32Length)
            {
                HI_ERR_PVR("Failed to read file, want: %d, actually: %d\n", sizeof(HI_U32), s32Length);
                nodeSize = 0;
            }
            else if (PVR_TS_PRIVATE_DATA_CODE == u32MagicCode)
            {
                nodeSize = PVR_HISI_DEFAULT_FILE_NODE_SIZE;
            }
        }
        if (PVR_FILE_INVALID_FILE != fd)
        {
            pvr_close(fd);
        }
        size += nodeSize;
        nodeIdx++;
        PVRFileGetRealFNameHisi(pszFileName, fNameReal, nodeIdx);
    }

    HI_PVR_LOG_EXIT();
    return (HI_U64)size;
}

PVR_FILE64 PVR_OPEN64(const HI_CHAR* filename, HI_S32 mode)
{
    HI_S32 sysFd = 0;
    HI_CHAR  fNameOpen[PVR_MAX_FILENAME_LEN] = {0};
    HI_U32 u32FileNameLen = 255;
    PVR_FILE_S* pstPvrFiles = HI_NULL;

    HI_PVR_LOG_ENTER();

    if (HI_NULL == filename)
    {
        HI_ERR_PVR("file name is null!\n");
        return PVR_FILE_INVALID_FILE;
    }

    /*这里换成指针能减少代码段大小*/
    for (pstPvrFiles = g_stPvrFiles; pstPvrFiles < &g_stPvrFiles[PVR_FILE_MAX_FILE]; pstPvrFiles++)
    {
        if (HI_FALSE == pstPvrFiles->bOpened)
        {
            pstPvrFiles->bOpened = HI_TRUE;
            break;
        }
    }

    if (pstPvrFiles >= &g_stPvrFiles[PVR_FILE_MAX_FILE])  /* NO fd */
    {
        HI_ERR_PVR("PVR file: can NOT open more file.\n");
        return -1;
    }

    PVRFileGetRealFNameHisi(filename, fNameOpen, 0);

    pstPvrFiles->enFileNameFmt = PVR_FILE_NAME_FMT_HISI;
    pstPvrFiles->u64FileNodeSize = PVR_HISI_DEFAULT_FILE_NODE_SIZE;

    HI_INFO_PVR("PVR file: fmt:%d, NodeSize:%llu.\n", pstPvrFiles->enFileNameFmt, pstPvrFiles->u64FileNodeSize);

    sysFd = PVR_OPEN(fNameOpen, mode);

    if (-1 == sysFd)
    {
        pstPvrFiles->bOpened = HI_FALSE;
        pstPvrFiles->systemFd = PVR_FILE_INVALID_FILE;
        HI_ERR_PVR("PVR file: can NOT open '%s', mode:%#x.\n", fNameOpen, mode);
        return -1;
    }

    memset(pstPvrFiles->szFileName, '\0', sizeof(pstPvrFiles->szFileName));
    if (u32FileNameLen > strlen(filename))
    {
        u32FileNameLen = (HI_U32)strlen(filename);
    }
    strncpy(pstPvrFiles->szFileName, filename, u32FileNameLen);

    pstPvrFiles->systemFd = sysFd;
    pstPvrFiles->openMode = mode;
    pstPvrFiles->u64StartOfCurFd = 0;
    pstPvrFiles->u64SeekOffset = 0;
    pstPvrFiles->u64CycMaxSize = 0;
    pstPvrFiles->u64LastWPtrEnd = 0;

    HI_PVR_LOG_EXIT();
    return (pstPvrFiles - g_stPvrFiles) + PVR_FILE_FD_BASE;
}

HI_S32 PVR_CLOSE64(PVR_FILE64 file)
{
    HI_S32 pvrFd = -1;
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PVR_LOG_ENTER();

    pvrFd = PVRFileGetPVRFd(file);

    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);
    g_stPvrFiles[pvrFd].bOpened = HI_FALSE;

    s32Ret = PVR_CLOSE(g_stPvrFiles[pvrFd].systemFd);

    HI_PVR_LOG_EXIT();
    return s32Ret;
}

HI_VOID PVR_SET_MAXFILE_SIZE(PVR_FILE64 file, HI_U64 maxSize)
{
    HI_S32 pvrFd = -1;
    PVR_FILE_S *pPvrFile = HI_NULL;

    HI_PVR_LOG_ENTER();

    pvrFd = PVRFileGetPVRFd(file);
    if ((HI_U32)pvrFd >= PVR_FILE_MAX_FILE)
    {
        HI_WARN_PVR("pvrFd >= PVR_FILE_MAX_FILE\n");
        return;
    }

    if (g_stPvrFiles[pvrFd].bOpened != HI_TRUE)
    {
        HI_WARN_PVR("pvr file is not opened!\n");
        return;
    }

    pPvrFile = &g_stPvrFiles[pvrFd];
    pPvrFile->u64CycMaxSize = maxSize;

    HI_PVR_LOG_EXIT();
    return;
}

HI_S32 PVR_FSYNC64(PVR_FILE64 file)
{
    HI_S32 pvrFd = -1;
    HI_S32 s32Ret = 0;

    HI_PVR_LOG_ENTER();

    pvrFd = PVRFileGetPVRFd(file);

    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);

    s32Ret = PVR_FSYNC(g_stPvrFiles[pvrFd].systemFd);

    HI_PVR_LOG_EXIT();
    return s32Ret;
}

ssize_t PVR_PREAD64(HI_U8* pMem, HI_U32 size, PVR_FILE64 file, HI_U64 offset)
{
    HI_U32 nodeIdx = 0;
    HI_S32 sysFd = PVR_FILE_INVALID_FILE;
    HI_S32 pvrFd = PVR_FILE_INVALID_FILE;
    HI_U32      readLen1 = 0;
    HI_U32      readLen2 = 0;
    HI_U32      readed = 0;
    PVR_FILE_S* pPvrFile = HI_NULL;

    HI_PVR_DEBUG_ENTER();

    if ((0 == size) || (HI_NULL == pMem))
    {
        HI_ERR_PVR("read size(%d) is zero or pMem(%p) is null!\n", size, pMem);
        return 0;
    }

    pvrFd = PVRFileGetPVRFd(file);
    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);

    pPvrFile = PVR_GetPvrFiles(pvrFd);

    if (PVRFileOffsetMatchNode(offset, pPvrFile->u64StartOfCurFd, pPvrFile->u64FileNodeSize))
    {
        sysFd = pPvrFile->systemFd;
        readLen1 = (offset + size >= pPvrFile->u64StartOfCurFd + pPvrFile->u64FileNodeSize)
                    ?  (HI_U32)(pPvrFile->u64StartOfCurFd + pPvrFile->u64FileNodeSize - offset)
                    : size;

        readed = (HI_U32)PVR_READ((void*)pMem, (size_t)readLen1, sysFd, (off64_t)(offset - pPvrFile->u64StartOfCurFd));
        if (readed != readLen1)
        {
            //perror("PVR_READ...222...,hi_pvr_fifo.c");
            if (readed > 0)
            {
                pPvrFile->u64SeekOffset = offset +  (HI_U64)readed;
                PVR_USLEEP(100000);
            }

            HI_INFO_PVR("The number of bytes read does not meet the requirements!\n");
            return (ssize_t)readed;
        }

        offset += (HI_U64)readLen1;
    }

    if (readLen1 != size) /* need another file */
    {
        HI_CHAR  fNameOpen[PVR_MAX_FILENAME_LEN] = {0};
        PVR_FSYNC(pPvrFile->systemFd);

        PVR_CLOSE(pPvrFile->systemFd);
        nodeIdx = (HI_U32)PVRFileGetNodeIdx(offset, pPvrFile->u64FileNodeSize);
        PVRFileGetRealFNameHisi(pPvrFile->szFileName, fNameOpen, (HI_S32)nodeIdx);
        sysFd = PVR_OPEN(fNameOpen, pPvrFile->openMode);

        if (-1 == sysFd)
        {
            HI_ERR_PVR("[%s] PVR can't open file:'%s' for read.offset=%lld, u64FileNodeSize=%lld.\n",
                       __FUNCTION__, fNameOpen, offset, pPvrFile->u64FileNodeSize);
            return (ssize_t)readLen1;
        }

        pPvrFile->systemFd = sysFd;
        pPvrFile->u64StartOfCurFd = nodeIdx;
        pPvrFile->u64StartOfCurFd *= pPvrFile->u64FileNodeSize;

        readLen2 = size - readLen1;
        readed = (HI_U32)PVR_READ((HI_VOID*)(pMem + readLen1), (size_t)readLen2, sysFd, (off64_t)(offset - pPvrFile->u64StartOfCurFd));
        if (-1 == (HI_S32)readed)
        {
            HI_INFO_PVR("PVR_READ: error!\n");
            return -1;
        }
        else //if (readed != readLen2)
        {
            pPvrFile->u64SeekOffset = offset + (HI_U64)readed + (HI_U64)readLen1;
            HI_PVR_DEBUG_EXIT();
            return (ssize_t)(readed + readLen1);
        }
    }

    pPvrFile->u64SeekOffset = offset +  size;

    HI_PVR_DEBUG_EXIT();
    return (ssize_t)size;
}


ssize_t PVR_PWRITE64(const void* pMem,  HI_U32 size, PVR_FILE64 file, HI_U64 offset)
{
    HI_U32 nodeIdx = 0;
    HI_S32 sysFd = PVR_FILE_INVALID_FILE;
    HI_S32 pvrFd = PVR_FILE_INVALID_FILE;
    size_t      readLen1 = 0;
    size_t      readLen2 = 0;
    HI_S64      writen = 0;
    PVR_FILE_S* pPvrFile = HI_NULL;

    HI_PVR_DEBUG_ENTER();

    PVR_CHECK_POINTER(pMem);

    pvrFd = PVRFileGetPVRFd(file);
    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);

    pPvrFile = PVR_GetPvrFiles(pvrFd);
    if (0 == size)
    {
        HI_INFO_PVR("write size is zero!\n");
        return 0;
    }

#ifdef PVR_CHECK_USB_FILE
    if (HI_SUCCESS != PVR_CheckUsbStillPlugIn())
    {
        HI_INFO_PVR("usb is pluged out!\n");
        return -1;
    }
#endif

    if (PVRFileOffsetMatchNode(offset, pPvrFile->u64StartOfCurFd, pPvrFile->u64FileNodeSize))
    {
        sysFd = pPvrFile->systemFd;
        readLen1 = (offset + size >= pPvrFile->u64StartOfCurFd + pPvrFile->u64FileNodeSize)
                    ? (size_t)(pPvrFile->u64StartOfCurFd + pPvrFile->u64FileNodeSize - offset)
                    : (size_t)size;
        writen = (HI_S64)PVR_WRITE(pMem, readLen1, sysFd, offset - pPvrFile->u64StartOfCurFd);
        if (writen < 0)
        {
            HI_ERR_PVR("%s file:%d, want to write %d,  acturally %d,  offset:%lld,  u64StartOfCurFd: %lld \n", __func__, sysFd, readLen1, writen, offset, pPvrFile->u64StartOfCurFd);
            return -1;
        }
        else if (0 == writen)
        {
            HI_INFO_PVR("Did not write any data!\n");
            return 0;
        }
        else
        {
            if ((size_t)writen != readLen1)
            {
                pPvrFile->u64SeekOffset = offset + (HI_U64)writen;
                HI_INFO_PVR("writen != readLen1\n");
                return (ssize_t)writen;
            }

            offset += readLen1;
        }
    }

    if (readLen1 != size) /* need another file */
    {
        HI_CHAR fNameOpen[PVR_MAX_FILENAME_LEN] = {0};
        PVR_CLOSE(pPvrFile->systemFd);
        nodeIdx = (HI_U32)PVRFileGetNodeIdx(offset, pPvrFile->u64FileNodeSize);
        PVRFileGetRealFNameHisi(pPvrFile->szFileName, fNameOpen, (HI_S32)nodeIdx);
        sysFd = PVR_OPEN(fNameOpen, pPvrFile->openMode);
        if (-1 == sysFd)
        {
            HI_ERR_PVR("PVR can't open file:'%s' for write.\n", fNameOpen);
            return -1;
        }

        pPvrFile->systemFd = sysFd;
        pPvrFile->u64StartOfCurFd = nodeIdx;
        pPvrFile->u64StartOfCurFd *= pPvrFile->u64FileNodeSize;

        readLen2 = size - readLen1;
        writen = (HI_S64)PVR_WRITE((void*)((size_t)pMem + readLen1), readLen2, sysFd, (off64_t)(offset - pPvrFile->u64StartOfCurFd));
        if ( writen < 0)
        {
            HI_INFO_PVR("PVR_WRITE:error!\n");
            return -1;
        }
        else if (0 == writen)
        {
            HI_INFO_PVR("Did not write any data!\n");
            return 0;
        }
        else //if (writen != readLen2)
        {
            pPvrFile->u64SeekOffset = offset + (HI_U64)(writen + readLen1);
            HI_PVR_DEBUG_EXIT();
            return (ssize_t)writen + (ssize_t)readLen1;
        }
    }

    pPvrFile->u64SeekOffset = offset +  size;

    HI_PVR_DEBUG_EXIT();
    return (ssize_t)size;
}

/*修正文件大小*/
HI_S32 PVR_FTRUNCATE64(PVR_FILE64 file, HI_U64 u64TsFileSize, HI_BOOL bProcHead)
{
    PVR_FILE_S* pPvrFile = HI_NULL;
    HI_S32 pvrFd = 0;
    HI_U32 i = 0;
    HI_U32 u32OrignalTsLastNode = 0;
    HI_U32 u32TargetTsNode = 0;
    HI_U32 u32MagicCode = PVR_TS_PRIVATE_DATA_CODE;
    HI_S32 s32Length = 0;
    PVR_FILE tempFd = PVR_FILE_INVALID_FILE;
    HI_CHAR  fNameOpen[PVR_MAX_FILENAME_LEN] = {0};

    HI_PVR_LOG_ENTER();

    pvrFd = PVRFileGetPVRFd(file);
    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);

    pPvrFile = PVR_GetPvrFiles(pvrFd);
    u32OrignalTsLastNode = (HI_U32)PVRFileGetNodeIdx(pPvrFile->u64CycMaxSize, pPvrFile->u64FileNodeSize);
    u32TargetTsNode = (HI_U32)PVRFileGetNodeIdx(u64TsFileSize, pPvrFile->u64FileNodeSize);

    if (HI_FALSE == bProcHead)
    {
        /*删除多余node*/
        if (u32TargetTsNode < u32OrignalTsLastNode)
        {
            for (i = u32OrignalTsLastNode; i > u32TargetTsNode; i--)
            {
                memset(fNameOpen, 0x00, sizeof(HI_CHAR) * PVR_MAX_FILENAME_LEN);
                PVRFileGetRealFNameHisi(pPvrFile->szFileName, fNameOpen, (HI_S32)i);
                if(PVR_CHECK_FILE_EXIST(fNameOpen))
                {
                    if (HI_SUCCESS != unlink(fNameOpen))
                    {
                        HI_ERR_PVR("remove file(%s) failed!\n", fNameOpen);
                    }
                }
            }
        }

        /*处理当前truncatePos node*/
        tempFd = pPvrFile->systemFd;
        if (0 != u32TargetTsNode)
        {
            memset(fNameOpen, 0x00, sizeof(HI_CHAR) * PVR_MAX_FILENAME_LEN);
            u64TsFileSize -= (pPvrFile->u64FileNodeSize * u32TargetTsNode);
            PVRFileGetRealFNameHisi(pPvrFile->szFileName, fNameOpen, (HI_S32)u32TargetTsNode);
            tempFd = PVR_OPEN(fNameOpen, pPvrFile->openMode);
            if (PVR_FILE_INVALID_FILE == tempFd)
            {
                HI_ERR_PVR("can't open file:'%s' , FileSize = %lld, u64FileNodeSize = %lld.\n",
                                fNameOpen, u64TsFileSize, pPvrFile->u64FileNodeSize);
                return HI_ERR_PVR_FILE_CANT_OPEN;
            }
        }

        if (0 != ftruncate(tempFd, u64TsFileSize))
        {
            HI_ERR_PVR("ts file truncate failed! TsFileSize: %lld\n",u64TsFileSize);
            if (tempFd != pPvrFile->systemFd)
            {
                PVR_FSYNC(tempFd);
                PVR_CLOSE(tempFd);
            }
            return HI_FAILURE;
        }

        PVR_FSYNC(tempFd);
        if (tempFd != pPvrFile->systemFd)
        {
            PVR_CLOSE(tempFd);
        }
    }
    else
    {
        /*将头部多余的ts数据文件清空(truncate(fd,0))*/
        for (i = 0; i < u32TargetTsNode; i++)
        {
            memset(fNameOpen, 0x00, sizeof(HI_CHAR) * PVR_MAX_FILENAME_LEN);
            PVRFileGetRealFNameHisi(pPvrFile->szFileName, fNameOpen, (HI_S32)i);
            if(PVR_CHECK_FILE_EXIST(fNameOpen))
            {
                tempFd = PVR_OPEN(fNameOpen, pPvrFile->openMode);
                if (PVR_FILE_INVALID_FILE == tempFd)
                {
                    HI_ERR_PVR("can't open file:'%s' , FileSize = 0, u64FileNodeSize = %lld.\n",
                                    fNameOpen, pPvrFile->u64FileNodeSize);
                    return HI_ERR_PVR_FILE_CANT_OPEN;
                }

                s32Length = PVR_WRITE(&u32MagicCode, sizeof(HI_U32), tempFd, 0);
                if (sizeof(HI_U32) != s32Length)
                {
                    HI_ERR_PVR("Failed to write file, want: %d, actually: %d\n", sizeof(HI_U32), s32Length);
                    PVR_FSYNC(tempFd);
                    PVR_CLOSE(tempFd);
                    return HI_FAILURE;
                }
                if (0 != ftruncate(tempFd, sizeof(HI_U32)))
                {
                    HI_ERR_PVR("ts file truncate failed! TsFileSize: 0\n");
                    PVR_FSYNC(tempFd);
                    PVR_CLOSE(tempFd);
                    return HI_FAILURE;
                }
                PVR_FSYNC(tempFd);
                PVR_CLOSE(tempFd);
            }
        }
    }

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

/**CNcomment: 该接口用于处理带O_DIRECT选项写文件时，存储非512对齐的数据。
                    处理方法:用不含O_DIRECT选项打开的文件句柄去写非对齐的数据，并同步相关信息到通道中打开的PVR_FILE_S*/
#if defined(HI_PVR_PID_CHANGE_SUPPORT) && defined(HI_PVR_EXTRA_BUF_SUPPORT)
HI_S32 PVR_WriteStreamAlign(PVR_FILE64 fileDIO, HI_U8* pu8Buf, HI_U32 u32Len, HI_U64 u64OffsetInFile)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PVR_FILE_S* pPvrFileDIO = HI_NULL;
    PVR_FILE_S* pPvrFileNew = HI_NULL;
    PVR_FILE64 fd = PVR_FILE_INVALID_FILE;
    PVR_FILE pvrFd = PVR_FILE_INVALID_FILE;
    ssize_t sizeWrite = 0;
    ssize_t sizeWriten = 0;

    HI_PVR_LOG_ENTER();

    if (HI_NULL == pu8Buf)
    {
        HI_ERR_PVR("null point for pu8Buf! \n");
        return HI_ERR_PVR_NUL_PTR;
    }

    //原带O_DIRECT选项打开的文件句柄信息
    pvrFd = PVRFileGetPVRFd(fileDIO);
    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);
    pPvrFileDIO = PVR_GetPvrFiles(pvrFd);

    //以不带O_DIRECT 的选项打开临时文件句柄，并获取其对应文件句柄信息
    fd = PVR_OPEN64(pPvrFileDIO->szFileName, O_WRONLY | O_LARGEFILE);
    if (PVR_FILE_INVALID_FILE == fd)
    {
        HI_ERR_PVR("open %s failed! \n", pPvrFileDIO->szFileName);
        return HI_ERR_PVR_FILE_CANT_OPEN;
    }

    pvrFd = PVRFileGetPVRFd(fd);
    PVRFileCheckPVRFd(pvrFd);
    PVRFileCheckPVRFdOpen(pvrFd);
    pPvrFileNew = PVR_GetPvrFiles(pvrFd);

    //复制原DIO文件句柄属性到临时文件句柄中
    pPvrFileNew->openMode = O_WRONLY | O_LARGEFILE;
    pPvrFileNew->u64CycMaxSize = pPvrFileDIO->u64CycMaxSize;
    pPvrFileNew->u64FileNodeSize = pPvrFileDIO->u64FileNodeSize;
    pPvrFileNew->u64StartOfCurFd = pPvrFileDIO->u64StartOfCurFd;
    pPvrFileNew->u64SeekOffset = pPvrFileDIO->u64SeekOffset;
    pPvrFileNew->u64LastWPtrEnd = pPvrFileDIO->u64LastWPtrEnd;
    pPvrFileNew->enFileNameFmt = pPvrFileDIO->enFileNameFmt;

    //将数据写入文件中
    do
    {
        sizeWrite = PVR_PWRITE64(&((const char*)pu8Buf)[sizeWriten],
                                 u32Len - (HI_U32)sizeWriten,
                                 fd,
                                 u64OffsetInFile + sizeWriten);
        if ((-1) == sizeWrite)
        {
            if (EINTR == errno)
            {
                HI_WARN_PVR("EINTR can't write ts. try:%u, addr:%p, fd:%d\n", u32Len, pu8Buf, fd);
                continue;
            }
            else if (ENOSPC == errno)
            {
                HI_ERR_PVR("no space left on device!");
                s32Ret = HI_ERR_PVR_FILE_DISC_FULL;
                break;
            }
            else
            {
                HI_ERR_PVR("can't write ts. try:%u, addr:%p, fd:%d\n", u32Len, pu8Buf, fd);
                s32Ret = HI_ERR_PVR_FILE_CANT_WRITE;
                break;
            }
        }

        sizeWriten += sizeWrite;
    } while ((HI_U32)sizeWriten < u32Len);

    //将临时打开的文件句柄信息更新到原O_DIRECT文件句柄中
    pPvrFileDIO->u64CycMaxSize = pPvrFileNew->u64CycMaxSize;
    pPvrFileDIO->u64FileNodeSize = pPvrFileNew->u64FileNodeSize;
    pPvrFileDIO->u64StartOfCurFd = pPvrFileNew->u64StartOfCurFd;
    pPvrFileDIO->u64SeekOffset = pPvrFileNew->u64SeekOffset;
    pPvrFileDIO->u64LastWPtrEnd = pPvrFileNew->u64LastWPtrEnd;
    pPvrFileDIO->enFileNameFmt = pPvrFileNew->enFileNameFmt;

    PVR_FSYNC64(fd);
    PVR_CLOSE64(fd);

    HI_PVR_LOG_EXIT();

    return s32Ret;
}
#endif

/*
 *该接口与直接realpath的区别为:realpath必须传入存在的路径或文件名，而录制时传入的文件名可能还未创建，
   所以直接对传入的文件名进行realpath会导致错误，故该接口将路径和文件名分开来标准化，然后再拼接在一起
 *传入文件名可能有如下情况:
 *1、"/xx/filename"
 *2、"/filename"
 *3、"filename"
 */
HI_S32 PVR_GetTheStandardFileName(HI_CHAR* pszFileName)
{
    HI_CHAR*  p = HI_NULL;
    HI_CHAR szAbsoluteDirName[PATH_MAX] = {0};
    HI_CHAR szOppositeDirName[PVR_MAX_FILENAME_LEN] = {0};
    HI_CHAR szFileName[PVR_MAX_FILENAME_LEN] = {0};
    HI_U32 u32OppositeDirLen = 0;
    HI_U32 u32SrcFileLen = 0;

    HI_PVR_LOG_ENTER();

    if (HI_NULL == pszFileName)
    {
        HI_ERR_PVR("file name is null!\n");
        return HI_ERR_PVR_NUL_PTR;
    }

    u32SrcFileLen = strlen(pszFileName);
    if (u32SrcFileLen > PVR_MAX_FILENAME_LEN)
    {
        HI_ERR_PVR("file name is too long! fileNamelen; %u\n", u32SrcFileLen);
        return HI_ERR_PVR_FILE_INVALID_FNAME;
    }

    HI_WARN_PVR("PATH_MAX : %u\n", PATH_MAX);
    p = strrchr(pszFileName, '/');

    if (NULL == p)
    {/*3、"fileName"  */
        snprintf(szOppositeDirName, PVR_MAX_FILENAME_LEN * sizeof(HI_CHAR), "%s", ".");
        memcpy(szFileName, pszFileName, u32SrcFileLen * sizeof(HI_CHAR));
        u32OppositeDirLen = 1;
    }
    else
    {
        u32OppositeDirLen = (HI_U32)(p - pszFileName);
        if (0 == u32OppositeDirLen)
        {/*2、"/fileName"  */
            snprintf(szOppositeDirName, PVR_MAX_FILENAME_LEN * sizeof(HI_CHAR), "%s", "/");
        }
        else
        {/*1、"/xx/filename"  */
            memcpy(szOppositeDirName, pszFileName, u32OppositeDirLen * sizeof(HI_CHAR));
        }

        memcpy(szFileName, ++p, (u32SrcFileLen - u32OppositeDirLen - 1) * sizeof(HI_CHAR));
    }

    szOppositeDirName[PVR_MAX_FILENAME_LEN - 1] = '\0';
    szFileName[PVR_MAX_FILENAME_LEN - 1] = '\0';

    if (0 != u32OppositeDirLen)
    {
        if(HI_NULL == realpath(szOppositeDirName, szAbsoluteDirName))
        {
            HI_ERR_PVR("get real path failed! dirName: %s\n", szOppositeDirName);
            return HI_FAILURE;
        }
    }

    HI_WARN_PVR("szOppositeDirName: %s, szAbsoluteDirName: %s, szFileName: %s\n",szOppositeDirName, szAbsoluteDirName, szFileName);
    if((strlen(szAbsoluteDirName) + strlen(szFileName) + 1) >= PVR_MAX_FILENAME_LEN)
    {
        HI_ERR_PVR("Absolute path is too long, transform fileName failed! (AbsolutePathLen, SrcPathLen): (%u, %u)\n",
                strlen(szAbsoluteDirName), strlen(szFileName));
        return HI_FAILURE;
    }

    memset(pszFileName, 0x00, PVR_MAX_FILENAME_LEN * sizeof(HI_CHAR));
    snprintf(pszFileName, PVR_MAX_FILENAME_LEN - 1, "%s/%s", szAbsoluteDirName, szFileName);

    if(strlen(pszFileName) >= PVR_MAX_FILENAME_LEN)
    {
        HI_ERR_PVR("The standard fileName is too long, FileNameLen: %u ,MaxFileNameLen: %u\n", strlen(pszFileName), PVR_MAX_FILENAME_LEN);
        return HI_ERR_PVR_FILE_INVALID_FNAME;
    }

    HI_PVR_LOG_ENTER();
    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

