/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_adp.c
Version         : Initial Draft
Author          : sdk
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                Author                  Modification
2018/01/01           sdk                    Created file
***************************************************************************************************/


/***************************** add include here****************************************************/
#ifdef HI_BUILD_IN_BOOT
#include "hifb_debug.h"
#include "hi_drv_pq.h"
#include "hi_gfx_mem.h"
#endif

#include "drv_disp_ext.h"
#include "drv_hifb_hal.h"
#include "drv_hifb_adp.h"
#include "hi_drv_disp.h"
#include "drv_hifb_wbc.h"

#ifndef HI_BUILD_IN_BOOT
#include "drv_pq_ext.h"
#endif

#ifdef CONFIG_GFX_PROC_SUPPORT
#include "drv_hifb_proc.h"
#endif

#include "drv_hifb_config.h"
#include "drv_hifb_common.h"

#ifdef CONFIG_HIFB_VERSION_1_0
#include "optm_alg_csc.h"
#include "optm_alg_gzme.h"
#include "optm_alg_gsharp.h"
#endif

#ifdef HI_BUILD_IN_BOOT
#include "hi_gfx_debug.h"
#include "hi_gfx_mem.h"
#else
#include "drv_hifb_debug.h"
#include "drv_hifb_ut.h"
#endif

/***************************** Macro Definition ***************************************************/
#ifndef HI_BUILD_IN_BOOT
static DISP_EXPORT_FUNC_S *ps_DispExportFuncs = NULL;
#endif

#define CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH     4096
#define CONFIG_GFX_DISP_4K_VIRTUAL_WIDTH           3840
#define CONFIG_GFX_DISP_4K_VIRTUAL_HEIGHT          2160
#define OPTM_EXTRACTLINE_RATIO                     4

#ifdef CONFIG_HIFB_VERSION_1_0
#define OPTM_CURSOR_LAYERID                        HIFB_LAYER_SD_1
#else
#define OPTM_CURSOR_LAYERID                        HIFB_LAYER_HD_2
#endif

#define OPTM_GP_SUPPORT_MAXLAYERNUM                5
#define OPTM_GP0_GFX_COUNT                         CONFIG_HIFB_GP0_SUPPORT_GFX_COUNT
#define OPTM_GP1_GFX_COUNT                         CONFIG_HIFB_GP1_SUPPORT_GFX_COUNT

#define HIFB_CHECK_LAYER_OPEN(enLayerId)  \
        do{\
            if (enLayerId >= HIFB_LAYER_ID_BUTT)\
            {\
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enLayerId);\
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support layer id");\
                return HI_FAILURE;\
            }\
            if (HI_TRUE != g_pstGfxDevice[enLayerId]->bOpened)\
            {\
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enLayerId);\
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this layer has not been open");\
                return HI_FAILURE;\
            }\
         }while(0)

#define HIFB_CHECK_GP_OPEN(enGpId)  \
        do{\
            if (enGpId >= HIFB_ADP_GP_BUTT)\
            {\
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enGpId);\
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support this gp id");\
                return HI_FAILURE;\
            }\
            if (HI_TRUE != g_pstGfxGPDevice[enGpId]->bOpen)\
            {\
                HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enGpId);\
                HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this gp has not been open");\
                return HI_FAILURE;\
            }\
        }while(0)

#ifndef HI_BUILD_IN_BOOT
#define STATIC static
#else
#define STATIC
#endif
/***************************** Structure Definition ***********************************************/
typedef struct tagOPTM_GFX_IRQ_S
{
    HI_VOID* pParam0;   /** layer id      **/
    HI_U32   u32Param1;
    IntCallBack pFunc;  /** irq function **/
#ifndef HI_BUILD_IN_BOOT
    spinlock_t FuncLock;
#endif
}OPTM_GFX_IRQ_S;

typedef struct tagOPTM_GFX_CALLBACK_S
{
    HI_U32 u32CTypeFlag;
    OPTM_GFX_IRQ_S stGfxIrq[HIFB_CALLBACK_TYPE_BUTT];
}OPTM_GFX_CALLBACK_S;

typedef struct tagOPTM_GP_IRQ_S
{
    HI_BOOL bRegistered[HI_DRV_DISP_C_TYPE_BUTT];
    OPTM_GFX_CALLBACK_S stGfxCallBack[OPTM_GP_SUPPORT_MAXLAYERNUM];
}OPTM_GP_IRQ_S;

/***************************** Global Variable declaration ****************************************/
static volatile HI_U32 *gs_Phyaddr = NULL;

#ifndef CONFIG_GFX_PQ
static OPTM_ALG_GZME_MEM_S gs_stGPZme;
#endif

HIFB_GFX_MODE_EN g_enOptmGfxWorkMode = HIFB_GFX_MODE_NORMAL;

OPTM_GFX_GP_S *g_pstGfxGPDevice[HIFB_ADP_GP_BUTT] = {NULL};
OPTM_GFX_LAYER_S *g_pstGfxDevice[HIFB_LAYER_ID_BUTT] = {NULL};
HIFB_CAPABILITY_S *g_pstGfxCap[HIFB_LAYER_ID_BUTT] = {NULL};

static OPTM_GP_IRQ_S *g_pstGfxGPIrq[HIFB_ADP_GP_BUTT] = {NULL};
extern DRV_HIFB_WBC_GFX_S g_stGfxWbc2;

#ifndef HI_BUILD_IN_BOOT
static PQ_EXPORT_FUNC_S* gs_pstPqFuncs = NULL;
static HIFB_LAYER_ID_E gs_CallBackLayerId[HIFB_LAYER_ID_BUTT];
#endif

/***************************** API forward declarations *******************************************/
#ifndef HI_BUILD_IN_BOOT
static HI_VOID OPTM_GfxWVBCallBack(HI_U32 enLayerId);
#endif

#ifndef HI_BUILD_IN_BOOT
static HI_S32 HIFB_ADP_DispInfoUpdate(HIFB_GP_ID_E enGPId);
static HI_S32  HIFB_ADP_DistributeCallback(HI_VOID* u32Param0, HI_VOID* u32Param1);
static HI_VOID DRV_HIFB_ADP_FrameEndCallBack (HI_VOID* u32Param0, HI_VOID* u32Param1);
#endif

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_STEREO_SUPPORT)
static HI_S32 DRV_HIFB_ADP_SetStereoDepth(HIFB_LAYER_ID_E enLayerId, HI_S32 s32Depth);
#endif

static HI_S32 HIFB_ADP_GP_Recovery(HIFB_GP_ID_E enGPId);
static HI_S32 HIFB_ADP_SetGpCsc(HIFB_GP_ID_E enGfxGpId, HI_BOOL bIsBGRIn);

#ifndef CONFIG_GFX_PQ
static OPTM_COLOR_SPACE_E DRV_HIFB_ADP_GetCscTypeFromDisp(HI_DRV_COLOR_SPACE_E enHiDrvCsc);
#else
static HI_PQ_GFX_COLOR_SPACE_E DRV_HIFB_ADP_GetCscTypeFromDisp(HI_DRV_COLOR_SPACE_E enHiDrvCsc);
#endif

static inline OPTM_VDP_GFX_IFMT_E OPTM_ClutPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt);
static inline OPTM_VDP_GFX_IFMT_E OPTM_RGBPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt);
static inline OPTM_VDP_GFX_IFMT_E OPTM_XRGBPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt);
static inline OPTM_VDP_GFX_IFMT_E OPTM_XYCbCrPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt);

#ifndef HI_BUILD_IN_BOOT
static inline HIFB_COLOR_FMT_E OPTM_ClutHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt);
static inline HIFB_COLOR_FMT_E OPTM_RGBHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt);
static inline HIFB_COLOR_FMT_E OPTM_XRGBHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt);
static inline HIFB_COLOR_FMT_E OPTM_XYCbCrHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt);
static inline HI_VOID HIFB_ADP_ReOpen           (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
static inline HI_VOID HIFB_ADP_ReClose          (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
static inline HI_VOID HIFB_ADP_DispSetting      (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
static inline HI_VOID HIFB_ADP_UpdataLayerInfo  (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
#endif

static inline HI_VOID HIFB_ADP_ResetLayerInRect(HIFB_GP_ID_E enGpId);

#ifndef CONFIG_GFX_PQ
static inline HI_VOID HIFB_ADP_SetZme(HIFB_GP_ID_E enGpId, HI_BOOL bGfxSharpen, OPTM_ALG_GZME_RTL_PARA_S *pstZmeRtlPara, OPTM_ALG_GDTI_RTL_PARA_S *pstDtiRtlPara);
#endif

static inline HI_S32 HIFB_ADP_SetLayerDataBigEndianFmt(HIFB_LAYER_ID_E enLayerId);
static inline HI_S32 HIFB_ADP_SetLayerDataLittleEndianFmt(HIFB_LAYER_ID_E enLayerId);

/***************************** API realization ****************************************************/
/***************************************************************************************
* func        : HIFB_PARA_CHECK_SUPPORT
* description : CNcomment: 判断输入参数是否支持 CNend\n
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 HIFB_PARA_CHECK_SUPPORT(HI_U32 Mask, HI_U32 Width, HI_U32 Height, HI_U32 Stride, HI_U32 Fmt, HI_U32 BitsPerPixel)
{
    HI_UNUSED(Fmt);
    if ((Mask & HIFB_PARA_CHECK_WIDTH) && ((Width > CONFIG_HIFB_LAYER_MAXWIDTH) || (Width < CONFIG_HIFB_LAYER_MINWIDTH)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MAXWIDTH);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MINWIDTH);
        return HI_FAILURE;
    }

    if ((Mask & HIFB_PARA_CHECK_HEIGHT) && ((Height > CONFIG_HIFB_LAYER_MAXHEIGHT) || (Height < CONFIG_HIFB_LAYER_MINHEIGHT)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Height);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MAXHEIGHT);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MINHEIGHT);
        return HI_FAILURE;
    }

    if ((Mask & HIFB_PARA_CHECK_STRIDE) && ((Stride > CONFIG_HIFB_LAYER_MAXSTRIDE) || (Stride <= CONFIG_HIFB_LAYER_MINSTRIDE)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, Stride);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MAXSTRIDE);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_MINSTRIDE);
        return HI_FAILURE;
    }

    if ((Mask & HIFB_PARA_CHECK_BITSPERPIXEL) && (BitsPerPixel > CONFIG_HIFB_LAYER_BITSPERPIX))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, BitsPerPixel);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_HIFB_LAYER_BITSPERPIX);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

#ifndef HI_BUILD_IN_BOOT
static HI_U32 HIFB_ADP_Align(const HI_U32 x, const HI_U32 a)
{
    return (0 == a) ? (x) : ( (( x + (a - 1) ) / a ) * a);
}
#else
extern HI_S32 GfxWinReviseOutRect(const HI_RECT_S *tmp_virtscreen,
                                  const HI_DRV_DISP_OFFSET_S *stOffsetInfo,
                                  const HI_RECT_S *stFmtResolution,
                                  const HI_RECT_S *stPixelFmtResolution,
                                  HI_RECT_S *stToBeRevisedRect,
                                  HI_RECT_S *stRevisedRect);

/***************************************************************************************
* func         : DRV_HIFB_ADP_LOGO_InitGpFromDisp
* description  : CNcomment: 初始化参数，参数来源于display  CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_LOGO_InitGpFromDisp(HIFB_GP_ID_E enGPId, HI_BOOL Support4KLogo)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_DRV_DISPLAY_E enDisp = HI_DRV_DISPLAY_0;
    HI_DISP_DISPLAY_INFO_S stInfo;
#ifndef CONFIG_GFX_PQ
    OPTM_COLOR_SPACE_E enGpCsc = OPTM_CS_BT709_YUV_LIMITED;
#else
    HI_PQ_GFX_COLOR_SPACE_E enGpCsc = PQ_GFX_CS_BUTT;
#endif

    HIFB_CHECK_GP_OPEN(enGPId);
    enDisp = (enGPId == HIFB_ADP_GP0) ? (HI_DRV_DISPLAY_1) : (HI_DRV_DISPLAY_0);

    HI_GFX_Memset(&stInfo, 0, sizeof(stInfo));
    Ret = HI_DISP_GetDisplayInfo(enDisp, &stInfo);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DISP_GetDisplayInfo, Ret);
       return HI_FAILURE;
    }

    g_pstGfxGPDevice[enGPId]->bInterface = stInfo.bInterlace;

    GfxWinReviseOutRect(&stInfo.stVirtaulScreen, &stInfo.stOffsetInfo, &stInfo.stFmtResolution,
                        &stInfo.stPixelFmtResolution, &stInfo.stVirtaulScreen, &g_pstGfxGPDevice[enGPId]->stOutRect);

    if ((HIFB_ADP_GP0 == enGPId) && (HI_TRUE == Support4KLogo))
    {
        g_pstGfxGPDevice[enGPId]->stOutRect.s32X      = 0;
        g_pstGfxGPDevice[enGPId]->stOutRect.s32Y      = 0;
        g_pstGfxGPDevice[enGPId]->stOutRect.s32Width  = stInfo.stFmtResolution.s32Width;
        g_pstGfxGPDevice[enGPId]->stOutRect.s32Height = stInfo.stFmtResolution.s32Height;
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HI_TRUE == stInfo.bIsMaster) && (HIFB_ADP_GP0 == enGPId))
    {
        g_enOptmGfxWorkMode = HIFB_GFX_MODE_HD_WBC;
    }
#endif

    HIFB_ADP_GP_Recovery(enGPId);

#ifndef CONFIG_GFX_PQ
    enGpCsc = DRV_HIFB_ADP_GetCscTypeFromDisp(stInfo.eColorSpace);
#else
    enGpCsc = DRV_HIFB_ADP_GetCscTypeFromDisp(stInfo.eColorSpace);
#endif

    g_pstGfxGPDevice[enGPId]->enOutputCsc = enGpCsc;
    HIFB_ADP_SetGpCsc(enGPId, g_pstGfxGPDevice[enGPId]->bBGRState);

    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_ADP_GetDevCap
* description  : CNcomment: 获取图层能力级 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_VOID DRV_HIFB_ADP_GetDevCap(const HIFB_CAPABILITY_S **pstCap)
{
    if ((NULL != pstCap) && (NULL != g_pstGfxCap[0]))
    {
        *pstCap = g_pstGfxCap[0];
    }

    return;
}

/***************************************************************************************
* func         : GFXCAPABILITY_Init
* description  : CNcomment: 图层能力级 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_S32 GFXCAPABILITY_Init(HI_VOID)
{
    HI_S32 Index = 0;
    HIFB_CAPABILITY_S stHdGfxCap = {
                  .bKeyAlpha       = 1,
                  .bGlobalAlpha    = 1,
                  .bCmap           = 1,
                  .bHasCmapReg     = 1,
                  .bColFmt         = {1,1,0,0,     \
                                      0,0,1,1,     \
                                      0,0,0,0,     \
                                      0,1,1,0,     \
                                      1,1,0,0,     \
                                      0,0,1,1,     \
                                      1,1,1,1,     \
                                      0,0,0,0,     \
                                      0,0},
                  .bVoScale        = HI_TRUE,
                  .bLayerSupported = CONFIG_HIFB_HD0_LAYER_SUPPORT,
                  .bCompression    = HI_FALSE,
                  .bStereo         = 1,
                  .u32MaxWidth     = CONFIG_HIFB_LAYER_MAXWIDTH,
                  .u32MaxHeight    = CONFIG_HIFB_LAYER_MAXHEIGHT,
                  .u32MaxStride    = CONFIG_HIFB_LAYER_MAXSTRIDE,
                  .u32MaxSize      = CONFIG_HIFB_LAYER_MAXSIZE,
                  .u32MinWidth     = CONFIG_HIFB_LAYER_MINWIDTH,
                  .u32MinHeight    = CONFIG_HIFB_LAYER_MINHEIGHT,
                  .u32MinStride    = CONFIG_HIFB_LAYER_MINSTRIDE,
                  .u32MinSize      = CONFIG_HIFB_LAYER_MINSIZE,
                  .u32VDefLevel    = 0,
                  .u32HDefLevel    = 0,
              };

    for (Index = 0; Index < HIFB_LAYER_ID_BUTT; Index++)
    {
        HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxCap[Index], HI_FAILURE);
        HI_GFX_Memcpy(g_pstGfxCap[Index], &stHdGfxCap, sizeof(HIFB_CAPABILITY_S));
    }

    g_pstGfxCap[1]->bLayerSupported = CONFIG_HIFB_HD1_LAYER_SUPPORT;
    g_pstGfxCap[2]->bLayerSupported = CONFIG_HIFB_HD2_LAYER_SUPPORT;
    g_pstGfxCap[3]->bLayerSupported = CONFIG_HIFB_HD3_LAYER_SUPPORT;
    g_pstGfxCap[4]->bLayerSupported = CONFIG_HIFB_SD0_LAYER_SUPPORT;
    g_pstGfxCap[5]->bLayerSupported = CONFIG_HIFB_SD1_LAYER_SUPPORT;

    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_ADP_GetGfxHalId
* description  : CNcomment: hifb ID 转换成 图层ID，配寄存器使用 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static OPTM_VDP_LAYER_GFX_E HIFB_ADP_GetGfxHalId(HIFB_LAYER_ID_E LayerId)
{
#if defined(CONFIG_HIFB_VERSION_1_0) || defined(CONFIG_HIFB_VERSION_2_0)
    switch (LayerId)
    {
        case HIFB_LAYER_HD_0:
            return OPTM_VDP_LAYER_GFX0;
        case HIFB_LAYER_HD_1:
            return OPTM_VDP_LAYER_GFX1;
        case HIFB_LAYER_HD_2:
            return OPTM_VDP_LAYER_GFX2;
        case HIFB_LAYER_HD_3:
            return OPTM_VDP_LAYER_GFX3;
        case HIFB_LAYER_SD_0:
            return OPTM_VDP_LAYER_GFX4;
        case HIFB_LAYER_SD_1:
            return OPTM_VDP_LAYER_GFX5;
        default:
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, OPTM_VDP_LAYER_GFX_BUTT);
            return OPTM_VDP_LAYER_GFX_BUTT;
    }
#elif defined(CONFIG_HIFB_VERSION_3_0)
    switch (LayerId)
    {
        case HIFB_LAYER_HD_0:
            return OPTM_VDP_LAYER_GFX0;/**match to g0 register **/
        case HIFB_LAYER_HD_1:
            return OPTM_VDP_LAYER_GFX2;/**match to g3 register **/
        case HIFB_LAYER_SD_0:
            return OPTM_VDP_LAYER_GFX1;/**match to g1 register **/
        default:
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, OPTM_VDP_LAYER_GFX_BUTT);
            return OPTM_VDP_LAYER_GFX_BUTT;
    }
#else
    switch (LayerId)
    {
        case HIFB_LAYER_HD_0:
            return OPTM_VDP_LAYER_GFX0;
        case HIFB_LAYER_HD_1:
            return OPTM_VDP_LAYER_GFX1;
        case HIFB_LAYER_HD_2:
            return OPTM_VDP_LAYER_GFX3;
        case HIFB_LAYER_SD_0:
            return OPTM_VDP_LAYER_GFX4;
        case HIFB_LAYER_SD_1:
            return OPTM_VDP_LAYER_GFX5;
        default:
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, OPTM_VDP_LAYER_GFX_BUTT);
            return OPTM_VDP_LAYER_GFX_BUTT;
    }
#endif
}

/***************************************************************************************
* func          : HIFB_ADP_GetGpId
* description   : CNcomment: 将layer id 转换成 GP ID CNend\n
* param[in]     : LayerId
* retval        : NA
* others:       : NA
***************************************************************************************/
static HIFB_GP_ID_E HIFB_ADP_GetGpId(HIFB_LAYER_ID_E LayerId)
{
    if (LayerId <= HIFB_LAYER_HD_3)
    {
        return HIFB_ADP_GP0;
    }

    if ((LayerId >= HIFB_LAYER_SD_0) && (LayerId <= HIFB_LAYER_SD_1))
    {
        return HIFB_ADP_GP1;
    }

    return HIFB_ADP_GP_BUTT;
}

