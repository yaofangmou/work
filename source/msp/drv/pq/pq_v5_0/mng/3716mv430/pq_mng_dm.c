/******************************************************************************

  Copyright (C), 2012-2014, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : pq_mng_dm.c
  Version       : Initial Draft
  Author        :
  Created       :
  Description   : De-Mosquito

******************************************************************************/
#include <linux/string.h>

#include "hi_math.h"
#include "pq_hal_comm.h"
#include "drv_pq_table.h"
#include "pq_mng_db_alg.h"
#include "pq_mng_db.h"
#include "pq_mng_dm.h"

#define DBM_Blend(F,B,An,Ad)  (F*An + B*(Ad-An) + Ad/2)/Ad

extern HI_U32           g_u32DmStr;

static const HI_U8 DM_SW_WHT_LUT[5]       = {4, 8, 16, 32, 64};
static const HI_U8 DM_DIR_STR_GAIN_LUT[8] = {8, 8, 8, 8, 8, 8, 6, 5};
static const HI_U8 DM_DIR_STR_LUT[16]     = {8, 8, 8, 8, 8, 8, 8, 6, 1, 1, 0, 0, 0, 0, 0, 0};

static const HI_U8 g_DmDirStrGainLut[8] = {8, 8, 8, 8, 8, 8, 6, 5};
static const HI_U8 g_DmDirStrLut[16]    = {8, 8, 8, 8, 8, 8, 8, 6, 1, 1, 0, 0, 0, 0, 0, 0};
static const HI_U8 sg_DmDirStrLutSplit[16]    = {4, 4, 4, 4, 4, 4, 4, 3, 1, 1, 0, 0, 0, 0, 0, 0};
static const HI_U8 g_DmSwWhtLut[5]      = {4 , 8, 16, 32, 64};

static ALG_DM_S sg_stPQDMInfo;

/* 获取DR模块的初始参数值 */
static HI_S32 DM_Init_Value(DM_PARAM_S *pstDRValue)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstDRValue);

    pstDRValue->u16OppAngCtrstT    = 20;  //u8,[0,255];       default value:20
    pstDRValue->MNDirOppCtrstT  = 18;  //u8,[0,255];       default value:18
    pstDRValue->cSWTrsntLT      = 40;  //u8,[0,255];       default value:40
    pstDRValue->cSWTrsntLT10bit = 160; //u10,[0,1023];     default value:160
    pstDRValue->LSWRatio        = 4;   //u3,[2,6];         default value:4
    pstDRValue->LimitLSWRatio   = 4;   //u3,[2,6];         default value:4
    pstDRValue->MMFLR           = 50;  //s9,[-256,255];    default value:50;   MMFLR > MMFSR
    pstDRValue->MMFLR10bit      = 200; //s11,[-1024,1023]; default value:200;  MMFLR10bit > MMFSR10bit
    pstDRValue->MMFSR           = 0;   //s9,[-256,255];    default value:0
    pstDRValue->MMFSR10bit      = 0;   //s11,[-1024,1023]; default value:0
    pstDRValue->MMFlimitEn      = 1;   //u1,[0,1];         default value:1;  1: enable the MMF limit condition; 0: disable

#if 0
    if ((pstDRValue->MMFlimitEn == 1) && ( ((pstDRValue->MMFLR) <= (pstDRValue->MMFSR)) || ((pstDRValue->MMFLR10bit) <= (pstDRValue->MMFSR10bit)) ) )
    {
        pstDRValue->MMFlimitEn = 0;
    }
