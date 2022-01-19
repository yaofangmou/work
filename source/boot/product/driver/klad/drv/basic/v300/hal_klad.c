/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad.c
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include "exports.h"
#include "hi_drv_klad.h"
#include "hal_klad_reg.h"
#include "hal_klad.h"
#include "hi_error_mpi.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


HI_VOID HAL_KLAD_WriteReg(HI_U32 addr, HI_U32 val)
{
    HI_INFO_KLAD("[w]0x%08x][v]0x%08x\n", addr, val);
    HI_REG_WRITE32(addr, val);
    return;
}

HI_U32 HAL_KLAD_ReadReg(HI_U32 addr)
{
    HI_U32 val = 0;
    HI_INFO_KLAD("[r]0x%08x][v]0x%08x\n", addr, val);
    HI_REG_READ32(addr, val);
    return val;
}

HI_U8 HAL_KLAD_ReadOtpShadowByte(HI_U32 addr)
{
    HI_U8 val = 0;
    HI_U32 addr_e = 0;
    HI_U32 v = 0;

    addr_e = addr & (~0x3);
    v = HAL_KLAD_ReadReg(addr_e);

    val = (v >> ((addr & 0x3) * 8)) & 0xff ;

    return val;
}

HI_U32 HAL_KLAD_ReadOtpShadowReg(HI_U32 addr)
{
    HI_U32 val = 0;

    HI_REG_READ32((addr + KL_OTP_SHADOW_BASE_ADDR), val);
    return val;
}

HI_S32 HAL_KLAD_CheckState(HI_VOID)
{
    HI_S32 ret = HI_SUCCESS;
    KL_KLAD_STATE_U state;
    KL_KLAD_CHECK_ERROR_U check_error;
    HI_U32 cnt = 0;

    while (1)
    {
        state.u32 = 0;
        state.u32 = HAL_KLAD_ReadReg(KL_KLAD_STATE);
        if (0x0 == state.bits.hkl_busy)
        {
            break;
        }

        msleep(1);
        cnt++;

        // TODO:
        if (cnt >= 100)
        {
            HI_ERR_KLAD("hkl is busy\n");
            return HI_ERR_KLAD_WAIT_TIMEOUT;
        }
    }

    check_error.u32 = HAL_KLAD_ReadReg(KL_KLAD_CHECK_ERROR);
    if (check_error.bits.kl_check_err != 0x0)
    {
        HI_ERR_KLAD("kl_check_err %#x\n", check_error.bits.kl_check_err);
        ret = HI_ERR_KLAD_CHECK_BASE + check_error.bits.kl_check_err;
    }

    return ret;
}

HI_VOID HAL_KLAD_SetDataIn(HI_U8 *data)
{
    HI_U32 i = 0;
    HI_U32 din = 0;

    for (i = 0; i < 16; i += 4)
    {
        din = ((HI_U32)data[i + 3] << 24) | ((HI_U32)data[i + 2] << 16) | ((HI_U32)data[i + 1] << 8) | data[i];
        HAL_KLAD_WriteReg(KL_REG_DIN0 + i, din);
    }

    return;
}

HI_VOID HAL_KLAD_SetAddr(HI_U8 addr, HI_U8 odd)
{
    KL_KLAD_ADDR_U data;

    data.u32 = 0;
    data.bits.key_odd   = odd & 0x1;
    data.bits.key_addr  = addr & 0x1FF;
    HAL_KLAD_WriteReg(KL_KLAD_ADDR, data.u32);

    return;
}

HI_S32 HAL_KLAD_HWEnable(HI_VOID)
{
    KL_CA_RST_REQ_LOCK_U rst_req_lock;
    KL_CA_RST_REQ_U rst_req;
    KL_KLAD_STATE_U state;
    HI_U32 cnt = 0;

    rst_req_lock.u32 = HAL_KLAD_ReadReg(KL_CA_RST_REQ_LOCK);
    rst_req.u32 = HAL_KLAD_ReadReg(KL_CA_RST_REQ);
    if(rst_req_lock.bits.hkl_rst_req_lock == 0x0 && rst_req.bits.hkl_rst_req == 0x1)
    {
        rst_req.bits.hkl_rst_req = 0;
        HAL_KLAD_WriteReg(KL_CA_RST_REQ, rst_req.u32);
        while (1)
        {
            state.u32 = HAL_KLAD_ReadReg(KL_KLAD_STATE);
            if (0x2 == state.bits.hkl_busy)
            {
                break;
            }
            msleep(1);
            cnt++;
            if (cnt >= 100)
            {
                HI_ERR_KLAD("state.u32 %#x\n", state.u32);
                return HI_ERR_KLAD_WAIT_TIMEOUT;
            }
        }
        return HI_ERR_KLAD_SECURE_ATTR_UINIT;
    }
    return HI_SUCCESS;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
