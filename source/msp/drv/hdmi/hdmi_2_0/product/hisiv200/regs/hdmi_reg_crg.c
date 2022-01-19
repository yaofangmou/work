// ******************************************************************************
// Copyright     :  Copyright (C) 2016, Hisilicon Technologies Co. Ltd.
// File name     :  hdmi_reg_crg.c
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  xxx
// Version       :  1
// Date          :  2016/7/18
// Description   :  The description of xxx project
// Others        :
// History       :  xxx 2016/07/18 10:40:30 Create file
// ******************************************************************************

#include "hi_type.h"
#include "hdmi_reg_crg.h"
#include "hdmi_product_define.h"
#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif

#define  HDMI_ADDR_CRG          0xf8a22000
#define  HDMI_ADDR_CLKGATESRST  0xf8000048
#define  HDMI_ADDR_SYSCTRL      0xf8000210

/* Define the struct pointor of the module hdmi2tx_dphy_reg */
volatile HDMI_REG_CRG_S *s_pstRegCrg = NULL;
volatile HDMI_SC_CLKGATE_SRST_CTRL *s_pstRegClkGateSrst = NULL;
volatile HDMI_REG_SYSCTRL_S *s_pstRegSysCtrl = NULL;

static int REG_HDMI_SYSCTRL_reg_Init(void);
static int REG_HDMI_SYSCTRL_reg_DeInit(void);

int REG_HDMI_CRG_reg_Init(void)
{
    HDMI_CHIP_TYPE_E eLogversion;

    if (NULL != s_pstRegCrg)
    {
        return HI_SUCCESS;
    }

    s_pstRegCrg  = (HDMI_REG_CRG_S*)HDMI_IO_MAP(HDMI_ADDR_CRG, sizeof(HDMI_REG_CRG_S));

    if(NULL == s_pstRegCrg)
    {
        HDMI_ERR("ioremap_nocache gophdmi2tx_crg_regAllReg failed!!!!!!!\n");
        return HI_FAILURE;
    }

    eLogversion = DRV_HDMI_ProdChipGet();

    if ((HDMI_CHIP_HI3716MV430 == eLogversion))
    {
        REG_HDMI_SYSCTRL_reg_Init();
    }

    return HI_SUCCESS;
}

int REG_HDMI_CRG_reg_DeInit(void)
{
    HDMI_CHIP_TYPE_E eLogversion;

    if(HI_NULL != s_pstRegCrg)
    {
        HDMI_IO_UNMAP(s_pstRegCrg);
        s_pstRegCrg = HI_NULL;
    }

    eLogversion = DRV_HDMI_ProdChipGet();

    if ( (HDMI_CHIP_HI3716MV430 == eLogversion) )
    {
        REG_HDMI_SYSCTRL_reg_DeInit();
    }

    return HI_SUCCESS;
}

int REG_HDMI_CRG_cken_Set(unsigned int ucrg_cken)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG67 o_peri_crg67;

    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);

    o_peri_crg67.bits.ssc_in_cken               = ucrg_cken;
    o_peri_crg67.bits.ssc_bypass_cken           = ucrg_cken;
    o_peri_crg67.bits.hdmitx_ctrl_osc_24m_cken  = ucrg_cken;
    o_peri_crg67.bits.hdmitx_ctrl_os_cken       = ucrg_cken;
    o_peri_crg67.bits.hdmitx_ctrl_as_cken       = ucrg_cken;
    o_peri_crg67.bits.hdmitx_pxl_cken           = ucrg_cken;

    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    return HI_SUCCESS;
}

int REG_HDMI_CRG_ssc_clk_div_Set(unsigned int ussc_clk_div)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG67 o_peri_crg67;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);

    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg67.bits.ssc_clk_div = ussc_clk_div;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    return HI_SUCCESS;
}

int REG_HDMI_CRG_ssc_bypass_clk_sel_Set(unsigned int ussc_bypass_clk_sel)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG67 o_peri_crg67;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);

    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg67.bits.ssc_bypass_clk_sel = ussc_bypass_clk_sel;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    return HI_SUCCESS;
}

HI_BOOL REG_HDMI_CRG_InitGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG68 o_peri_crg68;
    R_PERI_CRG67 o_peri_crg67;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);
    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);
    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);


    if (   0 != o_peri_crg68.bits.phy_tmds_cken
        && 0 != o_peri_crg67.bits.ssc_in_cken
        && 0 == o_peri_crg67.bits.hdmitx_ctrl_bus_srst_req)
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}

HI_BOOL REG_HDMI_CRG_PhyResetGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG68 o_peri_crg68;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);
    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);

    if (   0 != o_peri_crg68.bits.hdmitx_phy_srst_req
        || 0 != o_peri_crg68.bits.phy_tmds_srst_req)
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}

int REG_HDMI_CRG_tmds_clk_div_Set(unsigned int utmds_clk_div)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG68 o_peri_crg68;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);

    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg68.bits.tmds_clk_div = utmds_clk_div;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg68.u32);

    return HI_SUCCESS;
}

static int REG_HDMI_SYSCTRL_reg_Init(void)
{
    if ( (NULL != s_pstRegClkGateSrst) && (NULL != s_pstRegSysCtrl) )
    {
        return HI_SUCCESS;
    }

    s_pstRegClkGateSrst = (HDMI_SC_CLKGATE_SRST_CTRL *)HDMI_IO_MAP(HDMI_ADDR_CLKGATESRST, sizeof(HDMI_SC_CLKGATE_SRST_CTRL));
    s_pstRegSysCtrl     = (HDMI_REG_SYSCTRL_S *)HDMI_IO_MAP(HDMI_ADDR_SYSCTRL, sizeof(HDMI_REG_SYSCTRL_S));
    if (NULL == s_pstRegClkGateSrst)
    {
        HDMI_ERR("SysCtrl ClkGateSrstReg!\n");
        return HI_FAILURE;
    }
    if (NULL == s_pstRegSysCtrl)
    {
        HDMI_ERR("SysCtrl CEC_MCUInfoReg!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static int REG_HDMI_SYSCTRL_reg_DeInit(void)
{
    if (HI_NULL != s_pstRegClkGateSrst)
    {
        HDMI_IO_UNMAP(s_pstRegClkGateSrst);
        s_pstRegClkGateSrst = HI_NULL;
    }
    if (HI_NULL != s_pstRegSysCtrl)
    {
        HDMI_IO_UNMAP(s_pstRegSysCtrl);
        s_pstRegSysCtrl     = HI_NULL;
    }

    return HI_SUCCESS;
}


int REG_HDMI_CRG_AllResetSet(unsigned int ureset)
{
    HI_U32 *pu32RegAddr = NULL;
    HDMI_SC_CLKGATE_SRST_CTRL o_hdmi_sc_clkgate_srst_ctrl;
    R_PERI_CRG67 o_peri_crg67;
    R_PERI_CRG68 o_peri_crg68;

    /* SC_CLKGATE_SRST_CTRL  0xf8000048 confirm by weizhigui */
    pu32RegAddr = (HI_U32*)&(s_pstRegClkGateSrst->u32);
    o_hdmi_sc_clkgate_srst_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_bus_srst_req = ureset;
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_srst_req = ureset;
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_cec_srst_req = ureset;
    HDMI_RegWrite(pu32RegAddr, o_hdmi_sc_clkgate_srst_ctrl.u32);

    /* PERI_CRG67  HDMITX_CTRL CRG  0x010C   0x0000043F */
    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);
    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg67.bits.hdmitx_ctrl_bus_srst_req = ureset;
    o_peri_crg67.bits.hdmitx_ctrl_srst_req = ureset;
    o_peri_crg67.bits.hdmitx_ssc_srst_req = ureset;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    /* PERI_CRG68  HDMITX_PHY      0x0110  0x00000001 */
    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);
    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg68.bits.hdmitx_phy_srst_req = ureset;
    o_peri_crg68.bits.phy_tmds_srst_req = ureset;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg68.u32);

    return HI_SUCCESS;
}


int REG_HDMI_CRG_PhyResetSet(unsigned int ureset)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG68 o_peri_crg68;

    /* PERI_CRG68  HDMITX_PHY      0x0110  0x00000001 */
    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);
    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg68.bits.hdmitx_phy_srst_req = ureset;
    o_peri_crg68.bits.phy_tmds_srst_req = ureset;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg68.u32);

    return HI_SUCCESS;
}

int REG_HDMI_CRG_Deinit(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    R_PERI_CRG67 o_peri_crg67;
    R_PERI_CRG68 o_peri_crg68;

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);

    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg68.bits.hdmitx_phy_srst_req = HI_TRUE;
    o_peri_crg68.bits.phy_tmds_srst_req   = HI_TRUE;
    o_peri_crg68.bits.phy_tmds_cken       = HI_FALSE;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg68.u32);

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);
    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg67.bits.hdmitx_ctrl_bus_srst_req = HI_TRUE;
    o_peri_crg67.bits.hdmitx_ctrl_srst_req     = HI_TRUE;
    o_peri_crg67.bits.hdmitx_ssc_srst_req      = HI_TRUE;
    o_peri_crg67.bits.hdmitx_ctrl_osc_24m_cken = HI_FALSE;
    o_peri_crg67.bits.hdmitx_ctrl_os_cken      = HI_FALSE;
    o_peri_crg67.bits.hdmitx_pxl_cken          = HI_FALSE;
    o_peri_crg67.bits.hdmitx_ctrl_as_cken      = HI_FALSE;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    return HI_SUCCESS;

}

