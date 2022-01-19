/******************************************************************************
*
* Copyright (C) 2015-2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

 File Name    : pq_hal_tnr.c
 Version        : Initial Draft
 Author         : sdk
 Created       : 2016/05/25
 Description   :
******************************************************************************/

#include "hi_type.h"
#include "hi_math.h"

#include "pq_hal_tnr.h"
#include "pq_hal_comm.h"

static HI_S32 sg_s32TMTYMotionGain = 15;
static HI_S32 sg_s32TMTCMotionGain = 15;

const static HI_U8 sg_YBlendingAlphaLut[32] =
{
    7,  7,  7,  8,  8,  9, 11, 13,
    16, 19, 22, 25, 27, 28, 29, 30,
    30, 31, 31, 31, 31, 31, 31, 31,
    31, 31, 31, 31, 31, 31, 31, 31
};

const static HI_U8 sg_CBlendingAlphaLut[32] =
{
    7,  7,  7,  8,  8,  9,  11, 13,
    16, 19, 22, 25, 27, 28, 29, 30,
    30, 31, 31, 31, 31, 31, 31, 31,
    31, 31, 31, 31, 31, 31, 31, 31
};

HI_S32 PQ_HAL_EnableTNR(HI_U32 u32HandleNo, HI_BOOL bTNROnOff)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    pstVpssReg->VPSS_TNR_REG35.bits.nr_en    = bTNROnOff;
    pstVpssReg->VPSS_TNR_REG35.bits.y_tnr_en = bTNROnOff;
    pstVpssReg->VPSS_TNR_REG35.bits.c_tnr_en = bTNROnOff;

    /* ccs_3d follow tnr */
    pstVpssReg->VPSS_TNR_CTRL.bits.ccs_3d_en = bTNROnOff;
    /* cls_3d follow tnr */
    pstVpssReg->VPSS_TNR_CTRL.bits.cls_3d_en = bTNROnOff;

    return HI_SUCCESS;
}


