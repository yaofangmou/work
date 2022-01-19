/******************************************************************************
 Copyright (C), 2014-2016, Hisilicon Tech. Co. Ltd.
******************************************************************************
File Name     : pq_mng_sharpen.c
Version       : Initial Draft
Author        : sdk
Created       : 2014/06/19
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include <linux/slab.h>      /* kmalloc() */
#include <linux/string.h>
#include <linux/fcntl.h>

#include "hi_type.h"
#include "hi_debug.h"
#include "drv_pq_define.h"

#include "pq_hal_comm.h"
#include "pq_mng_sharpen.h"
#include "drv_pq_table.h"

#define S10TOS16(x) ((x>511)?(x-1024):(x))

static ALG_SHARPEN_S sg_stPQSharpenInfo;

/* if table has set para or the scene, then use table para; else use these para */
static HI_U32 sg_u32LumGain[PQ_SOURCE_MODE_BUTT][PQ_OUTPUT_MODE_BUTT] =
{
    {126, 126, 126, 126, 126, 126}, /* PQ_SOURCE_MODE_NO  */
    {273, 273, 273, 273, 273, 273}, /* PQ_SOURCE_MODE_SD  */
    {126, 126, 126, 126, 126, 126}, /* PQ_SOURCE_MODE_HD  */
    {80,  80,   80,  80, 80, 80}, /* PQ_SOURCE_MODE_UHD */
};

static HI_U32 sg_u32LmingRatio[PQ_SOURCE_MODE_BUTT][PQ_OUTPUT_MODE_BUTT] =
{
    {128, 128, 128, 128, 256, 256}, /* PQ_SOURCE_MODE_NO  */
    {128, 128, 127, 127, 127, 127}, /* PQ_SOURCE_MODE_SD  */
    {64, 64, 64, 64, 64, 64}, /* PQ_SOURCE_MODE_HD  */
    { 40,  40,  40,  40, 40,  40}, /* PQ_SOURCE_MODE_UHD */
};

static HI_S32 PQ_MNG_FindSharpenGainRatio(HI_U32 u32RegAddr)
{
    HI_U32 u32Addr, u32Value;
    PQ_PHY_REG_S *sg_pstPhyReg   = HI_NULL;
    HI_U32 i;
    HI_U8  u8Lsb, u8Msb, u8SourceMode, u8OutputMode;
    HI_U32 u32StartPos = 0;
    HI_U32 u32EndPos   = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(sg_stPQSharpenInfo.pstParam);
    sg_pstPhyReg = sg_stPQSharpenInfo.pstParam->stPQPhyReg;

    PQ_TABLE_FindBinPos(HI_PQ_MODULE_SHARPNESS, &u32StartPos, &u32EndPos);

    for (i = u32StartPos; i <= u32EndPos; i++)
    {
        u32Addr       = sg_pstPhyReg[i].u32RegAddr;
        u32Value      = sg_pstPhyReg[i].u32Value;
        u8Lsb         = sg_pstPhyReg[i].u8Lsb;
        u8Msb         = sg_pstPhyReg[i].u8Msb;
        u8SourceMode  = sg_pstPhyReg[i].u8SourceMode;
        u8OutputMode  = sg_pstPhyReg[i].u8OutputMode;

        if ((PQ_SOURCE_MODE_BUTT <= u8SourceMode) || (PQ_OUTPUT_MODE_BUTT <= u8OutputMode))
        {
            continue;
        }

        // two para use one comm reg
        if ((u32Addr != SHARP_STRENGTH_ADDR)
            && (((u8Lsb != SHARP_LUM_GAIN_LSB) || (u8Msb != SHARP_LUM_GAIN_MSB))
                && ((u8Lsb != SHARP_LMINGRATIO_LSB) || (u8Msb != SHARP_LMINGRATIO_MSB))))
        {
            continue;
        }

        if ((u8Lsb == SHARP_LMINGRATIO_LSB) && (u8Msb == SHARP_LMINGRATIO_MSB))
        {
            sg_stPQSharpenInfo.pLmingRatio[u8SourceMode][u8OutputMode] = u32Value;
            pqprint(PQ_PRN_SHARPEN, "pLmingRatio:%d, SourceMode:%d, OutputMode:%d\n", u32Value, u8SourceMode, u8OutputMode);
        }
        else if ((u8Lsb == SHARP_LUM_GAIN_LSB) && (u8Msb == SHARP_LUM_GAIN_MSB))
        {
            sg_stPQSharpenInfo.pLumGain[u8SourceMode][u8OutputMode] = u32Value;
            pqprint(PQ_PRN_SHARPEN, "pLumGain:%d, SourceMode:%d, OutputMode:%d\n", u32Value, u8SourceMode, u8OutputMode);
        }

    }

    return HI_SUCCESS;
}

static HI_S32 PQ_MNG_FindSharpGain(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret  = PQ_MNG_FindSharpenGainRatio(SHARP_STRENGTH_ADDR);

    return s32Ret;
}

