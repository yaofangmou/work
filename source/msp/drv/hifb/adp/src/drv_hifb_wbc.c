/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name        : drv_hifb_wbc.c
Version          : Initial Draft
Author           : sdk
Created          : 2018/01/01
Description      :
Function List    :


History          :
Date                    Author                 Modification
2018/01/01               sdk                   Created file
************************************************************************************************/

/***************************** add include here*************************************************/
#ifdef HI_BUILD_IN_BOOT
#include "hifb_debug.h"
#endif

#include "drv_disp_ext.h"
#include "drv_hifb_wbc.h"
#include "drv_hifb_hal.h"
#include "drv_hifb_config.h"

#ifdef HI_BUILD_IN_BOOT
#include "hi_gfx_debug.h"
#else
#include "drv_hifb_debug.h"
#endif
/***************************** Macro Definition ************************************************/

#define CONFIG_HIFB_WBC_WIDTH              (gs_bTcWbc2Flag? 1920 : 720)
#define CONFIG_HIFB_WBC_HEIGHT             (gs_bTcWbc2Flag? 1200 : 576)
#define CONFIG_HIFB_WBC_BYTES              4

/***************************** Structure Definition ********************************************/

/***************************** Global Variable declaration *************************************/
extern HIFB_GFX_MODE_EN        g_enOptmGfxWorkMode;
extern OPTM_GFX_GP_S           *g_pstGfxGPDevice[HIFB_ADP_GP_BUTT];
extern OPTM_GFX_LAYER_S        *g_pstGfxDevice[HIFB_LAYER_ID_BUTT];
extern const HIFB_CAPABILITY_S *g_pstGfxCap[HIFB_LAYER_ID_BUTT];

DRV_HIFB_WBC_GFX_S g_stGfxWbc2;
static HI_BOOL gs_bTcWbc2Flag = HI_FALSE;

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_GFX_PQ)
static PQ_EXPORT_FUNC_S* gs_pstWbcPqFuncs = NULL;
#endif

/***************************** API forward declarations ****************************************/

static inline HI_BOOL HIFB_WBC_IsSupport  (HI_RECT_S *pstInRect);
static inline HI_S32  HIFB_WBC_AllocMem   (HI_BOOL bInterrupt);
static inline HI_VOID HIFB_WBC_FreeMem    (HI_VOID);

#ifndef HI_BUILD_IN_BOOT
static inline HI_VOID HIFB_WBC_StartWork  (HI_VOID);
static inline HI_VOID HIFB_WBC_EndWork    (HI_VOID);
#endif

#ifdef HI_BUILD_IN_BOOT
static inline HI_VOID HIFB_WBC_SetLayerAlpha    (HIFB_LAYER_ID_E HifbLayerId);
static inline HI_VOID HIFB_WBC_SetLayerPreMult  (HIFB_LAYER_ID_E HifbLayerId);
static inline HI_VOID HIFB_WBC_SetLayerAddr     (HIFB_LAYER_ID_E HifbLayerId);
static inline HI_VOID HIFB_WBC_SetWbcGpAddr     (HI_VOID);
static inline HI_VOID HIFB_WBC_SetWbcEnable     (HIFB_LAYER_ID_E HifbLayerId, HI_BOOL Support4KLogo);
static inline HI_VOID HIFB_WBC_SetLayerEnable   (HIFB_LAYER_ID_E HifbLayerId);
static inline HI_VOID HIFB_WBC_SetGpEnable      (HIFB_GP_ID_E   HalGpId);
static inline HI_VOID HIFB_WBC_SetWbcGpEnable   (HIFB_LAYER_ID_E HifbLayerId, HI_BOOL Support4KLogo);
#endif

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
static HI_VOID DRV_HIFB_WBC_FreeFrameBufferWork(struct work_struct *data);
#endif

/***************************** API realization *************************************************/
/***************************************************************************************
* func         : HIFB_WBC2_SetRegUp
* description  : CNcomment:更新回写寄存器 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_S32 HIFB_WBC2_SetRegUp(OPTM_VDP_LAYER_WBC_E enWbcID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    OPTM_CheckGPMask_BYGPID(HIFB_ADP_GP0);
    DRV_HIFB_HAL_WBC_SetRegUp(enWbcID);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : HIFB_WBC_Open
* description   : CNcomment: open wbc
                             打开回写 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 HIFB_WBC_Open(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    g_stGfxWbc2.bHasBeenUsedFieldBuffer = HI_FALSE;
    g_stGfxWbc2.bHasSwitchToFieldWriteBuffer = HI_FALSE;
    g_stGfxWbc2.bHasSwitchToFieldReadBuffer  = HI_FALSE;
    g_stGfxWbc2.bFinishSdLogoToApp = HI_TRUE;
    if (NULL == g_stGfxWbc2.FreeFrameBufferQueue)
    {
        g_stGfxWbc2.FreeFrameBufferQueue = create_workqueue(HIFB_FREE_FRAME_BUFFER_QUEUE);
    }
    if (NULL == g_stGfxWbc2.FreeFrameBufferQueue)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, create_workqueue, FAILURE_TAG);
        return HI_FAILURE;
    }
    INIT_WORK(&g_stGfxWbc2.FreeFrameBufferWork, DRV_HIFB_WBC_FreeFrameBufferWork);
#endif

    Ret = HIFB_WBC_AllocMem(HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_WBC_AllocMem, Ret);
        return HI_FAILURE;
    }

    g_stGfxWbc2.enWbcHalId   = OPTM_VDP_LAYER_WBC_GP0;
    g_stGfxWbc2.enDataFmt    = HIFB_FMT_AYUV8888;
    g_stGfxWbc2.enDitherMode = VDP_DITHER_TMP_SPA_8;
    g_stGfxWbc2.stWBCFmt     = VDP_WBC_OFMT_ARGB8888;
    g_stGfxWbc2.enOutMode    = DRV_VDP_WBC_WMODE_E_PROGRESSIVE;
    g_stGfxWbc2.enWbcMode    = HIFB_WBC_MODE_MONO;
    g_stGfxWbc2.enWbcInt     = OPTM_VDP_INTMSK_WBC_G0_INT | OPTM_VDP_INTMSK_WBC_GP0_INT; /**first: field buffer seconde: others chip **/
    g_stGfxWbc2.bWorking     = HI_FALSE;

    DRV_HIFB_HAL_WBC_SetThreeMd    (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.enWbcMode);
    DRV_HIFB_HAL_WBC_SetDitherMode (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.enDitherMode);
    DRV_HIFB_HAL_WBC_SetOutFmt     (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.stWBCFmt);
    DRV_HIFB_HAL_WBC_SetOutMod     (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.enOutMode);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FieldBufferStride);
    }
    else
