/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_dm_alg.h
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016-03-02
  Description   : soft alg

******************************************************************************/

#ifndef __PQ_MNG_DM_ALG_H__
#define __PQ_MNG_DM_ALG_H__

#include "pq_mng_db_alg.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define RGSIZEW 64
#define RGSIZEH 16
#define DM_MAX_WIDTH 4096
#define DM_MAX_HEIGHT 2160
#define DM_ROLLSUB_MAXNUM   30

typedef struct
{
    HI_S32 s32BitDepth;
    HI_S32 s32YStride;      //reg_in [0,4096]
    HI_S32 s32YWidth;       //reg_in [0,4095]
    HI_S32 s32YHeight;      //reg_in [0,2160]
} DM_PQ_IMG_INFO_S;

typedef struct
{
    HI_U16 u16TopLftPx;
    HI_U16 u16TopLftPy;
    HI_U16 u16BotRgtPx;
    HI_U16 u16BotRgtPy;
    HI_U16 u16MotionValue; // no use
} DM_API_ROLLSUB_S;

typedef struct
{
    HI_S32 s32DmEn;

    HI_U16 u16OppAngCtrstT;
    HI_U16 u16MNDirOppCtrstT;
    HI_U16 u16cSWTrsntLT;
    HI_U16 u16cSWTrsntLT10bit;
    HI_U8  u8LSWRatio;
    HI_U8  u8LimitLSWRatio;
    HI_S16 s16MMFLR;
    HI_S16 s16MMFLR10bit;
    HI_S16 s16MMFSR;
    HI_S16 s16MMFSR10bit;
    HI_U8  u8MMFlimitEn;
    HI_U8  u8MMFSet;
    HI_U8  u8InitValStep;
    HI_U16 au16TransBand[31];
    HI_U16 u16LimitT;
    HI_U16 u16LimitT10bit;
    HI_U8  u8LimResBlendStr1;
    HI_U8  u8LimResBlendStr2;
    HI_U8  u8DirBlendStr;
    HI_U16 u16LWCtrstT;
    HI_U16 u16LWCtrstT10bit;
    HI_U16 u16cSWTrsntST;
    HI_U16 u16cSWTrsntST10bit;

    HI_S32 s32RoSubInfoEn;
    DM_API_ROLLSUB_S astRoSub[DM_ROLLSUB_MAXNUM];
    HI_U16  u16SizeOfRoSub;//size must be less than DM_ROLLSUB_MAXNUM
} DM_REG_IN_S; // 软算法的寄存器输入；都有实际的逻辑物理寄存器

typedef struct
{
    HI_U16 u16OppAngCtrstT;
    HI_U16 u16MNDirOppCtrstT;
    HI_U16 u16cSWTrsntLT;
    HI_U16 u16cSWTrsntLT10bit;
    HI_U8  u8LSWRatio;
    HI_U8  u8LimitLSWRatio;
    HI_S16 s16MMFLR;
    HI_S16 s16MMFLR10bit;
    HI_S16 s16MMFSR;
    HI_S16 s16MMFSR10bit;
    HI_U8  u8MMFlimitEn;
    HI_U8  u8MMFSet;
    HI_U8  u8InitValStep;
    HI_U16 au16TransBand[31];
    HI_U16 u16LimitT;
    HI_U16 u16LimitT10bit;
    HI_U8  u8LimResBlendStr1;
    HI_U8  u8LimResBlendStr2;
    HI_U8  u8DirBlendStr;
    HI_U16 u16LWCtrstT;
    HI_U16 u16LWCtrstT10bit;
    HI_U16 u16cSWTrsntST;
    HI_U16 u16cSWTrsntST10bit;
    HI_U8  u8DmGlobalStr;

    DM_API_ROLLSUB_S astRoSub[DM_ROLLSUB_MAXNUM];
    HI_U16  u16SizeOfRoSub;//size must be less than DM_ROLLSUB_MAXNUM
} DM_REG_OUT_S;

typedef struct
{
    HI_U16 au16TransBandL[31];
    HI_U16 au16TransBandM[31];

} DM_MMF_LIM_TRANSBAND_S;

typedef struct
{
    HI_U16 au16MndetLimitLut[4];
    HI_U8  au8MndetFlagLut[5];
} DM_LIMITFLAG_LUT_S;

typedef struct
{
    HI_U16 u16OppAngCtrstT;
    HI_U16 u16MNDirOppCtrstT;
    HI_U16 u16cSWTrsntLT;
    HI_U16 u16cSWTrsntLT10bit;
    HI_U8  u8LSWRatio;
    HI_U8  u8LimitLSWRatio;

    HI_S16 s16MMFLR;
    HI_S16 s16MMFLR10bit;
    HI_S16 s16MMFSR;
    HI_S16 s16MMFSR10bit;

    HI_U8  u8InitValStep;
    HI_U8  u8MMFSet;
    HI_U8  u8MMFlimitEn;

    HI_U16 u16LimitT;
    HI_U16 u16LimitT10bit;
    HI_U8  u8LimResBlendStr1;
    HI_U8  u8LimResBlendStr2;
    HI_U8  u8DirBlendStr;

    HI_U16 u16LWCtrstT;
    HI_U16 u16LWCtrstT10bit;
    HI_U16 u16cSWTrsntST;
    HI_U16 u16cSWTrsntST10bit;

    /* test */
    HI_U16 *pu16MMFLimTransBand;

} DM_PARA_S;

typedef struct
{
    HI_S32 s32LumHBlkDetNum;
    HI_S32 s32LumHBlkSize;   /* non-interface register [6,64] */

    HI_S32 as32RateBuf[32];
    HI_S32 s32RateSmthWin;
    HI_S32 *ps32NewRate;
    HI_U8  u8DefaultDMParaFlag; //u,[0,3]; default value:1
    HI_U8  u8DMmndetEn;         //u,[0,1]; default value:1
    DM_LIMITFLAG_LUT_S stLimitFlagLutSD;
    DM_PARA_S astDMParaSD[4];

    // 来自RGMV信息解析结果，逐行
    HI_S16 as16RGMVX[(MAX_PICTURE_HEIGHT / RGSIZEH) * (MAX_PICTURE_WIDTH / RGSIZEW)];
    HI_S16 as16RGMVY[(MAX_PICTURE_HEIGHT / RGSIZEH) * (MAX_PICTURE_WIDTH / RGSIZEW)];
    HI_U16 au16RGMVMag[(MAX_PICTURE_HEIGHT / RGSIZEH) * (MAX_PICTURE_WIDTH / RGSIZEW)];

    HI_S16 as16RgmvColStatic[MAX_PICTURE_HEIGHT / RGSIZEH];
    HI_U16 u16RgmvBlkNumH;
    HI_U16 u16RgmvBlkNumW;
    HI_S16 s16RgmvXThdDn;
    HI_S16 s16RgmvXThdUp;
    HI_S16 s16RgmvYThdUp;
    HI_S16 s16RgmvMagThdDn;
    HI_S16 s16MvUniThdDn;
    HI_S16 s16MidThdBandRatio;
    HI_S16 s16RoSubLikeRowThdDn;
    HI_S16 s16UniNumRowThdDn;
    HI_S16 s16RgmvUniAreaThdUp;
    HI_S16 s16RgmvDeltaThdUp_RowAndRow;
    HI_S16 s16RoSubHeightThdUp;
    HI_S16 s16RoSubHeightThdDn;
    HI_S16 s16RoSubWidthThdDn;
    HI_S16 s16RoSubLikeAreaThdUp;
    HI_S16 s16RoSubRowChkThdDn;

    DM_API_ROLLSUB_S astRoSub[DM_ROLLSUB_MAXNUM];
    HI_U16  u16SizeOfRoSub;//size must be less than DM_ROLLSUB_MAXNUM
} DM_DRV_IN_S; // 软算法的初始化

typedef struct
{

} DM_DRV_OUT_S;

HI_S32 DM_Init(DM_PQ_IMG_INFO_S *pstDmPqImgInfo, DM_REG_IN_S *pstDmRegIn, DM_REG_OUT_S *pstDmRegOut, DM_DRV_IN_S *pstDmDrvIn);
HI_S32 DM_UpdateCfg(DM_PQ_IMG_INFO_S *pstDmPqImgInfo, DM_REG_IN_S *pstDmRegIn, DM_REG_OUT_S *pstDmRegOut, DM_DRV_IN_S *pstDmDrvIn);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif



