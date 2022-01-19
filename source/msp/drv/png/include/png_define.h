/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name           : png_define.h
Version             : Initial Draft
Author              :
Created             : 2018/01/01
Description         : public macro definition
Function List       :


History             :
Date                         Author                     Modification
2018/01/01                   sdk                        Created file
**************************************************************************************************/
#ifndef __PNG_DEFINE_H__
#define __PNG_DEFINE_H__

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif    /* __cplusplus */
#endif    /* __cplusplus */

#include <linux/semaphore.h>
#include <linux/sched.h>
#include <linux/hardirq.h>

#include "hi_kernel_adapt.h"

#include "hi_png_config.h"
#include "hi_gfx_comm_k.h"

/** debug file **/
#include "png_debug.h"


#define PNG_DOWN_INTERRUPTIBLE(pmutex, ret)    do\
    {\
        ret = 0;\
        if(!in_interrupt())\
        {\
            ret = down_interruptible(pmutex);\
            if (ret < 0)\
            {\
                HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, down_interruptiblie, ret);\
            }\
        }\
    }while(0)

#define PNG_UP(pmutex) up(pmutex)

#define PNG_UP_INT(pmutex) do\
    {\
        if(!in_interrupt())\
        {\
            up(pmutex);\
        }\
    }while(0)

#define PNG_LOCK(lock,lockflags)          spin_lock_irqsave(lock, lockflags)
#define PNG_UNLOCK(lock,lockflags)        spin_unlock_irqrestore(lock, lockflags)

#define PNG_DECLARE_WAITQUEUE(queue_head)                                    DECLARE_WAIT_QUEUE_HEAD(queue_head)
#define PNG_WAKE_UP_INTERRUPTIBLE(queue_head_p)                              wake_up_interruptible(queue_head_p)
#define PNG_WAIT_EVENT_INTERRUPTIBLE_TIMEOUT(queue_head, condition, timeout) wait_event_interruptible_timeout(queue_head, (condition), timeout)

#ifdef __cplusplus
#if __cplusplus
}
#endif    /* __cplusplus */
#endif    /* __cplusplus */

#endif
