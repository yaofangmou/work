// ******************************************************************************
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co. Ltd.
// File name     :  audio_path_reg_c_union_define.c
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  sdk
// Version       :  1.0
// Date          :  Tester
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  sdk 2015/05/23 11:11:23 Create file
// ******************************************************************************


#include "hi_type.h"
#include "hdmi_reg_audio_path.h"
#include "hdmi_product_define.h"
#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif

#define AUDIOPATH_NULL_CHK(p) do{\
    if(HI_NULL == p)\
    {HDMI_WARN("%s is null pointer!\n",#p);\
    return ;}\
}while(0)

/* Define the struct pointor of the module audio_path_reg */
volatile S_audio_path_reg_REGS_TYPE *gopaudio_path_regAllReg = NULL;

int HDMI_TX_S_audio_path_reg_REGS_TYPE_Init(void)
{
    if (gopaudio_path_regAllReg)
    {
        return HI_SUCCESS;
    }

    gopaudio_path_regAllReg = (volatile S_audio_path_reg_REGS_TYPE*)HDMI_IO_MAP(BASE_ADDR_audio_path_reg,4);

    if (!gopaudio_path_regAllReg)
    {
        HDMI_ERR("gopaudio_path_regAllReg = null,fail!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

int HDMI_TX_S_audio_path_reg_REGS_TYPE_DeInit(void)
{
    if (gopaudio_path_regAllReg)
    {
        HDMI_IO_UNMAP(gopaudio_path_regAllReg);
        gopaudio_path_regAllReg = HI_NULL;
    }

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_in_enSet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_in_en
//  Input       : unsigned int uaud_in_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_in_enSet(unsigned int uaud_in_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_tx_audio_ctrl.bits.aud_in_en = uaud_in_en;
    HDMI_RegWrite(pu32RegAddr, o_tx_audio_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_layoutSet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_layout
//  Input       : unsigned int uaud_layout: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_layoutSet(unsigned int uaud_layout)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_tx_audio_ctrl.bits.aud_layout = uaud_layout;
    HDMI_RegWrite(pu32RegAddr, o_tx_audio_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_layoutGet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_layout
//  Input       : unsigned int uaud_layout: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_layoutGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_ctrl.bits.aud_layout;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_in_enGet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_in_en
//  Input       : unsigned int uaud_in_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_in_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_ctrl.bits.aud_in_en;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_mute_enGet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_mute_en
//  Input       : unsigned int uaud_mute_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_mute_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_ctrl.bits.aud_mute_en;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_i2s_enGet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_i2s_en
//  Input       : unsigned int uaud_i2s_en: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_i2s_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_ctrl.bits.aud_i2s_en;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_CTRL_aud_spdif_enGet
//  Description : Set the value of the member TX_AUDIO_CTRL.aud_spdif_en
//  Input       : unsigned int uaud_spdif_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_CTRL_aud_spdif_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32);
    o_tx_audio_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_ctrl.bits.aud_spdif_en;
}

//******************************************************************************
//  Function    : HDMI_AUD_I2S_CTRL_i2s_hbra_onGet
//  Description : Set the value of the member AUD_I2S_CTRL.i2s_hbra_on
//  Input       : unsigned int ui2s_hbra_on: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AUD_I2S_CTRL_i2s_hbra_onGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_AUD_I2S_CTRL o_aud_i2s_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_I2S_CTRL.u32);
    o_aud_i2s_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_aud_i2s_ctrl.bits.i2s_hbra_on;
}

//******************************************************************************
//  Function    : HDMI_AUD_CHST_CFG0_chst_byte3_fsGet
//  Description : Set the value of the member AUD_CHST_CFG0.chst_byte3_fs
//  Input       : unsigned int uchst_byte3_fs: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AUD_CHST_CFG0_chst_byte3_fsGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_AUD_CHST_CFG0 o_aud_chst_cfg0;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG0.u32);
    o_aud_chst_cfg0.u32 = HDMI_RegRead(pu32RegAddr);
    return o_aud_chst_cfg0.bits.chst_byte3_fs;
}

//******************************************************************************
//  Function    : HDMI_AUD_CHST_CFG1_chst_byte4_org_fsGet
//  Description : Set the value of the member AUD_CHST_CFG1.chst_byte4_org_fs
//  Input       : unsigned int uchst_byte4_org_fs: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AUD_CHST_CFG1_chst_byte4_org_fsGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_AUD_CHST_CFG1 o_aud_chst_cfg1;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG1.u32);
    o_aud_chst_cfg1.u32 = HDMI_RegRead(pu32RegAddr);
    return o_aud_chst_cfg1.bits.chst_byte4_org_fs;
}

//******************************************************************************
//  Function    : HDMI_AUD_CHST_CFG1_chst_byte4_lengthGet
//  Description : Set the value of the member AUD_CHST_CFG1.chst_byte4_length
//  Input       : unsigned int uchst_byte4_length: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AUD_CHST_CFG1_chst_byte4_lengthGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_AUD_CHST_CFG1 o_aud_chst_cfg1;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG1.u32);
    o_aud_chst_cfg1.u32 = HDMI_RegRead(pu32RegAddr);
    return o_aud_chst_cfg1.bits.chst_byte4_length;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_STATE_aud_lengthGet
//  Description : Set the value of the member TX_AUDIO_STATE.aud_length
//  Input       : unsigned int uaud_length: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_STATE_aud_lengthGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_STATE o_tx_audio_state;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_STATE.u32);
    o_tx_audio_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_state.bits.aud_length;
}

//******************************************************************************
//  Function    : HDMI_TX_AUDIO_STATE_aud_spdif_fsGet
//  Description : Set the value of the member TX_AUDIO_STATE.aud_spdif_fs
//  Input       : unsigned int uaud_spdif_fs: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_AUDIO_STATE_aud_spdif_fsGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TX_AUDIO_STATE o_tx_audio_state;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_STATE.u32);
    o_tx_audio_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_audio_state.bits.aud_spdif_fs;
}


