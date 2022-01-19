/**************************************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_adp.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                  Author            Modification
2018/01/01            sdk               Created file
***************************************************************************************************/
#ifndef __DRV_HIFB_ADP_H__
#define __DRV_HIFB_ADP_H__


/*********************************add include here*************************************************/
#ifndef HI_BUILD_IN_BOOT
#include "hi_type.h"
#include "hi_common.h"
#include "drv_disp_ext.h"
#include "drv_hifb_common.h"
#include "hi_gfx_comm_k.h"
#else
#include "hifb_debug.h"
#include "hi_drv_disp.h"
#include "hi_gfx_comm.h"
#endif

#include "drv_hifb_hal.h"
#include "optm_define.h"

#ifdef CONFIG_GFX_PQ
#include "drv_pq_ext.h"
#endif

/**************************************************************************************************/

/**************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ***************************************************/
#define OPTM_ENABLE                      1
#define OPTM_DISABLE                     0

#define OPTM_MASTER_GPID                 HIFB_ADP_GP0
#define OPTM_SLAVER_GPID                 HIFB_ADP_GP1
#define OPTM_SLAVER_LAYERID              HIFB_LAYER_SD_0

#define OPTM_CMAP_SIZE                   0x400

#ifndef CONFIG_HIFB_LOWPOWER_MAX_PARA_CNT
#define CONFIG_HIFB_LOWPOWER_MAX_PARA_CNT  17
#endif

#define IS_MASTER_GP(enGpId) ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP0 == enGpId))
#define IS_SLAVER_GP(enGpId) ((HIFB_GFX_MODE_HD_WBC == g_enOptmGfxWorkMode) && (HIFB_ADP_GP1 == enGpId))

#define OPTM_CheckGPMask_BYGPID(enGPId) \
         do{\
             if (enGPId >= HIFB_ADP_GP_BUTT)\
             {\
                 HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, enGPId);\
                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_ADP_GP_BUTT);\
                 HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "enGPId >= HIFB_ADP_GP_BUTT");\
                 return HI_FAILURE;\
             }\
             if (g_pstGfxGPDevice[enGPId]->bMaskFlag) { return HI_SUCCESS; }\
         }while(0)

#define HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_VALUE(LayerId,Ret)\
         if (LayerId >= HIFB_LAYER_ID_BUTT)\
         {\
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);\
             HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_LAYER_ID_BUTT);\
             HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "layer id is not support");\
             return Ret;\
         }

#define HI_GFX_CHECK_LAYERID_SUPPORT_RETURN_NOVALUE(LayerId)\
         if (LayerId >= HIFB_LAYER_ID_BUTT)\
         {\
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, LayerId);\
             HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, HIFB_LAYER_ID_BUTT);\
             HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "layer id is not support");\
             return;\
         }

#define HI_GFX_CHECK_GPID_SUPPORT_RETURN_VALUE(GpId,Ret)\
         if (GpId >= HIFB_ADP_GP_BUTT)\
         {\
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, GpId); \
             HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "gp id is not support");\
             return Ret;\
         }

#define HI_GFX_CHECK_GPID_SUPPORT_RETURN_NOVALUE(GpId)\
         if (GpId >= HIFB_ADP_GP_BUTT)\
         {\
             HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, GpId); \
             HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "gp id is not support");\
             return;\
         }

/***************************  The enum of  ********************************************************/
typedef enum tagHIFB_GP_ID_E
{
    HIFB_ADP_GP0 = 0x0,
    HIFB_ADP_GP1,
    HIFB_ADP_GP_BUTT
}HIFB_GP_ID_E;

/*************************** Structure Definition *************************************************/
typedef struct tagOPTM_GFX_CSC_PARA_S
{
    HI_U32 u32Bright;
    HI_U32 u32Contrast;
    HI_U32 u32Saturation;
    HI_U32 u32Hue;
    HI_U32 u32Kr;
    HI_U32 u32Kg;
    HI_U32 u32Kb;
}OPTM_GFX_CSC_PARA_S;

typedef struct tagOPTM_GFX_OFFSET_S
{
    HI_U32 u32Left;    /** left offset   */
    HI_U32 u32Top;     /** top offset    */
    HI_U32 u32Right;   /** right offset  */
    HI_U32 u32Bottom;  /** bottom offset */
}OPTM_GFX_OFFSET_S;

