/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name       : drv_hifb_hal.h
Version         : Initial Draft
Author          :
Created         : 2018/01/01
Description     :
Function List   :


History         :
Date                  Author                Modification
2018/01/01            sdk                   Created file
************************************************************************************************/
#ifndef __DRV_HIFB_HAL_H__
#define __DRV_HIFB_HAL_H__


/*********************************add include here**********************************************/
#include "optm_define.h"

/***********************************************************************************************/
#ifdef __cplusplus
#if __cplusplus
   extern "C" {
#endif
#endif /* __cplusplus */


/***************************** Macro Definition ************************************************/


/*************************** Structure Definition **********************************************/

/***************************  The enum of Jpeg image format  ***********************************/

/********************** Global Variable declaration ********************************************/


/******************************* API declaration ***********************************************/
HI_VOID DRV_HIFB_HAL_VDP_Initial              (volatile HI_U32* virAddr);

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_DISP_GetDhd1Field        (HI_BOOL *pbIsBottomField);
HI_VOID DRV_HIFB_HAL_DISP_GetDhd0Vtthd3       (HI_ULONG *pExpectIntLineNumsForEndCallBack);
HI_VOID DRV_HIFB_HAL_DISP_GetDhd0Vtthd        (HI_ULONG *pExpectIntLineNumsForVoCallBack);
HI_VOID DRV_HIFB_HAL_DISP_GetDhd0State        (HI_ULONG *pActualIntLineNumsForCallBack,HI_ULONG *pHardIntCntForCallBack);
HI_VOID DRV_HIFB_HAL_GFX_GetWorkLayerAddr     (HI_U32 u32Data, HI_U32 *pu32Addr);
HI_VOID DRV_HIFB_HAL_GFX_GetWillWorkLayerAddr (HI_U32 u32Data, HI_U32 *pu32Addr);
#endif

HI_VOID DRV_HIFB_HAL_GFX_SetInterrupt          (HI_BOOL bOpen);
//-------------------------------------------------------------------
//GFX_BEGIN
//-------------------------------------------------------------------
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_GetLayerAddr        (HI_U32 u32Data, HI_U32 *pu32Addr);
HI_VOID DRV_HIFB_HAL_GFX_GetLayerEnable      (HI_U32 u32Data, HI_U32 *pu32Enable);
HI_VOID DRV_HIFB_HAL_GFX_GetLayerInRect      (HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *stInRect);
HI_VOID DRV_HIFB_HAL_GFX_GetLayerStride      (HI_U32 u32Data, HI_U32 *pu32Stride);
HI_VOID DRV_HIFB_HAL_GFX_GetPalpha           (HI_U32 u32Data, HI_U32 *pbAlphaEn,HI_U32 *pbArange,HI_U8 *pu8Alpha0,HI_U8 *pu8Alpha1);
HI_VOID DRV_HIFB_HAL_GFX_GetLayerGalpha      (HI_U32 u32Data, HI_U8 *pu8Alpha0);
HI_VOID DRV_HIFB_HAL_GFX_GetKeyMask          (HI_U32 u32Data, OPTM_VDP_GFX_MASK_S *pstMsk);
HI_VOID DRV_HIFB_HAL_GFX_GetColorKey         (HI_U32 u32Data, HI_U32 *pbkeyEn,OPTM_VDP_GFX_CKEY_S *pstKey);
HI_VOID DRV_HIFB_HAL_GFX_GetInDataFmt        (HI_U32 u32Data, OPTM_VDP_GFX_IFMT_E  *enDataFmt);
HI_VOID DRV_HIFB_HAL_WBC_GP_GetEnable        (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 *pEnable);
#endif

HI_VOID DRV_HIFB_HAL_CBM_GetMixerPrio       (OPTM_VDP_CBM_MIX_E u32mixer_id, HI_U32 *pu32prio);
HI_VOID DRV_HIFB_HAL_CBM_SetMixgPrio        (OPTM_VDP_CBM_MIX_E u32mixer_id, HI_U32 u32prio);
HI_VOID DRV_HIFB_HAL_GFX_SetLayerReso       (HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect);
HI_VOID DRV_HIFB_HAL_GFX_SetLayerEnable     (HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID DRV_HIFB_HAL_GFX_SetLayerAddrEX     (HI_U32 u32Data, HI_U32 u32LAddr);
HI_VOID DRV_HIFB_HAL_GFX_SetLayerStride     (HI_U32 u32Data, HI_U32 u32Stride);
HI_VOID DRV_HIFB_HAL_GFX_SetInDataFmt       (HI_U32 u32Data, OPTM_VDP_GFX_IFMT_E enDataFmt);
HI_VOID DRV_HIFB_HAL_GFX_SetReadMode        (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID DRV_HIFB_HAL_GFX_GetReadMode        (HI_U32 u32Data, HI_U32 *pu32Mode);
HI_VOID DRV_HIFB_HAL_GFX_SetBitExtend       (HI_U32 u32Data, OPTM_VDP_GFX_BITEXTEND_E u32mode);
HI_VOID DRV_HIFB_HAL_GFX_SetColorKey        (HI_U32 u32Data, HI_U32  bkeyEn,OPTM_VDP_GFX_CKEY_S *pstKey);
HI_VOID DRV_HIFB_HAL_GFX_SetKeyMask         (HI_U32 u32Data, OPTM_VDP_GFX_MASK_S *pstMsk);


HI_VOID DRV_HIFB_HAL_GFX_SetParaUpd         (HI_U32 u32Data, OPTM_VDP_DISP_COEFMODE_E enMode);
HI_VOID DRV_HIFB_HAL_GFX_SetLutAddr         (HI_U32 u32Data, HI_U32 u32LutAddr);
HI_VOID DRV_HIFB_HAL_GFX_SetNoSecFlag       (HI_U32 u32Data, HI_U32 u32Enable);
HI_VOID DRV_HIFB_HAL_GFX_SetDcmpEnable      (HI_U32 u32Data, HI_U32 u32bEnable);
HI_VOID DRV_HIFB_HAL_GFX_GetDcmpEnable      (HI_U32 u32Data, HI_U32 *pbEnable);
HI_VOID DRV_HIFB_HAL_GFX_SetDeCmpDdrInfo    (HI_U32 u32Data, HI_U32 ARHeadDdr,HI_U32 ARDataDdr,HI_U32 GBHeadDdr,HI_U32 GBDataDdr,HI_U32 DeCmpStride);
HI_VOID DRV_HIFB_HAL_GFX_GetDeCmpStatus     (HI_U32 u32Data, HI_BOOL *pbARDataDecompressErr, HI_BOOL *pbGBDataDecompressErr, HI_BOOL bCloseInterrupt);

//3D
#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_SetThreeDimDofEnable  (HI_U32 u32Data, HI_U32 bEnable);
HI_VOID DRV_HIFB_HAL_GFX_SetThreeDimDofStep    (HI_U32 u32Data, HI_S32 s32LStep, HI_S32 s32RStep);
HI_VOID DRV_HIFB_HAL_GFX_SetLowPowerInfo       (HI_U32 u32Data, HI_U32 *pLowPowerInfo);
HI_VOID DRV_HIFB_HAL_GFX_EnableLayerLowPower   (HI_U32 u32Data, HI_BOOL EnLowPower);
HI_VOID DRV_HIFB_HAL_GFX_EnableGpLowPower      (HI_U32 u32Data, HI_BOOL EnLowPower);
#endif

HI_VOID DRV_HIFB_HAL_GFX_GetPreMultEnable      (HI_U32 u32Data, HI_U32 *pbEnable, HI_BOOL *pDePreMult);
HI_VOID DRV_HIFB_HAL_GFX_SetPreMultEnable      (HI_U32 u32Data, HI_U32 bEnable, HI_BOOL bHdr);
HI_VOID DRV_HIFB_HAL_GFX_SetLayerBkg           (HI_U32 u32Data, OPTM_VDP_BKG_S *pstBkg);
HI_VOID DRV_HIFB_HAL_GFX_SetLayerGalpha        (HI_U32 u32Data, HI_U32 u32Alpha0);
HI_VOID DRV_HIFB_HAL_GFX_SetPalpha             (HI_U32 u32Data, HI_U32 bAlphaEn,HI_U32 bArange,HI_U32 u32Alpha0,HI_U32 u32Alpha1);
HI_VOID DRV_HIFB_HAL_GFX_ReadRegister          (HI_U32 Offset, HI_U32* pRegBuf);
HI_VOID DRV_HIFB_HAL_GFX_WriteRegister         (HI_U32 Offset,HI_U32 Value);

#ifndef HI_BUILD_IN_BOOT
HI_VOID DRV_HIFB_HAL_GFX_SetLayerNAddr         (HI_U32 u32Data, HI_U32 u32NAddr);
#endif
HI_VOID DRV_HIFB_HAL_GFX_SetUpdMode            (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID DRV_HIFB_HAL_GFX_SetRegUp              (HI_U32 u32Data);

//-------------------------------------------------------------------
//GP_BEGIN
//-------------------------------------------------------------------
HI_VOID DRV_HIFB_HAL_GP_GetRect                (HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect);
HI_VOID DRV_HIFB_HAL_GP_SetLayerReso           (HI_U32 u32Data, OPTM_VDP_DISP_RECT_S *pstRect);
HI_VOID DRV_HIFB_HAL_GP_SetIpOrder             (HI_U32 u32Data, HI_U32 u32Chn, OPTM_VDP_GP_ORDER_E enIpOrder);
HI_VOID DRV_HIFB_HAL_GP_SetReadMode            (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID DRV_HIFB_HAL_GP_SetUpMode              (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID DRV_HIFB_HAL_GP_SetParaUpd             (HI_U32 u32Data, OPTM_VDP_GP_PARA_E enMode);
HI_VOID DRV_HIFB_HAL_GP_SetRegUp               (HI_U32 u32Data);
HI_VOID DRV_HIFB_HAL_GP_SetLayerGalpha         (HI_U32 u32Data, HI_U32 u32Alpha);

//GP_CSC_BEGIN
HI_VOID DRV_HIFB_HAL_GP_SetCscDcCoef            (HI_U32 u32Data, OPTM_VDP_CSC_DC_COEF_S *pstCscCoef);
HI_VOID DRV_HIFB_HAL_GP_SetCscCoef              (HI_U32 u32Data, OPTM_VDP_CSC_COEF_S *pstCscCoef);
HI_VOID DRV_HIFB_HAL_GP_SetCscEnable            (HI_U32 u32Data, HI_U32 u32bCscEn);

HI_VOID DRV_HIFB_HAL_GP_SetZmeEnable            (HI_U32 u32Data, OPTM_VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID DRV_HIFB_HAL_GP_SetZmePhase             (HI_U32 u32Data, OPTM_VDP_ZME_MODE_E enMode, HI_S32 s32Phase);
HI_VOID DRV_HIFB_HAL_GP_SetZmeFirEnable         (HI_U32 u32Data, OPTM_VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID DRV_HIFB_HAL_GP_SetZmeMidEnable         (HI_U32 u32Data, OPTM_VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID DRV_HIFB_HAL_GP_SetZmeHorRatio          (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID DRV_HIFB_HAL_GP_SetZmeVerRatio          (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID DRV_HIFB_HAL_GP_SetZmeHfirOrder         (HI_U32 u32Data, HI_U32 u32HfirOrder);
HI_VOID DRV_HIFB_HAL_GP_SetZmeCoefAddr          (HI_U32 u32Data, HI_U32 u32Mode, HI_U32 u32Addr);

//GTI
HI_VOID  DRV_HIFB_HAL_GP_SetTiEnable            (HI_U32 u32Data, HI_U32 u32Md, HI_U32 u32Data1);
HI_VOID  DRV_HIFB_HAL_GP_SetTiGainRatio         (HI_U32 u32Data, HI_U32 u32Md, HI_S32 s32Data);
HI_VOID  DRV_HIFB_HAL_GP_SetTiMixRatio          (HI_U32 u32Data, HI_U32 u32Md, HI_U32 u32mixing_ratio);
HI_VOID  DRV_HIFB_HAL_GP_SetTiHfThd             (HI_U32 u32Data, HI_U32 u32Md, HI_U32 *u32TiHfThd);
HI_VOID  DRV_HIFB_HAL_GP_SetTiHpCoef            (HI_U32 u32Data, HI_U32 u32Md, HI_S32 *s32Data);
HI_VOID  DRV_HIFB_HAL_GP_SetTiCoringThd         (HI_U32 u32Data, HI_U32 u32Md, HI_U32 u32thd);
HI_VOID  DRV_HIFB_HAL_GP_SetTiSwingThd          (HI_U32 u32Data, HI_U32 u32Md, HI_U32 u32thd, HI_U32 u32thd1);
HI_VOID  DRV_HIFB_HAL_GP_SetTiGainCoef          (HI_U32 u32Data, HI_U32 u32Md, HI_U32 *u32coef);

//-------------------------------------------------------------------
//MIXER_BEGIN
//-------------------------------------------------------------------
HI_VOID DRV_HIFB_HAL_CBM_OpenMuteBk         (HI_U32 u32Data);
HI_VOID DRV_HIFB_HAL_CBM_CloseMuteBk        (HI_U32 u32Data);
HI_VOID DRV_HIFB_HAL_CBM_SetMixerBkg        (OPTM_VDP_CBM_MIX_E u32mixer_id, OPTM_VDP_BKG_S *pstBkg);
HI_VOID DRV_HIFB_HAL_CBM_SetMixerPrio       (OPTM_VDP_CBM_MIX_E u32mixer_id, HI_U32 u32layer_id, HI_U32 u32prio);

//-------------------------------------------------------------------
//WBC_DHD0_BEGIN
//-------------------------------------------------------------------
HI_VOID DRV_HIFB_HAL_WBC_GP_SetEnable       (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 bEnable);
HI_VOID DRV_HIFB_HAL_WBC_GP_GetWorkEnable   (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 *pEnable, HI_U32 *pWbcState);
HI_VOID DRV_HIFB_HAL_WBC_SetOutMod          (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 u32OutMode);
HI_VOID DRV_HIFB_HAL_WBC_SetOutFmt          (OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_WBC_OFMT_E stIntfFmt);
HI_VOID DRV_HIFB_HAL_WBC_SetLayerAddr       (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 u32Addr, HI_U32 u32Stride);
HI_VOID DRV_HIFB_HAL_WBC_GetLayerAddr       (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32* pAddr, HI_U32* pStride);
HI_VOID DRV_HIFB_HAL_WBC_SetLayerReso       (OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect);
HI_VOID DRV_HIFB_HAL_WBC_SetDitherMode      (OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DITHER_E enDitherMode);
HI_VOID DRV_HIFB_HAL_WBC_SetCropReso        (OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect);
HI_VOID DRV_HIFB_HAL_WBC_SetRegUp           (OPTM_VDP_LAYER_WBC_E enLayer);
HI_VOID DRV_HIFB_HAL_WBC_SetThreeMd         (OPTM_VDP_LAYER_WBC_E enLayer, HI_U32 bMode);
HI_VOID DRV_HIFB_HAL_WBC_LBoxEnable         (OPTM_VDP_LAYER_WBC_E enLayer, HI_BOOL Enable);
HI_VOID DRV_HIFB_HAL_WBC_SetLBoxReso        (OPTM_VDP_LAYER_WBC_E enLayer, OPTM_VDP_DISP_RECT_S *pstRect);

HI_U32 DRV_HIFB_HAL_DISP_GetIntSignal               (HI_U32 u32intmask);
HI_VOID DRV_HIFB_HAL_DISP_ClearIntSignal            (HI_U32 u32intmask);
OPTM_VDP_DISP_MODE_E DRV_HIFB_HAL_DISP_GetDispMode  (HI_U32 u32Data);


#ifdef __cplusplus

#if __cplusplus

}
#endif
#endif /* __cplusplus */

#endif