int HDMI_AUD_CtsGet(HI_U32 *pu32HwCts,HI_U32 *pu32SwCts,HI_BOOL *pbSw)
{
    HI_U32 *pu32RegAddr = NULL;
    U_AUD_ACR_CTRL o_aud_acr_ctrl;
    U_ACR_CTS_VAL_SW o_acr_cts_val_sw;
    U_ACR_CTS_VAL_HW o_acr_cts_val_hw;

    /* sw or hw */
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_ACR_CTRL.u32);
    o_aud_acr_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    *pbSw = o_aud_acr_ctrl.bits.acr_cts_hw_sw_sel;

    /* sw cts value */
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_CTS_VAL_SW.u32);
    o_acr_cts_val_sw.u32 = HDMI_RegRead(pu32RegAddr);
    *pu32SwCts = o_acr_cts_val_sw.bits.acr_cts_val_sw;

    /* hw cts value */
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_CTS_VAL_HW.u32);
    o_acr_cts_val_hw.u32 = HDMI_RegRead(pu32RegAddr);
    *pu32HwCts = o_acr_cts_val_hw.bits.acr_cts_val_hw;

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_AUD_ACR_CTRL_acr_cts_hw_sw_selSet
//  Description : Set the value of the member AUD_ACR_CTRL.acr_cts_hw_sw_sel
//  Input       : unsigned int uacr_cts_hw_sw_sel: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AUD_ACR_CTRL_acr_cts_hw_sw_selSet(unsigned int uacr_cts_hw_sw_sel)
{
    HI_U32 *pu32RegAddr = NULL;

    U_AUD_ACR_CTRL o_aud_acr_ctrl;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->AUD_ACR_CTRL.u32);
    o_aud_acr_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_aud_acr_ctrl.bits.acr_cts_hw_sw_sel = uacr_cts_hw_sw_sel;
    HDMI_RegWrite(pu32RegAddr, o_aud_acr_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_ACR_CTS_VAL_SW_acr_cts_val_swSet
//  Description : Set the value of the member ACR_CTS_VAL_SW.acr_cts_val_sw
//  Input       : unsigned int uacr_cts_val_sw: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_ACR_CTS_VAL_SW_acr_cts_val_swSet(unsigned int uacr_cts_val_sw)
{
    HI_U32 *pu32RegAddr = NULL;

    U_ACR_CTS_VAL_SW o_acr_cts_val_sw;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_CTS_VAL_SW.u32);
    o_acr_cts_val_sw.u32 = HDMI_RegRead(pu32RegAddr);
    o_acr_cts_val_sw.bits.acr_cts_val_sw = uacr_cts_val_sw;
    HDMI_RegWrite(pu32RegAddr, o_acr_cts_val_sw.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_ACR_N_VAL_SW_acr_n_val_swGet
//  Description : Set the value of the member ACR_N_VAL_SW.acr_n_val_sw
//  Input       : unsigned int uacr_n_val_sw: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_ACR_N_VAL_SW_acr_n_val_swGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_ACR_N_VAL_SW o_acr_n_val_sw;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_N_VAL_SW.u32);
    o_acr_n_val_sw.u32 = HDMI_RegRead(pu32RegAddr);
    return o_acr_n_val_sw.bits.acr_n_val_sw;
}

//******************************************************************************
//  Function    : HDMI_ACR_N_VAL_SW_acr_n_val_swSet
//  Description : Set the value of the member ACR_N_VAL_SW.acr_n_val_sw
//  Input       : unsigned int uacr_n_val_sw: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_ACR_N_VAL_SW_acr_n_val_swSet(unsigned int uacr_n_val_sw)
{
    HI_U32 *pu32RegAddr = NULL;

    U_ACR_N_VAL_SW o_acr_n_val_sw;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_N_VAL_SW.u32);
    o_acr_n_val_sw.u32 = HDMI_RegRead(pu32RegAddr);
    o_acr_n_val_sw.bits.acr_n_val_sw = uacr_n_val_sw;
    HDMI_RegWrite(pu32RegAddr, o_acr_n_val_sw.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_ACR_CTS_VAL_SW_acr_cts_val_swGet
//  Description : Set the value of the member ACR_CTS_VAL_SW.acr_cts_val_sw
//  Input       : unsigned int uacr_cts_val_sw: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_ACR_CTS_VAL_SW_acr_cts_val_swGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_ACR_CTS_VAL_SW o_acr_cts_val_sw;
    pu32RegAddr = (HI_U32*)&(gopaudio_path_regAllReg->ACR_CTS_VAL_SW.u32);
    o_acr_cts_val_sw.u32 = HDMI_RegRead(pu32RegAddr);
    return o_acr_cts_val_sw.bits.acr_cts_val_sw;
}

//******************************************************************************
//  Function    : HDMI_ACR_CTS_VAL_HW_acr_cts_val_hwGet
//  Description : Set the value of the member ACR_CTS_VAL_HW.acr_cts_val_hw
//  Input       : unsigned int uacr_cts_val_hw: 20 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_ACR_CTS_VAL_HW_acr_cts_val_hwGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_ACR_CTS_VAL_HW o_acr_cts_val_hw;
    pu32RegAddr = (HI_U32 *)&(gopaudio_path_regAllReg->ACR_CTS_VAL_HW.u32);
    o_acr_cts_val_hw.u32 = HDMI_RegRead(pu32RegAddr);
    return o_acr_cts_val_hw.bits.acr_cts_val_hw;
}

HI_VOID HDMI_TX_AUDIO_IntfSet(CTRL_AUDIO_EN_S *pstAudioEn)
{
    U_TX_AUDIO_CTRL o_tx_audio_ctrl;
    U_AUD_I2S_CTRL  o_aud_i2s_ctrl;

    AUDIOPATH_NULL_CHK(pstAudioEn);

    o_tx_audio_ctrl.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32));
    o_tx_audio_ctrl.bits.aud_spdif_en = pstAudioEn->bSpdifEnable;
    o_tx_audio_ctrl.bits.aud_i2s_en   = pstAudioEn->enI2sSdEanble;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->TX_AUDIO_CTRL.u32), o_tx_audio_ctrl.u32);

    o_aud_i2s_ctrl.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->AUD_I2S_CTRL.u32));
    o_aud_i2s_ctrl.bits.i2s_hbra_on   = pstAudioEn->bHbraEnable;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->AUD_I2S_CTRL.u32), o_aud_i2s_ctrl.u32);
}

HI_VOID HDMI_AUD_I2S_CtrlSet(CTRL_I2S_CTRL_S *pstI2sCtrl)
{
    U_AUD_I2S_CTRL o_aud_i2s_ctrl;

    AUDIOPATH_NULL_CHK(pstI2sCtrl);

    o_aud_i2s_ctrl.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->AUD_I2S_CTRL.u32));
    o_aud_i2s_ctrl.bits.i2s_1st_shift   = pstI2sCtrl->bSckShiftOne;
    o_aud_i2s_ctrl.bits.i2s_ws_polarity = pstI2sCtrl->bPolarityWsMsbLeft;
    o_aud_i2s_ctrl.bits.i2s_justify     = pstI2sCtrl->bJustifyWsRight;
    o_aud_i2s_ctrl.bits.i2s_data_dir    = pstI2sCtrl->bDataDirMsbFirst;
    o_aud_i2s_ctrl.bits.i2s_vbit        = pstI2sCtrl->bVbitCompress;
    o_aud_i2s_ctrl.bits.i2s_length      = pstI2sCtrl->u32InBitLength;
    o_aud_i2s_ctrl.bits.i2s_ch_swap     = pstI2sCtrl->bChannelLRSwap;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->AUD_I2S_CTRL.u32), o_aud_i2s_ctrl.u32);
}

