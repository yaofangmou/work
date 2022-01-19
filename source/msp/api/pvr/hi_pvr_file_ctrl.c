/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hi_pvr_rec_ctrl.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2008/04/10
  Description   : RECORD module
  History       :
  1.Date        : 2008/04/10
    Author      : sdk
    Modification: Created file

******************************************************************************/

#include <errno.h>
#include <sched.h>
#include <pthread.h>
#include <signal.h>
#include "hi_type.h"
#include "hi_debug.h"
#include <malloc.h>
#include "hi_drv_struct.h"
#include "pvr_debug.h"
#include "hi_pvr_rec_ctrl.h"
#include "hi_pvr_intf.h"
#include "hi_pvr_index.h"
#include "hi_mpi_mem.h"
#include "hi_mpi_pvr.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#ifdef HI_PVR_LINEARIZATION_SUPPORT
static PVR_LINEARIZATION_CHN_S g_stPvrLinearizationChns[PVR_REC_MAX_CHN_NUM];
static HI_BOOL g_bLinearInit = HI_FALSE;

#define CHECK_LINEAR_INIT(bLinearInit)\
    do\
    {\
        if (HI_TRUE != (bLinearInit))\
        {\
            HI_ERR_PVR("Linear Module is not Initialized!\n");\
            return HI_ERR_PVR_NOT_INIT;\
        }\
    } while (0)

#endif

#ifdef HI_PVR_LINEARIZATION_SUPPORT
static PVR_LINEARIZATION_CHN_S* PVRRecFileLinearizationGetFreeChn();
static PVR_LINEARIZATION_CHN_S* PVRRecFileLinearizationGetChnById(HI_U32 u32ChnId);
static HI_S32 PVRRecFileLinearizationReleaseChn(HI_U32 u32ChnId);
static HI_VOID *PVRRecFileLinearizationThread(HI_VOID* pPara);
static HI_VOID PVRRecFileLinearizationReleaseResource(PVR_LINEARIZATION_CHN_S *pstLinearChn);
#endif

#if defined(HI_PVR_LINEARIZATION_SUPPORT) || defined(HI_PVR_POST_PROCESSING_SUPPORT)
static HI_S32 PVRRecFileLinearBufferInit(PVR_LINEAR_BUFFER_S *pstBuf, HI_U32 u32Size);
static HI_VOID PVRRecFileLinearBufferDeInit(PVR_LINEAR_BUFFER_S *pstBuf);
static HI_S32 PVRRecFileLinearBufferReadFile(PVR_FILE64 s32Fd, HI_U64 u64Offset, HI_U32 u32Size, PVR_LINEAR_BUFFER_S *pstBuf);
static HI_S32 PVRRecFileLinearBufferWriteFile(PVR_FILE64 s32Fd, PVR_LINEAR_BUFFER_S *pstBuf);
static HI_S32 PVRRecFileLinearBufferFlushAll(PVR_FILE64 s32Fd, PVR_LINEAR_BUFFER_S *pstBuf);
static HI_S32 PVRTruncateOrLinearizationPrepareFileResource(PVR_FILE_OPT_INFO_S *pstFileOptInfo, HI_BOOL bProcOnOrig);
static HI_S32 PVRLinearizationOrTruncateReadOneEntry(PVR_FRAME_DATA_DISTRIBUTED_INFO* pstFrmDataInfo, PVR_LINEAR_BUFFER_S* pstLinearBuf, HI_S32 s32TsFd);
static HI_S32 PVRLinearizationOrTruncateSaveTsData(PVR_FRAME_DATA_DISTRIBUTED_INFO* pstFrmDataInfo, PVR_LINEAR_BUFFER_S* pstLinearBuf, HI_S32 s32TsReadFd, HI_S32 s32TsWriteFd);
#endif

