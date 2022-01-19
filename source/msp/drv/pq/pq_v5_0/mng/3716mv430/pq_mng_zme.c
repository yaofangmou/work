/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_zme.c
  Version       : Initial Draft
  Author        : sdk sdk
  Created       : 2014/04/01
  Author        : sdk sdk
******************************************************************************/
#include "hi_drv_mmz.h"
#include "pq_mng_zme.h"
#include "pq_hal_comm.h"
#include "pq_hal_zme.h"

static ALG_VIDEO_ZME_S sg_stPQVideoZmeInfo = {0};

ALG_VZME_MEM_S g_stVZMEVdpInstance;
ALG_VZME_MEM_S g_stVZMEVdpHZMEInstance; // vo_hpzme, wbc_dhd_hzme
ALG_VZME_MEM_S g_stVZMEVdpVzmeInstance; //wbc_dhd_vzme

HI_S32 PQ_MNG_SetZmeEnMode(PQ_ZME_MODE_E enMode, HI_BOOL bOnOff)
{
    switch (enMode)
    {
        case PQ_ZME_MODE_VDP_FIR:
        {
            sg_stPQVideoZmeInfo.bVdpZmeFirEn = bOnOff;
            PQ_HAL_SetVdpZmeFirEn(bOnOff);
            break;
        }
        case PQ_ZME_MODE_VDP_MED:
        {
            sg_stPQVideoZmeInfo.bVdpZmeMedEn = bOnOff;
            PQ_HAL_SetVdpZmeMedEn(bOnOff);
            break;
        }
        case PQ_ZME_MODE_VPSS_FIR:
        {
            sg_stPQVideoZmeInfo.bVpssZmeFirEn = bOnOff;
            break;
        }
        case PQ_ZME_MODE_VPSS_MED:
        {
            sg_stPQVideoZmeInfo.bVpssZmeMedEn = bOnOff;
            break;
        }
        default:
            break;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetZmeEnMode(PQ_ZME_MODE_E enMode, HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    switch (enMode)
    {
        case PQ_ZME_MODE_VDP_FIR:
            *pbOnOff = sg_stPQVideoZmeInfo.bVdpZmeFirEn;
            break;
        case PQ_ZME_MODE_VDP_MED:
            *pbOnOff = sg_stPQVideoZmeInfo.bVdpZmeMedEn;
            break;
        case PQ_ZME_MODE_VPSS_FIR:
            *pbOnOff = sg_stPQVideoZmeInfo.bVpssZmeFirEn;
            break;
        case PQ_ZME_MODE_VPSS_MED:
            *pbOnOff = sg_stPQVideoZmeInfo.bVpssZmeMedEn;
            break;
        default:
            break;
    }

    return HI_SUCCESS;
}

/* common zme coefficient memory intial; get a static address pointer;
   several zme modules can use one memory block to save coefficient.
   */
static HI_S32 PQ_MNG_VdpV0ZmeComnInit(ALG_VZME_MEM_S *pstVZmeVdpCoefMem)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVZmeVdpCoefMem);

    /* load zme coefficient into the memory */
    PQ_HAL_VdpV0ZmeLoadCoef(pstVZmeVdpCoefMem);

    /* Filter Mode and Median Filter */
    PQ_MNG_SetZmeEnMode(PQ_ZME_MODE_VDP_FIR, HI_TRUE);
    PQ_MNG_SetZmeEnMode(PQ_ZME_MODE_VDP_MED, HI_FALSE);

    return HI_SUCCESS;
}

/*
common zme coefficient memory intial; get a static address pointer;
   several zme modules can use one memory block to save coefficient.
   */
static HI_S32 PQ_MNG_VdpHZmeComnInit(ALG_VZME_MEM_S *pstVZmeVdpCoefMem)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVZmeVdpCoefMem);

    /* load zme coefficient into the memory */
    PQ_HAL_VdpHZmeLoadCoef(pstVZmeVdpCoefMem);

    return HI_SUCCESS;
}

/*
common zme coefficient memory intial; get a static address pointer;
   several zme modules can use one memory block to save coefficient.
   */
