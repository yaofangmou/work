/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_zme.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2014/04/01
  Author        : sdk
******************************************************************************/
#include <linux/fs.h>
#include "hi_math.h"
#include "pq_hal_zme.h"
#include "pq_mng_zme_coef.h"

#define WBC_HSCALER_THD                 4
/*#define DHD0_OUT_RESOLUTION_W_THD       3840*/

#define V0_VDRAW_HEIGHT_THD_4   4
#define V0_VDRAW_HEIGHT_THD_6   6
#define V0_VDRAW_HEIGHT_THD_8   8
#define V0_VDRAW_HEIGHT_THD_12  12
#define V0_VDRAW_HEIGHT_THD_16  16
#define V0_VDRAW_HEIGHT_THD_24  24
#define V0_VDRAW_HEIGHT_THD_32  32
#define V0_VDRAW_HEIGHT_THD_48  48

//static S_VDP_REGS_TYPE *pVdpReg;

static HI_BOOL g_bHalVdpZmeFirEn  = HI_TRUE;
static HI_BOOL g_bHalVdpZmeMedEn  = HI_FALSE;
static HI_BOOL sg_bVdpZmeDefault  = HI_FALSE;
static HI_BOOL sg_bV0ReadFmtIn    = HI_TRUE;
static HI_PQ_PREZME_HOR_MUL_E  sg_enV0PreHScaler    = HI_PQ_PREZME_HOR_DISABLE;
static HI_PQ_PREZME_VER_MUL_E  sg_enV0PreVScaler    = HI_PQ_PREZME_VER_DISABLE;
//static HI_PQ_WBC_VP_POINT_SEL_E sg_enWbcVpPointSel   = HI_PQ_WBC_VP_POINT_V0;

static HI_PQ_PROC_VDPZME_STRATEGY_S sg_stSetPqProcVdpZmeStrategy = {0};
static HI_PQ_PROC_VDPZME_STRATEGY_S sg_stGetPqProcVdpZmeStrategy = {0};
static HI_PQ_PROC_VDPZME_RESO_S     sg_stProcVdpZmeReso          = {{0}};
static HI_PQ_PROC_WBC_STRATEGY_S    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_BUTT] = {{0}};
static HI_PQ_ZME_VID_COEF_SEL_S sg_stSetPqProcVdpZmeVidCoefSel = {{0}};
static HI_PQ_ZME_WBC_COEF_SEL_S sg_stGetPqProcVdpZmeWbcCoefSel = {{0}};

// add vo zme in out reso
HI_RECT_S sg_stV0ZmeInRect = {0};
HI_RECT_S sg_stV0ZmeOutRect = {0};


/* zme coef buffer */
extern ALG_VZME_MEM_S g_stVZMEVdpInstance;
extern ALG_VZME_MEM_S g_stVZMEVdpHZMEInstance; // vo_hpzme, wbc_dhd_hzme
extern ALG_VZME_MEM_S g_stVZMEVdpVzmeInstance; //wbc_dhd_vzme

HI_PQ_ZME_COEF_SEL_S g_stZmeCoefSel;
static PQ_PARAM_S *sg_pstPqParamZmeVid  = HI_NULL;

/****************************wbc dhd zme coef addr *****************************************/
HI_U32 PQ_HAL_WbcDhdZmeCoefAddrH(ALG_VZME_COEF_ADDR_S *pstCoefAddr, HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_1;
    }
    else if (u32TmpRatio == 4096)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_E1;
    }
    else if (u32TmpRatio >= 3072)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_075;
    }
    else if (u32TmpRatio >= 2048)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_05;
    }
    else if (u32TmpRatio >= 1365)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_033;
    }
    else if (u32TmpRatio >= 1024)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_025;
    }
    else
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrHL8_0;
    }

    return u32CoefAddr;
}

HI_U32 PQ_HAL_WbcDhdZmeCoefAddrV(ALG_VZME_COEF_ADDR_S *pstCoefAddr, HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_1;
    }
    else if (u32TmpRatio == 4096)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_E1;
    }
    else if (u32TmpRatio >= 3072)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_075;
    }
    else if (u32TmpRatio >= 2048)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_05;
    }
    else if (u32TmpRatio >= 1365)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_033;
    }
    else if (u32TmpRatio >= 1024)
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_025;
    }
    else
    {
        u32CoefAddr = pstCoefAddr->u32ZmeCoefAddrVL8_0;
    }

    return u32CoefAddr;
}


/****************************Load VDP ZME COEF START*****************************************/
//static HI_S32 VdpV0ZmeTransHCoefAlign(const HI_S16 *ps16Coef, VZME_TAP_E enTap, ZME_COEF_BITARRAY_S *pBitCoef)
static HI_S32 VdpV0ZmeTransHCoefAlign(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        default:
            u32Tap = 4;
            break;
    }

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *(ps16Src + i * 8 + (7 - j));
        }
    }

    return HI_SUCCESS;
}

static HI_S32 VdpV0ZmeTransHCoefAlignSend(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        default:
            u32Tap = 4;
            break;
    }

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *(ps16Src + i * 8 + (7 - j));
        }
    }

    return HI_SUCCESS;
}


static HI_S32 VdpV0ZmeTransVCoefAlign(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        default:
            u32Tap = 4;
            break;
    }

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *(ps16Src + i * 8 + (7 - j));
        }
    }

    return HI_SUCCESS;
}

static HI_S32 VdpHZmeTransCoefAlign(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        case VZME_TAP_2T32P:
            u32Tap = 2;
            break;
        default:
            u32Tap = 4;
            break;
    }

    //Tran ZME coef to 128 bits order

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *ps16Src++;
        }
    }

    return HI_SUCCESS;
}

static HI_S32 VdpHZmeTransCoefAlignSend(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        case VZME_TAP_2T32P:
            u32Tap = 2;
            break;
        default:
            u32Tap = 4;
            break;
    }

    //Tran ZME coef to 128 bits order

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *ps16Src++;
        }
    }

    return HI_SUCCESS;
}

static HI_S32 VdpWbcVzmeTransCoefAlign(const HI_S16 *ps16Coef, VZME_TAP_E enTap, HI_U8 *pu8Addr)
{
    HI_U32 i, j, u32Tap;
    HI_S16 *ps16Dst = (HI_S16 *)pu8Addr;
    HI_S16 *ps16Src = (HI_S16 *)ps16Coef;

    switch (enTap)
    {
        case VZME_TAP_8T32P:
            u32Tap = 8;
            break;
        case VZME_TAP_6T32P:
            u32Tap = 6;
            break;
        case VZME_TAP_4T32P:
            u32Tap = 4;
            break;
        case VZME_TAP_2T32P:
            u32Tap = 2;
            break;
        default:
            u32Tap = 4;
            break;
    }

    //Tran ZME coef to 128 bits order

    for (i = 0; i < 17; i++)
    {
        for (j = 0; j < 8; j++)
        {
            *ps16Dst++ = *(ps16Src + i * 8 + (7 - j));
        }
    }

    return HI_SUCCESS;
}


/* load hor coef */
static HI_S32 VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, VZME_COEF_TYPE_E enCoefType, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    //ZME_COEF_BITARRAY_S stArray;

    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    VdpV0ZmeTransHCoefAlign(g_pVZmeReduceCoef[enCoefRatio][enCoefType], enZmeTap, pu8Addr);

    /*PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr + stArray.u32Size);

    PQ_SAFE_MEMCPY(pu8Addr, stArray.stBit, stArray.u32Size);*/


    return HI_SUCCESS;
}

/* load hor coef */
static HI_S32 VdpV0ZmeLoadCoefHSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType,
                                    PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    if (HI_PQ_ZME_COEF_TYPE_LH == enCoefType)
    {
        VdpV0ZmeTransHCoefAlignSend(g_pVZmeReduceHLCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_CH == enCoefType)
    {
        VdpV0ZmeTransHCoefAlignSend(g_pVZmeReduceHCCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_HLTI == enCoefType)
    {
        VdpV0ZmeTransHCoefAlignSend(g_pVZmeReduceHLTICoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }

    return HI_SUCCESS;
}

/* load hor coef */
static HI_S32 VdpV0HPZmeLoadCoefHSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType,
                                      PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    if (HI_PQ_ZME_COEF_TYPE_LH == enCoefType)
    {
        VdpHZmeTransCoefAlignSend(g_pVdpV0HPZmeHLCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_CH == enCoefType)
    {
        VdpHZmeTransCoefAlignSend(g_pVdpV0HPZmeHCCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }

    return HI_SUCCESS;
}

static HI_S32 VdpWbcZmeLoadCoefHSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType,
                                     PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    if (HI_PQ_ZME_COEF_TYPE_LH == enCoefType)
    {
        VdpHZmeTransCoefAlignSend(g_pVdpV0HPZmeHLCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_CH == enCoefType)
    {
        VdpHZmeTransCoefAlignSend(g_pVdpV0HPZmeHCCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }

    return HI_SUCCESS;
}

static HI_S32 VdpWbcZmeLoadCoefVSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType,
                                     PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    if (HI_PQ_ZME_COEF_TYPE_LV == enCoefType)
    {
        VdpWbcVzmeTransCoefAlign(g_pVdpWbcDhdZmeVLCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_CV == enCoefType)
    {
        VdpWbcVzmeTransCoefAlign(g_pVdpWbcDhdZmeVCCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }

    return HI_SUCCESS;
}

/* load hzme hor coef */
static HI_S32 VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_HPZME_VDP_COEF_TYPE_E enCoefType, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load horizontal zoom coef */
    VdpHZmeTransCoefAlign(g_pVdpV0HPZmeCoef[enCoefRatio][enCoefType], enZmeTap, pu8Addr);

    return HI_SUCCESS;
}

/* load vert coef */
static HI_S32 VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, VZME_COEF_TYPE_E enCoefType, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load vertical zoom coef */
    VdpV0ZmeTransVCoefAlign(g_pVZmeReduceCoef[enCoefRatio][enCoefType], enZmeTap, pu8Addr);

    return HI_SUCCESS;
}

static HI_S32 VdpV0ZmeLoadCoefVSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, HI_PQ_ZME_COEF_TYPE_E enCoefType,
                                    PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load vertical zoom coef */
    if (HI_PQ_ZME_COEF_TYPE_LV == enCoefType)
    {
        VdpV0ZmeTransVCoefAlign(g_pVZmeReduceVLCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_CV == enCoefType)
    {
        VdpV0ZmeTransVCoefAlign(g_pVZmeReduceVCCoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }
    else if (HI_PQ_ZME_COEF_TYPE_VLTI == enCoefType)
    {
        VdpV0ZmeTransVCoefAlign(g_pVZmeReduceVLTICoefSel[enCoefRatio][enCoefSel], enZmeTap, pu8Addr);
    }

    return HI_SUCCESS;
}


static HI_U32 VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_RATIO_E enCoefRatio,
                                  PQ_HAL_WBC_DHD_ZME_COEF_TYPE_E enCoefType, VZME_TAP_E enZmeTap, HI_U8 *pu8Addr)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pu8Addr);

    /* load vertical zoom coef */
    VdpWbcVzmeTransCoefAlign(g_pWbcDhdVZmeReduceCoef[enCoefRatio], enZmeTap, pu8Addr);

    return HI_SUCCESS;
}

HI_VOID PQ_HAL_VdpV0ZmeLoadCoef(ALG_VZME_MEM_S *pstVZmeCoefMem)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;

    pu8CurAddr = pstVZmeCoefMem->stMBuf.pu8StartVirAddr;
    u32PhyAddr = pstVZmeCoefMem->stMBuf.u32StartPhyAddr;
    pstAddrTmp = &(pstVZmeCoefMem->stZmeCoefAddr);
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_E1 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_E1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_075 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_075 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_05 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_05 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_033 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_033 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_025 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_025 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_0 */
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_0 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefH(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_HLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* Vertical*/
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_E1 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_E1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_075 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_075 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_05 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_05 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_033 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_033 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_025 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_025 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_0 */
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_0 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefV(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_VLTI, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    return;
}

#if 1

HI_U32 PQ_HAL_VdpV0ZmeHLCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;

    pu8CurAddr = g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr;
    u32PhyAddr = g_stVZMEVdpInstance.stMBuf.u32StartPhyAddr;
    pstAddrTmp = &(g_stVZMEVdpInstance.stZmeCoefAddr);
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_LH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_1 = u32PhyAddr;
    /*u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;*/

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpV0ZmeHCCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma;
    u32PhyAddr = g_stVZMEVdpInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma;
    pstAddrTmp = &(g_stVZMEVdpInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_CH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpV0ZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_HLTI, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    /*u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;*/

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpV0ZmeVLCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* Vertical*/
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 3;
    u32PhyAddr = g_stVZMEVdpInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 3;
    pstAddrTmp = &(g_stVZMEVdpInstance.stZmeCoefAddr);

    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefVSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_LV, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_1 = u32PhyAddr;
    /*u32PhyAddr  += u32NumSizeChro;
    pu8CurAddr  += u32NumSizeChro;*/

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpV0ZmeVCCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* Vertical*/
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 4;
    u32PhyAddr = g_stVZMEVdpInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 4;
    pstAddrTmp = &(g_stVZMEVdpInstance.stZmeCoefAddr);

    /* HI_PQ_ZME_COEF_1 */
    VdpV0ZmeLoadCoefVSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_CV, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeChro;
    pu8CurAddr  += u32NumSizeChro;
    VdpV0ZmeLoadCoefVSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_HLTI, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    /*u32PhyAddr  += u32NumSizeChro;
    pu8CurAddr  += u32NumSizeChro;*/

    return u32PhyAddr;
}


HI_U32 PQ_HAL_VdpV0HPZmeHLCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VdpV0HPZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_LH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_1 = u32PhyAddr;
    /*u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;*/

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpV0HPZmeHCCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpV0HPZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_CH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);

    return u32PhyAddr;
}


#endif

HI_U32 PQ_HAL_VdpWbcDhdZmeHLCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* HL:8TAP, HC:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 2;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 2;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpWbcZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_LH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_1 = u32PhyAddr;

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpWbcDhdZmeHCCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* HL:8TAP, HC:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 3;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 3;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpWbcZmeLoadCoefHSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_CH, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpWbcDhdZmeVLCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* VL:8TAP, VC:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 4;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 4;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpWbcZmeLoadCoefVSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_LV, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_1 = u32PhyAddr;

    return u32PhyAddr;
}

HI_U32 PQ_HAL_VdpWbcDhdZmeVCCoefSend(HI_PQ_ZME_COEF_RATIO_E enCoefRatio, PQ_HAL_ZME_VDP_COEF_SEL_E enCoefSel)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;
    /* VL:8TAP, VC:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;

    pu8CurAddr = g_stVZMEVdpHZMEInstance.stMBuf.pu8StartVirAddr + u32NumSizeLuma * 5;
    u32PhyAddr = g_stVZMEVdpHZMEInstance.stMBuf.u32StartPhyAddr + u32NumSizeLuma * 5;
    pstAddrTmp = &(g_stVZMEVdpHZMEInstance.stZmeCoefAddr);
    /* HI_PQ_ZME_COEF_1 */
    VdpWbcZmeLoadCoefVSend(enCoefRatio, HI_PQ_ZME_COEF_TYPE_CV, enCoefSel, VZME_TAP_8T32P, pu8CurAddr);

    return u32PhyAddr;
}



HI_VOID PQ_HAL_VdpHZmeLoadCoef(ALG_VZME_MEM_S *pstVZmeCoefMem)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;

    pu8CurAddr = pstVZmeCoefMem->stMBuf.pu8StartVirAddr;
    u32PhyAddr = pstVZmeCoefMem->stMBuf.u32StartPhyAddr;
    pstAddrTmp = &(pstVZmeCoefMem->stZmeCoefAddr);
    /* HL:8TAP, HC:8TAP, HLTI:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_1, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_1, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_E1 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_E1, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_E1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_E1, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_075 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_075, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_075 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_075, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_05 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_05, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_05 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_05, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_033 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_033, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_033 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_033, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_025 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_025, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_025 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_025, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_0 */
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_0, PQ_HAL_HPZME_VDP_COEF_8T32P_LH, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrHL8_0 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VdpHZmeLoadCoefH(HI_PQ_ZME_COEF_0, PQ_HAL_HPZME_VDP_COEF_8T32P_CH, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    return;
}

HI_VOID PQ_HAL_VdpWbcDhdVZmeLoadCoef(ALG_VZME_MEM_S *pstVZmeCoefMem)
{
    HI_U8 *pu8CurAddr;
    HI_U32 u32PhyAddr;
    HI_U32 u32NumSizeLuma, u32NumSizeChro;
    ALG_VZME_COEF_ADDR_S *pstAddrTmp;

    pu8CurAddr = pstVZmeCoefMem->stMBuf.pu8StartVirAddr;
    u32PhyAddr = pstVZmeCoefMem->stMBuf.u32StartPhyAddr;
    pstAddrTmp = &(pstVZmeCoefMem->stZmeCoefAddr);

    /* WBC_DHD VZME:VL:8TAP, VC:8TAP */
    u32NumSizeLuma = 17 * 16;
    u32NumSizeChro = 17 * 16;
    /* HI_PQ_ZME_COEF_1 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_1, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_E1 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_E1 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_E1, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_075 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_075 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_075, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_05 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_05 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_05, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_033 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_033 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_033, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_025 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_025 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_025, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    /* HI_PQ_ZME_COEF_0 */
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_LV, VZME_TAP_8T32P, pu8CurAddr);
    pstAddrTmp->u32ZmeCoefAddrVL8_0 = u32PhyAddr;
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;
    VZmeLoadWbcdhdCoefV(HI_PQ_ZME_COEF_0, PQ_HAL_ZME_VDP_COEF_8T32P_CV, VZME_TAP_8T32P, pu8CurAddr);
    u32PhyAddr  += u32NumSizeLuma;
    pu8CurAddr  += u32NumSizeLuma;

    return;
}

/*****************************Load VDP ZME COEF END*****************************************/

/*static HI_U32 PQ_HAL_GetV0ZmeHLCoef(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_1;
    }
    else if (u32TmpRatio == 4096)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_E1;
    }
    else if (u32TmpRatio >= 3072)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_075;
    }
    else if (u32TmpRatio >= 2048)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_05;
    }
    else if (u32TmpRatio >= 1365)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_033;
    }
    else if (u32TmpRatio >= 1024)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_025;
    }
    else
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrHL8_0;
    }

    return u32CoefAddr;
}*/

#if 1
static HI_U32 PQ_HAL_GetV0ZmeHLCoefSend(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;
    HI_PQ_ZME_COEF_RATIO_E enCoefRatio = HI_PQ_ZME_COEF_1;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHLCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHCCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    HI_U32 u32TmpSel = 0;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;


    if (u32TmpRatio > 4096 )
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }
    else if (u32TmpRatio == 4096)
    {
        enCoefRatio = HI_PQ_ZME_COEF_E1;
        u32TmpSel = 1;
    }
    else if (u32TmpRatio >= 3072)
    {
        enCoefRatio = HI_PQ_ZME_COEF_075;
        u32TmpSel = 2;
    }
    else if (u32TmpRatio >= 2048)
    {
        enCoefRatio = HI_PQ_ZME_COEF_05;
        u32TmpSel = 3;
    }
    else if (u32TmpRatio >= 1365)
    {
        enCoefRatio = HI_PQ_ZME_COEF_033;
        u32TmpSel = 4;
    }
    else if (u32TmpRatio >= 1024)
    {
        enCoefRatio = HI_PQ_ZME_COEF_025;
        u32TmpSel = 5;
    }
    else
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }

    sg_stGetPqProcVdpZmeStrategy.u32VidRatio[HI_PQ_ZME_COEF_TYPE_LH] = (HI_U32)enCoefRatio;
    sg_stGetPqProcVdpZmeStrategy.u32VidRatio[HI_PQ_ZME_COEF_TYPE_CH] = (HI_U32)enCoefRatio;

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32HLSel[u32TmpSel] != 0)
    {
        enHLCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32HLSel[u32TmpSel];
    }
    else
    {
        enHLCoefSel = g_stZmeCoefSel.stVidSel.u32HLSel[u32TmpSel];
    }

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32HCSel[u32TmpSel] != 0)
    {
        enHCCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32HCSel[u32TmpSel];
    }
    else
    {
        enHCCoefSel = g_stZmeCoefSel.stVidSel.u32HCSel[u32TmpSel];
    }

    u32CoefAddr = PQ_HAL_VdpV0ZmeHLCoefSend(enCoefRatio, enHLCoefSel);
    PQ_HAL_VdpV0ZmeHCCoefSend(enCoefRatio, enHCCoefSel);

    return u32CoefAddr;
}

static HI_U32 PQ_HAL_GetV0ZmeVLCoefSend(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;
    HI_PQ_ZME_COEF_RATIO_E enCoefRatio = HI_PQ_ZME_COEF_1;
    PQ_HAL_ZME_VDP_COEF_SEL_E enVLCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    PQ_HAL_ZME_VDP_COEF_SEL_E enVCCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    HI_U32 u32TmpSel = 0;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }
    else if (u32TmpRatio == 4096)
    {
        enCoefRatio = HI_PQ_ZME_COEF_E1;
        u32TmpSel = 1;
    }
    else if (u32TmpRatio >= 3072)
    {
        enCoefRatio = HI_PQ_ZME_COEF_075;
        u32TmpSel = 2;
    }
    else if (u32TmpRatio >= 2048)
    {
        enCoefRatio = HI_PQ_ZME_COEF_05;
        u32TmpSel = 3;
    }
    else if (u32TmpRatio >= 1365)
    {
        enCoefRatio = HI_PQ_ZME_COEF_033;
        u32TmpSel = 4;
    }
    else if (u32TmpRatio >= 1024)
    {
        enCoefRatio = HI_PQ_ZME_COEF_025;
        u32TmpSel = 5;
    }
    else
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }

    sg_stGetPqProcVdpZmeStrategy.u32VidRatio[HI_PQ_ZME_COEF_TYPE_LV] = (HI_U32)enCoefRatio;
    sg_stGetPqProcVdpZmeStrategy.u32VidRatio[HI_PQ_ZME_COEF_TYPE_CV] = (HI_U32)enCoefRatio;

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32VLSel[u32TmpSel] != 0)
    {
        enVLCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32VLSel[u32TmpSel];
    }
    else
    {
        enVLCoefSel = g_stZmeCoefSel.stVidSel.u32VLSel[u32TmpSel];
    }

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32VCSel[u32TmpSel] != 0)
    {
        enVCCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32VCSel[u32TmpSel];
    }
    else
    {
        enVCCoefSel = g_stZmeCoefSel.stVidSel.u32VCSel[u32TmpSel];
    }

    u32CoefAddr = PQ_HAL_VdpV0ZmeVLCoefSend(enCoefRatio, enVLCoefSel);
    PQ_HAL_VdpV0ZmeVCCoefSend(enCoefRatio, enVCCoefSel);

    return u32CoefAddr;
}

#endif

#if 0
static HI_U32 PQ_HAL_GetV0ZmeVLCoef(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_1;
    }
    else if (u32TmpRatio == 4096)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_E1;
    }
    else if (u32TmpRatio >= 3072)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_075;
    }
    else if (u32TmpRatio >= 2048)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_05;
    }
    else if (u32TmpRatio >= 1365)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_033;
    }
    else if (u32TmpRatio >= 1024)
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_025;
    }
    else
    {
        u32CoefAddr = g_stVZMEVdpInstance.stZmeCoefAddr.u32ZmeCoefAddrVL8_0;
    }

    return u32CoefAddr;
}
#endif


#if 1
static HI_U32 PQ_HAL_GetV0HPZmeHLCoefSend(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;
    HI_PQ_ZME_COEF_RATIO_E enCoefRatio = HI_PQ_ZME_COEF_1;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHLCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHCCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    HI_U32 u32TmpSel = 0;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if (u32TmpRatio > 4096 )
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }
    else if (u32TmpRatio == 4096)
    {
        enCoefRatio = HI_PQ_ZME_COEF_E1;
        u32TmpSel = 1;
    }
    else if (u32TmpRatio >= 3072)
    {
        enCoefRatio = HI_PQ_ZME_COEF_075;
        u32TmpSel = 2;
    }
    else if (u32TmpRatio >= 2048)
    {
        enCoefRatio = HI_PQ_ZME_COEF_05;
        u32TmpSel = 3;
    }
    else if (u32TmpRatio >= 1365)
    {
        enCoefRatio = HI_PQ_ZME_COEF_033;
        u32TmpSel = 4;
    }
    else if (u32TmpRatio >= 1024)
    {
        enCoefRatio = HI_PQ_ZME_COEF_025;
        u32TmpSel = 5;
    }
    else
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32HLSel[u32TmpSel] != 0)
    {
        enHLCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32HLSel[u32TmpSel];
    }
    else
    {
        enHLCoefSel = g_stZmeCoefSel.stVidSel.u32HLSel[u32TmpSel];
    }

    if (sg_stSetPqProcVdpZmeVidCoefSel.u32HCSel[u32TmpSel] != 0)
    {
        enHCCoefSel = sg_stSetPqProcVdpZmeVidCoefSel.u32HCSel[u32TmpSel];
    }
    else
    {
        enHCCoefSel = g_stZmeCoefSel.stVidSel.u32HCSel[u32TmpSel];
    }

    u32CoefAddr = PQ_HAL_VdpV0HPZmeHLCoefSend(enCoefRatio, enHLCoefSel);
    PQ_HAL_VdpV0HPZmeHCCoefSend(enCoefRatio, enHCCoefSel);

    return u32CoefAddr;
}

#endif

static HI_U32 PQ_HAL_GetWbcDhdZmeHLCoefSend(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;
    HI_PQ_ZME_COEF_RATIO_E enCoefRatio = HI_PQ_ZME_COEF_1;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHLCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    PQ_HAL_ZME_VDP_COEF_SEL_E enHCCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    HI_U32 u32TmpSel = 0;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;


    if (u32TmpRatio > 4096 )
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }
    else if (u32TmpRatio == 4096)
    {
        enCoefRatio = HI_PQ_ZME_COEF_E1;
        u32TmpSel = 1;
    }
    else if (u32TmpRatio >= 3072)
    {
        enCoefRatio = HI_PQ_ZME_COEF_075;
        u32TmpSel = 2;
    }
    else if (u32TmpRatio >= 2048)
    {
        enCoefRatio = HI_PQ_ZME_COEF_05;
        u32TmpSel = 3;
    }
    else if (u32TmpRatio >= 1365)
    {
        enCoefRatio = HI_PQ_ZME_COEF_033;
        u32TmpSel = 4;
    }
    else if (u32TmpRatio >= 1024)
    {
        enCoefRatio = HI_PQ_ZME_COEF_025;
        u32TmpSel = 5;
    }
    else
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }

    sg_stGetPqProcVdpZmeStrategy.u32WbcRatio[HI_PQ_ZME_COEF_TYPE_LH] = (HI_U32)enCoefRatio;
    sg_stGetPqProcVdpZmeStrategy.u32WbcRatio[HI_PQ_ZME_COEF_TYPE_CH] = (HI_U32)enCoefRatio;

    if (sg_stGetPqProcVdpZmeWbcCoefSel.u32HLSel[u32TmpSel] != 0)
    {
        enHLCoefSel = sg_stGetPqProcVdpZmeWbcCoefSel.u32HLSel[u32TmpSel];
    }
    else
    {
        enHLCoefSel = g_stZmeCoefSel.stWbcSel.u32HLSel[u32TmpSel];
    }

    if (sg_stGetPqProcVdpZmeWbcCoefSel.u32HCSel[u32TmpSel] != 0)
    {
        enHCCoefSel = sg_stGetPqProcVdpZmeWbcCoefSel.u32HCSel[u32TmpSel];
    }
    else
    {
        enHCCoefSel = g_stZmeCoefSel.stWbcSel.u32HCSel[u32TmpSel];
    }

    u32CoefAddr = PQ_HAL_VdpWbcDhdZmeHLCoefSend(enCoefRatio, enHLCoefSel);
    PQ_HAL_VdpWbcDhdZmeHCCoefSend(enCoefRatio, enHCCoefSel);

    return u32CoefAddr;
}

