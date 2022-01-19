// ******************************************************************************
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co. Ltd.
// File name     :  tx_hdmi_reg_c_union_define.c
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  sdk
// Version       :  1.0
// Date          :  Tester
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  sdk 2015/04/20 11:14:24 Create file
// ******************************************************************************
#include "hi_type.h"
#include "hdmi_reg_tx.h"
#include "hdmi_product_define.h"


#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif


/* Define the struct pointor of the module tx_hdmi_reg */
volatile S_tx_hdmi_reg_REGS_TYPE *goptx_hdmi_regAllReg = NULL;


int HDMI_TX_S_tx_hdmi_reg_REGS_TYPE_Init(void)
{
    if (goptx_hdmi_regAllReg)
    {
        return HI_SUCCESS;
    }

    goptx_hdmi_regAllReg = (volatile S_tx_hdmi_reg_REGS_TYPE*)HDMI_IO_MAP(BASE_ADDR_tx_hdmi_reg,4);

    if (!goptx_hdmi_regAllReg)
    {
        HDMI_ERR("goptx_hdmi_regAllReg = null,fail!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

int HDMI_TX_S_tx_hdmi_reg_REGS_TYPE_DeInit(void)
{
    if (goptx_hdmi_regAllReg)
    {
        HDMI_IO_UNMAP(goptx_hdmi_regAllReg);
        goptx_hdmi_regAllReg = HI_NULL;
    }

    return HI_SUCCESS;
}

//#ifndef HDMI_BUILD_IN_BOOT

int HDMI_REG_VIDEO_DeepColorSet(HI_BOOL bEnalbeGcp, HI_U32 u32DeepColor)
{
    HI_U32 *pu32RegAddr = NULL;
    U_TX_PACK_FIFO_CTRL o_tx_pack_fifo_ctrl;
    U_AVMIXER_CONFIG o_avmixer_config;

    pu32RegAddr = (HI_U32*)&(goptx_hdmi_regAllReg->TX_PACK_FIFO_CTRL.u32);
    o_tx_pack_fifo_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_tx_pack_fifo_ctrl.bits.tmds_pack_mode = u32DeepColor;
    HDMI_RegWrite(pu32RegAddr, o_tx_pack_fifo_ctrl.u32);

    pu32RegAddr = (HI_U32*)&(goptx_hdmi_regAllReg->AVMIXER_CONFIG.u32);
    o_avmixer_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_avmixer_config.bits.dc_pkt_en = bEnalbeGcp;
    HDMI_RegWrite(pu32RegAddr, o_avmixer_config.u32);

    return HI_SUCCESS;
}

HI_VOID HDMI_REG_TX_AvmuteSet(HDMI_AVMUTE_CFG_S *pstAvmuteCfg)
{
    U_CP_PKT_AVMUTE o_cp_pkt_avmute;
    U_CEA_CP_CFG o_cea_cp_cfg;

    /* disable */
    o_cea_cp_cfg.u32                    = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CEA_CP_CFG.u32), o_cea_cp_cfg.u32);

    o_cp_pkt_avmute.u32 = 0;
    o_cp_pkt_avmute.bits.cp_set_avmute = pstAvmuteCfg->bMuteSet;
    o_cp_pkt_avmute.bits.cp_clr_avmute = pstAvmuteCfg->bMuteClr;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CP_PKT_AVMUTE.u32), o_cp_pkt_avmute.u32);

    /* disable/enable */
    o_cea_cp_cfg.bits.cea_cp_en         = pstAvmuteCfg->bMutePkgEn;
    o_cea_cp_cfg.bits.cea_cp_rpt_en     = pstAvmuteCfg->bMuteRptEn;
    o_cea_cp_cfg.bits.cea_cp_rpt_cnt    = pstAvmuteCfg->u32RptCnt;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CEA_CP_CFG.u32), o_cea_cp_cfg.u32);

    return ;
}


HI_VOID HDMI_REG_TX_AvmuteGet(HDMI_AVMUTE_CFG_S *pstAvmuteCfg)
{
    U_CP_PKT_AVMUTE o_cp_pkt_avmute;
    U_CEA_CP_CFG o_cea_cp_cfg;

    o_cea_cp_cfg.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->CEA_CP_CFG.u32));
    o_cp_pkt_avmute.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->CP_PKT_AVMUTE.u32));

    pstAvmuteCfg->bMuteSet        = o_cp_pkt_avmute.bits.cp_set_avmute;
    pstAvmuteCfg->bMuteClr        = o_cp_pkt_avmute.bits.cp_clr_avmute;

    pstAvmuteCfg->bMutePkgEn      = o_cea_cp_cfg.bits.cea_cp_en       ;
    pstAvmuteCfg->bMuteRptEn      = o_cea_cp_cfg.bits.cea_cp_rpt_en   ;
    pstAvmuteCfg->u32RptCnt       = o_cea_cp_cfg.bits.cea_cp_rpt_cnt  ;

    return ;
}



//******************************************************************************
//  Function    : HDMI_TX_PACK_FIFO_CTRL_tmds_pack_modeGet
//  Description : Set the value of the member TX_PACK_FIFO_CTRL.tmds_pack_mode
//  Input       : unsigned int utmds_pack_mode: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_PACK_FIFO_CTRL_tmds_pack_modeGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    U_TX_PACK_FIFO_CTRL o_tx_pack_fifo_ctrl;
    pu32RegAddr = (HI_U32*)&(goptx_hdmi_regAllReg->TX_PACK_FIFO_CTRL.u32);
    o_tx_pack_fifo_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_tx_pack_fifo_ctrl.bits.tmds_pack_mode;
}

//******************************************************************************
//  Function    : HDMI_TX_PACK_FIFO_ST_pclk2tclk_stableGet
//  Description : Set the value of the member TX_PACK_FIFO_ST.pclk2tclk_stable
//  Input       : unsigned int upclk2tclk_stable: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TX_PACK_FIFO_ST_pclk2tclk_stableGet(HI_VOID)
{
    U_TX_PACK_FIFO_ST o_tx_pack_fifo_st;
    o_tx_pack_fifo_st.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->TX_PACK_FIFO_ST.u32));
    return o_tx_pack_fifo_st.bits.pclk2tclk_stable;
}

//******************************************************************************
//  Function    : HDMI_AVMIXER_CONFIG_hdmi_modeSet
//  Description : Set the value of the member AVMIXER_CONFIG.hdmi_mode
//  Input       : unsigned int uhdmi_mode: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AVMIXER_CONFIG_hdmi_modeSet(unsigned int uhdmi_mode)
{
    HI_U32 *pu32RegAddr = NULL;
    U_AVMIXER_CONFIG o_avmixer_config;
    pu32RegAddr = (HI_U32*)&(goptx_hdmi_regAllReg->AVMIXER_CONFIG.u32);
    o_avmixer_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_avmixer_config.bits.hdmi_mode = uhdmi_mode;
    o_avmixer_config.bits.avmute_in_phase = 1;  /*default:DeepColor & avmute same in 1 pkg */
    HDMI_RegWrite(pu32RegAddr, o_avmixer_config.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_AVMIXER_CONFIG_hdmi_modeGet
//  Description : Set the value of the member AVMIXER_CONFIG.hdmi_mode
//  Input       : unsigned int uhdmi_mode: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AVMIXER_CONFIG_hdmi_modeGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    U_AVMIXER_CONFIG o_avmixer_config;
    pu32RegAddr = (HI_U32*)&(goptx_hdmi_regAllReg->AVMIXER_CONFIG.u32);
    o_avmixer_config.u32 = HDMI_RegRead(pu32RegAddr);
    return o_avmixer_config.bits.hdmi_mode;
}


HI_VOID HDMI_REG_TX_AVI_SUB_PKT_Set(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.bits.byte0 = pu8Data[0];
    unData.bits.byte1 = pu8Data[1];
    unData.bits.byte2 = pu8Data[2];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_PKT_HEADER.u32),unData.u32);

    unData.bits.byte0 = pu8Data[3];
    unData.bits.byte1 = pu8Data[4];
    unData.bits.byte2 = pu8Data[5];
    unData.bits.byte3 = pu8Data[6];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT0_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[7];
    unData.bits.byte1 = pu8Data[8];
    unData.bits.byte2 = pu8Data[9];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT0_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[10];
    unData.bits.byte1 = pu8Data[11];
    unData.bits.byte2 = pu8Data[12];
    unData.bits.byte3 = pu8Data[13];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT1_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[14];
    unData.bits.byte1 = pu8Data[15];
    unData.bits.byte2 = pu8Data[16];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT1_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[17];
    unData.bits.byte1 = pu8Data[18];
    unData.bits.byte2 = pu8Data[19];
    unData.bits.byte3 = pu8Data[20];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT2_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[21];
    unData.bits.byte1 = pu8Data[22];
    unData.bits.byte2 = pu8Data[23];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT2_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[24];
    unData.bits.byte1 = pu8Data[25];
    unData.bits.byte2 = pu8Data[26];
    unData.bits.byte3 = pu8Data[27];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT3_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[28];
    unData.bits.byte1 = pu8Data[29];
    unData.bits.byte2 = pu8Data[30];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AVI_SUB_PKT3_H.u32),unData.u32);

    return ;

}

HI_VOID HDMI_REG_TX_CEA_AVI_CFG_EnSet(HI_BOOL bEnable)
{
    U_CEA_AVI_CFG o_cea_avi_cfg;

    o_cea_avi_cfg.u32                 = 0;
    o_cea_avi_cfg.bits.cea_avi_en     = bEnable;
    o_cea_avi_cfg.bits.cea_avi_rpt_en = bEnable;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CEA_AVI_CFG.u32), o_cea_avi_cfg.u32);

    return ;
}



HI_VOID HDMI_REG_TX_VSIF_SUB_PKT_Set(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.bits.byte0 = pu8Data[0];
    unData.bits.byte1 = pu8Data[1];
    unData.bits.byte2 = pu8Data[2];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_PKT_HEADER.u32),unData.u32);

    unData.bits.byte0 = pu8Data[3];
    unData.bits.byte1 = pu8Data[4];
    unData.bits.byte2 = pu8Data[5];
    unData.bits.byte3 = pu8Data[6];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT0_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[7];
    unData.bits.byte1 = pu8Data[8];
    unData.bits.byte2 = pu8Data[9];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT0_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[10];
    unData.bits.byte1 = pu8Data[11];
    unData.bits.byte2 = pu8Data[12];
    unData.bits.byte3 = pu8Data[13];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT1_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[14];
    unData.bits.byte1 = pu8Data[15];
    unData.bits.byte2 = pu8Data[16];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT1_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[17];
    unData.bits.byte1 = pu8Data[18];
    unData.bits.byte2 = pu8Data[19];
    unData.bits.byte3 = pu8Data[20];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT2_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[21];
    unData.bits.byte1 = pu8Data[22];
    unData.bits.byte2 = pu8Data[23];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT2_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[24];
    unData.bits.byte1 = pu8Data[25];
    unData.bits.byte2 = pu8Data[26];
    unData.bits.byte3 = pu8Data[27];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT3_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[28];
    unData.bits.byte1 = pu8Data[29];
    unData.bits.byte2 = pu8Data[30];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->VSIF_SUB_PKT3_H.u32),unData.u32);

    return ;

}

HI_VOID HDMI_REG_TX_CEA_VSIF_CFG_EnSet(HI_BOOL bEnable)
{

    U_CEA_VSIF_CFG o_cea_vsif_cfg;

    o_cea_vsif_cfg.u32 = 0;
    o_cea_vsif_cfg.bits.cea_vsif_en     = bEnable;
    o_cea_vsif_cfg.bits.cea_vsif_rpt_en = bEnable;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CEA_VSIF_CFG.u32), o_cea_vsif_cfg.u32);

    return ;
}


#ifndef HDMI_BUILD_IN_BOOT

HI_VOID HDMI_REG_TX_AVI_SUB_PKT_Get(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.u32 = 0;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_PKT_HEADER.u32);
    pu8Data[0] = unData.bits.byte0;
    pu8Data[1] = unData.bits.byte1;
    pu8Data[2] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT0_L.u32);
    pu8Data[3] = unData.bits.byte0;
    pu8Data[4] = unData.bits.byte1;
    pu8Data[5] = unData.bits.byte2;
    pu8Data[6] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT0_H.u32);
    pu8Data[7]  = unData.bits.byte0;
    pu8Data[8]  = unData.bits.byte1;
    pu8Data[9] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT1_L.u32);
    pu8Data[10] = unData.bits.byte0;
    pu8Data[11] = unData.bits.byte1;
    pu8Data[12] = unData.bits.byte2;
    pu8Data[13] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT1_H.u32);
    pu8Data[14] = unData.bits.byte0;
    pu8Data[15] = unData.bits.byte1;
    pu8Data[16] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT2_L.u32);
    pu8Data[17] = unData.bits.byte0;
    pu8Data[18] = unData.bits.byte1;
    pu8Data[19] = unData.bits.byte2;
    pu8Data[20] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT2_H.u32);
    pu8Data[21] = unData.bits.byte0;
    pu8Data[22] = unData.bits.byte1;
    pu8Data[23] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT3_L.u32);
    pu8Data[24] = unData.bits.byte0;
    pu8Data[25] = unData.bits.byte1;
    pu8Data[26] = unData.bits.byte2;
    pu8Data[27] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AVI_SUB_PKT3_H.u32);
    pu8Data[28] = unData.bits.byte0;
    pu8Data[29] = unData.bits.byte1;
    pu8Data[30] = unData.bits.byte2;

    return ;
}

HI_BOOL HDMI_REG_TX_CEA_AVI_CFG_EnGet(HI_VOID)
{
    U_CEA_AVI_CFG o_cea_avi_cfg;
    HI_BOOL bAviEn = HI_FALSE;

    o_cea_avi_cfg.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->CEA_AVI_CFG.u32));

    bAviEn = (HI_BOOL)(o_cea_avi_cfg.bits.cea_avi_en & o_cea_avi_cfg.bits.cea_avi_rpt_en);

    return bAviEn;
}

HI_BOOL HDMI_REG_TX_CEA_VSIF_CFG_EnGet(HI_VOID)
{
    U_CEA_VSIF_CFG o_cea_vsif_cfg;
    HI_BOOL bVsifEn = HI_FALSE;

    o_cea_vsif_cfg.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->CEA_VSIF_CFG.u32));

    bVsifEn = (HI_BOOL)( o_cea_vsif_cfg.bits.cea_vsif_en & o_cea_vsif_cfg.bits.cea_vsif_rpt_en );

    return bVsifEn;
}

HI_VOID HDMI_REG_TX_VSIF_SUB_PKT_Get(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.u32 = 0;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_PKT_HEADER.u32);
    pu8Data[0] = unData.bits.byte0;
    pu8Data[1] = unData.bits.byte1;
    pu8Data[2] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT0_L.u32);
    pu8Data[3] = unData.bits.byte0;
    pu8Data[4] = unData.bits.byte1;
    pu8Data[5] = unData.bits.byte2;
    pu8Data[6] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT0_H.u32);
    pu8Data[7]  = unData.bits.byte0;
    pu8Data[8]  = unData.bits.byte1;
    pu8Data[9] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT1_L.u32);
    pu8Data[10] = unData.bits.byte0;
    pu8Data[11] = unData.bits.byte1;
    pu8Data[12] = unData.bits.byte2;
    pu8Data[13] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT1_H.u32);
    pu8Data[14] = unData.bits.byte0;
    pu8Data[15] = unData.bits.byte1;
    pu8Data[16] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT2_L.u32);
    pu8Data[17] = unData.bits.byte0;
    pu8Data[18] = unData.bits.byte1;
    pu8Data[19] = unData.bits.byte2;
    pu8Data[20] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT2_H.u32);
    pu8Data[21] = unData.bits.byte0;
    pu8Data[22] = unData.bits.byte1;
    pu8Data[23] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT3_L.u32);
    pu8Data[24] = unData.bits.byte0;
    pu8Data[25] = unData.bits.byte1;
    pu8Data[26] = unData.bits.byte2;
    pu8Data[27] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->VSIF_SUB_PKT3_H.u32);
    pu8Data[28] = unData.bits.byte0;
    pu8Data[29] = unData.bits.byte1;
    pu8Data[30] = unData.bits.byte2;

    return ;
}


HI_VOID HDMI_REG_TX_AIF_SUB_PKT_Set(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.bits.byte0 = pu8Data[0];
    unData.bits.byte1 = pu8Data[1];
    unData.bits.byte2 = pu8Data[2];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_PKT_HEADER.u32),unData.u32);

    unData.bits.byte0 = pu8Data[3];
    unData.bits.byte1 = pu8Data[4];
    unData.bits.byte2 = pu8Data[5];
    unData.bits.byte3 = pu8Data[6];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT0_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[7];
    unData.bits.byte1 = pu8Data[8];
    unData.bits.byte2 = pu8Data[9];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT0_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[10];
    unData.bits.byte1 = pu8Data[11];
    unData.bits.byte2 = pu8Data[12];
    unData.bits.byte3 = pu8Data[13];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT1_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[14];
    unData.bits.byte1 = pu8Data[15];
    unData.bits.byte2 = pu8Data[16];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT1_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[17];
    unData.bits.byte1 = pu8Data[18];
    unData.bits.byte2 = pu8Data[19];
    unData.bits.byte3 = pu8Data[20];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT2_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[21];
    unData.bits.byte1 = pu8Data[22];
    unData.bits.byte2 = pu8Data[23];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT2_H.u32),unData.u32);

    unData.bits.byte0 = pu8Data[24];
    unData.bits.byte1 = pu8Data[25];
    unData.bits.byte2 = pu8Data[26];
    unData.bits.byte3 = pu8Data[27];
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT3_L.u32),unData.u32);

    unData.bits.byte0 = pu8Data[28];
    unData.bits.byte1 = pu8Data[29];
    unData.bits.byte2 = pu8Data[30];
    unData.bits.byte3 = 0;
    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->AIF_SUB_PKT3_H.u32),unData.u32);

    return ;

}


HI_VOID HDMI_REG_TX_AIF_SUB_PKT_Get(HI_U8 *pu8Data)
{
    HDMI_4BYTES_U unData;

    unData.u32 = 0;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_PKT_HEADER.u32);
    pu8Data[0] = unData.bits.byte0;
    pu8Data[1] = unData.bits.byte1;
    pu8Data[2] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT0_L.u32);
    pu8Data[3] = unData.bits.byte0;
    pu8Data[4] = unData.bits.byte1;
    pu8Data[5] = unData.bits.byte2;
    pu8Data[6] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT0_H.u32);
    pu8Data[7]  = unData.bits.byte0;
    pu8Data[8]  = unData.bits.byte1;
    pu8Data[9] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT1_L.u32);
    pu8Data[10] = unData.bits.byte0;
    pu8Data[11] = unData.bits.byte1;
    pu8Data[12] = unData.bits.byte2;
    pu8Data[13] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT1_H.u32);
    pu8Data[14] = unData.bits.byte0;
    pu8Data[15] = unData.bits.byte1;
    pu8Data[16] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT2_L.u32);
    pu8Data[17] = unData.bits.byte0;
    pu8Data[18] = unData.bits.byte1;
    pu8Data[19] = unData.bits.byte2;
    pu8Data[20] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT2_H.u32);
    pu8Data[21] = unData.bits.byte0;
    pu8Data[22] = unData.bits.byte1;
    pu8Data[23] = unData.bits.byte2;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT3_L.u32);
    pu8Data[24] = unData.bits.byte0;
    pu8Data[25] = unData.bits.byte1;
    pu8Data[26] = unData.bits.byte2;
    pu8Data[27] = unData.bits.byte3;

    unData.u32 = HDMI_RegRead((HI_U32*)&goptx_hdmi_regAllReg->AIF_SUB_PKT3_H.u32);
    pu8Data[28] = unData.bits.byte0;
    pu8Data[29] = unData.bits.byte1;
    pu8Data[30] = unData.bits.byte2;

    return ;
}

HI_VOID HDMI_REG_TX_CEA_AUD_CFG_EnSet(HI_BOOL bEnable)
{
    U_CEA_AUD_CFG o_cea_aud_cfg;

    o_cea_aud_cfg.u32                 = 0;
    o_cea_aud_cfg.bits.cea_aud_en     = bEnable;
    o_cea_aud_cfg.bits.cea_aud_rpt_en = bEnable;

    HDMI_RegWrite((HI_U32*)&(goptx_hdmi_regAllReg->CEA_AUD_CFG.u32), o_cea_aud_cfg.u32);
    return ;
}

HI_BOOL HDMI_REG_TX_CEA_AUD_CFG_EnGet(HI_VOID)
{
    U_CEA_AUD_CFG o_cea_aud_cfg;
    HI_BOOL bAudioEn = HI_FALSE;

    o_cea_aud_cfg.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->CEA_AUD_CFG.u32));

    bAudioEn = (HI_BOOL)(o_cea_aud_cfg.bits.cea_aud_en & o_cea_aud_cfg.bits.cea_aud_rpt_en);

    return bAudioEn;
}

//******************************************************************************
//  Function    : HDMI_AVMIXER_CONFIG_dc_pkt_enGet
//  Description : Set the value of the member AVMIXER_CONFIG.dc_pkt_en
//  Input       : unsigned int udc_pkt_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_AVMIXER_CONFIG_dc_pkt_enGet(HI_VOID)
{
    U_AVMIXER_CONFIG o_avmixer_config;

    o_avmixer_config.u32 = HDMI_RegRead((HI_U32*)&(goptx_hdmi_regAllReg->AVMIXER_CONFIG.u32));
    return o_avmixer_config.bits.dc_pkt_en;
}
#endif