/***************************************************************************************
* func          : HIFB_ADP_GetGpHalId
* description   : CNcomment: 将Gp id 转换成 GP 硬件 ID CNend\n
* param[in]     : LayerId
* retval        : NA
* others:       : NA
***************************************************************************************/
static OPTM_VDP_LAYER_GP_E HIFB_ADP_GetGpHalId(HIFB_GP_ID_E GpId)
{
    if (HIFB_ADP_GP0 == GpId)
    {
        return OPTM_VDP_LAYER_GP0;
    }

    if (HIFB_ADP_GP1 == GpId)
    {
        return OPTM_VDP_LAYER_GP1;
    }

    return OPTM_VDP_LAYER_GP_BUTT;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GetCscTypeFromDisp
* description  : CNcomment: 从disp中获取CSC类型 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
#ifndef CONFIG_GFX_PQ
static OPTM_COLOR_SPACE_E DRV_HIFB_ADP_GetCscTypeFromDisp(HI_DRV_COLOR_SPACE_E enHiDrvCsc)
{
    switch (enHiDrvCsc)
    {
        case HI_DRV_CS_BT601_YUV_LIMITED:
            return OPTM_CS_BT601_YUV_LIMITED;
        case HI_DRV_CS_BT601_YUV_FULL:
            return OPTM_CS_BT601_YUV_FULL;
        case HI_DRV_CS_BT601_RGB_FULL:
            return OPTM_CS_BT601_RGB_FULL;
        case HI_DRV_CS_BT709_YUV_LIMITED:
            return OPTM_CS_BT709_YUV_LIMITED;
        case HI_DRV_CS_BT709_YUV_FULL:
            return OPTM_CS_BT709_YUV_FULL;
        case HI_DRV_CS_BT709_RGB_FULL:
            return OPTM_CS_BT709_RGB_FULL;
        default:
            return OPTM_CS_BUTT;
    }
}
#else
static HI_PQ_GFX_COLOR_SPACE_E DRV_HIFB_ADP_GetCscTypeFromDisp(HI_DRV_COLOR_SPACE_E enHiDrvCsc)
{
    switch (enHiDrvCsc)
    {
        case HI_DRV_CS_BT601_YUV_LIMITED:
            return PQ_GFX_CS_BT601_YUV_LIMITED;
        case HI_DRV_CS_BT601_YUV_FULL:
            return PQ_GFX_CS_BT601_YUV_FULL;
        case HI_DRV_CS_BT601_RGB_FULL:
            return PQ_GFX_CS_BT601_RGB_FULL;
        case HI_DRV_CS_BT709_YUV_LIMITED:
            return PQ_GFX_CS_BT709_YUV_LIMITED;
        case HI_DRV_CS_BT709_YUV_FULL:
            return PQ_GFX_CS_BT709_YUV_FULL;
        case HI_DRV_CS_BT709_RGB_FULL:
            return PQ_GFX_CS_BT709_RGB_FULL;
        case  HI_DRV_CS_BT2020_YUV_LIMITED:
            return PQ_GFX_CS_BT2020_YUV_LIMITED;
        case HI_DRV_CS_BT2020_YUV_FULL:
            return PQ_GFX_CS_BT2020_YUV_LIMITED;
        case HI_DRV_CS_BT2020_RGB_LIMITED:
            return PQ_GFX_CS_BT2020_RGB_FULL;
        case HI_DRV_CS_BT2020_RGB_FULL:
            return PQ_GFX_CS_BT2020_RGB_FULL;
        default:
            return PQ_GFX_CS_BUTT;
    }
}
#endif

#ifdef CONFIG_HIFB_STEREO_SUPPORT
/***************************************************************************************
* func        : HIFB_ADP_GetStereoModeFromDisp
* description : CNcomment: 从disp中获取3D模式 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HIFB_STEREO_MODE_E HIFB_ADP_GetStereoModeFromDisp(OPTM_VDP_DISP_MODE_E enDispStereo)
{
    switch (enDispStereo)
    {
        case VDP_DISP_MODE_2D:
            return HIFB_STEREO_MONO;
        case VDP_DISP_MODE_SBS:
            return HIFB_STEREO_SIDEBYSIDE_HALF;
        case VDP_DISP_MODE_TAB:
            return HIFB_STEREO_TOPANDBOTTOM;
        case VDP_DISP_MODE_FP:
            return HIFB_STEREO_FRMPACKING;
        default:
            return HIFB_STEREO_BUTT;
    }
}
#endif

/***************************************************************************************
* func        : HIFB_ADP_InitVdpReg
* description : CNcomment: vdp register inital  CNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_S32 HIFB_ADP_InitVdpReg(HI_VOID)
{
#ifdef HI_BUILD_IN_BOOT
    gs_Phyaddr = (volatile HI_U32*)(CONFIG_VDP_REG_BASEADDR);
#else
    gs_Phyaddr = (volatile HI_U32*)HI_GFX_REG_MAP(CONFIG_VDP_REG_BASEADDR, CONFIG_VDP_SIZE);
    if (NULL == gs_Phyaddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_XINT, CONFIG_VDP_REG_BASEADDR);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CONFIG_VDP_SIZE);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_REG_MAP, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif

    DRV_HIFB_HAL_VDP_Initial(gs_Phyaddr);

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_ADP_DeInitVdpReg
* description : CNcomment: vdp register dinital  CNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID HIFB_ADP_DeInitVdpReg(HI_VOID)
{
#ifndef HI_BUILD_IN_BOOT
    if (NULL != gs_Phyaddr)
    {
        HI_GFX_REG_UNMAP((HI_VOID*)gs_Phyaddr);
    }
#endif
    gs_Phyaddr = NULL;
    return;
}

/***************************************************************************************
* func        : HIFB_ADP_InitGpIrq
* description : CNcomment: GP IRQ inital  CNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_S32 HIFB_ADP_InitGpIrq(HI_VOID)
{
    HI_S32 Index = 0;

#ifdef HI_BUILD_IN_BOOT
    g_pstGfxGPIrq[0] = (OPTM_GP_IRQ_S*)HI_GFX_Malloc(sizeof(OPTM_GP_IRQ_S) * HIFB_ADP_GP_BUTT, "gp_irq");
    if (NULL == g_pstGfxGPIrq[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }
#else
    g_pstGfxGPIrq[0] = (OPTM_GP_IRQ_S*)HI_GFX_VMALLOC(HIGFX_FB_ID, sizeof(OPTM_GP_IRQ_S) * HIFB_ADP_GP_BUTT);
    if (NULL == g_pstGfxGPIrq[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_VMALLOC, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif

    for (Index = 0; Index < HIFB_ADP_GP_BUTT; Index++)
    {
        g_pstGfxGPIrq[Index] = (OPTM_GP_IRQ_S*)((HI_VOID*)g_pstGfxGPIrq[0] + Index * sizeof(OPTM_GP_IRQ_S));
        HI_GFX_Memset(g_pstGfxGPIrq[Index], 0, sizeof(OPTM_GP_IRQ_S));
    }

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_ADP_DeInitGpIrq
* description : CNcomment: GP IRQ dinital  CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID HIFB_ADP_DeInitGpIrq(HI_VOID)
{
#ifdef HI_BUILD_IN_BOOT
    if (NULL != g_pstGfxGPIrq[0])
    {
        HI_GFX_Free((HI_VOID*)g_pstGfxGPIrq[0]);
    }
#else
    if (NULL != g_pstGfxGPIrq[0])
    {
        HI_GFX_VFREE(HIGFX_FB_ID, (HI_VOID*)g_pstGfxGPIrq[0]);
    }
#endif
    g_pstGfxGPIrq[0] = NULL;
    return;
}

/***************************************************************************************
* func        : HIFB_ADP_InitGpDev
* description : CNcomment: GP Device inital  CNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_S32 HIFB_ADP_InitGpDev(HI_VOID)
{
    HI_S32 Index = 0;

#ifdef HI_BUILD_IN_BOOT
    g_pstGfxGPDevice[0] = (OPTM_GFX_GP_S*)HI_GFX_Malloc(sizeof(OPTM_GFX_GP_S) * HIFB_ADP_GP_BUTT, "gp_dev");
    if (NULL == g_pstGfxGPDevice[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }
#else
    g_pstGfxGPDevice[0] = (OPTM_GFX_GP_S*)HI_GFX_VMALLOC(HIGFX_FB_ID, sizeof(OPTM_GFX_GP_S) * HIFB_ADP_GP_BUTT);
    if (NULL == g_pstGfxGPDevice[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_VMALLOC, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif

    for (Index = 0; Index < HIFB_ADP_GP_BUTT; Index++)
    {
        g_pstGfxGPDevice[Index] = (OPTM_GFX_GP_S*)((HI_VOID*)g_pstGfxGPDevice[0] + Index * sizeof(OPTM_GFX_GP_S));
        HI_GFX_Memset(g_pstGfxGPDevice[Index], 0, sizeof(OPTM_GFX_GP_S));
        g_pstGfxGPDevice[Index]->stInRect.s32Width   = CONFIG_HIFB_LAYER_MINWIDTH;
        g_pstGfxGPDevice[Index]->stInRect.s32Height  = CONFIG_HIFB_LAYER_MINHEIGHT;
        g_pstGfxGPDevice[Index]->stOutRect.s32Width  = CONFIG_HIFB_LAYER_MINWIDTH;
        g_pstGfxGPDevice[Index]->stOutRect.s32Height = CONFIG_HIFB_LAYER_MINHEIGHT;
    }

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_ADP_DeInitGpDev
* description : CNcomment: GP Device dinital  CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID HIFB_ADP_DeInitGpDev(HI_VOID)
{
#ifdef HI_BUILD_IN_BOOT
    if (NULL != g_pstGfxGPDevice[0])
    {
        HI_GFX_Free((HI_VOID*)g_pstGfxGPDevice[0]);
    }
#else
    if (NULL != g_pstGfxGPDevice[0])
    {
        HI_GFX_VFREE(HIGFX_FB_ID, (HI_VOID*)g_pstGfxGPDevice[0]);
    }
#endif
    g_pstGfxGPDevice[0] = NULL;
    return;
}

/***************************************************************************************
* func        : HIFB_ADP_InitGfxDev
* description : CNcomment: GFX Device inital  CNend\n
* param[in]   : HI_S32
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_S32 HIFB_ADP_InitGfxDev(HI_VOID)
{
    HI_S32 Index = 0;

#ifdef HI_BUILD_IN_BOOT
    g_pstGfxDevice[0] = (OPTM_GFX_LAYER_S*)HI_GFX_Malloc(sizeof(OPTM_GFX_LAYER_S) * HIFB_LAYER_ID_BUTT, "gfx_dev");
    if (NULL == g_pstGfxDevice[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }
#else
    g_pstGfxDevice[0] = (OPTM_GFX_LAYER_S*)HI_GFX_VMALLOC(HIGFX_FB_ID, sizeof(OPTM_GFX_LAYER_S) * HIFB_LAYER_ID_BUTT);
    if (NULL == g_pstGfxDevice[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_VMALLOC, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif

    for (Index = 0; Index < HIFB_LAYER_ID_BUTT; Index++)
    {
        g_pstGfxDevice[Index] = (OPTM_GFX_LAYER_S*)((HI_VOID*)g_pstGfxDevice[0] + Index * sizeof(OPTM_GFX_LAYER_S));
        HI_GFX_Memset(g_pstGfxDevice[Index], 0, sizeof(OPTM_GFX_LAYER_S));
        g_pstGfxDevice[Index]->stInRect.w  = CONFIG_HIFB_LAYER_MINWIDTH;
        g_pstGfxDevice[Index]->stInRect.h  = CONFIG_HIFB_LAYER_MINHEIGHT;
    }

    return HI_SUCCESS;
}

/***************************************************************************************
* func        : HIFB_ADP_DeInitGfxDev
* description : CNcomment: GFX Device dinital  CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static inline HI_VOID HIFB_ADP_DeInitGfxDev(HI_VOID)
{
#ifdef HI_BUILD_IN_BOOT
    if (NULL != g_pstGfxDevice[0])
    {
        HI_GFX_Free((HI_VOID*)g_pstGfxDevice[0]);
    }
#else
    if (NULL != g_pstGfxDevice[0])
    {
        HI_GFX_VFREE(HIGFX_FB_ID, (HI_VOID*)g_pstGfxDevice[0]);
    }
#endif
    g_pstGfxDevice[0] = NULL;
    return;
}

/***************************************************************************************
* func         : HIFB_ADP_InitGfxCapability
* description  : CNcomment: 初始化图层能力级 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_S32 HIFB_ADP_InitGfxCapability(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_S32 Index = 0;
 #ifdef HI_BUILD_IN_BOOT
    g_pstGfxCap[0] = (HIFB_CAPABILITY_S*)HI_GFX_Malloc(sizeof(HIFB_CAPABILITY_S) * HIFB_LAYER_ID_BUTT, "gfx_capability");
    if (NULL == g_pstGfxCap[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }
#else
    g_pstGfxCap[0] = (HIFB_CAPABILITY_S*)HI_GFX_VMALLOC(HIGFX_FB_ID, sizeof(HIFB_CAPABILITY_S) * HIFB_LAYER_ID_BUTT);
    if (NULL == g_pstGfxCap[0])
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_VMALLOC, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif

    for (Index = 0; Index < HIFB_LAYER_ID_BUTT; Index++)
    {
        g_pstGfxCap[Index] = (HIFB_CAPABILITY_S*)((HI_VOID*)g_pstGfxCap[0] + Index * sizeof(HIFB_CAPABILITY_S));
        HI_GFX_Memset(g_pstGfxCap[Index], 0, sizeof(HIFB_CAPABILITY_S));
    }

    Ret = GFXCAPABILITY_Init();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, GFXCAPABILITY_Init, FAILURE_TAG);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_ADP_DeInitGfxCapability
* description  : CNcomment: 去初始化图层能力级 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static inline HI_VOID HIFB_ADP_DeInitGfxCapability(HI_VOID)
{
#ifdef HI_BUILD_IN_BOOT
    if (NULL != g_pstGfxCap[0])
    {
        HI_GFX_Free((HI_VOID*)g_pstGfxCap[0]);
    }
#else
    if (NULL != g_pstGfxCap[0])
    {
        HI_GFX_VFREE(HIGFX_FB_ID, (HI_VOID*)g_pstGfxCap[0]);
    }
#endif
    g_pstGfxCap[0] = NULL;
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_Init
* description  : CNcomment: 驱动初始化 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_Init(HI_VOID)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = HIFB_ADP_InitVdpReg();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_InitVdpReg, Ret);
        goto INIT_ERR;
    }

    Ret = HIFB_ADP_InitGfxCapability();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_InitGfxCapability, Ret);
        goto INIT_ERR;
    }

    Ret = HIFB_ADP_InitGfxDev();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_InitGfxDev, Ret);
        goto INIT_ERR;
    }

    Ret = HIFB_ADP_InitGpDev();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_InitGpDev, Ret);
        goto INIT_ERR;
    }

    Ret = HIFB_ADP_InitGpIrq();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_InitGpIrq, Ret);
        goto INIT_ERR;
    }

    Ret = DRV_HIFB_WBC_Init();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_WBC_Init, Ret);
        goto INIT_ERR;
    }

#ifndef CONFIG_GFX_PQ
    Ret = OPTM_ALG_GZmeVdpComnInit(&gs_stGPZme);
    if (HI_SUCCESS != Ret)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, OPTM_ALG_GZmeVdpComnInit, Ret);
       goto INIT_ERR;
    }
#else
  #ifdef HI_BUILD_IN_BOOT
    Ret = DRV_PQ_InitGfxZme();
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_PQ_InitGfxZme, Ret);
        goto INIT_ERR;
    }
  #endif
#endif

    return HI_SUCCESS;
INIT_ERR:

    HIFB_ADP_DeInitGpIrq();
    HIFB_ADP_DeInitGpDev();
    HIFB_ADP_DeInitGfxDev();
    HIFB_ADP_DeInitGfxCapability();
    HIFB_ADP_DeInitVdpReg();
    DRV_HIFB_WBC_DeInit();
    return HI_FAILURE;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_DeInit
* description : CNcomment: 图形设备去初始化 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_DeInit(HI_VOID)
{
#ifndef HI_BUILD_IN_BOOT
    HI_U32 u32LayerId = HIFB_LAYER_HD_0;

    for (u32LayerId = HIFB_LAYER_HD_0; u32LayerId < HIFB_LAYER_ID_BUTT; u32LayerId++)
    {
        if (HI_FALSE != g_pstGfxDevice[u32LayerId]->bOpened)
        {
            DRV_HIFB_ADP_CloseLayer(u32LayerId);
        }
    }

    #ifndef CONFIG_GFX_PQ
    OPTM_ALG_GZmeVdpComnDeInit(&gs_stGPZme);
    #endif

    DRV_HIFB_WBC_DeInit();
    DRV_HIFB_WBC_SetTcFlag(HI_FALSE);

    ps_DispExportFuncs = NULL;
#endif

    HIFB_ADP_DeInitGpIrq();
    HIFB_ADP_DeInitGpDev();
    HIFB_ADP_DeInitGfxDev();
    HIFB_ADP_DeInitGfxCapability();
    HIFB_ADP_DeInitVdpReg();

    return HI_SUCCESS;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : DRV_HIFB_ADP_StereoCallBack
* description  : CNcomment: 执行3D  工作对列函数 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_ADP_StereoCallBack(struct work_struct *data)
{
    HI_U32 i = 0;
    HI_U32 u32CTypeFlag = 0;
    HI_U32 u32LayerCount = 0;
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    OPTM_GFX_WORK_S *pst3DModeWork = NULL;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(data);
    pst3DModeWork = container_of(data, OPTM_GFX_WORK_S, work);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pst3DModeWork);
    enGpId = (HIFB_GP_ID_E)(pst3DModeWork->u32Data);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    u32LayerCount = (HIFB_ADP_GP0 == enGpId) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;
    HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(u32LayerCount, OPTM_GP_SUPPORT_MAXLAYERNUM);

    for (i = 0; i < u32LayerCount;i++)
    {
        u32CTypeFlag = g_pstGfxGPIrq[enGpId]->stGfxCallBack[i].u32CTypeFlag;
        if (0 == u32CTypeFlag)
        {
            continue;
        }

        if (HIFB_CALLBACK_TYPE_3DMode_CHG != (u32CTypeFlag & HIFB_CALLBACK_TYPE_3DMode_CHG))
        {
            continue;
        }

        if (NULL != g_pstGfxGPIrq[enGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_3DMode_CHG].pFunc)
        {
            g_pstGfxGPIrq[enGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_3DMode_CHG].pFunc(
                g_pstGfxGPIrq[enGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_3DMode_CHG].pParam0,
                (HI_VOID*)&g_pstGfxGPDevice[enGpId]->enTriDimMode);
        }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#endif

/***************************************************************************************
* func        : HIFB_ADP_InitAlg
* description : CNcomment: 算法初始化 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_VOID HIFB_ADP_InitAlg(HIFB_GP_ID_E enGPId)
{
#ifndef CONFIG_GFX_PQ
    OPTM_ALG_GDTI_RTL_PARA_S stDtiRtlPara;
    HI_GFX_Memset(&stDtiRtlPara, 0, sizeof(stDtiRtlPara));

    OPTM_ALG_GDtiInit(&stDtiRtlPara);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGPId);
    DRV_HIFB_HAL_GP_SetTiHpCoef    (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_CHM, (HI_S32 *)stDtiRtlPara.s32CTIHPTmp);
    DRV_HIFB_HAL_GP_SetTiHpCoef    (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_S32 *)stDtiRtlPara.s32LTIHPTmp);
    DRV_HIFB_HAL_GP_SetTiGainRatio (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_CHM, (HI_S32)stDtiRtlPara.s16CTICompsatRatio);
    DRV_HIFB_HAL_GP_SetTiGainRatio (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_S32)stDtiRtlPara.s16LTICompsatRatio);
    DRV_HIFB_HAL_GP_SetTiCoringThd (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_CHM, (HI_U32)stDtiRtlPara.u16CTICoringThrsh);
    DRV_HIFB_HAL_GP_SetTiCoringThd (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_U32)stDtiRtlPara.u16LTICoringThrsh);
    DRV_HIFB_HAL_GP_SetTiSwingThd  (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_CHM, (HI_U32)stDtiRtlPara.u16CTIOverSwingThrsh, (HI_U32)stDtiRtlPara.u16CTIUnderSwingThrsh);
    DRV_HIFB_HAL_GP_SetTiSwingThd  (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_U32)stDtiRtlPara.u16LTIOverSwingThrsh, (HI_U32)stDtiRtlPara.u16LTIUnderSwingThrsh);
    DRV_HIFB_HAL_GP_SetTiMixRatio  (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_CHM, (HI_U32)stDtiRtlPara.u8CTIMixingRatio);
    DRV_HIFB_HAL_GP_SetTiMixRatio  (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_U32)stDtiRtlPara.u8LTIMixingRatio);
    DRV_HIFB_HAL_GP_SetTiHfThd     (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_U32 *)stDtiRtlPara.u32LTIHFreqThrsh);
    DRV_HIFB_HAL_GP_SetTiGainCoef  (g_pstGfxGPDevice[enGPId]->enGpHalId, VDP_TI_MODE_LUM, (HI_U32 *)stDtiRtlPara.u32LTICompsatMuti);
#else
    HI_UNUSED(enGPId);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GP_Open
* description  : CNcomment: 打开GP设备并设置ZME系数 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_GP_Open(HIFB_GP_ID_E enGPId)
{
#ifndef HI_BUILD_IN_BOOT
    HI_S32 Ret = HI_SUCCESS;
#endif
    HI_U32 PrioValue   = 0;
    HI_U32 InitLayerID = 0;
    HI_U32 LayerIdIndex = 0;
    HI_U32 MaxLayerCount = 0;
    OPTM_VDP_BKG_S stBkg = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxGPDevice[0], HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxDevice[0],   HI_FAILURE);

    if (HI_TRUE == g_pstGfxGPDevice[enGPId]->bOpen)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

#ifndef HI_BUILD_IN_BOOT
    Ret = HI_DRV_MODULE_GetFunction(HI_ID_DISP, (HI_VOID**)&ps_DispExportFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == ps_DispExportFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get disp func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return HI_FAILURE;
    }

    if (HIFB_ADP_GP0 == enGPId)
    {
        g_pstGfxGPDevice[enGPId]->queue = create_workqueue(HIFB_WORK_QUEUE);
        if (NULL == g_pstGfxGPDevice[enGPId]->queue)
        {
            HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, create_workqueue, FAILURE_TAG);
            return HI_FAILURE;
        }

        INIT_WORK(&g_pstGfxGPDevice[enGPId]->stStartWbcWork.work,     DRV_HIFB_WBC_StartWorkQueue);
        INIT_WORK(&g_pstGfxGPDevice[enGPId]->stStartStereoWork.work,  DRV_HIFB_ADP_StereoCallBack);
        init_waitqueue_head(&g_stGfxWbc2.WaiteWbcWorkqueueMutex);
    }
#endif

    g_pstGfxGPDevice[enGPId]->u32ZmeDeflicker   = (HIFB_ADP_GP0 == enGPId)? (0) : (1);
    g_pstGfxGPDevice[enGPId]->u32Alpha          = 0XFF;
    g_pstGfxGPDevice[enGPId]->enReadMode        = VDP_RMODE_PROGRESSIVE;
    g_pstGfxGPDevice[enGPId]->stBkg             = stBkg;
#ifndef CONFIG_GFX_PQ
    g_pstGfxGPDevice[enGPId]->enInputCsc        = OPTM_CS_BT709_RGB_FULL;
    g_pstGfxGPDevice[enGPId]->enOutputCsc       = OPTM_CS_UNKNOWN;
#else
    g_pstGfxGPDevice[enGPId]->enInputCsc        = PQ_GFX_CS_BT709_RGB_FULL;
    g_pstGfxGPDevice[enGPId]->enOutputCsc       = PQ_GFX_CS_BUTT;
#endif
    g_pstGfxGPDevice[enGPId]->bBGRState         = HI_FALSE;
    g_pstGfxGPDevice[enGPId]->bGpClose          = HI_FALSE;
    g_pstGfxGPDevice[enGPId]->bRecoveryInNextVT = HI_TRUE;
    g_pstGfxGPDevice[enGPId]->bDispInitial      = HI_FALSE;

    if (HIFB_ADP_GP0 == enGPId)
    {
        InitLayerID   = (HI_U32)HIFB_LAYER_HD_0;
        MaxLayerCount = (HI_U32)(OPTM_GP0_GFX_COUNT - 1);
        g_pstGfxGPDevice[enGPId]->enMixg   = VDP_CBM_MIXG0;
        g_pstGfxGPDevice[enGPId]->enDispCh = OPTM_DISPCHANNEL_1;
    }
    else
    {
        InitLayerID   = (HI_U32)HIFB_LAYER_SD_0;
        MaxLayerCount = (HI_U32)(OPTM_GP1_GFX_COUNT + InitLayerID - 1);
        g_pstGfxGPDevice[enGPId]->enMixg   = VDP_CBM_MIXG1;
        g_pstGfxGPDevice[enGPId]->enDispCh = OPTM_DISPCHANNEL_0;
    }

    g_pstGfxGPDevice[enGPId]->enGpHalId  = HIFB_ADP_GetGpHalId(enGPId);
    g_pstGfxGPDevice[enGPId]->u32Prior   = 0x0;

    DRV_HIFB_HAL_GP_SetLayerGalpha(g_pstGfxGPDevice[enGPId]->enGpHalId, g_pstGfxGPDevice[enGPId]->u32Alpha);
    DRV_HIFB_HAL_GP_SetReadMode   (g_pstGfxGPDevice[enGPId]->enGpHalId, g_pstGfxGPDevice[enGPId]->enReadMode);
    DRV_HIFB_HAL_GP_SetUpMode     (g_pstGfxGPDevice[enGPId]->enGpHalId, g_pstGfxGPDevice[enGPId]->enReadMode);
    DRV_HIFB_HAL_CBM_SetMixerBkg  (g_pstGfxGPDevice[enGPId]->enMixg,  &(g_pstGfxGPDevice[enGPId]->stBkg));

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(MaxLayerCount, HIFB_LAYER_ID_BUTT, HI_FAILURE);
    for (LayerIdIndex = InitLayerID; LayerIdIndex <= MaxLayerCount; LayerIdIndex++)
    {
        PrioValue = LayerIdIndex;
#ifdef CONFIG_HIFB_VERSION_3_0
        if (HIFB_LAYER_HD_1 == LayerIdIndex)
        {/**match to g3 mix **/
            PrioValue = 0x2;
        }
#endif
        g_pstGfxDevice[LayerIdIndex]->enGfxHalId = HIFB_ADP_GetGfxHalId(LayerIdIndex);
        g_pstGfxDevice[LayerIdIndex]->u32ZOrder  = LayerIdIndex;
        DRV_HIFB_HAL_CBM_SetMixerPrio(g_pstGfxGPDevice[enGPId]->enMixg, PrioValue, g_pstGfxDevice[LayerIdIndex]->u32ZOrder);

#ifdef CONFIG_HIFB_VERSION_1_0
        g_pstGfxGPDevice[enGPId]->u32Prior |= ((PrioValue + 1) << (LayerIdIndex * 4));
#else
        g_pstGfxGPDevice[enGPId]->u32Prior |= (LayerIdIndex < 2) ? ((PrioValue + 1) << (LayerIdIndex * 4)) : (((PrioValue + 1) + 1) << (LayerIdIndex * 4));
#endif
    }

    HIFB_ADP_InitAlg(enGPId);

#ifndef CONFIG_HIFB_GP1_SUPPORT
    if (HIFB_ADP_GP1 == enGPId)
    {
        g_pstGfxGPDevice[enGPId]->bOpen = HI_TRUE;
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }
#endif

#ifndef HI_BUILD_IN_BOOT
    Ret = DRV_HIFB_ADP_SetCallbackToDisp(enGPId, (IntCallBack)DRV_HIFB_ADP_UpDataCallBack, HI_DRV_DISP_C_INTPOS_90_PERCENT, HI_TRUE);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallbackToDisp, Ret);
        return HI_FAILURE;
    }

    if (HIFB_ADP_GP1 != enGPId)
    {/** wbc not need frame end callback **/
        Ret = DRV_HIFB_ADP_SetCallbackToDisp(enGPId, (IntCallBack)DRV_HIFB_ADP_FrameEndCallBack, HI_DRV_DISP_C_INTPOS_100_PERCENT, HI_TRUE);
    }
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetCallbackToDisp, Ret);
        return HI_FAILURE;
    }
#endif

    g_pstGfxGPDevice[enGPId]->bOpen = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GP_Close
* description  : CNcomment: 关闭GP设备 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_GP_Close(HIFB_GP_ID_E enGPId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxGPDevice[0], HI_FAILURE);

#ifndef HI_BUILD_IN_BOOT
    DRV_HIFB_ADP_SetCallbackToDisp(enGPId, (IntCallBack)DRV_HIFB_ADP_UpDataCallBack,   HI_DRV_DISP_C_INTPOS_90_PERCENT,  HI_FALSE);
    DRV_HIFB_ADP_SetCallbackToDisp(enGPId, (IntCallBack)DRV_HIFB_ADP_FrameEndCallBack, HI_DRV_DISP_C_INTPOS_100_PERCENT, HI_FALSE);

    if (NULL != g_pstGfxGPDevice[enGPId]->queue)
    {
        destroy_workqueue(g_pstGfxGPDevice[enGPId]->queue);
        g_pstGfxGPDevice[enGPId]->queue = NULL;
    }
#endif

    g_pstGfxGPDevice[enGPId]->bOpen            = HI_FALSE;
    g_pstGfxGPDevice[enGPId]->bDispInitial     = HI_FALSE;
    g_pstGfxGPDevice[enGPId]->bNeedExtractLine = HI_FALSE;
    g_pstGfxGPDevice[enGPId]->bMaskFlag        = HI_FALSE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetReadMode
* description  : CNcomment: 设置读取数据模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetReadMode(HIFB_LAYER_ID_E enLayerId, OPTM_VDP_DATA_RMODE_E enReadMode)
{
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId,HI_FAILURE);
    DRV_HIFB_HAL_GFX_SetReadMode(g_pstGfxDevice[enLayerId]->enGfxHalId, enReadMode);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId, HI_FAILURE);
    DRV_HIFB_HAL_GP_SetReadMode(g_pstGfxGPDevice[g_pstGfxDevice[enLayerId]->enGPId]->enGpHalId, enReadMode);

    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GFX_InitLayer
* description  : CNcomment: 初始化图层信息 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_GFX_InitLayer(HIFB_LAYER_ID_E enLayerId)
{
    OPTM_VDP_BKG_S stBkg = {0};
#ifndef HI_BUILD_IN_BOOT
    HI_S32 Ret = HI_SUCCESS;
    HI_CHAR MemName[256] = {'\0'};
    HIFB_CALLBACK_TPYE_E CallBackType = 0;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId,  HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxGPIrq[0],  HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(g_pstGfxDevice[0], HI_FAILURE);

#ifndef HI_BUILD_IN_BOOT
    /** maybe check whether cmap if support use g_pstGfxCap[enLayerId]->bHasCmapReg**/
    snprintf(MemName, sizeof(MemName), "HIFB_FB%d_Clut", enLayerId);
    MemName[sizeof(MemName) - 1] = '\0';
    Ret = DRV_HIFB_ADP_MEM_MallocAndMap(MemName, NULL, OPTM_CMAP_SIZE, 0, &g_pstGfxDevice[enLayerId]->stCluptTable);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, OPTM_CMAP_SIZE);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_MEM_MallocAndMap, FAILURE_TAG);
        return HI_FAILURE;
    }
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_STR,  MemName);
#endif

    init_waitqueue_head(&(g_pstGfxDevice[enLayerId]->vblEvent));

    g_pstGfxDevice[enLayerId]->stBkg        = stBkg;
    g_pstGfxDevice[enLayerId]->CscState     = OPTM_CSC_SET_PARA_RGB;
    g_pstGfxDevice[enLayerId]->enBitExtend  = VDP_GFX_BITEXTEND_3RD;
    g_pstGfxDevice[enLayerId]->enReadMode   = VDP_RMODE_PROGRESSIVE;
    g_pstGfxDevice[enLayerId]->enUpDateMode = VDP_RMODE_PROGRESSIVE;
    g_pstGfxDevice[enLayerId]->enGfxHalId   = HIFB_ADP_GetGfxHalId(enLayerId);
    g_pstGfxDevice[enLayerId]->enGPId       = HIFB_ADP_GetGpId(enLayerId);
#ifdef CONFIG_HIFB_FIELD_BUFFER_SUPPORT
    if ((HI_TRUE == g_stGfxWbc2.bHasBeenUsedFieldBuffer) && (OPTM_SLAVER_LAYERID == enLayerId))
    {
        g_pstGfxDevice[enLayerId]->enReadMode = VDP_RMODE_TOP;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[enLayerId]->enReadMode);
    }
#endif
    g_pstGfxDevice[enLayerId]->stAlpha.bAlphaEnable  = HI_TRUE;
    g_pstGfxDevice[enLayerId]->stAlpha.bAlphaChannel = HI_TRUE;
    g_pstGfxDevice[enLayerId]->stAlpha.u8Alpha0      = 0XFF;
    g_pstGfxDevice[enLayerId]->stAlpha.u8Alpha1      = 0XFF;
    g_pstGfxDevice[enLayerId]->stAlpha.u8GlobalAlpha = 0XFF;

    g_pstGfxDevice[enLayerId]->stInRect.x  = 0;
    g_pstGfxDevice[enLayerId]->stInRect.y  = 0;
    g_pstGfxDevice[enLayerId]->stInRect.w  = CONFIG_HIFB_LAYER_MAXWIDTH;
    g_pstGfxDevice[enLayerId]->stInRect.h  = CONFIG_HIFB_LAYER_MAXHEIGHT;

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[enLayerId]->enGfxHalId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[enLayerId]->enGPId);

    DRV_HIFB_HAL_GFX_SetNoSecFlag     (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_TRUE);
    DRV_HIFB_HAL_GFX_SetDcmpEnable    (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetLayerBkg      (g_pstGfxDevice[enLayerId]->enGfxHalId, &(g_pstGfxDevice[enLayerId]->stBkg));
    DRV_HIFB_HAL_GFX_SetBitExtend     (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->enBitExtend);
    DRV_HIFB_HAL_GFX_SetReadMode      (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->enReadMode);
    DRV_HIFB_HAL_GFX_SetUpdMode       (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->enUpDateMode);
    DRV_HIFB_HAL_GFX_SetPreMultEnable (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_TRUE, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetPalpha        (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_TRUE, HI_TRUE, 0XFF, 0XFF);
    DRV_HIFB_HAL_GFX_SetLayerGalpha   (g_pstGfxDevice[enLayerId]->enGfxHalId, 0XFF);
    DRV_HIFB_HAL_GFX_SetLutAddr       (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->stCluptTable.u32StartPhyAddr);

#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId,  HI_FAILURE);
    for (CallBackType = HIFB_CALLBACK_TYPE_VO; CallBackType < HIFB_CALLBACK_TYPE_BUTT; CallBackType++)
    {
        spin_lock_init(&(g_pstGfxGPIrq[g_pstGfxDevice[enLayerId]->enGPId]->stGfxCallBack[enLayerId].stGfxIrq[CallBackType].FuncLock));
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_ReleaseClutBuf
* description   : CNcomment: 释放调色板内存 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_ReleaseClutBuf(HIFB_LAYER_ID_E enLayerId)
{
#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

    if (NULL != g_pstGfxDevice[enLayerId]->stCluptTable.pu8StartVirAddr)
    {
        DRV_HIFB_ADP_MEM_UnMapAndRelease(&(g_pstGfxDevice[enLayerId]->stCluptTable));
    }

    g_pstGfxDevice[enLayerId]->stCluptTable.pu8StartVirAddr  = NULL;
    g_pstGfxDevice[enLayerId]->stCluptTable.u32StartPhyAddr  = 0;
    g_pstGfxDevice[enLayerId]->stCluptTable.u32StartSmmuAddr = 0;
    g_pstGfxDevice[enLayerId]->stCluptTable.u32Size          = 0;
    g_pstGfxDevice[enLayerId]->stCluptTable.bSmmu            = HI_FALSE;
#else
    HI_UNUSED(enLayerId);
#endif
    return;
}

/***************************************************************************************
* func        : HIFB_ADP_SetGpCsc
* description : CNcomment: 设置GP CSC系数 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
#ifndef CONFIG_GFX_PQ
static HI_S32 HIFB_ADP_SetGpCsc(HIFB_GP_ID_E enGfxGpId, HI_BOOL bIsBGRIn)
{
    OPTM_ALG_CSC_DRV_PARA_S stCscDrvPara;
    OPTM_ALG_CSC_RTL_PARA_S stCscRtlPara;
    OPTM_VDP_CSC_COEF_S     stVDPCscCoef;
    OPTM_VDP_CSC_DC_COEF_S  stVDPCscDcCoef;
#ifndef HI_BUILD_IN_BOOT
    OPTM_GFX_CSC_PARA_S stCscPara;
    HI_PQ_PICTURE_SETTING_S stPictureSetting = {50, 50, 50, 50};
#else
    HI_U32 enChan = 0;
    HI_U32 u32Bright  = 50;  /** 亮度   **/
    HI_U32 u32Contrst = 50;  /** 对比度 **/
    HI_U32 u32Hue     = 50;  /** 色调   **/
    HI_U32 u32Satur   = 50;  /** 饱和度 **/
#endif
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGfxGpId,HI_FAILURE);

    HI_GFX_Memset(&stCscDrvPara,   0x0, sizeof(stCscDrvPara));
    HI_GFX_Memset(&stCscRtlPara,   0x0, sizeof(stCscRtlPara));
    HI_GFX_Memset(&stVDPCscCoef,   0x0, sizeof(stVDPCscCoef));
    HI_GFX_Memset(&stVDPCscDcCoef, 0x0, sizeof(stVDPCscDcCoef));

#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs->pfnPQ_GetHDPictureSetting,HI_FAILURE);
    if (enGfxGpId == HIFB_ADP_GP0)
    {
        gs_pstPqFuncs->pfnPQ_GetHDPictureSetting(&stPictureSetting);
    }
    else
    {
        gs_pstPqFuncs->pfnPQ_GetSDPictureSetting(&stPictureSetting);
    }

    stCscPara.u32Bright     = stCscDrvPara.u32Bright  = stPictureSetting.u16Brightness;
    stCscPara.u32Contrast   = stCscDrvPara.u32Contrst = stPictureSetting.u16Contrast;
    stCscPara.u32Hue        = stCscDrvPara.u32Hue     = stPictureSetting.u16Hue;
    stCscPara.u32Saturation = stCscDrvPara.u32Satur   = stPictureSetting.u16Saturation;

    stCscPara.u32Kb = stCscDrvPara.u32Kb = 50;
    stCscPara.u32Kg = stCscDrvPara.u32Kg = 50;
    stCscPara.u32Kr = stCscDrvPara.u32Kr = 50;

    if (memcmp(&g_pstGfxGPDevice[enGfxGpId]->stCscPara, &stCscPara, sizeof(OPTM_GFX_CSC_PARA_S)) != 0)
    {
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Bright          = stCscDrvPara.u32Bright;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Contrast        = stCscDrvPara.u32Contrst;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Hue             = stCscDrvPara.u32Hue;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Kb              = stCscDrvPara.u32Kb;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Kg              = stCscDrvPara.u32Kg;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Kr              = stCscDrvPara.u32Kr;
        g_pstGfxGPDevice[enGfxGpId]->stCscPara.u32Saturation      = stCscDrvPara.u32Satur;
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
        DRV_HIFB_WBC_Reset(HI_TRUE);
#endif
    }
#else
    if (enGfxGpId == HIFB_ADP_GP0)
    {
        enChan = HI_UNF_DISPLAY1;
    }
    else
    {
        enChan = HI_UNF_DISPLAY0;
    }

    HI_PQ_GetBrightness   (enChan, &u32Bright);
    HI_PQ_GetContrast     (enChan, &u32Contrst);
    HI_PQ_GetHue          (enChan, &u32Hue);
    HI_PQ_GetSaturation   (enChan, &u32Satur);

    stCscDrvPara.u32Bright  = u32Bright;
    stCscDrvPara.u32Contrst = u32Contrst;
    stCscDrvPara.u32Hue     = u32Hue;
    stCscDrvPara.u32Satur   = u32Satur;
    stCscDrvPara.u32Kb      = 50;
    stCscDrvPara.u32Kg      = 50;
    stCscDrvPara.u32Kr      = 50;
#endif

    g_pstGfxGPDevice[enGfxGpId]->enInputCsc  = OPTM_CS_BT709_RGB_FULL;

    OPTM_CheckGPMask_BYGPID(enGfxGpId);

    stCscDrvPara.eInputCS   = g_pstGfxGPDevice[enGfxGpId]->enInputCsc;
    stCscDrvPara.eOutputCS  = g_pstGfxGPDevice[enGfxGpId]->enOutputCsc;
    stCscDrvPara.bIsBGRIn   = bIsBGRIn;

    OPTM_ALG_CscCoefSet(&stCscDrvPara, &stCscRtlPara);

    stVDPCscCoef.csc_coef00 = stCscRtlPara.s32CscCoef_00;
    stVDPCscCoef.csc_coef01 = stCscRtlPara.s32CscCoef_01;
    stVDPCscCoef.csc_coef02 = stCscRtlPara.s32CscCoef_02;
    stVDPCscCoef.csc_coef10 = stCscRtlPara.s32CscCoef_10;
    stVDPCscCoef.csc_coef11 = stCscRtlPara.s32CscCoef_11;
    stVDPCscCoef.csc_coef12 = stCscRtlPara.s32CscCoef_12;
    stVDPCscCoef.csc_coef20 = stCscRtlPara.s32CscCoef_20;
    stVDPCscCoef.csc_coef21 = stCscRtlPara.s32CscCoef_21;
    stVDPCscCoef.csc_coef22 = stCscRtlPara.s32CscCoef_22;

    stVDPCscDcCoef.csc_in_dc0 = stCscRtlPara.s32CscDcIn_0;
    stVDPCscDcCoef.csc_in_dc1 = stCscRtlPara.s32CscDcIn_1;
    stVDPCscDcCoef.csc_in_dc2 = stCscRtlPara.s32CscDcIn_2;

    stVDPCscDcCoef.csc_out_dc0 = stCscRtlPara.s32CscDcOut_0;
    stVDPCscDcCoef.csc_out_dc1 = stCscRtlPara.s32CscDcOut_1;
    stVDPCscDcCoef.csc_out_dc2 = stCscRtlPara.s32CscDcOut_2;

    DRV_HIFB_HAL_GP_SetCscCoef    (g_pstGfxGPDevice[enGfxGpId]->enGpHalId,  &stVDPCscCoef);
    DRV_HIFB_HAL_GP_SetCscDcCoef  (g_pstGfxGPDevice[enGfxGpId]->enGpHalId,  &stVDPCscDcCoef);
    DRV_HIFB_HAL_GP_SetCscEnable  (g_pstGfxGPDevice[enGfxGpId]->enGpHalId,  HI_TRUE);

    return HI_SUCCESS;
}
#else
static HI_S32 HIFB_ADP_SetGpCsc(HIFB_GP_ID_E enGfxGpId, HI_BOOL bIsBGRIn)
{
    HI_PQ_GFX_CSC_PARA_S stGfxCscPara;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_Memset(&stGfxCscPara, 0x0, sizeof(stGfxCscPara));

    OPTM_CheckGPMask_BYGPID(enGfxGpId);

    g_pstGfxGPDevice[enGfxGpId]->enInputCsc = PQ_GFX_CS_BT709_RGB_FULL;

    stGfxCscPara.bIsBGRIn = bIsBGRIn;
    stGfxCscPara.sGfxCscMode.eInputCS   = g_pstGfxGPDevice[enGfxGpId]->enInputCsc;
    stGfxCscPara.sGfxCscMode.eOutputCS  = g_pstGfxGPDevice[enGfxGpId]->enOutputCsc;

#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs,HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs->pfnPQ_SetGfxCscCoef,HI_FAILURE);

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGfxGpId);
    if (enGfxGpId == HIFB_ADP_GP0)
    {
        gs_pstPqFuncs->pfnPQ_SetGfxCscCoef(PQ_GFX_GP0, &stGfxCscPara);
    }
    else
    {
        gs_pstPqFuncs->pfnPQ_SetGfxCscCoef(PQ_GFX_GP1, &stGfxCscPara);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGfxGpId);
    }
#else
    if (enGfxGpId == HIFB_ADP_GP0)
    {
        DRV_PQ_SetGfxCscCoef(PQ_GFX_GP0, &stGfxCscPara);
    }
    else
    {
        DRV_PQ_SetGfxCscCoef(PQ_GFX_GP1, &stGfxCscPara);
    }
#endif

    DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[enGfxGpId]->enGpHalId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : DRV_HIFB_ADP_SetCallback
* description  : CNcomment: set call back function
                             设置中断响应函数,在对应的中断中调用该对应的赋值函数 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetCallback(HIFB_CALLBACK_TPYE_E enCType, IntCallBack pCallBack, HIFB_LAYER_ID_E enLayerId)
{
    HI_ULONG LockFlag = 0;
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (enCType >= HIFB_CALLBACK_TYPE_BUTT)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_CALLBACK_TYPE_BUTT);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enCType);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGPId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    if (NULL != pCallBack)
    {
        gs_CallBackLayerId[enLayerId] = enLayerId;
        g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].stGfxIrq[enCType].pFunc   = pCallBack;
        g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].stGfxIrq[enCType].pParam0 = (HI_VOID*)&gs_CallBackLayerId[enLayerId];
        g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].u32CTypeFlag |= enCType;
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    spin_lock_irqsave(&(g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].stGfxIrq[enCType].FuncLock),LockFlag);
    {
        g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].u32CTypeFlag &= ~((HI_U32)enCType);
        g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].stGfxIrq[enCType].pFunc = NULL;
    }
    spin_unlock_irqrestore(&(g_pstGfxGPIrq[enGPId]->stGfxCallBack[enLayerId].stGfxIrq[enCType].FuncLock),LockFlag);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_STEREO_SUPPORT)
/***************************************************************************************
* func         : HIFB_ADP_CheckGfxCallbackReg
* description  : CNcomment: check whether call back function have register
                       判断相应的回调函数是否被注册 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_ADP_CheckGfxCallbackReg(HIFB_GP_ID_E enGPId, HIFB_CALLBACK_TPYE_E eCallbackType)
{
    HI_U32 LayerId = 0;

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId,HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(eCallbackType, HIFB_CALLBACK_TYPE_BUTT, HI_FAILURE);

    for (LayerId = 0; LayerId < OPTM_GP_SUPPORT_MAXLAYERNUM; LayerId++)
    {
        if (g_pstGfxGPIrq[enGPId]->stGfxCallBack[LayerId].u32CTypeFlag & eCallbackType)
        {
            if (g_pstGfxGPIrq[enGPId]->stGfxCallBack[LayerId].stGfxIrq[eCallbackType].pFunc)
            {
                return HI_SUCCESS;
            }
        }
    }

    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);
    return HI_FAILURE;
}
#endif

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : HIFB_ADP_GetScreenRectFromDispInfo
* description  : CNcomment: 从disp中获取screen rect CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_ADP_GetScreenRectFromDispInfo(const HI_RECT_S *tmp_virtscreen,      \
                                                 const OPTM_GFX_OFFSET_S *stOffsetInfo,\
                                                 const HI_RECT_S *stFmtResolution,     \
                                                 const HI_RECT_S *stPixelFmtResolution,\
                                                 HI_RECT_S *stScreenRect)
{
    OPTM_GFX_OFFSET_S tmp_offsetInfo;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(tmp_virtscreen,       HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stOffsetInfo,         HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stFmtResolution,      HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stPixelFmtResolution, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(stScreenRect,         HI_FAILURE);

    HI_GFX_Memcpy(&tmp_offsetInfo, stOffsetInfo, sizeof(tmp_offsetInfo));

    if ((tmp_virtscreen->s32Width == 0) || (tmp_virtscreen->s32Height == 0))
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, tmp_virtscreen->s32Width);
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, tmp_virtscreen->s32Height);
         return HI_FAILURE;
    }

    if ((stPixelFmtResolution->s32Width == 0) || (stPixelFmtResolution->s32Width > CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH))
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stPixelFmtResolution->s32Width);
         return HI_FAILURE;
    }

    if ((stPixelFmtResolution->s32Height == 0) || (stPixelFmtResolution->s32Height > CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH))
    {
         HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stPixelFmtResolution->s32Width);
         return HI_FAILURE;
    }

    if ( (stFmtResolution->s32Width * 2) == stPixelFmtResolution->s32Width)
    {
        tmp_offsetInfo.u32Left  *= 2;
        tmp_offsetInfo.u32Right *= 2;
    }

    if ((tmp_offsetInfo.u32Left > CONFIG_HIFB_LAYER_MAXWIDTH) || (tmp_offsetInfo.u32Top  > CONFIG_HIFB_LAYER_MAXHEIGHT))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Left);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Top);
        return HI_FAILURE;
    }

    if ((tmp_offsetInfo.u32Right > CONFIG_HIFB_LAYER_MAXWIDTH) || (tmp_offsetInfo.u32Bottom  > CONFIG_HIFB_LAYER_MAXHEIGHT))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Right);
        //HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Bottom);
        return HI_FAILURE;
    }

    if (   (stPixelFmtResolution->s32Width  <= (tmp_offsetInfo.u32Left + tmp_offsetInfo.u32Right))
        || (stPixelFmtResolution->s32Height <= (tmp_offsetInfo.u32Top + tmp_offsetInfo.u32Bottom)))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stPixelFmtResolution->s32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stPixelFmtResolution->s32Height);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Right);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Bottom);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Left);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_offsetInfo.u32Top);
        return HI_FAILURE;
    }

    stScreenRect->s32X      = tmp_offsetInfo.u32Left;
    stScreenRect->s32Y      = tmp_offsetInfo.u32Top;
    stScreenRect->s32Width  = (stPixelFmtResolution->s32Width - tmp_offsetInfo.u32Left - tmp_offsetInfo.u32Right);
    stScreenRect->s32Height = (stPixelFmtResolution->s32Height - tmp_offsetInfo.u32Top - tmp_offsetInfo.u32Bottom);
    stScreenRect->s32X      = HIFB_ADP_Align(stScreenRect->s32X, 2);
    stScreenRect->s32Y      = HIFB_ADP_Align(stScreenRect->s32Y, 2);
    stScreenRect->s32Width  = HIFB_ADP_Align(stScreenRect->s32Width, 2);
    stScreenRect->s32Height = HIFB_ADP_Align(stScreenRect->s32Height, 2);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

#ifndef HI_BUILD_IN_BOOT
static HI_VOID DRV_HIFB_ADP_FrameEndCallBack(HI_VOID* u32Param0, HI_VOID* u32Param1)
{
    HI_BOOL bIsBottomField = 0;
    HI_U32 u32CTypeFlag = 0;
    HI_VOID* pLayerId   = NULL;
#ifndef CONFIG_HIFB_VERSION_1_0
    HI_U32 WorkedLayerDdr = 0;
    HI_U32 WillWorkLayerDdr = 0;
#endif
    HIFB_LAYER_ID_E LayerIdIndex = HIFB_LAYER_ID_BUTT;
    HIFB_GP_ID_E *pEnGpId = NULL;
    HI_DRV_DISP_CALLBACK_INFO_S *pstDispInfo = NULL;

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(u32Param0);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(u32Param1);
    pstDispInfo = (HI_DRV_DISP_CALLBACK_INFO_S *)u32Param1;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);
    pEnGpId = (HIFB_GP_ID_E *)u32Param0;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pEnGpId);

    if ((HIFB_ADP_GP0 != *pEnGpId) || (HI_TRUE != g_pstGfxGPDevice[*pEnGpId]->bOpen))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, *pEnGpId);
        return;
    }

    DRV_HIFB_HAL_DISP_GetDhd1Field(&bIsBottomField);
    DRV_HIFB_WBC_FrameEndProcess(*pEnGpId, pstDispInfo->stDispInfo.bInterlace, bIsBottomField);//pstDispInfo->stDispInfo.bIsBottomField);

    for (LayerIdIndex = HIFB_LAYER_HD_0; LayerIdIndex <= HIFB_LAYER_HD_3; LayerIdIndex++)
    {
        OPTM_GfxWVBCallBack(LayerIdIndex);

        pLayerId = g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].stGfxIrq[HIFB_CALLBACK_TYPE_FRAME_END].pParam0;
        if (NULL == pLayerId) { continue; }

#ifndef CONFIG_HIFB_VERSION_1_0
        DRV_HIFB_HAL_GFX_GetWorkLayerAddr     (g_pstGfxDevice[LayerIdIndex]->enGfxHalId, &WorkedLayerDdr);
        DRV_HIFB_HAL_GFX_GetWillWorkLayerAddr (g_pstGfxDevice[LayerIdIndex]->enGfxHalId, &WillWorkLayerDdr);
        if (WorkedLayerDdr != WillWorkLayerDdr)
        {
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, WorkedLayerDdr);
           HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, WillWorkLayerDdr);
           return;
        }
#endif
        u32CTypeFlag = g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].u32CTypeFlag;
        /**TODO: here spin lock should test by peach-driver **/
        //spin_lock_irqsave(&(g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].stGfxIrq[HIFB_CALLBACK_TYPE_FRAME_END].FuncLock),LockFlag);
        if ((u32CTypeFlag & HIFB_CALLBACK_TYPE_FRAME_END) && (NULL != g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].stGfxIrq[HIFB_CALLBACK_TYPE_FRAME_END].pFunc))
        {
           g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].stGfxIrq[HIFB_CALLBACK_TYPE_FRAME_END].pFunc(pLayerId, NULL);
           HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
        //spin_unlock_irqrestore(&(g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[LayerIdIndex].stGfxIrq[HIFB_CALLBACK_TYPE_FRAME_END].FuncLock),LockFlag);
    }

    return;
}

/***************************************************************************************
* func        : HIFB_ADP_DispInfoProcess
* description : CNcomment: display信息处理 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_BOOL HIFB_ADP_DispInfoProcess(HIFB_GP_ID_E eGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_BOOL bDispInfoChange = HI_FALSE;
    HI_RECT_S stOutRect;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(eGpId, HI_FALSE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstDispInfo,HI_FALSE);

    if (  (g_pstGfxGPDevice[eGpId]->stInRect.s32Width  != pstDispInfo->stVirtaulScreen.s32Width)
        ||(g_pstGfxGPDevice[eGpId]->stInRect.s32Height != pstDispInfo->stVirtaulScreen.s32Height))
    {
        bDispInfoChange = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstDispInfo->stVirtaulScreen.s32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstDispInfo->stVirtaulScreen.s32Height);

    g_pstGfxGPDevice[eGpId]->stInRect.s32X      = pstDispInfo->stVirtaulScreen.s32X;
    g_pstGfxGPDevice[eGpId]->stInRect.s32Y      = pstDispInfo->stVirtaulScreen.s32Y;
    g_pstGfxGPDevice[eGpId]->stInRect.s32Width  = pstDispInfo->stVirtaulScreen.s32Width;
    g_pstGfxGPDevice[eGpId]->stInRect.s32Height = pstDispInfo->stVirtaulScreen.s32Height;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32X);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32Y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stInRect.s32Height);


    HIFB_ADP_GetScreenRectFromDispInfo(&pstDispInfo->stVirtaulScreen,
                                       (OPTM_GFX_OFFSET_S *)&pstDispInfo->stOffsetInfo,
                                       &pstDispInfo->stFmtResolution,
                                       &pstDispInfo->stPixelFmtResolution,
                                       &stOutRect);

    if ((g_pstGfxGPDevice[eGpId]->stOutRect.s32Width  != stOutRect.s32Width)  ||
        (g_pstGfxGPDevice[eGpId]->stOutRect.s32Height != stOutRect.s32Height) ||
        (g_pstGfxGPDevice[eGpId]->stOutRect.s32X      != stOutRect.s32X)      ||
        (g_pstGfxGPDevice[eGpId]->stOutRect.s32Y      != stOutRect.s32Y))
    {
        bDispInfoChange = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stOutRect.s32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stOutRect.s32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stOutRect.s32X);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[eGpId]->stOutRect.s32Y);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stOutRect.s32Width);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stOutRect.s32Height);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stOutRect.s32X);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, stOutRect.s32Y);

    HI_GFX_Memcpy(&g_pstGfxGPDevice[eGpId]->stOutRect, &stOutRect, sizeof(stOutRect));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return bDispInfoChange;
}

/***************************************************************************************
* func          : HIFB_ADP_GP_SetMask
* description   : CNcomment: 在90%中断处理中调用,设置GP掩码 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 HIFB_ADP_GP_SetMask(HIFB_GP_ID_E enGPId, HI_BOOL bFlag)
{
    HI_BOOL bEnable = HI_FALSE;
    HI_U32 LayerIndex = 0;
    HI_U32 u32LayerCount = 0;
    HIFB_LAYER_ID_E enLayerId = HIFB_LAYER_HD_0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);
    if (HI_TRUE != g_pstGfxGPDevice[enGPId]->bOpen)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enGPId);
        return HI_SUCCESS;
    }

    g_pstGfxGPDevice[enGPId]->bMaskFlag = bFlag;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bFlag);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP0 == enGPId))
    {
        g_pstGfxGPDevice[HIFB_ADP_GP1]->bMaskFlag = bFlag;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == enGPId))
    {
        bEnable = (HI_TRUE == bFlag) ? (HI_FALSE) : (g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bFlag);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable);

        DRV_HIFB_HAL_WBC_GP_SetEnable   (g_stGfxWbc2.enWbcHalId, bEnable);
        DRV_HIFB_HAL_WBC_SetRegUp       (g_stGfxWbc2.enWbcHalId);
        DRV_HIFB_HAL_GFX_SetLayerEnable (g_pstGfxDevice[HIFB_LAYER_SD_0]->enGfxHalId, bEnable);
        DRV_HIFB_HAL_GFX_SetRegUp       (g_pstGfxDevice[HIFB_LAYER_SD_0]->enGfxHalId);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }
#endif

    enLayerId     = (HIFB_ADP_GP0 == enGPId) ? (HIFB_LAYER_HD_0)    : (HIFB_LAYER_SD_0);
    u32LayerCount = (HIFB_ADP_GP0 == enGPId) ? (OPTM_GP0_GFX_COUNT) : (OPTM_GP1_GFX_COUNT);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, u32LayerCount);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enGPId);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE((enLayerId + u32LayerCount), HI_FAILURE);

    for (LayerIndex = 0; LayerIndex < u32LayerCount; LayerIndex++)
    {
        if (HI_FALSE == g_pstGfxDevice[enLayerId + LayerIndex]->bOpened)
        {
            HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, LayerIndex);
            continue;
        }
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, LayerIndex);

        bEnable = (HI_TRUE == bFlag) ? (HI_FALSE) : (g_pstGfxDevice[enLayerId + LayerIndex]->bEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bEnable);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bFlag);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId + LayerIndex]->bEnable);

        DRV_HIFB_HAL_GFX_SetLayerEnable(g_pstGfxDevice[enLayerId + LayerIndex]->enGfxHalId, bEnable);
 #ifndef CONFIG_HIFB_WBC_UNSUPPORT
        g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable = bEnable;
 #endif
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP0 == enGPId))
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable);
        g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable = bFlag ? (HI_FALSE) : (g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable);
        g_pstGfxGPDevice[HIFB_ADP_GP1]->unUpFlag.bits.IsEnable = 1;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, bFlag);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[HIFB_LAYER_SD_0]->bEnable);
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_VOID DRV_HIFB_ADP_SetLowPowerInfo(HIFB_LAYER_ID_E enLayerId, HIFB_ADP_LOWPOWER_INFO_S *pstLowPowerInfo)
{
#ifdef CONFIG_HIFB_LOWPOWER_SUPPORT
     HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
     if (NULL != pstLowPowerInfo)
     {
         DRV_HIFB_HAL_GFX_EnableLayerLowPower (g_pstGfxDevice[enLayerId]->enGfxHalId, pstLowPowerInfo->LowPowerEn);
         DRV_HIFB_HAL_GFX_EnableGpLowPower    (HIFB_ADP_GetGpId(enLayerId), pstLowPowerInfo->LowPowerEn);
         DRV_HIFB_HAL_GFX_SetLowPowerInfo     (g_pstGfxDevice[enLayerId]->enGfxHalId, pstLowPowerInfo->LpInfo);
     }
#else
     HI_UNUSED(enLayerId);
     HI_UNUSED(pstLowPowerInfo);
#endif
}
#endif

STATIC HI_VOID DRV_HIFB_ADP_SetDeCmpDdrInfo(HIFB_LAYER_ID_E enLayerId, HI_U32 ARHeadDdr, HI_U32 ARDataDdr, HI_U32 GBHeadDdr,HI_U32 GBDataDdr, HI_U32 DeCmpStride)
{
#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT) && !defined(CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE)
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    g_pstGfxDevice[enLayerId]->ARHeadDdr = ARHeadDdr;
    g_pstGfxDevice[enLayerId]->ARDataDdr = ARDataDdr;
    g_pstGfxDevice[enLayerId]->GBHeadDdr = GBHeadDdr;
    g_pstGfxDevice[enLayerId]->GBDataDdr = GBDataDdr;
    g_pstGfxDevice[enLayerId]->CmpStride = (HI_U16)DeCmpStride;
    DRV_HIFB_HAL_GFX_SetDeCmpDdrInfo(g_pstGfxDevice[enLayerId]->enGfxHalId, ARHeadDdr, ARDataDdr, GBHeadDdr, GBDataDdr, DeCmpStride);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->ARHeadDdr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->ARDataDdr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->GBHeadDdr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->GBDataDdr);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->CmpStride);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(ARHeadDdr);
    HI_UNUSED(ARDataDdr);
    HI_UNUSED(GBHeadDdr);
    HI_UNUSED(GBDataDdr);
    HI_UNUSED(DeCmpStride);
#endif
    return;
}

STATIC HI_VOID DRV_HIFB_ADP_GetDecompressStatus(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbARDataDecompressErr, HI_BOOL *pbGBDataDecompressErr, HI_BOOL bCloseInterrupt)
{
#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT) && !defined(CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE)
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    DRV_HIFB_HAL_GFX_GetDeCmpStatus(g_pstGfxDevice[enLayerId]->enGfxHalId, pbARDataDecompressErr, pbGBDataDecompressErr, bCloseInterrupt);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pbARDataDecompressErr);
    HI_UNUSED(pbGBDataDecompressErr);
#endif
    return;
}

#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT)
STATIC HI_VOID OPTM_GFX_DECMP_Open(HIFB_LAYER_ID_E enLayerId)
{
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

    g_pstGfxDevice[enLayerId]->bDmpOpened = HI_TRUE;
    DRV_HIFB_HAL_GFX_SetDcmpEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, HI_TRUE);

    return;
}

STATIC HI_VOID OPTM_GFX_DECMP_Close(HIFB_LAYER_ID_E enLayerId)
{
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

    g_pstGfxDevice[enLayerId]->bDmpOpened = HI_FALSE;
    DRV_HIFB_HAL_GFX_SetDcmpEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, HI_FALSE);

    return;
}
#endif

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_ADP_UpDataCallBack(HI_VOID* u32Param0, HI_VOID* u32Param1)
{
    HIFB_GP_ID_E *pEnGpId = NULL;
    HI_DRV_DISP_CALLBACK_INFO_S *pstDispInfo = NULL;

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(u32Param0);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(u32Param1);
    pstDispInfo = (HI_DRV_DISP_CALLBACK_INFO_S *)u32Param1;
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);
    pEnGpId = (HIFB_GP_ID_E *)u32Param0;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(*pEnGpId);

    if (HI_TRUE != g_pstGfxGPDevice[*pEnGpId]->bOpen)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, *pEnGpId);
        return;
    }

#ifdef CHIP_TYPE_hi3798cv200
    {/** support hdmi cts **/
        g_pstGfxGPDevice[*pEnGpId]->enDispFmt = pstDispInfo->stDispInfo.eFmt;
    }
#endif

    if ((HIFB_GFX_MODE_HD_WBC != g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == *pEnGpId))
    {/** gp1 only support wbc **/
         HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, *pEnGpId);
         HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_enOptmGfxWorkMode);
         return;
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_NORMAL == g_enOptmGfxWorkMode) && (HI_TRUE == pstDispInfo->stDispInfo.bIsMaster) && (HIFB_ADP_GP0 == *pEnGpId) && (NULL != g_pstGfxGPDevice[*pEnGpId]->queue))
    {
        g_enOptmGfxWorkMode = HIFB_GFX_MODE_HD_WBC;
        g_pstGfxGPDevice[*pEnGpId]->stStartWbcWork.bOpenLayer = HI_TRUE;
        g_pstGfxGPDevice[*pEnGpId]->stStartWbcWork.bAllocMem  = HI_FALSE;
        g_pstGfxGPDevice[*pEnGpId]->stStartWbcWork.bFreeMem   = HI_FALSE;
        g_pstGfxGPDevice[*pEnGpId]->stStartWbcWork.u32Data    = HIFB_LAYER_SD_0;
        queue_work(g_pstGfxGPDevice[*pEnGpId]->queue, &g_pstGfxGPDevice[*pEnGpId]->stStartWbcWork.work);
    }