HI_VOID HDMI_AUD_CHST_StatusSet(CTRL_I2S_STATUS_S *pstI2sStatus)
{
    U_AUD_CHST_CFG0 o_aud_chst_cfg0;
    U_AUD_CHST_CFG1 o_aud_chst_cfg1;

    AUDIOPATH_NULL_CHK(pstI2sStatus);

    o_aud_chst_cfg0.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG0.u32));
    o_aud_chst_cfg0.bits.chst_byte0_a  = pstI2sStatus->bProfessionalApp;
    o_aud_chst_cfg0.bits.chst_byte0_b  = pstI2sStatus->bCompress;
    o_aud_chst_cfg0.bits.chst_byte3_fs = pstI2sStatus->u32SampRate;
    o_aud_chst_cfg0.bits.chst_byte3_clock_accuracy = pstI2sStatus->enClkAccuracy;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG0.u32), o_aud_chst_cfg0.u32);

    o_aud_chst_cfg1.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG1.u32));
    o_aud_chst_cfg1.bits.chst_byte4_org_fs = pstI2sStatus->u32OrgRate;
    o_aud_chst_cfg1.bits.chst_byte4_length = pstI2sStatus->u32OutBitLength;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->AUD_CHST_CFG1.u32), o_aud_chst_cfg1.u32);

}

HI_VOID HDMI_AUD_FIFO_CtrlSet(CTRL_FIFO_CTRL_S *pstFifoCtrl)
{
    U_AUD_FIFO_CTRL o_aud_fifo_ctrl;

    AUDIOPATH_NULL_CHK(pstFifoCtrl);

    o_aud_fifo_ctrl.u32 = HDMI_RegRead((HI_U32*)&(gopaudio_path_regAllReg->AUD_FIFO_CTRL.u32));
    o_aud_fifo_ctrl.bits.aud_fifo_test     = pstFifoCtrl->bTest;
    o_aud_fifo_ctrl.bits.aud_fifo_hbr_mask = pstFifoCtrl->enHbraMask;
    HDMI_RegWrite((HI_U32*)&(gopaudio_path_regAllReg->AUD_FIFO_CTRL.u32), o_aud_fifo_ctrl.u32);
}


