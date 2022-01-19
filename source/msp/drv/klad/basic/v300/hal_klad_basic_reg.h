/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_basic_reg.h
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HAL_KLAD_BASIC_REG_H__
#define __HAL_KLAD_BASIC_REG_H__

#include "hi_type.h"
#include "hal_klad_reg.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

#define KL_BOOT_KLAD_CTRL              (KL_BASE_ADDR + 0x144)    //BOOT   key ladder start register
#define KL_BOOT_KLAD_STATE             (KL_BASE_ADDR + 0x148)    //key ladder state.

#define KL_SW_KLAD_RK_SEL              (KL_BASE_ADDR + 0x160)    //SW  key ladder rootkey selection
#define KL_SW_KLAD_CTRL                (KL_BASE_ADDR + 0x164)    //SW  key ladder start register
#define KL_SW_KLAD_STATE               (KL_BASE_ADDR + 0x16C)    //SW key ladder state.

#define KL_STB_IMAGE_KLAD_CTRL         (KL_BASE_ADDR + 0x1F0)    //STB IMAGE   key ladder start register
#define KL_STB_IMAGE_KLAD_STATE        (KL_BASE_ADDR + 0x1F4)    //key ladder state.

#define KL_CLEAR_CW_KLAD_CTRL          (KL_BASE_ADDR + 0x204)    //Clear CW control register
#define KL_AUX_KLAD_CTRL               (KL_BASE_ADDR + 0x208)    //AUX Keyladder control register
#define KL_SMCU_KLAD_CTRL              (KL_BASE_ADDR + 0x210)    //SMCU Keyladder control register
#define KL_TEE_KLAD_STATE              (KL_BASE_ADDR + 0x218)    //TEE key ladder state.
#define KL_HSL_KLAD_CTRL               (KL_BASE_ADDR + 0x21C)    //HSL Keyladder control register
#define KL_HSL_KLAD_DISABLE            (KL_BASE_ADDR + 0x220)    //HSL Keyladder disable control register

#define KL_C1_CSA2_TEE_CTRL             (KL_BASE_ADDR + 0x330)
#define KL_C1_CSA3_TEE_CTRL             (KL_BASE_ADDR + 0x334)
#define KL_C1_AES_TEE_CTRL              (KL_BASE_ADDR + 0x338)
#define KL_C1_TDES_TEE_CTRL             (KL_BASE_ADDR + 0x33C)
#define KL_C1_BOOT_TEE_CTRL             (KL_BASE_ADDR + 0x340)
#define KL_C2_CW_TEE_CTRL               (KL_BASE_ADDR + 0x344)
#define KL_C2_R2R_TEE_CTRL              (KL_BASE_ADDR + 0x348)
#define KL_C2_SSUK_TEE_CTRL             (KL_BASE_ADDR + 0x350)
#define KL_CM0_CSA2_TEE_CTRL            (KL_BASE_ADDR + 0x354)
#define KL_CM0_CSA3_TEE_CTRL            (KL_BASE_ADDR + 0x358)
#define KL_CM0_SP_TEE_CTRL              (KL_BASE_ADDR + 0x35C)
#define KL_CM0_R2R_TEE_CTRL             (KL_BASE_ADDR + 0x360)
#define KL_CM0_MISC_TEE_CTRL            (KL_BASE_ADDR + 0x364)
#define KL_CM0_LP_TEE_CTRL              (KL_BASE_ADDR + 0x368)
#define KL_CM1_SP_TEE_CTRL              (KL_BASE_ADDR + 0x36C)
#define KL_CM1_R2R_TEE_CTRL             (KL_BASE_ADDR + 0x370)
#define KL_CM1_MISC_TEE_CTRL            (KL_BASE_ADDR + 0x374)
#define KL_DCAS_TEE_CTRL                (KL_BASE_ADDR + 0x378)
#define KL_SW_TEE_CTRL                  (KL_BASE_ADDR + 0x37C)
#define KL_STB_IMAGE_TEE_CTRL           (KL_BASE_ADDR + 0x384)
#define KL_BOOT_TEE_CTRL                (KL_BASE_ADDR + 0x388)
#define KL_HOST_KEY_TEE_CTRL            (KL_BASE_ADDR + 0x38C)

#define KL_C1_BOOT_CPU_ACCESS_CTRL      (KL_BASE_ADDR + 0x3B0)
#define KL_C2_CPU_ACCESS_CTRL           (KL_BASE_ADDR + 0x3B4)
#define KL_CM0_CPU_ACCESS_CTRL          (KL_BASE_ADDR + 0x3B8)
#define KL_CM1_CPU_ACCESS_CTRL          (KL_BASE_ADDR + 0x3BC)
#define KL_BOOT_CPU_ACCESS_CTRL         (KL_BASE_ADDR + 0x3C0)
#define KL_DCAS_CPU_ACCESS_CTRL         (KL_BASE_ADDR + 0x3C4)
#define KL_HOST_KEY_CPU_ACCESS_CTRL     (KL_BASE_ADDR + 0x3C8)
#define KL_SW_CPU_ACCESS_CTRL           (KL_BASE_ADDR + 0x3CC)
#define KL_STB_IMAGE_CPU_ACCESS_CTRL    (KL_BASE_ADDR + 0x3D4)

typedef union
{
    struct
    {
        HI_U32 boot_calc_start       : 1; //[0]
        HI_U32 reserved0             : 4; //[1~4]
        HI_U32 boot_alg_sel          : 2; //[5~6]
        HI_U32 reserved1             : 17; //[7~23]
        HI_U32 boot_port_sel         : 2; //[24~25]
        HI_U32 reserved2             : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_BOOT_KLAD_CTRL_U;

typedef union
{
    struct
    {
        HI_U32 boot_klad0_rdy        : 1; //[0]
        HI_U32 reserved              : 31; //[1~31]
    } bits;
    HI_U32 u32;
} KL_BOOT_KLAD_STATE_U;

typedef union
{
    struct
    {
        HI_U32 sw_kl_rk_sel         : 1; //[0]
        HI_U32 reserved             : 31; //[1~31]
    } bits;
    HI_U32 u32;
} KL_SW_KLAD_RK_SEL_U;

typedef union
{
    struct
    {
        HI_U32 sw_calc_start         : 1; //[0]
        HI_U32 reserved0             : 4; //[1~4]
        HI_U32 sw_alg_sel            : 2; //[5~6]
        HI_U32 reserved1             : 25; //[7~31]
    } bits;
    HI_U32 u32;
} KL_SW_KLAD_CTRL_U;

// logic starts 2 level inside
typedef union
{
    struct
    {
        HI_U32 sw_klad0_rdy         : 1; //[0]
        HI_U32 sw_klad1_rdy         : 1; //[1]
        HI_U32 reserved             : 30; //[2~31]
    } bits;
    HI_U32 u32;
} KL_SW_KLAD_STATE_U;


typedef union
{
    struct
    {
        HI_U32 clear_cw_calc_start    : 1; //[0]
        HI_U32 reserved0              : 15; //[1~15]
        HI_U32 clear_cw_dsc_mode      : 8; //[16~23]
        HI_U32 clear_cw_port_sel      : 2; //[24~25]
        HI_U32 reserved1              : 6; //[26~31]
    } bits;
    HI_U32 u32;
} KL_CLEAR_CW_KLAD_CTRL_U;

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif    /* __HAL_KLAD_BASIC_REG_H__ */
