/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_common_ca_reg.h
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HAL_KLAD_COMMON_CA_REG_H__
#define __HAL_KLAD_COMMON_CA_REG_H__

#include "hi_type.h"
#include "hal_klad_reg.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define KL_CM0_CSA2_KLAD_CTRL            (KL_BASE_ADDR + 0xD0)    //CM0 CSA2 Key ladder control register.
#define KL_CM0_CSA3_KLAD_CTRL            (KL_BASE_ADDR + 0xD4)    //CM0 CSA3 Key ladder control register.
#define KL_CM0_SP_KLAD_CTRL              (KL_BASE_ADDR + 0xD8)    //CM0 SP key ladder control register.
#define KL_CM0_R2R_KLAD_CTRL             (KL_BASE_ADDR + 0xDC)    //CM0 R2R key ladder control register.
#define KL_CM0_MISC_KLAD_CTRL            (KL_BASE_ADDR + 0xE0)    //CM0 misc key ladder control register.
#define KL_CM0_KLAD_STATE                (KL_BASE_ADDR + 0xE4)    //CM0 key ladder state.

#define KL_CM0_OTP_LV_SEL                (KL_OTP_SHADOW_BASE_ADDR + 0x20)

#define KL_CM0_CSA2_TEE_CTRL             (KL_BASE_ADDR + 0x354)
#define KL_CM0_CSA3_TEE_CTRL             (KL_BASE_ADDR + 0x358)
#define KL_CM0_SP_TEE_CTRL               (KL_BASE_ADDR + 0x35C)
#define KL_CM0_R2R_TEE_CTRL              (KL_BASE_ADDR + 0x360)
#define KL_CM0_MISC_TEE_CTRL             (KL_BASE_ADDR + 0x364)

typedef union
{
    struct
    {
        HI_U32 cm0_csa2_calc_start    : 1; //[0]
        HI_U32 cm0_csa2_level_sel     : 4; //[1~4]
        HI_U32 cm0_csa2_alg_sel       : 2; //[5~6]
        HI_U32 reserved               : 25; //[7~31]
    } bits;
    HI_U32 u32;
} KL_CM0_CSA2_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 cm0_csa3_calc_start    : 1; //[0]
        HI_U32 cm0_csa3_level_sel     : 4; //[1~4]
        HI_U32 cm0_csa3_alg_sel       : 2; //[5~6]
        HI_U32 reserved1              : 25; //[7~31]
    } bits;
    HI_U32 u32;
} KL_CM0_CSA3_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 cm0_sp_calc_start     : 1; //[0]
        HI_U32 cm0_sp_level_sel      : 4; //[1~4]
        HI_U32 cm0_sp_alg_sel        : 2; //[5~6]
        HI_U32 reserved0             : 9; //[7~15]
        HI_U32 cm0_sp_dsc_mode       : 8; //[16~23]
        HI_U32 cm0_sp_port_sel       : 2; //[24~25]
        HI_U32 reserved1             : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_CM0_SP_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 cm0_r2r_calc_start   : 1; //[0]
        HI_U32 cm0_r2r_level_sel    : 4; //[1~4]
        HI_U32 cm0_r2r_alg_aes_sel  : 2; //[5~6]
        HI_U32 reserved0            : 9; //[7~15]
        HI_U32 cm0_r2r_dsc_mode     : 8; //[16~23]
        HI_U32 cm0_r2r_port_sel     : 2; //[24~25]
        HI_U32 reserved1            : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_CM0_R2R_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 cm0_misc_calc_start   : 1; //[0]
        HI_U32 cm0_misc_level_sel    : 4; //[1~4]
        HI_U32 cm0_misc_alg_sel      : 2; //[5~6]
        HI_U32 reserved0             : 9; //[7~15]
        HI_U32 cm0_misc_dsc_mode     : 8; //[16~23]
        HI_U32 cm0_misc_port_sel     : 2; //[24~25]
        HI_U32 reserved1             : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_CM0_MISC_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U8 cm0_deob_enable       : 1; //[0]
        HI_U8 cm0_csa2_lv_sel       : 1; //[1]
        HI_U8 cm0_csa3_lv_sel       : 1; //[2]
        HI_U8 cm0_sp_lv_sel         : 1; //[3]
        HI_U8 reserved              : 1; //[4]
        HI_U8 cm0_r2r_lv_sel        : 1; //[5]
        HI_U8 cm0_misc_lv_sel       : 1; //[6]
        HI_U8 reserved1             : 1; //[7]
    } bits;
    HI_U8 u8;
} KL_CM0_OTP_LV_SEL_U;


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HAL_KLAD_COMMON_CA_REG_H__ */
