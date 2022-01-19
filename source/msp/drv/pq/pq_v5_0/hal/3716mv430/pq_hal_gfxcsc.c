/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_gfxcsc.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2015/10/10
  Description   :

******************************************************************************/
#include "pq_hal_comm.h"
#include "pq_hal_gfxcsc.h"

#ifndef HI_BUILD_IN_BOOT
#include <linux/kernel.h>
#include <linux/string.h>
#else
#include "hi_type.h"
#include "uboot.h"
#endif

HI_VOID PQ_HAL_CSC_SetGpCscDemoEn( HI_U32 hipp_csc_demo_en)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_CTRL HIPP_CSC_CTRL;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_CTRL.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_CTRL.u32)) ));
    HIPP_CSC_CTRL.bits.hipp_csc_demo_en = hipp_csc_demo_en;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_CTRL.u32)) ), HIPP_CSC_CTRL.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetGpCscEn( HI_U32 hipp_csc_en)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_CTRL HIPP_CSC_CTRL;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_CTRL.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_CTRL.u32)) ));
    HIPP_CSC_CTRL.bits.hipp_csc_en = hipp_csc_en;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_CTRL.u32)) ), HIPP_CSC_CTRL.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetGpCscScale( HI_U32 hipp_csc_scale)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_SCALE HIPP_CSC_SCALE;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_SCALE.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_SCALE.u32)) ));
    HIPP_CSC_SCALE.bits.hipp_csc_scale = hipp_csc_scale;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_SCALE.u32)) ), HIPP_CSC_SCALE.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetGpCscMinY( HI_U32 hipp_csc_min_y)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_MIN_Y HIPP_CSC_MIN_Y;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MIN_Y.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MIN_Y.u32)) ));
    HIPP_CSC_MIN_Y.bits.hipp_csc_min_y = hipp_csc_min_y;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MIN_Y.u32)) ), HIPP_CSC_MIN_Y.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetGpCscMinC( HI_U32 hipp_csc_min_c)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_MIN_C HIPP_CSC_MIN_C;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MIN_C.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MIN_C.u32)) ));
    HIPP_CSC_MIN_C.bits.hipp_csc_min_c = hipp_csc_min_c;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MIN_C.u32)) ), HIPP_CSC_MIN_C.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetGpCscMaxY( HI_U32 hipp_csc_max_y)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_MAX_Y HIPP_CSC_MAX_Y;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MAX_Y.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MAX_Y.u32)) ));
    HIPP_CSC_MAX_Y.bits.hipp_csc_max_y = hipp_csc_max_y;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MAX_Y.u32)) ), HIPP_CSC_MAX_Y.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetGpCscMaxC( HI_U32 hipp_csc_max_c)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_MAX_C HIPP_CSC_MAX_C;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MAX_C.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MAX_C.u32)) ));
    HIPP_CSC_MAX_C.bits.hipp_csc_max_c = hipp_csc_max_c;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_MAX_C.u32)) ), HIPP_CSC_MAX_C.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetGpCscCoef(HI_PQ_CSC_COEF_S *pstCscCoef)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_COEF00 HIPP_CSC_COEF00;
    U_G0_HIPP_CSC_COEF01 HIPP_CSC_COEF01;
    U_G0_HIPP_CSC_COEF02 HIPP_CSC_COEF02;
    U_G0_HIPP_CSC_COEF10 HIPP_CSC_COEF10;
    U_G0_HIPP_CSC_COEF11 HIPP_CSC_COEF11;
    U_G0_HIPP_CSC_COEF12 HIPP_CSC_COEF12;
    U_G0_HIPP_CSC_COEF20 HIPP_CSC_COEF20;
    U_G0_HIPP_CSC_COEF21 HIPP_CSC_COEF21;
    U_G0_HIPP_CSC_COEF22 HIPP_CSC_COEF22;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_COEF00.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF00.u32)) ));
    HIPP_CSC_COEF01.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF01.u32)) ));
    HIPP_CSC_COEF02.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF02.u32)) ));
    HIPP_CSC_COEF10.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF10.u32)) ));
    HIPP_CSC_COEF11.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF11.u32)) ));
    HIPP_CSC_COEF12.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF12.u32)) ));
    HIPP_CSC_COEF20.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF20.u32)) ));
    HIPP_CSC_COEF21.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF21.u32)) ));
    HIPP_CSC_COEF22.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF22.u32)) ));
    HIPP_CSC_COEF00.bits.hipp_csc_coef00 = pstCscCoef->csc_coef00;
    HIPP_CSC_COEF01.bits.hipp_csc_coef01 = pstCscCoef->csc_coef01;
    HIPP_CSC_COEF02.bits.hipp_csc_coef02 = pstCscCoef->csc_coef02;
    HIPP_CSC_COEF10.bits.hipp_csc_coef10 = pstCscCoef->csc_coef10;
    HIPP_CSC_COEF11.bits.hipp_csc_coef11 = pstCscCoef->csc_coef11;
    HIPP_CSC_COEF12.bits.hipp_csc_coef12 = pstCscCoef->csc_coef12;
    HIPP_CSC_COEF20.bits.hipp_csc_coef20 = pstCscCoef->csc_coef20;
    HIPP_CSC_COEF21.bits.hipp_csc_coef21 = pstCscCoef->csc_coef21;
    HIPP_CSC_COEF22.bits.hipp_csc_coef22 = pstCscCoef->csc_coef22;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF00.u32)) ), HIPP_CSC_COEF00.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF01.u32)) ), HIPP_CSC_COEF01.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF02.u32)) ), HIPP_CSC_COEF02.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF10.u32)) ), HIPP_CSC_COEF10.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF11.u32)) ), HIPP_CSC_COEF11.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF12.u32)) ), HIPP_CSC_COEF12.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF20.u32)) ), HIPP_CSC_COEF20.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF21.u32)) ), HIPP_CSC_COEF21.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_COEF22.u32)) ), HIPP_CSC_COEF22.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetGpCscDcCoef(HI_PQ_CSC_DCCOEF_S *pstCscDcCoef)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_G0_HIPP_CSC_IDC0 HIPP_CSC_IDC0;
    U_G0_HIPP_CSC_IDC1 HIPP_CSC_IDC1;
    U_G0_HIPP_CSC_IDC2 HIPP_CSC_IDC2;
    U_G0_HIPP_CSC_ODC0 HIPP_CSC_ODC0;
    U_G0_HIPP_CSC_ODC1 HIPP_CSC_ODC1;
    U_G0_HIPP_CSC_ODC2 HIPP_CSC_ODC2;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_IDC0.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC0.u32)) ));
    HIPP_CSC_IDC1.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC1.u32)) ));
    HIPP_CSC_IDC2.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC2.u32)) ));
    HIPP_CSC_ODC0.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC0.u32)) ));
    HIPP_CSC_ODC1.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC1.u32)) ));
    HIPP_CSC_ODC2.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC2.u32)) ));
    HIPP_CSC_IDC0.bits.hipp_csc_idc0 = pstCscDcCoef->csc_in_dc0;
    HIPP_CSC_IDC1.bits.hipp_csc_idc1 = pstCscDcCoef->csc_in_dc1;
    HIPP_CSC_IDC2.bits.hipp_csc_idc2 = pstCscDcCoef->csc_in_dc2;
    HIPP_CSC_ODC0.bits.hipp_csc_odc0 = pstCscDcCoef->csc_out_dc0;
    HIPP_CSC_ODC1.bits.hipp_csc_odc1 = pstCscDcCoef->csc_out_dc1;
    HIPP_CSC_ODC2.bits.hipp_csc_odc2 = pstCscDcCoef->csc_out_dc2;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC0.u32)) ), HIPP_CSC_IDC0.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC1.u32)) ), HIPP_CSC_IDC1.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_IDC2.u32)) ), HIPP_CSC_IDC2.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC0.u32)) ), HIPP_CSC_ODC0.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC1.u32)) ), HIPP_CSC_ODC1.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->G0_HIPP_CSC_ODC2.u32)) ), HIPP_CSC_ODC2.u32);

    return;
}

HI_VOID PQ_HAL_CSC_SetWbcGpCscDemoEn( HI_U32 hipp_csc_demo_en)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_CTRL HIPP_CSC_CTRL;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_CTRL.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_CTRL.u32)) ));
    HIPP_CSC_CTRL.bits.hipp_csc_demo_en = hipp_csc_demo_en;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_CTRL.u32)) ), HIPP_CSC_CTRL.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetWbcGpCscEn( HI_U32 hipp_csc_en)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_CTRL HIPP_CSC_CTRL;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_CTRL.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_CTRL.u32)) ));
    HIPP_CSC_CTRL.bits.hipp_csc_en = hipp_csc_en;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_CTRL.u32)) ), HIPP_CSC_CTRL.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetWbcGpCscScale( HI_U32 hipp_csc_scale)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_SCALE HIPP_CSC_SCALE;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_SCALE.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_SCALE.u32)) ));
    HIPP_CSC_SCALE.bits.hipp_csc_scale = hipp_csc_scale;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_SCALE.u32)) ), HIPP_CSC_SCALE.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetWbcGpCscMinY( HI_U32 hipp_csc_min_y)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_MIN_Y HIPP_CSC_MIN_Y;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MIN_Y.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MIN_Y.u32)) ));
    HIPP_CSC_MIN_Y.bits.hipp_csc_min_y = hipp_csc_min_y;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MIN_Y.u32)) ), HIPP_CSC_MIN_Y.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetWbcGpCscMinC( HI_U32 hipp_csc_min_c)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_MIN_C HIPP_CSC_MIN_C;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MIN_C.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MIN_C.u32)) ));
    HIPP_CSC_MIN_C.bits.hipp_csc_min_c = hipp_csc_min_c;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MIN_C.u32)) ), HIPP_CSC_MIN_C.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetWbcGpCscMaxY( HI_U32 hipp_csc_max_y)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_MAX_Y HIPP_CSC_MAX_Y;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MAX_Y.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MAX_Y.u32)) ));
    HIPP_CSC_MAX_Y.bits.hipp_csc_max_y = hipp_csc_max_y;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MAX_Y.u32)) ), HIPP_CSC_MAX_Y.u32);

    return ;
}


