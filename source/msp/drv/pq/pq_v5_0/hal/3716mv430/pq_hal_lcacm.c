/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_lcacm.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016/07/18
  Description   :

******************************************************************************/
#include <linux/string.h>

#include "hi_type.h"
#include "hi_debug.h"
#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"

#include "pq_hal_comm.h"
#include "pq_hal_lcacm.h"

HI_VOID PQ_HAL_SetAcmSecBlk0(HI_U32 u32Data, HI_U32 acm_sec_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_sec_blk = acm_sec_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmFirBlk0(HI_U32 u32Data, HI_U32 acm_fir_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_fir_blk = acm_fir_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmDUOff0(HI_U32 u32Data, HI_U32 acm_d_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_d_u_off = acm_d_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCUOff0(HI_U32 u32Data, HI_U32 acm_c_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_c_u_off = acm_c_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBUOff0(HI_U32 u32Data, HI_U32 acm_b_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_b_u_off = acm_b_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAUOff0(HI_U32 u32Data, HI_U32 acm_a_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm_a_u_off = acm_a_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmTestEn(HI_U32 u32Data, HI_U32 acm_test_en)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_test_en = acm_test_en;

    return;
}

HI_VOID PQ_HAL_SetAcmDbgMode(HI_U32 u32Data, HI_U32 acm_dbg_mode)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_dbg_mode = acm_dbg_mode;

    return;
}

HI_VOID PQ_HAL_SetAcmProtMode(HI_U32 u32Data, HI_U32 bw_pro_mode)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.bw_pro_mode = bw_pro_mode;

    return;
}

HI_VOID PQ_HAL_SetAcmDVOff0(HI_U32 u32Data, HI_U32 acm_d_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_d_v_off = acm_d_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCVOff0(HI_U32 u32Data, HI_U32 acm_c_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_c_v_off = acm_c_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBVOff0(HI_U32 u32Data, HI_U32 acm_b_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_b_v_off = acm_b_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAVOff0(HI_U32 u32Data, HI_U32 acm_a_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM1.bits.acm_a_v_off = acm_a_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmSecBlk1(HI_U32 u32Data, HI_U32 acm_sec_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_sec_blk = acm_sec_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmFirBlk1(HI_U32 u32Data, HI_U32 acm_fir_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_fir_blk = acm_fir_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmDUOff1(HI_U32 u32Data, HI_U32 acm_d_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_d_u_off = acm_d_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCUOff1(HI_U32 u32Data, HI_U32 acm_c_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_c_u_off = acm_c_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBUOff1(HI_U32 u32Data, HI_U32 acm_b_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_b_u_off = acm_b_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAUOff1(HI_U32 u32Data, HI_U32 acm_a_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM2.bits.acm_a_u_off = acm_a_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmDVOff1(HI_U32 u32Data, HI_U32 acm_d_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM3.bits.acm_d_v_off = acm_d_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCVOff1(HI_U32 u32Data, HI_U32 acm_c_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM3.bits.acm_c_v_off = acm_c_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBVOff1(HI_U32 u32Data, HI_U32 acm_b_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM3.bits.acm_b_v_off = acm_b_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAVOff1(HI_U32 u32Data, HI_U32 acm_a_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM3.bits.acm_a_v_off = acm_a_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmSecBlk2(HI_U32 u32Data, HI_U32 acm_sec_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_sec_blk = acm_sec_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmFirBlk2(HI_U32 u32Data, HI_U32 acm_fir_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_fir_blk = acm_fir_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmDUOff2(HI_U32 u32Data, HI_U32 acm_d_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_d_u_off = acm_d_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCUOff2(HI_U32 u32Data, HI_U32 acm_c_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_c_u_off = acm_c_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBUOff2(HI_U32 u32Data, HI_U32 acm_b_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_b_u_off = acm_b_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAUOff2(HI_U32 u32Data, HI_U32 acm_a_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM4.bits.acm_a_u_off = acm_a_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmDVOff2(HI_U32 u32Data, HI_U32 acm_d_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM5.bits.acm_d_v_off = acm_d_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCVOff2(HI_U32 u32Data, HI_U32 acm_c_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM5.bits.acm_c_v_off = acm_c_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBVOff2(HI_U32 u32Data, HI_U32 acm_b_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM5.bits.acm_b_v_off = acm_b_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAVOff2(HI_U32 u32Data, HI_U32 acm_a_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM5.bits.acm_a_v_off = acm_a_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmSecBlk3(HI_U32 u32Data, HI_U32 acm_sec_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_sec_blk = acm_sec_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmFirBlk3(HI_U32 u32Data, HI_U32 acm_fir_blk)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_fir_blk = acm_fir_blk;

    return;
}

HI_VOID PQ_HAL_SetAcmDUOff3(HI_U32 u32Data, HI_U32 acm_d_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_d_u_off = acm_d_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCUOff3(HI_U32 u32Data, HI_U32 acm_c_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_c_u_off = acm_c_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBUOff3(HI_U32 u32Data, HI_U32 acm_b_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_b_u_off = acm_b_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAUOff3(HI_U32 u32Data, HI_U32 acm_a_u_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM6.bits.acm_a_u_off = acm_a_u_off;

    return;
}

HI_VOID PQ_HAL_SetAcmDVOff3(HI_U32 u32Data, HI_U32 acm_d_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM7.bits.acm_d_v_off = acm_d_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmCVOff3(HI_U32 u32Data, HI_U32 acm_c_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM7.bits.acm_c_v_off = acm_c_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmBVOff3(HI_U32 u32Data, HI_U32 acm_b_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM7.bits.acm_b_v_off = acm_b_v_off;

    return;
}

HI_VOID PQ_HAL_SetAcmAVOff3(HI_U32 u32Data, HI_U32 acm_a_v_off)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM7.bits.acm_a_v_off = acm_a_v_off;

    return;
}

HI_VOID PQ_HAL_SetACMEn0(PQ_HAL_LAYER_VP_E u32ChId, HI_BOOL bOnOff)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm0_en = bOnOff;

    return;
}

HI_VOID PQ_HAL_SetACMEn1(PQ_HAL_LAYER_VP_E u32ChId, HI_BOOL bOnOff)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm1_en = bOnOff;

    return;
}

HI_VOID PQ_HAL_SetACMEn2(PQ_HAL_LAYER_VP_E u32ChId, HI_BOOL bOnOff)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm2_en = bOnOff;

    return;
}

HI_VOID PQ_HAL_SetACMEn3(PQ_HAL_LAYER_VP_E u32ChId, HI_BOOL bOnOff)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pstVdpReg);
    pstVdpReg->VHDACM0.bits.acm3_en = bOnOff;

    return;
}

HI_VOID PQ_HAL_SetACMDemoEn(PQ_HAL_LAYER_VP_E u32ChId, HI_BOOL bOnOff)
{
    PQ_HAL_SetAcmTestEn(u32ChId, bOnOff);

    return;
}

HI_VOID PQ_HAL_SetACMDemoMode(PQ_HAL_LAYER_VP_E u32ChId, HAL_ACM_DEMO_MODE_E enACMDemoMode)
{
    PQ_HAL_SetAcmDbgMode(u32ChId, enACMDemoMode);

    return;
}

HI_VOID PQ_HAL_SetLCACMPara(HI_U32 enLayer, PQ_HAL_ACM_PARA_S *pstAcmPara)
{
    PQ_HAL_SetAcmSecBlk0 ( enLayer, pstAcmPara->acm0_sec_blk);
    PQ_HAL_SetAcmFirBlk0 ( enLayer, pstAcmPara->acm0_fir_blk);

    PQ_HAL_SetAcmDUOff0  ( enLayer, pstAcmPara->acm0_d_u_off);
    PQ_HAL_SetAcmCUOff0  ( enLayer, pstAcmPara->acm0_c_u_off);
    PQ_HAL_SetAcmBUOff0  ( enLayer, pstAcmPara->acm0_b_u_off);
    PQ_HAL_SetAcmAUOff0  ( enLayer, pstAcmPara->acm0_a_u_off);

    PQ_HAL_SetAcmDVOff0  ( enLayer, pstAcmPara->acm0_d_v_off);
    PQ_HAL_SetAcmCVOff0  ( enLayer, pstAcmPara->acm0_c_v_off);
    PQ_HAL_SetAcmBVOff0  ( enLayer, pstAcmPara->acm0_b_v_off);
    PQ_HAL_SetAcmAVOff0  ( enLayer, pstAcmPara->acm0_a_v_off);

    PQ_HAL_SetAcmSecBlk1 ( enLayer, pstAcmPara->acm1_sec_blk);
    PQ_HAL_SetAcmFirBlk1 ( enLayer, pstAcmPara->acm1_fir_blk);

    PQ_HAL_SetAcmDUOff1  ( enLayer, pstAcmPara->acm1_d_u_off);
    PQ_HAL_SetAcmCUOff1  ( enLayer, pstAcmPara->acm1_c_u_off);
    PQ_HAL_SetAcmBUOff1  ( enLayer, pstAcmPara->acm1_b_u_off);
    PQ_HAL_SetAcmAUOff1  ( enLayer, pstAcmPara->acm1_a_u_off);

    PQ_HAL_SetAcmDVOff1  ( enLayer, pstAcmPara->acm1_d_v_off);
    PQ_HAL_SetAcmCVOff1  ( enLayer, pstAcmPara->acm1_c_v_off);
    PQ_HAL_SetAcmBVOff1  ( enLayer, pstAcmPara->acm1_b_v_off);
    PQ_HAL_SetAcmAVOff1  ( enLayer, pstAcmPara->acm1_a_v_off);

    PQ_HAL_SetAcmSecBlk2 ( enLayer, pstAcmPara->acm2_sec_blk);
    PQ_HAL_SetAcmFirBlk2 ( enLayer, pstAcmPara->acm2_fir_blk);

    PQ_HAL_SetAcmDUOff2  ( enLayer, pstAcmPara->acm2_d_u_off);
    PQ_HAL_SetAcmCUOff2  ( enLayer, pstAcmPara->acm2_c_u_off);
    PQ_HAL_SetAcmBUOff2  ( enLayer, pstAcmPara->acm2_b_u_off);
    PQ_HAL_SetAcmAUOff2  ( enLayer, pstAcmPara->acm2_a_u_off);

    PQ_HAL_SetAcmDVOff2  ( enLayer, pstAcmPara->acm2_d_v_off);
    PQ_HAL_SetAcmCVOff2  ( enLayer, pstAcmPara->acm2_c_v_off);
    PQ_HAL_SetAcmBVOff2  ( enLayer, pstAcmPara->acm2_b_v_off);
    PQ_HAL_SetAcmAVOff2  ( enLayer, pstAcmPara->acm2_a_v_off);

    PQ_HAL_SetAcmSecBlk3 ( enLayer, pstAcmPara->acm3_sec_blk);
    PQ_HAL_SetAcmFirBlk3 ( enLayer, pstAcmPara->acm3_fir_blk);

    PQ_HAL_SetAcmDUOff3  ( enLayer, pstAcmPara->acm3_d_u_off);
    PQ_HAL_SetAcmCUOff3  ( enLayer, pstAcmPara->acm3_c_u_off);
    PQ_HAL_SetAcmBUOff3  ( enLayer, pstAcmPara->acm3_b_u_off);
    PQ_HAL_SetAcmAUOff3  ( enLayer, pstAcmPara->acm3_a_u_off);

    PQ_HAL_SetAcmDVOff3  ( enLayer, pstAcmPara->acm3_d_v_off);
    PQ_HAL_SetAcmCVOff3  ( enLayer, pstAcmPara->acm3_c_v_off);
    PQ_HAL_SetAcmBVOff3  ( enLayer, pstAcmPara->acm3_b_v_off);
    PQ_HAL_SetAcmAVOff3  ( enLayer, pstAcmPara->acm3_a_v_off);

    return;
}

HI_S32 PQ_HAL_SetNormLcacmFleshToneCfg(HI_PQ_FLESHTONE_E enGainLevel)
{
    PQ_HAL_ACM_PARA_S stAcmPara = {0};

    stAcmPara.acm0_sec_blk = 9;
    stAcmPara.acm0_fir_blk = 7;

    stAcmPara.acm0_d_u_off = 0;
    stAcmPara.acm0_c_u_off = 0;
    stAcmPara.acm0_b_u_off = -2;
    stAcmPara.acm0_a_u_off = -2;
    stAcmPara.acm0_d_v_off = 0;
    stAcmPara.acm0_c_v_off = 2;
    stAcmPara.acm0_b_v_off = 3;
    stAcmPara.acm0_a_v_off = 4;

    PQ_HAL_SetLCACMPara(VDP_LAYER_VP0, &stAcmPara);

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetNormLcacmCfg(HI_PQ_COLOR_SPEC_MODE_E enColorSpecMode, HI_PQ_LCACM_OFFSET_S *pstOffset)
{
    PQ_HAL_ACM_PARA_S stAcmPara = {0};

    if (HI_PQ_COLOR_MODE_RECOMMEND == enColorSpecMode)
    {
        memcpy(&stAcmPara, &(pstOffset->as32AcmOffset), sizeof(PQ_HAL_ACM_PARA_S));
    }
    else if (HI_PQ_COLOR_MODE_BLUE == enColorSpecMode)
    {
        stAcmPara.acm0_sec_blk = 7;
        stAcmPara.acm0_fir_blk = 9;

        stAcmPara.acm0_d_u_off = 5;
        stAcmPara.acm0_c_u_off = 2;
        stAcmPara.acm0_b_u_off = 0;
        stAcmPara.acm0_a_u_off = 3;
        stAcmPara.acm0_d_v_off = -5;
        stAcmPara.acm0_c_v_off = 0;
        stAcmPara.acm0_b_v_off = 0;
        stAcmPara.acm0_a_v_off = -3;
    }
    else if (HI_PQ_COLOR_MODE_GREEN == enColorSpecMode)
    {
        stAcmPara.acm0_sec_blk = 7;
        stAcmPara.acm0_fir_blk = 6;

        stAcmPara.acm0_d_u_off = -1;
        stAcmPara.acm0_c_u_off = -2;
        stAcmPara.acm0_b_u_off = -4;
        stAcmPara.acm0_a_u_off = -4;
        stAcmPara.acm0_d_v_off = -1;
        stAcmPara.acm0_c_v_off = -5;
        stAcmPara.acm0_b_v_off = -6;
        stAcmPara.acm0_a_v_off = -8;
    }
    else if (HI_PQ_COLOR_MODE_BG == enColorSpecMode)
    {
        stAcmPara.acm0_sec_blk = 7;
        stAcmPara.acm0_fir_blk = 9;

        stAcmPara.acm0_d_u_off = 5;
        stAcmPara.acm0_c_u_off = 2;
        stAcmPara.acm0_b_u_off = 0;
        stAcmPara.acm0_a_u_off = 3;
        stAcmPara.acm0_d_v_off = -5;
        stAcmPara.acm0_c_v_off = 0;
        stAcmPara.acm0_b_v_off = 0;
        stAcmPara.acm0_a_v_off = -3;

        stAcmPara.acm1_sec_blk = 7;
        stAcmPara.acm1_fir_blk = 6;

        stAcmPara.acm1_d_u_off = -1;
        stAcmPara.acm1_c_u_off = -2;
        stAcmPara.acm1_b_u_off = -4;
        stAcmPara.acm1_a_u_off = -4;
        stAcmPara.acm1_d_v_off = -1;
        stAcmPara.acm1_c_v_off = -5;
        stAcmPara.acm1_b_v_off = -6;
        stAcmPara.acm1_a_v_off = -8;

        stAcmPara.acm2_sec_blk = 0;
        stAcmPara.acm2_fir_blk = 0;
    }

    PQ_HAL_SetLCACMPara(VDP_LAYER_VP0, &stAcmPara);

    PQ_HAL_SetAcmProtMode(VDP_LAYER_VP0, pstOffset->u32Protectmode);

    return HI_SUCCESS;
}

