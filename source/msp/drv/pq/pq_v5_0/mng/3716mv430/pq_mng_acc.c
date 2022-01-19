/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_acc.c
  Version       : Initial Draft
  Author        :
  Created       : 2016/09/23
  Description   :

******************************************************************************/
#include "hi_math.h"
#include "pq_mng_acc.h"
#include "pq_hal_acc.h"

static ALG_ACC_S sg_stPQACCInfo;
static PQ_PARAM_S *sg_pstPqParamAcc  = HI_NULL;
#if 0
static HI_S32 sg_au32ToolAccLut[ACC_TABLE_LEVEL_MAX *ACC_TABLE_LEVEL_PARA] =
{
    0, 139, 279, 414, 549, 647, 793, 911, 1023, //LowTable
    0, 109, 226, 362, 511, 665, 804, 917, 1023, //MidTable
    0, 114, 236, 356, 484, 614, 771, 911, 1023, //HighTable
};
#else

static HI_S32 sg_au32ToolAccLut[ACC_TABLE_LEVEL_MAX *ACC_TABLE_LEVEL_PARA] =
{
    0, 150, 302, 444, 586, 654, 818, 926, 1023, //LowTable
    0, 90, 196, 340, 510, 690, 840, 938, 1023, //MidTable
    0, 114, 236, 356, 484, 614, 771, 911, 1023, //HighTable
};
#endif
static HI_S32 sg_au32AccBasic[ACC_TABLE_LEVEL_MAX *ACC_TABLE_LEVEL_PARA] =
{
    0, 128, 256, 384, 512, 640, 768, 896, 1023,
    0, 128, 256, 384, 512, 640, 768, 896, 1023,
    0, 128, 256, 384, 512, 640, 768, 896, 1023,
};

HI_S32 PQ_MNG_SetAccLevel(HI_U32 u32ACCLevel);

static HI_S32 PQ_MNG_ACCParaInit(HI_BOOL bDefault)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PQ_HAL_ACC_PARA_S stAccPara;

    stAccPara.stAccCfg.acc_en       = HI_TRUE;
    stAccPara.stAccCfg.acc_mode     = HI_FALSE;
    stAccPara.stAccCfg.acc_dbg_mode = HI_TRUE;
    stAccPara.stAccCfg.acc_dbg_en   = HI_FALSE;
    stAccPara.stAccCfg.acc_rst      = HI_FALSE;

    stAccPara.thd_med_low   = 280;
    stAccPara.thd_high      = 620;
    stAccPara.thd_low       = 400;
    stAccPara.thd_med_high  = 740;

    s32Ret = PQ_HAL_SetAccPara(PQ_HAL_LAYER_VID0, stAccPara);

    return s32Ret;
}

static HI_VOID PQ_MNG_ACCLutInit(PQ_PARAM_S *pstPqParam, HI_BOOL bDefault)
{
    HI_S32 s32BinSum = 0;
    HI_U32 i = 0, j = 0;
    PQ_CHECK_NULL_PTR_RE_NULL(pstPqParam);

    sg_pstPqParamAcc = pstPqParam;

    /* step 1 : check pq bin data : all zero means no effective para from bin */
    /* check pq bin data */
    for (i = 0; i < ACC_TABLE_LEVEL_MAX; i++)
    {
        for (j = 0; j < ACC_TABLE_LEVEL_PARA; j++)
        {
            s32BinSum += sg_pstPqParamAcc->stPQCoef.stACCCoef.as32AccLut[i][j];
        }
    }

    /* step 2 : para use from bin or code */
    /*
        1.use bin para : if bin para not all zero
        2.use code para : if bin para all zero or no bin exist
    */
    if ((HI_TRUE != bDefault) && (0 != s32BinSum))
    {
        memcpy(&sg_au32ToolAccLut, pstPqParam->stPQCoef.stACCCoef.as32AccLut, sizeof(PQ_ACC_LUT_S));
    }

    return ;

}

HI_S32 PQ_MNG_GetACCHistgram(HI_PQ_ACC_HISTGRAM_S *pstACCHist)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstACCHist);

    s32Ret = PQ_HAL_GetACCHistgram((ACC_HISTGRAM_S *)pstACCHist);

    return s32Ret;
}

