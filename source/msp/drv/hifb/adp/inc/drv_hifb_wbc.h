/*************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
**************************************************************************************************
File Name       : drv_hifb_wbc.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History           :
Date                    Author                Modification
2018/01/01              sdk                  Created file
**************************************************************************************************/
#ifndef __DRV_HIFB_WBC_H__
#define __DRV_HIFB_WBC_H__

/*********************************add include here************************************************/
#include "drv_hifb_hal.h"
#include "drv_hifb_adp.h"
#include "optm_define.h"
#include "optm_alg_csc.h"
#include "optm_alg_gzme.h"
#include "optm_alg_gsharp.h"
#include "hi_drv_disp.h"

#ifndef HI_BUILD_IN_BOOT
#include "hi_gfx_comm_k.h"
#else
#include "hi_gfx_comm.h"
#endif
/*************************************************************************************************/


/*************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


/***************************** Macro Definition **************************************************/

#define CONFIG_HIFB_WBC_BUF_NUM               2

/*************************** Structure Definition ************************************************/

/***************************  The enum of Jpeg image format  *************************************/
typedef enum tagHIFB_WBC_MODE_E
{
    HIFB_WBC_MODE_MONO      = 0x0,
    HIFB_WBC_MODE_LFET_EYE  = 0x2,
    HIFB_WBC_MODE_RIGHT_EYE = 0x3,
    HIFB_WBC_MODE_BUTT,
}HIFB_WBC_MODE_E;

typedef struct tagDRV_HIFB_WBC_GFX_S
{
    HI_BOOL                IsOpen;
    HI_BOOL                bWorking;
    HI_BOOL                bStartWork;
    HI_BOOL                bEndWork;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    HI_BOOL                bSupportLogoToApp;
    HI_BOOL                bFinishSdLogoToApp;
    HI_BOOL                bSupportFieldBuffer;
    HI_BOOL                bIsWriteBottomField;
    HI_BOOL                bHasBeenUsedFieldBuffer;
    HI_BOOL                bHasSwitchToFieldWriteBuffer;
    HI_BOOL                bHasSwitchToFieldReadBuffer;
    HI_BOOL                bHasFinishFreeFrameBuffer;
#endif
    HI_BOOL                bFinishAllocWbcMem;
    HI_S32                 s32BufferWidth;
    HI_S32                 s32BufferHeight;
    HI_U32                 FrameBufferStride;
    HI_U32                 u32BufIndex;
    HI_S32                 s32WbcCnt;
    HI_U32                 WbcIntCnt;
    HI_U32                 WbcBufNum;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    HI_U32                 FieldBufferStride;
    HI_U32                 WBCFieldBuffer[CONFIG_HIFB_WBC_BUF_NUM];
#endif
    HI_U32                 u32WBCBuffer[CONFIG_HIFB_WBC_BUF_NUM];
    HI_U32                 u32WriteBufAddr;
    HI_U32                 u32ReadBufAddr;
    HI_BOOL                bInProgressive;
    HI_BOOL                bOutProgressive;
    HI_U32                 u32BtmOffset;
    HI_BOOL                bHdDispProgressive;
    HIFB_COLOR_FMT_E       enDataFmt;
    OPTM_VDP_LAYER_WBC_E   enWbcHalId;
    OPTM_VDP_DITHER_E      enDitherMode;
    OPTM_VDP_WBC_OFMT_E    stWBCFmt;
    DRV_VDP_WBC_WMODE_E    enOutMode;
    HIFB_WBC_MODE_E        enWbcMode;
    OPTM_VDP_INTMSK_E      enWbcInt;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    GFX_MMZ_BUFFER_S       stFieldBuffer;
#endif
    GFX_MMZ_BUFFER_S       stFrameBuffer;
    HIFB_RECT              stInRect;
    HIFB_RECT              stOutRect;
    wait_queue_head_t      WaiteWbcWorkqueueMutex;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    struct work_struct FreeFrameBufferWork;
    struct workqueue_struct  *FreeFrameBufferQueue;
#endif
}DRV_HIFB_WBC_GFX_S;

#ifdef HI_BUILD_IN_BOOT
typedef struct
{
    HI_U32 u32Stride;
    HI_U32 u32ReadBufAddr;
}BOOT_HIFB_WBC_DATA_S;
#endif

/********************** Global Variable declaration **********************************************/

/******************************* API declaration *************************************************/
/***************************************************************************************
* func         : DRV_HIFB_WBC_OpenLayer
* description  : CNcomment: 打开回写图形层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_OpenLayer      (HIFB_LAYER_ID_E enLayerId);

/***************************************************************************************
* func         : DRV_HIFB_WBC_CloseLayer
* description  : CNcomment: 关闭回写图形层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_CloseLayer     (HIFB_LAYER_ID_E enLayerId);

/***************************************************************************************
* func         : DRV_HIFB_WBC_StartWorkQueue
* description  : CNcomment: 回写工作队列，在打开图层的时候使能  CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_WBC_StartWorkQueue (struct work_struct *data);
#endif

/***************************************************************************************
* func         : DRV_HIFB_WBC_SetTcFlag
* description  : CNcomment: 设置TC回写标记 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetTcFlag(HI_BOOL bFlag);

/***************************************************************************************
* func         : HIFB_WBC2_SetCropReso
* description  : CNcomment: 设置WBC_GP0裁剪分辨率，也就输入的起始和结束坐标 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetCropReso(OPTM_VDP_DISP_RECT_S stInputRect);

/***************************************************************************************
* func        : DRV_HIFB_WBC_Init
* description : CNcomment: init wbc \n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32  DRV_HIFB_WBC_Init(HI_VOID);

/***************************************************************************************
* func        : DRV_HIFB_WBC_Dinit
* description : CNcomment: dinit wbc \n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_DeInit(HI_VOID);

/***************************************************************************************
* func          : DRV_HIFB_WBC_SetEnable
* description   : CNcomment: 设置回写使能状态 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetEnable(HI_BOOL bEnable);

/***************************************************************************************
* func          : DRV_HIFB_WBC_Recovery
* description   : CNcomment: 重新设置WBC和回写图层属性 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_Recovery(HIFB_GP_ID_E enGPId);

/***************************************************************************************
* func          : DRV_HIFB_WBC_Reset
* description   : CNcomment: 回写状态复位 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_Reset(HI_BOOL bWbcRegUp);

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_WBC_FrameEndProcess  (HIFB_GP_ID_E enGpId, HI_BOOL bInterlace, HI_BOOL bIsBottomField);
HI_S32  DRV_HIFB_WBC_Process          (HIFB_GP_ID_E enGpId);
HI_VOID DRV_HIFB_WBC_SetWbcGpZme      (HI_VOID);
#else
HI_VOID BOOT_HIFB_WBC_GetWbcInfo      (BOOT_HIFB_WBC_DATA_S *pstWbcInfo);
HI_VOID BOOT_HIFB_WBC_ReFresh         (HI_BOOL Support4KLogo);
#endif

/*************************************************************************************/
#ifdef __cplusplus

#if __cplusplus

}
#endif
#endif /* __cplusplus */

#endif /* __DRV_HIFB_WBC_H__ */