#ifdef HI_PVR_LINEARIZATION_SUPPORT
STATIC HI_S32 PVRRecFileLinearizationSetChn(PVR_LINEARIZATION_CHN_S* pstLinearChn)
{
    HI_PVR_LOG_ENTER();
    if (HI_NULL == pstLinearChn)
    {
        HI_ERR_PVR("Input parameter error!\n");
        return HI_FAILURE;
    }
    pstLinearChn->bUsed = HI_FALSE;
    pstLinearChn->bStopLinerization = HI_FALSE;
    pstLinearChn->u32TotalNeedFixFrameNum = 0;
    pstLinearChn->u32FixedFrameNum = 0;

    memset(&pstLinearChn->stFileOptInfo, 0x00, sizeof(PVR_FILE_OPT_INFO_S));
    pstLinearChn->stFileOptInfo.s32SrcIdxFd = PVR_FILE_INVALID_FILE;
    pstLinearChn->stFileOptInfo.s32SrcTsFd = PVR_FILE_INVALID_FILE;
    pstLinearChn->stFileOptInfo.s32DstIdxFd = PVR_FILE_INVALID_FILE;
    pstLinearChn->stFileOptInfo.s32DstTsFd = PVR_FILE_INVALID_FILE;

    memset(&pstLinearChn->stRewindInfo, 0x00, sizeof(PVR_LINEAR_REWIND_INFO_S));
    memset(&pstLinearChn->stFrmDataInfo, 0x00, sizeof(PVR_FRAME_DATA_DISTRIBUTED_INFO));
    memset(&pstLinearChn->stLinearBuf, 0x00, sizeof(PVR_LINEAR_BUFFER_S));

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}
HI_S32 PVRRecFileLinearizationInit(HI_VOID)
{
    HI_U32 i = 0;
    HI_U32 j = 0;
    HI_S32 s32Ret = HI_SUCCESS;
    PVR_LINEARIZATION_CHN_S* pstLinearChn = HI_NULL;
    HI_PVR_LOG_ENTER();

    if (HI_TRUE == g_bLinearInit)
    {
        HI_WARN_PVR("The linearization module has been initialized.\n");
        return HI_SUCCESS;
    }

    /* set all linearization channel as INVALID status */
    pstLinearChn = g_stPvrLinearizationChns;
    for (i = 0; i < PVR_LINEARIZATION_MAX_NUM; i++)
    {
        PVR_MUTEX_INIT(&(pstLinearChn->stMutex), s32Ret);
        if (HI_SUCCESS != s32Ret)
        {
            for (j = 0; j < i; j++)
            {
                (HI_VOID)pthread_mutex_destroy(&(g_stPvrLinearizationChns[j].stMutex));
            }
            HI_ERR_PVR("init mutex lock for PVR linerization chn%d failed \n", i);
            return HI_FAILURE;
        }

        PVR_LOCK(&(pstLinearChn->stMutex));
        pstLinearChn->u32ChnId = i + PVR_LINEARIZATION_START_NUM;
        PVRRecFileLinearizationSetChn(pstLinearChn);
        PVR_UNLOCK(&(pstLinearChn->stMutex));
        pstLinearChn++;
    }

    g_bLinearInit = HI_TRUE;

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

HI_S32 PVRRecFileLinearizationDeInit(HI_VOID)
{
    HI_U32 i = 0;
    PVR_LINEARIZATION_CHN_S* pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    if (HI_FALSE == g_bLinearInit)
    {
        HI_ERR_PVR("The Linear Module is not Initialized!\n");
        return HI_ERR_PVR_NOT_INIT;
    }

    /* set all linearization channel as INVALID status */
    pstLinearChn = g_stPvrLinearizationChns;
    for (i = 0; i < PVR_LINEARIZATION_MAX_NUM; i++)
    {
        if (pstLinearChn->bUsed != HI_FALSE)
        {
            HI_ERR_PVR("Linearization chn%d is in use, can NOT deInit Linearization!\n", i);
            return HI_ERR_PVR_BUSY;
        }

        PVR_LOCK(&(pstLinearChn->stMutex));
        PVRRecFileLinearizationSetChn(pstLinearChn);
        PVR_UNLOCK(&(pstLinearChn->stMutex));
        (HI_VOID)pthread_mutex_destroy(&(pstLinearChn->stMutex));
        pstLinearChn++;
    }

    g_bLinearInit = HI_FALSE;
    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

static PVR_LINEARIZATION_CHN_S* PVRRecFileLinearizationGetFreeChn()
{
    HI_U32 i = 0;
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    pstLinearChn = g_stPvrLinearizationChns;
    for (i = 0; i < PVR_LINEARIZATION_MAX_NUM; i++)
    {
        if (HI_FALSE == pstLinearChn->bUsed)
        {
            PVR_LOCK(&pstLinearChn->stMutex);
            PVRRecFileLinearizationSetChn(pstLinearChn);
            pstLinearChn->bUsed = HI_TRUE;
            PVR_UNLOCK(&pstLinearChn->stMutex);
            HI_PVR_LOG_EXIT();
            return pstLinearChn;
        }
        pstLinearChn++;
    }

    HI_PVR_LOG_EXIT();
    return HI_NULL;
}

static HI_S32 PVRRecFileLinearizationReleaseChn(HI_U32 u32ChnId)
{
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    CHECK_LINEAR_INIT(g_bLinearInit);
    pstLinearChn = PVRRecFileLinearizationGetChnById(u32ChnId);
    if (HI_NULL == pstLinearChn)
    {
        HI_ERR_PVR("invalid chanel or the current channel is in use! channelID: %u\n", u32ChnId);
        return HI_FAILURE;
    }

    PVRRecFileLinearizationSetChn(pstLinearChn);

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

static PVR_LINEARIZATION_CHN_S* PVRRecFileLinearizationGetChnById(HI_U32 u32ChnId)
{
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    if ((u32ChnId < PVR_LINEARIZATION_START_NUM) || (u32ChnId >= PVR_LINEARIZATION_MAX_NUM + PVR_LINEARIZATION_START_NUM))
    {
        HI_ERR_PVR("invalid chanelId(%u), MaxId: %u\n", u32ChnId, PVR_LINEARIZATION_MAX_NUM + PVR_LINEARIZATION_START_NUM - 1);
        return HI_NULL;
    }

    pstLinearChn = &g_stPvrLinearizationChns[u32ChnId - PVR_LINEARIZATION_START_NUM];
    if (HI_FALSE == pstLinearChn->bUsed)
    {
        HI_ERR_PVR("The current channel is in use! ChnnelID: %u\n", u32ChnId);
        return HI_NULL;
    }

    HI_PVR_LOG_EXIT();
    return (PVR_LINEARIZATION_CHN_S*)pstLinearChn;
}

static HI_VOID *PVRRecFileLinearizationThread(HI_VOID* pPara)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_S32 s32ChangeSuccess = HI_SUCCESS;
    HI_U32 u32CurReadFrmNum = 0;
    HI_U32 u32CurProcIdxOffset = 0;
    PVR_LINEARIZATION_CHN_S *pstLinearChn = (PVR_LINEARIZATION_CHN_S*)pPara;
    PVR_LINEAR_REWIND_INFO_S *pstRewindInfo = &(pstLinearChn->stRewindInfo);
    PVR_FRAME_DATA_DISTRIBUTED_INFO* pstCurProcTsInfo = &(pstLinearChn->stFrmDataInfo);
    PVR_FILE_OPT_INFO_S* pstFileOptInfo = &(pstLinearChn->stFileOptInfo);
    PVR_LINEAR_BUFFER_S* pstLinearBuf = &(pstLinearChn->stLinearBuf);
    HI_U32 u32HeadPosOffset = 0;

    HI_PVR_LOG_ENTER();

    if (HI_TRUE == pstRewindInfo->bTimeshiftToRec)
    {
        u32HeadPosOffset += pstRewindInfo->stOldCycFrmInfo.u32StartFrame;;
    }

    /*将索引和Ts数据分别刷入新的文件中*/
    while(pstCurProcTsInfo->u32CurProcIdxPos < pstLinearChn->u32TotalNeedFixFrameNum)
    {
        PVR_LOCK(&pstLinearChn->stMutex);
        if (HI_TRUE == pstLinearChn->bStopLinerization)
        {
            pstLinearChn->bStopLinerization = HI_FALSE;
            s32Ret = HI_FAILURE;
            PVR_UNLOCK(&pstLinearChn->stMutex);
            break;
        }

        u32CurReadFrmNum = (pstRewindInfo->stOldCycFrmInfo.u32StartFrame+ pstCurProcTsInfo->u32CurProcIdxPos) % (pstRewindInfo->stOldCycFrmInfo.u32LastFrame + 1);
        u32CurProcIdxOffset = pstRewindInfo->u32HeaderInfoLen + u32CurReadFrmNum * sizeof(pstCurProcTsInfo->stCurProcEntry);
        s32Ret = PVR_Index_RecLinearizationOrTruncateGetOneIndex(pstCurProcTsInfo, pstFileOptInfo->s32SrcIdxFd, u32CurProcIdxOffset, pstRewindInfo->u32IdxVersion);
        if (HI_SUCCESS != s32Ret)
        {
            if (HI_ERR_PVR_INDEX_DATA_ERR == s32Ret)
            {
                if (0 != pstCurProcTsInfo->u32CurProcIdxPos)
                {
                    HI_ERR_PVR("current frame size is zero, idxPos: %u\n", pstCurProcTsInfo->u32CurProcIdxPos);
                }
                pstCurProcTsInfo->u32CurProcIdxPos++;
                pstLinearChn->u32FixedFrameNum++;
                PVR_UNLOCK(&pstLinearChn->stMutex);
                PVR_USLEEP(1000);
                continue;
            }
            else
            {
                HI_ERR_PVR("get one Index failed, ret = %x!\n", s32Ret);
                PVR_UNLOCK(&pstLinearChn->stMutex);
                break;
            }
        }

        (HI_VOID)PVR_Index_RecLinearizationOrTruncateGetTsOffsetByIndex(pstCurProcTsInfo, pstRewindInfo->u32IdxVersion, pstRewindInfo->u64MaxCycSize, pstRewindInfo->u64LastWritePos);

        (HI_VOID)PVR_Index_RecLinearizationOrTruncateProccessOneIndex(pstCurProcTsInfo, pstRewindInfo->u32IdxVersion, &pstRewindInfo->stOldCycFrmInfo, u32HeadPosOffset);

        u32CurProcIdxOffset = pstRewindInfo->u32HeaderInfoLen + pstCurProcTsInfo->u32CurProcIdxPos * sizeof(pstCurProcTsInfo->stCurProcEntry);
        s32Ret = PVR_Index_RecLinearizationOrTruncateSaveOneIndex(&(pstCurProcTsInfo->stCurProcEntry), pstFileOptInfo->s32DstIdxFd, u32CurProcIdxOffset, sizeof(pstCurProcTsInfo->stCurProcEntry));
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("save Index failed, ret = %x!\n", s32Ret);
            PVR_UNLOCK(&pstLinearChn->stMutex);
            break;
        }

        s32Ret = PVRLinearizationOrTruncateSaveTsData(pstCurProcTsInfo, pstLinearBuf, pstFileOptInfo->s32SrcTsFd, pstFileOptInfo->s32DstTsFd);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("process tsData failed, ret = %x!\n", s32Ret);
            PVR_UNLOCK(&pstLinearChn->stMutex);
            break;
        }

        pstCurProcTsInfo->u32CurProcIdxPos++;
        pstLinearChn->u32FixedFrameNum++;
        PVR_UNLOCK(&pstLinearChn->stMutex);
        PVR_USLEEP(1000);
    }

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("Processing data error! ret = %x\n", s32Ret);
    }

    if (HI_SUCCESS != PVRRecFileLinearBufferFlushAll(pstFileOptInfo->s32DstTsFd, pstLinearBuf))
    {
        HI_ERR_PVR("flush linear buffer reminder data to new file. \n");
        s32Ret = HI_FAILURE;
    }

    if (pstLinearChn->u32FixedFrameNum != pstLinearChn->u32TotalNeedFixFrameNum)
    {
        HI_ERR_PVR("repaire failed, FixedFrmNum/TotalNeedFixNum: %u/%u\n",pstLinearChn->u32FixedFrameNum, pstLinearChn->u32TotalNeedFixFrameNum);
        s32Ret = HI_FAILURE;
    }

    /*当所有索引和ts数据修复完成后，刷新索引头数据*/
    pstRewindInfo->stNewCycFrmInfo.u32StartFrame= 0;
    pstRewindInfo->stNewCycFrmInfo.u32EndFrame = pstCurProcTsInfo->u32CurProcIdxPos - 1;
    pstRewindInfo->stNewCycFrmInfo.u32LastFrame = pstCurProcTsInfo->u32CurProcIdxPos - 1;

    s32Ret = PVR_Index_RecLinearizationOrTruncateFlushIndexHeader(pstFileOptInfo,
                                                            &(pstRewindInfo->stOldCycFrmInfo), &(pstRewindInfo->stNewCycFrmInfo),
                                                            pstRewindInfo->bTimeshiftToRec, pstRewindInfo->u32IdxVersion,
                                                            pstRewindInfo->u32HeaderInfoLen, u32HeadPosOffset);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("flush new index file headerInfo failed! ret = 0x%x\n", s32Ret);
    }

    if (HI_SUCCESS != s32Ret)
    {
        s32ChangeSuccess = HI_ERR_PVR_INDEX_DATA_ERR;
    }

    /*上报线性化完成事件*/
    PVR_Intf_DoEventCallback(pstLinearChn->u32ChnId, HI_UNF_PVR_EVENT_RECFILE_LINEARIZATION_COMPLETE, s32ChangeSuccess);

    /*释放使用资源*/
    (HI_VOID)PVRRecFileLinearizationReleaseResource(pstLinearChn);

    HI_PVR_LOG_EXIT();
    return HI_NULL;
}

