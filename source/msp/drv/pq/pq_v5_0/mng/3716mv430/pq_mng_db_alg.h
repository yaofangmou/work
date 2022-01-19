/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_db_alg.h
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016-03-02
  Description   : soft alg

******************************************************************************/

#include "hi_math.h"

#ifndef __PQ_MNG_DB_ALG_H__
#define __PQ_MNG_DB_ALG_H__


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define DB_HOR_MAX_RESOLUTION  720
#define DB_VER_MAX_RESOLUTION  576
#define DB_BORDER_COUNTER      720

#define DBM_MIN(x, y) (((x) > (y)) ? (y) : (x))
#define DBM_MAX(x, y) (((x) > (y)) ? (x) : (y))
#define DBM_CLIP3(low,high,x) (DBM_MAX(DBM_MIN((high),(x)),(low)))

#define MAXLINESIZE         4096
#define MAX_PICTURE_WIDTH   1024 // width 720
#define MAX_PICTURE_HEIGHT  720 //height 576
#define MIN_BLOCKSIZE       4
#define MAX_HOR_BLOCK_NUM  (MAX_PICTURE_WIDTH / MIN_BLOCKSIZE)
#define MAX_VER_BLOCK_NUM  (MAX_PICTURE_HEIGHT / MIN_BLOCKSIZE)
#define MAX_BORDIST         32

#define READ_STROW_DATA_NUM     720
#define DET_BLK_STATIC_INFO     2048
#define DB_DETECTOR             2048

typedef struct
{
    HI_S32 s32BitDepth;
    HI_S32 s32YStride;      //reg_in [0,4096]
    HI_S32 s32YWidth;       //reg_in [0,4095]
    HI_S32 s32YHeight;      //reg_in [0,2160]
} DB_PQ_IMG_INFO_S;

typedef struct
{
    HI_U16 u16DetSizeEn;
    HI_U16 u16DetHyEn;

    HI_S32 s32HyCounter;
    HI_S32 s32HySize;
    HI_U32 au32DbBorder[128];
    HI_S32 as32DbHyCounter[2048];

    HI_U16 u16TestBlkNumHy;
    HI_U16 u16MinBlkSize;
    HI_U16 u16MaxBlkSizeHy;
} DB_DETECT_REG_IN_S;

typedef struct
{
    HI_U8  u8DbEn;
    HI_U8  u8DBLumHorEn;

    HI_U16 u16LumHBlkSize;
    HI_S32 s32LumHBlkNum;

    HI_U8  u8GradSubRatio;
    HI_U8  u8CtrstThresh;
    HI_U8  au8DirStrGainLut[8];
    HI_U8  au8DirStrLut[16];

    HI_U8  u8LumHorScaleRatio;
    HI_U8  u8LumHorFilterSel;

    HI_U8  u8GlobalDbStrengthLum;
    HI_U8  u8LumHorTxtWinSize;
    HI_U8  u8MaxLumHorDbDist;

    HI_U8  au8LumHStrFadeLut[12];
    HI_U8  au8LumHorDeltaLut[17];
    HI_U16 u16LumHorHFDiffCore;
    HI_U16 u16LumHorHFDiffGain1;
    HI_U16 u16LumHorHFDiffGain2;
    HI_U16 u16LumHorHFVarCore;
    HI_U16 u16LumHorHFVarGain1;
    HI_U16 u16LumHorHFVarGain2;
    HI_U16 u16LumHorBordAdjGain;

    HI_U16 u16CtrstAdjCore;
    HI_U16 u16CtrstAdjGain1;
    HI_U16 u16CtrstAdjGain2;
    HI_U16 u16DirSmoothMode;

    HI_U16 u16LumHorAdjGain;
} DB_FLT_REG_IN_S;

typedef struct
{
    DB_DETECT_REG_IN_S stDbDetectRegIn;
    DB_FLT_REG_IN_S stDbFltRegIn;
} DB_REG_IN_S;

typedef struct
{
    HI_U16 u16DetSizeEn;
    HI_U16 u16DetHyEn;

    HI_U16 u16TestBlkNumHy;
    HI_U16 u16MinBlkSize;
    HI_U16 u16MaxBlkSizeHy;

    HI_U32 au32DbBordFlag[128];
} DB_DETECT_REG_OUT_S;

