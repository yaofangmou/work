/******************************************************************************

  Copyright (C), 2012-2016, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : pq_mng_db.c
  Version       : Initial Draft
  Author        : sdk
  Created       :
  Description   : De-blocking and De-Ringning

******************************************************************************/
#include <linux/string.h>

#include "hi_math.h"
#include "drv_pq_table.h"
#include "pq_mng_db.h"
#include "pq_mng_db_alg.h"

#define DB_HOR_MAX_RESOLUTION  720
#define DB_VER_MAX_RESOLUTION  576
#define DB_BORDER_COUNTER      720

HI_U8 DbStr_Delta_LutUltraStrong[17] = {4, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 2, 0, 0};
HI_U8 DbStr_Delta_LutStrong[17]      = {4, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 4, 2, 0, 0, 0};
HI_U8 DbStr_Delta_LutMiddle[17]      = {0, 8, 8, 8, 8, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
HI_U8 DbStr_Delta_LutWeak[17]        = {0, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
HI_U8 DbStr_Delta_LutLumVer[17]      = {6, 8, 8, 8, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0};
HI_U8 DbStr_Delta_LutChroma[17]      = {8, 8, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

HI_U8 g_DbDirStrLut[16]    = {8, 8, 8, 8, 8, 8, 8, 6, 1, 1, 0, 0, 0, 0, 0, 0};
HI_U8 g_DbDirStrGainLut[8] = {8, 5, 3, 1, 0, 0, 0, 0};

HI_U8 DbStrFadLut1[12]     = {4, 4, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0};
HI_U8 DbStrFadLut1_4[12]   = {4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
HI_U8 DbStrFadLut2[12]     = {4, 4, 4, 4, 3, 3, 3, 0, 0, 0, 0, 0};
HI_U8 DbStrFadLut3[12]     = {4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 0};
HI_U8 DbStrFadLut4[4]      = {2, 1, 0, 0}; //only for org vertical

HI_U8  RatIdxLut[16] = {0, 1, 2, 3, 4, 5, 5, 6, 6, 7, 7, 8, 8, 8, 8, 8};
HI_U16 ptrPixValAdjGain[9]   = { 4,  5,  7,  8,  9, 10, 11, 12, 12};
HI_U16 ptrHFVarCore[9]       = { 0,  3,  5,  8, 11, 13, 16, 20, 24}; /* texture Th fish still strong, other patent OK */
HI_U16 ptrHFVarGain1[9]      = { 4,  3,  3,  2,  1,  1,  0,  0,  0}; /* [0,8] */
HI_U16 ptrHFVarGain2[9]      = { 8,  7,  7,  6,  5,  5,  4,  4,  4}; /* [0,8] */
HI_U16 ptrBordAdjGain[9]     = { 7,  7,  7,  7,  7,  7,  7,  7,  7}; /* no change */
HI_U8 ptrGradSubRatio[9]     = {24, 24, 24, 24, 24, 24, 24, 16,  8};
/* special case for ver */
HI_U16 ptrSWPixValAdjGain[9] = { 4,  5,  6,  7,  8,   9, 10,  11, 12};
HI_U16 ptrSWHFVarCore[9]     = { 0,  3,  6,  9, 12,  15, 18,  21, 24};
HI_U16 ptrSWHFVarGain1[9]    = { 4,  4,  3,  3,  2,   2,  1,   1,  0};
HI_U16 ptrSWHFVarGain2[9]    = { 8,  8,  7,  7,  6,   6,  5,   5,  4};

#define DB_SIZE_CLIP(x) ((x>0x3F)?(-1):(x))


//const static HI_U8 DB_DELTA_LUM_VER[16]          = {6, 8, 8, 8, 8, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0}; /* LUMA_VER p0-p15 */
const static HI_U8 DB_DELTA_LUM_VER[16]            = {0, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; /* LUMA_VER p0-p15 */
const static HI_U8 DB_DELTA_CHR_HOR[16]            = {8, 8, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; /* CHR_HOR  p0-p15 */
const static HI_U8 DB_DELTA_LUM_H_STRONG[16]       = {4, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 4, 2, 0, 0}; /* LUMA_HOR p0-p15 */
const static HI_U8 DB_DELTA_LUM_H_ULTRA_STRONG[16] = {4, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 2, 0}; /* LUMA_HOR p0-p15 */

/* 遗留问题: Fade强度调小，会不会影响水平方向的滤波强度 */
//const static HI_U8 DB_STR_FADE_LUM_VER[12] = {4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; /* LUMA_VER p0-p11 */
const static HI_U8 DB_STR_FADE_LUM_VER[12]   = {2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; /* LUMA_VER p0-p11 */
const static HI_U8 DB_STR_FADE_LUT_1[12]     = {4, 4, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0};
const static HI_U8 DB_STR_FADE_LUT_2[12]     = {4, 4, 4, 4, 3, 3, 3, 0, 0, 0, 0, 0};
const static HI_U8 DB_STR_FADE_LUT_3[12]     = {4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 0};

const static HI_U8 DB_DIR_GAIN_LUT[8]    = {8, 5, 3, 1, 0, 0, 0, 0}; /* dir_str_gain_lut p0-p7 */
const static HI_U8 DB_DIR_LUT[16]        = {8, 8, 8, 8, 8, 8, 8, 6, 1, 1, 0, 0, 0, 0, 0, 0}; /* dir_str_lut p0-p15 */
const static HI_U8 RAT_INDEX_LUT[16]     = {0, 1, 2, 3, 4, 5, 5, 6, 6, 7, 8, 8, 8, 8, 8, 8};
const static DB_DynmcPara STRONG_PARAM   = {12, 0, 0, 0, 24, 0, 4, 7, 8};
const static DB_DynmcPara MID_PARAM      = {12, 0, 0, 0, 16, 0, 4, 7, 24};
const static DB_DynmcPara WEAK_PARAM     = {4, 0, 8, 8, 0, 4, 8, 7, 24};

static ALG_DB_S sg_stPQDBInfo;


HI_S32 PQ_MNG_InitDB(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    HI_U32     u32HandleNo = 0;
    HI_S32     s32Ret = HI_SUCCESS;

    if (HI_TRUE == sg_stPQDBInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQDBInfo.bEnable      = HI_TRUE;
    sg_stPQDBInfo.u32Strength  = 50;
    sg_stPQDBInfo.bDemoEnable  = HI_FALSE;
    sg_stPQDBInfo.eDemoMode    = PQ_DEMO_ENABLE_R;

    s32Ret = PQ_TABLE_InitPhyList(u32HandleNo, HI_PQ_MODULE_DB, PQ_SOURCE_MODE_NO, PQ_OUTPUT_MODE_NO);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("db InitPhyList error\n");
        sg_stPQDBInfo.bInit   = HI_FALSE;

        return HI_FAILURE;
    }

    sg_stPQDBInfo.bInit = HI_TRUE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_DeInitDB(HI_VOID)
{
    if (HI_FALSE == sg_stPQDBInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQDBInfo.bInit   = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetDBEn(HI_BOOL bOnOff)
{
    HI_U32  u32HandleNo = 0;

    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();

    if ((enSourceMode > PQ_SOURCE_MODE_SD)
        || (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_DB, enSourceMode)))
    {
        bOnOff = HI_FALSE;
    }

    sg_stPQDBInfo.bEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            PQ_HAL_EnableDB(u32HandleNo, bOnOff);
        }
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetDBEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQDBInfo.bEnable;

    return HI_SUCCESS;
}

/* u32Strength[0,100] */
HI_S32 PQ_MNG_SetDBStrength(HI_U32 u32Strength)
{
    HI_U32 u32HandleNo = 0;

    sg_stPQDBInfo.u32Strength           = u32Strength;

    /* set db strength reg value for UI sets */
    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; ++u32HandleNo)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            PQ_HAL_SetDBStrengh(u32HandleNo, sg_stPQDBInfo.u32Strength);
        }
    }

    return HI_SUCCESS;
}

/* u32Strength[0,100] */
HI_S32 PQ_MNG_GetDBStrength(HI_U32 *pu32Strength)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Strength);

    *pu32Strength = sg_stPQDBInfo.u32Strength; /* 0~100 */

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetDBDemoEn(HI_BOOL bOnOff)
{
    HI_U32 u32HandleNo = 0;
    HI_S32 s32Ret = HI_SUCCESS;

    sg_stPQDBInfo.bDemoEnable = bOnOff;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; ++u32HandleNo)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_EnableDBDemo(u32HandleNo, bOnOff);
        }
    }

    return s32Ret;
}

HI_S32 PQ_MNG_GetDBDemoEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQDBInfo.bDemoEnable;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SetDbmDemoMode(PQ_DEMO_MODE_E enMode)
{
    HI_U32 u32HandleNo;
    HI_S32 s32Ret = HI_SUCCESS;

    sg_stPQDBInfo.eDemoMode = enMode;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_SetDbmDemoMode(u32HandleNo, enMode);
        }
    }

    return s32Ret;
}

