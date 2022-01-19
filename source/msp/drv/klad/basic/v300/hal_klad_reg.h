/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_reg.h
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HAL_KLAD_REG_H__
#define __HAL_KLAD_REG_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */


#define KL_BASE_ADDR                (0xF8ABA000)
#define KL_BASE_ADDR_LEN            (0x1000)
#define KL_OTP_SHADOW_BASE_ADDR     (0xF8AB0000)
#define KL_OTP_SHADOW_BASE_ADDR_LEN (0x1000)
#define KL_HCPU_BASE_ADDR           (0xF8AB4000)
#define KL_HCPU_BASE_ADDR_LEN       (0x1000)

#define KL_TCPU_KLAD_ADDR           (KL_BASE_ADDR + 0x2B0)
#define KL_TCPU_KLAD_STATE          (KL_BASE_ADDR + 0x2B4)     //TZCPU HKL work state.
#define KL_TCPU_KLAD_CHECK_ERROR    (KL_BASE_ADDR + 0x2B8)     //Hisec key ladder error code value.

#define KL_KLAD_ADDR                KL_TCPU_KLAD_ADDR
#define KL_KLAD_STATE               KL_TCPU_KLAD_STATE
#define KL_KLAD_CHECK_ERROR         KL_TCPU_KLAD_CHECK_ERROR

#define KL_SEC_KLAD_DIN0            (KL_BASE_ADDR + 0x260)    //secure CPU config data in register 0
#define KL_SEC_KLAD_DIN1            (KL_BASE_ADDR + 0x264)    //secure CPU  data in register 1
#define KL_SEC_KLAD_DIN2            (KL_BASE_ADDR + 0x268)    //secure CPU  data in register 2
#define KL_SEC_KLAD_DIN3            (KL_BASE_ADDR + 0x26C)    //secure CPU  data in register 3

#define KL_REG_DIN0                  KL_SEC_KLAD_DIN0
#define KL_REG_DIN1                  KL_SEC_KLAD_DIN1
#define KL_REG_DIN2                  KL_SEC_KLAD_DIN2
#define KL_REG_DIN3                  KL_SEC_KLAD_DIN3

#define KL_CA_RST_REQ                (KL_HCPU_BASE_ADDR + 0x200)
#define KL_CA_RST_REQ_LOCK           (KL_HCPU_BASE_ADDR + 0x204)

#define KL_CA_HKL_TZCPU_INT_RAW        (KL_BASE_ADDR + 0x42C)    //hkl module raise tzcpu calculation finish raw interup
#define KL_CA_HKL_TZCPU_INT_EN         (KL_BASE_ADDR + 0x430)    //raise tzcpu calculation finish interup enable
#define KL_CA_HKL_TZCPU_INT            (KL_BASE_ADDR + 0x434)    //hkl module raise tzcpu calculation finish interup state

typedef union
{
    struct
    {
        HI_U32 hkl_busy    : 1; //[0]
        HI_U32 reserved    : 31; //[1~31]
    } bits;
    HI_U32 u32;
} KL_KLAD_STATE_U;

typedef union
{
    struct
    {
        HI_U32 kl_err       : 1; //[0]
        HI_U32 reserved0    : 3; //[1~3]
        HI_U32 kl_check_err : 8; //[4~11]
        HI_U32 reserved1    : 20; //[12~31]
    } bits;
    HI_U32 u32;
} KL_KLAD_CHECK_ERROR_U;

typedef union
{
    struct
    {
        HI_U32 key_odd     : 1; //[0]
        HI_U32 key_addr    : 9; //[1~9]
        HI_U32 reserved    : 22; //[10~31]
    } bits;
    HI_U32 u32;
} KL_KLAD_ADDR_U;

typedef union
{
    struct
    {
        HI_U32 akl_rst_req  : 1; //[0]
        HI_U32 reserved0    : 2; //[1~2]
        HI_U32 hkl_rst_req  : 1; //[3]
        HI_U32 reserved1    : 20; //[4~31]
    } bits;
    HI_U32 u32;
} KL_CA_RST_REQ_U;

typedef union
{
    struct
    {
        HI_U32 akl_rst_req_lock  : 1; //[0]
        HI_U32 reserved0         : 2; //[1~2]
        HI_U32 hkl_rst_req_lock  : 1; //[3]
        HI_U32 reserved1         : 20; //[4~31]
    } bits;
    HI_U32 u32;
} KL_CA_RST_REQ_LOCK_U;

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif  /* __HAL_KLAD_REG_H__ */
