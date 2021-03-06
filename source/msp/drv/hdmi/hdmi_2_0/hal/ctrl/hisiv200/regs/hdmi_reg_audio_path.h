// ******************************************************************************
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co. Ltd.
// File name     :  audio_path_reg_c_union_define.h
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  sdk
// Version       :  1.0
// Date          :  Tester
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  sdk 2015/05/23 11:11:23 Create file
// ******************************************************************************

#ifndef __AUDIO_PATH_REG_C_UNION_DEFINE_H__
#define __AUDIO_PATH_REG_C_UNION_DEFINE_H__

#include "hi_type.h"
#include "hdmi_hal_ctrl.h"

/* Define the union U_TX_AUDIO_CTRL */
/* Define the union U_TX_AUDIO_CTRL,ATTR:,ADDR:1000,INIT:000E4001,MASK:ff7f7,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aud_in_en     : 1  ; /* [0] */
        unsigned int    aud_mute_en   : 1  ; /* [1] */
        unsigned int    aud_layout    : 1  ; /* [2] */
        unsigned int    rsv_0         : 1  ; /* [3] */
        unsigned int    aud_i2s_en    : 4  ; /* [7:4] */
        unsigned int    aud_spdif_en  : 1  ; /* [8] */
        unsigned int    aud_src_en    : 1  ; /* [9] */
        unsigned int    aud_src_ctrl  : 1  ; /* [10] */
        unsigned int    rsv_1         : 1  ; /* [11] */
        unsigned int    aud_fifo0_map : 2  ; /* [13:12] */
        unsigned int    aud_fifo1_map : 2  ; /* [15:14] */
        unsigned int    aud_fifo2_map : 2  ; /* [17:16] */
        unsigned int    aud_fifo3_map : 2  ; /* [19:18] */
        unsigned int    rsv_2         : 12  ; /* [31:20] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_TX_AUDIO_CTRL;

/* Define the union U_AUD_I2S_CTRL */
/* Define the union U_AUD_I2S_CTRL,ATTR:,ADDR:1004,INIT:00000B00,MASK:ff3f,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    i2s_hbra_on     : 1  ; /* [0] */
        unsigned int    i2s_1st_shift   : 1  ; /* [1] */
        unsigned int    i2s_ws_polarity : 1  ; /* [2] */
        unsigned int    i2s_justify     : 1  ; /* [3] */
        unsigned int    i2s_data_dir    : 1  ; /* [4] */
        unsigned int    i2s_vbit        : 1  ; /* [5] */
        unsigned int    rsv_3           : 2  ; /* [7:6] */
        unsigned int    i2s_length      : 4  ; /* [11:8] */
        unsigned int    i2s_ch_swap     : 4  ; /* [15:12] */
        unsigned int    rsv_4           : 16  ; /* [31:16] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_I2S_CTRL;

/* Define the union U_AUD_SPDIF_CTRL */
/* Define the union U_AUD_SPDIF_CTRL,ATTR:,ADDR:1008,INIT:00904084,MASK:fffffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    spdif_1ui_lock   : 1  ; /* [0] */
        unsigned int    spdif_2ui_lock   : 1  ; /* [1] */
        unsigned int    i2s_cbit_order   : 1  ; /* [2] */
        unsigned int    spdif_fs_ovr_en  : 1  ; /* [3] */
        unsigned int    spdif_err_thresh : 6  ; /* [9:4] */
        unsigned int    spdif_size_sw    : 2  ; /* [11:10] */
        unsigned int    spdif_1ui_max    : 8  ; /* [19:12] */
        unsigned int    spdif_2ui_max    : 8  ; /* [27:20] */
        unsigned int    rsv_5            : 4  ; /* [31:28] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_SPDIF_CTRL;

/* Define the union U_AUD_CHST_CFG0 */
/* Define the union U_AUD_CHST_CFG0,ATTR:,ADDR:100C,INIT:00000000,MASK:ffffffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    chst_byte0_a              : 1  ; /* [0] */
        unsigned int    chst_byte0_b              : 1  ; /* [1] */
        unsigned int    chst_byte0_other          : 6  ; /* [7:2] */
        unsigned int    chst_byte1                : 8  ; /* [15:8] */
        unsigned int    chst_byte2                : 8  ; /* [23:16] */
        unsigned int    chst_byte3_fs             : 4  ; /* [27:24] */
        unsigned int    chst_byte3_clock_accuracy : 4  ; /* [31:28] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_CHST_CFG0;

/* Define the union U_AUD_CHST_CFG1 */
/* Define the union U_AUD_CHST_CFG1,ATTR:,ADDR:1010,INIT:0000000B,MASK:ffffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    chst_byte4_length : 4  ; /* [3:0] */
        unsigned int    chst_byte4_org_fs : 4  ; /* [7:4] */
        unsigned int    chst_byte5_6  : 16  ; /* [23:8] */
        unsigned int    rsv_6             : 8  ; /* [31:24] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_CHST_CFG1;

/* Define the union U_TX_AUDIO_STATE */
/* Define the union U_TX_AUDIO_STATE,ATTR:,ADDR:1014,INIT:00000000,MASK:ffff3ff3,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aud_inavailable  : 1  ; /* [0] */
        unsigned int    aud_spdif_new_fs : 1  ; /* [1] */
        unsigned int    rsv_7            : 2  ; /* [3:2] */
        unsigned int    aud_length       : 4  ; /* [7:4] */
        unsigned int    aud_spdif_fs     : 6  ; /* [13:8] */
        unsigned int    rsv_8            : 2  ; /* [15:14] */
        unsigned int    spdif_max_1ui_st : 8  ; /* [23:16] */
        unsigned int    spdif_max_2ui_st : 8  ; /* [31:24] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_TX_AUDIO_STATE;

/* Define the union U_AUD_FIFO_CTRL */
/* Define the union U_AUD_FIFO_CTRL,ATTR:,ADDR:1018,INIT:00000001,MASK:3f1f1f,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    aud_fifo_test     : 5  ; /* [4:0] */
        unsigned int    rsv_9             : 3  ; /* [7:5] */
        unsigned int    aud_fifo_hbr_mask : 4  ; /* [11:8] */
        unsigned int    rsv_10            : 4  ; /* [15:12] */
        unsigned int    aud_fifo_ptr_diff : 6  ; /* [21:16] */
        unsigned int    rsv_11            : 10  ; /* [31:22] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_FIFO_CTRL;

/* Define the union U_AUD_ACR_CTRL */
/* Define the union U_AUD_ACR_CTRL,ATTR:,ADDR:1040,INIT:00000005,MASK:1f,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    acr_cts_req_en    : 1  ; /* [0] */
        unsigned int    acr_cts_hw_sw_sel : 1  ; /* [1] */
        unsigned int    acr_cts_gen_sel   : 1  ; /* [2] */
        unsigned int    acr_cts_flt_en    : 1  ; /* [3] */
        unsigned int    acr_use_sw_cts    : 1  ; /* [4] */
        unsigned int    acr_cts_ave_en    : 1  ; /* [5] */
        unsigned int    rsv_12            : 26  ; /* [31:6] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_ACR_CTRL;

/* Define the union U_AUD_ACR_CFG */
/* Define the union U_AUD_ACR_CFG,ATTR:,ADDR:1044,INIT:00001040,MASK:ffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    acr_fm_val_sw    : 3  ; /* [2:0] */
        unsigned int    acr_ave_max      : 5  ; /* [7:3] */
        unsigned int    acr_cts_thre     : 8  ; /* [15:8] */
        unsigned int    acr_cts_chg_thre : 8  ; /* [23:16] */
        unsigned int    rsv_13           : 8  ; /* [31:24] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_AUD_ACR_CFG;

/* Define the union U_ACR_N_VAL_SW */
/* Define the union U_ACR_N_VAL_SW,ATTR:,ADDR:1048,INIT:00000000,MASK:fffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    acr_n_val_sw : 20  ; /* [19:0] */
        unsigned int    rsv_14       : 12  ; /* [31:20] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ACR_N_VAL_SW;

/* Define the union U_ACR_CTS_VAL_SW */
/* Define the union U_ACR_CTS_VAL_SW,ATTR:,ADDR:104C,INIT:00000000,MASK:fffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    acr_cts_val_sw : 20  ; /* [19:0] */
        unsigned int    rsv_15         : 12  ; /* [31:20] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ACR_CTS_VAL_SW;

/* Define the union U_ACR_CTS_VAL_HW */
/* Define the union U_ACR_CTS_VAL_HW,ATTR:,ADDR:1050,INIT:00000000,MASK:fffff,CMMNT:*/
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    acr_cts_val_hw : 20  ; /* [19:0] */
        unsigned int    rsv_16         : 12  ; /* [31:20] */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ACR_CTS_VAL_HW;