static HI_U32 PQ_HAL_GetWbcDhdZmeVLCoefSend(HI_U32 u32Ratio)
{
    HI_U32 u32CoefAddr;
    HI_U32 u32TmpRatio;
    HI_PQ_ZME_COEF_RATIO_E enCoefRatio = HI_PQ_ZME_COEF_1;
    PQ_HAL_ZME_VDP_COEF_SEL_E enVLCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    PQ_HAL_ZME_VDP_COEF_SEL_E enVCCoefSel = PQ_HAL_ZME_VDP_COEF_SEL_0;
    HI_U32 u32TmpSel = 0;

    if (0 == u32Ratio)
    {
        HI_ERR_PQ("ratio equal 0, error\n");
        u32Ratio = 1;
    }

    u32TmpRatio = 4096 * 4096 / u32Ratio;

    if      (u32TmpRatio > 4096 )
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }
    else if (u32TmpRatio == 4096)
    {
        enCoefRatio = HI_PQ_ZME_COEF_E1;
        u32TmpSel = 1;
    }
    else if (u32TmpRatio >= 3072)
    {
        enCoefRatio = HI_PQ_ZME_COEF_075;
        u32TmpSel = 2;
    }
    else if (u32TmpRatio >= 2048)
    {
        enCoefRatio = HI_PQ_ZME_COEF_05;
        u32TmpSel = 3;
    }
    else if (u32TmpRatio >= 1365)
    {
        enCoefRatio = HI_PQ_ZME_COEF_033;
        u32TmpSel = 4;
    }
    else if (u32TmpRatio >= 1024)
    {
        enCoefRatio = HI_PQ_ZME_COEF_025;
        u32TmpSel = 5;
    }
    else
    {
        enCoefRatio = HI_PQ_ZME_COEF_1;
        u32TmpSel = 0;
    }

    sg_stGetPqProcVdpZmeStrategy.u32WbcRatio[HI_PQ_ZME_COEF_TYPE_LV] = (HI_U32)enCoefRatio;
    sg_stGetPqProcVdpZmeStrategy.u32WbcRatio[HI_PQ_ZME_COEF_TYPE_CV] = (HI_U32)enCoefRatio;

    if (sg_stGetPqProcVdpZmeWbcCoefSel.u32VLSel[u32TmpSel] != 0)
    {
        enVLCoefSel = sg_stGetPqProcVdpZmeWbcCoefSel.u32VLSel[u32TmpSel];
    }
    else
    {
        enVLCoefSel = g_stZmeCoefSel.stWbcSel.u32VLSel[u32TmpSel];
    }

    if (sg_stGetPqProcVdpZmeWbcCoefSel.u32VCSel[u32TmpSel] != 0)
    {
        enVCCoefSel = sg_stGetPqProcVdpZmeWbcCoefSel.u32VCSel[u32TmpSel];
    }
    else
    {
        enVCCoefSel = g_stZmeCoefSel.stWbcSel.u32VCSel[u32TmpSel];
    }

    u32CoefAddr = PQ_HAL_VdpWbcDhdZmeVLCoefSend(enCoefRatio, enVLCoefSel);
    PQ_HAL_VdpWbcDhdZmeVCCoefSend(enCoefRatio, enVCCoefSel);

    return u32CoefAddr;
}


/* Vdp WBC Cfg Set to reg*/
/* explanation: In WBC We just pay atention to WBC_HD0 */
HI_VOID PQ_HAL_WbcDhdZmeRegCfg(HI_U32 u32LayerId, ALG_VZME_RTL_PARA_S *pstZmeRtlPara, HI_BOOL bFirEnable)
{
    if (u32LayerId != HI_PQ_ZME_LAYER_WBC_CAST)
    {
        HI_ERR_PQ("Wbc Dhd Zme Reg Cfg Layer Err \n");
    }
#if 0
    /* set zme order, h first or v first */
    PQ_HAL_WBC_DHD_SetZmeHfirOrder(pstZmeRtlPara->bZmeOrder);

    /* zme hor cfg */
    PQ_HAL_WBC_DHD_HZME_SetOutWidth(pstZmeRtlPara->u32ZmeWOut - 1);
    /* set enable */
    PQ_HAL_WBC_DHD_HZME_SetHlmscEn(pstZmeRtlPara->bZmeEnHL);
    PQ_HAL_WBC_DHD_HZME_SetHchmscEn(pstZmeRtlPara->bZmeEnHC);
    /* set fir. */
    PQ_HAL_WBC_DHD_HZME_SetHlfirEn(pstZmeRtlPara->bZmeMdHL);
    PQ_HAL_WBC_DHD_HZME_SetHchfirEn(pstZmeRtlPara->bZmeMdHC);

    /* set media fir. */
    PQ_HAL_WBC_DHD_HZME_SetHlmidEn(pstZmeRtlPara->bZmeMedHL);
    PQ_HAL_WBC_DHD_HZME_SetHchmidEn(pstZmeRtlPara->bZmeMedHC);
    /* set fmt */
    PQ_HAL_WBC_DHD_HZME_SetZmeOutFmt(0x2);
    /* set ratio. */
    PQ_HAL_WBC_DHD_HZME_SetHorRatio(pstZmeRtlPara->u32ZmeRatioHL);
    /* set offset. */
    PQ_HAL_WBC_DHD_HZME_SetHorLoffset(pstZmeRtlPara->s32ZmeOffsetHL);
    PQ_HAL_WBC_DHD_HZME_SetHorCoffset(pstZmeRtlPara->s32ZmeOffsetHC);
    /* set hor fir coef addr, and set updata flag */
    if (pstZmeRtlPara->u32ZmeRatioHL)
    {
        PQ_HAL_WBC_DHD_HZME_SetCoefAddr(pstZmeRtlPara->u32ZmeCoefAddrHL);
        PQ_HAL_WBC_DHD_HZME_SetParaUpd();
    }

    /* zme ver cfg */
    PQ_HAL_WBC_DHD_VZME_SetOutHeight(pstZmeRtlPara->u32ZmeHOut - 1);
    /* set enable */
    PQ_HAL_WBC_DHD_VZME_SetVlmscEn( pstZmeRtlPara->bZmeEnVL);
    PQ_HAL_WBC_DHD_VZME_SetVchmscEn( pstZmeRtlPara->bZmeEnVC);
    /* set fir. */
    PQ_HAL_WBC_DHD_VZME_SetVlfirEn( pstZmeRtlPara->bZmeMdVL);
    PQ_HAL_WBC_DHD_VZME_SetVchfirEn( pstZmeRtlPara->bZmeMdVC);

    /* set media fir. */
    PQ_HAL_WBC_DHD_VZME_SetHlmidEn( pstZmeRtlPara->bZmeMedVL);
    PQ_HAL_WBC_DHD_VZME_SetHchmidEn( pstZmeRtlPara->bZmeMedVC);
    /* set fmt */
    PQ_HAL_WBC_DHD_VZME_SetZmeInFmt(VDP_PROC_FMT_SP_422);
    PQ_HAL_WBC_DHD_VZME_SetZmeOutFmt(pstZmeRtlPara->u8ZmeYCFmtOut);
    /* set ratio. */
    PQ_HAL_WBC_DHD_VZME_SetVerRatio( pstZmeRtlPara->u32ZmeRatioVL);
    /* set offset. */
    PQ_HAL_WBC_DHD_VZME_SetVerLoffset( pstZmeRtlPara->s32ZmeOffsetVL);
    PQ_HAL_WBC_DHD_VZME_SetVerCoffset( pstZmeRtlPara->s32ZmeOffsetVC);
    PQ_HAL_WBC_DHD_VZME_SetVblumaOffset( pstZmeRtlPara->s32ZmeOffsetVLBtm);
    PQ_HAL_WBC_DHD_VZME_SetVbchromaOffset( pstZmeRtlPara->s32ZmeOffsetVCBtm);

    PQ_HAL_WBC_DHD_VZME_SetOutFld( HI_TRUE);
    PQ_HAL_WBC_DHD_VZME_SetOutPro( HI_TRUE);
    /* set ver fir coef addr, and set updata flag */
    if (pstZmeRtlPara->u32ZmeRatioVL)
    {
        PQ_HAL_WBC_DHD_VZME_SetCoefAddr(pstZmeRtlPara->u32ZmeCoefAddrVL);
        PQ_HAL_WBC_DHD_VZME_SetParaUpd();
    }
#endif
    return;
}

/*******************************WBC ZME END***************************************/

static HI_VOID PQ_HAL_ColorSpaceTrans(PQ_HAL_DHD_COLORSPACE_E *penHDOutColorSpace, PQ_HAL_DHD_COLORSPACE_E *penSDOutColorSpace)
{
    HI_DRV_COLOR_SPACE_E enColorSpace_Dhd_HD, enColorSpace_Dhd_SD;

    if ((penHDOutColorSpace == HI_NULL) || (penSDOutColorSpace == HI_NULL))
    {
        return;
    }

    enColorSpace_Dhd_HD = g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_HD1].enOutColorSpace;
    enColorSpace_Dhd_SD = g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_SD0].enOutColorSpace;

    /* SD */
    if ((HI_DRV_CS_BT601_RGB_LIMITED == enColorSpace_Dhd_SD) || (HI_DRV_CS_BT601_RGB_FULL == enColorSpace_Dhd_SD)
        || (HI_DRV_CS_BT709_RGB_LIMITED == enColorSpace_Dhd_SD) || (HI_DRV_CS_BT709_RGB_FULL == enColorSpace_Dhd_SD)
        || (HI_DRV_CS_BT2020_RGB_LIMITED == enColorSpace_Dhd_SD) || (HI_DRV_CS_BT2020_RGB_FULL == enColorSpace_Dhd_SD))
    {
        *penSDOutColorSpace = PQ_HAL_DHD_OUT_RGB;
    }
    else
    {
        *penSDOutColorSpace = PQ_HAL_DHD_OUT_YUV;
    }

    /* HD */
    if ((HI_DRV_CS_BT601_RGB_LIMITED == enColorSpace_Dhd_HD) || (HI_DRV_CS_BT601_RGB_FULL == enColorSpace_Dhd_HD)
        || (HI_DRV_CS_BT709_RGB_LIMITED == enColorSpace_Dhd_HD) || (HI_DRV_CS_BT709_RGB_FULL == enColorSpace_Dhd_HD)
        || (HI_DRV_CS_BT2020_RGB_LIMITED == enColorSpace_Dhd_HD) || (HI_DRV_CS_BT2020_RGB_FULL == enColorSpace_Dhd_HD))
    {
        *penHDOutColorSpace = PQ_HAL_DHD_OUT_RGB;
    }
    else
    {
        *penHDOutColorSpace = PQ_HAL_DHD_OUT_YUV;
    }

    return;
}

HI_S32 PQ_HAL_SetZmeDefault(HI_BOOL bOnOff)
{
    sg_bVdpZmeDefault  = bOnOff;

    return HI_SUCCESS;
}

static HI_VOID PQ_HAL_VO_SetHsacleModeByProc(HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    /* proc set zme width draw */
    switch (sg_stSetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode)
    {
        case HI_PQ_PROC_PREZME_HOR_1X:
            pstZmeOut->eHScalerMode = HI_PQ_PREZME_HOR_DISABLE;
            break;
        case HI_PQ_PROC_PREZME_HOR_2X:
            pstZmeOut->eHScalerMode = HI_PQ_PREZME_HOR_2X;
            break;
        case HI_PQ_PROC_PREZME_HOR_4X:
            pstZmeOut->eHScalerMode = HI_PQ_PREZME_HOR_4X;
            break;
        case HI_PQ_PROC_PREZME_HOR_8X:
            pstZmeOut->eHScalerMode = HI_PQ_PREZME_HOR_8X;
            break;
        default:
            break;
    }

    /* proc get zme width draw */
    if (HI_PQ_PROC_PREZME_HOR_ORI != sg_stSetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode)
    {
        sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = sg_stSetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode;

    }
    else
    {
        switch (pstZmeOut->eHScalerMode)
        {
            case HI_PQ_PREZME_HOR_DISABLE:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = HI_PQ_PROC_PREZME_HOR_1X;
                break;
            case HI_PQ_PREZME_HOR_2X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = HI_PQ_PROC_PREZME_HOR_2X;
                break;
            case HI_PQ_PREZME_HOR_4X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = HI_PQ_PROC_PREZME_HOR_4X;
                break;
            case HI_PQ_PREZME_HOR_8X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = HI_PQ_PROC_PREZME_HOR_8X;
                break;
            default:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode = HI_PQ_PROC_PREZME_HOR_ORI;
                break;
        }
    }

    return;
}


static HI_VOID PQ_HAL_VO_SetVsacleModeByProc(HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    /* proc set zme height draw */
    switch (sg_stSetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode)
    {
        case HI_PQ_PROC_PREZME_VER_1X:
            pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_DISABLE;
            break;
        case HI_PQ_PROC_PREZME_VER_2X:
            pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_2X;
            break;
        case HI_PQ_PROC_PREZME_VER_4X:
            pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_4X;
            break;
        case HI_PQ_PROC_PREZME_VER_8X:
            pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_8X;
            break;
        case HI_PQ_PROC_PREZME_VER_16X:
            pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_16X;
        break;   default:
            break;
    }

    /* proc get zme width draw */
    if (HI_PQ_PROC_PREZME_VER_ORI != sg_stSetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode)
    {
        sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = sg_stSetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode;
    }
    else
    {
        switch (pstZmeOut->eVScalerMode)
        {
            case HI_PQ_PREZME_VER_DISABLE:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_1X;
                break;
            case HI_PQ_PREZME_VER_2X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_2X;
                break;
            case HI_PQ_PREZME_VER_4X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_4X;
                break;
            case HI_PQ_PREZME_VER_8X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_8X;
                break;
            case HI_PQ_PREZME_VER_16X:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_16X;
                break;
            default:
                sg_stGetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode = HI_PQ_PROC_PREZME_VER_ORI;
                break;
        }
    }

    return;
}

static HI_VOID PQ_HAL_AdjustZmeFirEnCfg(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    if (HI_TRUE == sg_bVdpZmeDefault)
    {
        pstZmeOut->stHZmeCfg.bZmeFirHL = HI_FALSE ;
        pstZmeOut->stHZmeCfg.bZmeFirHC = HI_FALSE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL   = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC   = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL   = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC   = HI_FALSE;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHL   = 0;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHC   = 0;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVL   = 0;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVC   = 0;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVLBtm   = 0;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVCBtm   = 0;

        pstZmeOut->bZmeDefault = HI_TRUE;  /* 1: rwzb */
    }
    else
    {
        pstZmeOut->bZmeDefault = HI_FALSE; /* 0: no rwzb */
    }

    return;
}

static HI_VOID PQ_HAL_WbcVpZmeDefaultConfig(HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    if (HI_TRUE == sg_bVdpZmeDefault)
    {
        pstZmeOut->stZmeFmt.bZmeFirHL   = HI_FALSE;
        pstZmeOut->stZmeFmt.bZmeFirHC   = HI_FALSE;
        pstZmeOut->stZmeFmt.bZmeFirVL   = HI_FALSE;
        pstZmeOut->stZmeFmt.bZmeFirVC   = HI_FALSE;

        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetHL   = 0;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetHC   = 0;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVL   = 0;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVC   = 0;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVLBtm   = 0;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVCBtm   = 0;

        pstZmeOut->bZmeDefault = HI_TRUE;  /* 1: rwzb */
    }
    else
    {
        pstZmeOut->bZmeDefault = HI_FALSE; /* 0: no rwzb */
    }

    return;
}

static HI_VOID PQ_HAL_V0FreezeHresoConfig(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn,
        HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    /* 先固定逐行 */
    pstZmeOut->bReadFmtIn = HI_TRUE; /* preferential read field; 按接口时序读顶底场 */

    pstZmeOut->stFdrVfConfig.u32InWidth  = pstZmeIn->u32FrmWIn;
    pstZmeOut->stFdrVfConfig.u32OutWidth = pstZmeIn->u32FrmWIn;

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stFdrVfConfig.u32OutWidth;
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeIn->u32FrmWOut;

    pstZmeOut->eHScalerMode  = HI_PQ_PREZME_HOR_DISABLE;

    sg_stGetPqProcVdpZmeStrategy.bProcVdpHpzmeEn = pstZmeOut->stHZmeCfg.bZmeHorEnable;

    /* proc set zme width draw */
    PQ_HAL_VO_SetHsacleModeByProc(pstZmeOut);

    //pstZmeOut->stHZmeCfg.bPreZmeFir = (HI_TRUE == pstZmeOut->stHZmeCfg.bPreZme) ? HI_TRUE : HI_FALSE;

    return;
}


static HI_VOID PQ_HAL_V0NormHresoConfig(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn,
                                        HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    pstZmeOut->bReadFmtIn = pstZmeIn->bZmeFrmFmtIn; /* preferential read field; 按接口时序读顶底场 */

    if (pstZmeIn->u32FrmHIn <= pstZmeIn->u32FrmHOut)
    {
        pstZmeOut->stHZmeCfg.bZmeHorEnable = HI_FALSE;
        pstZmeOut->stHZmeCfg.u32InWidth  = pstZmeIn->u32FrmWIn;
        pstZmeOut->stHZmeCfg.u32OutWidth = pstZmeOut->stHZmeCfg.u32InWidth;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stHZmeCfg.u32OutWidth;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeIn->u32FrmWOut;
    }
    else if (pstZmeIn->u32FrmWIn <= pstZmeIn->u32FrmWOut)
    {
        pstZmeOut->stHZmeCfg.bZmeHorEnable = HI_FALSE;
        pstZmeOut->stHZmeCfg.u32InWidth  = pstZmeIn->u32FrmWIn;
        pstZmeOut->stHZmeCfg.u32OutWidth = pstZmeOut->stHZmeCfg.u32InWidth;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stHZmeCfg.u32OutWidth;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeIn->u32FrmWOut;
    }
    else if ((pstZmeIn->u32FrmWIn * pstZmeIn->u32FrmHOut * 6 / 5)
             >= (pstZmeOut->stHZmeCfg.u32InHeight * pstZmeIn->u32FrmWOut)) // ( 水平缩小倍数* 1.2 )  >= ( 垂直缩小倍数)
    {
        pstZmeOut->stHZmeCfg.bZmeHorEnable = HI_TRUE;
        pstZmeOut->stHZmeCfg.u32InWidth  = pstZmeIn->u32FrmWIn;
        pstZmeOut->stHZmeCfg.u32OutWidth = pstZmeIn->u32FrmWOut;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stHZmeCfg.u32OutWidth;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth;
    }
    else
    {
        pstZmeOut->stHZmeCfg.bZmeHorEnable = HI_TRUE;
        pstZmeOut->stHZmeCfg.u32InWidth  = pstZmeIn->u32FrmWIn;
        pstZmeOut->stHZmeCfg.u32OutWidth = ((pstZmeIn->u32FrmWIn * pstZmeIn->u32FrmHOut * 6) / (pstZmeIn->u32FrmHIn * 5) + 1) / 2 * 2;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stHZmeCfg.u32OutWidth;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeIn->u32FrmWOut;
    }

    if (pstZmeIn->u32FrmWIn >= pstZmeIn->u32FrmWOut * 16)
    {
        pstZmeOut->stHZmeCfg.bZmeHorEnable = HI_TRUE;
        pstZmeOut->stHZmeCfg.u32InWidth  = pstZmeIn->u32FrmWIn;
        pstZmeOut->stHZmeCfg.u32OutWidth = (pstZmeOut->stHZmeCfg.u32InWidth / 8) / 2 * 2 ;

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth   = pstZmeOut->stHZmeCfg.u32OutWidth;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth  = pstZmeIn->u32FrmWOut;
    }

    pstZmeOut->eHScalerMode  = HI_PQ_PREZME_HOR_DISABLE;

    /* vf fdr */
    pstZmeOut->stFdrVfConfig.eHScalerModeVf = HI_PQ_PREZME_HOR_DISABLE;
    pstZmeOut->stFdrVfConfig.u32InWidth  = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth;

    sg_stGetPqProcVdpZmeStrategy.bProcVdpHpzmeEn = pstZmeOut->stHZmeCfg.bZmeHorEnable;

    /* proc set zme width draw */
    PQ_HAL_VO_SetHsacleModeByProc(pstZmeOut);

    //pstZmeOut->stHZmeCfg.bPreZmeFir = (HI_TRUE == pstZmeOut->stHZmeCfg.bPreZme) ? HI_TRUE : HI_FALSE;

    return;
}

static HI_VOID PQ_HAL_V0FreezeVresoConfig(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn,
        HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    HI_U32 u32InHgt = pstZmeIn->u32FrmHIn;
    HI_U32 u32OutHgt = pstZmeIn->u32FrmHOut;
    HI_U32 u32DispHgt = (HI_U32)g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_HD1].stFmtRect.s32Height;

    HI_PQ_PREZME_VER_MUL_E enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    HI_PQ_PREZME_VER_MUL_E enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;

    // judge vdraw mode 1 depend on intf_h / video_oh
    if (u32DispHgt < V0_VDRAW_HEIGHT_THD_4 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    }
    else if (u32DispHgt < V0_VDRAW_HEIGHT_THD_8 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_2X;
    }
    else if (u32DispHgt < V0_VDRAW_HEIGHT_THD_16 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_4X;
    }
    else if (u32DispHgt < V0_VDRAW_HEIGHT_THD_32 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_8X;
    }
    else
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    }

    // judge vdraw mode 2 depend on intf_h / video_oh
    if (u32InHgt < V0_VDRAW_HEIGHT_THD_6 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;
    }
    else if (u32InHgt < V0_VDRAW_HEIGHT_THD_12 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_2X;
    }
    else if (u32InHgt < V0_VDRAW_HEIGHT_THD_24 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_4X;
    }
    else if (u32InHgt < V0_VDRAW_HEIGHT_THD_48 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_8X;
    }
    else
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;
    }

    // judge scale up or down
    if (u32InHgt <= u32OutHgt)
    {
        pstZmeOut->stFdrVfConfig.eVScalerModeVf = HI_PQ_PREZME_VER_DISABLE;
    }
    else
    {
        // judge vdraw mode : max tmp1 tmp2
        pstZmeOut->stFdrVfConfig.eVScalerModeVf = MAX2(enVDrawTmp1, enVDrawTmp2);
    }

    /* hpzme in width, out width;  zme1 in width, out width*/
    pstZmeOut->stFdrVfConfig.u32InHeight  = pstZmeIn->u32FrmHIn;
    pstZmeOut->stFdrVfConfig.u32OutHeight = ((pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->stFdrVfConfig.eVScalerModeVf)) + 1) / 2 * 2;

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight  = pstZmeOut->stFdrVfConfig.u32OutHeight;
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight = u32OutHgt;

    /* proc set zme height draw */
    PQ_HAL_VO_SetVsacleModeByProc(pstZmeOut);

    return;
}



static HI_VOID PQ_HAL_V0NormVresoConfig(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn,
                                        HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    HI_U32 u32InHgt = pstZmeIn->u32FrmHIn;
    HI_U32 u32OutHgt = pstZmeIn->u32FrmHOut;
    HI_U32 u32DispHgt = (HI_U32)g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_HD1].stFmtRect.s32Height;

    HI_PQ_PREZME_VER_MUL_E enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    HI_PQ_PREZME_VER_MUL_E enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;

    // judge vdraw mode 1 depend on intf_h / video_oh
    if (u32DispHgt <= V0_VDRAW_HEIGHT_THD_4 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    }
    else if (u32DispHgt <= V0_VDRAW_HEIGHT_THD_8 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_2X;
    }
    else if (u32DispHgt <= V0_VDRAW_HEIGHT_THD_16 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_4X;
    }
    else if (u32DispHgt < V0_VDRAW_HEIGHT_THD_32 * u32OutHgt)
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_8X;
    }
    else
    {
        enVDrawTmp1 = HI_PQ_PREZME_VER_DISABLE;
    }

    // judge vdraw mode 2 depend on intf_h / video_oh
    if (u32InHgt <= V0_VDRAW_HEIGHT_THD_4 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;
    }
    else if (u32InHgt <= V0_VDRAW_HEIGHT_THD_8 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_2X;
    }
    else if (u32InHgt <= V0_VDRAW_HEIGHT_THD_16 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_4X;
    }
    else if (u32InHgt < V0_VDRAW_HEIGHT_THD_32 * u32OutHgt)
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_8X;
    }
    else
    {
        enVDrawTmp2 = HI_PQ_PREZME_VER_DISABLE;
    }

    // judge scale up or down
    if (u32InHgt <= u32OutHgt)
    {
        pstZmeOut->eVScalerMode = HI_PQ_PREZME_VER_DISABLE;
    }
    else
    {
        // judge vdraw mode : max tmp1 tmp2
        pstZmeOut->eVScalerMode = MIN2(enVDrawTmp1, enVDrawTmp2);
    }

    /* hpzme in width, out width;  zme1 in width, out width*/
    /* add alin limit when vdraw open : DEI open must height 4 align*/
    if (HI_PQ_PREZME_VER_2X == pstZmeOut->eVScalerMode)
    {
        pstZmeOut->stHZmeCfg.u32InHeight = (pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->eVScalerMode)) / 8 * 8;
    }
    else if (HI_PQ_PREZME_VER_4X == pstZmeOut->eVScalerMode)
    {
        pstZmeOut->stHZmeCfg.u32InHeight = (pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->eVScalerMode)) / 16 * 16;
    }
    else if (HI_PQ_PREZME_VER_8X == pstZmeOut->eVScalerMode)
    {
        pstZmeOut->stHZmeCfg.u32InHeight = (pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->eVScalerMode)) / 32 * 32;
    }
    else if (HI_PQ_PREZME_VER_16X == pstZmeOut->eVScalerMode)
    {
        pstZmeOut->stHZmeCfg.u32InHeight = (pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->eVScalerMode)) / 64 * 64;
    }
    else // no vdraw
    {
        pstZmeOut->stHZmeCfg.u32InHeight = (pstZmeIn->u32FrmHIn / (1 << (HI_U32)pstZmeOut->eVScalerMode)) / 4 * 4;
    }

    /* change in height when vdraw open */
    pstZmeIn->u32FrmHIn = pstZmeOut->stHZmeCfg.u32InHeight * (1 << (HI_U32)pstZmeOut->eVScalerMode);

    pstZmeOut->stHZmeCfg.u32OutHeight  = pstZmeOut->stHZmeCfg.u32InHeight;

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight  = pstZmeOut->stHZmeCfg.u32OutHeight;
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight = u32OutHgt;

    /* vf fdr */
    pstZmeOut->stFdrVfConfig.eVScalerModeVf = HI_PQ_PREZME_VER_DISABLE;
    pstZmeOut->stFdrVfConfig.u32InHeight    = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight;

    /* proc set zme height draw */
    PQ_HAL_VO_SetVsacleModeByProc(pstZmeOut);

    return;
}