#endif
    {
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FrameBufferStride);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_CloseLayer
* description  : CNcomment: 关闭回写图形层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_CloseLayer(HIFB_LAYER_ID_E enLayerId)
{
#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_GP1_SUPPORT)
    HI_S32 Ret = HI_SUCCESS;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

#ifndef HI_BUILD_IN_BOOT
    HIFB_WBC_EndWork();
#endif

    DRV_HIFB_HAL_GFX_SetLayerEnable  (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetRegUp        (g_pstGfxDevice[enLayerId]->enGfxHalId);
    DRV_HIFB_HAL_WBC_GP_SetEnable    (g_stGfxWbc2.enWbcHalId, HI_FALSE);
    DRV_HIFB_ADP_ReleaseClutBuf(enLayerId);

    DRV_HIFB_WBC_SetEnable (HI_FALSE);

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_GP1_SUPPORT)
    Ret = DRV_HIFB_ADP_SetCallbackToDisp(g_pstGfxDevice[enLayerId]->enGPId, (IntCallBack)DRV_HIFB_ADP_UpDataCallBack, HI_DRV_DISP_C_INTPOS_90_PERCENT, HI_FALSE);
    if (HI_SUCCESS != Ret)
    {
        /**nothing to do**/
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallbackToDisp, Ret);
    }
#endif

    HIFB_WBC_FreeMem();

    g_stGfxWbc2.IsOpen    = HI_FALSE;
    g_stGfxWbc2.WbcIntCnt = 0;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (NULL != g_stGfxWbc2.FreeFrameBufferQueue)
    {
        destroy_workqueue(g_stGfxWbc2.FreeFrameBufferQueue);
        g_stGfxWbc2.FreeFrameBufferQueue = NULL;
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_OpenLayer
* description  : CNcomment: 打开回写图形层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_VOID HIFB_WBC_CheckWhetherSupportFieldBuffer(HI_VOID)
{
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    HI_S32 Ret = HI_SUCCESS;
    OPTM_VDP_DISP_MODE_E enDispStereo;
    HI_DISP_DISPLAY_INFO_S stDisp0Info, stDisp1Info;
    #ifndef HI_BUILD_IN_BOOT
    DISP_EXPORT_FUNC_S *pDispExportFuncs = NULL;
    #endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    g_stGfxWbc2.bSupportFieldBuffer = HI_FALSE;

    #ifdef HI_BUILD_IN_BOOT

    Ret = HI_DISP_GetDisplayInfo(HI_DRV_DISPLAY_0, &stDisp0Info);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DISP_GetDisplayInfo, Ret);
        return;
    }

    Ret = HI_DISP_GetDisplayInfo(HI_DRV_DISPLAY_1, &stDisp1Info);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DISP_GetDisplayInfo, Ret);
        return;
    }

    #else

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_DISP, (HI_VOID**)&pDispExportFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == pDispExportFuncs) || (NULL == pDispExportFuncs->pfnDispGetDispInfo))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get disp func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return;
    }

    Ret = pDispExportFuncs->pfnDispGetDispInfo(HI_DRV_DISPLAY_0, &stDisp0Info);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnDispGetDispInfo, Ret);
        return;
    }

    Ret = pDispExportFuncs->pfnDispGetDispInfo(HI_DRV_DISPLAY_1, &stDisp1Info);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnDispGetDispInfo, Ret);
        return;
    }

    #endif

    if ((HI_DRV_DISP_FMT_PAL == stDisp0Info.eFmt) && ((HI_DRV_DISP_FMT_1080P_50 == stDisp1Info.eFmt) || (HI_DRV_DISP_FMT_1080i_50 == stDisp1Info.eFmt) || (HI_DRV_DISP_FMT_720P_50 == stDisp1Info.eFmt)))
    {
        g_stGfxWbc2.bSupportFieldBuffer = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if ((HI_DRV_DISP_FMT_NTSC == stDisp0Info.eFmt) && ((HI_DRV_DISP_FMT_1080P_60 == stDisp1Info.eFmt) || (HI_DRV_DISP_FMT_1080i_60 == stDisp1Info.eFmt) || (HI_DRV_DISP_FMT_720P_60 == stDisp1Info.eFmt)))
    {
        g_stGfxWbc2.bSupportFieldBuffer = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    enDispStereo = DRV_HIFB_HAL_DISP_GetDispMode(g_pstGfxGPDevice[HIFB_ADP_GP0]->enGpHalId);
    if ((VDP_DISP_MODE_2D != enDispStereo) && (VDP_DISP_MODE_SBS != enDispStereo) && (VDP_DISP_MODE_TAB != enDispStereo))
    {
        g_stGfxWbc2.bSupportFieldBuffer = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stDisp0Info.eFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stDisp1Info.eFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enDispStereo);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.bSupportFieldBuffer);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_OpenLayer
* description  : CNcomment: 打开回写图形层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_OpenLayer(HIFB_LAYER_ID_E enLayerId)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_GFX_PQ)
    Ret = HI_DRV_MODULE_GetFunction(HI_ID_PQ, (HI_VOID**)&gs_pstWbcPqFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == gs_pstWbcPqFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get pq func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
    }
#endif

    if (HI_TRUE == g_stGfxWbc2.IsOpen)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.IsOpen);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.FrameBufferStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_stGfxWbc2.u32ReadBufAddr);

    Ret = HIFB_WBC_Open();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_WBC_Open, Ret);
        goto ERR;
    }

    Ret = DRV_HIFB_ADP_OpenLayer(enLayerId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_GFX_InitLayer, Ret);
        goto ERR;
    }

    DRV_HIFB_ADP_SetReadMode      (enLayerId, g_pstGfxDevice[enLayerId]->enReadMode);
    DRV_HIFB_ADP_SetLayerAddr     (enLayerId, g_stGfxWbc2.u32ReadBufAddr);
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        DRV_HIFB_ADP_SetLayerStride(enLayerId, g_stGfxWbc2.FieldBufferStride);
    }
    else
#endif
    {
        DRV_HIFB_ADP_SetLayerStride(enLayerId, g_stGfxWbc2.FrameBufferStride);
    }

    g_stGfxWbc2.IsOpen = HI_TRUE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