typedef struct
{
    HI_U8  u8DbEn;
    HI_U8  u8DBLumHorEn;

    HI_U16 u16LumHBlkSize;
    HI_S32 s32LumHBlkNum;

    HI_U8  u8GradSubRatio;
    HI_U8  u8CtrstThresh;
    HI_U8  au8DirStrGainLut[8];
    HI_U8  au8DirStrLut[16];

    HI_U8  u8LumHorScaleRatio;
    HI_U8  u8LumHorFilterSel;

    HI_U8  u8GlobalDbStrengthLum;
    HI_U8  u8LumHorTxtWinSize;
    HI_U8  u8MaxLumHorDbDist;

    HI_U8  au8LumHStrFadeLut[12];
    HI_U8  au8LumHorDeltaLut[17]; // only use 0-15
    HI_U16 u16LumHorHFDiffCore;
    HI_U16 u16LumHorHFDiffGain1;
    HI_U16 u16LumHorHFDiffGain2;
    HI_U16 u16LumHorHFVarCore;
    HI_U16 u16LumHorHFVarGain1;
    HI_U16 u16LumHorHFVarGain2;
    HI_U16 u16LumHorBordAdjGain;

    HI_U16 u16CtrstAdjCore;
    HI_U16 u16CtrstAdjGain1;
    HI_U16 u16CtrstAdjGain2;
    HI_U16 u16DirSmoothMode;

    HI_U16 u16LumHorAdjGain;
} DB_FLT_REG_OUT_S;

typedef struct
{
    DB_DETECT_REG_OUT_S stDbDetectRegOut;
    DB_FLT_REG_OUT_S stDbFltRegOut;
} DB_REG_OUT_S;

typedef struct
{
    HI_S8  s8Detsize;
    HI_U32 u32CounterBorder;
} DETBLKINFO_S;

typedef struct
{
    HI_U32 u32HyCounterBorder;
    HI_U32 au32HyStrRow[MAXLINESIZE];
    HI_S8  s8DetSizeHy;
    HI_U8  au8BorderIndex[MAXLINESIZE];
    HI_U8  *pu8HyBorderIndex;

    HI_U8  u8HyMinBlkNum;
    HI_U8  u8HyBordCountThreshold;

    HI_U8  u8NumberWindow;
    HI_U8  u8SaturatWindow;

    HI_U8  u8keyfrm_num;

    HI_U8  u8frmsWindowTemp;
    HI_U8  u8frmsSatWindowTemp;
} DB_DETECT_DRV_IN_S;

typedef struct
{
    HI_S32 s32HyCounter;
    HI_S32 s32HySize;

    HI_S8  s8LumHBlkSize;
    HI_S32 s32LumHBlkNum;
    HI_U8  *pu8LumHorBordFlag;
    HI_U16 au16DbLumHorBlkArray[MAX_HOR_BLOCK_NUM];

    HI_U8 u8DbDetBlkNumWindow;

} DB_FLT_DRV_IN_S;

typedef struct
{
    DB_DETECT_DRV_IN_S stDbDetectDrvIn;
    DB_FLT_DRV_IN_S stDbFltDrvIn;
} DB_DRV_IN_S;

typedef struct
{
    HI_S32 s32FillBorderNumHy;
    HI_S8  as8BorderCnt[MAXLINESIZE];
    HI_S8  *ps8HyCnt;
    DETBLKINFO_S astHy[16];
    HI_U32 u32frms_NumsHy;
    HI_U8  u8frmsCntTempHy;

    HI_S8  s8UsingSizeHy;
    HI_U32 u32UsingHyCounterBorder;
    HI_U8  au8UsingBorderIndex[MAXLINESIZE];
    HI_U8  *pu8UsingHyBorderIndex;

} DB_DETECT_DRV_OUT_S;

typedef struct
{
    HI_U8 u8DbFrmCnt;
    HI_U8 au8DBTempDetBlkRatioH[4];
    HI_U8 au8DBTempDetBlkRatioV[4];

    HI_U8 u8DBLumTrue;
    HI_U8 u8DBLumHorTrue;
} DB_FLT_DRV_OUT_S;

typedef struct
{
    DB_DETECT_DRV_OUT_S stDbDetectDrvOut;
    DB_FLT_DRV_OUT_S stDbFltDrvOut;
} DB_DRV_OUT_S;

HI_S32 DB_Init(DB_PQ_IMG_INFO_S *pstDbPqImgInfo, DB_REG_IN_S *pstDbRegIn, DB_REG_OUT_S *pstDbRegOut, DB_DRV_IN_S *pstDbDrvIn, DB_DRV_OUT_S *pstDbDrvOut);
HI_S32 DB_UpdateCfg(DB_PQ_IMG_INFO_S *pstDbPqImgInfo, DB_REG_IN_S *pstDbRegIn, DB_REG_OUT_S *pstDbRegOut, DB_DRV_IN_S *pstDbDrvIn, DB_DRV_OUT_S *pstDbDrvOut);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif



