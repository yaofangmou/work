// ******************************************************************************
// Copyright     :  Copyright (C) 2017, Hisilicon Technologies Co. Ltd.
// File name     :  hi_reg_peri.h
// Project line  :  媒体产品线
// Department    :  STB产品线
// Author        :
// Version       :  1.0
// Date          :  2014/1/17
// Description   :  项目描述信息
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  2017/11/21 20:53:10 Create file
// ******************************************************************************

#ifndef __HI_REG_PERI_H__
#define __HI_REG_PERI_H__

/* Define the union U_START_MODE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 9   ; /* [8..0]  */
        unsigned int    boot_sel              : 3   ; /* [11..9]  */
        unsigned int    reserved_1            : 8   ; /* [19..12]  */
        unsigned int    romboot_sel           : 1   ; /* [20]  */
        unsigned int    reserved_2            : 2   ; /* [22..21]  */
        unsigned int    jtag_sel_in           : 1   ; /* [23]  */
        unsigned int    reserved_3            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_START_MODE;

/* Define the union U_PERI_REMAP */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    remapstat             : 4   ; /* [3..0]  */
        unsigned int    reserved_0            : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_REMAP;

/* Define the union U_PERI_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 19  ; /* [18..0]  */
        unsigned int    fe_act_sel            : 1   ; /* [19]  */
        unsigned int    fe_base_sel           : 1   ; /* [20]  */
        unsigned int    sci_io_flag           : 1   ; /* [21]  */
        unsigned int    reserved_1            : 2   ; /* [23..22]  */
        unsigned int    test_out_sel          : 3   ; /* [26..24]  */
        unsigned int    pvr_tsi1_sel          : 1   ; /* [27]  */
        unsigned int    reserved_2            : 1   ; /* [28]  */
        unsigned int    peri_jtag_sel         : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CTRL;

/* Define the union U_PERI_CPU_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    a7mp0_smpnamp         : 1   ; /* [0]  */
        unsigned int    a7mp1_smpnamp         : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_CPU_STAT;

/* Define the union U_CPU_SET */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 1   ; /* [0]  */
        unsigned int    l1rstdisable0         : 1   ; /* [1]  */
        unsigned int    l1rstdisable1         : 1   ; /* [2]  */
        unsigned int    reserved_1            : 2   ; /* [4..3]  */
        unsigned int    l2rstdisable          : 1   ; /* [5]  */
        unsigned int    reserved_2            : 26  ; /* [31..6]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CPU_SET;

/* Define the union U_PERI_QOS_CFG0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aiao_arqos            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 13  ; /* [15..3]  */
        unsigned int    cpu_arqos             : 3   ; /* [18..16]  */
        unsigned int    reserved_1            : 1   ; /* [19]  */
        unsigned int    cpu_awqos             : 3   ; /* [22..20]  */
        unsigned int    reserved_2            : 1   ; /* [23]  */
        unsigned int    ddrt_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_3            : 1   ; /* [27]  */
        unsigned int    ddrt_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_4            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG0;

/* Define the union U_PERI_QOS_CFG1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qtc_awqos             : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    pl_cipher_arqos       : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    pl_cipher_awqos       : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG1;

/* Define the union U_PERI_QOS_CFG2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    jpgd_arqos            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    jpgd_awqos            : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 25  ; /* [31..7]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG2;

/* Define the union U_PERI_QOS_CFG3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 12  ; /* [11..0]  */
        unsigned int    tde_arqos             : 3   ; /* [14..12]  */
        unsigned int    reserved_1            : 1   ; /* [15]  */
        unsigned int    tde_awqos             : 3   ; /* [18..16]  */
        unsigned int    reserved_2            : 9   ; /* [27..19]  */
        unsigned int    vdh_arqos             : 3   ; /* [30..28]  */
        unsigned int    reserved_3            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG3;