ERR:
    DRV_HIFB_WBC_CloseLayer(enLayerId);
    g_stGfxWbc2.IsOpen = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_WBC_StartWorkQueue(struct work_struct *data)
{
    OPTM_GFX_WORK_S *pstStartWbcWork = container_of(data, OPTM_GFX_WORK_S, work);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL == pstStartWbcWork)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_TRUE == pstStartWbcWork->bOpenLayer)
    {
        DRV_HIFB_WBC_OpenLayer((HIFB_LAYER_ID_E)(pstStartWbcWork->u32Data));
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_TRUE == pstStartWbcWork->bAllocMem)
    {
        (HI_VOID)HIFB_WBC_AllocMem(HI_FALSE);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_TRUE == pstStartWbcWork->bFreeMem)
    {
        HIFB_WBC_FreeMem();
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
static HI_VOID DRV_HIFB_WBC_FreeFrameBufferWork(struct work_struct *data)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (HI_FALSE == g_stGfxWbc2.bSupportFieldBuffer)
    {
        return;
    }

    if (NULL != g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr)
    {
        DRV_HIFB_ADP_MEM_UnMapAndRelease(&(g_stGfxWbc2.stFrameBuffer));
        g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr = NULL;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

/***************************************************************************************
* func        : HIFB_WBC_AllocMem
* description : CNcomment: alloc wbc mem\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_S32 HIFB_WBC_AllocMem(HI_BOOL bInterrupt)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 FrameWbcSzie = 0;
 #ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    HI_U32 FieldWbcBufferSize = 0;
 #endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HIFB_WBC_CheckWhetherSupportFieldBuffer();

    if (NULL != g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if ((HI_TRUE == g_stGfxWbc2.bSupportFieldBuffer) && (NULL != g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (HI_FALSE == g_stGfxWbc2.bSupportLogoToApp)
    {
        g_stGfxWbc2.bHasBeenUsedFieldBuffer = g_stGfxWbc2.bSupportFieldBuffer;
        g_stGfxWbc2.bHasSwitchToFieldWriteBuffer = HI_TRUE;
        g_stGfxWbc2.bHasSwitchToFieldReadBuffer  = HI_TRUE;
    }
    else
    {
        g_stGfxWbc2.bFinishSdLogoToApp = HI_FALSE;
    }

    if (HI_FALSE == g_stGfxWbc2.bSupportFieldBuffer)
    {
        g_stGfxWbc2.bHasBeenUsedFieldBuffer = HI_FALSE;
        g_stGfxWbc2.bHasSwitchToFieldWriteBuffer = HI_TRUE;
        g_stGfxWbc2.bHasSwitchToFieldReadBuffer  = HI_TRUE;
    }
#endif

    if ((g_stGfxWbc2.WbcBufNum < 1) || (g_stGfxWbc2.WbcBufNum > 2))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, g_stGfxWbc2.WbcBufNum);
        return HI_FAILURE;
    }

    g_stGfxWbc2.u32BufIndex = 0;
    g_stGfxWbc2.s32BufferWidth    = CONFIG_HIFB_WBC_WIDTH;
    g_stGfxWbc2.s32BufferHeight   = CONFIG_HIFB_WBC_HEIGHT;
    g_stGfxWbc2.FrameBufferStride = g_stGfxWbc2.s32BufferWidth * CONFIG_HIFB_WBC_BYTES;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    g_stGfxWbc2.FieldBufferStride = g_stGfxWbc2.FrameBufferStride / 2;
#endif

    if (HI_TRUE == bInterrupt)
    {/** should not alloc mem by interrupt, as recovery **/
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
         return HI_SUCCESS;
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if ((HI_TRUE == g_stGfxWbc2.bSupportLogoToApp) || (HI_FALSE == g_stGfxWbc2.bSupportFieldBuffer))
#endif
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        FrameWbcSzie = g_stGfxWbc2.FrameBufferStride * g_stGfxWbc2.s32BufferHeight * g_stGfxWbc2.WbcBufNum;
        Ret = DRV_HIFB_ADP_MEM_AllocAndMap(HIFB_WBC_BUFFER, "iommu", FrameWbcSzie, 0, &(g_stGfxWbc2.stFrameBuffer));
        if ((HI_SUCCESS != Ret) || (NULL == g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr))
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_MEM_AllocAndMap, FAILURE_TAG);
            return HI_FAILURE;
        }
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bSupportFieldBuffer)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        FieldWbcBufferSize = g_stGfxWbc2.FrameBufferStride * (g_stGfxWbc2.s32BufferHeight / 2 + 1);
        Ret = DRV_HIFB_ADP_MEM_AllocAndMap(HIFB_WBC_FIELD_BUFFER, "iommu", FieldWbcBufferSize, 0, &(g_stGfxWbc2.stFieldBuffer));
        if ((HI_SUCCESS != Ret) || (NULL == g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr))
        {
            DRV_HIFB_ADP_MEM_UnMapAndRelease(&(g_stGfxWbc2.stFrameBuffer));
            g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr = NULL;
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_MEM_AllocAndMap, FAILURE_TAG);
            return HI_FAILURE;
        }
    }
#endif

#ifndef HI_BUILD_IN_BOOT
    if (NULL != g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr)
    {
        HI_GFX_Memset(g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr, 0x0, FrameWbcSzie);
    }
#endif

#if defined(CONFIG_HIFB_FIELD_BUFFER_SUPPORT) && !defined(HI_BUILD_IN_BOOT)
   if (NULL != g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr)
   {
       HI_GFX_Memset(g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr, 0x0, FieldWbcBufferSize);
   }
#endif

#ifdef CONFIG_GFX_MMU_SUPPORT
    g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFrameBuffer.u32StartSmmuAddr;
#else
    g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFrameBuffer.u32StartPhyAddr;
#endif

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
      #ifdef CONFIG_GFX_MMU_SUPPORT
          g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFieldBuffer.u32StartSmmuAddr;
      #else
          g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFieldBuffer.u32StartPhyAddr;
      #endif
    }

    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        g_stGfxWbc2.u32WBCBuffer[1] = g_stGfxWbc2.u32WBCBuffer[0];
    }
    else
#endif
    {
        g_stGfxWbc2.u32WBCBuffer[1] = g_stGfxWbc2.u32WBCBuffer[0] + (g_stGfxWbc2.WbcBufNum - 1) * g_stGfxWbc2.FrameBufferStride * g_stGfxWbc2.s32BufferHeight;
    }

    g_stGfxWbc2.u32ReadBufAddr     = g_stGfxWbc2.u32WBCBuffer[0];
    g_stGfxWbc2.u32WriteBufAddr    = g_stGfxWbc2.u32WBCBuffer[1];
    g_stGfxWbc2.bFinishAllocWbcMem = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_WBC_FreeMem
