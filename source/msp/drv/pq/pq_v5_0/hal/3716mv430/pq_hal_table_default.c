/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_table_default.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2015/10/30
  Description   :

******************************************************************************/

#include "hi_drv_pq.h"
#include "pq_hal_table_default.h"

static PQ_PHY_REG_S sg_stPhyRegDefault[PHY_REG_MAX] =
{
    /*Addr         Lsb       Msb  SourceMode  OutputMode   Module     Value        Description*/

    /***********************************************DEI***********************************************/
    /*vpss_diectrl*/
    {0xb900,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       64},    //edge_smooth_ratio
    {0xb900,        17,     17,     0,      0,      HI_PQ_MODULE_DEI,       0},     //die_rst
    {0xb900,        18,     18,     0,      0,      HI_PQ_MODULE_DEI,       0},     //mchdir_c
    {0xb900,        19,     19,     0,      0,      HI_PQ_MODULE_DEI,       0},     //mchdir_l
    {0xb900,        20,     20,     0,      0,      HI_PQ_MODULE_DEI,       0},     //edge_smooth_en
    {0xb900,        21,     21,     0,      0,      HI_PQ_MODULE_DEI,       1},     //ma_only
    {0xb900,        22,     22,     0,      0,      HI_PQ_MODULE_DEI,       0},     //mc_only
    {0xb900,        23,     23,     0,      0,      HI_PQ_MODULE_DEI,       0},     //two_four_pxl_share
    {0xb900,        24,     25,     0,      0,      HI_PQ_MODULE_DEI,       1},     //die_c_mode
    {0xb900,        26,     27,     0,      0,      HI_PQ_MODULE_DEI,       1},     //die_l_mode
    {0xb900,        28,     28,     0,      0,      HI_PQ_MODULE_DEI,       0},     //die_out_sel_c
    {0xb900,        29,     29,     0,      0,      HI_PQ_MODULE_DEI,       0},     //die_out_sel_l
    /*vpss_dielma2*/
    {0xb904,        1,      1,      0,      0,      HI_PQ_MODULE_DEI,       1},     //frame_motion_smooth_en
    {0xb904,        2,      2,      0,      0,      HI_PQ_MODULE_DEI,       1},     //luma_scesdf_max
    {0xb904,        4,      4,      0,      0,      HI_PQ_MODULE_DEI,       1},     //motion_iir_en
    {0xb904,        5,      5,      0,      0,      HI_PQ_MODULE_DEI,       0},     //luma_mf_max
    {0xb904,        6,      6,      0,      0,      HI_PQ_MODULE_DEI,       0},     //chroma_mf_max
    {0xb904,        7,      7,      0,      0,      HI_PQ_MODULE_DEI,       1},     //rec_mode_en
    {0xb904,        8,      23,     0,      0,      HI_PQ_MODULE_DEI,       0},     //dei_st_rst_value
    {0xb904,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       8},     //chroma_mf_offset
    /*vpss_dieinten*/
    {0xb908,        0,      1,      0,      0,      HI_PQ_MODULE_DEI,       0},     //rec_mode_set_pre_info_mode
    {0xb908,        2,      2,      0,      0,      HI_PQ_MODULE_DEI,       0},     //rec_mode_output_mode
    {0xb908,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       2},     //dir_ratio_north
    {0xb908,        16,     31,     0,      0,      HI_PQ_MODULE_DEI,       0},     //min_north_strength
    /*vpss_diescale*/
    {0xb90c,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       8},     //range_scale
    /*vpss_diecheck1*/
    {0xb910,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       30},    //bc1_max_dz
    {0xb910,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       2},     //bc1_autodz_gain
    {0xb910,        16,     19,     0,      0,      HI_PQ_MODULE_DEI,       4},     //bc1_gain
    /*vpss_diecheck2*/
    {0xb914,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       30},    //bc2_max_dz
    {0xb914,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       2},     //bc2_autodz_gain
    {0xb914,        16,     19,     0,      0,      HI_PQ_MODULE_DEI,       4},     //bc2_gain
    /*vpss_diedir0_3*/
    {0xb918,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       16},    //dir0_scale
    {0xb918,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir1_scale
    {0xb918,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir2_scale
    {0xb918,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir3_scale
    /*vpss_diedir4_7*/
    {0xb91c,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       16},    //dir4_scale
    {0xb91c,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir5_scale
    {0xb91c,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir6_scale
    {0xb91c,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir7_scale
    /*vpss_diedir8_11*/
    {0xb920,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       16},    //dir8_scale
    {0xb920,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir9_scale
    {0xb920,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir10_scale
    {0xb920,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       16},    //dir11_scale
    /*vpss_diedir12_14*/
    {0xb924,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       0},     //dir12_scale
    {0xb924,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       0},     //dir13_scale
    {0xb924,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       0},     //dir14_scale
    /*vpss_dieintpscl0*/
    {0xb92c,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       5},     //intp_scale_ratio_1
    {0xb92c,        4,      7,      0,      0,      HI_PQ_MODULE_DEI,       5},     //intp_scale_ratio_2
    {0xb92c,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       5},     //intp_scale_ratio_3
    {0xb92c,        12,     15,     0,      0,      HI_PQ_MODULE_DEI,       6},     //intp_scale_ratio_4
    {0xb92c,        16,     19,     0,      0,      HI_PQ_MODULE_DEI,       6},     //intp_scale_ratio_5
    {0xb92c,        20,     23,     0,      0,      HI_PQ_MODULE_DEI,       7},     //intp_scale_ratio_6
    {0xb92c,        24,     27,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_7
    {0xb92c,        28,     31,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_8
    /*vpss_dieintpscl1*/
    {0xb930,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_9
    {0xb930,        4,      7,      0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_10
    {0xb930,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_11
    {0xb930,        12,     15,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_12
    {0xb930,        16,     19,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_13
    {0xb930,        20,     23,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_14
    {0xb930,        24,     27,     0,      0,      HI_PQ_MODULE_DEI,       8},     //intp_scale_ratio_15
    /*vpss_diedirthd*/
    {0xb934,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       0},     //dir_thd
    {0xb934,        12,     12,     0,      0,      HI_PQ_MODULE_DEI,       1},     //edge_mode
    {0xb934,        13,     13,     0,      0,      HI_PQ_MODULE_DEI,       0},     //hor_edge_en
    /*vpss_diejitmtn*/
    {0xb938,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       8},     //jitter_gain
    {0xb938,        4,      11,     0,      0,      HI_PQ_MODULE_DEI,       0},     //jitter_coring
    {0xb938,        12,     19,     0,      0,      HI_PQ_MODULE_DEI,       0},     //fld_motion_coring
    /*vpss_diefldmtn*/
    {0xb93c,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       0},     //fld_motion_thd_low
    {0xb93c,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       255},   //fld_motion_thd_high
    {0xb93c,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       -2},    //fld_motion_curve_slope
    {0xb93c,        24,     27,     0,      0,      HI_PQ_MODULE_DEI,       8},     //fld_motion_gain
    {0xb93c,        28,     28,     0,      0,      HI_PQ_MODULE_DEI,       1},     //fld_motion_wnd_mode
    {0xb93c,        29,     29,     0,      0,      HI_PQ_MODULE_DEI,       1},     //long_motion_shf
    /*vpss_diemtndiffthd0*/
    {0xb940,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       16},    //motion_diff_thd_0
    {0xb940,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       144},   //motion_diff_thd_1
    {0xb940,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       208},   //motion_diff_thd_2
    {0xb940,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       255},   //motion_diff_thd_3
    /*vpss_diemtndiffthd1*/
    {0xb944,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       255},   //motion_diff_thd_4
    {0xb944,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       255},   //motion_diff_thd_5
    {0xb944,        16,     22,     0,      0,      HI_PQ_MODULE_DEI,       32},    //min_motion_iir_ratio
    {0xb944,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       64},    //max_motion_iir_ratio
    /*vpss_diemtniirslp*/
    {0xb948,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       1},     //motion_iir_curve_slope_0
    {0xb948,        6,      11,     0,      0,      HI_PQ_MODULE_DEI,       2},     //motion_iir_curve_slope_1
    {0xb948,        12,     17,     0,      0,      HI_PQ_MODULE_DEI,       0},     //motion_iir_curve_slope_2
    {0xb948,        18,     23,     0,      0,      HI_PQ_MODULE_DEI,       0},     //motion_iir_curve_slope_3
    {0xb948,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       32},    //motion_iir_curve_ratio_0
    /*vpss_diemtniirrat*/
    {0xb94c,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_iir_curve_ratio_1
    {0xb94c,        8,      14,     0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_iir_curve_ratio_2
    {0xb94c,        16,     22,     0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_iir_curve_ratio_3
    {0xb94c,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_iir_curve_ratio_4
    /*vpss_diehismode*/
    {0xb950,        0,      2,      0,      0,      HI_PQ_MODULE_DEI,       2},     //rec_mode_fld_motion_step_0
    {0xb950,        4,      6,      0,      0,      HI_PQ_MODULE_DEI,       2},     //rec_mode_fld_motion_step_1
    {0xb950,        8,      9,      0,      0,      HI_PQ_MODULE_DEI,       0},     //rec_mode_frm_motion_step_0
    {0xb950,        12,     13,     0,      0,      HI_PQ_MODULE_DEI,       0},     //rec_mode_frm_motion_step_1
    {0xb950,        16,     16,     0,      0,      HI_PQ_MODULE_DEI,       1},     //ppre_info_en
    {0xb950,        17,     17,     0,      0,      HI_PQ_MODULE_DEI,       0},     //pre_info_en
    {0xb950,        18,     18,     0,      0,      HI_PQ_MODULE_DEI,       1},     //his_motion_en
    {0xb950,        19,     19,     0,      0,      HI_PQ_MODULE_DEI,       1},     //his_motion_using_mode
    {0xb950,        20,     20,     0,      0,      HI_PQ_MODULE_DEI,       0},     //his_motion_write_mode
    {0xb950,        21,     21,     0,      0,      HI_PQ_MODULE_DEI,       0},     //his_motion_info_write_mode
    /*vpss_diemorflt*/
    {0xb954,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       0},     //mor_flt_thd
    {0xb954,        8,      9,      0,      0,      HI_PQ_MODULE_DEI,       0},     //mor_flt_size
    {0xb954,        24,     24,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mor_flt_en
    {0xb954,        26,     26,     0,      0,      HI_PQ_MODULE_DEI,       0},     //med_blend_en
    /*vpss_diecombchk0*/
    {0xb958,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       255},   //comb_chk_min_hthd
    {0xb958,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       15},    //comb_chk_min_vthd
    {0xb958,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       9},     //comb_chk_lower_limit
    {0xb958,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       160},   //comb_chk_upper_limit
    /*vpss_diecombchk1*/
    {0xb95c,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       16},    //comb_chk_edge_thd
    {0xb95c,        8,      12,     0,      0,      HI_PQ_MODULE_DEI,       20},    //comb_chk_md_thd
    {0xb95c,        16,     16,     0,      0,      HI_PQ_MODULE_DEI,       0},     //comb_chk_en
    /*vpss_diefrmmtnsmththd0*/
    {0xb960,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       8},     //frame_motion_smooth_thd0
    {0xb960,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       72},    //frame_motion_smooth_thd1
    {0xb960,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       255},   //frame_motion_smooth_thd2
    {0xb960,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       255},   //frame_motion_smooth_thd3
    /*vpss_diefrmmtnsmththd1*/
    {0xb964,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       255},   //frame_motion_smooth_thd4
    {0xb964,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       255},   //frame_motion_smooth_thd5
    {0xb964,        16,     22,     0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_motion_smooth_ratio_min
    {0xb964,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       64},    //frame_motion_smooth_ratio_max
    /*vpss_diefrmmtnsmthslp*/
    {0xb968,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       8},     //frame_motion_smooth_slope0
    {0xb968,        6,      11,     0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_motion_smooth_slope1
    {0xb968,        12,     17,     0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_motion_smooth_slope2
    {0xb968,        18,     23,     0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_motion_smooth_slope3
    {0xb968,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_motion_smooth_ratio0
    /*vpss_diefrmmtnsmthrat*/
    {0xb96c,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       64},    //frame_motion_smooth_ratio1
    {0xb96c,        8,      14,     0,      0,      HI_PQ_MODULE_DEI,       64},    //frame_motion_smooth_ratio2
    {0xb96c,        16,     22,     0,      0,      HI_PQ_MODULE_DEI,       64},    //frame_motion_smooth_ratio3
    {0xb96c,        24,     30,     0,      0,      HI_PQ_MODULE_DEI,       64},    //frame_motion_smooth_ratio4
    /*vpss_diemtnadj*/
    {0xb980,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_adjust_gain
    {0xb980,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       0},     //motion_adjust_coring
    {0xb980,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       64},    //motion_adjust_gain_chr
    /*vpss_dieedgeformc*/
    {0xb99c,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       0},     //edge_coring
    {0xb99c,        10,     19,     0,      0,      HI_PQ_MODULE_DEI,       6},     //edge_scale
    /*vpss_diefusion0*/
    {0xb9a8,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       16},    //k_y_mcw
    {0xb9a8,        16,     22,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_c_mcw
    /*vpss_diefusion1*/
    {0xb9ac,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       64},    //x0_mcw_adj
    {0xb9ac,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       64},    //k0_mcw_adj
    {0xb9ac,        16,     27,     0,      0,      HI_PQ_MODULE_DEI,       1023},  //g0_mcw_adj
    /*vpss_diefusion2*/
    {0xb9b0,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       128},   //k1_mcw_adj
    /*vpss_diefusion3*/
    {0xb9b4,        20,     20,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mc_lai_bldmode
    /*vpss_diemagbmthd0*/
    {0xb9b8,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       48},    //ma_gbm_thd1
    {0xb9b8,        16,     25,     0,      0,      HI_PQ_MODULE_DEI,       16},    //ma_gbm_thd0
    /*vpss_diemagbmthd1*/
    {0xb9bc,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       112},   //ma_gbm_thd3
    {0xb9bc,        16,     25,     0,      0,      HI_PQ_MODULE_DEI,       80},    //ma_gbm_thd2
    /*vpss_diemcgbmcoef0*/
    {0xb9c0,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       4},     //mtth0_gmd
    {0xb9c0,        4,      8,      0,      0,      HI_PQ_MODULE_DEI,       12},    //mtth1_gmd
    {0xb9c0,        12,     17,     0,      0,      HI_PQ_MODULE_DEI,       20},    //mtth2_gmd
    {0xb9c0,        20,     25,     0,      0,      HI_PQ_MODULE_DEI,       28},    //mtth3_gmd
    {0xb9c0,        28,     28,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mtfilten_gmd
    /*vpss_diemcgbmcoef1*/
    {0xb9c4,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       4},     //k_maxmag_gmd
    {0xb9c4,        4,      10,     0,      0,      HI_PQ_MODULE_DEI,       22},    //k_difh_gmd
    {0xb9c4,        12,     19,     0,      0,      HI_PQ_MODULE_DEI,       96},    //k_mag_gmd
    /*vpss_diekmag1*/
    {0xb9c8,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       31},    //kmagh_1
    {0xb9c8,        7,      13,     0,      0,      HI_PQ_MODULE_DEI,       31},    //kmagh_2
    {0xb9c8,        14,     18,     0,      0,      HI_PQ_MODULE_DEI,       8},     //kmagv_1
    {0xb9c8,        19,     23,     0,      0,      HI_PQ_MODULE_DEI,       2},     //kmagv_2
    {0xb9c8,        24,     28,     0,      0,      HI_PQ_MODULE_DEI,       31},    //khoredge
    /*vpss_diekmag2*/
    {0xb9cc,        0,      2,      0,      0,      HI_PQ_MODULE_DEI,       2},     //scaler_horedge
    {0xb9cc,        3,      3,      0,      0,      HI_PQ_MODULE_DEI,       0},     //frame_mag_en
    {0xb9cc,        4,      11,     0,      0,      HI_PQ_MODULE_DEI,       60},    //motion_limt_1
    {0xb9cc,        12,     19,     0,      0,      HI_PQ_MODULE_DEI,       60},    //motion_limt_2
    {0xb9cc,        20,     22,     0,      0,      HI_PQ_MODULE_DEI,       4},     //scaler_framemotion
    /*vpss_die_s3add*/
    {0xb9d0,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       8},     //dir_ratio_c
    {0xb9d0,        4,      8,      0,      0,      HI_PQ_MODULE_DEI,       0},     //edge_str_coring_c
    /*vpss_mcdi_rgdify*/
    {0xba08,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       511},   //lmt_rgdify
    {0xba08,        10,     13,     0,      0,      HI_PQ_MODULE_DEI,       5},     //core_rgdify
    {0xba08,        14,     23,     0,      0,      HI_PQ_MODULE_DEI,       1023},  //g_rgdifycore
    {0xba08,        24,     27,     0,      0,      HI_PQ_MODULE_DEI,       3},     //k_rgdifycore
    /*vpss_mcdi_rgsad*/
    {0xba0c,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       255},   //g_tpdif_rgsad
    {0xba0c,        9,      14,     0,      0,      HI_PQ_MODULE_DEI,       63},    //k_tpdif_rgsad
    {0xba0c,        15,     21,     0,      0,      HI_PQ_MODULE_DEI,       15},    //kmv_rgsad
    {0xba0c,        23,     25,     0,      0,      HI_PQ_MODULE_DEI,       1},     //coef_sadlpf
    /*vpss_mcdi_rgmv*/
    {0xba10,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       256},   //th_0mvsad_rgmv
    {0xba10,        10,     18,     0,      0,      HI_PQ_MODULE_DEI,       128},   //th_saddif_rgmv
    {0xba10,        19,     26,     0,      0,      HI_PQ_MODULE_DEI,       0},     //thmag_rgmv
    /*vpss_mcdi_rgmag0*/
    {0xba14,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       255},   //lmt_mag_rg
    {0xba14,        10,     13,     0,      0,      HI_PQ_MODULE_DEI,       3},     //core_mag_rg
    /*vpss_mcdi_rgmag1*/
    {0xba18,        0,      0,      0,      0,      HI_PQ_MODULE_DEI,       1},     //en_mvadj_rgmvls
    {0xba18,        1,      4,      0,      0,      HI_PQ_MODULE_DEI,       8},     //th_mvadj_rgmvls
    {0xba18,        5,      8,      0,      0,      HI_PQ_MODULE_DEI,       12},    //k_mag_rgmvls
    {0xba18,        9,      15,     0,      0,      HI_PQ_MODULE_DEI,       -64},   //core_mag_rgmvls
    {0xba18,        16,     20,     0,      0,      HI_PQ_MODULE_DEI,       16},    //k_mv_rgmvls
    {0xba18,        21,     25,     0,      0,      HI_PQ_MODULE_DEI,       2},     //core_mv_rgmvls
    /*vpss_mcdi_rgls*/
    {0xba1c,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       8},     //k_sadcore_rgmv
    {0xba1c,        4,      8,      0,      0,      HI_PQ_MODULE_DEI,       8},     //th_sad_rgls
    {0xba1c,        9,      14,     0,      0,      HI_PQ_MODULE_DEI,       40},    //th_mag_rgls
    {0xba1c,        15,     18,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_sad_rgls
    /*vpss_mcdi_sel*/
    {0xba20,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       0},     //force_mvx
    {0xba20,        8,      8,      0,      0,      HI_PQ_MODULE_DEI,       0},     //force_mven
    /*vpss_mcdi_dlt0*/
    {0xba24,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       4},     //th_hblkdist_mvdlt
    {0xba24,        4,      7,      0,      0,      HI_PQ_MODULE_DEI,       1},     //th_vblkdist_mvdlt
    {0xba24,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       8},     //th_ls_mvdlt
    {0xba24,        12,     15,     0,      0,      HI_PQ_MODULE_DEI,       4},     //th_rgmvx_mvdlt
    {0xba24,        16,     18,     0,      0,      HI_PQ_MODULE_DEI,       6},     //th_blkmvx_mvdlt
    /*vpss_mcdi_dlt1*/
    {0xba28,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       16},    //thh_sad_mvdlt
    {0xba28,        5,      11,     0,      0,      HI_PQ_MODULE_DEI,       96},    //thl_sad_mvdlt
    {0xba28,        12,     17,     0,      0,      HI_PQ_MODULE_DEI,       16},    //g_mag_mvdlt
    {0xba28,        18,     22,     0,      0,      HI_PQ_MODULE_DEI,       12},    //th_mag_mvdlt
    {0xba28,        23,     25,     0,      0,      HI_PQ_MODULE_DEI,       2},     //k_sadcore_mvdlt
    /*vpss_mcdi_rgmcw0*/
    {0xba2c,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       8},     //k_core_simimv
    {0xba2c,        5,      7,      0,      0,      HI_PQ_MODULE_DEI,       0},     //gl_core_simimv
    {0xba2c,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       15},    //gh_core_simimv
    {0xba2c,        14,     19,     0,      0,      HI_PQ_MODULE_DEI,       32},    //k_simimvw
    {0xba2c,        20,     24,     0,      0,      HI_PQ_MODULE_DEI,       20},    //k_rglsw
    /*vpss_mcdi_rgmcw1*/
    {0xba30,        0,      0,      0,      0,      HI_PQ_MODULE_DEI,       1},     //rgtb_en_mcw
    {0xba30,        1,      3,      0,      0,      HI_PQ_MODULE_DEI,       3},     //core_mvy_mcw
    {0xba30,        4,      9,      0,      0,      HI_PQ_MODULE_DEI,       20},    //k_mvy_mcw
    {0xba30,        10,     18,     0,      0,      HI_PQ_MODULE_DEI,       64},    //core_rgsadadj_mcw
    {0xba30,        19,     22,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_rgsadadj_mcw
    {0xba30,        23,     27,     0,      0,      HI_PQ_MODULE_DEI,       16},    //k_core_vsaddif
    /*vpss_mcdi_rgmcw2*/
    {0xba34,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       5},     //gl_core_vsaddif
    {0xba34,        5,      11,     0,      0,      HI_PQ_MODULE_DEI,       64},    //gh_core_vsad_dif
    {0xba34,        12,     17,     0,      0,      HI_PQ_MODULE_DEI,       10},    //k_vsaddifw
    {0xba34,        18,     18,     0,      0,      HI_PQ_MODULE_DEI,       0},     //mode_rgysad_mcw
    {0xba34,        19,     26,     0,      0,      HI_PQ_MODULE_DEI,       24},    //core_rgmag_mcw
    /*vpss_mcdi_rgmcw3*/
    {0xba38,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       64},    //x0_rgmag_mcw
    {0xba38,        9,      17,     0,      0,      HI_PQ_MODULE_DEI,       256},   //k0_rgmag_mcw
    {0xba38,        18,     25,     0,      0,      HI_PQ_MODULE_DEI,       64},    //g0_rgmag_mcw
    /*vpss_mcdi_rgmcw4*/
    {0xba3c,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       320},   //k1_rgmag_mcw
    {0xba3c,        9,      16,     0,      0,      HI_PQ_MODULE_DEI,       96},    //core_rgsad_mcw
    {0xba3c,        17,     26,     0,      0,      HI_PQ_MODULE_DEI,       512},   //x0_rgsad_mcw
    /*vpss_mcdi_rgmcw5*/
    {0xba40,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       160},   //k0_rgsad_mcw
    {0xba40,        9,      16,     0,      0,      HI_PQ_MODULE_DEI,       255},   //g0_rgsad_mcw
    {0xba40,        17,     25,     0,      0,      HI_PQ_MODULE_DEI,       128},   //k1_rgsad_mcw
    /*vpss_mcdi_rgmcw6*/
    {0xba44,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       16},    //x0_smrg_mcw
    {0xba44,        8,      15,     0,      0,      HI_PQ_MODULE_DEI,       64},    //k0_smrg_mcw
    {0xba44,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       112},   //x_rgsad_mcw
    {0xba44,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       24},    //k_rgsad_mcw
    /*vpss_mcdi_tpmcw0*/
    {0xba48,        0,      7,      0,      0,      HI_PQ_MODULE_DEI,       255},   //x0_tpmvdist_mcw
    {0xba48,        8,      14,     0,      0,      HI_PQ_MODULE_DEI,       64},    //k0_tpmvdist_mcw
    {0xba48,        15,     22,     0,      0,      HI_PQ_MODULE_DEI,       0},     //g0_tpmvdist_mcw
    {0xba48,        23,     29,     0,      0,      HI_PQ_MODULE_DEI,       32},    //k1_tpmvdist_mcw
    /*vpss_mcdi_tpmcw1*/
    {0xba4c,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       4},     //k_minmvdist_mcw
    {0xba4c,        4,      7,      0,      0,      HI_PQ_MODULE_DEI,       4},     //k_avgmvdist_mcw
    {0xba4c,        8,      10,     0,      0,      HI_PQ_MODULE_DEI,       2},     //b_core_tpmvdist_mcw
    {0xba4c,        11,     13,     0,      0,      HI_PQ_MODULE_DEI,       2},     //k_core_tpmvdist_mcw
    /*vpss_mcdi_wndmcw0*/
    {0xba50,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       18},    //k_difhcore_mcw
    {0xba50,        5,      10,     0,      0,      HI_PQ_MODULE_DEI,       32},    //k_difvcore_mcw
    {0xba50,        11,     14,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_max_core_mcw
    {0xba50,        15,     18,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_max_dif_mcw
    {0xba50,        19,     22,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k1_max_mag_mcw
    {0xba50,        23,     26,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k0_max_mag_mcw
    {0xba50,        27,     30,     0,      0,      HI_PQ_MODULE_DEI,       15},    //k_tbdif_mcw
    /*vpss_mcdi_wndmcw1*/
    {0xba54,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       0},     //k_tbmag_mcw
    {0xba54,        4,      10,     0,      0,      HI_PQ_MODULE_DEI,       32},    //x0_mag_wnd_mcw
    {0xba54,        11,     14,     0,      0,      HI_PQ_MODULE_DEI,       6},     //k0_mag_wnd_mcw
    {0xba54,        15,     20,     0,      0,      HI_PQ_MODULE_DEI,       24},    //g0_mag_wnd_mcw
    {0xba54,        21,     24,     0,      0,      HI_PQ_MODULE_DEI,       6},     //k1_mag_wnd_mcw
    /*vpss_mcdi_wndmcw2*/
    {0xba58,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       288},   //g1_mag_wnd_mcw
    {0xba58,        9,      15,     0,      0,      HI_PQ_MODULE_DEI,       8},     //x0_sad_wnd_mcw
    {0xba58,        16,     20,     0,      0,      HI_PQ_MODULE_DEI,       16},    //k0_sad_wnd_mcw
    {0xba58,        21,     28,     0,      0,      HI_PQ_MODULE_DEI,       16},    //g0_sad_wnd_mcw
    /*vpss_mcdi_wndmcw3*/
    {0xba5c,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       16},    //k1_sad_wnd_mcw
    {0xba5c,        5,      13,     0,      0,      HI_PQ_MODULE_DEI,       288},   //g1_sad_wnd_mcw
    /*vpss_mcdi_vertweight0*/
    {0xba60,        0,      3,      0,      0,      HI_PQ_MODULE_DEI,       12},    //k_max_hvdif_dw
    {0xba60,        4,      7,      0,      0,      HI_PQ_MODULE_DEI,       15},    //gain_lpf_dw
    {0xba60,        8,      11,     0,      0,      HI_PQ_MODULE_DEI,       5},     //core_bhvdif_dw
    {0xba60,        12,     18,     0,      0,      HI_PQ_MODULE_DEI,       64},    //k_bhvdif_dw
    {0xba60,        20,     22,     0,      0,      HI_PQ_MODULE_DEI,       0},     //b_bhvdif_dw
    {0xba60,        24,     26,     0,      0,      HI_PQ_MODULE_DEI,       0},     //b_hvdif_dw
    /*vpss_mcdi_vertweight1*/
    {0xba64,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       16},    //core_hvdif_dw
    {0xba64,        8,      12,     0,      0,      HI_PQ_MODULE_DEI,       20},    //k_difv_dw
    {0xba64,        16,     19,     0,      0,      HI_PQ_MODULE_DEI,       -2},    //core_mv_dw
    {0xba64,        20,     25,     0,      0,      HI_PQ_MODULE_DEI,       56},    //b_mv_dw
    /*vpss_mcdi_vertweight2*/
    {0xba68,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       256},   //x0_hvdif_dw
    {0xba68,        9,      12,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k0_hvdif_dw
    {0xba68,        16,     24,     0,      0,      HI_PQ_MODULE_DEI,       128},   //g0_hvdif_dw
    {0xba68,        25,     30,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k1_hvdif_dw
    /*vpss_mcdi_vertweight3*/
    {0xba6c,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       8},     //x0_mv_dw
    {0xba6c,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       16},    //k0_mv_dw
    {0xba6c,        16,     21,     0,      0,      HI_PQ_MODULE_DEI,       32},    //g0_mv_dw
    {0xba6c,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       64},    //k1_mv_dw
    /*vpss_mcdi_vertweight4*/
    {0xba70,        0,      6,      0,      0,      HI_PQ_MODULE_DEI,       32},    //x0_mt_dw
    {0xba70,        8,      13,     0,      0,      HI_PQ_MODULE_DEI,       32},    //k0_mt_dw
    {0xba70,        16,     23,     0,      0,      HI_PQ_MODULE_DEI,       64},    //g0_mt_dw
    {0xba70,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       32},    //k1_mt_dw
    /*vpss_mcdi_vertweight5*/
    {0xba74,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       31},    //g0_mv_mt
    {0xba74,        8,      9,      0,      0,      HI_PQ_MODULE_DEI,       1},     //x0_mv_mt
    {0xba74,        12,     16,     0,      0,      HI_PQ_MODULE_DEI,       20},    //k1_mv_mt
    {0xba74,        24,     31,     0,      0,      HI_PQ_MODULE_DEI,       0},     //b_mt_dw
    /*vpss_mcdi_mc0*/
    {0xba78,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       16},    //gain_up_mclpfv
    {0xba78,        5,      9,      0,      0,      HI_PQ_MODULE_DEI,       16},    //gain_dn_mclpfv
    {0xba78,        10,     14,     0,      0,      HI_PQ_MODULE_DEI,       16},    //gain_mclpfh
    {0xba78,        15,     15,     0,      0,      HI_PQ_MODULE_DEI,       0},     //rs_pxlmag_mcw
    {0xba78,        16,     18,     0,      0,      HI_PQ_MODULE_DEI,       2},     //x_pxlmag_mcw
    {0xba78,        20,     26,     0,      0,      HI_PQ_MODULE_DEI,       8},     //k_pxlmag_mcw
    {0xba78,        28,     28,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mclpf_mode
    /*vpss_mcdi_mc1*/
    {0xba7c,        0,      5,      0,      0,      HI_PQ_MODULE_DEI,       0},     //g_pxlmag_mcw
    /*vpss_mcdi_mc2*/
    {0xba80,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       8},     //k_y_vertw
    {0xba80,        5,      11,     0,      0,      HI_PQ_MODULE_DEI,       15},    //k_c_vertw
    /*vpss_mcdi_mc3*/
    {0xba84,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       8},     //k_delta
    {0xba84,        5,      7,      0,      0,      HI_PQ_MODULE_DEI,       4},     //bdh_mcpos
    {0xba84,        8,      10,     0,      0,      HI_PQ_MODULE_DEI,       4},     //bdv_mcpos
    /*vpss_mcdi_mc5*/
    {0xba8c,        6,      17,     0,      0,      HI_PQ_MODULE_DEI,       0},     //c0_mc
    {0xba8c,        18,     29,     0,      0,      HI_PQ_MODULE_DEI,       0},     //r0_mc
    /*vpss_mcdi_mc6*/
    {0xba90,        0,      11,     0,      0,      HI_PQ_MODULE_DEI,       4095},  //c1_mc
    {0xba90,        12,     23,     0,      0,      HI_PQ_MODULE_DEI,       4095},  //r1_mc
    {0xba90,        24,     29,     0,      0,      HI_PQ_MODULE_DEI,       32},    //mcmvrange
    /*vpss_mcdi_mc7*/
    {0xba94,        0,      0,      0,      0,      HI_PQ_MODULE_DEI,       0},     //scenechange_mc
    {0xba94,        1,      5,      0,      0,      HI_PQ_MODULE_DEI,       8},     //x_frcount_mc
    {0xba94,        6,      12,     0,      0,      HI_PQ_MODULE_DEI,       48},    //k_frcount_mc
    /*vpss_mcdi_numt*/
    {0xbaa0,        0,      0,      0,      0,      HI_PQ_MODULE_DEI,       0},     //numt_lpf_en
    {0xbaa0,        1,      6,      0,      0,      HI_PQ_MODULE_DEI,       0},     //numt_coring
    {0xbaa0,        7,      14,     0,      0,      HI_PQ_MODULE_DEI,       32},    //numt_gain
    {0xbaa0,        15,     15,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mc_numt_blden
    /*vpss_mcdi_s3add0*/
    {0xbaa4,        0,      2,      0,      0,      HI_PQ_MODULE_DEI,       0},     //core_rglsw
    /*vpss_mcdi_s3add3*/
    {0xbab0,        21,     29,     0,      0,      HI_PQ_MODULE_DEI,       128},   //th_cur_blksad
    /*vpss_mcdi_s3add4*/
    {0xbab4,        0,      8,      0,      0,      HI_PQ_MODULE_DEI,       256},   //thh_neigh_blksad
    {0xbab4,        9,      17,     0,      0,      HI_PQ_MODULE_DEI,       128},   //thl_neigh_blksad
    {0xbab4,        18,     22,     0,      0,      HI_PQ_MODULE_DEI,       8},     //th_cur_blkmotion
    /*vpss_mcdi_s3add5*/
    {0xbab8,        0,      9,      0,      0,      HI_PQ_MODULE_DEI,       512},   //th_rgmv_mag
    {0xbab8,        10,     10,     0,      0,      HI_PQ_MODULE_DEI,       1},     //blkmv_update_en
    /*vpss_mcdi_s3add7*/
    {0xbac0,        18,     18,     0,      0,      HI_PQ_MODULE_DEI,       0},     //submv_sadchk_en
    /*vpss_mcdi_stillcnt0*/
    {0xbac4,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       2},     //cntlut_0
    {0xbac4,        5,      9,      0,      0,      HI_PQ_MODULE_DEI,       2},     //cntlut_1
    {0xbac4,        10,     14,     0,      0,      HI_PQ_MODULE_DEI,       1},     //cntlut_2
    {0xbac4,        15,     19,     0,      0,      HI_PQ_MODULE_DEI,       1},     //cntlut_3
    {0xbac4,        20,     24,     0,      0,      HI_PQ_MODULE_DEI,       -15},   //cntlut_4
    {0xbac4,        25,     29,     0,      0,      HI_PQ_MODULE_DEI,       -15},   //cntlut_5
    /*vpss_mcdi_stillcnt1*/
    {0xbac8,        0,      4,      0,      0,      HI_PQ_MODULE_DEI,       -15},   //cntlut_6
    {0xbac8,        5,      9,      0,      0,      HI_PQ_MODULE_DEI,       -15},   //cntlut_7
    {0xbac8,        10,     14,     0,      0,      HI_PQ_MODULE_DEI,       -15},   //cntlut_8
    {0xbac8,        15,     15,     0,      0,      HI_PQ_MODULE_DEI,       0},     //mc_mtshift
    {0xbac8,        16,     16,     0,      0,      HI_PQ_MODULE_DEI,       1},     //mcw_scnt_en
    {0xbac8,        17,     25,     0,      0,      HI_PQ_MODULE_DEI,       273},   //mcw_scnt_gain
    /*vpss_mcdi_demo*/
    {0xbadc,        0,      0,      0,      0,      HI_PQ_MODULE_DEI,       0},     //demo_en
    {0xbadc,        1,      2,      0,      0,      HI_PQ_MODULE_DEI,       0},     //demo_mode_l
    {0xbadc,        3,      4,      0,      0,      HI_PQ_MODULE_DEI,       0},     //demo_mode_r
    {0xbadc,        5,      16,     0,      0,      HI_PQ_MODULE_DEI,       0},     //demo_border

    /***********************************************FMD***********************************************/
    /*vpss_diectrl*/
    //{0xb900,        20,     20,     0,      0,      HI_PQ_MODULE_FMD,       0},     //edge_smooth_en
    //{0xb900,        19,     19,     0,      0,      HI_PQ_MODULE_FMD,       0},     //mchdir_l
    //{0xb900,        18,     18,     0,      0,      HI_PQ_MODULE_FMD,       0},     //mchdir_c
    //{0xb900,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       128},   //edge_smooth_ratio
    /*vpss_pdphistthd1*/
    {0xb9d4,        24,     31,     0,      0,      HI_PQ_MODULE_FMD,       32},    //hist_thd3
    {0xb9d4,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       32},    //hist_thd2
    {0xb9d4,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       16},    //hist_thd1
    {0xb9d4,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       8},     //hist_thd0
    /*vpss_pdpccmov*/
    {0xb9d8,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       20},    //mov_coring_norm
    {0xb9d8,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       50},    //mov_coring_tkr
    {0xb9d8,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       20},    //mov_coring_blk
    /*vpss_pdctrl*/
    {0xb9dc,        19,     19,     0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_mode
    /*vpss_pdblkthd*/
    {0xb9e0,        20,     27,     0,      0,      HI_PQ_MODULE_FMD,       30},    //diff_movblk_thd
    /*vpss_pdumthd*/
    {0xb9e4,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       64},    //um_thd2
    {0xb9e4,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       32},    //um_thd1
    {0xb9e4,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       8},     //um_thd0
    /*vpss_pdpcccoring*/
    {0xb9e8,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       16},    //coring_blk
    {0xb9e8,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       16},    //coring_norm
    {0xb9e8,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       90},    //coring_tkr
    /*vpss_pdpcchthd*/
    {0xb9ec,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       16},    //pcc_hthd
    /*vpss_pdpccvthd*/
    {0xb9f0,        24,     31,     0,      0,      HI_PQ_MODULE_FMD,       128},   //pcc_vthd3
    {0xb9f0,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       64},    //pcc_vthd2
    {0xb9f0,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       32},    //pcc_vthd1
    {0xb9f0,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       16},    //pcc_vthd0
    /*vpss_pditdiffvthd*/
    {0xb9f4,        24,     31,     0,      0,      HI_PQ_MODULE_FMD,       32},    //itdiff_vthd3
    {0xb9f4,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       16},    //itdiff_vthd2
    {0xb9f4,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       8},     //itdiff_vthd1
    {0xb9f4,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       4},     //itdiff_vthd0
    /*vpss_pdlasithd*/
    {0xb9f8,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       32},    //lasi_mov_thd
    {0xb9f8,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       15},    //lasi_edge_thd
    {0xb9f8,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       20},    //lasi_coring_thd
    /*vpss_pdlasimode0coef*/
    {0xb9fc,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_txt_coring
    {0xb9fc,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       32},    //lasi_txt_alpha
    /*vpss_pdlasimode1coef*/
    {0xba00,        24,     31,     0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_txt_thd3
    {0xba00,        16,     23,     0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_txt_thd2
    {0xba00,        8,      15,     0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_txt_thd1
    {0xba00,        0,      7,      0,      0,      HI_PQ_MODULE_FMD,       0},     //lasi_txt_thd0
    /*vpss_pdregion*/
    {0xba04,        12,     23,     0,      0,      HI_PQ_MODULE_FMD,       0},     //region1_y_stt
    {0xba04,        0,      11,     0,      0,      HI_PQ_MODULE_FMD,       0},     //region1_y_end

    /***********************************************DB***********************************************/
    /*vpss_dbm_ctrl*/
    {0xbb00,        16,     18,     0,      0,      HI_PQ_MODULE_DB,        6},     //dbm_out_mode
    {0xbb00,        13,     13,     0,      0,      HI_PQ_MODULE_DB,        1},     //det_hy_en
    {0xbb00,        10,     10,     0,      0,      HI_PQ_MODULE_DB,        0},     //dbm_demo_mode
    {0xbb00,        9,      9,      0,      0,      HI_PQ_MODULE_DB,        0},     //dbm_demo_en
    {0xbb00,        7,      7,      0,      0,      HI_PQ_MODULE_DB,        0},     //is_dmd_bypass
    {0xbb00,        6,      6,      0,      0,      HI_PQ_MODULE_DB,        1},     //dmd_en
    {0xbb00,        5,      5,      0,      0,      HI_PQ_MODULE_DB,        1},     //ccs_2d_en
    {0xbb00,        3,      3,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_lum_hor_en
    {0xbb00,        2,      2,      0,      0,      HI_PQ_MODULE_DB,        1},     //nr_en
    {0xbb00,        1,      1,      0,      0,      HI_PQ_MODULE_DB,        1},     //dm_en
    {0xbb00,        0,      0,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_en
    /*vpss_dbm_demo*/
    {0xbb04,        0,      15,     0,      0,      HI_PQ_MODULE_DB,        0},     //dbm_demo_pos_x
    /*vpss_db_dir*/
    {0xbb08,        8,      12,     0,      0,      HI_PQ_MODULE_DB,        2},     //db_ctrst_thresh
    {0xbb08,        0,      4,      0,      0,      HI_PQ_MODULE_DB,        24},    //db_grad_sub_ratio
    /*vpss_db_blk*/
    {0xbb0c,        0,      6,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_h_blk_size
    /*vpss_db_ratio*/
    {0xbb10,        20,     21,     0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_hor_txt_win_size
    {0xbb10,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_global_db_strenth_lum
    {0xbb10,        8,      9,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_lum_hor_filter_sel
    {0xbb10,        0,      1,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_lum_hor_scale_ratio
    /*vpss_db_lhhf*/
    {0xbb14,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_hf_var_gain2
    {0xbb14,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_hor_hf_var_gain1
    {0xbb14,        16,     22,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_hf_var_core
    {0xbb14,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_hf_diff_gain2
    {0xbb14,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_hf_diff_gain1
    {0xbb14,        0,      6,      0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_hf_diff_core
    /*vpss_db_lvhf*/
    {0xbb18,        21,     23,     0,      0,      HI_PQ_MODULE_DB,        7},     //db_lum_hor_bord_adj_gain
    {0xbb18,        16,     20,     0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_hor_adj_gain
    /*vpss_db_ctrs*/
    {0xbb1c,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        4},     //db_max_lum_hor_db_dist
    {0xbb1c,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_ctrst_adj_gain2
    {0xbb1c,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_ctrst_adj_gain1
    {0xbb1c,        5,      6,      0,      0,      HI_PQ_MODULE_DB,        2},     //db_dir_smooth_mode
    {0xbb1c,        0,      4,      0,      0,      HI_PQ_MODULE_DB,        0},     //db_ctrst_adj_core
    /*vpss_db_lut0*/
    {0xbb20,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p7
    {0xbb20,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p6
    {0xbb20,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p5
    {0xbb20,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p4
    {0xbb20,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p3
    {0xbb20,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p2
    {0xbb20,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p1
    {0xbb20,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_hor_delta_lut_p0
    /*vpss_db_lut1*/
    {0xbb24,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_delta_lut_p15
    {0xbb24,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_hor_delta_lut_p14
    {0xbb24,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        2},     //db_lum_hor_delta_lut_p13
    {0xbb24,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_hor_delta_lut_p12
    {0xbb24,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        6},     //db_lum_hor_delta_lut_p11
    {0xbb24,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p10
    {0xbb24,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p9
    {0xbb24,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_lum_hor_delta_lut_p8
    /*vpss_db_lut2*/
    {0xbb28,        27,     29,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p9
    {0xbb28,        24,     26,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p8
    {0xbb28,        21,     23,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p7
    {0xbb28,        18,     20,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p6
    {0xbb28,        15,     17,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p5
    {0xbb28,        12,     14,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p4
    {0xbb28,        9,      11,     0,      0,      HI_PQ_MODULE_DB,        3},     //db_lum_h_str_fade_lut_p3
    {0xbb28,        6,      8,      0,      0,      HI_PQ_MODULE_DB,        3},     //db_lum_h_str_fade_lut_p2
    {0xbb28,        3,      5,      0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_h_str_fade_lut_p1
    {0xbb28,        0,      2,      0,      0,      HI_PQ_MODULE_DB,        4},     //db_lum_h_str_fade_lut_p0
    /*vpss_db_lut3*/
    {0xbb2c,        3,      5,      0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p11
    {0xbb2c,        0,      2,      0,      0,      HI_PQ_MODULE_DB,        0},     //db_lum_h_str_fade_lut_p10
    /*vpss_db_lut4*/
    {0xbb30,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_gain_lut_p7
    {0xbb30,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_gain_lut_p6
    {0xbb30,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_gain_lut_p5
    {0xbb30,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_gain_lut_p4
    {0xbb30,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        1},     //db_dir_str_gain_lut_p3
    {0xbb30,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        3},     //db_dir_str_gain_lut_p2
    {0xbb30,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        5},     //db_dir_str_gain_lut_p1
    {0xbb30,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_gain_lut_p0
    /*vpss_db_lut5*/
    {0xbb34,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        6},     //db_dir_str_lut_p7
    {0xbb34,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p6
    {0xbb34,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p5
    {0xbb34,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p4
    {0xbb34,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p3
    {0xbb34,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p2
    {0xbb34,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p1
    {0xbb34,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        8},     //db_dir_str_lut_p0
    /*vpss_db_lut6*/
    {0xbb38,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p15
    {0xbb38,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p14
    {0xbb38,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p13
    {0xbb38,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p12
    {0xbb38,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p11
    {0xbb38,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        0},     //db_dir_str_lut_p10
    {0xbb38,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_dir_str_lut_p9
    {0xbb38,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        1},     //db_dir_str_lut_p8
    /*vpss_dbd_thdedge*/
    {0xbb50,        0,      5,      0,      0,      HI_PQ_MODULE_DB,        32},    //dbd_hy_thd_edge
    /*vpss_dbd_thdtxt*/
    {0xbb54,        0,      5,      0,      0,      HI_PQ_MODULE_DB,        16},    //dbd_hy_thd_txt
    /*vpss_dbd_lutwgt0*/
    {0xbb58,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        12},    //dbd_det_lut_wgt7
    {0xbb58,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        10},    //dbd_det_lut_wgt6
    {0xbb58,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        7},     //dbd_det_lut_wgt5
    {0xbb58,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        5},     //dbd_det_lut_wgt4
    {0xbb58,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        2},     //dbd_det_lut_wgt3
    {0xbb58,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        1},     //dbd_det_lut_wgt2
    {0xbb58,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        0},     //dbd_det_lut_wgt1
    {0xbb58,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        0},     //dbd_det_lut_wgt0
    /*vpss_dbd_lutwgt1*/
    {0xbb5c,        28,     31,     0,      0,      HI_PQ_MODULE_DB,        15},    //dbd_det_lut_wgt15
    {0xbb5c,        24,     27,     0,      0,      HI_PQ_MODULE_DB,        15},    //dbd_det_lut_wgt14
    {0xbb5c,        20,     23,     0,      0,      HI_PQ_MODULE_DB,        15},    //dbd_det_lut_wgt13
    {0xbb5c,        16,     19,     0,      0,      HI_PQ_MODULE_DB,        14},    //dbd_det_lut_wgt12
    {0xbb5c,        12,     15,     0,      0,      HI_PQ_MODULE_DB,        14},    //dbd_det_lut_wgt11
    {0xbb5c,        8,      11,     0,      0,      HI_PQ_MODULE_DB,        13},    //dbd_det_lut_wgt10
    {0xbb5c,        4,      7,      0,      0,      HI_PQ_MODULE_DB,        13},    //dbd_det_lut_wgt9
    {0xbb5c,        0,      3,      0,      0,      HI_PQ_MODULE_DB,        12},    //dbd_det_lut_wgt8
    /*vpss_dbd_rtnbdtxt*/
    {0xbb60,        0,      4,      0,      0,      HI_PQ_MODULE_DB,        20},    //dbd_hy_rtn_bd_txt
    /*vpss_dbd_tstblknum*/
    {0xbb64,        0,      9,      0,      0,      HI_PQ_MODULE_DB,        90},    //dbd_hy_tst_blk_num
    /*vpss_dbd_hyrdx8binlut0*/
    {0xbb68,        12,     22,     0,      0,      HI_PQ_MODULE_DB,        48},    //dbd_hy_rdx8bin_lut1
    {0xbb68,        0,      10,     0,      0,      HI_PQ_MODULE_DB,        16},    //dbd_hy_rdx8bin_lut0
    /*vpss_dbd_hyrdx8binlut1*/
    {0xbb6c,        12,     22,     0,      0,      HI_PQ_MODULE_DB,        112},   //dbd_hy_rdx8bin_lut3
    {0xbb6c,        0,      10,     0,      0,      HI_PQ_MODULE_DB,        80},    //dbd_hy_rdx8bin_lut2
    /*vpss_dbd_hyrdx8binlut2*/
    {0xbb70,        12,     22,     0,      0,      HI_PQ_MODULE_DB,        176},   //dbd_hy_rdx8bin_lut5
    {0xbb70,        0,      10,     0,      0,      HI_PQ_MODULE_DB,        144},   //dbd_hy_rdx8bin_lut4
    /*vpss_dbd_hyrdx8binlut3*/
    {0xbb74,        0,      10,     0,      0,      HI_PQ_MODULE_DB,        208},   //dbd_hy_rdx8bin_lut6
    /*vpss_dbd_blksize*/
    {0xbb78,        8,      14,     0,      0,      HI_PQ_MODULE_DB,        16},    //dbd_hy_max_blk_size
    {0xbb78,        0,      5,      0,      0,      HI_PQ_MODULE_DB,        4},     //dbd_min_blk_size
    /*VPSS_DBD_FLAT*/
    {0xbb7c,        0,      4,     0,      0,      HI_PQ_MODULE_DB,        16},    //VPSS_DBD_FLAT

    /***********************************************DM***********************************************/
    /*vpss_dm_dir*/
    {0xbb90,        18,     25,     0,      0,      HI_PQ_MODULE_DM,        2},     //dm_min_angctrst_thres
    {0xbb90,        16,     17,     0,      0,      HI_PQ_MODULE_DM,        1},     //dm_opp_ang_ctrst_div
    {0xbb90,        8,      15,     0,      0,      HI_PQ_MODULE_DM,        20},    //dm_opp_ang_ctrst_t
    {0xbb90,        6,      7,      0,      0,      HI_PQ_MODULE_DM,        2},     //dm_ctrst_thresh
    {0xbb90,        0,      4,      0,      0,      HI_PQ_MODULE_DM,        24},    //dm_grad_sub_ratio
    /*vpss_dm_edge*/
    {0xbb94,        8,      11,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_global_str
    {0xbb94,        6,      6,      0,      0,      HI_PQ_MODULE_DM,        1},     //dm_blkgradinfo_en
    {0xbb94,        3,      5,      0,      0,      HI_PQ_MODULE_DM,        6},     //dmd_info_mode
    {0xbb94,        1,      2,      0,      0,      HI_PQ_MODULE_DM,        1},     //dm_init_val_step
    {0xbb94,        0,      0,      0,      0,      HI_PQ_MODULE_DM,        0},     //dm_mmf_set
    /*vpss_dm_lut0*/
    {0xbb98,        24,     30,     0,      0,      HI_PQ_MODULE_DM,        32},    //dm_sw_wht_lut_p3
    {0xbb98,        16,     22,     0,      0,      HI_PQ_MODULE_DM,        16},    //dm_sw_wht_lut_p2
    {0xbb98,        8,      14,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_sw_wht_lut_p1
    {0xbb98,        0,      6,      0,      0,      HI_PQ_MODULE_DM,        4},     //dm_sw_wht_lut_p0
    /*vpss_dm_lut1*/
    {0xbb9c,        16,     25,     0,      0,      HI_PQ_MODULE_DM,        72},    //dm_limit_t_10
    {0xbb9c,        8,      15,     0,      0,      HI_PQ_MODULE_DM,        18},    //dm_limit_t
    {0xbb9c,        0,      6,      0,      0,      HI_PQ_MODULE_DM,        64},    //dm_sw_wht_lut_p4
    /*vpss_dm_lut2*/
    {0xbba0,        28,     31,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_gain_lut_p7
    {0xbba0,        24,     27,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_gain_lut_p6
    {0xbba0,        20,     23,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_gain_lut_p5
    {0xbba0,        16,     19,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_gain_lut_p4
    {0xbba0,        12,     15,     0,      0,      HI_PQ_MODULE_DM,        1},     //dm_dir_str_gain_lut_p3
    {0xbba0,        8,      11,     0,      0,      HI_PQ_MODULE_DM,        3},     //dm_dir_str_gain_lut_p2
    {0xbba0,        4,      7,      0,      0,      HI_PQ_MODULE_DM,        5},     //dm_dir_str_gain_lut_p1
    {0xbba0,        0,      3,      0,      0,      HI_PQ_MODULE_DM,        8},     //dm_dir_str_gain_lut_p0
    /*vpss_dm_lut3*/
    {0xbba4,        28,     31,     0,      0,      HI_PQ_MODULE_DM,        2},     //dm_dir_str_lut_p7
    {0xbba4,        24,     27,     0,      0,      HI_PQ_MODULE_DM,        4},     //dm_dir_str_lut_p6
    {0xbba4,        20,     23,     0,      0,      HI_PQ_MODULE_DM,        5},     //dm_dir_str_lut_p5
    {0xbba4,        16,     19,     0,      0,      HI_PQ_MODULE_DM,        6},     //dm_dir_str_lut_p4
    {0xbba4,        12,     15,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_dir_str_lut_p3
    {0xbba4,        8,      11,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_dir_str_lut_p2
    {0xbba4,        4,      7,      0,      0,      HI_PQ_MODULE_DM,        8},     //dm_dir_str_lut_p1
    {0xbba4,        0,      3,      0,      0,      HI_PQ_MODULE_DM,        8},     //dm_dir_str_lut_p0
    /*vpss_dm_lut4*/
    {0xbba8,        28,     31,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p15
    {0xbba8,        24,     27,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p14
    {0xbba8,        20,     23,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p13
    {0xbba8,        16,     19,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p12
    {0xbba8,        12,     15,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p11
    {0xbba8,        8,      11,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_dir_str_lut_p10
    {0xbba8,        4,      7,      0,      0,      HI_PQ_MODULE_DM,        1},     //dm_dir_str_lut_p9
    {0xbba8,        0,      3,      0,      0,      HI_PQ_MODULE_DM,        1},     //dm_dir_str_lut_p8
    /*vpss_dm_dirc*/
    {0xbbac,        31,     31,     0,      0,      HI_PQ_MODULE_DM,        1},     //dm_mmf_limit_en
    {0xbbac,        18,     25,     0,      0,      HI_PQ_MODULE_DM,        18},    //dm_mndir_opp_ctrst_t
    /*vpss_dm_diro*/
    {0xbbb0,        22,     31,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_csw_trsnt_st_10
    {0xbbb0,        0,      0,      0,      0,      HI_PQ_MODULE_DM,        1},     //dm_rosubinfo_en
    /*vpss_dm_lsw*/
    {0xbbb4,        27,     29,     0,      0,      HI_PQ_MODULE_DM,        4},     //dm_lsw_ratio
    {0xbbb4,        18,     25,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_csw_trsnt_st
    {0xbbb4,        8,      17,     0,      0,      HI_PQ_MODULE_DM,        120},   //dm_lw_ctrst_t_10
    {0xbbb4,        0,      7,      0,      0,      HI_PQ_MODULE_DM,        30},    //dm_lw_ctrst_t
    /*vpss_dm_mmflr*/
    {0xbbb8,        20,     27,     0,      0,      HI_PQ_MODULE_DM,        50},    //dm_csw_trsnt_lt
    {0xbbb8,        9,      19,     0,      0,      HI_PQ_MODULE_DM,        200},   //dm_mmf_lr_10
    {0xbbb8,        0,      8,      0,      0,      HI_PQ_MODULE_DM,        50},    //dm_mmf_lr
    /*vpss_dm_mmfsr*/
    {0xbbbc,        20,     29,     0,      0,      HI_PQ_MODULE_DM,        200},   //dm_csw_trsnt_lt_10
    {0xbbbc,        9,      19,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_mmf_sr_10
    {0xbbbc,        0,      8,      0,      0,      HI_PQ_MODULE_DM,        0},     //dm_mmf_sr
    /*vpss_dm_thr0*/
    {0xbbc0,        12,     15,     0,      0,      HI_PQ_MODULE_DM,        7},     //dm_dir_blend_str
    {0xbbc0,        8,      11,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_lim_res_blend_str2
    {0xbbc0,        4,      7,      0,      0,      HI_PQ_MODULE_DM,        7},     //dm_lim_res_blend_str1
    {0xbbc0,        0,      2,      0,      0,      HI_PQ_MODULE_DM,        4},     //dm_limit_lsw_ratio
    /*vpss_dm_lut5*/
    {0xbbc4,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_trans_band_lut_p4
    {0xbbc4,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        6},     //dm_trans_band_lut_p3
    {0xbbc4,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        4},     //dm_trans_band_lut_p2
    {0xbbc4,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        2},     //dm_trans_band_lut_p1
    {0xbbc4,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        0},     //dm_trans_band_lut_p0
    /*vpss_dm_lut6*/
    {0xbbc8,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        18},    //dm_trans_band_lut_p9
    {0xbbc8,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        16},    //dm_trans_band_lut_p8
    {0xbbc8,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        14},    //dm_trans_band_lut_p7
    {0xbbc8,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        12},    //dm_trans_band_lut_p6
    {0xbbc8,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        10},    //dm_trans_band_lut_p5
    /*vpss_dm_lut7*/
    {0xbbcc,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        28},    //dm_trans_band_lut_p14
    {0xbbcc,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        26},    //dm_trans_band_lut_p13
    {0xbbcc,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        24},    //dm_trans_band_lut_p12
    {0xbbcc,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        22},    //dm_trans_band_lut_p11
    {0xbbcc,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        20},    //dm_trans_band_lut_p10
    /*vpss_dm_lut8*/
    {0xbbd0,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        38},    //dm_trans_band_lut_p19
    {0xbbd0,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        36},    //dm_trans_band_lut_p18
    {0xbbd0,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        34},    //dm_trans_band_lut_p17
    {0xbbd0,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        32},    //dm_trans_band_lut_p16
    {0xbbd0,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        30},    //dm_trans_band_lut_p15
    /*vpss_dm_lut9*/
    {0xbbd4,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        48},    //dm_trans_band_lut_p24
    {0xbbd4,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        46},    //dm_trans_band_lut_p23
    {0xbbd4,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        44},    //dm_trans_band_lut_p22
    {0xbbd4,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        42},    //dm_trans_band_lut_p21
    {0xbbd4,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        40},    //dm_trans_band_lut_p20
    /*vpss_dm_lut10*/
    {0xbbd8,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        58},    //dm_trans_band_lut_p29
    {0xbbd8,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        56},    //dm_trans_band_lut_p28
    {0xbbd8,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        54},    //dm_trans_band_lut_p27
    {0xbbd8,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        52},    //dm_trans_band_lut_p26
    {0xbbd8,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        50},    //dm_trans_band_lut_p25
    /*vpss_dm_lut11*/
    {0xbbdc,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        60},    //dm_trans_band_lut_p30
    /*vpss_dm_angctrst_lut0*/
    {0xbde0,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        1},     //dm_angctrstpun_lut_p3
    {0xbde0,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        1},     //dm_angctrstpun_lut_p2
    {0xbde0,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        0},     //dm_angctrstpun_lut_p1
    {0xbde0,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        0},     //dm_angctrstpun_lut_p0
    /*vpss_dm_angctrst_lut1*/
    {0xbde4,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        4},     //dm_angctrstpun_lut_p7
    {0xbde4,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        3},     //dm_angctrstpun_lut_p6
    {0xbde4,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        3},     //dm_angctrstpun_lut_p5
    {0xbde4,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        2},     //dm_angctrstpun_lut_p4
    /*vpss_dm_angctrst_lut2*/
    {0xbde8,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        6},     //dm_angctrstpun_lut_p11
    {0xbde8,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        5},     //dm_angctrstpun_lut_p10
    {0xbde8,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        5},     //dm_angctrstpun_lut_p9
    {0xbde8,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        4},     //dm_angctrstpun_lut_p8
    /*vpss_dm_angctrst_lut3*/
    {0xbdec,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        8},     //dm_angctrstpun_lut_p15
    {0xbdec,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        7},     //dm_angctrstpun_lut_p14
    {0xbdec,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        7},     //dm_angctrstpun_lut_p13
    {0xbdec,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        6},     //dm_angctrstpun_lut_p12
    /*vpss_dm_angctrst_lut4*/
    {0xbdf0,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        20},    //dm_angctrstpun_lut_p20
    {0xbdf0,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        18},    //dm_angctrstpun_lut_p19
    {0xbdf0,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        15},    //dm_angctrstpun_lut_p18
    {0xbdf0,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        12},    //dm_angctrstpun_lut_p17
    {0xbdf0,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        9},     //dm_angctrstpun_lut_p16
    /*vpss_dm_angctrst_lut5*/
    {0xbdf4,        24,     29,     0,      0,      HI_PQ_MODULE_DM,        25},    //dm_angctrstpun_lut_p25
    {0xbdf4,        18,     23,     0,      0,      HI_PQ_MODULE_DM,        24},    //dm_angctrstpun_lut_p24
    {0xbdf4,        12,     17,     0,      0,      HI_PQ_MODULE_DM,        23},    //dm_angctrstpun_lut_p23
    {0xbdf4,        6,      11,     0,      0,      HI_PQ_MODULE_DM,        22},    //dm_angctrstpun_lut_p22
    {0xbdf4,        0,      5,      0,      0,      HI_PQ_MODULE_DM,        21},    //dm_angctrstpun_lut_p21

    /***********************************************SNR***********************************************/
    /*vpss_snr_enable*/
    {0xbd00,        7,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //test_en
    {0xbd00,        5,      5,      0,      0,      HI_PQ_MODULE_SNR,       1},     //edgeprefilteren
    {0xbd00,        4,      4,      0,      0,      HI_PQ_MODULE_SNR,       0},     //colorweighten
    {0xbd00,        3,      3,      0,      0,      HI_PQ_MODULE_SNR,       1},     //motionedgeweighten
    {0xbd00,        2,      2,      0,      0,      HI_PQ_MODULE_SNR,       0},     //cnr2den
    {0xbd00,        1,      1,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ynr2den
    /*vpss_snr_edge_ratiorange*/
    {0xbd04,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       15},    //edgeoriratio
    {0xbd04,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       1},     //edgeminratio
    {0xbd04,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       15},    //edgemaxratio
    /*vpss_snr_edge_strrange*/
    {0xbd08,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //edgeoristrength
    {0xbd08,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //edgeminstrength
    {0xbd08,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       15},    //edgemaxstrength
    /*vpss_snr_edge_strth*/
    {0xbd0c,        20,     29,     0,      0,      HI_PQ_MODULE_SNR,       24},    //edgestrth3
    {0xbd0c,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       16},    //edgestrth2
    {0xbd0c,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       8},     //edgestrth1
    /*vpss_snr_edge_strk*/
    {0xbd10,        12,     17,     0,      0,      HI_PQ_MODULE_SNR,       32},    //edgestrk3
    {0xbd10,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       32},    //edgestrk2
    {0xbd10,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       16},    //edgestrk1
    /*vpss_snr_edge_meanth1*/
    {0xbd14,        20,     29,     0,      0,      HI_PQ_MODULE_SNR,       128},   //edgemeanth3
    {0xbd14,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       90},    //edgemeanth2
    {0xbd14,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       64},    //edgemeanth1
    /*vpss_snr_edge_meanth2*/
    {0xbd18,        20,     29,     0,      0,      HI_PQ_MODULE_SNR,       300},   //edgemeanth6
    {0xbd18,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       196},   //edgemeanth5
    {0xbd18,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       164},   //edgemeanth4
    /*vpss_snr_edge_meanth3*/
    {0xbd1c,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       768},   //edgemeanth8
    {0xbd1c,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       512},   //edgemeanth7
    /*vpss_snr_edge_meank1*/
    {0xbd20,        18,     23,     0,      0,      HI_PQ_MODULE_SNR,       24},    //edgemeank4
    {0xbd20,        12,     17,     0,      0,      HI_PQ_MODULE_SNR,       32},    //edgemeank3
    {0xbd20,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       24},    //edgemeank2
    {0xbd20,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       0},     //edgemeank1
    /*vpss_snr_edge_meank2*/
    {0xbd24,        18,     23,     0,      0,      HI_PQ_MODULE_SNR,       8},     //edgemeank8
    {0xbd24,        12,     17,     0,      0,      HI_PQ_MODULE_SNR,       8},     //edgemeank7
    {0xbd24,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       12},    //edgemeank6
    {0xbd24,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       20},    //edgemeank5
    /*vpss_snr_win*/
    {0xbd28,        13,     14,     0,      0,      HI_PQ_MODULE_SNR,       3},     //c2dwinheight
    {0xbd28,        9,      12,     0,      0,      HI_PQ_MODULE_SNR,       5},     //c2dwinwidth
    {0xbd28,        5,      8,      0,      0,      HI_PQ_MODULE_SNR,       5},     //y2dwinheight
    {0xbd28,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       9},     //y2dwinwidth
    /*vpss_snr_str*/
    {0xbd2c,        8,      15,     0,      0,      HI_PQ_MODULE_SNR,       24},    //csnrstr
    {0xbd2c,        0,      7,      0,      0,      HI_PQ_MODULE_SNR,       24},    //ysnrstr
    /*vpss_snr_str_offset*/
    {0xbd30,        6,      7,      0,      0,      HI_PQ_MODULE_SNR,       3},     //stroffset3
    {0xbd30,        4,      5,      0,      0,      HI_PQ_MODULE_SNR,       2},     //stroffset2
    {0xbd30,        2,      3,      0,      0,      HI_PQ_MODULE_SNR,       1},     //stroffset1
    {0xbd30,        0,      1,      0,      0,      HI_PQ_MODULE_SNR,       0},     //stroffset0
    /*vpss_snr_str_adjust*/
    {0xbd34,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       16},    //cstradjust
    {0xbd34,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       16},    //ystradjust
    /*vpss_snr_schange_th*/
    {0xbd38,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       3},     //scenechangeth
    /*vpss_snr_edge_ratio_1*/
    {0xbd3c,        18,     26,     0,      0,      HI_PQ_MODULE_SNR,       22},    //ratio3
    {0xbd3c,        9,      17,     0,      0,      HI_PQ_MODULE_SNR,       28},    //ratio2
    {0xbd3c,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       30},    //ratio1
    /*vpss_snr_edge_ratio_2*/
    {0xbd40,        18,     26,     0,      0,      HI_PQ_MODULE_SNR,       11},    //ratio6
    {0xbd40,        9,      17,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ratio5
    {0xbd40,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       19},    //ratio4
    /*vpss_snr_edge_ratio_3*/
    {0xbd44,        9,      17,     0,      0,      HI_PQ_MODULE_SNR,       0},     //ratio8
    {0xbd44,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       4},     //ratio7
    /*vpss_snr_edge_str*/
    {0xbd48,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       15},    //edge3
    {0xbd48,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       12},    //edge2
    {0xbd48,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       4},     //edge1
    /*vpss_snr_test_color*/
    {0xbd4c,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       512},   //test_color_cr
    {0xbd4c,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       512},   //test_color_cb
    /*vpss_snr_schange*/
    {0xbd50,        30,     30,     0,      0,      HI_PQ_MODULE_SNR,       0},     //scenechange_mode2_en
    {0xbd50,        20,     29,     0,      0,      HI_PQ_MODULE_SNR,       0},     //scenechange_bldcore
    {0xbd50,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       96},    //scenechange_bldk
    {0xbd50,        9,      9,      0,      0,      HI_PQ_MODULE_SNR,       0},     //scenechange_mode1_en
    {0xbd50,        8,      8,      0,      0,      HI_PQ_MODULE_SNR,       0},     //scenechange_en
    {0xbd50,        0,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //scenechange_info
    /*vpss_snr_mt*/
    {0xbd54,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       8},     //motionalpha
    /*vpss_snr_cbcr_w1*/
    {0xbd58,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //cbcr_weight1
    {0xbd58,        18,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cr_end1
    {0xbd58,        12,     17,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cb_end1
    {0xbd58,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cr_begin1
    {0xbd58,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       0},     //cb_begin1
    /*vpss_snr_cbcr_w2*/
    {0xbd5c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //cbcr_weight2
    {0xbd5c,        18,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cr_end2
    {0xbd5c,        12,     17,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cb_end2
    {0xbd5c,        6,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //cr_begin2
    {0xbd5c,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       0},     //cb_begin2
    /*vpss_motion_edge_lut_01*/
    {0xbd60,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut07
    {0xbd60,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut06
    {0xbd60,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut05
    {0xbd60,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut04
    {0xbd60,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut03
    {0xbd60,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut02
    {0xbd60,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut01
    {0xbd60,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut00
    /*vpss_motion_edge_lut_02*/
    {0xbd64,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut0f
    {0xbd64,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut0e
    {0xbd64,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut0d
    {0xbd64,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut0c
    {0xbd64,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut0b
    {0xbd64,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut0a
    {0xbd64,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut09
    {0xbd64,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut08
    /*vpss_motion_edge_lut_03*/
    {0xbd68,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut17
    {0xbd68,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut16
    {0xbd68,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut15
    {0xbd68,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut14
    {0xbd68,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut13
    {0xbd68,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut12
    {0xbd68,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut11
    {0xbd68,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut10
    /*vpss_motion_edge_lut_04*/
    {0xbd6c,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut1f
    {0xbd6c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut1e
    {0xbd6c,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut1d
    {0xbd6c,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut1c
    {0xbd6c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut1b
    {0xbd6c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut1a
    {0xbd6c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut19
    {0xbd6c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut18
    /*vpss_motion_edge_lut_05*/
    {0xbd70,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut27
    {0xbd70,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut26
    {0xbd70,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut25
    {0xbd70,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut24
    {0xbd70,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut23
    {0xbd70,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut22
    {0xbd70,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut21
    {0xbd70,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut20
    /*vpss_motion_edge_lut_06*/
    {0xbd74,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut2f
    {0xbd74,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut2e
    {0xbd74,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut2d
    {0xbd74,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut2c
    {0xbd74,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut2b
    {0xbd74,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut2a
    {0xbd74,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut29
    {0xbd74,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut28
    /*vpss_motion_edge_lut_07*/
    {0xbd78,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut37
    {0xbd78,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut36
    {0xbd78,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut35
    {0xbd78,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut34
    {0xbd78,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut33
    {0xbd78,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut32
    {0xbd78,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut31
    {0xbd78,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut30
    /*vpss_motion_edge_lut_08*/
    {0xbd7c,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut3f
    {0xbd7c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut3e
    {0xbd7c,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut3d
    {0xbd7c,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut3c
    {0xbd7c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut3b
    {0xbd7c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut3a
    {0xbd7c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut39
    {0xbd7c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut38
    /*vpss_motion_edge_lut_09*/
    {0xbd80,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut47
    {0xbd80,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut46
    {0xbd80,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut45
    {0xbd80,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut44
    {0xbd80,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut43
    {0xbd80,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut42
    {0xbd80,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut41
    {0xbd80,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut40
    /*vpss_motion_edge_lut_10*/
    {0xbd84,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut4f
    {0xbd84,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut4e
    {0xbd84,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut4d
    {0xbd84,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut4c
    {0xbd84,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut4b
    {0xbd84,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut4a
    {0xbd84,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut49
    {0xbd84,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut48
    /*vpss_motion_edge_lut_11*/
    {0xbd88,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut57
    {0xbd88,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut56
    {0xbd88,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut55
    {0xbd88,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut54
    {0xbd88,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut53
    {0xbd88,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut52
    {0xbd88,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut51
    {0xbd88,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut50
    /*vpss_motion_edge_lut_12*/
    {0xbd8c,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lut5f
    {0xbd8c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut5e
    {0xbd8c,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut5d
    {0xbd8c,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut5c
    {0xbd8c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut5b
    {0xbd8c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut5a
    {0xbd8c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut59
    {0xbd8c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut58
    /*vpss_motion_edge_lut_13*/
    {0xbd90,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut67
    {0xbd90,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut66
    {0xbd90,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut65
    {0xbd90,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut64
    {0xbd90,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut63
    {0xbd90,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut62
    {0xbd90,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut61
    {0xbd90,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut60
    /*vpss_motion_edge_lut_14*/
    {0xbd94,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lut6f
    {0xbd94,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lut6e
    {0xbd94,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut6d
    {0xbd94,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut6c
    {0xbd94,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut6b
    {0xbd94,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut6a
    {0xbd94,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut69
    {0xbd94,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut68
    /*vpss_motion_edge_lut_15*/
    {0xbd98,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut77
    {0xbd98,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut76
    {0xbd98,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut75
    {0xbd98,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut74
    {0xbd98,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut73
    {0xbd98,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut72
    {0xbd98,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut71
    {0xbd98,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut70
    /*vpss_motion_edge_lut_16*/
    {0xbd9c,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lut7f
    {0xbd9c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lut7e
    {0xbd9c,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lut7d
    {0xbd9c,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut7c
    {0xbd9c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut7b
    {0xbd9c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut7a
    {0xbd9c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut79
    {0xbd9c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut78
    /*vpss_motion_edge_lut_17*/
    {0xbda0,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut87
    {0xbda0,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut86
    {0xbda0,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut85
    {0xbda0,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut84
    {0xbda0,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut83
    {0xbda0,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut82
    {0xbda0,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut81
    {0xbda0,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut80
    /*vpss_motion_edge_lut_18*/
    {0xbda4,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lut8f
    {0xbda4,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lut8e
    {0xbda4,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lut8d
    {0xbda4,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lut8c
    {0xbda4,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut8b
    {0xbda4,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut8a
    {0xbda4,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut89
    {0xbda4,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut88
    /*vpss_motion_edge_lut_19*/
    {0xbda8,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lut97
    {0xbda8,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lut96
    {0xbda8,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lut95
    {0xbda8,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lut94
    {0xbda8,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lut93
    {0xbda8,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lut92
    {0xbda8,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_lut91
    {0xbda8,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //motion_edge_lut90
    /*vpss_motion_edge_lut_20*/
    {0xbdac,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lut9f
    {0xbdac,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lut9e
    {0xbdac,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lut9d
    {0xbdac,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lut9c
    {0xbdac,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lut9b
    {0xbdac,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lut9a
    {0xbdac,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lut99
    {0xbdac,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lut98
    /*vpss_motion_edge_lut_21*/
    {0xbdb0,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_luta7
    {0xbdb0,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_luta6
    {0xbdb0,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_luta5
    {0xbdb0,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_luta4
    {0xbdb0,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_luta3
    {0xbdb0,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_luta2
    {0xbdb0,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_luta1
    {0xbdb0,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       1},     //motion_edge_luta0
    /*vpss_motion_edge_lut_22*/
    {0xbdb4,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutaf
    {0xbdb4,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutae
    {0xbdb4,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutad
    {0xbdb4,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lutac
    {0xbdb4,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lutab
    {0xbdb4,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lutaa
    {0xbdb4,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_luta9
    {0xbdb4,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_luta8
    /*vpss_motion_edge_lut_23*/
    {0xbdb8,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lutb7
    {0xbdb8,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lutb6
    {0xbdb8,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lutb5
    {0xbdb8,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lutb4
    {0xbdb8,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lutb3
    {0xbdb8,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lutb2
    {0xbdb8,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lutb1
    {0xbdb8,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       2},     //motion_edge_lutb0
    /*vpss_motion_edge_lut_24*/
    {0xbdbc,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutbf
    {0xbdbc,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutbe
    {0xbdbc,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutbd
    {0xbdbc,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutbc
    {0xbdbc,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lutbb
    {0xbdbc,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lutba
    {0xbdbc,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lutb9
    {0xbdbc,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lutb8
    /*vpss_motion_edge_lut_25*/
    {0xbdc0,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lutc7
    {0xbdc0,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lutc6
    {0xbdc0,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lutc5
    {0xbdc0,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lutc4
    {0xbdc0,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lutc3
    {0xbdc0,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lutc2
    {0xbdc0,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lutc1
    {0xbdc0,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       3},     //motion_edge_lutc0
    /*vpss_motion_edge_lut_26*/
    {0xbdc4,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutcf
    {0xbdc4,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutce
    {0xbdc4,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutcd
    {0xbdc4,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutcc
    {0xbdc4,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutcb
    {0xbdc4,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lutca
    {0xbdc4,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lutc9
    {0xbdc4,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lutc8
    /*vpss_motion_edge_lut_27*/
    {0xbdc8,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lutd7
    {0xbdc8,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lutd6
    {0xbdc8,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lutd5
    {0xbdc8,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lutd4
    {0xbdc8,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lutd3
    {0xbdc8,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lutd2
    {0xbdc8,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lutd1
    {0xbdc8,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       4},     //motion_edge_lutd0
    /*vpss_motion_edge_lut_28*/
    {0xbdcc,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutdf
    {0xbdcc,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutde
    {0xbdcc,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutdd
    {0xbdcc,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutdc
    {0xbdcc,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutdb
    {0xbdcc,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutda
    {0xbdcc,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lutd9
    {0xbdcc,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lutd8
    /*vpss_motion_edge_lut_29*/
    {0xbdd0,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lute7
    {0xbdd0,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lute6
    {0xbdd0,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lute5
    {0xbdd0,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lute4
    {0xbdd0,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lute3
    {0xbdd0,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lute2
    {0xbdd0,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lute1
    {0xbdd0,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       5},     //motion_edge_lute0
    /*vpss_motion_edge_lut_30*/
    {0xbdd4,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutef
    {0xbdd4,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutee
    {0xbdd4,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_luted
    {0xbdd4,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutec
    {0xbdd4,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_luteb
    {0xbdd4,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutea
    {0xbdd4,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lute9
    {0xbdd4,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lute8
    /*vpss_motion_edge_lut_31*/
    {0xbdd8,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       13},    //motion_edge_lutf7
    {0xbdd8,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       12},    //motion_edge_lutf6
    {0xbdd8,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       11},    //motion_edge_lutf5
    {0xbdd8,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       10},    //motion_edge_lutf4
    {0xbdd8,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       9},     //motion_edge_lutf3
    {0xbdd8,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       8},     //motion_edge_lutf2
    {0xbdd8,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       7},     //motion_edge_lutf1
    {0xbdd8,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       6},     //motion_edge_lutf0
    /*vpss_motion_edge_lut_32*/
    {0xbddc,        28,     31,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutff
    {0xbddc,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutfe
    {0xbddc,        20,     23,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutfd
    {0xbddc,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutfc
    {0xbddc,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutfb
    {0xbddc,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       15},    //motion_edge_lutfa
    {0xbddc,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutf9
    {0xbddc,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       14},    //motion_edge_lutf8

    /***********************************************CCS_2D***********************************************/
    /*ccs_2d_ctrl*/
    {0xbe00,        1,      1,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_ncbg_en
    {0xbe00,        2,      2,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_hfde_en
    {0xbe00,        3,      3,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_dir_en
    {0xbe00,        4,      4,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_hfde_motion_en
    {0xbe00,        5,      5,      0,      0,      HI_PQ_MODULE_SNR,       50},    //ccs_2d_glbcc_en
    /*ccs_2d_delta*/
    {0xbe04,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       512},   //gray_mean_num
    {0xbe04,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       5},     //u16cen_delta
    {0xbe04,        20,     29,     0,      0,      HI_PQ_MODULE_SNR,       5},     //u16sur_delta
    /*ccs_2d_ncbg_cnt*/
    {0xbe08,        0,      9,      0,      0,      HI_PQ_MODULE_SNR,       13},    //u16stage_ncbg_cen_delta
    {0xbe08,        10,     19,     0,      0,      HI_PQ_MODULE_SNR,       13},    //u16stage_ncbg_sur_delta
    /*ccs_2d_ncbg_delta*/
    {0xbe0c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       4},     //u16stage_ncbg_graybg_shift
    {0xbe0c,        4,      13,     0,      0,      HI_PQ_MODULE_SNR,       5},     //u16stage_ncbg_graybg_offset
    {0xbe0c,        14,     23,     0,      0,      HI_PQ_MODULE_SNR,       0},     //u16stage_ncbg_ees_offset
    {0xbe0c,        24,     27,     0,      0,      HI_PQ_MODULE_SNR,       5},     //u16stage_ncbg_ees_shift
    /*ccs_2d_dir_th*/
    {0xbe10,        0,      5,      0,      0,      HI_PQ_MODULE_SNR,       41},    //u16stage_ncbg_consnum
    {0xbe10,        11,     17,     0,      0,      HI_PQ_MODULE_SNR,       80},    //hfde_delta
    {0xbe10,        18,     18,     0,      0,      HI_PQ_MODULE_SNR,       1},     //dir_bwlow
    {0xbe10,        19,     27,     0,      0,      HI_PQ_MODULE_SNR,       100},   //dir_dia_diff_minth
    /*ccs_2d_c_th*/
    {0xbe14,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       6},     //dir_dia_diff_mingain
    {0xbe14,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       4},     //dir_hedge_hv_cdiff_gain
    {0xbe14,        10,     17,     0,      0,      HI_PQ_MODULE_SNR,       20},    //dir_hedge_ver_cdiff_th
    {0xbe14,        18,     25,     0,      0,      HI_PQ_MODULE_SNR,       9},     //dir_hedge_hor_ydiff_th
    /*ccs_2d_grad_th0*/
    {0xbe18,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       20},    //dir_cdiff_th0
    {0xbe18,        9,      17,     0,      0,      HI_PQ_MODULE_SNR,       40},    //dir_cdiff_th1
    {0xbe18,        18,     26,     0,      0,      HI_PQ_MODULE_SNR,       70},    //dir_cdiff_th2
    /*ccs_2d_grad_th1*/
    {0xbe1c,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       80},    //dir_cdiff_th3
    {0xbe1c,        9,      17,     0,      0,      HI_PQ_MODULE_SNR,       120},   //dir_cdiff_th4
    {0xbe1c,        18,     26,     0,      0,      HI_PQ_MODULE_SNR,       160},   //dir_cdiff_th5
    /*ccs_2d_cdiff*/
    {0xbe20,        0,      8,      0,      0,      HI_PQ_MODULE_SNR,       200},   //dir_cdiff_th6
    {0xbe20,        9,      12,     0,      0,      HI_PQ_MODULE_SNR,       4},     //dir_cdiff_range
    {0xbe20,        13,     19,     0,      0,      HI_PQ_MODULE_SNR,       40},    //dir_hf_region_th
    /*ccs_2d_glbcc_th*/
    {0xbe24,        8,      12,     0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_glbcc_ratio
    {0xbe24,        13,     31,     0,      0,      HI_PQ_MODULE_SNR,       0},     //reserved
    /*ccs_2d_high_freq_lut0*/
    {0xbe28,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_high_freq_lut_0
    {0xbe28,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_high_freq_lut_1
    {0xbe28,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_high_freq_lut_2
    {0xbe28,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_high_freq_lut_3
    /*ccs_2d_high_freq_lut1*/
    {0xbe2c,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       2},     //ccs_2d_high_freq_lut_4
    {0xbe2c,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       4},     //ccs_2d_high_freq_lut_5
    {0xbe2c,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_high_freq_lut_6
    {0xbe2c,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       10},    //ccs_2d_high_freq_lut_7
    /*ccs_2d_high_freq_lut2*/
    {0xbe30,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       12},    //ccs_2d_high_freq_lut_8
    {0xbe30,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       14},    //ccs_2d_high_freq_lut_9
    {0xbe30,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_10
    {0xbe30,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_11
    /*ccs_2d_high_freq_lut3*/
    {0xbe34,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_12
    {0xbe34,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_13
    {0xbe34,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_14
    {0xbe34,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_high_freq_lut_15
    /*ccs_2d_gray_bg_lut0*/
    {0xbe38,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_gray_bg_lut_0
    {0xbe38,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       2},     //ccs_2d_gray_bg_lut_1
    {0xbe38,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_gray_bg_lut_2
    {0xbe38,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_bg_lut_3
    /*ccs_2d_gray_bg_lut1*/
    {0xbe3c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_bg_lut_4
    {0xbe3c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_bg_lut_5
    {0xbe3c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_bg_lut_6
    {0xbe3c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_bg_lut_7
    /*ccs_2d_gray_cc_lut0*/
    {0xbe40,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_gray_cc_lut_0
    {0xbe40,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_gray_cc_lut_1
    {0xbe40,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       2},     //ccs_2d_gray_cc_lut_2
    {0xbe40,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       5},     //ccs_2d_gray_cc_lut_3
    /*ccs_2d_gray_cc_lut1*/
    {0xbe44,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_gray_cc_lut_4
    {0xbe44,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_gray_cc_lut_5
    {0xbe44,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_gray_cc_lut_6
    {0xbe44,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_gray_cc_lut_7
    /*ccs_2d_ec_lut0*/
    {0xbe48,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_ec_lut_0
    {0xbe48,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_ec_lut_1
    {0xbe48,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       2},     //ccs_2d_ec_lut_2
    {0xbe48,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       3},     //ccs_2d_ec_lut_3
    /*ccs_2d_ec_lut1*/
    {0xbe4c,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       4},     //ccs_2d_ec_lut_4
    {0xbe4c,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       6},     //ccs_2d_ec_lut_5
    {0xbe4c,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       7},     //ccs_2d_ec_lut_6
    {0xbe4c,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       9},     //ccs_2d_ec_lut_7
    /*ccs_2d_ec_lut2*/
    {0xbe50,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       11},    //ccs_2d_ec_lut_8
    {0xbe50,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       13},    //ccs_2d_ec_lut_9
    {0xbe50,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       15},    //ccs_2d_ec_lut_10
    {0xbe50,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_ec_lut_11
    /*ccs_2d_ec_lut3*/
    {0xbe54,        0,      4,      0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_ec_lut_12
    {0xbe54,        5,      9,      0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_ec_lut_13
    {0xbe54,        10,     14,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_ec_lut_14
    {0xbe54,        15,     19,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_2d_ec_lut_15
    /*ccs_2d_motion_lut0*/
    {0xbe58,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       0},     //ccs_2d_motion_lut_0
    {0xbe58,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_2d_motion_lut_1
    {0xbe58,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       2},     //ccs_2d_motion_lut_2
    {0xbe58,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       3},     //ccs_2d_motion_lut_3
    {0xbe58,        16,     19,     0,      0,      HI_PQ_MODULE_SNR,       1},     //ccs_mincnt_th
    {0xbe58,        20,     25,     0,      0,      HI_PQ_MODULE_SNR,       16},    //ccs_mincnt_slop
    /*ccs_2d_motion_lut1*/
    {0xbe5c,        0,      3,      0,      0,      HI_PQ_MODULE_SNR,       5},     //ccs_2d_motion_lut_4
    {0xbe5c,        4,      7,      0,      0,      HI_PQ_MODULE_SNR,       6},     //ccs_2d_motion_lut_5
    {0xbe5c,        8,      11,     0,      0,      HI_PQ_MODULE_SNR,       7},     //ccs_2d_motion_lut_6
    {0xbe5c,        12,     15,     0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_2d_motion_lut_7
    {0xbe5c,        16,     22,     0,      0,      HI_PQ_MODULE_SNR,       -32},   //ccs_cesdiff_th
    {0xbe5c,        23,     29,     0,      0,      HI_PQ_MODULE_SNR,       8},     //ccs_cesdiff_slop
    /*cbcrv5h1flt*/
    {0xbe60,        0,      0,      0,      0,      HI_PQ_MODULE_SNR,       0},     //cbcrv5h1flt_mode
    {0xbe60,        1,      5,      0,      0,      HI_PQ_MODULE_SNR,       3},     //cbcrv5h1flt_lut0
    {0xbe60,        6,      10,     0,      0,      HI_PQ_MODULE_SNR,       16},    //cbcrv5h1flt_lut1

    /*************************************TNR****************************************/
    /*SD*/
    /*Addr       Lsb     Msb  SourceMode OutputMode       Module           Value       Description*/
    /***********************************************TNR***********************************************/
    /*v0_vpss_ctrl*/
    //{0x2020,        2,      2,      1,      0,      HI_PQ_MODULE_TNR,       1},     //mcnr_en
    //{0x2020,        18,     18,     1,      0,      HI_PQ_MODULE_TNR,       1},     //tnr_en
    /*vpss_tnr_ctrl*/
    {0xb700,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       1},     //nren
    {0xb700,        1,      1,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_en
    {0xb700,        2,      2,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_2d_en /* no cls_2d logic*/
    {0xb700,        3,      3,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_3d_en
    {0xb700,        4,      4,      1,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_3d_en
    {0xb700,        5,      5,      1,      0,      HI_PQ_MODULE_TNR,       0},     //market_mode_en
    {0xb700,        6,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //market_mode
    {0xb700,        7,      19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //market_coor
    /*vpss_tnr_reg1*/
    {0xb704,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       0},     //scd_en
    {0xb704,        1,      1,      1,      0,      HI_PQ_MODULE_TNR,       0},     //scd_lowcost_en
    {0xb704,        2,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //scd_k_pixy
    {0xb704,        8,      8,      1,      0,      HI_PQ_MODULE_TNR,       1},     //ma_nd_en
    {0xb704,        9,      10,     1,      0,      HI_PQ_MODULE_TNR,       3},     //random_ctrl_mode
    {0xb704,        11,     18,     1,      0,      HI_PQ_MODULE_TNR,       12},    //flat_thd_min
    {0xb704,        19,     26,     1,      0,      HI_PQ_MODULE_TNR,       20},    //flat_thd_med
    /*vpss_tnr_reg2*/
    {0xb708,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       35},    //flat_thd_max
    {0xb708,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       32},    //blk_diff_thd
    {0xb708,        16,     16,     1,      0,      HI_PQ_MODULE_TNR,       1},     //ma_md_en
    {0xb708,        17,     26,     1,      0,      HI_PQ_MODULE_TNR,       512},   //colorless_val
    {0xb708,        27,     27,     1,      0,      HI_PQ_MODULE_TNR,       1},     //md_pre_lpf_en
    {0xb708,        28,     30,     1,      0,      HI_PQ_MODULE_TNR,       0},     //alpha1
    /*vpss_tnr_reg3*/
    {0xb70c,        0,      2,      1,      0,      HI_PQ_MODULE_TNR,       0},     //alpha2
    /*vpss_tnr_reg4*/
    {0xb710,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_en
    {0xb710,        1,      8,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_x_0
    {0xb710,        9,      16,     1,      0,      HI_PQ_MODULE_TNR,       8},     //y_mean_motion_adj_x_1
    {0xb710,        17,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_x_2
    /*vpss_tnr_reg5*/
    {0xb714,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       32},    //y_mean_motion_adj_x_3
    {0xb714,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       64},    //y_mean_motion_adj_x_4
    {0xb714,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       128},   //y_mean_motion_adj_x_5
    {0xb714,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       192},   //y_mean_motion_adj_y_0
    /*vpss_tnr_reg6*/
    {0xb718,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_1
    {0xb718,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_2
    {0xb718,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_3
    {0xb718,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_4
    /*vpss_tnr_reg7*/
    {0xb71c,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_5
    {0xb71c,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_0
    {0xb71c,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_1
    {0xb71c,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_2
    /*vpss_tnr_reg8*/
    {0xb720,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_3
    {0xb720,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_4
    {0xb720,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       255},   //y_mean_motion_adj_max
    {0xb720,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_min
    /*vpss_tnr_reg9*/
    {0xb724,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_en
    {0xb724,        1,      8,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_x_0
    {0xb724,        9,      16,     1,      0,      HI_PQ_MODULE_TNR,       8},     //c_mean_motion_adj_x_1
    {0xb724,        17,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_x_2
    /*vpss_tnr_reg10*/
    {0xb728,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       32},    //c_mean_motion_adj_x_3
    {0xb728,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       64},    //c_mean_motion_adj_x_4
    {0xb728,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       128},   //c_mean_motion_adj_x_5
    {0xb728,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       192},   //c_mean_motion_adj_y_0
    /*vpss_tnr_reg11*/
    {0xb72c,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_1
    {0xb72c,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_2
    {0xb72c,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_3
    {0xb72c,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_4
    /*vpss_tnr_reg12*/
    {0xb730,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_5
    {0xb730,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_0
    {0xb730,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_1
    {0xb730,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_2
    /*vpss_tnr_reg13*/
    {0xb734,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_3
    {0xb734,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_4
    {0xb734,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       255},   //c_mean_motion_adj_max
    {0xb734,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_min
    /*vpss_tnr_reg14*/
    {0xb738,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       24},    //y_md_gain
    {0xb738,        6,      11,     1,      0,      HI_PQ_MODULE_TNR,       24},    //c_md_gain
    {0xb738,        12,     13,     1,      0,      HI_PQ_MODULE_TNR,       3},     //y_md_lpf_mode
    {0xb738,        14,     15,     1,      0,      HI_PQ_MODULE_TNR,       3},     //c_md_lpf_mode
    {0xb738,        16,     16,     1,      0,      HI_PQ_MODULE_TNR,       1},     //ma_me_en
    {0xb738,        17,     18,     1,      0,      HI_PQ_MODULE_TNR,       0},     //mv_ref_mode
    {0xb738,        19,     20,     1,      0,      HI_PQ_MODULE_TNR,       1},     //mv_lpf_mode
    {0xb738,        21,     21,     1,      0,      HI_PQ_MODULE_TNR,       0},     //discard_smv_x_en
    {0xb738,        22,     22,     1,      0,      HI_PQ_MODULE_TNR,       0},     //discard_smv_y_en
    {0xb738,        23,     25,     1,      0,      HI_PQ_MODULE_TNR,       0},     //smv_x_thd
    {0xb738,        26,     28,     1,      0,      HI_PQ_MODULE_TNR,       0},     //smv_y_thd
    /*vpss_tnr_reg15*/
    {0xb73c,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       127},   //mag_pnl_gain_0mv
    {0xb73c,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       63},    //mag_pnl_core_0mv
    {0xb73c,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       127},   //mag_pnl_gain_xmv
    {0xb73c,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       63},    //mag_pnl_core_xmv
    /*vpss_tnr_reg16*/
    {0xb740,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       31},    //std_pnl_gain
    {0xb740,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //std_pnl_core
    {0xb740,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       4},     //adj_0mv_min
    {0xb740,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       4},     //adj_xmv_min
    {0xb740,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //adj_0mv_max
    {0xb740,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       16},    //adj_xmv_max
    /*vpss_tnr_reg17*/
    {0xb744,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       24},    //adj_mv_max
    {0xb744,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       16},    //adj_mv_min
    {0xb744,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       28},    //std_core_0mv
    {0xb744,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //std_core_xmv
    {0xb744,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_gain_0mv
    {0xb744,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_core_0mv
    /*vpss_tnr_reg18*/
    {0xb748,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_gain_xmv
    {0xb748,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_core_xmv
    {0xb748,        10,     12,     1,      0,      HI_PQ_MODULE_TNR,       0},     //gm_adj
    {0xb748,        13,     13,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cb_cr_update_en
    {0xb748,        14,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cb_begin_1
    {0xb748,        20,     25,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cr_begin_1
    {0xb748,        26,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cb_end_1
    /*vpss_tnr_reg19*/
    {0xb74c,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cr_end_1
    {0xb74c,        6,      9,      1,      0,      HI_PQ_MODULE_TNR,       15},    //cb_cr_weight_1
    {0xb74c,        10,     16,     1,      0,      HI_PQ_MODULE_TNR,       0},     //motion_val_1
    {0xb74c,        17,     22,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cb_begin_2
    {0xb74c,        23,     28,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cr_begin_2
    /*vpss_tnr_reg20*/
    {0xb750,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cb_end_2
    {0xb750,        6,      11,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cr_end_2
    {0xb750,        12,     15,     1,      0,      HI_PQ_MODULE_TNR,       15},    //cb_cr_weight_2
    {0xb750,        16,     22,     1,      0,      HI_PQ_MODULE_TNR,       0},     //motion_val_2
    {0xb750,        23,     23,     1,      0,      HI_PQ_MODULE_TNR,       0},     //scene_change_en
    {0xb750,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //scene_change_val
    /*vpss_tnr_reg21*/
    {0xb754,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       1},     //pre_motion_merge_en
    {0xb754,        1,      5,      1,      0,      HI_PQ_MODULE_TNR,       16},    //pre_motion_alpha
    {0xb754,        6,      10,     1,      0,      HI_PQ_MODULE_TNR,       16},    //motion_merge_ratio
    {0xb754,        11,     15,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_mc_gain
    {0xb754,        16,     21,     1,      0,      HI_PQ_MODULE_TNR,       5},     //y_mc_core
    {0xb754,        22,     26,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_mc_gain
    /*vpss_tnr_reg22*/
    {0xb758,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       5},     //c_mc_core
    {0xb758,        6,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //saltus_dect_en
    {0xb758,        7,      11,     1,      0,      HI_PQ_MODULE_TNR,       0},     //saltus_level
    {0xb758,        12,     12,     1,      0,      HI_PQ_MODULE_TNR,       1},     //y_mc_adj_en
    {0xb758,        13,     13,     1,      0,      HI_PQ_MODULE_TNR,       1},     //c_mc_adj_en
    {0xb758,        14,     19,     1,      0,      HI_PQ_MODULE_TNR,       -5},    //y_md_core
    {0xb758,        20,     25,     1,      0,      HI_PQ_MODULE_TNR,       -5},    //c_md_core
    /*vpss_tnr_reg23*/
    {0xb75c,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_x_0
    {0xb75c,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       4},     //y_motion_mapping_x_1
    {0xb75c,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       8},     //y_motion_mapping_x_2
    {0xb75c,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_x_3
    /*vpss_tnr_reg24*/
    {0xb760,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_x_4
    {0xb760,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       127},   //y_motion_mapping_x_5
    /*vpss_tnr_reg25*/
    {0xb764,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_y_0
    {0xb764,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       4},     //y_motion_mapping_y_1
    {0xb764,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //y_motion_mapping_y_2
    {0xb764,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_y_3
    {0xb764,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_y_4
    {0xb764,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_y_5
    /*vpss_tnr_reg26*/
    {0xb768,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_0
    {0xb768,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_1
    {0xb768,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_2
    {0xb768,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_3
    /*vpss_tnr_reg27*/
    {0xb76c,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_k_4
    /*vpss_tnr_reg28*/
    {0xb770,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_max
    {0xb770,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_min
    /*vpss_tnr_reg29*/
    {0xb774,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_x_0
    {0xb774,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       4},     //c_motion_mapping_x_1
    {0xb774,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       8},     //c_motion_mapping_x_2
    {0xb774,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_x_3
    /*vpss_tnr_reg30*/
    {0xb778,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_x_4
    {0xb778,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       127},   //c_motion_mapping_x_5
    /*vpss_tnr_reg31*/
    {0xb77c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_y_0
    {0xb77c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       4},     //c_motion_mapping_y_1
    {0xb77c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //c_motion_mapping_y_2
    {0xb77c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_y_3
    {0xb77c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_y_4
    {0xb77c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_y_5
    /*vpss_tnr_reg32*/
    {0xb780,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_0
    {0xb780,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_1
    {0xb780,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_2
    {0xb780,        24,     31,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_3
    /*vpss_tnr_reg33*/
    {0xb784,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_k_4
    /*vpss_tnr_reg34*/
    {0xb788,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_max
    {0xb788,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_min
    /*vpss_tnr_reg35*/
    {0xb78c,        0,      1,      1,      0,      HI_PQ_MODULE_TNR,       3},     //y_mc_lpf_mode
    {0xb78c,        2,      3,      1,      0,      HI_PQ_MODULE_TNR,       3},     //c_mc_lpf_mode
    {0xb78c,        4,      5,      1,      0,      HI_PQ_MODULE_TNR,       0},     //share_motion_mode
    {0xb78c,        6,      10,     1,      0,      HI_PQ_MODULE_TNR,       0},     //noise_level
    {0xb78c,        11,     15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //global_motion
    {0xb78c,        16,     16,     1,      0,      HI_PQ_MODULE_TNR,       1},     //nr_en
    {0xb78c,        17,     17,     1,      0,      HI_PQ_MODULE_TNR,       1},     //y_tnr_en
    {0xb78c,        18,     18,     1,      0,      HI_PQ_MODULE_TNR,       1},     //c_tnr_en
    {0xb78c,        19,     23,     1,      0,      HI_PQ_MODULE_TNR,       2},     //y_no_nr_range
    {0xb78c,        24,     28,     1,      0,      HI_PQ_MODULE_TNR,       1},     //c_no_nr_range
    {0xb78c,        29,     29,     1,      0,      HI_PQ_MODULE_TNR,       1},     //y_motion_mode
    {0xb78c,        30,     30,     1,      0,      HI_PQ_MODULE_TNR,       1},     //c_motion_mode
    {0xb78c,        31,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //y_round_en
    /*vpss_tnr_reg36*/
    {0xb790,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       1},     //c_round_en
    /*vpss_tnr_reg37*/
    {0xb794,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //y_blending_alpha_lut_0
    {0xb794,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       1},     //y_blending_alpha_lut_1
    {0xb794,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       2},     //y_blending_alpha_lut_2
    {0xb794,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       3},     //y_blending_alpha_lut_3
    {0xb794,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       4},     //y_blending_alpha_lut_4
    {0xb794,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       5},     //y_blending_alpha_lut_5
    /*vpss_tnr_reg38*/
    {0xb798,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       6},     //y_blending_alpha_lut_6
    {0xb798,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       7},     //y_blending_alpha_lut_7
    {0xb798,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //y_blending_alpha_lut_8
    {0xb798,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       9},     //y_blending_alpha_lut_9
    {0xb798,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       10},    //y_blending_alpha_lut_10
    {0xb798,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       11},    //y_blending_alpha_lut_11
    /*vpss_tnr_reg39*/
    {0xb79c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       12},    //y_blending_alpha_lut_12
    {0xb79c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       13},    //y_blending_alpha_lut_13
    {0xb79c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       14},    //y_blending_alpha_lut_14
    {0xb79c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       15},    //y_blending_alpha_lut_15
    {0xb79c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //y_blending_alpha_lut_16
    {0xb79c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       17},    //y_blending_alpha_lut_17
    /*vpss_tnr_reg40*/
    {0xb7a0,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       18},    //y_blending_alpha_lut_18
    {0xb7a0,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       19},    //y_blending_alpha_lut_19
    {0xb7a0,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       20},    //y_blending_alpha_lut_20
    {0xb7a0,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       21},    //y_blending_alpha_lut_21
    {0xb7a0,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       22},    //y_blending_alpha_lut_22
    {0xb7a0,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       23},    //y_blending_alpha_lut_23
    /*vpss_tnr_reg41*/
    {0xb7a4,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       24},    //y_blending_alpha_lut_24
    {0xb7a4,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       25},    //y_blending_alpha_lut_25
    {0xb7a4,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       26},    //y_blending_alpha_lut_26
    {0xb7a4,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       27},    //y_blending_alpha_lut_27
    {0xb7a4,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       28},    //y_blending_alpha_lut_28
    {0xb7a4,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       29},    //y_blending_alpha_lut_29
    /*vpss_tnr_reg42*/
    {0xb7a8,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       30},    //y_blending_alpha_lut_30
    {0xb7a8,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       31},    //y_blending_alpha_lut_31
    /*vpss_tnr_reg43*/
    {0xb7ac,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //c_blending_alpha_lut_0
    {0xb7ac,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       1},     //c_blending_alpha_lut_1
    {0xb7ac,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       2},     //c_blending_alpha_lut_2
    {0xb7ac,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       3},     //c_blending_alpha_lut_3
    {0xb7ac,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       4},     //c_blending_alpha_lut_4
    {0xb7ac,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       5},     //c_blending_alpha_lut_5
    /*vpss_tnr_reg44*/
    {0xb7b0,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       6},     //c_blending_alpha_lut_6
    {0xb7b0,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       7},     //c_blending_alpha_lut_7
    {0xb7b0,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //c_blending_alpha_lut_8
    {0xb7b0,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       9},     //c_blending_alpha_lut_9
    {0xb7b0,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       10},    //c_blending_alpha_lut_10
    {0xb7b0,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       11},    //c_blending_alpha_lut_11
    /*vpss_tnr_reg45*/
    {0xb7b4,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       12},    //c_blending_alpha_lut_12
    {0xb7b4,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       13},    //c_blending_alpha_lut_13
    {0xb7b4,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       14},    //c_blending_alpha_lut_14
    {0xb7b4,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       15},    //c_blending_alpha_lut_15
    {0xb7b4,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //c_blending_alpha_lut_16
    {0xb7b4,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       17},    //c_blending_alpha_lut_17
    /*vpss_tnr_reg46*/
    {0xb7b8,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       18},    //c_blending_alpha_lut_18
    {0xb7b8,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       19},    //c_blending_alpha_lut_19
    {0xb7b8,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       20},    //c_blending_alpha_lut_20
    {0xb7b8,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       21},    //c_blending_alpha_lut_21
    {0xb7b8,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       22},    //c_blending_alpha_lut_22
    {0xb7b8,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       23},    //c_blending_alpha_lut_23
    /*vpss_tnr_reg47*/
    {0xb7bc,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       24},    //c_blending_alpha_lut_24
    {0xb7bc,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       25},    //c_blending_alpha_lut_25
    {0xb7bc,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       26},    //c_blending_alpha_lut_26
    {0xb7bc,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       27},    //c_blending_alpha_lut_27
    {0xb7bc,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       28},    //c_blending_alpha_lut_28
    {0xb7bc,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       29},    //c_blending_alpha_lut_29
    /*vpss_tnr_reg48*/
    {0xb7c0,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       30},    //c_blending_alpha_lut_30
    {0xb7c0,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       31},    //c_blending_alpha_lut_31
    /*vpss_tnr_reg49*/
    {0xb7e0,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       0},     //video_type
    {0xb7e0,        1,      1,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_flag_max_en
    {0xb7e0,        2,      2,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cemax_en
    {0xb7e0,        3,      3,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cm_en
    {0xb7e0,        4,      4,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_dotdet_en
    {0xb7e0,        5,      11,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_p_dot_th_h
    {0xb7e0,        12,     18,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_p_dot_th_l
    {0xb7e0,        19,     27,     1,      0,      HI_PQ_MODULE_TNR,       256},   //cls_p_dot_slop
    /*vpss_tnr_reg50*/
    {0xb7e4,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       127},   //cls_n_dot_th_h
    {0xb7e4,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       126},   //cls_n_dot_th_l
    {0xb7e4,        14,     21,     1,      0,      HI_PQ_MODULE_TNR,       128},   //cls_n_dot_slop
    {0xb7e4,        22,     24,     1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_ce_offset
    /*vpss_tnr_reg51*/
    {0xb7e8,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_mtlf_thr0
    {0xb7e8,        8,      15,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_mtlf_thr1
    {0xb7e8,        16,     23,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_mtlf_thr2
    {0xb7e8,        24,     26,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_chredg_thr_wgt
    {0xb7e8,        27,     29,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_chredg_ratio_1
    /*vpss_tnr_reg52*/
    {0xb7ec,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chredg_ratio_2
    {0xb7ec,        4,      8,      1,      0,      HI_PQ_MODULE_TNR,       7},     //cls_mvaveth
    {0xb7ec,        9,      13,     1,      0,      HI_PQ_MODULE_TNR,       9},     //cls_mvavecore
    {0xb7ec,        14,     21,     1,      0,      HI_PQ_MODULE_TNR,       50},    //cls_std_thr0
    {0xb7ec,        22,     29,     1,      0,      HI_PQ_MODULE_TNR,       34},    //cls_std_thr1
    /*vpss_tnr_reg53*/
    {0xb7f0,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_std_ratio
    {0xb7f0,        8,      13,     1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_stdw
    {0xb7f0,        14,     21,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_dotlevel_th
    {0xb7f0,        22,     29,     1,      0,      HI_PQ_MODULE_TNR,       12},    //cls_nocolor_th_0
    /*vpss_tnr_reg54*/
    {0xb7f4,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       36},    //cls_nocolor_th_1
    {0xb7f4,        8,      18,     1,      0,      HI_PQ_MODULE_TNR,       24},    //cls_nocolor_slp
    {0xb7f4,        19,     23,     1,      0,      HI_PQ_MODULE_TNR,       11},    //cls_nocolor_ratio_1
    {0xb7f4,        24,     28,     1,      0,      HI_PQ_MODULE_TNR,       11},    //cls_nocolor_ratio_2
    /*vpss_tnr_reg55*/
    {0xb7f8,        0,      7,      1,      0,      HI_PQ_MODULE_TNR,       10},    //cls_chroma_hf_th
    /*vpss_tnr_reg56*/
    {0xb7fc,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_0
    {0xb7fc,        4,      7,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_1
    {0xb7fc,        8,      11,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_2
    {0xb7fc,        12,     15,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_chfpnl_str_lut_3
    {0xb7fc,        16,     19,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_chfpnl_str_lut_4
    {0xb7fc,        20,     23,     1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_chfpnl_str_lut_5
    {0xb7fc,        24,     27,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_6
    {0xb7fc,        28,     31,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_7
    /*vpss_tnr_reg57*/
    {0xb800,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_8
    /*vpss_tnr_reg58*/
    {0xb804,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_0
    {0xb804,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_1
    {0xb804,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_2
    {0xb804,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_3
    {0xb804,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_4
    {0xb804,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_5
    /*vpss_tnr_reg59*/
    {0xb808,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       12},    //cls_ctrst_adj_lut_6
    {0xb808,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ctrst_adj_lut_7
    {0xb808,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ctrst_adj_lut_8
    {0xb808,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_9
    {0xb808,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_10
    {0xb808,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_11
    /*vpss_tnr_reg60*/
    {0xb80c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_12
    {0xb80c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_13
    {0xb80c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_14
    {0xb80c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_15
    /*vpss_tnr_reg61*/
    {0xb810,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_0
    {0xb810,        4,      7,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_1
    {0xb810,        8,      11,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_2
    {0xb810,        12,     15,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_3
    {0xb810,        16,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_4
    {0xb810,        20,     23,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cewt_lut_5
    {0xb810,        24,     27,     1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_cewt_lut_6
    {0xb810,        28,     31,     1,      0,      HI_PQ_MODULE_TNR,       3},     //cls_cewt_lut_7
    /*vpss_tnr_reg62*/
    {0xb814,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_cewt_lut_8
    {0xb814,        4,      7,      1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_cewt_lut_9
    {0xb814,        8,      11,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_cewt_lut_10
    {0xb814,        12,     15,     1,      0,      HI_PQ_MODULE_TNR,       7},     //cls_cewt_lut_11
    {0xb814,        16,     19,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_12
    {0xb814,        20,     23,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_13
    {0xb814,        24,     27,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_14
    {0xb814,        28,     31,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_15
    /*vpss_tnr_reg63*/
    {0xb818,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_0
    {0xb818,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_1
    {0xb818,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_2
    {0xb818,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_3
    {0xb818,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_4
    {0xb818,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ye_vsratio_lut_5
    /*vpss_tnr_reg64*/
    {0xb81c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsratio_lut_6
    {0xb81c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsratio_lut_7
    {0xb81c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsratio_lut_8
    {0xb81c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsratio_lut_9
    {0xb81c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsratio_lut_10
    {0xb81c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       10},    //cls_ye_vsratio_lut_11
    /*vpss_tnr_reg65*/
    {0xb820,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       12},    //cls_ye_vsratio_lut_12
    {0xb820,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       14},    //cls_ye_vsratio_lut_13
    {0xb820,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_14
    {0xb820,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_15
    {0xb820,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_16
    /*vpss_tnr_reg66*/
    {0xb824,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsminctrst_lut_0
    {0xb824,        4,      7,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsminctrst_lut_1
    {0xb824,        8,      11,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsminctrst_lut_2
    {0xb824,        12,     15,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsminctrst_lut_3
    {0xb824,        16,     19,     1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsminctrst_lut_4
    {0xb824,        20,     23,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ye_vsminctrst_lut_5
    {0xb824,        24,     27,     1,      0,      HI_PQ_MODULE_TNR,       3},     //cls_ye_vsminctrst_lut_6
    {0xb824,        28,     31,     1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_ye_vsminctrst_lut_7
    /*vpss_tnr_reg67*/
    {0xb828,        0,      3,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsminctrst_lut_8
    /*vpss_tnr_reg68*/
    {0xb82c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_0
    {0xb82c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_1
    {0xb82c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_2
    {0xb82c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_3
    {0xb82c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_4
    {0xb82c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       14},    //cls_tfstr_lut_0_5
    /*vpss_tnr_reg69*/
    {0xb830,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_0_6
    {0xb830,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       12},    //cls_tfstr_lut_0_7
    /*vpss_tnr_reg70*/
    {0xb834,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_1_0
    {0xb834,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       14},    //cls_tfstr_lut_1_1
    {0xb834,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_1_2
    {0xb834,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       12},    //cls_tfstr_lut_1_3
    {0xb834,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_1_4
    {0xb834,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       10},    //cls_tfstr_lut_1_5
    /*vpss_tnr_reg71*/
    {0xb838,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_1_6
    {0xb838,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_1_7
    /*vpss_tnr_reg72*/
    {0xb83c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_2_0
    {0xb83c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_2_1
    {0xb83c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_2_2
    {0xb83c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_2_3
    {0xb83c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_2_4
    {0xb83c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_2_5
    /*vpss_tnr_reg73*/
    {0xb840,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_2_6
    {0xb840,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_2_7
    /*vpss_tnr_reg74*/
    {0xb844,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_3_0
    {0xb844,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_3_1
    {0xb844,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_3_2
    {0xb844,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_3_3
    {0xb844,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_3_4
    {0xb844,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_3_5
    /*vpss_tnr_reg75*/
    {0xb848,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_3_6
    {0xb848,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_3_7
    /*vpss_tnr_reg76*/
    {0xb84c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_4_0
    {0xb84c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_4_1
    {0xb84c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_4_2
    {0xb84c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_4_3
    {0xb84c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_4_4
    {0xb84c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_4_5
    /*vpss_tnr_reg77*/
    {0xb850,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_4_6
    {0xb850,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_4_7
    /*vpss_tnr_reg78*/
    {0xb854,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_5_0
    {0xb854,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_5_1
    {0xb854,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_5_2
    {0xb854,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_5_3
    {0xb854,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_5_4
    {0xb854,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_5
    /*vpss_tnr_reg79*/
    {0xb858,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_6
    {0xb858,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_7
    /*vpss_tnr_reg80*/
    {0xb85c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_6_0
    {0xb85c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_6_1
    {0xb85c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_2
    {0xb85c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_3
    {0xb85c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_4
    {0xb85c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_5
    /*vpss_tnr_reg81*/
    {0xb860,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_6
    {0xb860,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_7
    /*vpss_tnr_reg82*/
    {0xb864,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_0
    {0xb864,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_1
    {0xb864,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_2
    {0xb864,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_3
    {0xb864,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_4
    {0xb864,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_5
    /*vpss_tnr_reg83*/
    {0xb868,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_6
    {0xb868,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_7
    /*vpss_tnr_reg84*/
    {0xb86c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       6},     //cls_mtstr_pnl_lut_0
    {0xb86c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_mtstr_pnl_lut_1
    {0xb86c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_2
    {0xb86c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_3
    {0xb86c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_4
    {0xb86c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_5
    /*vpss_tnr_reg85*/
    {0xb870,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_6
    {0xb870,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       -2},    //cls_mtstr_pnl_lut_7
    {0xb870,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       -4},    //cls_mtstr_pnl_lut_8
    /*vpss_tnr_reg86*/
    {0xb874,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       4},     //cls_cestr_pnl_lut_0
    {0xb874,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       2},     //cls_cestr_pnl_lut_1
    {0xb874,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cestr_pnl_lut_2
    {0xb874,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_3
    {0xb874,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_4
    {0xb874,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_5
    /*vpss_tnr_reg87*/
    {0xb878,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_6
    {0xb878,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_7
    {0xb878,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       -1},    //cls_cestr_pnl_lut_8
    /*vpss_tnr_reg88*/
    {0xb880,        0,      0,      1,      0,      HI_PQ_MODULE_TNR,       1},     //stage_mess_en
    {0xb880,        1,      7,      1,      0,      HI_PQ_MODULE_TNR,       6},     //ccs_dir_offset
    {0xb880,        8,      10,     1,      0,      HI_PQ_MODULE_TNR,       3},     //ccs_dir_shift
    {0xb880,        11,     17,     1,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_mv_offset
    {0xb880,        18,     20,     1,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_mv_shift
    {0xb880,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       10},    //ccs_ymd_offset
    {0xb880,        28,     30,     1,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_ymd_shift
    /*vpss_tnr_reg89*/
    {0xb884,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       3},     //ccs_std_offset
    {0xb884,        7,      9,      1,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_std_shift
    {0xb884,        10,     16,     1,      0,      HI_PQ_MODULE_TNR,       24},    //ccs_grad_th
    {0xb884,        17,     22,     1,      0,      HI_PQ_MODULE_TNR,       4},     //ccs_grad_offset
    {0xb884,        23,     27,     1,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_grad_shift
    /*vpss_tnr_reg90*/
    {0xb888,        0,      9,      1,      0,      HI_PQ_MODULE_TNR,       320},   //ccs_grad_th_max
    {0xb888,        10,     19,     1,      0,      HI_PQ_MODULE_TNR,       28},    //ccs_grad_th_min
    {0xb888,        20,     22,     1,      0,      HI_PQ_MODULE_TNR,       5},     //ccs_grad_tag_1
    {0xb888,        23,     25,     1,      0,      HI_PQ_MODULE_TNR,       4},     //ccs_grad_tag_2
    /*vpss_tnr_reg91*/
    {0xb88c,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       24},    //ccs_cc_freq_delta
    /*vpss_tnr_reg92*/
    {0xb890,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_0
    {0xb890,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_1
    {0xb890,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_2
    {0xb890,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       1},     //lgdif_y_lut_3
    {0xb890,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       2},     //lgdif_y_lut_4
    {0xb890,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       3},     //lgdif_y_lut_5
    /*vpss_tnr_reg93*/
    {0xb894,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       4},     //lgdif_y_lut_6
    {0xb894,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       6},     //lgdif_y_lut_7
    {0xb894,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       8},     //lgdif_y_lut_8
    {0xb894,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       14},    //lgdif_y_lut_9
    {0xb894,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       16},    //lgdif_y_lut_10
    {0xb894,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       16},    //lgdif_y_lut_11
    /*vpss_tnr_reg94*/
    {0xb898,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       16},    //lut_y_md_0
    {0xb898,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       16},    //lut_y_md_1
    {0xb898,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       13},    //lut_y_md_2
    {0xb898,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       12},    //lut_y_md_3
    {0xb898,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       10},    //lut_y_md_4
    {0xb898,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       8},     //lut_y_md_5
    /*vpss_tnr_reg95*/
    {0xb89c,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       7},     //lut_y_md_6
    {0xb89c,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       6},     //lut_y_md_7
    {0xb89c,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       3},     //lut_y_md_8
    {0xb89c,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       2},     //lut_y_md_9
    {0xb89c,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       1},     //lut_y_md_10
    {0xb89c,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_11
    /*vpss_tnr_reg96*/
    {0xb8a0,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_12
    {0xb8a0,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_13
    {0xb8a0,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_14
    {0xb8a0,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_15
    /*vpss_tnr_reg97*/
    {0xb8a4,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       1},     //lut_mv_2
    {0xb8a4,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       10},    //lut_mv_3
    {0xb8a4,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       15},    //lut_mv_4
    {0xb8a4,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       20},    //lut_mv_5
    /*vpss_tnr_reg98*/
    {0xb8a8,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       25},    //lut_mv_6
    {0xb8a8,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_7
    {0xb8a8,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_8
    {0xb8a8,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_9
    /*vpss_tnr_reg99*/
    {0xb8ac,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       33},    //lut_mv_10
    {0xb8ac,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       40},    //lut_mv_11
    {0xb8ac,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       40},    //lut_mv_12
    {0xb8ac,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       50},    //lut_mv_13
    /*vpss_tnr_reg100*/
    {0xb8b0,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       55},    //lut_mv_14
    {0xb8b0,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       62},    //lut_mv_15
    {0xb8b0,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       -10},   //lut_mv_0
    {0xb8b0,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       -5},    //lut_mv_1
    /*vpss_tnr_reg101*/
    {0xb8b4,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_dir_0
    {0xb8b4,        6,      11,     1,      0,      HI_PQ_MODULE_TNR,       6},     //lut_dir_1
    {0xb8b4,        12,     17,     1,      0,      HI_PQ_MODULE_TNR,       9},     //lut_dir_2
    {0xb8b4,        18,     23,     1,      0,      HI_PQ_MODULE_TNR,       12},    //lut_dir_3
    {0xb8b4,        24,     29,     1,      0,      HI_PQ_MODULE_TNR,       18},    //lut_dir_4
    /*vpss_tnr_reg102*/
    {0xb8b8,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       28},    //lut_dir_5
    {0xb8b8,        6,      11,     1,      0,      HI_PQ_MODULE_TNR,       36},    //lut_dir_6
    {0xb8b8,        12,     17,     1,      0,      HI_PQ_MODULE_TNR,       40},    //lut_dir_7
    /*vpss_tnr_reg103*/
    {0xb8bc,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       30},    //lut_fig_0
    {0xb8bc,        6,      11,     1,      0,      HI_PQ_MODULE_TNR,       36},    //lut_fig_1
    {0xb8bc,        12,     17,     1,      0,      HI_PQ_MODULE_TNR,       42},    //lut_fig_2
    {0xb8bc,        18,     23,     1,      0,      HI_PQ_MODULE_TNR,       48},    //lut_fig_3
    {0xb8bc,        24,     29,     1,      0,      HI_PQ_MODULE_TNR,       50},    //lut_fig_4
    /*vpss_tnr_reg104*/
    {0xb8c0,        0,      5,      1,      0,      HI_PQ_MODULE_TNR,       54},    //lut_fig_5
    /*vpss_tnr_reg105*/
    {0xb8c4,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_std0
    {0xb8c4,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       1},     //lut_std1
    {0xb8c4,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       1},     //lut_std2
    {0xb8c4,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       2},     //lut_std3
    {0xb8c4,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       4},     //lut_std4
    {0xb8c4,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       6},     //lut_std5
    /*vpss_tnr_reg106*/
    {0xb8c8,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       6},     //lut_std6
    {0xb8c8,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       8},     //lut_std7
    {0xb8c8,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       9},     //lut_std8
    {0xb8c8,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       10},    //lut_std9
    {0xb8c8,        20,     24,     1,      0,      HI_PQ_MODULE_TNR,       11},    //lut_std10
    {0xb8c8,        25,     29,     1,      0,      HI_PQ_MODULE_TNR,       12},    //lut_std11
    /*vpss_tnr_reg107*/
    {0xb8cc,        0,      4,      1,      0,      HI_PQ_MODULE_TNR,       13},    //lut_std12
    {0xb8cc,        5,      9,      1,      0,      HI_PQ_MODULE_TNR,       14},    //lut_std13
    {0xb8cc,        10,     14,     1,      0,      HI_PQ_MODULE_TNR,       15},    //lut_std14
    {0xb8cc,        15,     19,     1,      0,      HI_PQ_MODULE_TNR,       16},    //lut_std15
    /*vpss_tnr_reg108*/
    {0xb8d0,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_0
    {0xb8d0,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_1
    {0xb8d0,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_2
    {0xb8d0,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_3
    /*vpss_tnr_reg109*/
    {0xb8d4,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_4
    {0xb8d4,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_5
    {0xb8d4,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       8},     //lut_noise_6
    {0xb8d4,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       5},     //lut_noise_7
    /*vpss_tnr_reg110*/
    {0xb8d8,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_8
    {0xb8d8,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_9
    /*vpss_tnr_reg111*/
    {0xb8dc,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       48},    //lut_cc_hg_0
    {0xb8dc,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       40},    //lut_cc_hg_1
    {0xb8dc,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       30},    //lut_cc_hg_2
    {0xb8dc,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       12},    //lut_cc_hg_3
    /*vpss_tnr_reg112*/
    {0xb8e0,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       6},     //lut_cc_hg_4
    {0xb8e0,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_cc_hg_5
    {0xb8e0,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       -8},    //lut_cc_hg_6
    {0xb8e0,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       -14},   //lut_cc_hg_7
    /*vpss_tnr_reg113*/
    {0xb8e4,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       -24},   //lut_cc_hg_8
    {0xb8e4,        7,      13,     1,      0,      HI_PQ_MODULE_TNR,       -30},   //lut_cc_hg_9
    {0xb8e4,        14,     20,     1,      0,      HI_PQ_MODULE_TNR,       -35},   //lut_cc_hg_10
    {0xb8e4,        21,     27,     1,      0,      HI_PQ_MODULE_TNR,       -40},   //lut_cc_hg_11
    /*vpss_tnr_reg114*/
    {0xb8e8,        0,      6,      1,      0,      HI_PQ_MODULE_TNR,       0},     //lut_yh_noise

    /*HD*/
    /*Addr       Lsb     Msb  SourceMode OutputMode       Module           Value       Description*/
    /***********************************************TNR***********************************************/
    /*vpss_tnr_ctrl*/
    {0xb700,        1,      1,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_en
    {0xb700,        2,      2,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_2d_en /* no cls_2d logic*/
    {0xb700,        3,      3,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_3d_en /* always true */
    {0xb700,        4,      4,      2,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_3d_en
    {0xb700,        5,      5,      2,      0,      HI_PQ_MODULE_TNR,       0},     //market_mode_en
    {0xb700,        6,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //market_mode
    {0xb700,        7,      19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //market_coor
    /*vpss_tnr_reg1*/
    {0xb704,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       0},     //scd_en
    {0xb704,        1,      1,      2,      0,      HI_PQ_MODULE_TNR,       0},     //scd_lowcost_en
    {0xb704,        2,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //scd_k_pixy
    {0xb704,        8,      8,      2,      0,      HI_PQ_MODULE_TNR,       1},     //ma_nd_en
    {0xb704,        9,      10,     2,      0,      HI_PQ_MODULE_TNR,       3},     //random_ctrl_mode
    {0xb704,        11,     18,     2,      0,      HI_PQ_MODULE_TNR,       12},    //flat_thd_min
    {0xb704,        19,     26,     2,      0,      HI_PQ_MODULE_TNR,       20},    //flat_thd_med
    /*vpss_tnr_reg2*/
    {0xb708,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       35},    //flat_thd_max
    {0xb708,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       32},    //blk_diff_thd
    {0xb708,        16,     16,     2,      0,      HI_PQ_MODULE_TNR,       1},     //ma_md_en
    {0xb708,        17,     26,     2,      0,      HI_PQ_MODULE_TNR,       512},   //colorless_val
    {0xb708,        27,     27,     2,      0,      HI_PQ_MODULE_TNR,       1},     //md_pre_lpf_en
    {0xb708,        28,     30,     2,      0,      HI_PQ_MODULE_TNR,       0},     //alpha1
    /*vpss_tnr_reg3*/
    {0xb70c,        0,      2,      2,      0,      HI_PQ_MODULE_TNR,       0},     //alpha2
    /*vpss_tnr_reg4*/
    {0xb710,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_en
    {0xb710,        1,      8,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_x_0
    {0xb710,        9,      16,     2,      0,      HI_PQ_MODULE_TNR,       8},     //y_mean_motion_adj_x_1
    {0xb710,        17,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_x_2
    /*vpss_tnr_reg5*/
    {0xb714,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       32},    //y_mean_motion_adj_x_3
    {0xb714,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       64},    //y_mean_motion_adj_x_4
    {0xb714,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       128},   //y_mean_motion_adj_x_5
    {0xb714,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       192},   //y_mean_motion_adj_y_0
    /*vpss_tnr_reg6*/
    {0xb718,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_1
    {0xb718,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_2
    {0xb718,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_3
    {0xb718,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_4
    /*vpss_tnr_reg7*/
    {0xb71c,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mean_motion_adj_y_5
    {0xb71c,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_0
    {0xb71c,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_1
    {0xb71c,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_2
    /*vpss_tnr_reg8*/
    {0xb720,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_3
    {0xb720,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_k_4
    {0xb720,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       255},   //y_mean_motion_adj_max
    {0xb720,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_mean_motion_adj_min
    /*vpss_tnr_reg9*/
    {0xb724,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_en
    {0xb724,        1,      8,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_x_0
    {0xb724,        9,      16,     2,      0,      HI_PQ_MODULE_TNR,       8},     //c_mean_motion_adj_x_1
    {0xb724,        17,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_x_2
    /*vpss_tnr_reg10*/
    {0xb728,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       32},    //c_mean_motion_adj_x_3
    {0xb728,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       64},    //c_mean_motion_adj_x_4
    {0xb728,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       128},   //c_mean_motion_adj_x_5
    {0xb728,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       192},   //c_mean_motion_adj_y_0
    /*vpss_tnr_reg11*/
    {0xb72c,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_1
    {0xb72c,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_2
    {0xb72c,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_3
    {0xb72c,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_4
    /*vpss_tnr_reg12*/
    {0xb730,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mean_motion_adj_y_5
    {0xb730,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_0
    {0xb730,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_1
    {0xb730,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_2
    /*vpss_tnr_reg13*/
    {0xb734,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_3
    {0xb734,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_k_4
    {0xb734,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       255},   //c_mean_motion_adj_max
    {0xb734,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //c_mean_motion_adj_min
    /*vpss_tnr_reg14*/
    {0xb738,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       24},    //y_md_gain
    {0xb738,        6,      11,     2,      0,      HI_PQ_MODULE_TNR,       24},    //c_md_gain
    {0xb738,        12,     13,     2,      0,      HI_PQ_MODULE_TNR,       3},     //y_md_lpf_mode
    {0xb738,        14,     15,     2,      0,      HI_PQ_MODULE_TNR,       3},     //c_md_lpf_mode
    {0xb738,        16,     16,     2,      0,      HI_PQ_MODULE_TNR,       1},     //ma_me_en
    {0xb738,        17,     18,     2,      0,      HI_PQ_MODULE_TNR,       0},     //mv_ref_mode
    {0xb738,        19,     20,     2,      0,      HI_PQ_MODULE_TNR,       1},     //mv_lpf_mode
    {0xb738,        21,     21,     2,      0,      HI_PQ_MODULE_TNR,       0},     //discard_smv_x_en
    {0xb738,        22,     22,     2,      0,      HI_PQ_MODULE_TNR,       0},     //discard_smv_y_en
    {0xb738,        23,     25,     2,      0,      HI_PQ_MODULE_TNR,       0},     //smv_x_thd
    {0xb738,        26,     28,     2,      0,      HI_PQ_MODULE_TNR,       0},     //smv_y_thd
    /*vpss_tnr_reg15*/
    {0xb73c,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       127},   //mag_pnl_gain_0mv
    {0xb73c,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       63},    //mag_pnl_core_0mv
    {0xb73c,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       127},   //mag_pnl_gain_xmv
    {0xb73c,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       63},    //mag_pnl_core_xmv
    /*vpss_tnr_reg16*/
    {0xb740,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       31},    //std_pnl_gain
    {0xb740,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //std_pnl_core
    {0xb740,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       4},     //adj_0mv_min
    {0xb740,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       4},     //adj_xmv_min
    {0xb740,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //adj_0mv_max
    {0xb740,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       16},    //adj_xmv_max
    /*vpss_tnr_reg17*/
    {0xb744,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       24},    //adj_mv_max
    {0xb744,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       16},    //adj_mv_min
    {0xb744,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       28},    //std_core_0mv
    {0xb744,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //std_core_xmv
    {0xb744,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_gain_0mv
    {0xb744,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_core_0mv
    /*vpss_tnr_reg18*/
    {0xb748,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_gain_xmv
    {0xb748,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       16},    //std_pnl_core_xmv
    {0xb748,        10,     12,     2,      0,      HI_PQ_MODULE_TNR,       0},     //gm_adj
    {0xb748,        13,     13,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cb_cr_update_en
    {0xb748,        14,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cb_begin_1
    {0xb748,        20,     25,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cr_begin_1
    {0xb748,        26,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cb_end_1
    /*vpss_tnr_reg19*/
    {0xb74c,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cr_end_1
    {0xb74c,        6,      9,      2,      0,      HI_PQ_MODULE_TNR,       15},    //cb_cr_weight_1
    {0xb74c,        10,     16,     2,      0,      HI_PQ_MODULE_TNR,       0},     //motion_val_1
    {0xb74c,        17,     22,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cb_begin_2
    {0xb74c,        23,     28,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cr_begin_2
    /*vpss_tnr_reg20*/
    {0xb750,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cb_end_2
    {0xb750,        6,      11,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cr_end_2
    {0xb750,        12,     15,     2,      0,      HI_PQ_MODULE_TNR,       15},    //cb_cr_weight_2
    {0xb750,        16,     22,     2,      0,      HI_PQ_MODULE_TNR,       0},     //motion_val_2
    {0xb750,        23,     23,     2,      0,      HI_PQ_MODULE_TNR,       0},     //scene_change_en
    {0xb750,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //scene_change_val
    /*vpss_tnr_reg21*/
    {0xb754,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       1},     //pre_motion_merge_en
    {0xb754,        1,      5,      2,      0,      HI_PQ_MODULE_TNR,       16},    //pre_motion_alpha
    {0xb754,        6,      10,     2,      0,      HI_PQ_MODULE_TNR,       16},    //motion_merge_ratio
    {0xb754,        11,     15,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_mc_gain
    {0xb754,        16,     21,     2,      0,      HI_PQ_MODULE_TNR,       5},     //y_mc_core
    {0xb754,        22,     26,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_mc_gain
    /*vpss_tnr_reg22*/
    {0xb758,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       5},     //c_mc_core
    {0xb758,        6,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //saltus_dect_en
    {0xb758,        7,      11,     2,      0,      HI_PQ_MODULE_TNR,       0},     //saltus_level
    {0xb758,        12,     12,     2,      0,      HI_PQ_MODULE_TNR,       1},     //y_mc_adj_en
    {0xb758,        13,     13,     2,      0,      HI_PQ_MODULE_TNR,       1},     //c_mc_adj_en
    {0xb758,        14,     19,     2,      0,      HI_PQ_MODULE_TNR,       -5},    //y_md_core
    {0xb758,        20,     25,     2,      0,      HI_PQ_MODULE_TNR,       -5},    //c_md_core
    /*vpss_tnr_reg23*/
    {0xb75c,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_x_0
    {0xb75c,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       4},     //y_motion_mapping_x_1
    {0xb75c,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       8},     //y_motion_mapping_x_2
    {0xb75c,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_x_3
    /*vpss_tnr_reg24*/
    {0xb760,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_x_4
    {0xb760,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       127},   //y_motion_mapping_x_5
    /*vpss_tnr_reg25*/
    {0xb764,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_y_0
    {0xb764,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       4},     //y_motion_mapping_y_1
    {0xb764,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //y_motion_mapping_y_2
    {0xb764,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_y_3
    {0xb764,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_y_4
    {0xb764,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_y_5
    /*vpss_tnr_reg26*/
    {0xb768,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_0
    {0xb768,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_1
    {0xb768,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_2
    {0xb768,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_motion_mapping_k_3
    /*vpss_tnr_reg27*/
    {0xb76c,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_k_4
    /*vpss_tnr_reg28*/
    {0xb770,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       31},    //y_motion_mapping_max
    {0xb770,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_motion_mapping_min
    /*vpss_tnr_reg29*/
    {0xb774,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_x_0
    {0xb774,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       4},     //c_motion_mapping_x_1
    {0xb774,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       8},     //c_motion_mapping_x_2
    {0xb774,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_x_3
    /*vpss_tnr_reg30*/
    {0xb778,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_x_4
    {0xb778,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       127},   //c_motion_mapping_x_5
    /*vpss_tnr_reg31*/
    {0xb77c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_y_0
    {0xb77c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       4},     //c_motion_mapping_y_1
    {0xb77c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //c_motion_mapping_y_2
    {0xb77c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_y_3
    {0xb77c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_y_4
    {0xb77c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_y_5
    /*vpss_tnr_reg32*/
    {0xb780,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_0
    {0xb780,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_1
    {0xb780,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_2
    {0xb780,        24,     31,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_motion_mapping_k_3
    /*vpss_tnr_reg33*/
    {0xb784,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_k_4
    /*vpss_tnr_reg34*/
    {0xb788,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       31},    //c_motion_mapping_max
    {0xb788,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_motion_mapping_min
    /*vpss_tnr_reg35*/
    {0xb78c,        0,      1,      2,      0,      HI_PQ_MODULE_TNR,       3},     //y_mc_lpf_mode
    {0xb78c,        2,      3,      2,      0,      HI_PQ_MODULE_TNR,       3},     //c_mc_lpf_mode
    {0xb78c,        4,      5,      2,      0,      HI_PQ_MODULE_TNR,       0},     //share_motion_mode
    {0xb78c,        6,      10,     2,      0,      HI_PQ_MODULE_TNR,       0},     //noise_level
    {0xb78c,        11,     15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //global_motion
    {0xb78c,        17,     17,     2,      0,      HI_PQ_MODULE_TNR,       1},     //y_tnr_en
    {0xb78c,        18,     18,     2,      0,      HI_PQ_MODULE_TNR,       1},     //c_tnr_en
    {0xb78c,        19,     23,     2,      0,      HI_PQ_MODULE_TNR,       2},     //y_no_nr_range
    {0xb78c,        24,     28,     2,      0,      HI_PQ_MODULE_TNR,       1},     //c_no_nr_range
    {0xb78c,        29,     29,     2,      0,      HI_PQ_MODULE_TNR,       1},     //y_motion_mode
    {0xb78c,        30,     30,     2,      0,      HI_PQ_MODULE_TNR,       1},     //c_motion_mode
    {0xb78c,        31,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //y_round_en
    /*vpss_tnr_reg36*/
    {0xb790,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       1},     //c_round_en
    /*vpss_tnr_reg37*/
    {0xb794,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //y_blending_alpha_lut_0
    {0xb794,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       1},     //y_blending_alpha_lut_1
    {0xb794,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       2},     //y_blending_alpha_lut_2
    {0xb794,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       3},     //y_blending_alpha_lut_3
    {0xb794,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       4},     //y_blending_alpha_lut_4
    {0xb794,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       5},     //y_blending_alpha_lut_5
    /*vpss_tnr_reg38*/
    {0xb798,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       6},     //y_blending_alpha_lut_6
    {0xb798,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       7},     //y_blending_alpha_lut_7
    {0xb798,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //y_blending_alpha_lut_8
    {0xb798,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       9},     //y_blending_alpha_lut_9
    {0xb798,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       10},    //y_blending_alpha_lut_10
    {0xb798,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       11},    //y_blending_alpha_lut_11
    /*vpss_tnr_reg39*/
    {0xb79c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       12},    //y_blending_alpha_lut_12
    {0xb79c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       13},    //y_blending_alpha_lut_13
    {0xb79c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       14},    //y_blending_alpha_lut_14
    {0xb79c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       15},    //y_blending_alpha_lut_15
    {0xb79c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //y_blending_alpha_lut_16
    {0xb79c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       17},    //y_blending_alpha_lut_17
    /*vpss_tnr_reg40*/
    {0xb7a0,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       18},    //y_blending_alpha_lut_18
    {0xb7a0,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       19},    //y_blending_alpha_lut_19
    {0xb7a0,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       20},    //y_blending_alpha_lut_20
    {0xb7a0,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       21},    //y_blending_alpha_lut_21
    {0xb7a0,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       22},    //y_blending_alpha_lut_22
    {0xb7a0,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       23},    //y_blending_alpha_lut_23
    /*vpss_tnr_reg41*/
    {0xb7a4,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       24},    //y_blending_alpha_lut_24
    {0xb7a4,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       25},    //y_blending_alpha_lut_25
    {0xb7a4,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       26},    //y_blending_alpha_lut_26
    {0xb7a4,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       27},    //y_blending_alpha_lut_27
    {0xb7a4,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       28},    //y_blending_alpha_lut_28
    {0xb7a4,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       29},    //y_blending_alpha_lut_29
    /*vpss_tnr_reg42*/
    {0xb7a8,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       30},    //y_blending_alpha_lut_30
    {0xb7a8,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       31},    //y_blending_alpha_lut_31
    /*vpss_tnr_reg43*/
    {0xb7ac,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //c_blending_alpha_lut_0
    {0xb7ac,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       1},     //c_blending_alpha_lut_1
    {0xb7ac,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       2},     //c_blending_alpha_lut_2
    {0xb7ac,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       3},     //c_blending_alpha_lut_3
    {0xb7ac,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       4},     //c_blending_alpha_lut_4
    {0xb7ac,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       5},     //c_blending_alpha_lut_5
    /*vpss_tnr_reg44*/
    {0xb7b0,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       6},     //c_blending_alpha_lut_6
    {0xb7b0,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       7},     //c_blending_alpha_lut_7
    {0xb7b0,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //c_blending_alpha_lut_8
    {0xb7b0,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       9},     //c_blending_alpha_lut_9
    {0xb7b0,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       10},    //c_blending_alpha_lut_10
    {0xb7b0,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       11},    //c_blending_alpha_lut_11
    /*vpss_tnr_reg45*/
    {0xb7b4,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       12},    //c_blending_alpha_lut_12
    {0xb7b4,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       13},    //c_blending_alpha_lut_13
    {0xb7b4,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       14},    //c_blending_alpha_lut_14
    {0xb7b4,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       15},    //c_blending_alpha_lut_15
    {0xb7b4,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //c_blending_alpha_lut_16
    {0xb7b4,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       17},    //c_blending_alpha_lut_17
    /*vpss_tnr_reg46*/
    {0xb7b8,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       18},    //c_blending_alpha_lut_18
    {0xb7b8,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       19},    //c_blending_alpha_lut_19
    {0xb7b8,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       20},    //c_blending_alpha_lut_20
    {0xb7b8,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       21},    //c_blending_alpha_lut_21
    {0xb7b8,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       22},    //c_blending_alpha_lut_22
    {0xb7b8,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       23},    //c_blending_alpha_lut_23
    /*vpss_tnr_reg47*/
    {0xb7bc,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       24},    //c_blending_alpha_lut_24
    {0xb7bc,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       25},    //c_blending_alpha_lut_25
    {0xb7bc,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       26},    //c_blending_alpha_lut_26
    {0xb7bc,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       27},    //c_blending_alpha_lut_27
    {0xb7bc,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       28},    //c_blending_alpha_lut_28
    {0xb7bc,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       29},    //c_blending_alpha_lut_29
    /*vpss_tnr_reg48*/
    {0xb7c0,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       30},    //c_blending_alpha_lut_30
    {0xb7c0,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       31},    //c_blending_alpha_lut_31
    /*vpss_tnr_reg49*/
    {0xb7e0,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       0},     //video_type
    {0xb7e0,        1,      1,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_flag_max_en
    {0xb7e0,        2,      2,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cemax_en
    {0xb7e0,        3,      3,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cm_en
    {0xb7e0,        4,      4,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_dotdet_en
    {0xb7e0,        5,      11,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_p_dot_th_h
    {0xb7e0,        12,     18,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_p_dot_th_l
    {0xb7e0,        19,     27,     2,      0,      HI_PQ_MODULE_TNR,       256},   //cls_p_dot_slop
    /*vpss_tnr_reg50*/
    {0xb7e4,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       127},   //cls_n_dot_th_h
    {0xb7e4,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       126},   //cls_n_dot_th_l
    {0xb7e4,        14,     21,     2,      0,      HI_PQ_MODULE_TNR,       128},   //cls_n_dot_slop
    {0xb7e4,        22,     24,     2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_ce_offset
    /*vpss_tnr_reg51*/
    {0xb7e8,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_mtlf_thr0
    {0xb7e8,        8,      15,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_mtlf_thr1
    {0xb7e8,        16,     23,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_mtlf_thr2
    {0xb7e8,        24,     26,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_chredg_thr_wgt
    {0xb7e8,        27,     29,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_chredg_ratio_1
    /*vpss_tnr_reg52*/
    {0xb7ec,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chredg_ratio_2
    {0xb7ec,        4,      8,      2,      0,      HI_PQ_MODULE_TNR,       7},     //cls_mvaveth
    {0xb7ec,        9,      13,     2,      0,      HI_PQ_MODULE_TNR,       9},     //cls_mvavecore
    {0xb7ec,        14,     21,     2,      0,      HI_PQ_MODULE_TNR,       50},    //cls_std_thr0
    {0xb7ec,        22,     29,     2,      0,      HI_PQ_MODULE_TNR,       34},    //cls_std_thr1
    /*vpss_tnr_reg53*/
    {0xb7f0,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_std_ratio
    {0xb7f0,        8,      13,     2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_stdw
    {0xb7f0,        14,     21,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_dotlevel_th
    {0xb7f0,        22,     29,     2,      0,      HI_PQ_MODULE_TNR,       12},    //cls_nocolor_th_0
    /*vpss_tnr_reg54*/
    {0xb7f4,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       36},    //cls_nocolor_th_1
    {0xb7f4,        8,      18,     2,      0,      HI_PQ_MODULE_TNR,       24},    //cls_nocolor_slp
    {0xb7f4,        19,     23,     2,      0,      HI_PQ_MODULE_TNR,       11},    //cls_nocolor_ratio_1
    {0xb7f4,        24,     28,     2,      0,      HI_PQ_MODULE_TNR,       11},    //cls_nocolor_ratio_2
    /*vpss_tnr_reg55*/
    {0xb7f8,        0,      7,      2,      0,      HI_PQ_MODULE_TNR,       10},    //cls_chroma_hf_th
    /*vpss_tnr_reg56*/
    {0xb7fc,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_0
    {0xb7fc,        4,      7,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_1
    {0xb7fc,        8,      11,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_chfpnl_str_lut_2
    {0xb7fc,        12,     15,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_chfpnl_str_lut_3
    {0xb7fc,        16,     19,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_chfpnl_str_lut_4
    {0xb7fc,        20,     23,     2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_chfpnl_str_lut_5
    {0xb7fc,        24,     27,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_6
    {0xb7fc,        28,     31,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_7
    /*vpss_tnr_reg57*/
    {0xb800,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_chfpnl_str_lut_8
    /*vpss_tnr_reg58*/
    {0xb804,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_0
    {0xb804,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_1
    {0xb804,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_2
    {0xb804,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_3
    {0xb804,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_4
    {0xb804,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ctrst_adj_lut_5
    /*vpss_tnr_reg59*/
    {0xb808,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       12},    //cls_ctrst_adj_lut_6
    {0xb808,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ctrst_adj_lut_7
    {0xb808,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ctrst_adj_lut_8
    {0xb808,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_9
    {0xb808,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_10
    {0xb808,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_11
    /*vpss_tnr_reg60*/
    {0xb80c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_12
    {0xb80c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_13
    {0xb80c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_14
    {0xb80c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ctrst_adj_lut_15
    /*vpss_tnr_reg61*/
    {0xb810,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_0
    {0xb810,        4,      7,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_1
    {0xb810,        8,      11,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_2
    {0xb810,        12,     15,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_3
    {0xb810,        16,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cewt_lut_4
    {0xb810,        20,     23,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cewt_lut_5
    {0xb810,        24,     27,     2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_cewt_lut_6
    {0xb810,        28,     31,     2,      0,      HI_PQ_MODULE_TNR,       3},     //cls_cewt_lut_7
    /*vpss_tnr_reg62*/
    {0xb814,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_cewt_lut_8
    {0xb814,        4,      7,      2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_cewt_lut_9
    {0xb814,        8,      11,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_cewt_lut_10
    {0xb814,        12,     15,     2,      0,      HI_PQ_MODULE_TNR,       7},     //cls_cewt_lut_11
    {0xb814,        16,     19,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_12
    {0xb814,        20,     23,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_13
    {0xb814,        24,     27,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_14
    {0xb814,        28,     31,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_cewt_lut_15
    /*vpss_tnr_reg63*/
    {0xb818,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_0
    {0xb818,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_1
    {0xb818,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_2
    {0xb818,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_3
    {0xb818,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsratio_lut_4
    {0xb818,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ye_vsratio_lut_5
    /*vpss_tnr_reg64*/
    {0xb81c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsratio_lut_6
    {0xb81c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsratio_lut_7
    {0xb81c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsratio_lut_8
    {0xb81c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsratio_lut_9
    {0xb81c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsratio_lut_10
    {0xb81c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       10},    //cls_ye_vsratio_lut_11
    /*vpss_tnr_reg65*/
    {0xb820,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       12},    //cls_ye_vsratio_lut_12
    {0xb820,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       14},    //cls_ye_vsratio_lut_13
    {0xb820,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_14
    {0xb820,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_15
    {0xb820,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //cls_ye_vsratio_lut_16
    /*vpss_tnr_reg66*/
    {0xb824,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsminctrst_lut_0
    {0xb824,        4,      7,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_ye_vsminctrst_lut_1
    {0xb824,        8,      11,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsminctrst_lut_2
    {0xb824,        12,     15,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_ye_vsminctrst_lut_3
    {0xb824,        16,     19,     2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_ye_vsminctrst_lut_4
    {0xb824,        20,     23,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_ye_vsminctrst_lut_5
    {0xb824,        24,     27,     2,      0,      HI_PQ_MODULE_TNR,       3},     //cls_ye_vsminctrst_lut_6
    {0xb824,        28,     31,     2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_ye_vsminctrst_lut_7
    /*vpss_tnr_reg67*/
    {0xb828,        0,      3,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_ye_vsminctrst_lut_8
    /*vpss_tnr_reg68*/
    {0xb82c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_0
    {0xb82c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_1
    {0xb82c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_2
    {0xb82c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_3
    {0xb82c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_0_4
    {0xb82c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       14},    //cls_tfstr_lut_0_5
    /*vpss_tnr_reg69*/
    {0xb830,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_0_6
    {0xb830,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       12},    //cls_tfstr_lut_0_7
    /*vpss_tnr_reg70*/
    {0xb834,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       15},    //cls_tfstr_lut_1_0
    {0xb834,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       14},    //cls_tfstr_lut_1_1
    {0xb834,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_1_2
    {0xb834,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       12},    //cls_tfstr_lut_1_3
    {0xb834,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_1_4
    {0xb834,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       10},    //cls_tfstr_lut_1_5
    /*vpss_tnr_reg71*/
    {0xb838,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_1_6
    {0xb838,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_1_7
    /*vpss_tnr_reg72*/
    {0xb83c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_2_0
    {0xb83c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       13},    //cls_tfstr_lut_2_1
    {0xb83c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_2_2
    {0xb83c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_2_3
    {0xb83c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_2_4
    {0xb83c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_2_5
    /*vpss_tnr_reg73*/
    {0xb840,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_2_6
    {0xb840,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_2_7
    /*vpss_tnr_reg74*/
    {0xb844,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       11},    //cls_tfstr_lut_3_0
    {0xb844,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       9},     //cls_tfstr_lut_3_1
    {0xb844,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_3_2
    {0xb844,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_3_3
    {0xb844,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_3_4
    {0xb844,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_3_5
    /*vpss_tnr_reg75*/
    {0xb848,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_3_6
    {0xb848,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_3_7
    /*vpss_tnr_reg76*/
    {0xb84c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       8},     //cls_tfstr_lut_4_0
    {0xb84c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       7},     //cls_tfstr_lut_4_1
    {0xb84c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_tfstr_lut_4_2
    {0xb84c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_4_3
    {0xb84c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_4_4
    {0xb84c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_4_5
    /*vpss_tnr_reg77*/
    {0xb850,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_4_6
    {0xb850,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_4_7
    /*vpss_tnr_reg78*/
    {0xb854,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       5},     //cls_tfstr_lut_5_0
    {0xb854,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_tfstr_lut_5_1
    {0xb854,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       3},     //cls_tfstr_lut_5_2
    {0xb854,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_5_3
    {0xb854,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_5_4
    {0xb854,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_5
    /*vpss_tnr_reg79*/
    {0xb858,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_6
    {0xb858,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_5_7
    /*vpss_tnr_reg80*/
    {0xb85c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_tfstr_lut_6_0
    {0xb85c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_tfstr_lut_6_1
    {0xb85c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_2
    {0xb85c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_3
    {0xb85c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_4
    {0xb85c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_5
    /*vpss_tnr_reg81*/
    {0xb860,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_6
    {0xb860,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_6_7
    /*vpss_tnr_reg82*/
    {0xb864,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_0
    {0xb864,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_1
    {0xb864,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_2
    {0xb864,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_3
    {0xb864,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_4
    {0xb864,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_5
    /*vpss_tnr_reg83*/
    {0xb868,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_6
    {0xb868,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_tfstr_lut_7_7
    /*vpss_tnr_reg84*/
    {0xb86c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       6},     //cls_mtstr_pnl_lut_0
    {0xb86c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_mtstr_pnl_lut_1
    {0xb86c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_2
    {0xb86c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_3
    {0xb86c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_4
    {0xb86c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_5
    /*vpss_tnr_reg85*/
    {0xb870,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_mtstr_pnl_lut_6
    {0xb870,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       -2},    //cls_mtstr_pnl_lut_7
    {0xb870,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       -4},    //cls_mtstr_pnl_lut_8
    /*vpss_tnr_reg86*/
    {0xb874,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       4},     //cls_cestr_pnl_lut_0
    {0xb874,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       2},     //cls_cestr_pnl_lut_1
    {0xb874,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       1},     //cls_cestr_pnl_lut_2
    {0xb874,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_3
    {0xb874,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_4
    {0xb874,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_5
    /*vpss_tnr_reg87*/
    {0xb878,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_6
    {0xb878,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //cls_cestr_pnl_lut_7
    {0xb878,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       -1},    //cls_cestr_pnl_lut_8
    /*vpss_tnr_reg88*/
    {0xb880,        0,      0,      2,      0,      HI_PQ_MODULE_TNR,       1},     //stage_mess_en
    {0xb880,        1,      7,      2,      0,      HI_PQ_MODULE_TNR,       6},     //ccs_dir_offset
    {0xb880,        8,      10,     2,      0,      HI_PQ_MODULE_TNR,       3},     //ccs_dir_shift
    {0xb880,        11,     17,     2,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_mv_offset
    {0xb880,        18,     20,     2,      0,      HI_PQ_MODULE_TNR,       1},     //ccs_mv_shift
    {0xb880,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       10},    //ccs_ymd_offset
    {0xb880,        28,     30,     2,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_ymd_shift
    /*vpss_tnr_reg89*/
    {0xb884,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       3},     //ccs_std_offset
    {0xb884,        7,      9,      2,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_std_shift
    {0xb884,        10,     16,     2,      0,      HI_PQ_MODULE_TNR,       24},    //ccs_grad_th
    {0xb884,        17,     22,     2,      0,      HI_PQ_MODULE_TNR,       4},     //ccs_grad_offset
    {0xb884,        23,     27,     2,      0,      HI_PQ_MODULE_TNR,       2},     //ccs_grad_shift
    /*vpss_tnr_reg90*/
    {0xb888,        0,      9,      2,      0,      HI_PQ_MODULE_TNR,       320},   //ccs_grad_th_max
    {0xb888,        10,     19,     2,      0,      HI_PQ_MODULE_TNR,       28},    //ccs_grad_th_min
    {0xb888,        20,     22,     2,      0,      HI_PQ_MODULE_TNR,       5},     //ccs_grad_tag_1
    {0xb888,        23,     25,     2,      0,      HI_PQ_MODULE_TNR,       4},     //ccs_grad_tag_2
    /*vpss_tnr_reg91*/
    {0xb88c,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       24},    //ccs_cc_freq_delta
    /*vpss_tnr_reg92*/
    {0xb890,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_0
    {0xb890,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_1
    {0xb890,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lgdif_y_lut_2
    {0xb890,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       1},     //lgdif_y_lut_3
    {0xb890,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       2},     //lgdif_y_lut_4
    {0xb890,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       3},     //lgdif_y_lut_5
    /*vpss_tnr_reg93*/
    {0xb894,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       4},     //lgdif_y_lut_6
    {0xb894,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       6},     //lgdif_y_lut_7
    {0xb894,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       8},     //lgdif_y_lut_8
    {0xb894,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       14},    //lgdif_y_lut_9
    {0xb894,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       16},    //lgdif_y_lut_10
    {0xb894,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       16},    //lgdif_y_lut_11
    /*vpss_tnr_reg94*/
    {0xb898,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       16},    //lut_y_md_0
    {0xb898,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       16},    //lut_y_md_1
    {0xb898,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       13},    //lut_y_md_2
    {0xb898,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       12},    //lut_y_md_3
    {0xb898,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       10},    //lut_y_md_4
    {0xb898,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       8},     //lut_y_md_5
    /*vpss_tnr_reg95*/
    {0xb89c,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       7},     //lut_y_md_6
    {0xb89c,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       6},     //lut_y_md_7
    {0xb89c,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       3},     //lut_y_md_8
    {0xb89c,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       2},     //lut_y_md_9
    {0xb89c,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       1},     //lut_y_md_10
    {0xb89c,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_11
    /*vpss_tnr_reg96*/
    {0xb8a0,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_12
    {0xb8a0,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_13
    {0xb8a0,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_14
    {0xb8a0,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_y_md_15
    /*vpss_tnr_reg97*/
    {0xb8a4,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       1},     //lut_mv_2
    {0xb8a4,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       10},    //lut_mv_3
    {0xb8a4,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       15},    //lut_mv_4
    {0xb8a4,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       20},    //lut_mv_5
    /*vpss_tnr_reg98*/
    {0xb8a8,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       25},    //lut_mv_6
    {0xb8a8,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_7
    {0xb8a8,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_8
    {0xb8a8,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       30},    //lut_mv_9
    /*vpss_tnr_reg99*/
    {0xb8ac,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       33},    //lut_mv_10
    {0xb8ac,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       40},    //lut_mv_11
    {0xb8ac,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       40},    //lut_mv_12
    {0xb8ac,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       50},    //lut_mv_13
    /*vpss_tnr_reg100*/
    {0xb8b0,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       55},    //lut_mv_14
    {0xb8b0,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       62},    //lut_mv_15
    {0xb8b0,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       -10},   //lut_mv_0
    {0xb8b0,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       -5},    //lut_mv_1
    /*vpss_tnr_reg101*/
    {0xb8b4,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_dir_0
    {0xb8b4,        6,      11,     2,      0,      HI_PQ_MODULE_TNR,       6},     //lut_dir_1
    {0xb8b4,        12,     17,     2,      0,      HI_PQ_MODULE_TNR,       9},     //lut_dir_2
    {0xb8b4,        18,     23,     2,      0,      HI_PQ_MODULE_TNR,       12},    //lut_dir_3
    {0xb8b4,        24,     29,     2,      0,      HI_PQ_MODULE_TNR,       18},    //lut_dir_4
    /*vpss_tnr_reg102*/
    {0xb8b8,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       28},    //lut_dir_5
    {0xb8b8,        6,      11,     2,      0,      HI_PQ_MODULE_TNR,       36},    //lut_dir_6
    {0xb8b8,        12,     17,     2,      0,      HI_PQ_MODULE_TNR,       40},    //lut_dir_7
    /*vpss_tnr_reg103*/
    {0xb8bc,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       30},    //lut_fig_0
    {0xb8bc,        6,      11,     2,      0,      HI_PQ_MODULE_TNR,       36},    //lut_fig_1
    {0xb8bc,        12,     17,     2,      0,      HI_PQ_MODULE_TNR,       42},    //lut_fig_2
    {0xb8bc,        18,     23,     2,      0,      HI_PQ_MODULE_TNR,       48},    //lut_fig_3
    {0xb8bc,        24,     29,     2,      0,      HI_PQ_MODULE_TNR,       50},    //lut_fig_4
    /*vpss_tnr_reg104*/
    {0xb8c0,        0,      5,      2,      0,      HI_PQ_MODULE_TNR,       54},    //lut_fig_5
    /*vpss_tnr_reg105*/
    {0xb8c4,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_std0
    {0xb8c4,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       1},     //lut_std1
    {0xb8c4,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       1},     //lut_std2
    {0xb8c4,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       2},     //lut_std3
    {0xb8c4,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       4},     //lut_std4
    {0xb8c4,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       6},     //lut_std5
    /*vpss_tnr_reg106*/
    {0xb8c8,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       6},     //lut_std6
    {0xb8c8,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       8},     //lut_std7
    {0xb8c8,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       9},     //lut_std8
    {0xb8c8,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       10},    //lut_std9
    {0xb8c8,        20,     24,     2,      0,      HI_PQ_MODULE_TNR,       11},    //lut_std10
    {0xb8c8,        25,     29,     2,      0,      HI_PQ_MODULE_TNR,       12},    //lut_std11
    /*vpss_tnr_reg107*/
    {0xb8cc,        0,      4,      2,      0,      HI_PQ_MODULE_TNR,       13},    //lut_std12
    {0xb8cc,        5,      9,      2,      0,      HI_PQ_MODULE_TNR,       14},    //lut_std13
    {0xb8cc,        10,     14,     2,      0,      HI_PQ_MODULE_TNR,       15},    //lut_std14
    {0xb8cc,        15,     19,     2,      0,      HI_PQ_MODULE_TNR,       16},    //lut_std15
    /*vpss_tnr_reg108*/
    {0xb8d0,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_0
    {0xb8d0,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_1
    {0xb8d0,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_2
    {0xb8d0,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_3
    /*vpss_tnr_reg109*/
    {0xb8d4,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_4
    {0xb8d4,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_5
    {0xb8d4,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       8},     //lut_noise_6
    {0xb8d4,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       5},     //lut_noise_7
    /*vpss_tnr_reg110*/
    {0xb8d8,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_8
    {0xb8d8,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_noise_9
    /*vpss_tnr_reg111*/
    {0xb8dc,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       48},    //lut_cc_hg_0
    {0xb8dc,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       40},    //lut_cc_hg_1
    {0xb8dc,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       30},    //lut_cc_hg_2
    {0xb8dc,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       12},    //lut_cc_hg_3
    /*vpss_tnr_reg112*/
    {0xb8e0,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       6},     //lut_cc_hg_4
    {0xb8e0,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_cc_hg_5
    {0xb8e0,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       -8},    //lut_cc_hg_6
    {0xb8e0,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       -14},   //lut_cc_hg_7
    /*vpss_tnr_reg113*/
    {0xb8e4,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       -24},   //lut_cc_hg_8
    {0xb8e4,        7,      13,     2,      0,      HI_PQ_MODULE_TNR,       -30},   //lut_cc_hg_9
    {0xb8e4,        14,     20,     2,      0,      HI_PQ_MODULE_TNR,       -35},   //lut_cc_hg_10
    {0xb8e4,        21,     27,     2,      0,      HI_PQ_MODULE_TNR,       -40},   //lut_cc_hg_11
    /*vpss_tnr_reg114*/
    {0xb8e8,        0,      6,      2,      0,      HI_PQ_MODULE_TNR,       0},     //lut_yh_noise

    /***********************************************ACC***********************************************/
    /*VHDACCTHD1*/
    {0xb400,        31,     31,     0,      0,      HI_PQ_MODULE_DCI,       1},     //acc_en
    {0xb400,        30,     30,     0,      0,      HI_PQ_MODULE_DCI,       0},     //acc_mode
    {0xb400,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       280},   //thd_med_low
    {0xb400,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       620},   //thd_high
    {0xb400,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       400},   //thd_low
    /*VHDACCTHD2*/
    {0xb404,        13,     13,     0,      0,      HI_PQ_MODULE_DCI,       0},     //ck_gt_en
    {0xb404,        12,     12,     0,      0,      HI_PQ_MODULE_DCI,       0},     //acc_rst
    {0xb404,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       740},   //thd_med_high
    /*VHDACCDEMO*/
    {0xb408,        4,      15,     0,      0,      HI_PQ_MODULE_DCI,       0},     //demo_split_point
    {0xb408,        1,      1,      0,      0,      HI_PQ_MODULE_DCI,       0},     //demo_mode
    {0xb408,        0,      0,      0,      0,      HI_PQ_MODULE_DCI,       0},     //demo_en
    /*VHDACCLOWN*/
    {0xb40c,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       286},   //low_table_data2
    {0xb40c,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       146},   //low_table_data1
    {0xb40c,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       0},     //low_table_data0
    /*VHDACCLOWN*/
    {0xb410,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       670},   //low_table_data5
    {0xb410,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       550},   //low_table_data4
    {0xb410,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       426},   //low_table_data3
    /*VHDACCLOWN*/
    {0xb414,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       1023},  //low_table_data8
    {0xb414,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       896},   //low_table_data7
    {0xb414,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       768},   //low_table_data6
    /*VHDACCMEDN*/
    {0xb418,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       240},   //mid_table_data2
    {0xb418,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       110},   //mid_table_data1
    {0xb418,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       0},     //mid_table_data0
    /*VHDACCMEDN*/
    {0xb41c,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       670},   //mid_table_data5
    {0xb41c,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       540},   //mid_table_data4
    {0xb41c,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       384},   //mid_table_data3
    /*VHDACCMEDN*/
    {0xb420,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       1023},  //mid_table_data8
    {0xb420,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       880},   //mid_table_data7
    {0xb420,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       800},   //mid_table_data6
    /*VHDACCHIGHN*/
    {0xb424,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       240},   //high_table_data2
    {0xb424,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       100},   //high_table_data1
    {0xb424,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       0},     //high_table_data0
    /*VHDACCHIGHN*/
    {0xb428,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       620},   //high_table_data5
    {0xb428,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       496},   //high_table_data4
    {0xb428,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       360},   //high_table_data3
    /*VHDACCHIGHN*/
    {0xb42c,        20,     29,     0,      0,      HI_PQ_MODULE_DCI,       1023},  //high_table_data8
    {0xb42c,        10,     19,     0,      0,      HI_PQ_MODULE_DCI,       864},   //high_table_data7
    {0xb42c,        0,      9,      0,      0,      HI_PQ_MODULE_DCI,       764},   //high_table_data6

    /***********************************************ACM_CTRL***********************************************/
    /*VHDACM0*/
    {0xb500,       31,     31,     0,      0,      HI_PQ_MODULE_COLOR,     1},     //acm3_en
    {0xb500,       30,     30,     0,      0,      HI_PQ_MODULE_COLOR,     1},     //acm2_en
    {0xb500,       29,     29,     0,      0,      HI_PQ_MODULE_COLOR,     1},     //acm1_en
    {0xb500,       28,     28,     0,      0,      HI_PQ_MODULE_COLOR,     1},     //acm0_en
    {0xb500,       24,     27,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_sec_blk
    {0xb500,       20,     23,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_fir_blk
    {0xb500,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_d_u_off
    {0xb500,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_c_u_off
    {0xb500,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},   //acm_b_u_off
    {0xb500,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_a_u_off
    /*VHDACM1*/
    {0xb504,       22,     22,     0,      0,      HI_PQ_MODULE_COLOR,     1},     //bw_pro_mode
    {0xb504,       21,     21,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_dbg_mode
    {0xb504,       20,     20,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_test_en
    {0xb504,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_d_v_off
    {0xb504,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_c_v_off
    {0xb504,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_b_v_off
    {0xb504,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_a_v_off
    /*VHDACM2*/
    {0xb508,       24,     27,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_sec_blk
    {0xb508,       20,     23,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_fir_blk
    {0xb508,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_d_u_off
    {0xb508,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_c_u_off
    {0xb508,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_b_u_off
    {0xb508,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_a_u_off
    /*VHDACM3*/
    {0xb50c,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_d_v_off
    {0xb50c,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_c_v_off
    {0xb50c,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_b_v_off
    {0xb50c,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_a_v_off
    /*VHDACM4*/
    {0xb510,       24,     27,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_sec_blk
    {0xb510,       20,     23,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_fir_blk
    {0xb510,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_d_u_off
    {0xb510,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_c_u_off
    {0xb510,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_b_u_off
    {0xb510,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_a_u_off
    /*VHDACM5*/
    {0xb514,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_d_v_off
    {0xb514,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_c_v_off
    {0xb514,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_b_v_off
    {0xb514,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_a_v_off
    /*VHDACM6*/
    {0xb518,       24,     27,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_sec_blk
    {0xb518,       20,     23,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_fir_blk
    {0xb518,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_d_u_off
    {0xb518,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_c_u_off
    {0xb518,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_b_u_off
    {0xb518,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_a_u_off
    /*VHDACM7*/
    {0xb51c,       15,     19,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_d_v_off
    {0xb51c,       10,     14,     0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_c_v_off
    {0xb51c,       5,      9,      0,      0,      HI_PQ_MODULE_COLOR,     0},     //acm_b_v_off
    {0xb51c,       0,      4,      0,      0,      HI_PQ_MODULE_COLOR,     0},    //acm_a_v_off

    /***********************************************SHARPEN***********************************************/
    /*SD source*/
    /*VHDLTICTRL*/
    {0x2244,        8,      15,     1,      0,      HI_PQ_MODULE_SHARPNESS,       127},   //lmixing_ratio
    {0x2244,        16,     27,     1,      0,      HI_PQ_MODULE_SHARPNESS,       273},   //lgain_ratio
    {0x2244,        31,     31,     1,      0,      HI_PQ_MODULE_SHARPNESS,       1},     //lti_en
    /*VHDLTITHD*/
    {0x2248,        0,       9,     1,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //lcoring_thd
    {0x2248,        10,     19,     1,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //lunder_swing
    {0x2248,        20,     31,     1,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //mchdir_c
    /*HD source*/
    /*VHDLTICTRL*/
    {0x2244,        8,      15,     2,      0,      HI_PQ_MODULE_SHARPNESS,       127},   //lmixing_ratio
    {0x2244,        16,     27,     2,      0,      HI_PQ_MODULE_SHARPNESS,       273},   //lgain_ratio
    {0x2244,        31,     31,     2,      0,      HI_PQ_MODULE_SHARPNESS,       1},     //lti_en
    /*VHDLTITHD*/
    {0x2248,        0,       9,     2,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //lcoring_thd
    {0x2248,        10,     19,     2,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //lunder_swing
    {0x2248,        20,     31,     2,      0,      HI_PQ_MODULE_SHARPNESS,       2},     //mchdir_c

    /************************************* ZME DS *****************************************/
#if 0
    /* SHOOTCTRL_HL */
    {0x08f8,    17,     17,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //hl_shootctrl_en
    {0x08f8,    16,     16,        0,        0,   HI_PQ_MODULE_ARTDS,        0},         //hl_shootctrl_mode
    {0x08f8,    15,     15,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //hl_flatdect_mode
    {0x08f8,    14,     14,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //hl_coringadj_en
    {0x08f8,    8,      13,        0,        0,   HI_PQ_MODULE_ARTDS,       32},         //hl_gain
    {0x08f8,    0,       7,        0,        0,   HI_PQ_MODULE_ARTDS,       32},         //hl_coring
    /* SHOOTCTRL_VL */
    {0x0900,    17,     17,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //vl_shootctrl_en
    {0x0900,    16,     16,        0,        0,   HI_PQ_MODULE_ARTDS,        0},         //vl_shootctrl_mode
    {0x0900,    15,     15,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //vl_flatdect_mode
    {0x0900,    14,     14,        0,        0,   HI_PQ_MODULE_ARTDS,        1},         //vl_coringadj_en
    {0x0900,    8,      13,        0,        0,   HI_PQ_MODULE_ARTDS,       32},         //vl_gain
    {0x0900,    0,       7,        0,        0,   HI_PQ_MODULE_ARTDS,       32},         //vl_coring
#endif
    /*v0_zme_shootctrl_hl*/
    {0x2234,        0,      7,      0,      0,      HI_PQ_MODULE_ARTDS, 32},     //hl_coring
    {0x2234,        8,      13,     0,      0,      HI_PQ_MODULE_ARTDS, 32},    //hl_gain
    {0x2234,        14,     14,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //hl_coringadj_en
    {0x2234,        15,     15,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //hl_flatdect_mode
    {0x2234,        16,     16,     0,      0,      HI_PQ_MODULE_ARTDS, 0},     //hl_shootctrl_mode
    {0x2234,        17,     17,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //hl_shootctrl_en
    /*v0_zme_shootctrl_vl*/
    {0x2238,        0,      7,      0,      0,      HI_PQ_MODULE_ARTDS, 32},     //vl_coring
    {0x2238,        8,      13,     0,      0,      HI_PQ_MODULE_ARTDS, 32},    //vl_gain
    {0x2238,        14,     14,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //vl_coringadj_en
    {0x2238,        15,     15,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //vl_flatdect_mode
    {0x2238,        16,     16,     0,      0,      HI_PQ_MODULE_ARTDS, 0},     //vl_shootctrl_mode
    {0x2238,        17,     17,     0,      0,      HI_PQ_MODULE_ARTDS, 1},     //vl_shootctrl_en
};

static PQ_PHY_REG_S sg_stPQSoftReg[SOFT_REG_MAX] =
{
    /***************************************************************************
      * Special Register
     ***************************************************************************/

    /*Addr                                   Lsb       Msb    SourceMode  OutputMode   Module     Value        Description*/
    /***********************************************FMD_CTRL***********************************************/
    /*IP_DETECT*/
    {PQ_SOFT_IP_DETECT,         0,       1,        0,        0,     HI_PQ_MODULE_FMD,       0},       //ip_detect_choice
    {PQ_SOFT_FRMRATETHR_L,      0,      15,        0,        0,     HI_PQ_MODULE_FMD,   23800},       //g_u32FrmRateThr_L
    {PQ_SOFT_FRMRATETHR_H,      0,      15,        0,        0,     HI_PQ_MODULE_FMD,   24200},       //g_u32FrmRateThr_H

    /*COLOR_TEMP*/
    {PQ_SOFT_COLOR_TEMP_R,      0,       0,        0,        0,     HI_PQ_MODULE_CSC,      50},       //colortemp red
    {PQ_SOFT_COLOR_TEMP_G,      0,       0,        0,        0,     HI_PQ_MODULE_CSC,      50},       //colortemp green
    {PQ_SOFT_COLOR_TEMP_B,      0,       0,        0,        0,     HI_PQ_MODULE_CSC,      50},       //colortemp blue

    /*MODULE_ON_OR_OFF*/
    {PQ_SOFT_MODULE_FMD_SD,     0,       0,        0,        0,     HI_PQ_MODULE_FMD,       1},       //fmd sd on/off
    {PQ_SOFT_MODULE_FMD_HD,     0,       0,        0,        0,     HI_PQ_MODULE_FMD,       1},       //fmd hd on/off
    {PQ_SOFT_MODULE_FMD_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_FMD,       0},       //fmd uhd on/off
    {PQ_SOFT_MODULE_TNR_SD,     0,       0,        0,        0,     HI_PQ_MODULE_TNR,       1},       //tnr sd on/off
    {PQ_SOFT_MODULE_TNR_HD,     0,       0,        0,        0,     HI_PQ_MODULE_TNR,       1},       //tnr hd on/off
    {PQ_SOFT_MODULE_TNR_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_TNR,       0},       //tnr uhd on/off
    {PQ_SOFT_MODULE_SNR_SD,     0,       0,        0,        0,     HI_PQ_MODULE_SNR,       1},       //snr sd on/off
    {PQ_SOFT_MODULE_SNR_HD,     0,       0,        0,        0,     HI_PQ_MODULE_SNR,       0},       //snr hd on/off
    {PQ_SOFT_MODULE_SNR_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_SNR,       0},       //snr uhd on/off
    {PQ_SOFT_MODULE_LCHDR_SD,   0,       0,        0,        0,     HI_PQ_MODULE_LCHDR,     0},       //lchdr sd on/off
    {PQ_SOFT_MODULE_LCHDR_FHD,  0,       0,        0,        0,     HI_PQ_MODULE_LCHDR,     0},       //lchdr hd on/off
    {PQ_SOFT_MODULE_LCHDR_UHD,  0,       0,        0,        0,     HI_PQ_MODULE_LCHDR,     0},       //lchdr uhd on/off
    {PQ_SOFT_MODULE_DB_SD,      0,       0,        0,        0,     HI_PQ_MODULE_DB,        1},       //db sd on/off
    {PQ_SOFT_MODULE_DB_HD,      0,       0,        0,        0,     HI_PQ_MODULE_DB,        0},       //db hd on/off
    {PQ_SOFT_MODULE_DB_UHD,     0,       0,        0,        0,     HI_PQ_MODULE_DB,        0},       //db uhd on/off
    {PQ_SOFT_MODULE_DR_SD,      0,       0,        0,        0,     HI_PQ_MODULE_DR,        0},       //dr sd on/off
    {PQ_SOFT_MODULE_DR_HD,      0,       0,        0,        0,     HI_PQ_MODULE_DR,        0},       //dr hd on/off
    {PQ_SOFT_MODULE_DR_UHD,     0,       0,        0,        0,     HI_PQ_MODULE_DR,        0},       //dr uhd on/off
    {PQ_SOFT_MODULE_DM_SD,      0,       0,        0,        0,     HI_PQ_MODULE_DM,        1},       //dm sd on/off
    {PQ_SOFT_MODULE_DM_HD,      0,       0,        0,        0,     HI_PQ_MODULE_DM,        0},       //dm hd on/off
    {PQ_SOFT_MODULE_DM_UHD,     0,       0,        0,        0,     HI_PQ_MODULE_DM,        0},       //dm uhd on/off
    {PQ_SOFT_MODULE_SHARPN_SD,  0,       0,        0,        0,     HI_PQ_MODULE_SHARPNESS, 1},       //sharp sd on/off
    {PQ_SOFT_MODULE_SHARPN_HD,  0,       0,        0,        0,     HI_PQ_MODULE_SHARPNESS, 1},       //sharphd on/off
    {PQ_SOFT_MODULE_SHARPN_UHD, 0,       0,        0,        0,     HI_PQ_MODULE_SHARPNESS, 0},       //sharp uhd on/off
    {PQ_SOFT_MODULE_DCI_SD,     0,       0,        0,        0,     HI_PQ_MODULE_DCI,       1},       //dci sd on/off
    {PQ_SOFT_MODULE_DCI_HD,     0,       0,        0,        0,     HI_PQ_MODULE_DCI,       1},       //dci hd on/off
    {PQ_SOFT_MODULE_DCI_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_DCI,       0},       //dci uhd on/off
    {PQ_SOFT_MODULE_ACM_SD,     0,       0,        0,        0,     HI_PQ_MODULE_COLOR,     1},       //acm sd on/off
    {PQ_SOFT_MODULE_ACM_HD,     0,       0,        0,        0,     HI_PQ_MODULE_COLOR,     1},       //acm hd on/off
    {PQ_SOFT_MODULE_ACM_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_COLOR,     0},       //acm uhd on/off
    {PQ_SOFT_MODULE_CSC_SD,     0,       0,        0,        0,     HI_PQ_MODULE_CSC,       1},       //csc sd on/off
    {PQ_SOFT_MODULE_CSC_HD,     0,       0,        0,        0,     HI_PQ_MODULE_CSC,       1},       //csc hd on/off
    {PQ_SOFT_MODULE_CSC_UHD,    0,       0,        0,        0,     HI_PQ_MODULE_CSC,       0},       //csc uhd on/off
    {PQ_SOFT_MODULE_DS_SD,      0,       0,        0,        0,     HI_PQ_MODULE_DS,        1},       //fmd sd on/off
    {PQ_SOFT_MODULE_DS_HD,      0,       0,        0,        0,     HI_PQ_MODULE_DS,        1},       //fmd hd on/off
    {PQ_SOFT_MODULE_DS_UHD,     0,       0,        0,        0,     HI_PQ_MODULE_DS,        0},       //fmd uhd on/off
};


PQ_PHY_REG_S *PQ_TABLE_GetPhyRegDefault(HI_VOID)
{
    return sg_stPhyRegDefault;
}

PQ_PHY_REG_S *PQ_TABLE_GetSoftRegDefault(HI_VOID)
{
    return sg_stPQSoftReg;
}