static HI_VOID PVRRecFileLinearizationReleaseResource(PVR_LINEARIZATION_CHN_S *pstLinearChn)
{
    HI_PVR_LOG_ENTER();

    PVR_CLOSE_INDEX(pstLinearChn->stFileOptInfo.s32SrcIdxFd);
    PVR_CLOSE_INDEX(pstLinearChn->stFileOptInfo.s32DstIdxFd);
    PVR_CLOSE_TS(pstLinearChn->stFileOptInfo.s32SrcTsFd);
    PVR_CLOSE_TS(pstLinearChn->stFileOptInfo.s32DstTsFd);

    (HI_VOID)PVRRecFileLinearBufferDeInit(&pstLinearChn->stLinearBuf);

    pstLinearChn->bStopLinerization = HI_FALSE;

    HI_PVR_DEBUG_EXIT();
    return ;
}
#endif

#ifdef HI_PVR_POST_PROCESSING_SUPPORT
/*检查入参合法性*/
static HI_S32 PVRRecFileTruncateCheckUserCfg(const HI_CHAR *pszSrcFileName, HI_U32 u32SrcFileNameLen, const HI_CHAR *pszDstFileName, HI_U32 u32DstFileNameLen, const HI_UNF_PVR_RECFILE_TRUNCATE_INFO_S *pstTruncInfo)
{
    HI_PVR_LOG_ENTER();

    if ((HI_FALSE == pstTruncInfo->bTruncateHead) && (HI_FALSE == pstTruncInfo->bTruncateTail))
    {
        HI_ERR_PVR("User configuration does not require truncate!\n");
        return HI_ERR_PVR_INVALID_PARA;
    }

    if (strlen(pszSrcFileName) != u32SrcFileNameLen)
    {
        HI_ERR_PVR("Invalid filename configuration!\n");
        return HI_ERR_PVR_INVALID_PARA;
    }

    if ((HI_NULL != pszDstFileName) &&
            (strlen(pszDstFileName) != u32DstFileNameLen))
    {
        HI_ERR_PVR("Invalid filename configuration! dstFileName and dstFileNameLen don't match\n");
        return HI_ERR_PVR_INVALID_PARA;
    }

    if ((HI_TRUE == pstTruncInfo->bTruncateHead) &&
            (pstTruncInfo->u32StartTimeMs < pstTruncInfo->u32PaddingTimeMs))
    {
        HI_ERR_PVR("truncate Head time is invalid!\n");
        return HI_ERR_PVR_INVALID_PARA;
    }

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

/*基于新文件处理truncate，包含处理尾部和头部*/
static HI_S32 PVRRecFileTruncateProcOnNewFile(PVR_TRUNCATE_PROC_S *pstTruncateProcInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32TotalProcNum = 0;
    HI_U32 u32CurReadFrmNum = 0;
    HI_U32 u32CurProcIdxOffset = 0;
    HI_U32 u32HeadPosOffset = 0;
    HI_U32 u32EntrySize = (0 == pstTruncateProcInfo->u32EntryVersion) ? sizeof(PVR_INDEX_ENTRY_S) : sizeof(PVR_INDEX_ENTRY_NEW_S);
    PVR_FRAME_DATA_DISTRIBUTED_INFO* pstCurProcTsInfo = &(pstTruncateProcInfo->stFrmDataDistibutedInfo);
    PVR_CYC_FRAME_NUM_INFO* pstOldCycFrmInfo = &(pstTruncateProcInfo->stOldCycFrmInfo);
    PVR_CYC_FRAME_NUM_INFO stNewCycFrmInfo;
    PVR_FILE_OPT_INFO_S* pstFileOptInfo = &(pstTruncateProcInfo->stFileOptInfo);
    HI_U32 u32StartReadFrmNum = pstOldCycFrmInfo->u32StartFrame;
    HI_U32 u32EndReadFrmNum = pstOldCycFrmInfo->u32EndFrame;

    HI_PVR_LOG_ENTER();

    /*获取truncate位置(头、尾)*/
    s32Ret = PVR_Index_RecFileGetTargetIdxPos(pstTruncateProcInfo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("failed to get targe index position! ret = 0x%x\n", s32Ret);
        return s32Ret;
    }

    if (-1 != pstTruncateProcInfo->u32HeaderPos)
    {
        u32HeadPosOffset += (pstTruncateProcInfo->u32HeaderPos + pstOldCycFrmInfo->u32LastFrame + 1 - pstOldCycFrmInfo->u32StartFrame)%(pstOldCycFrmInfo->u32LastFrame + 1);
    }
    if (HI_TRUE == pstTruncateProcInfo->bProcTimeshift)
    {
        u32HeadPosOffset += pstOldCycFrmInfo->u32StartFrame;
    }

/*truncate pos 可能存在的位置:
**non-rewind:  S--h---t---E(L)
**rewind: -t-E--S-h--L  或--E--S-h--t--L 或--h-t--E--S--L
*/
    if (-1 != pstTruncateProcInfo->u32HeaderPos)
        u32StartReadFrmNum = pstTruncateProcInfo->u32HeaderPos;
    if (-1 != pstTruncateProcInfo->u32TailPos)
        u32EndReadFrmNum = pstTruncateProcInfo->u32TailPos;

    u32TotalProcNum = (u32EndReadFrmNum + pstOldCycFrmInfo->u32LastFrame + 1 - u32StartReadFrmNum) % (pstOldCycFrmInfo->u32LastFrame + 1);
    HI_WARN_PVR("proc total index num: %u, S,E,L,H,T: %u, %u, %u, %u, %u...startRead,endRead: %u, %u\n",u32TotalProcNum, pstOldCycFrmInfo->u32StartFrame, pstOldCycFrmInfo->u32EndFrame,
                pstOldCycFrmInfo->u32LastFrame, pstTruncateProcInfo->u32HeaderPos, pstTruncateProcInfo->u32TailPos, u32StartReadFrmNum, u32EndReadFrmNum);

    /*将索引和Ts数据分别刷入新的文件中*/
    while(pstCurProcTsInfo->u32CurProcIdxPos < u32TotalProcNum)
    {
        u32CurReadFrmNum = (u32StartReadFrmNum + pstCurProcTsInfo->u32CurProcIdxPos) % (pstOldCycFrmInfo->u32LastFrame + 1);
        u32CurProcIdxOffset = pstTruncateProcInfo->u32IndexHeaderLen + (u32CurReadFrmNum * u32EntrySize);
        s32Ret = PVR_Index_RecLinearizationOrTruncateGetOneIndex(pstCurProcTsInfo, pstFileOptInfo->s32SrcIdxFd, u32CurProcIdxOffset, pstTruncateProcInfo->u32EntryVersion);
        if (HI_SUCCESS != s32Ret)
        {
            if (HI_ERR_PVR_INDEX_DATA_ERR == s32Ret)
            {
                if (0 != pstCurProcTsInfo->u32CurProcIdxPos)
                {
                    HI_ERR_PVR("current frame size is zero, idxPos: %u\n", pstCurProcTsInfo->u32CurProcIdxPos);
                }
                pstCurProcTsInfo->u32CurProcIdxPos++;
                PVR_USLEEP(1000);
                continue;
            }
            else
            {
                HI_ERR_PVR("get one Index failed, ret = %x!\n", s32Ret);
                break;
            }
        }

        (HI_VOID)PVR_Index_RecLinearizationOrTruncateGetTsOffsetByIndex(pstCurProcTsInfo, pstTruncateProcInfo->u32EntryVersion, pstTruncateProcInfo->u64MaxCycSize, pstTruncateProcInfo->u64LastWritePos);

        (HI_VOID)PVR_Index_RecLinearizationOrTruncateProccessOneIndex(pstCurProcTsInfo, pstTruncateProcInfo->u32EntryVersion, pstOldCycFrmInfo, u32HeadPosOffset);

        u32CurProcIdxOffset = pstTruncateProcInfo->u32IndexHeaderLen + pstCurProcTsInfo->u32CurProcIdxPos * u32EntrySize;
        s32Ret = PVR_Index_RecLinearizationOrTruncateSaveOneIndex(&(pstCurProcTsInfo->stCurProcEntry), pstFileOptInfo->s32DstIdxFd, u32CurProcIdxOffset, u32EntrySize);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("save Index failed, ret = %x!\n", s32Ret);
            break;
        }

        s32Ret = PVRLinearizationOrTruncateSaveTsData(pstCurProcTsInfo, &(pstTruncateProcInfo->stLinearBuf), pstFileOptInfo->s32SrcTsFd, pstFileOptInfo->s32DstTsFd);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("process tsData failed, ret = %x!\n", s32Ret);
            break;
        }

        pstCurProcTsInfo->u32CurProcIdxPos++;
        PVR_USLEEP(1000);
    }

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("Processing data error! ret = %x\n", s32Ret);
    }

    s32Ret = PVRRecFileLinearBufferFlushAll(pstFileOptInfo->s32DstTsFd, &pstTruncateProcInfo->stLinearBuf);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("flush linear buffer reminder data to new file. \n");
        return s32Ret;
    }

    if (pstCurProcTsInfo->u32CurProcIdxPos != u32TotalProcNum)
    {
        HI_ERR_PVR("repaire failed, FixedFrmNum/TotalNeedFixNum: %u/%u\n",pstCurProcTsInfo->u32CurProcIdxPos, u32TotalProcNum);
    }

    /*当所有索引和ts数据修复完成后，刷新索引头数据*/
    stNewCycFrmInfo.u32StartFrame = 0;
    stNewCycFrmInfo.u32EndFrame = pstTruncateProcInfo->stFrmDataDistibutedInfo.u32CurProcIdxPos - 1;
    stNewCycFrmInfo.u32LastFrame = stNewCycFrmInfo.u32EndFrame;
    s32Ret = PVR_Index_RecLinearizationOrTruncateFlushIndexHeader(&pstTruncateProcInfo->stFileOptInfo,
                                                                    pstOldCycFrmInfo, &stNewCycFrmInfo,
                                                                    pstTruncateProcInfo->bProcTimeshift, pstTruncateProcInfo->u32EntryVersion,
                                                                    pstTruncateProcInfo->u32IndexHeaderLen, u32HeadPosOffset);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("flush new index file headerInfo failed! ret = 0x%x\n", s32Ret);
    }

    HI_PVR_LOG_EXIT();

    return s32Ret;
}

/*在原文件上同步处理，调用此接口时已经确认了原文件为非回绕的*/
static HI_S32 PVRRecFileTruncateProcOnOrig(PVR_TRUNCATE_PROC_S *pstTruncateProcInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U64 u64TsTruncateOffset = 0;

    HI_PVR_LOG_ENTER();

    /*获取truncate位置(头、尾)*/
    s32Ret = PVR_Index_RecFileGetTargetIdxPos(pstTruncateProcInfo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("failed to get targe index position! ret = 0x%x\n", s32Ret);
        return s32Ret;
    }

    if (HI_TRUE == pstTruncateProcInfo->stTruncateUserCfg.bTruncateTail)
    {/*处理尾部*/
        /*处理索引文件*/
        s32Ret = PVR_Index_RecFileTruncateOnlyProcTailOrHeadOnOrig(pstTruncateProcInfo, &u64TsTruncateOffset, HI_FALSE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("truncate index file failed! ret = 0x%x\n", s32Ret);
            return s32Ret;
        }

        /*处理TS文件*/
        s32Ret = PVR_FTRUNCATE64(pstTruncateProcInfo->s32OrigTsWriteFd, u64TsTruncateOffset, HI_FALSE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("truncate ts file failed! ret = 0x%x \n", s32Ret);
            return s32Ret;
        }
    }

    if (HI_TRUE == pstTruncateProcInfo->stTruncateUserCfg.bTruncateHead)
    {/*处理头部*/
        s32Ret = PVR_Index_RecFileTruncateOnlyProcTailOrHeadOnOrig(pstTruncateProcInfo, &u64TsTruncateOffset, HI_TRUE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("truncate index file failed! ret = 0x%x\n", s32Ret);
            return s32Ret;
        }

        /*处理TS文件*/
        s32Ret = PVR_FTRUNCATE64(pstTruncateProcInfo->s32OrigTsWriteFd, u64TsTruncateOffset, HI_TRUE);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("truncate ts file failed! ret = 0x%x \n", s32Ret);
            return s32Ret;
        }
    }

    HI_PVR_LOG_EXIT();

    return HI_SUCCESS;
}

static HI_VOID PVRRecFileTruncateRelease(PVR_TRUNCATE_PROC_S *pstTruncateProcInfo)
{
    HI_PVR_LOG_ENTER();

    PVR_CLOSE_INDEX(pstTruncateProcInfo->stFileOptInfo.s32SrcIdxFd);
    PVR_CLOSE_INDEX(pstTruncateProcInfo->stFileOptInfo.s32DstIdxFd);
    PVR_CLOSE_TS(pstTruncateProcInfo->stFileOptInfo.s32SrcTsFd);
    PVR_CLOSE_TS(pstTruncateProcInfo->stFileOptInfo.s32DstTsFd);
    PVR_CLOSE_TS(pstTruncateProcInfo->s32OrigTsWriteFd);

    (HI_VOID)PVRRecFileLinearBufferDeInit(&pstTruncateProcInfo->stLinearBuf);

    memset(pstTruncateProcInfo, 0x00, sizeof(PVR_TRUNCATE_PROC_S));

    HI_FREE(HI_ID_PVR, pstTruncateProcInfo);

    HI_PVR_LOG_EXIT();
    return ;
}

/*异步处理truncate的线程*/
STATIC HI_VOID* PVRRecFileTruncateThread(HI_VOID* args)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PVR_TRUNCATE_PROC_S* pstTruncateProcInfo = (PVR_TRUNCATE_PROC_S*)args;

    HI_PVR_LOG_ENTER();

    if (HI_NULL == pstTruncateProcInfo)
    {
        HI_ERR_PVR("thread prameter is null!\n");
        return HI_NULL;
    }

    if (0 == strlen(pstTruncateProcInfo->stFileOptInfo.szDstFileName))
    {/*基于原文件处理，此时已经确认原文件非回绕*/
        s32Ret = PVRRecFileTruncateProcOnOrig(pstTruncateProcInfo);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("Failed to truncate on original file! Ret = %x\n", s32Ret);
        }
    }
    else
    {//基于新文件进行处理
        s32Ret = PVRRecFileTruncateProcOnNewFile(pstTruncateProcInfo);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("Failed to truncate on new file! Ret = %x\n", s32Ret);
        }
    }

    /*如果回调函数不为空则调用上层注册回调函数*/
    if (HI_NULL != pstTruncateProcInfo->stTruncateUserCfg.pfnAsyncCB)
    {
        pstTruncateProcInfo->stTruncateUserCfg.pfnAsyncCB(pstTruncateProcInfo->stFileOptInfo.szSrcFileName,
                                                            strlen(pstTruncateProcInfo->stFileOptInfo.szSrcFileName),
                                                            pstTruncateProcInfo->stFileOptInfo.szDstFileName,
                                                            strlen(pstTruncateProcInfo->stFileOptInfo.szDstFileName),
                                                            s32Ret, (HI_VOID*)pstTruncateProcInfo->stTruncateUserCfg.pArgs);
    }

    /*释放资源*/
    (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);

    HI_PVR_LOG_EXIT();

    return HI_NULL;
}
#endif


#if defined(HI_PVR_LINEARIZATION_SUPPORT) || defined(HI_PVR_POST_PROCESSING_SUPPORT)
static HI_S32 PVRRecFileLinearBufferInit(PVR_LINEAR_BUFFER_S *pstBuf, HI_U32 u32Size)
{
    HI_PVR_LOG_ENTER();

#ifndef HI_PVR_FIFO_DIO
    pstBuf->pu8Addr = (HI_U8 *)HI_MALLOC(HI_ID_PVR, u32Size * sizeof(HI_U8));
#else
    pstBuf->pu8Addr = (HI_U8*)memalign((size_t)PVR_DIO_ALIGN_SIZE, (size_t)(u32Size * sizeof(HI_U8)));
#endif
    if (HI_NULL == pstBuf->pu8Addr)
    {
        HI_ERR_PVR("malloc linear buffer error!\n");
        return HI_ERR_PVR_NO_MEM;
    }

    memset(pstBuf->pu8Addr, 0x0, u32Size * sizeof(HI_U8));
    pstBuf->u32Length = u32Size;
    pstBuf->u32Read = 0;
    pstBuf->u32Write = 0;
    pstBuf->u32Used = 0;
    pstBuf->u64Offset = 0;

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

static HI_VOID PVRRecFileLinearBufferDeInit(PVR_LINEAR_BUFFER_S *pstBuf)
{
    HI_PVR_LOG_ENTER();

    if (HI_NULL != pstBuf->pu8Addr)
    {
        memset(pstBuf->pu8Addr, 0x0, pstBuf->u32Length* sizeof(HI_U8));
        HI_FREE(HI_ID_PVR, pstBuf->pu8Addr);
    }

    memset(pstBuf, 0x0, sizeof(PVR_LINEAR_BUFFER_S));

    HI_PVR_LOG_EXIT();
    return ;
}

static HI_S32 PVRRecFileLinearBufferReadFile(PVR_FILE64 s32Fd, HI_U64 u64Offset, HI_U32 u32Size, PVR_LINEAR_BUFFER_S *pstBuf)
{
    HI_S32 s32Length = 0;
    HI_U8 *pu8Buf = pstBuf->pu8Addr + pstBuf->u32Write;
    HI_U32 u32Len1 = 0;
    HI_U32 u32Len2 = 0;
    HI_S64 s64Offset = (HI_S64)u64Offset;
    HI_S32 s32DeltaLen = (0 > s64Offset) ? (HI_S32)abs(s64Offset) : 0;

    HI_PVR_DEBUG_ENTER();

    if (0 == u32Size)
    {
        HI_PVR_DEBUG_EXIT();
        return HI_SUCCESS;
    }

    if (u32Size > (pstBuf->u32Length - pstBuf->u32Used))
    {
        HI_ERR_PVR("current read size(%u) more than buffer free size(%u)\n", u32Size, pstBuf->u32Length - pstBuf->u32Used);
        return HI_FAILURE;
    }

    if (0 != s32DeltaLen)
    {
        if (s32DeltaLen > (HI_S32)u32Size)
        {
            HI_ERR_PVR("DeltaLen(%d) more than Readsize(%u)\n", s32DeltaLen, u32Size);
            return HI_FAILURE;
        }
        HI_WARN_PVR("u64Offset: %lld, s32DeltaLen: %d, size: %u\n", u64Offset, s32DeltaLen, u32Size);

        pstBuf->u32Write  = (pstBuf->u32Write + s32DeltaLen)%pstBuf->u32Length;
        pstBuf->u32Used += s32DeltaLen;
        u64Offset = 0;
        u32Size = u32Size - s32DeltaLen;
    }

    if (pstBuf->u32Write + u32Size <= pstBuf->u32Length)
    {
        u32Len1 = u32Size;
    }
    else
    {
        u32Len1 = pstBuf->u32Length - pstBuf->u32Write;
        u32Len2 = u32Size - u32Len1;
    }

    if (0 != u32Len1)
    {
        s32Length = PVR_PREAD64(pu8Buf, u32Len1, s32Fd, u64Offset);
        if (s32Length != u32Len1)
        {
            HI_ERR_PVR("read tsData from old ts file failed, expect:%u; actual:%d\n", u32Len1, s32Length);
            return HI_ERR_PVR_FILE_CANT_READ;
        }
    }

    if (0 != u32Len2)
    {
        s32Length = PVR_PREAD64(pstBuf->pu8Addr, u32Len2, s32Fd, u64Offset + (HI_U64)u32Len1);
        if (s32Length != u32Len2)
        {
            HI_ERR_PVR("read tsData from old ts file failed, expect:%u; actual:%d\n", u32Len2, s32Length);
            return HI_ERR_PVR_FILE_CANT_READ;
        }
    }

    pstBuf->u32Write += u32Len1;
    pstBuf->u32Used += u32Size;
    if (0 != u32Len2)
    {
        pstBuf->u32Write = u32Len2;
    }

    HI_PVR_DEBUG_EXIT();
    return HI_SUCCESS;
}

static HI_S32 PVRRecFileLinearBufferWriteFile(PVR_FILE64 s32Fd, PVR_LINEAR_BUFFER_S *pstBuf)
{
    HI_S32 s32Length = 0;
    HI_U8 *pu8Buf = pstBuf->pu8Addr + pstBuf->u32Read;
    HI_U32 u32Len = (pstBuf->u32Used / 512) * 512;
    HI_U32 u32Len1 = 0;
    HI_U32 u32Len2 = 0;

    HI_PVR_DEBUG_ENTER();

    if (0 == u32Len)
    {
        HI_PVR_DEBUG_EXIT();
        return HI_SUCCESS;
    }

    if (pstBuf->u32Read + u32Len <= pstBuf->u32Length)
    {
        u32Len1 = u32Len;
    }
    else
    {
        u32Len1 = pstBuf->u32Length - pstBuf->u32Read;
        u32Len2 = u32Len - u32Len1;
    }

    s32Length = PVR_PWRITE64(pu8Buf, u32Len1, s32Fd, pstBuf->u64Offset);
    if (s32Length != u32Len1)
    {
        HI_ERR_PVR("write tsData to new ts file failed, expect:%u; actual:%u\n", u32Len1, s32Length);
        return HI_ERR_PVR_FILE_CANT_WRITE;
    }

    s32Length = PVR_PWRITE64(pstBuf->pu8Addr, u32Len2, s32Fd, pstBuf->u64Offset + (HI_U64)u32Len1);
    if (s32Length != u32Len2)
    {
        HI_ERR_PVR("write tsData to new ts file failed, expect:%u; actual:%u\n", u32Len2, s32Length);
        return HI_ERR_PVR_FILE_CANT_WRITE;
    }

    pstBuf->u32Read = (pstBuf->u32Read + u32Len) % pstBuf->u32Length;
    pstBuf->u32Used -= u32Len;
    pstBuf->u64Offset += (HI_U64)u32Len;

    HI_PVR_DEBUG_EXIT();
    return HI_SUCCESS;
}

/*将linearBuffer中剩余的数据全部写入TS文件中*/
static HI_S32 PVRRecFileLinearBufferFlushAll(PVR_FILE64 s32Fd, PVR_LINEAR_BUFFER_S *pstBuf)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PVR_LOG_ENTER();

    if (0 == pstBuf->u32Used)
    {
        HI_PVR_LOG_EXIT();
        return HI_SUCCESS;
    }

    pstBuf->u32Used = (pstBuf->u32Used/512 + 1) * 512;

    s32Ret = PVRRecFileLinearBufferWriteFile(s32Fd, pstBuf);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("flush all data to new file faile! ret = %x, reminderDataSize: %u\n", s32Ret, pstBuf->u32Used);
    }

    HI_PVR_LOG_EXIT();
    return s32Ret;
}

