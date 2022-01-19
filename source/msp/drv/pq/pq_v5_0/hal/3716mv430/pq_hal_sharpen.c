/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_sharpen.c
  Version       : Initial Draft
  Author        :
  Created       : 2013/11/2
  Description   : Hisilicon multimedia software group
******************************************************************************/
#include "hi_type.h"
#include "hi_debug.h"

#include "pq_hal_sharpen.h"

HI_S32 PQ_HAL_EnableSharp(HI_BOOL bOnOff)
{
    S_VDP_REGS_TYPE *pstVdpReg = HI_NULL;

    pstVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVdpReg);
    pstVdpReg->VHDLTICTRL.bits.lti_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetSharpStrReg(HI_U32 u32LumGain, HI_U32 u32LmingRatio)
{
    S_VDP_REGS_TYPE *pVdpReg = HI_NULL;

    pVdpReg = PQ_HAL_GetVdpReg();
    PQ_CHECK_NULL_PTR_RE_FAIL(pVdpReg);
    pVdpReg->VHDLTICTRL.bits.lgain_ratio   = u32LumGain;
    pVdpReg->VHDLTICTRL.bits.lmixing_ratio = u32LmingRatio;

    return HI_SUCCESS;
}