* description : CNcomment: free wbc mem\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID HIFB_WBC_FreeMem(HI_VOID)
{
#ifndef HI_BUILD_IN_BOOT
    HI_U32 NowTimeMs = 0;
    HI_U32 EndTimeMs = 0;
    HI_GFX_TINIT();
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#ifndef HI_BUILD_IN_BOOT
    HIFB_WBC_EndWork();
    HI_GFX_TSTART(NowTimeMs);
    EndTimeMs = NowTimeMs;
    while ((EndTimeMs - NowTimeMs) <= 100)
    {
       msleep(10);
       HI_GFX_TSTART(EndTimeMs);
    }
#endif

    if (NULL != g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr)
    {
        DRV_HIFB_ADP_MEM_UnMapAndRelease(&(g_stGfxWbc2.stFrameBuffer));
        g_stGfxWbc2.stFrameBuffer.pu8StartVirAddr = NULL;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (NULL != g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr)
    {
        DRV_HIFB_ADP_MEM_UnMapAndRelease(&(g_stGfxWbc2.stFieldBuffer));
        g_stGfxWbc2.stFieldBuffer.pu8StartVirAddr = NULL;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    g_stGfxWbc2.u32WBCBuffer[0] = 0;
    g_stGfxWbc2.u32WBCBuffer[1] = 0;
    g_stGfxWbc2.u32ReadBufAddr  = g_stGfxWbc2.u32WBCBuffer[0];
    g_stGfxWbc2.u32WriteBufAddr = g_stGfxWbc2.u32WBCBuffer[1];
    g_stGfxWbc2.bFinishAllocWbcMem = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_WBC_SetTcFlag
* description   : CNcomment: 设置TC回写标记 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetTcFlag(HI_BOOL bFlag)
{
    gs_bTcWbc2Flag = bFlag;
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_SetCropReso
* description  : CNcomment: 设置WBC_GP0裁剪分辨率，也就输入的起始和结束坐标 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetCropReso(OPTM_VDP_DISP_RECT_S stInputRect)
{
    OPTM_VDP_DISP_RECT_S stWbcRect = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    stWbcRect.u32DXL = stInputRect.u32IWth;
    stWbcRect.u32DYL = stInputRect.u32IHgt;
    if ((stWbcRect.u32DXL >= 3840) && (stWbcRect.u32DYL >= 2160)) { stWbcRect.u32DXL /= 2; }

    DRV_HIFB_HAL_WBC_SetCropReso(g_stGfxWbc2.enWbcHalId, &stWbcRect);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_WBC_Init
* description : CNcomment: init wbc in insmod ko \n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 DRV_HIFB_WBC_Init(HI_VOID)
{
#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_GFX_PQ)
    HI_S32 Ret = HI_SUCCESS;
    Ret = HI_DRV_MODULE_GetFunction(HI_ID_PQ, (HI_VOID**)&gs_pstWbcPqFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == gs_pstWbcPqFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get pq func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return HI_FAILURE;
    }
#endif

    HI_GFX_Memset(&g_stGfxWbc2, 0, sizeof(g_stGfxWbc2));

#ifdef HI_BUILD_IN_BOOT
    g_stGfxWbc2.WbcBufNum = 1;
#else
    g_stGfxWbc2.WbcBufNum = CONFIG_HIFB_WBC_BUF_NUM;
#endif

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    g_stGfxWbc2.bHasFinishFreeFrameBuffer = HI_FALSE;
#endif

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_WBC_DeInit
* description : CNcomment: deinit wbc in rmmod ko \n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_DeInit(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_Memset(&g_stGfxWbc2, 0, sizeof(g_stGfxWbc2));
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_WBC_SetEnable
* description   : CNcomment: 设置回写使能状态 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_SetEnable(HI_BOOL bEnable)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    g_pstGfxDevice[OPTM_SLAVER_LAYERID]->bEnable = bEnable;
    g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.IsEnable     = 1;
    g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.IsNeedRegUp  = 1;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_CfgSlvLayer
* description  : CNcomment: 配置标清图层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_WBC_CfgSlvLayer(HIFB_LAYER_ID_E enLayerId,HI_RECT_S *pstRect)
{
    HIFB_RECT stRect = {0};
    HIFB_GP_ID_E enGfxGpId = HIFB_ADP_GP_BUTT;
    OPTM_VDP_DISP_RECT_S stLayerRect;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstRect, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGfxGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGfxGpId, HI_FAILURE);

    stRect.x = 0;
    stRect.y = 0;
    stRect.w = pstRect->s32Width;
    stRect.h = pstRect->s32Height;

    g_stGfxWbc2.stInRect.x = 0;
    g_stGfxWbc2.stInRect.y = 0;
    g_stGfxWbc2.stInRect.w = g_pstGfxGPDevice[HIFB_ADP_GP0]->stInRect.s32Width;
    g_stGfxWbc2.stInRect.h = g_pstGfxGPDevice[HIFB_ADP_GP0]->stInRect.s32Height;

    g_stGfxWbc2.stOutRect.x = pstRect->s32X;
    g_stGfxWbc2.stOutRect.y = pstRect->s32Y;
    g_stGfxWbc2.stOutRect.w = pstRect->s32Width;
    g_stGfxWbc2.stOutRect.h = pstRect->s32Height;

    g_pstGfxGPDevice[enGfxGpId]->stOutRect.s32X      = pstRect->s32X;
    g_pstGfxGPDevice[enGfxGpId]->stOutRect.s32Y      = pstRect->s32Y;
    g_pstGfxGPDevice[enGfxGpId]->stOutRect.s32Width  = pstRect->s32Width;
    g_pstGfxGPDevice[enGfxGpId]->stOutRect.s32Height = pstRect->s32Height;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,  "==========================================");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.h);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stOutRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stOutRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stOutRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stOutRect.h);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,  "==========================================");

    if (HI_TRUE == g_pstGfxGPDevice[enGfxGpId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_Memset(&stLayerRect, 0, sizeof(stLayerRect));

    stLayerRect.u32DXS  = 0;
    stLayerRect.u32DYS  = 0;
    stLayerRect.u32IWth = g_stGfxWbc2.stInRect.w & 0xfffffffe;
    stLayerRect.u32IHgt = g_stGfxWbc2.stInRect.h & 0xfffffffe;

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stLayerRect.u32IWth, stLayerRect.u32DXS, HI_FAILURE);
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stLayerRect.u32IHgt, stLayerRect.u32DYS, HI_FAILURE);

    stLayerRect.u32DXL  = stLayerRect.u32DXS + stLayerRect.u32IWth;
    stLayerRect.u32DYL  = stLayerRect.u32DYS + stLayerRect.u32IHgt;
    stLayerRect.u32OWth = (HI_U32)(((HI_U32)(pstRect->s32Width)) & 0xfffffffe);
    stLayerRect.u32OHgt = (HI_U32)(((HI_U32)(pstRect->s32Height)) & 0xfffffffe);

    DRV_HIFB_HAL_WBC_SetLayerReso  (g_stGfxWbc2.enWbcHalId, &stLayerRect);
    DRV_HIFB_HAL_WBC_SetCropReso   (g_stGfxWbc2.enWbcHalId, &stLayerRect);

#ifndef HI_BUILD_IN_BOOT
    if ((0 != g_pstGfxGPDevice[enGfxGpId]->unUpFlag.bits.WbcMode) || (HI_TRUE == g_pstGfxGPDevice[HIFB_ADP_GP0]->bNeedExtractLine))
    {
        DRV_HIFB_ADP_SetLayerRect (enLayerId, &stRect);
        DRV_HIFB_ADP_SetGpRect    (enGfxGpId, &stRect);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#else
    DRV_HIFB_ADP_SetLayerRect (enLayerId, &stRect);
    DRV_HIFB_ADP_SetGpRect    (enGfxGpId, &stRect);
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_Reset
* description  : CNcomment: 回写状态复位 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_Reset(HI_BOOL bWbcRegUp)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (HI_TRUE == bWbcRegUp)
    {
        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.IsNeedRegUp = 1;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.IsNeedRegUp = 0;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HI_FALSE == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

#ifndef HI_BUILD_IN_BOOT
    DRV_HIFB_HAL_DISP_ClearIntSignal(g_stGfxWbc2.enWbcInt);
#endif

    g_stGfxWbc2.bWorking = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_WBC_SetWbcGpZme(HI_VOID)
{
#ifdef CONFIG_GFX_PQ
    HI_RECT_S stOutRect = {0};
    OPTM_VDP_DISP_RECT_S stGfxRect = {0};
    HI_PQ_GFX_ZME_PARA_S stGfxZmePara = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    stOutRect.s32Width  = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Width;
    stOutRect.s32Height = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Height;
    stGfxRect.u32IWth   = g_stGfxWbc2.stInRect.w & 0xfffffffe;
    stGfxRect.u32IHgt   = g_stGfxWbc2.stInRect.h & 0xfffffffe;

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,  "==========================================");

    if (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
    {
        stGfxRect.u32IWth /= 2;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else if (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
    {
        stGfxRect.u32IHgt /= 2;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HI_TRUE == g_pstGfxGPDevice[OPTM_MASTER_GPID]->bNeedExtractLine)
    {
        stGfxRect.u32IHgt /= 2;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if ((0 == stGfxRect.u32IWth) || (0 == stGfxRect.u32IHgt))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    stGfxZmePara.u32ZmeFrmWIn  = stGfxRect.u32IWth;
    stGfxZmePara.u32ZmeFrmHIn  = stGfxRect.u32IHgt;
    stGfxZmePara.u32ZmeFrmWOut = stOutRect.s32Width;
    stGfxZmePara.u32ZmeFrmHOut = stOutRect.s32Height;
    stGfxZmePara.bDeFlicker    = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->u32ZmeDeflicker ? (HI_FALSE) : (HI_TRUE);
    stGfxZmePara.bZmeFrmFmtIn  = HI_TRUE;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        stGfxZmePara.bZmeFrmFmtOut = 0;/** 0: 隔行 1: 逐行 **/
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
#endif
    {
        stGfxZmePara.bZmeFrmFmtOut = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bInterface ? (HI_FALSE) : (HI_TRUE);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmWIn);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmHIn);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmWOut);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmHOut);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.bZmeFrmFmtIn);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.bZmeFrmFmtOut);

    if (  (stGfxZmePara.u32ZmeFrmWIn <= CONFIG_HIFB_LAYER_MINWIDTH) || (stGfxZmePara.u32ZmeFrmHIn <= CONFIG_HIFB_LAYER_MINHEIGHT)
       || (stGfxZmePara.u32ZmeFrmWOut < 720) || (stGfxZmePara.u32ZmeFrmHOut < 480))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmWIn);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmHIn);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmWOut);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stGfxZmePara.u32ZmeFrmHOut);
    }

    if ((NULL != gs_pstWbcPqFuncs) && (NULL != gs_pstWbcPqFuncs->pfnPQ_SetGfxZme))
    {
        gs_pstWbcPqFuncs->pfnPQ_SetGfxZme(PQ_GFX_GP1, &stGfxZmePara);
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO,  "==========================================");
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#endif
    return;
}

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
static HI_VOID DRV_HIFB_WBC_SwitchToFieldWriteBuffer(HI_VOID)
{
    if (HI_FALSE == g_stGfxWbc2.bSupportFieldBuffer)
    {
        return;
    }

    if (HI_TRUE == g_stGfxWbc2.bHasSwitchToFieldWriteBuffer)
    {
        return;
    }

    g_stGfxWbc2.bHasBeenUsedFieldBuffer = HI_TRUE;
    g_stGfxWbc2.bHasSwitchToFieldWriteBuffer = HI_TRUE;

#ifdef CONFIG_GFX_MMU_SUPPORT
    g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFieldBuffer.u32StartSmmuAddr;
#else
    g_stGfxWbc2.u32WBCBuffer[0] = g_stGfxWbc2.stFieldBuffer.u32StartPhyAddr;
#endif

    /** top field buffer **/
    g_stGfxWbc2.u32WriteBufAddr = g_stGfxWbc2.u32WBCBuffer[0] + g_stGfxWbc2.FieldBufferStride;

    DRV_HIFB_WBC_SetWbcGpZme();
    DRV_HIFB_HAL_WBC_SetOutMod(g_stGfxWbc2.enWbcHalId, DRV_VDP_WBC_WMODE_E_TOP);

    return;
}