/* Deinit Sharp Moudle */
HI_S32 PQ_MNG_DeInitSharpen(HI_VOID)
{
    if (HI_FALSE == sg_stPQSharpenInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQSharpenInfo.bInit = HI_FALSE;

    return HI_SUCCESS;
}

/* Deinit Sharp Moudle (Include Sharpen and HSharpen) */
HI_S32 PQ_MNG_InitSharpen(PQ_PARAM_S *pstPqParam, HI_BOOL bParaUseTableDefault)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_U32 u32Data = 0;

    if (HI_TRUE == sg_stPQSharpenInfo.bInit)
    {
        return HI_SUCCESS;
    }

    sg_stPQSharpenInfo.bEnable      = HI_TRUE;
    sg_stPQSharpenInfo.u32Strength  = 50;
    sg_stPQSharpenInfo.pstParam     = pstPqParam;
    sg_stPQSharpenInfo.pLumGain     = sg_u32LumGain;
    sg_stPQSharpenInfo.pLmingRatio  = sg_u32LmingRatio;

    s32Ret = PQ_TABLE_InitPhyList(u32Data, HI_PQ_MODULE_SHARPNESS, PQ_SOURCE_MODE_SD, PQ_OUTPUT_MODE_NO);
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("Sharpen InitPhyList error\n");
        sg_stPQSharpenInfo.bInit = HI_FALSE;

        return HI_FAILURE;
    }

    s32Ret = PQ_MNG_FindSharpGain();
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_PQ("FindSharpGain error\n");
        sg_stPQSharpenInfo.bInit = HI_FALSE;

        return s32Ret;
    }

    sg_stPQSharpenInfo.bInit = HI_TRUE;

    return s32Ret;
}

/* Set Sharpen Strength, Range: 0~100;
   说明: UI菜单设置直接调用，根据当前的源和输出信息将设置的s32ShpStr(0-100)值混合Bin文件的Gain值设置Sharpen强度
   */
HI_S32 PQ_MNG_SetSharpenStr(HI_U32 u32ShpStr)
{
    HI_U32 u32ShpStrTmp;
    HI_U32 u32LumGain, u32LmingRatio;
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();
    PQ_OUTPUT_MODE_E enOutMode = PQ_COMM_GetOutputMode();

    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(u32ShpStr, 100);

    sg_stPQSharpenInfo.u32Strength = u32ShpStr;
    u32ShpStrTmp = LEVEL2NUM(u32ShpStr);

    PQ_CHECK_OVER_RANGE_RE_FAIL(enSourceMode, PQ_SOURCE_MODE_BUTT);
    PQ_CHECK_OVER_RANGE_RE_FAIL(enOutMode, PQ_OUTPUT_MODE_BUTT);

    u32LumGain    = (sg_stPQSharpenInfo.pLumGain[enSourceMode][enOutMode] * u32ShpStrTmp + 64) / 128;
    u32LmingRatio = (sg_stPQSharpenInfo.pLmingRatio[enSourceMode][enOutMode] * u32ShpStrTmp + 64) / 128;

    PQ_HAL_SetSharpStrReg(u32LumGain, u32LmingRatio);

    return HI_SUCCESS;
}

/* Get Sharpen Strength, Range: 0~100 */
HI_S32 PQ_MNG_GetSharpenStr(HI_U32 *pu32ShpStr)
{
    *pu32ShpStr = sg_stPQSharpenInfo.u32Strength;

    return HI_SUCCESS;
}


/* Enable Sharpen Moudle(Sharpen and HSharpen) */
HI_S32 PQ_MNG_SetSharpenEn(HI_BOOL bOnOff)
{
    PQ_SOURCE_MODE_E enSourceMode = PQ_COMM_GetSourceMode();
    PQ_OUTPUT_MODE_E enOutputMode = PQ_COMM_GetOutputMode();

    HI_UNUSED(enOutputMode);

    sg_stPQSharpenInfo.bEnable = bOnOff;

    if ((enSourceMode < PQ_SOURCE_MODE_BUTT)
        && (HI_FALSE == PQ_COMM_GetMoudleCtrl(HI_PQ_MODULE_SHARPNESS, enSourceMode)))
    {
        sg_stPQSharpenInfo.bEnable = HI_FALSE;
    }

    PQ_HAL_EnableSharp(sg_stPQSharpenInfo.bEnable);

    return HI_SUCCESS;
}

/* Get Sharpen Enable(Sharpen and HSharpen) */
HI_S32 PQ_MNG_GetSharpenEn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_stPQSharpenInfo.bEnable;

    return HI_SUCCESS;
}

static stPQAlgFuncs stSharpFuncs =
{
    .Init            = PQ_MNG_InitSharpen,
    .DeInit          = PQ_MNG_DeInitSharpen,
    .SetEnable       = PQ_MNG_SetSharpenEn,
    .GetEnable       = PQ_MNG_GetSharpenEn,
    .SetStrength     = PQ_MNG_SetSharpenStr,
    .GetStrength     = PQ_MNG_GetSharpenStr,
};

HI_S32 PQ_MNG_RegisterSharp(PQ_REG_TYPE_E  enType)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgRegister(HI_PQ_MODULE_SHARPNESS, enType, PQ_BIN_ADAPT_MULTIPLE, "sharp", HI_NULL, &stSharpFuncs);

    return s32Ret;
}

HI_S32 PQ_MNG_UnRegisterSharp(HI_VOID)
{
    HI_S32 s32Ret = HI_SUCCESS;

    s32Ret = PQ_COMM_AlgUnRegister(HI_PQ_MODULE_SHARPNESS);

    return s32Ret;
}

