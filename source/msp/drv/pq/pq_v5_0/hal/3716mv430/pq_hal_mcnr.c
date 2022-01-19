/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_mcnr.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016/07/18
  Description   :

******************************************************************************/
#include "pq_hal_mcnr.h"
#include "hi_math.h"

HI_S32 PQ_HAL_UpdateTnrSoftReg(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, TNR_OUTPUT_REG_S *pstTnrOutReg)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstTnrOutReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut);

    /* 是否需要增加强度调整的参数配置 */
    pstVpssAlgRegOut->VPSS_TNR_REG2.bits.alpha1                        = pstTnrOutReg->u8MDAlpha1;
    pstVpssAlgRegOut->VPSS_TNR_REG3.bits.alpha2                        = pstTnrOutReg->u8MDAlpha2;
    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.y_md_gain                    = pstTnrOutReg->u8MDYGain;
    pstVpssAlgRegOut->VPSS_TNR_REG22.bits.y_md_core                    = pstTnrOutReg->s8MDYCore;
    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.c_md_gain                    = pstTnrOutReg->u8MDCGain;
    pstVpssAlgRegOut->VPSS_TNR_REG22.bits.c_md_core                    = pstTnrOutReg->s8MDCCore;

    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.discard_smv_x_en             = pstTnrOutReg->bMEDiscardSMVXEn;
    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.discard_smv_y_en             = pstTnrOutReg->bMEDiscardSMVYEn;
    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.smv_x_thd                    = pstTnrOutReg->u8MESMVXThd;
    pstVpssAlgRegOut->VPSS_TNR_REG14.bits.smv_y_thd                    = pstTnrOutReg->u8MESMVYThd;

    pstVpssAlgRegOut->VPSS_TNR_REG15.bits.mag_pnl_gain_xmv             = pstTnrOutReg->s32MEMagPnlGainXMV;
    pstVpssAlgRegOut->VPSS_TNR_REG15.bits.mag_pnl_core_xmv             = pstTnrOutReg->s32MEMagPnlCoreXMV;
    pstVpssAlgRegOut->VPSS_TNR_REG15.bits.mag_pnl_gain_0mv             = pstTnrOutReg->s32MEMagPnlGain0MV;
    pstVpssAlgRegOut->VPSS_TNR_REG15.bits.mag_pnl_core_0mv             = pstTnrOutReg->s32MEMagPnlCore0MV;

    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.std_pnl_gain                 = pstTnrOutReg->s32MEStdPnlGain;
    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.std_pnl_core                 = pstTnrOutReg->s32MEStdPnlCore;

    pstVpssAlgRegOut->VPSS_TNR_REG18.bits.std_pnl_gain_xmv             = pstTnrOutReg->s32MEStdPnlGainXMV;
    pstVpssAlgRegOut->VPSS_TNR_REG18.bits.std_pnl_core_xmv             = pstTnrOutReg->s32MEStdPnlCoreXMV;

    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.std_pnl_gain_0mv             = pstTnrOutReg->s32MEStdPnlGain0MV;
    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.std_pnl_core_0mv             = pstTnrOutReg->s32MEStdPnlCore0MV;
    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.std_core_xmv                 = pstTnrOutReg->s32MEStdCoreXMV;
    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.std_core_0mv                 = pstTnrOutReg->s32MEStdCore0MV;

    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.adj_xmv_max                  = pstTnrOutReg->s32MEAdjXMVMax;
    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.adj_xmv_min                  = pstTnrOutReg->s32MEAdjXMVMin;
    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.adj_0mv_max                  = pstTnrOutReg->s32MEAdj0MVMax;
    pstVpssAlgRegOut->VPSS_TNR_REG16.bits.adj_0mv_min                  = pstTnrOutReg->s32MEAdj0MVMin;

    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.adj_mv_max                   = pstTnrOutReg->u8MEAdjMVMax;
    pstVpssAlgRegOut->VPSS_TNR_REG17.bits.adj_mv_min                   = pstTnrOutReg->u8MEAdjMVMin;

    pstVpssAlgRegOut->VPSS_TNR_REG18.bits.gm_adj                       = pstTnrOutReg->u8MEGMAdj;

    pstVpssAlgRegOut->VPSS_TNR_REG21.bits.y_mc_gain                    = pstTnrOutReg->u8MCYGain;
    pstVpssAlgRegOut->VPSS_TNR_REG21.bits.y_mc_core                    = pstTnrOutReg->s8MCYCore;
    pstVpssAlgRegOut->VPSS_TNR_REG21.bits.c_mc_gain                    = pstTnrOutReg->u8MCCGain;

    pstVpssAlgRegOut->VPSS_TNR_REG22.bits.c_mc_core                    = pstTnrOutReg->s8MCCCore;

    pstVpssAlgRegOut->VPSS_TNR_REG20.bits.scene_change_val             = pstTnrOutReg->u8SCDVal;
    pstVpssAlgRegOut->VPSS_TNR_REG22.bits.saltus_level                 = pstTnrOutReg->u8SaltusLevel;

    pstVpssAlgRegOut->VPSS_TNR_REG35.bits.global_motion                = pstTnrOutReg->s8GlobalMotion;
    pstVpssAlgRegOut->VPSS_TNR_REG35.bits.noise_level                  = pstTnrOutReg->s8NoiseLevel;


    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_0       = pstTnrOutReg->au8TFYBlendingAlphaLut[0];
    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_1       = pstTnrOutReg->au8TFYBlendingAlphaLut[1];
    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_2       = pstTnrOutReg->au8TFYBlendingAlphaLut[2];
    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_3       = pstTnrOutReg->au8TFYBlendingAlphaLut[3];
    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_4       = pstTnrOutReg->au8TFYBlendingAlphaLut[4];
    pstVpssAlgRegOut->VPSS_TNR_REG37.bits.y_blending_alpha_lut_5       = pstTnrOutReg->au8TFYBlendingAlphaLut[5];

    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_6       = pstTnrOutReg->au8TFYBlendingAlphaLut[6];
    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_7       = pstTnrOutReg->au8TFYBlendingAlphaLut[7];
    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_8       = pstTnrOutReg->au8TFYBlendingAlphaLut[8];
    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_9       = pstTnrOutReg->au8TFYBlendingAlphaLut[9];
    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_10      = pstTnrOutReg->au8TFYBlendingAlphaLut[10];
    pstVpssAlgRegOut->VPSS_TNR_REG38.bits.y_blending_alpha_lut_11      = pstTnrOutReg->au8TFYBlendingAlphaLut[11];

    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_12      = pstTnrOutReg->au8TFYBlendingAlphaLut[12];
    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_13      = pstTnrOutReg->au8TFYBlendingAlphaLut[13];
    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_14      = pstTnrOutReg->au8TFYBlendingAlphaLut[14];
    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_15      = pstTnrOutReg->au8TFYBlendingAlphaLut[15];
    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_16      = pstTnrOutReg->au8TFYBlendingAlphaLut[16];
    pstVpssAlgRegOut->VPSS_TNR_REG39.bits.y_blending_alpha_lut_17      = pstTnrOutReg->au8TFYBlendingAlphaLut[17];

    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_18      = pstTnrOutReg->au8TFYBlendingAlphaLut[18];
    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_19      = pstTnrOutReg->au8TFYBlendingAlphaLut[19];
    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_20      = pstTnrOutReg->au8TFYBlendingAlphaLut[20];
    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_21      = pstTnrOutReg->au8TFYBlendingAlphaLut[21];
    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_22      = pstTnrOutReg->au8TFYBlendingAlphaLut[22];
    pstVpssAlgRegOut->VPSS_TNR_REG40.bits.y_blending_alpha_lut_23      = pstTnrOutReg->au8TFYBlendingAlphaLut[23];

    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_24      = pstTnrOutReg->au8TFYBlendingAlphaLut[24];
    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_25      = pstTnrOutReg->au8TFYBlendingAlphaLut[25];
    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_26      = pstTnrOutReg->au8TFYBlendingAlphaLut[26];
    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_27      = pstTnrOutReg->au8TFYBlendingAlphaLut[27];
    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_28      = pstTnrOutReg->au8TFYBlendingAlphaLut[28];
    pstVpssAlgRegOut->VPSS_TNR_REG41.bits.y_blending_alpha_lut_29      = pstTnrOutReg->au8TFYBlendingAlphaLut[29];

    pstVpssAlgRegOut->VPSS_TNR_REG42.bits.y_blending_alpha_lut_30      = pstTnrOutReg->au8TFYBlendingAlphaLut[30];
    pstVpssAlgRegOut->VPSS_TNR_REG42.bits.y_blending_alpha_lut_31      = pstTnrOutReg->au8TFYBlendingAlphaLut[31];

    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_0       = pstTnrOutReg->au8TFCBlendingAlphaLut[0];
    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_1       = pstTnrOutReg->au8TFCBlendingAlphaLut[1];
    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_2       = pstTnrOutReg->au8TFCBlendingAlphaLut[2];
    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_3       = pstTnrOutReg->au8TFCBlendingAlphaLut[3];
    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_4       = pstTnrOutReg->au8TFCBlendingAlphaLut[4];
    pstVpssAlgRegOut->VPSS_TNR_REG43.bits.c_blending_alpha_lut_5       = pstTnrOutReg->au8TFCBlendingAlphaLut[5];

    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_6       = pstTnrOutReg->au8TFCBlendingAlphaLut[6];
    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_7       = pstTnrOutReg->au8TFCBlendingAlphaLut[7];
    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_8       = pstTnrOutReg->au8TFCBlendingAlphaLut[8];
    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_9       = pstTnrOutReg->au8TFCBlendingAlphaLut[9];
    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_10      = pstTnrOutReg->au8TFCBlendingAlphaLut[10];
    pstVpssAlgRegOut->VPSS_TNR_REG44.bits.c_blending_alpha_lut_11      = pstTnrOutReg->au8TFCBlendingAlphaLut[11];

    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_12      = pstTnrOutReg->au8TFCBlendingAlphaLut[12];
    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_13      = pstTnrOutReg->au8TFCBlendingAlphaLut[13];
    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_14      = pstTnrOutReg->au8TFCBlendingAlphaLut[14];
    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_15      = pstTnrOutReg->au8TFCBlendingAlphaLut[15];
    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_16      = pstTnrOutReg->au8TFCBlendingAlphaLut[16];
    pstVpssAlgRegOut->VPSS_TNR_REG45.bits.c_blending_alpha_lut_17      = pstTnrOutReg->au8TFCBlendingAlphaLut[17];

    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_18      = pstTnrOutReg->au8TFCBlendingAlphaLut[18];
    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_19      = pstTnrOutReg->au8TFCBlendingAlphaLut[19];
    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_20      = pstTnrOutReg->au8TFCBlendingAlphaLut[20];
    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_21      = pstTnrOutReg->au8TFCBlendingAlphaLut[21];
    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_22      = pstTnrOutReg->au8TFCBlendingAlphaLut[22];
    pstVpssAlgRegOut->VPSS_TNR_REG46.bits.c_blending_alpha_lut_23      = pstTnrOutReg->au8TFCBlendingAlphaLut[23];

    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_24      = pstTnrOutReg->au8TFCBlendingAlphaLut[24];
    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_25      = pstTnrOutReg->au8TFCBlendingAlphaLut[25];
    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_26      = pstTnrOutReg->au8TFCBlendingAlphaLut[26];
    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_27      = pstTnrOutReg->au8TFCBlendingAlphaLut[27];
    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_28      = pstTnrOutReg->au8TFCBlendingAlphaLut[28];
    pstVpssAlgRegOut->VPSS_TNR_REG47.bits.c_blending_alpha_lut_29      = pstTnrOutReg->au8TFCBlendingAlphaLut[29];

    pstVpssAlgRegOut->VPSS_TNR_REG48.bits.c_blending_alpha_lut_30      = pstTnrOutReg->au8TFCBlendingAlphaLut[30];
    pstVpssAlgRegOut->VPSS_TNR_REG48.bits.c_blending_alpha_lut_31      = pstTnrOutReg->au8TFCBlendingAlphaLut[31];

    pstVpssRegInfo->pstVpssAlgRegOut = (HI_VOID *)pstVpssAlgRegOut;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_UpdateSpecialPara(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut);

    if (pstPqFrameInfo->u32Height == 576)
    {
        pstVpssAlgRegOut->VPSS_TNR_REG49.bits.video_type = 0;
    }
    else
    {
        pstVpssAlgRegOut->VPSS_TNR_REG49.bits.video_type = 1;
    }

    pstVpssRegInfo->pstVpssAlgRegOut = (HI_VOID *)pstVpssAlgRegOut;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_UpdateSnrSoftReg(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, SNR_OUTPUT_REG_S *pstSnrParam)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSnrParam);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut->VPSS_SNR_MT.bits.motionalpha           = pstSnrParam->s32MotionAlpha;
    pstVpssAlgRegOut->VPSS_SNR_SCHANGE.bits.scenechange_info = pstSnrParam->s32SceneChange;

    pstVpssRegInfo->pstVpssAlgRegOut = (HI_VOID *)pstVpssAlgRegOut;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetMcnrRegFromRegout(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, MCNR_REG_OUT_S *pstRegOut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstRegOut);

    /* update nr reg    统一配置 */
    PQ_HAL_UpdateTnrSoftReg(u32HandleNo, pstVpssRegInfo, &(pstRegOut->stOutTnrReg));
    PQ_HAL_UpdateSnrSoftReg(u32HandleNo, pstVpssRegInfo, &(pstRegOut->stOutSnrReg));

    return HI_SUCCESS;
}