static HI_VOID DRV_HIFB_WBC_SwitchToFieldReadBuffer(HI_VOID)
{
    if (HI_FALSE == g_stGfxWbc2.bSupportFieldBuffer)
    {
        return;
    }

    if (HI_FALSE == g_stGfxWbc2.bHasSwitchToFieldWriteBuffer)
    {
        return;
    }

    if (HI_TRUE == g_stGfxWbc2.bHasSwitchToFieldReadBuffer)
    {
        return;
    }

    g_stGfxWbc2.bHasSwitchToFieldReadBuffer = HI_TRUE;
    g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode = VDP_RMODE_TOP;

    DRV_HIFB_ADP_SetLayerStride(OPTM_SLAVER_LAYERID, g_stGfxWbc2.FieldBufferStride);
    DRV_HIFB_HAL_GFX_SetReadMode(g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, VDP_RMODE_TOP);

    return;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_WBC_FrameEndProcess
* description   : CNcomment:回写完成，传入的是GP0 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_FrameEndProcess(HIFB_GP_ID_E enGpId, HI_BOOL bInterlace, HI_BOOL bIsBottomField)
{
    static HI_U32 NowTimeMs = 0;
    HI_U32 CurTimeMs = 0;
    HI_U32 WbcWorkEnable = 1;
    HI_U32 WbcEnable = 0;
    HIFB_RECT stRect = {0};
    OPTM_GFX_GP_S *pGfxGp = g_pstGfxGPDevice[OPTM_SLAVER_GPID];
    HIFB_LAYER_ID_E enLayerId = OPTM_SLAVER_LAYERID;
    HI_GFX_TINIT();
    HI_UNUSED(bInterlace);
#ifndef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    HI_UNUSED(bIsBottomField);
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pGfxGp);

    if (HI_TRUE == g_pstGfxGPDevice[enGpId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_FALSE == g_stGfxWbc2.bStartWork)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    stRect.w = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Width;
    stRect.h = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Height;

    if ((0 == stRect.w) || (0 == stRect.h) || (0 == g_stGfxWbc2.stInRect.w) || (0 == g_stGfxWbc2.stInRect.h))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.x);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.h);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.stInRect.h);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_FALSE == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bMaskFlag)
#else
    if (DRV_HIFB_HAL_DISP_GetIntSignal(g_stGfxWbc2.enWbcInt) && (HI_FALSE == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bMaskFlag))
#endif
    {
        HI_GFX_TSTART(CurTimeMs);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INFO,"================================");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT,CurTimeMs - NowTimeMs);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INFO,"================================");
        NowTimeMs = CurTimeMs;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
        if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
        {/** 固定读顶场buffer **/
            g_stGfxWbc2.u32ReadBufAddr = g_stGfxWbc2.u32WBCBuffer[0] + g_stGfxWbc2.FieldBufferStride;
            DRV_HIFB_HAL_GFX_SetReadMode(g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, VDP_RMODE_TOP);
        }
        else