/** csc state*/
typedef enum tagOPTM_CSC_STATE_E
{
    OPTM_CSC_SET_PARA_ENABLE = 0x0,
    OPTM_CSC_SET_PARA_RGB,
    OPTM_CSC_SET_PARA_BGR,
    OPTM_CSC_SET_PARA_CLUT,
    OPTM_CSC_SET_PARA_CbYCrY,
    OPTM_CSC_SET_PARA_YCbYCr,
    OPTM_CSC_SET_PARA_BUTT
}OPTM_CSC_STATE_E;

typedef enum optm_COLOR_SPACE_E
{
    OPTM_CS_UNKNOWN = 0,

    OPTM_CS_BT601_YUV_LIMITED, /** for BT.601 mod **/
    OPTM_CS_BT601_YUV_FULL,
    OPTM_CS_BT601_RGB_LIMITED,
    OPTM_CS_BT601_RGB_FULL,

    OPTM_CS_BT709_YUV_LIMITED, /** for BT.709 mod  **/
    OPTM_CS_BT709_YUV_FULL,
    OPTM_CS_BT709_RGB_LIMITED,
    OPTM_CS_BT709_RGB_FULL,

    OPTM_CS_BUTT
} OPTM_COLOR_SPACE_E;

#ifndef HI_BUILD_IN_BOOT
typedef struct tagOPTM_GFX_WORK_S
{
    HI_BOOL bOpenLayer;
    HI_BOOL bAllocMem;
    HI_BOOL bFreeMem;
    HI_U32 u32Data;
    struct work_struct work;
}OPTM_GFX_WORK_S;
#endif

typedef union tagOPTM_GFX_UP_FLAG_U
{
    struct
    {
        unsigned int    IsNeedRegUp     : 1 ; /*  [0] */
        unsigned int    IsEnable        : 1 ; /*  [1] */
        unsigned int    OutRect         : 1 ; /*  [2] */
        unsigned int    IsNeedUpAlpha   : 1 ; /*  [3] */
        unsigned int    IsNeedUpPreMult : 1 ; /*  [4] */
        unsigned int    WbcMode         : 1 ; /*  [5] */
        unsigned int    Reserved        : 25; /*  [31...7] */
    } bits;
    unsigned int    u32;
}OPTM_GFX_UP_FLAG_U;

typedef enum tagOPTM_DISPCHANNEL_E
{
    OPTM_DISPCHANNEL_0 = 0,    /** gfx4,gfx5             **/
    OPTM_DISPCHANNEL_1 = 1,    /** gfx0,gfx1,gfx2,gfx3   **/
    OPTM_DISPCHANNEL_BUTT
}OPTM_DISPCHANNEL_E;

typedef struct tagHIFB_ADP_LOWPOWER_INFO_S
{
    HI_BOOL LowPowerEn;
    HI_U32 LpInfo[CONFIG_HIFB_LOWPOWER_MAX_PARA_CNT];
}HIFB_ADP_LOWPOWER_INFO_S;

typedef struct tagOPTM_GFX_GP_S
{
    HI_BOOL bOpen;
    HI_BOOL bHdr;
    HI_BOOL bPreHdr;
    HI_BOOL bMaskFlag;
    HI_BOOL bBGRState;
    HI_BOOL bInterface;
    HI_BOOL bGpClose;
    HI_BOOL bHasBeenReOpen[2];    /** 要是待机或者切制式，这个时候没有中断了，中断需要的信息需要复位 **/
    HI_BOOL bRecoveryInNextVT;
    HI_BOOL bNeedExtractLine;
    HI_BOOL bDispInitial;
    HI_RECT_S stInRect;
    HI_RECT_S stOutRect;
    HI_U32    u32ZmeDeflicker;
#ifdef CHIP_TYPE_hi3798cv200/** hdmi cts need **/
    HI_DRV_DISP_FMT_E         enDispFmt;
#endif
    HIFB_STEREO_MODE_E        enTriDimMode;
    OPTM_GFX_CSC_PARA_S       stCscPara;
#ifndef CONFIG_GFX_PQ
    OPTM_COLOR_SPACE_E        enInputCsc;
    OPTM_COLOR_SPACE_E        enOutputCsc;
#else
    HI_PQ_GFX_COLOR_SPACE_E   enInputCsc;
    HI_PQ_GFX_COLOR_SPACE_E   enOutputCsc;
#endif
    OPTM_VDP_LAYER_GP_E       enGpHalId;
    OPTM_DISPCHANNEL_E        enDispCh;
    OPTM_GFX_UP_FLAG_U        unUpFlag;

#ifndef HI_BUILD_IN_BOOT
    struct workqueue_struct   *queue;
    OPTM_GFX_WORK_S           stStartWbcWork;
    OPTM_GFX_WORK_S           stStartStereoWork;
#endif
    HI_U32 u32Prior;
    HI_U32 u32Alpha;
    OPTM_VDP_DATA_RMODE_E     enReadMode;
    OPTM_VDP_BKG_S            stBkg;
    OPTM_VDP_CBM_MIX_E        enMixg;
}OPTM_GFX_GP_S;