#endif

    if ((HI_DRV_DISP_C_PREPARE_TO_PEND == pstDispInfo->eEventType) || (HI_DRV_DISP_C_PREPARE_CLOSE == pstDispInfo->eEventType))
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_ReClose");
        HIFB_ADP_ReClose(*pEnGpId, &pstDispInfo->stDispInfo);
#ifndef CONFIG_HIFB_GP1_SUPPORT
        HIFB_ADP_ReClose(HIFB_ADP_GP1, &pstDispInfo->stDispInfo);
#endif
        return;
    }

    if ((HI_DRV_DISP_C_RESUME == pstDispInfo->eEventType) || (HI_DRV_DISP_C_OPEN == pstDispInfo->eEventType))
    {
        g_pstGfxGPDevice[*pEnGpId]->bHasBeenReOpen[0] = HI_TRUE;
        g_pstGfxGPDevice[*pEnGpId]->bHasBeenReOpen[1] = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_ReOpen");
        HIFB_ADP_ReOpen(*pEnGpId, &pstDispInfo->stDispInfo);
#ifndef CONFIG_HIFB_GP1_SUPPORT
        HIFB_ADP_ReOpen(HIFB_ADP_GP1, &pstDispInfo->stDispInfo);
#endif
        return;
    }

    if (HI_DRV_DISP_C_DISPLAY_SETTING_CHANGE == pstDispInfo->eEventType)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_DispSetting");
        HIFB_ADP_DispSetting(*pEnGpId, &pstDispInfo->stDispInfo);
#ifndef CONFIG_HIFB_GP1_SUPPORT
        HIFB_ADP_DispSetting(HIFB_ADP_GP1, &pstDispInfo->stDispInfo);
#endif
    }

    if (HI_FALSE == g_pstGfxGPDevice[*pEnGpId]->bGpClose)
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_UpdataLayerInfo");
        HIFB_ADP_UpdataLayerInfo(*pEnGpId, &pstDispInfo->stDispInfo);
        if (HIFB_ADP_GP0 == *pEnGpId)
        {
            HIFB_ADP_DistributeCallback(u32Param0, u32Param1);
        }
#ifndef CONFIG_HIFB_GP1_SUPPORT
        HIFB_ADP_UpdataLayerInfo(HIFB_ADP_GP1, &pstDispInfo->stDispInfo);
#endif
    }

    return;
}

static inline HI_VOID HIFB_ADP_ReOpen(HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    if (HI_FALSE == g_pstGfxGPDevice[enGpId]->bDispInitial)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGpId);
        return;
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGpId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDispInfo->bIsMaster);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_enOptmGfxWorkMode);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, g_pstGfxGPDevice[enGpId]->queue);
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HI_TRUE == pstDispInfo->bIsMaster) && (HIFB_ADP_GP0 == enGpId) && (NULL != g_pstGfxGPDevice[enGpId]->queue))
    {
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bOpenLayer = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bAllocMem  = HI_TRUE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bFreeMem   = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.u32Data    = HIFB_LAYER_SD_0;
        queue_work(g_pstGfxGPDevice[enGpId]->queue, &g_pstGfxGPDevice[enGpId]->stStartWbcWork.work);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "wbc realloc mem");
    }
#endif

    if (HI_TRUE == g_pstGfxGPDevice[enGpId]->bGpClose)
    {
        g_pstGfxGPDevice[enGpId]->bGpClose = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->bRecoveryInNextVT = HI_TRUE;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGpId);
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    DRV_HIFB_WBC_Reset(HI_FALSE);
#endif

    HIFB_ADP_GP_SetMask(enGpId, HI_FALSE);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_ADP_ReClose(HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    if (HI_FALSE == g_pstGfxGPDevice[enGpId]->bDispInitial)
    {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGpId);
         return;
    }

    g_pstGfxGPDevice[enGpId]->bGpClose = HI_TRUE;
    HIFB_ADP_GP_SetMask(enGpId, HI_TRUE);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGpId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, pstDispInfo->bIsMaster);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_enOptmGfxWorkMode);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_VOID, g_pstGfxGPDevice[enGpId]->queue);
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HI_TRUE == pstDispInfo->bIsMaster) && (HIFB_ADP_GP0 == enGpId) && (NULL != g_pstGfxGPDevice[enGpId]->queue))
    {
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bOpenLayer = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bAllocMem  = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.bFreeMem   = HI_TRUE;
        g_pstGfxGPDevice[enGpId]->stStartWbcWork.u32Data    = HIFB_LAYER_SD_0;
        queue_work(g_pstGfxGPDevice[enGpId]->queue, &g_pstGfxGPDevice[enGpId]->stStartWbcWork.work);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static inline HI_VOID HIFB_ADP_DispSetting(HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
     HI_BOOL bDispInfoChange = HI_FALSE;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);
     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);

     bDispInfoChange = HIFB_ADP_DispInfoProcess(enGpId, pstDispInfo);
     if (HI_FALSE == bDispInfoChange)
     {
         HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
         return;
     }

     HIFB_ADP_DispInfoUpdate(enGpId);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
     if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP0 == enGpId))
     {
         DRV_HIFB_WBC_Reset(HI_TRUE);
         g_stGfxWbc2.s32WbcCnt = 2;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }
#endif

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}

static inline HI_VOID HIFB_ADP_UpdataLayerInfo(HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo)
{
#ifndef CONFIG_GFX_PQ
    OPTM_COLOR_SPACE_E enGpCsc = OPTM_CS_BUTT;
#else
    HI_PQ_GFX_COLOR_SPACE_E  enGpCsc  = PQ_GFX_CS_BUTT;
#endif
    HI_BOOL bHDR = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDispInfo);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    if (HI_TRUE == g_pstGfxGPDevice[enGpId]->bRecoveryInNextVT)
    {
        g_pstGfxGPDevice[enGpId]->bInterface = pstDispInfo->bInterlace;
        g_pstGfxGPDevice[enGpId]->stInRect.s32X = pstDispInfo->stVirtaulScreen.s32X;
        g_pstGfxGPDevice[enGpId]->stInRect.s32Y = pstDispInfo->stVirtaulScreen.s32Y;
        g_pstGfxGPDevice[enGpId]->stInRect.s32Width  = pstDispInfo->stVirtaulScreen.s32Width;
        g_pstGfxGPDevice[enGpId]->stInRect.s32Height = pstDispInfo->stVirtaulScreen.s32Height;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enGpId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->bInterface);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32X);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Height);

        HIFB_ADP_GetScreenRectFromDispInfo(&pstDispInfo->stVirtaulScreen,                   \
                                           (OPTM_GFX_OFFSET_S *)&pstDispInfo->stOffsetInfo, \
                                           &pstDispInfo->stFmtResolution,                   \
                                           &pstDispInfo->stPixelFmtResolution,              \
                                           &g_pstGfxGPDevice[enGpId]->stOutRect);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stOutRect.s32X);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stOutRect.s32Y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stOutRect.s32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stOutRect.s32Height);

        HIFB_ADP_GP_Recovery(enGpId);

        g_pstGfxGPDevice[enGpId]->bRecoveryInNextVT = HI_FALSE;
        g_pstGfxGPDevice[enGpId]->bDispInitial      = HI_TRUE;
    }

#ifndef CONFIG_GFX_PQ
    enGpCsc = DRV_HIFB_ADP_GetCscTypeFromDisp(pstDispInfo->eColorSpace);
#else
    enGpCsc = DRV_HIFB_ADP_GetCscTypeFromDisp(pstDispInfo->eColorSpace);
#endif
    g_pstGfxGPDevice[enGpId]->enOutputCsc = enGpCsc;

#ifndef CONFIG_HIFB_VERSION_1_0
    bHDR = (HI_DRV_DISP_PROCESS_MODE_HDR == pstDispInfo->enDispProcessMode)? (HI_TRUE) : (HI_FALSE);
#endif
    g_pstGfxGPDevice[enGpId]->bHdr = bHDR;

#ifndef CONFIG_HIFB_VERSION_1_0
    if ((HI_FALSE == bHDR) || (HIFB_ADP_GP1 == enGpId))
#endif
    {
        HIFB_ADP_SetGpCsc(enGpId, g_pstGfxGPDevice[enGpId]->bBGRState);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == enGpId))
    {
        DRV_HIFB_WBC_Process(enGpId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func        : OPTM_GfxChn2DispChn
* description : CNcomment: 获取display通道 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_DRV_DISPLAY_E OPTM_GfxChn2DispChn(OPTM_DISPCHANNEL_E enDispCh)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (OPTM_DISPCHANNEL_0 == enDispCh)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_DRV_DISPLAY_0;
    }

    if (OPTM_DISPCHANNEL_1 == enDispCh)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_DRV_DISPLAY_1;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_DRV_DISPLAY_BUTT;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetCallbackToDisp
* description  : CNcomment: 向Display注册中断 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetCallbackToDisp(HIFB_GP_ID_E enGPId, IntCallBack pCallBack, HI_DRV_DISP_CALLBACK_TYPE_E eType, HI_BOOL bFlag)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_DRV_DISPLAY_E enDisp;
    HI_DRV_DISP_CALLBACK_S stCallback;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);
    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(eType, HI_DRV_DISP_C_TYPE_BUTT, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pCallBack, HI_FAILURE);

    if (bFlag == g_pstGfxGPIrq[enGPId]->bRegistered[eType])
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    enDisp = OPTM_GfxChn2DispChn(g_pstGfxGPDevice[enGPId]->enDispCh);
    stCallback.hDst = (HI_VOID*)(&g_pstGfxGPDevice[enGPId]->enGpHalId);
    stCallback.pfDISP_Callback = (HI_VOID*)pCallBack;

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_DispExportFuncs, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(ps_DispExportFuncs->pfnDispRegCallback, HI_FAILURE);
    if (bFlag)
    {
        s32Ret = ps_DispExportFuncs->pfnDispRegCallback(enDisp, eType, &stCallback);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        s32Ret = ps_DispExportFuncs->pfnDispUnRegCallback(enDisp, eType, &stCallback);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HI_SUCCESS == s32Ret)
    {
        g_pstGfxGPIrq[enGPId]->bRegistered[eType] = bFlag;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return s32Ret;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_ADP_OpenLayer
* description  : CNcomment: 打开图层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_OpenLayer(HIFB_LAYER_ID_E enLayerId)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);

    if (HI_TRUE != g_pstGfxCap[enLayerId]->bLayerSupported)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxCap[enLayerId]->bLayerSupported);
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "this layer can not support");
        return HI_FAILURE;
    }

    if (HI_TRUE == g_pstGfxDevice[enLayerId]->bOpened)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

#ifndef HI_BUILD_IN_BOOT
    Ret = HI_DRV_MODULE_GetFunction(HI_ID_PQ, (HI_VOID**)&gs_pstPqFuncs);
    if ((HI_SUCCESS != Ret) || (NULL == gs_pstPqFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get pq func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return HI_FAILURE;
    }
#endif

    Ret = DRV_HIFB_ADP_GFX_InitLayer(enLayerId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_GFX_InitLayer, Ret);
        return HI_FAILURE;
    }

    Ret = DRV_HIFB_ADP_GP_Open(g_pstGfxDevice[enLayerId]->enGPId);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_GP_Open, Ret);
        return HI_FAILURE;
    }

    g_pstGfxDevice[enLayerId]->bOpened = HI_TRUE;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_CloseLayer
* description : CNcomment: 关闭打开的图层 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_CloseLayer(HIFB_LAYER_ID_E enLayerId)
{
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    enGPId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGPId);

    /** close master ui **/
    DRV_HIFB_ADP_SetEnable         (enLayerId, HI_FALSE);
    DRV_HIFB_HAL_GFX_SetNoSecFlag  (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_TRUE);
    DRV_HIFB_HAL_GFX_SetRegUp      (g_pstGfxDevice[enLayerId]->enGfxHalId);
    DRV_HIFB_ADP_ReleaseClutBuf    (enLayerId);

    DRV_HIFB_ADP_GP_Close(enGPId);

    g_pstGfxDevice[enLayerId]->bExtractLine = HI_FALSE;
    g_pstGfxDevice[enLayerId]->bOpened      = HI_FALSE;

    /** close wbc **/
    if (HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode)
    {
        g_enOptmGfxWorkMode = HIFB_GFX_MODE_NORMAL;

        DRV_HIFB_WBC_CloseLayer (OPTM_SLAVER_LAYERID);
        DRV_HIFB_ADP_GP_Close   (OPTM_SLAVER_GPID);

        g_pstGfxDevice[HIFB_LAYER_SD_0]->bExtractLine = HI_FALSE;
        g_pstGfxDevice[HIFB_LAYER_SD_0]->bOpened      = HI_FALSE;

        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "run close wbc");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_SetEnable
* description : CNcomment: 图层使能 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetEnable(HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable)
{
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGPId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->bEnable = bEnable;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGPId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, bEnable);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxGPDevice[enGPId]->bMaskFlag);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_enOptmGfxWorkMode);

    if (HI_TRUE == g_pstGfxGPDevice[enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    DRV_HIFB_HAL_GFX_SetLayerEnable (g_pstGfxDevice[enLayerId]->enGfxHalId, bEnable);
    DRV_HIFB_HAL_GFX_SetRegUp       (g_pstGfxDevice[enLayerId]->enGfxHalId);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP0 == enGPId))
    {
        DRV_HIFB_WBC_SetEnable(bEnable);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call DRV_HIFB_WBC_SetEnable");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetEnable
* description : CNcomment: 图层使能 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_GetEnable(HIFB_LAYER_ID_E enLayerId, HI_BOOL* pbEnable)
{
#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    DRV_HIFB_HAL_GFX_GetLayerEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, pbEnable);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pbEnable);
#endif
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayerAddr
* description  : CNcomment: 设置显示地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 u32Addr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->NoCmpBufAddr = u32Addr;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT,  enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, g_pstGfxDevice[enLayerId]->NoCmpBufAddr);

    if (HI_TRUE == g_pstGfxGPDevice[g_pstGfxDevice[enLayerId]->enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    DRV_HIFB_HAL_GFX_SetLayerAddrEX(g_pstGfxDevice[enLayerId]->enGfxHalId, u32Addr);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_GetLayerAddr
* description   : CNcomment: 获取显示地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_GetLayerAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 *pu32Addr)
{
#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    DRV_HIFB_HAL_GFX_GetLayerAddr(g_pstGfxDevice[enLayerId]->enGfxHalId, pu32Addr);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pu32Addr);
#endif
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_GetLayerWorkAddr
* description   : CNcomment: 获取已经工作的显存地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_ADP_GetLayerWorkAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress)
{
#if !defined(HI_BUILD_IN_BOOT) && !defined(CONFIG_HIFB_VERSION_1_0)
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pAddress);
    DRV_HIFB_HAL_GFX_GetWorkLayerAddr(g_pstGfxDevice[enLayerId]->enGfxHalId, pAddress);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pAddress);
#endif
    return;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_GetLayerWillWorkAddr
* description   : CNcomment: 获取将要工作的显存地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_VOID DRV_HIFB_ADP_GetLayerWillWorkAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress)
{
#if !defined(HI_BUILD_IN_BOOT) && !defined(CONFIG_HIFB_VERSION_1_0)
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pAddress);
    DRV_HIFB_HAL_GFX_GetWillWorkLayerAddr(g_pstGfxDevice[enLayerId]->enGfxHalId, pAddress);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pAddress);
#endif
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_SetLayerStride
* description : CNcomment: 设置图层stride CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerStride(HIFB_LAYER_ID_E enLayerId, HI_U32 u32Stride)
{
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGPId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->Stride = (HI_U16)u32Stride;
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enLayerId);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->Stride);

    if (HI_TRUE == g_pstGfxGPDevice[enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (g_pstGfxGPDevice[enGPId]->bNeedExtractLine && (OPTM_CURSOR_LAYERID != enLayerId))
    {
        DRV_HIFB_HAL_GFX_SetLayerStride(g_pstGfxDevice[enLayerId]->enGfxHalId, (u32Stride * 2));
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        DRV_HIFB_HAL_GFX_SetLayerStride(g_pstGfxDevice[enLayerId]->enGfxHalId, u32Stride);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetLayerStride
* description : CNcomment: 设置图层stride CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_GetLayerStride(HIFB_LAYER_ID_E enLayerId, HI_U32 *pStride)
{
#ifndef HI_BUILD_IN_BOOT
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pStride);
    DRV_HIFB_HAL_GFX_GetLayerStride(g_pstGfxDevice[enLayerId]->enGfxHalId, pStride);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pStride);
#endif
    return;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func        : DRV_HIFB_ADP_HalFmtTransferToPixerFmt
* description : CNcomment: 由VDP像素格式转换成hifb像素格式 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HIFB_COLOR_FMT_E DRV_HIFB_ADP_HalFmtTransferToPixerFmt(OPTM_VDP_GFX_IFMT_E enDataFmt)
{
    HIFB_COLOR_FMT_E ePixFmt = HIFB_FMT_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    ePixFmt = OPTM_ClutHalFmtTransferToPixFmt(enDataFmt);
    if (HIFB_FMT_BUTT != ePixFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return ePixFmt;
    }

    ePixFmt = OPTM_XYCbCrHalFmtTransferToPixFmt(enDataFmt);
    if (HIFB_FMT_BUTT != ePixFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return ePixFmt;
    }

    ePixFmt = OPTM_RGBHalFmtTransferToPixFmt(enDataFmt);
    if (HIFB_FMT_BUTT != ePixFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return ePixFmt;
    }

    ePixFmt = OPTM_XRGBHalFmtTransferToPixFmt(enDataFmt);
    if (HIFB_FMT_BUTT != ePixFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return ePixFmt;
    }

    return HIFB_FMT_BUTT;
}

static inline HIFB_COLOR_FMT_E OPTM_ClutHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
         case VDP_GFX_IFMT_CLUT_1BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_1BPP;
         case VDP_GFX_IFMT_CLUT_2BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_2BPP;
         case VDP_GFX_IFMT_CLUT_4BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_4BPP;
         case VDP_GFX_IFMT_CLUT_8BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_8BPP;
         case VDP_GFX_IFMT_ACLUT_44:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_ACLUT44;
         case VDP_GFX_IFMT_ACLUT_88:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_ACLUT88;
         default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_BUTT;
     }
}

static inline HIFB_COLOR_FMT_E OPTM_RGBHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
         case VDP_GFX_IFMT_RGB_565:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGB565;
         case VDP_GFX_IFMT_RGB_888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGB888;
         default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_BUTT;
     }
}

static inline HIFB_COLOR_FMT_E OPTM_XRGBHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch(enDataFmt)
     {
        case VDP_GFX_IFMT_RGB_444:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HIFB_FMT_KRGB444;
        case VDP_GFX_IFMT_RGB_555:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HIFB_FMT_KRGB555;
        case VDP_GFX_IFMT_ARGB_8565:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HIFB_FMT_ARGB8565;
        case VDP_GFX_IFMT_KRGB_888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HIFB_FMT_KRGB888;
        case VDP_GFX_IFMT_ARGB_8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_ARGB8888;
        case VDP_GFX_IFMT_ARGB_4444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_ARGB4444;
        case VDP_GFX_IFMT_ARGB_1555:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_ARGB1555;
        case VDP_GFX_IFMT_RGBA_4444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGBA4444;
        case VDP_GFX_IFMT_RGBA_5551:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGBA5551;
        case VDP_GFX_IFMT_RGBA_5658:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGBA5658;
        case VDP_GFX_IFMT_RGBA_8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_RGBA8888;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_BUTT;
     }
}

static inline HIFB_COLOR_FMT_E OPTM_XYCbCrHalFmtTransferToPixFmt(OPTM_VDP_GFX_IFMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch(enDataFmt)
     {
         case VDP_GFX_IFMT_PKG_UYVY:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_PUYVY;
         case VDP_GFX_IFMT_PKG_YUYV:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_PYUYV;
         case VDP_GFX_IFMT_PKG_YVYU:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_PYVYU;
         case VDP_GFX_IFMT_YCBCR_888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_YUV888;
         case VDP_GFX_IFMT_AYCBCR_8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_AYUV8888;
         case VDP_GFX_IFMT_YCBCRA_8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_YUVA8888;
         default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HIFB_FMT_BUTT;
     }
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_ADP_PixerFmtTransferToHalFmt
* description   : CNcomment: 由hifb像素格式转换成图形层像素格式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
OPTM_VDP_GFX_IFMT_E DRV_HIFB_ADP_PixerFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt)
{
    OPTM_VDP_GFX_IFMT_E eHalFmt = VDP_GFX_IFMT_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    eHalFmt = OPTM_ClutPixFmtTransferToHalFmt(enDataFmt);
    if (VDP_GFX_IFMT_BUTT != eHalFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return eHalFmt;
    }

    eHalFmt = OPTM_XRGBPixFmtTransferToHalFmt(enDataFmt);
    if (VDP_GFX_IFMT_BUTT != eHalFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return eHalFmt;
    }

    eHalFmt = OPTM_RGBPixFmtTransferToHalFmt(enDataFmt);
    if (VDP_GFX_IFMT_BUTT != eHalFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return eHalFmt;
    }

    eHalFmt = OPTM_XYCbCrPixFmtTransferToHalFmt(enDataFmt);
    if (VDP_GFX_IFMT_BUTT != eHalFmt)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return eHalFmt;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return VDP_GFX_IFMT_BUTT;
}

static inline OPTM_VDP_GFX_IFMT_E OPTM_ClutPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
        case HIFB_FMT_1BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_CLUT_1BPP;
        case HIFB_FMT_2BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_CLUT_2BPP;
        case HIFB_FMT_4BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_CLUT_4BPP;
        case HIFB_FMT_8BPP:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_CLUT_8BPP;
        case HIFB_FMT_ACLUT44:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ACLUT_44;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_BUTT;
     }
}

static inline OPTM_VDP_GFX_IFMT_E OPTM_RGBPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
        case HIFB_FMT_KRGB444:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_RGB_444;
        case HIFB_FMT_KRGB555:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_RGB_555;
        case HIFB_FMT_RGB565:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGB_565;
        case HIFB_FMT_RGB888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_RGB_888;
        case HIFB_FMT_YUV888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_YCBCR_888;
        case HIFB_FMT_KRGB888:
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_KRGB_888;
        case HIFB_FMT_BGR565:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGB_565;
        case HIFB_FMT_BGR888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGB_888;
        case HIFB_FMT_KBGR444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGB_444;
        case HIFB_FMT_KBGR555:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGB_555;
        case HIFB_FMT_KBGR888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_KRGB_888;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_BUTT;
     }
}

static inline OPTM_VDP_GFX_IFMT_E OPTM_XRGBPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
        case HIFB_FMT_ARGB8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_8888;
        case HIFB_FMT_ARGB4444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_4444;
        case HIFB_FMT_ARGB1555:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_1555;
        case HIFB_FMT_RGBA4444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGBA_4444;
        case HIFB_FMT_RGBA5551:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGBA_5551;
        case HIFB_FMT_RGBA5658:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGBA_5658;
        case HIFB_FMT_RGBA8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_RGBA_8888;
        case HIFB_FMT_ABGR4444:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_4444;
        case HIFB_FMT_ABGR1555:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_1555;
        case HIFB_FMT_ABGR8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ABGR_8888;
        case HIFB_FMT_ABGR8565:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_8565;
        case HIFB_FMT_ARGB8565:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_ARGB_8565;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_BUTT;
     }
}

static inline OPTM_VDP_GFX_IFMT_E OPTM_XYCbCrPixFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt)
{
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
     switch (enDataFmt)
     {
        case HIFB_FMT_PUYVY:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_PKG_UYVY;
        case HIFB_FMT_PYUYV:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_PKG_YUYV;
        case HIFB_FMT_PYVYU:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_PKG_YVYU;
        case HIFB_FMT_ACLUT88:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return VDP_GFX_IFMT_ACLUT_88;
        case HIFB_FMT_YUVA8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_YCBCRA_8888;
        case HIFB_FMT_AYUV8888:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_AYCBCR_8888;
        default:
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return VDP_GFX_IFMT_BUTT;
     }
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_SetLayerDataFmt
* description : CNcomment: 设置图层格式 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerDataFmt(HIFB_LAYER_ID_E enLayerId, HIFB_COLOR_FMT_E enDataFmt)
{
    HI_S32 Ret = HI_SUCCESS;
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGPId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(enDataFmt, HIFB_FMT_BUTT, HI_FAILURE);
    if (HI_FALSE == g_pstGfxCap[enLayerId]->bColFmt[enDataFmt])
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enDataFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxCap[enLayerId]->bColFmt[enDataFmt]);
        return HI_FAILURE;
    }

    g_pstGfxDevice[enLayerId]->enDataFmt = enDataFmt;

    OPTM_CheckGPMask_BYGPID(enGPId);

    if (   (HIFB_FMT_ABGR8888 != enDataFmt)
        && ((enDataFmt >= HIFB_FMT_BGR565) && (HIFB_FMT_KBGR888 >= enDataFmt))
        && (g_pstGfxDevice[enLayerId]->CscState == OPTM_CSC_SET_PARA_RGB))
    {
        Ret = HIFB_ADP_SetLayerDataBigEndianFmt(enLayerId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_SetLayerDataBigEndianFmt");
    }
    else if (  ((HIFB_FMT_ABGR8888 == enDataFmt) || (HIFB_FMT_BGR565 > enDataFmt || enDataFmt > HIFB_FMT_KBGR888))
            && (g_pstGfxDevice[enLayerId]->CscState == OPTM_CSC_SET_PARA_BGR))
    {
        Ret = HIFB_ADP_SetLayerDataLittleEndianFmt(enLayerId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_SetLayerDataLittleEndianFmt");
    }

    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enDataFmt);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->CscState);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_SetLayerDataBigEndianFmt, Ret);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HIFB_ADP_SetLayerDataLittleEndianFmt, Ret);
        return HI_FAILURE;
    }

    DRV_HIFB_HAL_GFX_SetInDataFmt(g_pstGfxDevice[enLayerId]->enGfxHalId,DRV_HIFB_ADP_PixerFmtTransferToHalFmt(enDataFmt));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_S32 HIFB_ADP_SetLayerDataBigEndianFmt(HIFB_LAYER_ID_E enLayerId)
{
     HI_S32 s32Cnt = 0;
     HI_U32 u32LayerCount = 0;
     HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
     enGPId = g_pstGfxDevice[enLayerId]->enGPId;
     HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

     u32LayerCount = (HIFB_LAYER_HD_3 >= enLayerId) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;

     for (s32Cnt = 0; s32Cnt < u32LayerCount; s32Cnt++)
     {
         if ((s32Cnt != enLayerId) && (g_pstGfxDevice[s32Cnt]->bEnable) && (g_pstGfxDevice[s32Cnt]->CscState != OPTM_CSC_SET_PARA_BGR))
         {
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, s32Cnt);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[s32Cnt]->bEnable);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[s32Cnt]->CscState);
             return HI_FAILURE;
         }
     }

     g_pstGfxDevice[enLayerId]->CscState = OPTM_CSC_SET_PARA_BGR;
     g_pstGfxGPDevice[enGPId]->bBGRState = HI_TRUE;

     HIFB_ADP_SetGpCsc(enGPId, HI_TRUE);

     if (IS_MASTER_GP(enGPId))
     {
         HIFB_ADP_SetGpCsc(OPTM_SLAVER_GPID, HI_TRUE);
         g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bBGRState = HI_TRUE;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call HIFB_ADP_SetGpCsc for gp1");
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return HI_SUCCESS;
}