#endif
        {
            g_stGfxWbc2.u32ReadBufAddr  = g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex];
        }
        g_stGfxWbc2.u32BufIndex = g_stGfxWbc2.u32BufIndex + 1;
        g_stGfxWbc2.u32BufIndex = g_stGfxWbc2.u32BufIndex % g_stGfxWbc2.WbcBufNum;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
        if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
        {
            g_stGfxWbc2.bIsWriteBottomField = bIsBottomField;
            if (HI_TRUE == g_stGfxWbc2.bIsWriteBottomField)
            {
                g_stGfxWbc2.u32WriteBufAddr = g_stGfxWbc2.u32ReadBufAddr - g_stGfxWbc2.FieldBufferStride;
                DRV_HIFB_HAL_WBC_SetOutMod(g_stGfxWbc2.enWbcHalId, DRV_VDP_WBC_WMODE_EE_BOTTOM);
            }
            else
            {
                g_stGfxWbc2.u32WriteBufAddr = g_stGfxWbc2.u32ReadBufAddr;
                DRV_HIFB_HAL_WBC_SetOutMod(g_stGfxWbc2.enWbcHalId, DRV_VDP_WBC_WMODE_E_TOP);
            }
        }
        else
#endif
        {
             g_stGfxWbc2.u32WriteBufAddr = g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex];
        }
        DRV_HIFB_HAL_GFX_SetLayerAddrEX(g_pstGfxDevice[enLayerId]->enGfxHalId, g_stGfxWbc2.u32ReadBufAddr);

        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.x);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stRect.h);
        DRV_HIFB_WBC_SetWbcGpZme();
        DRV_HIFB_WBC_CfgSlvLayer  (enLayerId, &pGfxGp->stOutRect);
        DRV_HIFB_ADP_SetLayerRect (enLayerId, &stRect);
        DRV_HIFB_ADP_SetGpRect    (OPTM_SLAVER_GPID, &stRect);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
        if ((HI_FALSE == g_stGfxWbc2.bHasFinishFreeFrameBuffer) && (HI_TRUE == g_stGfxWbc2.bFinishSdLogoToApp) && (HI_TRUE == g_stGfxWbc2.bHasSwitchToFieldWriteBuffer))
        {
             queue_work(g_stGfxWbc2.FreeFrameBufferQueue, &g_stGfxWbc2.FreeFrameBufferWork);
             g_stGfxWbc2.bHasFinishFreeFrameBuffer = HI_TRUE;
        }

        DRV_HIFB_WBC_SwitchToFieldReadBuffer();

        if ((DRV_HIFB_HAL_DISP_GetIntSignal(g_stGfxWbc2.enWbcInt)) && (0 == g_stGfxWbc2.s32WbcCnt) && (HI_TRUE == bIsBottomField))
        {
            g_stGfxWbc2.bFinishSdLogoToApp = HI_TRUE;
        }

        if ((HI_TRUE == g_stGfxWbc2.bFinishSdLogoToApp) && (HI_TRUE == g_stGfxWbc2.bHasSwitchToFieldWriteBuffer))
#endif
        {
            DRV_HIFB_HAL_GFX_SetRegUp(g_pstGfxDevice[enLayerId]->enGfxHalId);
            DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enGpHalId);
        }

        g_stGfxWbc2.WbcIntCnt++;
        g_stGfxWbc2.bWorking = HI_FALSE;
        DRV_HIFB_HAL_DISP_ClearIntSignal(g_stGfxWbc2.enWbcInt);
    }

    DRV_HIFB_HAL_WBC_GP_GetEnable(g_stGfxWbc2.enWbcHalId, &WbcEnable);
    if ((HI_FALSE == WbcEnable) || (HI_FALSE == g_pstGfxDevice[enLayerId]->bEnable))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (0 == pGfxGp->unUpFlag.bits.IsNeedRegUp)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (pGfxGp->unUpFlag.bits.WbcMode)
    {
        DRV_HIFB_HAL_WBC_SetThreeMd(g_stGfxWbc2.enWbcHalId, (HI_U32)g_stGfxWbc2.enWbcMode);
        pGfxGp->unUpFlag.bits.WbcMode = 0;
    }

    if (g_stGfxWbc2.s32WbcCnt > 0)
    {
        g_stGfxWbc2.s32WbcCnt--;
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    DRV_HIFB_HAL_WBC_GP_GetWorkEnable(g_stGfxWbc2.enWbcHalId, &WbcWorkEnable, NULL);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, WbcWorkEnable);
    if ((HI_TRUE == g_stGfxWbc2.bWorking) && (1 == WbcWorkEnable))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    pGfxGp->unUpFlag.bits.IsNeedRegUp = 0;

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_FALSE == g_stGfxWbc2.bIsWriteBottomField)
    {/** write top field buffer **/
        DRV_HIFB_WBC_SwitchToFieldWriteBuffer();
    }

    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FieldBufferStride);
    }
    else
#endif
    {
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FrameBufferStride);
    }

    if (0 != g_stGfxWbc2.u32WriteBufAddr)
    {
        HIFB_WBC2_SetRegUp(g_stGfxWbc2.enWbcHalId);
        g_stGfxWbc2.bWorking = HI_TRUE;
    }

    wake_up_interruptible(&g_stGfxWbc2.WaiteWbcWorkqueueMutex);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_WBC_Process
