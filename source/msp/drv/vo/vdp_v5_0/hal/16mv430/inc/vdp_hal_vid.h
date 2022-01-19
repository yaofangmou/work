#ifndef __VDP_HAL_VID_H__
#define __VDP_HAL_VID_H__

#include "vdp_ip_define.h"

HI_VOID VDP_VID_SetLayerBkg(HI_U32 u32Data, VDP_BKG_S stBkg);
HI_VOID VDP_VID_SetRegUp(HI_U32 u32Data);
HI_VOID  VDP_VID_SetZmeOutReso(HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetZmeHorRatio(HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID VDP_VID_SetZmeVerRatio(HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID  VDP_VID_SetFCropReso(HI_U32 u32Data, VDP_RECT_S stRect);
HI_VOID VDP_VID_SetVideoPos(HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetDispPos(HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetLayerGalpha(HI_U32 u32Data, HI_U32 u32Alpha0);
HI_VOID  VDP_VID_SetFCropEn(HI_U32 u32Data, HI_U32 u32CropEn);
HI_VOID VDP_VID_SetLayerEnable(HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID  VDP_VID_GetLayerEnable(HI_U32 u32Data, HI_U32 *pu32bEnable);
HI_VOID  VDP_VID_SetLayerMute(HI_U32 u32Data, HI_BOOL bEnable);
HI_VOID VDP_VID_SetIfirMode(HI_U32 u32Data, VDP_IFIRMODE_E enMode);
HI_VOID VDP_VID_SetIfirCoef(HI_U32 u32Data, HI_S32 * s32Coef);
HI_VOID VDP_VID_SetIfirCkGtEn(HI_U32 u32Data, HI_U32 u32En);
HI_VOID VDP_SetParaUpMode(HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID VDP_VID_SetZmeEnable(HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeShootCtrlEnable(HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable,HI_U32 u32bMode);
HI_VOID VDP_VID_SetZmeShootCtrlPara(HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32Flatdect_mode,HI_U32 u32Coringadj_en,HI_U32 u32Gain,HI_U32 u32Coring);
HI_VOID VDP_VID_SetZmePhase(HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_S32 s32Phase);
HI_VOID VDP_VID_SetZmeFirEnable(HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeMidEnable(HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);

#endif