//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_TX_AUDIO_CTRL  TX_AUDIO_CTRL  ; /* 1000 */
    volatile U_AUD_I2S_CTRL   AUD_I2S_CTRL   ; /* 1004 */
    volatile U_AUD_SPDIF_CTRL AUD_SPDIF_CTRL ; /* 1008 */
    volatile U_AUD_CHST_CFG0  AUD_CHST_CFG0  ; /* 100C */
    volatile U_AUD_CHST_CFG1  AUD_CHST_CFG1  ; /* 1010 */
    volatile U_TX_AUDIO_STATE TX_AUDIO_STATE ; /* 1014 */
    volatile U_AUD_FIFO_CTRL  AUD_FIFO_CTRL  ; /* 1018 */
    unsigned int                       Reserved_0[9];
    volatile U_AUD_ACR_CTRL   AUD_ACR_CTRL   ; /* 1040 */
    volatile U_AUD_ACR_CFG    AUD_ACR_CFG    ; /* 1044 */
    volatile U_ACR_N_VAL_SW   ACR_N_VAL_SW   ; /* 1048 */
    volatile U_ACR_CTS_VAL_SW ACR_CTS_VAL_SW ; /* 104C */
    volatile U_ACR_CTS_VAL_HW ACR_CTS_VAL_HW ; /* 1050 */

} S_audio_path_reg_REGS_TYPE;