static HI_S32 PVRTruncateOrLinearizationPrepareFileResource(PVR_FILE_OPT_INFO_S *pstFileOptInfo, HI_BOOL bProcOnOrig)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_S32 s32SrcIndexFileOpenMode = PVR_FOPEN_MODE_INDEX_READ;
    HI_CHAR szSrcIndexFileName[PVR_MAX_FILENAME_LEN] = {0};
    HI_CHAR szDstIndexFileName[PVR_MAX_FILENAME_LEN] = {0};

    HI_PVR_LOG_ENTER();

    if (HI_TRUE == bProcOnOrig)
    {
        s32SrcIndexFileOpenMode = PVR_FOPEN_MODE_INDEX_BOTH;
    }

    /*源文件*/
    if (0 != strlen(pstFileOptInfo->szSrcFileName))
    {
        s32Ret = PVR_GetTheStandardFileName(pstFileOptInfo->szSrcFileName);
        if(HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("get real fileName failed! ret = 0x%x\n", s32Ret);
            return s32Ret;
        }

        (HI_VOID)PVR_Index_GetIdxFileName(szSrcIndexFileName, pstFileOptInfo->szSrcFileName);

        /*检测修复文件是否存在*/
        if ((HI_FALSE == PVR_CHECK_FILE_EXIST(pstFileOptInfo->szSrcFileName)) || (HI_FALSE == PVR_CHECK_FILE_EXIST(szSrcIndexFileName)))
        {
            HI_ERR_PVR("process Srcfile doesn't exist! ret = %x\n", HI_ERR_PVR_FILE_NOT_EXIST);
            return HI_ERR_PVR_FILE_NOT_EXIST;
        }

        /*检测修复文件是否在录制*/
        if (HI_TRUE == PVRRecCheckFileRecording(pstFileOptInfo->szSrcFileName))
        {
            HI_ERR_PVR("The current file is being recorded, doesn't support file operation! ret = %x\n", HI_ERR_PVR_NOT_SUPPORT);
            return HI_ERR_PVR_NOT_SUPPORT;
        }

        pstFileOptInfo->s32SrcIdxFd = PVR_OPEN(szSrcIndexFileName, s32SrcIndexFileOpenMode);
        if (PVR_FILE_INVALID_FILE == pstFileOptInfo->s32SrcIdxFd)
        {
            HI_ERR_PVR("open file(%s) failed!\n", szSrcIndexFileName);
            return HI_ERR_PVR_FILE_CANT_OPEN;
        }

        pstFileOptInfo->s32SrcTsFd = PVR_OPEN64(pstFileOptInfo->szSrcFileName, PVR_FOPEN_MODE_DATA_READ);
        if (PVR_FILE_INVALID_FILE == pstFileOptInfo->s32SrcTsFd)
        {
            HI_ERR_PVR("open file(%s) failed!\n", pstFileOptInfo->szSrcFileName);
            PVR_CLOSE_INDEX(pstFileOptInfo->s32SrcIdxFd);
            return HI_ERR_PVR_FILE_CANT_OPEN;
        }
    }

    /*目标文件*/
    if (0 != strlen(pstFileOptInfo->szDstFileName))
    {
        s32Ret = PVR_GetTheStandardFileName(pstFileOptInfo->szDstFileName);
        if(HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("get real fileName failed! ret = 0x%x\n", s32Ret);
            PVR_CLOSE_INDEX(pstFileOptInfo->s32SrcIdxFd);
            PVR_CLOSE_TS(pstFileOptInfo->s32SrcTsFd);
            return s32Ret;
        }

        /*删除一次新文件*/
        (HI_VOID)HI_PVR_RemoveFile(pstFileOptInfo->szDstFileName);

        (HI_VOID)PVR_Index_GetIdxFileName(szDstIndexFileName, pstFileOptInfo->szDstFileName);
        pstFileOptInfo->s32DstIdxFd = PVR_OPEN(szDstIndexFileName, PVR_FOPEN_MODE_INDEX_BOTH);
        if (PVR_FILE_INVALID_FILE == pstFileOptInfo->s32DstIdxFd)
        {
            HI_ERR_PVR("open file(%s) failed!\n", szSrcIndexFileName);
            PVR_CLOSE_INDEX(pstFileOptInfo->s32SrcIdxFd);
            PVR_CLOSE_TS(pstFileOptInfo->s32SrcTsFd);
            return HI_ERR_PVR_FILE_CANT_OPEN;
        }

        pstFileOptInfo->s32DstTsFd = PVR_OPEN64(pstFileOptInfo->szDstFileName, PVR_FOPEN_MODE_DATA_BOTH);
        if (PVR_FILE_INVALID_FILE == pstFileOptInfo->s32DstTsFd)
        {
            HI_ERR_PVR("open file(%s) failed!\n", pstFileOptInfo->szDstFileName);
            PVR_CLOSE_INDEX(pstFileOptInfo->s32SrcIdxFd);
            PVR_CLOSE_TS(pstFileOptInfo->s32SrcTsFd);
            PVR_CLOSE_INDEX(pstFileOptInfo->s32DstIdxFd);
            return HI_ERR_PVR_FILE_CANT_OPEN;
        }
    }

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

static HI_S32 PVRLinearizationOrTruncateReadOneEntry(PVR_FRAME_DATA_DISTRIBUTED_INFO* pstFrmDataInfo, PVR_LINEAR_BUFFER_S* pstLinearBuf, HI_S32 s32TsFd)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (0 != pstFrmDataInfo->u32Length1)
    {
        s32Ret = PVRRecFileLinearBufferReadFile(s32TsFd, pstFrmDataInfo->u64Offset1, pstFrmDataInfo->u32Length1, pstLinearBuf);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("read tsData length1 from old ts file failed, s32Ret = %x\n", s32Ret);
            return s32Ret;
        }
    }

    if (0 != pstFrmDataInfo->u32Length2)
    {
        s32Ret = PVRRecFileLinearBufferReadFile(s32TsFd, pstFrmDataInfo->u64Offset2, pstFrmDataInfo->u32Length2, pstLinearBuf);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("read tsData length2 from old ts file failed, s32Ret = %x\n", s32Ret);
            return s32Ret;
        }
    }

    if (0 != pstFrmDataInfo->u32Length3)
    {
        s32Ret = PVRRecFileLinearBufferReadFile(s32TsFd, pstFrmDataInfo->u64Offset3, pstFrmDataInfo->u32Length3, pstLinearBuf);
        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_PVR("read tsData length3 from old ts file failed, s32Ret = %x\n", s32Ret);
            return s32Ret;
        }
    }

    return HI_SUCCESS;
}

