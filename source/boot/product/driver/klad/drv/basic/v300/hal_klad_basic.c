/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad_basic.c
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#include "hal_klad.h"
#include "hal_klad_basic_reg.h"
#include "hal_klad_basic.h"
#include "hi_drv_klad.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif

HI_VOID HAL_KLAD_BOOTStart(HI_U8 alg, HI_U8 decrypt, HI_U8 addr, HI_U8 target)
{
    KL_BOOT_KLAD_CTRL_U ctrl;

    HAL_KLAD_SetAddr(addr, 0);

    ctrl.u32 = 0;
    ctrl.bits.boot_calc_start   = 0x1;
    ctrl.bits.boot_alg_sel      = alg & 0x3;
    ctrl.bits.boot_port_sel     = target & 0x3;
    HAL_KLAD_WriteReg(KL_BOOT_KLAD_CTRL, ctrl.u32);

    return;
}

HI_VOID HAL_KLAD_BOOTGetEncRslt(HI_U8 *data)
{
    HI_U32 i = 0;
    HI_U32 din = 0;

    for(i = 0; i < 4; i++)
    {
        din = HAL_KLAD_ReadReg(KL_BOOT_ENC_RSLT0 + 4*i);
        data[4*i] = din & 0xff;
        data[4*i + 1] = (din >> 8) & 0xff;
        data[4*i + 2] = (din >> 16) & 0xff;
        data[4*i + 3] = (din >> 24) & 0xff;
    }

    return;
}

HI_U32 HAL_KLAD_BOOTGetState(HI_VOID)
{
    KL_BOOT_KLAD_STATE_U state;

    state.u32 = HAL_KLAD_ReadReg(KL_BOOT_KLAD_STATE);

    return state.u32;
}

HI_VOID HAL_KLAD_SWStart(HI_U8 decrypt, HI_U8 addr)
{
    KL_SW_KLAD_CTRL_U ctrl;

    HAL_KLAD_SetAddr(addr, 0);

    ctrl.u32 = 0;
    ctrl.bits.sw_calc_start   = 0x1;
    ctrl.bits.sw_alg_sel      = 0x00; /* tdes */
    HAL_KLAD_WriteReg(KL_SW_KLAD_CTRL, ctrl.u32);

    return;
}

HI_U32 HAL_KLAD_SWGetState(HI_VOID)
{
    KL_SW_KLAD_STATE_U state;

    state.u32 = HAL_KLAD_ReadReg(KL_SW_KLAD_STATE);

    return state.u32;
}

HI_VOID HAL_KLAD_SetClearCwDataIn(HI_U8 *data)
{
    HAL_KLAD_SetDataIn(data);

    return;
}

HI_VOID HAL_KLAD_CLEAR_CWStart(HI_U8 addr, HI_U8 odd, HI_U8 engine, HI_U8 target)
{
    KL_CLEAR_CW_KLAD_CTRL_U ctrl;

    HAL_KLAD_SetAddr(addr, odd);

    ctrl.u32 = 0;
    ctrl.bits.clear_cw_calc_start   = 0x1;
    ctrl.bits.clear_cw_dsc_mode     = engine;
    ctrl.bits.clear_cw_port_sel     = target & 0x3;
    HAL_KLAD_WriteReg(KL_CLEAR_CW_KLAD_CTRL, ctrl.u32);

    return;
}

HI_VOID HAL_KLAD_SetClearCWSecEn(HI_U8 sec_en)
{
    HI_U32 ctrl;

    ctrl = (sec_en == KLAD_SEC_ENABLE) ? 0x500 : 0xa00;
    HAL_KLAD_WriteReg(KL_HOST_KEY_TEE_CTRL, ctrl);
}

HI_VOID HAL_KLAD_Basic_SetSecen(HI_VOID)
{
    HAL_KLAD_WriteReg(KL_SW_TEE_CTRL, 0x500);
    HAL_KLAD_WriteReg(KL_BOOT_TEE_CTRL, 0x500);
    HAL_KLAD_WriteReg(KL_HOST_KEY_TEE_CTRL, 0x500);

    return;
}

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif
