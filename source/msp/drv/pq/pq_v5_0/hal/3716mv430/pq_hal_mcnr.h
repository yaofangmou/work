/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************
  File Name     :    pq_hal_mcnr.h
  Version       :     Initial Draft
  Author        :     sdk
  Created       :   2015/11/25
  Description   :

******************************************************************************/
#ifndef __PQ_HAL_MCNR_H__
#define __PQ_HAL_MCNR_H__

#include "hi_type.h"
#include "pq_hal_comm.h"
#include "drv_pq_ext.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/* 需根据视频timing信息帧级更新的寄存器参数*/

typedef struct hiTNR_OUTPUT_REG_S
{
    HI_U8   u8MDAlpha1;
    HI_U8   u8MDAlpha2;
    HI_U8   u8MDYGain;
    HI_S8   s8MDYCore;
    HI_U8   u8MDCGain;
    HI_S8   s8MDCCore;

    HI_BOOL bMEDiscardSMVXEn;
    HI_BOOL bMEDiscardSMVYEn;
    HI_U8   u8MESMVXThd;
    HI_U8   u8MESMVYThd;
    HI_S32  s32MEMagPnlGainXMV;
    HI_S32  s32MEMagPnlCoreXMV;
    HI_S32  s32MEMagPnlGain0MV;
    HI_S32  s32MEMagPnlCore0MV;
    HI_S32  s32MEStdPnlGain;
    HI_S32  s32MEStdPnlCore;

    HI_S32  s32MEStdPnlGainXMV;
    HI_S32  s32MEStdPnlCoreXMV;
    HI_S32  s32MEStdPnlGain0MV;
    HI_S32  s32MEStdPnlCore0MV;
    HI_S32  s32MEStdCoreXMV;
    HI_S32  s32MEStdCore0MV;
    HI_S32  s32MEAdjXMVMax;
    HI_S32  s32MEAdjXMVMin;
    HI_S32  s32MEAdj0MVMax;
    HI_S32  s32MEAdj0MVMin;
    HI_U8   u8MEAdjMVMax;
    HI_U8   u8MEAdjMVMin;

    HI_U8   u8MEGMAdj;
    HI_U8   u8MCYGain;
    HI_S8   s8MCYCore;
    HI_U8   u8MCCGain;
    HI_S8   s8MCCCore;

    HI_U8   u8SCDVal;
    HI_U8   u8SaltusLevel;
    HI_S8   s8GlobalMotion;     //0-31
    HI_S8   s8NoiseLevel;

    HI_U8   au8TFYBlendingAlphaLut[32];
    HI_U8   au8TFCBlendingAlphaLut[32];

    HI_U32  u32OriGlobalMotion; //0-255  stb no use
} TNR_OUTPUT_REG_S;

typedef struct hiSNR_OUTPUT_REG_S
{
    HI_S32  s32SDIStr;
    HI_S32  s32MotionAlpha;
    HI_S32  s32SceneChange;
} SNR_OUTPUT_REG_S;

typedef struct hiMCNR_OUTPUT_REG
{
    TNR_OUTPUT_REG_S stOutTnrReg;
    SNR_OUTPUT_REG_S stOutSnrReg;
} MCNR_REG_OUT_S; // 实际配置给寄存器的

typedef enum hiMV_MODE_E
{
    BLOCK_MV_MODE  = 0,
    REGION_MV_MODE = 1 //默认值
} MV_MODE_E;

typedef struct hiNR_API_PARM_S
{
    HI_U16 u16Width;
    HI_U16 u16Height;

    HI_DRV_SOURCE_E enInputPort;

    HI_BOOL bInterlace;

    HI_BOOL bMEMotionEstimationEn;
    HI_BOOL bNDNoiseDetectEn;

    HI_S8  s8NoiseLevel;
    HI_U8  u8RawNoiseLevel;
    HI_S8  s8GlobalMotion;

    HI_U8  u8NonrgmeLevel;
    HI_U8  u8SaltusLevel;
    HI_U8  u8TextureDenseLevel;
    HI_U8  u8SCDVal;
    HI_U8  u8FrameNoAfterSC;
    HI_S32 as32PreNoiseLevel[5];
    HI_S8  s8FinalNoiseLevel[5];

    HI_S32 s32RawNoiseInfo;
    HI_S32 s32LowNLCnt;

    HI_U64 u64NoiseSum;
    HI_U64 u64NoiseCnt;

    HI_U32 u32BlkMVNum;

    HI_U8  u8Probability;
    HI_U8  au8NDpreGM[10];
    HI_U8  u8DarknessLevel;
    HI_S32 as32PreGlobalMotion[4];
    HI_S32 as32PreNonrgmeLevel[4];
    HI_S32 as32PreSaltusLevel[3];
    HI_S8  s8SaltusFlag;

    HI_U32 u32OriGlobalMotion;
} TNR_API_PARM_S; //放在drvin里面去

