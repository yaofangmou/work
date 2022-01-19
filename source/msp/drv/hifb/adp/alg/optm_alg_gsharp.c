/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : optm_alg_gzme.c
Version          : Initial Draft
Author           : sdk
Created          : 2018/01/01
Description      :
Function List    :

History          :
Date                Author         Modification
2018/01/01          sdk            Created file
*************************************************************************************************/


/***************************** add include here**************************************************/
#include "optm_alg_gsharp.h"

#ifdef HI_BUILD_IN_BOOT
#include "hi_gfx_comm.h"
#include "hi_gfx_debug.h"
#else
#include "drv_hifb_debug.h"
#endif

/***************************** Macro Definition *************************************************/

/***************************** Structure Definition *********************************************/

/***************************** Global Variable declaration **************************************/

/***************************** API forward declarations *****************************************/
/***************************** API realization **************************************************/
HI_VOID OPTM_ALG_GDtiInit(OPTM_ALG_GDTI_RTL_PARA_S *pstDtiRtlPara)
{
    if (NULL != pstDtiRtlPara)
    {
        pstDtiRtlPara->s32LTIHPTmp[0] = -21;  //coeff[0]
        pstDtiRtlPara->s32LTIHPTmp[1] = -21;  //coeff[1]
        pstDtiRtlPara->s32LTIHPTmp[2] = -11;  //coeff[2]

        pstDtiRtlPara->u32LTIHFreqThrsh[0]  = 60;     //127;/*if 10bit ,the value is 511*/
        pstDtiRtlPara->u32LTIHFreqThrsh[1]  = 61;     //127;/*if 10bit ,the value is 511*/
        pstDtiRtlPara->u32LTICompsatMuti[0] = 128;    ///*if 10bit ,the value is 511*/
        pstDtiRtlPara->u32LTICompsatMuti[1] = 128;
        pstDtiRtlPara->u32LTICompsatMuti[2] = 128;

        pstDtiRtlPara->s16LTICompsatRatio    = 256;     ///*Lum high_freq compensate Gain.s16LTICompsatRatio = 256 means 100% compensate*/
        pstDtiRtlPara->u16LTICoringThrsh     = 0;       ///*The LTI coring threshold,the value must be 0~1023 . Alwayes be 0~10 integer. 0 means no coring.   */
        pstDtiRtlPara->u16LTIOverSwingThrsh  = 0;
        pstDtiRtlPara->u16LTIUnderSwingThrsh = 0;
        pstDtiRtlPara->u8LTIMixingRatio      = 127;

        pstDtiRtlPara->s32CTIHPTmp[0] = -21;    //coeff[0]
        pstDtiRtlPara->s32CTIHPTmp[1] = -21;    //coeff[1]
        pstDtiRtlPara->s32CTIHPTmp[2] = -11;    //coeff[2]

        pstDtiRtlPara->s16CTICompsatRatio    = 256;    ///*Chom high_freq compensate Gain.s16LTICompsatRatio = 256 means 100% compensate*/
        pstDtiRtlPara->u16CTICoringThrsh     = 0;      ///*The CTI coring threshold,the value must be 0~1023 . Alwayes be 0~10 integer. 0 means no coring.   */
        pstDtiRtlPara->u16CTIOverSwingThrsh  = 0;      ///*The CTI swing value.  Alwayes be 0.   0 means no swing.*/
        pstDtiRtlPara->u16CTIUnderSwingThrsh = 0;      ///*The CTI swing value.  Alwayes be 0.   0 means no swing.*/
        pstDtiRtlPara->u8CTIMixingRatio      = 127;    ///*The CTI Mix ratio of Median value,range = [0,128]*/
    }

    return;
}

