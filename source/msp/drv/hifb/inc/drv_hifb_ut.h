/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : drv_hifb_ut.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History            :
Date                    Author                Modification
2018/01/01              sdk                   Created file
***************************************************************************************************/
#ifndef __DRV_HIFB_UT_H__
#define __DRV_HIFB_UT_H__


/*********************************add include here*************************************************/
#include "drv_hifb_ext.h"
#include "hifb.h"

/**************************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ***************************************************/
typedef HI_S32    (*FN_HIFB_ADP_ParaCheckSupport)             (HI_U32 Mask, HI_U32 Width, HI_U32 Height, HI_U32 Stride, HI_U32 Fmt, HI_U32 BitsPerPixel);
typedef HI_U32    (*FN_HIFB_ADP_Align)                        (const HI_U32 x, const HI_U32 a);
typedef HI_U32    (*FN_HIFB_ADP_GetGfxHalId)                  (HIFB_LAYER_ID_E LayerId);
typedef HI_U32    (*FN_HIFB_ADP_GetGpId)                      (HIFB_LAYER_ID_E LayerId);
typedef HI_U32    (*FN_HIFB_ADP_GetGpHalId)                   (HIFB_GP_ID_E GpId);
typedef HI_U32    (*FN_HIFB_ADP_GetCscTyeFromDisp)            (HI_DRV_COLOR_SPACE_E enHiDrvCsc);
typedef HI_U32    (*FN_HIFB_ADP_GetStereoModeFromDisp)        (OPTM_VDP_DISP_MODE_E enDispStereo);
typedef HI_VOID   (*FN_HIFB_ADP_StereoCallBack)               (struct work_struct *data);
typedef HI_S32    (*FN_HIFB_ADP_GpOpen)                       (HIFB_GP_ID_E enGPId);
typedef HI_S32    (*FN_HIFB_ADP_GpClose)                      (HIFB_GP_ID_E enGPId);
typedef HI_S32    (*FN_HIFB_ADP_SetReadMode)                  (HIFB_LAYER_ID_E enLayerId, OPTM_VDP_DATA_RMODE_E enReadMode);
typedef HI_S32    (*FN_HIFB_ADP_InitLayer)                    (HIFB_LAYER_ID_E enLayerId);
typedef HI_VOID   (*FN_HIFB_ADP_ReleaseClutBuf)               (HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_SetGpCsc)                     (HIFB_GP_ID_E enGfxGpId, HI_BOOL bIsBGRIn);
typedef HI_S32    (*FN_HIFB_ADP_SetCallback)                  (HIFB_CALLBACK_TPYE_E enCType, IntCallBack pCallBack, HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_CheckGfxCallbackReg)          (HIFB_GP_ID_E enGPId, HIFB_CALLBACK_TPYE_E eCallbackType);
typedef HI_S32    (*FN_HIFB_ADP_GetScreenRectFromDispInfo)    (const HI_RECT_S *tmp_virtscreen, const OPTM_GFX_OFFSET_S *stOffsetInfo,const HI_RECT_S *stFmtResolution,const HI_RECT_S *stPixelFmtResolution,HI_RECT_S *stScreenRect);
typedef HI_VOID   (*FN_HIFB_ADP_FrameEndCallBack)             (HI_VOID* u32Param0, HI_VOID* u32Param1);
typedef HI_BOOL   (*FN_HIFB_ADP_DispInfoProcess)              (HIFB_GP_ID_E eGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
typedef HI_S32    (*FN_HIFB_ADP_GpSetMask)                    (HIFB_GP_ID_E enGPId, HI_BOOL bFlag);
typedef HI_VOID   (*FN_HIFB_ADP_SetLowPowerInfo)              (HIFB_LAYER_ID_E enLayerId, HIFB_ADP_LOWPOWER_INFO_S *pstLowPowerInfo);
typedef HI_VOID   (*FN_HIFB_ADP_SetDeCmpDdrInfo)              (HIFB_LAYER_ID_E enLayerId, HI_U32 ARHeadDdr, HI_U32 ARDataDdr, HI_U32 GBHeadDdr,HI_U32 GBDataDdr, HI_U32 DeCmpStride);
typedef HI_VOID   (*FN_HIFB_ADP_GetDecompressStatus)          (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbARDataDecompressErr, HI_BOOL *pbGBDataDecompressErr, HI_BOOL bCloseInterrupt);
typedef HI_VOID   (*FN_HIFB_ADP_DecompressOpen)               (HIFB_LAYER_ID_E enLayerId);
typedef HI_VOID   (*FN_HIFB_ADP_DecompressClose)              (HIFB_LAYER_ID_E enLayerId);
typedef HI_VOID   (*FN_HIFB_ADP_UpDataCallBack)               (HI_VOID* u32Param0, HI_VOID* u32Param1);
typedef HI_VOID   (*FN_HIFB_ADP_ReOpen)                       (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
typedef HI_VOID   (*FN_HIFB_ADP_ReClose)                      (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
typedef HI_VOID   (*FN_HIFB_ADP_DispSetting)                  (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
typedef HI_VOID   (*FN_HIFB_ADP_UpdataLayerInfo)              (HIFB_GP_ID_E enGpId, HI_DISP_DISPLAY_INFO_S *pstDispInfo);
typedef HI_DRV_DISPLAY_E   (*FN_HIFB_ADP_GfxChn2DispChn)      (OPTM_DISPCHANNEL_E enDispCh);
typedef HI_S32    (*FN_HIFB_ADP_SetCallbackToDisp)            (HIFB_GP_ID_E enGPId, IntCallBack pCallBack, HI_DRV_DISP_CALLBACK_TYPE_E eType, HI_BOOL bFlag);
typedef HI_S32    (*FN_HIFB_ADP_OpenLayer)                    (HIFB_LAYER_ID_E enLayerId);
typedef HI_VOID   (*FN_HIFB_ADP_CloseLayer)                   (HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_SetEnable)                    (HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable);
typedef HI_VOID   (*FN_HIFB_ADP_GetEnable)                    (HIFB_LAYER_ID_E enLayerId, HI_BOOL* pbEnable);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerAddr)                 (HIFB_LAYER_ID_E enLayerId, HI_U32 u32Addr);
typedef HI_S32    (*FN_HIFB_ADP_GetLayerAddr)                 (HIFB_LAYER_ID_E enLayerId, HI_U32 *pu32Addr);
typedef HI_VOID   (*FN_HIFB_ADP_GetLayerWorkAddr)             (HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress);
typedef HI_VOID   (*FN_HIFB_ADP_GetLayerWillWorkAddr)         (HIFB_LAYER_ID_E enLayerId, HI_U32 *pAddress);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerStride)               (HIFB_LAYER_ID_E enLayerId, HI_U32 u32Stride);
typedef HI_VOID   (*FN_HIFB_ADP_GetLayerStride)               (HIFB_LAYER_ID_E enLayerId, HI_U32 *pStride);
typedef HIFB_COLOR_FMT_E    (*FN_HIFB_ADP_HalFmtTransferToPixerFmt)     (OPTM_VDP_GFX_IFMT_E enDataFmt);
typedef OPTM_VDP_GFX_IFMT_E (*FN_HIFB_ADP_PixerFmtTransferToHalFmt)     (HIFB_COLOR_FMT_E enDataFmt);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerDataFmt)              (HIFB_LAYER_ID_E enLayerId, HIFB_COLOR_FMT_E enDataFmt);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerDataBigEndianFmt)     (HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerDataLittleEndianFmt)  (HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_SetColorReg)                  (HIFB_LAYER_ID_E enLayerId, HI_U32 u32OffSet, HI_U32 u32Color, HI_S32 UpFlag);
typedef HI_VOID   (*FN_HIFB_ADP_GfxWVBCallBack)               (HI_U32 enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_WaitVBlank)                   (HIFB_LAYER_ID_E enLayerId);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerAlpha)                (HIFB_LAYER_ID_E enLayerId, HIFB_ALPHA_S *pstAlpha);
typedef HI_S32    (*FN_HIFB_ADP_GetLayerRect)                 (HIFB_LAYER_ID_E enLayerId, HIFB_RECT *pstRect);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerRect)                 (HIFB_LAYER_ID_E enLayerId, const HIFB_RECT *pstRect);
typedef HI_S32    (*FN_HIFB_ADP_GetDispFMTSize)               (HIFB_LAYER_ID_E LayerId, HIFB_RECT *pstOutRect);
typedef HI_S32    (*FN_HIFB_ADP_SetGpRect)                    (HIFB_GP_ID_E enGpId, const HIFB_RECT * pstInputRect);
typedef HI_VOID   (*FN_HIFB_ADP_ResetLayerInRect)             (HIFB_GP_ID_E enGpId);
typedef HI_S32    (*FN_HIFB_ADP_GetOutRect)                   (HIFB_LAYER_ID_E enLayerId, HIFB_RECT * pstOutputRect);
typedef HI_S32    (*FN_HIFB_ADP_SetLayKeyMask)                (HIFB_LAYER_ID_E enLayerId, const HIFB_COLORKEYEX_S *pstColorkey);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerPreMult)              (HIFB_LAYER_ID_E enLayerId, HI_BOOL bEnable);
typedef HI_VOID   (*FN_HIFB_ADP_GetLayerPreMult)              (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pPreMul, HI_BOOL *pDePreMult);
typedef HI_VOID   (*FN_HIFB_ADP_GetLayerHdr)                  (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pHdr);
typedef HI_S32    (*FN_HIFB_ADP_GetClosePreMultState)         (HIFB_LAYER_ID_E LayerId, HI_BOOL *pbShouldClosePreMult);
typedef HI_VOID   (*FN_HIFB_ADP_WhetherDiscardFrame)          (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pNoDiscardFrame);
typedef HI_VOID   (*FN_HIFB_ADP_GetOSDData)                   (HIFB_LAYER_ID_E enLayerId, HIFB_OSD_DATA_S *pstLayerData);
typedef HI_VOID   (*FN_HIFB_ADP_GetLogoData)                  (HIFB_LAYER_ID_E enLayerId, HIFB_LOGO_DATA_S *pstLogoData);
typedef HI_S32    (*FN_HIFB_ADP_UpLayerReg)                   (HIFB_LAYER_ID_E enLayerId);
typedef HI_VOID   (*FN_HIFB_ADP_GetCloseState)                (HIFB_LAYER_ID_E LayerId, HI_BOOL *pHasBeenClosedForVoCallBack, HI_BOOL *pHasBeenClosedForEndCallBack);
typedef HI_VOID   (*FN_HIFB_ADP_GetDhd0Info)                  (HIFB_LAYER_ID_E LayerId, HI_ULONG *pExpectIntLineNumsForVoCallBack,HI_ULONG *pExpectIntLineNumsForEndCallBack,HI_ULONG *pActualIntLineNumsForVoCallBack,HI_ULONG *pHardIntCntForVoCallBack);
typedef HI_S32    (*FN_HIFB_ADP_SetTriDimMode)                (HIFB_LAYER_ID_E enLayerId, HIFB_STEREO_MODE_E enMode, HIFB_STEREO_MODE_E enWbcSteroMode);
typedef HI_S32    (*FN_HIFB_ADP_SetTriDimAddr)                (HIFB_LAYER_ID_E enLayerId, HI_U32 u32TriDimAddr);
typedef HI_S32    (*FN_HIFB_ADP_GetLayerPriority)             (HIFB_LAYER_ID_E enLayerId, HI_U32 *pPriority);
typedef HI_S32    (*FN_HIFB_ADP_SetLayerPriority)             (HIFB_LAYER_ID_E enLayerId, HIFB_ZORDER_E enZOrder);
typedef HI_S32    (*FN_HIFB_ADP_DispInfoUpdate)               (HIFB_GP_ID_E enGPId);
typedef HI_S32    (*FN_HIFB_ADP_GPRecovery)                   (HIFB_GP_ID_E enGPId);
typedef HI_S32    (*FN_HIFB_ADP_VoCallback)                   (HI_VOID* u32Param0, HI_VOID* u32Param1);
typedef HI_S32    (*FN_HIFB_ADP_DistributeCallback)           (HI_VOID* u32Param0, HI_VOID* u32Param1);
typedef HI_S32    (*FN_HIFB_ADP_SetGPMask)                    (HIFB_LAYER_ID_E LayerId, HI_BOOL bFlag);
typedef HI_VOID   (*FN_HIFB_ADP_GetGPMask)                    (HIFB_LAYER_ID_E LayerId, HI_BOOL* pbMask);
typedef HI_S32    (*FN_HIFB_ADP_SetStereoDepth)               (HIFB_LAYER_ID_E enLayerId, HI_S32 s32Depth);
typedef HI_S32    (*FN_HIFB_ADP_GetHaltDispStatus)            (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbDispInit);
typedef HI_VOID   (*FN_HIFB_ADP_SetDeCmpSwitch)               (HIFB_LAYER_ID_E enLayerId, HI_BOOL bOpen);
typedef HI_VOID   (*FN_HIFB_ADP_GetDeCmpSwitch)               (HIFB_LAYER_ID_E enLayerId, HI_BOOL *pbOpen);
typedef HI_VOID   (*FN_HIFB_ADP_AdpOpenMute)                  (HIFB_LAYER_ID_E LayerId);
typedef HI_VOID   (*FN_HIFB_ADP_CloseMute)                    (HIFB_LAYER_ID_E LayerId);
/***************************** Now Has not been used *********************************************/