typedef struct hiMCNR_DRV_IN_S
{
    HI_U8  u8ARGMPnlNLOffset;
    HI_U8  u8ARMinNLRatio;
    HI_S8  s8ARNLPnlStr;
    HI_U8  u8ARNLPnlGMOffset;
    HI_U8  u8ARDarklevelThd;
    HI_U8  u8ARDarkNLMax;
    HI_U8  u8ARNDReliMax;
    HI_U8  u8ARSetNLMin;
    HI_U8  u8ARSetNLMax;
    HI_U8  u8ARSetGMMin;
    HI_U8  u8ARSetGMMax;
    HI_U8  u8ARMDAlpha1Offset;
    HI_U8  u8ARMDAlpha2Offset;
    HI_U8  u8ARFlatInfoXMin;
    HI_U8  u8ARFlatInfoXMax;
    HI_U8  u8ARFlatInfoYMin;
    HI_U8  u8ARFlatInfoYMax;
    HI_S8  s8ARMDYGain;
    HI_S8  s8ARMDYCore;
    HI_S8  s8ARMDCGain;
    HI_S8  s8ARMDCCore;
    HI_S8  s8ARMCYGain;
    HI_S8  s8ARMCYCore;
    HI_S8  s8ARMCCGain;
    HI_S8  s8ARMCCCore;

    MV_MODE_E enARRefMVMode;

    HI_S16 s16ARMagPnlGain0MV;
    HI_S16 s16ARMagPnlCore0MV;

    HI_S16 s16ARMagPnlGainXMV;
    HI_S16 s16ARMagPnlCoreXMV;

    HI_S16 s16ARStdPnlGain0MV;
    HI_S16 s16ARStdPnlCore0MV;

    HI_S16 s16ARStdPnlGainXMV;
    HI_S16 s16ARStdPnlCoreXMV;

    HI_S16 s16ARStdCore0MV;
    HI_S16 s16ARStdCoreXMV;

    HI_S16 s16ARStdPnlGain;
    HI_S16 s16ARStdPnlCore;

    HI_S16 s16ARAdj0MVMin;
    HI_S16 s16ARAdj0MVMax;
    HI_S16 s16ARAdjXMVMin;
    HI_S16 s16ARAdjXMVMax;

    HI_S16 s16ARAdjMVMax;
    HI_S16 s16ARAdjMVMin;

    HI_U8  u8ARTnrStr;
    HI_U8  u8ARCnrStr;

    TNR_API_PARM_S stTnrApiParm;
} MCNR_DRV_IN_S;  // 虚拟寄存器，初始化；

typedef struct hiRGME_PARM_S
{
    HI_S32 AUTOSET_EN;
    HI_S32 CS_UV;
    HI_S32 RS_UV;
    HI_S32 MEDS_EN;
    HI_S32 COEF0_DS;
    HI_S32 COEF1_DS;
    HI_S32 COEF2_DS;
    HI_S32 COEF3_DS;
    HI_S32 COEF4_DS;
    HI_S32 RGNUMH;
    HI_S32 RGNUMV;
    HI_S32 RGOFFSETH;
    HI_S32 RGOFFSETV;
    HI_S32 RGLSTOFFSETH;
    HI_S32 RGLSTOFFSETV;
    HI_S32 CORE_MAG_RG;
    HI_S32 LMT_MAG_RG;
    HI_S32 K_RGDIFYCORE;
    HI_S32 G_RGDIFYCORE;
    HI_S32 COEF_SADLPF;
    HI_S32 CORE_RGDIFY;
    HI_S32 LMT_RGDIFY;
    HI_S32 KMV_RGSAD;
    HI_S32 K_TPDIF_RGSAD;
    HI_S32 G_TPDIF_RGSAD;
    HI_S32 THMAG_RGMV;
    HI_S32 TH_SADDIF_RGMV;
    HI_S32 TH_0MVSAD_RGMV;
    HI_S32 CORE_MV_RGMVLS;
    HI_S32 K_MV_RGMVLS;
    HI_S32 CORE_MAG_RGMVLS;
    HI_S32 K_MAG_RGMVLS;
    HI_S32 TH_MVADJ_RGMVLS;
    HI_S32 EN_MVADJ_RGMVLS;
    HI_S32 CORE_SAD_RGPNL;
    HI_S32 K_SAD_RGPNL;
    HI_S32 G_SAD_RGPNL;
    HI_S32 TH_MAG_RGPNL;
    HI_S32 K_MAG_RGPNL;
    HI_S32 G_MAG_RGPNL;
} RGME_PARM_S; // RGME的逻辑寄存器初始化

