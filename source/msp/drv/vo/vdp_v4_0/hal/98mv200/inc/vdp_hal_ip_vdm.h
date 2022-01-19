#ifndef __VDP_HAL_IP_VDM_H__
#define __VDP_HAL_IP_VDM_H__

#include "hi_register_vdp.h"
#include "vdp_define.h"


HI_VOID VDP_VID_SetVdmVdmTmapInBdp(HI_U32 u32Data, HI_U32 vdm_tmap_in_bdp);
HI_VOID VDP_VID_SetVdmVdmCscBind(HI_U32 u32Data, HI_U32 vdm_csc_bind);
HI_VOID VDP_VID_SetVdmVdmGmmEn(HI_U32 u32Data, HI_U32 vdm_gmm_en);
HI_VOID VDP_VID_SetVdmVdmTmapEn(HI_U32 u32Data, HI_U32 vdm_tmap_en);
HI_VOID VDP_VID_SetVdmVdmDegmmEn(HI_U32 u32Data, HI_U32 vdm_degmm_en);
HI_VOID VDP_VID_SetVdmVdmEn(HI_U32 u32Data, HI_U32 vdm_en);
HI_VOID VDP_VID_SetVdmVdmLumaCoef0Tmap(HI_U32 u32Data, HI_U32 vdm_luma_coef0_tmap);
HI_VOID VDP_VID_SetVdmVdmLumaCoef1Tmap(HI_U32 u32Data, HI_U32 vdm_luma_coef1_tmap);
HI_VOID VDP_VID_SetVdmVdmLumaCoef2Tmap(HI_U32 u32Data, HI_U32 vdm_luma_coef2_tmap);
HI_VOID VDP_VID_SetVdmVdmTmapLumaScale(HI_U32 u32Data, HI_U32 vdm_tmap_luma_scale);
HI_VOID VDP_VID_SetVdmVdmTmapCoefScale(HI_U32 u32Data, HI_U32 vdm_tmap_coef_scale);
HI_VOID VDP_VID_SetVdmVdmTmapOutClipMin(HI_U32 u32Data, HI_U32 vdm_tmap_out_clip_min);
HI_VOID VDP_VID_SetVdmVdmTmapOutClipMax(HI_U32 u32Data, HI_U32 vdm_tmap_out_clip_max);
HI_VOID VDP_VID_SetVdmVdmParaDegmmAddr(HI_U32 u32Data, HI_U32 vdm_para_degmm_addr);
HI_VOID VDP_VID_SetVdmVdmParaGmmAddr(HI_U32 u32Data, HI_U32 vdm_para_gmm_addr);
HI_VOID VDP_VID_SetVdmVdmParaTmapAddr(HI_U32 u32Data, HI_U32 vdm_para_tmap_addr);
HI_VOID VDP_VID_SetVdmVdmParaTmapUpd(HI_U32 u32Data, HI_U32 vdm_para_tmap_upd);
HI_VOID VDP_VID_SetVdmVdmParaGmmUpd(HI_U32 u32Data, HI_U32 vdm_para_gmm_upd);
HI_VOID VDP_VID_SetVdmVdmParaDegmmUpd(HI_U32 u32Data, HI_U32 vdm_para_degmm_upd);
HI_VOID VDP_VID_SetVdmTmapOutDc0(HI_U32 vdm_tmap_out_dc0);
HI_VOID VDP_VID_SetVdmTmapOutDc1(HI_U32 vdm_tmap_out_dc1);
HI_VOID VDP_VID_SetVdmTmapOutDc2(HI_U32 vdm_tmap_out_dc2);
HI_VOID VDP_VID_SetVdmVdmDegammaRdEn(HI_U32 u32Data, HI_U32 vdm_degamma_rd_en);
HI_VOID VDP_VID_SetVdmVdmDegammaParaData(HI_U32 u32Data, HI_U32 vdm_degamma_para_data);
HI_VOID VDP_VID_SetVdmVDegmmX4Step(HI_U32 u32Data, HI_U32 v_degmm_x4_step);
HI_VOID VDP_VID_SetVdmVDegmmX3Step(HI_U32 u32Data, HI_U32 v_degmm_x3_step);
HI_VOID VDP_VID_SetVdmVDegmmX2Step(HI_U32 u32Data, HI_U32 v_degmm_x2_step);
HI_VOID VDP_VID_SetVdmVDegmmX1Step(HI_U32 u32Data, HI_U32 v_degmm_x1_step);
HI_VOID VDP_VID_SetVdmVDegmmX2Pos(HI_U32 u32Data, HI_U32 v_degmm_x2_pos);
HI_VOID VDP_VID_SetVdmVDegmmX1Pos(HI_U32 u32Data, HI_U32 v_degmm_x1_pos);
HI_VOID VDP_VID_SetVdmVDegmmX4Pos(HI_U32 u32Data, HI_U32 v_degmm_x4_pos);
HI_VOID VDP_VID_SetVdmVDegmmX3Pos(HI_U32 u32Data, HI_U32 v_degmm_x3_pos);
HI_VOID VDP_VID_SetVdmVDegmmX4Num(HI_U32 u32Data, HI_U32 v_degmm_x4_num);
HI_VOID VDP_VID_SetVdmVDegmmX3Num(HI_U32 u32Data, HI_U32 v_degmm_x3_num);
HI_VOID VDP_VID_SetVdmVDegmmX2Num(HI_U32 u32Data, HI_U32 v_degmm_x2_num);
HI_VOID VDP_VID_SetVdmVDegmmX1Num(HI_U32 u32Data, HI_U32 v_degmm_x1_num);
HI_VOID VDP_VID_SetVdmVdmTmapRdEn(HI_U32 u32Data, HI_U32 vdm_tmap_rd_en);
HI_VOID VDP_VID_SetVdmVdmTmapParaData(HI_U32 u32Data, HI_U32 vdm_tmap_para_data);
HI_VOID VDP_VID_SetVTmapX5Step(HI_U32 v_tmap_x5_step);
HI_VOID VDP_VID_SetVTmapX6Step(HI_U32 v_tmap_x6_step);
HI_VOID VDP_VID_SetVTmapX7Step(HI_U32 v_tmap_x7_step);
HI_VOID VDP_VID_SetVTmapX8Step(HI_U32 v_tmap_x8_step);
HI_VOID VDP_VID_SetVdmVTmapX4Step(HI_U32 u32Data, HI_U32 v_tmap_x4_step);
HI_VOID VDP_VID_SetVdmVTmapX3Step(HI_U32 u32Data, HI_U32 v_tmap_x3_step);
HI_VOID VDP_VID_SetVdmVTmapX2Step(HI_U32 u32Data, HI_U32 v_tmap_x2_step);
HI_VOID VDP_VID_SetVdmVTmapX1Step(HI_U32 u32Data, HI_U32 v_tmap_x1_step);
HI_VOID VDP_VID_SetVdmVTmapX1Pos(HI_U32 u32Data, HI_U32 v_tmap_x1_pos);
HI_VOID VDP_VID_SetVdmVTmapX2Pos(HI_U32 u32Data, HI_U32 v_tmap_x2_pos);
HI_VOID VDP_VID_SetVTmapX5Num(HI_U32 v_tmap_x5_num);
HI_VOID VDP_VID_SetVTmapX6Num(HI_U32 v_tmap_x6_num);
HI_VOID VDP_VID_SetVTmapX7Num(HI_U32 v_tmap_x7_num);
HI_VOID VDP_VID_SetVTmapX8Num(HI_U32 v_tmap_x8_num);
HI_VOID VDP_VID_SetVdmVTmapX4Num(HI_U32 u32Data, HI_U32 v_tmap_x4_num);
HI_VOID VDP_VID_SetVdmVTmapX3Num(HI_U32 u32Data, HI_U32 v_tmap_x3_num);
HI_VOID VDP_VID_SetVdmVTmapX2Num(HI_U32 u32Data, HI_U32 v_tmap_x2_num);
HI_VOID VDP_VID_SetVdmVTmapX1Num(HI_U32 u32Data, HI_U32 v_tmap_x1_num);
HI_VOID VDP_VID_SetVdmVTmapX3Pos(HI_U32 u32Data, HI_U32 v_tmap_x3_pos);
HI_VOID VDP_VID_SetVdmVTmapX4Pos(HI_U32 u32Data, HI_U32 v_tmap_x4_pos);
HI_VOID VDP_VID_SetVTmapX5Pos(HI_U32 v_tmap_x5_pos);
HI_VOID VDP_VID_SetVTmapX6Pos(HI_U32 v_tmap_x6_pos);
HI_VOID VDP_VID_SetVTmapX7Pos(HI_U32 v_tmap_x7_pos);
HI_VOID VDP_VID_SetVTmapX8Pos(HI_U32 v_tmap_x8_pos);
HI_VOID VDP_VID_SetVdmVdmGammaRdEn(HI_U32 u32Data, HI_U32 vdm_gamma_rd_en);
HI_VOID VDP_VID_SetVdmVdmGammaParaData(HI_U32 u32Data, HI_U32 vdm_gamma_para_data);
HI_VOID VDP_VID_SetVdmVGmmX4Step(HI_U32 u32Data, HI_U32 v_gmm_x4_step);
HI_VOID VDP_VID_SetVdmVGmmX3Step(HI_U32 u32Data, HI_U32 v_gmm_x3_step);
HI_VOID VDP_VID_SetVdmVGmmX2Step(HI_U32 u32Data, HI_U32 v_gmm_x2_step);
HI_VOID VDP_VID_SetVdmVGmmX1Step(HI_U32 u32Data, HI_U32 v_gmm_x1_step);
HI_VOID VDP_VID_SetVdmVGmmX2Pos(HI_U32 u32Data, HI_U32 v_gmm_x2_pos);
HI_VOID VDP_VID_SetVdmVGmmX1Pos(HI_U32 u32Data, HI_U32 v_gmm_x1_pos);
HI_VOID VDP_VID_SetVdmVGmmX4Pos(HI_U32 u32Data, HI_U32 v_gmm_x4_pos);
HI_VOID VDP_VID_SetVdmVGmmX3Pos(HI_U32 u32Data, HI_U32 v_gmm_x3_pos);
HI_VOID VDP_VID_SetVdmVGmmX4Num(HI_U32 u32Data, HI_U32 v_gmm_x4_num);
HI_VOID VDP_VID_SetVdmVGmmX3Num(HI_U32 u32Data, HI_U32 v_gmm_x3_num);
HI_VOID VDP_VID_SetVdmVGmmX2Num(HI_U32 u32Data, HI_U32 v_gmm_x2_num);
HI_VOID VDP_VID_SetVdmVGmmX1Num(HI_U32 u32Data, HI_U32 v_gmm_x1_num);
HI_VOID VDP_VID_SetVdmVGmmX6Pos(HI_U32 u32Data, HI_U32 v_gmm_x6_pos);
HI_VOID VDP_VID_SetVdmVGmmX5Pos(HI_U32 u32Data, HI_U32 v_gmm_x5_pos);
HI_VOID VDP_VID_SetVdmVGmmX8Pos(HI_U32 u32Data, HI_U32 v_gmm_x8_pos);
HI_VOID VDP_VID_SetVdmVGmmX7Pos(HI_U32 u32Data, HI_U32 v_gmm_x7_pos);
HI_VOID VDP_VID_SetVdmVGmmX8Step(HI_U32 u32Data, HI_U32 v_gmm_x8_step);
HI_VOID VDP_VID_SetVdmVGmmX7Step(HI_U32 u32Data, HI_U32 v_gmm_x7_step);
HI_VOID VDP_VID_SetVdmVGmmX6Step(HI_U32 u32Data, HI_U32 v_gmm_x6_step);
HI_VOID VDP_VID_SetVdmVGmmX5Step(HI_U32 u32Data, HI_U32 v_gmm_x5_step);
HI_VOID VDP_VID_SetVdmVGmmX8Num(HI_U32 u32Data, HI_U32 v_gmm_x8_num);
HI_VOID VDP_VID_SetVdmVGmmX7Num(HI_U32 u32Data, HI_U32 v_gmm_x7_num);
HI_VOID VDP_VID_SetVdmVGmmX6Num(HI_U32 u32Data, HI_U32 v_gmm_x6_num);
HI_VOID VDP_VID_SetVdmVGmmX5Num(HI_U32 u32Data, HI_U32 v_gmm_x5_num);
HI_VOID VDP_VID_SetVdmVdmCscEn(HI_U32 u32Data, HI_U32 vdm_csc_en);
HI_VOID VDP_VID_SetVdmVdmCoef00Csc(HI_U32 u32Data, HI_U32 vdm_coef00_csc);
HI_VOID VDP_VID_SetVdmVdmCoef01Csc(HI_U32 u32Data, HI_U32 vdm_coef01_csc);
HI_VOID VDP_VID_SetVdmVdmCoef02Csc(HI_U32 u32Data, HI_U32 vdm_coef02_csc);
HI_VOID VDP_VID_SetVdmVdmCoef10Csc(HI_U32 u32Data, HI_U32 vdm_coef10_csc);
HI_VOID VDP_VID_SetVdmVdmCoef11Csc(HI_U32 u32Data, HI_U32 vdm_coef11_csc);
HI_VOID VDP_VID_SetVdmVdmCoef12Csc(HI_U32 u32Data, HI_U32 vdm_coef12_csc);
HI_VOID VDP_VID_SetVdmVdmCoef20Csc(HI_U32 u32Data, HI_U32 vdm_coef20_csc);
HI_VOID VDP_VID_SetVdmVdmCoef21Csc(HI_U32 u32Data, HI_U32 vdm_coef21_csc);
HI_VOID VDP_VID_SetVdmVdmCoef22Csc(HI_U32 u32Data, HI_U32 vdm_coef22_csc);
HI_VOID VDP_VID_SetVdmVdmCscScale(HI_U32 u32Data, HI_U32 vdm_csc_scale);
HI_VOID VDP_VID_SetVdmVdmCscClipMin(HI_U32 u32Data, HI_U32 vdm_csc_clip_min);
HI_VOID VDP_VID_SetVdmVdmCscClipMax(HI_U32 u32Data, HI_U32 vdm_csc_clip_max);
HI_VOID VDP_VID_SetVdmVdmV1GammaEn(HI_U32 u32Data, HI_U32 vdm_v1_gamma_en);
HI_VOID VDP_VID_SetVdmVdmV0GammaEn(HI_U32 u32Data, HI_U32 vdm_v0_gamma_en);
HI_VOID VDP_VID_SetVdmVdmV1CscEn(HI_U32 u32Data, HI_U32 vdm_v1_csc_en);
HI_VOID VDP_VID_SetVdmVdmV0CscEn(HI_U32 u32Data, HI_U32 vdm_v0_csc_en);
HI_VOID VDP_VID_SetVdmVdmYuv2rgbEn(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_en);
HI_VOID VDP_VID_SetVdmVdm00Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_00_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm01Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_01_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm02Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_02_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm03Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_03_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm04Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_04_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm05Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_05_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm06Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_06_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm07Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_07_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm08Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_08_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm10Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_10_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm11Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_11_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm12Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_12_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm13Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_13_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm14Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_14_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm15Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_15_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm16Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_16_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm17Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_17_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdm18Yuv2rgb(HI_U32 u32Data, HI_U32 vdm_18_yuv2rgb);
HI_VOID VDP_VID_SetVdmVdmYuv2rgbscale2p(HI_U32 u32Data, HI_U32 vdm_yuv2rgbscale2p);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb00InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_00_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb01InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_01_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb02InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_02_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb00OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_00_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb01OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_01_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb02OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_02_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb10InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_10_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb11InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_11_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb12InDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_12_in_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb10OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_10_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb11OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_11_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgb12OutDc(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_12_out_dc);
HI_VOID VDP_VID_SetVdmVdmYuv2rgbClipMin(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_clip_min);
HI_VOID VDP_VID_SetVdmVdmYuv2rgbClipMax(HI_U32 u32Data, HI_U32 vdm_yuv2rgb_clip_max);
HI_VOID VDP_VID_SetVdmVdmRgb2yuvEn(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_en);
HI_VOID VDP_VID_SetVdmVdm00Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_00_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm01Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_01_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm02Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_02_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm10Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_10_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm11Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_11_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm12Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_12_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm20Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_20_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm21Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_21_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdm22Rgb2yuv(HI_U32 u32Data, HI_U32 vdm_22_rgb2yuv);
HI_VOID VDP_VID_SetVdmVdmRgb2yuvscale2p(HI_U32 u32Data, HI_U32 vdm_rgb2yuvscale2p);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv0InDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_0_in_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv1InDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_1_in_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv2InDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_2_in_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv0OutDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_0_out_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv1OutDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_1_out_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuv2OutDc(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_2_out_dc);
HI_VOID VDP_VID_SetVdmVdmRgb2yuvClipMin(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_clip_min);
HI_VOID VDP_VID_SetVdmVdmRgb2yuvClipMax(HI_U32 u32Data, HI_U32 vdm_rgb2yuv_clip_max);
HI_VOID VDP_VID_SetVdmVdmDitherRoundUnlim(HI_U32 u32Data, HI_U32 vdm_dither_round_unlim);
HI_VOID VDP_VID_SetVdmVdmDitherEn(HI_U32 u32Data, HI_U32 vdm_dither_en);
HI_VOID VDP_VID_SetVdmVdmDitherMode(HI_U32 u32Data, HI_U32 vdm_dither_mode);
HI_VOID VDP_VID_SetVdmVdmDitherRound(HI_U32 u32Data, HI_U32 vdm_dither_round);
HI_VOID VDP_VID_SetVdmVdmDitherDomainMode(HI_U32 u32Data, HI_U32 vdm_dither_domain_mode);
HI_VOID VDP_VID_SetVdmVdmDitherTapMode(HI_U32 u32Data, HI_U32 vdm_dither_tap_mode);
HI_VOID VDP_VID_SetVdmVdmDitherSedY0(HI_U32 u32Data, HI_U32 vdm_dither_sed_y0);
HI_VOID VDP_VID_SetVdmVdmDitherSedU0(HI_U32 u32Data, HI_U32 vdm_dither_sed_u0);
HI_VOID VDP_VID_SetVdmVdmDitherSedV0(HI_U32 u32Data, HI_U32 vdm_dither_sed_v0);
HI_VOID VDP_VID_SetVdmVdmDitherSedW0(HI_U32 u32Data, HI_U32 vdm_dither_sed_w0);
HI_VOID VDP_VID_SetVdmVdmDitherSedY1(HI_U32 u32Data, HI_U32 vdm_dither_sed_y1);
HI_VOID VDP_VID_SetVdmVdmDitherSedU1(HI_U32 u32Data, HI_U32 vdm_dither_sed_u1);
HI_VOID VDP_VID_SetVdmVdmDitherSedV1(HI_U32 u32Data, HI_U32 vdm_dither_sed_v1);
HI_VOID VDP_VID_SetVdmVdmDitherSedW1(HI_U32 u32Data, HI_U32 vdm_dither_sed_w1);
HI_VOID VDP_VID_SetVdmVdmDitherSedY2(HI_U32 u32Data, HI_U32 vdm_dither_sed_y2);
HI_VOID VDP_VID_SetVdmVdmDitherSedU2(HI_U32 u32Data, HI_U32 vdm_dither_sed_u2);
HI_VOID VDP_VID_SetVdmVdmDitherSedV2(HI_U32 u32Data, HI_U32 vdm_dither_sed_v2);
HI_VOID VDP_VID_SetVdmVdmDitherSedW2(HI_U32 u32Data, HI_U32 vdm_dither_sed_w2);
HI_VOID VDP_VID_SetVdmVdmDitherSedY3(HI_U32 u32Data, HI_U32 vdm_dither_sed_y3);
HI_VOID VDP_VID_SetVdmVdmDitherSedU3(HI_U32 u32Data, HI_U32 vdm_dither_sed_u3);
HI_VOID VDP_VID_SetVdmVdmDitherSedV3(HI_U32 u32Data, HI_U32 vdm_dither_sed_v3);
HI_VOID VDP_VID_SetVdmVdmDitherSedW3(HI_U32 u32Data, HI_U32 vdm_dither_sed_w3);
HI_VOID VDP_VID_SetVdmVdmDitherThrMax(HI_U32 u32Data, HI_U32 vdm_dither_thr_max);
HI_VOID VDP_VID_SetVdmVdmDitherThrMin(HI_U32 u32Data, HI_U32 vdm_dither_thr_min);
HI_VOID VDP_VID_SetVdmCsc0Mode(HI_U32 enLayer, VDP_CSC_MODE_E enCscMode);
HI_VOID VDP_VID_SetVdmCsc1Mode(HI_U32 enLayer, VDP_CSC_MODE_E enCscMode);
HI_VOID VDP_VID_SetRgb2YuvMode(HI_U32 enLayer, VDP_CSC_MODE_E enCscMode);
HI_VOID VDP_VP0_SetCsc0Csc1Mode(HI_U32 u32Data, VDP_CSC_MODE_E enCscMode) ;

#endif


