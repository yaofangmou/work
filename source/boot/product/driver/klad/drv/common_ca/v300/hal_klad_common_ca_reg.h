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

#include "hal_klad_reg.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define KL_CM0_R2R_KLAD_CTRL            (KL_BASE_ADDR + 0xDC)
#define KL_CM0_R2R_TEE_CTRL             (KL_BASE_ADDR + 0x360)
#define KL_CM0_KLAD_STATE               (KL_BASE_ADDR + 0xE4)    //CM0 key ladder state.

#define KL_COM_CA_OTP_LV_SEL                 (0x20)

typedef union
{
    struct
    {
        HI_U32 calc_start   : 1; //[0]
        HI_U32 level_sel    : 4; //[1~4]
        HI_U32 tdes_aes_sel : 2; //[5~6]
        HI_U32 reserved0    : 9; //[7~15]
        HI_U32 dsc_mode     : 8; //[16~23]
        HI_U32 port_sel     : 2; //[24~25]
        HI_U32 reserved1    : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_COM_CA_R2R_KLAD_CTRL_U;

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
} KL_COMMON_CA_OTP_LV_SEL_U;

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HAL_KLAD_COMMON_CA_REG_H__ */