HI_S32 PQ_HAL_EnableTNRDemo(HI_U32 u32HandleNo, HI_BOOL bTNRDemoEn)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    pstVpssReg->VPSS_TNR_CTRL.bits.market_mode_en = bTNRDemoEn;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetTNRDemoMode(HI_U32 u32HandleNo, PQ_DEMO_MODE_E enMode)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    TNR_DEMO_MODE_E enDemoMode = TNR_DEMO_ENABLE_L;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    enDemoMode = (enMode == PQ_DEMO_ENABLE_L) ? TNR_DEMO_ENABLE_L : TNR_DEMO_ENABLE_R;
    pstVpssReg->VPSS_TNR_CTRL.bits.market_mode = enDemoMode;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetTnrStr(HI_U32 u32HandleNo, HI_U32 u32TnrStr)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;
    HI_U32 u32YMotionGain = ((100 - u32TnrStr) * sg_s32TMTYMotionGain + 25) / 50;
    HI_U32 u32CMotionGain = ((100 - u32TnrStr) * sg_s32TMTCMotionGain + 25) / 50;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    if (u32YMotionGain > 31)
    {
        u32YMotionGain = 31;
    }

    if (u32CMotionGain > 31)
    {
        u32CMotionGain = 31;
    }

    pstVpssReg->VPSS_TNR_REG21.bits.y_mc_gain = u32YMotionGain;
    pstVpssReg->VPSS_TNR_REG21.bits.c_mc_gain = u32CMotionGain;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetTnrDemoModeCoor(HI_U32 u32HandleNo, HI_U32 u32XPos)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    pstVpssReg->VPSS_TNR_CTRL.bits.market_coor = u32XPos;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetTNRBlendingAlphaLut(HI_U32 u32HandleNo)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_0      = sg_YBlendingAlphaLut[0];
    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_1      = sg_YBlendingAlphaLut[1];
    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_2      = sg_YBlendingAlphaLut[2];
    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_3      = sg_YBlendingAlphaLut[3];
    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_4      = sg_YBlendingAlphaLut[4];
    pstVpssReg->VPSS_TNR_REG37.bits.y_blending_alpha_lut_5      = sg_YBlendingAlphaLut[5];

    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_6      = sg_YBlendingAlphaLut[6];
    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_7      = sg_YBlendingAlphaLut[7];
    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_8      = sg_YBlendingAlphaLut[8];
    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_9      = sg_YBlendingAlphaLut[9];
    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_10     = sg_YBlendingAlphaLut[10];
    pstVpssReg->VPSS_TNR_REG38.bits.y_blending_alpha_lut_11     = sg_YBlendingAlphaLut[11];

    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_12     = sg_YBlendingAlphaLut[12];
    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_13     = sg_YBlendingAlphaLut[13];
    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_14     = sg_YBlendingAlphaLut[14];
    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_15     = sg_YBlendingAlphaLut[15];
    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_16     = sg_YBlendingAlphaLut[16];
    pstVpssReg->VPSS_TNR_REG39.bits.y_blending_alpha_lut_17     = sg_YBlendingAlphaLut[17];

    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_18     = sg_YBlendingAlphaLut[18];
    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_19     = sg_YBlendingAlphaLut[19];
    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_20     = sg_YBlendingAlphaLut[20];
    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_21     = sg_YBlendingAlphaLut[21];
    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_22     = sg_YBlendingAlphaLut[22];
    pstVpssReg->VPSS_TNR_REG40.bits.y_blending_alpha_lut_23     = sg_YBlendingAlphaLut[23];

    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_24     = sg_YBlendingAlphaLut[24];
    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_25     = sg_YBlendingAlphaLut[25];
    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_26     = sg_YBlendingAlphaLut[26];
    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_27     = sg_YBlendingAlphaLut[27];
    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_28     = sg_YBlendingAlphaLut[28];
    pstVpssReg->VPSS_TNR_REG41.bits.y_blending_alpha_lut_29     = sg_YBlendingAlphaLut[29];

    pstVpssReg->VPSS_TNR_REG42.bits.y_blending_alpha_lut_30     = sg_YBlendingAlphaLut[30];
    pstVpssReg->VPSS_TNR_REG42.bits.y_blending_alpha_lut_31     = sg_YBlendingAlphaLut[31];

    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_0      = sg_CBlendingAlphaLut[0];
    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_1      = sg_CBlendingAlphaLut[1];
    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_2      = sg_CBlendingAlphaLut[2];
    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_3      = sg_CBlendingAlphaLut[3];
    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_4      = sg_CBlendingAlphaLut[4];
    pstVpssReg->VPSS_TNR_REG43.bits.c_blending_alpha_lut_5      = sg_CBlendingAlphaLut[5];

    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_6      = sg_CBlendingAlphaLut[6];
    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_7      = sg_CBlendingAlphaLut[7];
    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_8      = sg_CBlendingAlphaLut[8];
    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_9      = sg_CBlendingAlphaLut[9];
    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_10     = sg_CBlendingAlphaLut[10];
    pstVpssReg->VPSS_TNR_REG44.bits.c_blending_alpha_lut_11     = sg_CBlendingAlphaLut[11];

    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_12     = sg_CBlendingAlphaLut[12];
    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_13     = sg_CBlendingAlphaLut[13];
    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_14     = sg_CBlendingAlphaLut[14];
    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_15     = sg_CBlendingAlphaLut[15];
    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_16     = sg_CBlendingAlphaLut[16];
    pstVpssReg->VPSS_TNR_REG45.bits.c_blending_alpha_lut_17     = sg_CBlendingAlphaLut[17];

    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_18     = sg_CBlendingAlphaLut[18];
    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_19     = sg_CBlendingAlphaLut[19];
    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_20     = sg_CBlendingAlphaLut[20];
    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_21     = sg_CBlendingAlphaLut[21];
    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_22     = sg_CBlendingAlphaLut[22];
    pstVpssReg->VPSS_TNR_REG46.bits.c_blending_alpha_lut_23     = sg_CBlendingAlphaLut[23];

    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_24     = sg_CBlendingAlphaLut[24];
    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_25     = sg_CBlendingAlphaLut[25];
    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_26     = sg_CBlendingAlphaLut[26];
    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_27     = sg_CBlendingAlphaLut[27];
    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_28     = sg_CBlendingAlphaLut[28];
    pstVpssReg->VPSS_TNR_REG47.bits.c_blending_alpha_lut_29     = sg_CBlendingAlphaLut[29];

    pstVpssReg->VPSS_TNR_REG48.bits.c_blending_alpha_lut_30     = sg_CBlendingAlphaLut[30];
    pstVpssReg->VPSS_TNR_REG48.bits.c_blending_alpha_lut_31     = sg_CBlendingAlphaLut[31];

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_ResetTnrStatus(HI_U32 u32HandleNo, ALG_TNR_S *pstPQTNRInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut)
{
    TNR_DEMO_MODE_E enDemoMode = TNR_DEMO_ENABLE_L;
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPQTNRInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssAlgRegOut);

    /* en ctrl */
    pstVpssAlgRegOut->VPSS_TNR_REG35.bits.nr_en    = pstPQTNRInfo->bEnable;
    pstVpssAlgRegOut->VPSS_TNR_REG35.bits.y_tnr_en = pstPQTNRInfo->bEnable;
    pstVpssAlgRegOut->VPSS_TNR_REG35.bits.c_tnr_en = pstPQTNRInfo->bEnable;

    /* ccs_3d follow tnr */
    pstVpssAlgRegOut->VPSS_TNR_CTRL.bits.ccs_3d_en = pstPQTNRInfo->bEnable;
    /* cls_3d follow tnr */
    pstVpssAlgRegOut->VPSS_TNR_CTRL.bits.cls_3d_en = pstPQTNRInfo->bEnable;

    /* demo ctrl */
    pstVpssAlgRegOut->VPSS_TNR_CTRL.bits.market_mode_en = pstPQTNRInfo->bDemoEnable;
    enDemoMode = (pstPQTNRInfo->eDemoMode == PQ_DEMO_ENABLE_L) ? TNR_DEMO_ENABLE_L : TNR_DEMO_ENABLE_R;
    pstVpssAlgRegOut->VPSS_TNR_CTRL.bits.market_mode = enDemoMode;
    pstVpssAlgRegOut->VPSS_TNR_CTRL.bits.market_coor = pstPQTNRInfo->u32DemoPos;

    /* strength ctrl */

    pstVpssAlgRegOut->VPSS_TNR_REG21.bits.y_mc_gain = CLIP3(((100 - pstPQTNRInfo->u32Strength) * sg_s32TMTYMotionGain + 25) / 50, 0, 31);
    pstVpssAlgRegOut->VPSS_TNR_REG21.bits.c_mc_gain = CLIP3(((100 - pstPQTNRInfo->u32Strength) * sg_s32TMTCMotionGain + 25) / 50, 0, 31);

    return HI_SUCCESS;
}

