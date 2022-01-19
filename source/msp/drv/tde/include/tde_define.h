/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : tde_define.h
Version          : Initial Draft
Author           :
Created          : 2018/01/01
Description      :
Function List    :

History          :
Date                     Author           Modification
2018/01/01               sdk              Created file
************************************************************************************************/
#ifndef  __TDE_DEFINE_H__
#define  __TDE_DEFINE_H__


/*********************************add include here**********************************************/
#ifndef HI_BUILD_IN_BOOT
    #include <asm/uaccess.h>
    #include <linux/time.h>
    #include <linux/mm.h>
    #include <linux/hardirq.h>
    #include "hi_gfx_comm_k.h"

#else
    #include "exports.h"
    #include "hi_common.h"
    #include "hi_gfx_mem.h"
#endif

#include "hi_type.h"
#include "hi_debug.h"
#include "wmalloc.h"
#include "tde_config.h"
#include "tde_adp.h"

/***********************************************************************************************/

#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ********************************************/


/*************************** Enum Definition ***********************************************/

/*************************** Structure Definition ******************************************/

typedef enum hiTDE_COLORFMT_CATEGORY_E
{
    TDE_COLORFMT_CATEGORY_ARGB,
    TDE_COLORFMT_CATEGORY_CLUT,
    TDE_COLORFMT_CATEGORY_An,
    TDE_COLORFMT_CATEGORY_YCbCr,
    TDE_COLORFMT_CATEGORY_BYTE,
    TDE_COLORFMT_CATEGORY_HALFWORD,
    TDE_COLORFMT_CATEGORY_MB,
    TDE_COLORFMT_CATEGORY_BUTT
} TDE_COLORFMT_CATEGORY_E;


/* Node submit type, Independant operation node, Operated head node, Operated middle node */
typedef enum hiTDE_NODE_SUBM_TYPE_E
{
    TDE_NODE_SUBM_ALONE = 0,    /* current node submit as independant operated node */
    TDE_NODE_SUBM_PARENT = 1,   /* current node submit as operated parent node *//* 分块的第一个节点 */
    TDE_NODE_SUBM_CHILD = 2     /* current node submit as operated child node *//* 分块的子节点 */
}TDE_NODE_SUBM_TYPE_E;


/* Operation setting information node */
typedef struct hiTDE_NODE_BUF_S
{
    HI_VOID *pBuf;        /* setting information node buffer*/
    HI_U32   u32NodeSz;   /* current node occupied size, united in byte*/
    HI_U64   u64Update;      /* current node update flag */
    HI_U32   u32PhyAddr;  /* current node addr in hardware list */
}TDE_NODE_BUF_S;

/* Notified mode  after current node's job end */
typedef enum hiTDE_NOTIFY_MODE_E
{
    TDE_JOB_NONE_NOTIFY = 0,
    TDE_JOB_COMPL_NOTIFY,
    TDE_JOB_WAKE_NOTIFY,
    TDE_JOB_NOTIFY_BUTT
}TDE_NOTIFY_MODE_E;



#define STATIC static
#define INLINE inline
#define TDE_MAX_WAIT_TIMEOUT 2000

#ifndef HI_BUILD_IN_BOOT
extern HI_U32 g_u32TdeTmpBuf;
#endif

/*若定义该宏，表明tde内部映射mmz内存时使用cach方式，并在subjob时flush tde的节点内存，以便使硬件能正确访问
 若不定义该宏，表面tde内部映射mmz内存时使用nocach方式，可能造成cpu访问率下降*/
#ifndef HI_BUILD_IN_BOOT
#define TDE_CACH_STRATEGY
#endif
//#define TDE_TIME_COUNT

HI_VOID * TDE_MALLOC(HI_U32 size);
HI_VOID TDE_FREE(HI_VOID* ptr);

#ifndef HI_BUILD_IN_BOOT
#define TDE_LOCK(lock,lockflags) spin_lock_irqsave(lock, lockflags)

#define TDE_UNLOCK(lock,lockflags) spin_unlock_irqrestore(lock, lockflags)
#else
#define TDE_LOCK(lock,lockflags)
#define TDE_UNLOCK(lock,lockflags)
#endif
#define TDE_INIT_WAITQUEUE_HEAD(pqueue) init_waitqueue_head(pqueue)

#define TDE_WAIT_EVENT_INTERRUPTIBLE_TIMEOUT(queue, condition, timeout) wait_event_interruptible_timeout(queue, condition, timeout)

#define TDE_WAKEUP_INTERRUPTIBLE(pqueue) wake_up_interruptible(pqueue)


typedef struct timeval TDE_timeval_s;
#define TDE_gettimeofday do_gettimeofday


/******************************* API declaration *******************************************/

/******************************* API release ***********************************************/


#ifdef __cplusplus
        #if __cplusplus
}
        #endif
   #endif /* __cplusplus */
#endif /*__TDE_DEFINE_H__ */
