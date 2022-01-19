/******************************************************************************
  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_disp_bufcore.c
Version       : Initial Draft
Author        : Hisilicon multimedia software group
Created       : 2012/12/30
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/

#include "drv_disp_bufcore.h"
#include "drv_disp_osal.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

HI_S32 Common_InitList(COMMON_LIST_S *pstBufList, COMMON_LISTTYPE_E eListType)
{
    INIT_LIST_HEAD(&(pstBufList->stBufNodeHead));
    spin_lock_init(&(pstBufList->stBufLock));
    pstBufList->eListType = eListType;

    return HI_SUCCESS;
}

HI_S32 Common_DeInitList(COMMON_LIST_S *pstBufList)
{
    INIT_LIST_HEAD(&(pstBufList->stBufNodeHead));
    spin_lock_init(&(pstBufList->stBufLock));

    return HI_SUCCESS;
}

HI_S32 CommonList_AddNode(COMMON_LIST_S *pstBufListHead, struct list_head *pstNode)

{
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&pstBufListHead->stBufLock, irqflag);
    list_add_tail(pstNode, &pstBufListHead->stBufNodeHead);
    spin_unlock_irqrestore(&pstBufListHead->stBufLock, irqflag);

    return HI_SUCCESS;
}

HI_S32 CommonList_DelNode(COMMON_LIST_S *pstBufListHead, struct list_head *pstNode)

{
    HI_SIZE_T irqflag = 0;
    struct list_head *pos = HI_NULL, *n = HI_NULL;

    spin_lock_irqsave(&pstBufListHead->stBufLock, irqflag);
    list_for_each_safe(pos, n, &(pstBufListHead->stBufNodeHead))
    {
        if (pos == pstNode)
        {

            list_del(pstNode);
            break;
        }
    }

    spin_unlock_irqrestore(&pstBufListHead->stBufLock, irqflag);
    return HI_SUCCESS;
}

HI_S32 BufferList_GetNode(COMMON_LIST_S *pstBufListHead,
                              struct list_head **pstNode)
{
    HI_SIZE_T irqflag = 0;
    spin_lock_irqsave(&pstBufListHead->stBufLock, irqflag);
    if (list_empty(&pstBufListHead->stBufNodeHead))
    {
        *pstNode = HI_NULL;
        spin_unlock_irqrestore(&pstBufListHead->stBufLock, irqflag);
        return HI_FAILURE;
    }

    *pstNode = pstBufListHead->stBufNodeHead.next;
    spin_unlock_irqrestore(&pstBufListHead->stBufLock, irqflag);
    return HI_SUCCESS;
}
HI_S32 DispBuf_Create(DISP_BUF_S *pstBuffer, HI_U32 number)
{
    DISP_BUF_NODE_S *pstNodeBaseAddr = HI_NULL;
    HI_U32 u;

    if (!number || (number > DISP_BUF_NODE_MAX_NUMBER))
    {
        DISP_ERROR("DispBuf_Create buffer number is invalid %d\n", number);
        return HI_FAILURE;
    }

    /*init list and buffer number.*/
    Common_InitList(&pstBuffer->stFullArray, LIST_TYPE_FRAME_TYPE);
    Common_InitList(&pstBuffer->stEmptyArray, LIST_TYPE_FRAME_TYPE);
    Common_InitList(&pstBuffer->stUsingArray, LIST_TYPE_FRAME_TYPE);
    pstBuffer->u32Number = number;

    /*allocate the bufnode and insert them to empty list.*/
    pstNodeBaseAddr = (DISP_BUF_NODE_S *)DISP_MALLOC(sizeof(DISP_BUF_NODE_S) * pstBuffer->u32Number);
    if (!pstNodeBaseAddr)
    {
        DISP_ERROR("DispBuf_Create malloc node memory!\n");
        return HI_ERR_DISP_MALLOC_FAILED;
    }

    pstBuffer->pstBasicNodeContainer = pstNodeBaseAddr;
    for (u = 0; u < pstBuffer->u32Number; u++)
    {
        CommonList_AddNode(&pstBuffer->stEmptyArray, &pstNodeBaseAddr->stlistNode);
        pstNodeBaseAddr++;
    }

    return HI_SUCCESS;
}

HI_VOID DispBuf_Destoy(DISP_BUF_S *pstBuffer)
{
    if (HI_NULL == pstBuffer)
    {
        DISP_ERROR("null ptr\n");
        return;
    }

    DISP_FREE(pstBuffer->pstBasicNodeContainer); //pstBufArray[0] has the base addr
    memset(pstBuffer, 0, sizeof(DISP_BUF_S));
    return ;
}

HI_S32 DispBuf_GetNodeContent(DISP_BUF_S *pstBuffer,
                                      HI_S32 s32Index,
                                      DISP_BUF_NODE_S **ppstNode)
{
    if (s32Index < pstBuffer->u32Number)
    {
        *ppstNode = &pstBuffer->pstBasicNodeContainer[s32Index];
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

HI_S32 DispBuf_GetEmptyNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S **ppstNode)
{
   struct list_head *pstNode = HI_NULL;
   if (HI_SUCCESS != BufferList_GetNode(&pstBuffer->stEmptyArray,&pstNode))
   {
        return HI_ERR_VO_BUFQUE_FULL;
   }

   *ppstNode = (list_entry(pstNode, DISP_BUF_NODE_S, stlistNode));
   return HI_SUCCESS;
}

HI_S32 DispBuf_DelEmptyNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    HI_S32 s32Ret = HI_FAILURE;
    s32Ret = CommonList_DelNode(&pstBuffer->stEmptyArray, &pstNode->stlistNode);
    return s32Ret;
}

HI_S32 DispBuf_GetUsingNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S **ppstNode)
{
   struct list_head *pstNode = HI_NULL;

   if (HI_SUCCESS != BufferList_GetNode(&pstBuffer->stUsingArray,&pstNode))
   {
        return HI_ERR_VO_BUFQUE_EMPTY;
   }

   *ppstNode = (list_entry(pstNode, DISP_BUF_NODE_S, stlistNode));
   return HI_SUCCESS;
}

HI_S32 DispBuf_DelUsingNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    HI_S32 s32Ret = HI_FAILURE;
    s32Ret = CommonList_DelNode(&pstBuffer->stUsingArray, &pstNode->stlistNode);
    return s32Ret;
}

// put node into empry array and set empty state
HI_S32 DispBuf_AddUsingNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    CommonList_AddNode(&pstBuffer->stUsingArray, &pstNode->stlistNode);
    return HI_SUCCESS;
}

DISP_BUF_NODE_S * DispBuf_FindNodeInList(COMMON_LIST_S  *pstListHead,
                                                 HI_U32 U32YAddr,
                                                 HI_U32 u32FrameIndex)
{
    struct list_head *pos = HI_NULL, *n = HI_NULL;
    DISP_BUF_NODE_S *pstTmp = HI_NULL;
    HI_SIZE_T irqflag = 0;
    HI_DRV_VIDEO_FRAME_S *pstTmpFrm = HI_NULL;

    spin_lock_irqsave(&pstListHead->stBufLock, irqflag);

    list_for_each_safe(pos, n, &(pstListHead->stBufNodeHead))
    {
        pstTmp = list_entry(pos, DISP_BUF_NODE_S, stlistNode);
        pstTmpFrm = (HI_DRV_VIDEO_FRAME_S *)pstTmp->u32Data;

        if ((pstTmpFrm->stBufAddr[0].u32PhyAddr_Y == U32YAddr)
            || (pstTmpFrm->stPlayInfor.u32FrameIndex == u32FrameIndex))
        {
            spin_unlock_irqrestore(&pstListHead->stBufLock, irqflag);
            return pstTmp;
        }
    }

    spin_unlock_irqrestore(&pstListHead->stBufLock, irqflag);
    return HI_NULL;
}

HI_VOID DispBuf_GatherHwNode(COMMON_LIST_S  *pstListHead,
                             HI_U32 U32YAddr,
                             HI_U32 *pu32BufNum,
                             HI_DRV_VIDEO_FRAME_S **parrayFrameList)
{
    struct list_head *pos = HI_NULL, *n = HI_NULL;
    DISP_BUF_NODE_S *pstTmp = HI_NULL;
    HI_SIZE_T irqflag = 0;
    HI_DRV_VIDEO_FRAME_S *pstTmpFrm = HI_NULL;
    HI_U32 i = 0;

    spin_lock_irqsave(&pstListHead->stBufLock, irqflag);
    list_for_each_safe(pos, n, &(pstListHead->stBufNodeHead))
    {
        pstTmp = list_entry(pos, DISP_BUF_NODE_S, stlistNode);
        pstTmpFrm = (HI_DRV_VIDEO_FRAME_S *)pstTmp->u32Data;

        i++;
        *parrayFrameList = pstTmpFrm;
        parrayFrameList ++;
    }

    *pu32BufNum = i;
    spin_unlock_irqrestore(&pstListHead->stBufLock, irqflag);
    return;
}