/*将linearBuffer中的数据写入目标TS文件中去*/
static HI_S32 PVRLinearizationOrTruncateSaveTsData(PVR_FRAME_DATA_DISTRIBUTED_INFO* pstFrmDataInfo, PVR_LINEAR_BUFFER_S* pstLinearBuf, HI_S32 s32TsReadFd, HI_S32 s32TsWriteFd)
{
    HI_S32 s32Ret = HI_SUCCESS;

    HI_PVR_DEBUG_ENTER();

    s32Ret = PVRLinearizationOrTruncateReadOneEntry(pstFrmDataInfo, pstLinearBuf, s32TsReadFd);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("read one entry from old ts file failed!, Ret = %x\n", s32Ret);
        return s32Ret;
    }

    s32Ret = PVRRecFileLinearBufferWriteFile(s32TsWriteFd, pstLinearBuf);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("write ts data to new ts file failed!, Ret = %x\n", s32Ret);
        return s32Ret;
    }

    pstFrmDataInfo->u32Length1 = 0;
    pstFrmDataInfo->u32Length2 = 0;
    pstFrmDataInfo->u32Length3 = 0;
    pstFrmDataInfo->u64Offset1 = 0;
    pstFrmDataInfo->u64Offset2 = 0;
    pstFrmDataInfo->u64Offset3 = 0;

    HI_PVR_DEBUG_EXIT();
    return HI_SUCCESS;
}
#endif


