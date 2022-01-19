#ifndef __VMM_OSAL_H__
#define __VMM_OSAL_H__

#include <linux/list.h>
#include <linux/interrupt.h>
#include <linux/spinlock.h>
#include <linux/semaphore.h>
#include "vfmw_osal_ext.h"

#include "hi_drv_mem.h"
#include "hi_drv_mmz.h"

//#include "public.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
    VMM_DEV_SCREEN = 1,
    VMM_DEV_SYSLOG,
    VMM_DEV_FILE,
    VMM_DEV_MEM
} VMM_PRINT_DEVICE_TYPE;

typedef enum
{
    VMM_FATAL = 0,
    VMM_ERROR,
    VMM_WARN,
    VMM_IMP,
    VMM_TD,
    VMM_DEI,
    VMM_INFO,
    VMM_DBG,
    VMM_ALWS = 32
} VMM_PRINT_TYPE;

#ifdef HI_ADVCA_FUNCTION_RELEASE
VOID vmm_dprint_nothing(VOID);
#define PRINT(type, fmt, arg...) vmm_dprint_nothing()
#else
SINT32 dprint_vmm(UINT32 type, const SINT8 *format, ...);
#define PRINT(type, fmt, arg...) dprint_vmm(type, fmt, ##arg)
#endif

#ifdef VCODEC_UT_ENABLE
#define VMM_PRIVATE
#else
#define VMM_PRIVATE static
#endif

#define POS() PRINT(VMM_ALWS, "############### %s, %d\n", __func__, __LINE__)

#define VMM_OSAL_SUCCESS                     (SINT32)(0)
#define VMM_OSAL_FAILURE                     (SINT32)(0xFFFFFFFF)
#define VMM_TRUE                             (SINT32)(1)
#define VMM_FALSE                            (SINT32)(0)

#define D_VMM_CHECK_PTR_RET(Ptr, Value) \
    do {\
        if (NULL == Ptr)\
        { \
            PRINT(VMM_ERROR,"PTR '%s' is NULL.\n", # Ptr); \
            return Value;           \
        }  \
    } while (0)

#define D_VMM_CHECK_PTR(Ptr) \
    do {\
        if (NULL == Ptr)\
        { \
            PRINT(VMM_ERROR,"PTR '%s' is NULL.\n", # Ptr); \
            return ;           \
        }  \
    } while (0)

#define VMM_ASSERT(Condition)                                                \
    do                                                                       \
    {                                                                        \
        if (!(Condition))                                                    \
        {                                                                    \
            PRINT(VMM_ERROR, "[%s %d]assert warning\n",__func__,__LINE__);   \
        }                                                                    \
    }while(0)

#define D_VMM_ASSERT(Condition)                                                             \
    do                                                                                      \
    {                                                                                       \
        if (!(Condition))                                                                   \
        {                                                                                   \
            PRINT(VMM_ERROR, "[%s %d]assert '%s' Error\n",__func__,__LINE__, # Condition);  \
            return;                                                                         \
        }                                                                                   \
    }while(0)

#define D_VMM_ASSERT_RET(Condition, Value)                                                  \
    do                                                                                      \
    {                                                                                       \
        if (!(Condition))                                                                   \
        {                                                                                   \
            PRINT(VMM_ERROR, "[%s %d]assert '%s' Error\n",__func__,__LINE__, # Condition);  \
            return Value;                                                                   \
        }                                                                                   \
    }while(0)

#define VMM_MUTEX_INIT(pMutex)                \
    do                                        \
    {                                         \
        sema_init(pMutex, 1);                 \
    }while(0)

#define VMM_MUTEX_LOCK(pMutex)                \
    do                                        \
    {                                         \
        SINT32 Ret;                           \
        Ret = down_interruptible(pMutex);     \
    }while(0)

#define VMM_MUTEX_UNLOCK(pMutex)              \
    do                                        \
    {                                         \
        (VOID)up(pMutex);                     \
    }while(0)

#define VMM_SPINLOCK_INIT(pLock)              \
    do                                        \
    {                                         \
        spin_lock_init(pLock);                \
    }while(0)

#define VMM_SPINLOCK_LOCK(pLock, Flags)                         \
    do                                                          \
    {                                                           \
        spin_lock_irqsave(pLock, Flags);                        \
    }while(0)

#define VMM_SPINLOCK_UNLOCK(pLock, Flags)                       \
    do                                                          \
    {                                                           \
        spin_unlock_irqrestore(pLock, Flags);                   \
    }while(0)

#define D_VMM_ALIGN_UP(val, align)      ((((val) + (align) - 1) / (align)) * (align))
#define D_VMM_ALIGN_DOWN(val, align)    ((val) - (val) % (align))

typedef struct hiVMM_KERN_EVENT_S
{
    wait_queue_head_t queue_head;
    SINT32 flag;
} VMM_EVENT_S;

VOID VMM_Osal_InitEvent(VMM_EVENT_S *pEvent, SINT32 InitVal);
VOID VMM_Osal_GiveEvent(VMM_EVENT_S *pEvent);
SINT32 VMM_Osal_WaitEvent(VMM_EVENT_S *pEvent, UINT32 msWaitTime);

#ifdef __cplusplus
}
#endif

#endif //__VMM_OSAL_H__