typedef struct tagOPTM_GFX_LAYER_S{
    HI_BOOL              bOpened;
    HI_BOOL              bMaskFlag;
    HI_BOOL              bSharpEnable;
    HI_BOOL              bExtractLine;
    HI_BOOL              bEnable;
    HI_S32               s32Depth;
    HI_BOOL              bPreMute;
    HI_U32               u32ZOrder;
    HI_BOOL              bDmpOpened;
    HI_BOOL              bBufferChged;
    HI_U32               s32BufferChgCount;
    HI_U32               NoCmpBufAddr;
    HI_U32               ARHeadDdr;
    HI_U32               ARDataDdr;
    HI_U32               GBHeadDdr;
    HI_U32               GBDataDdr;
    HI_U32               u32TriDimAddr;
    HI_U16               Stride;           /** no compression mode stride  */
    HI_U16               CmpStride;        /** compression mode stride     */
    HIFB_COLOR_FMT_E     enDataFmt;
    HIFB_RECT            stInRect;         /** Inres of gfx                */
    HIFB_ALPHA_S         stAlpha;
    HIFB_COLORKEYEX_S    stColorkey;
    HIFB_STEREO_MODE_E   enTriDimMode;
    OPTM_VDP_BKG_S       stBkg;
    OPTM_VDP_GFX_BITEXTEND_E enBitExtend;  /** the g_ctrl of bitext        **/
    OPTM_VDP_DATA_RMODE_E    enReadMode;
    OPTM_VDP_DATA_RMODE_E    enUpDateMode;
    OPTM_VDP_LAYER_GFX_E     enGfxHalId;   /** the gfx's hal id            */
    HIFB_GP_ID_E            enGPId;       /** which gp the gfx belong to  */
    OPTM_CSC_STATE_E         CscState;
    volatile HI_U32          vblflag;
    wait_queue_head_t        vblEvent;
    GFX_MMZ_BUFFER_S         stCluptTable;
}OPTM_GFX_LAYER_S;


