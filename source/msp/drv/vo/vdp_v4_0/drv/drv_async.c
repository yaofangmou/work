/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_async.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2017/6/1
  Last Modified :
  Description   : VDP asynchronous module
  Function List :
  History       :
******************************************************************************/

#include <linux/jiffies.h>
#include <linux/spinlock.h>
#include <linux/list.h>
#include "hi_drv_mem.h"
#include "drv_disp_osal.h"
#include "drv_async.h"


typedef struct
{
    ASYNC_MSG_S         *Msg;
    struct list_head    QueueHead;
}MSG_QUEUE_NODE_S;

static HI_BOOL              bASyncInited = HI_FALSE;
static struct list_head     arrQueueHead[ASYNC_QUEUE_IDX_BUTT];
static spinlock_t           arrQueueSpinLock[ASYNC_QUEUE_IDX_BUTT];
static MSG_PROCESS_CALLBACK arrCallbackFun[ASYNC_MSG_TYPE_BUTT] = {0};



#define MSG_QUEUE_CheckSize(enQueueIdx)                \
{                                                       \
    if (enQueueIdx < 0 || enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)\
    {                                                   \
        return HI_FAILURE;                              \
    }                                                   \
}

#define MSG_QUEUE_CheckInit()   \
{                               \
    if (!bASyncInited)          \
    {                           \
        return HI_FAILURE;      \
    }                           \
}

HI_VOID MSG_QUEUE_Lock(const ASYNC_QUEUE_IDX_E enQueueIdx, HI_SIZE_T *pIrqflag)
{
    spin_lock_irqsave(&arrQueueSpinLock[enQueueIdx], *pIrqflag);

    return;
}

HI_VOID MSG_QUEUE_Unlock(const ASYNC_QUEUE_IDX_E enQueueIdx, HI_SIZE_T *pIrqflag)
{
    spin_unlock_irqrestore(&arrQueueSpinLock[enQueueIdx], *pIrqflag);

    return;
}

static struct list_head *MSG_QUEUE_GetHead(const ASYNC_QUEUE_IDX_E enQueueIdx)
{
    return &arrQueueHead[enQueueIdx];
}

static MSG_PROCESS_CALLBACK MSG_QUEUE_GetCallbackFun(ASYNC_MSG_TYPE enAsyncType)
{
    return arrCallbackFun[enAsyncType];
}



/*****************************************************************************
 Prototype    : MSG_QUEUE_Init
 Description  : Init a queue
 Input        : enQueueIdx  - Queue index
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
static HI_S32 MSG_QUEUE_Init(const ASYNC_QUEUE_IDX_E enQueueIdx)
{
    if (enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)
    {
        return HI_FAILURE;
    }
    INIT_LIST_HEAD(MSG_QUEUE_GetHead(enQueueIdx));

    return HI_SUCCESS;
}


/*****************************************************************************
 Prototype    : MSG_QUEUE_CreatNode
 Description  : Creat a msg node, link msg printer to the node
                , but the node not yet push into any queue.
 Input        : pAsyncMsg   - Aysnc msg pointer
 Output       : None
 Return Value : MSG_QUEUE_NODE_S
*****************************************************************************/
static MSG_QUEUE_NODE_S *MSG_QUEUE_CreatNode(ASYNC_MSG_S *pAsyncMsg)
{
    MSG_QUEUE_NODE_S *pNode = HI_NULL;
    pNode = HI_KMALLOC(HI_ID_VO, sizeof(MSG_QUEUE_NODE_S), GFP_ATOMIC);

    if (HI_NULL == pNode)
    {
        DISP_ERROR("HI_KMALLOC failed !\n");
        return HI_NULL;
    }
    memset(pNode, 0x00, sizeof(MSG_QUEUE_NODE_S));

    pNode->Msg = pAsyncMsg;

    return pNode;
}