static HI_S32 PQ_MNG_VdpVZmeComnInit(ALG_VZME_MEM_S *pstVZmeVdpCoefMem)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVZmeVdpCoefMem);

    /* load zme coefficient into the memory */
    PQ_HAL_VdpWbcDhdVZmeLoadCoef(pstVZmeVdpCoefMem);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_InitVdpZme(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (sg_stPQVideoZmeInfo.bVdpZmeInitFlag)
    {
        return HI_SUCCESS;
    }

    s32Ret = PQ_HAL_MMZ_AllocAndMap("PQ_VdpV0ZmeCoef", HI_NULL, VDP_V0ZME_COEF_SIZE, 16, &g_stVZMEVdpInstance.stMBuf);
    s32Ret |= PQ_HAL_MMZ_AllocAndMap("PQ_VdpHZmeCoef", HI_NULL, VDP_HZME_COEF_SIZE, 16, &g_stVZMEVdpHZMEInstance.stMBuf);
    s32Ret |= PQ_HAL_MMZ_AllocAndMap("PQ_VdpVZmeCoef", HI_NULL, VDP_VZME_COEF_SIZE, 16, &g_stVZMEVdpVzmeInstance.stMBuf);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("Get PQ_VdpZmeCoef MMZ Malloc failed\n");
        sg_stPQVideoZmeInfo.bVdpZmeInitFlag = HI_FALSE;

        return HI_FAILURE;
    }

    /* load Vdp zme coef; Init Vdp Zme Coef */
    s32Ret = PQ_MNG_VdpV0ZmeComnInit(&g_stVZMEVdpInstance);
    s32Ret |= PQ_MNG_VdpHZmeComnInit(&g_stVZMEVdpHZMEInstance);
    s32Ret |= PQ_MNG_VdpVZmeComnInit(&g_stVZMEVdpVzmeInstance);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("PQ_MNG_VdpV0ZmeComnInit failed!\n");
        PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpInstance.stMBuf);
        PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpHZMEInstance.stMBuf);
        PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpVzmeInstance.stMBuf);
        g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr     = HI_NULL;
        g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr = HI_NULL;
        g_stVZMEVdpVzmeInstance.stMBuf.pu8StartVirAddr = HI_NULL;

        sg_stPQVideoZmeInfo.bVdpZmeInitFlag = HI_FALSE;

        return HI_FAILURE;
    }

    sg_stPQVideoZmeInfo.bVdpZmeInitFlag = HI_TRUE;
    sg_stPQVideoZmeInfo.bVdpZmeFirEn    = HI_TRUE;
    sg_stPQVideoZmeInfo.bVdpZmeMedEn    = HI_FALSE;
    /*sg_stPQVideoZmeInfo.enZMETunMode    = PQ_TUN_NORMAL;*/

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitVdpZme(HI_VOID)
{
    if (sg_stPQVideoZmeInfo.bVdpZmeInitFlag)
    {
        /* release Vdp zme coefficient memory */
        if (HI_NULL != g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr)
        {
            PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpInstance.stMBuf);
            g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr = HI_NULL;
        }

        /* release Vdp zme coefficient memory */
        if (HI_NULL != g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr)
        {
            PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpHZMEInstance.stMBuf);
            g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr = HI_NULL;
        }

        /* release Vdp zme coefficient memory */
        if (HI_NULL != g_stVZMEVdpVzmeInstance.stMBuf.pu8StartVirAddr)
        {
            PQ_HAL_MMZ_UnmapAndRelease(&g_stVZMEVdpVzmeInstance.stMBuf);
            g_stVZMEVdpVzmeInstance.stMBuf.pu8StartVirAddr = HI_NULL;
        }

        sg_stPQVideoZmeInfo.bVdpZmeInitFlag = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_InitZme(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    if (sg_stPQVideoZmeInfo.bZmeInitFlag)
    {
        return HI_SUCCESS;
    }

    if (HI_NULL == pstPqParam)
    {
        sg_stPQVideoZmeInfo.bZmeInitFlag = HI_FALSE;

        return HI_FAILURE;
    }

    (HI_VOID)PQ_MNG_InitVdpZme();

    PQ_HAL_InitVdpZmeVidCoefSel(pstPqParam, bParaUseTableDefault);

    sg_stPQVideoZmeInfo.bZmeInitFlag = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitZme(HI_VOID)
{
    if (sg_stPQVideoZmeInfo.bZmeInitFlag)
    {
        (HI_VOID)PQ_MNG_DeInitVdpZme();

        sg_stPQVideoZmeInfo.bZmeInitFlag = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetVdpZmeStrategy (HI_PQ_ZME_LAYER_E enLayerId, HI_PQ_ZME_STRATEGY_IN_U *pstZmeIn, HI_PQ_ZME_STRATEGY_OUT_U *pstZmeOut)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_OVER_RANGE_RE_FAIL(enLayerId, HI_PQ_ZME_LAYER_BUTT);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeIn);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeOut);

    //s32Ret = PQ_HAL_GetVdpZmeStrategy(enLayerId, pstZmeIn, pstZmeOut);
    if (HI_PQ_ZME_LAYER_HD0 == enLayerId)
    {
        s32Ret = PQ_HAL_GetV0ZmeStrategy(&pstZmeIn->stLayerStrategy, &(pstZmeOut->stStrategyLayerId));
    }
    else if (HI_PQ_ZME_LAYER_WBC_VP == enLayerId)
    {
        s32Ret = PQ_HAL_GetWbcVpZmeStrategy(&pstZmeIn->stWbcStrategy, &(pstZmeOut->stStrategyWbcVp));
    }
    else
    {
        HI_ERR_PQ("LayerId:%d, unsupport zme strategy!\n", enLayerId);
    }

    return s32Ret;
}