static inline HI_S32 HIFB_ADP_SetLayerDataLittleEndianFmt(HIFB_LAYER_ID_E enLayerId)
{
     HI_S32 s32Cnt = 0;
     HI_U32 u32LayerCount = 0;
     HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
     enGPId = g_pstGfxDevice[enLayerId]->enGPId;
     HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

     u32LayerCount = (HIFB_LAYER_HD_3 >= enLayerId) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;

     for (s32Cnt = 0; s32Cnt < u32LayerCount; s32Cnt++)
     {
         if ( (s32Cnt != enLayerId) && (g_pstGfxDevice[s32Cnt]->bEnable) && (g_pstGfxDevice[s32Cnt]->CscState != OPTM_CSC_SET_PARA_RGB))
         {
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, s32Cnt);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[s32Cnt]->bEnable);
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[s32Cnt]->CscState);
             return HI_FAILURE;
         }
     }

     g_pstGfxDevice[enLayerId]->CscState = OPTM_CSC_SET_PARA_RGB;
     g_pstGfxGPDevice[enGPId]->bBGRState = HI_FALSE;

     HIFB_ADP_SetGpCsc(enGPId, HI_FALSE);

     if(IS_MASTER_GP(enGPId))
     {
         HIFB_ADP_SetGpCsc(OPTM_SLAVER_GPID, HI_FALSE);
         g_pstGfxGPDevice[OPTM_SLAVER_GPID]->bBGRState = HI_FALSE;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetColorReg
* description  : CNcomment: 设置调色板颜色寄存器 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetColorReg(HIFB_LAYER_ID_E enLayerId, HI_U32 u32OffSet, HI_U32 u32Color, HI_S32 UpFlag)
{
    HI_U32 *pCTab = NULL;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    pCTab = (HI_U32 *)(g_pstGfxDevice[enLayerId]->stCluptTable.pu8StartVirAddr);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pCTab, HI_FAILURE);

    HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(u32OffSet, OPTM_CMAP_SIZE, HI_FAILURE);
    pCTab[u32OffSet] = u32Color;

    if (UpFlag != 0)
    {
        DRV_HIFB_HAL_GFX_SetParaUpd(g_pstGfxDevice[enLayerId]->enGfxHalId,VDP_DISP_COEFMODE_LUT);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func        : OPTM_GfxWVBCallBack
* description : CNcomment: 等中断完成 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_VOID OPTM_GfxWVBCallBack(HI_U32 enLayerId)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);

    if (HI_FALSE == g_pstGfxDevice[enLayerId]->bOpened)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    g_pstGfxDevice[enLayerId]->vblflag = 1;
    wake_up_interruptible(&(g_pstGfxDevice[enLayerId]->vblEvent));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_WaitVBlank
* description  : CNcomment: 等中断 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_WaitVBlank(HIFB_LAYER_ID_E enLayerId)
{
    HI_U32 u32TimeOutMs = (1000 * HZ) / 1000;
    HI_S32 s32Ret = HI_SUCCESS;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HIFB_CHECK_LAYER_OPEN(enLayerId);

    g_pstGfxDevice[enLayerId]->vblflag = 0;
    s32Ret = wait_event_interruptible_timeout(g_pstGfxDevice[enLayerId]->vblEvent, g_pstGfxDevice[enLayerId]->vblflag, u32TimeOutMs);
    if (s32Ret <= 0)
    {
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, u32TimeOutMs);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enLayerId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->vblflag);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "call wait_event_interruptible_timeout failure");
        return HI_FAILURE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#else
HI_S32 DRV_HIFB_ADP_WaitVBlank(HIFB_LAYER_ID_E enLayerId)
{
    HI_UNUSED(enLayerId);
    return HI_FAILURE;
}

#endif

/***************************************************************************************
* func        : DRV_HIFB_ADP_SetLayerDeFlicker
* description : CNcomment: 设置图层抗闪，不支持 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetLayerDeFlicker(HIFB_LAYER_ID_E enLayerId, HIFB_DEFLICKER_S *pstDeFlicker)
{
    HI_UNUSED(enLayerId);
    HI_UNUSED(pstDeFlicker);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayerAlpha
* description  : CNcomment: 设置图层alpha CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerAlpha(HIFB_LAYER_ID_E enLayerId, HIFB_ALPHA_S *pstAlpha)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstAlpha, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId, HI_FAILURE);

    HI_GFX_Memcpy(&g_pstGfxDevice[enLayerId]->stAlpha, pstAlpha, sizeof(HIFB_ALPHA_S));

    if (HI_TRUE == g_pstGfxGPDevice[g_pstGfxDevice[enLayerId]->enGPId]->bMaskFlag)
    {/** whether finish logo to app **/
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enLayerId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_pstGfxDevice[enLayerId]->enGPId);
        return HI_SUCCESS;
    }

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstAlpha->u8Alpha0);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_XINT, pstAlpha->u8Alpha1);

    DRV_HIFB_HAL_GFX_SetPalpha      (g_pstGfxDevice[enLayerId]->enGfxHalId, pstAlpha->bAlphaEnable, HI_TRUE, pstAlpha->u8Alpha0, pstAlpha->u8Alpha1);
    DRV_HIFB_HAL_GFX_SetLayerGalpha (g_pstGfxDevice[enLayerId]->enGfxHalId, pstAlpha->u8GlobalAlpha);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetLayerRect
* description : CNcomment: 获取图层输入分辨率 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_GetLayerRect(HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstRect)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstRect, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);

    HI_GFX_Memcpy(pstRect, &g_pstGfxDevice[enLayerId]->stInRect, sizeof(HIFB_RECT));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID DRV_HIFB_PrintLayerRect(HIFB_LAYER_ID_E enLayerId, HIFB_GP_ID_E enGpId, const OPTM_VDP_DISP_RECT_S *pstGfxRect, HI_BOOL RectChange, HI_U32 Line)
{
    if ((HI_TRUE == RectChange) && (NULL != pstGfxRect))
    {
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "=========================================================");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, Line);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enLayerId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->stInRect.x);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->stInRect.y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->stInRect.w);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxDevice[enLayerId]->stInRect.h);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, enGpId);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32X);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Y);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Width);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, g_pstGfxGPDevice[enGpId]->stInRect.s32Height);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "disp position");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32DXS);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32DYS);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32DXL);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32DYL);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "video position");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32VX);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32VY);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32VX + pstGfxRect->u32OWth);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32VY + pstGfxRect->u32OHgt);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "input size");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32IWth);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32IHgt);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "output size");
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32OWth);
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstGfxRect->u32OHgt);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "=========================================================");
    }
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_SetLayerRect
* description   : CNcomment: 设置图层输入矩形 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerRect(HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstRect)
{
    HI_BOOL RectChange = HI_FALSE;
    HI_S32 Ret = HI_SUCCESS;
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    OPTM_VDP_DISP_RECT_S stGfxRect;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstRect, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    if (  (g_pstGfxDevice[enLayerId]->stInRect.x != pstRect->x) || (g_pstGfxDevice[enLayerId]->stInRect.y != pstRect->y)
        ||(g_pstGfxDevice[enLayerId]->stInRect.w != pstRect->w) || (g_pstGfxDevice[enLayerId]->stInRect.w != pstRect->w))
    {
        RectChange = HI_TRUE;
    }

    g_pstGfxDevice[enLayerId]->stInRect.x = pstRect->x;
    g_pstGfxDevice[enLayerId]->stInRect.y = pstRect->y;
    g_pstGfxDevice[enLayerId]->stInRect.w = pstRect->w;
    g_pstGfxDevice[enLayerId]->stInRect.h = pstRect->h;

    Ret = HIFB_PARA_CHECK_SUPPORT(HIFB_PARA_CHECK_WIDTH | HIFB_PARA_CHECK_HEIGHT,
                                  g_pstGfxDevice[enLayerId]->stInRect.w, g_pstGfxDevice[enLayerId]->stInRect.h, 0, 0, 0);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->stInRect.w);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->stInRect.h);
        return HI_FAILURE;
    }

    if (  (g_pstGfxDevice[enLayerId]->stInRect.x > CONFIG_HIFB_LAYER_MAXWIDTH)
        ||(g_pstGfxDevice[enLayerId]->stInRect.y > CONFIG_HIFB_LAYER_MAXHEIGHT))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->stInRect.x);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxDevice[enLayerId]->stInRect.y);
        return HI_FAILURE;
    }

    if (HI_TRUE == g_pstGfxGPDevice[enGpId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    HI_GFX_Memset(&stGfxRect, 0, sizeof(stGfxRect));

    stGfxRect.u32DXL  = 0;
    stGfxRect.u32DYL  = 0;
    stGfxRect.u32OWth = 0;
    stGfxRect.u32VX   = g_pstGfxDevice[enLayerId]->stInRect.x;
    stGfxRect.u32VY   = g_pstGfxDevice[enLayerId]->stInRect.y;
    stGfxRect.u32IWth = g_pstGfxDevice[enLayerId]->stInRect.w;
    stGfxRect.u32IHgt = g_pstGfxDevice[enLayerId]->stInRect.h;
    stGfxRect.u32DXS  = g_pstGfxDevice[enLayerId]->stInRect.x;
    stGfxRect.u32DYS  = g_pstGfxDevice[enLayerId]->stInRect.y;
    DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(g_pstGfxCap[enLayerId]->u32MinWidth,  g_pstGfxGPDevice[enGpId]->stInRect.s32Width, HI_FAILURE);
    if (g_pstGfxDevice[enLayerId]->stInRect.x > g_pstGfxGPDevice[enGpId]->stInRect.s32Width - g_pstGfxCap[enLayerId]->u32MinWidth)
    {
        g_pstGfxDevice[enLayerId]->stInRect.x = g_pstGfxGPDevice[enGpId]->stInRect.s32Width - g_pstGfxCap[enLayerId]->u32MinWidth;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }

    HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(g_pstGfxCap[enLayerId]->u32MinHeight, g_pstGfxGPDevice[enGpId]->stInRect.s32Height, HI_FAILURE);
    if (g_pstGfxDevice[enLayerId]->stInRect.y > g_pstGfxGPDevice[enGpId]->stInRect.s32Height - g_pstGfxCap[enLayerId]->u32MinHeight)
    {
        g_pstGfxDevice[enLayerId]->stInRect.y = g_pstGfxGPDevice[enGpId]->stInRect.s32Height - g_pstGfxCap[enLayerId]->u32MinHeight;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }

    if (!IS_SLAVER_GP(enGpId))
    {
        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->stInRect.x, g_pstGfxGPDevice[enGpId]->stInRect.s32Width, HI_FAILURE);
        if ((g_pstGfxDevice[enLayerId]->stInRect.x + g_pstGfxDevice[enLayerId]->stInRect.w) > g_pstGfxGPDevice[enGpId]->stInRect.s32Width)
        {
            stGfxRect.u32IWth = g_pstGfxGPDevice[enGpId]->stInRect.s32Width - g_pstGfxDevice[enLayerId]->stInRect.x;
            DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
        }

        HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->stInRect.y, g_pstGfxGPDevice[enGpId]->stInRect.s32Height, HI_FAILURE);
        if ((g_pstGfxDevice[enLayerId]->stInRect.y + g_pstGfxDevice[enLayerId]->stInRect.h) > g_pstGfxGPDevice[enGpId]->stInRect.s32Height)
        {
            stGfxRect.u32IHgt = g_pstGfxGPDevice[enGpId]->stInRect.s32Height - g_pstGfxDevice[enLayerId]->stInRect.y;
            DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
        }
    }

    if (g_pstGfxGPDevice[enGpId]->bNeedExtractLine)
    {/** 是否抽行处理 **/
        stGfxRect.u32IHgt /= 2;
        stGfxRect.u32VY   /= 2;
        stGfxRect.u32DYS  /= 2;
        g_pstGfxDevice[enLayerId]->bExtractLine = HI_TRUE;
        DRV_HIFB_HAL_GFX_SetLayerStride(g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->Stride * 2);
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }
    else if (HI_TRUE == g_pstGfxDevice[enLayerId]->bExtractLine)
    {
        DRV_HIFB_ADP_SetLayerStride(enLayerId, g_pstGfxDevice[enLayerId]->Stride);
        g_pstGfxDevice[enLayerId]->bExtractLine = HI_FALSE;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }

    stGfxRect.u32OWth = stGfxRect.u32IWth;
    stGfxRect.u32OHgt = stGfxRect.u32IHgt;
    stGfxRect.u32DXL  = g_pstGfxDevice[enLayerId]->stInRect.x + stGfxRect.u32OWth;
    stGfxRect.u32DYL  = g_pstGfxDevice[enLayerId]->stInRect.y + stGfxRect.u32OHgt;
    DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);

    if ( (g_enOptmGfxWorkMode == HIFB_GFX_MODE_NORMAL) && (enGpId == HIFB_ADP_GP1))
    {
        stGfxRect.u32DXS = 0;
        stGfxRect.u32DYS = 0;
        stGfxRect.u32DXL = g_pstGfxGPDevice[enGpId]->stInRect.s32Width;
        stGfxRect.u32DYL = g_pstGfxGPDevice[enGpId]->stInRect.s32Height;
        if (g_pstGfxGPDevice[enGpId]->bNeedExtractLine)
        {
            stGfxRect.u32DYL /= 2;
            DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
        }
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxDevice[enLayerId]->enTriDimMode)
    {
        stGfxRect.u32IWth = stGfxRect.u32IWth / 2;
        stGfxRect.u32IWth &= 0xfffffffe;
        stGfxRect.u32OWth = (stGfxRect.u32IWth) * 2;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }
    else if (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxDevice[enLayerId]->enTriDimMode)
    {
        stGfxRect.u32IHgt = stGfxRect.u32IHgt / 2;
        stGfxRect.u32IHgt &= 0xfffffffe;
        stGfxRect.u32OHgt = (stGfxRect.u32IHgt) * 2;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }
#endif

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if ((OPTM_CURSOR_LAYERID != enLayerId) || (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxDevice[enLayerId]->enTriDimMode) || (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxDevice[enLayerId]->enTriDimMode))
#else
    if (OPTM_CURSOR_LAYERID != enLayerId)
#endif
    {/** cursor support odd size **/
        stGfxRect.u32VX   &= 0xfffffffe;
        stGfxRect.u32VY   &= 0xfffffffe;
        stGfxRect.u32DXS  &= 0xfffffffe;
        stGfxRect.u32DYS  &= 0xfffffffe;
        stGfxRect.u32DXL  &= 0xfffffffe;
        stGfxRect.u32DYL  &= 0xfffffffe;
        stGfxRect.u32IWth &= 0xfffffffe;
        stGfxRect.u32IHgt &= 0xfffffffe;
        stGfxRect.u32OWth &= 0xfffffffe;
        stGfxRect.u32OHgt &= 0xfffffffe;
        DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);
    }

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    if ((OPTM_CURSOR_LAYERID != enLayerId) || (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxDevice[enLayerId]->enTriDimMode) || (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxDevice[enLayerId]->enTriDimMode))
#else
    if (OPTM_CURSOR_LAYERID != enLayerId)
#endif
    {/** not support odd size **/
        if ((0 != stGfxRect.u32VX % 2) || (0 != stGfxRect.u32VY % 2) || (0 != stGfxRect.u32DXS % 2) || (0 != stGfxRect.u32DYS % 2))
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stGfxRect.u32VX);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stGfxRect.u32VY);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stGfxRect.u32DXS);
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stGfxRect.u32DYS);
            HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "not support odd size");
        }
    }

    DRV_HIFB_HAL_GFX_SetLayerReso(g_pstGfxDevice[enLayerId]->enGfxHalId, &stGfxRect);

    DRV_HIFB_PrintLayerRect(enLayerId, enGpId, &stGfxRect, RectChange, __LINE__);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_GetDispFMTSize
* description   : CNcomment: 获取disp大小 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
STATIC HI_S32 DRV_HIFB_ADP_GetDispFMTSize(HIFB_LAYER_ID_E LayerId, HIFB_RECT *pstOutRect)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOutRect, HI_FAILURE);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(LayerId, HI_FAILURE);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    pstOutRect->x = g_pstGfxGPDevice[enGpId]->stOutRect.s32X;
    pstOutRect->y = g_pstGfxGPDevice[enGpId]->stOutRect.s32Y;
    pstOutRect->w = g_pstGfxGPDevice[enGpId]->stOutRect.s32Width;
    pstOutRect->h = g_pstGfxGPDevice[enGpId]->stOutRect.s32Height;

    if (pstOutRect->w == 0 || pstOutRect->h == 0)
    {
        pstOutRect->x = 0;
        pstOutRect->y = 0;
        pstOutRect->w = 1280;
        pstOutRect->h = 720;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (pstOutRect->w == 1440 && (pstOutRect->h == 576 || pstOutRect->h == 480))
    {
        pstOutRect->w /= 2;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : OPTM_GfxSetDispFMTSize
* description  : CNcomment: 设置display像素格式和大小 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 OPTM_GfxSetDispFMTSize(HIFB_GP_ID_E enGpId, const HI_RECT_S *pstOutRect)
{
    HI_U32 u32Ratio = 0;
    HIFB_RECT stInputRect = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOutRect, HI_FAILURE);

    if (pstOutRect->s32Width <= 0 || pstOutRect->s32Height <= 0)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstOutRect->s32Width);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, pstOutRect->s32Height);
        return HI_FAILURE;
    }

    g_pstGfxGPDevice[enGpId]->stOutRect.s32X = pstOutRect->s32X;
    g_pstGfxGPDevice[enGpId]->stOutRect.s32Y = pstOutRect->s32Y;
    if (pstOutRect->s32X < 0)
    {
        g_pstGfxGPDevice[enGpId]->stOutRect.s32X = 0;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstOutRect->s32X);
    }
    if (pstOutRect->s32Y < 0)
    {
        g_pstGfxGPDevice[enGpId]->stOutRect.s32Y = 0;
        HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_INT, pstOutRect->s32Y);
    }

    g_pstGfxGPDevice[enGpId]->stOutRect.s32Width  = pstOutRect->s32Width;
    g_pstGfxGPDevice[enGpId]->stOutRect.s32Height = pstOutRect->s32Height;

    OPTM_CheckGPMask_BYGPID(enGpId);

    stInputRect.x = g_pstGfxGPDevice[enGpId]->stInRect.s32X;
    stInputRect.y = g_pstGfxGPDevice[enGpId]->stInRect.s32Y;
    stInputRect.w = g_pstGfxGPDevice[enGpId]->stInRect.s32Width;
    stInputRect.h = g_pstGfxGPDevice[enGpId]->stInRect.s32Height;

    /*judge wether need to extract line for layer or not*/
    u32Ratio =  g_pstGfxGPDevice[enGpId]->stInRect.s32Height * 2;
    u32Ratio /= g_pstGfxGPDevice[enGpId]->stOutRect.s32Height;

    if (g_pstGfxGPDevice[enGpId]->bInterface)
    {
        //u32Ratio *= 2;
    }

    if (u32Ratio >= OPTM_EXTRACTLINE_RATIO && !IS_SLAVER_GP(enGpId))
    {
        g_pstGfxGPDevice[enGpId]->bNeedExtractLine = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        g_pstGfxGPDevice[enGpId]->bNeedExtractLine = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (stInputRect.w && stInputRect.h)
    {
        DRV_HIFB_ADP_SetGpRect(enGpId, &stInputRect);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_SetGpRect
* description : CNcomment: 设置GP RECT CNend\n
*                    (1)回写更新需要设置GP寄存器
                      (2)显示制式发生变化的时候
                      (3)输入分辨率发生变化的时候
                      (4)待机打开图层需要重新配置GP
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
#ifndef CONFIG_GFX_PQ
#define SHARPEN_RATIO        3
#define SHARPEN_MAX_WIDTH    1920
HI_S32 DRV_HIFB_ADP_SetGpRect(HIFB_GP_ID_E enGpId, const HIFB_RECT * pstInputRect)
{
    HI_BOOL bGfxSharpen = HI_FALSE;
    OPTM_VDP_DISP_RECT_S stGfxRect        = {0};
    OPTM_ALG_GZME_DRV_PARA_S stZmeDrvPara = {0};
    OPTM_ALG_GZME_RTL_PARA_S stZmeRtlPara = {0};
    OPTM_ALG_GDTI_DRV_PARA_S stDtiDrvPara = {0};
    OPTM_ALG_GDTI_RTL_PARA_S stDtiRtlPara = {0};
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstInputRect, HI_FAILURE);

    g_pstGfxGPDevice[enGpId]->stInRect.s32Width  = pstInputRect->w;
    g_pstGfxGPDevice[enGpId]->stInRect.s32Height = pstInputRect->h;

    OPTM_CheckGPMask_BYGPID(enGpId);

    stGfxRect.u32IWth = g_pstGfxGPDevice[enGpId]->stInRect.s32Width   & 0xfffffffe;
    stGfxRect.u32IHgt = g_pstGfxGPDevice[enGpId]->stInRect.s32Height  & 0xfffffffe;
    stGfxRect.u32OWth = g_pstGfxGPDevice[enGpId]->stOutRect.s32Width  & 0xfffffffe;
    stGfxRect.u32OHgt = g_pstGfxGPDevice[enGpId]->stOutRect.s32Height & 0xfffffffe;

    stGfxRect.u32DXS  = g_pstGfxGPDevice[enGpId]->stOutRect.s32X & 0xfffffffe;
    stGfxRect.u32DYS  = g_pstGfxGPDevice[enGpId]->stOutRect.s32Y & 0xfffffffe;

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OWth,stGfxRect.u32DXS,HI_FAILURE);
    stGfxRect.u32DXL  = stGfxRect.u32OWth + stGfxRect.u32DXS;
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OHgt,stGfxRect.u32DYS,HI_FAILURE);
    stGfxRect.u32DYL  = stGfxRect.u32OHgt + stGfxRect.u32DYS;

    stGfxRect.u32VX   = stGfxRect.u32DXS;
    stGfxRect.u32VY   = stGfxRect.u32DYS;

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OWth,stGfxRect.u32VX,HI_FAILURE);
    stGfxRect.u32VXL  = stGfxRect.u32OWth + stGfxRect.u32VX;
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OHgt,stGfxRect.u32VY,HI_FAILURE);
    stGfxRect.u32VYL  = stGfxRect.u32OHgt + stGfxRect.u32VY;

    if ((stGfxRect.u32IWth == 0) || (stGfxRect.u32IHgt == 0) || (stGfxRect.u32OWth == 0) || (stGfxRect.u32OHgt == 0))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (g_pstGfxGPDevice[enGpId]->bNeedExtractLine == HI_TRUE)
    {
        stGfxRect.u32IHgt /= 2;
    }

    DRV_HIFB_HAL_GP_SetLayerReso(g_pstGfxGPDevice[enGpId]->enGpHalId, &stGfxRect);

    stZmeDrvPara.bZmeFrmFmtIn  = HI_TRUE;
    stZmeDrvPara.bZmeFrmFmtOut = g_pstGfxGPDevice[enGpId]->bInterface ? HI_FALSE : HI_TRUE;

    if (IS_SLAVER_GP(enGpId))
    {
        stGfxRect.u32IWth  = g_stGfxWbc2.stInRect.w & 0xfffffffe;
        stGfxRect.u32IHgt  = g_stGfxWbc2.stInRect.h & 0xfffffffe;

        if (stGfxRect.u32IWth == 0 || stGfxRect.u32IHgt == 0)
        {
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HI_SUCCESS;
        }

        if (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
        {
            stGfxRect.u32IWth /= 2;
        }
        else if (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
        {
            stGfxRect.u32IHgt /= 2;
        }

        if ((g_pstGfxGPDevice[OPTM_MASTER_GPID]->bNeedExtractLine == HI_TRUE))
        {
            stGfxRect.u32IHgt /= 2;
        }

        DRV_HIFB_WBC_SetCropReso(stGfxRect);
    }

    stZmeDrvPara.u32ZmeFrmWIn  = stGfxRect.u32IWth;
    stZmeDrvPara.u32ZmeFrmHIn  = stGfxRect.u32IHgt;
    stZmeDrvPara.u32ZmeFrmWOut = stGfxRect.u32OWth;
    stZmeDrvPara.u32ZmeFrmHOut = stGfxRect.u32OHgt;

    if (OPTM_DISPCHANNEL_1 == g_pstGfxGPDevice[enGpId]->enDispCh)
    {
        stZmeDrvPara.u32ZmeHdDeflicker = g_pstGfxGPDevice[enGpId]->u32ZmeDeflicker;
        OPTM_ALG_GZmeHDSet(&gs_stGPZme, &stZmeDrvPara, &stZmeRtlPara);
    }
    else if (OPTM_DISPCHANNEL_0 == g_pstGfxGPDevice[enGpId]->enDispCh)
    {
        stZmeDrvPara.u32ZmeSdDeflicker = g_pstGfxGPDevice[enGpId]->u32ZmeDeflicker;
        OPTM_ALG_GZmeSDSet(&gs_stGPZme, &stZmeDrvPara, &stZmeRtlPara);
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enGpId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, g_pstGfxGPDevice[enGpId]->enDispCh);
        return HI_FAILURE;
    }

    stDtiDrvPara.u32ZmeFrmWIn  = stGfxRect.u32IWth;
    stDtiDrvPara.u32ZmeFrmHIn  = stGfxRect.u32IHgt;
    stDtiDrvPara.u32ZmeFrmWOut = stGfxRect.u32OWth;
    stDtiDrvPara.u32ZmeFrmHOut = stGfxRect.u32OHgt;

    OPTM_ALG_GDtiSet(&stDtiDrvPara, &stDtiRtlPara);

    if (stZmeDrvPara.u32ZmeFrmWIn > SHARPEN_MAX_WIDTH)
    {
        stZmeRtlPara.bZmeEnH = HI_FALSE;
        stZmeRtlPara.bZmeEnV = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    /*zme enable horizontal*/
    DRV_HIFB_HAL_GP_SetZmeEnable(enGpId, VDP_ZME_MODE_HOR, stZmeRtlPara.bZmeEnH);
    DRV_HIFB_HAL_GP_SetZmeEnable(enGpId, VDP_ZME_MODE_VER, stZmeRtlPara.bZmeEnV);

    if (stZmeRtlPara.bZmeEnH && stZmeRtlPara.bZmeEnV)
    {
        bGfxSharpen = HI_TRUE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, stDtiDrvPara.u32ZmeFrmWOut, HI_FAILURE);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, stDtiDrvPara.u32ZmeFrmHOut, HI_FAILURE);
    if (   (stDtiDrvPara.u32ZmeFrmWIn * 2 / stDtiDrvPara.u32ZmeFrmWOut > SHARPEN_RATIO) \
        || (stDtiDrvPara.u32ZmeFrmHIn * 2/ stDtiDrvPara.u32ZmeFrmHOut > SHARPEN_RATIO))
    {
        bGfxSharpen = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HIFB_ADP_SetZme(enGpId,bGfxSharpen,&stZmeRtlPara,&stDtiRtlPara);

    DRV_HIFB_HAL_GP_SetParaUpd(g_pstGfxGPDevice[enGpId]->enGpHalId, VDP_ZME_MODE_HOR);
    DRV_HIFB_HAL_GP_SetParaUpd(g_pstGfxGPDevice[enGpId]->enGpHalId, VDP_ZME_MODE_VER);

    HIFB_ADP_ResetLayerInRect(enGpId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static inline HI_VOID HIFB_ADP_SetZme(HIFB_GP_ID_E enGpId, HI_BOOL bGfxSharpen, OPTM_ALG_GZME_RTL_PARA_S *pstZmeRtlPara, OPTM_ALG_GDTI_RTL_PARA_S *pstDtiRtlPara)
{
    HI_BOOL  bSlvGp = HI_FALSE;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (IS_SLAVER_GP(enGpId))
    {
       bSlvGp  = HI_TRUE;
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstZmeRtlPara);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDtiRtlPara);

    if ((HI_FALSE == pstZmeRtlPara->bZmeEnH) && (HI_FALSE == pstZmeRtlPara->bZmeEnV))
    {
        DRV_HIFB_HAL_GP_SetTiEnable       (enGpId, VDP_TI_MODE_CHM, HI_FALSE);
        DRV_HIFB_HAL_GP_SetTiEnable       (enGpId, VDP_TI_MODE_LUM, HI_FALSE);
        DRV_HIFB_HAL_GP_SetIpOrder        (enGpId, bSlvGp, VDP_GP_ORDER_CSC);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return;
    }

    DRV_HIFB_HAL_GP_SetIpOrder            (enGpId, bSlvGp, VDP_GP_ORDER_ZME_CSC);
    DRV_HIFB_HAL_GP_SetZmeHfirOrder       (enGpId, VDP_ZME_ORDER_HV);
    DRV_HIFB_HAL_GP_SetZmeCoefAddr        (enGpId, VDP_GP_PARA_ZME_HOR, pstZmeRtlPara->u32ZmeCoefAddrHL);
    DRV_HIFB_HAL_GP_SetZmeFirEnable       (enGpId, VDP_ZME_MODE_HOR,    pstZmeRtlPara->bZmeMdHLC);
    DRV_HIFB_HAL_GP_SetZmeFirEnable       (enGpId, VDP_ZME_MODE_ALPHA,  pstZmeRtlPara->bZmeMdHA);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_ALPHA,  pstZmeRtlPara->bZmeMedHA);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_HORL,   pstZmeRtlPara->bZmeMedHL);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_HORC,   pstZmeRtlPara->bZmeMedHC);
    DRV_HIFB_HAL_GP_SetZmePhase           (enGpId, VDP_ZME_MODE_HORL,   pstZmeRtlPara->s32ZmeOffsetHL);
    DRV_HIFB_HAL_GP_SetZmePhase           (enGpId, VDP_ZME_MODE_HORC,   pstZmeRtlPara->s32ZmeOffsetHC);
    DRV_HIFB_HAL_GP_SetZmeHorRatio        (enGpId, pstZmeRtlPara->u32ZmeRatioHL);
    DRV_HIFB_HAL_GP_SetZmeCoefAddr        (enGpId, VDP_GP_PARA_ZME_VER, pstZmeRtlPara->u32ZmeCoefAddrVL);
    DRV_HIFB_HAL_GP_SetZmeFirEnable       (enGpId, VDP_ZME_MODE_VER,    pstZmeRtlPara->bZmeMdVLC);
    DRV_HIFB_HAL_GP_SetZmeFirEnable       (enGpId, VDP_ZME_MODE_ALPHAV, pstZmeRtlPara->bZmeMdVA);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_ALPHAV, pstZmeRtlPara->bZmeMedVA);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_VERL,   pstZmeRtlPara->bZmeMedVL);
    DRV_HIFB_HAL_GP_SetZmeMidEnable       (enGpId, VDP_ZME_MODE_VERC,   pstZmeRtlPara->bZmeMedVC);
    DRV_HIFB_HAL_GP_SetZmePhase           (enGpId, VDP_ZME_MODE_VERL,   pstZmeRtlPara->s32ZmeOffsetVBtm);
    DRV_HIFB_HAL_GP_SetZmePhase           (enGpId, VDP_ZME_MODE_VERC,   pstZmeRtlPara->s32ZmeOffsetVTop);
    DRV_HIFB_HAL_GP_SetZmeVerRatio        (enGpId, pstZmeRtlPara->u32ZmeRatioVL);

    if (OPTM_DISPCHANNEL_1 == g_pstGfxGPDevice[enGpId]->enDispCh && bGfxSharpen)
    {
         DRV_HIFB_HAL_GP_SetTiEnable     (enGpId, VDP_TI_MODE_CHM, pstDtiRtlPara->bEnCTI);
         DRV_HIFB_HAL_GP_SetTiEnable     (enGpId, VDP_TI_MODE_LUM, pstDtiRtlPara->bEnLTI);
         DRV_HIFB_HAL_GP_SetZmeHfirOrder (enGpId, VDP_ZME_ORDER_VH);
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
         DRV_HIFB_HAL_GP_SetTiEnable     (enGpId, VDP_TI_MODE_CHM, HI_FALSE);
         DRV_HIFB_HAL_GP_SetTiEnable     (enGpId, VDP_TI_MODE_LUM, HI_FALSE);
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    DRV_HIFB_HAL_GP_SetTiHpCoef       (enGpId, VDP_TI_MODE_CHM, (HI_S32 *)pstDtiRtlPara->s32CTIHPTmp);
    DRV_HIFB_HAL_GP_SetTiHpCoef       (enGpId, VDP_TI_MODE_LUM, (HI_S32 *)pstDtiRtlPara->s32LTIHPTmp);
    DRV_HIFB_HAL_GP_SetTiGainRatio    (enGpId, VDP_TI_MODE_CHM, (HI_S32)pstDtiRtlPara->s16CTICompsatRatio);
    DRV_HIFB_HAL_GP_SetTiGainRatio    (enGpId, VDP_TI_MODE_LUM, (HI_S32)pstDtiRtlPara->s16LTICompsatRatio);
    DRV_HIFB_HAL_GP_SetTiCoringThd    (enGpId, VDP_TI_MODE_CHM, (HI_U32)pstDtiRtlPara->u16CTICoringThrsh);
    DRV_HIFB_HAL_GP_SetTiCoringThd    (enGpId, VDP_TI_MODE_LUM, (HI_U32)pstDtiRtlPara->u16LTICoringThrsh);
    DRV_HIFB_HAL_GP_SetTiSwingThd     (enGpId, VDP_TI_MODE_CHM, (HI_U32)pstDtiRtlPara->u16CTIOverSwingThrsh, (HI_U32)pstDtiRtlPara->u16CTIUnderSwingThrsh);
    DRV_HIFB_HAL_GP_SetTiSwingThd     (enGpId, VDP_TI_MODE_LUM, (HI_U32)pstDtiRtlPara->u16LTIOverSwingThrsh, (HI_U32)pstDtiRtlPara->u16LTIUnderSwingThrsh);
    DRV_HIFB_HAL_GP_SetTiMixRatio     (enGpId, VDP_TI_MODE_CHM, (HI_U32)pstDtiRtlPara->u8CTIMixingRatio);
    DRV_HIFB_HAL_GP_SetTiMixRatio     (enGpId, VDP_TI_MODE_LUM, (HI_U32)pstDtiRtlPara->u8LTIMixingRatio);
    DRV_HIFB_HAL_GP_SetTiHfThd        (enGpId, VDP_TI_MODE_LUM, (HI_U32 *)pstDtiRtlPara->u32LTIHFreqThrsh);
    DRV_HIFB_HAL_GP_SetTiGainCoef     (enGpId, VDP_TI_MODE_LUM, (HI_U32 *)pstDtiRtlPara->u32LTICompsatMuti);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}