/*****************************************************************************
 Prototype    : MSG_QUEUE_Push
 Description  : Push a node filled with massage info into a quue tail.
 Input        : pNode       - Pointer of massage node
                enQueueIdx - Queue index
 Output       : None
 Return Value :
*****************************************************************************/
static HI_S32 MSG_QUEUE_Push(MSG_QUEUE_NODE_S *pNode, const ASYNC_QUEUE_IDX_E enQueueIdx)
{
    HI_SIZE_T Irqflag;

    MSG_QUEUE_Lock(enQueueIdx, &Irqflag);
    list_add_tail(&(pNode->QueueHead), MSG_QUEUE_GetHead(enQueueIdx));
    MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

    return HI_SUCCESS;
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_ExecuteMsg
 Description  : Execute a async msg by callback function.
 Input        : async_msg   - Msg pointer
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
static HI_S32 VDP_ASYNC_ExecuteMsg(const ASYNC_MSG_S *pAsyncMsg)
{
    MSG_PROCESS_CALLBACK fun = HI_NULL;

    fun = MSG_QUEUE_GetCallbackFun(pAsyncMsg->enAsyncType);
    if (HI_NULL == fun)
    {
        return HI_FAILURE;
    }

    return fun(pAsyncMsg);
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_Init
 Description  : Construction of async moudle
 Input        : None
 Output       : None
 Return Value : void
*****************************************************************************/
HI_VOID VDP_ASYNC_Init(HI_VOID)
{
    HI_S32 i = 0;

    if (bASyncInited)
    {
        return;
    }

    /*Init each SpinLock in the array*/
    for (i=0; i<ASYNC_QUEUE_IDX_BUTT; i++)
    {
        spin_lock_init(&arrQueueSpinLock[i]);
        INIT_LIST_HEAD(MSG_QUEUE_GetHead(i));
    }

    bASyncInited = HI_TRUE;

    return;
}

/*****************************************************************************
 Prototype    : VDP_ASYNC_DeInit
 Description  : Destroy all async queue
 Input        : None
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_DeInit(HI_VOID)
{
    HI_S32 i = 0;
    HI_S32 s32Ret = 0;

    bASyncInited = HI_FALSE;

    for (i=0; i<ASYNC_QUEUE_IDX_BUTT; i++)
    {
        s32Ret |= VDP_ASYNC_DestroyMsgQueue(i);
    }

    return s32Ret;
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_ResetMsgQueue
 Description  : Creat a massage queue
 Input        : enQueueIdx  - Queue index
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_ResetMsgQueue(ASYNC_QUEUE_IDX_E enQueueIdx)
{
    MSG_QUEUE_CheckInit();

    return MSG_QUEUE_Init(enQueueIdx);
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_DestroyMsgQueue
 Description  : Destroy the massage queue
 Input        : enQueueIdx  - Queue index
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_DestroyMsgQueue(ASYNC_QUEUE_IDX_E enQueueIdx)
{
    struct list_head    *pos    = HI_NULL;
    struct list_head    *n      = HI_NULL;
    MSG_QUEUE_NODE_S    *pNode  = HI_NULL;
    HI_SIZE_T           Irqflag;

    MSG_QUEUE_CheckInit();

    if (enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)
    {
        return HI_FAILURE;
    }

    MSG_QUEUE_Lock(enQueueIdx, &Irqflag);

    if (list_empty(MSG_QUEUE_GetHead(enQueueIdx)))
    {
        MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

        return HI_SUCCESS;
    }

    /* Release all node memery in the queue */
    list_for_each_safe(pos, n, MSG_QUEUE_GetHead(enQueueIdx))
    {
        if (pos != MSG_QUEUE_GetHead(enQueueIdx))
        {
            pNode = list_entry(pos, MSG_QUEUE_NODE_S, QueueHead);

            list_del_init(pos);

            /* Free the memery, include the list_head info, so must delete node from the list first */
            HI_KFREE(HI_ID_VO, pNode->Msg);
            HI_KFREE(HI_ID_VO, pNode);
        }
    }

    MSG_QUEUE_Init(enQueueIdx);
    MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

    return HI_SUCCESS;
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_GetMsgPointer
 Description  : Creat a new message and return its pointer, VDP_ASYNC_PushMsg must
                be called, otherwise there will be memery leak.
 Input        : enQueueIdx  - Queue index
 Output       : None
 Return Value : ASYNC_MSG_S* Address of the new message
*****************************************************************************/
ASYNC_MSG_S *VDP_ASYNC_GetMsgPointer(ASYNC_QUEUE_IDX_E enQueueIdx)
{
    ASYNC_MSG_S *pAsyncMsg = HI_NULL;

    if (!bASyncInited)
    {
        return HI_NULL;
    }

    if (enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)
    {
        return HI_NULL;
    }

    if ((pAsyncMsg = HI_KMALLOC(HI_ID_VO, sizeof(ASYNC_MSG_S), GFP_ATOMIC)))
    {
        memset(pAsyncMsg, 0x00, sizeof(ASYNC_MSG_S));
    }

    return pAsyncMsg;
}


/*****************************************************************************
 Prototype    : VDP_ASYNC_PushMsg
 Description  : Push a message into the queue
 Input        : async_msg   - Asynchronous message pointer
                enQueueIdx - Queue index
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_PushMsg(ASYNC_MSG_S *pAsyncMsg, ASYNC_QUEUE_IDX_E enQueueIdx)
{
    MSG_QUEUE_NODE_S *pNode = HI_NULL;

    MSG_QUEUE_CheckInit();

    pNode = MSG_QUEUE_CreatNode(pAsyncMsg);
    if (HI_NULL == pNode)
    {
        return HI_FAILURE;
    }

    return MSG_QUEUE_Push(pNode, enQueueIdx);
}

/*****************************************************************************
 Prototype    : VDP_ASYNC_DelMsg
 Description  : Find matched msg and delete it
 Input        : async_msg   - Message ptr
                enQueueIdx - Queue index
 Output       : None
 Return Value :
*****************************************************************************/
HI_VOID VDP_ASYNC_DelMsg(const ASYNC_MSG_S *pAsyncMsg, ASYNC_QUEUE_IDX_E enQueueIdx)
{
    struct list_head    *pos    = HI_NULL;
    struct list_head    *n      = HI_NULL;
    MSG_QUEUE_NODE_S    *pNode  = HI_NULL;
    HI_SIZE_T           Irqflag;


    if (enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)
    {
        return;
    }

    MSG_QUEUE_Lock(enQueueIdx, &Irqflag);

    /* Rerurn if no msg */
    if (list_empty(MSG_QUEUE_GetHead(enQueueIdx)))
    {
        MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

        return;
    }

    /* Find matched msg and delete it */
    list_for_each_safe(pos, n, MSG_QUEUE_GetHead(enQueueIdx))
    {
        pNode = list_entry(pos, MSG_QUEUE_NODE_S, QueueHead);
        if (pNode->Msg->enAsyncType == pAsyncMsg->enAsyncType
            && pNode->Msg->unMsgItem.AsyncMsgLowPower.enRegName
               == pAsyncMsg->unMsgItem.AsyncMsgLowPower.enRegName
            && pNode->Msg->unMsgItem.AsyncMsgLowPower.bRegStatus
               == pAsyncMsg->unMsgItem.AsyncMsgLowPower.bRegStatus)

        {
            /* Delete and free the node memery */
            list_del_init(pos);
            HI_KFREE(HI_ID_VO, pNode->Msg);
            HI_KFREE(HI_ID_VO, pNode);
        }
    }
    MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

    return;
}

/*****************************************************************************
 Prototype    : VDP_ASYNC_ProcessMsg
 Description  : Triger the message process once.
 Input        : enQueueIdx - Queue index
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_ProcessMsgOnce(ASYNC_QUEUE_IDX_E enQueueIdx)
{
    struct list_head    *pos    = HI_NULL;
    struct list_head    *n          = HI_NULL;
    MSG_QUEUE_NODE_S    *pNode      = HI_NULL;
    MSG_QUEUE_NODE_S    *pChildNode = HI_NULL;
    struct list_head    stChildList;
    HI_SIZE_T           Irqflag;

    MSG_QUEUE_CheckInit();
    if (enQueueIdx >= ASYNC_QUEUE_IDX_BUTT)
    {
        return HI_FAILURE;
    }

    /* Rerurn if no msg */
    if (list_empty(MSG_QUEUE_GetHead(enQueueIdx)))
    {
        return HI_SUCCESS;
    }

    INIT_LIST_HEAD(&stChildList);
    MSG_QUEUE_Lock(enQueueIdx, &Irqflag);

    /* Check time condition of all messages */
    list_for_each_safe(pos, n, MSG_QUEUE_GetHead(enQueueIdx))
    {
        pNode = list_entry(pos, MSG_QUEUE_NODE_S, QueueHead);
        if (!time_before(jiffies, pNode->Msg->ulExpectedTime))
        {
            pChildNode = MSG_QUEUE_CreatNode(pNode->Msg);
            if (HI_NULL == pChildNode)
            {
                MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);
                goto error;
            }
            pChildNode->Msg = pNode->Msg;

            list_del_init(pos);
            HI_KFREE(HI_ID_VO, pNode);
            list_add_tail(&pChildNode->QueueHead, &stChildList);
        }
    }
    MSG_QUEUE_Unlock(enQueueIdx, &Irqflag);

    /* Rerurn if no msg */
    if (list_empty(&stChildList))
    {
        return HI_SUCCESS;
    }

    /* Process all valid Msg */
    list_for_each_safe(pos, n, &stChildList)
    {
        pChildNode = list_entry(pos, MSG_QUEUE_NODE_S, QueueHead);
        if (HI_SUCCESS != VDP_ASYNC_ExecuteMsg(pChildNode->Msg))
        {
            DISP_ERROR("VDP_ASYNC_ExecuteMsg failed : enQueueIdx=%d enAsyncType=%d !\n",
                        enQueueIdx, pChildNode->Msg->enAsyncType);
            goto error;
        }
        list_del_init(pos);

        HI_KFREE(HI_ID_VO, pChildNode->Msg);
        HI_KFREE(HI_ID_VO, pChildNode);
    }

    return HI_SUCCESS;

error:
    list_for_each_safe(pos, n, &stChildList)
    {
        pChildNode = list_entry(pos, MSG_QUEUE_NODE_S, QueueHead);
        list_del_init(pos);

        HI_KFREE(HI_ID_VO, pChildNode->Msg);
        HI_KFREE(HI_ID_VO, pChildNode);
    }

    return HI_FAILURE;
}

/*****************************************************************************
 Prototype    : VDP_ASYNC_RegCallback
 Description  : Register a callback function for one type of message
 Input        : CallbackFun - Callback function pointer
 Output       : None
 Return Value : 0-success; others-error code
*****************************************************************************/
HI_S32 VDP_ASYNC_RegCallback(ASYNC_MSG_TYPE enAsyncType, const MSG_PROCESS_CALLBACK pCallbackFun)
{
    if (HI_NULL == pCallbackFun)
    {
        return HI_FAILURE;
    }
    arrCallbackFun[enAsyncType] = pCallbackFun;

    return HI_SUCCESS;
}

/*****************************************************************************
 Prototype    : VDP_ASYNC_GenExpectTime
 Description  : Generate expect time whit unit (ms)
 Input        : u32Duration - Duration whit unit (ms)
 Output       : None
 Return Value : Expect time
*****************************************************************************/
HI_ULONG VDP_ASYNC_GenExpectTime(HI_S32 s32Duration)
{
    return jiffies + s32Duration * HZ / 1000;
}


