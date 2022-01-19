/******************************************************************************

  Copyright (C), 2016-2016, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hdmi_hal_phy.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2016/07/23
  Description   :
  History       :
  Date          : 2016/07/23
  Author        : sdk
  Modification  :
*******************************************************************************/
#include "hdmi_hal_phy.h"
#include "hdmi_reg_dphy.h"
#include "hdmi_product_define.h"
#include "hdmi_reg_tx.h"

#define PHY_NULL_CHK(p) \
do{\
    if(HI_NULL == p) {\
        HDMI_ERR("%s is null pointer!return fail.\n",#p);\
        return HI_FAILURE;}\
}while(0)

#define PHY_NULL_CHK_NO_RET(p) \
do{\
    if(HI_NULL == p) {\
        HDMI_ERR("%s is null pointer!return fail.\n",#p);}\
}while(0)

#define PHY_RET_CHK(ret) \
do{\
    if(HI_FAILURE == ret) {\
        HDMI_ERR("Line: %d ret is failure\n", __LINE__);\
        return HI_FAILURE;}\
}while(0)

#define PHY_INIT_CHK do{\
    if(HI_TRUE != s_stHDMIPhyInfo.bInit)\
    {HDMI_ERR("phy intf module didn't init!return fail.\n");\
    return HI_FAILURE;}\
}while(0)

#define PHY_ARRAY_SIZEOF(a)  (sizeof(a)/sizeof(a[0]))

#define PHY_LOOP_DIV_CFG_25      0x640000    /* 25 x 4 = 100 = 0x64 */
#define PHY_LOOP_DIV_CFG_22      0x5a0000    /* 22 x 4 = 90  = 0x5a */

#define PHY_HWSPEC_I_MAX         43
#define PHY_RATIO_1_10           0x1f        /* 10bit/2 = 5bit = 0x1f */
#define PHY_RATIO_1_10_MASK      ((PHY_RATIO_1_10<<20)|(PHY_RATIO_1_10<<10)|PHY_RATIO_1_10)
#define PHY_RATIO_1_40_MASK      0xfffff     /* 40bit/2 = 20bit= 0xfffff */
#define PHY_TXPLL_TEST_OFF       0
#define PHY_TXPLL_TEST_ON        0x30000
#define PHY_POWER_ON_MASK_CLK    0xe
#define PHY_POWER_ON_MASK_D0     0xd
#define PHY_POWER_ON_MASK_D1     0xb
#define PHY_POWER_ON_MASK_D2     0x7
#define PHY_POWER_OFF            0xf
#define PHY_POWER_ON             0
#define PHY_POWER_LDO_OFF        0x3
#define PHY_OE_OFF               0xf
#define PHY_OE_ON                0
#define PHY_I_CHARGE_PUMP        0x3
#define PHY_PLL_LOOP_DEVIDER     0x20

#define PHY_FEEDTHRU_EN_MASK     (0x1<<2)

/******************************************************************************/
/* Data structure                                                             */
/******************************************************************************/
typedef enum
{
    PHY_CLK_RATIO_1_10 = 0x0,
    PHY_CLK_RATIO_1_40
}PHY_CLK_RATIO_E;

typedef enum
{
    INTERPOLATION_MODE_1X = 0x0,
    INTERPOLATION_MODE_2X = 0x1,
    INTERPOLATION_MODE_4X = 0x2,
    INTERPOLATION_MODE_8X = 0x3,
    INTERPOLATION_MODE_BUTT

} PHY_DIV_MODE_E;

typedef struct
{
    PHY_RTERM_MODE_E    enRTermMode;
    HI_U32              u32ModeDataClk;
    HI_U32              u32ModeDataD0;
    HI_U32              u32ModeDataD1;
    HI_U32              u32ModeDataD2;
} PHY_RTERM_MODE_DATA_E;

typedef struct
{
    HI_U32   u32PhyGcLdoPd;
    HI_U32   u32PhyGcDePd;
    HI_BOOL  bPhyGcBistPd;
    HI_BOOL  bPhyGcTxpllPd;
    HI_BOOL  bPhyGcRxsensePd;

} PHY_POWER_CFG_S;

typedef struct
{
    HI_U32              u32ClkMin;
    HI_U32              u32ClkMax;
}PHY_CLK_RANGE_S;

typedef struct
{
    PHY_CLK_RANGE_S     stPhyTmdsClkRange;
    PHY_HWSPEC_CFG_S    stPhyHWSpecCfg;
}PHY_HWSPEC_S;

typedef struct
{
    PHY_CLK_RANGE_S          stPhyTmdsClkRange;
    PHY_HWSPEC_ENHANCE_CFG_S stPhyHWEnhanceSpecCfg;
}PHY_HWSPEC_ENHANCE_S;

typedef struct
{
    PHY_CLK_RANGE_S     stPhyTmdsClkRange;
    PHY_SSC_CFG_S       stPhySscCfg;
}PHY_SSC_S;

typedef struct
{
    PHY_CLK_RANGE_S     stPixClkRange;
    HDMI_DEEP_COLOR_E   enDeepColor;
    HI_U32              u32PixelClkDiv;
    /* CRG */
    HI_U32              u32SscBypDiv;
    HI_U32              u32TmdsNxdiv;
    /* PHY */
    //HI_U32              u32InputDiv;
    HI_U32              u32LoopDiv;
    PHY_CLK_RATIO_E     enClkRatio;
    PHY_DIV_MODE_E      enPhyDivMode;

}PHY_DIV_CFG_S;

/******************************************************************************/
/* Private value                                                              */
/******************************************************************************/
#ifndef HDMI_FPGA_SUPPORT
#if defined(CHIP_TYPE_hi3716mv430)
#ifdef HDMI_PHY_DIFF_MODE
/* diff mode */
static PHY_HWSPEC_ENHANCE_S s_stPhyHWSpecTab[] =
{
/****|-TmdsclkRange---||DeIMain/0.25mA||-iMain/0.5mA--||-----------FeedThruCapEn-------------||---------------------------------------------------FeedThruCap delay----------------------------------------------||------------------------RTerm----------------------------------------------------------------------------------------------|**
*****|   Min  Max     ||clk d0  d1  d2||clk d0  d1  d2||  clk        d0        d1        d2  ||             clk                         d0                            d1                               d2        ||  clk_rterm_mode    clk_rterm    d0_rterm_mode   d0_rterm    d1_rterm_mode    d1_rterm     clk_rterm_mode  d2_rterm VCM-sel|*/
/**** double + diff mode */
    {{ 25000, 100000}, { 0,  0,  0,  0, 22, 23, 23, 23, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, 0x51}},
    {{100001, 165000}, { 0,  2,  2,  2, 22, 23, 23, 23, HI_FALSE,  HI_TRUE,  HI_TRUE,  HI_TRUE, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, 0x51}},
    {{165001, 340000}, { 0,  3,  3,  3, 22, 26, 26, 26, HI_FALSE,  HI_TRUE,  HI_TRUE,  HI_TRUE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x30, PHY_RTERM_MODE_LOAD, 0x30, PHY_RTERM_MODE_LOAD, 0x30, 0x51}},
    {{340001, 600000}, { 0,  2,  2,  2, 22, 37, 37, 37, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x80, PHY_RTERM_MODE_LOAD, 0x80, PHY_RTERM_MODE_LOAD, 0x80, 0x51}},
};

#else
/* diff + double mode */
static PHY_HWSPEC_ENHANCE_S s_stPhyHWSpecTab[] =
{
/****|-TmdsclkRange---||DeIMain/0.25mA||-iMain/0.5mA--||-----------FeedThruCapEn-------------||---------------------------------------------------FeedThruCap delay----------------------------------------------||------------------------RTerm----------------------------------------------------------------------------------------------|**
*****|   Min  Max     ||clk d0  d1  d2||clk d0  d1  d2||  clk        d0        d1        d2  ||             clk                         d0                            d1                               d2        ||  clk_rterm_mode    clk_rterm    d0_rterm_mode   d0_rterm    d1_rterm_mode    d1_rterm     clk_rterm_mode  d2_rterm VCM-sel|*/
/**** double + diff mode */
    {{ 25000, 100000}, { 0,  0,  0,  0, 22, 28, 28, 28, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_SRC_LD, 0x20, PHY_RTERM_MODE_SRC_LD, 0x20, PHY_RTERM_MODE_SRC_LD, 0x20, 0x51}},
    {{100001, 165000}, { 0,  3,  3,  3, 22, 29, 29, 29, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_SRC_LD, 0x20, PHY_RTERM_MODE_SRC_LD, 0x20, PHY_RTERM_MODE_SRC_LD, 0x20, 0x51}},
    {{165001, 340000}, { 0,  2,  2,  2, 22, 29, 29, 29, HI_FALSE,  HI_TRUE,  HI_TRUE,  HI_TRUE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_SRC_LD, 0x10, PHY_RTERM_MODE_SRC_LD, 0x10, PHY_RTERM_MODE_SRC_LD, 0x10, 0x51}},
    {{340001, 600000}, { 0,  2,  2,  2, 22, 37, 37, 37, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD  , 0x80, PHY_RTERM_MODE_LOAD  , 0x80, PHY_RTERM_MODE_LOAD  , 0x80, 0x51}},
};
#endif
#else
static PHY_HWSPEC_ENHANCE_S s_stPhyHWSpecTab[] =
{
/****|-TmdsclkRange---||DeIMain/0.25mA||-iMain/0.5mA--||-----------FeedThruCapEn-------------||---------------------------------------------------FeedThruCap delay----------------------------------------------||------------------------RTerm----------------------------------------------------------------------------------------------|**
*****|   Min  Max     ||clk d0  d1  d2||clk d0  d1  d2||  clk        d0        d1        d2  ||             clk                         d0                            d1                               d2        ||  clk_rterm_mode    clk_rterm    d0_rterm_mode   d0_rterm    d1_rterm_mode    d1_rterm     clk_rterm_mode  d2_rterm VCM-sel|*/
/**** double + diff mode */
    {{ 25000, 100000}, { 0,  0,  0,  0, 22, 23, 23, 23, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, 0x51}},
    {{100001, 165000}, { 0,  2,  2,  2, 22, 23, 23, 23, HI_FALSE,  HI_TRUE,  HI_TRUE,  HI_TRUE, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_FEEDTHRU_CAP_DELAY_18PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, PHY_RTERM_MODE_LOAD, 0x20, 0x51}},
    {{165001, 340000}, { 0,  3,  3,  3, 22, 26, 26, 26, HI_FALSE,  HI_TRUE,  HI_TRUE,  HI_TRUE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x30, PHY_RTERM_MODE_LOAD, 0x30, PHY_RTERM_MODE_LOAD, 0x30, 0x51}},
    {{340001, 600000}, { 0,  2,  2,  2, 22, 37, 37, 37, HI_FALSE, HI_FALSE, HI_FALSE, HI_FALSE, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_FEEDTHRU_CAP_DELAY_35PS, PHY_RTERM_MODE_LOAD  , 0x60, PHY_RTERM_MODE_LOAD, 0x80, PHY_RTERM_MODE_LOAD, 0x80, PHY_RTERM_MODE_LOAD, 0x80, 0x51}},
};
#endif

#if defined(CHIP_TYPE_hi3716mv430)
static PHY_SSC_S s_stPhySscCfgTab[] =
{
    {{ 25000,  70000}, {  0,     0}},  //0ppm
    {{ 70001,  90000}, {150, 45000}},  //0.35%=3500ppm
    {{ 90001, 110000}, { 70, 45000}},  //0.27%
    {{110001, 145000}, { 50, 45000}},  //0.22%
    {{145001, 180000}, {100, 45000}},  //0.15%
    {{180001, 220000}, { 40, 45000}},  //0.11%
    {{220001, 250000}, { 40, 45000}},  //0.095%
    {{250001, 300000}, { 40, 45000}},  //0.04%
    {{300001, 600000}, {  0,     0}},  //0
};
#else
static PHY_SSC_S s_stPhySscCfgTab[] =
{
    {{ 25000,  70000}, {  0,     0}},  //0ppm
    {{ 70001,  90000}, {330, 45000}},  //0.33%=3300ppm
    {{ 90001, 110000}, {250, 45000}},  //0.25%
    {{110001, 145000}, {200, 45000}},  //0.20%
    {{145001, 180000}, {120, 45000}},  //0.12%
    {{180001, 220000}, {100, 45000}},  //0.10%
    {{220001, 250000}, { 80, 45000}},  //0.8%
    {{250001, 300000}, { 40, 45000}},  //0.4%
    {{300001, 600000}, {  0,     0}},  //0
};
#endif

static PHY_RTERM_MODE_DATA_E s_stPhyRTermModeDataTab[] =
{
/***********R Term mode     clk    d0    d1    d2*****/
    {PHY_RTERM_MODE_SINGLE, 0x03, 0x0c, 0x30, 0xc0},
    {PHY_RTERM_MODE_SOURCE, 0x02, 0x08, 0x20, 0x80},
    {PHY_RTERM_MODE_LOAD  , 0x01, 0x04, 0x10, 0x40},
    {PHY_RTERM_MODE_SRC_LD, 0x00, 0x00, 0x00, 0x00},
};

static PHY_DIV_CFG_S s_stPhyDivCfgTab[] =
{
/**    pixel-range       deepcolor          pixDiv BypDiv TmdsNxDiv     loopdiv               clkRatio             phyDivMode**/
    {{ 25000,  50000}, HDMI_DEEP_COLOR_24BIT,   16,    10,      8,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_8X},
    {{ 50001, 100000}, HDMI_DEEP_COLOR_24BIT,    8,    10,      4,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_4X},
    {{100001, 200000}, HDMI_DEEP_COLOR_24BIT,    4,    10,      2,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_2X},
    {{200001, 340000}, HDMI_DEEP_COLOR_24BIT,    2,    10,      1,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_1X},
    {{340001, 600000}, HDMI_DEEP_COLOR_24BIT,    1,     5,      1,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_40, INTERPOLATION_MODE_1X},

    {{ 25001,  50000}, HDMI_DEEP_COLOR_30BIT,   16,     8,      8,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_8X},
    {{ 50001, 100000}, HDMI_DEEP_COLOR_30BIT,    8,     8,      4,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_4X},
    {{100001, 200000}, HDMI_DEEP_COLOR_30BIT,    4,     8,      2,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_2X},
    {{200001, 272000}, HDMI_DEEP_COLOR_30BIT,    2,     8,      1,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_1X},
    {{272001, 340000}, HDMI_DEEP_COLOR_30BIT,    2,     8,      1,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_40, INTERPOLATION_MODE_1X},
    {{340001, 600000}, HDMI_DEEP_COLOR_30BIT,    1,     8,      1,   PHY_LOOP_DIV_CFG_25   ,  PHY_CLK_RATIO_1_40, INTERPOLATION_MODE_1X},

    {{ 25001,  50000}, HDMI_DEEP_COLOR_36BIT,   16,     6,      8,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_8X},
    {{ 50001, 100000}, HDMI_DEEP_COLOR_36BIT,    8,     6,      4,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_4X},
    {{100001, 200000}, HDMI_DEEP_COLOR_36BIT,    4,     6,      2,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_2X},
    {{200001, 227000}, HDMI_DEEP_COLOR_36BIT,    2,     6,      1,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_10, INTERPOLATION_MODE_1X},
    {{227001, 340000}, HDMI_DEEP_COLOR_36BIT,    2,     6,      1,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_40, INTERPOLATION_MODE_1X},
    {{340001, 600000}, HDMI_DEEP_COLOR_36BIT,    1,     3,      1,   PHY_LOOP_DIV_CFG_22   ,  PHY_CLK_RATIO_1_40, INTERPOLATION_MODE_1X},
};

static HDMI_PHY_INFO_S s_stHDMIPhyInfo;

/******************************************************************************/
/* Private interface                                                          */
/******************************************************************************/
static HI_U32 PhyTransferCur2Hex(HI_U32 u32Cur)
{
    HI_U32  u32Current = 0;

    if(u32Cur < 16)
    {
        u32Current = u32Cur;
    }
    else if(u32Cur < 28)
    {
        u32Current = (u32Cur + 0x04);
    }
    else if(u32Cur < 32)
    {
        u32Current = (u32Cur + 0x10);
    }
    else if(u32Cur <= PHY_HWSPEC_I_MAX)
    {
        u32Current = (u32Cur + 0x14);
    }
    else
    {
        HDMI_ERR("%d is exceed Max value %d.\n", u32Cur, PHY_HWSPEC_I_MAX);
        u32Current = 0;
    }

    return u32Current;
}

static PHY_HWSPEC_ENHANCE_CFG_S *PhyHWEnhanceSpecDataGet(HI_U32 u32TmdsClk)
{
    HI_U32               i = 0;
    PHY_HWSPEC_ENHANCE_S *pstPhyHWEnhanceSpec = HI_NULL;
    HI_U32               u32ArraySize = 0;

    pstPhyHWEnhanceSpec = &s_stPhyHWSpecTab[0];
    u32ArraySize        = PHY_ARRAY_SIZEOF(s_stPhyHWSpecTab);

    for( ;(pstPhyHWEnhanceSpec && (i<u32ArraySize));pstPhyHWEnhanceSpec++, i++)
    {
        if( (u32TmdsClk >= pstPhyHWEnhanceSpec->stPhyTmdsClkRange.u32ClkMin) \
            && (u32TmdsClk <= pstPhyHWEnhanceSpec->stPhyTmdsClkRange.u32ClkMax) )
        {
            return (&pstPhyHWEnhanceSpec->stPhyHWEnhanceSpecCfg);
        }
    }

    return HI_NULL;
}

static PHY_SSC_CFG_S *PhySscDataGet(HI_U32 u32TmdsClk)
{
    HI_U32      i            = 0;
    PHY_SSC_S  *pstPhySsc    = HI_NULL;
    HI_U32      u32ArraySize = 0;

    pstPhySsc        = &s_stPhySscCfgTab[0];
    u32ArraySize     = PHY_ARRAY_SIZEOF(s_stPhySscCfgTab);

    for ( ; (pstPhySsc && (i<u32ArraySize)); pstPhySsc++, i++)
    {
        if( (u32TmdsClk >= pstPhySsc->stPhyTmdsClkRange.u32ClkMin) \
            && (u32TmdsClk <= pstPhySsc->stPhyTmdsClkRange.u32ClkMax) )
        {
            return (&pstPhySsc->stPhySscCfg);
        }
    }

    return HI_NULL;
}

static PHY_DIV_CFG_S *PhyDivCfgGet(HI_U32 u32PixClk, HDMI_DEEP_COLOR_E enDeepClr)
{
    HI_U32                  i = 0;
    PHY_DIV_CFG_S          *pstDivCfg = HI_NULL;

    for(pstDivCfg= &s_stPhyDivCfgTab[0];
        (pstDivCfg && (i<PHY_ARRAY_SIZEOF(s_stPhyDivCfgTab)));
        pstDivCfg++, i++)
    {
        if( (u32PixClk >= pstDivCfg->stPixClkRange.u32ClkMin) \
            && (u32PixClk <= pstDivCfg->stPixClkRange.u32ClkMax) \
            && (enDeepClr == pstDivCfg->enDeepColor) )
        {
            return pstDivCfg;
        }
    }

    HDMI_ERR("can't find param,u32TmdsClk:%u,enDeepClr=%u.\n", u32PixClk,enDeepClr);

    return &s_stPhyDivCfgTab[1];
}

static PHY_RTERM_MODE_DATA_E *PhyRTermModeDataGet(PHY_RTERM_MODE_E enRTermMode)
{
    HI_U32                  i = 0;
    PHY_RTERM_MODE_DATA_E   *pstPhyRTermModeCfg = HI_NULL;

    for(pstPhyRTermModeCfg= &s_stPhyRTermModeDataTab[0];
        (pstPhyRTermModeCfg && (i<PHY_ARRAY_SIZEOF(s_stPhyRTermModeDataTab)));
        pstPhyRTermModeCfg++, i++)
    {
        if(pstPhyRTermModeCfg->enRTermMode == enRTermMode)
        {
            return pstPhyRTermModeCfg;
        }
    }

    HDMI_ERR("can't find param,enRTermMode:%u.\n", enRTermMode);

    return &s_stPhyRTermModeDataTab[0];
}

static HI_VOID PhyClkRatioSet(PHY_CLK_RATIO_E enClkRatio)
{
    if (PHY_CLK_RATIO_1_40 == enClkRatio)
    {
        HDMI_HDMITX_AFIFO_ClkRatio_Set(0, PHY_RATIO_1_40_MASK);
    }
    else
    {
        HDMI_HDMITX_AFIFO_ClkRatio_Set(PHY_RATIO_1_10, PHY_RATIO_1_10_MASK);
    }

    return;
}

static HI_S32 PhyHWEnhanceSpecSet(PHY_HWSPEC_ENHANCE_CFG_S *pstHWSpecCfg)
{
    HI_U32 u32Tmp = 0;

    PHY_NULL_CHK(pstHWSpecCfg);

    HDMI_INFO("PHY HWSpec DeIMain     clk:%d, d0:%d, d1:%d, d2:%d\n", pstHWSpecCfg->u32IDeMainClk, pstHWSpecCfg->u32IDeMainD0, pstHWSpecCfg->u32IDeMainD1, pstHWSpecCfg->u32IDeMainD2);
    HDMI_INFO("PHY HWSpec iMain       clk:%d, d0:%d, d1:%d, d2:%d\n", pstHWSpecCfg->u32IMainClk, pstHWSpecCfg->u32IMainD0, pstHWSpecCfg->u32IMainD1, pstHWSpecCfg->u32IMainD2);
    HDMI_INFO("PHY HWSpec bFeedThruen clk:%d, d0:%d, d1:%d, d2:%d\n", pstHWSpecCfg->bFeedThruCapClkEn, pstHWSpecCfg->bFeedThruCapD0En, pstHWSpecCfg->bFeedThruCapD1En, pstHWSpecCfg->bFeedThruCapD2En);
    HDMI_INFO("PHY HWSpec enFeedThru  clk:%d, d0:%d, d1:%d, d2:%d\n", pstHWSpecCfg->enFeedThruCapDelayClk, pstHWSpecCfg->enFeedThruCapDelayD0, pstHWSpecCfg->enFeedThruCapDelayD1, pstHWSpecCfg->enFeedThruCapDelayD2);
    HDMI_INFO("PHY HWSpec RTermMode   clk:%d, d0:%d, d1:%d, d2:%d\n", pstHWSpecCfg->enRTermModeClk, pstHWSpecCfg->enRTermModeD0, pstHWSpecCfg->enRTermModeD1, pstHWSpecCfg->enRTermModeD2);
    HDMI_INFO("PHY HWSpec RTerm       clk:0x%x, d0:0x%x, d1:0x%x, d2:0x%x\n", pstHWSpecCfg->u32RTermClk, pstHWSpecCfg->u32RTermD0, pstHWSpecCfg->u32RTermD1, pstHWSpecCfg->u32RTermD2);

    /* de iMain*/
    HDMI_APHY_DRIVER_reg_isel_main_de_Set(PhyTransferCur2Hex(pstHWSpecCfg->u32IDeMainClk),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IDeMainD0),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IDeMainD1),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IDeMainD2));
    /* iMain */
    HDMI_APHY_DRIVER_IMAIN_reg_isel_mainSet(PhyTransferCur2Hex(pstHWSpecCfg->u32IMainClk),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IMainD0),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IMainD1),
                        PhyTransferCur2Hex(pstHWSpecCfg->u32IMainD2));
    /* Feed-Through Cap Delay contrl */
    u32Tmp = pstHWSpecCfg->enFeedThruCapDelayClk;
    u32Tmp = pstHWSpecCfg->bFeedThruCapClkEn ? (u32Tmp | PHY_FEEDTHRU_EN_MASK) : (u32Tmp & (~PHY_FEEDTHRU_EN_MASK));
    HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_clkSet(u32Tmp);
    u32Tmp = pstHWSpecCfg->enFeedThruCapDelayD0;
    u32Tmp = pstHWSpecCfg->bFeedThruCapD0En ? (u32Tmp | PHY_FEEDTHRU_EN_MASK) : (u32Tmp & (~PHY_FEEDTHRU_EN_MASK));
    HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d0Set(u32Tmp);
    u32Tmp = pstHWSpecCfg->enFeedThruCapDelayD1;
    u32Tmp = pstHWSpecCfg->bFeedThruCapD1En ? (u32Tmp | PHY_FEEDTHRU_EN_MASK) : (u32Tmp & (~PHY_FEEDTHRU_EN_MASK));
    HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d1Set(u32Tmp);
    u32Tmp = pstHWSpecCfg->enFeedThruCapDelayD2;
    u32Tmp = pstHWSpecCfg->bFeedThruCapD2En ? (u32Tmp | PHY_FEEDTHRU_EN_MASK) : (u32Tmp & (~PHY_FEEDTHRU_EN_MASK));
    HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d2Set(u32Tmp);
    /* R Term */
    HDMI_APHY_RTERM_CTRL_reg_rtSet(pstHWSpecCfg->u32RTermClk,
                        pstHWSpecCfg->u32RTermD0,
                        pstHWSpecCfg->u32RTermD1,
                        pstHWSpecCfg->u32RTermD2);
    u32Tmp  = PhyRTermModeDataGet(pstHWSpecCfg->enRTermModeClk)->u32ModeDataClk;
    u32Tmp |= PhyRTermModeDataGet(pstHWSpecCfg->enRTermModeD0)->u32ModeDataD0;
    u32Tmp |= PhyRTermModeDataGet(pstHWSpecCfg->enRTermModeD1)->u32ModeDataD1;
    u32Tmp |= PhyRTermModeDataGet(pstHWSpecCfg->enRTermModeD2)->u32ModeDataD2;
    HDMI_APHY_TOP_PD_reg_gc_pd_rtermSet(u32Tmp);
    /* VCM sel */
    HDMI_APHY_TEST_CTRL_reg_testSet(pstHWSpecCfg->u32VCMSel);

    return HI_SUCCESS;
}

#endif

/******************************************************************************/
/* Public interface                                                           */
/******************************************************************************/
HI_S32 HAL_HDMI_PhyInit(HI_VOID)
{
#ifndef HDMI_FPGA_SUPPORT
    if(!s_stHDMIPhyInfo.bInit)
    {
        HDMI_HDMITX_PHY_reg_Init();
        /* init */
        HDMI_APHY_TXPLL_CTRL_reg_txpll_icp_ictrlSet(PHY_I_CHARGE_PUMP);
        HDMI_APHY_TXPLL_CTRL_reg_txpll_divsel_loopSet(PHY_PLL_LOOP_DEVIDER);
        HDMI_HDMITX_INSSC_SET_reg_sscin_bypass_enSet(HI_TRUE);
        HDMI_HDMITX_INSSC_SET_reg_pllfbmash111_enSet(HI_TRUE);
        s_stHDMIPhyInfo.bInit = HI_TRUE;
    }
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyReset(HI_VOID)
{
#ifndef HDMI_FPGA_SUPPORT
    PHY_INIT_CHK;

    HAL_HDMI_PhyOeSet(HI_FALSE);
    HAL_HDMI_PhyPowerSet(HI_FALSE);
    DRV_HDMI_ProdCrgPhyResetSet(HI_TRUE);
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyDeInit(HI_VOID)
{
#ifndef HDMI_FPGA_SUPPORT
    PHY_INIT_CHK;
    HAL_HDMI_PhyReset();
    HDMI_HDMITX_PHY_reg_DeInit();
    s_stHDMIPhyInfo.bInit = HI_FALSE;
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyPowerGet(HI_BOOL *pbEnable)
{
#ifndef HDMI_FPGA_SUPPORT
    PHY_POWER_CFG_S stPhyPowerCfg;

    PHY_INIT_CHK;
    PHY_NULL_CHK(pbEnable);
    HDMI_MEMSET(&stPhyPowerCfg, 0, sizeof(PHY_POWER_CFG_S));

    stPhyPowerCfg.bPhyGcTxpllPd   = HDMI_APHY_TOP_PD_reg_gc_txpll_pdGet();
    stPhyPowerCfg.bPhyGcRxsensePd = HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseGet();
    stPhyPowerCfg.u32PhyGcLdoPd   = HDMI_APHY_TOP_PD_reg_gc_pd_ldoGet();
    stPhyPowerCfg.u32PhyGcDePd    = HDMI_APHY_TOP_PD_reg_gc_pd_deGet();
    stPhyPowerCfg.bPhyGcBistPd    = HDMI_APHY_TOP_PD_reg_gc_pd_bistGet();

    if (   (PHY_POWER_ON == stPhyPowerCfg.bPhyGcTxpllPd)
        && (HI_TRUE == stPhyPowerCfg.bPhyGcRxsensePd)
        && (PHY_POWER_ON == stPhyPowerCfg.u32PhyGcLdoPd)
        && stPhyPowerCfg.bPhyGcBistPd )
    {
        *pbEnable = HI_TRUE;
    }
    else if (    stPhyPowerCfg.bPhyGcTxpllPd
             && (HI_FALSE == stPhyPowerCfg.bPhyGcRxsensePd)
             && (PHY_POWER_LDO_OFF & stPhyPowerCfg.u32PhyGcLdoPd)
             && (PHY_POWER_OFF & stPhyPowerCfg.bPhyGcBistPd) )
    {
        *pbEnable = HI_FALSE;
    }
    else
    {
        HDMI_WARN("abnormal, please check!\n");
        *pbEnable = HI_FALSE;
    }
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyPowerSet(HI_BOOL bEnable)
{
#ifndef HDMI_FPGA_SUPPORT
    PHY_INIT_CHK;

    if(bEnable)
    {
        HDMI_APHY_TOP_PD_reg_gc_txpll_pdSet(PHY_POWER_ON);
        HDMI_APHY_TOP_PD_reg_gc_pd_ldoSet(PHY_POWER_ON);
        HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseSet(HI_TRUE);
        /* 0x64 bit19 and 0x80 bit31 should be set 1 for rxsense when phy power on */
        HDMI_APHY_TEST_CTRL_reg_test_dc_rxsenseSet(HI_TRUE);

    }
    else
    {
        HDMI_APHY_TOP_PD_reg_gc_txpll_pdSet(PHY_POWER_OFF);
        HDMI_APHY_TOP_PD_reg_gc_pd_ldoSet(PHY_POWER_OFF);
        HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseSet(HI_FALSE);
        HDMI_APHY_TEST_CTRL_reg_test_dc_rxsenseSet(HI_FALSE);
    }

    HDMI_APHY_TOP_PD_reg_gc_pd_bistSet(PHY_POWER_OFF);

    s_stHDMIPhyInfo.bPowerEnable  = bEnable;
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyOeSet(HI_BOOL bEnable)
{
#ifndef HDMI_FPGA_SUPPORT
    HI_U32 u32Oe = 0;
    HI_U32 u32DeIMainPower = PHY_POWER_OFF;

    PHY_INIT_CHK;

    u32Oe = bEnable ? PHY_OE_ON : PHY_OE_OFF;
    /* sdk: de-emphasis must be power down. */
    if (bEnable)
    {
        if(0 != HDMI_APHY_DRIVER_IMAIN_reg_isel_main_de_clkGet())
        {
            u32DeIMainPower &= PHY_POWER_ON_MASK_CLK;
        }
        if(0 != HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d0Get())
        {
            u32DeIMainPower &= PHY_POWER_ON_MASK_D0;
        }
        if(0 != HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d1Get())
        {
            u32DeIMainPower &= PHY_POWER_ON_MASK_D1;
        }
        if(0 != HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d2Get())
        {
            u32DeIMainPower &= PHY_POWER_ON_MASK_D2;
        }
    }

    HDMI_APHY_TOP_PD_reg_gc_pd_deSet(u32DeIMainPower);
    HDMI_APHY_TOP_PD_reg_gc_pdSet(u32Oe);

    s_stHDMIPhyInfo.bOeEnable     = bEnable;
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyOeGet(HI_BOOL *pbEnable)
{
#ifndef HDMI_FPGA_SUPPORT
    HI_BOOL bPhyReset = HI_FALSE;

    PHY_INIT_CHK;
    PHY_NULL_CHK(pbEnable);

    DRV_HDMI_ProdCrgPhyResetGet(&bPhyReset);
    if(!bPhyReset)
    {
        *pbEnable = (PHY_OE_ON == HDMI_APHY_TOP_PD_reg_gc_pdGet())? HI_TRUE: HI_FALSE;
    }
    else
    {
        *pbEnable = HI_FALSE;
    }
#endif

    return HI_SUCCESS;
}

//for video path & debug
HI_S32 HAL_HDMI_PhySpecSet(HDMI_PHY_HWSPEC_CFG_S * pstHdmiSpecCfg)
{
    HI_S32                   s32Ret                     = HI_SUCCESS;
#ifndef HDMI_FPGA_SUPPORT
    PHY_HWSPEC_ENHANCE_CFG_S *pstPhyHWEnhanceSpecCfgTmp = HI_NULL;

    PHY_INIT_CHK;
    PHY_NULL_CHK(pstHdmiSpecCfg);

    /* set HardWare Specification */
    pstPhyHWEnhanceSpecCfgTmp =  pstHdmiSpecCfg->stHDMIPhySpec.bHWSpecDebugEn ? \
                            &pstHdmiSpecCfg->stHDMIPhySpec.stPhyHWEnhanceSpecCfg: \
                            PhyHWEnhanceSpecDataGet(pstHdmiSpecCfg->u32TmdsClk);
    PHY_NULL_CHK(pstPhyHWEnhanceSpecCfgTmp);
    s32Ret = PhyHWEnhanceSpecSet(pstPhyHWEnhanceSpecCfgTmp);
#endif

    return s32Ret;
}

//for video path
HI_S32 HAL_HDMI_PhyTmdsSet(HDMI_PHY_TMDS_CFG_S *pstHdmiTmdsCfg)
{
    HI_S32                  s32Ret           = HI_SUCCESS;
#ifndef HDMI_FPGA_SUPPORT
    HI_U32                  u32LogicVersion  = 0;

    PHY_DIV_CFG_S          *pstDivCfg        = HI_NULL;
    HDMI_DEEP_COLOR_E       enDpColor        = HDMI_DEEP_COLOR_BUTT;
    HDMI_CRG_CFG_S          stHDMICrgCfg     = {0};
    HDMI_PHY_SSC_CFG_S      stHdmiSscCfg     = {0};
    HDMI_PHY_HWSPEC_CFG_S   stHdmiHWSpecCfg  = {0};

    PHY_INIT_CHK;
    PHY_NULL_CHK(pstHdmiTmdsCfg);

    enDpColor   = pstHdmiTmdsCfg->enDeepColor;
    if(HDMI_DEEP_COLOR_OFF == enDpColor)
    {
        enDpColor = HDMI_DEEP_COLOR_24BIT;
    }

    /* get config para */
    pstDivCfg = PhyDivCfgGet(pstHdmiTmdsCfg->u32PixelClk, enDpColor);
    PHY_NULL_CHK(pstDivCfg);

    HAL_HDMI_PhyPowerSet(HI_TRUE);

    /* set phy div mode */
    HDMI_APHY_TOP_PD_reg_divselSet(pstDivCfg->enPhyDivMode);

    /* set crg div */
    stHDMICrgCfg.u32SscBypassDiv = pstDivCfg->u32SscBypDiv;
    stHDMICrgCfg.u32TmdsClkDiv   = pstDivCfg->u32TmdsNxdiv;
    DRV_HDMI_ProdCrgDivSet(&stHDMICrgCfg);

    u32LogicVersion = DRV_HDMI_ProdChipGet();
    /* phy soft reset */
    if (HDMI_CHIP_HI3716MV430 == u32LogicVersion)
    {
        HDMI_HDMITX_DPHY_RST_reg_dphy_srst_reqSet(HI_TRUE);
    }
    /* sdk: must delay 500us after CRG register config finished. */
    msleep(1);
    /* set clk ratio */
    PhyClkRatioSet(pstDivCfg->enClkRatio);

    /* set loopdiv */
    HDMI_HDMITX_FBSSC_SET_reg_set_fbSet(pstDivCfg->u32LoopDiv);

    /* Spread Spectrum ctrl(ssc) */
    stHdmiSscCfg.u32PixClk                  = pstHdmiTmdsCfg->u32PixelClk;
    stHdmiSscCfg.u32TmdsClk                 = pstHdmiTmdsCfg->u32TmdsClk;
    stHdmiSscCfg.enDeepColor                = enDpColor;
    stHdmiSscCfg.stHDMIPhySsc.bSscEnable    = pstHdmiTmdsCfg->bEmiEnable;
    stHdmiSscCfg.stHDMIPhySsc.bSscDebugEn   = HI_FALSE;
    HAL_HDMI_PhySscSet(&stHdmiSscCfg);

    /* set HardWare Specification */
    stHdmiHWSpecCfg.u32TmdsClk                   = pstHdmiTmdsCfg->u32TmdsClk;
    stHdmiHWSpecCfg.stHDMIPhySpec.bHWSpecDebugEn = HI_FALSE;
    HAL_HDMI_PhySpecSet(&stHdmiHWSpecCfg);

#endif

    return s32Ret;
}

//for video path & debug
HI_S32 HAL_HDMI_PhySscSet(HDMI_PHY_SSC_CFG_S * pstHdmiSscCfg)
{
#ifndef HDMI_FPGA_SUPPORT
    HI_U32                  u32PhyRefClk = 0;
    HI_U32                  u32SpanFb    = 0;
    HI_U32                  u32StepFb    = 0;
    HI_U32                  u32Tmp       = 0;
    HDMI_DEEP_COLOR_E       enDpColor    = HDMI_DEEP_COLOR_BUTT;
    PHY_SSC_CFG_S           *pstPhySscCfgTmp = HI_NULL;
    PHY_DIV_CFG_S           *pstDivCfg       = HI_NULL;

    PHY_INIT_CHK;
    PHY_NULL_CHK(pstHdmiSscCfg);

    enDpColor   = pstHdmiSscCfg->enDeepColor;
    if(HDMI_DEEP_COLOR_OFF == enDpColor)
    {
        enDpColor = HDMI_DEEP_COLOR_24BIT;
    }

    /* get config para */
    pstDivCfg = PhyDivCfgGet(pstHdmiSscCfg->u32PixClk, enDpColor);
    PHY_NULL_CHK(pstDivCfg);

    /* Spread Spectrum ctrl(ssc) */
    if(pstHdmiSscCfg->stHDMIPhySsc.bSscEnable)
    {
        pstPhySscCfgTmp = pstHdmiSscCfg->stHDMIPhySsc.bSscDebugEn ? \
                            &pstHdmiSscCfg->stHDMIPhySsc.stPhySscCfg : \
                            PhySscDataGet(pstHdmiSscCfg->u32TmdsClk);
        PHY_NULL_CHK(pstPhySscCfgTmp);

        if( (0 == pstDivCfg->u32SscBypDiv)
            || (0 == pstPhySscCfgTmp->u32SscFreq) )
        {
            u32SpanFb = 0;
            u32StepFb = 0;
        }
        else
        {
            /****************************************************
            /RefClk Calculation
            /                         pixelclk(Hz) * Pixclkdiv
            /       Reference Clock = ----------------
            /                          SscBypassDiv
            ***************************************************/
            u32PhyRefClk  = pstHdmiSscCfg->u32PixClk * pstDivCfg->u32PixelClkDiv * 1000;
            u32PhyRefClk /= pstDivCfg->u32SscBypDiv;

            /***************************************************
            /   Span Fb calculation
            /                            Ref Clock
            /           Span        = -------------------
            /                          SscFreqence x 4
            ***************************************************/
            u32SpanFb    = (u32PhyRefClk / pstPhySscCfgTmp->u32SscFreq) / 4;
            /*********************************************************************
            /   Step Fb calculation
            /                             SscAmptd x LoopDiv
            /                          ----------------------- x SscFreqcence
            /                                    10000
            /           Step        = ------------------------------------------
            /                                      Ref clock / 4
            ********************************************************************/
            u32Tmp       = (pstDivCfg->u32LoopDiv / 100 ) * pstPhySscCfgTmp->u32SscAmptd;
            u32Tmp       = u32Tmp * (pstPhySscCfgTmp->u32SscFreq / 1000);
            u32StepFb    = u32PhyRefClk ? (u32Tmp  / (u32PhyRefClk/4) ) : 0 ;
        }

        HDMI_INFO("ssc info || LoopDiv:0x%x, RefClk:%d.\n",pstDivCfg->u32LoopDiv,u32PhyRefClk);
        HDMI_INFO("         || Amptd:%d, Freq:%d, Span:0x%x, Step:0x%x.\n",pstPhySscCfgTmp->u32SscAmptd,pstPhySscCfgTmp->u32SscFreq,u32SpanFb,u32StepFb);

        /* Step 1 */
        HDMI_HDMITX_FBSSC_STEP_reg_step_span_fbSet(u32StepFb, u32SpanFb);
        /* Step 2 */
        HDMI_HDMITX_FBSSC_SET_reg_ssc_mode_fbSet(HI_TRUE);
        /* Step 3 */
        HDMI_HDMITX_FBSSC_SET_reg_set_load_fb();
        /* Step 4 */
        HDMI_APHY_TXPLL_TEST_reg_txpll_testSet(PHY_TXPLL_TEST_ON);
        /* Step 5 */
        HDMI_APHY_TXPLL_CTRL_reg_gc_txpll_en_sscdivSet(HI_TRUE);
    }
    else
    {
        /* Step 1 */
        HDMI_HDMITX_FBSSC_STEP_reg_step_span_fbSet(0, 0);

        /* 12bit need to enter decimal mode */
        if(HDMI_DEEP_COLOR_36BIT == pstDivCfg->enDeepColor)
        {
            /* Step 2 */
            HDMI_HDMITX_FBSSC_SET_reg_ssc_mode_fbSet(HI_TRUE);
            /* Step 3 */
            HDMI_HDMITX_FBSSC_SET_reg_set_load_fb();
            /* Step 4 */
            HDMI_APHY_TXPLL_TEST_reg_txpll_testSet(PHY_TXPLL_TEST_ON);
            /* Step 5 */
            HDMI_APHY_TXPLL_CTRL_reg_gc_txpll_en_sscdivSet(HI_TRUE);
        }
        else
        {
            HDMI_APHY_TXPLL_CTRL_reg_gc_txpll_en_sscdivSet(HI_FALSE);
            HDMI_APHY_TXPLL_TEST_reg_txpll_testSet(PHY_TXPLL_TEST_OFF);
            HDMI_HDMITX_FBSSC_SET_reg_ssc_mode_fbSet(HI_FALSE);
        }
    }

    /* status info set */
    HDMI_MEMCPY(&s_stHDMIPhyInfo.stSscCfg, &pstHdmiSscCfg->stHDMIPhySsc, sizeof(HDMI_PHY_SSC_S));

#endif
    return HI_SUCCESS;

}

HI_S32 HAL_HDMI_PhySscGet(HI_BOOL * pbEnable)
{
#ifndef HDMI_FPGA_SUPPORT
    HI_U32                  u32SpanFb        = 0;
    HI_U32                  u32StepFb        = 0;
    HI_BOOL                 bHWSscEnable     = HI_FALSE;

    PHY_NULL_CHK(pbEnable);

    u32SpanFb    = HDMI_HDMITX_FBSSC_STEP_reg_step_fbGet();
    u32StepFb    = HDMI_HDMITX_FBSSC_STEP_reg_span_fbGet();
    bHWSscEnable = ((0 == u32SpanFb) && (0 == u32StepFb)) ? HI_FALSE : HI_TRUE;

    *pbEnable = bHWSscEnable;
#endif

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_PhyInfoGet(HDMI_PHY_INFO_S *pstPhyStatus)
{
#ifndef HDMI_FPGA_SUPPORT
    HDMI_MEMCPY(pstPhyStatus, &s_stHDMIPhyInfo, sizeof(HDMI_PHY_INFO_S));
#endif

    return HI_SUCCESS;
}