HI_VOID OPTM_ALG_GDtiSet(OPTM_ALG_GDTI_DRV_PARA_S *pstDtiDrvPara, OPTM_ALG_GDTI_RTL_PARA_S *pstDtiRtlPara)
{
    #define GFX_TI_MAX_RATIO_THD     3*4096
    #define GFX_TI_MED_H_RATIO_THD   2*4096
    #define GFX_TI_MIN_L_RATIO_THD   3072
    #define GFX_TI_MIN_RATIO_THD     2303
    HI_S32 s32HorRatio = 0, s32VertRatio = 0, s32MinRatio = 0, s32MaxRatio = 0;

    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDtiDrvPara);
    HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(pstDtiRtlPara);

    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(0, pstDtiDrvPara->u32ZmeFrmWIn);
    HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(0, pstDtiDrvPara->u32ZmeFrmHIn);
    s32HorRatio  = pstDtiDrvPara->u32ZmeFrmWOut * 4096 / pstDtiDrvPara->u32ZmeFrmWIn;
    s32VertRatio = pstDtiDrvPara->u32ZmeFrmHOut * 4096 / pstDtiDrvPara->u32ZmeFrmHIn;

    s32MinRatio = OPTM_ALG_MIN2(s32HorRatio, s32VertRatio);
    s32MaxRatio = OPTM_ALG_MAX2(s32HorRatio, s32VertRatio);

    if (s32MinRatio >= GFX_TI_MAX_RATIO_THD)
    {
        pstDtiRtlPara->bEnLTI = HI_TRUE;
        pstDtiRtlPara->bEnCTI = HI_TRUE;

        pstDtiRtlPara->s16LTICompsatRatio    = 256;
        pstDtiRtlPara->u16LTICoringThrsh     = 2;
        pstDtiRtlPara->u16LTIOverSwingThrsh  = 6;
        pstDtiRtlPara->u16LTIUnderSwingThrsh = 6;
        pstDtiRtlPara->u8LTIMixingRatio = 127;
    }
    else if (s32MinRatio >= GFX_TI_MED_H_RATIO_THD)
    {
        pstDtiRtlPara->bEnLTI = HI_TRUE;
        pstDtiRtlPara->bEnCTI = HI_TRUE;

        pstDtiRtlPara->s16LTICompsatRatio    = 230;
        pstDtiRtlPara->u16LTICoringThrsh     = 2;
        pstDtiRtlPara->u16LTIOverSwingThrsh  = 6;
        pstDtiRtlPara->u16LTIUnderSwingThrsh = 6;
        pstDtiRtlPara->u8LTIMixingRatio = 127;
    }
    else if(s32MinRatio >= GFX_TI_MIN_L_RATIO_THD && s32MaxRatio >= 4096)
    {
        pstDtiRtlPara->bEnLTI = HI_TRUE;
        pstDtiRtlPara->bEnCTI = HI_TRUE;

        pstDtiRtlPara->s16LTICompsatRatio    = 180;
        pstDtiRtlPara->u16LTICoringThrsh     = 2;
        pstDtiRtlPara->u16LTIOverSwingThrsh  = 6;
        pstDtiRtlPara->u16LTIUnderSwingThrsh = 6;
        pstDtiRtlPara->u8LTIMixingRatio = 127;
    }
    else if(s32MinRatio >= GFX_TI_MIN_RATIO_THD)
    {
        pstDtiRtlPara->bEnLTI = HI_TRUE;
        pstDtiRtlPara->bEnCTI = HI_TRUE;

        pstDtiRtlPara->s16LTICompsatRatio     = 153;
        pstDtiRtlPara->u16LTICoringThrsh      = 2;
        pstDtiRtlPara->u16LTIOverSwingThrsh   = 6;
        pstDtiRtlPara->u16LTIUnderSwingThrsh  = 6;
        pstDtiRtlPara->u8LTIMixingRatio = 127;
    }
    else
    {
        pstDtiRtlPara->bEnLTI = HI_TRUE;
        pstDtiRtlPara->bEnCTI = HI_TRUE;

        pstDtiRtlPara->s16LTICompsatRatio    = 153;
        pstDtiRtlPara->u16LTICoringThrsh     = 2;
        pstDtiRtlPara->u16LTIOverSwingThrsh  = 6;
        pstDtiRtlPara->u16LTIUnderSwingThrsh = 6;
        pstDtiRtlPara->u8LTIMixingRatio = 127;
    }

    pstDtiRtlPara->s16LTICompsatRatio    = 256;
    pstDtiRtlPara->u16LTICoringThrsh     = 2;
    pstDtiRtlPara->u16LTIOverSwingThrsh  = 4;
    pstDtiRtlPara->u16LTIUnderSwingThrsh = 4;
    pstDtiRtlPara->u8LTIMixingRatio = 127;

    pstDtiRtlPara->s16CTICompsatRatio    = 256;
    pstDtiRtlPara->u16CTICoringThrsh     = 2;
    pstDtiRtlPara->u16CTIOverSwingThrsh  = 4;
    pstDtiRtlPara->u16CTIUnderSwingThrsh = 4;
    pstDtiRtlPara->u8CTIMixingRatio = 127;

    pstDtiRtlPara->s32LTIHPTmp[0] = -21;   //coeff[0]
    pstDtiRtlPara->s32LTIHPTmp[1] = -21;   //coeff[1]
    pstDtiRtlPara->s32LTIHPTmp[2] = -11;   //coeff[2]

    pstDtiRtlPara->u32LTIHFreqThrsh[0]  = 60;   //127;/*if 10bit ,the value is 511*/
    pstDtiRtlPara->u32LTIHFreqThrsh[1]  = 61;   //127;/*if 10bit ,the value is 511*/
    pstDtiRtlPara->u32LTICompsatMuti[0] = 128; ///*if 10bit ,the value is 511*/
    pstDtiRtlPara->u32LTICompsatMuti[1] = 128;
    pstDtiRtlPara->u32LTICompsatMuti[2] = 128;

    pstDtiRtlPara->s32CTIHPTmp[0] = -21;  //coeff[0]
    pstDtiRtlPara->s32CTIHPTmp[1] = -21;  //coeff[1]
    pstDtiRtlPara->s32CTIHPTmp[2] = -11;  //coeff[2]

    return;
}
