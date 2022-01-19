/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name      : drv_hifb_logo.c
Version        : Initial Draft
Author         :
Created        : 2018/01/01
Description    :
Function List  :


History        :
Date                 Author                Modification
2018/01/01           sdk                  Created file
************************************************************************************************/
#ifdef CONFIG_HIFB_LOGO_SUPPORT

/*********************************add include here**********************************************/
#include "drv_hifb_common.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_logo.h"
#include "drv_hifb_wbc.h"
#include "drv_hifb_osr.h"
#include "drv_hifb_config.h"
#include "drv_hifb_debug.h"

#include "drv_pdm_ext.h"
#include "drv_disp_ext.h"
/***************************** Macro Definition ************************************************/
#define CHECK_WHETHER_IS_HD0LOGOID(layerid)\
        do {\
               if (HIFB_LOGO_LAYER_HD0_ID != layerid){\
                   return;\
               }\
        }while (0)

#define CONFIG_HIFB_OPENWBC_WAITE_TIME      ((4000 * HZ) / 1000)

/*************************** Structure Definition **********************************************/


/********************** Global Variable declaration ********************************************/
static HIFB_LOGO_S gs_stLogo;

extern HIFB_LAYER_S s_stLayer[HIFB_MAX_LAYER_NUM];
extern DRV_HIFB_WBC_GFX_S g_stGfxWbc2;

static HIFB_DRV_TDEOPS_S    gs_stLogoGfx2dCallBackFunction;
static HIFB_DRV_OPS_S       gs_stLogoHifbAdpCallBackFunction;

static PDM_EXPORT_FUNC_S   *gs_pstPdmExportFuncs = NULL;