int REG_HDMI_CRG_GateSet(unsigned int ucken)
{
    HI_U32 *pu32RegAddr = NULL;
    HDMI_SC_CLKGATE_SRST_CTRL o_hdmi_sc_clkgate_srst_ctrl;
    R_PERI_CRG67 o_peri_crg67;
    R_PERI_CRG68 o_peri_crg68;

    pu32RegAddr = (HI_U32*)&(s_pstRegClkGateSrst->u32);
    o_hdmi_sc_clkgate_srst_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_osc_cken = ucken;
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_apb_cken = ucken;
    o_hdmi_sc_clkgate_srst_ctrl.bits.hdmi_cec_cken = ucken;
    HDMI_RegWrite(pu32RegAddr, o_hdmi_sc_clkgate_srst_ctrl.u32);

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG67.u32);
    o_peri_crg67.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg67.bits.ssc_in_cken               = ucken;
    o_peri_crg67.bits.ssc_bypass_cken           = ucken;
    o_peri_crg67.bits.hdmitx_ctrl_osc_24m_cken  = ucken;
    o_peri_crg67.bits.hdmitx_ctrl_os_cken       = ucken;
    o_peri_crg67.bits.hdmitx_ctrl_as_cken       = ucken;
    o_peri_crg67.bits.hdmitx_pxl_cken           = ucken;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg67.u32);

    pu32RegAddr = (HI_U32*)&(s_pstRegCrg->PERI_CRG68.u32);
    o_peri_crg68.u32 = HDMI_RegRead(pu32RegAddr);
    o_peri_crg68.bits.phy_tmds_cken = ucken;
    HDMI_RegWrite(pu32RegAddr, o_peri_crg68.u32);

    return HI_SUCCESS;
}


void REG_HDMI_SYSCTRL_cpu_cec_info_Set(HDMI_MCU_INFO_S *pstCecCpuInfo)
{
    HI_U32 *pu32RegAddr = NULL;

    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_CEC_INFO_0);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32PhyAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_CEC_INFO_1);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32LogicAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_MCU_SWITCH_INFO);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32SwitchInfo);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_0);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32Rsv0);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_1);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32Rsv1);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_2);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32Rsv2);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_3);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32Rsv3);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_4);
    HDMI_RegWrite(pu32RegAddr, pstCecCpuInfo->u32Rsv4);

    return;
}

void REG_HDMI_SYSCTRL_cpu_cec_info_Get(HDMI_MCU_INFO_S *pstCecCpuInfo)
{
    HI_U32 *pu32RegAddr = NULL;

    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_CEC_INFO_0);
    pstCecCpuInfo->u32PhyAddr     = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_CEC_INFO_1);
    pstCecCpuInfo->u32LogicAddr   = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_MCU_SWITCH_INFO);
    pstCecCpuInfo->u32SwitchInfo  = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_0);
    pstCecCpuInfo->u32Rsv0        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_1);
    pstCecCpuInfo->u32Rsv1        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_2);
    pstCecCpuInfo->u32Rsv2        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_3);
    pstCecCpuInfo->u32Rsv3        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->CPU_HDMITX_RESERVED_4);
    pstCecCpuInfo->u32Rsv4        = HDMI_RegRead(pu32RegAddr);

    return;
}

void REG_HDMI_SYSCTRL_mcu_info_get(HDMI_MCU_INFO_S *pstCecMcuInfo)
{
    HI_U32 *pu32RegAddr = NULL;

    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_CEC_INFO_0);
    pstCecMcuInfo->u32PhyAddr     = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_CEC_INFO_1);
    pstCecMcuInfo->u32LogicAddr   = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_CPU_SWITCH_INFO);
    pstCecMcuInfo->u32SwitchInfo  = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_HDMITX_RESERVED_0);
    pstCecMcuInfo->u32Rsv0        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_HDMITX_RESERVED_1);
    pstCecMcuInfo->u32Rsv1        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_HDMITX_RESERVED_2);
    pstCecMcuInfo->u32Rsv2        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_HDMITX_RESERVED_3);
    pstCecMcuInfo->u32Rsv3        = HDMI_RegRead(pu32RegAddr);
    pu32RegAddr = (HI_U32*)&(s_pstRegSysCtrl->MCU_HDMITX_RESERVED_4);
    pstCecMcuInfo->u32Rsv4        = HDMI_RegRead(pu32RegAddr);
}


