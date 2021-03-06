// ******************************************************************************
// Copyright     :  Copyright (C) 2016, Hisilicon Technologies Co. Ltd.
// File name     :  hdmi2tx_dphy_reg_c_union_define.c
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  sdk
// Version       :  1
// Date          :  2013/3/10
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  xxx 2016/01/06 21:08:30 Create file
// ******************************************************************************

#include "hi_type.h"
#include "hdmi_reg_dphy.h"
#include "hdmi_product_define.h"
#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif

/* Define the struct pointor of the module hdmi2tx_dphy_reg */
volatile S_hdmi2tx_dphy_reg_REGS_TYPE *gophdmi2tx_dphy_regAllReg = NULL;

HI_S32 HDMI_HDMITX_PHY_reg_Init(HI_VOID)
{
    if (NULL != gophdmi2tx_dphy_regAllReg)
    {
        return HI_SUCCESS;
    }

    gophdmi2tx_dphy_regAllReg  = (S_hdmi2tx_dphy_reg_REGS_TYPE*)HDMI_IO_MAP(BASE_ADDR_tx_dphy, 4);

    if(NULL == gophdmi2tx_dphy_regAllReg)
    {
        HDMI_ERR("ioremap_nocache gophdmi2tx_dphy_regAllReg failed!!!!!!!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 HDMI_HDMITX_PHY_reg_DeInit(HI_VOID)
{
    if(HI_NULL != gophdmi2tx_dphy_regAllReg)
    {
        HDMI_IO_UNMAP(gophdmi2tx_dphy_regAllReg);
        gophdmi2tx_dphy_regAllReg = HI_NULL;
    }

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_INSSC_SET_reg_sscin_bypass_enSet
//  Description : Set the value of the member HDMITX_INSSC_SET.reg_sscin_bypass_en
//  Input       : HI_U32 ureg_sscin_bypass_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_INSSC_SET_reg_sscin_bypass_enSet(HI_U32 ureg_sscin_bypass_en)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_INSSC_SET o_hdmitx_inssc_set;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_INSSC_SET.u32);

    o_hdmitx_inssc_set.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_inssc_set.bits.reg_sscin_bypass_en = ureg_sscin_bypass_en;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_inssc_set.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_INSSC_SET_reg_pllfbmash111_enSet
//  Description : Set the value of the member HDMITX_INSSC_SET.reg_pllfbmash111_en
//  Input       : HI_U32 ureg_pllfbmash111_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_INSSC_SET_reg_pllfbmash111_enSet(HI_U32 ureg_pllfbmash111_en)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_INSSC_SET o_hdmitx_inssc_set;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_INSSC_SET.u32);
    o_hdmitx_inssc_set.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_inssc_set.bits.reg_pllfbmash111_en = ureg_pllfbmash111_en;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_inssc_set.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMITX_DPHY_RST_reg_dphy_srst_reqSet
//  Description : Set the value of the member HDMITX_DPHY_RST.reg_dphy_srst_req
//  Input       : HI_U32 ureg_dphy_srst_req: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_DPHY_RST_reg_dphy_srst_reqSet(HI_BOOL bReset)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_DPHY_RST o_hdmitx_dphy_rst;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_DPHY_RST.u32);
    o_hdmitx_dphy_rst.u32 = HDMI_RegRead(pu32RegAddr);

    o_hdmitx_dphy_rst.bits.reg_dphy_srst_req = bReset;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_dphy_rst.u32);
    o_hdmitx_dphy_rst.bits.reg_dphy_srst_req = !bReset;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_dphy_rst.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_AFIFO_DATA_SEL_reg_aphy_data_clk_hSet
//  Description : Set the value of the member HDMITX_AFIFO_DATA_SEL.reg_aphy_data_clk_h
//  Input       : HI_U32 ureg_aphy_data_clk_h: 10 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_AFIFO_ClkRatio_Set(HI_U32 u32RatioH, HI_U32 u32RatioL)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_AFIFO_CLK o_hdmitx_afifo_clk;
    U_HDMITX_AFIFO_DATA_SEL o_hdmitx_afifo_data_sel;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_AFIFO_DATA_SEL.u32);
    o_hdmitx_afifo_data_sel.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_afifo_data_sel.bits.reg_aphy_data_clk_h = u32RatioH;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_afifo_data_sel.u32);

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_AFIFO_CLK.u32);
    o_hdmitx_afifo_clk.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_afifo_clk.bits.reg_aphy_data_clk_l = u32RatioL;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_afifo_clk.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_divselSet
//  Description : Set the value of the member APHY_TOP_PD.reg_divsel
//  Input       : HI_U32 ureg_divsel: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_divselSet(HI_U32 ureg_divsel)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_divsel = ureg_divsel;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_txpll_pdSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_txpll_pd
//  Input       : HI_U32 ureg_gc_txpll_pd: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_txpll_pdSet(HI_U32 ureg_gc_txpll_pd)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_txpll_pd = ureg_gc_txpll_pd;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_Power_Set
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_txpll_pd
//  Input       : HI_U32 ureg_gc_txpll_pd: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_Power_Set(HI_U32 uPowerOnOff)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_txpll_pd   = uPowerOnOff;
    o_aphy_top_pd.bits.reg_gc_pd_rxsense = uPowerOnOff;
    o_aphy_top_pd.bits.reg_gc_pd_ldo     = uPowerOnOff;
    o_aphy_top_pd.bits.reg_gc_pd_bist    = 0x1; // power off
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_txpll_pdGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_txpll_pd
//  Input       : HI_U32 ureg_gc_txpll_pd: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_txpll_pdGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_txpll_pd;
}


//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_rxsense
//  Input       : HI_U32 ureg_gc_pd_rxsense: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseSet(HI_U32 ureg_gc_pd_rxsense)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd_rxsense = ureg_gc_pd_rxsense;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_rxsense
//  Input       : HI_U32 ureg_gc_pd_rxsense: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_rxsenseGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_pd_rxsense;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_rtermSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_rterm
//  Input       : HI_U32 ureg_gc_pd_rterm: 8 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_rtermSet(HI_U32 ureg_gc_pd_rterm)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd_rterm = ureg_gc_pd_rterm;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);


    return HI_SUCCESS;
}


//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_ldoSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_ldo
//  Input       : HI_U32 ureg_gc_pd_ldo: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_ldoSet(HI_U32 ureg_gc_pd_ldo)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd_ldo = ureg_gc_pd_ldo;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_ldoGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_ldo
//  Input       : HI_U32 ureg_gc_pd_ldo: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_ldoGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_pd_ldo;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_deSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_de
//  Input       : HI_U32 ureg_gc_pd_de: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_deSet(HI_U32 ureg_gc_pd_de)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd_de = ureg_gc_pd_de;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_deGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_de
//  Input       : HI_U32 ureg_gc_pd_de: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_deGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_pd_de;
}


//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_bistSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_bist
//  Input       : HI_U32 ureg_gc_pd_bist: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_bistSet(HI_U32 ureg_gc_pd_bist)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd_bist = ureg_gc_pd_bist;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pd_bistGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd_bist
//  Input       : HI_U32 ureg_gc_pd_bist: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pd_bistGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_pd_bist;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pdSet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd
//  Input       : HI_U32 ureg_gc_pd: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pdSet(HI_U32 ureg_gc_pd)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TOP_PD o_aphy_top_pd;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32);
    o_aphy_top_pd.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_top_pd.bits.reg_gc_pd = ureg_gc_pd;
    HDMI_RegWrite(pu32RegAddr, o_aphy_top_pd.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TOP_PD_reg_gc_pdGet
//  Description : Set the value of the member APHY_TOP_PD.reg_gc_pd
//  Input       : HI_U32 ureg_gc_pd: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TOP_PD_reg_gc_pdGet(HI_VOID)
{
    U_APHY_TOP_PD o_aphy_top_pd;

    o_aphy_top_pd.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TOP_PD.u32));
    return o_aphy_top_pd.bits.reg_gc_pd;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IMAIN_reg_isel_main_de_clkSet
//  Description : Set the value of the member APHY_DRIVER_IMAIN.reg_isel_main_de_clk
//  Input       : HI_U32 ureg_isel_main_de_clk: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_reg_isel_main_de_Set(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_IMAIN o_aphy_driver_imain;
    U_APHY_DRIVER_IPRE o_aphy_driver_ipre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IMAIN.u32);
    o_aphy_driver_imain.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_imain.bits.reg_isel_main_de_clk = clk;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_imain.u32);

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPRE.u32);
    o_aphy_driver_ipre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_ipre.bits.reg_isel_main_de_d0 = d0;
    o_aphy_driver_ipre.bits.reg_isel_main_de_d1 = d1;
    o_aphy_driver_ipre.bits.reg_isel_main_de_d2 = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_ipre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IMAIN_reg_isel_main_clkSet
//  Description : Set the value of the member APHY_DRIVER_IMAIN.reg_isel_main_clk
//  Input       : HI_U32 ureg_isel_main_clk: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IMAIN_reg_isel_mainSet(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_IMAIN o_aphy_driver_imain;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IMAIN.u32);
    o_aphy_driver_imain.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_imain.bits.reg_isel_main_clk = clk;
    o_aphy_driver_imain.bits.reg_isel_main_d0  = d0;
    o_aphy_driver_imain.bits.reg_isel_main_d1  = d1;
    o_aphy_driver_imain.bits.reg_isel_main_d2  = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_imain.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IPRE_reg_isel_pre_clkSet
//  Description : Set the value of the member APHY_DRIVER_IPRE.reg_isel_pre_clk
//  Input       : HI_U32 ureg_isel_pre_clk: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IPRE_reg_isel_preSet(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_IPRE o_aphy_driver_ipre;
    U_APHY_DRIVER_IPREDE o_aphy_driver_iprede;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPRE.u32);
    o_aphy_driver_ipre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_ipre.bits.reg_isel_pre_clk = clk;
    o_aphy_driver_ipre.bits.reg_isel_pre_d0  = d0;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_ipre.u32);

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPREDE.u32);
    o_aphy_driver_iprede.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_iprede.bits.reg_isel_pre_d1 = d1;
    o_aphy_driver_iprede.bits.reg_isel_pre_d2 = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_iprede.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IPREDE_reg_isel_pre_de_clkSet
//  Description : Set the value of the member APHY_DRIVER_IPREDE.reg_isel_pre_de_clk
//  Input       : HI_U32 ureg_isel_pre_de_clk: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IPREDE_reg_isel_pre_deSet(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_IPREDE o_aphy_driver_iprede;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPREDE.u32);
    o_aphy_driver_iprede.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_iprede.bits.reg_isel_pre_de_clk = clk;
    o_aphy_driver_iprede.bits.reg_isel_pre_de_d0  = d0;
    o_aphy_driver_iprede.bits.reg_isel_pre_de_d1  = d1;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_iprede.u32);

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_isel_pre_de_d2 = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_de_clkSet
//  Description : Set the value of the member APHY_DRIVER_RPRE.reg_rsel_pre_de_clk
//  Input       : HI_U32 ureg_rsel_pre_de_clk: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_deSet(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_rsel_pre_de_clk = clk;
    o_aphy_driver_rpre.bits.reg_rsel_pre_de_d0  = d0;
    o_aphy_driver_rpre.bits.reg_rsel_pre_de_d1  = d1;
    o_aphy_driver_rpre.bits.reg_rsel_pre_de_d2  = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d2Set
//  Description : Set the value of the member APHY_DRIVER_RPRE.reg_rsel_pre_d2
//  Input       : HI_U32 ureg_rsel_pre_d2: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d2Set(HI_U32 ureg_rsel_pre_d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_rsel_pre_d2 = ureg_rsel_pre_d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d1Set
//  Description : Set the value of the member APHY_DRIVER_RPRE.reg_rsel_pre_d1
//  Input       : HI_U32 ureg_rsel_pre_d1: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d1Set(HI_U32 ureg_rsel_pre_d1)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_rsel_pre_d1 = ureg_rsel_pre_d1;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d0Set
//  Description : Set the value of the member APHY_DRIVER_RPRE.reg_rsel_pre_d0
//  Input       : HI_U32 ureg_rsel_pre_d0: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_d0Set(HI_U32 ureg_rsel_pre_d0)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_rsel_pre_d0 = ureg_rsel_pre_d0;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_clkSet
//  Description : Set the value of the member APHY_DRIVER_RPRE.reg_rsel_pre_clk
//  Input       : HI_U32 ureg_rsel_pre_clk: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_RPRE_reg_rsel_pre_clkSet(HI_U32 ureg_rsel_pre_clk)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_DRIVER_RPRE o_aphy_driver_rpre;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_RPRE.u32);
    o_aphy_driver_rpre.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_driver_rpre.bits.reg_rsel_pre_clk = ureg_rsel_pre_clk;
    HDMI_RegWrite(pu32RegAddr, o_aphy_driver_rpre.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_RTERM_CTRL_reg_rt_clkSet
//  Description : Set the value of the member APHY_RTERM_CTRL.reg_rt_clk
//  Input       : HI_U32 ureg_rt_clk: 8 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_RTERM_CTRL_reg_rtSet(HI_U32 clk, HI_U32 d0, HI_U32 d1, HI_U32 d2)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_RTERM_CTRL o_aphy_rterm_ctrl;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_RTERM_CTRL.u32);
    o_aphy_rterm_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_rterm_ctrl.bits.reg_rt_clk = clk;
    o_aphy_rterm_ctrl.bits.reg_rt_d0  = d0;
    o_aphy_rterm_ctrl.bits.reg_rt_d1  = d1;
    o_aphy_rterm_ctrl.bits.reg_rt_d2  = d2;
    HDMI_RegWrite(pu32RegAddr, o_aphy_rterm_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TEST_CTRL_reg_test_dcSet
//  Description : Set the value of the member APHY_TEST_CTRL.reg_test_dc
//  Input       : HI_U32 ureg_test_dc: 15 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TEST_CTRL_reg_test_dcSet(HI_U32 ureg_test_dc)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TEST_CTRL o_aphy_test_ctrl;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TEST_CTRL.u32);
    o_aphy_test_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_test_ctrl.bits.reg_test_dc = ureg_test_dc;
    HDMI_RegWrite(pu32RegAddr, o_aphy_test_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TEST_CTRL_reg_test_dc_rxsenseSet
//  Description : Set the value of the member APHY_TEST_CTRL.reg_test_dc_rxsense
//  Input       : HI_U32 ureg_test_dc: 1 bit
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TEST_CTRL_reg_test_dc_rxsenseSet(HI_U32 ureg_test_dc_rxsense)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TEST_CTRL o_aphy_test_ctrl;
    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TEST_CTRL.u32);
    o_aphy_test_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_test_ctrl.bits.reg_test_dc_rxsense = ureg_test_dc_rxsense;
    HDMI_RegWrite(pu32RegAddr, o_aphy_test_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TEST_CTRL_reg_testSet
//  Description : Set the value of the member APHY_TEST_CTRL.reg_test
//  Input       : HI_U32 ureg_test: 16 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TEST_CTRL_reg_testSet(HI_U32 ureg_test)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TEST_CTRL o_aphy_test_ctrl;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TEST_CTRL.u32);
    o_aphy_test_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_test_ctrl.bits.reg_test = ureg_test;
    HDMI_RegWrite(pu32RegAddr, o_aphy_test_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TXPLL_CTRL_reg_gc_txpll_en_sscdivSet
//  Description : Set the value of the member APHY_TXPLL_CTRL.reg_gc_txpll_en_sscdiv
//  Input       : HI_U32 ureg_gc_txpll_en_sscdiv: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TXPLL_CTRL_reg_gc_txpll_en_sscdivSet(HI_U32 ureg_gc_txpll_en_sscdiv)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TXPLL_CTRL o_aphy_txpll_ctrl;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TXPLL_CTRL.u32);
    o_aphy_txpll_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_txpll_ctrl.bits.reg_gc_txpll_en_sscdiv = ureg_gc_txpll_en_sscdiv;
    HDMI_RegWrite(pu32RegAddr, o_aphy_txpll_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TXPLL_CTRL_reg_txpll_icp_ictrlSet
//  Description : Set the value of the member APHY_TXPLL_CTRL.reg_txpll_icp_ictrl
//  Input       : HI_U32 ureg_txpll_icp_ictrl: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TXPLL_CTRL_reg_txpll_icp_ictrlSet(HI_U32 ureg_txpll_icp_ictrl)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TXPLL_CTRL o_aphy_txpll_ctrl;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TXPLL_CTRL.u32);
    o_aphy_txpll_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_txpll_ctrl.bits.reg_txpll_icp_ictrl = ureg_txpll_icp_ictrl;
    HDMI_RegWrite(pu32RegAddr, o_aphy_txpll_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TXPLL_CTRL_reg_txpll_divsel_loopSet
//  Description : Set the value of the member APHY_TXPLL_CTRL.reg_txpll_divsel_loop
//  Input       : HI_U32 ureg_txpll_divsel_loop: 7 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TXPLL_CTRL_reg_txpll_divsel_loopSet(HI_U32 ureg_txpll_divsel_loop)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TXPLL_CTRL o_aphy_txpll_ctrl;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TXPLL_CTRL.u32);
    o_aphy_txpll_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_txpll_ctrl.bits.reg_txpll_divsel_loop = ureg_txpll_divsel_loop;
    HDMI_RegWrite(pu32RegAddr, o_aphy_txpll_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_APHY_TXPLL_TEST_reg_txpll_testSet
//  Description : Set the value of the member APHY_TXPLL_TEST.reg_txpll_test
//  Input       : HI_U32 ureg_txpll_test: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_TXPLL_TEST_reg_txpll_testSet(HI_U32 ureg_txpll_test)
{
    HI_U32 *pu32RegAddr = NULL;
    U_APHY_TXPLL_TEST o_aphy_txpll_test;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_TXPLL_TEST.u32);
    o_aphy_txpll_test.u32 = HDMI_RegRead(pu32RegAddr);
    o_aphy_txpll_test.bits.reg_txpll_test = ureg_txpll_test;
    HDMI_RegWrite(pu32RegAddr, o_aphy_txpll_test.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_SET_reg_ssc_mode_fbSet
//  Description : Set the value of the member HDMITX_FBSSC_SET.reg_ssc_mode_fb
//  Input       : HI_U32 ureg_ssc_mode_fb: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_SET_reg_ssc_mode_fbSet(HI_U32 ureg_ssc_mode_fb)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_FBSSC_SET o_hdmitx_fbssc_set;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_SET.u32);
    o_hdmitx_fbssc_set.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_fbssc_set.bits.reg_ssc_mode_fb = ureg_ssc_mode_fb;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_set.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_SET_reg_set_load_fbSet
//  Description : Set the value of the member HDMITX_FBSSC_SET.reg_set_load_fb
//  Input       : HI_U32 ureg_set_load_fb: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_SET_reg_set_load_fb(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_FBSSC_SET o_hdmitx_fbssc_set;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_SET.u32);
    o_hdmitx_fbssc_set.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_fbssc_set.bits.reg_set_load_fb = 0;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_set.u32);
    o_hdmitx_fbssc_set.bits.reg_set_load_fb = 0x1;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_set.u32);
    o_hdmitx_fbssc_set.bits.reg_set_load_fb = 0;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_set.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_SET_reg_set_fbSet
//  Description : Set the value of the member HDMITX_FBSSC_SET.reg_set_fb
//  Input       : HI_U32 ureg_set_fb: 24 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_SET_reg_set_fbSet(HI_U32 ureg_set_fb)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_FBSSC_SET o_hdmitx_fbssc_set;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_SET.u32);
    o_hdmitx_fbssc_set.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_fbssc_set.bits.reg_set_fb = ureg_set_fb;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_set.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_STEP_reg_span_fbGet
//  Description : Set the value of the member HDMITX_FBSSC_STEP.reg_span_fb
//  Input       : HI_U32 ureg_span_fb: 14 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_STEP_reg_span_fbGet(HI_VOID)
{
    U_HDMITX_FBSSC_STEP o_hdmitx_fbssc_step;

    o_hdmitx_fbssc_step.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_STEP.u32));
    return o_hdmitx_fbssc_step.bits.reg_span_fb;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_STEP_reg_step_fbSet
//  Description : Set the value of the member HDMITX_FBSSC_STEP.reg_step_fb
//  Input       : HI_U32 ureg_step_fb: 10 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_STEP_reg_step_span_fbSet(HI_U32 ureg_step_fb, HI_U32 ureg_span_fb)
{
    HI_U32 *pu32RegAddr = NULL;
    U_HDMITX_FBSSC_STEP o_hdmitx_fbssc_step;

    pu32RegAddr = (HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_STEP.u32);
    o_hdmitx_fbssc_step.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmitx_fbssc_step.bits.reg_step_fb = ureg_step_fb;
    o_hdmitx_fbssc_step.bits.reg_span_fb = ureg_span_fb;
    HDMI_RegWrite(pu32RegAddr, o_hdmitx_fbssc_step.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_HDMITX_FBSSC_STEP_reg_step_fbGet
//  Description : Set the value of the member HDMITX_FBSSC_STEP.reg_step_fb
//  Input       : HI_U32 ureg_step_fb: 10 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_HDMITX_FBSSC_STEP_reg_step_fbGet(HI_VOID)
{
    U_HDMITX_FBSSC_STEP o_hdmitx_fbssc_step;

    o_hdmitx_fbssc_step.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->HDMITX_FBSSC_STEP.u32));
    return o_hdmitx_fbssc_step.bits.reg_step_fb;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d2Get
//  Description : Set the value of the member APHY_DRIVER_IPRE.reg_isel_main_de_d2
//  Input       : HI_U32 ureg_isel_main_de_d2: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d2Get(HI_VOID)
{
    U_APHY_DRIVER_IPRE o_aphy_driver_ipre;

    o_aphy_driver_ipre.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPRE.u32));
    return o_aphy_driver_ipre.bits.reg_isel_main_de_d2;
}


//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d0Get
//  Description : Set the value of the member APHY_DRIVER_IPRE.reg_isel_main_de_d0
//  Input       : HI_U32 ureg_isel_main_de_d0: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d0Get(HI_VOID)
{
    U_APHY_DRIVER_IPRE o_aphy_driver_ipre;

    o_aphy_driver_ipre.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPRE.u32));
    return o_aphy_driver_ipre.bits.reg_isel_main_de_d0;
}

//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d1Get
//  Description : Set the value of the member APHY_DRIVER_IPRE.reg_isel_main_de_d1
//  Input       : HI_U32 ureg_isel_main_de_d1: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IPRE_reg_isel_main_de_d1Get(HI_VOID)
{
    U_APHY_DRIVER_IPRE o_aphy_driver_ipre;

    o_aphy_driver_ipre.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IPRE.u32));
    return o_aphy_driver_ipre.bits.reg_isel_main_de_d1;
}


//******************************************************************************
//  Function    : HDMI_APHY_DRIVER_IMAIN_reg_isel_main_de_clkGet
//  Description : Set the value of the member APHY_DRIVER_IMAIN.reg_isel_main_de_clk
//  Input       : HI_U32 ureg_isel_main_de_clk: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
HI_S32 HDMI_APHY_DRIVER_IMAIN_reg_isel_main_de_clkGet(HI_VOID)
{
    U_APHY_DRIVER_IMAIN o_aphy_driver_imain;

    o_aphy_driver_imain.u32 = HDMI_RegRead((HI_U32*)&(gophdmi2tx_dphy_regAllReg->APHY_DRIVER_IMAIN.u32));
    return o_aphy_driver_imain.bits.reg_isel_main_de_clk;
}

