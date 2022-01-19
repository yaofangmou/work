#include "vmm_osal.h"

#define VMM_OSAL_SUCCESS                     (SINT32)(0)
#define VMM_OSAL_FAILURE                     (SINT32)(0xFFFFFFFF)
#define VMM_DEFAULT_PRINT_ENABLE             (0x0)//(VMM_FATAL | VMM_ERROR)
#define VMM_DEFAULT_PRINT_DEVICE             (VMM_DEV_SCREEN)

UINT32 g_VmmPrintEn = VMM_DEFAULT_PRINT_ENABLE;
UINT32 g_VmmPrintDevice = VMM_DEFAULT_PRINT_DEVICE;
SINT8  g_MsgTemp[1024];
VOID *g_VmmfpLog = NULL;

VOID VMM_Osal_InitEvent(VMM_EVENT_S *pEvent, SINT32 InitVal)
{
    pEvent->flag = InitVal;

    init_waitqueue_head(&pEvent->queue_head);

    return;
}

VOID VMM_Osal_GiveEvent(VMM_EVENT_S *pEvent)
{
    pEvent->flag = 1;

    wake_up(&pEvent->queue_head);

    return;
}

SINT32 VMM_Osal_WaitEvent(VMM_EVENT_S *pEvent, UINT32 msWaitTime)
{
    SINT32 Ret = 0;

    if (msWaitTime != 0xffffffff)
    {
        Ret = wait_event_interruptible_timeout(pEvent->queue_head, (pEvent->flag != 0), msecs_to_jiffies(msWaitTime));

        if (Ret < 0)
        {
            return VMM_OSAL_FAILURE;
        }

        pEvent->flag = 0;

        return (Ret != 0) ? VMM_OSAL_SUCCESS : VMM_OSAL_FAILURE;
    }
    else
    {
        Ret = wait_event_interruptible(pEvent->queue_head, (pEvent->flag != 0));

        pEvent->flag = 0;

        return (Ret == 0) ? VMM_OSAL_SUCCESS : VMM_OSAL_FAILURE;
    }
}

SINT32 dprint_vmm(UINT32 type, const SINT8 *format, ...)
{
    va_list args;
    SINT32  nTotalChar = 0;

    if ((VMM_ALWS != type) && (0 == (g_VmmPrintEn & (1 << type))))
    {
        return -1;
    }

    va_start(args, format);
    nTotalChar = vsnprintf(g_MsgTemp, sizeof(g_MsgTemp), format, args);
    va_end(args);

    if ((nTotalChar <= 0) || (nTotalChar >= 1023))
    {
        return -1;
    }

    if (g_VmmPrintDevice ==  VMM_DEV_SCREEN)
    {
    #ifdef HI_ADVCA_FUNCTION_RELEASE
        return 0;
    #else
        return (printk("N: %s", g_MsgTemp));
    #endif
    }
    else if (g_VmmPrintDevice ==  VMM_DEV_FILE)
    {
        if (g_VmmfpLog)
        {
            return (OSAL_FP_fwrite(g_MsgTemp, nTotalChar, g_VmmfpLog));
        }
    }

    return -1;
}

VOID vmm_dprint_nothing(VOID)
{
    return;
}