#endif

    pstDRValue->MMFSet      = 0; //u1,[0,1];  default value:0; 0:MMF[0,3], 1:MMF[1,2]
    pstDRValue->InitValStep = 0; //u2,[0,3];  default value:0

    pstDRValue->LimitT          = 18;  //u8,[0,255];   default value:18
    pstDRValue->LimitT10bit     = 72;  //u10,[0,1023]; default value:72
    pstDRValue->LimResBlendStr1 = 7;   //u4,[0,8];     default value:7;  Res = (HI_U16)DM_Blend(ResLimitT, ResMMF, pReg->LimResBlendStr1, 8);
    pstDRValue->LimResBlendStr2 = 7;   //u4,[0,8];     default value:7;  Res = (HI_U16)DM_Blend(ResLimitT, Pix, pReg->LimResBlendStr2, 8);
    pstDRValue->DirBlendStr     = 7;   //u4,[0,8];     default value:7;  pTxt->DirStr = (HI_U8)DM_Blend(pTxt->DirStr,Gain,pReg->DirBlendStr,8);

    pstDRValue->LWCtrstT        = 30;  //u8,[0,255];   default value:30
    pstDRValue->LWCtrstT10bit   = 120; //u10,[0,1023]; default value:120
    pstDRValue->cSWTrsntST      = 0;   //u8,[0,255];   default value:0
    pstDRValue->cSWTrsntST10bit = 0;   //u10,[0,1023]; default value:0

    pstDRValue->u8GradSubRatio   = 24; //u5,[0,31]; default value:24
    pstDRValue->u8CtrstThresh    = 2;  //u2,[0,3];  default value:2
    pstDRValue->u8OppAngCtrstDiv = 2;  //u2,[1,3];  default value:2
    pstDRValue->u8DmGlobalStr    = 8;  //u4,[0,15]; default value:8

    pstDRValue->pu8DirStrGainLut = g_DmDirStrGainLut;            //u4,[0,8];
    pstDRValue->pu8DirStrLut     = g_DmDirStrLut;                //u4,[0,8];
    pstDRValue->pu8SwWhtLut      = g_DmSwWhtLut;                 //u7,[0,127];
    //pstDRValue->pTransBand       = g_MMFLimTransBand.TransBandM; //u6,[0,63];

    return HI_SUCCESS;
}

/* Init DM, Vpss Handle ID = 0, Other Handle Init At Top Layer */
HI_S32 PQ_MNG_InitDM(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    HI_U32 u32HandleNo = 0;
    DM_PARAM_S stParamValueDR;
    HI_S32 s32Ret = HI_SUCCESS;

    if (HI_TRUE == sg_stPQDMInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQDMInfo.bEnable      = HI_TRUE;
    sg_stPQDMInfo.u32Strength  = 50;
    sg_stPQDMInfo.bDemoEnable  = HI_FALSE;

    s32Ret = DM_Init_Value(&stParamValueDR);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("DM parameter init error!\n");
        sg_stPQDMInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }

    s32Ret = PQ_TABLE_InitPhyList(u32HandleNo, HI_PQ_MODULE_DM, PQ_SOURCE_MODE_NO, PQ_OUTPUT_MODE_NO);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("dm InitPhyList error\n");
        sg_stPQDMInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }

    sg_stPQDMInfo.bInit = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitDM(HI_VOID)
{
    if (HI_FALSE == sg_stPQDMInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQDMInfo.bInit = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetDMEn(HI_BOOL bOnOff)
{
    HI_U32  u32HandleNo = 0;
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();

    if ((enSourceMode > PQ_SOURCE_MODE_SD)
        || (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_DM, enSourceMode)))
    {
        bOnOff = HI_FALSE;
    }

    sg_stPQDMInfo.bEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            PQ_HAL_EnableDM(u32HandleNo, bOnOff);
        }
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetDMEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQDMInfo.bEnable;

    return HI_SUCCESS;
}

/* u32Strength: 0~100 */
HI_S32 PQ_MNG_SetDMStrength(HI_U32 u32Strength)
{
    sg_stPQDMInfo.u32Strength = u32Strength;
    g_u32DmStr                = u32Strength * 15 / 100; /* 0~15; Low:4; Mid:8; High:12 */

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetDMStrength(HI_U32 *pu32Strength)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Strength);

    *pu32Strength = sg_stPQDMInfo.u32Strength;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetDMDemoEn(HI_BOOL bOnOff)
{
    HI_U32 u32HandleNo = 0;
    HI_S32 s32Ret = HI_SUCCESS;

    sg_stPQDMInfo.bDemoEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; ++u32HandleNo)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_EnableDMDemo(u32HandleNo, bOnOff);
        }
    }

    return s32Ret;
}

HI_S32 PQ_MNG_GetDMDemoEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQDMInfo.bDemoEnable;

    return HI_SUCCESS;
}

DM_PQ_IMG_INFO_S stPqImgInfo = {0};
DM_REG_IN_S stRegIn = {0};
DM_DRV_IN_S stDrvIn = {0};
DM_REG_OUT_S stRegOut = {0};

HI_S32 PQ_MNG_RefreshDmCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstTmpVpssReg = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssReg);
    PQ_CHECK_OVER_RANGE_RE_FAIL(pstPqFrameInfo->u32HandleNo, VPSS_HANDLE_NUM);

    stPqImgInfo.s32BitDepth = pstPqFrameInfo->u32BitDepth;
    stPqImgInfo.s32YStride = pstPqFrameInfo->u32Stride;
    stPqImgInfo.s32YWidth = pstPqFrameInfo->u32Width;
    stPqImgInfo.s32YHeight = pstPqFrameInfo->u32Width;

    pqprint(PQ_PRN_DM, "bSoftAlgPass = %d,u32Width = %d,u32Height = %d,u32FrameIndex = %d,bInit = %d\n",
            pstPqFrameInfo->bSoftAlgPass,
            pstPqFrameInfo->u32Width,
            pstPqFrameInfo->u32Height,
            pstPqFrameInfo->u32FrameIndex,
            pstPqFrameInfo->bInit);

    /* 1 soft bypass */
    if (pstPqFrameInfo->bSoftAlgPass == HI_TRUE)
    {
        return HI_SUCCESS;
    }

    /* 2 init soft drv in */
    if (HI_TRUE == pstPqFrameInfo->bInit)
    {
        DM_Init(&stPqImgInfo, &stRegIn, &stRegOut, &stDrvIn);
        return HI_SUCCESS;
    }

    pstTmpVpssReg = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssReg);
    pqprint(PQ_PRN_DM, "dm_en = %d\n", pstTmpVpssReg->VPSS_DBM_CTRL.bits.dm_en);
    if (HI_FALSE == pstTmpVpssReg->VPSS_DBM_CTRL.bits.dm_en)
    {
        return HI_SUCCESS;
    }

    /* 3 get drv in from logic reg */
    /* DM_GetSoftDrvInFromReg */
    PQ_HAL_GetDmDrvInFromReg(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo, &stRegIn);

    /* 4 soft alg calc  */
    DM_UpdateCfg(&stPqImgInfo, &stRegIn, &stRegOut, &stDrvIn);

    /* 5 set reg out into reg */
    PQ_HAL_SetDmRegFromRegout(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo, &stRegOut);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_ResetDmStatus(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32 s32Ret         = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    s32Ret = PQ_HAL_ResetDmStatus(pstPqFrameInfo->u32HandleNo, &sg_stPQDMInfo, (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut));

    return s32Ret;
}

static stPQAlgFuncs stDmFuncs =
{
    .Init               = PQ_MNG_InitDM,
    .DeInit             = PQ_MNG_DeInitDM,
    .SetEnable          = PQ_MNG_SetDMEn,
    .GetEnable          = PQ_MNG_GetDMEn,
    .SetStrength        = PQ_MNG_SetDMStrength,
    .GetStrength        = PQ_MNG_GetDMStrength,
    .SetDemo            = PQ_MNG_SetDMDemoEn,
    .GetDemo            = PQ_MNG_GetDMDemoEn,
    .ReSetPqStatus      = PQ_MNG_ResetDmStatus,
    .RefreshDmCfg       = PQ_MNG_RefreshDmCfg,
};

HI_S32 PQ_MNG_RegisterDM(PQ_REG_TYPE_E enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_DM, enType, PQ_BIN_ADAPT_MULTIPLE, "dm", HI_NULL, &stDmFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterDM(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_DM);

    return s32Ret;
}