* description   : CNcomment:回写完成，传入的是GP1 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_WBC_Process(HIFB_GP_ID_E enGpId)
{
    HIFB_LAYER_ID_E enLayerId = OPTM_SLAVER_LAYERID;
    OPTM_GFX_GP_S *pGfxGp = NULL;
    HIFB_ALPHA_S *pstAlpha = NULL;
    HI_RECT_S stInRect = g_pstGfxGPDevice[HIFB_ADP_GP0]->stInRect;
    HI_U32 Enable = 0;
    HI_BOOL IsSupportWbc  = HI_TRUE;
    HI_BOOL IsNeedUpAlpha = HI_FALSE, IsNeedUpPreMult = HI_FALSE, IsEnable = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (OPTM_SLAVER_GPID != enGpId)
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enGpId);
         return HI_FAILURE;
    }

    if (HI_TRUE == g_pstGfxGPDevice[enGpId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    IsSupportWbc = HIFB_WBC_IsSupport(&stInRect);
    if (HI_FALSE == IsSupportWbc)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        HIFB_WBC_EndWork();
    }
    else
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        HIFB_WBC_StartWork();
    }

    if (HI_FALSE == g_stGfxWbc2.bStartWork)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (0 == g_pstGfxDevice[enLayerId]->enGfxHalId)
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->enGfxHalId);
         return HI_FAILURE;
    }

    pGfxGp = g_pstGfxGPDevice[enGpId];
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pGfxGp, HI_FAILURE);

    IsEnable = pGfxGp->unUpFlag.bits.IsEnable;
    if (HI_TRUE == IsEnable)
    {
        DRV_HIFB_HAL_GFX_SetLayerEnable (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->bEnable);
        DRV_HIFB_HAL_WBC_GP_SetEnable   (g_stGfxWbc2.enWbcHalId,g_pstGfxDevice[enLayerId]->bEnable);
        if (HI_FALSE == g_pstGfxDevice[enLayerId]->bEnable)
        {
            DRV_HIFB_HAL_GFX_SetRegUp  (g_pstGfxDevice[enLayerId]->enGfxHalId);
            HIFB_WBC2_SetRegUp         (g_stGfxWbc2.enWbcHalId);
        }

        DRV_HIFB_HAL_GFX_GetLayerEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, &Enable);
        if ((1 == Enable) || (HI_FALSE == g_pstGfxDevice[enLayerId]->bEnable))
        {
            pGfxGp->unUpFlag.bits.IsEnable = 0;
        }
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pGfxGp->unUpFlag.bits.IsEnable);
    }

    IsNeedUpAlpha = pGfxGp->unUpFlag.bits.IsNeedUpAlpha;
    if (HI_TRUE == IsNeedUpAlpha)
    {
        pstAlpha = &g_pstGfxDevice[enLayerId]->stAlpha;
        DRV_HIFB_HAL_GFX_SetPalpha(g_pstGfxDevice[enLayerId]->enGfxHalId,pstAlpha->bAlphaEnable,HI_TRUE,pstAlpha->u8Alpha0,pstAlpha->u8Alpha1);
        DRV_HIFB_HAL_GFX_SetLayerGalpha(g_pstGfxDevice[enLayerId]->enGfxHalId, pstAlpha->u8GlobalAlpha);
        pGfxGp->unUpFlag.bits.IsNeedUpAlpha = 0;
    }

    IsNeedUpPreMult = pGfxGp->unUpFlag.bits.IsNeedUpPreMult;
    if (HI_TRUE == IsNeedUpPreMult)
    {
        DRV_HIFB_HAL_GFX_SetPreMultEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->bPreMute, HI_FALSE);
        pGfxGp->unUpFlag.bits.IsNeedUpPreMult = 0;
    }

    pGfxGp->unUpFlag.bits.IsNeedRegUp = 0x1;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_VOID HIFB_WBC_StartWork(HI_VOID)
{
    HIFB_RECT stRect = {0};
    OPTM_GFX_GP_S *pGfxGp = g_pstGfxGPDevice[OPTM_SLAVER_GPID];
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pGfxGp);

    stRect.w = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Width;
    stRect.h = g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stOutRect.s32Height;

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.IsOpen);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.bStartWork);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->bOpened);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.IsEnable);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bMaskFlag);

    if (HI_TRUE != g_stGfxWbc2.IsOpen)
    {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
    }

    if (HI_TRUE == g_stGfxWbc2.bStartWork)
    {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
    }

    if (HI_TRUE == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_FALSE == g_stGfxWbc2.bFinishAllocWbcMem)
    {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
    }

    if (0 == pGfxGp->unUpFlag.bits.IsEnable)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pGfxGp->unUpFlag.bits.IsEnable);
        pGfxGp->unUpFlag.bits.IsEnable = 1;
    }

    DRV_HIFB_ADP_SetLayerRect (OPTM_SLAVER_LAYERID,  &stRect);
    DRV_HIFB_HAL_GFX_SetRegUp (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId);

    DRV_HIFB_ADP_SetGpRect    (OPTM_SLAVER_GPID, &stRect);
    DRV_HIFB_HAL_GP_SetRegUp  (g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enGpHalId);

    g_stGfxWbc2.bStartWork = HI_TRUE;
    g_stGfxWbc2.bEndWork   = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_WBC_EndWork(HI_VOID)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (HI_TRUE == g_stGfxWbc2.bEndWork)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    DRV_HIFB_HAL_GFX_SetLayerEnable   (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetRegUp         (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId);

    DRV_HIFB_HAL_WBC_GP_SetEnable     (OPTM_VDP_LAYER_WBC_GP0, HI_FALSE);
    DRV_HIFB_HAL_WBC_SetRegUp         (OPTM_VDP_LAYER_WBC_GP0);

    g_stGfxWbc2.bWorking   = HI_FALSE;
    g_stGfxWbc2.bStartWork = HI_FALSE;
    g_stGfxWbc2.bEndWork   = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

static inline HI_BOOL HIFB_WBC_IsSupport(HI_RECT_S *pstInRect)
{
    HI_BOOL IsSupportWbc = HI_FALSE;

    if (NULL != pstInRect)
    {
        IsSupportWbc = ((pstInRect->s32Width > 4096) || (pstInRect->s32Height > 4096))? (HI_FALSE) : (HI_TRUE);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstInRect->s32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstInRect->s32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, IsSupportWbc);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input 4k ui not support wbc, the zme performance is not enough");
    }

    return IsSupportWbc;
}

/***************************************************************************************
* func         : DRV_HIFB_WBC_Recovery
* description  : CNcomment: 重新设置WBC和回写图层属性 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_Recovery(HIFB_GP_ID_E enGPId)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_RECT_S *pstDispRect = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGPId);
    pstDispRect = &g_pstGfxGPDevice[enGPId]->stOutRect;

    Ret = HIFB_WBC_AllocMem(HI_TRUE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_WBC_AllocMem, Ret);
        return;
    }

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        g_stGfxWbc2.enOutMode = DRV_VDP_WBC_WMODE_E_TOP;
        g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode = VDP_RMODE_TOP;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode);
    }
    else
#endif
    {
        g_stGfxWbc2.enOutMode = DRV_VDP_WBC_WMODE_E_PROGRESSIVE;
        g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode = (HI_TRUE == g_pstGfxGPDevice[enGPId]->bInterface) ? (VDP_RMODE_SELF_ADAPTION) : (VDP_RMODE_PROGRESSIVE);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode);
    }

    DRV_HIFB_HAL_WBC_SetDitherMode     (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.enDitherMode);
    DRV_HIFB_HAL_WBC_SetOutFmt         (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.stWBCFmt);
    DRV_HIFB_HAL_WBC_SetOutMod         (g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.enOutMode);

    DRV_HIFB_HAL_GFX_SetInDataFmt      (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, DRV_HIFB_ADP_PixerFmtTransferToHalFmt(g_stGfxWbc2.enDataFmt));
    DRV_HIFB_HAL_GFX_SetPalpha         (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, HI_TRUE,HI_TRUE,0xff,0xff);
    DRV_HIFB_HAL_GFX_SetPreMultEnable  (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, HI_TRUE, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetLutAddr        (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->stCluptTable.u32StartPhyAddr);
    DRV_HIFB_HAL_GFX_SetLayerBkg       (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, &(g_pstGfxDevice[OPTM_SLAVER_LAYERID]->stBkg));
    DRV_HIFB_HAL_GFX_SetBitExtend      (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enBitExtend);
    DRV_HIFB_HAL_GFX_SetUpdMode        (g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enGfxHalId, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enUpDateMode);

    DRV_HIFB_ADP_SetReadMode           (OPTM_SLAVER_LAYERID, g_pstGfxDevice[OPTM_SLAVER_LAYERID]->enReadMode);
    DRV_HIFB_ADP_SetLayerAddr          (OPTM_SLAVER_LAYERID, g_stGfxWbc2.u32ReadBufAddr);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if (HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer)
    {
        DRV_HIFB_ADP_SetLayerStride(OPTM_SLAVER_LAYERID, g_stGfxWbc2.FieldBufferStride);
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FieldBufferStride);
    }
    else
 #endif
    {
        DRV_HIFB_ADP_SetLayerStride(OPTM_SLAVER_LAYERID, g_stGfxWbc2.FrameBufferStride);
        DRV_HIFB_HAL_WBC_SetLayerAddr(g_stGfxWbc2.enWbcHalId, g_stGfxWbc2.u32WriteBufAddr, g_stGfxWbc2.FrameBufferStride);
    }

    /** should set correct rect and zme value, otherwise will has not finish wbc intterupt **/
    DRV_HIFB_WBC_CfgSlvLayer(OPTM_SLAVER_LAYERID, pstDispRect);
#ifndef HI_BUILD_IN_BOOT
    DRV_HIFB_WBC_SetWbcGpZme();
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_WBC_GetWriteBuffer
* description   : CNcomment: 获取回写地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_WBC_GetWriteBuffer(HI_U32* pAddr, HI_U32* pStride)
{
    DRV_HIFB_HAL_WBC_GetLayerAddr(OPTM_VDP_LAYER_WBC_GP0, pAddr, pStride);
}

#ifdef HI_BUILD_IN_BOOT
HI_VOID BOOT_HIFB_WBC_GetWbcInfo(BOOT_HIFB_WBC_DATA_S *pstWbcInfo)
{
    if (NULL != pstWbcInfo)
    {
        pstWbcInfo->u32Stride = g_stGfxWbc2.FrameBufferStride;
        pstWbcInfo->u32ReadBufAddr = g_stGfxWbc2.u32ReadBufAddr;
    }
    return;
}

HI_VOID BOOT_HIFB_WBC_ReFresh(HI_BOOL Support4KLogo)
{
    HIFB_LAYER_ID_E HifbLayerId = OPTM_SLAVER_LAYERID;
    OPTM_GFX_GP_S *pGfxGp = g_pstGfxGPDevice[OPTM_SLAVER_GPID];
    HI_RECT_S stInRect = g_pstGfxGPDevice[HIFB_ADP_GP0]->stInRect;
    HI_BOOL IsSupportWbc = HI_TRUE;

    IsSupportWbc = HIFB_WBC_IsSupport(&stInRect);
    if (HI_FALSE == IsSupportWbc)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pGfxGp);
    DRV_HIFB_WBC_CfgSlvLayer(HifbLayerId, &pGfxGp->stOutRect);

    HIFB_WBC_SetLayerAlpha   (HifbLayerId);
    HIFB_WBC_SetLayerPreMult (HifbLayerId);
    HIFB_WBC_SetLayerAddr    (HifbLayerId);
    HIFB_WBC_SetWbcGpAddr    ();
    HIFB_WBC_SetWbcEnable    (HifbLayerId,Support4KLogo);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_WBC_SetLayerAlpha(HIFB_LAYER_ID_E HifbLayerId)
{
     HIFB_ALPHA_S *pstAlpha = &g_pstGfxDevice[HifbLayerId]->stAlpha;
     DRV_HIFB_HAL_GFX_SetPalpha     (g_pstGfxDevice[HifbLayerId]->enGfxHalId, pstAlpha->bAlphaEnable, HI_TRUE, pstAlpha->u8Alpha0, pstAlpha->u8Alpha1);
     DRV_HIFB_HAL_GFX_SetLayerGalpha(g_pstGfxDevice[HifbLayerId]->enGfxHalId, pstAlpha->u8GlobalAlpha);
     return;
}

static inline HI_VOID HIFB_WBC_SetLayerPreMult(HIFB_LAYER_ID_E HifbLayerId)
{
     DRV_HIFB_HAL_GFX_SetPreMultEnable (g_pstGfxDevice[HifbLayerId]->enGfxHalId, g_pstGfxDevice[HifbLayerId]->bPreMute, HI_FALSE);
     return;
}

static inline HI_VOID HIFB_WBC_SetLayerAddr(HIFB_LAYER_ID_E HifbLayerId)
{
     HI_U32 WriteAddr = g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex];
     DRV_HIFB_HAL_GFX_SetLayerAddrEX(g_pstGfxDevice[HifbLayerId]->enGfxHalId, WriteAddr);
     return;
}

static inline HI_VOID HIFB_WBC_SetWbcGpAddr(HI_VOID)
{
     HI_U32 ReadAddr = 0;
     HI_U32 WbcBufferStride = g_stGfxWbc2.FrameBufferStride;
     OPTM_VDP_LAYER_WBC_E WbcHalId = g_stGfxWbc2.enWbcHalId;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(g_stGfxWbc2.u32BufIndex, CONFIG_HIFB_WBC_BUF_NUM);
     ReadAddr = g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex];

     DRV_HIFB_HAL_WBC_SetLayerAddr(WbcHalId, ReadAddr, WbcBufferStride);

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}

static inline HI_VOID HIFB_WBC_SetWbcEnable(HIFB_LAYER_ID_E HifbLayerId, HI_BOOL Support4KLogo)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     HIFB_WBC_SetLayerEnable(HifbLayerId);
     HIFB_WBC_SetWbcGpEnable(HifbLayerId,Support4KLogo);
     HIFB_WBC_SetGpEnable(OPTM_SLAVER_GPID);
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}

static inline HI_VOID HIFB_WBC_SetLayerEnable(HIFB_LAYER_ID_E HifbLayerId)
{
     HI_BOOL IsLayerEnable = g_pstGfxDevice[HifbLayerId]->bEnable;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     DRV_HIFB_HAL_GFX_SetLayerEnable (g_pstGfxDevice[HifbLayerId]->enGfxHalId, IsLayerEnable);
     DRV_HIFB_HAL_GFX_SetRegUp(g_pstGfxDevice[HifbLayerId]->enGfxHalId);

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}

static inline HI_VOID HIFB_WBC_SetGpEnable(HIFB_GP_ID_E HalGpId)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[HalGpId]->enGpHalId);
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}

static inline HI_VOID HIFB_WBC_SetWbcGpEnable(HIFB_LAYER_ID_E HifbLayerId, HI_BOOL Support4KLogo)
{
     HI_BOOL IsLayerEnable = g_pstGfxDevice[HifbLayerId]->bEnable;
     OPTM_VDP_LAYER_WBC_E WbcHalId = g_stGfxWbc2.enWbcHalId;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     if (HI_FALSE == Support4KLogo)
     {
        DRV_HIFB_HAL_WBC_GP_SetEnable(WbcHalId, IsLayerEnable);
        HIFB_WBC2_SetRegUp(WbcHalId);
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}
#endif