HI_VOID PQ_HAL_CSC_SetWbcGpCscMaxC( HI_U32 hipp_csc_max_c)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_MAX_C HIPP_CSC_MAX_C;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_MAX_C.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MAX_C.u32)) ));
    HIPP_CSC_MAX_C.bits.hipp_csc_max_c = hipp_csc_max_c;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_MAX_C.u32)) ), HIPP_CSC_MAX_C.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetWbcGpCscCoef(HI_PQ_CSC_COEF_S *pstCscCoef)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_COEF00 HIPP_CSC_COEF00;
    U_WBC_G0_HIPP_CSC_COEF01 HIPP_CSC_COEF01;
    U_WBC_G0_HIPP_CSC_COEF02 HIPP_CSC_COEF02;
    U_WBC_G0_HIPP_CSC_COEF10 HIPP_CSC_COEF10;
    U_WBC_G0_HIPP_CSC_COEF11 HIPP_CSC_COEF11;
    U_WBC_G0_HIPP_CSC_COEF12 HIPP_CSC_COEF12;
    U_WBC_G0_HIPP_CSC_COEF20 HIPP_CSC_COEF20;
    U_WBC_G0_HIPP_CSC_COEF21 HIPP_CSC_COEF21;
    U_WBC_G0_HIPP_CSC_COEF22 HIPP_CSC_COEF22;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_COEF00.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF00.u32)) ));
    HIPP_CSC_COEF01.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF01.u32)) ));
    HIPP_CSC_COEF02.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF02.u32)) ));
    HIPP_CSC_COEF10.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF10.u32)) ));
    HIPP_CSC_COEF11.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF11.u32)) ));
    HIPP_CSC_COEF12.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF12.u32)) ));
    HIPP_CSC_COEF20.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF20.u32)) ));
    HIPP_CSC_COEF21.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF21.u32)) ));
    HIPP_CSC_COEF22.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF22.u32)) ));
    HIPP_CSC_COEF00.bits.hipp_csc_coef00 = pstCscCoef->csc_coef00;
    HIPP_CSC_COEF01.bits.hipp_csc_coef01 = pstCscCoef->csc_coef01;
    HIPP_CSC_COEF02.bits.hipp_csc_coef02 = pstCscCoef->csc_coef02;
    HIPP_CSC_COEF10.bits.hipp_csc_coef10 = pstCscCoef->csc_coef10;
    HIPP_CSC_COEF11.bits.hipp_csc_coef11 = pstCscCoef->csc_coef11;
    HIPP_CSC_COEF12.bits.hipp_csc_coef12 = pstCscCoef->csc_coef12;
    HIPP_CSC_COEF20.bits.hipp_csc_coef20 = pstCscCoef->csc_coef20;
    HIPP_CSC_COEF21.bits.hipp_csc_coef21 = pstCscCoef->csc_coef21;
    HIPP_CSC_COEF22.bits.hipp_csc_coef22 = pstCscCoef->csc_coef22;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF00.u32)) ), HIPP_CSC_COEF00.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF01.u32)) ), HIPP_CSC_COEF01.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF02.u32)) ), HIPP_CSC_COEF02.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF10.u32)) ), HIPP_CSC_COEF10.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF11.u32)) ), HIPP_CSC_COEF11.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF12.u32)) ), HIPP_CSC_COEF12.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF20.u32)) ), HIPP_CSC_COEF20.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF21.u32)) ), HIPP_CSC_COEF21.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_COEF22.u32)) ), HIPP_CSC_COEF22.u32);

    return ;
}

HI_VOID PQ_HAL_CSC_SetWbcGpCscDcCoef(HI_PQ_CSC_DCCOEF_S *pstCscDcCoef)
{
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;
    U_WBC_G0_HIPP_CSC_IDC0 HIPP_CSC_IDC0;
    U_WBC_G0_HIPP_CSC_IDC1 HIPP_CSC_IDC1;
    U_WBC_G0_HIPP_CSC_IDC2 HIPP_CSC_IDC2;
    U_WBC_G0_HIPP_CSC_ODC0 HIPP_CSC_ODC0;
    U_WBC_G0_HIPP_CSC_ODC1 HIPP_CSC_ODC1;
    U_WBC_G0_HIPP_CSC_ODC2 HIPP_CSC_ODC2;
    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    HIPP_CSC_IDC0.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC0.u32)) ));
    HIPP_CSC_IDC1.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC1.u32)) ));
    HIPP_CSC_IDC2.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC2.u32)) ));
    HIPP_CSC_ODC0.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC0.u32)) ));
    HIPP_CSC_ODC1.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC1.u32)) ));
    HIPP_CSC_ODC2.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC2.u32)) ));
    HIPP_CSC_IDC0.bits.hipp_csc_idc0 = pstCscDcCoef->csc_in_dc0;
    HIPP_CSC_IDC1.bits.hipp_csc_idc1 = pstCscDcCoef->csc_in_dc1;
    HIPP_CSC_IDC2.bits.hipp_csc_idc2 = pstCscDcCoef->csc_in_dc2;
    HIPP_CSC_ODC0.bits.hipp_csc_odc0 = pstCscDcCoef->csc_out_dc0;
    HIPP_CSC_ODC1.bits.hipp_csc_odc1 = pstCscDcCoef->csc_out_dc1;
    HIPP_CSC_ODC2.bits.hipp_csc_odc2 = pstCscDcCoef->csc_out_dc2;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC0.u32)) ), HIPP_CSC_IDC0.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC1.u32)) ), HIPP_CSC_IDC1.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_IDC2.u32)) ), HIPP_CSC_IDC2.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC0.u32)) ), HIPP_CSC_ODC0.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC1.u32)) ), HIPP_CSC_ODC1.u32);
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_G0_HIPP_CSC_ODC2.u32)) ), HIPP_CSC_ODC2.u32);

    return;
}