/******************************* API declaration ***********************************************/
static inline HI_VOID HIFB_LOGO_GetData          (HI_U32 LayerId);
static inline HI_U32  HIFB_LOGO_GetID            (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_BlitHdToApp      (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_QuickCpyHdToApp  (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_QuickCpySdToApp  (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_CloseLayer       (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_FreeMem          (HI_U32 LayerId);
static inline HI_VOID HIFB_LOGO_FreeHdMem        (HIFB_LOGO_LAYER_E LogoLayerId);
static inline HI_VOID HIFB_LOGO_FreeSdMem        (HIFB_LOGO_LAYER_E LogoLayerId);
static inline HI_VOID HIFB_LOGO_FreeHdMemWork    (struct work_struct *work);
static inline HI_VOID HIFB_LOGO_FreeSdMemWork    (struct work_struct *work);

static inline HIFB_COLOR_FMT_E HIFB_LOGO_ConvertBootFmtToLayerFmt(HI_U32 BootFmt);

/******************************* API relese ****************************************************/

/***************************************************************************************
* func         : DRV_HIFB_LOGO_ResetState
* description  : CNcomment: reset logo information state CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_LOGO_ResetState(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_Memset(&gs_stLogo, 0, sizeof(gs_stLogo));

    gs_stLogo.stGfxLogoInfo[HIFB_LOGO_HD0].eLogoID     = HIFB_LOGO_LAYER_HD0_ID;
    gs_stLogo.stGfxLogoInfo[HIFB_LOGO_HD1].eLogoID     = HIFB_LOGO_LAYER_HD1_ID;
    gs_stLogo.stGfxLogoInfo[HIFB_LOGO_WBC_HD0].eLogoID = HIFB_LOGO_LAYER_WBC_HD0_ID;
    gs_stLogo.stGfxLogoInfo[HIFB_LOGO_WBC_HD1].eLogoID = HIFB_LOGO_LAYER_WBC_HD1_ID;

    DRV_HIFB_GFX2D_GetCallBackFunction(&gs_stLogoGfx2dCallBackFunction);
    DRV_HIFB_ADP_GetCallBackFunction(&gs_stLogoHifbAdpCallBackFunction);

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_PDM,  (HI_VOID**)&gs_pstPdmExportFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == gs_pstPdmExportFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get pdm func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_LOGO_WhetherExist
* description  : CNcomment: check whether has logo CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_LOGO_WhetherExist(HI_VOID)
{
     HI_U32 LogoInfoIndex = HIFB_LOGO_HD0;
     HIFB_LOGO_DATA_S stLogoData;

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
     for (LogoInfoIndex = HIFB_LOGO_HD0; LogoInfoIndex < HIFB_LOGO_WBC_HD1; LogoInfoIndex++)
     {
          HI_GFX_Memset(&stLogoData, 0, sizeof(stLogoData));
          gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_GetLogoData(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID, &stLogoData);

          if (HI_FALSE == stLogoData.LogoEnable)
          {
             gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow = HI_FALSE;
             continue;
          }

          gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow = HI_TRUE;
     }
#else
     HI_GFX_Memset(&stLogoData, 0, sizeof(stLogoData));
     gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_GetLogoData(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID, &stLogoData);
     gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow = stLogoData.LogoEnable;
#endif

     return;
}

/***************************************************************************************
* func        : DRV_HIFB_LOGO_GetData
* description : CNcomment: get logo date from gfx register or video register CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_LOGO_GetData(HI_U32 u32LayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    CHECK_WHETHER_IS_HD0LOGOID(u32LayerId);

    HIFB_LOGO_GetData(u32LayerId);
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if (HIFB_LOGO_LAYER_HD0_ID == u32LayerId)
    {
        HIFB_LOGO_GetData(HIFB_LOGO_LAYER_WBC_HD0_ID);
    }
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_GetData(HI_U32 LayerId)
{
    HI_U32 LogoInfoIndex = 0;
    HIFB_LOGO_DATA_S stLogoData;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    if ((LogoInfoIndex >= HIFB_LOGO_BUTT) || (HI_FALSE == gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_Memset(&stLogoData,0,sizeof(stLogoData));

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_GetLogoData);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_GetLogoData(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID, &stLogoData);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID, HI_TRUE);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    g_stGfxWbc2.bSupportLogoToApp = HI_TRUE;
#endif
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].Support4KLogo  = stLogoData.Support4KLogo;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr      = stLogoData.LogoYAddr;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoCbCrAddr   = stLogoData.LogoCbCrAddr;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoWidth      = stLogoData.LogoWidth;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoHeight     = stLogoData.LogoHeight;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYStride    = stLogoData.LogoYStride;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoCbCrStride = stLogoData.LogoCbCrStride;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].eLogoPixFmt    = stLogoData.eLogoPixFmt;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.x    = stLogoData.stOutRect.x;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.y    = stLogoData.stOutRect.y;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.w    = stLogoData.stOutRect.w;
    gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.h    = stLogoData.stOutRect.h;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_U32 HIFB_LOGO_GetID(HI_U32 LayerId)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     if (HIFB_LOGO_LAYER_HD0_ID == LayerId)
     {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return HIFB_LOGO_HD0;
     }

     if (HIFB_LOGO_LAYER_WBC_HD0_ID == LayerId)
     {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return HIFB_LOGO_WBC_HD0;
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return HIFB_LOGO_BUTT;
}

/***************************************************************************************
* func         : DRV_HIFB_LOGO_TransitionToApp
* description  : CNcomment: logo to app CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_LOGO_TransitionToApp(HI_U32 LayerId)
{
    HI_U32 LogoInfoIndex = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    CHECK_WHETHER_IS_HD0LOGOID(LayerId);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    if ((LogoInfoIndex >= HIFB_LOGO_BUTT) || (HI_FALSE == gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (HI_TRUE == gs_stLogo.stLogoDataInfo[LogoInfoIndex].Support4KLogo)
    {
        HIFB_LOGO_BlitHdToApp(LayerId);
    }
    else
    {
        HIFB_LOGO_QuickCpyHdToApp(LayerId);
    }

    HIFB_LOGO_QuickCpySdToApp(HIFB_LOGO_LAYER_WBC_HD0_ID);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_BlitHdToApp(HI_U32 LayerId)
{
    HI_U32 LogoInfoIndex  = 0;
    struct fb_info *info  = NULL;
    HIFB_PAR_S *par = NULL;
    HIFB_BLIT_BUFFER_S stLogoBuf;
    HIFB_BLIT_BUFFER_S stAppBuf;
    HIFB_BLIT_OPT_S stOpt;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    CHECK_WHETHER_IS_HD0LOGOID(LayerId);
    info = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);

    par = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LogoInfoIndex, HIFB_LOGO_BUTT);

    if (0 == gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr);
        return;
    }

    HI_GFX_Memset(&stOpt,     0, sizeof(stOpt));
    HI_GFX_Memset(&stLogoBuf, 0, sizeof(stLogoBuf));
    HI_GFX_Memset(&stAppBuf,  0, sizeof(stAppBuf));

    stLogoBuf.stCanvas.YAddr   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr;
    stLogoBuf.stCanvas.Width   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoWidth;
    stLogoBuf.stCanvas.Height  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoHeight;
    stLogoBuf.stCanvas.YStride = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYStride;
    stLogoBuf.stCanvas.enFmt   = HIFB_FMT_ARGB8888;
    if (HIFB_LOGO_PIX_FMT_ARGB1555 == gs_stLogo.stLogoDataInfo[LogoInfoIndex].eLogoPixFmt)
    {
       stLogoBuf.stCanvas.enFmt = HIFB_FMT_ARGB1555;
    }

    stLogoBuf.UpdateRect.x  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.x;
    stLogoBuf.UpdateRect.y  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.y;
    stLogoBuf.UpdateRect.w  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.w;
    stLogoBuf.UpdateRect.h  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].stOutRect.h;

    stAppBuf.stCanvas.enFmt   = par->stExtendInfo.enColFmt;
    stAppBuf.stCanvas.YAddr   = info->fix.smem_start;
    stAppBuf.stCanvas.Width   = par->stExtendInfo.DisplayWidth;
    stAppBuf.stCanvas.Height  = par->stExtendInfo.DisplayHeight;
    stAppBuf.stCanvas.YStride = info->fix.line_length;

    stAppBuf.UpdateRect.x = 0;
    stAppBuf.UpdateRect.y = 0;
    stAppBuf.UpdateRect.w = stAppBuf.stCanvas.Width;
    stAppBuf.UpdateRect.h = stAppBuf.stCanvas.Height;

    stOpt.bScale = HI_TRUE;

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_MbBlitEx);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone);

    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_MbBlitEx(&stLogoBuf, &stAppBuf, &stOpt);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone(HI_TRUE);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "hd quickcpy logo buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, LayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stLogoBuf.stCanvas.YAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.YStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stLogoBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.h);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "hd app buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stAppBuf.stCanvas.YAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.YStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stAppBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.h);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_QuickCpyHdToApp(HI_U32 LayerId)
{
    struct fb_info *info  = NULL;
    HIFB_PAR_S *par = NULL;
    HIFB_BUFFER_S stLogoBuf;
    HIFB_BUFFER_S stAppBuf;
    HI_U32 LogoInfoIndex  = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    CHECK_WHETHER_IS_HD0LOGOID(LayerId);
    info  = s_stLayer[LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    par = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LogoInfoIndex, HIFB_LOGO_BUTT);

    if (0 == gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_Memset(&stLogoBuf, 0, sizeof(stLogoBuf));
    HI_GFX_Memset(&stAppBuf,  0, sizeof(stAppBuf));

    stLogoBuf.stCanvas.u32PhyAddr = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr;
    stLogoBuf.stCanvas.u32Width   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoWidth;
    stLogoBuf.stCanvas.u32Height  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoHeight;
    stLogoBuf.stCanvas.u32Pitch   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYStride;
    stLogoBuf.stCanvas.enFmt      = HIFB_FMT_ARGB8888;
    if (HIFB_LOGO_PIX_FMT_ARGB1555 == gs_stLogo.stLogoDataInfo[LogoInfoIndex].eLogoPixFmt)
    {
       stLogoBuf.stCanvas.enFmt = HIFB_FMT_ARGB1555;
    }
    stLogoBuf.UpdateRect.x  = 0;
    stLogoBuf.UpdateRect.y  = 0;
    stLogoBuf.UpdateRect.w  = stLogoBuf.stCanvas.u32Width;
    stLogoBuf.UpdateRect.h  = stLogoBuf.stCanvas.u32Height;

    stAppBuf.stCanvas.enFmt      = par->stExtendInfo.enColFmt;
    stAppBuf.stCanvas.u32Height  = par->stExtendInfo.DisplayHeight;
    stAppBuf.stCanvas.u32Width   = par->stExtendInfo.DisplayWidth;
    stAppBuf.stCanvas.u32Pitch   = info->fix.line_length;
    stAppBuf.stCanvas.u32PhyAddr = info->fix.smem_start;
    stAppBuf.UpdateRect.x        = 0;
    stAppBuf.UpdateRect.y        = 0;
    stAppBuf.UpdateRect.w        = stAppBuf.stCanvas.u32Width;
    stAppBuf.UpdateRect.h        = stAppBuf.stCanvas.u32Height;

#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stLogoBuf, &stAppBuf, HI_TRUE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
#else
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stLogoBuf, &stAppBuf, HI_FALSE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
#endif

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone(HI_TRUE);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "hd quickcpy logo buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, LayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stLogoBuf.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stLogoBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.h);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "hd app buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stAppBuf.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stAppBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.h);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_QuickCpySdToApp(HI_U32 LayerId)
{
    HI_U32 LogoInfoIndex  = 0;
    HIFB_BUFFER_S stLogoBuf;
    HIFB_BUFFER_S stAppBuf;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    if ((LogoInfoIndex >= HIFB_LOGO_BUTT) || (HI_FALSE == gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    if (0 == gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_Memset(&stLogoBuf, 0, sizeof(stLogoBuf));
    HI_GFX_Memset(&stAppBuf,  0, sizeof(stAppBuf));

    stLogoBuf.stCanvas.u32PhyAddr = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYAddr;
    stLogoBuf.stCanvas.u32Width   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoWidth;
    stLogoBuf.stCanvas.u32Height  = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoHeight;
    stLogoBuf.stCanvas.u32Pitch   = gs_stLogo.stLogoDataInfo[LogoInfoIndex].LogoYStride;
    stLogoBuf.stCanvas.enFmt      = HIFB_FMT_ARGB8888;

    stLogoBuf.UpdateRect.x  = 0;
    stLogoBuf.UpdateRect.y  = 0;
    stLogoBuf.UpdateRect.w  = stLogoBuf.stCanvas.u32Width;
    stLogoBuf.UpdateRect.h  = stLogoBuf.stCanvas.u32Height;

    (HI_VOID)wait_event_interruptible_timeout(g_stGfxWbc2.WaiteWbcWorkqueueMutex,
                                              (0 != g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex]),
                                              CONFIG_HIFB_OPENWBC_WAITE_TIME);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================");

    stAppBuf.stCanvas.enFmt      = HIFB_FMT_ARGB8888;
    stAppBuf.stCanvas.u32PhyAddr = g_stGfxWbc2.u32WBCBuffer[g_stGfxWbc2.u32BufIndex];
    stAppBuf.stCanvas.u32Width   = g_stGfxWbc2.s32BufferWidth;
    stAppBuf.stCanvas.u32Height  = g_stGfxWbc2.s32BufferHeight;
    stAppBuf.stCanvas.u32Pitch   = g_stGfxWbc2.FrameBufferStride;

    stAppBuf.UpdateRect.x  = 0;
    stAppBuf.UpdateRect.y  = 0;
    stAppBuf.UpdateRect.w  = stAppBuf.stCanvas.u32Width;
    stAppBuf.UpdateRect.h  = stAppBuf.stCanvas.u32Height;

#ifdef CONFIG_GFX_MMU_SUPPORT
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stLogoBuf, &stAppBuf, HI_TRUE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "mmz to smmu");
#else
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_QuickCopy(&stLogoBuf, &stAppBuf, HI_FALSE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "mmz to mmz");
#endif

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone);
    gs_stLogoGfx2dCallBackFunction.DRV_HIFB_GFX2D_WaitAllDone(HI_TRUE);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "wbc quickcpy logo buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, LayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stLogoBuf.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.stCanvas.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stLogoBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stLogoBuf.UpdateRect.h);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "wbc app buffer");
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, stAppBuf.stCanvas.u32PhyAddr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_stGfxWbc2.u32BufIndex);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.u32Pitch);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.stCanvas.enFmt);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stAppBuf.UpdateRect.h);

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "============================================");

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_LOGO_Close
* description  : CNcomment: close logo CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_LOGO_Close(HI_U32 LayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HIFB_LOGO_CloseLayer(LayerId);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if (HIFB_LOGO_LAYER_HD0_ID == LayerId)
    {
        HIFB_LOGO_CloseLayer(HIFB_LOGO_LAYER_WBC_HD0_ID);
    }
#endif
    HIFB_LOGO_FreeMem(LayerId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_CloseLayer(HI_U32 LayerId)
{
    HI_U32 LogoInfoIndex = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    LogoInfoIndex = HIFB_LOGO_GetID(LayerId);
    if ((LogoInfoIndex >= HIFB_LOGO_BUTT) || (HI_FALSE == gs_stLogo.stGfxLogoInfo[LogoInfoIndex].bShow))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetGPMask(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID, HI_FALSE);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_ClearLogoOsd);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_ClearLogoOsd(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_UpLayerReg);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_UpLayerReg(gs_stLogo.stGfxLogoInfo[LogoInfoIndex].eLogoID);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_FreeMem(HI_U32 LayerId)
{
    HI_U32 LogoHDInfoIndex  = 0;
    HI_U32 LogoWBCInfoIndex = 0;
    msleep(80);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    LogoHDInfoIndex  = HIFB_LOGO_GetID(LayerId);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LogoHDInfoIndex, HIFB_LOGO_BUTT);

    if (HIFB_LOGO_LAYER_HD0_ID == LayerId)
    {
        LogoWBCInfoIndex = HIFB_LOGO_GetID(HIFB_LOGO_LAYER_WBC_HD0_ID);
    }

    if (HI_TRUE == gs_stLogo.stGfxLogoInfo[LogoHDInfoIndex].bShow)
    {
        /** should not set in work queue **/
        /** 不要在工作队里中赋值，否则工作队列还没有执行又调用INIT_WORK将工作队列至空导致队列空指针访问 **/
        gs_stLogo.stGfxLogoInfo[LogoHDInfoIndex].bShow = HI_FALSE;
        INIT_WORK(&(gs_stLogo.stGfxLogoInfo[LogoHDInfoIndex].freeLogoMemWork),  HIFB_LOGO_FreeHdMemWork);
        schedule_work(&(gs_stLogo.stGfxLogoInfo[LogoHDInfoIndex].freeLogoMemWork));
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HI_TRUE == gs_stLogo.stGfxLogoInfo[LogoWBCInfoIndex].bShow)
    {
        /** should not set in work queue **/
        /** 不要在工作队里中赋值，否则工作队列还没有执行又调用INIT_WORK将工作队列至空导致队列空指针访问 **/
        gs_stLogo.stGfxLogoInfo[LogoWBCInfoIndex].bShow = HI_FALSE;
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
        g_stGfxWbc2.bSupportLogoToApp = HI_FALSE;
#endif
        INIT_WORK(&(gs_stLogo.stGfxLogoInfo[LogoWBCInfoIndex].freeLogoMemWork), HIFB_LOGO_FreeSdMemWork);
        schedule_work(&(gs_stLogo.stGfxLogoInfo[LogoWBCInfoIndex].freeLogoMemWork));
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_FreeHdMem(HIFB_LOGO_LAYER_E LogoLayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((NULL != gs_pstPdmExportFuncs) && (NULL != gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem))
    {
        gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem(DISPLAY_BUFFER_HD);
        gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem(HIFB_ZME_COEF_BUFFER);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_FreeSdMem(HIFB_LOGO_LAYER_E LogoLayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    (HI_VOID)wait_event_interruptible_timeout(g_stGfxWbc2.WaiteWbcWorkqueueMutex,
                                              (HI_TRUE == g_stGfxWbc2.bFinishSdLogoToApp),
                                              CONFIG_HIFB_OPENWBC_WAITE_TIME);
#else
    (HI_VOID)wait_event_interruptible_timeout(g_stGfxWbc2.WaiteWbcWorkqueueMutex,
                                              (1 == g_stGfxWbc2.u32BufIndex),
                                              CONFIG_HIFB_OPENWBC_WAITE_TIME);
#endif
    if ((NULL != gs_pstPdmExportFuncs) && (NULL != gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem))
    {
        gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem(DISPLAY_BUFFER_SD);
        gs_pstPdmExportFuncs->pfnPDM_ReleaseReserveMem(HIFB_WBC_BUFFER);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_FreeHdMemWork(struct work_struct *work)
{
    HIFB_GFX_LOGO_INFO_S *pstGfxLogoInfo  = NULL;
    HI_U32 LogoInfoIndex  = 0;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *FbInfo = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(work);
    pstGfxLogoInfo = (HIFB_GFX_LOGO_INFO_S *)container_of(work, HIFB_GFX_LOGO_INFO_S, freeLogoMemWork);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstGfxLogoInfo);

    LogoInfoIndex = HIFB_LOGO_GetID(pstGfxLogoInfo->eLogoID);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LogoInfoIndex, HIFB_LOGO_BUTT);

    HIFB_LOGO_FreeHdMem(LogoInfoIndex);

    FbInfo = s_stLayer[HIFB_LAYER_HD_0].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(FbInfo);
    pstPar = (HIFB_PAR_S *)FbInfo->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    pstPar->FinishHdLogoWork = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_LOGO_FreeSdMemWork(struct work_struct *work)
{
    HIFB_GFX_LOGO_INFO_S *pstGfxLogoInfo  = NULL;
    HI_U32 LogoInfoIndex  = 0;
    HIFB_PAR_S *pstPar = NULL;
    struct fb_info *FbInfo = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(work);
    pstGfxLogoInfo = (HIFB_GFX_LOGO_INFO_S *)container_of(work, HIFB_GFX_LOGO_INFO_S, freeLogoMemWork);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstGfxLogoInfo);

    LogoInfoIndex  = HIFB_LOGO_GetID(pstGfxLogoInfo->eLogoID);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(LogoInfoIndex, HIFB_LOGO_BUTT);

    HIFB_LOGO_FreeSdMem(LogoInfoIndex);

    FbInfo = s_stLayer[HIFB_LAYER_HD_0].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(FbInfo);
    pstPar = (HIFB_PAR_S *)FbInfo->par;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstPar);
    pstPar->FinishSdLogoWork = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_LOGO_GetBaseData
* description   : CNcomment: get base data if has base partition CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_LOGO_GetBaseData(HI_U32 u32LayerId)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_PAR_S *par = NULL;
    struct fb_info *info = NULL;
    HIFB_RECT         stInRect  = {0};
    HIFB_COLOR_FMT_E  enHifbFmt = HIFB_FMT_BUTT;
    HI_DISP_PARAM_S   stDispParam;
    HI_U32 u32PixDepth = 0;
    HI_U32 CmpStride   = 0;
    HI_U32 LayerStride = 0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (HIFB_LOGO_LAYER_HD0_ID != u32LayerId)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return ;
    }

    info = s_stLayer[u32LayerId].pstInfo;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(info);
    par = (HIFB_PAR_S *)(info->par);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(par);

    if (NULL == gs_pstPdmExportFuncs)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, gs_pstPdmExportFuncs);
        return ;
    }
    if (NULL == gs_pstPdmExportFuncs->pfnPDM_GetDispParam)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, gs_pstPdmExportFuncs->pfnPDM_GetDispParam);
        return ;
    }

    HI_GFX_Memset(&stDispParam,0,sizeof(stDispParam));

    Ret = gs_pstPdmExportFuncs->pfnPDM_GetDispParam(HI_UNF_DISPLAY1, &stDispParam);
    if (HI_FAILURE == Ret)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call pfnPDM_GetDispParam failure\n");
        return;
    }

    if ( (0 == stDispParam.u32VirtScreenWidth) || (0 == stDispParam.u32VirtScreenHeight))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDispParam.u32VirtScreenWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDispParam.u32VirtScreenHeight);
        return ;
    }

    enHifbFmt = HIFB_LOGO_ConvertBootFmtToLayerFmt((HI_U32)stDispParam.enPixelFormat);
    if (enHifbFmt >= HIFB_FMT_PUYVY)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enHifbFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_FMT_PUYVY);
        return ;
    }

    info->var.bits_per_pixel = DRV_HIFB_MEM_GetBppByFmt(enHifbFmt);
    if (0 == info->var.bits_per_pixel)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        return ;
    }

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT | HIFB_PARA_CHECK_BITSPERPIXEL,
                                  stDispParam.u32VirtScreenWidth, stDispParam.u32VirtScreenHeight, 0, 0, info->var.bits_per_pixel);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDispParam.u32VirtScreenWidth);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, stDispParam.u32VirtScreenHeight);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, info->var.bits_per_pixel);
        return ;
    }

    info->var.xres = stDispParam.u32VirtScreenWidth;
    info->var.yres = stDispParam.u32VirtScreenHeight;
    info->var.xres_virtual = info->var.xres;
    info->var.yres_virtual = info->var.yres * CONFIG_HIFB_LAYER_BUFFER_MAX_NUM;
    info->var.xoffset = 0;
    info->var.yoffset = 0;

    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(enHifbFmt, HIFB_MAX_PIXFMT_NUM);
    info->var.red    = s_stArgbBitField[enHifbFmt].stRed;
    info->var.green  = s_stArgbBitField[enHifbFmt].stGreen;
    info->var.blue   = s_stArgbBitField[enHifbFmt].stBlue;
    info->var.transp = s_stArgbBitField[enHifbFmt].stTransp;

    info->fix.line_length  = CONIFG_HIFB_GetMaxStride(info->var.xres_virtual,info->var.bits_per_pixel,&CmpStride,CONFIG_HIFB_STRIDE_16ALIGN);

    u32PixDepth = info->var.bits_per_pixel >> 3;
    LayerStride = (info->var.xres_virtual * u32PixDepth + CONFIG_HIFB_STRIDE_16ALIGN - 1) & (~(CONFIG_HIFB_STRIDE_16ALIGN - 1));

    par->stExtendInfo.enColFmt         = enHifbFmt;
    par->stExtendInfo.stPos.s32XPos    = 0;
    par->stExtendInfo.stPos.s32YPos    = 0;
    par->stExtendInfo.DisplayWidth  = info->var.xres;
    par->stExtendInfo.DisplayHeight = info->var.yres;

    stInRect.x = par->stExtendInfo.stPos.s32XPos;
    stInRect.y = par->stExtendInfo.stPos.s32YPos;
    stInRect.w = par->stExtendInfo.DisplayWidth;
    stInRect.h = par->stExtendInfo.DisplayHeight;

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.xres);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.yres);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.xres_virtual);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.yres_virtual);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, info->var.bits_per_pixel);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInRect.x);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInRect.y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInRect.w);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, stInRect.h);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerRect);
    Ret = gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerRect(u32LayerId, &stInRect);
    if (HI_SUCCESS != Ret) { HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetLayerRect, Ret); }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerStride(u32LayerId, LayerStride);
    gs_stLogoHifbAdpCallBackFunction.DRV_HIFB_ADP_SetLayerDataFmt(u32LayerId, par->stExtendInfo.enColFmt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return ;
}

static inline HIFB_COLOR_FMT_E HIFB_LOGO_ConvertBootFmtToLayerFmt(HI_U32 BootFmt)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (HIFB_BOOT_FMT_1555 == BootFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HIFB_FMT_ARGB1555;
    }
    else if (HIFB_BOOT_FMT_8888 == BootFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HIFB_FMT_ARGB8888;
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, BootFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_BOOT_FMT_1555);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_BOOT_FMT_8888);
        return HIFB_FMT_BUTT;
    }
}

#endif
