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
#include <asm/io.h>
#include <linux/sched.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include "hi_drv_reg.h"
#include "hi_drv_klad.h"
#include "hal_klad_reg.h"
#include "hal_klad.h"
#include "drv_klad.h"
#include "hi_drv_klad.h"


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


static HI_U8* g_klad_vir_addr = 0;
static HI_U8* g_otp_shadow_vir_addr = 0;
static HI_U8* g_hcpu_vir_addr = 0;

HI_VOID HAL_KLAD_RegisterMap(void)
{
    HI_VOID *ptr = HI_NULL;

    ptr = ioremap_nocache(KL_BASE_ADDR, 0x1000);
    if (HI_NULL == ptr)
    {
        HI_ERR_KLAD("ca_ioremap_nocache err!\n");
        return;
    }
    g_klad_vir_addr = ptr;

    ptr = ioremap_nocache(KL_OTP_SHADOW_BASE_ADDR, 0x1000);
    if (HI_NULL == ptr)
    {
        HI_ERR_KLAD("ca_ioremap_nocache err!\n");
        return;
    }
    g_otp_shadow_vir_addr = ptr;

    ptr = ioremap_nocache(KL_HCPU_BASE_ADDR, 0x1000);
    if (HI_NULL == ptr)
    {
        HI_ERR_KLAD("ca_ioremap_nocache err!\n");
        return;
    }
    g_hcpu_vir_addr = ptr;

    return;
}

HI_VOID HAL_KLAD_RegisterUnMap(void)
{
    if (g_klad_vir_addr != 0)
    {
        iounmap((HI_VOID*)g_klad_vir_addr);
        g_klad_vir_addr = 0;
    }

    if (g_otp_shadow_vir_addr != 0)
    {
        iounmap((HI_VOID*)g_otp_shadow_vir_addr);
        g_otp_shadow_vir_addr = 0;
    }

    if (g_hcpu_vir_addr != 0)
    {
        iounmap((HI_VOID*)g_hcpu_vir_addr);
        g_hcpu_vir_addr = 0;
    }

    return;
}

HI_VOID HAL_KLAD_WriteReg(HI_U32 addr, HI_U32 val)
{
    if((addr >= KL_BASE_ADDR) && (addr < (KL_BASE_ADDR + KL_BASE_ADDR_LEN)))
    {
        HI_REG_WRITE32((g_klad_vir_addr + (addr - KL_BASE_ADDR)), val);
    }
    else if((addr >= KL_HCPU_BASE_ADDR) && (addr < (KL_HCPU_BASE_ADDR + KL_HCPU_BASE_ADDR_LEN)))
    {
        HI_REG_WRITE32((g_hcpu_vir_addr + (addr - KL_HCPU_BASE_ADDR)), val);
    }
    else
    {
        HI_ERR_KLAD("ERROR address 0x%08x.\n", addr);
        val = 0xDEAD;
    }

    HI_INFO_KLAD("w:0x%08x:0x%08x.\n", addr, val);
    return;
}

HI_U32 HAL_KLAD_ReadReg(HI_U32 addr)
{
    HI_U32 val = 0xDEAD;

    if((addr >= KL_BASE_ADDR) && (addr < (KL_BASE_ADDR + KL_BASE_ADDR_LEN)))
    {
        HI_REG_READ32((g_klad_vir_addr + (addr - KL_BASE_ADDR)), val);
    }
    else if((addr >= KL_OTP_SHADOW_BASE_ADDR) && (addr < (KL_OTP_SHADOW_BASE_ADDR + KL_OTP_SHADOW_BASE_ADDR_LEN)))
    {
        HI_REG_READ32((g_otp_shadow_vir_addr + (addr - KL_OTP_SHADOW_BASE_ADDR)), val);
    }
    else if((addr >= KL_HCPU_BASE_ADDR) && (addr < (KL_HCPU_BASE_ADDR + KL_HCPU_BASE_ADDR_LEN)))
    {
        HI_REG_READ32((g_hcpu_vir_addr + (addr - KL_HCPU_BASE_ADDR)), val);
    }
    else
    {
        HI_ERR_KLAD("ERROR address 0x%08x.\n", addr);
    }

    HI_INFO_KLAD("r:0x%08x:0x%08x.\n", addr, val);
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

HI_S32 HAL_KLAD_ProcReadOtpShadowReg(HI_U32 addr, HI_U32 *value)
{
    HI_U32 val;
    HI_U8 *pu8VirAddr = HI_NULL;

    KLAD_CHECK_POINTER(value);
    pu8VirAddr = (HI_U8 *)ioremap_nocache(addr, 0x10);
    if (HI_NULL == pu8VirAddr)
    {
        HI_ERR_KLAD("ioremap_nocache map error\n");
        return HI_FAILURE;
    }
    HI_REG_READ32(pu8VirAddr, val);
    iounmap(pu8VirAddr);

    *value = val;

    return HI_SUCCESS;
}

HI_S32 HAL_KLAD_ProcWriteOtpShadowReg(HI_U32 addr, HI_U32 value)
{
    HI_U8 *pu8VirAddr = HI_NULL;

    pu8VirAddr = (HI_U8 *)ioremap_nocache(addr, 0x10);
    if (HI_NULL == pu8VirAddr)
    {
        HI_ERR_KLAD("ioremap_nocache map error\n");
        return HI_FAILURE;
    }
    HI_REG_WRITE32(pu8VirAddr, value);
    iounmap(pu8VirAddr);

    return HI_SUCCESS;
}

HI_S32 HAL_KLAD_ProcReadOtpShadowByte(HI_U32 addr, HI_U8 *value)
{
    HI_S32 ret = 0;
    HI_U32 v = 0;
    HI_U32 addr_e = 0;

    KLAD_CHECK_POINTER(value);
    addr_e = addr & (~0x3);
    ret = HAL_KLAD_ProcReadOtpShadowReg(addr_e, &v);
    if (HI_SUCCESS != ret)
    {
        return HI_FAILURE;
    }
    *value = (v >> ((addr & 0x3) * 8)) & 0xff ;

    return HI_SUCCESS;
}

extern DRV_KLAD_SESSION_LIST klad_session_list;
HI_S32 HAL_KLAD_CheckState(HI_VOID)
{
    HI_S32 ret = HI_SUCCESS;
    KL_KLAD_CHECK_ERROR_U check_error;
#ifdef HI_KLAD_INT_SUPPORT
    if (0 == wait_event_interruptible_timeout(klad_session_list.klad_wait_queue,
                klad_session_list.wake_up, msecs_to_jiffies(1000)))
    {
        HI_ERR_KLAD("hkl is busy, IRQ : %d, status : 0x%08x\n",HKL_IRQ_NUMBER, HAL_KLAD_ReadReg(KL_KLAD_STATE));
        return HI_ERR_KLAD_WAIT_TIMEOUT;
    }
    klad_session_list.wake_up = HI_FALSE;
#else
    HI_U32 cnt = 0;
    KL_KLAD_STATE_U state;

    while (1)
    {
        udelay(5);
        state.u32 = HAL_KLAD_ReadReg(KL_KLAD_STATE);
        if (0x0 == state.bits.hkl_busy)
        {
            break;
        }

        cnt++;
        if(cnt % 200 == 0)
            msleep(1);

        if (cnt >= 1000)
        {
            HI_ERR_KLAD("hkl is busy,status : 0x%08x\n",state.u32);
            return HI_ERR_KLAD_WAIT_TIMEOUT;
        }
    }
#endif
    check_error.u32 = HAL_KLAD_ReadReg(KL_KLAD_CHECK_ERROR);
    if (check_error.bits.kl_check_err != 0x0)
    {
        HI_ERR_KLAD("error register address:0x%08x , kl_check_err: 0x%08x \n",KL_KLAD_CHECK_ERROR,check_error.bits.kl_check_err);
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

HI_VOID HAL_KLAD_SetComDataIn(HI_U8 *data)
{
    HAL_KLAD_SetDataIn(data);

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
#ifdef HI_KLAD_INT_SUPPORT
HI_VOID HAL_KLAD_IntEn(HI_VOID)
{
    HAL_KLAD_WriteReg(KL_CA_HKL_TZCPU_INT_EN, 0x01);
}
HI_VOID HAL_KLAD_IntDis(HI_VOID)
{
    HAL_KLAD_WriteReg(KL_CA_HKL_TZCPU_INT_EN, 0x00);
}
HI_VOID HAL_KLAD_IntClr(HI_VOID)
{
    HAL_KLAD_WriteReg(KL_CA_HKL_TZCPU_INT_RAW, 0x01);
}
HI_U32 HAL_KLAD_GetIntSta(HI_VOID)
{
    return HAL_KLAD_ReadReg(KL_CA_HKL_TZCPU_INT);
}
#endif

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
            state.u32 = HAL_KLAD_ReadReg(KL_TCPU_KLAD_STATE);
            if (0x0 == state.bits.hkl_busy)
            {
                break;
            }
            msleep(1);
            cnt++;
            if (cnt >= 100)
            {
                KLAD_ERR_PrintHex(state.u32);
                KLAD_PrintErrorCode(HI_ERR_KLAD_WAIT_TIMEOUT);
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
