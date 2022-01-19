/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_mcnr.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016/07/18
  Description   :

******************************************************************************/
#include "hi_math.h"
#include "drv_pq_table.h"
#include "drv_pq_comm.h"
#include "pq_hal_mcnr.h"
#include "pq_mng_mcnr.h"

#define WIDTH720                        720
#define WIDTH960                        960
#define WIDTH1280                       1280
#define WIDTH1920                       1920
#define WIDTH3840                       3840

#define HEIGHT480                       480
#define HEIGHT576                       576
#define HEIGHT720                       720
#define HEIGHT1080                      1080
#define HEIGHT2160                      2160

#define BLK_SIZE_H                      8
#define BLK_SIZE_V                      4

#define RG_SIZE_H                       64
#define RG_SIZE_V                       8

#define MIN(x, y) (((x) > (y)) ? (y) : (x))
#define MAX(x, y) (((x) > (y)) ? (x) : (y))

#define NR_MAX(a, b)                    (((a) < (b)) ?  (b) : (a))
#define NR_MIN(a, b)                    (((a) > (b)) ?  (b) : (a))
#define NR_MIN3(x, y, z)                (NR_MIN((x), NR_MIN((y), (z))))
#define NR_MAX3(x, y, z)                (NR_MAX((x), NR_MAX((y), (z))))

inline HI_S32 NR_CLIP3(HI_S32 low, HI_S32 high, HI_S32 x)
{
    HI_S32 low_value = low;
    HI_S32 high_value = high;
    HI_S32 x_value = x;
    HI_S32 temp;

    temp = MIN((high_value), (x_value));
    return MAX(temp, (low_value));
}

inline HI_S32 NR_CLIP2(HI_S32 high, HI_S32 x)
{
    HI_S32 high_value = high;
    HI_S32 x_value = x;

    return MIN((high_value), (x_value));
}

inline HI_S32 NR_CLIP(HI_S32 x)
{
    HI_S32 x_value = x;
    return (((x_value) < 0) ? 0 : (x_value));
}

inline HI_S32 NR_CLIP255(HI_S32 x)
{
    HI_S32 x_value = x;
    HI_S32 temp;
    temp = MIN((x_value), 255);
    return (MAX(temp , 0));
}

inline HI_S32 NR_CLIP1023(HI_S32 x)
{
    HI_S32 x_value = x;
    HI_S32 temp;

    temp = MIN((x_value), 1023);
    return (MAX(temp , 0));
}

#define NR_ABS(x)                       (((x) < 0) ? -(x) : (x))
#define NR_SIGN(x)                      (((x) < 0) ? (-1) : (1))

#define MCNR_Y_MAX_WIDTH  (720)
#define MCNR_Y_MIN_WIDTH  (128)

#define MCNR_SPLIT_Y_MAX_WIDTH  (1920)
#define MCNR_SPLIT_Y_MIN_WIDTH  (128)

static HI_BOOL sg_bMCNREn = HI_TRUE;

HI_S16 g_as16RGMVX[8192] = {0}; // 8192 need to double check
HI_S16 g_as16RGMVY[8192] = {0};
HI_U16 g_au16RGMVMag[8192] = {0};

HI_U16 g_u16RgmvBlkNumW = 1;
HI_U16 g_u16RgmvBlkNumH = 1;

MCNR_IMAGE_INFO_S  stMcnrImgInfo = {0};
MCNR_DRV_IN_S      stMcnrDrvIn = {0}; // 这么多参数从哪来
MCNR_REG_OUT_S     stMcnrRegOut = {{0}};
MCNR_DRV_OUT_S     stMcnrDrvOut = {0};


const static HI_U8 sg_au8TnrNoise2NoiseLut[32] =
{
    0, 1, 2, 3,    4, 5, 6, 7,    7, 8, 8, 8,    9, 9, 9, 9,
    8, 6, 5, 4,    3, 2, 2, 2,    2, 2, 2, 2,    2, 2, 2, 2
};