HI_VOID PQ_HAL_TransGfxCscPrecision(HI_PQ_CSC_PRE_S *pstCscPre, HI_PQ_CSC_COEF_S *pstCscOriCoef, HI_PQ_CSC_DCCOEF_S *pstCscOriDcCoef,
                                    HI_PQ_CSC_COEF_S *pstCscTrueCoef, HI_PQ_CSC_DCCOEF_S *pstCscTrueDcCoef)
{
    HI_U32 CscCoefPre;      /* Csc 系数精度 */
    HI_U32 CscInDcCoefPre;  /* Csc 直流分量精度 */
    HI_U32 CscOutDcCoefPre; /* Csc 直流分量精度 */

    if (pstCscPre->CscCoefPre > 10)
    {
        CscCoefPre = 1 << (pstCscPre->CscCoefPre - 10);
    }
    else if (pstCscPre->CscCoefPre == 10)
    {
        CscCoefPre = 1;
    }
    else
    {
        CscCoefPre = 4;
    }

    if (pstCscPre->CscInDcCoefPre > 10)
    {
        CscInDcCoefPre = 1 << (pstCscPre->CscInDcCoefPre - 10);
    }
    else
    {
        CscInDcCoefPre = 1;
    }

    if (pstCscPre->CscOutDcCoefPre > 10)
    {
        CscOutDcCoefPre = 1 << (pstCscPre->CscOutDcCoefPre - 10);
    }
    else
    {
        CscOutDcCoefPre = 1;
    }
    pstCscTrueCoef->csc_coef00    = (HI_S32)(pstCscOriCoef->csc_coef00 / CscCoefPre);
    pstCscTrueCoef->csc_coef01    = (HI_S32)(pstCscOriCoef->csc_coef01 / CscCoefPre);
    pstCscTrueCoef->csc_coef02    = (HI_S32)(pstCscOriCoef->csc_coef02 / CscCoefPre);
    pstCscTrueCoef->csc_coef10    = (HI_S32)(pstCscOriCoef->csc_coef10 / CscCoefPre);
    pstCscTrueCoef->csc_coef11    = (HI_S32)(pstCscOriCoef->csc_coef11 / CscCoefPre);
    pstCscTrueCoef->csc_coef12    = (HI_S32)(pstCscOriCoef->csc_coef12 / CscCoefPre);
    pstCscTrueCoef->csc_coef20    = (HI_S32)(pstCscOriCoef->csc_coef20 / CscCoefPre);
    pstCscTrueCoef->csc_coef21    = (HI_S32)(pstCscOriCoef->csc_coef21 / CscCoefPre);
    pstCscTrueCoef->csc_coef22    = (HI_S32)(pstCscOriCoef->csc_coef22 / CscCoefPre);

    pstCscTrueDcCoef->csc_in_dc0  = (HI_S32)(pstCscOriDcCoef->csc_in_dc0  * CscInDcCoefPre);
    pstCscTrueDcCoef->csc_in_dc1  = (HI_S32)(pstCscOriDcCoef->csc_in_dc1  * CscInDcCoefPre);
    pstCscTrueDcCoef->csc_in_dc2  = (HI_S32)(pstCscOriDcCoef->csc_in_dc2  * CscInDcCoefPre);
    pstCscTrueDcCoef->csc_out_dc0 = (HI_S32)(pstCscOriDcCoef->csc_out_dc0 * CscOutDcCoefPre);
    pstCscTrueDcCoef->csc_out_dc1 = (HI_S32)(pstCscOriDcCoef->csc_out_dc1 * CscOutDcCoefPre);
    pstCscTrueDcCoef->csc_out_dc2 = (HI_S32)(pstCscOriDcCoef->csc_out_dc2 * CscOutDcCoefPre);

    return;
}

HI_S32 PQ_HAL_SetGfxCsc(HI_U32 enLayer, HI_BOOL bCSCEn, HI_PQ_CSC_COEF_S *pstCscCoef, HI_PQ_CSC_DCCOEF_S *pstCscDcCoef)
{
    HI_U16 gdm_rgb2yuvscale2p   = 10;
    HI_U16 gdm_rgb2yuv_clip_min = 0;
    HI_U16 gdm_rgb2yuv_clip_max = 1023;
    HI_PQ_CSC_PRE_S    stCscPre = {0};
    HI_PQ_CSC_COEF_S   stCscTrueCoef = {0};
    HI_PQ_CSC_DCCOEF_S stCscTrueDcCoef = {0};

    if (enLayer == PQ_GFX_GP0)
    {
        gdm_rgb2yuv_clip_min = 0;
        gdm_rgb2yuv_clip_max = 1023;
        stCscPre.CscCoefPre      = 10;
        stCscPre.CscInDcCoefPre  = 10;
        stCscPre.CscOutDcCoefPre = 10;
        gdm_rgb2yuvscale2p   = 10;

        PQ_HAL_TransGfxCscPrecision(&stCscPre, pstCscCoef, pstCscDcCoef, &stCscTrueCoef, &stCscTrueDcCoef);

        PQ_HAL_CSC_SetGpCscEn( bCSCEn);

        PQ_HAL_CSC_SetGpCscCoef    ( &stCscTrueCoef);
        PQ_HAL_CSC_SetGpCscDcCoef  ( &stCscTrueDcCoef);

        PQ_HAL_CSC_SetGpCscScale( gdm_rgb2yuvscale2p);
        PQ_HAL_CSC_SetGpCscMinY( gdm_rgb2yuv_clip_min);
        PQ_HAL_CSC_SetGpCscMinC( gdm_rgb2yuv_clip_min);
        PQ_HAL_CSC_SetGpCscMaxY( gdm_rgb2yuv_clip_max);
        PQ_HAL_CSC_SetGpCscMaxC( gdm_rgb2yuv_clip_max);

    }
    else // wbc_gp
    {
        gdm_rgb2yuv_clip_min = 0;
        gdm_rgb2yuv_clip_max = 255;
        stCscPre.CscCoefPre      = 8;
        stCscPre.CscInDcCoefPre  = 8;
        stCscPre.CscOutDcCoefPre = 8;
        gdm_rgb2yuvscale2p   = 8;

        PQ_HAL_TransGfxCscPrecision(&stCscPre, pstCscCoef, pstCscDcCoef, &stCscTrueCoef, &stCscTrueDcCoef);

        PQ_HAL_CSC_SetWbcGpCscEn( bCSCEn);
        PQ_HAL_CSC_SetWbcGpCscCoef    ( &stCscTrueCoef);
        PQ_HAL_CSC_SetWbcGpCscDcCoef  ( &stCscTrueDcCoef);

        PQ_HAL_CSC_SetWbcGpCscScale( gdm_rgb2yuvscale2p);

        PQ_HAL_CSC_SetWbcGpCscMinY( gdm_rgb2yuv_clip_min);
        PQ_HAL_CSC_SetWbcGpCscMinC( gdm_rgb2yuv_clip_min);
        PQ_HAL_CSC_SetWbcGpCscMaxY( gdm_rgb2yuv_clip_max);
        PQ_HAL_CSC_SetWbcGpCscMaxC( gdm_rgb2yuv_clip_max);
    }

    return HI_SUCCESS;
}

