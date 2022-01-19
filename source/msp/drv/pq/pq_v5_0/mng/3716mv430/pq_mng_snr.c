/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_snr.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2015/10/19
  Description   :

******************************************************************************/
#include "hi_drv_mem.h"
#include "drv_pq_table.h"
#include "pq_hal_comm.h"
#include "pq_mng_snr.h"

static ALG_SNR_S sg_stPQSNRInfo;
static PQ_PARAM_S *sg_pstPqParamSnr  = HI_NULL;
static HI_PQ_SNR_MOTIONEDGE_LUT_S sg_stToolSnrMotionLut =
{
    {
        { 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  7},
        { 0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7},
        { 0,  0,  0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8},
        { 0,  0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9},
        { 0,  0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10},
        { 0,  0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11},
        { 0,  0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12},
        { 0,  0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13},
        { 0,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14},
        { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15},
        { 1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 15},
        { 2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 15, 15},
        { 3,  4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 15, 15, 15},
        { 4,  5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 15, 15, 15, 15},
        { 5,  6,  7,  8,  9,  10, 11, 12, 13, 14, 15, 15, 15, 15, 15, 15},
        { 6,  7,  8,  9, 10,  11, 12, 13, 14, 15, 15, 15, 15, 15, 15, 15}
    },
};//SNRMotionEdgeLut

static HI_VOID PQ_MNG_InitSnrMotionEdge(PQ_PARAM_S *pstPqParam, HI_BOOL bDefault)
{
    HI_S32 s32BinSum = 0;
    HI_U32 i = 0, j = 0;
    PQ_CHECK_NULL_PTR_RE_NULL(pstPqParam);

    sg_pstPqParamSnr = pstPqParam;

    /* step 1 : check pq bin data : all zero means no effective para from bin */
    /* check pq bin data */
    for (i = 0; i < 16; i++)
    {
        for (j = 0; j < 16; j++)
        {
            s32BinSum += sg_pstPqParamSnr->stPQCoef.stSnrMotionCoef.as32MotionedgeLut[i][j];
        }
    }

    /* step 2 : para use from bin or code */
    /*
        1.use bin para : if bin para not all zero
        2.use code para : if bin para all zero or no bin exist
    */
    if ((HI_TRUE != bDefault) && (0 != s32BinSum))
    {
        memcpy(&sg_stToolSnrMotionLut, pstPqParam->stPQCoef.stSnrMotionCoef.as32MotionedgeLut, sizeof(HI_PQ_SNR_MOTIONEDGE_LUT_S));
    }

    return ;
}


HI_S32 PQ_MNG_InitSnr(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    /*HI_S32 s32Ret = HI_SUCCESS;*/
    HI_U32 u32HandleNo = 0;

    if (HI_TRUE == sg_stPQSNRInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQSNRInfo.bEnable      = HI_TRUE;
    sg_stPQSNRInfo.u32Strength  = 50;
    sg_stPQSNRInfo.bDemoEnable  = HI_FALSE;
    sg_stPQSNRInfo.eDemoMode    = PQ_DEMO_ENABLE_R;

    /*s32Ret = PQ_HAL_SetSNRCbCrLut(u32HandleNo);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("SetSNRCbCrLut error!\n");
        sg_stPQSNRInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }*/

    /*s32Ret = PQ_HAL_SetSNRMotionEdgeLut(u32HandleNo, 1920);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("SetSNRCbCrLut error!\n");
        sg_stPQSNRInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }*/

    PQ_TABLE_InitPhyList(u32HandleNo, HI_PQ_MODULE_SNR, PQ_SOURCE_MODE_NO, PQ_OUTPUT_MODE_NO);

    PQ_HAL_SetSNRRatioMap(u32HandleNo);

    PQ_MNG_InitSnrMotionEdge(pstPqParam, bParaUseTableDefault);

    sg_stPQSNRInfo.bInit = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitSnr(HI_VOID)
{
    if (HI_FALSE == sg_stPQSNRInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQSNRInfo.bInit = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetSnrEn(HI_BOOL bOnOff)
{
    HI_U32 u32HandleNo;
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();

    if ((enSourceMode > PQ_SOURCE_MODE_HD)
        || (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_SNR, enSourceMode)))
    {
        bOnOff = HI_FALSE;
    }

    sg_stPQSNRInfo.bEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            PQ_HAL_EnableSNR(u32HandleNo, bOnOff);
        }
    }

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_GetSnrEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQSNRInfo.bEnable;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetSnrDemoEn(HI_BOOL bOnOff)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNo;

    sg_stPQSNRInfo.bDemoEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_EnableSNRDemo(u32HandleNo, bOnOff);
        }
    }

    return s32Ret;
}


HI_S32 PQ_MNG_GetSnrDemoEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQSNRInfo.bDemoEnable;

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_SetSnrDemoMode(PQ_DEMO_MODE_E enMode)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNo;

    sg_stPQSNRInfo.eDemoMode = enMode;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_SetSNRDemoMode(u32HandleNo, (SNR_DEMO_MODE_E)enMode);
        }
    }


    return s32Ret;
}