/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            initial operation
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
typedef struct
{
    HI_VOID (*DRV_HIFB_ADP_CloseLayer)                (HIFB_LAYER_ID_E enLayerId);
#ifndef HI_BUILD_IN_BOOT
    HI_S32  (*DRV_HIFB_ADP_ColorConvert)              (const struct fb_var_screeninfo *pstVar, HIFB_COLORKEYEX_S *pCkey);
#endif
    HI_S32  (*DRV_HIFB_ADP_SetEnable)                 (HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable);
    HI_VOID (*DRV_HIFB_ADP_GetEnable)                 (HIFB_LAYER_ID_E enLayerId, HI_BOOL* pbEnable);
    HI_VOID (*DRV_HIFB_ADP_GetDevCap)                 (const HIFB_CAPABILITY_S **pstCap);
#ifndef HI_BUILD_IN_BOOT
    HI_VOID (*DRV_HIFB_ADP_GetOSDData)                (HIFB_LAYER_ID_E enLayerId, HIFB_OSD_DATA_S  *pstLayerData);
    HI_VOID (*DRV_HIFB_ADP_GetLogoData)               (HIFB_LAYER_ID_E enLayerId, HIFB_LOGO_DATA_S *pstLogoData);
#endif
    HI_S32  (*DRV_HIFB_ADP_GetLayerPriority)          (HIFB_LAYER_ID_E enLayerId, HI_U32 *pU32Priority);
    HI_S32  (*DRV_HIFB_ADP_DeInit)                    (HI_VOID);
    HI_S32  (*DRV_HIFB_ADP_Init)                      (HI_VOID);
    HI_S32  (*DRV_HIFB_ADP_OpenLayer)                 (HIFB_LAYER_ID_E enLayerId);
    HI_S32  (*DRV_HIFB_ADP_SetColorReg)               (HIFB_LAYER_ID_E enLayerId, HI_U32 u32OffSet, HI_U32 u32Color, HI_S32 UpFlag);
    HI_S32  (*DRV_HIFB_ADP_SetTriDimMode)             (HIFB_LAYER_ID_E enLayerId, HIFB_STEREO_MODE_E enStereoMode, HIFB_STEREO_MODE_E enWbcSteroMode);
    HI_S32  (*DRV_HIFB_ADP_SetTriDimAddr)             (HIFB_LAYER_ID_E enLayerId, HI_U32 u32StereoAddr);
    HI_S32  (*DRV_HIFB_ADP_SetLayerAddr)              (HIFB_LAYER_ID_E enLayerId, HI_U32 u32Addr);
    HI_S32  (*DRV_HIFB_ADP_GetLayerAddr)              (HIFB_LAYER_ID_E enLayerId, HI_U32 *pu32Addr);
    HI_VOID (*DRV_HIFB_ADP_GetLayerWillWorkAddr)      (HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress);
    HI_VOID (*DRV_HIFB_ADP_GetLayerWorkAddr)          (HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress);
    HI_S32  (*DRV_HIFB_ADP_SetLayerAlpha)             (HIFB_LAYER_ID_E enLayerId, HIFB_ALPHA_S *pstAlpha);
    HI_S32  (*DRV_HIFB_ADP_SetLayerDataFmt)           (HIFB_LAYER_ID_E enLayerId, HIFB_COLOR_FMT_E enDataFmt);
    HI_S32  (*DRV_HIFB_ADP_SetLayerDeFlicker)         (HIFB_LAYER_ID_E enLayerId, HIFB_DEFLICKER_S *pstDeFlicker);
    HI_S32  (*DRV_HIFB_ADP_SetLayerPriority)          (HIFB_LAYER_ID_E enLayerId, HIFB_ZORDER_E enZOrder);
    HI_S32  (*DRV_HIFB_ADP_UpLayerReg)                (HIFB_LAYER_ID_E enLayerId);
    HI_VOID (*DRV_HIFB_ADP_GetDhd0Info)               (HIFB_LAYER_ID_E LayerId, HI_ULONG *pExpectIntLineNumsForVoCallBack,HI_ULONG *pExpectIntLineNumsForEndCallBack,HI_ULONG *pActualIntLineNumsForVoCallBack,HI_ULONG *pHardIntCntForVoCallBack);
    HI_VOID (*DRV_HIFB_ADP_GetCloseState)             (HIFB_LAYER_ID_E LayerId, HI_BOOL *pHasBeenClosedForVoCallBack, HI_BOOL *pHasBeenClosedForEndCallBack);
    HI_S32  (*DRV_HIFB_ADP_WaitVBlank)                (HIFB_LAYER_ID_E enLayerId);
    HI_S32  (*DRV_HIFB_ADP_SetLayKeyMask)             (HIFB_LAYER_ID_E enLayerId, const HIFB_COLORKEYEX_S* pstColorkey);
    HI_S32  (*DRV_HIFB_ADP_SetLayerPreMult)           (HIFB_LAYER_ID_E enLayerId, HI_BOOL bPreMul);
    HI_VOID (*DRV_HIFB_ADP_GetLayerPreMult)           (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pPreMul, HI_BOOL *pDePreMult);
    HI_VOID (*DRV_HIFB_ADP_GetLayerHdr)               (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pHdr);
    HI_VOID (*DRV_HIFB_ADP_GetClosePreMultState)      (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbShouldClosePreMult);
    HI_VOID (*DRV_HIFB_ADP_ReadRegister)              (HI_U32 Offset, HI_U32* pRegBuf);
    HI_VOID (*DRV_HIFB_ADP_WriteRegister)             (HI_U32 Offset, HI_U32 Value);
    HI_VOID (*DRV_HIFB_ADP_WhetherDiscardFrame)       (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pNoDiscardFrame);
    HI_S32  (*DRV_HIFB_ADP_SetCallback)               (HIFB_CALLBACK_TPYE_E enCType, IntCallBack pCallBack, HIFB_LAYER_ID_E enLayerId);
    HI_S32  (*DRV_HIFB_ADP_SetLayerStride)            (HIFB_LAYER_ID_E enLayerId, HI_U32 u32Stride);
    HI_VOID (*DRV_HIFB_ADP_GetLayerStride)            (HIFB_LAYER_ID_E enLayerId, HI_U32 *pStride);
    HI_S32  (*DRV_HIFB_ADP_SetLayerRect)              (HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstInputRect);
    HI_S32  (*DRV_HIFB_ADP_GetOutRect)                (HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    HI_S32  (*DRV_HIFB_ADP_GetLayerRect)              (HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    HI_S32  (*DRV_HIFB_ADP_SetGPMask)                 (HIFB_LAYER_ID_E enLayerId, HI_BOOL bFlag);
    HI_VOID (*DRV_HIFB_ADP_GetGPMask)                 (HIFB_LAYER_ID_E enLayerId, HI_BOOL* pbMask);
    HI_S32  (*DRV_HIFB_ADP_GetDispFMTSize)            (HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstOutputRect);
    HI_S32  (*DRV_HIFB_ADP_ClearLogoOsd)              (HIFB_LAYER_ID_E enLayerId);
    HI_S32  (*DRV_HIFB_ADP_SetStereoDepth)            (HIFB_LAYER_ID_E enLayerId, HI_S32 s32Depth);
    HI_S32  (*DRV_HIFB_ADP_SetTCFlag)                 (HI_BOOL bFlag);
    HI_VOID (*DRV_HIFB_ADP_SetDeCmpSwitch)            (HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen);
    HI_VOID (*DRV_HIFB_ADP_GetDeCmpSwitch)            (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbOpen);
    HI_VOID (*DRV_HIFB_ADP_SetDeCmpDdrInfo)           (HIFB_LAYER_ID_E enLayerId, HI_U32 ARHeadDdr,HI_U32 ARDataDdr,HI_U32 GBHeadDdr,HI_U32 GBDataDdr,HI_U32 DeCmpStride);
    HI_VOID (*DRV_HIFB_ADP_SetLowPowerInfo)           (HIFB_LAYER_ID_E enLayerId, HIFB_ADP_LOWPOWER_INFO_S *pstLowPowerInfo);
    HI_VOID (*DRV_HIFB_ADP_GetDecompressStatus)       (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbARDataDecompressErr, HI_BOOL *pbGBDataDecompressErr, HI_BOOL bCloseInterrupt);
    HI_S32  (*DRV_HIFB_ADP_GetHaltDispStatus)         (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbDispInit);
    HI_VOID (*DRV_HIFB_ADP_OpenMute)                  (HIFB_LAYER_ID_E LayerId);
    HI_VOID (*DRV_HIFB_ADP_CloseMute)                 (HIFB_LAYER_ID_E LayerId);
}HIFB_DRV_OPS_S;
/********************** Global Variable declaration ***********************************************/


/******************************* API declaration **************************************************/
/**************************************************************************************************
* func        : DRV_HIFB_ADP_GetCallBackFunction
* description : CNcomment: 获取设备上下文 CNend\n
* param[in]   : HI_VOID
* retval      : NA
* others:     : NA
***************************************************************************************************/
HI_VOID DRV_HIFB_ADP_GetCallBackFunction(HIFB_DRV_OPS_S *AdpCallBackFunction);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_MEM_UnMapAndRelease
* description   : unmap the ddr and release it\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_VOID DRV_HIFB_ADP_MEM_UnMapAndRelease(GFX_MMZ_BUFFER_S *psMBuf);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_MEM_AllocAndMap
* description   : CNcomment: alloc and map mem CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_MEM_AllocAndMap(const char *bufname, char *zone_name, HI_U32 size, int align, GFX_MMZ_BUFFER_S *psMBuf);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_MEM_MallocAndMap
* description   : CNcomment: 分配内存并映射地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_MEM_MallocAndMap(const char *bufname, char *zone_name, HI_U32 size, int align, GFX_MMZ_BUFFER_S *psMBuf);

/***************************************************************************************
* func         : DRV_HIFB_ADP_OpenLayer
* description  : CNcomment: 打开图层 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_OpenLayer(HIFB_LAYER_ID_E enLayerId);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_GFX_InitLayer
* description   : CNcomment: 初始化图层信息 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_GFX_InitLayer(HIFB_LAYER_ID_E enLayerId);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_GP_Open
* description   : CNcomment: 打开GP设备并设置ZME系数 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_GP_Open(HIFB_GP_ID_E enGPId);

/***************************************************************************************
* func         : DRV_HIFB_ADP_SetLayerPreMult
* description  : CNcomment: 设置图层预乘 CNend\n
* param[in]    : HI_VOID
* retval       : NA
* others:      : NA
***************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerPreMult(HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_ReleaseClutBuf
* description   : CNcomment: 释放调色板内存 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_VOID DRV_HIFB_ADP_ReleaseClutBuf(HIFB_LAYER_ID_E enLayerId);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetReadMode
* description   : CNcomment: 设置读取数据模式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetReadMode(HIFB_LAYER_ID_E enLayerId, OPTM_VDP_DATA_RMODE_E enReadMode);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_PixerFmtTransferToHalFmt
* description   : CNcomment: 根据像素数据转换成像素格式 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
OPTM_VDP_GFX_IFMT_E DRV_HIFB_ADP_PixerFmtTransferToHalFmt(HIFB_COLOR_FMT_E enDataFmt);


/**************************************************************************************************
* func          : DRV_HIFB_ADP_UpDataCallBack
* description   : CNcomment: 注册寄存器更新回调函数 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_VOID DRV_HIFB_ADP_UpDataCallBack(HI_VOID* u32Param0, HI_VOID* u32Param1);

/**************************************************************************************************
* func            : DRV_HIFB_ADP_SetLayerAddr
* description    : CNcomment: 设置显示地址 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:        : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerAddr(HIFB_LAYER_ID_E enLayerId, HI_U32 u32Addr);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetLayerStride
* description   : CNcomment: 设置图层stride CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerStride(HIFB_LAYER_ID_E enLayerId, HI_U32 u32Stride);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetCallbackToDisp
* description   : CNcomment: 向Display注册中断 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetCallbackToDisp(HIFB_GP_ID_E enGPId, IntCallBack pCallBack, HI_DRV_DISP_CALLBACK_TYPE_E eType, HI_BOOL bFlag);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetEnable
* description   : CNcomment: 设置图层使能 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetEnable(HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetLayerRect
* description   : CNcomment: 设置图层分辨率 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetLayerRect(HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstRect);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_SetGpRect
* description   : CNcomment: 设置图层对应的GP分辨率 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_S32 DRV_HIFB_ADP_SetGpRect(HIFB_GP_ID_E enGpId, const HIFB_RECT * pstInputRect);

/**************************************************************************************************
* func          : DRV_HIFB_ADP_CloseLayer
* description   : CNcomment: 关闭图层 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************************/
HI_VOID DRV_HIFB_ADP_CloseLayer(HIFB_LAYER_ID_E enLayerId);

/***************************************************************************************
* func        : HIFB_PARA_CHECK_SUPPORT
* description : CNcomment: 判断输入参数是否支持 CNend\n
* retval      : NA
* others:     : NA
***************************************************************************************/
HI_S32 HIFB_PARA_CHECK_SUPPORT(HI_U32 Mask, HI_U32 Width, HI_U32 Height, HI_U32 Stride, HI_U32 Fmt, HI_U32 BitsPerPixel);

HI_S32  OPTM_GfxSetDispFMTSize(HIFB_GP_ID_E enGpId, const HI_RECT_S *pstOutRect);

#ifdef HI_BUILD_IN_BOOT
HI_BOOL DRV_HIFB_ADP_WhetherSupportWbc     (HI_VOID);
HI_S32  DRV_HIFB_ADP_Init                  (HI_VOID);
HI_S32  DRV_HIFB_ADP_SetTCFlag             (HI_BOOL bFlag);
HI_S32  DRV_HIFB_ADP_LOGO_InitGpFromDisp   (HIFB_GP_ID_E enGPId, HI_BOOL Support4KLogo);
HI_S32  DRV_HIFB_ADP_OpenLayer             (HIFB_LAYER_ID_E enLayerId);
HI_S32  DRV_HIFB_ADP_SetLayerAlpha         (HIFB_LAYER_ID_E enLayerId, HIFB_ALPHA_S *pstAlpha);
HI_S32  DRV_HIFB_ADP_SetLayerDataFmt       (HIFB_LAYER_ID_E enLayerId, HIFB_COLOR_FMT_E enDataFmt);
HI_S32  DRV_HIFB_ADP_UpLayerReg            (HIFB_LAYER_ID_E enLayerId);
#endif

#ifndef HI_BUILD_IN_BOOT
/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
#define HI_GFX_Memcpy  HIFB_Memcpy
#define HI_GFX_Memset  HIFB_Memset
HI_VOID HIFB_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize);
HI_VOID HIFB_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize);
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
