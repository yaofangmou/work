#ifndef __VDP_HAL_VID_H__
#define __VDP_HAL_VID_H__

#include "vdp_define.h"
#include "vdp_ip_define.h"


HI_VOID  VDP_VID_SetZmeOutReso(HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID  VDP_VID_SetZme2OutReso(HI_U32 u32Data, VDP_RECT_S  stRect);

HI_VOID VDP_VID_SetMultiModeEnable     (HI_U32 u32Data, HI_U32 u32Enable );
HI_VOID VDP_VID_SetMuteEnable          (HI_U32 u32Data, HI_U32 bEnable);
HI_VOID VDP_VID_SetFlipEnable          (HI_U32 u32Data, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetDrawMode            (HI_U32 u32Data, HI_U32 u32ModeLuma, HI_U32 u32ModeChroma);
HI_VOID VDP_VID_SetReadMode            (HI_U32 u32Data, VDP_DATA_RMODE_E enLRMode,VDP_DATA_RMODE_E enCRMode);
HI_VOID VDP_VID_SetPreReadEnable       (HI_U32 u32Data, HI_U32 u32Enable );
HI_VOID VDP_VID_SetReqLength           (HI_U32 u32Data, HI_U32 ReqLenght );
HI_VOID VDP_VID_SetReqCtrl             (HI_U32 u32Data, HI_U32 u32ReqCtrl);
HI_VOID VDP_VID_SetTestPatternEnable   (HI_U32 u32Data, HI_U32 u32Enable );
HI_VOID VDP_VID_SetUvorder             (HI_U32 u32Data, HI_U32 u32bUvorder);
HI_VOID VDP_VID_SetDrawPixelMode       (HI_U32 u32Data, HI_U32 u32DrawPixelMode);
HI_VOID VDP_VID_SetMuteBkg             (HI_U32 u32Data, VDP_BKG_S stMuteBkg);
HI_VOID VDP_VID_SetTileDcmpEnable      (HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID VDP_VID_SetDataWidth           (HI_U32 u32Data, HI_U32 DataWidth);
HI_VOID VDP_VID_SetInDataFmt           (HI_U32 u32Data, VDP_VID_IFMT_E  enDataFmt);
HI_VOID VDP_VID_SetSrcCropReso         (HI_U32 u32Data, VDP_RECT_S stRect);
HI_VOID VDP_VID_SetCropReso            (HI_U32 u32Data, VDP_RECT_S stRect);
HI_VOID VDP_VID_SetInReso              (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetLayerAddr           (HI_U32 u32Data, HI_U32 u32Chan, HI_U32 u32LAddr,HI_U32 u32CAddr,HI_U32 u32LStr, HI_U32 u32CStr);
HI_VOID VDP_VID_SetHeadAddr            (HI_U32 u32Data, HI_U32 u32LHeadAddr,HI_U32 u32CHeadAddr);
HI_VOID VDP_VID_SetTileStride          (HI_U32 u32Data, HI_U32 u32LStr, HI_U32 u32CStr);
HI_VOID VDP_VID_SetHeadStride          (HI_U32 u32Data, HI_U32 u32HeadStride);
HI_VOID VDP_VID_SetTestPatternMode     (HI_U32 u32Data, HI_U32 u32Mode );
HI_VOID VDP_VID_SetTestPatternLWidth   (HI_U32 u32Data, HI_U32 u32Width );
HI_VOID VDP_VID_SetTestPatternSpeed    (HI_U32 u32Data, HI_U32 u32Speed );
HI_VOID VDP_VID_SetTestPatternSeed     (HI_U32 u32Data, HI_U32 u32Seed );
HI_VOID VDP_VID_SetRegionEnable        (HI_U32 u32Data, HI_U32 u32Num, HI_U32 u32bEnable );
HI_VOID VDP_VID_SetAllRegionDisable    (HI_U32 u32Data );
HI_VOID VDP_VID_SetRegionAddr          (HI_U32 u32Data, HI_U32 u32Num, HI_U32 u32LAddr,HI_U32 u32CAddr,HI_U32 u32LStr, HI_U32 u32CStr);
HI_VOID VDP_VID_SetRegionReso          (HI_U32 u32Data, HI_U32 u32Num, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetRegionMuteEnable    (HI_U32 u32Data, HI_U32 u32Num, HI_U32 bEnable);
HI_VOID VDP_VID_SetRegionCoefAddr      (HI_U32 u32Addr);
HI_VOID VDP_VID_SetShpCoefAddr         (HI_U32 u32Addr);
HI_VOID VDP_VID_SetRegionParaUp        (HI_U32 u32ParaUp);
HI_VOID VDP_VID_SetShpParaUp           (HI_U32 u32ParaUp);

//MV300 LAYER
//hpzme
HI_VOID VDP_VID_SetHpzmeEn(HI_U32 u32Data, HI_U32 hpzme_en);
HI_VOID VDP_VID_SetHpzmeMode(HI_U32 u32Data, HI_U32 hpzme_mode);
HI_VOID VDP_VID_SetHpzmeCoef2(HI_U32 u32Data, HI_U32 coef2);
HI_VOID VDP_VID_SetHpzmeCoef1(HI_U32 u32Data, HI_U32 coef1);
HI_VOID VDP_VID_SetHpzmeCoef0(HI_U32 u32Data, HI_U32 coef0);
HI_VOID VDP_VID_SetHpzmeCkGtEn(HI_U32 u32Data, HI_U32 u32CkGtEn);
//zme1
HI_VOID VDP_VID_SetZme1CkGtEn(HI_U32 u32Data, HI_U32 u32CkGtEn);
HI_VOID VDP_VID_SetZmeEnable           (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetVtapReduce          (HI_U32 u32Data, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeShootCtrlEnable  (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable,HI_U32 u32bMode);
HI_VOID VDP_VID_SetZmeShootCtrlPara    (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32Flatdect_mode,HI_U32 u32Coringadj_en,HI_U32 u32Gain,HI_U32 u32Coring);
HI_VOID VDP_VID_SetZmePhase            (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_S32 s32Phase);
HI_VOID VDP_VID_SetZmeFirEnable        (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeMidEnable        (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeHorRatio         (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID VDP_VID_SetZmeVerRatio         (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID VDP_VID_SetZmeHfirOrder        (HI_U32 u32Data, HI_U32 u32HfirOrder);
HI_VOID VDP_VID_SetZmeCoefAddr         (HI_U32 u32Data, HI_U32 u32Mode, HI_U32 u32Addr);
HI_VOID VDP_VID_SetZmeInFmt            (HI_U32 u32Data, VDP_PROC_FMT_E u32Fmt);
HI_VOID VDP_VID_SetZmeOutFmt           (HI_U32 u32Data, VDP_PROC_FMT_E u32Fmt);
HI_VOID VDP_VID_SetHdrElZme           (HI_U32 u32Data, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZmeNonLnrDelta     (HI_U32 u32Data, HI_S32 s32Zone0Delta, HI_S32 s32Zone2Delta);
HI_VOID VDP_VID_SetZmeNonLnrZoneEnd   (HI_U32 u32Data, HI_U32 u32Zone0End, HI_U32 u32Zone1End);
HI_VOID VDP_VID_SetVfirOneTapEnable    (HI_U32 u32Data, HI_U32 u32VfirOneTapEn);
HI_VOID VDP_VID_SetOutReso             (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetZme1OutProSel       (HI_U32 u32Data, HI_U32 u32OutProSel);
HI_VOID VDP_VID_SetAddBufSwEn          (HI_U32 u32Data, HI_U32 add_buf_sw_en  );
HI_VOID VDP_VID_SetAddBufSwSel         (HI_U32 u32Data, HI_U32 add_buf_sw_sel );
HI_VOID VDP_VID_SetZme1ReduceTap       (HI_U32 u32Data, HI_U32 zme1_reduce_tap);
HI_VOID VDP_VID_SetZme2ReduceTap       (HI_U32 u32Data, HI_U32 zme2_reduce_tap);

//-------------------------------------------------------------------
//ZME_BEGIN
//-------------------------------------------------------------------
#if VID_ZME2_EN
HI_VOID VDP_VID_SetZme2CkGtEn(HI_U32 u32Data, HI_U32 u32CkGtEn);
HI_VOID VDP_VID_SetZme2Enable           (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZme2VtapReduce          (HI_U32 u32Data, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZme2ShootCtrlEnable  (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable,HI_U32 u32bMode);
HI_VOID VDP_VID_SetZme2ShootCtrlPara    (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32Flatdect_mode,HI_U32 u32Coringadj_en,HI_U32 u32Gain,HI_U32 u32Coring);
HI_VOID VDP_VID_SetZme2Phase            (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_S32 s32Phase);
HI_VOID VDP_VID_SetZme2FirEnable        (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZme2MidEnable        (HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable);
HI_VOID VDP_VID_SetZme2HorRatio         (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID VDP_VID_SetZme2VerRatio         (HI_U32 u32Data, HI_U32 u32Ratio);
HI_VOID VDP_VID_SetZme2HfirOrder        (HI_U32 u32Data, HI_U32 u32HfirOrder);
HI_VOID VDP_VID_SetZme2CoefAddr         (HI_U32 u32Data, HI_U32 u32Mode, HI_U32 u32Addr);
HI_VOID VDP_VID_SetZme2InFmt            (HI_U32 u32Data, VDP_PROC_FMT_E u32Fmt);
HI_VOID VDP_VID_SetZme2OutFmt           (HI_U32 u32Data, VDP_PROC_FMT_E u32Fmt);
HI_VOID VDP_VID_SetZme2NonLnrDelta     (HI_U32 u32Data, HI_S32 s32Zone0Delta, HI_S32 s32Zone2Delta);
HI_VOID VDP_VID_SetZme2NonLnrZoneEnd   (HI_U32 u32Data, HI_U32 u32Zone0End, HI_U32 u32Zone1End);
HI_VOID VDP_VID_SetZme2HCoef           (HI_U32 u32Data,  VDP_VID_ZME2_HCOEF_S stZme2HCoef);
HI_VOID VDP_VID_SetZme2VCoef           (HI_U32 u32Data,  VDP_VID_ZME2_VCOEF_S stZme2VCoef);
HI_VOID VDP_VID_SetSrOutReso           (HI_U32 u32Data, VDP_RECT_S  stRect);
//-------------------------------------------------------------------
//ZME2_BEGIN
//-------------------------------------------------------------------
#endif
//ifir
HI_VOID VDP_VID_SetIfirMode            (HI_U32 u32Data, VDP_IFIRMODE_E enMode);
HI_VOID VDP_VID_SetIfirCoef            (HI_U32 u32Data, HI_S32 * s32Coef);
HI_VOID VDP_VID_SetIfirMidEn           (HI_U32 u32Data, HI_U32 u32En);
HI_VOID VDP_VID_SetIfirCkGtEn          (HI_U32 u32Data, HI_U32 u32En);
HI_VOID VDP_VID_SetIfirEn              (HI_U32 u32Data, HI_U32 u32En);
//lbox
HI_VOID VDP_VID_SetVideoPos            (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetDispPos             (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VID_SetLayerBkg            (HI_U32 u32Data, VDP_BKG_S stBkg);
//system
HI_VOID VDP_VID_SetParaUpd             (HI_U32 u32Data, VDP_VID_PARA_E enMode);
HI_VOID VDP_VID_SetLayerGalpha         (HI_U32 u32Data, HI_U32 u32Alpha0);
HI_VOID VDP_SetParaUpMode              (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID VDP_SetParaUpField              (HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID VDP_VID_SetRegUp               (HI_U32 u32Data);
HI_VOID VDP_VID_SetNoSecFlag           (HI_U32 u32Data, HI_U32 u32Enable );
HI_VOID VDP_VID_SetLayerEnable         (HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID VDP_VID_SetV0LinkCtrl          (HI_U32 u32Data, HI_U32 u32LinkCtrl);
//dof
HI_VOID VDP_VP_SetThreeDimDofEnable    (HI_U32 u32Data, HI_U32 bEnable);
HI_VOID VDP_VP_SetThreeDimDofStep      (HI_U32 u32Data, HI_S32 s32LStep, HI_S32 s32RStep);
HI_VOID VDP_VP_SetThreeDimDofBkg       (HI_U32 u32Data, VDP_BKG_S stBkg);
//lbox
HI_VOID VDP_VP_SetVideoPos             (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VP_SetDispPos              (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VP_SetLayerBkg             (HI_U32 u32Data, VDP_BKG_S stBkg);
//system
HI_VOID VDP_VP_SetInReso               (HI_U32 u32Data, VDP_RECT_S  stRect);
HI_VOID VDP_VP_SetRegUp                (HI_U32 u32Data);
HI_VOID VDP_VP_SetLayerGalpha          (HI_U32 u32Data, HI_U32 u32Alpha);
HI_VOID VDP_VP0_SetParaUpd             (HI_U32 u32Data, VDP_VP_PARA_E enMode);
HI_VOID VDP_VP_SetLayerEnable          (HI_U32 u32Data, HI_U32 u32bEnable );//new add
HI_VOID VDP_VP_SetUpdMode              (HI_U32 u32Data, HI_U32 u32UpdMode );//new add
HI_VOID VDP_VP_SetUpdField              (HI_U32 u32Data, HI_U32 u32UpdMode );//new add

//-------------------------------------------------------------------
//VID_BEGIN
//-------------------------------------------------------------------
HI_VOID VDP_VID_SetMasterSel           (HI_U32 u32Data, HI_U32 u32MasterNum);
HI_BOOL VDP_VID_CheckRegionState(HI_U32 u32Data);
HI_BOOL VDP_VID_CheckLastRegionState(HI_U32 u32Data);
HI_VOID VDP_VID_SetHeadSize            (HI_U32 u32Data, HI_U32 u32HeadSize);
HI_VOID VDP_VID_SetDcmpCtrl           (HI_U32 u32Data, HI_U32 u32LumLosslessEn, HI_U32 u32ChmLosslessEn );
HI_VOID VDP_VID_SetDcmpErrorClr        (HI_U32 u32Data,HI_U32 u32dcmp_lerror_clr,HI_U32  u32dcmp_cerror_clr);
HI_VOID VDP_VID_SetDcmpHeadErrClr      (HI_U32 u32Data,HI_U32 u32dcmp_lerror_clr,HI_U32  u32dcmp_cerror_clr);
HI_VOID VDP_VID_SetDcmpConsumeErrClr   (HI_U32 u32Data,HI_U32 u32dcmp_lerror_clr,HI_U32  u32dcmp_cerror_clr);
HI_VOID VDP_VID_SetDcmpForgiveErrClr   (HI_U32 u32Data,HI_U32 u32dcmp_lerror_clr,HI_U32  u32dcmp_cerror_clr);
HI_VOID VDP_VID_SetReqMacCtrl          (HI_U32 u32Data, HI_U32 u32ReqMacCtrl);
HI_VOID VDP_VID_SetDcmpOffset          (HI_U32 u32Data, HI_U32 u32laddr_offset , HI_U32  u32caddr_offset );

HI_VOID VDP_VID_SetDispMode            (HI_U32 u32Data, VDP_DISP_MODE_E enDispMode);
HI_VOID VDP_VP_SetLayerReso            (HI_U32 u32Data, VDP_DISP_RECT_S  stRect);
HI_VOID VDP_VID_SetFiLayerEnable       (HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID VDP_VID_SetLayerReso           (HI_U32 u32Data, VDP_DISP_RECT_S  stRect);
//DCMP
HI_VOID VDP_VID_SetDcmpEnable          (HI_U32 u32Data, HI_U32 u32bEnable );
HI_VOID VDP_VID_SetCscDcCoef           (HI_U32 u32Data, VDP_CSC_DC_COEF_S pstCscCoef);
HI_VOID VDP_VID_SetCscCoef             (HI_U32 u32Data, VDP_CSC_COEF_S stCscCoef);
HI_VOID VDP_VID_SetCscEnable           (HI_U32 u32Data, HI_U32 u32bCscEn);
HI_VOID VDP_VID_SetCscMode             (HI_U32 u32Data, VDP_CSC_MODE_E enCscMode);

//-------------------------------------------------------------------
//VID_END
//-------------------------------------------------------------------

//-------------------------------------------------------------------
//VP_BEGIN
//-------------------------------------------------------------------
HI_VOID VDP_VP_SetMuteEnable           (HI_U32 u32Data, HI_U32 bEnable);
HI_VOID VDP_VP_SetMuteBkg              (HI_U32 u32Data, VDP_VP_MUTE_BK_S stVpMuteBkg);
HI_VOID VDP_VP_SetDispMode             (HI_U32 u32Data, VDP_DISP_MODE_E enDispMode);

HI_VOID VDP_VP_SetCscDcCoef            (HI_U32 u32Data, VDP_CSC_DC_COEF_S pstCscCoef);
HI_VOID VDP_VP_SetCscCoef              (HI_U32 u32Data, VDP_CSC_COEF_S stCscCoef);
HI_VOID VDP_VP_SetCscEnable            (HI_U32 u32Data, HI_U32 u32bCscEn);
HI_VOID VDP_VP_SetCscMode              (HI_U32 u32Data, VDP_CSC_MODE_E enCscMode);
//-------------------------------------------------------------------
//VP_END
//-------------------------------------------------------------------

HI_VOID VDP_VID_SetFrReqSize           (HI_U32 u32Data);
HI_VOID VDP_VID_SetDsReqSize           (HI_U32 u32Data);
#endif