HI_S32 PQ_MNG_SetZmeDefault(HI_BOOL bOnOff)
{
    PQ_HAL_SetZmeDefault(bOnOff);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetProcVdpZmeStrategy(HI_PQ_PROC_VDPZME_STRATEGY_S stProcVdpZmeStrategy)
{
    PQ_HAL_SetProcVdpZmeStrategy(stProcVdpZmeStrategy);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetProcVdpZmeStrategy(HI_PQ_PROC_VDPZME_STRATEGY_S *pstProcVdpZmeStrategy)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeStrategy);

    PQ_HAL_GetProcVdpZmeStrategy(pstProcVdpZmeStrategy);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetProcVdpZmeReso(HI_PQ_PROC_VDPZME_RESO_S *pstProcVdpZmeReso)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeReso);

    PQ_HAL_GetProcVdpZmeReso(pstProcVdpZmeReso);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetProcWbcStrategy(HI_PQ_PROC_WBC_LAYER_E enProcWbcLayer, HI_PQ_PROC_WBC_STRATEGY_S *pstProcWbcStrategy)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcWbcStrategy);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enProcWbcLayer, HI_PQ_PROC_WBC_LAYER_BUTT);

    PQ_HAL_GetProcWbcStrategy(enProcWbcLayer, pstProcWbcStrategy);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetToolZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);

    s32Ret = PQ_HAL_SetZmeVidCoefToolSel(pstSel);

    return s32Ret;
}

HI_S32 PQ_MNG_GetToolZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);

    s32Ret = PQ_HAL_GetZmeVidCoefToolSel(pstSel);

    return s32Ret;
}

HI_S32 PQ_MNG_SetToolZmeWBCCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);

    s32Ret = PQ_HAL_SetZmeWBCCoefToolSel(pstSel);

    return s32Ret;
}

HI_S32 PQ_MNG_GetToolZmeWBCCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;
    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);

    s32Ret = PQ_HAL_GetZmeWBCCoefToolSel(pstSel);

    return s32Ret;
}

HI_S32 PQ_MNG_SetProcVdpZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S stProcVdpZmeVidCoefSel)
{
    PQ_HAL_SetProcVdpZmeVidCoefSel(stProcVdpZmeVidCoefSel);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetProcVdpZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S *pstProcVdpZmeVidCoefSel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeVidCoefSel);

    PQ_HAL_GetProcVdpZmeVidCoefSel(pstProcVdpZmeVidCoefSel);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetProcVdpZmeWbcCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S stProcVdpZmeWbcCoefSel)
{
    PQ_HAL_SetProcVdpZmeWbcCoefSel(stProcVdpZmeWbcCoefSel);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetProcVdpZmeWbcCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstProcVdpZmeWbcCoefSel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeWbcCoefSel);

    PQ_HAL_GetProcVdpZmeWbcCoefSel(pstProcVdpZmeWbcCoefSel);

    return HI_SUCCESS;
}

static stPQAlgFuncs stZMEFuncs =
{
    .Init               = PQ_MNG_InitZme,
    .DeInit             = PQ_MNG_DeInitZme,
    .SetZmeEnMode       = PQ_MNG_SetZmeEnMode,
    .GetZmeEnMode       = PQ_MNG_GetZmeEnMode,
    .GetVdpZmeStrategy  = PQ_MNG_GetVdpZmeStrategy,
    .SetZmeDefault      = PQ_MNG_SetZmeDefault,
    .SetProcVdpZmeStrategy  = PQ_MNG_SetProcVdpZmeStrategy,
    .GetProcVdpZmeStrategy  = PQ_MNG_GetProcVdpZmeStrategy,
    .GetProcVdpZmeReso      = PQ_MNG_GetProcVdpZmeReso,
    .GetProcWbcStrategy     = PQ_MNG_GetProcWbcStrategy,

    .SetProcVdpZmeVidCoefSel  = PQ_MNG_SetProcVdpZmeVidCoefSel,
    .GetProcVdpZmeVidCoefSel  = PQ_MNG_GetProcVdpZmeVidCoefSel,
    .SetProcVdpZmeWbcCoefSel  = PQ_MNG_SetProcVdpZmeWbcCoefSel,
    .GetProcVdpZmeWbcCoefSel  = PQ_MNG_GetProcVdpZmeWbcCoefSel,
};

HI_S32 PQ_MNG_RegisterZme(PQ_REG_TYPE_E  enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_ZME, enType, PQ_BIN_ADAPT_SINGLE, "zme", HI_NULL, &stZMEFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterZme()
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_ZME);

    return s32Ret;
}