/* Declare the struct pointor of the module audio_path_reg */
//extern volatile S_audio_path_reg_REGS_TYPE *gopaudio_path_regAllReg;

int HDMI_TX_S_audio_path_reg_REGS_TYPE_Init(HI_VOID);
int HDMI_TX_S_audio_path_reg_REGS_TYPE_DeInit(HI_VOID);

int HDMI_TX_AUDIO_CTRL_aud_in_enSet(unsigned int uaud_in_en);
int HDMI_TX_AUDIO_CTRL_aud_layoutSet(unsigned int uaud_layout);

int HDMI_AUD_I2S_CTRL_i2s_hbra_onGet(HI_VOID);

int HDMI_TX_AUDIO_CTRL_aud_layoutGet(HI_VOID);
int HDMI_TX_AUDIO_CTRL_aud_in_enGet(HI_VOID);
int HDMI_TX_AUDIO_CTRL_aud_mute_enGet(HI_VOID);
int HDMI_TX_AUDIO_CTRL_aud_i2s_enGet(HI_VOID);
int HDMI_TX_AUDIO_CTRL_aud_spdif_enGet(HI_VOID);

int HDMI_AUD_CHST_CFG0_chst_byte3_fsGet(HI_VOID);
int HDMI_AUD_CHST_CFG1_chst_byte4_org_fsGet(HI_VOID);
int HDMI_AUD_CHST_CFG1_chst_byte4_lengthGet(HI_VOID);

int HDMI_TX_AUDIO_STATE_aud_lengthGet(HI_VOID);
int HDMI_TX_AUDIO_STATE_aud_spdif_fsGet(HI_VOID);

int HDMI_AUD_ACR_CTRL_acr_cts_hw_sw_selSet(unsigned int uacr_cts_hw_sw_sel);
int HDMI_ACR_CTS_VAL_SW_acr_cts_val_swSet(unsigned int uacr_cts_val_sw);
int HDMI_ACR_N_VAL_SW_acr_n_val_swGet(HI_VOID);
int HDMI_ACR_N_VAL_SW_acr_n_val_swSet(unsigned int uacr_n_val_sw);
int HDMI_ACR_CTS_VAL_SW_acr_cts_val_swGet(HI_VOID);
int HDMI_ACR_CTS_VAL_HW_acr_cts_val_hwGet(HI_VOID);

int HDMI_AUD_CtsGet(HI_U32 *pu32HwCts,HI_U32 *pu32SwCts,HI_BOOL *pbSw);
HI_VOID HDMI_TX_AUDIO_IntfSet(CTRL_AUDIO_EN_S *pstAudioEn);
HI_VOID HDMI_AUD_I2S_CtrlSet(CTRL_I2S_CTRL_S *pstI2sCtrl);
HI_VOID HDMI_AUD_CHST_StatusSet(CTRL_I2S_STATUS_S *pstI2sStatus);
HI_VOID HDMI_AUD_FIFO_CtrlSet(CTRL_FIFO_CTRL_S *pstFifoCtrl);

#endif // __AUDIO_PATH_REG_C_UNION_DEFINE_H__