static HI_S32 pq_hal_GetVerticalScalerOffset(HI_U32 u32VRatio, PQ_HAL_ALG_VZME_DRV_PARA_S *pstZmeDrvPara)
{
    HI_S32 s32VOffset = 0;

    if (pstZmeDrvPara->bZmeFrmFmtIn) /* processive input */
    {
        if (pstZmeDrvPara->bZmeFrmFmtOut) /* processive output */
        {
            s32VOffset = 0;
        }
        else /* interlaced output */
        {
            if (pstZmeDrvPara->bZmeBFOut) /* bottom field output */
            {
                s32VOffset = (HI_S32)u32VRatio >> 1;
            }
            else /*top field output */
            {
                s32VOffset = 0;
            }
        }
    }
    else /* interlaced input */
    {
        if (pstZmeDrvPara->bZmeFrmFmtOut) /* processive output */
        {
            if (pstZmeDrvPara->bZmeBFIn) /* bottom field input */
            {
                s32VOffset = -(ALG_V_VZME_PRECISION >> 1); /* -2048 */
            }
            else /* top field input */
            {
                s32VOffset = 0;
            }
        }
        else /* interlaced output */
        {
            if (pstZmeDrvPara->bZmeBFIn) /* bottom field input */
            {
                if (pstZmeDrvPara->bZmeBFOut) /* bottom field output */
                {
                    s32VOffset = ((HI_S32)u32VRatio - ALG_V_VZME_PRECISION) >> 1;
                }
                else /* top field output */
                {
                    s32VOffset = -(ALG_V_VZME_PRECISION >> 1); /* -2048 */
                }
            }
            else /* top field input */
            {
                if (pstZmeDrvPara->bZmeBFOut) /* bottom field output */
                {
                    s32VOffset = (HI_S32)u32VRatio >> 1;
                }
                else /* top field output */
                {
                    s32VOffset = 0;
                }
            }
        }
    }

    return s32VOffset;
}

static HI_VOID pq_hal_SetV0HpzmeZmeOffset(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    ALG_VZME_RTL_PARA_S         stZmeRtlPara;

    /* calculate luma real zme resolution of input and output */
    stZmeRtlPara.u32ZmeWIn     = pstZmeOut->stHZmeCfg.u32InWidth;
    stZmeRtlPara.u32ZmeWOut    = pstZmeOut->stHZmeCfg.u32OutWidth;

    PQ_CHECK_ZERO_RE_NULL(stZmeRtlPara.u32ZmeWOut);

    /* when wide > 4096, overflow will occurs */
    if (stZmeRtlPara.u32ZmeWIn >= 4096)
    {
        stZmeRtlPara.u32ZmeRatioHL = (stZmeRtlPara.u32ZmeWIn / 2 * ALG_V_HZME_PRECISION) / stZmeRtlPara.u32ZmeWOut * 2;
    }
    else
    {
        stZmeRtlPara.u32ZmeRatioHL = stZmeRtlPara.u32ZmeWIn * ALG_V_HZME_PRECISION / stZmeRtlPara.u32ZmeWOut;
    }

    pstZmeOut->stHZmeCfg.s32ZmeOffsetHL    = 0;
    pstZmeOut->stHZmeCfg.s32ZmeOffsetHC  = 0;

    pstZmeOut->stHZmeCfg.u32ZmeCoefAddrHL = PQ_HAL_GetV0HPZmeHLCoefSend(stZmeRtlPara.u32ZmeRatioHL >> 8);

    return;
}


static HI_VOID pq_hal_SetWbcVpZmeOffset(HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn, HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    HI_U32 u32ZmeCWIn, u32ZmeCWOut, u32ZmeCHIn, u32ZmeCHOut;
    HI_S32 s32VOffset, s32HOffset;
    HI_U32 u32ZmeRatioVLReal, u32ZmeRatioVCReal;
    PQ_HAL_ALG_VZME_DRV_PARA_S  stZmeDrvPara;
    ALG_VZME_RTL_PARA_S         stZmeRtlPara;

    /* calculate luma real zme resolution of input and output */
    if (HI_PQ_PREZME_HOR_DISABLE == pstZmeOut->eHScalerMode)
    {
        stZmeRtlPara.u32ZmeWIn     = pstZmeOut->stZmeFmt.u32InWidth;
    }
    else
    {
        stZmeRtlPara.u32ZmeWIn     = pstZmeOut->stZmeFmt.u32InWidth >> pstZmeOut->eHScalerMode;
    }
    stZmeRtlPara.u32ZmeWOut    = pstZmeOut->stZmeFmt.u32OutWidth;
    stZmeRtlPara.u32ZmeHIn     = pstZmeOut->stZmeFmt.u32InHeight;
    stZmeRtlPara.u32ZmeHOut    = pstZmeOut->stZmeFmt.u32OutHeight;

    stZmeDrvPara.enZmeInFmt  = pstZmeOut->stZmeFmt.enZmeInFmt ;
    stZmeDrvPara.enZmeOutFmt = pstZmeOut->stZmeFmt.enZmeOutFmt;

    /* zme in & out frame or field */
    if (pstZmeOut->bReadFmtIn && pstZmeOut->bOpenP2I)
    {
        stZmeDrvPara.bZmeFrmFmtIn  = HI_FALSE;
    }
    else
    {
        stZmeDrvPara.bZmeFrmFmtIn  = pstZmeOut->bReadFmtIn;
    }
    stZmeDrvPara.bZmeFrmFmtOut = pstZmeOut->stZmeFmt.bOutFmt; /* Field : Top Or Bottom */

    //stZmeRtlPara.u32ZmeHIn  = ( stZmeDrvPara.bZmeFrmFmtIn  == 1 ) ? stZmeDrvPara.u32ZmeFrmHIn: stZmeDrvPara.u32ZmeFrmHIn/2;
    //stZmeRtlPara.u32ZmeHOut = ( stZmeDrvPara.bZmeFrmFmtOut == 1 ) ? stZmeDrvPara.u32ZmeFrmHOut: stZmeDrvPara.u32ZmeFrmHOut/2;
    PQ_CHECK_ZERO_RE_NULL(stZmeRtlPara.u32ZmeWOut);
    PQ_CHECK_ZERO_RE_NULL(stZmeRtlPara.u32ZmeHOut);

    /* when wide > 4096, overflow will occurs */
    if (stZmeRtlPara.u32ZmeWIn >= 4096)
    {
        stZmeRtlPara.u32ZmeRatioHL = (stZmeRtlPara.u32ZmeWIn / 2 * ALG_V_HZME_PRECISION) / stZmeRtlPara.u32ZmeWOut * 2;
    }
    else
    {
        stZmeRtlPara.u32ZmeRatioHL = stZmeRtlPara.u32ZmeWIn * ALG_V_HZME_PRECISION / stZmeRtlPara.u32ZmeWOut;
    }
    stZmeRtlPara.u32ZmeRatioVL = stZmeRtlPara.u32ZmeHIn * ALG_V_VZME_PRECISION / stZmeRtlPara.u32ZmeHOut;

    /* calculate chroma zme ratio */
    u32ZmeCWIn  = ( stZmeDrvPara.enZmeInFmt  == HI_PQ_ALG_PIX_FORMAT_SP444 ) ? stZmeRtlPara.u32ZmeWIn : stZmeRtlPara.u32ZmeWIn / 2;
    u32ZmeCWOut = ( stZmeDrvPara.enZmeOutFmt == HI_PQ_ALG_PIX_FORMAT_SP444 ) ? stZmeRtlPara.u32ZmeWOut : stZmeRtlPara.u32ZmeWOut / 2;
    u32ZmeCHIn  = ( stZmeDrvPara.enZmeInFmt  == HI_PQ_ALG_PIX_FORMAT_SP420 ) ? stZmeRtlPara.u32ZmeHIn / 2 : stZmeRtlPara.u32ZmeHIn;
    u32ZmeCHOut = ( stZmeDrvPara.enZmeOutFmt == HI_PQ_ALG_PIX_FORMAT_SP420 ) ? stZmeRtlPara.u32ZmeHOut / 2 : stZmeRtlPara.u32ZmeHOut;

    /* when wide > 4096, overflow will occurs */
    if (u32ZmeCWIn >= 4096)
    {
        stZmeRtlPara.u32ZmeRatioHC = (u32ZmeCWIn / 2 * ALG_V_HZME_PRECISION) / u32ZmeCWOut * 2;
    }
    else
    {
        stZmeRtlPara.u32ZmeRatioHC = u32ZmeCWIn * ALG_V_HZME_PRECISION / u32ZmeCWOut;
    }
    stZmeRtlPara.u32ZmeRatioVC = u32ZmeCHIn * ALG_V_VZME_PRECISION / u32ZmeCHOut;

    /* Input Progressive and Output Interlace */
    if (1 == stZmeDrvPara.bZmeFrmFmtIn && 0 == stZmeDrvPara.bZmeFrmFmtOut)
    {
        u32ZmeRatioVLReal = stZmeRtlPara.u32ZmeRatioVL * 2;
        u32ZmeRatioVCReal = stZmeRtlPara.u32ZmeRatioVC * 2;
    }
    else
    {
        u32ZmeRatioVLReal = stZmeRtlPara.u32ZmeRatioVL;
        u32ZmeRatioVCReal = stZmeRtlPara.u32ZmeRatioVC;
    }

    /* calculate luma zme offset */
    stZmeRtlPara.s32ZmeOffsetHL = 0;

    /* top offert  */
    {
        stZmeDrvPara.bZmeBFIn  = 0;//pstZmeIn->bZmeBFIn; /* Field : 0 Top Or 1 Bottom */
        stZmeDrvPara.bZmeBFOut = 0;//pstZmeIn->bZmeBFOut; /* Field : 0 Top Or 1 Bottom */

        /* Set Top filelds calc ZmeoffsetVL */
        stZmeRtlPara.s32ZmeOffsetVL = pq_hal_GetVerticalScalerOffset(u32ZmeRatioVLReal, &stZmeDrvPara);

        /* calculate chroma zme offset */
        s32VOffset = 0, s32HOffset = 0;

        if (HI_PQ_ALG_PIX_FORMAT_SP420 == stZmeDrvPara.enZmeInFmt) /* 4:2:0 */
        {
            /* horizontal offset for cosited or interspersed format *//* fixed to false; interspersed format */
            s32HOffset = 0;

            /* vertical offset for processive or interlaced input format */
            if (stZmeDrvPara.bZmeFrmFmtIn) /* processive input for zme */
            {
                s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
            }
            else /* interlaced input for zme */
            {
                if (stZmeDrvPara.bZmeBFIn) /* bottom field input for zme */
                {
                    s32VOffset = -((3 * ALG_V_VZME_PRECISION) >> 2) >> 1; /* -3072 >> 1 */
                }
                else /* top field input for zme */
                {
                    s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
                }
            }
        }


        stZmeRtlPara.s32ZmeOffsetHC = s32HOffset;
        stZmeRtlPara.s32ZmeOffsetVC = s32VOffset + pq_hal_GetVerticalScalerOffset(u32ZmeRatioVCReal, &stZmeDrvPara);

        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVL       = stZmeRtlPara.s32ZmeOffsetVL;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVC       = stZmeRtlPara.s32ZmeOffsetVC;
    }

    /* bottom offert  */
    {
        stZmeDrvPara.bZmeBFIn  = 1;//pstZmeIn->bZmeBFIn; /* Field : 0 Top Or 1 Bottom */
        stZmeDrvPara.bZmeBFOut = 1;//pstZmeIn->bZmeBFOut; /* Field : 0 Top Or 1 Bottom */

        /* calculate chroma zme offset */
        s32VOffset = 0, s32HOffset = 0;
        if (HI_PQ_ALG_PIX_FORMAT_SP420 == stZmeDrvPara.enZmeInFmt) /* 4:2:0 */
        {
            /* horizontal offset for cosited or interspersed format *//* fixed to false; interspersed format */
            s32HOffset = 0;

            /* vertical offset for processive or interlaced input format */
            if (stZmeDrvPara.bZmeFrmFmtIn) /* processive input for zme */
            {
                s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
            }
            else /* interlaced input for zme */
            {
                if (stZmeDrvPara.bZmeBFIn) /* bottom field input for zme */
                {
                    s32VOffset = -((3 * ALG_V_VZME_PRECISION) >> 2) >> 1; /* -3072 >> 1 */

                }
                else /* top field input for zme */
                {
                    s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
                }
            }
        }

        stZmeRtlPara.s32ZmeOffsetVLBtm = pq_hal_GetVerticalScalerOffset(u32ZmeRatioVLReal, &stZmeDrvPara);
        stZmeRtlPara.s32ZmeOffsetVCBtm = s32VOffset + pq_hal_GetVerticalScalerOffset(u32ZmeRatioVCReal, &stZmeDrvPara);

        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVLBtm    = stZmeRtlPara.s32ZmeOffsetVLBtm;
        pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVCBtm    = stZmeRtlPara.s32ZmeOffsetVCBtm;
    }

    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetHL       = stZmeRtlPara.s32ZmeOffsetHL;
    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetHC       = stZmeRtlPara.s32ZmeOffsetHC;
    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVL       = stZmeRtlPara.s32ZmeOffsetVL;
    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVC       = stZmeRtlPara.s32ZmeOffsetVC;
    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVLBtm    = stZmeRtlPara.s32ZmeOffsetVLBtm;
    pstZmeOut->stZmeFmt.stZmeOffset.s32ZmeOffsetVCBtm    = stZmeRtlPara.s32ZmeOffsetVCBtm;

    /* coef add */
    pstZmeOut->stZmeFmt.stZmeAddr.u32ZmeCoefAddrHL = PQ_HAL_GetWbcDhdZmeHLCoefSend(stZmeRtlPara.u32ZmeRatioHL >> 8);
    pstZmeOut->stZmeFmt.stZmeAddr.u32ZmeCoefAddrVL = PQ_HAL_GetWbcDhdZmeVLCoefSend(stZmeRtlPara.u32ZmeRatioVL);

    return;
}