#else
static HI_VOID OPTM_GfxGetPqGpFromDispChannel(const OPTM_DISPCHANNEL_E enChannel, HI_PQ_GFX_LAYER_E *pPqGp)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pPqGp);

    if (OPTM_DISPCHANNEL_1 == enChannel)
    {
       *pPqGp = PQ_GFX_GP0;
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else if (OPTM_DISPCHANNEL_0 == enChannel)
    {
       *pPqGp = PQ_GFX_GP1;
       HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enChannel);
        *pPqGp = PQ_GFX_LAYER_BUTT;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

HI_S32 DRV_HIFB_ADP_SetGpRect(HIFB_GP_ID_E enGpId, const HIFB_RECT * pstInputRect)
{
    OPTM_VDP_DISP_RECT_S stGfxRect    = {0};
    HI_PQ_GFX_ZME_PARA_S stGfxZmePara = {0};
    HI_RECT_S stOutRect               = {0};
    HI_PQ_GFX_LAYER_E enPqGfxGp   = PQ_GFX_LAYER_BUTT;
#ifdef CHIP_TYPE_hi3798cv200
    HI_DRV_DISP_FMT_E  enDispFmt  = HI_DRV_DISP_FMT_1080P_50;
    #ifdef HI_BUILD_IN_BOOT
        HI_DISP_DISPLAY_INFO_S stDispInfo;
    #endif
#endif
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);
     HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstInputRect, HI_FAILURE);

#ifdef CHIP_TYPE_hi3798cv200
     #ifdef HI_BUILD_IN_BOOT
        HI_GFX_Memset(&stDispInfo,0,sizeof(stDispInfo));
        if (enGpId == HIFB_ADP_GP0)
        {
            HI_DISP_GetDisplayInfo(HI_DRV_DISPLAY_1, &stDispInfo);
        }
        else
        {
            HI_DISP_GetDisplayInfo(HI_DRV_DISPLAY_0, &stDispInfo);
        }
        g_pstGfxGPDevice[enGpId]->enDispFmt = stDispInfo.eFmt;
    #endif
    enDispFmt = g_pstGfxGPDevice[enGpId]->enDispFmt;
#endif

    g_pstGfxGPDevice[enGpId]->stInRect.s32Width  = pstInputRect->w;
    g_pstGfxGPDevice[enGpId]->stInRect.s32Height = pstInputRect->h;

    if ((0 == g_pstGfxGPDevice[enGpId]->stOutRect.s32Width) || (0 == g_pstGfxGPDevice[enGpId]->stOutRect.s32Height))
    {
       return HI_FAILURE;
    }
    stOutRect.s32X      = g_pstGfxGPDevice[enGpId]->stOutRect.s32X;
    stOutRect.s32Y      = g_pstGfxGPDevice[enGpId]->stOutRect.s32Y;
    stOutRect.s32Width  = g_pstGfxGPDevice[enGpId]->stOutRect.s32Width;
    stOutRect.s32Height = g_pstGfxGPDevice[enGpId]->stOutRect.s32Height;

    OPTM_CheckGPMask_BYGPID(enGpId);

    if ((stOutRect.s32X > CONFIG_HIFB_LAYER_MAXWIDTH) || (stOutRect.s32Y > CONFIG_HIFB_LAYER_MAXHEIGHT))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stOutRect.s32X);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stOutRect.s32Y);
        return HI_FAILURE;
    }

    if ((0 == stOutRect.s32Width) || (stOutRect.s32Width > CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stOutRect.s32Width);
        return HI_FAILURE;
    }

    if ((0 == stOutRect.s32Height) || (stOutRect.s32Height > CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, stOutRect.s32Width);
        return HI_FAILURE;
    }

#ifdef CHIP_TYPE_hi3798cv200
    if ((HIFB_ADP_GP0 == enGpId) && ((HI_DRV_DISP_FMT_PAL <= enDispFmt) && (HI_DRV_DISP_FMT_1440x480i_60 >= enDispFmt)))
    {
        stOutRect.s32X      = g_pstGfxGPDevice[enGpId]->stOutRect.s32X * 2;
        stOutRect.s32Width  = g_pstGfxGPDevice[enGpId]->stOutRect.s32Width * 2;
        stOutRect.s32Y      = g_pstGfxGPDevice[enGpId]->stOutRect.s32Y;
        stOutRect.s32Height = g_pstGfxGPDevice[enGpId]->stOutRect.s32Height;
    }
#endif

    stGfxRect.u32IWth = g_pstGfxGPDevice[enGpId]->stInRect.s32Width   & 0xfffffffe;
    stGfxRect.u32IHgt = g_pstGfxGPDevice[enGpId]->stInRect.s32Height  & 0xfffffffe;
    stGfxRect.u32OWth = stOutRect.s32Width  & 0xfffffffe;
    stGfxRect.u32OHgt = stOutRect.s32Height & 0xfffffffe;

    stGfxRect.u32DXS  = stOutRect.s32X & 0xfffffffe;
    stGfxRect.u32DYS  = stOutRect.s32Y & 0xfffffffe;

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OWth, stGfxRect.u32DXS, HI_FAILURE);
    stGfxRect.u32DXL  = stGfxRect.u32OWth + stGfxRect.u32DXS;
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OHgt, stGfxRect.u32DYS, HI_FAILURE);
    stGfxRect.u32DYL  = stGfxRect.u32OHgt + stGfxRect.u32DYS;

    stGfxRect.u32VX   = stGfxRect.u32DXS;
    stGfxRect.u32VY   = stGfxRect.u32DYS;

    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OWth, stGfxRect.u32VX, HI_FAILURE);
    stGfxRect.u32VXL  = stGfxRect.u32OWth + stGfxRect.u32VX;
    HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(stGfxRect.u32OHgt, stGfxRect.u32VY, HI_FAILURE);
    stGfxRect.u32VYL  = stGfxRect.u32OHgt + stGfxRect.u32VY;

    if (g_pstGfxGPDevice[enGpId]->bNeedExtractLine == HI_TRUE)
    {
        stGfxRect.u32IHgt /= 2;
    }

    if ( (0 == stGfxRect.u32IWth) || (0 == stGfxRect.u32IHgt) || (0 == stGfxRect.u32OWth) || (0 == stGfxRect.u32OHgt))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    DRV_HIFB_HAL_GP_SetLayerReso(g_pstGfxGPDevice[enGpId]->enGpHalId, &stGfxRect);

    if (IS_SLAVER_GP(enGpId))
    {
        stGfxRect.u32IWth  = g_stGfxWbc2.stInRect.w & 0xfffffffe;
        stGfxRect.u32IHgt  = g_stGfxWbc2.stInRect.h & 0xfffffffe;
        if ((0 == stGfxRect.u32IWth) || (0 == stGfxRect.u32IHgt))
        {
            return HI_SUCCESS;
        }

        if (HIFB_STEREO_SIDEBYSIDE_HALF == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
        {
            stGfxRect.u32IWth /= 2;
        }
        else if (HIFB_STEREO_TOPANDBOTTOM == g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode)
        {
            stGfxRect.u32IHgt /= 2;
        }

        if ( HI_TRUE == g_pstGfxGPDevice[OPTM_MASTER_GPID]->bNeedExtractLine)
        {
            stGfxRect.u32IHgt /= 2;
        }

        DRV_HIFB_WBC_SetCropReso(stGfxRect);
    }

    /**here set layer rect  that been opened by usered **/
    HIFB_ADP_ResetLayerInRect(enGpId);

    /**set zme, if wbc mode, should not set gp1 zme **/
    stGfxZmePara.u32ZmeFrmWIn  = stGfxRect.u32IWth;
    stGfxZmePara.u32ZmeFrmHIn  = stGfxRect.u32IHgt;
    stGfxZmePara.u32ZmeFrmWOut = stOutRect.s32Width;
    stGfxZmePara.u32ZmeFrmHOut = stOutRect.s32Height;
    stGfxZmePara.bDeFlicker    = g_pstGfxGPDevice[enGpId]->u32ZmeDeflicker ? HI_FALSE : HI_TRUE;
    stGfxZmePara.bZmeFrmFmtIn  = HI_TRUE;
    stGfxZmePara.bZmeFrmFmtOut = g_pstGfxGPDevice[enGpId]->bInterface ? HI_FALSE : HI_TRUE;

    OPTM_GfxGetPqGpFromDispChannel(g_pstGfxGPDevice[enGpId]->enDispCh,&enPqGfxGp);
    if (PQ_GFX_LAYER_BUTT == enPqGfxGp)
    {
       HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, OPTM_GfxGetPqGpFromDispChannel, enPqGfxGp);
       return HI_FAILURE;
    }

    DRV_HIFB_HAL_GP_SetParaUpd(g_pstGfxGPDevice[enGpId]->enGpHalId, VDP_ZME_MODE_HOR);
    DRV_HIFB_HAL_GP_SetParaUpd(g_pstGfxGPDevice[enGpId]->enGpHalId, VDP_ZME_MODE_VER);

#ifndef HI_BUILD_IN_BOOT
    if (IS_SLAVER_GP(enGpId))
    {
       return HI_SUCCESS;
    }
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(gs_pstPqFuncs->pfnPQ_SetGfxZme, HI_FAILURE);
    gs_pstPqFuncs->pfnPQ_SetGfxZme(enPqGfxGp, &stGfxZmePara);
#endif

#ifdef HI_BUILD_IN_BOOT
    DRV_PQ_SetGfxZme(enPqGfxGp, &stGfxZmePara);
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

static inline HI_VOID HIFB_ADP_ResetLayerInRect(HIFB_GP_ID_E enGpId)
{
    HI_S32 s32Cnt = 0;
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 u32LayerCount  = 0;
    HIFB_LAYER_ID_E enLayerId      = HIFB_LAYER_ID_BUTT;
    HIFB_LAYER_ID_E enInitLayerId  = HIFB_LAYER_ID_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    u32LayerCount = (HIFB_ADP_GP0 == enGpId) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;
    enInitLayerId = (HIFB_ADP_GP0 == enGpId) ? HIFB_LAYER_HD_0 : HIFB_LAYER_SD_0;

    for (s32Cnt = 0; s32Cnt < u32LayerCount; s32Cnt++)
    {
        enLayerId = enInitLayerId + s32Cnt;
        if (!g_pstGfxDevice[enLayerId]->bOpened)
        {
            continue;
        }
        Ret = DRV_HIFB_ADP_SetLayerRect(enLayerId, &g_pstGfxDevice[enLayerId]->stInRect);
        if (HI_SUCCESS != Ret) { HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetLayerRect, Ret); }
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetOutRect
* description : CNcomment: 获取输出分辨率 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
STATIC HI_S32 DRV_HIFB_ADP_GetOutRect(HIFB_LAYER_ID_E enLayerId, HIFB_RECT * pstOutputRect)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstOutputRect, HI_FAILURE);
    enGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    pstOutputRect->x = 0;
    pstOutputRect->y = 0;
    pstOutputRect->w = g_pstGfxGPDevice[enGpId]->stInRect.s32Width;
    pstOutputRect->h = g_pstGfxGPDevice[enGpId]->stInRect.s32Height;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayKeyMask
* description  : CNcomment:设置图层color key 信息CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
STATIC HI_S32 DRV_HIFB_ADP_SetLayKeyMask(HIFB_LAYER_ID_E enLayerId, const HIFB_COLORKEYEX_S *pstColorkey)
{
    OPTM_VDP_GFX_CKEY_S ckey_info;
    OPTM_VDP_GFX_MASK_S ckey_mask;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HIFB_CHECK_LAYER_OPEN(enLayerId);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pstColorkey, HI_FAILURE);

    HI_GFX_Memset(&ckey_info, 0, sizeof(ckey_info));
    HI_GFX_Memset(&ckey_mask, 0, sizeof(ckey_mask));

    HI_GFX_Memcpy(&g_pstGfxDevice[enLayerId]->stColorkey, pstColorkey, sizeof(HIFB_COLORKEYEX_S));

    if (HI_TRUE == g_pstGfxGPDevice[g_pstGfxDevice[enLayerId]->enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    ckey_info.bKeyMode  = pstColorkey->u32KeyMode;

    if (g_pstGfxDevice[enLayerId]->CscState == OPTM_CSC_SET_PARA_BGR)
    {
        ckey_info.u32Key_r_min = pstColorkey->u8BlueMin;
        ckey_info.u32Key_g_min = pstColorkey->u8GreenMin;
        ckey_info.u32Key_b_min = pstColorkey->u8RedMin;

        ckey_info.u32Key_r_max = pstColorkey->u8BlueMax;
        ckey_info.u32Key_g_max = pstColorkey->u8GreenMax;
        ckey_info.u32Key_b_max = pstColorkey->u8RedMax;

        ckey_mask.u32Mask_r = pstColorkey->u8BlueMask;
        ckey_mask.u32Mask_g = pstColorkey->u8GreenMask;
        ckey_mask.u32Mask_b = pstColorkey->u8RedMask;
    }
    else
    {
        ckey_info.u32Key_r_min = pstColorkey->u8RedMin;
        ckey_info.u32Key_g_min = pstColorkey->u8GreenMin;
        ckey_info.u32Key_b_min = pstColorkey->u8BlueMin;

        ckey_info.u32Key_r_max = pstColorkey->u8RedMax;
        ckey_info.u32Key_g_max = pstColorkey->u8GreenMax;
        ckey_info.u32Key_b_max = pstColorkey->u8BlueMax;

        ckey_mask.u32Mask_r = pstColorkey->u8RedMask;
        ckey_mask.u32Mask_g = pstColorkey->u8GreenMask;
        ckey_mask.u32Mask_b = pstColorkey->u8BlueMask;
    }

    DRV_HIFB_HAL_GFX_SetKeyMask(g_pstGfxDevice[enLayerId]->enGfxHalId, &ckey_mask);
    DRV_HIFB_HAL_GFX_SetColorKey(g_pstGfxDevice[enLayerId]->enGfxHalId, pstColorkey->bKeyEnable, &ckey_info);

    DRV_HIFB_HAL_GFX_SetRegUp(g_pstGfxDevice[enLayerId]->enGfxHalId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}


/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayerPreMult
* description  : CNcomment: 设置图层预乘 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerPreMult(HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable)
{
    HI_BOOL bHdr = HI_FALSE;
    HIFB_GP_ID_E enGpId  = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGpId  = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->bPreMute = bEnable;

    OPTM_CheckGPMask_BYGPID(enGpId);

    bHdr = g_pstGfxGPDevice[enGpId]->bHdr;

    DRV_HIFB_HAL_GFX_SetPreMultEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, bEnable, bHdr);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

STATIC HI_VOID DRV_HIFB_ADP_GetLayerPreMult(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pPreMul, HI_BOOL *pDePreMult)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    DRV_HIFB_HAL_GFX_GetPreMultEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, pPreMul, pDePreMult);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

STATIC HI_VOID DRV_HIFB_ADP_GetLayerHdr(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pHdr)
{
    HIFB_GP_ID_E enGpId  = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    enGpId  = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    *pHdr = g_pstGfxGPDevice[enGpId]->bHdr;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

STATIC HI_VOID DRV_HIFB_ADP_GetClosePreMultState(HIFB_LAYER_ID_E LayerId, HI_BOOL *pbShouldClosePreMult)
{
#ifdef CHIP_TYPE_hi3798cv200
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pbShouldClosePreMult);

#ifdef CHIP_TYPE_hi3798cv200
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);
    *pbShouldClosePreMult = g_pstGfxGPDevice[enGpId]->bHdr;
#else
    HI_UNUSED(LayerId);
    *pbShouldClosePreMult = HI_FALSE;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

STATIC HI_VOID DRV_HIFB_ADP_ReadRegister(HI_U32 Offset, HI_U32* pRegBuf)
{
    DRV_HIFB_HAL_GFX_ReadRegister(Offset,pRegBuf);
}

STATIC HI_VOID DRV_HIFB_ADP_WriteRegister(HI_U32 Offset,HI_U32 Value)
{
    DRV_HIFB_HAL_GFX_WriteRegister(Offset,Value);
}

#ifndef HI_BUILD_IN_BOOT
STATIC HI_VOID DRV_HIFB_ADP_WhetherDiscardFrame(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pNoDiscardFrame)
{
#ifndef CONFIG_HIFB_VERSION_1_0
    HI_S32 Ret = HI_SUCCESS;
    DISP_EXPORT_FUNC_S *DispExportFuncs = NULL;
    HI_DISP_DISPLAY_INFO_S stDispInfo;
    HI_DRV_DISPLAY_E enDisp;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (enLayerId < HIFB_LAYER_SD_0)
    {
       enDisp = HI_DRV_DISPLAY_1;
    }
    else
    {
       enDisp = HI_DRV_DISPLAY_0;
    }

    HI_GFX_Memset(&stDispInfo,0x0,sizeof(stDispInfo));
    Ret = HI_DRV_MODULE_GetFunction(HI_ID_DISP, (HI_VOID**)&DispExportFuncs);
    if ( (HI_SUCCESS != Ret) || (NULL == DispExportFuncs))
    {
        HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get disp func failure");
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
        return;
    }

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pNoDiscardFrame);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(DispExportFuncs->pfnDispGetDispInfo);

    Ret = DispExportFuncs->pfnDispGetDispInfo(enDisp,&stDispInfo);
    if (HI_SUCCESS != Ret)
    {
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnDispGetDispInfo, Ret);
        return;
    }

    if (  (HI_DRV_DISP_FMT_1080P_24 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_1080P_25 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_1080P_30 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_1080P_23_976 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_1080P_29_97 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_3840X2160_24 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_3840X2160_25 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_3840X2160_30 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_3840X2160_23_976 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_3840X2160_29_97 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_4096X2160_24 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_4096X2160_25 == stDispInfo.eFmt)
        ||(HI_DRV_DISP_FMT_4096X2160_30 == stDispInfo.eFmt))
    {
       *pNoDiscardFrame = HI_FALSE;
    }
    else
    {
       *pNoDiscardFrame = HI_TRUE;
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pNoDiscardFrame);
#endif
    return;
}

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetOSDData
* description : CNcomment: 获取对应图层得OSD数据 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
STATIC HI_VOID DRV_HIFB_ADP_GetOSDData(HIFB_LAYER_ID_E enLayerId, HIFB_OSD_DATA_S *pstLayerData)
{
    HI_U32 u32Enable     = HI_FALSE;
    HI_U32 u32KeyEnable  = HI_FALSE;
    HI_U32 alpharange    = 0;
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP_BUTT;
    OPTM_VDP_DISP_RECT_S  stRect     = {0};
    OPTM_VDP_DISP_RECT_S stInRect    = {0};
    OPTM_VDP_GFX_MASK_S  stckey_mask = {0};
    OPTM_VDP_GFX_CKEY_S  stKey       = {0};
    OPTM_VDP_GFX_IFMT_E  enDataFmt   = VDP_GFX_IFMT_BUTT;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    enGPId = HIFB_ADP_GetGpId(enLayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGPId);

    DRV_HIFB_HAL_GFX_GetLayerEnable(HIFB_ADP_GetGfxHalId(enLayerId), &u32Enable);

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstLayerData);
    if (u32Enable)
    {
        pstLayerData->eState = HIFB_LAYER_STATE_ENABLE;
    }
    else
    {
        pstLayerData->eState = HIFB_LAYER_STATE_DISABLE;
    }

    /** 获取surface 帧buffer地址 **/
    DRV_HIFB_HAL_GFX_GetLayerAddr(HIFB_ADP_GetGfxHalId(enLayerId), &pstLayerData->u32RegPhyAddr);

    DRV_HIFB_HAL_GFX_GetLayerStride(HIFB_ADP_GetGfxHalId(enLayerId), &pstLayerData->u32Stride);

    DRV_HIFB_HAL_GFX_GetLayerInRect(HIFB_ADP_GetGfxHalId(enLayerId), &stInRect);
    pstLayerData->stInRect.x = stInRect.u32DXS;
    pstLayerData->stInRect.y = stInRect.u32DYS;
    pstLayerData->stInRect.w = stInRect.u32IWth;
    pstLayerData->stInRect.h = stInRect.u32IHgt;

    DRV_HIFB_HAL_GP_GetRect(g_pstGfxGPDevice[enGPId]->enGpHalId, &stRect);

    pstLayerData->stOutRect.x = 0;
    pstLayerData->stOutRect.y = 0;
    pstLayerData->stOutRect.w = stRect.u32IWth;
    pstLayerData->stOutRect.h = stRect.u32IHgt;

    pstLayerData->DisplayWidth = stRect.u32OWth;
    pstLayerData->DisplayHeight= stRect.u32OHgt;

    DRV_HIFB_HAL_WBC_GP_GetEnable(OPTM_VDP_LAYER_WBC_GP0, &u32Enable);
    if (u32Enable)
    {
    /**同源**/
        pstLayerData->eGfxWorkMode = HIFB_GFX_MODE_HD_WBC;
        pstLayerData->enSlaveryLayerID = OPTM_SLAVER_LAYERID;
    }
    else
    {/**非同源**/
        pstLayerData->eGfxWorkMode = HIFB_GFX_MODE_NORMAL;
        pstLayerData->enSlaveryLayerID = HIFB_LAYER_ID_BUTT;
    }

    DRV_HIFB_HAL_GFX_GetPalpha(HIFB_ADP_GetGfxHalId(enLayerId),            \
                               &pstLayerData->stAlpha.bAlphaEnable,        \
                               &alpharange,&pstLayerData->stAlpha.u8Alpha0,\
                               &pstLayerData->stAlpha.u8Alpha1);

    DRV_HIFB_HAL_GFX_GetLayerGalpha(HIFB_ADP_GetGfxHalId(enLayerId), &pstLayerData->stAlpha.u8GlobalAlpha);

    DRV_HIFB_HAL_GFX_GetKeyMask (HIFB_ADP_GetGfxHalId(enLayerId), &stckey_mask);
    DRV_HIFB_HAL_GFX_GetColorKey(HIFB_ADP_GetGfxHalId(enLayerId), &u32KeyEnable,&stKey);

    pstLayerData->stColorKey.u8RedMask   = stckey_mask .u32Mask_r;
    pstLayerData->stColorKey.u8GreenMask = stckey_mask .u32Mask_g;
    pstLayerData->stColorKey.u8BlueMask  = stckey_mask .u32Mask_b;

    pstLayerData->stColorKey.bMaskEnable = HI_TRUE;
    pstLayerData->stColorKey.bKeyEnable  = u32KeyEnable;
    pstLayerData->stColorKey.u32KeyMode  = stKey.bKeyMode;

    pstLayerData->stColorKey.u8RedMax    = stKey.u32Key_r_max;
    pstLayerData->stColorKey.u8GreenMax  = stKey.u32Key_g_max;
    pstLayerData->stColorKey.u8BlueMax   = stKey.u32Key_b_max;

    pstLayerData->stColorKey.u8RedMin    = stKey.u32Key_r_min;
    pstLayerData->stColorKey.u8GreenMin  = stKey.u32Key_g_min;
    pstLayerData->stColorKey.u8BlueMin   = stKey.u32Key_b_min;

    DRV_HIFB_HAL_GFX_GetPreMultEnable(HIFB_ADP_GetGfxHalId(enLayerId), &pstLayerData->bPreMul, &pstLayerData->bDePreMul);

    DRV_HIFB_HAL_GFX_GetInDataFmt(HIFB_ADP_GetGfxHalId(enLayerId), &enDataFmt);

    pstLayerData->eFmt = DRV_HIFB_ADP_HalFmtTransferToPixerFmt(enDataFmt);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
}

