// ****************************************************************************** 
// Copyright     :  Copyright (C) 2018, Hisilicon Technologies Co. Ltd.
// File name     :  hi_reg_crg.h
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  xxx
// Version       :  1.0
// Date          :  2013/3/10
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.1 
// History       :  xxx 2018/04/08 15:25:51 Create file
// ******************************************************************************

#ifndef __HI_REG_CRG_H__
#define __HI_REG_CRG_H__

/* Define the union U_PERI_CRG_PLL0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg0_apb      : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL0;

/* Define the union U_PERI_CRG_PLL1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg1_apb      : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL1;

/* Define the union U_PERI_CRG_PLL4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg0_apb      : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL4;

/* Define the union U_PERI_CRG_PLL5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg1_apb      : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL5;

/* Define the union U_PERI_CRG_PLL8 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL8;

/* Define the union U_PERI_CRG_PLL9 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL9;

/* Define the union U_PERI_CRG_PLL10 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL10;

/* Define the union U_PERI_CRG_PLL11 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL11;

/* Define the union U_PERI_CRG_PLL14 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL14;

/* Define the union U_PERI_CRG_PLL15 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL15;

/* Define the union U_PERI_CRG_PLL16 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_ctrl0            : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL16;

/* Define the union U_PERI_CRG_PLL17 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_ctrl1            : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL17;

/* Define the union U_PERI_CRG18 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_freq_sel_cfg_crg  : 3   ; /* [2..0]  */
        unsigned int    reserved_3            : 6   ; /* [8..3]  */
        unsigned int    cpu_begin_cfg_bypass  : 1   ; /* [9]  */
        unsigned int    cpu_sw_begin_cfg      : 1   ; /* [10]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    cpu_clk_pctrl         : 1   ; /* [12]  */
        unsigned int    reserved_1            : 2   ; /* [14..13]  */
        unsigned int    cpm_srst_req          : 1   ; /* [15]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG18;

/* Define the union U_PERI_CRG19 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    timeout_plllock       : 12  ; /* [11..0]  */
        unsigned int    lock_bypass           : 1   ; /* [12]  */
        unsigned int    pll_cfg_bypass        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG19;

/* Define the union U_PERI_CRG20 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    a7_pclkdbg_cken       : 1   ; /* [0]  */
        unsigned int    reserved_5            : 3   ; /* [3..1]  */
        unsigned int    arm_l2_srst_req       : 1   ; /* [4]  */
        unsigned int    reserved_4            : 3   ; /* [7..5]  */
        unsigned int    socdbg_srst_req       : 1   ; /* [8]  */
        unsigned int    cs_srst_req           : 1   ; /* [9]  */
        unsigned int    reserved_3            : 4   ; /* [13..10]  */
        unsigned int    arm_por_srst_req      : 2   ; /* [15..14]  */
        unsigned int    reserved_2            : 2   ; /* [17..16]  */
        unsigned int    arm_srst_req          : 2   ; /* [19..18]  */
        unsigned int    reserved_1            : 2   ; /* [21..20]  */
        unsigned int    cluster_dbg_srst_req  : 2   ; /* [23..22]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG20;

/* Define the union U_PERI_CRG21 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_1            : 8   ; /* [7..0]  */
        unsigned int    peri_clk_div          : 3   ; /* [10..8]  */
        unsigned int    reserved_0            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG21;

/* Define the union U_PERI_CRG22 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    core_bus_clk_sel      : 2   ; /* [1..0]  */
        unsigned int    reserved_1            : 3   ; /* [4..2]  */
        unsigned int    mde2_clk_sel          : 2   ; /* [6..5]  */
        unsigned int    reserved_0            : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG22;

/* Define the union U_PERI_CRG25 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_4            : 1   ; /* [0]  */
        unsigned int    hipack0_cken          : 1   ; /* [1]  */
        unsigned int    reserved_3            : 1   ; /* [2]  */
        unsigned int    ddrc_cken             : 1   ; /* [3]  */
        unsigned int    reserved_2            : 4   ; /* [7..4]  */
        unsigned int    hipack0_srst_req      : 1   ; /* [8]  */
        unsigned int    reserved_1            : 1   ; /* [9]  */
        unsigned int    ddrc_srst_req         : 1   ; /* [10]  */
        unsigned int    ddrt_srst_req         : 1   ; /* [11]  */
        unsigned int    ddrt_cken             : 1   ; /* [12]  */
        unsigned int    cfg_clk_cken          : 1   ; /* [13]  */
        unsigned int    aclk_ddr_cken         : 1   ; /* [14]  */
        unsigned int    reserved_0            : 17  ; /* [31..15]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG25;

/* Define the union U_PERI_CRG27 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    i2c_qam_cken          : 1   ; /* [0]  */
        unsigned int    i2c_qam_srst_req      : 1   ; /* [1]  */
        unsigned int    reserved_4            : 2   ; /* [3..2]  */
        unsigned int    i2c0_cken             : 1   ; /* [4]  */
        unsigned int    i2c0_srst_req         : 1   ; /* [5]  */
        unsigned int    reserved_3            : 2   ; /* [7..6]  */
        unsigned int    i2c1_cken             : 1   ; /* [8]  */
        unsigned int    i2c1_srst_req         : 1   ; /* [9]  */
        unsigned int    reserved_2            : 2   ; /* [11..10]  */
        unsigned int    i2c2_cken             : 1   ; /* [12]  */
        unsigned int    i2c2_srst_req         : 1   ; /* [13]  */
        unsigned int    reserved_1            : 2   ; /* [15..14]  */
        unsigned int    i2c_adc_cken          : 1   ; /* [16]  */
        unsigned int    i2c_adc_srst_req      : 1   ; /* [17]  */
        unsigned int    reserved_0            : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG27;

/* Define the union U_PERI_CRG29 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sci0_cken             : 1   ; /* [0]  */
        unsigned int    sci0_srst_req         : 1   ; /* [1]  */
        unsigned int    sci1_cken             : 1   ; /* [2]  */
        unsigned int    sci1_srst_req         : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG29;

/* Define the union U_PERI_CRG30 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_2            : 8   ; /* [7..0]  */
        unsigned int    vdh_clk_sel           : 2   ; /* [9..8]  */
        unsigned int    reserved_1            : 2   ; /* [11..10]  */
        unsigned int    vdhclk_skipcfg        : 5   ; /* [16..12]  */
        unsigned int    vdhclk_loaden         : 1   ; /* [17]  */
        unsigned int    reserved_0            : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG30;

/* Define the union U_PERI_CRG31 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    jpgd_cken             : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    jpgd_srst_req         : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG31;

/* Define the union U_PERI_CRG37 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    tde_cken              : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    tde_srst_req          : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG37;

/* Define the union U_PERI_CRG46 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_bus_cken         : 1   ; /* [0]  */
        unsigned int    usb2_ohci48m_cken     : 1   ; /* [1]  */
        unsigned int    usb2_ohci12m_cken     : 1   ; /* [2]  */
        unsigned int    reserved_4            : 1   ; /* [3]  */
        unsigned int    usb2_hst_phy_cken     : 1   ; /* [4]  */
        unsigned int    usb2_utmi0_cken       : 1   ; /* [5]  */
        unsigned int    usb2_utmi1_cken       : 1   ; /* [6]  */
        unsigned int    reserved_3            : 5   ; /* [11..7]  */
        unsigned int    usb2_bus_srst_req     : 1   ; /* [12]  */
        unsigned int    usb2_utmi0_srst_req   : 1   ; /* [13]  */
        unsigned int    usb2_utmi1_srst_req   : 1   ; /* [14]  */
        unsigned int    reserved_2            : 1   ; /* [15]  */
        unsigned int    usb2_hst_phy_srst_req : 1   ; /* [16]  */
        unsigned int    reserved_1            : 1   ; /* [17]  */
        unsigned int    usb2_free_clk_sel     : 1   ; /* [18]  */
        unsigned int    usb2_phy01_clk_sel    : 1   ; /* [19]  */
        unsigned int    reserved_0            : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG46;

/* Define the union U_PERI_CRG47 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_phy01_ref_cken   : 1   ; /* [0]  */
        unsigned int    reserved_4            : 3   ; /* [3..1]  */
        unsigned int    usb2_phy01_srst_req   : 1   ; /* [4]  */
        unsigned int    reserved_3            : 3   ; /* [7..5]  */
        unsigned int    usb2_phy0_srst_treq   : 1   ; /* [8]  */
        unsigned int    usb2_phy1_srst_treq   : 1   ; /* [9]  */
        unsigned int    reserved_2            : 2   ; /* [11..10]  */
        unsigned int    usb2_phy01_refclk_sel : 1   ; /* [12]  */
        unsigned int    reserved_1            : 2   ; /* [14..13]  */
        unsigned int    usb2_phy01_test_srst_req : 1   ; /* [15]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG47;

/* Define the union U_PERI_CRG50 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pmc_cken              : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    pmc_srst_req          : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG50;

/* Define the union U_PERI_CRG52 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    eth_bus_cken          : 1   ; /* [0]  */
        unsigned int    eth_cken              : 1   ; /* [1]  */
        unsigned int    eth_clk_sel           : 1   ; /* [2]  */
        unsigned int    hrst_eth_s            : 1   ; /* [3]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG52;

/* Define the union U_PERI_CRG54 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vo_bus_cken           : 1   ; /* [0]  */
        unsigned int    reserved_6            : 1   ; /* [1]  */
        unsigned int    vo_sd_cken            : 1   ; /* [2]  */
        unsigned int    vo_sdate_cken         : 1   ; /* [3]  */
        unsigned int    vo_hd0_cken           : 1   ; /* [4]  */
        unsigned int    reserved_5            : 1   ; /* [5]  */
        unsigned int    vdac_ch0_cken         : 1   ; /* [6]  */
        unsigned int    reserved_4            : 5   ; /* [11..7]  */
        unsigned int    vo_sd_clk_sel         : 1   ; /* [12]  */
        unsigned int    reserved_3            : 1   ; /* [13]  */
        unsigned int    vo_sd_clk_div         : 2   ; /* [15..14]  */
        unsigned int    vo_hd_clk_sel         : 1   ; /* [16]  */
        unsigned int    reserved_2            : 1   ; /* [17]  */
        unsigned int    vo_hd_clk_div         : 2   ; /* [19..18]  */
        unsigned int    reserved_1            : 5   ; /* [24..20]  */
        unsigned int    hdmi_clk_sel          : 1   ; /* [25]  */
        unsigned int    vo_sd_hdmi_clk_sel    : 1   ; /* [26]  */
        unsigned int    vdp_clk_sel           : 1   ; /* [27]  */
        unsigned int    vo_hd_hdmi_clk_sel    : 1   ; /* [28]  */
        unsigned int    vou_srst_req          : 1   ; /* [29]  */
        unsigned int    vdp_cfg_cken          : 1   ; /* [30]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG54;

/* Define the union U_PERI_CRG56 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qtc_bus_cken          : 1   ; /* [0]  */
        unsigned int    qtc_cken              : 1   ; /* [1]  */
        unsigned int    reserved_2            : 2   ; /* [3..2]  */
        unsigned int    qtc_srst_req          : 1   ; /* [4]  */
        unsigned int    reserved_1            : 3   ; /* [7..5]  */
        unsigned int    qtc_clk_pctrl         : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG56;

/* Define the union U_PERI_CRG57 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dem_fec_cken          : 1   ; /* [0]  */
        unsigned int    dem_cken              : 1   ; /* [1]  */
        unsigned int    dem_adc_cken          : 1   ; /* [2]  */
        unsigned int    reserved_2            : 1   ; /* [3]  */
        unsigned int    chn_srst_req          : 1   ; /* [4]  */
        unsigned int    adc_q_srst_req        : 1   ; /* [5]  */
        unsigned int    adc_i_srst_req        : 1   ; /* [6]  */
        unsigned int    adc_i2c_srst_req      : 1   ; /* [7]  */
        unsigned int    adc_s_clk_sel         : 1   ; /* [8]  */
        unsigned int    dem_c_clk_sel         : 1   ; /* [9]  */
        unsigned int    dem_i2c_clk_sel       : 2   ; /* [11..10]  */
        unsigned int    qtc_clk_sel           : 1   ; /* [12]  */
        unsigned int    adc_clk_sel           : 1   ; /* [13]  */
        unsigned int    dem_t_clk_sel         : 1   ; /* [14]  */
        unsigned int    reserved_1            : 1   ; /* [15]  */
        unsigned int    adc_clk_pctrl         : 1   ; /* [16]  */
        unsigned int    dem_axi_cken          : 1   ; /* [17]  */
        unsigned int    reserved_0            : 14  ; /* [31..18]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG57;

/* Define the union U_PERI_CRG63 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pvr_bus_cken          : 1   ; /* [0]  */
        unsigned int    pvr_dmx_cken          : 1   ; /* [1]  */
        unsigned int    pvr_27m_cken          : 1   ; /* [2]  */
        unsigned int    pvr_tsi1_cken         : 1   ; /* [3]  */
        unsigned int    pvr_tsi2_cken         : 1   ; /* [4]  */
        unsigned int    pvr_tsi3_cken         : 1   ; /* [5]  */
        unsigned int    pvr_tsi4_cken         : 1   ; /* [6]  */
        unsigned int    pvr_tsi5_cken         : 1   ; /* [7]  */
        unsigned int    reserved_4            : 2   ; /* [9..8]  */
        unsigned int    pvr_ts0_cken          : 1   ; /* [10]  */
        unsigned int    reserved_3            : 1   ; /* [11]  */
        unsigned int    pvr_tsout0_cken       : 1   ; /* [12]  */
        unsigned int    reserved_2            : 2   ; /* [14..13]  */
        unsigned int    pvr_tsi1_pctrl        : 1   ; /* [15]  */
        unsigned int    pvr_tsi2_pctrl        : 1   ; /* [16]  */
        unsigned int    pvr_tsi3_pctrl        : 1   ; /* [17]  */
        unsigned int    pvr_tsi4_pctrl        : 1   ; /* [18]  */
        unsigned int    reserved_1            : 5   ; /* [23..19]  */
        unsigned int    pvr_srst_req          : 1   ; /* [24]  */
        unsigned int    reserved_0            : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG63;

/* Define the union U_PERI_CRG64 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pvr_tsout0_pctrl      : 1   ; /* [0]  */
        unsigned int    pvr_dmx_clk_sel       : 1   ; /* [1]  */
        unsigned int    reserved_4            : 2   ; /* [3..2]  */
        unsigned int    sw_dmx_clk_div        : 5   ; /* [8..4]  */
        unsigned int    sw_dmxclk_loaden      : 1   ; /* [9]  */
        unsigned int    reserved_3            : 2   ; /* [11..10]  */
        unsigned int    pvr_ts0_clk_sel       : 2   ; /* [13..12]  */
        unsigned int    reserved_2            : 2   ; /* [15..14]  */
        unsigned int    pvr_ts0_clk_div       : 4   ; /* [19..16]  */
        unsigned int    reserved_1            : 4   ; /* [23..20]  */
        unsigned int    pvr_tsi_sel           : 1   ; /* [24]  */
        unsigned int    reserved_0            : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG64;

/* Define the union U_PERI_CRG67 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ssc_in_cken           : 1   ; /* [0]  */
        unsigned int    ssc_bypass_cken       : 1   ; /* [1]  */
        unsigned int    hdmitx_ctrl_osc_24m_cken : 1   ; /* [2]  */
        unsigned int    reserved_4            : 1   ; /* [3]  */
        unsigned int    hdmitx_ctrl_os_cken   : 1   ; /* [4]  */
        unsigned int    hdmitx_ctrl_as_cken   : 1   ; /* [5]  */
        unsigned int    hdmitx_ctrl_bus_srst_req : 1   ; /* [6]  */
        unsigned int    hdmitx_ctrl_srst_req  : 1   ; /* [7]  */
        unsigned int    reserved_3            : 1   ; /* [8]  */
        unsigned int    hdmitx_ssc_srst_req   : 1   ; /* [9]  */
        unsigned int    ssc_clk_div           : 4   ; /* [13..10]  */
        unsigned int    reserved_2            : 2   ; /* [15..14]  */
        unsigned int    hdmitx_pxl_cken       : 1   ; /* [16]  */
        unsigned int    reserved_1            : 2   ; /* [18..17]  */
        unsigned int    ssc_bypass_clk_sel    : 1   ; /* [19]  */
        unsigned int    reserved_0            : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG67;