/*************************** Structure Definition *************************************************/
typedef struct
{
    FN_HIFB_ModInit                          pfnHifbModInit;
    FN_HIFB_ModeExit                         pfnHifbModExit;
    FN_HIFB_GetSettingInfo                   pfnHifbGetSettingInfo;
    FN_HIFB_SetLogoLayerEnable               pfnHifbSetLogoLayerEnable;
    FN_HIFB_ADP_ParaCheckSupport             pfnHifbAdpParaCheckSupport;
    FN_HIFB_ADP_Align                        pfnHifbAdpAlign;
    FN_HIFB_ADP_GetGfxHalId                  pfnHifbAdpGetGfxHalId;
    FN_HIFB_ADP_GetGpId                      pfnHifbAdpGetGpId;
    FN_HIFB_ADP_GetGpHalId                   pfnHifbAdpGetGpHalId;
    FN_HIFB_ADP_GetCscTyeFromDisp            pfnHifbAdpGetCscTyeFromDisp;
    FN_HIFB_ADP_GetStereoModeFromDisp        pfnHifbAdpGetStereoModeFromDisp;
    FN_HIFB_ADP_StereoCallBack               pfnHifbAdpStereoCallBack;
    FN_HIFB_ADP_GpOpen                       pfnHifbAdpGpOpen;
    FN_HIFB_ADP_GpClose                      pfnHifbAdpGpClose;
    FN_HIFB_ADP_SetReadMode                  pfnHifbAdpSetReadMode;
    FN_HIFB_ADP_InitLayer                    pfnHifbAdpInitLayer;
    FN_HIFB_ADP_ReleaseClutBuf               pfnHifbAdpReleaseClutBuf;
    FN_HIFB_ADP_SetGpCsc                     pfnHifbAdpSetGpCsc;
    FN_HIFB_ADP_SetCallback                  pfnHifbAdpSetCallback;
    FN_HIFB_ADP_CheckGfxCallbackReg          pfnHifbAdpCheckGfxCallbackReg;
    FN_HIFB_ADP_GetScreenRectFromDispInfo    pfnHifbAdpGetScreenRectFromDispInfo;
    FN_HIFB_ADP_FrameEndCallBack             pfnHifbAdpFrameEndCallBack;
    FN_HIFB_ADP_DispInfoProcess              pfnHifbAdpDispInfoProcess;
    FN_HIFB_ADP_GpSetMask                    pfnHifbAdpGpSetMask;
    FN_HIFB_ADP_SetLowPowerInfo              pfnHifbAdpSetLowPowerInfo;
    FN_HIFB_ADP_SetDeCmpDdrInfo              pfnHifbAdpSetDeCmpDdrInfo;
    FN_HIFB_ADP_GetDecompressStatus          pfnHifbAdpGetDecompressStatus;
    FN_HIFB_ADP_DecompressOpen               pfnHifbAdpDecompressOpen;
    FN_HIFB_ADP_DecompressClose              pfnHifbAdpDecompressClose;
    FN_HIFB_ADP_UpDataCallBack               pfnHifbAdpUpDataCallBack;
    FN_HIFB_ADP_ReOpen                       pfnHifbAdpReOpen;
    FN_HIFB_ADP_ReClose                      pfnHifbAdpReClose;
    FN_HIFB_ADP_DispSetting                  pfnHifbAdpDispSetting;
    FN_HIFB_ADP_UpdataLayerInfo              pfnHifbAdpUpdataLayerInfo;
    FN_HIFB_ADP_GfxChn2DispChn               pfnHifbAdpGfxChn2DispChn;
    FN_HIFB_ADP_SetCallbackToDisp            pfnHifbAdpSetCallbackToDisp;
    FN_HIFB_ADP_OpenLayer                    pfnHifbAdpOpenLayer;
    FN_HIFB_ADP_CloseLayer                   pfnHifbAdpCloseLayer;
    FN_HIFB_ADP_SetEnable                    pfnHifbAdpSetEnable;
    FN_HIFB_ADP_GetEnable                    pfnHifbAdpGetEnable;
    FN_HIFB_ADP_SetLayerAddr                 pfnHifbAdpSetLayerAddr;
    FN_HIFB_ADP_GetLayerAddr                 pfnHifbAdpGetLayerAddr;
    FN_HIFB_ADP_GetLayerWorkAddr             pfnHifbAdpGetLayerWorkAddr;
    FN_HIFB_ADP_GetLayerWillWorkAddr         pfnHifbAdpGetLayerWillWorkAddr;
    FN_HIFB_ADP_SetLayerStride               pfnHifbAdpSetLayerStride;
    FN_HIFB_ADP_GetLayerStride               pfnHifbAdpGetLayerStride;
    FN_HIFB_ADP_HalFmtTransferToPixerFmt     pfnHifbAdpHalFmtTransferToPixerFmt;
    FN_HIFB_ADP_PixerFmtTransferToHalFmt     pfnHifbAdpPixerFmtTransferToHalFmt;
    FN_HIFB_ADP_SetLayerDataFmt              pfnHifbAdpSetLayerDataFmt;
    FN_HIFB_ADP_SetLayerDataBigEndianFmt     pfnHifbAdpSetLayerDataBigEndianFmt;
    FN_HIFB_ADP_SetLayerDataLittleEndianFmt  pfnHifbAdpSetLayerDataLittleEndianFmt;
    FN_HIFB_ADP_SetColorReg                  pfnHifbAdpSetColorReg;
    FN_HIFB_ADP_GfxWVBCallBack               pfnHifbAdpGfxWVBCallBack;
    FN_HIFB_ADP_WaitVBlank                   pfnHifbAdpWaitVBlank;
    FN_HIFB_ADP_SetLayerAlpha                pfnHifbAdpSetLayerAlpha;
    FN_HIFB_ADP_GetLayerRect                 pfnHifbAdpGetLayerRect;
    FN_HIFB_ADP_SetLayerRect                 pfnHifbAdpSetLayerRect;
    FN_HIFB_ADP_GetDispFMTSize               pfnHifbAdpGetDispFMTSize;
    FN_HIFB_ADP_SetGpRect                    pfnHifbAdpSetGpRect;
    FN_HIFB_ADP_ResetLayerInRect             pfnHifbAdpResetLayerInRect;
    FN_HIFB_ADP_GetOutRect                   pfnHifbAdpGetOutRect;
    FN_HIFB_ADP_SetLayKeyMask                pfnHifbAdpSetLayKeyMask;
    FN_HIFB_ADP_SetLayerPreMult              pfnHifbAdpSetLayerPreMult;
    FN_HIFB_ADP_GetLayerPreMult              pfnHifbAdpGetLayerPreMult;
    FN_HIFB_ADP_GetLayerHdr                  pfnHifbAdpGetLayerHdr;
    FN_HIFB_ADP_WhetherDiscardFrame          pfnHifbAdpWhetherDiscardFrame;
    FN_HIFB_ADP_GetOSDData                   pfnHifbAdpGetOSDData;
    FN_HIFB_ADP_GetLogoData                  pfnHifbAdpGetLogoData;
    FN_HIFB_ADP_UpLayerReg                   pfnHifbAdpUpLayerReg;
    FN_HIFB_ADP_GetCloseState                pfnHifbAdpGetCloseState;
    FN_HIFB_ADP_GetDhd0Info                  pfnHifbAdpGetDhd0Info;
    FN_HIFB_ADP_SetTriDimMode                pfnHifbAdpSetTriDimMode;
    FN_HIFB_ADP_SetTriDimAddr                pfnHifbAdpSetTriDimAddr;
    FN_HIFB_ADP_GetLayerPriority             pfnHifbAdpGetLayerPriority;
    FN_HIFB_ADP_SetLayerPriority             pfnHifbAdpSetLayerPriority;
    FN_HIFB_ADP_DispInfoUpdate               pfnHifbAdpDispInfoUpdate;
    FN_HIFB_ADP_GPRecovery                   pfnHifbAdpGPRecovery;
    FN_HIFB_ADP_VoCallback                   pfnHifbAdpVoCallback;
    FN_HIFB_ADP_DistributeCallback           pfnHifbAdpDistributeCallback;
    FN_HIFB_ADP_SetGPMask                    pfnHifbAdpSetGPMask;
    FN_HIFB_ADP_GetGPMask                    pfnHifbAdpGetGPMask;
    FN_HIFB_ADP_SetStereoDepth               pfnHifbAdpSetStereoDepth;
    FN_HIFB_ADP_GetHaltDispStatus            pfnHifbAdpGetHaltDispStatus;
    FN_HIFB_ADP_SetDeCmpSwitch               pfnHifbAdpSetDeCmpSwitch;
    FN_HIFB_ADP_GetDeCmpSwitch               pfnHifbAdpGetDeCmpSwitch;
    FN_HIFB_ADP_AdpOpenMute                  pfnHifbAdpOpenMute;
    FN_HIFB_ADP_CloseMute                    pfnHifbAdpCloseMute;
/***************************** Now Has not been used *********************************************/
}HIFB_EXPORT_UT_FUNC_S;

/********************** Global Variable declaration ***********************************************/



/******************************* API declaration **************************************************/


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif
