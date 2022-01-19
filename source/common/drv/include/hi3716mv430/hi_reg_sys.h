// ******************************************************************************
// Copyright     :  Copyright (C) 2017, Hisilicon Technologies Co. Ltd.
// File name     :  hi_reg_sys.h
// Project line  :  媒体产品线
// Department    :  STB开发部
// Author        :
// Version       :  1.0
// Date          :  2013/1/17
// Description   :  项目描述信息
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  2017/11/21 20:56:50 Create file
// ******************************************************************************

#ifndef __HI_REG_SYS_H__
#define __HI_REG_SYS_H__

/* Define the union U_SC_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_bus_clk_sel       : 2   ; /* [1..0]  */
        unsigned int    mcu_bus_clk_sele_stat : 2   ; /* [3..2]  */
        unsigned int    sc_ctrl               : 28  ; /* [31..4]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_CTRL;

/* Define the union U_SC_POWER_STAT */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    power_state           : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_POWER_STAT;

/* Define the union U_SC_MEM_CTRL */
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
        unsigned int    reserved_6            : 5   ; /* [30..26]  */
        unsigned int    ram_ck_gt_en          : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MEM_CTRL;

/* Define the union U_SC_IO_CFG0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    uart_rx_sel           : 3   ; /* [2..0]  */
        unsigned int    uart_tx_sel           : 3   ; /* [5..3]  */
        unsigned int    clk_gpio_sel          : 2   ; /* [7..6]  */
        unsigned int    data_gpio_sel         : 2   ; /* [9..8]  */
        unsigned int    key_gpio_sel          : 2   ; /* [11..10]  */
        unsigned int    ir_gpio_sel           : 1   ; /* [12]  */
        unsigned int    stb_gpio_sel          : 1   ; /* [13]  */
        unsigned int    stbn_gpio_sel         : 2   ; /* [15..14]  */
        unsigned int    rst_gpio_sel          : 2   ; /* [17..16]  */
        unsigned int    tuner_gpio_sel        : 1   ; /* [18]  */
        unsigned int    reserved_0            : 2   ; /* [20..19]  */
        unsigned int    hdmitx_hotplug_sel    : 1   ; /* [21]  */
        unsigned int    hdmitx_sda_sel        : 1   ; /* [22]  */
        unsigned int    hdmitx_scl_sel        : 1   ; /* [23]  */
        unsigned int    hdmitx_cec_sel        : 1   ; /* [24]  */
        unsigned int    stb_pwroff_n_out_ctrl : 1   ; /* [25]  */
        unsigned int    lsadc0_sel            : 3   ; /* [28..26]  */
        unsigned int    reserved_1            : 3   ; /* [31..29]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_IO_CFG0;

/* Define the union U_SC_IO_CFG1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    reserved_0            : 8   ; /* [7..0]  */
        unsigned int    s_led_data_ds         : 3   ; /* [10..8]  */
        unsigned int    reserved_1            : 1   ; /* [11]  */
        unsigned int    s_stb_pwroff_n_ds     : 3   ; /* [14..12]  */
        unsigned int    reserved_2            : 1   ; /* [15]  */
        unsigned int    s_gpio_stb5_ds        : 3   ; /* [18..16]  */
        unsigned int    reserved_3            : 1   ; /* [19]  */
        unsigned int    s_clk_tuner_o_ds      : 2   ; /* [21..20]  */
        unsigned int    reserved_4            : 1   ; /* [22]  */
        unsigned int    s_clk_tuner_o_sr      : 1   ; /* [23]  */
        unsigned int    s_rstn_in_pu          : 1   ; /* [24]  */
        unsigned int    reserved_5            : 1   ; /* [25]  */
        unsigned int    s_hdmitx_cec_ds       : 2   ; /* [27..26]  */
        unsigned int    s_hdmitx_cec_sw       : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_IO_CFG1;

/* Define the union U_SC_LOW_POWER_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    bus_discon_timeout_clr : 1   ; /* [0]  */
        unsigned int    reserved_0            : 2   ; /* [2..1]  */
        unsigned int    mcu_lp_subsys_iso     : 1   ; /* [3]  */
        unsigned int    sys_power_status      : 4   ; /* [7..4]  */
        unsigned int    reserved_1            : 8   ; /* [15..8]  */
        unsigned int    cpu_standbywfi        : 2   ; /* [17..16]  */
        unsigned int    reserved_2            : 2   ; /* [19..18]  */
        unsigned int    cpu_standbywfil2      : 1   ; /* [20]  */
        unsigned int    reserved_3            : 11  ; /* [31..21]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_LOW_POWER_CTRL;

/* Define the union U_SC_MCU_CRG_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mce_cken              : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ir_cken               : 1   ; /* [4]  */
        unsigned int    ir_srst_req           : 1   ; /* [5]  */
        unsigned int    mcu_timers_cken       : 1   ; /* [6]  */
        unsigned int    mcu_timers_srst_req   : 1   ; /* [7]  */
        unsigned int    led_cken              : 1   ; /* [8]  */
        unsigned int    led_srst_req          : 1   ; /* [9]  */
        unsigned int    reserved_1            : 2   ; /* [11..10]  */
        unsigned int    uart_aon_cken         : 1   ; /* [12]  */
        unsigned int    uart_aon_srst_req     : 1   ; /* [13]  */
        unsigned int    reserved_2            : 5   ; /* [18..14]  */
        unsigned int    hdmi_cec_cken         : 1   ; /* [19]  */
        unsigned int    hdmi_cec_srst_req     : 1   ; /* [20]  */
        unsigned int    hdmi_osc_cken         : 1   ; /* [21]  */
        unsigned int    hdmi_apb_cken         : 1   ; /* [22]  */
        unsigned int    hdmi_bus_srst_req     : 1   ; /* [23]  */
        unsigned int    hdmi_srst_req         : 1   ; /* [24]  */
        unsigned int    tuner_cken            : 1   ; /* [25]  */
        unsigned int    tuner_clk_sel         : 2   ; /* [27..26]  */
        unsigned int    reserved_3            : 1   ; /* [28]  */
        unsigned int    uart_sel              : 1   ; /* [29]  */
        unsigned int    lsadc_cken            : 1   ; /* [30]  */
        unsigned int    lsadc_srst_req        : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MCU_CRG_CTRL;

/* Define the union U_SC_WDG_RST_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    wdg_rst_ctrl          : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_WDG_RST_CTRL;

/* Define the union U_SC_DDRPHY_LP_EN */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddrphy0_lp_en         : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 30  ; /* [31..2]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_DDRPHY_LP_EN;

/* Define the union U_SC_MCU_LDO_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    mcu_ldo_vset          : 4   ; /* [3..0]  */
        unsigned int    mcu_ldo_fuse          : 4   ; /* [7..4]  */
        unsigned int    mcu_ldo_enz           : 1   ; /* [8]  */
        unsigned int    reserved_0            : 23  ; /* [31..9]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_MCU_LDO_CTRL;

/* Define the union U_SC_LSADC_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    lsadc0_en             : 1   ; /* [0]  */
        unsigned int    lsadc1_en             : 1   ; /* [1]  */
        unsigned int    lsadc2_en             : 1   ; /* [2]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    lsadc_reg             : 4   ; /* [7..4]  */
        unsigned int    lsadc_pd_ctrl         : 1   ; /* [8]  */
        unsigned int    lsadc_reset           : 1   ; /* [9]  */
        unsigned int    reserved_1            : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_LSADC_CTRL;

/* Define the union U_SC_LSADC_DATA */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    lsadc_rdata_a         : 10  ; /* [9..0]  */
        unsigned int    reserved_0            : 6   ; /* [15..10]  */
        unsigned int    lsadc_rdata_b         : 10  ; /* [25..16]  */
        unsigned int    reserved_1            : 6   ; /* [31..26]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_LSADC_DATA;

/* Define the union U_SC_LSADC_DATA1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    lsadc_rdata_c         : 10  ; /* [9..0]  */
        unsigned int    reserved_0            : 22  ; /* [31..10]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SC_LSADC_DATA1;

/* Define the union U_DOLBY_CTRL */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    dolby_gen_lock        : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DOLBY_CTRL;

/* Define the union U_SMCU_FW_ADDRESS_LOCK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    smcu_fw_address_lock  : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_SMCU_FW_ADDRESS_LOCK;

/* Define the union U_DDR_PHY_PARA_LOCK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ddr_phy_para_lock     : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DDR_PHY_PARA_LOCK;

/* Define the union U_CAS_FW_LOADER_ADDR_LOCK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cas_fw_loader_addr_lock : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CAS_FW_LOADER_ADDR_LOCK;

/* Define the union U_CAS_FW_ADDRESS_LOCK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    cas_fw_address_lock   : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CAS_FW_ADDRESS_LOCK;

/* Define the union U_PCIE_BAK_REG_LOCK */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    pcie_bak_reg_lock     : 1   ; /* [0]  */
        unsigned int    reserved_0            : 31  ; /* [31..1]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_PCIE_BAK_REG_LOCK;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_SC_CTRL              SC_CTRL                          ; /* 0x0 */
    volatile unsigned int           SC_SYSRES                        ; /* 0x4 */
    volatile U_SC_POWER_STAT        SC_POWER_STAT                    ; /* 0x8 */
    volatile U_SC_MEM_CTRL          SC_MEM_CTRL                      ; /* 0xc */
    volatile unsigned int           reserved_0[4]                    ; /* 0x10~0x1c */
    volatile U_SC_IO_CFG0           SC_IO_CFG0                       ; /* 0x20 */
    volatile U_SC_IO_CFG1           SC_IO_CFG1                       ; /* 0x24 */
    volatile unsigned int           reserved_1[2]                    ; /* 0x28~0x2c */
    volatile unsigned int           SC_BUS_CORE_PD_COUNT             ; /* 0x30 */
    volatile unsigned int           SC_CORE_PD_RST_COUNT             ; /* 0x34 */
    volatile unsigned int           SC_CORE_PWRUP_COUNT              ; /* 0x38 */
    volatile unsigned int           SC_CORE_PWRUP_RST_COUNT          ; /* 0x3c */
    volatile U_SC_LOW_POWER_CTRL    SC_LOW_POWER_CTRL                ; /* 0x40 */
    volatile unsigned int           reserved_2                       ; /* 0x44 */
    volatile U_SC_MCU_CRG_CTRL      SC_MCU_CRG_CTRL                  ; /* 0x48 */
    volatile unsigned int           reserved_3                       ; /* 0x4c */
    volatile U_SC_WDG_RST_CTRL      SC_WDG_RST_CTRL                  ; /* 0x50 */
    volatile unsigned int           reserved_4                       ; /* 0x54 */
    volatile U_SC_DDRPHY_LP_EN      SC_DDRPHY_LP_EN                  ; /* 0x58 */
    volatile unsigned int           reserved_5[3]                    ; /* 0x5c~0x64 */
    volatile U_SC_MCU_LDO_CTRL      SC_MCU_LDO_CTRL                  ; /* 0x68 */
    volatile U_SC_LSADC_CTRL        SC_LSADC_CTRL                    ; /* 0x6c */
    volatile U_SC_LSADC_DATA        SC_LSADC_DATA                    ; /* 0x70 */
    volatile U_SC_LSADC_DATA1       SC_LSADC_DATA1                   ; /* 0x74 */
    volatile unsigned int           reserved_6[2]                    ; /* 0x78~0x7c */
    volatile unsigned int           SC_GENm[24]                      ; /* 0x80~0xdc */
    volatile unsigned int           SC_GENx[8]                       ; /* 0xe0~0xfc */
    volatile unsigned int           reserved_7[67]                   ; /* 0x100~0x208 */
    volatile unsigned int           SC_LOCKEN                        ; /* 0x20c */
    volatile unsigned int           CPU_CEC_INFO_0                   ; /* 0x210 */
    volatile unsigned int           CPU_CEC_INFO_1                   ; /* 0x214 */
    volatile unsigned int           CPU_MCU_SWITCH_INFO              ; /* 0x218 */
    volatile unsigned int           CPU_HDMITX_RESERVED_0            ; /* 0x21c */
    volatile unsigned int           CPU_HDMITX_RESERVED_1            ; /* 0x220 */
    volatile unsigned int           CPU_HDMITX_RESERVED_2            ; /* 0x224 */
    volatile unsigned int           CPU_HDMITX_RESERVED_3            ; /* 0x228 */
    volatile unsigned int           CPU_HDMITX_RESERVED_4            ; /* 0x22c */
    volatile unsigned int           MCU_CEC_INFO_0                   ; /* 0x230 */
    volatile unsigned int           MCU_CEC_INFO_1                   ; /* 0x234 */
    volatile unsigned int           MCU_CPU_SWITCH_INFO              ; /* 0x238 */
    volatile unsigned int           MCU_HDMITX_RESERVED_0            ; /* 0x23c */
    volatile unsigned int           MCU_HDMITX_RESERVED_1            ; /* 0x240 */
    volatile unsigned int           MCU_HDMITX_RESERVED_2            ; /* 0x244 */
    volatile unsigned int           MCU_HDMITX_RESERVED_3            ; /* 0x248 */
    volatile unsigned int           MCU_HDMITX_RESERVED_4            ; /* 0x24c */
    volatile U_DOLBY_CTRL           DOLBY_CTRL                       ; /* 0x250 */
    volatile unsigned int           reserved_8[3]                    ; /* 0x254~0x25c */
    volatile unsigned int           DOLBY_GENn[12]                   ; /* 0x260~0x28c */
    volatile unsigned int           reserved_9[92]                   ; /* 0x290~0x3fc */
    volatile unsigned int           DDR_PHY_PARAa[128]               ; /* 0x400~0x5fc */
    volatile unsigned int           reserved_10[128]                 ; /* 0x600~0x7fc */
    volatile unsigned int           LPDS_OPER_DATAb[64]              ; /* 0x800~0x8fc */
    volatile unsigned int           reserved_11[64]                  ; /* 0x900~0x9fc */
    volatile unsigned int           SMCU_FW_ADDRESS_0                ; /* 0xa00 */
    volatile unsigned int           SMCU_FW_LENGTH_0                 ; /* 0xa04 */
    volatile unsigned int           LP_START                         ; /* 0xa08 */
    volatile unsigned int           reserved_12[61]                  ; /* 0xa0c~0xafc */
    volatile unsigned int           SMCU_FW_ADDRESS                  ; /* 0xb00 */
    volatile unsigned int           SMCU_FW_LENGTH                   ; /* 0xb04 */
    volatile unsigned int           SMCU_GEN0                        ; /* 0xb08 */
    volatile unsigned int           DDR_WAKEUP_FLAG                  ; /* 0xb0c */
    volatile unsigned int           reserved_13[4]                   ; /* 0xb10~0xb1c */
    volatile U_SMCU_FW_ADDRESS_LOCK   SMCU_FW_ADDRESS_LOCK             ; /* 0xb20 */
    volatile unsigned int           reserved_14[3]                   ; /* 0xb24~0xb2c */
    volatile U_DDR_PHY_PARA_LOCK    DDR_PHY_PARA_LOCK                ; /* 0xb30 */
    volatile unsigned int           reserved_15[3]                   ; /* 0xb34~0xb3c */
    volatile U_CAS_FW_LOADER_ADDR_LOCK   CAS_FW_LOADER_ADDR_LOCK          ; /* 0xb40 */
    volatile U_CAS_FW_ADDRESS_LOCK   CAS_FW_ADDRESS_LOCK              ; /* 0xb44 */
    volatile unsigned int           reserved_16[2]                   ; /* 0xb48~0xb4c */
    volatile U_PCIE_BAK_REG_LOCK    PCIE_BAK_REG_LOCK                ; /* 0xb50 */
    volatile unsigned int           reserved_17[11]                  ; /* 0xb54~0xb7c */
    volatile unsigned int           CAS_FW_LOADER_ADDR               ; /* 0xb80 */
    volatile unsigned int           CAS_FW_LOADER_LEN                ; /* 0xb84 */
    volatile unsigned int           SCPU_GEN2                        ; /* 0xb88 */
    volatile unsigned int           SCPU_GEN3                        ; /* 0xb8c */
    volatile unsigned int           CAS_FW_ADDRESS                   ; /* 0xb90 */
    volatile unsigned int           CAS_FW_LENGTH                    ; /* 0xb94 */
    volatile unsigned int           SCPU_GEN6                        ; /* 0xb98 */
    volatile unsigned int           SCPU_GEN7                        ; /* 0xb9c */
    volatile unsigned int           reserved_18[8]                   ; /* 0xba0~0xbbc */
    volatile unsigned int           PCIE_SYS_STATE_SHW7              ; /* 0xbc0 */
    volatile unsigned int           PCIE_SYS_STATE_SHW8              ; /* 0xbc4 */
    volatile unsigned int           PCIE_SYS_STATE_SHW9              ; /* 0xbc8 */
    volatile unsigned int           reserved_19[13]                  ; /* 0xbcc~0xbfc */
    volatile unsigned int           NONCE_0                          ; /* 0xc00 */
    volatile unsigned int           NONCE_1                          ; /* 0xc04 */
    volatile unsigned int           NONCE_2                          ; /* 0xc08 */
    volatile unsigned int           NONCE_3                          ; /* 0xc0c */
    volatile unsigned int           reserved_20[177]                 ; /* 0xc10~0xed0 */
    volatile unsigned int           DDRCA_RANDOM0_DDRC               ; /* 0xed4 */
    volatile unsigned int           DDRCA_RANDOM1_DDRC               ; /* 0xed8 */
    volatile unsigned int           reserved_21                      ; /* 0xedc */
    volatile unsigned int           SC_SYSID                         ; /* 0xee0 */
    volatile unsigned int           reserved_22[7]                   ; /* 0xee4~0xefc */
    volatile unsigned int           SC_GENy[32]                      ; /* 0xf00~0xf7c */

} S_SYSCTRL_REGS_TYPE;


#endif /* __C_UNION_DEFINE_H__ */