HI_S32 PQ_MNG_GetDbmDemoMode(PQ_DEMO_MODE_E *penMode)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(penMode);

    *penMode = sg_stPQDBInfo.eDemoMode;

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_SetDbmDemoModeCoor(HI_U32 u32XPos)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32HandleNo;

    sg_stPQDBInfo.u32DemoPos = u32XPos;

    for (u32HandleNo = 0; u32HandleNo < VPSS_HANDLE_NUM; u32HandleNo++)
    {
        if (HI_SUCCESS == PQ_HAL_CheckVpssValid(u32HandleNo))
        {
            s32Ret = PQ_HAL_DBDemoPos(u32HandleNo, sg_stPQDBInfo.u32DemoPos);
        }
    }

    return s32Ret;
}

/* software alg  end*/

DB_PQ_IMG_INFO_S stDbPqImgInfo = {0};
DB_REG_IN_S stDbRegIn = {{0}};
DB_DRV_IN_S stDbDrvIn = {{0}};
DB_REG_OUT_S stDbRegOut = {{0}};
DB_DRV_OUT_S stDbDrvOut = {{0}};

HI_S32 PQ_MNG_RefreshDbCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstTmpVpssReg = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssReg);

    PQ_CHECK_OVER_RANGE_RE_FAIL(pstPqFrameInfo->u32HandleNo, VPSS_HANDLE_NUM);

    stDbPqImgInfo.s32BitDepth = pstPqFrameInfo->u32BitDepth;
    stDbPqImgInfo.s32YStride  = pstPqFrameInfo->u32Stride;;
    stDbPqImgInfo.s32YWidth   = pstPqFrameInfo->u32Width;;
    stDbPqImgInfo.s32YHeight  = pstPqFrameInfo->u32Width;;

    pqprint(PQ_PRN_DB_CALC, "bSoftAlgPass = %d,u32Width = %d,u32Height = %d,u32FrameIndex = %d,bInit = %d\n",
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
        DB_Init(&stDbPqImgInfo, &stDbRegIn, &stDbRegOut, &stDbDrvIn, &stDbDrvOut);
        return HI_SUCCESS;
    }

    pstTmpVpssReg = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssReg);
    pqprint(PQ_PRN_DB_CALC, "bDbEn = %d\n", pstTmpVpssReg->VPSS_DBM_CTRL.bits.db_en);
    /*if (HI_FALSE == pstVpssRegInfo->pstVpssReg->VPSS_DBM_CTRL.bits.db_en)
    {
        return HI_SUCCESS;
    }*/

    if ((pstPqFrameInfo->u32Width > DB_HOR_MAX_RESOLUTION)
        || (pstPqFrameInfo->u32Height > DB_VER_MAX_RESOLUTION))
    {
        return HI_SUCCESS;
    }

    /* 3 get drv in from logic reg */
    /* DM_GetSoftDrvInFromReg */
    PQ_HAL_GetDbDrvInFromReg(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo, &stDbRegIn);

    /* 4 soft alg calc  */
    DB_UpdateCfg(&stDbPqImgInfo, &stDbRegIn, &stDbRegOut, &stDbDrvIn, &stDbDrvOut);

    /* 5 set reg out into reg */
    PQ_HAL_SetDbRegFromRegout(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo, &stDbRegOut);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_ResetDbStatus(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32 s32Ret         = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    s32Ret = PQ_HAL_ResetDbStatus(pstPqFrameInfo->u32HandleNo, &sg_stPQDBInfo,
                                  (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut));

    return s32Ret;
}

static stPQAlgFuncs stDbFuncs =
{
    .Init               = PQ_MNG_InitDB,
    .DeInit             = PQ_MNG_DeInitDB,
    .SetEnable          = PQ_MNG_SetDBEn,
    .GetEnable          = PQ_MNG_GetDBEn,
    .SetStrength        = PQ_MNG_SetDBStrength,
    .GetStrength        = PQ_MNG_GetDBStrength,
    .SetDemo            = PQ_MNG_SetDBDemoEn,
    .GetDemo            = PQ_MNG_GetDBDemoEn,
    .SetDemoMode        = PQ_MNG_SetDbmDemoMode,
    .GetDemoMode        = PQ_MNG_GetDbmDemoMode,
    .SetDemoModeCoor    = PQ_MNG_SetDbmDemoModeCoor,
    .ReSetPqStatus      = PQ_MNG_ResetDbStatus,
    .RefreshDbCfg       = PQ_MNG_RefreshDbCfg,
};

HI_S32 PQ_MNG_RegisterDB(PQ_REG_TYPE_E enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_DB, enType, PQ_BIN_ADAPT_SINGLE, "db", HI_NULL, &stDbFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterDB(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_DB);

    return s32Ret;
}