/* Define the union U_PERI_QOS_CFG4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vdh_awqos             : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    vdp_arqos             : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    vdp_awqos             : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 21  ; /* [31..11]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG4;

/* Define the union U_PERI_QOS_CFG5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    sha3_arqos            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 25  ; /* [27..3]  */
        unsigned int    pvr_qos               : 3   ; /* [30..28]  */
        unsigned int    reserved_1            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG5;

/* Define the union U_PERI_QOS_CFG6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 12  ; /* [11..0]  */
        unsigned int    eth_qos               : 3   ; /* [14..12]  */
        unsigned int    reserved_1            : 13  ; /* [27..15]  */
        unsigned int    usb2_qos              : 3   ; /* [30..28]  */
        unsigned int    reserved_2            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG6;

/* Define the union U_PERI_QOS_CFG7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 20  ; /* [19..0]  */
        unsigned int    fmc_qos               : 3   ; /* [22..20]  */
        unsigned int    reserved_1            : 1   ; /* [23]  */
        unsigned int    demo_arqos            : 3   ; /* [26..24]  */
        unsigned int    reserved_2            : 1   ; /* [27]  */
        unsigned int    demo_awqos            : 3   ; /* [30..28]  */
        unsigned int    reserved_3            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_CFG7;

/* Define the union U_PERI_USB_RESUME_INT_MASK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb_suspend0_int_mask : 1   ; /* [0]  */
        unsigned int    usb_suspend1_int_mask : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_MASK;

/* Define the union U_PERI_USB_RESUME_INT_RAWSTAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb_suspend0_int_rawstat : 1   ; /* [0]  */
        unsigned int    usb_suspend1_int_rawstat : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_RAWSTAT;

/* Define the union U_PERI_USB_RESUME_INT_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb_suspend0_int_stat : 1   ; /* [0]  */
        unsigned int    usb_suspend1_int_stat : 1   ; /* [1]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB_RESUME_INT_STAT;

/* Define the union U_PERI_INT_A9TOMCE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    int_cputomce          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_INT_A9TOMCE;

/* Define the union U_PERI_QAM */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qam_dev_addr          : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QAM;

/* Define the union U_PERI_QAM_ADC0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    qamadc_i2c_addr       : 7   ; /* [6..0]  */
        unsigned int    qamadc_cal_en         : 1   ; /* [7]  */
        unsigned int    qamadc_mode_sel       : 3   ; /* [10..8]  */
        unsigned int    peri_adc_din_sel      : 1   ; /* [11]  */
        unsigned int    peri_adc_vdac_sel     : 1   ; /* [12]  */
        unsigned int    reserved_0            : 3   ; /* [15..13]  */
        unsigned int    qamadc_rdy            : 1   ; /* [16]  */
        unsigned int    reserved_1            : 15  ; /* [31..17]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QAM_ADC0;

/* Define the union U_PERI_TIANLA_ADAC0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_dig_dacr_vol     : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 1   ; /* [7]  */
        unsigned int    adac_dig_dacl_vol     : 7   ; /* [14..8]  */
        unsigned int    reserved_1            : 3   ; /* [17..15]  */
        unsigned int    adac_dig_deemphasis_fs : 2   ; /* [19..18]  */
        unsigned int    adac_dig_dacr_deemph  : 1   ; /* [20]  */
        unsigned int    adac_dig_dacl_deemph  : 1   ; /* [21]  */
        unsigned int    adac_dig_dacr_path    : 1   ; /* [22]  */
        unsigned int    adac_dig_dacl_path    : 1   ; /* [23]  */
        unsigned int    reserved_2            : 4   ; /* [27..24]  */
        unsigned int    adac_dig_mute_dacr    : 1   ; /* [28]  */
        unsigned int    adac_dig_mute_dacl    : 1   ; /* [29]  */
        unsigned int    adac_dig_pd_dacr      : 1   ; /* [30]  */
        unsigned int    adac_dig_pd_dacl      : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC0;