const static HI_U8 sg_au8TnrAlphaLut[11][32] =
{
    {12, 15, 19, 23,   27, 29, 30, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 0
    {11, 14, 17, 20,   24, 26, 28, 30,   30, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 1
    {10, 12, 15, 17,   20, 23, 26, 28,   29, 30, 30, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 2
    {10, 11, 13, 15,   17, 19, 21, 23,   25, 27, 28, 29,   30, 30, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 3
    { 9, 10, 11, 12,   13, 14, 15, 17,   20, 23, 26, 27,   28, 29, 30, 30,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 4
    { 9, 9, 10, 11,   12, 13, 14, 16,   18, 20, 23, 25,   27, 28, 29, 30,   30, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 5
    { 8, 8, 9, 10,   11, 12, 13, 14,   15, 17, 20, 23,   26, 27, 28, 29,   30, 30, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 6
    { 8, 8, 9, 9,   10, 11, 12, 13,   14, 16, 18, 20,   23, 25, 27, 28,   29, 30, 30, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 7
    { 7, 7, 8, 8,    9, 10, 11, 12,   13, 15, 16, 18,   20, 23, 25, 27,   28, 29, 30, 30,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 8
    { 7, 7, 7, 7,    8, 9, 10, 11,   12, 13, 14, 16,   18, 20, 23, 25,   27, 28, 29, 30,   30, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31}, // 9
    { 7, 7, 6, 6,    7, 7, 8, 9,   10, 12, 13, 14,   16, 19, 22, 24,   26, 27, 28, 29,   30, 30, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31} // x
};

const static HI_U8 sg_au8MaxAlphaLut[32] =
{
    4, 4, 4, 4,    5, 5, 5, 6,    6, 7, 8, 9,   10, 11, 12, 13,
    15, 17, 20, 23,   25, 27, 28, 29,   30, 30, 31, 31,   31, 31, 31, 31
};

const static HI_U8 sg_au8StrgAlphaLut[32] =
{
    1, 1, 1, 2,    2, 2, 3, 3,    4, 5, 6, 7,    8, 10, 12, 15,
    18, 20, 22, 24,   25, 26, 27, 28,   29, 30, 30, 31,   31, 31, 31, 31
};
const static HI_U8 sg_au8WeakAlphaLut[32] =
{
    21, 21, 21, 22,   22, 22, 23, 23,   24, 25, 26, 27,   28, 29, 30, 30,
    31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31,   31, 31, 31, 31
};
const static HI_U8 sg_au8MinAlphaLut[32]  =
{
    24, 15, 10, 8,    6, 5, 4, 4,    3, 3, 3, 3,    2, 2, 2, 2,
    2, 2, 2, 2,   1, 1, 1, 1,   1, 1, 1, 1,   1, 1, 1, 1
};

const static HI_U16 sg_au16Lut256[256] =
{
    10000, 9999, 9997, 9994, 9989, 9983, 9975, 9966, 9956, 9944, 9931, 9917, 9901, 9884, 9865, 9845,
    9824, 9802, 9778, 9753, 9727, 9699, 9671, 9641, 9609, 9577, 9543, 9508, 9472, 9435, 9396, 9357,
    9316, 9274, 9231, 9187, 9142, 9096, 9049, 9001, 8952, 8902, 8851, 8799, 8746, 8692, 8638, 8582,
    8526, 8469, 8411, 8353, 8293, 8233, 8173, 8111, 8049, 7986, 7923, 7859, 7795, 7730, 7664, 7598,
    7532, 7465, 7397, 7330, 7261, 7193, 7124, 7055, 6985, 6916, 6846, 6775, 6705, 6634, 6564, 6493,
    6422, 6351, 6279, 6208, 6137, 6065, 5994, 5923, 5851, 5780, 5709, 5638, 5567, 5496, 5425, 5355,
    5285, 5215, 5145, 5075, 5006, 4936, 4868, 4799, 4731, 4663, 4595, 4528, 4461, 4395, 4328, 4263,
    4197, 4133, 4068, 4004, 3941, 3878, 3815, 3753, 3692, 3630, 3570, 3510, 3450, 3391, 3333, 3275,
    3218, 3161, 3105, 3049, 2994, 2940, 2886, 2833, 2780, 2728, 2677, 2626, 2576, 2526, 2477, 2429,
    2381, 2334, 2287, 2242, 2196, 2152, 2107, 2064, 2021, 1979, 1937, 1896, 1856, 1816, 1777, 1739,
    1701, 1663, 1626, 1590, 1555, 1520, 1485, 1451, 1418, 1385, 1353, 1322, 1291, 1260, 1230, 1201,
    1172, 1144, 1116, 1089, 1062, 1036, 1010,  985,  960,  936,  912,  889,  866,  844,  822,  801,
    780,  759,  739,  720,  700,  682,  663,  645,  628,  611,  594,  577,  561,  546,  530,  515,
    501,  487,  473,  459,  446,  433,  420,  408,  396,  384,  373,  362,  351,  340,  330,  320,
    310,  301,  292,  283,  274,  265,  257,  249,  241,  234,  226,  219,  212,  205,  198,  192,
    186,  180,  174,  168,  162,  157,  152,  147,  142,  137,  132,  128,  123,  119,  115,  111
};


HI_S32 PQ_MNG_MCNR_RgmeReg_Init(RGME_PARM_S *pstRgmeParm)
{
    pstRgmeParm->AUTOSET_EN      =    1;
    pstRgmeParm->CS_UV           =    0;
    pstRgmeParm->RS_UV           =    0;
    pstRgmeParm->MEDS_EN         =    0;
    pstRgmeParm->COEF0_DS        =    1;
    pstRgmeParm->COEF1_DS        =    4;
    pstRgmeParm->COEF2_DS        =    6;
    pstRgmeParm->COEF3_DS        =    4;
    pstRgmeParm->COEF4_DS        =    1;
    pstRgmeParm->RGNUMH          =   32;
    pstRgmeParm->RGNUMV          =   32;
    pstRgmeParm->RGOFFSETH       =   32;
    pstRgmeParm->RGOFFSETV       =    8;
    pstRgmeParm->RGLSTOFFSETH    =    0;
    pstRgmeParm->RGLSTOFFSETV    =    0;
    pstRgmeParm->CORE_MAG_RG     =    3;
    pstRgmeParm->LMT_MAG_RG      =  255;
    pstRgmeParm->K_RGDIFYCORE    =    2;
    pstRgmeParm->G_RGDIFYCORE    = 1023;
    pstRgmeParm->COEF_SADLPF     =    1;
    pstRgmeParm->CORE_RGDIFY     =    7;
    pstRgmeParm->LMT_RGDIFY      =  511;
    pstRgmeParm->KMV_RGSAD       =   32;
    pstRgmeParm->K_TPDIF_RGSAD   =   16;
    pstRgmeParm->G_TPDIF_RGSAD   =  255;
    pstRgmeParm->THMAG_RGMV      =    0;
    pstRgmeParm->TH_SADDIF_RGMV  =  256;
    pstRgmeParm->TH_0MVSAD_RGMV  =  512;
    pstRgmeParm->CORE_MV_RGMVLS  =   15;
    pstRgmeParm->K_MV_RGMVLS     =   16;
    pstRgmeParm->CORE_MAG_RGMVLS =   63;
    pstRgmeParm->K_MAG_RGMVLS    =    8;
    pstRgmeParm->TH_MVADJ_RGMVLS =    8;
    pstRgmeParm->EN_MVADJ_RGMVLS =    1;
    pstRgmeParm->CORE_SAD_RGPNL  =  512;
    pstRgmeParm->K_SAD_RGPNL     =    8;
    pstRgmeParm->G_SAD_RGPNL     =   16;
    pstRgmeParm->TH_MAG_RGPNL    =  160;
    pstRgmeParm->K_MAG_RGPNL     =   32;
    pstRgmeParm->G_MAG_RGPNL     =   16;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_MCNR_DrvInApi_Init(HI_U16 u16Width, HI_U16 u16Height, HI_BOOL bInterlace, TNR_API_PARM_S *stTnrApiParm)
{
    HI_S32 i;

    stTnrApiParm->bInterlace = bInterlace;
    stTnrApiParm->u16Width   = u16Width;
    stTnrApiParm->u16Height  = u16Height;
    // 4 STB set HI_DRV_SOURCE_HDMI
    stTnrApiParm->enInputPort = HI_DRV_SOURCE_HDMI;

    stTnrApiParm->u8FrameNoAfterSC = 0;

    stTnrApiParm->as32PreNoiseLevel[0] = 2;
    stTnrApiParm->as32PreNoiseLevel[1] = 2;
    stTnrApiParm->as32PreNoiseLevel[2] = 2;
    stTnrApiParm->as32PreNoiseLevel[3] = 2;
    stTnrApiParm->as32PreNoiseLevel[4] = 2;

    stTnrApiParm->s8FinalNoiseLevel[0] = 2;
    stTnrApiParm->s8FinalNoiseLevel[1] = 2;
    stTnrApiParm->s8FinalNoiseLevel[2] = 2;
    stTnrApiParm->s8FinalNoiseLevel[3] = 2;
    stTnrApiParm->s8FinalNoiseLevel[4] = 2;

    stTnrApiParm->s32LowNLCnt = 0;

    for (i = 0; i < 10; i++)
    {
        stTnrApiParm->au8NDpreGM[i] = 7;
    }

    if (stTnrApiParm->u16Width < WIDTH1280)
    {
        stTnrApiParm->as32PreGlobalMotion[0] = 12;
        stTnrApiParm->as32PreGlobalMotion[1] = 12;
        stTnrApiParm->as32PreGlobalMotion[2] = 12;
        stTnrApiParm->as32PreGlobalMotion[3] = 12;

        stTnrApiParm->as32PreNonrgmeLevel[0] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[1] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[2] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[3] = 23;
    }
    else
    {
        stTnrApiParm->as32PreGlobalMotion[0] = 10;
        stTnrApiParm->as32PreGlobalMotion[1] = 10;
        stTnrApiParm->as32PreGlobalMotion[2] = 10;
        stTnrApiParm->as32PreGlobalMotion[3] = 10;

        stTnrApiParm->as32PreNonrgmeLevel[0] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[1] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[2] = 23;
        stTnrApiParm->as32PreNonrgmeLevel[3] = 23;
    }

    stTnrApiParm->as32PreSaltusLevel[0] = 0;
    stTnrApiParm->as32PreSaltusLevel[1] = 0;
    stTnrApiParm->as32PreSaltusLevel[2] = 0;

    stTnrApiParm->s8SaltusFlag = 0;

    return HI_SUCCESS;

}

HI_VOID PQ_MNG_MCNR_DrvIn_Init(MCNR_DRV_IN_S *pstMcnrDrvIn) //
{
    PQ_CHECK_NULL_PTR_RE_NULL(pstMcnrDrvIn);

    pstMcnrDrvIn->u8ARGMPnlNLOffset  =    9;
    pstMcnrDrvIn->u8ARNLPnlGMOffset  =    9;
    pstMcnrDrvIn->u8ARMinNLRatio     =    5;
    pstMcnrDrvIn->s8ARNLPnlStr       =    6;
    pstMcnrDrvIn->u8ARDarklevelThd   =   20;
    pstMcnrDrvIn->u8ARDarkNLMax      =    8;
    pstMcnrDrvIn->u8ARNDReliMax      =   48;
    pstMcnrDrvIn->u8ARSetNLMin       =    0;
    pstMcnrDrvIn->u8ARSetNLMax       =   31;
    pstMcnrDrvIn->u8ARSetGMMin       =    0;
    pstMcnrDrvIn->u8ARSetGMMax       =   31;
    pstMcnrDrvIn->u8ARMDAlpha1Offset =    3;
    pstMcnrDrvIn->u8ARMDAlpha2Offset =    8;
    pstMcnrDrvIn->u8ARFlatInfoXMin   =    0;
    pstMcnrDrvIn->u8ARFlatInfoXMax   =   56;
    pstMcnrDrvIn->u8ARFlatInfoYMin   =    0;
    pstMcnrDrvIn->u8ARFlatInfoYMax   =   63;
    pstMcnrDrvIn->s8ARMDYGain        =   24;
    pstMcnrDrvIn->s8ARMDYCore        =   -5;
    pstMcnrDrvIn->s8ARMDCGain        =   24;
    pstMcnrDrvIn->s8ARMDCCore        =   -5;
    pstMcnrDrvIn->s8ARMCYGain        =   15;
    pstMcnrDrvIn->s8ARMCYCore        =    3;
    pstMcnrDrvIn->s8ARMCCGain        =   15;
    pstMcnrDrvIn->s8ARMCCCore        =    3;
    pstMcnrDrvIn->enARRefMVMode      =    REGION_MV_MODE;
    pstMcnrDrvIn->s16ARMagPnlGain0MV =  127;
    pstMcnrDrvIn->s16ARMagPnlCore0MV =   63;
    pstMcnrDrvIn->s16ARMagPnlGainXMV =  127;
    pstMcnrDrvIn->s16ARMagPnlCoreXMV =   63;
    pstMcnrDrvIn->s16ARStdPnlGain0MV =   16;
    pstMcnrDrvIn->s16ARStdPnlCore0MV =   16;
    pstMcnrDrvIn->s16ARStdPnlGainXMV =   16;
    pstMcnrDrvIn->s16ARStdPnlCoreXMV =   16;
    pstMcnrDrvIn->s16ARStdCore0MV    =   28;
    pstMcnrDrvIn->s16ARStdCoreXMV    =    0;
    pstMcnrDrvIn->s16ARStdPnlGain    =   31;
    pstMcnrDrvIn->s16ARStdPnlCore    =    0;
    pstMcnrDrvIn->s16ARAdj0MVMin     =    4;
    pstMcnrDrvIn->s16ARAdj0MVMax     =   16;
    pstMcnrDrvIn->s16ARAdjXMVMin     =    4;
    pstMcnrDrvIn->s16ARAdjXMVMax     =   16;
    pstMcnrDrvIn->s16ARAdjMVMax      =   24;
    pstMcnrDrvIn->s16ARAdjMVMin      =   10;
    pstMcnrDrvIn->u8ARTnrStr         =   16;
    pstMcnrDrvIn->u8ARCnrStr         =   16;
}

HI_S32 PQ_MNG_TNR_CalcGlobalMotion(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_U32 au32MEHistMV[5],
                                   HI_U32 au32MEHistMag[5], HI_S32 *ps32GlobalMotion, HI_S32 *pNonrgmeLevel, HI_U32 u32BlkMVNum, HI_U16 u16RgMVNum)
{
    HI_U64 u64TmpGM = 0;
    HI_U64 u64TmpValue = 0;
    HI_U64 u64TmpRG = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(ps32GlobalMotion);
    PQ_CHECK_NULL_PTR_RE_FAIL(pNonrgmeLevel);

    if (pstMcnrDrvIn->stTnrApiParm.u16Width <= WIDTH960)
    {
        u64TmpValue = (HI_S64)640000 * (au32MEHistMV[1] + au32MEHistMV[2] + 2 * au32MEHistMV[3] + 4 * au32MEHistMV[4]);

        do_div(u64TmpValue, 8);
        u64TmpGM = u64TmpValue;
        do_div(u64TmpGM, u32BlkMVNum);

        *ps32GlobalMotion = (HI_S32)NR_CLIP3(0, 320000, u64TmpGM);

        u64TmpValue = (HI_S64)40000 * (8 * au32MEHistMag[0] + 4 * au32MEHistMag[1] + 2 * au32MEHistMag[2] + au32MEHistMag[3] + au32MEHistMag[4]);

        u64TmpRG = u64TmpValue;
        do_div(u64TmpRG, u16RgMVNum);

        *pNonrgmeLevel = (HI_S32)NR_CLIP3(0, 240000, u64TmpRG);
    }
    else if (pstMcnrDrvIn->stTnrApiParm.u16Width <= WIDTH1920)
    {
        u64TmpValue = (HI_S64)640000 * (au32MEHistMV[1] + au32MEHistMV[2] + 3 * au32MEHistMV[3] + au32MEHistMV[4]);

        do_div(u64TmpValue, 6);
        u64TmpGM = u64TmpValue;
        do_div(u64TmpGM, u32BlkMVNum);

        *ps32GlobalMotion = (HI_S32)NR_CLIP3(0, 320000, u64TmpGM);

        u64TmpValue = (HI_S64)40000 * (5 * au32MEHistMag[0] + 4 * au32MEHistMag[1] + 4 * au32MEHistMag[2] + 2 * au32MEHistMag[3] + au32MEHistMag[4]);

        u64TmpRG = u64TmpValue;
        do_div(u64TmpRG, u16RgMVNum);

        *pNonrgmeLevel = (HI_S32)NR_CLIP3(0, 240000, u64TmpRG);
    }
    else
    {
        u64TmpValue = (HI_S64)640000 * (au32MEHistMV[1] + 2 * au32MEHistMV[2] + 2 * au32MEHistMV[3] + au32MEHistMV[4]);

        do_div(u64TmpValue, 6);
        u64TmpGM = u64TmpValue;
        do_div(u64TmpGM, u32BlkMVNum);

        *ps32GlobalMotion = (HI_S32)NR_CLIP3(0, 320000, u64TmpGM);

        u64TmpValue = (HI_S64)40000 * (5 * au32MEHistMag[0] + 4 * au32MEHistMag[1] + 4 * au32MEHistMag[2] + 2 * au32MEHistMag[3] + au32MEHistMag[4]);

        u64TmpRG = u64TmpValue;
        do_div(u64TmpRG, u16RgMVNum);

        *pNonrgmeLevel = (HI_S32)NR_CLIP3(0, 240000, u64TmpRG);
    }

    pstMcnrDrvIn->stTnrApiParm.u32OriGlobalMotion = NR_CLIP3(0, 256, (HI_S32)(u64TmpGM >> 10) - 15);

    return HI_SUCCESS;
}

static HI_S32 PQ_MNG_TNR_CalcSaltValue(HI_S32 s32GlobalMotion, HI_S32 s32MeanPreGM, HI_S32 *pSaltusVal)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pSaltusVal);

    if (s32GlobalMotion <= 30000)
    {
        *pSaltusVal = 0;
    }
    else
    {
        if (s32GlobalMotion - s32MeanPreGM < 20000)
        {
            *pSaltusVal = 0;
        }
        else
        {
            *pSaltusVal = NR_CLIP(10000 * s32GlobalMotion / s32MeanPreGM - 10000);
        }
    }

    return HI_SUCCESS;
}

static HI_S32 PQ_MNG_TNR_CalcSaltLevel(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_DRV_SOURCE_E enSource, HI_S32 *pSaltusLevel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pSaltusLevel);

    *pSaltusLevel = NR_CLIP3(0, 310000, (*pSaltusLevel) * 10 + 5);

    if (*pSaltusLevel >= 100000)
    {
        pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag = 1;
    }

    pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag = pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag - 1;

    if (pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag < -2)
    {
        pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag = -2;
    }

    if (*pSaltusLevel >= pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[2] || (*pSaltusLevel) >= pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[1])
    {
        *pSaltusLevel = (pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[1] + pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[2] + 6 * (*pSaltusLevel)) / 8;
    }
    else if ((pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag < 0) && (pstMcnrDrvIn->stTnrApiParm.s8SaltusFlag > -4))
    {
        *pSaltusLevel = (pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[2] + (*pSaltusLevel)) / 2;
    }
    else
    {
        *pSaltusLevel = (pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[0] +
                         pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[1] +
                         2 * pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[2] + 4 * (*pSaltusLevel)) / 8;
    }

    return HI_SUCCESS;
}

static HI_S32 PQ_MNG_TNR_CalcNonrgmeLevel(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_S32 s32SaltusLevel,
        HI_DRV_SOURCE_E enSource, HI_S32 s32NonrgmeLevel, HI_S32 s32GlobalMotion)
{
    HI_S32 i = 0;

    for (i = 0; i < 2; i++)
    {
        pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[i]  = pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[i + 1];
    }

    pstMcnrDrvIn->stTnrApiParm.as32PreSaltusLevel[i] = s32SaltusLevel;

    for (i = 0; i < 3; i++)
    {
        pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[i] = pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[i + 1];
        pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[i] = pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[i + 1];
    }

    pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[i] = s32GlobalMotion;
    pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[i] = s32NonrgmeLevel;

    pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel = (HI_U8)NR_CLIP3(0, 31, (s32SaltusLevel + 5000) / 10000);

    pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion = (HI_U8)NR_CLIP3(0, 31, (s32GlobalMotion + 5000) / 10000);

    pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = (HI_U8)NR_CLIP3(0, 24, (s32NonrgmeLevel + 5000) / 10000);

    if (pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion == 0)
    {
        pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = (HI_U8)NR_CLIP3(0, 21, pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel);
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = (HI_U8)NR_CLIP3(0, 24, pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel - NR_CLIP(1 - pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion));
    }

    return HI_SUCCESS;
}


HI_U32 PQ_MNG_TNR_GetRgNumH(MCNR_DRV_IN_S *pstMcnrDrvIn)
{
    if (pstMcnrDrvIn->stTnrApiParm.u16Width > WIDTH960)
    {
        return (pstMcnrDrvIn->stTnrApiParm.u16Width / 2 + (RG_SIZE_H / 2 + 1)) / RG_SIZE_H;
    }
    else
    {
        return (pstMcnrDrvIn->stTnrApiParm.u16Width + (RG_SIZE_H / 2 + 1)) / RG_SIZE_H;
    }
}

HI_U32 PQ_MNG_TNR_GetRgNumV(MCNR_DRV_IN_S *pstMcnrDrvIn)
{
    if (pstMcnrDrvIn->stTnrApiParm.bInterlace == HI_TRUE)   /* Field Mode - 场模式 */
    {
        return (pstMcnrDrvIn->stTnrApiParm.u16Height / 2 + (RG_SIZE_V / 2 + 1)) / RG_SIZE_V;
    }
    else                                        /* Frame Mode - 帧模式 */
    {
        return (pstMcnrDrvIn->stTnrApiParm.u16Height + (RG_SIZE_V / 2 + 1)) / RG_SIZE_V;
    }
}

HI_S32 pq_mng_mcnr_CopyU32ByBitWithSignal(HI_U32 u32Src, HI_U32 u32SrcStartBit, HI_S32 *pu32Dst, HI_U32 u32DstStartBit, HI_U32 u32Num)
{
    HI_U32 u32SrcTmp = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu32Dst);
    if (((u32SrcStartBit + u32Num) > 32) || (u32DstStartBit + u32Num) > 32)
    {
        return HI_FAILURE;
    }

    /* 保存src需要拷贝的u32Num个bits，并移动到dst指定的位置; 将高位清0 */
    u32SrcTmp = u32Src << (32 - u32SrcStartBit - u32Num);

    /* 将指定的u32Num位移到低bit位上 */
    u32SrcTmp = u32SrcTmp >> (32 - u32Num);

    if (((u32SrcTmp >> ( u32Num - 1)) & 0x1) == 1)
    {
        //*pu32Dst = ((u32SrcTmp&((1<<u32Num) -1)) - (1<<u32Num));
        *pu32Dst = 0 - ((u32SrcTmp ^ ((1 << u32Num) - 1)) + 1);
    }
    else
    {
        *pu32Dst = u32SrcTmp & ((1 << u32Num) - 1);
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_GlobalMotionEstimation(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_INPUT_INFO_S *pstInputInfo)
{
    HI_U32 au32MEHistMV[5] = {0};
    HI_U32 au32MEHistMag[5] = {0};

    HI_S32 s32GlobalMotion = 0;
    HI_S32 s32SaltusLevel = 0;
    HI_U32 u32BlkMVNum = 0;
    HI_U16 u16RgMVNum = 0;

    HI_S32 s32MeanPreGM;
    HI_S32 s32NonrgmeLevel = 0;
    HI_U32 u32RGNUMH, u32RGNUMV;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstInputInfo);

    u32RGNUMH = PQ_MNG_TNR_GetRgNumH(pstMcnrDrvIn);
    u32RGNUMV = PQ_MNG_TNR_GetRgNumV(pstMcnrDrvIn);

    if ((u32RGNUMH <= 2) || (u32RGNUMV <= 2))
    {
        return HI_FAILURE;
    }

    u16RgMVNum = (u32RGNUMV - 2) * (u32RGNUMH - 2);

    au32MEHistMag[0] = pstInputInfo->stRgmvInfo.au16MEHistMag[0];
    au32MEHistMag[1] = pstInputInfo->stRgmvInfo.au16MEHistMag[1];
    au32MEHistMag[2] = pstInputInfo->stRgmvInfo.au16MEHistMag[2];
    au32MEHistMag[3] = pstInputInfo->stRgmvInfo.au16MEHistMag[3];
    au32MEHistMag[4] = pstInputInfo->stRgmvInfo.au16MEHistMag[4];


    au32MEHistMV[0] = pstInputInfo->stRgmvInfo.au16MEHistMV[0];
    au32MEHistMV[1] = pstInputInfo->stRgmvInfo.au16MEHistMV[1];
    au32MEHistMV[2] = pstInputInfo->stRgmvInfo.au16MEHistMV[2];
    au32MEHistMV[3] = pstInputInfo->stRgmvInfo.au16MEHistMV[3];
    au32MEHistMV[4] = pstInputInfo->stRgmvInfo.au16MEHistMV[4];

    u32BlkMVNum = u16RgMVNum;

    PQ_MNG_TNR_CalcGlobalMotion(pstMcnrDrvIn, au32MEHistMV, au32MEHistMag, &s32GlobalMotion, &s32NonrgmeLevel, u32BlkMVNum, u16RgMVNum);
    s32MeanPreGM = (pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[1] +
                    pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[2] +
                    pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[3]) / 3;

    if (s32MeanPreGM < 10000)
    {
        s32MeanPreGM = 10000;
    }

    PQ_MNG_TNR_CalcSaltValue(s32GlobalMotion, s32MeanPreGM, &s32SaltusLevel);
    PQ_MNG_TNR_CalcSaltLevel(pstMcnrDrvIn, pstMcnrDrvIn->stTnrApiParm.enInputPort, &s32SaltusLevel);

    if (s32SaltusLevel >= 20000)
    {
        s32GlobalMotion = (pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[2] +
                           pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[3] + 6 * s32GlobalMotion) / 8;
    }
    else
    {
        s32GlobalMotion = (pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[0] +
                           pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[1] +
                           pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[2] +
                           pstMcnrDrvIn->stTnrApiParm.as32PreGlobalMotion[3] + s32GlobalMotion) / 5;
    }

    s32NonrgmeLevel = (pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[0] +
                       pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[1] +
                       pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[2] +
                       pstMcnrDrvIn->stTnrApiParm.as32PreNonrgmeLevel[3] + s32NonrgmeLevel) / 5;

    PQ_MNG_TNR_CalcNonrgmeLevel(pstMcnrDrvIn, s32SaltusLevel, pstMcnrDrvIn->stTnrApiParm.enInputPort, s32NonrgmeLevel, s32GlobalMotion);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_UpdateMDReg(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_OUTPUT_REG_S *pstOutReg)
{
    HI_S32 s32NoiseLevel = (HI_S32)NR_CLIP(pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel - NR_CLIP(pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel - 12));

    pstOutReg->u8MDAlpha1 = NR_CLIP3(0, 4, s32NoiseLevel - pstMcnrDrvIn->u8ARMDAlpha1Offset);
    pstOutReg->u8MDAlpha2 = NR_CLIP3(0, 3, s32NoiseLevel - pstMcnrDrvIn->u8ARMDAlpha2Offset);

    if (pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel >= 5)
    {
        pstOutReg->u8MDAlpha1 = NR_CLIP3(0, 4, s32NoiseLevel - 6);
        pstOutReg->u8MDAlpha2 = NR_CLIP3(0, 4, s32NoiseLevel - 10);
    }

    pstOutReg->u8MDYGain = NR_CLIP3(  0, 63, pstMcnrDrvIn->s8ARMDYGain);
    pstOutReg->s8MDYCore = NR_CLIP3(-16, 15, pstMcnrDrvIn->s8ARMDYCore + NR_CLIP3(0, 9, NR_CLIP(s32NoiseLevel - 8) / 2));

    pstOutReg->u8MDCGain = NR_CLIP3(  0, 63, pstMcnrDrvIn->s8ARMDCGain);
    pstOutReg->s8MDCCore = NR_CLIP3(-16, 15, pstMcnrDrvIn->s8ARMDCCore + NR_CLIP3(0, 9, NR_CLIP(s32NoiseLevel - 8) / 2));

    pqprint(PQ_PRN_TNR, "u8MDAlpha1 = %d,u8MDAlpha2 = %d,u8MDYGain = %d,s8MDYCore = %d,u8MDCGain = %d,s8MDCCore = %d\n",
            pstOutReg->u8MDAlpha1,
            pstOutReg->u8MDAlpha2,
            pstOutReg->u8MDYGain,
            pstOutReg->s8MDYCore,
            pstOutReg->u8MDCGain,
            pstOutReg->s8MDCCore);

    return HI_SUCCESS;
}

HI_VOID PQ_MNG_TNR_DiscardMV(HI_S32 s32GlobalMotion, TNR_OUTPUT_REG_S *pstOutReg)
{
    if (s32GlobalMotion <= 3)
    {
        pstOutReg->bMEDiscardSMVXEn = HI_TRUE;
        pstOutReg->bMEDiscardSMVYEn = HI_TRUE;

        pstOutReg->u8MESMVXThd = 4;
        pstOutReg->u8MESMVYThd = 6;
    }
    else if (s32GlobalMotion <= 5)
    {
        pstOutReg->bMEDiscardSMVXEn = HI_TRUE;
        pstOutReg->bMEDiscardSMVYEn = HI_TRUE;

        pstOutReg->u8MESMVXThd = 3;
        pstOutReg->u8MESMVYThd = 5;
    }
    else
    {
        pstOutReg->bMEDiscardSMVXEn = HI_FALSE;
        pstOutReg->bMEDiscardSMVYEn = HI_FALSE;

        pstOutReg->u8MESMVXThd = 0;
        pstOutReg->u8MESMVYThd = 0;
    }
}


HI_S32 PQ_MNG_TNR_UpdateMEReg(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_OUTPUT_REG_S *pstOutReg)
{
    HI_S32 as32GMAdiLut1[7] = {6, 5, 4, 3, 2, 1, 0};
    //HI_S32 as32GMAdiLut2[7] = {0, 1, 2, 3, 2, 1, 0};

    HI_S32 s32GlobalMotion = pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion;
    HI_S32 s32NoiseLevel   = pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel;
    HI_S32 s32DarknessLevel = (HI_S32)pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel;

    PQ_MNG_TNR_DiscardMV(s32GlobalMotion, pstOutReg);

    pstOutReg->s32MEMagPnlGain0MV = NR_CLIP3(0, 256, pstMcnrDrvIn->s16ARMagPnlGain0MV - s32GlobalMotion);
    pstOutReg->s32MEMagPnlCore0MV = NR_CLIP1023(pstMcnrDrvIn->s16ARMagPnlCore0MV - 8 * s32GlobalMotion);

    pstOutReg->s32MEMagPnlGainXMV = NR_CLIP3(0, 256, pstMcnrDrvIn->s16ARMagPnlGainXMV + 10 * s32GlobalMotion);
    pstOutReg->s32MEMagPnlCoreXMV = NR_CLIP1023(pstMcnrDrvIn->s16ARMagPnlCoreXMV - 14 * NR_CLIP(NR_CLIP3(0, 8, s32GlobalMotion) - NR_CLIP(s32NoiseLevel - 7)));

    pstOutReg->s32MEStdPnlGain0MV = pstMcnrDrvIn->s16ARStdPnlGain0MV;
    pstOutReg->s32MEStdPnlCore0MV = NR_CLIP3(10, 16, pstMcnrDrvIn->s16ARStdPnlCore0MV - as32GMAdiLut1[NR_CLIP3(0, 6, s32GlobalMotion)] - 2 * NR_CLIP(s32NoiseLevel - 8));

    pstOutReg->s32MEStdPnlGainXMV = NR_CLIP3(10, 16, pstMcnrDrvIn->s16ARStdPnlGainXMV - 3 * NR_CLIP(s32NoiseLevel - 8) / 2);
    pstOutReg->s32MEStdPnlCoreXMV = pstMcnrDrvIn->s16ARStdPnlCoreXMV;

    pstOutReg->s32MEStdCore0MV    = pstMcnrDrvIn->s16ARStdCore0MV;
    pstOutReg->s32MEStdCoreXMV    = NR_CLIP3(0, 16, pstMcnrDrvIn->s16ARStdCoreXMV * (s32NoiseLevel - 7) / 2);

    pstOutReg->s32MEStdPnlGain    = pstMcnrDrvIn->s16ARStdPnlGain;
    pstOutReg->s32MEStdPnlCore    = NR_CLIP3(0, 16, pstMcnrDrvIn->s16ARStdPnlCore * (s32NoiseLevel - 7));

    pstOutReg->s32MEAdj0MVMin     = pstMcnrDrvIn->s16ARAdj0MVMin;
    pstOutReg->s32MEAdj0MVMax     = pstMcnrDrvIn->s16ARAdj0MVMax;
    pstOutReg->s32MEAdjXMVMin     = pstMcnrDrvIn->s16ARAdjXMVMin;
    pstOutReg->s32MEAdjXMVMax     = pstMcnrDrvIn->s16ARAdjXMVMax;

    if (pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel <= 0)
    {
        if (pstMcnrDrvIn->stTnrApiParm.u16Width <= 960)
        {
            pstOutReg->u8MEAdjMVMax = NR_CLIP3(16, 31, pstMcnrDrvIn->s16ARAdjMVMax
                                               - 3 * NR_CLIP(s32NoiseLevel - 8) / 2
                                               - 3 * NR_CLIP(s32GlobalMotion - 7) / 2
                                               - 3 * NR_CLIP(3 - s32GlobalMotion) * NR_CLIP3(0, 4, s32NoiseLevel - 3) * NR_CLIP3(0, 2, s32DarknessLevel - 17));
            pstOutReg->u8MEAdjMVMin = NR_CLIP3(0, 16, pstMcnrDrvIn->s16ARAdjMVMin
                                               + 3 * NR_CLIP(s32NoiseLevel - 8) / 2
                                               + NR_CLIP(s32GlobalMotion - 6)
                                               + 2 * NR_CLIP(3 - s32GlobalMotion) * NR_CLIP3(0, 3, s32NoiseLevel - 4) * NR_CLIP3(0, 2, s32DarknessLevel - 17));
        }
        else
        {
            pstOutReg->u8MEAdjMVMax = NR_CLIP3(16, 31, pstMcnrDrvIn->s16ARAdjMVMax
                                               - 3 * NR_CLIP(s32NoiseLevel - 8) / 2
                                               - 3 * NR_CLIP(s32GlobalMotion - 7)
                                               - 3 * NR_CLIP(3 - s32GlobalMotion) * NR_CLIP3(0, 4, s32NoiseLevel - 3) * NR_CLIP3(0, 2, s32DarknessLevel - 17));
            pstOutReg->u8MEAdjMVMin = NR_CLIP3(0, 16, pstMcnrDrvIn->s16ARAdjMVMin
                                               + NR_CLIP(s32NoiseLevel - 8) / 2
                                               + NR_CLIP(s32GlobalMotion - 7)
                                               + 2 * NR_CLIP(3 - s32GlobalMotion) * NR_CLIP3(0, 3, s32NoiseLevel - 4) * NR_CLIP3(0, 2, s32DarknessLevel - 17));
        }
    }
    else
    {
        pstOutReg->u8MEAdjMVMax = NR_CLIP3(16, 31, pstMcnrDrvIn->s16ARAdjMVMax);
        pstOutReg->u8MEAdjMVMin = NR_CLIP3(0,  16, pstMcnrDrvIn->s16ARAdjMVMin);
    }

    if (pstMcnrDrvIn->stTnrApiParm.u16Width <= 960)
    {
        pstOutReg->u8MEGMAdj = NR_CLIP3(0, 4, s32GlobalMotion - 2);
    }
    else
    {
        pstOutReg->u8MEGMAdj = NR_CLIP3(0, 4, s32GlobalMotion - 3);
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_UpdateMCReg(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_OUTPUT_REG_S *pstOutReg)
{
    HI_S32 as32GMGainLut[16] = { 0, 0, 0, 1,    1, 2, 3, 4,    5, 5, 6, 6,    6, 6, 6, 6};
    HI_S32 as32NLGainLut[24] = { 0, 0, 0, 0,    0, 0, -1, -2,   -3, -4, -5, -6,   -7, -8, -8, -9,   -9, -9, -10, -10,   -10, -11, -11, -11};

    HI_S32 s32NoiseLevel   = pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel;
    HI_S32 s32GlobalMotion = pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion;

    pstOutReg->u8SaltusLevel = NR_CLIP3(0, 15, (HI_S32)pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel - 1);

    pstOutReg->u8MCYGain     = NR_CLIP3(0, 31, pstMcnrDrvIn->s8ARMCYGain + as32GMGainLut[NR_CLIP3(0, 15, s32GlobalMotion)]
                                        + as32NLGainLut[NR_CLIP3(0, 23, s32NoiseLevel - 6)]);
    pstOutReg->s8MCYCore     = NR_CLIP3(0, 31, pstMcnrDrvIn->s8ARMCYCore);

    pstOutReg->u8MCCGain     = NR_CLIP3(0, 31, pstMcnrDrvIn->s8ARMCCGain + as32GMGainLut[NR_CLIP3(0, 15, s32GlobalMotion)]
                                        + as32NLGainLut[NR_CLIP3(0, 23, s32NoiseLevel - 6)]);
    pstOutReg->s8MCCCore     = NR_CLIP3(0, 31, pstMcnrDrvIn->s8ARMCCCore);

    pqprint(PQ_PRN_TNR, "u8SaltusLevel = %d,u8MCYGain = %d,s8MCYCore = %d,u8MCCGain = %d,s8MCCCore = %d\n",
            pstOutReg->u8SaltusLevel,
            pstOutReg->u8MCYGain,
            pstOutReg->s8MCYCore,
            pstOutReg->u8MCCGain,
            pstOutReg->s8MCCCore);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_GetBlendingMin(MCNR_DRV_IN_S *pstMcnrDrvIn)
{
    HI_S32 s32BlendingMin = 0;
    if (pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC >= 63)
    {
        pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC = 63;
    }

    s32BlendingMin = (HI_S32)sg_au8MinAlphaLut[pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC >> 1];

    if (pstMcnrDrvIn->stTnrApiParm.bInterlace)
    {
        pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC += 1;
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC += 2;
    }

    if (pstMcnrDrvIn->stTnrApiParm.u8SCDVal >= 255)
    {
        pstMcnrDrvIn->stTnrApiParm.u8FrameNoAfterSC = 0;
    }
    pqprint(PQ_PRN_TNR, "s32BlendingMin = %d\n", s32BlendingMin);

    return s32BlendingMin;
}



HI_S32 PQ_MNG_TNR_UpdateTFReg(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_OUTPUT_REG_S *pstOutReg)
{
    HI_S32 i;
    HI_S32 s32NoiseLevel, s32MedNL = 0;
    HI_S32 s32TextureDenseLevel;

    HI_S32 s32BlendingMin;

    HI_U32 au32YTFLut[32];
    HI_U32 au32CTFLut[32];

    HI_S32 s32YNrStr;
    HI_S32 s32CNrStr;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstOutReg);

    s32BlendingMin = PQ_MNG_TNR_GetBlendingMin(pstMcnrDrvIn);

    s32NoiseLevel = NR_CLIP3(0, 15, pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel * (20 - NR_CLIP2(20, (HI_S32)pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel - 3)) / 20);

    s32NoiseLevel = sg_au8TnrNoise2NoiseLut[s32NoiseLevel];

    s32MedNL = s32NoiseLevel;

    for (i = 0; i < 4; i++)
    {
        s32MedNL += pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel[i];
        pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel[i] = pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel[i + 1];
    }
    s32MedNL += pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel[i];
    pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel[i] = s32NoiseLevel;

    s32MedNL = (s32MedNL + 3) / 6;

    s32NoiseLevel = NR_CLIP3(0, 10, s32NoiseLevel);

    s32TextureDenseLevel = pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel;

    for (i = 0; i < 32; i++)
    {
        au32YTFLut[i] = (sg_au8TnrAlphaLut[s32NoiseLevel][i] * (16 - s32TextureDenseLevel) + sg_au8MaxAlphaLut[i] * s32TextureDenseLevel + 8) / 16;
        au32CTFLut[i] = (sg_au8TnrAlphaLut[s32NoiseLevel][i] * (16 - s32TextureDenseLevel) + sg_au8MaxAlphaLut[i] * s32TextureDenseLevel + 8) / 16;
    }
    s32YNrStr = pstMcnrDrvIn->u8ARTnrStr;

    if (s32YNrStr <= 16)
    {
        for (i = 0; i < 32; i++)
        {
            pstOutReg->au8TFYBlendingAlphaLut[i] = NR_CLIP3(s32BlendingMin, 31, (au32YTFLut[i] * s32YNrStr + sg_au8WeakAlphaLut[i] * (16 - s32YNrStr) + 8) / 16);
        }
    }
    else
    {
        s32YNrStr = 31 - s32YNrStr;
        for (i = 0; i < 32; i++)
        {
            pstOutReg->au8TFYBlendingAlphaLut[i] = NR_CLIP3(s32BlendingMin, 31, (au32YTFLut[i] * s32YNrStr + sg_au8StrgAlphaLut[i] * (16 - s32YNrStr) + 8) / 16);
        }
    }

    s32YNrStr = pstMcnrDrvIn->u8ARTnrStr;
    s32CNrStr = pstMcnrDrvIn->u8ARCnrStr;

    s32CNrStr = NR_CLIP3(0, 31, s32YNrStr + s32CNrStr - 16);

    if (s32CNrStr <= 16)
    {
        for (i = 0; i < 32; i++)
        {
            pstOutReg->au8TFCBlendingAlphaLut[i] = NR_CLIP3(s32BlendingMin, 31, (au32CTFLut[i] * s32CNrStr + sg_au8WeakAlphaLut[i] * (16 - s32CNrStr) + 8) / 16);
        }
    }
    else
    {
        s32CNrStr = 31 - s32CNrStr;
        for (i = 0; i < 32; i++)
        {
            pstOutReg->au8TFCBlendingAlphaLut[i] = NR_CLIP3(s32BlendingMin, 31, (au32CTFLut[i] * s32CNrStr + sg_au8StrgAlphaLut[i] * (16 - s32CNrStr) + 8) / 16);
        }
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_UpdateParam(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_OUTPUT_REG_S *pstOutReg)
{
    pstOutReg->u8SCDVal           = pstMcnrDrvIn->stTnrApiParm.u8SCDVal;
    pstOutReg->s8NoiseLevel       = MAX(pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel, pstMcnrDrvIn->stTnrApiParm.u8RawNoiseLevel);
    pstOutReg->s8GlobalMotion     = pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion;
    pstOutReg->u32OriGlobalMotion = pstMcnrDrvIn->stTnrApiParm.u32OriGlobalMotion;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstMcnrDrvIn);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstOutReg);

    if (pstMcnrDrvIn->stTnrApiParm.s32RawNoiseInfo <= 25000)
    {
        pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt++;
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt = 0;
    }

    if (pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt > 100000)
    {
        pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt = 6;
    }

    if (pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt > 5)
    {
        pstOutReg->s8NoiseLevel = 0;
    }

    PQ_MNG_TNR_UpdateMDReg(pstMcnrDrvIn, pstOutReg);

    PQ_MNG_TNR_UpdateMEReg(pstMcnrDrvIn, pstOutReg);

    PQ_MNG_TNR_UpdateMCReg(pstMcnrDrvIn, pstOutReg);

    PQ_MNG_TNR_UpdateTFReg(pstMcnrDrvIn, pstOutReg);

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_GetFlatInfo(HI_S32 s32Index, HI_S32 s32XMin, HI_S32 s32XMax, HI_S32 s32YMin, HI_S32 s32YMax)
{
    HI_S32 s32X;
    HI_S32 s32B;
    HI_S32 s32ThreeSigma;
    HI_S32 s32Result;

    s32ThreeSigma = ((s32XMax > s32XMin) ? (s32XMax - s32XMin) : 255);
    if (s32Index < s32XMin)
    {
        s32X = 0;
    }
    else if (s32Index > s32XMax)
    {
        s32X = 255;
    }
    else
    {
        s32X = NR_CLIP255(255 * (s32Index - s32XMin) / s32ThreeSigma);
    }

    s32B = sg_au16Lut256[s32X];

    s32Result = ((s32YMax - s32YMin) * (10000 - s32B) + 5000) / 10000 + s32YMin;

    return  NR_CLIP3(s32YMin, s32YMax, s32Result);
}


HI_S32 PQ_MNG_TNR_CalcNoiseLevel(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_S32 s32RawNoiseLevel, HI_S32 s32RawGlobalMotion)
{
    HI_S32 s32GlobalMotion = s32RawGlobalMotion;
    HI_S32 s32NoiseLevel   = s32RawNoiseLevel;

    if (pstMcnrDrvIn->s8ARNLPnlStr <= 0)
    {
        pstMcnrDrvIn->s8ARNLPnlStr = 6;
    }

    if (pstMcnrDrvIn->stTnrApiParm.u16Width <= WIDTH960)
    {
        s32GlobalMotion = (HI_S32)NR_CLIP3(0, 15, NR_CLIP(s32GlobalMotion - NR_CLIP(s32NoiseLevel / 10000 - pstMcnrDrvIn->u8ARGMPnlNLOffset)));
        s32NoiseLevel = NR_CLIP3(pstMcnrDrvIn->u8ARMinNLRatio * s32NoiseLevel / 16,
                                 320000,
                                 s32NoiseLevel * NR_CLIP(pstMcnrDrvIn->s8ARNLPnlStr - NR_CLIP(s32GlobalMotion - pstMcnrDrvIn->u8ARNLPnlGMOffset)) / pstMcnrDrvIn->s8ARNLPnlStr);
    }
    else if (pstMcnrDrvIn->stTnrApiParm.u16Width <= WIDTH1920)
    {
        s32NoiseLevel = ((s32GlobalMotion > 4) && (s32NoiseLevel > 85000)) ? s32NoiseLevel - NR_CLIP3(0, 3, s32GlobalMotion) : s32NoiseLevel;
        s32GlobalMotion = (HI_S32)NR_CLIP3(0, 15, NR_CLIP(s32GlobalMotion - NR_CLIP(s32NoiseLevel / 10000 - pstMcnrDrvIn->u8ARGMPnlNLOffset)));
        s32NoiseLevel = NR_CLIP3(pstMcnrDrvIn->u8ARMinNLRatio * s32NoiseLevel / 16,
                                 320000,
                                 s32NoiseLevel * NR_CLIP(pstMcnrDrvIn->s8ARNLPnlStr - NR_CLIP(s32GlobalMotion - pstMcnrDrvIn->u8ARNLPnlGMOffset)) / pstMcnrDrvIn->s8ARNLPnlStr);
    }
    else
    {
        s32GlobalMotion = (HI_S32)NR_CLIP3(0, 15, NR_CLIP(s32GlobalMotion - NR_CLIP(s32NoiseLevel / 10000 - pstMcnrDrvIn->u8ARGMPnlNLOffset)));
        s32NoiseLevel = NR_CLIP3(pstMcnrDrvIn->u8ARMinNLRatio * s32NoiseLevel / 16,
                                 320000,
                                 s32NoiseLevel * NR_CLIP(pstMcnrDrvIn->s8ARNLPnlStr - NR_CLIP(s32GlobalMotion - pstMcnrDrvIn->u8ARNLPnlGMOffset)) / pstMcnrDrvIn->s8ARNLPnlStr);
    }

    s32NoiseLevel = (pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[2] +
                     pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[3] +
                     2 * pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[4] +
                     3 * s32NoiseLevel) / 7;

    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[0] = pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[1];
    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[1] = pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[2];
    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[2] = pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[3];
    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[3] = pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[4];
    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[4] = s32NoiseLevel;

    s32NoiseLevel = NR_MAX3(NR_MAX3(pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[0],
                                    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[1],
                                    pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[2]),
                            pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[3],
                            pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[4]);

    if ((pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel >= 5) && (pstMcnrDrvIn->stTnrApiParm.u16Width < WIDTH1920))
    {
        s32NoiseLevel = NR_CLIP3(0, s32NoiseLevel, NR_CLIP(5 - (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel));
    }
    else if ((pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel >= 8) && (pstMcnrDrvIn->stTnrApiParm.u16Width >= WIDTH1920))
    {
        s32NoiseLevel = NR_CLIP3(0, s32NoiseLevel, NR_CLIP(5 - (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel));
    }

    return HI_SUCCESS;
}


HI_VOID PQ_MNG_TNR_AdjNL(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_S32 s32NoiseLevel)
{
    if ((pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel >= pstMcnrDrvIn->u8ARDarklevelThd) && (pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion <= 5))
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel  = (HI_S8)NR_CLIP3(0, (HI_S32)pstMcnrDrvIn->u8ARDarkNLMax + 1 -
                NR_CLIP3(0, 3, (HI_S32)pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel - pstMcnrDrvIn->u8ARDarklevelThd),
                (s32NoiseLevel - 10000 * NR_CLIP(pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel - 21) + 5000) / 10000);
    }
    else if (pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel >= pstMcnrDrvIn->u8ARDarklevelThd)
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel  = (HI_S8)NR_CLIP3(0, (HI_S32)pstMcnrDrvIn->u8ARDarkNLMax -
                NR_CLIP3(0, 3, (HI_S32)pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel - pstMcnrDrvIn->u8ARDarklevelThd - 1),
                (s32NoiseLevel - 10000 * NR_CLIP(pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel - 21) + 5000) / 10000);
    }

    else if ((pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel <= 14) && (pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion <= 1))
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = (HI_S8)NR_CLIP3(0, 31, (s32NoiseLevel + 5000 + 10000 * NR_CLIP(2 - (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion)) / 10000);
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = (HI_S8)NR_CLIP3(0, 31, (s32NoiseLevel + 5000) / 10000);
    }
}


HI_S32 PQ_MNG_TNR_AdjNoiseLevel(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_S32 s32RawNoiseLevel, HI_S32 s32Reliability)
{
    HI_S32 s32NoiseLevel = s32RawNoiseLevel;
    //HI_S32 s32GM2NlLut[16] = {0,0,0,1,  1,1,2,2,  3,4,5,6,  7,7,7,7};

    PQ_MNG_TNR_AdjNL(pstMcnrDrvIn, s32NoiseLevel);

    if ((pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel <= 8) && (pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion <= 1)
        && (s32Reliability <= 20) && (pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel == 0) && (pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel <= 7))
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel += 1;
    }

    if ((pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel <= 8) && (pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion <= 1)
        && (s32Reliability <= 15) && (pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel == 0) && (pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel <= 7))
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel += 1;
    }

    pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = NR_CLIP3(0, 31, pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel);


    if (pstMcnrDrvIn->stTnrApiParm.u16Width >= WIDTH1920)
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = ((pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion > 4) && (pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel > 8))
                ? pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel - NR_CLIP3(0, 3, (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion - 3)
                : pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_NoiseLevelEstimation(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_STT_REG_S *pstReg)
{
    HI_S32 i;
    HI_S32 s32RawNoise;
    HI_S32 s32NoiseInfo;
    HI_S32 s32FlatRatio;
    HI_S32 s32Reliability;
    HI_S32 s32NoiseLevel;

    HI_U64 u64Sum = 1;
    HI_U64 u64Cnt = 1;

    HI_S32 s32MaxGM = 0;
    HI_S32 s32GlobalMotion;

    HI_S32 s32NoiseRatio;

    HI_S32 s32FlatStr;
    HI_S32 s32FlatStrRatio = 256;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstReg);

    for (i = 0; i < 9; i++)
    {
        pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i] = pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i + 1];
        if (s32MaxGM < pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i])
        {
            s32MaxGM = pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i];
        }
    }

    pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i] = NR_CLIP3(0, 21, pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion);
    s32GlobalMotion = NR_MAX(s32MaxGM, pstMcnrDrvIn->stTnrApiParm.au8NDpreGM[i]);

    s32NoiseRatio = 10000;

    if (pstMcnrDrvIn->stTnrApiParm.u16Width < WIDTH1920)
    {
        u64Sum = (HI_U64)s32NoiseRatio * (pstReg->u32NDSumNoiseInfoMax + 2 * pstReg->u32NDSumNoiseInfoMed + 3 * pstReg->u32NDSumNoiseInfoMin);
        u64Cnt = (HI_U64)(pstReg->u32NDNoisePointCntMed + 2 * pstReg->u32NDNoisePointCntMed + 3 * pstReg->u32NDNoisePointCntMin);
        s32FlatStrRatio = 256;
    }
    else
    {
        u64Sum = (HI_U64)s32NoiseRatio * (pstReg->u32NDSumNoiseInfoMax + 2 * pstReg->u32NDSumNoiseInfoMed + 3 * pstReg->u32NDSumNoiseInfoMin);
        u64Cnt = (HI_U64)(pstReg->u32NDNoisePointCntMax + 2 * pstReg->u32NDNoisePointCntMed + 3 * pstReg->u32NDNoisePointCntMin);
        s32FlatStrRatio = 256;
    }

    pstMcnrDrvIn->stTnrApiParm.u64NoiseSum = u64Sum;
    do_div(pstMcnrDrvIn->stTnrApiParm.u64NoiseSum, 10000);//u64Sum/10000;
    pstMcnrDrvIn->stTnrApiParm.u64NoiseCnt = u64Cnt;

    if (u64Cnt != 0)
    {
        do_div(u64Sum, u64Cnt);//u64Sum/u64Cnt;
    }
    else
    {
        u64Sum = 0;
    }

    s32RawNoise = (HI_S32)NR_CLIP3(0, 1270000, u64Sum);

    if (pstMcnrDrvIn->stTnrApiParm.bInterlace == 1)
    {
        s32FlatRatio = (64 * (pstReg->u32NDNoisePointCntMax +  3 * pstReg->u32NDNoisePointCntMed + 4 * pstReg->u32NDNoisePointCntMin + 4))
                       / pstMcnrDrvIn->stTnrApiParm.u16Width / pstMcnrDrvIn->stTnrApiParm.u16Height;
        s32FlatStr = (2 * s32FlatStrRatio * pstReg->u32NDNoisePointNum) / pstMcnrDrvIn->stTnrApiParm.u16Width / pstMcnrDrvIn->stTnrApiParm.u16Height;
    }
    else
    {
        // FRAME MODE
        s32FlatRatio = (32 * (pstReg->u32NDNoisePointCntMax +  3 * pstReg->u32NDNoisePointCntMed + 4 * pstReg->u32NDNoisePointCntMin + 4))
                       / pstMcnrDrvIn->stTnrApiParm.u16Width / pstMcnrDrvIn->stTnrApiParm.u16Height;
        s32FlatStr = (s32FlatStrRatio * pstReg->u32NDNoisePointNum) / pstMcnrDrvIn->stTnrApiParm.u16Width / pstMcnrDrvIn->stTnrApiParm.u16Height;
    }

    s32Reliability = PQ_MNG_TNR_GetFlatInfo(s32FlatRatio,
                                            pstMcnrDrvIn->u8ARFlatInfoXMin,
                                            pstMcnrDrvIn->u8ARFlatInfoXMax,
                                            pstMcnrDrvIn->u8ARFlatInfoYMin,
                                            pstMcnrDrvIn->u8ARFlatInfoYMax);

    if (pstMcnrDrvIn->u8ARNDReliMax <= 0)
    {
        pstMcnrDrvIn->u8ARNDReliMax = 52;
    }
    s32Reliability = NR_CLIP3(0, pstMcnrDrvIn->u8ARNDReliMax, s32Reliability);

    s32FlatRatio = 100 * s32Reliability / pstMcnrDrvIn->u8ARNDReliMax;

    pstMcnrDrvIn->stTnrApiParm.u8Probability = (HI_U8) s32FlatRatio;

    s32NoiseInfo = s32RawNoise * s32FlatRatio / 100;

    s32NoiseLevel = NR_CLIP3(0, 320000, s32NoiseInfo + NR_CLIP3(0, 30000, s32NoiseInfo - 10000));

    pstMcnrDrvIn->stTnrApiParm.u8RawNoiseLevel       = (HI_U8)NR_CLIP3(0, 31, (s32NoiseInfo + 5000) / 10000);
    pstMcnrDrvIn->stTnrApiParm.u8TextureDenseLevel   = (HI_U8)NR_CLIP3(0, 16, 16 - s32FlatStr);

    PQ_MNG_TNR_CalcNoiseLevel(pstMcnrDrvIn, s32NoiseLevel, s32GlobalMotion);

    PQ_MNG_TNR_AdjNoiseLevel(pstMcnrDrvIn, pstMcnrDrvIn->stTnrApiParm.as32PreNoiseLevel[4], s32Reliability);

    pstMcnrDrvIn->stTnrApiParm.s32RawNoiseInfo = s32NoiseInfo;

    if ((pstMcnrDrvIn->stTnrApiParm.u16Width >= WIDTH1920) && (s32NoiseInfo < 10000))
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = 0;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_GetGlobalInfo(MCNR_DRV_IN_S *pstMcnrDrvIn, TNR_INPUT_INFO_S *pstInputInfo)
{
    HI_S32 s32Ret = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstInputInfo);

    if (pstMcnrDrvIn->stTnrApiParm.bMEMotionEstimationEn)
    {
        s32Ret = PQ_MNG_TNR_GlobalMotionEstimation(pstMcnrDrvIn, pstInputInfo);

        if (s32Ret == HI_FAILURE)
        {
            pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel  = 0;
            pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion = 0;
            pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = 12;
        }
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.u8SaltusLevel  = 0;
        pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion = 0;
        pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = 12;
    }

    pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel = NR_CLIP3(0, 24,
            pstMcnrDrvIn->stTnrApiParm.u8NonrgmeLevel - NR_CLIP3(0, 4, 20 - pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel));

    if (pstMcnrDrvIn->stTnrApiParm.bNDNoiseDetectEn)
    {
        PQ_MNG_TNR_NoiseLevelEstimation(pstMcnrDrvIn, &(pstInputInfo->stTnrSttReg));
    }
    else
    {
        pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel = 2;
    }

    return HI_SUCCESS;
}

HI_VOID PQ_MNG_TNR_CalcHistMV2(HI_U16 u16MV, HI_U16 au16MEHistMV[])
{
    if (0 >= u16MV)
    {
        au16MEHistMV[0]++;
    }
    else if (1 >= u16MV)
    {
        au16MEHistMV[1]++;
    }
    else if (2 >= u16MV)
    {
        au16MEHistMV[2]++;
    }
    else if (4 >= u16MV)
    {
        au16MEHistMV[3]++;
    }
    else
    {
        au16MEHistMV[4]++;
    }

}

HI_VOID PQ_MNG_TNR_CalcHistMV(MCNR_DRV_IN_S   *pstMcnrDrvIn, HI_U16 u16MV, HI_U16 au16MEHistMV[])
{
    PQ_CHECK_NULL_PTR_RE_NULL(au16MEHistMV);

    PQ_MNG_TNR_CalcHistMV2(u16MV, au16MEHistMV);
}

HI_VOID PQ_MNG_TNR_CalcHistMag(HI_U16 u16Mag, HI_U16 au16MEHistMag[])
{
    PQ_CHECK_NULL_PTR_RE_NULL(au16MEHistMag);

    if (0 >= u16Mag)
    {
        au16MEHistMag[0]++;
    }
    else if (1 >= u16Mag)
    {
        au16MEHistMag[1]++;
    }
    else if (2 >= u16Mag)
    {
        au16MEHistMag[2]++;
    }
    else if (4 >= u16Mag)
    {
        au16MEHistMag[3]++;
    }
    else
    {
        au16MEHistMag[4]++;
    }
}

HI_S32 PQ_MNG_TNR_ParseRgmv(MCNR_DRV_IN_S *pstMcnrDrvIn, HI_VOID *pRGMV, HI_U32 u32Stride, NR_RGMV_INFO_S *pstRgmvInfo)
{
    HI_S32 i;
    HI_U32 u32RGNUMH, u32RGNUMV, u32Row, u32Col;
    HI_U32 *u32Tmp;

    HI_S16 s16MVx, s16MVy;
    HI_U16 u16Mag, u16TmpMV;
    MCMVStruct_S RGMV;

    RGMV.x   = 0;
    RGMV.mvy = 0;
    RGMV.mag = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstRgmvInfo);

    u32RGNUMH = PQ_MNG_TNR_GetRgNumH(pstMcnrDrvIn);
    u32RGNUMV = PQ_MNG_TNR_GetRgNumV(pstMcnrDrvIn);

    g_u16RgmvBlkNumW = u32RGNUMH;
    g_u16RgmvBlkNumH = u32RGNUMV;

    if ((u32RGNUMH <= 2) || (u32RGNUMV <= 2))
    {
        return HI_FAILURE;
    }

    for (i = 0; i < 5; i++)
    {
        pstRgmvInfo->au16MEHistMV[i] = 0;
    }

    for (u32Row = 1; u32Row < u32RGNUMV - 1; u32Row++)
    {
        for (u32Col = 1; u32Col < u32RGNUMH - 1; u32Col++)
        {
            u32Tmp = (HI_U32 *)pRGMV + (u32Row * u32Stride / 4 + u32Col * 4);
            /*if(u32Tmp == HI_NULL || (u32Tmp + 1)== HI_NULL)
            {
                printk("\n  pRGMV = 0x%x , offset = 0x%x\n", pRGMV, (u32Row*u32Stride/4 + u32Col*4));
            }*/
            pq_mng_mcnr_CopyU32ByBitWithSignal(*(HI_U32 *)((HI_U32 *)pRGMV + (u32Row * u32Stride / 4 + u32Col * 2)  ),  0, &(RGMV.x), 0, 9); //x[8:0]
            pq_mng_mcnr_CopyU32ByBitWithSignal(*(HI_U32 *)((HI_U32 *)pRGMV + (u32Row * u32Stride / 4 + u32Col * 2) + 1),  4, &(RGMV.mvy), 0, 8); //mvy[7:0]
            pq_mng_mcnr_CopyU32ByBitWithSignal(*(HI_U32 *)((HI_U32 *)pRGMV + (u32Row * u32Stride / 4 + u32Col * 2)  ), 19, &(RGMV.mag), 0, 10); //mag[9:0]

            /* 后面注意这里的类型转换处理*/
            s16MVx = RGMV.x;
            s16MVy = RGMV.mvy;
            u16Mag = RGMV.mag;

            u16TmpMV = NR_ABS(s16MVx) + NR_ABS(s16MVy);

            g_as16RGMVX[i * u32RGNUMV + u32Col] = s16MVx;
            g_as16RGMVY[i * u32RGNUMV + u32Col] = s16MVy;
            g_au16RGMVMag[i * u32RGNUMV + u32Col] = u16Mag;

            PQ_MNG_TNR_CalcHistMV(pstMcnrDrvIn, u16TmpMV, pstRgmvInfo->au16MEHistMV);
            PQ_MNG_TNR_CalcHistMag(u16Mag,  pstRgmvInfo->au16MEHistMag);
        }
    }

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_TNR_GetSttParam(S_VPSS_STT_REGS_TYPE *pstVpssWbcReg, TNR_STT_REG_S *pstTnrSttReg)
{
    pstTnrSttReg->u32NDNoisePointCntMax = pstVpssWbcReg->TNR_NOISEPOINTCNT_MAX.bits.noisepointcntmax;
    pstTnrSttReg->u32NDNoisePointCntMed = pstVpssWbcReg->TNR_NOISEPOINTCNT_MED.bits.noisepointcntmed;
    pstTnrSttReg->u32NDNoisePointCntMin = pstVpssWbcReg->TNR_NOISEPOINTCNT_MIN.bits.noisepointcntmin;

    pstTnrSttReg->u32NDNoisePointNum    = pstVpssWbcReg->TNR_NOISEPOINTNUM.bits.noisepointnum;;

    pstTnrSttReg->u32NDSumNoiseInfoMax  = pstVpssWbcReg->TNR_SUMNOISEINFO_MAX.bits.sumnoiseinfomax;
    pstTnrSttReg->u32NDSumNoiseInfoMed  = pstVpssWbcReg->TNR_SUMNOISEINFO_MED.bits.sumnoiseinfomed;
    pstTnrSttReg->u32NDSumNoiseInfoMin  = pstVpssWbcReg->TNR_SUMNOISEINFO_MIN.bits.sumnoiseinfomin;

    pstTnrSttReg->u32MEBlkMVHist[0] = 0;
    pstTnrSttReg->u32MEBlkMVHist[1] = 0;
    pstTnrSttReg->u32MEBlkMVHist[2] = 0;
    pstTnrSttReg->u32MEBlkMVHist[3] = 0;
    pstTnrSttReg->u32MEBlkMVHist[4] = 0;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_SNR_UpdateParam(MCNR_DRV_IN_S *pstMcnrDrvIn, SNR_OUTPUT_REG_S *pSnrRegOut)
{
    HI_S32 s32MotionRatio;

    s32MotionRatio = NR_CLIP3(0, 63, NR_CLIP(pstMcnrDrvIn->stTnrApiParm.u8RawNoiseLevel - 2) +
                              NR_CLIP(pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel - 1) +
                              NR_CLIP3(0, 16, pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion - 1));
    pSnrRegOut->s32MotionAlpha = NR_CLIP3(0, 63, 8 + s32MotionRatio);

    pSnrRegOut->s32SceneChange = 0;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_MCNR_LoadInfo(MCNR_DRV_IN_S *pstMcnrDrvIn, MCNR_DRV_OUT_S *pstMcnrDrvOut)
{
    pstMcnrDrvOut->s32NoiseLevel      = (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel;
    pstMcnrDrvOut->s32RawNoiseLevel   =         pstMcnrDrvIn->stTnrApiParm.s32RawNoiseInfo;
    pstMcnrDrvOut->s32FinalNoiseLevel = (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8FinalNoiseLevel;

    pstMcnrDrvOut->s32GlobalMotion      = (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion;
    pstMcnrDrvOut->s32RawGlobalMotion   = (HI_S32)pstMcnrDrvIn->stTnrApiParm.u32OriGlobalMotion;
    pstMcnrDrvOut->s32FinalGlobalMotion = (HI_S32)pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion;

    return HI_SUCCESS;
}

static HI_S32 PQ_MNG_MCNR_UpdateSoftWareCfg(MCNR_IMAGE_INFO_S  *pstMcnrImgInfo,
        MCNR_DRV_IN_S   *pstMcnrDrvIn,
        MCNR_REG_OUT_S  *pstMcnrRegOut,
        MCNR_DRV_OUT_S *pstMcnrDrvOut)
{
    TNR_INPUT_INFO_S stInputInfo;

    //TNR_OUTPUT_REG_S *pstOutTnrReg = &(pstMcnrRegOut->stOutTnrReg);
    //SNR_OUTPUT_REG_S *pstOutSnrReg = &(pstMcnrRegOut->stOutSnrReg);

    PQ_CHECK_NULL_PTR_RE_FAIL(pstMcnrImgInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstMcnrRegOut);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstMcnrDrvOut);

    pstMcnrDrvIn->stTnrApiParm.u16Width  = (HI_U16)pstMcnrImgInfo->u32Width;
    pstMcnrDrvIn->stTnrApiParm.u16Height = (HI_U16)pstMcnrImgInfo->u32Height;
    pstMcnrDrvIn->stTnrApiParm.u8SCDVal  = 0;

    pstMcnrDrvIn->stTnrApiParm.bMEMotionEstimationEn = HI_TRUE;
    pstMcnrDrvIn->stTnrApiParm.bNDNoiseDetectEn = HI_TRUE;

    pstMcnrDrvIn->stTnrApiParm.u8DarknessLevel = 8;

    if (pstMcnrDrvIn->stTnrApiParm.u8SCDVal >= 224)
    {
        pstMcnrDrvIn->stTnrApiParm.s32LowNLCnt = 0;
    }

    /* get stt info & parsing rgmv */
    PQ_MNG_TNR_ParseRgmv(pstMcnrDrvIn, pstMcnrImgInfo->stMcnrSttInf.pRGMV,
                         pstMcnrImgInfo->stMcnrSttInf.u32Stride, &stInputInfo.stRgmvInfo);
    PQ_MNG_TNR_GetSttParam(pstMcnrImgInfo->stMcnrSttInf.pstVpssWbcReg, &stInputInfo.stTnrSttReg);
    /* get stt info & parsing rgmv */

    PQ_MNG_TNR_GetGlobalInfo(pstMcnrDrvIn, &stInputInfo);

    pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel   = NR_CLIP3(pstMcnrDrvIn->u8ARSetNLMin,
            pstMcnrDrvIn->u8ARSetNLMax, pstMcnrDrvIn->stTnrApiParm.s8NoiseLevel);
    pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion = NR_CLIP3(pstMcnrDrvIn->u8ARSetGMMin,
            pstMcnrDrvIn->u8ARSetGMMax, pstMcnrDrvIn->stTnrApiParm.s8GlobalMotion);

    PQ_MNG_TNR_UpdateParam(pstMcnrDrvIn, &(pstMcnrRegOut->stOutTnrReg));
    PQ_MNG_SNR_UpdateParam(pstMcnrDrvIn, &(pstMcnrRegOut->stOutSnrReg));

    PQ_MNG_MCNR_LoadInfo(pstMcnrDrvIn, pstMcnrDrvOut);

    /* update nr reg */
    // PQ_HAL_UpdateTnrSoftReg(u32HandleNo, pstOutTnrReg);
    // PQ_HAL_UpdateSnrSoftReg(u32HandleNo, pstOutSnrReg);
    /* update nr reg */

    return HI_SUCCESS;
}


HI_S32 PQ_MNG_RefreshMcnrCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo)
{
    HI_S32 s32Ret         = HI_SUCCESS;
    HI_BOOL bTNROnOff     = HI_FALSE;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqFrameInfo->pRGMV);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssWbcReg);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(pstPqFrameInfo->u32Width, (MCNR_SPLIT_Y_MAX_WIDTH + 1));

    pqprint(PQ_PRN_TNR, "bMcnrEn = %d,bSoftAlgPass = %d,u32Width = %d,u32Height = %d,u32FrameIndex = %d,bInit = %d\n",
            pstPqFrameInfo->bMcnrEn,
            pstPqFrameInfo->bSoftAlgPass,
            pstPqFrameInfo->u32Width,
            pstPqFrameInfo->u32Height,
            pstPqFrameInfo->u32FrameIndex,
            pstPqFrameInfo->bInit);

    if (HI_FALSE == pstPqFrameInfo->bMcnrEn)
    {
        return HI_SUCCESS;
    }

    /* 1 soft bypass */
    if (HI_TRUE == pstPqFrameInfo->bSoftAlgPass)
    {
        return HI_SUCCESS;
    }

    if ((pstPqFrameInfo->u32Width > MCNR_Y_MAX_WIDTH) || (pstPqFrameInfo->u32Width < MCNR_Y_MIN_WIDTH))
    {
        return HI_SUCCESS;
    }

    if (PQ_FUNC_CALL(HI_PQ_MODULE_TNR, GetEnable))
    {
        GET_ALG_FUN(HI_PQ_MODULE_TNR)->GetEnable(&bTNROnOff);
    }

    if ((HI_TRUE != bTNROnOff) || (HI_TRUE != sg_bMCNREn))
    {
        return HI_SUCCESS;
    }

    stMcnrImgInfo.u32Width = pstPqFrameInfo->u32Width;
    stMcnrImgInfo.u32Height = pstPqFrameInfo->u32Height;
    stMcnrImgInfo.bInterlace = pstPqFrameInfo->bDeiEn;

    stMcnrImgInfo.stMcnrSttInf.pstVpssWbcReg = (S_VPSS_STT_REGS_TYPE *)(pstVpssRegInfo->pstVpssWbcReg);
    stMcnrImgInfo.stMcnrSttInf.u32Stride     = pstPqFrameInfo->u32Stride;
    stMcnrImgInfo.stMcnrSttInf.pRGMV         = pstPqFrameInfo->pRGMV;


    /* 2 init soft drv in */
    if (HI_TRUE == pstPqFrameInfo->bInit)
    {
        PQ_MNG_MCNR_DrvIn_Init(&stMcnrDrvIn);

        PQ_MNG_MCNR_DrvInApi_Init(pstPqFrameInfo->u32Width, pstPqFrameInfo->u32Height, !pstPqFrameInfo->bProgressive, &stMcnrDrvIn.stTnrApiParm);
        //PQ_MNG_MCNR_DrvInApi_Init(pstPqFrameInfo->u32Width, pstPqFrameInfo->u32Height, !pstPqFrameInfo->bProgressive);

        //PQ_MNG_TNR_InitialRGMEReg(RGME_PARM_S * pstRgmeParm); // 给谁用；换码流要重新配置
        return HI_SUCCESS;
    }

    /* 3 get drv in from logic reg : donot need to use logic para */

    /* 4 soft alg calc  */
    s32Ret |= PQ_MNG_MCNR_UpdateSoftWareCfg(&stMcnrImgInfo, &stMcnrDrvIn, &stMcnrRegOut, &stMcnrDrvOut);

    /* 5 set reg out into reg */
    s32Ret |= PQ_HAL_SetMcnrRegFromRegout(pstPqFrameInfo->u32HandleNo, pstVpssRegInfo, &stMcnrRegOut);

    /* 6 set special para */
    s32Ret |= PQ_HAL_UpdateSpecialPara(pstPqFrameInfo, pstVpssRegInfo);

    return s32Ret;
}

HI_S32 PQ_MNG_SetMCNREn(HI_BOOL bOnOff)
{
    sg_bMCNREn = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_MNG_GetMCNREn(HI_BOOL *pbOnOff)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pbOnOff);

    *pbOnOff = sg_bMCNREn;

    return HI_SUCCESS;
}