HI_S32 PQ_MNG_GetSnrDemoMode(PQ_DEMO_MODE_E *penMode)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(penMode);

    *penMode = sg_stPQSNRInfo.eDemoMode;

    return HI_SUCCESS;
}

/* Set Snr Strengh; s32SnrStr  Snr Strengh[0,100] */
HI_S32 PQ_MNG_SetSnrStrength(HI_U32 u32SnrStr)
{
    HI_U32 u32HandleNo;
    HI_S32 s32Ret = HI_SUCCESS;

    if (u32SnrStr > 100)
    {
        HI_ERR_PQ("the value[%d] of setting SNR strength is out of range!\n", u32SnrStr);
        return HI_FAILURE;
    }

    sg_stPQSNRInfo.u32Strength = u32SnrStr;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_SetSnrStr(u32HandleNo, u32SnrStr);
        }
    }


    return s32Ret;
}


/* Get Snr Strengh ; s32SnrStr Strengh[0,100] */
HI_S32 PQ_MNG_GetSnrStrength(HI_U32 *pu32SnrStr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32SnrStr);

    *pu32SnrStr = sg_stPQSNRInfo.u32Strength;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetSnrDemoModeCoor (HI_U32 u32XPos)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNo;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_SetSnrDemoModeCoor(u32HandleNo, u32XPos);
        }
    }


    return s32Ret;
}

HI_S32 PQ_MNG_SetSNRCbCrLut (HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNo;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_SetSNRCbCrLut(u32HandleNo);
        }
    }

    return s32Ret;
}

HI_S32 PQ_MNG_SetSNRMotionEdgeLut (HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_HAL_SetSNRMotionEdgeLut(pstPqFrameInfo, &sg_stToolSnrMotionLut, pstVpssRegInfo);

    return s32Ret;
}

HI_S32 PQ_MNG_ResetSnrStatus(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32 s32Ret         = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    s32Ret = PQ_HAL_ResetSnrStatus(pstPqFrameInfo->u32HandleNo, &sg_stPQSNRInfo, (S_VPSSIP_ALG_SET_REGS_TYPE *) (pstVpssRegInfo->pstVpssAlgRegOut));

    return s32Ret;
}

HI_S32 PQ_MNG_SetToolSnrMotiongLut(HI_PQ_SNR_MOTIONEDGE_LUT_S *pstLut)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstLut);
    PQ_CHECK_NULL_PTR_RE_FAIL(sg_pstPqParamSnr);

    memcpy((HI_VOID *)(sg_pstPqParamSnr->stPQCoef.stSnrMotionCoef.as32MotionedgeLut), (HI_VOID *)pstLut,
           sizeof(HI_PQ_SNR_MOTIONEDGE_LUT_S));

    memcpy((HI_VOID *)sg_stToolSnrMotionLut.as32MotionedgeLut, (HI_VOID *)pstLut, sizeof(HI_PQ_SNR_MOTIONEDGE_LUT_S));

    s32Ret = HI_SUCCESS;

    return s32Ret;
}

HI_S32 PQ_MNG_GetToolSnrMotiongLut(HI_PQ_SNR_MOTIONEDGE_LUT_S *pstLut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstLut);
    PQ_CHECK_NULL_PTR_RE_FAIL(sg_pstPqParamSnr);

    memcpy((HI_VOID *)pstLut, (HI_VOID *)sg_stToolSnrMotionLut.as32MotionedgeLut, sizeof(HI_PQ_SNR_MOTIONEDGE_LUT_S));

    return HI_SUCCESS;
}

static stPQAlgFuncs stSNRFuncs =
{
    .Init                = PQ_MNG_InitSnr,
    .DeInit              = PQ_MNG_DeInitSnr,
    .SetEnable           = PQ_MNG_SetSnrEn,
    .GetEnable           = PQ_MNG_GetSnrEn,
    .SetDemo             = PQ_MNG_SetSnrDemoEn,
    .GetDemo             = PQ_MNG_GetSnrDemoEn,
    .SetDemoMode         = PQ_MNG_SetSnrDemoMode,
    .GetDemoMode         = PQ_MNG_GetSnrDemoMode,
    .SetStrength         = PQ_MNG_SetSnrStrength,
    .GetStrength         = PQ_MNG_GetSnrStrength,
    .SetDemoModeCoor     = PQ_MNG_SetSnrDemoModeCoor,

    .ReSetPqStatus      = PQ_MNG_ResetSnrStatus,
    //.SetSNRCbCrLut       = PQ_MNG_SetSNRCbCrLut,
    .SetSNRMotionEdgeLut = PQ_MNG_SetSNRMotionEdgeLut,
};

HI_S32 PQ_MNG_RegisterSNR(PQ_REG_TYPE_E  enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_SNR, enType, PQ_BIN_ADAPT_MULTIPLE, "snr", HI_NULL, &stSNRFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterSNR()
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_SNR);

    return s32Ret;
}