/* Define the union U_PERI_CRG68 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    phy_tmds_cken         : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    hdmitx_phy_srst_req   : 1   ; /* [4]  */
        unsigned int    phy_tmds_srst_req     : 1   ; /* [5]  */
        unsigned int    tmds_clk_div          : 3   ; /* [8..6]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG68;

/* Define the union U_PERI_CRG69 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_cken             : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    adac_srst_req         : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG69;

/* Define the union U_PERI_CRG70 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aiao_cken             : 1   ; /* [0]  */
        unsigned int    reserved_3            : 3   ; /* [3..1]  */
        unsigned int    aiao_srst_req         : 1   ; /* [4]  */
        unsigned int    reserved_2            : 7   ; /* [11..5]  */
        unsigned int    aiaoclk_skipcfg       : 5   ; /* [16..12]  */
        unsigned int    aiaoclk_loaden        : 1   ; /* [17]  */
        unsigned int    reserved_1            : 3   ; /* [20..18]  */
        unsigned int    aiao_mclk_sel         : 1   ; /* [21]  */
        unsigned int    aiao_clk_sel          : 1   ; /* [22]  */
        unsigned int    reserved_0            : 9   ; /* [31..23]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG70;

/* Define the union U_PERI_CRG71 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdac_chop_cken        : 1   ; /* [0]  */
        unsigned int    reserved_1            : 15  ; /* [15..1]  */
        unsigned int    vdac_0_clk_pctrl      : 1   ; /* [16]  */
        unsigned int    reserved_0            : 15  ; /* [31..17]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG71;

/* Define the union U_PERI_CRG74 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_freq_sel_cfg_crg  : 3   ; /* [2..0]  */
        unsigned int    reserved_1            : 6   ; /* [8..3]  */
        unsigned int    ddr_begin_cfg_bypass  : 1   ; /* [9]  */
        unsigned int    ddr_sw_begin_cfg      : 1   ; /* [10]  */
        unsigned int    reserved_0            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG74;

/* Define the union U_PERI_CRG75 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_ssmod_ctrl       : 14  ; /* [13..0]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG75;

/* Define the union U_PERI_CRG77 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_ssmod_ctrl       : 16  ; /* [15..0]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG77;

/* Define the union U_PERI_CRG79 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_ssmod_ctrl       : 14  ; /* [13..0]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG79;

/* Define the union U_PERI_CRG80 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_ssmod_ctrl       : 14  ; /* [13..0]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG80;

/* Define the union U_PERI_CRG82 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_ssmod_ctrl       : 16  ; /* [15..0]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG82;

/* Define the union U_PERI_CRG84 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pll_lock              : 6   ; /* [5..0]  */
        unsigned int    reserved_0            : 26  ; /* [31..6]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG84;

/* Define the union U_PERI_CRG85 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_clk_sw_ok_crg     : 1   ; /* [0]  */
        unsigned int    cpu_clk_mux           : 3   ; /* [3..1]  */
        unsigned int    reserved_3            : 4   ; /* [7..4]  */
        unsigned int    ddr_clk_sw_ok_crg     : 1   ; /* [8]  */
        unsigned int    ddr_clk_mux           : 3   ; /* [11..9]  */
        unsigned int    core_bus_clk_seled    : 2   ; /* [13..12]  */
        unsigned int    reserved_2            : 9   ; /* [22..14]  */
        unsigned int    mde2_clk_seled        : 2   ; /* [24..23]  */
        unsigned int    reserved_1            : 4   ; /* [28..25]  */
        unsigned int    vdh_clk_seled         : 2   ; /* [30..29]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG85;

/* Define the union U_PERI_CRG_PLL86 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg0_sw       : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL86;

/* Define the union U_PERI_CRG_PLL87 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_pll_cfg1_sw       : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL87;

/* Define the union U_PERI_CRG_PLL88 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg0_sw       : 31  ; /* [30..0]  */
        unsigned int    reserved_0            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL88;

/* Define the union U_PERI_CRG_PLL89 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_pll_cfg1_sw       : 27  ; /* [26..0]  */
        unsigned int    reserved_0            : 5   ; /* [31..27]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG_PLL89;

/* Define the union U_PERI_CRG90 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    slic_rst0_out         : 1   ; /* [0]  */
        unsigned int    fe_rstn_out           : 1   ; /* [1]  */
        unsigned int    dem_rst0_out          : 1   ; /* [2]  */
        unsigned int    mute_ctrl_out         : 1   ; /* [3]  */
        unsigned int    slic_rst1_out         : 1   ; /* [4]  */
        unsigned int    dem_rst1_out          : 1   ; /* [5]  */
        unsigned int    reserved_0            : 26  ; /* [31..6]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG90;

/* Define the union U_PERI_CRG93 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_1            : 5   ; /* [4..0]  */
        unsigned int    tde_rst_ok            : 1   ; /* [5]  */
        unsigned int    reserved_0            : 26  ; /* [31..6]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG93;

/* Define the union U_PERI_CRG94 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    wdg0_cken             : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    wdg0_srst_req         : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG94;

/* Define the union U_PERI_CRG95 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pll_test_en           : 1   ; /* [0]  */
        unsigned int    test_clk_sel          : 1   ; /* [1]  */
        unsigned int    test_clk_en           : 1   ; /* [2]  */
        unsigned int    hdmitx_phy_test_clk_en : 1   ; /* [3]  */
        unsigned int    fephy_test_clk_en     : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG95;

/* Define the union U_PERI_CRG96 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mem_adjust_cpu        : 11  ; /* [10..0]  */
        unsigned int    reserved_0            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG96;

/* Define the union U_PERI_CRG105 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG105;

/* Define the union U_PERI_CRG106 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG106;

/* Define the union U_PERI_CRG107 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG107;

/* Define the union U_PERI_CRG108 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG108;

/* Define the union U_PERI_CRG109 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_cken        : 1   ; /* [0]  */
        unsigned int    apll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    apll_tune_mode        : 1   ; /* [2]  */
        unsigned int    apll_tune_en          : 1   ; /* [3]  */
        unsigned int    apll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    apll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG109;

/* Define the union U_PERI_CRG115 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG115;

/* Define the union U_PERI_CRG116 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG116;

/* Define the union U_PERI_CRG117 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG117;

/* Define the union U_PERI_CRG118 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG118;

/* Define the union U_PERI_CRG119 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_cken        : 1   ; /* [0]  */
        unsigned int    dpll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    dpll_tune_mode        : 1   ; /* [2]  */
        unsigned int    dpll_tune_en          : 1   ; /* [3]  */
        unsigned int    dpll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    dpll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG119;

/* Define the union U_PERI_CRG135 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG135;

/* Define the union U_PERI_CRG136 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG136;

/* Define the union U_PERI_CRG137 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG137;

/* Define the union U_PERI_CRG138 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG138;

/* Define the union U_PERI_CRG139 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_cken        : 1   ; /* [0]  */
        unsigned int    hpll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    hpll_tune_mode        : 1   ; /* [2]  */
        unsigned int    hpll_tune_en          : 1   ; /* [3]  */
        unsigned int    hpll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    hpll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG139;

/* Define the union U_PERI_CRG140 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG140;

/* Define the union U_PERI_CRG141 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG141;

/* Define the union U_PERI_CRG142 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG142;

/* Define the union U_PERI_CRG143 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG143;

/* Define the union U_PERI_CRG144 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_cken        : 1   ; /* [0]  */
        unsigned int    vpll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    vpll_tune_mode        : 1   ; /* [2]  */
        unsigned int    vpll_tune_en          : 1   ; /* [3]  */
        unsigned int    vpll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    vpll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG144;

/* Define the union U_PERI_CRG165 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    apll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    apll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG165;

/* Define the union U_PERI_CRG166 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    apll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG166;

/* Define the union U_PERI_CRG169 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    dpll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    dpll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG169;

/* Define the union U_PERI_CRG170 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dpll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG170;

/* Define the union U_PERI_CRG177 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    hpll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    hpll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG177;

/* Define the union U_PERI_CRG178 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hpll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG178;

/* Define the union U_PERI_CRG179 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    vpll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    vpll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG179;

/* Define the union U_PERI_CRG180 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vpll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG180;

/* Define the union U_PERI_CRG181 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cpu_sm_sw_mode        : 1   ; /* [0]  */
        unsigned int    cpu_sw_step_slow_up_ref : 3   ; /* [3..1]  */
        unsigned int    cpu_sw_step_slow_down_ref : 3   ; /* [6..4]  */
        unsigned int    reserved_0            : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG181;

/* Define the union U_PERI_CRG182 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    clk_cpu_sm_sw_seled   : 1   ; /* [0]  */
        unsigned int    cpu_sm_sw_busy        : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG182;

/* Define the union U_PERI_CRG204 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    tde_smmu_cken         : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    tde_smmu_srst_req     : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG204;

/* Define the union U_PERI_CRG208 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdp_smmu_cken         : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    vdp_smmu_srst_req     : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG208;

/* Define the union U_PERI_CRG211 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_2            : 14  ; /* [13..0]  */
        unsigned int    vdp_hd_cken           : 1   ; /* [14]  */
        unsigned int    reserved_1            : 9   ; /* [23..15]  */
        unsigned int    vdp_clk_div           : 5   ; /* [28..24]  */
        unsigned int    vdp_srst_req          : 1   ; /* [29]  */
        unsigned int    reserved_0            : 2   ; /* [31..30]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG211;

/* Define the union U_PERI_CRG212 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG212;

/* Define the union U_PERI_CRG213 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG213;

/* Define the union U_PERI_CRG214 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG214;

/* Define the union U_PERI_CRG215 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG215;

/* Define the union U_PERI_CRG216 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_cken        : 1   ; /* [0]  */
        unsigned int    qpll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    qpll_tune_mode        : 1   ; /* [2]  */
        unsigned int    qpll_tune_en          : 1   ; /* [3]  */
        unsigned int    qpll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    qpll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG216;

/* Define the union U_PERI_CRG217 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    qpll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    qpll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG217;

/* Define the union U_PERI_CRG218 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qpll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG218;

/* Define the union U_PERI_CRG224 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fmc_cken              : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    fmc_srst_req          : 1   ; /* [4]  */
        unsigned int    fmc_clk_sel           : 3   ; /* [7..5]  */
        unsigned int    reserved_0            : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG224;

/* Define the union U_PERI_CRG226 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fephy_cken            : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    fephy_srst_req        : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG226;

/* Define the union U_PERI_CRG238 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_int_cfg     : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG238;

/* Define the union U_PERI_CRG239 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_frac_cfg    : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG239;

/* Define the union U_PERI_CRG240 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_step_int    : 12  ; /* [11..0]  */
        unsigned int    reserved_0            : 20  ; /* [31..12]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG240;

/* Define the union U_PERI_CRG241 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_step_frac   : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG241;

/* Define the union U_PERI_CRG242 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_cken        : 1   ; /* [0]  */
        unsigned int    spll_tune_srst_req    : 1   ; /* [1]  */
        unsigned int    spll_tune_mode        : 1   ; /* [2]  */
        unsigned int    spll_tune_en          : 1   ; /* [3]  */
        unsigned int    spll_tune_divval      : 4   ; /* [7..4]  */
        unsigned int    spll_tune_soft_cfg    : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG242;

/* Define the union U_PERI_CRG243 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_int         : 12  ; /* [11..0]  */
        unsigned int    spll_tune_sw_ok       : 1   ; /* [12]  */
        unsigned int    spll_tune_busy        : 1   ; /* [13]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG243;

/* Define the union U_PERI_CRG244 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_tune_frac        : 24  ; /* [23..0]  */
        unsigned int    reserved_0            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG244;

/* Define the union U_PERI_CRG247 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_3            : 2   ; /* [1..0]  */
        unsigned int    clk_375m_sensor_seled : 1   ; /* [2]  */
        unsigned int    clk_300m_sensor_seled : 1   ; /* [3]  */
        unsigned int    clk_250m_sensor_seled : 1   ; /* [4]  */
        unsigned int    clk_187m_sensor_seled : 1   ; /* [5]  */
        unsigned int    ashield_clk_seled     : 1   ; /* [6]  */
        unsigned int    ca_pro_clk_seled      : 1   ; /* [7]  */
        unsigned int    clk_srsa_sw_seled     : 1   ; /* [8]  */
        unsigned int    clk_sec_sw_seled      : 1   ; /* [9]  */
        unsigned int    reserved_2            : 1   ; /* [10]  */
        unsigned int    scpu_clk_seled        : 1   ; /* [11]  */
        unsigned int    clk_scipher_sw_seled  : 1   ; /* [12]  */
        unsigned int    reserved_1            : 1   ; /* [13]  */
        unsigned int    clk_hrsa_sw_seled     : 1   ; /* [14]  */
        unsigned int    dbc_clk_seled         : 1   ; /* [15]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG247;

/* Define the union U_PERI_CRG248 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_ssmod_ctrl       : 14  ; /* [13..0]  */
        unsigned int    reserved_0            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG248;

/* Define the union U_PERI_CRG252 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spll_lock_cfg         : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG252;

/* Define the union U_PERI_CRG260 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spacc_cken            : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    spacc_srst_req        : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG260;

/* Define the union U_PERI_CRG264 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    plcipher_cken         : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    plcipher_srst_req     : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG264;

/* Define the union U_PERI_CRG265 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ci_cken               : 1   ; /* [0]  */
        unsigned int    reserved_1            : 3   ; /* [3..1]  */
        unsigned int    ci_srst_req           : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG265;

/* Define the union U_PERI_CRG266 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mem_lock_cfg          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG266;

/* Define the union U_PERI_CRG271 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_4            : 8   ; /* [7..0]  */
        unsigned int    shpm1_cken            : 1   ; /* [8]  */
        unsigned int    reserved_3            : 3   ; /* [11..9]  */
        unsigned int    shpm1_srst_req        : 1   ; /* [12]  */
        unsigned int    reserved_2            : 3   ; /* [15..13]  */
        unsigned int    shpm2_cken            : 1   ; /* [16]  */
        unsigned int    reserved_1            : 3   ; /* [19..17]  */
        unsigned int    shpm2_srst_req        : 1   ; /* [20]  */
        unsigned int    reserved_0            : 11  ; /* [31..21]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG271;

/* Define the union U_PERI_CRG272 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ca_pro_clk_sel        : 1   ; /* [0]  */
        unsigned int    reserved_1            : 2   ; /* [2..1]  */
        unsigned int    sensor_pro_clk_sel    : 1   ; /* [3]  */
        unsigned int    ashield_clk_sel       : 1   ; /* [4]  */
        unsigned int    reserved_0            : 27  ; /* [31..5]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG272;

/* Define the union U_PERI_CRG273 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pll_count_en          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CRG273;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_PERI_CRG_PLL0        PERI_CRG_PLL0                    ; /* 0x0 */
    volatile U_PERI_CRG_PLL1        PERI_CRG_PLL1                    ; /* 0x4 */
    volatile unsigned int           reserved_0[2]                    ; /* 0x8~0xc */
    volatile U_PERI_CRG_PLL4        PERI_CRG_PLL4                    ; /* 0x10 */
    volatile U_PERI_CRG_PLL5        PERI_CRG_PLL5                    ; /* 0x14 */
    volatile unsigned int           reserved_1[2]                    ; /* 0x18~0x1c */
    volatile U_PERI_CRG_PLL8        PERI_CRG_PLL8                    ; /* 0x20 */
    volatile U_PERI_CRG_PLL9        PERI_CRG_PLL9                    ; /* 0x24 */
    volatile U_PERI_CRG_PLL10       PERI_CRG_PLL10                   ; /* 0x28 */
    volatile U_PERI_CRG_PLL11       PERI_CRG_PLL11                   ; /* 0x2c */
    volatile unsigned int           reserved_2[2]                    ; /* 0x30~0x34 */
    volatile U_PERI_CRG_PLL14       PERI_CRG_PLL14                   ; /* 0x38 */
    volatile U_PERI_CRG_PLL15       PERI_CRG_PLL15                   ; /* 0x3c */
    volatile U_PERI_CRG_PLL16       PERI_CRG_PLL16                   ; /* 0x40 */
    volatile U_PERI_CRG_PLL17       PERI_CRG_PLL17                   ; /* 0x44 */
    volatile U_PERI_CRG18           PERI_CRG18                       ; /* 0x48 */
    volatile U_PERI_CRG19           PERI_CRG19                       ; /* 0x4c */
    volatile U_PERI_CRG20           PERI_CRG20                       ; /* 0x50 */
    volatile U_PERI_CRG21           PERI_CRG21                       ; /* 0x54 */
    volatile U_PERI_CRG22           PERI_CRG22                       ; /* 0x58 */
    volatile unsigned int           reserved_3[2]                    ; /* 0x5c~0x60 */
    volatile U_PERI_CRG25           PERI_CRG25                       ; /* 0x64 */
    volatile unsigned int           reserved_4                       ; /* 0x68 */
    volatile U_PERI_CRG27           PERI_CRG27                       ; /* 0x6c */
    volatile unsigned int           reserved_5                       ; /* 0x70 */
    volatile U_PERI_CRG29           PERI_CRG29                       ; /* 0x74 */
    volatile U_PERI_CRG30           PERI_CRG30                       ; /* 0x78 */
    volatile U_PERI_CRG31           PERI_CRG31                       ; /* 0x7c */
    volatile unsigned int           reserved_6[5]                    ; /* 0x80~0x90 */
    volatile U_PERI_CRG37           PERI_CRG37                       ; /* 0x94 */
    volatile unsigned int           reserved_7[8]                    ; /* 0x98~0xb4 */
    volatile U_PERI_CRG46           PERI_CRG46                       ; /* 0xb8 */
    volatile U_PERI_CRG47           PERI_CRG47                       ; /* 0xbc */
    volatile unsigned int           reserved_8[2]                    ; /* 0xc0~0xc4 */
    volatile U_PERI_CRG50           PERI_CRG50                       ; /* 0xc8 */
    volatile unsigned int           reserved_9                       ; /* 0xcc */
    volatile U_PERI_CRG52           PERI_CRG52                       ; /* 0xd0 */
    volatile unsigned int           reserved_10                      ; /* 0xd4 */
    volatile U_PERI_CRG54           PERI_CRG54                       ; /* 0xd8 */
    volatile unsigned int           reserved_11                      ; /* 0xdc */
    volatile U_PERI_CRG56           PERI_CRG56                       ; /* 0xe0 */
    volatile U_PERI_CRG57           PERI_CRG57                       ; /* 0xe4 */
    volatile unsigned int           reserved_12[5]                   ; /* 0xe8~0xf8 */
    volatile U_PERI_CRG63           PERI_CRG63                       ; /* 0xfc */
    volatile U_PERI_CRG64           PERI_CRG64                       ; /* 0x100 */
    volatile unsigned int           reserved_13[2]                   ; /* 0x104~0x108 */
    volatile U_PERI_CRG67           PERI_CRG67                       ; /* 0x10c */
    volatile U_PERI_CRG68           PERI_CRG68                       ; /* 0x110 */
    volatile U_PERI_CRG69           PERI_CRG69                       ; /* 0x114 */
    volatile U_PERI_CRG70           PERI_CRG70                       ; /* 0x118 */
    volatile U_PERI_CRG71           PERI_CRG71                       ; /* 0x11c */
    volatile unsigned int           reserved_14[2]                   ; /* 0x120~0x124 */
    volatile U_PERI_CRG74           PERI_CRG74                       ; /* 0x128 */
    volatile U_PERI_CRG75           PERI_CRG75                       ; /* 0x12c */
    volatile unsigned int           reserved_15                      ; /* 0x130 */
    volatile U_PERI_CRG77           PERI_CRG77                       ; /* 0x134 */
    volatile unsigned int           reserved_16                      ; /* 0x138 */
    volatile U_PERI_CRG79           PERI_CRG79                       ; /* 0x13c */
    volatile U_PERI_CRG80           PERI_CRG80                       ; /* 0x140 */
    volatile unsigned int           reserved_17                      ; /* 0x144 */
    volatile U_PERI_CRG82           PERI_CRG82                       ; /* 0x148 */
    volatile unsigned int           reserved_18                      ; /* 0x14c */
    volatile U_PERI_CRG84           PERI_CRG84                       ; /* 0x150 */
    volatile U_PERI_CRG85           PERI_CRG85                       ; /* 0x154 */
    volatile U_PERI_CRG_PLL86       PERI_CRG_PLL86                   ; /* 0x158 */
    volatile U_PERI_CRG_PLL87       PERI_CRG_PLL87                   ; /* 0x15c */
    volatile U_PERI_CRG_PLL88       PERI_CRG_PLL88                   ; /* 0x160 */
    volatile U_PERI_CRG_PLL89       PERI_CRG_PLL89                   ; /* 0x164 */
    volatile U_PERI_CRG90           PERI_CRG90                       ; /* 0x168 */
    volatile unsigned int           reserved_19[2]                   ; /* 0x16c~0x170 */
    volatile U_PERI_CRG93           PERI_CRG93                       ; /* 0x174 */
    volatile U_PERI_CRG94           PERI_CRG94                       ; /* 0x178 */
    volatile U_PERI_CRG95           PERI_CRG95                       ; /* 0x17c */
    volatile U_PERI_CRG96           PERI_CRG96                       ; /* 0x180 */
    volatile unsigned int           reserved_20[8]                   ; /* 0x184~0x1a0 */
    volatile U_PERI_CRG105          PERI_CRG105                      ; /* 0x1a4 */
    volatile U_PERI_CRG106          PERI_CRG106                      ; /* 0x1a8 */
    volatile U_PERI_CRG107          PERI_CRG107                      ; /* 0x1ac */
    volatile U_PERI_CRG108          PERI_CRG108                      ; /* 0x1b0 */
    volatile U_PERI_CRG109          PERI_CRG109                      ; /* 0x1b4 */
    volatile unsigned int           reserved_21[5]                   ; /* 0x1b8~0x1c8 */
    volatile U_PERI_CRG115          PERI_CRG115                      ; /* 0x1cc */
    volatile U_PERI_CRG116          PERI_CRG116                      ; /* 0x1d0 */
    volatile U_PERI_CRG117          PERI_CRG117                      ; /* 0x1d4 */
    volatile U_PERI_CRG118          PERI_CRG118                      ; /* 0x1d8 */
    volatile U_PERI_CRG119          PERI_CRG119                      ; /* 0x1dc */
    volatile unsigned int           reserved_22[15]                  ; /* 0x1e0~0x218 */
    volatile U_PERI_CRG135          PERI_CRG135                      ; /* 0x21c */
    volatile U_PERI_CRG136          PERI_CRG136                      ; /* 0x220 */
    volatile U_PERI_CRG137          PERI_CRG137                      ; /* 0x224 */
    volatile U_PERI_CRG138          PERI_CRG138                      ; /* 0x228 */
    volatile U_PERI_CRG139          PERI_CRG139                      ; /* 0x22c */
    volatile U_PERI_CRG140          PERI_CRG140                      ; /* 0x230 */
    volatile U_PERI_CRG141          PERI_CRG141                      ; /* 0x234 */
    volatile U_PERI_CRG142          PERI_CRG142                      ; /* 0x238 */
    volatile U_PERI_CRG143          PERI_CRG143                      ; /* 0x23c */
    volatile U_PERI_CRG144          PERI_CRG144                      ; /* 0x240 */
    volatile unsigned int           reserved_23[20]                  ; /* 0x244~0x290 */
    volatile U_PERI_CRG165          PERI_CRG165                      ; /* 0x294 */
    volatile U_PERI_CRG166          PERI_CRG166                      ; /* 0x298 */
    volatile unsigned int           reserved_24[2]                   ; /* 0x29c~0x2a0 */
    volatile U_PERI_CRG169          PERI_CRG169                      ; /* 0x2a4 */
    volatile U_PERI_CRG170          PERI_CRG170                      ; /* 0x2a8 */
    volatile unsigned int           reserved_25[6]                   ; /* 0x2ac~0x2c0 */
    volatile U_PERI_CRG177          PERI_CRG177                      ; /* 0x2c4 */
    volatile U_PERI_CRG178          PERI_CRG178                      ; /* 0x2c8 */
    volatile U_PERI_CRG179          PERI_CRG179                      ; /* 0x2cc */
    volatile U_PERI_CRG180          PERI_CRG180                      ; /* 0x2d0 */
    volatile U_PERI_CRG181          PERI_CRG181                      ; /* 0x2d4 */
    volatile U_PERI_CRG182          PERI_CRG182                      ; /* 0x2d8 */
    volatile unsigned int           reserved_26[21]                  ; /* 0x2dc~0x32c */
    volatile U_PERI_CRG204          PERI_CRG204                      ; /* 0x330 */
    volatile unsigned int           reserved_27[3]                   ; /* 0x334~0x33c */
    volatile U_PERI_CRG208          PERI_CRG208                      ; /* 0x340 */
    volatile unsigned int           reserved_28[2]                   ; /* 0x344~0x348 */
    volatile U_PERI_CRG211          PERI_CRG211                      ; /* 0x34c */
    volatile U_PERI_CRG212          PERI_CRG212                      ; /* 0x350 */
    volatile U_PERI_CRG213          PERI_CRG213                      ; /* 0x354 */
    volatile U_PERI_CRG214          PERI_CRG214                      ; /* 0x358 */
    volatile U_PERI_CRG215          PERI_CRG215                      ; /* 0x35c */
    volatile U_PERI_CRG216          PERI_CRG216                      ; /* 0x360 */
    volatile U_PERI_CRG217          PERI_CRG217                      ; /* 0x364 */
    volatile U_PERI_CRG218          PERI_CRG218                      ; /* 0x368 */
    volatile unsigned int           reserved_29[5]                   ; /* 0x36c~0x37c */
    volatile U_PERI_CRG224          PERI_CRG224                      ; /* 0x380 */
    volatile unsigned int           reserved_30                      ; /* 0x384 */
    volatile U_PERI_CRG226          PERI_CRG226                      ; /* 0x388 */
    volatile unsigned int           reserved_31[11]                  ; /* 0x38c~0x3b4 */
    volatile U_PERI_CRG238          PERI_CRG238                      ; /* 0x3b8 */
    volatile U_PERI_CRG239          PERI_CRG239                      ; /* 0x3bc */
    volatile U_PERI_CRG240          PERI_CRG240                      ; /* 0x3c0 */
    volatile U_PERI_CRG241          PERI_CRG241                      ; /* 0x3c4 */
    volatile U_PERI_CRG242          PERI_CRG242                      ; /* 0x3c8 */
    volatile U_PERI_CRG243          PERI_CRG243                      ; /* 0x3cc */
    volatile U_PERI_CRG244          PERI_CRG244                      ; /* 0x3d0 */
    volatile unsigned int           reserved_32[2]                   ; /* 0x3d4~0x3d8 */
    volatile U_PERI_CRG247          PERI_CRG247                      ; /* 0x3dc */
    volatile U_PERI_CRG248          PERI_CRG248                      ; /* 0x3e0 */
    volatile unsigned int           reserved_33[3]                   ; /* 0x3e4~0x3ec */
    volatile U_PERI_CRG252          PERI_CRG252                      ; /* 0x3f0 */
    volatile unsigned int           reserved_34[7]                   ; /* 0x3f4~0x40c */
    volatile U_PERI_CRG260          PERI_CRG260                      ; /* 0x410 */
    volatile unsigned int           reserved_35[3]                   ; /* 0x414~0x41c */
    volatile U_PERI_CRG264          PERI_CRG264                      ; /* 0x420 */
    volatile U_PERI_CRG265          PERI_CRG265                      ; /* 0x424 */
    volatile U_PERI_CRG266          PERI_CRG266                      ; /* 0x428 */
    volatile unsigned int           reserved_36[4]                   ; /* 0x42c~0x438 */
    volatile U_PERI_CRG271          PERI_CRG271                      ; /* 0x43c */
    volatile U_PERI_CRG272          PERI_CRG272                      ; /* 0x440 */
    volatile U_PERI_CRG273          PERI_CRG273                      ; /* 0x444 */
    volatile unsigned int           PERI_CRG274                      ; /* 0x448 */
    volatile unsigned int           PERI_CRG275                      ; /* 0x44c */
    volatile unsigned int           PERI_CRG276                      ; /* 0x450 */

} S_CRG_REGS_TYPE;


#endif /* __HI_REG_CRG_H__ */