HI_VOID PQ_HAL_SetVdpZmeFirEn(HI_BOOL bZmeFirEn)
{
    g_bHalVdpZmeFirEn = bZmeFirEn;

    return;
}

HI_VOID PQ_HAL_SetVdpZmeMedEn(HI_BOOL bZmeModEn)
{
    g_bHalVdpZmeMedEn = bZmeModEn;

    return;
}

static HI_VOID PQ_HAL_SetV0FreezeZmeFirFmt(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    //hor fir en
    if (pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth != pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth)
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = HI_FALSE;
    }

    //ver fir en
    if ((pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight != pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight) ||
        (pstZmeIn->enZmeInFmt == HI_PQ_ALG_PIX_FORMAT_SP420)) /* zme output: 0-422; 1-420; 2-444 */
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = HI_FALSE;
    }

    //fir mid en
    if (HI_TRUE == g_bHalVdpZmeFirEn)
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = HI_FALSE;
    }

    if (HI_TRUE == g_bHalVdpZmeMedEn)
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = HI_TRUE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = HI_TRUE ;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = HI_FALSE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = HI_FALSE ;
    }

    //fmt
    if (pstZmeIn->enZmeInFmt == HI_PQ_ALG_PIX_FORMAT_SP420) /* zme output: 0-422; 1-420; 2-444 */
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeInFmt  = HI_PQ_ALG_PIX_FORMAT_SP420;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeInFmt  = HI_PQ_ALG_PIX_FORMAT_SP422;
    }

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeOutFmt = HI_PQ_ALG_PIX_FORMAT_SP422;

    return;
}

static HI_VOID PQ_HAL_SetV0ZmeFirFmt(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    //hor fir en
    if (pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth != pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth)
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeHorEnable = HI_FALSE;
    }

    //ver fir en
    if ((pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight != pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight) ||
        (pstZmeIn->enZmeInFmt == HI_PQ_ALG_PIX_FORMAT_SP420)) /* zme output: 0-422; 1-420; 2-444 */
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeVerEnable = HI_FALSE;
    }

    /* hpzme hor fir en has been decided */

    //fir mid en
    if (HI_TRUE == g_bHalVdpZmeFirEn)
    {
        pstZmeOut->stHZmeCfg.bZmeFirHL = HI_TRUE ;
        pstZmeOut->stHZmeCfg.bZmeFirHC = HI_TRUE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = HI_TRUE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = HI_TRUE;
    }
    else
    {
        pstZmeOut->stHZmeCfg.bZmeFirHL = HI_FALSE ;
        pstZmeOut->stHZmeCfg.bZmeFirHC = HI_FALSE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHL = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVL = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirHC = HI_FALSE;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeFirVC = HI_FALSE;
    }

    if (HI_TRUE == g_bHalVdpZmeMedEn)
    {
        pstZmeOut->stHZmeCfg.bZmeMedH = HI_TRUE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = HI_TRUE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = HI_TRUE ;
    }
    else
    {
        pstZmeOut->stHZmeCfg.bZmeMedH = HI_FALSE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedH  = HI_FALSE ;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].bZmeMedV  = HI_FALSE ;
    }

    //fmt
    if (pstZmeIn->enZmeInFmt == HI_PQ_ALG_PIX_FORMAT_SP420) /* zme output: 0-422; 1-420; 2-444 */
    {
        pstZmeOut->stHZmeCfg.enZmeInFmt  = HI_PQ_ALG_PIX_FORMAT_SP420;
        pstZmeOut->stHZmeCfg.enZmeOutFmt = HI_PQ_ALG_PIX_FORMAT_SP420;
    }
    else
    {
        pstZmeOut->stHZmeCfg.enZmeInFmt  = HI_PQ_ALG_PIX_FORMAT_SP422;
        pstZmeOut->stHZmeCfg.enZmeOutFmt = HI_PQ_ALG_PIX_FORMAT_SP422;
    }

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeInFmt  = pstZmeOut->stHZmeCfg.enZmeInFmt;
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeOutFmt = HI_PQ_ALG_PIX_FORMAT_SP422;

    return;
}

static HI_VOID PQ_HAL_SetV0Zme_Offset_CoefAddr(HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    HI_U32 u32ZmeCWIn, u32ZmeCWOut, u32ZmeCHIn, u32ZmeCHOut;
    HI_S32 s32VOffset, s32HOffset;
    HI_U32 u32ZmeRatioVLReal, u32ZmeRatioVCReal;
    PQ_HAL_ALG_VZME_DRV_PARA_S  stZmeDrvPara;
    ALG_VZME_RTL_PARA_S         stZmeRtlPara;

    /* calculate luma real zme resolution of input and output */
    stZmeRtlPara.u32ZmeWIn     = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth;
    stZmeRtlPara.u32ZmeWOut    = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth;
    stZmeRtlPara.u32ZmeHIn     = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight;
    stZmeRtlPara.u32ZmeHOut    = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight;

    stZmeDrvPara.enZmeInFmt  = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeInFmt ;
    stZmeDrvPara.enZmeOutFmt = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].enZmeOutFmt;

    /* zme in & out frame or field */
    stZmeDrvPara.bZmeFrmFmtIn  = pstZmeOut->bReadFmtIn;
    stZmeDrvPara.bZmeFrmFmtOut = pstZmeIn->bZmeFrmFmtOut; /* Field : Top Or Bottom */

    //stZmeRtlPara.u32ZmeHIn  = ( stZmeDrvPara.bZmeFrmFmtIn  == 1 ) ? stZmeDrvPara.u32ZmeFrmHIn: stZmeDrvPara.u32ZmeFrmHIn/2;
    //stZmeRtlPara.u32ZmeHOut = ( stZmeDrvPara.bZmeFrmFmtOut == 1 ) ? stZmeDrvPara.u32ZmeFrmHOut: stZmeDrvPara.u32ZmeFrmHOut/2;
    PQ_CHECK_ZERO_RE_NULL(stZmeRtlPara.u32ZmeWOut);
    PQ_CHECK_ZERO_RE_NULL(stZmeRtlPara.u32ZmeHOut);

    /* when wide > 4096, overflow will occurs */
    if (stZmeRtlPara.u32ZmeWIn >= 4096)
    {
        stZmeRtlPara.u32ZmeRatioHL = (stZmeRtlPara.u32ZmeWIn / 2 * ALG_V_HZME_PRECISION) / stZmeRtlPara.u32ZmeWOut * 2;
    }
    else
    {
        stZmeRtlPara.u32ZmeRatioHL = stZmeRtlPara.u32ZmeWIn * ALG_V_HZME_PRECISION / stZmeRtlPara.u32ZmeWOut;
    }
    stZmeRtlPara.u32ZmeRatioVL = stZmeRtlPara.u32ZmeHIn * ALG_V_VZME_PRECISION / stZmeRtlPara.u32ZmeHOut;

    /* calculate chroma zme ratio */
    u32ZmeCWIn  = ( stZmeDrvPara.enZmeInFmt  == HI_PQ_ALG_PIX_FORMAT_SP444 ) ? stZmeRtlPara.u32ZmeWIn : stZmeRtlPara.u32ZmeWIn / 2;
    u32ZmeCWOut = ( stZmeDrvPara.enZmeOutFmt == HI_PQ_ALG_PIX_FORMAT_SP444 ) ? stZmeRtlPara.u32ZmeWOut : stZmeRtlPara.u32ZmeWOut / 2;
    u32ZmeCHIn  = ( stZmeDrvPara.enZmeInFmt  == HI_PQ_ALG_PIX_FORMAT_SP420 ) ? stZmeRtlPara.u32ZmeHIn / 2 : stZmeRtlPara.u32ZmeHIn;
    u32ZmeCHOut = ( stZmeDrvPara.enZmeOutFmt == HI_PQ_ALG_PIX_FORMAT_SP420 ) ? stZmeRtlPara.u32ZmeHOut / 2 : stZmeRtlPara.u32ZmeHOut;
    /* when wide > 4096, overflow will occurs */
    if (u32ZmeCWIn >= 4096)
    {
        stZmeRtlPara.u32ZmeRatioHC = (u32ZmeCWIn / 2 * ALG_V_HZME_PRECISION) / u32ZmeCWOut * 2;
    }
    else
    {
        stZmeRtlPara.u32ZmeRatioHC = u32ZmeCWIn * ALG_V_HZME_PRECISION / u32ZmeCWOut;
    }
    stZmeRtlPara.u32ZmeRatioVC = u32ZmeCHIn * ALG_V_VZME_PRECISION / u32ZmeCHOut;

    /* Input Progressive and Output Interlace */
    if (1 == stZmeDrvPara.bZmeFrmFmtIn && 0 == stZmeDrvPara.bZmeFrmFmtOut)
    {
        u32ZmeRatioVLReal = stZmeRtlPara.u32ZmeRatioVL * 2;
        u32ZmeRatioVCReal = stZmeRtlPara.u32ZmeRatioVC * 2;
    }
    else
    {
        u32ZmeRatioVLReal = stZmeRtlPara.u32ZmeRatioVL;
        u32ZmeRatioVCReal = stZmeRtlPara.u32ZmeRatioVC;
    }

    /* calculate luma zme offset */
    stZmeRtlPara.s32ZmeOffsetHL = 0;

    /* top offert  */
    {
        stZmeDrvPara.bZmeBFIn  = 0;//pstZmeIn->bZmeBFIn; /* Field : 0 Top Or 1 Bottom */
        stZmeDrvPara.bZmeBFOut = 0;//pstZmeIn->bZmeBFOut; /* Field : 0 Top Or 1 Bottom */

        /* Set Top filelds calc ZmeoffsetVL */
        stZmeRtlPara.s32ZmeOffsetVL = pq_hal_GetVerticalScalerOffset(u32ZmeRatioVLReal, &stZmeDrvPara);

        /* calculate chroma zme offset */
        s32VOffset = 0, s32HOffset = 0;
        if (HI_PQ_ALG_PIX_FORMAT_SP420 == stZmeDrvPara.enZmeInFmt) /* 4:2:0 */
        {
            /* horizontal offset for cosited or interspersed format *//* fixed to false; interspersed format */
            s32HOffset = 0;

            /* vertical offset for processive or interlaced input format */
            if (stZmeDrvPara.bZmeFrmFmtIn) /* processive input for zme */
            {
                s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
            }
            else /* interlaced input for zme */
            {
                if (stZmeDrvPara.bZmeBFIn) /* bottom field input for zme */
                {
                    s32VOffset = -((3 * ALG_V_VZME_PRECISION) >> 2) >> 1; /* -3072 >> 1 */
                }
                else /* top field input for zme */
                {
                    s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
                }
            }
        }

        stZmeRtlPara.s32ZmeOffsetHC = s32HOffset;
        stZmeRtlPara.s32ZmeOffsetVC = s32VOffset + pq_hal_GetVerticalScalerOffset(u32ZmeRatioVCReal, &stZmeDrvPara);

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVL       = stZmeRtlPara.s32ZmeOffsetVL;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVC       = stZmeRtlPara.s32ZmeOffsetVC;
    }

    /* bottom offert  */
    {
        stZmeDrvPara.bZmeBFIn  = 1;//pstZmeIn->bZmeBFIn; /* Field : 0 Top Or 1 Bottom */
        stZmeDrvPara.bZmeBFOut = 1;//pstZmeIn->bZmeBFOut; /* Field : 0 Top Or 1 Bottom */

        /* calculate chroma zme offset */
        s32VOffset = 0, s32HOffset = 0;
        if (HI_PQ_ALG_PIX_FORMAT_SP420 == stZmeDrvPara.enZmeInFmt) /* 4:2:0 */
        {
            /* horizontal offset for cosited or interspersed format *//* fixed to false; interspersed format */
            s32HOffset = 0;

            /* vertical offset for processive or interlaced input format */
            if (stZmeDrvPara.bZmeFrmFmtIn) /* processive input for zme */
            {
                s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
            }
            else /* interlaced input for zme */
            {
                if (stZmeDrvPara.bZmeBFIn) /* bottom field input for zme */
                {
                    s32VOffset = -((3 * ALG_V_VZME_PRECISION) >> 2) >> 1; /* -3072 >> 1 */
                }
                else /* top field input for zme */
                {
                    s32VOffset = -(ALG_V_VZME_PRECISION >> 2) >> 1; /* -1024 >> 1 */
                }
            }
        }

        stZmeRtlPara.s32ZmeOffsetVLBtm = pq_hal_GetVerticalScalerOffset(u32ZmeRatioVLReal, &stZmeDrvPara);
        stZmeRtlPara.s32ZmeOffsetVCBtm = s32VOffset + pq_hal_GetVerticalScalerOffset(u32ZmeRatioVCReal, &stZmeDrvPara);

        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVLBtm    = stZmeRtlPara.s32ZmeOffsetVLBtm;
        pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetVCBtm    = stZmeRtlPara.s32ZmeOffsetVCBtm;
    }

    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHL       = stZmeRtlPara.s32ZmeOffsetHL;
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeOffset.s32ZmeOffsetHC       = stZmeRtlPara.s32ZmeOffsetHC;

    /* coef add */
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeAddr.u32ZmeCoefAddrHL = PQ_HAL_GetV0ZmeHLCoefSend(stZmeRtlPara.u32ZmeRatioHL >> 8);
    pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].stZmeAddr.u32ZmeCoefAddrVL = PQ_HAL_GetV0ZmeVLCoefSend(stZmeRtlPara.u32ZmeRatioVL);

    return;
}

static HI_PQ_WBC_VP_POINT_SEL_E PQ_HAL_WbcVpWriteBackPointConfig(HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn)
{
    //1 回写点策略暂时按照送进来决策后的宽高来处理
    HI_PQ_WBC_VP_POINT_SEL_E   enVpPoint      = HI_PQ_WBC_VP_POINT_V0;

    PQ_HAL_DHD_COLORSPACE_E enHDOutColorSpace = PQ_HAL_DHD_OUT_YUV;
    PQ_HAL_DHD_COLORSPACE_E enSDOutColorSpace = PQ_HAL_DHD_OUT_YUV;

    PQ_HAL_ColorSpaceTrans(&enHDOutColorSpace, &enSDOutColorSpace);

    /***
    回写点选择策略:
    (1) 过指标场景: 回写点在V0;
    (2) 多窗口情况: 选择VP上CSC之后的回写点;
    (3) 水印场景:   选择VP上CSC之后的回写点;
    (4) 毛玻璃场景: 选择VP上CSC之后的回写点;
    (5) 大比例缩小情况:
        即(源->SD显示的缩小比例，如缩小10倍)> (源->HD显示的缩小比例，如缩小6倍), 则选择VP上CSC之后的回写点;
          (SD输出有两级缩小, 可以提升SD输出缩小的图像质量) -- 等价于高清通路是缩小场景;
    (6) VESA timming 输出时不做特殊处理
    (7) Else, 选择V0 Scaler0之前的回写点;
    ***/
    if (HI_TRUE == sg_bVdpZmeDefault) /* rwzb */
    {
        enVpPoint = HI_PQ_WBC_VP_POINT_V0;
    }
    else if (HI_TRUE == pstZmeIn->bForceWbcPoint2Vp) /* (1)multi-window, (2)watermark, (3)forstglass; force to vp0 */
    {
        enVpPoint = HI_PQ_WBC_VP_POINT_VP;
    }
    else if ((pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmWIn == pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmWOut)
             && (pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHIn == pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHOut))
        /* Interlace output and source resolution == out resolution */
    {
        /* Add 20160325 sdk 非指标场景, 但是源与CVBS的分辨率一致也要从V0回写；高清源输入跟标清输出一致用V0
           e.g.: 576i --> 576p --> 576i(Hdmi), 576i(Cvbs); 回写点在V0;
                 480i --> 480p --> 480i(Hdmi), 480i(Cvbs); 回写点在V0; */
        enVpPoint = HI_PQ_WBC_VP_POINT_V0;
    }
    else if ((pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHIn > pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHOut)
             && (pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHOut > pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHOut))
    {
        /* example: 720x576-->600x480(HD) 需要从V0回写; 高度两级缩小比一级缩小好
           Judgement condition is height of V0, not the height of VP */
        enVpPoint = HI_PQ_WBC_VP_POINT_VP;
    }
    else
    {
        enVpPoint = HI_PQ_WBC_VP_POINT_V0;
    }

    enVpPoint = HI_PQ_WBC_VP_POINT_V0;

    return enVpPoint;
}

static HI_BOOL PQ_HAL_WbcVpZmeOutFrameOrField(HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn)
{
    HI_BOOL bOutFmt = 0;
    /***
      WBC_VP回写数据的格式：本质上是根据HD接口和SD接口之间是否需要帧率转换来决定回写格式：
      (1) 如果HD帧率<SD帧率(如: HD输出1080P24，SD输出NTSC制式), 则WBC_VP回写帧数据;
          (以保证SD输出图像不会出现回退或上下抖动)
      (2) Else, WBC_VP回写场数据. 此种情况需要注意, HD输出60hz, 而SD输出NTSC(59.94hz)的情况,
          HD每隔16s比SD播放快一次, SD丢弃数据时要保证一次丢弃两场, 否则会出现极性反转的情况从而导致图像上下抖动;

      注意: HD-4KP30, SD-NTSC; HD-4KP25, SD-PAL; HD-1080P24, SD-NTSC; 需要V3按帧读数据, Vdp做场的重复适配接口输出;
      ***/
    if (HI_TRUE == pstZmeIn->bForceWbcFieldMode) /* 强制回写场 */
    {
        bOutFmt = 0; /* Frame format for zme output: 0-field; 1-frame */
    }
    else if (g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_HD1].u32RefreshRate !=  g_stPqStatus.stTimingInfo[HI_PQ_DISPLAY_SD0].u32RefreshRate)
    {
        bOutFmt = 1;
    }
    else
    {
        bOutFmt = 0;
    }

    return bOutFmt;
}

static HI_PQ_ZME_BIND_POSITION_E PQ_HAL_WbcVpZmePosition(HI_VOID)
{
    if (HI_FALSE == g_stPqStatus.bIsogenyMode) /* 非同源 */
    {
        return HI_PQ_ZME_BIND_V3;
    }

    return HI_PQ_ZME_BIND_WBC;
}

static HI_PQ_PREZME_HOR_MUL_E PQ_HAL_WbcVpHScalerConfig(HI_U32 u32InWidth)
{
    return HI_PQ_PREZME_HOR_DISABLE;
}

static HI_BOOL PQ_HAL_WbcVpZmeP2IConfig(HI_BOOL bWbcAPointProgressive, HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    return HI_FALSE;
}

static HI_VOID PQ_HAL_WbcVpZmeResolutionRatioCalc(HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn, HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    HI_ZME_FORMAT_E enWbcInPixFmt = HI_PQ_ALG_PIX_FORMAT_SP422;

    HI_U32  u32InWidth       = 0;
    HI_U32  u32InHeight      = 0;
    HI_U32  u32OutWidth      = 0;
    HI_U32  u32OutHeight     = 0;

    //1 输入输出分辨率现在按照VO决策完的标清通路分辨率，跟以前不同
    /* wbc vp reso need to redesign */
    if (HI_PQ_WBC_VP_POINT_V0 == pstZmeOut->enVpPoint)
    {
        u32InWidth   = sg_stV0ZmeInRect.s32Width;
        u32InHeight  = sg_stV0ZmeInRect.s32Height;

        u32OutWidth  = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmWOut; /* V3 FrmWOut */
        u32OutHeight = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHOut; /* V3 FrmHOut */

        if (HI_PQ_ALG_PIX_FORMAT_SP444 == pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].enZmeInFmt) /* pix format: 0-422; 1-420; 2-444 */
        {
            enWbcInPixFmt = HI_PQ_ALG_PIX_FORMAT_SP422;
        }
        else
        {
            enWbcInPixFmt = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].enZmeInFmt;
        }
    }
    else if (HI_PQ_WBC_VP_POINT_VP == pstZmeOut->enVpPoint)
    {
        /* 当绑定在VP上, 配给缩放的宽高应该是接口的宽高, 不是层的宽高; 否则PIP、预览无法回写全屏;
           Remark: 窗口宽高等于V0上实际宽高, 制式宽高等于VP上的宽高 */
        u32InWidth       = sg_stV0ZmeOutRect.s32Width;
        u32InHeight      = sg_stV0ZmeOutRect.s32Height;

        u32OutWidth  = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmWOut; /* V3 FrmWOut */
        u32OutHeight = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHOut; /* V3 FrmHOut */

        enWbcInPixFmt    = HI_PQ_ALG_PIX_FORMAT_SP422;
    }

    /* Scaler Info Calc */
    pstZmeOut->stZmeFmt.u32InHeight  = u32InHeight;
    pstZmeOut->stZmeFmt.u32InWidth   = u32InWidth; /* can not divide 2 */
    pstZmeOut->stZmeFmt.u32OutWidth  = u32OutWidth;
    pstZmeOut->stZmeFmt.u32OutHeight = u32OutHeight;

    pstZmeOut->stZmeFmt.enZmeInFmt     = enWbcInPixFmt;
    pstZmeOut->stZmeFmt.enZmeOutFmt    = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].enZmeInFmt;//HI_PQ_ALG_PIX_FORMAT_SP422; /* 0-422; 1-420; 2-444; write back must be 422 */

    return;
}

static HI_VOID PQ_HAL_WbcVpZmeModeConfig(HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    /* config zme mode; when frame resolution does not have change, can not open fir mode; e.g: (480i-->480i) or (576i --> 576i); other must open fir mode; */
    pstZmeOut->stZmeFmt.bZmeFirHL = (pstZmeOut->stZmeFmt.u32OutWidth  == pstZmeOut->stZmeFmt.u32InWidth)  ? HI_FALSE : HI_TRUE;
    pstZmeOut->stZmeFmt.bZmeFirVL = (pstZmeOut->stZmeFmt.u32OutHeight == pstZmeOut->stZmeFmt.u32InHeight) ? HI_FALSE : HI_TRUE;
    /* in format may be 420(write back from v0) or must be 422(write back from vp0), out format must be 422; when 420 -> 422; vertical need up-sampling, but horizontal does not need */
    pstZmeOut->stZmeFmt.bZmeFirHC = (HI_FALSE == pstZmeOut->stZmeFmt.bZmeFirHL) ? HI_FALSE : HI_TRUE;
    pstZmeOut->stZmeFmt.bZmeFirVC = (HI_FALSE == pstZmeOut->stZmeFmt.bZmeFirVL) ?
                                    ((pstZmeOut->stZmeFmt.enZmeOutFmt == pstZmeOut->stZmeFmt.enZmeInFmt) ? HI_FALSE : HI_TRUE) : HI_TRUE;

    pstZmeOut->stZmeFmt.bZmeMedH  = HI_FALSE; /* zme Median filter enable of horizontal: 0-off; 1-on*/
    pstZmeOut->stZmeFmt.bZmeMedV  = HI_FALSE;

    if ((HI_TRUE == pstZmeOut->stZmeFmt.bZmeFirHL) || (HI_TRUE == pstZmeOut->stZmeFmt.bZmeFirHC))
    {
        pstZmeOut->stZmeFmt.bZmeHorEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt.bZmeHorEnable = HI_FALSE;
    }

    if ((HI_TRUE == pstZmeOut->stZmeFmt.bZmeFirVL) || (HI_TRUE == pstZmeOut->stZmeFmt.bZmeFirVC))
    {
        pstZmeOut->stZmeFmt.bZmeVerEnable = HI_TRUE;
    }
    else
    {
        pstZmeOut->stZmeFmt.bZmeVerEnable = HI_FALSE;
    }

    return;
}

HI_S32 PQ_HAL_GetV0ZmeStrategy (HI_PQ_LAYER_STRATEGY_IN_S *pstZmeIn, HI_PQ_LAYER_STRATEGY_OUT_S *pstZmeOut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeOut);

    sg_stProcVdpZmeReso.stVdpInReso.s32Width   = (HI_S32)pstZmeIn->u32FrmWIn;
    sg_stProcVdpZmeReso.stVdpInReso.s32Height  = (HI_S32)pstZmeIn->u32FrmHIn;
    sg_stProcVdpZmeReso.stVdpOutreso.s32Width  = (HI_S32)pstZmeIn->u32FrmWOut;
    sg_stProcVdpZmeReso.stVdpOutreso.s32Height = (HI_S32)pstZmeIn->u32FrmHOut;

    if (HI_FALSE == pstZmeIn->bFreezeEn)
    {
        PQ_HAL_V0NormVresoConfig(pstZmeIn, pstZmeOut);
        PQ_HAL_V0NormHresoConfig(pstZmeIn, pstZmeOut);
        PQ_HAL_SetV0ZmeFirFmt(pstZmeIn, pstZmeOut);
    }
    else
    {
        PQ_HAL_V0FreezeVresoConfig(pstZmeIn, pstZmeOut);
        PQ_HAL_V0FreezeHresoConfig(pstZmeIn, pstZmeOut);
        PQ_HAL_SetV0FreezeZmeFirFmt(pstZmeIn, pstZmeOut);
    }
    PQ_HAL_SetV0Zme_Offset_CoefAddr(pstZmeIn, pstZmeOut);

    sg_stV0ZmeInRect.s32Width = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth;
    sg_stV0ZmeInRect.s32Height = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight;
    sg_stV0ZmeOutRect.s32Width = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth;
    sg_stV0ZmeOutRect.s32Height = pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight;

    sg_bV0ReadFmtIn   = pstZmeOut->bReadFmtIn;
    sg_enV0PreHScaler = pstZmeOut->eHScalerMode;
    sg_enV0PreVScaler = pstZmeOut->eVScalerMode;

    sg_stProcVdpZmeReso.stVdpZme1Inreso.s32Width   = (HI_S32)pstZmeOut->stHZmeCfg.u32InWidth;
    sg_stProcVdpZmeReso.stVdpZme1Inreso.s32Height  = (HI_S32)pstZmeOut->stHZmeCfg.u32InHeight;
    sg_stProcVdpZmeReso.stVdpZme1Outreso.s32Width  = (HI_S32)pstZmeOut->stHZmeCfg.u32OutWidth;
    sg_stProcVdpZmeReso.stVdpZme1Outreso.s32Height = (HI_S32)pstZmeOut->stHZmeCfg.u32OutHeight;

    sg_stProcVdpZmeReso.stVdpZme2Inreso.s32Width   = (HI_S32)pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InWidth;
    sg_stProcVdpZmeReso.stVdpZme2Inreso.s32Height  = (HI_S32)pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32InHeight;
    sg_stProcVdpZmeReso.stVdpZme2Outreso.s32Width  = (HI_S32)pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutWidth;
    sg_stProcVdpZmeReso.stVdpZme2Outreso.s32Height = (HI_S32)pstZmeOut->stZmeFmt[HI_PQ_V0_ZME_NODE_ZME1].u32OutHeight;

    if (pstZmeOut->stHZmeCfg.bZmeHorEnable)
    {
        pq_hal_SetV0HpzmeZmeOffset(pstZmeIn, pstZmeOut);
    }

    /* fir en adjust by special control */
    PQ_HAL_AdjustZmeFirEnCfg(pstZmeIn, pstZmeOut);

    return HI_SUCCESS;
}