//RGMV  DDR 信息结构
typedef struct hiMCMVStruct_S
{
    //RGMV信息,64 bit
    HI_S32 x;  //  [8:0]
    HI_U32 sad;  //[9:0]
    HI_U32 mag;   //[9:0]
    HI_S32 vstillsad;  //[9:0]
    HI_S32 mvy;    //[7:0]
    HI_U32 vsad;  //[9:0]
    HI_U32 ls;   //[3:0]
} MCMVStruct_S;

/**external pq scd param *//**CNcomment: PQ scd 参数*/
typedef struct hiSCD_PARAM_S
{
    HI_S32 SCDK_pixy;           // [0,16]
    HI_S32 SCDK1_histdiff;      // [0,1023]
    HI_S32 SCDK2_histdiff;      // [0,1023]
    HI_S32 SCDCorebin_histdiff; // [0,7]
    HI_S32 SCDKbin_histdiff;    // [0,255]

    HI_S32 SCDCore_histdiff;        // [0,255]
    HI_S32 SCDCore_sumdiff;     // [0,255]

    HI_S32 SCDK1_sumdiff;       // [0,255]
    HI_S32 SCDX1_sumdiff;       // [0,1023]
    HI_S32 SCDG1_sumdiff;       // [0,1023]
    HI_S32 SCDK2_sumdiff;       // [0,511]

    HI_S32 SCDGainH_TF;         //224; // [0,255]
    HI_S32 SCDGainL_TF;         //32;  // [0,255]
    HI_S32 SCDCore_scwdiff;     // [0,255]
    HI_S32 SCDK_scwdiff_TF;     // [0,255]

    HI_S32 SCDDivWidth;             // (1<<20)/width  -->[0,?]
    HI_S32 SCDDivHeight;                // (1<<20)/height -->[0,?]
} PQ_SCD_PARAM_S;

/**scd input  *//**CNcomment: PQ scd 软算法输入*/
typedef struct hiSCD_INPUT_S
{
    HI_S32  Width;
    HI_S32  Height;
    HI_S32  Field; //0:HI_DRV_FIELD_TOP 1:HI_DRV_FIELD_BOTTOM 2:HI_DRV_FIELD_ALL
    S_VPSS_STT_REGS_TYPE *psttReg;
    //PQ_SCD_PARAM scdPara;
} PQ_SCD_INPUT_S;

typedef struct hiSCDRLS_S
{
    HI_S32 SCW_P1;
    HI_S32 s32SCHist_P1T[32];
    HI_S32 s32SCHist_P1B[32];
    HI_S32 s32SCHist_CF[32];
} PQ_SCDRLS_S;

typedef struct hiSCD_STT_REG_S
{
    HI_S32 as32SCHistCf[32];
} SCD_STT_REG_S;

typedef struct hiTNR_STT_REG_S
{
    HI_U32 u32NDNoisePointCntMax;
    HI_U32 u32NDNoisePointCntMed;
    HI_U32 u32NDNoisePointCntMin;

    HI_U32 u32NDNoisePointNum;

    HI_U32 u32NDSumNoiseInfoMax;
    HI_U32 u32NDSumNoiseInfoMed;
    HI_U32 u32NDSumNoiseInfoMin;

    HI_U32 u32MEBlkMVHist[5];
} TNR_STT_REG_S;

typedef struct hiNR_RGMV_INFO_S
{
    HI_U16 au16MEHistMV[5];
    HI_U16 au16MEHistMag[5];
} NR_RGMV_INFO_S;

typedef struct hiTNR_INPUT_INFO_S
{
    SCD_STT_REG_S   stScdSttReg;
    TNR_STT_REG_S   stTnrSttReg;
    NR_RGMV_INFO_S  stRgmvInfo;
} TNR_INPUT_INFO_S;

typedef struct hiMCNR_STT_INFO_S
{
    S_VPSS_STT_REGS_TYPE *pstVpssWbcReg;  /* ifmd、Globlal Motion and DB的回写信息 */

    /* GlobalMotion */
    //HI_U32   u32Scd;
    HI_U32   u32Stride;
    HI_VOID *pRGMV;
} MCNR_STT_INFO_S;

typedef struct hiMCNR_IMAGE_INFO_S
{
    HI_U32 u32Width;
    HI_U32 u32Height;
    HI_BOOL bInterlace;

    MCNR_STT_INFO_S stMcnrSttInf;
} MCNR_IMAGE_INFO_S;

typedef struct hiMCNR_OUTPUT_INFO_S
{
    HI_S32 s32NoiseLevel;
    HI_S32 s32RawNoiseLevel;
    HI_S32 s32FinalNoiseLevel;

    HI_S32 s32GlobalMotion;
    HI_S32 s32RawGlobalMotion;
    HI_S32 s32FinalGlobalMotion;
} MCNR_DRV_OUT_S;

HI_S32 PQ_HAL_SetMcnrRegFromRegout(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, MCNR_REG_OUT_S *pstRegOut);
HI_S32 PQ_HAL_UpdateSpecialPara(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif


