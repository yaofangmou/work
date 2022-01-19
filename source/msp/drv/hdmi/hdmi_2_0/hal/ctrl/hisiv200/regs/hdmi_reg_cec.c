// ******************************************************************************
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co. Ltd.
// File name     :  tx_cec_reg_c_union_define.c
// Project line  :  Platform And Key Technologies Development
// Department    :  Device Chipset Source Algorithm and Chipset Platform Development Dept
// Author        :  sdk
// Version       :  1.0
// Date          :  2015/1/1
// Description   :  HDMIMHL_TX_HISI
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  sdk 2015/10/08 20:14:09 Create file
// ******************************************************************************

#include "hi_type.h"
#include "hdmi_reg_cec.h"
#include "hdmi_product_define.h"
#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif

/* Define the struct pointor of the module tx_cec_reg */
volatile S_tx_cec_reg_REGS_TYPE *goptx_cec_regAllReg = NULL;


int HDMI_TX_S_tx_cec_reg_REGS_TYPE_Init(void)
{
    if (goptx_cec_regAllReg)
    {
        return HI_SUCCESS;
    }

    goptx_cec_regAllReg = (volatile S_tx_cec_reg_REGS_TYPE*)HDMI_IO_MAP(BASE_ADDR_tx_cec_reg,4);

    if (!goptx_cec_regAllReg)
    {
        HDMI_ERR("goptx_cec_regAllReg = null,fail!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;

}

int HDMI_TX_S_tx_cec_reg_REGS_TYPE_DeInit(void)
{
    if (goptx_cec_regAllReg)
    {
        HDMI_IO_UNMAP(goptx_cec_regAllReg);
        goptx_cec_regAllReg = HI_NULL;
    }

    return HI_SUCCESS;
}



//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_rx_clr_allSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_rx_clr_all
//  Input       : unsigned int ucec_reg_rx_clr_all: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_rx_clr_allSet(unsigned int ucec_reg_rx_clr_all)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_rx_clr_all = ucec_reg_rx_clr_all;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_rx_clr_cur_setSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_rx_clr_cur_set
//  Input       : unsigned int ucec_reg_rx_clr_cur_set: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_rx_clr_cur_setSet(unsigned int ucec_reg_rx_clr_cur_set)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_rx_clr_cur_set = ucec_reg_rx_clr_cur_set;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}



//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_tx_cmd_cntSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_tx_cmd_cnt
//  Input       : unsigned int ucec_reg_tx_cmd_cnt: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_tx_cmd_cntSet(unsigned int ucec_reg_tx_cmd_cnt)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_tx_cmd_cnt = ucec_reg_tx_cmd_cnt;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}





//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_manual_cmd_setSet
//  Description : Set the value of the member CEC_TX_CTRL.manual_cmd_set
//  Input       : unsigned int umanual_cmd_set: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_manual_cmd_setSet(unsigned int umanual_cmd_set)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.manual_cmd_set = umanual_cmd_set;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_i2c_cec_passthruSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_i2c_cec_passthru
//  Input       : unsigned int ucec_reg_i2c_cec_passthru: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_i2c_cec_passthruSet(unsigned int ucec_reg_i2c_cec_passthru)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_i2c_cec_passthru = ucec_reg_i2c_cec_passthru;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}




//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_flush_tx_ffSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_flush_tx_ff
//  Input       : unsigned int ucec_reg_flush_tx_ff: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_flush_tx_ffSet(unsigned int ucec_reg_flush_tx_ff)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_flush_tx_ff = ucec_reg_flush_tx_ff;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_ctl_retry_cntSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_ctl_retry_cnt
//  Input       : unsigned int ucec_ctl_retry_cnt: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_ctl_retry_cntSet(unsigned int ucec_ctl_retry_cnt)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_ctl_retry_cnt = ucec_ctl_retry_cnt;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}



//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_nack_hdrSet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_nack_hdr
//  Input       : unsigned int ucec_reg_nack_hdr: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_nack_hdrSet(unsigned int ucec_reg_nack_hdr)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_ctrl.bits.cec_reg_nack_hdr = ucec_reg_nack_hdr;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_ctrl.u32);


    return HI_SUCCESS;
}







//******************************************************************************
//  Function    : HDMI_CEC_AUTO_DISC_cec_auto_ping_clearSet
//  Description : Set the value of the member CEC_AUTO_DISC.cec_auto_ping_clear
//  Input       : unsigned int ucec_auto_ping_clear: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_AUTO_DISC_cec_auto_ping_clearSet(unsigned int ucec_auto_ping_clear)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_AUTO_DISC o_cec_auto_disc;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_AUTO_DISC.u32);
    o_cec_auto_disc.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_auto_disc.bits.cec_auto_ping_clear = ucec_auto_ping_clear;
    HDMI_RegWrite(pu32RegAddr, o_cec_auto_disc.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_AUTO_DISC_cec_auto_ping_startSet
//  Description : Set the value of the member CEC_AUTO_DISC.cec_auto_ping_start
//  Input       : unsigned int ucec_auto_ping_start: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_AUTO_DISC_cec_auto_ping_startSet(unsigned int ucec_auto_ping_start)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_AUTO_DISC o_cec_auto_disc;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_AUTO_DISC.u32);
    o_cec_auto_disc.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_auto_disc.bits.cec_auto_ping_start = ucec_auto_ping_start;
    HDMI_RegWrite(pu32RegAddr, o_cec_auto_disc.u32);


    return HI_SUCCESS;
}







//******************************************************************************
//  Function    : HDMI_CEC_TX_INIT_cec_tx_init_idSet
//  Description : Set the value of the member CEC_TX_INIT.cec_tx_init_id
//  Input       : unsigned int ucec_tx_init_id: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_INIT_cec_tx_init_idSet(unsigned int ucec_tx_init_id)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_INIT o_cec_tx_init;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_INIT.u32);
    o_cec_tx_init.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_init.bits.cec_tx_init_id = ucec_tx_init_id;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_init.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_DEST_cec_reg_sd_poll_internSet
//  Description : Set the value of the member CEC_TX_DEST.cec_reg_sd_poll_intern
//  Input       : unsigned int ucec_reg_sd_poll_intern: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_DEST_cec_reg_sd_poll_internSet(unsigned int ucec_reg_sd_poll_intern)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_DEST o_cec_tx_dest;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_DEST.u32);
    o_cec_tx_dest.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_dest.bits.cec_reg_sd_poll_intern = ucec_reg_sd_poll_intern;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_dest.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_DEST_cec_tx_dest_idSet
//  Description : Set the value of the member CEC_TX_DEST.cec_tx_dest_id
//  Input       : unsigned int ucec_tx_dest_id: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_DEST_cec_tx_dest_idSet(unsigned int ucec_tx_dest_id)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_DEST o_cec_tx_dest;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_DEST.u32);
    o_cec_tx_dest.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_tx_dest.bits.cec_tx_dest_id = ucec_tx_dest_id;
    HDMI_RegWrite(pu32RegAddr, o_cec_tx_dest.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_CEC_CAPTUTR_ID_cec_capture_idSet
//  Description : Set the value of the member CEC_CAPTUTR_ID.cec_capture_id
//  Input       : unsigned int ucec_capture_id: 16 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_CAPTUTR_ID_cec_capture_idSet(unsigned int ucec_capture_id)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_CAPTUTR_ID o_cec_captutr_id;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_CAPTUTR_ID.u32);
    o_cec_captutr_id.u32 = HDMI_RegRead(pu32RegAddr);
    o_cec_captutr_id.bits.cec_capture_id = ucec_capture_id;
    HDMI_RegWrite(pu32RegAddr, o_cec_captutr_id.u32);


    return HI_SUCCESS;
}






//******************************************************************************
//  Function    : HDMI_CEC_TX_CTRL_cec_reg_i2c_cec_passthruGet
//  Description : Set the value of the member CEC_TX_CTRL.cec_reg_i2c_cec_passthru
//  Input       : unsigned int ucec_reg_i2c_cec_passthru: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_CTRL_cec_reg_i2c_cec_passthruGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_CTRL o_cec_tx_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_CTRL.u32);
    o_cec_tx_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_tx_ctrl.bits.cec_reg_i2c_cec_passthru;
}












//******************************************************************************
//  Function    : HDMI_CEC_RX_STATE_cec_rx_init_cmd_headerGet
//  Description : Set the value of the member CEC_RX_STATE.cec_rx_init_cmd_header
//  Input       : unsigned int ucec_rx_init_cmd_header: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_RX_STATE_cec_rx_init_cmd_headerGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_RX_STATE o_cec_rx_state;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_RX_STATE.u32);
    o_cec_rx_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_rx_state.bits.cec_rx_init_cmd_header;
}

//******************************************************************************
//  Function    : HDMI_CEC_RX_STATE_cec_rx_dest_cmd_headerGet
//  Description : Set the value of the member CEC_RX_STATE.cec_rx_dest_cmd_header
//  Input       : unsigned int ucec_rx_dest_cmd_header: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_RX_STATE_cec_rx_dest_cmd_headerGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_RX_STATE o_cec_rx_state;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_RX_STATE.u32);
    o_cec_rx_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_rx_state.bits.cec_rx_dest_cmd_header;
}

//******************************************************************************
//  Function    : HDMI_CEC_RX_STATE_cec_rx_errorGet
//  Description : Set the value of the member CEC_RX_STATE.cec_rx_error
//  Input       : unsigned int ucec_rx_error: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_RX_STATE_cec_rx_errorGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_RX_STATE o_cec_rx_state;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_RX_STATE.u32);
    o_cec_rx_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_rx_state.bits.cec_rx_error;
}

//******************************************************************************
//  Function    : HDMI_CEC_RX_STATE_cec_reg_rx_ff_wr_selGet
//  Description : Set the value of the member CEC_RX_STATE.cec_reg_rx_ff_wr_sel
//  Input       : unsigned int ucec_reg_rx_ff_wr_sel: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_RX_STATE_cec_reg_rx_ff_wr_selGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_RX_STATE o_cec_rx_state;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_RX_STATE.u32);
    o_cec_rx_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_rx_state.bits.cec_reg_rx_ff_wr_sel;
}

//******************************************************************************
//  Function    : HDMI_CEC_RX_STATE_cec_reg_rx_cmd_byte_cntGet
//  Description : Set the value of the member CEC_RX_STATE.cec_reg_rx_cmd_byte_cnt
//  Input       : unsigned int ucec_reg_rx_cmd_byte_cnt: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_RX_STATE_cec_reg_rx_cmd_byte_cntGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_RX_STATE o_cec_rx_state;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_RX_STATE.u32);
    o_cec_rx_state.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_rx_state.bits.cec_reg_rx_cmd_byte_cnt;
}

//******************************************************************************
//  Function    : HDMI_CEC_AUTO_DISC_cec_auto_ping_doneGet
//  Description : Set the value of the member CEC_AUTO_DISC.cec_auto_ping_done
//  Input       : unsigned int ucec_auto_ping_done: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_AUTO_DISC_cec_auto_ping_doneGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_AUTO_DISC o_cec_auto_disc;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_AUTO_DISC.u32);
    o_cec_auto_disc.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_auto_disc.bits.cec_auto_ping_done;
}


//******************************************************************************
//  Function    : HDMI_CEC_AUTODISC_MAP_cec_auto_ping_mapGet
//  Description : Set the value of the member CEC_AUTODISC_MAP.cec_auto_ping_map
//  Input       : unsigned int ucec_auto_ping_map: 16 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_AUTODISC_MAP_cec_auto_ping_mapGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_AUTODISC_MAP o_cec_autodisc_map;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_AUTODISC_MAP.u32);
    o_cec_autodisc_map.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_autodisc_map.bits.cec_auto_ping_map;
}

//******************************************************************************
//  Function    : HDMI_CEC_TX_INIT_cec_tx_init_idGet
//  Description : Set the value of the member CEC_TX_INIT.cec_tx_init_id
//  Input       : unsigned int ucec_tx_init_id: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_INIT_cec_tx_init_idGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_INIT o_cec_tx_init;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_INIT.u32);
    o_cec_tx_init.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_tx_init.bits.cec_tx_init_id;
}


//******************************************************************************
//  Function    : HDMI_CEC_TX_DEST_cec_tx_dest_idGet
//  Description : Set the value of the member CEC_TX_DEST.cec_tx_dest_id
//  Input       : unsigned int ucec_tx_dest_id: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_TX_DEST_cec_tx_dest_idGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_TX_DEST o_cec_tx_dest;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_TX_DEST.u32);
    o_cec_tx_dest.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_tx_dest.bits.cec_tx_dest_id;
}

//******************************************************************************
//  Function    : HDMI_CEC_CAPTUTR_ID_cec_capture_idGet
//  Description : Set the value of the member CEC_CAPTUTR_ID.cec_capture_id
//  Input       : unsigned int ucec_capture_id: 16 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_CEC_CAPTUTR_ID_cec_capture_idGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_CEC_CAPTUTR_ID o_cec_captutr_id;
    pu32RegAddr = (HI_U32*)&(goptx_cec_regAllReg->CEC_CAPTUTR_ID.u32);
    o_cec_captutr_id.u32 = HDMI_RegRead(pu32RegAddr);
    return o_cec_captutr_id.bits.cec_capture_id;
}

HI_VOID HDMI_REG_CecTxDataSet(HI_U8 u8Cmd, HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.bits.byte0 = u8Cmd;
    unData.bits.byte1 = pu8Data[0];
    unData.bits.byte2 = pu8Data[1];
    unData.bits.byte3 = pu8Data[2];
    HDMI_RegWrite((HI_U32*)&goptx_cec_regAllReg->TX_CEC_CMD0.u32, unData.u32);

    unData.bits.byte0 = pu8Data[3];
    unData.bits.byte1 = pu8Data[4];
    unData.bits.byte2 = pu8Data[5];
    unData.bits.byte3 = pu8Data[6];
    HDMI_RegWrite((HI_U32*)&goptx_cec_regAllReg->TX_CEC_CMD1.u32, unData.u32);

    unData.bits.byte0 = pu8Data[7];
    unData.bits.byte1 = pu8Data[8];
    unData.bits.byte2 = pu8Data[9];
    unData.bits.byte3 = pu8Data[10];
    HDMI_RegWrite((HI_U32*)&goptx_cec_regAllReg->TX_CEC_CMD2.u32, unData.u32);

    unData.bits.byte0 = pu8Data[11];
    unData.bits.byte1 = pu8Data[12];
    unData.bits.byte2 = pu8Data[13];
    unData.bits.byte3 = pu8Data[14];
    HDMI_RegWrite((HI_U32*)&goptx_cec_regAllReg->TX_CEC_CMD3.u32, unData.u32);

    return ;
}

HI_VOID HDMI_REG_CecRxDataGet(HI_U8 *pu8Cmd, HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.u32 = 0;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_cec_regAllReg->RX_CEC_CMD0.u32);

    *pu8Cmd    = unData.bits.byte0;
    pu8Data[0] = unData.bits.byte1;
    pu8Data[1] = unData.bits.byte2;
    pu8Data[2] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_cec_regAllReg->RX_CEC_CMD1.u32);
    pu8Data[3] = unData.bits.byte0;
    pu8Data[4] = unData.bits.byte1;
    pu8Data[5] = unData.bits.byte2;
    pu8Data[6] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_cec_regAllReg->RX_CEC_CMD2.u32);
    pu8Data[7]  = unData.bits.byte0;
    pu8Data[8]  = unData.bits.byte1;
    pu8Data[9] = unData.bits.byte2;
    pu8Data[10] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_cec_regAllReg->RX_CEC_CMD3.u32);
    pu8Data[11] = unData.bits.byte0;
    pu8Data[12] = unData.bits.byte1;
    pu8Data[13] = unData.bits.byte2;
    pu8Data[14] = unData.bits.byte3;

    return ;
}