STATIC HI_VOID DRV_HIFB_ADP_GetLogoData(HIFB_LAYER_ID_E enLayerId, HIFB_LOGO_DATA_S *pstLogoData)
{
     HI_S32 Ret = HI_SUCCESS;
     HI_U32 LayerEnable = 0;
     OPTM_VDP_GFX_IFMT_E  enDataFmt   = VDP_GFX_IFMT_BUTT;
     HIFB_COLOR_FMT_E enFmt = HIFB_FMT_BUTT;
     DISP_EXPORT_FUNC_S *DispExportFuncs = NULL;
     HI_DISP_DISPLAY_INFO_S stDispInfo;
     HI_DRV_DISPLAY_E enDisp;
     HI_RECT_S stOutRect = {0};
     OPTM_VDP_DISP_RECT_S stInRect = {0};
     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

     if (enLayerId < HIFB_LAYER_SD_0)
     {
        enDisp = HI_DRV_DISPLAY_1;
     }
     else
     {
        enDisp = HI_DRV_DISPLAY_0;
     }

     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstLogoData);

     HI_GFX_Memset(&stDispInfo,0x0,sizeof(stDispInfo));

     Ret = HI_DRV_MODULE_GetFunction(HI_ID_DISP, (HI_VOID**)&DispExportFuncs);
     if ( (HI_SUCCESS != Ret) || (NULL == DispExportFuncs))
     {
         HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "get disp func failure");
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_MODULE_GetFunction, Ret);
         return;
     }

     HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(DispExportFuncs->pfnDispGetDispInfo);
     Ret = DispExportFuncs->pfnDispGetDispInfo(enDisp,&stDispInfo);
     if (HI_SUCCESS != Ret)
     {
         HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, pfnDispGetDispInfo, Ret);
         return;
     }
     HIFB_ADP_GetScreenRectFromDispInfo(&stDispInfo.stVirtaulScreen, (OPTM_GFX_OFFSET_S *)&stDispInfo.stOffsetInfo,
                                    &stDispInfo.stFmtResolution,&stDispInfo.stPixelFmtResolution,
                                    &stOutRect);

     DRV_HIFB_HAL_GFX_GetLayerInRect (HIFB_ADP_GetGfxHalId(enLayerId), &stInRect);
     DRV_HIFB_HAL_GFX_GetLayerEnable (HIFB_ADP_GetGfxHalId(enLayerId), &LayerEnable);
     DRV_HIFB_HAL_GFX_GetLayerAddr   (HIFB_ADP_GetGfxHalId(enLayerId), &pstLogoData->LogoYAddr);
     DRV_HIFB_HAL_GFX_GetInDataFmt   (HIFB_ADP_GetGfxHalId(enLayerId), &enDataFmt);
     enFmt = DRV_HIFB_ADP_HalFmtTransferToPixerFmt(enDataFmt);

     if (   (CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH == stInRect.u32IWth || CONFIG_GFX_DISP_4K_VIRTUAL_WIDTH == stInRect.u32IWth)
         && (CONFIG_GFX_DISP_REALLY4K_VIRTUAL_WIDTH == stDispInfo.stFmtResolution.s32Width || CONFIG_GFX_DISP_4K_VIRTUAL_WIDTH == stDispInfo.stFmtResolution.s32Width)
         && (CONFIG_GFX_DISP_4K_VIRTUAL_HEIGHT == stInRect.u32IHgt)
         && (CONFIG_GFX_DISP_4K_VIRTUAL_HEIGHT == stDispInfo.stFmtResolution.s32Height))
     {
         pstLogoData->Support4KLogo = HI_TRUE;
         HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }

     pstLogoData->LogoEnable     = (1 == LayerEnable) ? (HI_TRUE) : (HI_FALSE);
     pstLogoData->LogoCbCrAddr   = 0x0;

     if ((enLayerId < HIFB_LAYER_SD_0) && (HI_FALSE == pstLogoData->Support4KLogo))
     {
        pstLogoData->LogoWidth      = stDispInfo.stVirtaulScreen.s32Width;
        pstLogoData->LogoHeight     = stDispInfo.stVirtaulScreen.s32Height;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }
     else
     {
        pstLogoData->LogoWidth      = stDispInfo.stFmtResolution.s32Width;
        pstLogoData->LogoHeight     = stDispInfo.stFmtResolution.s32Height;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }
     pstLogoData->stOutRect.x    = stOutRect.s32X;
     pstLogoData->stOutRect.y    = stOutRect.s32Y;
     pstLogoData->stOutRect.w    = stOutRect.s32Width;
     pstLogoData->stOutRect.h    = stOutRect.s32Height;
     pstLogoData->eLogoPixFmt    = HIFB_LOGO_PIX_FMT_ARGB8888;
     DRV_HIFB_HAL_GFX_GetLayerStride(HIFB_ADP_GetGfxHalId(enLayerId), &(pstLogoData->LogoYStride));
     if (HIFB_FMT_ARGB1555 == enFmt)
     {
        pstLogoData->eLogoPixFmt = HIFB_LOGO_PIX_FMT_ARGB1555;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
     }

     HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
     return;
}
#endif

/***************************************************************************************
* func         : DRV_HIFB_ADP_UpLayerReg
* description  : CNcomment: 更新寄存器 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_UpLayerReg(HIFB_LAYER_ID_E enLayerId)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    OPTM_CheckGPMask_BYGPID(enGpId);

    DRV_HIFB_HAL_GFX_SetRegUp(g_pstGfxDevice[enLayerId]->enGfxHalId);
    DRV_HIFB_HAL_GP_SetRegUp (g_pstGfxGPDevice[enGpId]->enGpHalId);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if (IS_MASTER_GP(enGpId))
    {
        DRV_HIFB_WBC_Reset(HI_TRUE);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

static HI_VOID DRV_HIFB_ADP_GetCloseState(HIFB_LAYER_ID_E LayerId, HI_BOOL *pHasBeenClosedForVoCallBack, HI_BOOL *pHasBeenClosedForEndCallBack)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    enGpId = g_pstGfxDevice[LayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    if ((HI_TRUE == g_pstGfxGPDevice[enGpId]->bHasBeenReOpen[0]) && (NULL != pHasBeenClosedForVoCallBack))
    {
        *pHasBeenClosedForVoCallBack = HI_TRUE;
        g_pstGfxGPDevice[enGpId]->bHasBeenReOpen[0] = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if ((HI_TRUE == g_pstGfxGPDevice[enGpId]->bHasBeenReOpen[1]) && (NULL != pHasBeenClosedForEndCallBack))
    {
        *pHasBeenClosedForEndCallBack = HI_TRUE;
        g_pstGfxGPDevice[enGpId]->bHasBeenReOpen[1] = HI_FALSE;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return;
}

static HI_VOID DRV_HIFB_ADP_GetDhd0Info(HIFB_LAYER_ID_E LayerId, HI_ULONG *pExpectIntLineNumsForVoCallBack,HI_ULONG *pExpectIntLineNumsForEndCallBack,HI_ULONG *pActualIntLineNumsForVoCallBack,HI_ULONG *pHardIntCntForVoCallBack)
{
    HI_UNUSED(LayerId);
#if !defined(HI_BUILD_IN_BOOT) && !defined(CONFIG_HIFB_VERSION_1_0)
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    DRV_HIFB_HAL_DISP_GetDhd0Vtthd3(pExpectIntLineNumsForEndCallBack);
    DRV_HIFB_HAL_DISP_GetDhd0Vtthd(pExpectIntLineNumsForVoCallBack);
    DRV_HIFB_HAL_DISP_GetDhd0State(pActualIntLineNumsForVoCallBack,pHardIntCntForVoCallBack);
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#else
    HI_UNUSED(pExpectIntLineNumsForEndCallBack);
    HI_UNUSED(pExpectIntLineNumsForVoCallBack);
    HI_UNUSED(pActualIntLineNumsForVoCallBack);
    HI_UNUSED(pHardIntCntForVoCallBack);
#endif
    return;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func         : DRV_HIFB_ADP_SetTriDimMode
* description  : CNcomment: 设置3D模式 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetTriDimMode(HIFB_LAYER_ID_E enLayerId, HIFB_STEREO_MODE_E enMode, HIFB_STEREO_MODE_E enWbcSteroMode)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->enTriDimMode = enMode;
    g_pstGfxGPDevice[enGpId]->enTriDimMode  = enMode;

    OPTM_CheckGPMask_BYGPID(enGpId);

    DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[enGpId]->enGpHalId);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if (IS_MASTER_GP(enGpId))
    {
        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode = enWbcSteroMode;
        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stInRect.s32Width  = g_pstGfxGPDevice[enGpId]->stInRect.s32Width;
        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->stInRect.s32Height = g_pstGfxGPDevice[enGpId]->stInRect.s32Height;

        if (HIFB_STEREO_MONO == enWbcSteroMode)
        {
            g_stGfxWbc2.enWbcMode = HIFB_WBC_MODE_MONO;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
        else
        {
            g_stGfxWbc2.enWbcMode = HIFB_WBC_MODE_LFET_EYE;
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }

        g_pstGfxGPDevice[OPTM_SLAVER_GPID]->unUpFlag.bits.WbcMode = 1;

        DRV_HIFB_WBC_Reset(HI_TRUE);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetTriDimAddr
* description  : CNcomment: 设置3D显示地址 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetTriDimAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 u32TriDimAddr)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(g_pstGfxDevice[enLayerId]->enGPId, HI_FAILURE);

    g_pstGfxDevice[enLayerId]->u32TriDimAddr= u32TriDimAddr;

    if (HI_TRUE == g_pstGfxGPDevice[g_pstGfxDevice[enLayerId]->enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    DRV_HIFB_HAL_GFX_SetLayerNAddr(g_pstGfxDevice[enLayerId]->enGfxHalId, u32TriDimAddr);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_ADP_GetLayerPriority
* description   : CNcomment: 获取图层在GP 中的优先级 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_GetLayerPriority(HIFB_LAYER_ID_E enLayerId, HI_U32 *pPriority)
{
    HI_U32 i            = 0;
    HI_U32 u32prio      = 0;
    HI_U32 u32Index     = 0;
    HI_U32 u32LayerPrio = 0;
    HI_U32 u32LayerIdIndex = 0;
    OPTM_VDP_CBM_MIX_E eCbmMixg;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(pPriority, HI_FAILURE);

    u32Index = (g_pstGfxDevice[enLayerId]->enGPId == HIFB_ADP_GP0) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;
    eCbmMixg = (g_pstGfxDevice[enLayerId]->enGPId == HIFB_ADP_GP0) ? VDP_CBM_MIXG0 : VDP_CBM_MIXG1;
    DRV_HIFB_HAL_CBM_GetMixerPrio(eCbmMixg, &u32prio);

    if (HIFB_LAYER_HD_2 == enLayerId)
    {
        u32LayerIdIndex = 3; /** G3 **/
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#ifdef CONFIG_HIFB_VERSION_3_0
    else if (HIFB_LAYER_HD_1 == enLayerId)
    {
        /** match  to G3 mix **/
        u32LayerIdIndex = 2;
    }
#endif
    else
    {
        u32LayerIdIndex = enLayerId - OPTM_GP0_GFX_COUNT * g_pstGfxDevice[enLayerId]->enGPId;
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    for (i = 0; i < u32Index; i++)
    {
        u32LayerPrio = u32prio & 0xf;
        u32prio      = u32prio >> 4;

        if ((u32LayerPrio - 1) == u32LayerIdIndex)
        {
            *pPriority = i + 1;
            HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
            return HI_SUCCESS;
        }
    }

    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
    HI_GFX_OutErrInfoMsg(HI_GFX_MSG_ERR_INFO, "fail to get zorder of this layer");

    return HI_FAILURE;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayerPriority
* description  : CNcomment: 设置图层在GP 中的优先级 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetLayerPriority(HIFB_LAYER_ID_E enLayerId, HIFB_ZORDER_E enZOrder)
{
    HI_U32  u32Prio        = 0;
    HI_U32  u32LayerPrio   = 0;
    HI_U32  u32MaskUpBit   = 0;
    HI_U32  u32MaskDownBit = 0;
    HI_U32  u32SwitchBit   = 0;
    HI_U32  u32MaskTopBit  = 0;
    HI_U32  u32MaskBit     = 0;
    HI_U32  u32LayerCount  = 0;
    HI_S32  count          = 0;
    OPTM_VDP_CBM_MIX_E eCbmMixg = VDP_CBM_MIX_BUTT;
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (HI_SUCCESS != DRV_HIFB_ADP_GetLayerPriority(enLayerId, &u32LayerPrio))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enLayerId);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_GetLayerPriority, FAILURE_TAG);
        return HI_FAILURE;
    }

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGpId = g_pstGfxDevice[enLayerId]->enGPId;
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    eCbmMixg = (enGpId == HIFB_ADP_GP0) ? VDP_CBM_MIXG0 : VDP_CBM_MIXG1;

    DRV_HIFB_HAL_CBM_GetMixerPrio(eCbmMixg, &u32Prio);
    u32LayerCount = (enGpId == HIFB_ADP_GP0) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;

    u32SwitchBit = (u32Prio >> (4 * (u32LayerPrio - 1))) & 0xf;

    for (count = u32LayerPrio; count > 0; count--)
    {
        u32MaskUpBit = 0xf | (u32MaskUpBit << 4);
    }

    for (count = u32LayerPrio; count <= u32LayerCount; count++)
    {
        u32MaskDownBit = 0xf | (u32MaskDownBit << 4);
    }
    u32MaskDownBit <<= 4 * (u32LayerPrio - 1);

    u32MaskBit = 0xf;
    u32MaskTopBit = 0xf;
    for(count = 1; count < u32LayerCount; count++)
    {
        u32MaskBit = 0xf | (u32MaskBit << 4);
        u32MaskTopBit = u32MaskTopBit << 4;
    }

    u32Prio &= u32MaskBit;
    switch (enZOrder)
    {
        case HIFB_ZORDER_MOVEBOTTOM:
        {
            if (u32LayerPrio == 1)
            {
               HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
               return HI_SUCCESS;
            }
            u32Prio = (u32Prio&(~u32MaskUpBit)) | \
                      ((u32MaskUpBit&((u32Prio&u32MaskUpBit)<<4))&(~0xf)) |
                      u32SwitchBit;
            break;
        }
        case HIFB_ZORDER_MOVEDOWN:
        {
            if (u32LayerPrio == 1)
            {
                HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
                return HI_SUCCESS;
            }

            u32Prio = ((u32Prio & (0xf << 4 * (u32LayerPrio - 1))) >> 4) | \
                      ((u32Prio & (0xf << 4 * (u32LayerPrio - 2))) << 4) | \
                       (~((0xf << 4 * (u32LayerPrio - 1)) | (0xf << 4 * (u32LayerPrio - 2))) & u32Prio);
            break;
        }
        case HIFB_ZORDER_MOVETOP:
        {
            if (u32LayerPrio == u32LayerCount)
            {
               HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
               return HI_SUCCESS;
            }
            u32Prio = (u32Prio & (~u32MaskDownBit)) | \
                      ((u32MaskDownBit & ((u32Prio & u32MaskDownBit) >> 4)) & (~u32MaskTopBit)) | \
                      (u32SwitchBit << (4 * (u32LayerCount - 1)));
            break;
        }
        case HIFB_ZORDER_MOVEUP:
        {

            if (u32LayerPrio == u32LayerCount)
            {
               HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
               return HI_SUCCESS;
            }
            u32Prio = ((u32Prio & (0xf << 4 * (u32LayerPrio - 1))) << 4) | \
                      ((u32Prio & (0xf << 4 * u32LayerPrio)) >> 4) | \
                       (~((0xf << 4 * (u32LayerPrio - 1)) | (0xf << 4 * u32LayerPrio)) & u32Prio);
            break;
        }
        default:
        {
            HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_INT, enZOrder);
            return HI_FAILURE;
        }
    }

    u32Prio &= u32MaskBit;

    DRV_HIFB_HAL_CBM_SetMixgPrio(eCbmMixg, u32Prio);

    g_pstGfxGPDevice[enGpId]->u32Prior = u32Prio;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : HIFB_ADP_DispInfoUpdate
* description   : CNcomment: 更新display信息 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
STATIC HI_S32 HIFB_ADP_DispInfoUpdate(HIFB_GP_ID_E enGPId)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_U32 LayerIndex = 0;
    HI_U32 u32LayerCount = 0;
    HI_RECT_S *pstDispRect = NULL;
    HIFB_LAYER_ID_E enInitLayerId;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    if (HI_FALSE == g_pstGfxGPDevice[enGPId]->bOpen)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    if (HI_TRUE == g_pstGfxGPDevice[enGPId]->bMaskFlag)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    pstDispRect = &g_pstGfxGPDevice[enGPId]->stOutRect;
    OPTM_GfxSetDispFMTSize((HIFB_GP_ID_E)enGPId, pstDispRect);

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == enGPId))
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }
#endif

    u32LayerCount = (HIFB_ADP_GP0 == enGPId) ? (OPTM_GP0_GFX_COUNT) : (OPTM_GP1_GFX_COUNT);
    enInitLayerId = (HIFB_ADP_GP0 == enGPId) ? (HIFB_LAYER_HD_0)    : (HIFB_LAYER_SD_0);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE((enInitLayerId + u32LayerCount), HI_FAILURE);

    for (LayerIndex = 0; LayerIndex < u32LayerCount; LayerIndex++)
    {
        if (HI_FALSE == g_pstGfxDevice[enInitLayerId + LayerIndex]->bOpened)
        {
            continue;
        }

        Ret = DRV_HIFB_ADP_SetLayerRect(enInitLayerId + LayerIndex, &g_pstGfxDevice[enInitLayerId + LayerIndex]->stInRect);
        if (HI_SUCCESS != Ret) { HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, DRV_HIFB_ADP_SetLayerRect, Ret); }

        DRV_HIFB_HAL_GFX_SetUpdMode (g_pstGfxDevice[enInitLayerId + LayerIndex]->enGfxHalId, g_pstGfxDevice[enInitLayerId + LayerIndex]->enUpDateMode);
        DRV_HIFB_HAL_GFX_SetRegUp   (g_pstGfxDevice[enInitLayerId + LayerIndex]->enGfxHalId);
    }

    DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[enGPId]->enGpHalId);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : HIFB_ADP_GP_Recovery
* description  : CNcomment: 重新设置GP属性 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 HIFB_ADP_GP_Recovery(HIFB_GP_ID_E enGPId)
{
    HI_U32           i             = 0;
    HI_U32           u32LayerCount = 0;
    HI_RECT_S        *pstDispRect  = NULL;
    HIFB_LAYER_ID_E  enInitLayerId = HIFB_LAYER_HD_0;
    HIFB_LAYER_ID_E  enLayerId     = HIFB_LAYER_HD_0;

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    if (!g_pstGfxGPDevice[enGPId]->bOpen)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

    pstDispRect = &g_pstGfxGPDevice[enGPId]->stOutRect;

    OPTM_CheckGPMask_BYGPID(enGPId);

    u32LayerCount = (HIFB_ADP_GP0 == enGPId) ? OPTM_GP0_GFX_COUNT : OPTM_GP1_GFX_COUNT;
    enInitLayerId = (HIFB_ADP_GP0 == enGPId) ? HIFB_LAYER_HD_0    : HIFB_LAYER_SD_0;

    DRV_HIFB_HAL_CBM_SetMixerBkg    (g_pstGfxGPDevice[enGPId]->enMixg, &(g_pstGfxGPDevice[enGPId]->stBkg));
    DRV_HIFB_HAL_CBM_SetMixgPrio    (g_pstGfxGPDevice[enGPId]->enMixg, g_pstGfxGPDevice[enGPId]->u32Prior);
    DRV_HIFB_HAL_GP_SetLayerGalpha  (g_pstGfxGPDevice[enGPId]->enGpHalId, g_pstGfxGPDevice[enGPId]->u32Alpha);

    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, g_enOptmGfxWorkMode);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, HIFB_GFX_MODE_HD_WBC);
    HI_GFX_OutDebugValueMsg(HI_GFX_MSG_DEBUG_UINT, enGPId);
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == enGPId))
    {
        DRV_HIFB_WBC_Recovery(enGPId);
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }
#endif

    OPTM_GfxSetDispFMTSize (enGPId, pstDispRect);
    DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[enGPId]->enGpHalId);

    for (i = 0; i < u32LayerCount;i++)
    {
        enLayerId = enInitLayerId + i;
        if (!g_pstGfxDevice[enLayerId]->bOpened)
        {
            DRV_HIFB_HAL_GFX_SetLayerEnable (g_pstGfxDevice[enLayerId]->enGfxHalId, HI_FALSE);
            DRV_HIFB_HAL_GFX_SetRegUp       (g_pstGfxDevice[enLayerId]->enGfxHalId);
            continue;
        }

        DRV_HIFB_ADP_SetLayerAlpha     (enLayerId, &g_pstGfxDevice[enLayerId]->stAlpha);
        DRV_HIFB_ADP_SetLayKeyMask     (enLayerId, &g_pstGfxDevice[enLayerId]->stColorkey);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
        DRV_HIFB_ADP_SetTriDimMode     (enLayerId, g_pstGfxDevice[enLayerId]->enTriDimMode, g_pstGfxGPDevice[OPTM_SLAVER_GPID]->enTriDimMode);
        DRV_HIFB_ADP_SetTriDimAddr     (enLayerId, g_pstGfxDevice[enLayerId]->u32TriDimAddr);
        DRV_HIFB_ADP_SetStereoDepth   (enLayerId, g_pstGfxDevice[enLayerId]->s32Depth);
#endif

        DRV_HIFB_ADP_SetLayerPreMult   (enLayerId, g_pstGfxDevice[enLayerId]->bPreMute);
        DRV_HIFB_ADP_SetLayerDataFmt   (enLayerId, g_pstGfxDevice[enLayerId]->enDataFmt);
        DRV_HIFB_ADP_SetLayerRect      (enLayerId, &g_pstGfxDevice[enLayerId]->stInRect);

        DRV_HIFB_HAL_GFX_SetLutAddr   (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->stCluptTable.u32StartPhyAddr);
        DRV_HIFB_HAL_GFX_SetParaUpd   (g_pstGfxDevice[enLayerId]->enGfxHalId, VDP_DISP_COEFMODE_LUT);
        DRV_HIFB_HAL_GFX_SetLayerBkg  (g_pstGfxDevice[enLayerId]->enGfxHalId, &(g_pstGfxDevice[enLayerId]->stBkg));
        DRV_HIFB_HAL_GFX_SetBitExtend (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->enBitExtend);

#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT) && !defined(HI_BUILD_IN_BOOT)
        if ((HIFB_LAYER_HD_0 == enLayerId) && (HI_TRUE == g_pstGfxDevice[enLayerId]->bDmpOpened))
        {
            OPTM_GFX_DECMP_Open(enLayerId);
        }
#endif

#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT) && !defined(CONFIG_HIFB_CALCSTRIDE_WITH_ONEPOINTTHREE) && !defined(HI_BUILD_IN_BOOT)
        if (HI_TRUE == g_pstGfxDevice[enLayerId]->bDmpOpened)
        {
           DRV_HIFB_HAL_GFX_SetDeCmpDdrInfo(g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->ARHeadDdr, g_pstGfxDevice[enLayerId]->ARDataDdr, g_pstGfxDevice[enLayerId]->GBHeadDdr, g_pstGfxDevice[enLayerId]->GBDataDdr, g_pstGfxDevice[enLayerId]->CmpStride);
        }
        else
#endif
        {
            DRV_HIFB_ADP_SetLayerStride(enLayerId, g_pstGfxDevice[enLayerId]->Stride);
            DRV_HIFB_ADP_SetLayerAddr(enLayerId, g_pstGfxDevice[enLayerId]->NoCmpBufAddr);
        }

        DRV_HIFB_ADP_SetReadMode    (enLayerId, g_pstGfxDevice[enLayerId]->enReadMode);
        DRV_HIFB_ADP_SetEnable      (enLayerId, g_pstGfxDevice[enLayerId]->bEnable);
        DRV_HIFB_HAL_GFX_SetUpdMode (g_pstGfxDevice[enLayerId]->enGfxHalId, g_pstGfxDevice[enLayerId]->enUpDateMode);
   }

   HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
   return HI_SUCCESS;
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func        : OPTM_VO_Callback
* description : CNcomment: VO CALLBACK CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 OPTM_VO_Callback(HI_VOID* u32Param0, HI_VOID* u32Param1)
{
    HI_U32 i;
    HI_U32 u32CTypeFlag;
    HI_U32 u32LayerCount;
    HI_ULONG LockFlag = 0;
    HIFB_LAYER_ID_E enInitLayerId;
    HIFB_GP_ID_E *pEnGpId = (HIFB_GP_ID_E *)u32Param0;
    HI_DRV_DISP_CALLBACK_INFO_S *pstDispInfo = (HI_DRV_DISP_CALLBACK_INFO_S *)u32Param1;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((NULL == pEnGpId) || (NULL == pstDispInfo))
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pEnGpId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstDispInfo);
        return HI_FAILURE;
    }
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(*pEnGpId, HI_FAILURE);

    u32LayerCount = (HIFB_ADP_GP0 == *pEnGpId) ? (OPTM_GP0_GFX_COUNT) : (OPTM_GP1_GFX_COUNT);
    enInitLayerId = (HIFB_ADP_GP0 == *pEnGpId) ? (HIFB_LAYER_HD_0) : (HIFB_LAYER_SD_0);

    for (i = 0; i < u32LayerCount;i++)
    {
        u32CTypeFlag = g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].u32CTypeFlag;
        if (HIFB_CALLBACK_TYPE_VO != (u32CTypeFlag & HIFB_CALLBACK_TYPE_VO))
        {
           continue;
        }

        /**ensure the func has not be set null **/
        spin_lock_irqsave(&(g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_VO].FuncLock),LockFlag);
        if (NULL != g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_VO].pFunc)
        {
            if (g_pstGfxGPDevice[*pEnGpId]->bHdr != g_pstGfxGPDevice[*pEnGpId]->bPreHdr)
            {
               g_pstGfxGPDevice[*pEnGpId]->bPreHdr = g_pstGfxGPDevice[*pEnGpId]->bHdr;
               DRV_HIFB_HAL_GFX_SetPreMultEnable(g_pstGfxDevice[i]->enGfxHalId, g_pstGfxDevice[i]->bPreMute, g_pstGfxGPDevice[*pEnGpId]->bHdr);
            }
            g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_VO].pFunc(
                g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_VO].pParam0, NULL);
        }
        spin_unlock_irqrestore(&(g_pstGfxGPIrq[*pEnGpId]->stGfxCallBack[i].stGfxIrq[HIFB_CALLBACK_TYPE_VO].FuncLock),LockFlag);
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : HIFB_ADP_DistributeCallback
* description   : CNcomment: 分发中断处理类型 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 HIFB_ADP_DistributeCallback(HI_VOID* u32Param0, HI_VOID* u32Param1)
{
#ifdef CONFIG_HIFB_STEREO_SUPPORT
    HIFB_STEREO_MODE_E enTriDimMode;
#endif
    HIFB_GP_ID_E *penGpId = (HIFB_GP_ID_E *)u32Param0;
    HI_DRV_DISP_CALLBACK_INFO_S *pstDispInfo = (HI_DRV_DISP_CALLBACK_INFO_S *)u32Param1;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if (penGpId == NULL || pstDispInfo == NULL)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, penGpId);
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstDispInfo);
        return HI_FAILURE;
    }

    OPTM_VO_Callback(u32Param0, u32Param1);

#ifdef CONFIG_HIFB_STEREO_SUPPORT
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(*penGpId, HI_FAILURE);

    enTriDimMode = HIFB_ADP_GetStereoModeFromDisp(DRV_HIFB_HAL_DISP_GetDispMode(g_pstGfxGPDevice[*penGpId]->enGpHalId));

    if ((enTriDimMode != g_pstGfxGPDevice[*penGpId]->enTriDimMode) && (HIFB_STEREO_BUTT > enTriDimMode))
    {
        if (HIFB_ADP_CheckGfxCallbackReg((HIFB_GP_ID_E)(*penGpId), HIFB_CALLBACK_TYPE_3DMode_CHG) != HI_SUCCESS)
        {
           HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
           return HI_SUCCESS;
        }

        g_pstGfxGPDevice[*penGpId]->enTriDimMode = enTriDimMode;

        DRV_HIFB_HAL_GP_SetRegUp(g_pstGfxGPDevice[*penGpId]->enGpHalId);

        g_pstGfxGPDevice[*penGpId]->stStartStereoWork.u32Data = *penGpId;

        if (NULL != g_pstGfxGPDevice[*penGpId]->queue)
        {
           queue_work(g_pstGfxGPDevice[*penGpId]->queue, &g_pstGfxGPDevice[*penGpId]->stStartStereoWork.work);
        }
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_ADP_SetGPMask
* description   : CNcomment: 这个接口只有开机logo才会用到，主要是用来过渡使用的
                        设置GP0和GP1掩码，并且在logo过渡完之后重新设置GP CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
STATIC HI_S32 DRV_HIFB_ADP_SetGPMask(HIFB_LAYER_ID_E LayerId, HI_BOOL bFlag)
{
#ifndef HI_BUILD_IN_BOOT
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP_BUTT;
#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    HIFB_OSD_DATA_S stLayerData;
#endif
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(LayerId, HI_FAILURE);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGpId, HI_FAILURE);

    g_pstGfxGPDevice[enGpId]->bMaskFlag = bFlag;

    if (HI_FALSE == bFlag)
    {
        HIFB_ADP_GP_Recovery(enGpId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    if (HIFB_ADP_GP0 != enGpId)
    {
        HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
        return HI_SUCCESS;
    }

#ifndef CONFIG_HIFB_WBC_UNSUPPORT
    DRV_HIFB_ADP_GetOSDData(HIFB_LAYER_SD_0, &stLayerData);
    if ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) || (HIFB_LAYER_STATE_ENABLE == stLayerData.eState))
    {
        g_pstGfxGPDevice[HIFB_ADP_GP1]->bMaskFlag = bFlag;
        if ((HI_FALSE == bFlag) && (HI_TRUE == g_stGfxWbc2.IsOpen))
        {
            HIFB_ADP_GP_Recovery(HIFB_ADP_GP1);
            HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
        }
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
#endif

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#else
    HI_UNUSED(LayerId);
    HI_UNUSED(bFlag);
#endif
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GetGPMask
* description  : CNcomment: 获取GP设置掩码 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
STATIC HI_VOID DRV_HIFB_ADP_GetGPMask(HIFB_LAYER_ID_E LayerId, HI_BOOL* pbMask)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP_BUTT;

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    if (NULL != pbMask)
    {
        *pbMask = g_pstGfxGPDevice[enGpId]->bMaskFlag;
    }

    return;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_ClearLogoOsd
* description   : CNcomment: 清logo CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
STATIC HI_S32 DRV_HIFB_ADP_ClearLogoOsd(HIFB_LAYER_ID_E enLayerId)
{
    HI_UNUSED(enLayerId);
    return HI_SUCCESS;
}

#if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_STEREO_SUPPORT)
/***************************************************************************************
* func          : DRV_HIFB_ADP_SetStereoDepth
* description   : CNcomment: 设置3D  景深，与人眼的距离 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_SetStereoDepth(HIFB_LAYER_ID_E enLayerId, HI_S32 s32Depth)
{
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    g_pstGfxDevice[enLayerId]->s32Depth = s32Depth;

    if (g_pstGfxDevice[enLayerId]->s32Depth != 0)
    {
        DRV_HIFB_HAL_GFX_SetThreeDimDofEnable(HIFB_ADP_GetGfxHalId(enLayerId), HI_TRUE);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }

    DRV_HIFB_HAL_GFX_SetThreeDimDofStep(HIFB_ADP_GetGfxHalId(enLayerId), s32Depth, (0 - s32Depth));

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

/***************************************************************************************
* func          : DRV_HIFB_ADP_SetTCFlag
* description   : CNcomment: 设置是不是TC使用场景标识 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetTCFlag(HI_BOOL bFlag)
{
    DRV_HIFB_WBC_SetTcFlag(bFlag);
    return HI_SUCCESS;
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_GetHaltDispStatus
* description  : CNcomment: 获取显示状态 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
static HI_S32 DRV_HIFB_ADP_GetHaltDispStatus(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbDispInit)
{
    HIFB_GP_ID_E enGPId = HIFB_ADP_GP0;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(enLayerId, HI_FAILURE);
    enGPId = HIFB_ADP_GetGpId(enLayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(enGPId, HI_FAILURE);

    if (NULL != pbDispInit)
    {
        *pbDispInit =  g_pstGfxGPDevice[enGPId]->bGpClose? HI_FALSE : HI_TRUE;
    }

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_MEM_AllocAndMap
* description   : CNcomment: alloc and map mem CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_MEM_AllocAndMap(const char *bufname, char *zone_name, HI_U32 size, int align, GFX_MMZ_BUFFER_S *psMBuf)
{
#ifndef HI_BUILD_IN_BOOT
    return HI_GFX_AllocAndMap(bufname, zone_name, size, align, psMBuf);
#else
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, size, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(psMBuf, HI_FAILURE);

    if (HI_SUCCESS == HI_DRV_PDM_AllocReserveMem(bufname, size, &psMBuf->u32StartPhyAddr))
    {
        psMBuf->pu8StartVirAddr = (HI_U8*)psMBuf->u32StartPhyAddr;
        HI_GFX_Memset(psMBuf->pu8StartVirAddr, 0x0, size);
        return HI_SUCCESS;
    }
    else
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_DRV_PDM_AllocReserveMem, FAILURE_TAG);
        return HI_FAILURE;
    }
#endif
}

/***************************************************************************************
* func         : DRV_HIFB_ADP_MEM_UnMapAndRelease
* description  : unmap the ddr and release it\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_MEM_UnMapAndRelease(GFX_MMZ_BUFFER_S *psMBuf)
{
#ifdef HI_BUILD_IN_BOOT
    HI_UNUSED(psMBuf);
    return;
#else
    HI_GFX_UnmapAndRelease(psMBuf);
#endif
}

/***************************************************************************************
* func          : DRV_HIFB_ADP_MEM_MallocAndMap
* description   : CNcomment: 分配内存并映射地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_MEM_MallocAndMap(const char *bufname, char *zone_name, HI_U32 size, int align, GFX_MMZ_BUFFER_S *psMBuf)
{
#ifndef HI_BUILD_IN_BOOT
    return HI_GFX_AllocAndMap(bufname, zone_name, size, align, psMBuf);
#else
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(0, size, HI_FAILURE);
    HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(psMBuf, HI_FAILURE);

    psMBuf->u32StartPhyAddr = (HI_U32)HI_GFX_Malloc(size, "hifb_wbc_buffer");
    if (0 == psMBuf->u32StartPhyAddr)
    {
        HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, size);
        HI_GFX_OutErrFuncMsg(HI_GFX_MSG_ERR_FUNC, HI_GFX_Malloc, FAILURE_TAG);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
#endif
}

#ifdef HI_BUILD_IN_BOOT
HI_BOOL DRV_HIFB_ADP_WhetherSupportWbc(HI_VOID)
{
    return (HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) ? (HI_TRUE) : (HI_FALSE);
}
#endif

#ifndef HI_BUILD_IN_BOOT
static HI_S32 DRV_HIFB_ADP_ColorConvert(const struct fb_var_screeninfo *pstVar, HIFB_COLORKEYEX_S *pCkey)
{
    HI_U8 rOff, gOff, bOff;
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);

    if ((NULL == pstVar) || (NULL == pCkey))
    {
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pstVar);
       HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_VOID, pCkey);
       return HI_FAILURE;
    }

    rOff = pstVar->red.length;
    gOff = pstVar->green.length;
    bOff = pstVar->blue.length;

    pCkey->u8RedMask   = (0xff >> rOff);
    pCkey->u8GreenMask = (0xff >> gOff);
    pCkey->u8BlueMask  = (0xff >> bOff);

    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
    return HI_SUCCESS;
}
#endif

static HI_VOID DRV_HIFB_ADP_SetDeCmpSwitch(HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen)
{
#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT)
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_ENTER_FUNC);
    if (bOpen)
    {
        OPTM_GFX_DECMP_Open(enLayerId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    else
    {
        OPTM_GFX_DECMP_Close(enLayerId);
        HI_GFX_OutDebugInfoMsg(HI_GFX_MSG_DEBUG_INFO, "debug point");
    }
    HI_GFX_OutDebugFuncMsg(HI_GFX_MSG_INNER_EXIT_FUNC);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(bOpen);
#endif
}

static HI_VOID DRV_HIFB_ADP_GetDeCmpSwitch(HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbOpen)
{
#if defined(CFG_HI_FB_DECOMPRESS_SUPPORT)
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(enLayerId);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pbOpen);
    DRV_HIFB_HAL_GFX_GetDcmpEnable(g_pstGfxDevice[enLayerId]->enGfxHalId, pbOpen);
#else
    HI_UNUSED(enLayerId);
    HI_UNUSED(pbOpen);
#endif
}

static HI_VOID DRV_HIFB_ADP_OpenMute(HIFB_LAYER_ID_E LayerId)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP_BUTT;
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    DRV_HIFB_HAL_CBM_OpenMuteBk(g_pstGfxGPDevice[enGpId]->enGpHalId);

    return;
}

static HI_VOID DRV_HIFB_ADP_CloseMute(HIFB_LAYER_ID_E LayerId)
{
    HIFB_GP_ID_E enGpId = HIFB_ADP_GP_BUTT;
    HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId);
    enGpId = HIFB_ADP_GetGpId(LayerId);
    HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(enGpId);

    DRV_HIFB_HAL_CBM_CloseMuteBk(g_pstGfxGPDevice[enGpId]->enGpHalId);

    return;
}

HI_VOID HIFB_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize)
{
    if ((NULL != pDst) && (NULL != pSrc) && (0 != SrcSize)) { memcpy(pDst, pSrc, SrcSize); }
}

HI_VOID HIFB_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize)
{
    if ((NULL != pDst) && (0 != DstSize)) { memset(pDst, InitValue, DstSize); }
}

#ifndef HI_BUILD_IN_BOOT
/***************************************************************************************
* func        : DRV_HIFB_ADP_GetCallBackFunction
* description : CNcomment: 获取设备上下文 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_RegistAdpFunction(HIFB_EXPORT_UT_FUNC_S *RegistAdpFunction)
{
    if (NULL != RegistAdpFunction)
    {
        RegistAdpFunction->pfnHifbAdpParaCheckSupport            = HIFB_PARA_CHECK_SUPPORT;
        RegistAdpFunction->pfnHifbAdpAlign                       = HIFB_ADP_Align;
        RegistAdpFunction->pfnHifbAdpGetGfxHalId                 = HIFB_ADP_GetGfxHalId;
        RegistAdpFunction->pfnHifbAdpGetGpId                     = HIFB_ADP_GetGpId;
        RegistAdpFunction->pfnHifbAdpGetGpHalId                  = HIFB_ADP_GetGpHalId;
        RegistAdpFunction->pfnHifbAdpGetCscTyeFromDisp           = DRV_HIFB_ADP_GetCscTypeFromDisp;
#ifdef CONFIG_HIFB_STEREO_SUPPORT
        RegistAdpFunction->pfnHifbAdpGetStereoModeFromDisp       = HIFB_ADP_GetStereoModeFromDisp;
        RegistAdpFunction->pfnHifbAdpStereoCallBack              = DRV_HIFB_ADP_StereoCallBack;
#endif
        RegistAdpFunction->pfnHifbAdpGpOpen                      = DRV_HIFB_ADP_GP_Open;
        RegistAdpFunction->pfnHifbAdpGpClose                     = DRV_HIFB_ADP_GP_Close;
        RegistAdpFunction->pfnHifbAdpSetReadMode                 = DRV_HIFB_ADP_SetReadMode;
        RegistAdpFunction->pfnHifbAdpInitLayer                   = DRV_HIFB_ADP_GFX_InitLayer;
        RegistAdpFunction->pfnHifbAdpReleaseClutBuf              = DRV_HIFB_ADP_ReleaseClutBuf;
        RegistAdpFunction->pfnHifbAdpSetGpCsc                    = HIFB_ADP_SetGpCsc;
        RegistAdpFunction->pfnHifbAdpSetCallback                 = DRV_HIFB_ADP_SetCallback;
#ifdef CONFIG_HIFB_STEREO_SUPPORT
        RegistAdpFunction->pfnHifbAdpCheckGfxCallbackReg         = HIFB_ADP_CheckGfxCallbackReg;
#endif
        RegistAdpFunction->pfnHifbAdpGetScreenRectFromDispInfo   = HIFB_ADP_GetScreenRectFromDispInfo;
        RegistAdpFunction->pfnHifbAdpFrameEndCallBack            = DRV_HIFB_ADP_FrameEndCallBack;
        RegistAdpFunction->pfnHifbAdpDispInfoProcess             = HIFB_ADP_DispInfoProcess;
        RegistAdpFunction->pfnHifbAdpGpSetMask                   = HIFB_ADP_GP_SetMask;
        RegistAdpFunction->pfnHifbAdpSetLowPowerInfo             = DRV_HIFB_ADP_SetLowPowerInfo;
        RegistAdpFunction->pfnHifbAdpSetDeCmpDdrInfo             = DRV_HIFB_ADP_SetDeCmpDdrInfo;
        RegistAdpFunction->pfnHifbAdpGetDecompressStatus         = DRV_HIFB_ADP_GetDecompressStatus;
#ifdef CFG_HI_FB_DECOMPRESS_SUPPORT
        RegistAdpFunction->pfnHifbAdpDecompressOpen              = OPTM_GFX_DECMP_Open;
        RegistAdpFunction->pfnHifbAdpDecompressClose             = OPTM_GFX_DECMP_Close;
#endif
        RegistAdpFunction->pfnHifbAdpUpDataCallBack              = DRV_HIFB_ADP_UpDataCallBack;
        RegistAdpFunction->pfnHifbAdpReOpen                      = HIFB_ADP_ReOpen;
        RegistAdpFunction->pfnHifbAdpReClose                     = HIFB_ADP_ReClose;
        RegistAdpFunction->pfnHifbAdpDispSetting                 = HIFB_ADP_DispSetting;
        RegistAdpFunction->pfnHifbAdpUpdataLayerInfo             = HIFB_ADP_UpdataLayerInfo;
        RegistAdpFunction->pfnHifbAdpGfxChn2DispChn              = OPTM_GfxChn2DispChn;
        RegistAdpFunction->pfnHifbAdpSetCallbackToDisp           = DRV_HIFB_ADP_SetCallbackToDisp;
        RegistAdpFunction->pfnHifbAdpOpenLayer                   = DRV_HIFB_ADP_OpenLayer;
        RegistAdpFunction->pfnHifbAdpCloseLayer                  = DRV_HIFB_ADP_CloseLayer;
        RegistAdpFunction->pfnHifbAdpSetEnable                   = DRV_HIFB_ADP_SetEnable;
        RegistAdpFunction->pfnHifbAdpGetEnable                   = DRV_HIFB_ADP_GetEnable;
        RegistAdpFunction->pfnHifbAdpSetLayerAddr                = DRV_HIFB_ADP_SetLayerAddr;
        RegistAdpFunction->pfnHifbAdpGetLayerAddr                = DRV_HIFB_ADP_GetLayerAddr;
        RegistAdpFunction->pfnHifbAdpGetLayerWorkAddr            = DRV_HIFB_ADP_GetLayerWorkAddr;
        RegistAdpFunction->pfnHifbAdpGetLayerWillWorkAddr        = DRV_HIFB_ADP_GetLayerWillWorkAddr;
        RegistAdpFunction->pfnHifbAdpSetLayerStride              = DRV_HIFB_ADP_SetLayerStride;
        RegistAdpFunction->pfnHifbAdpGetLayerStride              = DRV_HIFB_ADP_GetLayerStride;
        RegistAdpFunction->pfnHifbAdpHalFmtTransferToPixerFmt    = DRV_HIFB_ADP_HalFmtTransferToPixerFmt;
        RegistAdpFunction->pfnHifbAdpPixerFmtTransferToHalFmt    = DRV_HIFB_ADP_PixerFmtTransferToHalFmt;
        RegistAdpFunction->pfnHifbAdpSetLayerDataFmt             = DRV_HIFB_ADP_SetLayerDataFmt;
        RegistAdpFunction->pfnHifbAdpSetLayerDataBigEndianFmt    = HIFB_ADP_SetLayerDataBigEndianFmt;
        RegistAdpFunction->pfnHifbAdpSetLayerDataLittleEndianFmt = HIFB_ADP_SetLayerDataLittleEndianFmt;
        RegistAdpFunction->pfnHifbAdpSetColorReg                 = DRV_HIFB_ADP_SetColorReg;
        RegistAdpFunction->pfnHifbAdpGfxWVBCallBack              = OPTM_GfxWVBCallBack;
        RegistAdpFunction->pfnHifbAdpWaitVBlank                  = DRV_HIFB_ADP_WaitVBlank;
        RegistAdpFunction->pfnHifbAdpSetLayerAlpha               = DRV_HIFB_ADP_SetLayerAlpha;
        RegistAdpFunction->pfnHifbAdpGetLayerRect                = DRV_HIFB_ADP_GetLayerRect;
        RegistAdpFunction->pfnHifbAdpSetLayerRect                = DRV_HIFB_ADP_SetLayerRect;
        RegistAdpFunction->pfnHifbAdpGetDispFMTSize              = DRV_HIFB_ADP_GetDispFMTSize;
        RegistAdpFunction->pfnHifbAdpSetGpRect                   = DRV_HIFB_ADP_SetGpRect;
        RegistAdpFunction->pfnHifbAdpResetLayerInRect            = HIFB_ADP_ResetLayerInRect;
        RegistAdpFunction->pfnHifbAdpGetOutRect                  = DRV_HIFB_ADP_GetOutRect;
        RegistAdpFunction->pfnHifbAdpSetLayKeyMask               = DRV_HIFB_ADP_SetLayKeyMask;
        RegistAdpFunction->pfnHifbAdpSetLayerPreMult             = DRV_HIFB_ADP_SetLayerPreMult;
        RegistAdpFunction->pfnHifbAdpGetLayerPreMult             = DRV_HIFB_ADP_GetLayerPreMult;
        RegistAdpFunction->pfnHifbAdpGetLayerHdr                 = DRV_HIFB_ADP_GetLayerHdr;
        RegistAdpFunction->pfnHifbAdpWhetherDiscardFrame         = DRV_HIFB_ADP_WhetherDiscardFrame;
        RegistAdpFunction->pfnHifbAdpGetOSDData                  = DRV_HIFB_ADP_GetOSDData;
        RegistAdpFunction->pfnHifbAdpGetLogoData                 = DRV_HIFB_ADP_GetLogoData;
        RegistAdpFunction->pfnHifbAdpUpLayerReg                  = DRV_HIFB_ADP_UpLayerReg;
        RegistAdpFunction->pfnHifbAdpGetCloseState               = DRV_HIFB_ADP_GetCloseState;
        RegistAdpFunction->pfnHifbAdpGetDhd0Info                 = DRV_HIFB_ADP_GetDhd0Info;
        RegistAdpFunction->pfnHifbAdpSetTriDimMode               = DRV_HIFB_ADP_SetTriDimMode;
        RegistAdpFunction->pfnHifbAdpSetTriDimAddr               = DRV_HIFB_ADP_SetTriDimAddr;
        RegistAdpFunction->pfnHifbAdpGetLayerPriority            = DRV_HIFB_ADP_GetLayerPriority;
        RegistAdpFunction->pfnHifbAdpSetLayerPriority            = DRV_HIFB_ADP_SetLayerPriority;
        RegistAdpFunction->pfnHifbAdpDispInfoUpdate              = HIFB_ADP_DispInfoUpdate;
        RegistAdpFunction->pfnHifbAdpGPRecovery                  = HIFB_ADP_GP_Recovery;
        RegistAdpFunction->pfnHifbAdpVoCallback                  = OPTM_VO_Callback;
        RegistAdpFunction->pfnHifbAdpDistributeCallback          = HIFB_ADP_DistributeCallback;
        RegistAdpFunction->pfnHifbAdpSetGPMask                   = DRV_HIFB_ADP_SetGPMask;
        RegistAdpFunction->pfnHifbAdpGetGPMask                   = DRV_HIFB_ADP_GetGPMask;
#ifdef CONFIG_HIFB_STEREO_SUPPORT
        RegistAdpFunction->pfnHifbAdpSetStereoDepth              = DRV_HIFB_ADP_SetStereoDepth;
#endif
        RegistAdpFunction->pfnHifbAdpGetHaltDispStatus           = DRV_HIFB_ADP_GetHaltDispStatus;
        RegistAdpFunction->pfnHifbAdpSetDeCmpSwitch              = DRV_HIFB_ADP_SetDeCmpSwitch;
        RegistAdpFunction->pfnHifbAdpGetDeCmpSwitch              = DRV_HIFB_ADP_GetDeCmpSwitch;
        RegistAdpFunction->pfnHifbAdpOpenMute                    = DRV_HIFB_ADP_OpenMute;
        RegistAdpFunction->pfnHifbAdpCloseMute                   = DRV_HIFB_ADP_CloseMute;
    }
    return;
}
#endif

/***************************************************************************************
* func        : DRV_HIFB_ADP_GetCallBackFunction
* description : CNcomment: 获取设备上下文 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_VOID DRV_HIFB_ADP_GetCallBackFunction(HIFB_DRV_OPS_S *AdpCallBackFunction)
{
    if (NULL != AdpCallBackFunction)
    {
        AdpCallBackFunction->DRV_HIFB_ADP_CloseLayer                 = DRV_HIFB_ADP_CloseLayer;
    #ifndef HI_BUILD_IN_BOOT
        AdpCallBackFunction->DRV_HIFB_ADP_ColorConvert               = DRV_HIFB_ADP_ColorConvert;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_SetEnable                  = DRV_HIFB_ADP_SetEnable;
        AdpCallBackFunction->DRV_HIFB_ADP_GetEnable                  = DRV_HIFB_ADP_GetEnable;
        AdpCallBackFunction->DRV_HIFB_ADP_GetDevCap                  = DRV_HIFB_ADP_GetDevCap;
    #ifndef HI_BUILD_IN_BOOT
        AdpCallBackFunction->DRV_HIFB_ADP_GetOSDData                 = DRV_HIFB_ADP_GetOSDData;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLogoData                = DRV_HIFB_ADP_GetLogoData;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerPriority           = DRV_HIFB_ADP_GetLayerPriority;
        AdpCallBackFunction->DRV_HIFB_ADP_DeInit                     = DRV_HIFB_ADP_DeInit;
        AdpCallBackFunction->DRV_HIFB_ADP_Init                       = DRV_HIFB_ADP_Init;
        AdpCallBackFunction->DRV_HIFB_ADP_OpenLayer                  = DRV_HIFB_ADP_OpenLayer;
        AdpCallBackFunction->DRV_HIFB_ADP_SetColorReg                = DRV_HIFB_ADP_SetColorReg;
    #ifndef HI_BUILD_IN_BOOT
        AdpCallBackFunction->DRV_HIFB_ADP_SetTriDimMode              = DRV_HIFB_ADP_SetTriDimMode;
        AdpCallBackFunction->DRV_HIFB_ADP_SetTriDimAddr              = DRV_HIFB_ADP_SetTriDimAddr;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerAddr               = DRV_HIFB_ADP_SetLayerAddr;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerAddr               = DRV_HIFB_ADP_GetLayerAddr;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerWorkAddr           = DRV_HIFB_ADP_GetLayerWorkAddr;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerWillWorkAddr       = DRV_HIFB_ADP_GetLayerWillWorkAddr;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerAlpha              = DRV_HIFB_ADP_SetLayerAlpha;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerDataFmt            = DRV_HIFB_ADP_SetLayerDataFmt;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerDeFlicker          = DRV_HIFB_ADP_SetLayerDeFlicker;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerPriority           = DRV_HIFB_ADP_SetLayerPriority;
        AdpCallBackFunction->DRV_HIFB_ADP_UpLayerReg                 = DRV_HIFB_ADP_UpLayerReg;
        AdpCallBackFunction->DRV_HIFB_ADP_GetDhd0Info                = DRV_HIFB_ADP_GetDhd0Info;
        AdpCallBackFunction->DRV_HIFB_ADP_GetCloseState              = DRV_HIFB_ADP_GetCloseState;
        AdpCallBackFunction->DRV_HIFB_ADP_WaitVBlank                 = DRV_HIFB_ADP_WaitVBlank;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayKeyMask              = DRV_HIFB_ADP_SetLayKeyMask;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerPreMult            = DRV_HIFB_ADP_SetLayerPreMult;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerPreMult            = DRV_HIFB_ADP_GetLayerPreMult;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerHdr                = DRV_HIFB_ADP_GetLayerHdr;
        AdpCallBackFunction->DRV_HIFB_ADP_GetClosePreMultState       = DRV_HIFB_ADP_GetClosePreMultState;
        AdpCallBackFunction->DRV_HIFB_ADP_ReadRegister               = DRV_HIFB_ADP_ReadRegister;
        AdpCallBackFunction->DRV_HIFB_ADP_WriteRegister              = DRV_HIFB_ADP_WriteRegister;
    #ifndef HI_BUILD_IN_BOOT
        AdpCallBackFunction->DRV_HIFB_ADP_WhetherDiscardFrame        = DRV_HIFB_ADP_WhetherDiscardFrame;
        AdpCallBackFunction->DRV_HIFB_ADP_SetCallback                = DRV_HIFB_ADP_SetCallback;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerStride             = DRV_HIFB_ADP_SetLayerStride;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerStride             = DRV_HIFB_ADP_GetLayerStride;
        AdpCallBackFunction->DRV_HIFB_ADP_SetLayerRect               = DRV_HIFB_ADP_SetLayerRect;
        AdpCallBackFunction->DRV_HIFB_ADP_GetOutRect                 = DRV_HIFB_ADP_GetOutRect;
        AdpCallBackFunction->DRV_HIFB_ADP_GetLayerRect               = DRV_HIFB_ADP_GetLayerRect;
        AdpCallBackFunction->DRV_HIFB_ADP_SetGPMask                  = DRV_HIFB_ADP_SetGPMask;
        AdpCallBackFunction->DRV_HIFB_ADP_GetGPMask                  = DRV_HIFB_ADP_GetGPMask;
        AdpCallBackFunction->DRV_HIFB_ADP_GetDispFMTSize             = DRV_HIFB_ADP_GetDispFMTSize;
        AdpCallBackFunction->DRV_HIFB_ADP_ClearLogoOsd               = DRV_HIFB_ADP_ClearLogoOsd;
    #if !defined(HI_BUILD_IN_BOOT) && defined(CONFIG_HIFB_STEREO_SUPPORT)
        AdpCallBackFunction->DRV_HIFB_ADP_SetStereoDepth             = DRV_HIFB_ADP_SetStereoDepth;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_SetTCFlag                  = DRV_HIFB_ADP_SetTCFlag;
        AdpCallBackFunction->DRV_HIFB_ADP_SetDeCmpSwitch             = DRV_HIFB_ADP_SetDeCmpSwitch;
        AdpCallBackFunction->DRV_HIFB_ADP_GetDeCmpSwitch             = DRV_HIFB_ADP_GetDeCmpSwitch;
        AdpCallBackFunction->DRV_HIFB_ADP_SetDeCmpDdrInfo            = DRV_HIFB_ADP_SetDeCmpDdrInfo;
    #ifndef HI_BUILD_IN_BOOT
        AdpCallBackFunction->DRV_HIFB_ADP_SetLowPowerInfo            = DRV_HIFB_ADP_SetLowPowerInfo;
    #endif
        AdpCallBackFunction->DRV_HIFB_ADP_GetDecompressStatus        = DRV_HIFB_ADP_GetDecompressStatus;
        AdpCallBackFunction->DRV_HIFB_ADP_GetHaltDispStatus          = DRV_HIFB_ADP_GetHaltDispStatus;
        AdpCallBackFunction->DRV_HIFB_ADP_OpenMute                   = DRV_HIFB_ADP_OpenMute;
        AdpCallBackFunction->DRV_HIFB_ADP_CloseMute                  = DRV_HIFB_ADP_CloseMute;
    }
    return;
}