/* Define the union U_PERI_TIANLA_ADAC1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_adj_refbf        : 3   ; /* [2..0]  */
        unsigned int    adac_adj_ctcm         : 2   ; /* [4..3]  */
        unsigned int    adac_adj_dac          : 3   ; /* [7..5]  */
        unsigned int    reserved_0            : 11  ; /* [18..8]  */
        unsigned int    adac_clk_sel_sam      : 3   ; /* [21..19]  */
        unsigned int    adac_data_bits        : 2   ; /* [23..22]  */
        unsigned int    reserved_1            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC1;

/* Define the union U_PERI_FEPHY */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    fephy_phy_addr        : 5   ; /* [4..0]  */
        unsigned int    mask_fephy_wol        : 1   ; /* [5]  */
        unsigned int    reserved_0            : 2   ; /* [7..6]  */
        unsigned int    soft_fephy_test_en    : 1   ; /* [8]  */
        unsigned int    reserved_1            : 1   ; /* [9]  */
        unsigned int    soft_fephy_patch_en   : 1   ; /* [10]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    soft_fephy_mdio_mdc   : 1   ; /* [12]  */
        unsigned int    reserved_3            : 1   ; /* [13]  */
        unsigned int    soft_fephy_mdio_i     : 1   ; /* [14]  */
        unsigned int    reserved_4            : 1   ; /* [15]  */
        unsigned int    soft_fephy_gp_i       : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_FEPHY;

/* Define the union U_PERI_USB3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    usb2_2p_ss_word_if_i  : 1   ; /* [0]  */
        unsigned int    usb2_2p_ohci_susp_lgcy_i : 1   ; /* [1]  */
        unsigned int    usb2_2p_app_start_clk_i : 1   ; /* [2]  */
        unsigned int    reserved_0            : 2   ; /* [4..3]  */
        unsigned int    usb2_2p_ss_autoppd_on_overcur_en_i : 1   ; /* [5]  */
        unsigned int    usb2_2p_ss_ena_incr_align_i : 1   ; /* [6]  */
        unsigned int    usb2_2p_ss_ena_incr4_i : 1   ; /* [7]  */
        unsigned int    usb2_2p_ss_ena_incr8_i : 1   ; /* [8]  */
        unsigned int    usb2_2p_ss_ena_incr16_i : 1   ; /* [9]  */
        unsigned int    reserved_1            : 12  ; /* [21..10]  */
        unsigned int    usb2_2p_ss_hubsetup_min_i : 1   ; /* [22]  */
        unsigned int    reserved_2            : 8   ; /* [30..23]  */
        unsigned int    usb2_2p_ohci_0_cntsel_i_n : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB3;

/* Define the union U_PERI_USB2PHY_TEST0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    soft_usb2_phy0_bist_en : 1   ; /* [0]  */
        unsigned int    soft_usb2_phy0_utmi_biston : 1   ; /* [1]  */
        unsigned int    soft_usb2_phy0_utmi_testcontrol : 2   ; /* [3..2]  */
        unsigned int    soft_usb2_phy0_utmi_xcvrselect : 2   ; /* [5..4]  */
        unsigned int    soft_usb2_phy0_utmi_opmode : 2   ; /* [7..6]  */
        unsigned int    soft_usb2_phy0_utmi_termselect : 1   ; /* [8]  */
        unsigned int    soft_usb2_phy0_utmi_suspend_n : 1   ; /* [9]  */
        unsigned int    soft_usb2_phy0_suspend_en : 1   ; /* [10]  */
        unsigned int    reserved_0            : 1   ; /* [11]  */
        unsigned int    usb2_phy0_utmi_bistdone : 1   ; /* [12]  */
        unsigned int    usb2_phy0_utmi_hostdisc : 1   ; /* [13]  */
        unsigned int    usb2_phy0_utmi_status : 2   ; /* [15..14]  */
        unsigned int    soft_usb2_phy1_bist_en : 1   ; /* [16]  */
        unsigned int    soft_usb2_phy1_utmi_biston : 1   ; /* [17]  */
        unsigned int    soft_usb2_phy1_utmi_testcontrol : 2   ; /* [19..18]  */
        unsigned int    soft_usb2_phy1_utmi_xcvrselect : 2   ; /* [21..20]  */
        unsigned int    soft_usb2_phy1_utmi_opmode : 2   ; /* [23..22]  */
        unsigned int    soft_usb2_phy1_utmi_termselect : 1   ; /* [24]  */
        unsigned int    soft_usb2_phy1_utmi_suspend_n : 1   ; /* [25]  */
        unsigned int    soft_usb2_phy1_suspend_en : 1   ; /* [26]  */
        unsigned int    reserved_1            : 1   ; /* [27]  */
        unsigned int    usb2_phy1_utmi_bistdone : 1   ; /* [28]  */
        unsigned int    usb2_phy1_utmi_hostdisc : 1   ; /* [29]  */
        unsigned int    usb2_phy1_utmi_status : 2   ; /* [31..30]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_USB2PHY_TEST0;

/* Define the union U_PERI_TIANLA_ADAC2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_fs               : 1   ; /* [0]  */
        unsigned int    adac_pd_vref          : 1   ; /* [1]  */
        unsigned int    adac_pdb_ctcm_ibias   : 1   ; /* [2]  */
        unsigned int    adac_pd_ctcm          : 1   ; /* [3]  */
        unsigned int    adac_pd_ibias         : 1   ; /* [4]  */
        unsigned int    adac_mute_lineout     : 1   ; /* [5]  */
        unsigned int    adac_pd_dacr          : 1   ; /* [6]  */
        unsigned int    adac_pd_dacl          : 1   ; /* [7]  */
        unsigned int    adac_pop_pu_pullb     : 1   ; /* [8]  */
        unsigned int    adac_pop_pullout_en   : 1   ; /* [9]  */
        unsigned int    adac_adj_dac_low_bias : 1   ; /* [10]  */
        unsigned int    adac_adj_cp           : 2   ; /* [12..11]  */
        unsigned int    adac_gain             : 3   ; /* [15..13]  */
        unsigned int    reserved_0            : 1   ; /* [16]  */
        unsigned int    adac_mute_sp_lineout  : 1   ; /* [17]  */
        unsigned int    adac_vref_extmod      : 1   ; /* [18]  */
        unsigned int    adac_td_sel           : 5   ; /* [23..19]  */
        unsigned int    adac_dac_lineout_chop_sel : 2   ; /* [25..24]  */
        unsigned int    adac_dac_vref_chop_sel : 2   ; /* [27..26]  */
        unsigned int    adac_ctcm_chop_sel    : 2   ; /* [29..28]  */
        unsigned int    adac_chop_bps_dacvref : 1   ; /* [30]  */
        unsigned int    adac_chop_bps_ctcm    : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC2;

/* Define the union U_PERI_TIANLA_ADAC3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_chop_bps_lineout : 1   ; /* [0]  */
        unsigned int    adac_pop_spd_cfg      : 2   ; /* [2..1]  */
        unsigned int    adac_pop_pdm_delay_cfg : 2   ; /* [4..3]  */
        unsigned int    adac_rst_pop          : 1   ; /* [5]  */
        unsigned int    adac_pop_dis          : 1   ; /* [6]  */
        unsigned int    adac_pd_clkramp       : 1   ; /* [7]  */
        unsigned int    adac_pop_clk_sel      : 2   ; /* [9..8]  */
        unsigned int    adac_cp_dt_ctrl       : 2   ; /* [11..10]  */
        unsigned int    adac_cp_clk_sel       : 2   ; /* [13..12]  */
        unsigned int    adac_cp_en_soft       : 1   ; /* [14]  */
        unsigned int    adac_cp_pd            : 1   ; /* [15]  */
        unsigned int    adac_cp_buffer_pd     : 1   ; /* [16]  */
        unsigned int    adac_pd_lineout       : 1   ; /* [17]  */
        unsigned int    adac_msel             : 1   ; /* [18]  */
        unsigned int    reserved_0            : 2   ; /* [20..19]  */
        unsigned int    adac_rst              : 1   ; /* [21]  */
        unsigned int    adac_clkdgesel        : 1   ; /* [22]  */
        unsigned int    adac_clksel           : 1   ; /* [23]  */
        unsigned int    adac_ctrl7            : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC3;

/* Define the union U_PERI_TIANLA_ADAC4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_ctrl8            : 8   ; /* [7..0]  */
        unsigned int    adac_ctrl9            : 8   ; /* [15..8]  */
        unsigned int    adac_ctrl10           : 8   ; /* [23..16]  */
        unsigned int    adac_ctrl11           : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC4;

/* Define the union U_PERI_TIANLA_ADAC5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    adac_ctrl12           : 8   ; /* [7..0]  */
        unsigned int    adac_ctrl13           : 8   ; /* [15..8]  */
        unsigned int    reserved_0            : 16  ; /* [31..16]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_TIANLA_ADAC5;

/* Define the union U_PERI_SOC_FUSE_3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dolby_flag            : 1   ; /* [0]  */
        unsigned int    soc_fuse_97           : 1   ; /* [1]  */
        unsigned int    dts_flag              : 1   ; /* [2]  */
        unsigned int    soc_fuse_103_99       : 5   ; /* [7..3]  */
        unsigned int    demux_sync_0          : 1   ; /* [8]  */
        unsigned int    demux_sync_1          : 1   ; /* [9]  */
        unsigned int    demux_sync_2          : 1   ; /* [10]  */
        unsigned int    soc_fuse_111_107      : 5   ; /* [15..11]  */
        unsigned int    otp_qam_b_disable     : 1   ; /* [16]  */
        unsigned int    otp_qam_c_disable     : 1   ; /* [17]  */
        unsigned int    otp_qam_s_disable     : 1   ; /* [18]  */
        unsigned int    otp_qam_x_disable     : 1   ; /* [19]  */
        unsigned int    otp_qam_i_disable     : 1   ; /* [20]  */
        unsigned int    otp_qam_t_disable     : 1   ; /* [21]  */
        unsigned int    soc_fuse_127_118      : 10  ; /* [31..22]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SOC_FUSE_3;

/* Define the union U_PERI_SOC_FUSE_0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    otp_control_cpu       : 1   ; /* [0]  */
        unsigned int    soc_fuse_11_1         : 11  ; /* [11..1]  */
        unsigned int    otp_ctrl_vdac         : 1   ; /* [12]  */
        unsigned int    soc_fuse_15_13        : 3   ; /* [15..13]  */
        unsigned int    chip_id               : 5   ; /* [20..16]  */
        unsigned int    soc_fuse_21           : 1   ; /* [21]  */
        unsigned int    soc_fuse_23_22        : 2   ; /* [23..22]  */
        unsigned int    mven                  : 1   ; /* [24]  */
        unsigned int    soc_fuse_31_25        : 7   ; /* [31..25]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SOC_FUSE_0;

/* Define the union U_PERI_FEPHY_LDO_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 4   ; /* [3..0]  */
        unsigned int    fephy_ldo_en          : 1   ; /* [4]  */
        unsigned int    fephy_ldo_enz         : 1   ; /* [5]  */
        unsigned int    fephy_ldo_rstn        : 1   ; /* [6]  */
        unsigned int    fephy_iddq_mode       : 1   ; /* [7]  */
        unsigned int    reserved_1            : 24  ; /* [31..8]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_FEPHY_LDO_CTRL;

/* Define the union U_PERI_SOC_FUSE_1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    soc_fuse_36_32        : 5   ; /* [4..0]  */
        unsigned int    otp_ctrl_uart_mcu     : 1   ; /* [5]  */
        unsigned int    otp_ctrl_fephy        : 1   ; /* [6]  */
        unsigned int    otp_ctrl_usb2_2p      : 1   ; /* [7]  */
        unsigned int    romboot_sel_lock      : 1   ; /* [8]  */
        unsigned int    soc_fuse_51_41        : 11  ; /* [19..9]  */
        unsigned int    otp_ctrl_tsi          : 1   ; /* [20]  */
        unsigned int    otp_ctrl_tsi1         : 1   ; /* [21]  */
        unsigned int    otp_ctrl_tsi2         : 1   ; /* [22]  */
        unsigned int    otp_ctrl_tsi3         : 1   ; /* [23]  */
        unsigned int    soc_fuse_63_56        : 8   ; /* [31..24]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SOC_FUSE_1;

/* Define the union U_PERI_SOC_FUSE_2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    soc_fuse_64           : 1   ; /* [0]  */
        unsigned int    otp_vdh_h265          : 1   ; /* [1]  */
        unsigned int    soc_fuse_71_66        : 6   ; /* [7..2]  */
        unsigned int    otp_ctrl_suart        : 1   ; /* [8]  */
        unsigned int    otp_test_out_oen      : 1   ; /* [9]  */
        unsigned int    soc_fuse_86_74        : 13  ; /* [22..10]  */
        unsigned int    otp_ctrl_fsensor      : 1   ; /* [23]  */
        unsigned int    otp_ctrl_dig_sensor   : 1   ; /* [24]  */
        unsigned int    otp_ctrl_act_shield   : 1   ; /* [25]  */
        unsigned int    soc_fuse_91_90        : 2   ; /* [27..26]  */
        unsigned int    otp_sc300_24m_sel     : 1   ; /* [28]  */
        unsigned int    soc_fuse_93           : 1   ; /* [29]  */
        unsigned int    otp_ctrl_sfd_sensor   : 1   ; /* [30]  */
        unsigned int    otp_ctrl_pe_sensor    : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_SOC_FUSE_2;

/* Define the union U_PERI_QOS_AXIBUS */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    priority_bus_media2   : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    priority_bus_ahb      : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    priority_bus_sha3     : 2   ; /* [9..8]  */
        unsigned int    priority_bus_jpgd     : 2   ; /* [11..10]  */
        unsigned int    priority_bus_demo     : 2   ; /* [13..12]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_QOS_AXIBUS;

/* Define the union U_PERI_RAM_CFG */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    rfs_ema               : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    rfs_emaw              : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ras_ema               : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    ras_emaw              : 2   ; /* [13..12]  */
        unsigned int    reserved_3            : 2   ; /* [15..14]  */
        unsigned int    rft_emaa              : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    rft_emab              : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    rft_emasa             : 1   ; /* [24]  */
        unsigned int    rft_colldisn          : 1   ; /* [25]  */
        unsigned int    reserved_6            : 2   ; /* [27..26]  */
        unsigned int    ros_ema               : 3   ; /* [30..28]  */
        unsigned int    ram_ck_gt_en          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PERI_RAM_CFG;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_START_MODE           START_MODE                       ; /* 0x0 */
    volatile U_PERI_REMAP           PERI_REMAP                       ; /* 0x4 */
    volatile U_PERI_CTRL            PERI_CTRL                        ; /* 0x8 */
    volatile U_PERI_CPU_STAT        PERI_CPU_STAT                    ; /* 0xc */
    volatile U_CPU_SET              CPU_SET                          ; /* 0x10 */
    volatile unsigned int           reserved_0[12]                   ; /* 0x14~0x40 */
    volatile U_PERI_QOS_CFG0        PERI_QOS_CFG0                    ; /* 0x44 */
    volatile U_PERI_QOS_CFG1        PERI_QOS_CFG1                    ; /* 0x48 */
    volatile U_PERI_QOS_CFG2        PERI_QOS_CFG2                    ; /* 0x4c */
    volatile U_PERI_QOS_CFG3        PERI_QOS_CFG3                    ; /* 0x50 */
    volatile U_PERI_QOS_CFG4        PERI_QOS_CFG4                    ; /* 0x54 */
    volatile U_PERI_QOS_CFG5        PERI_QOS_CFG5                    ; /* 0x58 */
    volatile U_PERI_QOS_CFG6        PERI_QOS_CFG6                    ; /* 0x5c */
    volatile U_PERI_QOS_CFG7        PERI_QOS_CFG7                    ; /* 0x60 */
    volatile unsigned int           reserved_1[20]                   ; /* 0x64~0xb0 */
    volatile U_PERI_USB_RESUME_INT_MASK   PERI_USB_RESUME_INT_MASK         ; /* 0xb4 */
    volatile U_PERI_USB_RESUME_INT_RAWSTAT   PERI_USB_RESUME_INT_RAWSTAT      ; /* 0xb8 */
    volatile U_PERI_USB_RESUME_INT_STAT   PERI_USB_RESUME_INT_STAT         ; /* 0xbc */
    volatile U_PERI_INT_A9TOMCE     PERI_INT_A9TOMCE                 ; /* 0xc0 */
    volatile unsigned int           reserved_2[15]                   ; /* 0xc4~0xfc */
    volatile U_PERI_QAM             PERI_QAM                         ; /* 0x100 */
    volatile U_PERI_QAM_ADC0        PERI_QAM_ADC0                    ; /* 0x104 */
    volatile unsigned int           reserved_3[2]                    ; /* 0x108~0x10c */
    volatile U_PERI_TIANLA_ADAC0    PERI_TIANLA_ADAC0                ; /* 0x110 */
    volatile U_PERI_TIANLA_ADAC1    PERI_TIANLA_ADAC1                ; /* 0x114 */
    volatile U_PERI_FEPHY           PERI_FEPHY                       ; /* 0x118 */
    volatile unsigned int           reserved_4[4]                    ; /* 0x11c~0x128 */
    volatile U_PERI_USB3            PERI_USB3                        ; /* 0x12c */
    volatile unsigned int           reserved_5[8]                    ; /* 0x130~0x14c */
    volatile U_PERI_USB2PHY_TEST0   PERI_USB2PHY_TEST0               ; /* 0x150 */
    volatile unsigned int           reserved_6[3]                    ; /* 0x154~0x15c */
    volatile U_PERI_TIANLA_ADAC2    PERI_TIANLA_ADAC2                ; /* 0x160 */
    volatile U_PERI_TIANLA_ADAC3    PERI_TIANLA_ADAC3                ; /* 0x164 */
    volatile U_PERI_TIANLA_ADAC4    PERI_TIANLA_ADAC4                ; /* 0x168 */
    volatile U_PERI_TIANLA_ADAC5    PERI_TIANLA_ADAC5                ; /* 0x16c */
    volatile unsigned int           reserved_7[28]                   ; /* 0x170~0x1dc */
    volatile U_PERI_SOC_FUSE_3      CHIPSET_INFO                     ; /* 0x1e0 */
    volatile unsigned int           reserved_8[3]                    ; /* 0x1e4~0x1ec */
    volatile unsigned int           PERI_SW_SET                      ; /* 0x1f0 */
    volatile unsigned int           reserved_9[403]                  ; /* 0x1f4~0x83c */
    volatile U_PERI_SOC_FUSE_0      PERI_SOC_FUSE_0                  ; /* 0x840 */
    volatile U_PERI_FEPHY_LDO_CTRL   PERI_FEPHY_LDO_CTRL             ; /* 0x844 */
    volatile unsigned int           reserved_10[10]                  ; /* 0x848~0x86c */
    volatile U_PERI_SOC_FUSE_1      PERI_SOC_FUSE_1                  ; /* 0x870 */
    volatile U_PERI_SOC_FUSE_2      PERI_SOC_FUSE_2                  ; /* 0x874 */
    volatile unsigned int           reserved_11[21]                  ; /* 0x878~0x8c8 */
    volatile U_PERI_QOS_AXIBUS      PERI_QOS_AXIBUS                  ; /* 0x8cc */
    volatile unsigned int           reserved_12[20]                  ; /* 0x8d0~0x91c */
    volatile unsigned int           PERI_ECO_VERSION                 ; /* 0x920 */
    volatile unsigned int           reserved_13[2]                   ; /* 0x924~0x928 */
    volatile U_PERI_RAM_CFG         PERI_RAM_CFG                     ; /* 0x92c */

} S_PERICTRL_REGS_TYPE;

#endif /* __HI_REG_PERI_H__ */
