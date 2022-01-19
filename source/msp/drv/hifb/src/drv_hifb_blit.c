/**************************************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name        : drv_hifb_blit.c
Version          : Initial Draft
Author           : sdk
Created          : 2018/01/01
Description      :
Function List    :


History          :
Date                Author                  Modification
2018/01/01          sdk                     Created file
***************************************************************************************************/


/***************************** add include here****************************************************/
#include "hi_module.h"
#include "hi_drv_module.h"
#include "drv_tde_ext.h"
#include "drv_hifb_mem.h"
#include "drv_hifb_blit.h"
#include "drv_hifb_config.h"
#include "drv_hifb_debug.h"
#include "drv_hifb_adp.h"

/***************************** Macro Definition ***************************************************/
#define DRV_HIFB_GET_GFX2D_EXPORTFUNCS(GetGfx2dExportFuncs)     \
             {\
                 HI_S32 Ret = HI_SUCCESS;\
                 Ret = HI_DRV_MODULE_GetFunction(HI_ID_TDE, (HI_VOID**)&GetGfx2dExportFuncs);\
                 if ((HI_SUCCESS != Ret) || (NULL == GetGfx2dExportFuncs))\
                 {\
                     HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get tde func failure");\
                     HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);\
                     return HI_FAILURE;\
                 }\
             }
/***************************** Structure Definition ***********************************************/

/***************************** Global Variable declaration ****************************************/
static HI_BOOL gs_bTdeColFmt[HIFB_FMT_BUTT] =
                {
                    HI_TRUE,    /* HIFB_FMT_RGB565  */
                    HI_TRUE,    /* HIFB_FMT_RGB888  */
                    HI_TRUE,    /* HIFB_FMT_KRGB444 */
                    HI_TRUE,    /* HIFB_FMT_KRGB555 */

                    HI_FALSE,   /* HIFB_FMT_KRGB888  */
                    HI_TRUE,    /* HIFB_FMT_ARGB4444 */
                    HI_TRUE,    /* HIFB_FMT_ARGB1555 */
                    HI_TRUE,    /* HIFB_FMT_ARGB8888 */

                    HI_TRUE,    /* HIFB_FMT_ARGB8565 */
                    HI_TRUE,    /* HIFB_FMT_RGBA4444 */
                    HI_TRUE,    /* HIFB_FMT_RGBA5551 */
                    HI_TRUE,    /* HIFB_FMT_RGBA5658 */

                    HI_TRUE,   /* HIFB_FMT_RGBA8888 */
                    HI_TRUE,   /**< BGR565 */
                    HI_TRUE,   /**< BGR888 */
                    HI_TRUE,   /**< ABGR4444 */

                    HI_TRUE,   /**< ABGR1555 */
                    HI_TRUE,   /**< ABGR8888 */
                    HI_TRUE,   /**< ABGR8565 */
                    HI_TRUE,   /**< BGR444 16bpp */

                    HI_TRUE,   /**< BGR555 16bpp  */
                    HI_TRUE,   /**< BGR888 32bpp  */
                    HI_TRUE,   /* HIFB_FMT_1BPP    */
                    HI_TRUE,   /* HIFB_FMT_2BPP    */

                    HI_TRUE,   /* HIFB_FMT_4BPP    */
                    HI_TRUE,   /* HIFB_FMT_8BPP    */
                    HI_TRUE,   /* HIFB_FMT_ACLUT44 */
                    HI_TRUE,   /* HIFB_FMT_ACLUT88 */
                };

/***************************** API forward declarations *******************************************/
static inline HI_VOID DRV_HIFB_PrintBlitInfo(TDE2_SURFACE_S *pSrcSurface, TDE2_RECT_S *pstSrcRect, TDE2_SURFACE_S *pDstSurface, TDE2_RECT_S *pstDstRect, TDE2_OPT_S *pstOpt);

static inline TDE_DEFLICKER_LEVEL_E HIFB_BLIT_GetAntiflickerLevel(HIFB_LAYER_ANTIFLICKER_LEVEL_E enAntiflickerLevel,TDE2_DEFLICKER_MODE_E *penDeflickerMode);

static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetXRGBFmt (HIFB_COLOR_FMT_E Fmt);
static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetRGBFmt  (HIFB_COLOR_FMT_E Fmt);
static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetClutFmt (HIFB_COLOR_FMT_E Fmt);
/***************************** API realization ****************************************************/

/***************************************************************************************
* func          : DRV_HIFB_GFX2D_SupportFmt
* description   : CNcomment: 判断TDE是否支持该像素格式操作 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_BOOL DRV_HIFB_GFX2D_SupportFmt(HIFB_COLOR_FMT_E fmt)
{
    if (fmt < HIFB_FMT_BUTT) { return gs_bTdeColFmt[fmt]; }

    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, fmt);
    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_FMT_BUTT);
    return HI_FALSE;
}

/***************************************************************************************
* func          : HIFB_GFX2D_ConvFmt
* description   : CNcomment:FB像素格式转成TDE像素格式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
TDE2_COLOR_FMT_E HIFB_GFX2D_ConvFmt(HIFB_COLOR_FMT_E Fmt)
{
    TDE2_COLOR_FMT_E eTdeColorFmt = TDE2_COLOR_FMT_BUTT;

    eTdeColorFmt = HIFB_GFX2D_GetRGBFmt(Fmt);
    if (TDE2_COLOR_FMT_BUTT != eTdeColorFmt) { return eTdeColorFmt; }

    eTdeColorFmt = HIFB_GFX2D_GetXRGBFmt(Fmt);
    if (TDE2_COLOR_FMT_BUTT != eTdeColorFmt) { return eTdeColorFmt; }

    eTdeColorFmt = HIFB_GFX2D_GetClutFmt(Fmt);
    if (TDE2_COLOR_FMT_BUTT != eTdeColorFmt) { return eTdeColorFmt; }

    return TDE2_COLOR_FMT_BUTT;
}

static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetXRGBFmt(HIFB_COLOR_FMT_E Fmt)
{
    switch (Fmt)
    {
        case HIFB_FMT_KRGB888:
            return TDE2_COLOR_FMT_ARGB8888;
        case HIFB_FMT_ARGB4444:
            return TDE2_COLOR_FMT_ARGB4444;
        case HIFB_FMT_ARGB1555:
            return TDE2_COLOR_FMT_ARGB1555;
        case HIFB_FMT_ARGB8888:
            return TDE2_COLOR_FMT_ARGB8888;
        case HIFB_FMT_ARGB8565:
            return TDE2_COLOR_FMT_ARGB8565;
        case HIFB_FMT_ABGR1555:
            return TDE2_COLOR_FMT_ABGR1555;
        case HIFB_FMT_ABGR4444:
            return TDE2_COLOR_FMT_ABGR4444;
        case HIFB_FMT_ABGR8888:
            return TDE2_COLOR_FMT_ABGR8888;
        case HIFB_FMT_ABGR8565:
            return TDE2_COLOR_FMT_ABGR8565;
        case HIFB_FMT_KBGR888:
            return TDE2_COLOR_FMT_ABGR8888;
        default:
            return TDE2_COLOR_FMT_BUTT;
    }
}

static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetRGBFmt(HIFB_COLOR_FMT_E Fmt)
{
     switch (Fmt)
     {
         case HIFB_FMT_RGB565:
             return TDE2_COLOR_FMT_RGB565;
         case HIFB_FMT_RGB888:
             return TDE2_COLOR_FMT_RGB888;
         case HIFB_FMT_KRGB444:
             return TDE2_COLOR_FMT_RGB444;
         case HIFB_FMT_KRGB555:
             return TDE2_COLOR_FMT_RGB555;
         case HIFB_FMT_BGR565:
             return TDE2_COLOR_FMT_BGR565;
         case HIFB_FMT_KBGR555:
             return TDE2_COLOR_FMT_BGR555;
         case HIFB_FMT_KBGR444:
             return TDE2_COLOR_FMT_BGR444;
         case HIFB_FMT_BGR888:
             return TDE2_COLOR_FMT_BGR888;
         default:
            return TDE2_COLOR_FMT_BUTT;
    }
}

static inline TDE2_COLOR_FMT_E HIFB_GFX2D_GetClutFmt(HIFB_COLOR_FMT_E Fmt)
{
     switch (Fmt)
     {
         case HIFB_FMT_1BPP:
             return TDE2_COLOR_FMT_CLUT1;
         case HIFB_FMT_2BPP:
             return TDE2_COLOR_FMT_CLUT2;
         case HIFB_FMT_4BPP:
             return TDE2_COLOR_FMT_CLUT4;
         case HIFB_FMT_8BPP:
             return TDE2_COLOR_FMT_CLUT8;
         case HIFB_FMT_ACLUT44:
             return TDE2_COLOR_FMT_ACLUT44;
         case HIFB_FMT_ACLUT88:
             return TDE2_COLOR_FMT_ACLUT88;
         default:
             return TDE2_COLOR_FMT_BUTT;
     }
}

static inline HI_BOOL HIFB_GFX2D_IsColorFmtClut(TDE2_COLOR_FMT_E enColorFmt)
{
    if ((enColorFmt >= TDE2_COLOR_FMT_CLUT1) && (enColorFmt <= TDE2_COLOR_FMT_ACLUT88)) { return HI_TRUE;  }
    else                                                                                { return HI_FALSE; }
}

/***************************************************************************************
* func         : DRV_HIFB_GFX2D_QuickCopy
* description  : CNcomment: tde quickcopy CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_GFX2D_QuickCopy(HIFB_BUFFER_S *pSrcImg, HIFB_BUFFER_S *pDstImg, HI_BOOL mmz_to_smmu)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_HANDLE handle = 0;
    TDE2_SURFACE_S stSrcSur = {0}, stDstSur = {0};
    TDE2_RECT_S stSrcRect   = {0}, stDstRect = {0};
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pSrcImg, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pDstImg, HI_FAILURE);

    stSrcSur.u32PhyAddr   = pSrcImg->stCanvas.u32PhyAddr;
    stSrcSur.u32Width     = pSrcImg->stCanvas.u32Width;
    stSrcSur.u32Height    = pSrcImg->stCanvas.u32Height;
    stSrcSur.u32Stride    = pSrcImg->stCanvas.u32Pitch;
    stSrcSur.bAlphaMax255 = HI_TRUE;
    stSrcSur.bYCbCrClut   = HI_FALSE;
    stSrcSur.enColorFmt   = HIFB_GFX2D_ConvFmt(pSrcImg->stCanvas.enFmt);
    stSrcSur.u8Alpha0     = 0;
    stSrcSur.u8Alpha1     = 0;
    stSrcRect.s32Xpos     = pSrcImg->UpdateRect.x;
    stSrcRect.s32Ypos     = pSrcImg->UpdateRect.y;
    stSrcRect.u32Width    = pSrcImg->UpdateRect.w;
    stSrcRect.u32Height   = pSrcImg->UpdateRect.h;

    stDstSur.u32PhyAddr   = pDstImg->stCanvas.u32PhyAddr;
    stDstSur.u32Width     = pDstImg->stCanvas.u32Width;
    stDstSur.u32Height    = pDstImg->stCanvas.u32Height;
    stDstSur.u32Stride    = pDstImg->stCanvas.u32Pitch;
    stDstSur.bAlphaMax255 = HI_TRUE;
    stDstSur.bYCbCrClut   = HI_FALSE;
    stDstSur.enColorFmt   = HIFB_GFX2D_ConvFmt(pDstImg->stCanvas.enFmt);
    stDstSur.u8Alpha0     = 0;
    stDstSur.u8Alpha1     = 0;
    stDstRect.s32Xpos     = pDstImg->UpdateRect.x;
    stDstRect.s32Ypos     = pDstImg->UpdateRect.y;
    stDstRect.u32Width    = pDstImg->UpdateRect.w;
    stDstRect.u32Height   = pDstImg->UpdateRect.h;

    DRV_HIFB_PrintBlitInfo(&stSrcSur, &stSrcRect, &stDstSur, &stDstRect, NULL);

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeBeginJob,  HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeQuickCopy, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeEndJob,    HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeCancelJob, HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeBeginJob(&handle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeBeginJob, Ret);
        return Ret;
    }

    if (HI_FALSE == mmz_to_smmu)
    {
        Ret = Gfx2dExportFuncs->pfnTdeQuickCopy(handle,&stSrcSur,&stSrcRect,&stDstSur,&stDstRect);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        Ret = Gfx2dExportFuncs->pfnTdeQuickCopyEx(handle,&stSrcSur,&stSrcRect,&stDstSur,&stDstRect,HI_TRUE,HI_FALSE);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeQuickCopy, Ret);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeQuickCopyEx, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(handle);
        return Ret;
    }

    Ret = Gfx2dExportFuncs->pfnTdeEndJob(handle, HI_TRUE, 2000, HI_FALSE, NULL, NULL);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEndJob, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(handle);
        return Ret;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func           : DRV_HIFB_GFX2D_Blit
* description    : CNcomment: tde blit CNend\n
* param[in]      : HI_VOID
* retval         : NA
* others:        : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_GFX2D_Blit(HIFB_BUFFER_S *pSrcImg, HIFB_BUFFER_S *pDstImg,  HIFB_BLIT_OPT_S *pstOpt, HI_BOOL bRefreshScreen)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_HANDLE handle = 0;
    TDE2_SURFACE_S stSrcSur = {0}, stDstSur = {0};
    TDE2_RECT_S stSrcRect = {0}, stDstRect = {0};
    TDE2_OPT_S stOpt  = {0};
    TDE_DEFLICKER_LEVEL_E enTdeDflkLevel = TDE_DEFLICKER_BUTT;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pSrcImg, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pDstImg, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOpt, HI_FAILURE);

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeSetDeflickerLevel, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeEnableRegionDeflicker, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeBeginJob, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeBlit, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeEndJob, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeCancelJob, HI_FAILURE);

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, pSrcImg->stCanvas.u32PhyAddr, HI_FAILURE);

    stSrcSur.u32PhyAddr   = pSrcImg->stCanvas.u32PhyAddr;
    stSrcSur.u32Width     = pSrcImg->stCanvas.u32Width;
    stSrcSur.u32Height    = pSrcImg->stCanvas.u32Height;
    stSrcSur.u32Stride    = pSrcImg->stCanvas.u32Pitch;
    stSrcSur.bAlphaMax255 = HI_TRUE;
    stSrcSur.bYCbCrClut   = HI_FALSE;
    stSrcSur.enColorFmt   = HIFB_GFX2D_ConvFmt(pSrcImg->stCanvas.enFmt);
    stSrcSur.u8Alpha0     = pstOpt->stAlpha.u8Alpha0;
    stSrcSur.u8Alpha1     = pstOpt->stAlpha.u8Alpha1;

    if (!((stSrcSur.u8Alpha0 == 0) && (stSrcSur.u8Alpha1 == 0)))
    {
        stSrcSur.bAlphaExt1555 = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    stSrcRect.s32Xpos    = pSrcImg->UpdateRect.x;
    stSrcRect.s32Ypos    = pSrcImg->UpdateRect.y;
    stSrcRect.u32Width   = pSrcImg->UpdateRect.w;
    stSrcRect.u32Height  = pSrcImg->UpdateRect.h;

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, pDstImg->stCanvas.u32PhyAddr, HI_FAILURE);

    stDstSur.u32PhyAddr   = pDstImg->stCanvas.u32PhyAddr;
    stDstSur.u32Width     = pDstImg->stCanvas.u32Width;
    stDstSur.u32Height    = pDstImg->stCanvas.u32Height;
    stDstSur.u32Stride    = pDstImg->stCanvas.u32Pitch;
    stDstSur.bAlphaMax255 = HI_TRUE;
    stDstSur.bYCbCrClut   = HI_FALSE;
    stDstSur.enColorFmt   = HIFB_GFX2D_ConvFmt(pDstImg->stCanvas.enFmt);
    stDstSur.u8Alpha0     = pstOpt->stAlpha.u8Alpha0;
    stDstSur.u8Alpha1     = pstOpt->stAlpha.u8Alpha1;

    stDstRect.s32Xpos   = pDstImg->UpdateRect.x;
    stDstRect.s32Ypos   = pDstImg->UpdateRect.y;
    stDstRect.u32Width  = pDstImg->UpdateRect.w;
    stDstRect.u32Height = pDstImg->UpdateRect.h;

    stOpt.bResize = pstOpt->bScale;

    if (HIFB_GFX2D_IsColorFmtClut(stSrcSur.enColorFmt))
    {
        stOpt.bClutReload       = HI_TRUE;
        stSrcSur.pu8ClutPhyAddr = pstOpt->pu8CmapAddr;
        stDstSur.pu8ClutPhyAddr = pstOpt->pu8CmapAddr;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    enTdeDflkLevel = HIFB_BLIT_GetAntiflickerLevel(pstOpt->enAntiflickerLevel, &stOpt.enDeflickerMode);
    if (TDE_DEFLICKER_BUTT != enTdeDflkLevel)
    {
        Gfx2dExportFuncs->pfnTdeSetDeflickerLevel(enTdeDflkLevel);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (pstOpt->stCKey.bKeyEnable)
    {
        if (HIFB_GFX2D_IsColorFmtClut(stSrcSur.enColorFmt))
        {
            stOpt.enColorKeyMode = TDE2_COLORKEY_MODE_FOREGROUND;
            stOpt.unColorKeyValue.struCkClut.stAlpha.bCompIgnore = HI_TRUE;
            stOpt.unColorKeyValue.struCkClut.stClut.bCompOut     = pstOpt->stCKey.u32KeyMode;
            stOpt.unColorKeyValue.struCkClut.stClut.u8CompMax    = pstOpt->stCKey.u8BlueMax;
            stOpt.unColorKeyValue.struCkClut.stClut.u8CompMin    = pstOpt->stCKey.u8BlueMin;
            stOpt.unColorKeyValue.struCkClut.stClut.u8CompMask   = 0xff;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
        else
        {
            stOpt.enColorKeyMode = TDE2_COLORKEY_MODE_FOREGROUND;
            stOpt.unColorKeyValue.struCkARGB.stAlpha.bCompIgnore = HI_TRUE;
            stOpt.unColorKeyValue.struCkARGB.stRed.u8CompMax     = pstOpt->stCKey.u8RedMax;
            stOpt.unColorKeyValue.struCkARGB.stRed.u8CompMin     = pstOpt->stCKey.u8RedMin;
            stOpt.unColorKeyValue.struCkARGB.stRed.bCompOut      = pstOpt->stCKey.u32KeyMode;
            stOpt.unColorKeyValue.struCkARGB.stRed.u8CompMask    = 0xff;

            stOpt.unColorKeyValue.struCkARGB.stGreen.u8CompMax   = pstOpt->stCKey.u8GreenMax;
            stOpt.unColorKeyValue.struCkARGB.stGreen.u8CompMin   = pstOpt->stCKey.u8GreenMin;
            stOpt.unColorKeyValue.struCkARGB.stGreen.bCompOut    = pstOpt->stCKey.u32KeyMode;
            stOpt.unColorKeyValue.struCkARGB.stGreen.u8CompMask  = 0xff;

            stOpt.unColorKeyValue.struCkARGB.stBlue.u8CompMax    = pstOpt->stCKey.u8BlueMax;
            stOpt.unColorKeyValue.struCkARGB.stBlue.u8CompMin    = pstOpt->stCKey.u8BlueMin;
            stOpt.unColorKeyValue.struCkARGB.stBlue.bCompOut     = pstOpt->stCKey.u32KeyMode;
            stOpt.unColorKeyValue.struCkARGB.stBlue.u8CompMask   = 0xff;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
    }

    stOpt.u8GlobalAlpha = 255;

    if (pstOpt->stAlpha.bAlphaEnable)
    {
        stOpt.enAluCmd       = TDE2_ALUCMD_BLEND;
        stOpt.u8GlobalAlpha  = pstOpt->stAlpha.u8GlobalAlpha;
        stOpt.enOutAlphaFrom = TDE2_OUTALPHA_FROM_NORM;
        stOpt.stBlendOpt.bGlobalAlphaEnable = HI_TRUE;
        stOpt.stBlendOpt.bPixelAlphaEnable  = HI_TRUE;
        stOpt.stBlendOpt.bSrc1AlphaPremulti = HI_TRUE;
        stOpt.stBlendOpt.bSrc2AlphaPremulti = HI_TRUE;
        stOpt.stBlendOpt.eBlendCmd          = TDE2_BLENDCMD_SRC;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        stOpt.enOutAlphaFrom = TDE2_OUTALPHA_FROM_FOREGROUND;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    Ret = Gfx2dExportFuncs->pfnTdeEnableRegionDeflicker(pstOpt->bRegionDeflicker);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEnableRegionDeflicker, Ret);
        return Ret;
    }

    if (pstOpt->stClip.bClip)
    {
        stOpt.enClipMode = pstOpt->stClip.bInRegionClip ? TDE2_CLIPMODE_INSIDE : TDE2_CLIPMODE_OUTSIDE;
        stOpt.stClipRect.s32Xpos    = pstOpt->stClip.stClipRect.x;
        stOpt.stClipRect.s32Ypos    = pstOpt->stClip.stClipRect.y;
        stOpt.stClipRect.u32Width   = pstOpt->stClip.stClipRect.w;
        stOpt.stClipRect.u32Height  = pstOpt->stClip.stClipRect.h;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    DRV_HIFB_PrintBlitInfo(&stSrcSur, &stSrcRect, &stDstSur, &stDstRect, &stOpt);

    Ret = Gfx2dExportFuncs->pfnTdeBeginJob(&handle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeBeginJob, Ret);
        return Ret;
    }

    Ret = Gfx2dExportFuncs->pfnTdeBlit(handle, NULL, NULL, &stSrcSur, &stSrcRect, &stDstSur, &stDstRect, &stOpt);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeBlit, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(handle);
        return Ret;
    }

    if (pstOpt->bCallBack)
    {
        Ret = Gfx2dExportFuncs->pfnTdeEndJob(handle,           \
                                             pstOpt->bBlock,   \
                                             CONFIG_BLOCK_TIME,\
                                             HI_FALSE,         \
                                             (TDE_FUNC_CB)pstOpt->pfnCallBack,\
                                             pstOpt->pParam);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        Ret = Gfx2dExportFuncs->pfnTdeEndJob(handle,               \
                                                pstOpt->bBlock,    \
                                                CONFIG_BLOCK_TIME, \
                                                HI_FALSE,          \
                                                NULL,              \
                                                NULL);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEndJob, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(handle);
        return Ret;
    }

    if (pstOpt->bRegionDeflicker)
    {
        Ret = Gfx2dExportFuncs->pfnTdeEnableRegionDeflicker(HI_FALSE);
        if (HI_SUCCESS != Ret)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEnableRegionDeflicker, Ret);
            return Ret;
        }
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return handle;
}

static inline TDE_DEFLICKER_LEVEL_E HIFB_BLIT_GetAntiflickerLevel(HIFB_LAYER_ANTIFLICKER_LEVEL_E enAntiflickerLevel,TDE2_DEFLICKER_MODE_E *penDeflickerMode)
{
   switch (enAntiflickerLevel)
   {
       case HIFB_LAYER_ANTIFLICKER_NONE:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_NONE; }
           return TDE_DEFLICKER_BUTT;
       case HIFB_LAYER_ANTIFLICKER_LOW:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_BOTH; }
           return TDE_DEFLICKER_LOW;
       case HIFB_LAYER_ANTIFLICKER_MIDDLE:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_BOTH; }
           return TDE_DEFLICKER_MIDDLE;
       case HIFB_LAYER_ANTIFLICKER_HIGH:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_BOTH; }
           return TDE_DEFLICKER_HIGH;
       case HIFB_LAYER_ANTIFLICKER_AUTO:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_BOTH; }
           return TDE_DEFLICKER_AUTO;
       default:
           if (NULL != penDeflickerMode) { *penDeflickerMode = TDE2_DEFLICKER_MODE_NONE; }
           return TDE_DEFLICKER_BUTT;
   }
}

static HI_S32 DRV_HIFB_GFX2D_MbBlitEx(HIFB_BLIT_BUFFER_S *pSrcImg, HIFB_BLIT_BUFFER_S *pDstImg,  HIFB_BLIT_OPT_S *pstOpt)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_HANDLE BlitHandle = 0;
    TDE2_SURFACE_S stSrcSur = {0}, stDstSur = {0};
    TDE2_RECT_S stSrcRect = {0}, stDstRect = {0};
    TDE2_OPT_S stOpt = {0};
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pSrcImg, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pDstImg, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOpt, HI_FAILURE);

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, pSrcImg->stCanvas.YAddr,    HI_FAILURE);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, pSrcImg->stCanvas.CbCrAddr, HI_FAILURE);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, pDstImg->stCanvas.YAddr,    HI_FAILURE);

    HI_GFX_Memset(&stSrcSur, 0x0, sizeof(stSrcSur));
    stSrcSur.u32PhyAddr     = pSrcImg->stCanvas.YAddr;
    stSrcSur.u32CbCrPhyAddr = pSrcImg->stCanvas.CbCrAddr;
    stSrcSur.u32Width       = pSrcImg->stCanvas.Width;
    stSrcSur.u32Height      = pSrcImg->stCanvas.Height;
    stSrcSur.u32Stride      = pSrcImg->stCanvas.YStride;
    stSrcSur.u32CbCrStride  = pSrcImg->stCanvas.CbCrStride;
    stSrcSur.enColorFmt     = HIFB_GFX2D_ConvFmt(pSrcImg->stCanvas.enFmt);
    stSrcSur.bAlphaMax255   = HI_TRUE;

    stSrcRect.s32Xpos    = pSrcImg->UpdateRect.x;
    stSrcRect.s32Ypos    = pSrcImg->UpdateRect.y;
    stSrcRect.u32Width   = pSrcImg->UpdateRect.w;
    stSrcRect.u32Height  = pSrcImg->UpdateRect.h;


    HI_GFX_Memset(&stDstSur, 0x0, sizeof(stDstSur));
    stDstSur.u32PhyAddr = pDstImg->stCanvas.YAddr;
    stDstSur.u32Width   = pDstImg->stCanvas.Width;
    stDstSur.u32Height  = pDstImg->stCanvas.Height;
    stDstSur.u32Stride  = pDstImg->stCanvas.YStride;
    stDstSur.enColorFmt = HIFB_GFX2D_ConvFmt(pDstImg->stCanvas.enFmt);
    stDstSur.bAlphaMax255 = HI_TRUE;

    stDstRect.s32Xpos   = pDstImg->UpdateRect.x;
    stDstRect.s32Ypos   = pDstImg->UpdateRect.y;
    stDstRect.u32Width  = pDstImg->UpdateRect.w;
    stDstRect.u32Height = pDstImg->UpdateRect.h;

    HI_GFX_Memset(&stOpt, 0x0, sizeof(stOpt));
    stOpt.bResize = pstOpt->bScale;

    DRV_HIFB_PrintBlitInfo(&stSrcSur, &stSrcRect, &stDstSur, &stDstRect, &stOpt);

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeBeginJob,     HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeSingleBlitEx, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeEndJob,       HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeCancelJob,    HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeBeginJob(&BlitHandle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeBeginJob, Ret);
        return Ret;
    }

#ifdef CONFIG_GFX_MMU_SUPPORT
    Ret = Gfx2dExportFuncs->pfnTdeSingleBlitEx(BlitHandle, &stSrcSur, &stSrcRect, &stDstSur, &stDstRect, &stOpt, HI_TRUE, HI_FALSE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
#else
    Ret = Gfx2dExportFuncs->pfnTdeSingleBlitEx(BlitHandle, &stSrcSur, &stSrcRect, &stDstSur, &stDstRect, &stOpt, HI_TRUE, HI_TRUE);
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
#endif
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeSingleBlitEx, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(BlitHandle);
        return Ret;
    }

    Ret = Gfx2dExportFuncs->pfnTdeEndJob(BlitHandle, HI_TRUE, 100, HI_FALSE, NULL, NULL);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEndJob, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(BlitHandle);
        return Ret;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return BlitHandle;
}

/***************************************************************************************
* func         : DRV_HIFB_GFX2D_ClearRect
* description  : CNcomment:清surface CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_GFX2D_ClearRect(HIFB_SURFACE_S* pDstImg, HIFB_BLIT_OPT_S* pstOpt)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE2_SURFACE_S TDESurface = {0};
    TDE2_RECT_S Rect = {0};
    TDE_HANDLE s32Handle = 0;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOpt, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pDstImg, HI_FAILURE);

    /** confing dst*/
    TDESurface.u32PhyAddr    = pDstImg->u32PhyAddr;
    TDESurface.u32Width      = pDstImg->u32Width;
    TDESurface.u32Height     = pDstImg->u32Height;
    TDESurface.u32Stride     = pDstImg->u32Pitch;
    TDESurface.bAlphaMax255  = HI_TRUE;
    TDESurface.bYCbCrClut    = HI_FALSE;
    TDESurface.enColorFmt    = HIFB_GFX2D_ConvFmt(pDstImg->enFmt);
    TDESurface.u8Alpha0      = pstOpt->stAlpha.u8Alpha0;
    TDESurface.u8Alpha1      = pstOpt->stAlpha.u8Alpha1;

    Rect.s32Xpos  = 0;
    Rect.s32Ypos  = 0;
    Rect.u32Width = pDstImg->u32Width;
    Rect.u32Height = pDstImg->u32Height;

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeBeginJob, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeQuickFill, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeEndJob, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeCancelJob, HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeBeginJob(&s32Handle);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeBeginJob, Ret);
        return Ret;
    }

    Ret = Gfx2dExportFuncs->pfnTdeQuickFill(s32Handle, &TDESurface, &Rect, 0x0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeQuickFill, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(s32Handle);
        return Ret;
    }

    Ret = Gfx2dExportFuncs->pfnTdeEndJob(s32Handle, pstOpt->bBlock, 100, HI_FALSE, NULL, NULL);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeEndJob, Ret);
        Gfx2dExportFuncs->pfnTdeCancelJob(s32Handle);
        return Ret;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return s32Handle;
}

static HI_S32 DRV_HIFB_GFX2D_WaitAllDone(HI_BOOL bSync)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeWaitAllDone, HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeWaitAllDone(bSync);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeWaitAllDone, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_GFX2D_CalScaleRect
* description  : CNcomment: 计算缩放更新区域 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_GFX2D_CalScaleRect(const TDE2_RECT_S* pstSrcRect, const TDE2_RECT_S* pstDstRect,
                                          TDE2_RECT_S* pstRectInSrc, TDE2_RECT_S* pstRectInDst)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstSrcRect, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDstRect, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstRectInSrc, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstRectInDst, HI_FAILURE);
    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeCalScaleRect, HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeCalScaleRect(pstSrcRect, pstDstRect, pstRectInSrc, pstRectInDst);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeCalScaleRect, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GFX2D_WaitForDone(TDE_HANDLE s32Handle, HI_U32 u32TimeOut)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Gfx2dExportFuncs->pfnTdeWaitForDone, HI_FAILURE);

    Ret = Gfx2dExportFuncs->pfnTdeWaitForDone(s32Handle, u32TimeOut);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeWaitForDone, Ret);
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_S32 DRV_HIFB_GFX2D_Open(HI_VOID)
{
    HI_S32 Ret = HI_FAILURE;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    DRV_HIFB_GET_GFX2D_EXPORTFUNCS(Gfx2dExportFuncs);
    if (NULL != Gfx2dExportFuncs->pfnTdeOpen) { Ret = Gfx2dExportFuncs->pfnTdeOpen(); }
    if (Ret < 0)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnTdeOpen, Ret);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}


static HI_VOID DRV_HIFB_GFX2D_Close(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    TDE_EXPORT_FUNC_S *Gfx2dExportFuncs = NULL;

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_TDE, (HI_VOID**)&Gfx2dExportFuncs);
    if (HI_SUCCESS != Ret) { HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret); return; }

    if ((NULL != Gfx2dExportFuncs) && (NULL != Gfx2dExportFuncs->pfnTdeClose)) { Gfx2dExportFuncs->pfnTdeClose(); }

    return;
}


HI_VOID DRV_HIFB_GFX2D_GetCallBackFunction(HIFB_DRV_TDEOPS_S *Gfx2dCallBackFunction)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (NULL != Gfx2dCallBackFunction)
    {
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_Open         = DRV_HIFB_GFX2D_Open;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_Close        = DRV_HIFB_GFX2D_Close;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_QuickCopy    = DRV_HIFB_GFX2D_QuickCopy;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_Blit         = DRV_HIFB_GFX2D_Blit;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_MbBlitEx     = DRV_HIFB_GFX2D_MbBlitEx;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_CalScaleRect = DRV_HIFB_GFX2D_CalScaleRect;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_ClearRect    = DRV_HIFB_GFX2D_ClearRect;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_SupportFmt   = DRV_HIFB_GFX2D_SupportFmt;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_WaitAllDone  = DRV_HIFB_GFX2D_WaitAllDone;
        Gfx2dCallBackFunction->DRV_HIFB_GFX2D_WaitForDone  = DRV_HIFB_GFX2D_WaitForDone;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID DRV_HIFB_PrintBlitInfo(TDE2_SURFACE_S *pSrcSurface, TDE2_RECT_S *pstSrcRect, TDE2_SURFACE_S *pDstSurface, TDE2_RECT_S *pstDstRect, TDE2_OPT_S *pstOpt)
{
    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    if (NULL != pstSrcRect)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstSrcRect->s32Xpos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstSrcRect->s32Ypos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcRect->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstSrcRect->u32Height);
    }

    if (NULL != pSrcSurface)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pSrcSurface->u32PhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pSrcSurface->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pSrcSurface->u32Height);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pSrcSurface->u32Stride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pSrcSurface->u32CbCrPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pSrcSurface->u32CbCrStride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pSrcSurface->enColorFmt);
    }

    if (NULL != pstDstRect)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstDstRect->s32Xpos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstDstRect->s32Ypos);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDstRect->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDstRect->u32Height);
    }

    if (NULL != pDstSurface)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pDstSurface->u32PhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pDstSurface->u32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pDstSurface->u32Height);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pDstSurface->u32Stride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pDstSurface->u32CbCrPhyAddr);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pDstSurface->u32CbCrStride);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pDstSurface->enColorFmt);
    }

    if (NULL != pstOpt)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstOpt->bResize);
    }

    HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "==========================================================");
    return;
}