#ifdef HI_PVR_LINEARIZATION_SUPPORT
HI_S32 HI_PVR_RecFileStartLinearization(HI_U32 *pu32ChnId, const HI_UNF_PVR_LINEARIZATION_ATTR_S *pstRepaireAttr)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_BOOL bNeedRepairTsFile = HI_TRUE;
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    PVR_CHECK_POINTER(pu32ChnId);
    PVR_CHECK_POINTER(pstRepaireAttr);

    /*check init*/
    CHECK_LINEAR_INIT(g_bLinearInit);

    /*check user config*/
    if ((strlen(pstRepaireAttr->szSrcFileName) != pstRepaireAttr->u32SrcFileNameLen)
        || (strlen(pstRepaireAttr->szDstFileName) != pstRepaireAttr->u32DstFileNameLen)
        || (strlen(pstRepaireAttr->szSrcFileName) >= PVR_MAX_FILENAME_LEN)
        || (strlen(pstRepaireAttr->szDstFileName) >= PVR_MAX_FILENAME_LEN))
    {
        HI_ERR_PVR("file name length doesn't match, strlen(srcFileName): %u, SrcFileNameLen: %u, strlen(dstFileName): %u, DstFileNameLen: %u\n",
                strlen(pstRepaireAttr->szSrcFileName), pstRepaireAttr->u32SrcFileNameLen,
                strlen(pstRepaireAttr->szDstFileName), pstRepaireAttr->u32DstFileNameLen);
        return HI_ERR_PVR_INVALID_PARA;
    }

    /*get free channel*/
    pstLinearChn = PVRRecFileLinearizationGetFreeChn();
    if (HI_NULL == pstLinearChn)
    {
        HI_ERR_PVR("get free linerization chnnel failed!\n");
        return HI_FAILURE;
    }

    PVR_LOCK(&pstLinearChn->stMutex);
    memcpy(pstLinearChn->stFileOptInfo.szSrcFileName, pstRepaireAttr->szSrcFileName, sizeof(HI_CHAR)*pstRepaireAttr->u32SrcFileNameLen);
    memcpy(pstLinearChn->stFileOptInfo.szDstFileName, pstRepaireAttr->szDstFileName, sizeof(HI_CHAR)*pstRepaireAttr->u32DstFileNameLen);

    /*prepare file resource,like standard fileName and file Descriptor*/
    s32Ret = PVRTruncateOrLinearizationPrepareFileResource(&(pstLinearChn->stFileOptInfo), HI_FALSE);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("Prepare file resources failed! ret= 0x%x \n", s32Ret);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return s32Ret;
    }

    /*Check the necessity of linearization*/
    s32Ret = PVR_Index_LinearizationCheckNeedToDo(pstLinearChn->stFileOptInfo.s32SrcIdxFd, &bNeedRepairTsFile);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("check if the current file needs to be linearized failed! Ret = %x\n", s32Ret);
        PVRRecFileLinearizationReleaseResource(pstLinearChn);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return s32Ret;
    }

    if (HI_FALSE == bNeedRepairTsFile)
    {
        HI_ERR_PVR("current file(%s) is Lineary,don't need to Linear!\n", pstLinearChn->stFileOptInfo.szSrcFileName);
        PVRRecFileLinearizationReleaseResource(pstLinearChn);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return HI_ERR_PVR_INVALID_PARA;
    }

    s32Ret = PVR_Index_LinearizationAnalyzeIndexHeader(pstLinearChn->stFileOptInfo.s32SrcIdxFd, &pstLinearChn->stRewindInfo, &pstLinearChn->u32TotalNeedFixFrameNum);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("analyze source index header failed! ret = %x\n", s32Ret);
        (HI_VOID)PVRRecFileLinearizationReleaseResource(pstLinearChn);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return s32Ret;
    }

    memset(&pstLinearChn->stLinearBuf, 0x00, sizeof(pstLinearChn->stLinearBuf));
    if (HI_SUCCESS != PVRRecFileLinearBufferInit(&pstLinearChn->stLinearBuf, PVR_STUB_TSDATA_SIZE))
    {
        HI_ERR_PVR("init linear buffer error!\n");
        (HI_VOID)PVRRecFileLinearizationReleaseResource(pstLinearChn);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return HI_ERR_PVR_NO_MEM;
    }

    /*start linearization*/
    if (0 != pthread_create(&pstLinearChn->RepaireThread, HI_NULL, PVRRecFileLinearizationThread, (HI_VOID *)pstLinearChn))
    {
        HI_ERR_PVR("create process index and ts data thread failed!\n");
        (HI_VOID)PVRRecFileLinearizationReleaseResource(pstLinearChn);
        (HI_VOID)PVRRecFileLinearizationReleaseChn(pstLinearChn->u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return HI_FAILURE;
    }

    PVR_UNLOCK(&pstLinearChn->stMutex);
    *pu32ChnId = pstLinearChn->u32ChnId;

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

HI_S32 HI_PVR_RecFileLinearizationGetStatus(HI_U32 u32ChnId, HI_UNF_PVR_LINEARIZATION_STATUS_S *pstLineariztionStatus)
{
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    PVR_CHECK_POINTER(pstLineariztionStatus);

    CHECK_LINEAR_INIT(g_bLinearInit);

    pstLinearChn = PVRRecFileLinearizationGetChnById(u32ChnId);
    if (HI_NULL == pstLinearChn)
    {
        HI_ERR_PVR("Linearization channel is invalid or the current channel is not used, ChannelId: %u!\n", u32ChnId);
        return HI_FAILURE;
    }

    memset(pstLineariztionStatus, 0x00, sizeof(HI_UNF_PVR_LINEARIZATION_STATUS_S));
    PVR_LOCK(&pstLinearChn->stMutex);
    pstLineariztionStatus->u32TotalFrameNum = pstLinearChn->u32TotalNeedFixFrameNum;
    pstLineariztionStatus->u32CurrentFixFrameNum= pstLinearChn->u32FixedFrameNum;
    PVR_UNLOCK(&pstLinearChn->stMutex);

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

HI_S32 HI_PVR_RecFileStopLinearization(HI_U32 u32ChnId)
{
    PVR_LINEARIZATION_CHN_S *pstLinearChn = HI_NULL;

    HI_PVR_LOG_ENTER();

    CHECK_LINEAR_INIT(g_bLinearInit);

    pstLinearChn = PVRRecFileLinearizationGetChnById(u32ChnId);
    if (HI_NULL == pstLinearChn)
    {
        HI_ERR_PVR("Linearization channel is invalid, ChannelID: %u!\n", u32ChnId);
        return HI_FAILURE;
    }

    if (HI_TRUE == pstLinearChn->bStopLinerization)
    {
        HI_ERR_PVR("Linearization is stopping,please wait!\n");
        return HI_FAILURE;
    }

    PVR_LOCK(&pstLinearChn->stMutex);
    pstLinearChn->bStopLinerization = HI_TRUE;
    PVR_UNLOCK(&pstLinearChn->stMutex);

    if (0 != pstLinearChn->RepaireThread)
    {
        (HI_VOID)pthread_join(pstLinearChn->RepaireThread, HI_NULL);
    }

    PVR_LOCK(&pstLinearChn->stMutex);
    if (HI_SUCCESS != PVRRecFileLinearizationReleaseChn(u32ChnId))
    {
        HI_ERR_PVR("realease linearization channel(%u) failed!\n", u32ChnId);
        PVR_UNLOCK(&pstLinearChn->stMutex);
        return HI_ERR_PVR_INVALID_CHNID;
    }
    PVR_UNLOCK(&pstLinearChn->stMutex);

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}
#endif

#ifdef HI_PVR_POST_PROCESSING_SUPPORT
HI_S32 HI_PVR_RecFileTruncate(const HI_CHAR *pszSrcFileName, HI_U32 u32SrcFileNameLen, const HI_CHAR *pszDstFileName, HI_U32 u32DstFileNameLen, const HI_UNF_PVR_RECFILE_TRUNCATE_INFO_S *pstUserCfg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_BOOL bProcOnOrig = HI_TRUE;
    HI_U64 u64OrigTsFileSize = 0;
    pthread_t truncateThdId;
    PVR_TRUNCATE_PROC_S* pstTruncateProcInfo = HI_NULL;
    PVR_FILE_OPT_INFO_S* pstFileOptInfo = HI_NULL;

    HI_PVR_LOG_ENTER();

    PVR_CHECK_POINTER(pszSrcFileName);
    PVR_CHECK_POINTER(pstUserCfg);

    /*检查相关配置*/
    s32Ret = PVRRecFileTruncateCheckUserCfg(pszSrcFileName, u32SrcFileNameLen, pszDstFileName, u32DstFileNameLen, pstUserCfg);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("invalid paramenters! Ret = %x\n", s32Ret);
        return s32Ret;
    }

    /*mallc truncateProcInfo*/
    pstTruncateProcInfo = HI_MALLOC(HI_ID_PVR, sizeof(PVR_TRUNCATE_PROC_S));
    if (HI_NULL == pstTruncateProcInfo)
    {
        HI_ERR_PVR("malloc truncateProcInfo buffer failed!\n");
        return HI_ERR_PVR_NO_MEM;
    }

    /*初始化相关参数*/
    pstFileOptInfo = &(pstTruncateProcInfo->stFileOptInfo);
    memset(pstTruncateProcInfo, 0x00, sizeof(PVR_TRUNCATE_PROC_S));
    pstTruncateProcInfo->s32OrigTsWriteFd = PVR_FILE_INVALID_FILE;
    pstFileOptInfo->s32SrcTsFd= PVR_FILE_INVALID_FILE;
    pstFileOptInfo->s32SrcIdxFd = PVR_FILE_INVALID_FILE;
    pstFileOptInfo->s32DstTsFd = PVR_FILE_INVALID_FILE;
    pstFileOptInfo->s32DstIdxFd = PVR_FILE_INVALID_FILE;
    pstTruncateProcInfo->u32HeaderPos = -1;
    pstTruncateProcInfo->u32TailPos = -1;
    pstTruncateProcInfo->u32RewindLastFrm = 0;
    pstTruncateProcInfo->bProcTimeshift = HI_FALSE;
    memcpy(&pstTruncateProcInfo->stTruncateUserCfg, pstUserCfg, sizeof(HI_UNF_PVR_RECFILE_TRUNCATE_INFO_S));
    memcpy(pstFileOptInfo->szSrcFileName, pszSrcFileName, sizeof(HI_CHAR) * u32SrcFileNameLen);
    if ((HI_NULL != pszDstFileName) && (0 != u32DstFileNameLen))
    {
        bProcOnOrig = HI_FALSE;
        memcpy(pstFileOptInfo->szDstFileName, pszDstFileName, sizeof(HI_CHAR) * u32DstFileNameLen);
    }

    s32Ret = PVRTruncateOrLinearizationPrepareFileResource(&pstTruncateProcInfo->stFileOptInfo, bProcOnOrig);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("Failed to Prepare the resources needed for truncate! Ret = %x\n", s32Ret);
        (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
        pstTruncateProcInfo = HI_NULL;
        return s32Ret;
    }

    pstTruncateProcInfo->s32OrigTsWriteFd = PVR_OPEN64(pstTruncateProcInfo->stFileOptInfo.szSrcFileName, PVR_FOPEN_MODE_DATA_WRITE);
    if (PVR_FILE_INVALID_FILE == pstTruncateProcInfo->s32OrigTsWriteFd)
    {
        HI_ERR_PVR("open file(%s) failed!\n", pstTruncateProcInfo->stFileOptInfo.szSrcFileName);
        (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
        pstTruncateProcInfo = HI_NULL;
        return HI_ERR_PVR_FILE_CANT_OPEN;
    }

    /*修复索引*/
    u64OrigTsFileSize = PVR_FILE_GetFileSize64(pstTruncateProcInfo->stFileOptInfo.szSrcFileName);
    s32Ret = PVR_Index_CorretIndexFile(pstTruncateProcInfo, u64OrigTsFileSize);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("correct index file failed! Ret = %x\n", s32Ret);
        (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
        pstTruncateProcInfo = HI_NULL;
        return s32Ret;
    }

    /*检查是否满足进行truncate的条件*/
    s32Ret = PVR_Index_RecFileTruncateCheckNeedToDo(pstTruncateProcInfo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PVR("Current conditions cannot be truncate! Ret = %x\n", s32Ret);
        (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
        pstTruncateProcInfo = HI_NULL;
        return s32Ret;
    }

    HI_WARN_PVR("bTruncateHead: %d, bTruncateTail: %d\n",pstTruncateProcInfo->stTruncateUserCfg.bTruncateHead,
                    pstTruncateProcInfo->stTruncateUserCfg.bTruncateTail);
    if (HI_FALSE == bProcOnOrig)
    {
        memset(&pstTruncateProcInfo->stLinearBuf, 0x0, sizeof(pstTruncateProcInfo->stLinearBuf));
        if (HI_SUCCESS != PVRRecFileLinearBufferInit(&pstTruncateProcInfo->stLinearBuf, PVR_STUB_TSDATA_SIZE))
        {
            HI_ERR_PVR("init linear buffer error!\n");
            (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
            pstTruncateProcInfo = HI_NULL;
            return HI_ERR_PVR_NO_MEM;
        }
    }

    if (HI_FALSE == pstUserCfg->bSync)
    {//异步处理
        if (0 != pthread_create(&truncateThdId, HI_NULL, PVRRecFileTruncateThread, pstTruncateProcInfo))
        {
            HI_ERR_PVR("create thread failed!\n");
            (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
            pstTruncateProcInfo = HI_NULL;
            return HI_FAILURE;
        }
    }
    else
    {//同步处理
        if (HI_TRUE == bProcOnOrig)
        {/*基于原文件处理，此时已经确认原文件非回绕*/
            s32Ret = PVRRecFileTruncateProcOnOrig(pstTruncateProcInfo);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PVR("Failed to truncate on original file! Ret = %x\n", s32Ret);
            }
        }
        else
        {//基于新文件进行处理
            s32Ret = PVRRecFileTruncateProcOnNewFile(pstTruncateProcInfo);
            if (HI_SUCCESS != s32Ret)
            {
                HI_ERR_PVR("Failed to truncate on new file! Ret = %x\n", s32Ret);
            }
        }

        /*释放资源*/
        (HI_VOID)PVRRecFileTruncateRelease(pstTruncateProcInfo);
        pstTruncateProcInfo = HI_NULL;
        HI_PVR_LOG_EXIT();
        return s32Ret;
    }

    HI_PVR_LOG_EXIT();
    return HI_SUCCESS;
}

#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