static HI_VOID ResetBufNodeData(DISP_BUF_NODE_S *pstNode)
{
    if (HI_NULL == pstNode)
    {
        DISP_ERROR("pstNode is NULL!\n");
        return;
    }

    pstNode->bValidData2 = HI_FALSE;
    memset(pstNode->u32Data,0x0,sizeof(pstNode->u32Data));
    memset(&pstNode->stHdrInfo,0x0,sizeof(DISP_HDR_META_INFO_S));
    memset(&pstNode->u8Metadata,0x0,sizeof(pstNode->u8Metadata));
    memset(&pstNode->u32UserData,0x0,sizeof(pstNode->u32UserData));
    memset(&pstNode->stPlayInfor, 0x0, sizeof(pstNode->stPlayInfor));
    return;
}


// put node into empry array and set empty state
HI_S32 DispBuf_AddEmptyNode_NoReset(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    CommonList_AddNode(&pstBuffer->stEmptyArray, &pstNode->stlistNode);
    return HI_SUCCESS;
}

// put node into empry array and set empty state
HI_S32 DispBuf_AddEmptyNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    ResetBufNodeData(pstNode);
    CommonList_AddNode(&pstBuffer->stEmptyArray, &pstNode->stlistNode);
    return HI_SUCCESS;
}

HI_S32 DispBuf_DelFullNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    HI_S32 s32Ret = HI_FAILURE;
    s32Ret = CommonList_DelNode(&pstBuffer->stFullArray, &pstNode->stlistNode);
    return s32Ret;
}

HI_S32 DispBuf_AddFullNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    //(HI_VOID)DispRecordeNodeAddTime(pstBuffer);
    CommonList_AddNode(&pstBuffer->stFullArray, &pstNode->stlistNode);
    return HI_SUCCESS;
}

// get first full node and not take it away from full array
HI_S32 DispBuf_GetFullNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S **ppstNode)
{
   struct list_head *pstNode = HI_NULL;

   if (HI_SUCCESS != BufferList_GetNode(&pstBuffer->stFullArray,&pstNode))
   {
        return HI_ERR_VO_BUFQUE_FULL;
   }

   *ppstNode = (list_entry(pstNode, DISP_BUF_NODE_S, stlistNode));
   return HI_SUCCESS;
}

HI_BOOL DispBuf_CheckFullListEmpty(DISP_BUF_S *pstBuffer)
{
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&pstBuffer->stFullArray.stBufLock, irqflag);
    if (list_empty(&pstBuffer->stFullArray.stBufNodeHead))
    {
        WIN_ERROR("\n");
        spin_unlock_irqrestore(&pstBuffer->stFullArray.stBufLock, irqflag);
        return HI_TRUE;
    }

    spin_unlock_irqrestore(&pstBuffer->stFullArray.stBufLock, irqflag);
    return HI_FALSE;
}

HI_BOOL DispBuf_FullListHasSameNode(DISP_BUF_S *pstBuffer, DISP_BUF_NODE_S *pstNode)
{
    HI_BOOL bRet = HI_FALSE;
    struct list_head *pos = HI_NULL, *n = HI_NULL;
    DISP_BUF_NODE_S *pstTmp = HI_NULL;
    HI_DRV_VIDEO_FRAME_S *pstTmpFrm = HI_NULL, *pstNodeFrm = HI_NULL;
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&pstBuffer->stFullArray.stBufLock, irqflag);

    pstNodeFrm = (HI_DRV_VIDEO_FRAME_S *)pstNode->u32Data;

    list_for_each_safe(pos, n, &(pstBuffer->stFullArray.stBufNodeHead))
    {
        pstTmp = list_entry(pos, DISP_BUF_NODE_S, stlistNode);
        pstTmpFrm = (HI_DRV_VIDEO_FRAME_S *)pstTmp->u32Data;

        if ( (pos !=  &pstNode->stlistNode)
             && (pstTmpFrm->u32FrameIndex == pstNodeFrm->u32FrameIndex)
             && (pstTmpFrm->stBufAddr[0].u32PhyAddr_Y == pstNodeFrm->stBufAddr[0].u32PhyAddr_Y))
        {
            bRet = HI_TRUE;
            break;
        }
    }

    WIN_ERROR("\n");

    spin_unlock_irqrestore(&pstBuffer->stFullArray.stBufLock, irqflag);

    return bRet;
}

HI_S32 DispBuf_GetFullListPlayCount(DISP_BUF_S *pstBuffer, HI_U32 *pu32Num)
{
    struct list_head *pos = HI_NULL, *n = HI_NULL;
    DISP_BUF_NODE_S *pstTmp = HI_NULL;
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&pstBuffer->stFullArray.stBufLock, irqflag);

    *pu32Num = 0;
    list_for_each_safe(pos, n, &(pstBuffer->stFullArray.stBufNodeHead))
    {
        pstTmp = list_entry(pos, DISP_BUF_NODE_S, stlistNode);
        *pu32Num += pstTmp->u32PlayCnt;
    }

    spin_unlock_irqrestore(&pstBuffer->stFullArray.stBufLock, irqflag);

    return HI_SUCCESS;
}

