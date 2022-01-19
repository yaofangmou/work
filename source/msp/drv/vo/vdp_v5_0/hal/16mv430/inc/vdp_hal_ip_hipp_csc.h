#ifndef __VDP_HAL_IP_HIPP_CSC_H__
#define __VDP_HAL_IP_HIPP_CSC_H__

#include "vdp_hal_comm.h"

HI_VOID VDP_HIPP_CSC_SetHippCscCkGtEn(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_ck_gt_en);
HI_VOID VDP_HIPP_CSC_SetHippCscEn(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_en);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef00(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef00);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef01(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef01);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef02(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef02);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef10(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef10);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef11(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef11);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef12(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef12);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef20(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef20);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef21(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef21);
HI_VOID VDP_HIPP_CSC_SetHippCscCoef22(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef22);
HI_VOID VDP_HIPP_CSC_SetHippCscScale(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_scale);
HI_VOID VDP_HIPP_CSC_SetHippCscIdc0(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc0);
HI_VOID VDP_HIPP_CSC_SetHippCscIdc1(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc1);
HI_VOID VDP_HIPP_CSC_SetHippCscIdc2(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc2);
HI_VOID VDP_HIPP_CSC_SetHippCscOdc0(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc0);
HI_VOID VDP_HIPP_CSC_SetHippCscOdc1(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc1);
HI_VOID VDP_HIPP_CSC_SetHippCscOdc2(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc2);
HI_VOID VDP_HIPP_CSC_SetHippCscMinY(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_min_y);
HI_VOID VDP_HIPP_CSC_SetHippCscMinC(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_min_c);
HI_VOID VDP_HIPP_CSC_SetHippCscMaxY(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_max_y);
HI_VOID VDP_HIPP_CSC_SetHippCscMaxC(volatile S_VDP_REGS_TYPE *pstReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_max_c);

#endif
