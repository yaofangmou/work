#ifndef __DRV_WIN_COM_H__
#define __DRV_WIN_COM_H__

#include "hi_drv_win.h"

#if  (defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450))
#define WINDOW_MAX_NUMBER 36
#elif (defined(CHIP_TYPE_hi3798mv310))
#define WINDOW_MAX_NUMBER 5
#elif (defined(CHIP_TYPE_hi3716mv430))
#define WINDOW_MAX_NUMBER 2
#else
#define WINDOW_MAX_NUMBER 17
#endif

#define WINDOW_MAX_ALPHA 100
#define FRAME_BUFFER_4K_ALIGN(a) ((a + 0x1000 - 1) & 0xfffff000)


typedef struct tagWIN_CRITICAL_PlayCtrl_S
{
    HI_DRV_WIN_FORCEFRAMEPROG_FLAG_E       eWinFrameForceFlag;
    HI_WIN_CLOSE_SOFTALG_FLAG_E            eSoftAlgCtrl;
    HI_WIN_HW_CONFIG_CHECK_FLAG_E eWinConfigCheck;
    HI_DRV_WIN_FIELDORDER_E       eFieldOrder;
    HI_WIN_QUEUE_CTRL_FLAG_E      eQueueStepMode;
}WIN_CRITICAL_PlayCtrl_S;
#endif

