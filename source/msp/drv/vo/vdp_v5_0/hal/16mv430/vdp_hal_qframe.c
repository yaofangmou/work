#include "vdp_hal_comm.h"
#include "vdp_hal_qframe.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_QF_HAL_SetVID_STARTMODE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_OFFLINE_FPGADBG *pstOFFLINE_FPGADBG)
{
    HI_U32 u32Addr=0;

    u32Addr = (HI_U32)(&(pVdpReg->OFFLINE_FPGADBG.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->OFFLINE_FPGADBG.u32)), u32Addr, u32NodeInfo, pstOFFLINE_FPGADBG->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetLINK_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_LINK_CTRL *pstLINK_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->LINK_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->LINK_CTRL.u32)), u32Addr, u32NodeInfo, pstLINK_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_ADDR_VHD_CHN00(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_ADDR_VHD_CHN00 *pstPARA_ADDR_VHD_CHN00)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_ADDR_VHD_CHN00.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_ADDR_VHD_CHN00.u32)), u32Addr, u32NodeInfo, pstPARA_ADDR_VHD_CHN00->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_ADDR_VHD_CHN01(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_ADDR_VHD_CHN01 *pstPARA_ADDR_VHD_CHN01)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_ADDR_VHD_CHN01.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_ADDR_VHD_CHN01.u32)), u32Addr, u32NodeInfo, pstPARA_ADDR_VHD_CHN01->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_ADDR_VHD_CHN02(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_ADDR_VHD_CHN02 *pstPARA_ADDR_VHD_CHN02)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_ADDR_VHD_CHN02.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_ADDR_VHD_CHN02.u32)), u32Addr, u32NodeInfo, pstPARA_ADDR_VHD_CHN02->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_ADDR_VHD_CHN07(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_ADDR_VHD_CHN07 *pstPARA_ADDR_VHD_CHN07)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_ADDR_VHD_CHN07.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_ADDR_VHD_CHN07.u32)), u32Addr, u32NodeInfo, pstPARA_ADDR_VHD_CHN07->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_ADDR_VHD_CHN08(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_ADDR_VHD_CHN08 *pstPARA_ADDR_VHD_CHN08)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_ADDR_VHD_CHN08.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_ADDR_VHD_CHN08.u32)), u32Addr, u32NodeInfo, pstPARA_ADDR_VHD_CHN08->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetPARA_UP_VHD(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_PARA_UP_VHD *pstPARA_UP_VHD)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->PARA_UP_VHD.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->PARA_UP_VHD.u32)), u32Addr, u32NodeInfo, pstPARA_UP_VHD->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_CTRL *pstV0_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_CTRL.u32)), u32Addr, u32NodeInfo, pstV0_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetFPGADEBUG_SOFTALG(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_FPGADEBUG_SOFTALG *pstFPGADEBUG_SOFTALG)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->FPGADEBUG_SOFTALG.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->FPGADEBUG_SOFTALG_Btm.u32)), u32Addr, u32NodeInfo, pstFPGADEBUG_SOFTALG->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->FPGADEBUG_SOFTALG.u32)), u32Addr, u32NodeInfo, pstFPGADEBUG_SOFTALG->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VPSS_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VPSS_CTRL *pstV0_VPSS_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_VPSS_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VPSS_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstV0_VPSS_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VPSS_CTRL.u32)), u32Addr, u32NodeInfo, pstV0_VPSS_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_DFPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_DFPOS *pstV0_DFPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_DFPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_DFPOS_Btm.u32)), u32Addr, u32NodeInfo, pstV0_DFPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_DFPOS.u32)), u32Addr, u32NodeInfo, pstV0_DFPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_DLPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_DLPOS *pstV0_DLPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_DLPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_DLPOS_Btm.u32)), u32Addr, u32NodeInfo, pstV0_DLPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_DLPOS.u32)), u32Addr, u32NodeInfo, pstV0_DLPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VFPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VFPOS *pstV0_VFPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_VFPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VFPOS_Btm.u32)), u32Addr, u32NodeInfo, pstV0_VFPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VFPOS.u32)), u32Addr, u32NodeInfo, pstV0_VFPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VLPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VLPOS *pstV0_VLPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_VLPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VLPOS_Btm.u32)), u32Addr, u32NodeInfo, pstV0_VLPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VLPOS.u32)), u32Addr, u32NodeInfo, pstV0_VLPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_CCROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_CCROP *pstV0_CCROP)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_CCROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_CCROP.u32)), u32Addr, u32NodeInfo, pstV0_CCROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_FCROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_FCROP *pstV0_FCROP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_FCROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_FCROP_Btm.u32)), u32Addr, u32NodeInfo, pstV0_FCROP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_FCROP.u32)), u32Addr, u32NodeInfo, pstV0_FCROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_LCROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_LCROP *pstV0_LCROP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_LCROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_LCROP_Btm.u32)), u32Addr, u32NodeInfo, pstV0_LCROP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_LCROP.u32)), u32Addr, u32NodeInfo, pstV0_LCROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HSP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HSP *pstV0_HSP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_HSP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_HSP_Btm.u32)), u32Addr, u32NodeInfo, pstV0_HSP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_HSP.u32)), u32Addr, u32NodeInfo, pstV0_HSP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HLOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HLOFFSET *pstV0_HLOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HLOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HLOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_HLOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HCOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HCOFFSET *pstV0_HCOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HCOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HCOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_HCOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VSP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VSP *pstV0_VSP)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_VSP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_VSP.u32)), u32Addr, u32NodeInfo, pstV0_VSP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VSR(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VSR *pstV0_VSR)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_VSR.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VSR_Btm.u32)), u32Addr, u32NodeInfo, pstV0_VSR->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_VSR.u32)), u32Addr, u32NodeInfo, pstV0_VSR->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VOFFSET *pstV0_VOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_VOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_VOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_VOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_VBOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_VBOFFSET *pstV0_VBOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_VBOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_VBOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_VBOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_ZME_ORESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_ZME_ORESO *pstV0_ZME_ORESO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_ZME_ORESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_ZME_ORESO_Btm.u32)), u32Addr, u32NodeInfo, pstV0_ZME_ORESO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_ZME_ORESO.u32)), u32Addr, u32NodeInfo, pstV0_ZME_ORESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_ZME_SHOOTCTRL_HL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_ZME_SHOOTCTRL_HL *pstV0_ZME_SHOOTCTRL_HL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_ZME_SHOOTCTRL_HL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_ZME_SHOOTCTRL_HL.u32)), u32Addr, u32NodeInfo, pstV0_ZME_SHOOTCTRL_HL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_ZME_SHOOTCTRL_VL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_ZME_SHOOTCTRL_VL *pstV0_ZME_SHOOTCTRL_VL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_ZME_SHOOTCTRL_VL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_ZME_SHOOTCTRL_VL.u32)), u32Addr, u32NodeInfo, pstV0_ZME_SHOOTCTRL_VL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDLTICTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDLTICTRL *pstVHDLTICTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDLTICTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDLTICTRL.u32)), u32Addr, u32NodeInfo, pstVHDLTICTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDLTITHD(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDLTITHD *pstVHDLTITHD)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDLTITHD.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDLTITHD.u32)), u32Addr, u32NodeInfo, pstVHDLTITHD->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_CTRL *pstV0_HIPP_CSC_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_CTRL.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF00(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF00 *pstV0_HIPP_CSC_COEF00)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF00.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF00.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF00->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF01(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF01 *pstV0_HIPP_CSC_COEF01)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF01.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF01.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF01->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF02(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF02 *pstV0_HIPP_CSC_COEF02)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF02.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF02.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF02->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF10(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF10 *pstV0_HIPP_CSC_COEF10)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF10.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF10.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF10->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF11(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF11 *pstV0_HIPP_CSC_COEF11)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF11.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF11.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF11->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF12(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF12 *pstV0_HIPP_CSC_COEF12)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF12.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF12.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF12->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF20(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF20 *pstV0_HIPP_CSC_COEF20)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF20.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF20.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF20->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF21(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF21 *pstV0_HIPP_CSC_COEF21)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF21.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF21.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF21->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_COEF22(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_COEF22 *pstV0_HIPP_CSC_COEF22)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_COEF22.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_COEF22.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_COEF22->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_SCALE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_SCALE *pstV0_HIPP_CSC_SCALE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_SCALE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_SCALE.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_SCALE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_IDC0(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_IDC0 *pstV0_HIPP_CSC_IDC0)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_IDC0.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_IDC0.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_IDC0->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_IDC1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_IDC1 *pstV0_HIPP_CSC_IDC1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_IDC1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_IDC1.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_IDC1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_IDC2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_IDC2 *pstV0_HIPP_CSC_IDC2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_IDC2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_IDC2.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_IDC2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_ODC0(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_ODC0 *pstV0_HIPP_CSC_ODC0)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_ODC0.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_ODC0.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_ODC0->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_ODC1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_ODC1 *pstV0_HIPP_CSC_ODC1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_ODC1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_ODC1.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_ODC1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_ODC2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_ODC2 *pstV0_HIPP_CSC_ODC2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_ODC2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_ODC2.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_ODC2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_MIN_Y(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_MIN_Y *pstV0_HIPP_CSC_MIN_Y)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_MIN_Y.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_MIN_Y.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_MIN_Y->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_MIN_C(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_MIN_C *pstV0_HIPP_CSC_MIN_C)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_MIN_C.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_MIN_C.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_MIN_C->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_MAX_Y(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_MAX_Y *pstV0_HIPP_CSC_MAX_Y)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_MAX_Y.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_MAX_Y.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_MAX_Y->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HIPP_CSC_MAX_C(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HIPP_CSC_MAX_C *pstV0_HIPP_CSC_MAX_C)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HIPP_CSC_MAX_C.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HIPP_CSC_MAX_C.u32)), u32Addr, u32NodeInfo, pstV0_HIPP_CSC_MAX_C->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HINFO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HINFO *pstV0_HPZME_HINFO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HINFO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HINFO.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HINFO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HSP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HSP *pstV0_HPZME_HSP)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HSP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HSP.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HSP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HLOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HLOFFSET *pstV0_HPZME_HLOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HLOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HLOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HLOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HCOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HCOFFSET *pstV0_HPZME_HCOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HCOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HCOFFSET.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HCOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HL_SHOOTCTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HL_SHOOTCTRL *pstV0_HPZME_HL_SHOOTCTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HL_SHOOTCTRL.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HL_SHOOTCTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_HPZME_HC_SHOOTCTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_HPZME_HC_SHOOTCTRL *pstV0_HPZME_HC_SHOOTCTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->V0_HPZME_HC_SHOOTCTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->V0_HPZME_HC_SHOOTCTRL.u32)), u32Addr, u32NodeInfo, pstV0_HPZME_HC_SHOOTCTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_CTRL *pstWBC_DHD0_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_CTRL.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_ZME_HINFO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_ZME_HINFO *pstWBC_DHD0_ZME_HINFO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_ZME_HINFO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HINFO_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HINFO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HINFO.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HINFO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_ZME_HSP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_ZME_HSP *pstWBC_DHD0_ZME_HSP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_ZME_HSP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HSP_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HSP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HSP.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HSP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_ZME_HLOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_ZME_HLOFFSET *pstWBC_DHD0_ZME_HLOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_ZME_HLOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HLOFFSET.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HLOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_ZME_HCOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_ZME_HCOFFSET *pstWBC_DHD0_ZME_HCOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_ZME_HCOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_ZME_HCOFFSET.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_ZME_HCOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_HCDS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_HCDS *pstWBC_DHD0_HCDS)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_HCDS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_HCDS.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_HCDS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_DITHER_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_DITHER_CTRL *pstWBC_DHD0_DITHER_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_DITHER_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_DITHER_CTRL.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_DITHER_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_VZME_VINFO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_VZME_VINFO *pstWBC_DHD0_VZME_VINFO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_VZME_VINFO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VINFO_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VINFO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VINFO.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VINFO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_VZME_VSP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_VZME_VSP *pstWBC_DHD0_VZME_VSP)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_VZME_VSP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VSP.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VSP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_VZME_VSR(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_VZME_VSR *pstWBC_DHD0_VZME_VSR)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_VZME_VSR.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VSR_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VSR->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VSR.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VSR->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_VZME_VOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_VZME_VOFFSET *pstWBC_DHD0_VZME_VOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_VZME_VOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VOFFSET.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_VZME_VBOFFSET(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_VZME_VBOFFSET *pstWBC_DHD0_VZME_VBOFFSET)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_VZME_VBOFFSET.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_VZME_VBOFFSET.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_VZME_VBOFFSET->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_FCROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_FCROP *pstWBC_DHD0_FCROP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_FCROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_FCROP_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_FCROP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_FCROP.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_FCROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_LCROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_LCROP *pstWBC_DHD0_LCROP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_LCROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LCROP_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LCROP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LCROP.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LCROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_LBX_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_LBX_CTRL *pstWBC_DHD0_LBX_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_LBX_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_CTRL.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_LBX_ORESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_LBX_ORESO *pstWBC_DHD0_LBX_ORESO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_LBX_ORESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_ORESO_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_ORESO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_ORESO.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_ORESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_LBX_VFPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_LBX_VFPOS *pstWBC_DHD0_LBX_VFPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_LBX_VFPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_VFPOS_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_VFPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_VFPOS.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_VFPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_LBX_VLPOS(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_LBX_VLPOS *pstWBC_DHD0_LBX_VLPOS)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_LBX_VLPOS.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_VLPOS_Btm.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_VLPOS->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_LBX_VLPOS.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_LBX_VLPOS->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_READ_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_READ_CTRL *pstVID_READ_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_READ_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_READ_CTRL.u32)), u32Addr, u32NodeInfo, pstVID_READ_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_MAC_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_MAC_CTRL *pstVID_MAC_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VID_MAC_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VID_MAC_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVID_MAC_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VID_MAC_CTRL.u32)), u32Addr, u32NodeInfo, pstVID_MAC_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_READ_MODE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_READ_MODE *pstVID_READ_MODE)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VID_READ_MODE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VID_READ_MODE_Btm.u32)), u32Addr, u32NodeInfo, pstVID_READ_MODE->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VID_READ_MODE.u32)), u32Addr, u32NodeInfo, pstVID_READ_MODE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_OUT_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_OUT_CTRL *pstVID_OUT_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_OUT_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_OUT_CTRL.u32)), u32Addr, u32NodeInfo, pstVID_OUT_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_MUTE_BK(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_MUTE_BK *pstVID_MUTE_BK)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_MUTE_BK.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_MUTE_BK.u32)), u32Addr, u32NodeInfo, pstVID_MUTE_BK->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_SRC_BITW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_SRC_BITW *pstVID_SRC_BITW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_SRC_BITW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_SRC_BITW.u32)), u32Addr, u32NodeInfo, pstVID_SRC_BITW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_SRC_INFO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_SRC_INFO *pstVID_SRC_INFO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_SRC_INFO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_SRC_INFO.u32)), u32Addr, u32NodeInfo, pstVID_SRC_INFO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_SRC_RESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_SRC_RESO *pstVID_SRC_RESO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_SRC_RESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_SRC_RESO.u32)), u32Addr, u32NodeInfo, pstVID_SRC_RESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_SRC_CROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_SRC_CROP *pstVID_SRC_CROP)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_SRC_CROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_SRC_CROP.u32)), u32Addr, u32NodeInfo, pstVID_SRC_CROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_IN_RESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_IN_RESO *pstVID_IN_RESO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_IN_RESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_IN_RESO.u32)), u32Addr, u32NodeInfo, pstVID_IN_RESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_ADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_ADDR_L *pstVID_ADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_ADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_ADDR_L.u32)), u32Addr, u32NodeInfo, pstVID_ADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_CADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_CADDR_L *pstVID_CADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_CADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_CADDR_L.u32)), u32Addr, u32NodeInfo, pstVID_CADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_2BIT_ADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_2BIT_ADDR_L *pstVID_2BIT_ADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_2BIT_ADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_2BIT_ADDR_L.u32)), u32Addr, u32NodeInfo, pstVID_2BIT_ADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_2BIT_CADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_2BIT_CADDR_L *pstVID_2BIT_CADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_2BIT_CADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_2BIT_CADDR_L.u32)), u32Addr, u32NodeInfo, pstVID_2BIT_CADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_STRIDE *pstVID_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_STRIDE.u32)), u32Addr, u32NodeInfo, pstVID_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_2BIT_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_2BIT_STRIDE *pstVID_2BIT_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_2BIT_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_2BIT_STRIDE.u32)), u32Addr, u32NodeInfo, pstVID_2BIT_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_WTUNL_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_WTUNL_CTRL *pstVID_WTUNL_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_WTUNL_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_WTUNL_CTRL.u32)), u32Addr, u32NodeInfo, pstVID_WTUNL_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_WTUNL_ADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_WTUNL_ADDR_L *pstVID_WTUNL_ADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_WTUNL_ADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_WTUNL_ADDR_L.u32)), u32Addr, u32NodeInfo, pstVID_WTUNL_ADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_READ_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_READ_CTRL *pstVF_VID_READ_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_READ_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_READ_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_READ_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_READ_CTRL.u32)), u32Addr, u32NodeInfo, pstVF_VID_READ_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_READ_MODE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_READ_MODE *pstVF_VID_READ_MODE)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_READ_MODE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_READ_MODE_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_READ_MODE->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_READ_MODE.u32)), u32Addr, u32NodeInfo, pstVF_VID_READ_MODE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_OUT_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_OUT_CTRL *pstVF_VID_OUT_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_OUT_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_OUT_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_OUT_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_OUT_CTRL.u32)), u32Addr, u32NodeInfo, pstVF_VID_OUT_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_MUTE_BK(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_MUTE_BK *pstVF_VID_MUTE_BK)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_MUTE_BK.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_MUTE_BK.u32)), u32Addr, u32NodeInfo, pstVF_VID_MUTE_BK->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_SRC_BITW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_SRC_BITW *pstVF_VID_SRC_BITW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_SRC_BITW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_BITW.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_BITW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_SRC_INFO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_SRC_INFO *pstVF_VID_SRC_INFO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_SRC_INFO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_INFO.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_INFO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_SRC_RESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_SRC_RESO *pstVF_VID_SRC_RESO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_SRC_RESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_RESO_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_RESO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_RESO.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_RESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_SRC_CROP(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_SRC_CROP *pstVF_VID_SRC_CROP)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_SRC_CROP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_CROP_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_CROP->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_SRC_CROP.u32)), u32Addr, u32NodeInfo, pstVF_VID_SRC_CROP->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_IN_RESO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_IN_RESO *pstVF_VID_IN_RESO)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_IN_RESO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_IN_RESO_Btm.u32)), u32Addr, u32NodeInfo, pstVF_VID_IN_RESO->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_IN_RESO.u32)), u32Addr, u32NodeInfo, pstVF_VID_IN_RESO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_ADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_ADDR_L *pstVF_VID_ADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_ADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_ADDR_L.u32)), u32Addr, u32NodeInfo, pstVF_VID_ADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_CADDR_L(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_CADDR_L *pstVF_VID_CADDR_L)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_CADDR_L.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_CADDR_L.u32)), u32Addr, u32NodeInfo, pstVF_VID_CADDR_L->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVF_VID_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VF_VID_STRIDE *pstVF_VID_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VF_VID_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VF_VID_STRIDE.u32)), u32Addr, u32NodeInfo, pstVF_VID_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DI_CYC_Y_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DI_CYC_Y_START_ADDR_LOW *pstVPSS_DI_CYC_Y_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DI_CYC_Y_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DI_CYC_Y_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DI_CYC_Y_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DI_CYC_Y_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DI_CYC_Y_END_ADDR_LOW *pstVPSS_DI_CYC_Y_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DI_CYC_Y_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DI_CYC_Y_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DI_CYC_Y_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DI_CYC_C_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DI_CYC_C_START_ADDR_LOW *pstVPSS_DI_CYC_C_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DI_CYC_C_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DI_CYC_C_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DI_CYC_C_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DI_CYC_C_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DI_CYC_C_END_ADDR_LOW *pstVPSS_DI_CYC_C_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DI_CYC_C_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DI_CYC_C_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DI_CYC_C_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_HISM_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_HISM_CYC_START_ADDR_LOW *pstVPSS_HISM_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_HISM_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_HISM_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_HISM_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_HISM_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_HISM_CYC_END_ADDR_LOW *pstVPSS_HISM_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_HISM_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_HISM_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_HISM_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DM_CNT_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DM_CNT_CYC_START_ADDR_LOW *pstVPSS_DM_CNT_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DM_CNT_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DM_CNT_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DM_CNT_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_DM_CNT_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_DM_CNT_CYC_END_ADDR_LOW *pstVPSS_DM_CNT_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_DM_CNT_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_DM_CNT_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_DM_CNT_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_MAD_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_MAD_CYC_START_ADDR_LOW *pstVPSS_NR_MAD_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_MAD_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_MAD_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_MAD_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_MAD_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_MAD_CYC_END_ADDR_LOW *pstVPSS_NR_MAD_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_MAD_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_MAD_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_MAD_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_STATH_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_STATH_CYC_START_ADDR_LOW *pstVPSS_STATH_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_STATH_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_STATH_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_STATH_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_STATH_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_STATH_CYC_END_ADDR_LOW *pstVPSS_STATH_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_STATH_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_STATH_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_STATH_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_STATV_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_STATV_CYC_START_ADDR_LOW *pstVPSS_STATV_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_STATV_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_STATV_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_STATV_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_STATV_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_STATV_CYC_END_ADDR_LOW *pstVPSS_STATV_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_STATV_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_STATV_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_STATV_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RGMV_CYC_START_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RGMV_CYC_START_ADDR_LOW *pstVPSS_RGMV_CYC_START_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RGMV_CYC_START_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RGMV_CYC_START_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_RGMV_CYC_START_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RGMV_CYC_END_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RGMV_CYC_END_ADDR_LOW *pstVPSS_RGMV_CYC_END_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RGMV_CYC_END_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RGMV_CYC_END_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_RGMV_CYC_END_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P1_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P1_CTRL *pstVPSS_P1_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P1_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P1_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P1_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P1_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P1_STRIDE *pstVPSS_P1_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P1_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P1_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2_CTRL *pstVPSS_P2_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P2_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P2_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2_SIZE *pstVPSS_P2_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2_STRIDE *pstVPSS_P2_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P3_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P3_CTRL *pstVPSS_P3_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P3_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P3_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P3_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P3_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P3_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P3_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P3_STRIDE *pstVPSS_P3_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P3_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P3_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P3_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RHISM_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RHISM_CTRL *pstVPSS_RHISM_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RHISM_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RHISM_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_RHISM_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RHISM_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_RHISM_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RHISM_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RHISM_SIZE *pstVPSS_RHISM_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RHISM_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RHISM_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_RHISM_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RHISM_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RHISM_STRIDE *pstVPSS_RHISM_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RHISM_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RHISM_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_RHISM_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RDM_CNT_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RDM_CNT_CTRL *pstVPSS_RDM_CNT_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RDM_CNT_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RDM_CNT_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_RDM_CNT_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RDM_CNT_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_RDM_CNT_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RDM_CNT_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RDM_CNT_SIZE *pstVPSS_RDM_CNT_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RDM_CNT_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RDM_CNT_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_RDM_CNT_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RDM_CNT_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RDM_CNT_STRIDE *pstVPSS_RDM_CNT_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RDM_CNT_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RDM_CNT_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_RDM_CNT_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_RMAD_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_RMAD_CTRL *pstVPSS_NR_RMAD_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_RMAD_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_RMAD_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_RMAD_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_RMAD_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_RMAD_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_RMAD_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_RMAD_SIZE *pstVPSS_NR_RMAD_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_RMAD_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_RMAD_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_RMAD_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_RMAD_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_RMAD_STRIDE *pstVPSS_NR_RMAD_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_RMAD_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_RMAD_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_RMAD_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_SNR_RMAD_CTRL *pstVPSS_SNR_RMAD_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_SNR_RMAD_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_SNR_RMAD_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_SNR_RMAD_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_SNR_RMAD_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_SNR_RMAD_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_SNR_RMAD_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_SNR_RMAD_STRIDE *pstVPSS_SNR_RMAD_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_SNR_RMAD_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_SNR_RMAD_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_SNR_RMAD_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_SNR_RMAD_CTRL1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo,  U_VPSS_SNR_RMAD_CTRL1 *pstVPSS_SNR_RMAD_CTRL1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_SNR_RMAD_CTRL1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_SNR_RMAD_CTRL1.u32)), u32Addr, u32NodeInfo, pstVPSS_SNR_RMAD_CTRL1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATH_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATH_CTRL *pstVPSS_P2STATH_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATH_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATH_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATH_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATH_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATH_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATH_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATH_SIZE *pstVPSS_P2STATH_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATH_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATH_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATH_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATH_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATH_STRIDE *pstVPSS_P2STATH_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATH_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATH_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATH_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATV_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATV_CTRL *pstVPSS_P2STATV_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATV_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATV_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATV_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATV_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATV_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATV_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATV_SIZE *pstVPSS_P2STATV_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATV_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATV_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATV_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2STATV_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2STATV_STRIDE *pstVPSS_P2STATV_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2STATV_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2STATV_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2STATV_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2RGMV_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2RGMV_CTRL *pstVPSS_P2RGMV_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2RGMV_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2RGMV_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P2RGMV_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2RGMV_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P2RGMV_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2RGMV_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2RGMV_SIZE *pstVPSS_P2RGMV_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2RGMV_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2RGMV_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2RGMV_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P2RGMV_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P2RGMV_STRIDE *pstVPSS_P2RGMV_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P2RGMV_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P2RGMV_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P2RGMV_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P1RGMV_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P1RGMV_CTRL *pstVPSS_P1RGMV_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P1RGMV_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1RGMV_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_P1RGMV_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1RGMV_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_P1RGMV_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_P1RGMV_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_P1RGMV_STRIDE *pstVPSS_P1RGMV_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_P1RGMV_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_P1RGMV_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_P1RGMV_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RFR_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RFR_CTRL *pstVPSS_RFR_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RFR_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RFR_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_RFR_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_RFR_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_RFR_STRIDE *pstVPSS_RFR_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_RFR_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_RFR_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_RFR_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WHISM_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WHISM_CTRL *pstVPSS_WHISM_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WHISM_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WHISM_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_WHISM_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WHISM_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_WHISM_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WHISM_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WHISM_STRIDE *pstVPSS_WHISM_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WHISM_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WHISM_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_WHISM_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WHISM_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WHISM_SIZE *pstVPSS_WHISM_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WHISM_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WHISM_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_WHISM_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WDM_CNT_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WDM_CNT_CTRL *pstVPSS_WDM_CNT_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WDM_CNT_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WDM_CNT_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_WDM_CNT_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WDM_CNT_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_WDM_CNT_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WDM_CNT_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WDM_CNT_STRIDE *pstVPSS_WDM_CNT_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WDM_CNT_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WDM_CNT_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_WDM_CNT_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_WDM_CNT_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_WDM_CNT_SIZE *pstVPSS_WDM_CNT_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_WDM_CNT_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_WDM_CNT_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_WDM_CNT_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_WMAD_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_WMAD_CTRL *pstVPSS_NR_WMAD_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_WMAD_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_WMAD_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_WMAD_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_WMAD_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_WMAD_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_WMAD_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_WMAD_STRIDE *pstVPSS_NR_WMAD_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_WMAD_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_WMAD_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_WMAD_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_NR_WMAD_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_NR_WMAD_SIZE *pstVPSS_NR_WMAD_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_NR_WMAD_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_NR_WMAD_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_NR_WMAD_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATH_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATH_CTRL *pstVPSS_CFSTATH_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATH_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATH_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATH_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATH_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATH_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATH_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATH_STRIDE *pstVPSS_CFSTATH_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATH_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATH_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATH_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATH_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATH_SIZE *pstVPSS_CFSTATH_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATH_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATH_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATH_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATV_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATV_CTRL *pstVPSS_CFSTATV_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATV_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATV_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATV_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATV_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATV_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATV_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATV_STRIDE *pstVPSS_CFSTATV_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATV_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATV_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATV_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFSTATV_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFSTATV_SIZE *pstVPSS_CFSTATV_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFSTATV_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFSTATV_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFSTATV_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFRGMV_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFRGMV_CTRL *pstVPSS_CFRGMV_CTRL)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFRGMV_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFRGMV_CTRL_Btm.u32)), u32Addr, u32NodeInfo, pstVPSS_CFRGMV_CTRL->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFRGMV_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_CFRGMV_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFRGMV_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFRGMV_STRIDE *pstVPSS_CFRGMV_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFRGMV_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFRGMV_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFRGMV_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_CFRGMV_SIZE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_CFRGMV_SIZE *pstVPSS_CFRGMV_SIZE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_CFRGMV_SIZE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_CFRGMV_SIZE.u32)), u32Addr, u32NodeInfo, pstVPSS_CFRGMV_SIZE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_OUT_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_OUT_CTRL *pstVPSS_OUT_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_OUT_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_OUT_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_OUT_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_OUTY_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_OUTY_ADDR_LOW *pstVPSS_OUTY_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_OUTY_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_OUTY_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_OUTY_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_OUTC_ADDR_LOW(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_OUTC_ADDR_LOW *pstVPSS_OUTC_ADDR_LOW)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_OUTC_ADDR_LOW.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_OUTC_ADDR_LOW.u32)), u32Addr, u32NodeInfo, pstVPSS_OUTC_ADDR_LOW->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_OUT_STRIDE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_OUT_STRIDE *pstVPSS_OUT_STRIDE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_OUT_STRIDE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_OUT_STRIDE.u32)), u32Addr, u32NodeInfo, pstVPSS_OUT_STRIDE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVID_DTV_CFG_READY(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VID_DTV_CFG_READY *pstVID_DTV_CFG_READY)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VID_DTV_CFG_READY.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VID_DTV_CFG_READY.u32)), u32Addr, u32NodeInfo, pstVID_DTV_CFG_READY->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_CTRL *pstWBC_DHD_HIPP_CSC_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_CTRL.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF00(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF00 *pstWBC_DHD_HIPP_CSC_COEF00)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF00.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF00.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF00->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF01(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF01 *pstWBC_DHD_HIPP_CSC_COEF01)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF01.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF01.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF01->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF02(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF02 *pstWBC_DHD_HIPP_CSC_COEF02)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF02.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF02.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF02->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF10(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF10 *pstWBC_DHD_HIPP_CSC_COEF10)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF10.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF10.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF10->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF11(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF11 *pstWBC_DHD_HIPP_CSC_COEF11)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF11.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF11.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF11->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF12(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF12 *pstWBC_DHD_HIPP_CSC_COEF12)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF12.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF12.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF12->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF20(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF20 *pstWBC_DHD_HIPP_CSC_COEF20)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF20.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF20.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF20->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF21(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF21 *pstWBC_DHD_HIPP_CSC_COEF21)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF21.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF21.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF21->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_COEF22(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_COEF22 *pstWBC_DHD_HIPP_CSC_COEF22)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_COEF22.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_COEF22.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_COEF22->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_SCALE(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_SCALE *pstWBC_DHD_HIPP_CSC_SCALE)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_SCALE.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_SCALE.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_SCALE->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_IDC0(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_IDC0 *pstWBC_DHD_HIPP_CSC_IDC0)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_IDC0.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_IDC0.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_IDC0->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_IDC1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_IDC1 *pstWBC_DHD_HIPP_CSC_IDC1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_IDC1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_IDC1.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_IDC1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_IDC2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_IDC2 *pstWBC_DHD_HIPP_CSC_IDC2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_IDC2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_IDC2.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_IDC2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_ODC0(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_ODC0 *pstWBC_DHD_HIPP_CSC_ODC0)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_ODC0.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_ODC0.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_ODC0->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_ODC1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_ODC1 *pstWBC_DHD_HIPP_CSC_ODC1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_ODC1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_ODC1.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_ODC1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_ODC2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_ODC2 *pstWBC_DHD_HIPP_CSC_ODC2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_ODC2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_ODC2.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_ODC2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_MIN_Y(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_MIN_Y *pstWBC_DHD_HIPP_CSC_MIN_Y)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_MIN_Y.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_MIN_Y.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_MIN_Y->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_MIN_C(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_MIN_C *pstWBC_DHD_HIPP_CSC_MIN_C)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_MIN_C.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_MIN_C.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_MIN_C->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_MAX_Y(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_MAX_Y *pstWBC_DHD_HIPP_CSC_MAX_Y)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_MAX_Y.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_MAX_Y.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_MAX_Y->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD_HIPP_CSC_MAX_C(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD_HIPP_CSC_MAX_C *pstWBC_DHD_HIPP_CSC_MAX_C)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD_HIPP_CSC_MAX_C.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD_HIPP_CSC_MAX_C.u32)), u32Addr, u32NodeInfo, pstWBC_DHD_HIPP_CSC_MAX_C->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCTHD1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCTHD1 *pstVHDACCTHD1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCTHD1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCTHD1.u32)), u32Addr, u32NodeInfo, pstVHDACCTHD1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCTHD2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCTHD2 *pstVHDACCTHD2)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->VHDACCTHD2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCTHD2_Btm.u32)), u32Addr, u32NodeInfo, pstVHDACCTHD2->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCTHD2.u32)), u32Addr, u32NodeInfo, pstVHDACCTHD2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCDEMO(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCDEMO *pstVHDACCDEMO)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCDEMO.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCDEMO.u32)), u32Addr, u32NodeInfo, pstVHDACCDEMO->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCLOW1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCLOW1 *pstVHDACCLOW1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCLOW1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCLOW1.u32)), u32Addr, u32NodeInfo, pstVHDACCLOW1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCLOW2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCLOW2 *pstVHDACCLOW2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCLOW2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCLOW2.u32)), u32Addr, u32NodeInfo, pstVHDACCLOW2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCLOW3(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCLOW3 *pstVHDACCLOW3)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCLOW3.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCLOW3.u32)), u32Addr, u32NodeInfo, pstVHDACCLOW3->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCMED1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCMED1 *pstVHDACCMED1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCMED1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCMED1.u32)), u32Addr, u32NodeInfo, pstVHDACCMED1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCMED2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCMED2 *pstVHDACCMED2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCMED2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCMED2.u32)), u32Addr, u32NodeInfo, pstVHDACCMED2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCMED3(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCMED3 *pstVHDACCMED3)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCMED3.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCMED3.u32)), u32Addr, u32NodeInfo, pstVHDACCMED3->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCHIGH1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCHIGH1 *pstVHDACCHIGH1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCHIGH1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCHIGH1.u32)), u32Addr, u32NodeInfo, pstVHDACCHIGH1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCHIGH2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCHIGH2 *pstVHDACCHIGH2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCHIGH2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCHIGH2.u32)), u32Addr, u32NodeInfo, pstVHDACCHIGH2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACCHIGH3(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACCHIGH3 *pstVHDACCHIGH3)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACCHIGH3.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACCHIGH3.u32)), u32Addr, u32NodeInfo, pstVHDACCHIGH3->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM0(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM0 *pstVHDACM0)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM0.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM0.u32)), u32Addr, u32NodeInfo, pstVHDACM0->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM1(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM1 *pstVHDACM1)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM1.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM1.u32)), u32Addr, u32NodeInfo, pstVHDACM1->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM2(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM2 *pstVHDACM2)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM2.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM2.u32)), u32Addr, u32NodeInfo, pstVHDACM2->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM3(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM3 *pstVHDACM3)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM3.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM3.u32)), u32Addr, u32NodeInfo, pstVHDACM3->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM4(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM4 *pstVHDACM4)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM4.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM4.u32)), u32Addr, u32NodeInfo, pstVHDACM4->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM5(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM5 *pstVHDACM5)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM5.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM5.u32)), u32Addr, u32NodeInfo, pstVHDACM5->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM6(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM6 *pstVHDACM6)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM6.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM6.u32)), u32Addr, u32NodeInfo, pstVHDACM6->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVHDACM7(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VHDACM7 *pstVHDACM7)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VHDACM7.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VHDACM7.u32)), u32Addr, u32NodeInfo, pstVHDACM7->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetVPSS_VC1_CTRL(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_VC1_CTRL *pstVPSS_VC1_CTRL)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->VPSS_VC1_CTRL.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->VPSS_VC1_CTRL.u32)), u32Addr, u32NodeInfo, pstVPSS_VC1_CTRL->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetWBC_DHD0_UPD(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_WBC_DHD0_UPD *pstWBC_DHD0_UPD)
{
    HI_U32 u32Addr=0;


    u32Addr = (HI_U32)(&(pVdpReg->WBC_DHD0_UPD.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->WBC_DHD0_UPD.u32)), u32Addr, u32NodeInfo, pstWBC_DHD0_UPD->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetV0_UPD(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_V0_UPD *pstV0_UPD)
{
    HI_U32 u32Addr=0;
    HI_U32 u32ActiveRange=0;

    u32Addr = (HI_U32)(&(pVdpReg->V0_UPD.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    u32ActiveRange = (u32NodeInfo&0x30) >> 4;

    if(u32ActiveRange==2)
    {
        VDP_NodeWrite((&(pstCfgNode->V0_UPD_Btm.u32)), u32Addr, u32NodeInfo, pstV0_UPD->u32);
    }
    else
    {
        VDP_NodeWrite((&(pstCfgNode->V0_UPD.u32)), u32Addr, u32NodeInfo, pstV0_UPD->u32);
    }

    return ;
}

HI_VOID VDP_QF_HAL_SetOFFLINE_UPD (S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_OFFLINE_UPD *pstOFFLINE_UPD)
{
    HI_U32 u32Addr=0;

    u32Addr = (HI_U32)(&(pVdpReg->OFFLINE_UPD.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));

    {
        VDP_NodeWrite((&(pstCfgNode->OFFLINE_UPD.u32)), u32Addr, u32NodeInfo, pstOFFLINE_UPD->u32);
    }

    return ;
}


HI_VOID VDP_QF_HAL_SetVPSS_Addr(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_REGLOAD_START_ADDR *pstVPSS_Addr)
{
    HI_U32 u32Addr=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_REGLOAD_START_ADDR.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));
    VDP_NodeWrite((&(pstCfgNode->VPSS_REGLOAD_START_ADDR.u32)), u32Addr, u32NodeInfo, pstVPSS_Addr->u32);
    return ;
}

HI_VOID VDP_QF_HAL_SetVPSSAddr_Update(S_VDP_QF_REGS_TYPE *pstCfgNode, HI_U32 u32NodeInfo, U_VPSS_REGLOAD_UP *pstVpss_Update)
{
    HI_U32 u32Addr=0;

    u32Addr = (HI_U32)(&(pVdpReg->VPSS_REGLOAD_UP.u32)) - (HI_U32)(&(pVdpReg->VOCTRL.u32));
    VDP_NodeWrite((&(pstCfgNode->VPSS_REGLOAD_UP.u32)), u32Addr, u32NodeInfo, pstVpss_Update->u32);
    return ;
}