HI_S32 DispBuf_GetListNodeNumber(COMMON_LIST_S *pstBuffer, HI_U32 *pu32Num)
{
    struct list_head *pos = HI_NULL, *n = HI_NULL;
    DISP_BUF_NODE_S *pstTmp = HI_NULL;
    HI_SIZE_T irqflag = 0;

    spin_lock_irqsave(&pstBuffer->stBufLock, irqflag);

    *pu32Num = 0;
    list_for_each_safe(pos, n, &(pstBuffer->stBufNodeHead))
    {
        pstTmp = list_entry(pos, DISP_BUF_NODE_S, stlistNode);
        (*pu32Num) ++;
    }

    spin_unlock_irqrestore(&pstBuffer->stBufLock, irqflag);
    return HI_SUCCESS;
}

#if 0
static HI_S32 DispRecordeNodeAddTime(DISP_BUF_S *pstBuffer)
{
    HIDRV_DISP_NODE_TIME *pstNodeTime = HI_NULL;

    DBC_CHECK_NULL_RETURN(pstBuffer);

    if (!pstBuffer->stDispNodeDelayTime.bNodeCalcSwitchFlag)
    {
        return HI_FAILURE;
    }

    if (pstBuffer->stDispNodeDelayTime.u16UnRecordNodeNum)
    {
        pstBuffer->stDispNodeDelayTime.u16UnRecordNodeNum--;
        return HI_FAILURE;
    }

    if (pstBuffer->u32FullWritePos >= DISP_BUF_NODE_MAX_NUMBER)
    {
        return HI_FAILURE;
    }

    pstNodeTime = &(pstBuffer->stDispNodeDelayTime.astDispNodeTime[pstBuffer->u32FullWritePos]);

    pstNodeTime->u64NodeAddFullTimeUS = DISP_OS_GetTimeUs();

    return HI_SUCCESS;
}

static HI_S32 DispCalcNodeTime(DISP_BUF_S *pstBuffer)
{
    HIDRV_DISP_NODE_TIME    *pstDispNodeTime    = HI_NULL;

    DBC_CHECK_NULL_RETURN(pstBuffer);

    if (!pstBuffer->stDispNodeDelayTime.bNodeCalcSwitchFlag)
    {
        return HI_FAILURE;
    }

    if (pstBuffer->stDispNodeDelayTime.u16UnRecordNodeNum)
    {
        return HI_FAILURE;
    }

    if (pstBuffer->u32FullReaddPos >= DISP_BUF_NODE_MAX_NUMBER)
    {
        return HI_FAILURE;
    }

    pstDispNodeTime = &(pstBuffer->stDispNodeDelayTime.astDispNodeTime[pstBuffer->u32FullReaddPos]);

    if (0 == pstDispNodeTime->u64NodeAddFullTimeUS)
    {
        return HI_FAILURE;
    }

    pstDispNodeTime->u64NodeDelFullTimeUS   = DISP_OS_GetTimeUs();
    pstDispNodeTime->u32NodeID              = pstBuffer->u32FullArray[pstBuffer->u32FullReaddPos];
    pstDispNodeTime->u32NodeTimeus          = (HI_U32)(pstDispNodeTime->u64NodeDelFullTimeUS - pstDispNodeTime->u64NodeAddFullTimeUS);

    pstBuffer->stDispNodeDelayTime.u32CurrentNodeTimeus = pstDispNodeTime->u32NodeTimeus;

    if (pstBuffer->stDispNodeDelayTime.u16InputNodeCnt < CALC_AVE_TIME_FRAME_NUM)
    {
        pstBuffer->stDispNodeDelayTime.u32NodeTimeSum += pstDispNodeTime->u32NodeTimeus;
        pstBuffer->stDispNodeDelayTime.u16InputNodeCnt++;
    }

    if (pstBuffer->stDispNodeDelayTime.u16InputNodeCnt >= CALC_AVE_TIME_FRAME_NUM)
    {
        pstBuffer->stDispNodeDelayTime.u32ThousandNodeAveDelayTime = (pstBuffer->stDispNodeDelayTime.u32NodeTimeSum) / CALC_AVE_TIME_FRAME_NUM;
        pstBuffer->stDispNodeDelayTime.u32NodeTimeSum   = 0;
        pstBuffer->stDispNodeDelayTime.u16InputNodeCnt  = 0;
    }

    return HI_SUCCESS;
}
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