HI_S32 PQ_MNG_InitACC(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (HI_TRUE == sg_stPQACCInfo.bInit)
    {
        return HI_SUCCESS;
    }

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqParam);

    sg_stPQACCInfo.bEnable        = HI_TRUE;
    sg_stPQACCInfo.u32Strength    = 50;
    /*sg_stPQACCInfo.bHdrProcessEn  = HI_FALSE;*/
    sg_stPQACCInfo.bDemoEnable    = HI_FALSE;
    sg_stPQACCInfo.eDemoMode      = PQ_DEMO_ENABLE_R;

    s32Ret = PQ_MNG_ACCParaInit(bParaUseTableDefault);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_MNG_ACCParaInit error!\n");
        sg_stPQACCInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }

    s32Ret = PQ_TABLE_InitPhyList(HI_PQ_VDP_LAYER_VID_HD0, HI_PQ_MODULE_DCI, PQ_SOURCE_MODE_NO, PQ_OUTPUT_MODE_NO);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("DCI InitPhyList error\n");
        sg_stPQACCInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }

    PQ_MNG_ACCLutInit(pstPqParam, bParaUseTableDefault);

    PQ_MNG_SetAccLevel(50);

    sg_stPQACCInfo.bInit = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitACC(HI_VOID)
{
    if (HI_FALSE == sg_stPQACCInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQACCInfo.bInit = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetACCEn(HI_U32 *pu32OnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32OnOff);

    *pu32OnOff = sg_stPQACCInfo.bEnable;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetACCEn(HI_BOOL bOnOff)
{
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();
    HI_BOOL bAccEn = HI_TRUE;

    if ((enSourceMode < PQ_SOURCE_MODE_BUTT)
        && (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_DCI, enSourceMode)))
    {
        bAccEn = HI_FALSE;
    }

    sg_stPQACCInfo.bEnable = bOnOff & bAccEn;
    /*HI_ERR_PQ("%#d %#d\n",bOnOff,sg_stPQACCInfo.bEnable);*/

    PQ_HAL_SetAccAccEn(PQ_HAL_LAYER_VID0, sg_stPQACCInfo.bEnable);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetACCDemoEn(HI_BOOL bOnOff)
{
    /* acc demo off for only support 50% pos */
    sg_stPQACCInfo.bDemoEnable = bOnOff;

    PQ_HAL_SetAccDemoEn(PQ_HAL_LAYER_VID0, bOnOff);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetACCDemoEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQACCInfo.bDemoEnable;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetACCDemoMode(PQ_DEMO_MODE_E enMode)
{
    sg_stPQACCInfo.eDemoMode = enMode;

    PQ_HAL_SetAccDemoMode(PQ_HAL_LAYER_VID0, enMode);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetACCDemoMode(PQ_DEMO_MODE_E *penMode)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(penMode);

    *penMode = sg_stPQACCInfo.eDemoMode;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetACCDemoPos (HI_U32 u32XPos)
{
    HI_S32 s32Ret = HI_SUCCESS;

    sg_stPQACCInfo.u32DemoPos = u32XPos;

    PQ_HAL_SetAccDemoPos(PQ_HAL_LAYER_VID0, u32XPos);

    return s32Ret;
}

HI_S32 PQ_MNG_GetAccLevel(HI_U32 *pu32ACCLevel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32ACCLevel);

    *pu32ACCLevel = sg_stPQACCInfo.u32Strength;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetAccLevel(HI_U32 u32ACCLevel)
{
    HI_U32 i;
    HI_U32 au32AccTable[ACC_TABLE_LEVEL_MAX * ACC_TABLE_LEVEL_PARA] = {0};
    HI_S32 s32TmpTableDate = 0;
    HI_S32 s32Ret = HI_SUCCESS;

    if (u32ACCLevel > 100)
    {
        HI_ERR_PQ("%d:ACC Level is over range!\n", u32ACCLevel);
        return HI_FAILURE;
    }

    sg_stPQACCInfo.u32Strength = u32ACCLevel;

    for (i = 0; i < ACC_TABLE_LEVEL_MAX * ACC_TABLE_LEVEL_PARA; i++)
    {
        if ( u32ACCLevel < 50)
        {
            s32TmpTableDate = sg_au32AccBasic[i] + (sg_au32ToolAccLut[i] - sg_au32AccBasic[i]) * (HI_S32)u32ACCLevel / 50;
        }
        else
        {
            s32TmpTableDate = (sg_au32ToolAccLut[i] + (sg_au32ToolAccLut[i] - sg_au32AccBasic[i]) * ((HI_S32)u32ACCLevel - 50) / 50);
        }

        au32AccTable[i] = CLIP3(s32TmpTableDate, 0, 1023);
    }

    s32Ret = PQ_HAL_SetAccTab(PQ_HAL_LAYER_VID0,  au32AccTable);

    return s32Ret;
}

HI_S32 PQ_MNG_SetToolACCLut(PQ_ACC_LUT_S *pstACCLut)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstACCLut);
    PQ_CHECK_NULL_PTR_RE_FAIL(sg_pstPqParamAcc);

    memcpy((HI_VOID *)(sg_pstPqParamAcc->stPQCoef.stACCCoef.as32AccLut), (HI_VOID *)pstACCLut, sizeof(PQ_ACC_LUT_S));

    memcpy((HI_VOID *)sg_au32ToolAccLut, (HI_VOID *)pstACCLut, sizeof(PQ_ACC_LUT_S));

    s32Ret = PQ_MNG_SetAccLevel(sg_stPQACCInfo.u32Strength);

    return s32Ret;
}

HI_S32 PQ_MNG_GetToolACCLut(PQ_ACC_LUT_S *pstACCLut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstACCLut);
    PQ_CHECK_NULL_PTR_RE_FAIL(sg_pstPqParamAcc);

    memcpy((HI_VOID *)pstACCLut, (HI_VOID *)sg_au32ToolAccLut, sizeof(PQ_ACC_LUT_S));

    return HI_SUCCESS;
}

static stPQAlgFuncs stACCFuncs =
{
    .Init               = PQ_MNG_InitACC,
    .DeInit             = PQ_MNG_DeInitACC,
    .SetEnable          = PQ_MNG_SetACCEn,
    .GetEnable          = PQ_MNG_GetACCEn,
    .SetDemo            = PQ_MNG_SetACCDemoEn,
    .GetDemo            = PQ_MNG_GetACCDemoEn,
    .SetDemoMode        = PQ_MNG_SetACCDemoMode,
    .GetDemoMode        = PQ_MNG_GetACCDemoMode,
    .SetDemoModeCoor    = PQ_MNG_SetACCDemoPos,
    .SetStrength        = PQ_MNG_SetAccLevel,
    .GetStrength        = PQ_MNG_GetAccLevel,
    .GetACCHistGram     = PQ_MNG_GetACCHistgram,
};

HI_S32 PQ_MNG_RegisterACC(PQ_REG_TYPE_E enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_DCI, enType, PQ_BIN_ADAPT_SINGLE, "acc", HI_NULL, &stACCFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterACC(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_DCI);

    return s32Ret;
}