static HI_S32 PQ_HAL_GetProcWbcVpStrategy (HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn, HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].u32PointSel = (HI_PQ_WBC_VP_POINT_VP == pstZmeOut->enVpPoint) ? 0 : 1;
    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].bP2iEn      = pstZmeOut->bOpenP2I;

    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].stZme1Inreso.s32Width   = (HI_S32)pstZmeOut->stZmeFmt.u32InWidth;
    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].stZme1Inreso.s32Height  = (HI_S32)pstZmeOut->stZmeFmt.u32InHeight;
    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].stZme1Outreso.s32Width  = (HI_S32)pstZmeOut->stZmeFmt.u32OutWidth;
    sg_stGetProcWbcStrategy[HI_PQ_PROC_WBC_LAYER_VP].stZme1Outreso.s32Height = (HI_S32)pstZmeOut->stZmeFmt.u32OutHeight;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetWbcVpZmeStrategy (HI_PQ_WBC_STRATEGY_IN_S *pstZmeIn, HI_PQ_WBC_VP_STRATEGY_OUT_S *pstZmeOut)
{
    HI_BOOL bWbcAPointProgressive = HI_TRUE; /* Wbc A point frame format: 0-field; 1-frame */

    PQ_CHECK_NULL_PTR_RE_FAIL(pstZmeOut);

    pstZmeOut->enVpPoint = PQ_HAL_WbcVpWriteBackPointConfig(pstZmeIn);

    /* 计算WBC层的输入输出宽、高、帧/场 */
    PQ_HAL_WbcVpZmeResolutionRatioCalc(pstZmeIn, pstZmeOut);

    bWbcAPointProgressive    = pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].bZmeFrmFmtIn;
    pstZmeOut->bReadFmtIn    = bWbcAPointProgressive; /* Frame format for zme Intput: 0-field; 1-frame */
    pstZmeOut->stZmeFmt.bOutFmt = PQ_HAL_WbcVpZmeOutFrameOrField(pstZmeIn);

    pstZmeOut->eZmePosition  = PQ_HAL_WbcVpZmePosition();

    pstZmeOut->bOpenP2I      = PQ_HAL_WbcVpZmeP2IConfig(bWbcAPointProgressive, pstZmeOut);
    pstZmeOut->eHScalerMode  = PQ_HAL_WbcVpHScalerConfig(pstZmeOut->stZmeFmt.u32InWidth);

    /* e.g.: 576i -> 576p -> 576i(Hdmi), 576i(Cvbs); Write back from V0, V0 read field, A point is interlace */
    pstZmeOut->stZmeFmt.bInFmt  = (HI_TRUE == pstZmeOut->bOpenP2I) ? 0 : bWbcAPointProgressive;

    PQ_HAL_WbcVpZmeModeConfig(pstZmeOut);

    pq_hal_SetWbcVpZmeOffset(pstZmeIn, pstZmeOut);

    PQ_HAL_WbcVpZmeDefaultConfig(pstZmeOut);

    PQ_HAL_GetProcWbcVpStrategy(pstZmeIn, pstZmeOut);

    pqprint(PQ_PRN_ZME, "wbc zme point %d;hor en:%d; ver en:%d; infmt:%d; outfmt:%d;eninfmt:%d; enoutfmt:%d;hl:%d; hc:%d;vl:%d; vc:%d\n",
            pstZmeOut->enVpPoint,
            pstZmeOut->stZmeFmt.bZmeHorEnable, pstZmeOut->stZmeFmt.bZmeVerEnable,
            pstZmeOut->stZmeFmt.bInFmt, pstZmeOut->stZmeFmt.bOutFmt,
            pstZmeOut->stZmeFmt.enZmeInFmt, pstZmeOut->stZmeFmt.enZmeOutFmt,
            pstZmeOut->stZmeFmt.bZmeFirHL, pstZmeOut->stZmeFmt.bZmeFirHC, pstZmeOut->stZmeFmt.bZmeFirVL, pstZmeOut->stZmeFmt.bZmeFirVC);
    pqprint(PQ_PRN_ZME, "V0 WIn:%d, HIn:%d, WOut:%d, HOut:%d\t",
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmWIn,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHIn,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmWOut,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V0].u32FrmHOut);
    pqprint(PQ_PRN_ZME, "V3 WIn:%d, HIn:%d, WOut:%d, HOut:%d\n",
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmWIn,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHIn,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmWOut,
            pstZmeIn->stLayerInfo[HI_PQ_WBC_LAYER_STRATEGY_V3].u32FrmHOut);
    pqprint(PQ_PRN_ZME, "wbc out:%d, HIn:%d, WOut:%d, HOut:%d\n", pstZmeOut->stZmeFmt.u32InWidth, pstZmeOut->stZmeFmt.u32InHeight,
            pstZmeOut->stZmeFmt.u32OutWidth, pstZmeOut->stZmeFmt.u32OutHeight);

    return HI_SUCCESS;
}


HI_S32 PQ_HAL_SetProcVdpZmeStrategy(HI_PQ_PROC_VDPZME_STRATEGY_S stProcVdpZmeStrategy)
{
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(stProcVdpZmeStrategy.enProcVdpZmeNum, HI_PQ_PROC_ZME_NUM_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(stProcVdpZmeStrategy.enProcVdpWidthDrawMode, HI_PQ_PROC_PREZME_HOR_BUTT);
    PQ_CHECK_NUM_OVER_RANGE_RE_FAIL(stProcVdpZmeStrategy.enProcVdpHeightDrawMode, HI_PQ_PROC_PREZME_VER_BUTT);

    /* hpzme do not support set by proc */
    sg_stSetPqProcVdpZmeStrategy.enProcVdpZmeNum         = stProcVdpZmeStrategy.enProcVdpZmeNum;
    sg_stSetPqProcVdpZmeStrategy.enProcVdpWidthDrawMode   = stProcVdpZmeStrategy.enProcVdpWidthDrawMode;
    sg_stSetPqProcVdpZmeStrategy.enProcVdpHeightDrawMode  = stProcVdpZmeStrategy.enProcVdpHeightDrawMode;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetProcVdpZmeStrategy(HI_PQ_PROC_VDPZME_STRATEGY_S *pstProcVdpZmeStrategy)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeStrategy);

    PQ_SAFE_MEMCPY(pstProcVdpZmeStrategy, &sg_stGetPqProcVdpZmeStrategy, sizeof(sg_stGetPqProcVdpZmeStrategy));

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetProcVdpZmeReso(HI_PQ_PROC_VDPZME_RESO_S *pstProcVdpZmeReso)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeReso);

    PQ_SAFE_MEMCPY(pstProcVdpZmeReso, &sg_stProcVdpZmeReso, sizeof(sg_stProcVdpZmeReso));

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetProcWbcStrategy(HI_PQ_PROC_WBC_LAYER_E enProcWbcLayer, HI_PQ_PROC_WBC_STRATEGY_S *pstProcWbcStrategy)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcWbcStrategy);

    PQ_SAFE_MEMCPY(pstProcWbcStrategy, &sg_stGetProcWbcStrategy[enProcWbcLayer], sizeof(HI_PQ_PROC_WBC_STRATEGY_S));

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetZmeVidCoefToolSel(HI_PQ_ZME_VID_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);
    //1  TODO 这里需要增加对入参的数组下标的check

    memcpy(&(sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stVidSel), pstSel, sizeof(HI_PQ_ZME_VID_COEF_SEL_S));

    memcpy(&(g_stZmeCoefSel.stVidSel), pstSel, sizeof(HI_PQ_ZME_VID_COEF_SEL_S));

    return s32Ret;
}

HI_S32 PQ_HAL_GetZmeVidCoefToolSel(HI_PQ_ZME_VID_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);
    //1  TODO 这里需要增加对入参的数组下标的check

    memcpy(pstSel, &(g_stZmeCoefSel.stVidSel), sizeof(HI_PQ_ZME_VID_COEF_SEL_S));

    return s32Ret;
}

HI_S32 PQ_HAL_SetZmeWBCCoefToolSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);
    //1  TODO 这里需要增加对入参的数组下标的check

    memcpy(&(sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stWbcSel), pstSel, sizeof(HI_PQ_ZME_WBC_COEF_SEL_S));

    memcpy(&(g_stZmeCoefSel.stWbcSel), pstSel, sizeof(HI_PQ_ZME_WBC_COEF_SEL_S));

    return s32Ret;
}

HI_S32 PQ_HAL_GetZmeWBCCoefToolSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstSel)
{
    HI_S32 s32Ret = HI_SUCCESS;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstSel);
    //1  TODO 这里需要增加对入参的数组下标的check

    memcpy(pstSel, &(g_stZmeCoefSel.stWbcSel), sizeof(HI_PQ_ZME_WBC_COEF_SEL_S));

    return s32Ret;
}


HI_VOID PQ_HAL_InitVdpZmeVidCoefSel(PQ_PARAM_S *pstPqParam, HI_BOOL bDefault)
{
    HI_S32 s32BinSum = 0, s32BinSum1 = 0;
    HI_U32 i = 0;
    PQ_CHECK_NULL_PTR_RE_NULL(pstPqParam);

    sg_pstPqParamZmeVid = pstPqParam;

    memset(&g_stZmeCoefSel, 0, sizeof(g_stZmeCoefSel));

    /* step 1 : check pq bin data : all zero means no effective para from bin */
    /* check pq bin data */
    for (i = 0; i < 7; i++)
    {
        s32BinSum += sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stVidSel.u32HLSel[i]
                     + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stVidSel.u32HCSel[i]
                     + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stVidSel.u32VLSel[i]
                     + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stVidSel.u32VCSel[i];
    }

    /* step 2 : para use from bin or code */
    /*
        1.use bin para : if bin para not all zero
        2.use code para : if bin para all zero or no bin exist
    */
    if ((HI_TRUE != bDefault) && (0 != s32BinSum))
    {
        memcpy(&(g_stZmeCoefSel.stVidSel), &(pstPqParam->stPQCoef.stZmeCoefSel.stVidSel), sizeof(HI_PQ_ZME_VID_COEF_SEL_S));
    }

    /* step 1 : check pq bin data : all zero means no effective para from bin */
    /* check pq bin data */
    for (i = 0; i < 7; i++)
    {
        s32BinSum1 += sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stWbcSel.u32HLSel[i]
                      + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stWbcSel.u32HCSel[i]
                      + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stWbcSel.u32VLSel[i]
                      + sg_pstPqParamZmeVid->stPQCoef.stZmeCoefSel.stWbcSel.u32VCSel[i];
    }

    /* step 2 : para use from bin or code */
    /*
        1.use bin para : if bin para not all zero
        2.use code para : if bin para all zero or no bin exist
    */
    if ((HI_TRUE != bDefault) && (0 != s32BinSum1))
    {
        memcpy(&(g_stZmeCoefSel.stWbcSel), &(pstPqParam->stPQCoef.stZmeCoefSel.stWbcSel), sizeof(HI_PQ_ZME_WBC_COEF_SEL_S));
    }

    return ;
}


HI_S32 PQ_HAL_SetProcVdpZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S stProcVdpZmeVidCoefSel)
{
    sg_stSetPqProcVdpZmeVidCoefSel = stProcVdpZmeVidCoefSel;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetProcVdpZmeVidCoefSel(HI_PQ_ZME_VID_COEF_SEL_S *pstProcVdpZmeVidCoefSel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeVidCoefSel);

    PQ_SAFE_MEMCPY(pstProcVdpZmeVidCoefSel, &sg_stSetPqProcVdpZmeVidCoefSel, sizeof(HI_PQ_ZME_VID_COEF_SEL_S));

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetProcVdpZmeWbcCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S stProcVdpZmeWbcCoefSel)
{
    sg_stGetPqProcVdpZmeWbcCoefSel = stProcVdpZmeWbcCoefSel;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetProcVdpZmeWbcCoefSel(HI_PQ_ZME_WBC_COEF_SEL_S *pstProcVdpZmeWbcCoefSel)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstProcVdpZmeWbcCoefSel);

    PQ_SAFE_MEMCPY(pstProcVdpZmeWbcCoefSel, &sg_stGetPqProcVdpZmeWbcCoefSel, sizeof(sg_stGetPqProcVdpZmeWbcCoefSel));

    return HI_SUCCESS;
}

