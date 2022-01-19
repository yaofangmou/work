#include "vdp_hal_ip_master.h"
#include "vdp_hal_comm.h"

extern S_VDP_REGS_TYPE *pVdpReg;

HI_VOID VDP_MASTER_SetMstr0Woutstanding( HI_U32 mstr0_woutstanding)
{
    U_VDP_MST_OUTSTANDING VDP_MST_OUTSTANDING;

    VDP_MST_OUTSTANDING.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_OUTSTANDING.u32)));
    VDP_MST_OUTSTANDING.bits.mstr0_woutstanding = mstr0_woutstanding;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_OUTSTANDING.u32)),VDP_MST_OUTSTANDING.u32);

    return ;
}

HI_VOID VDP_MASTER_SetMstr0Routstanding( HI_U32 mstr0_routstanding)
{
    U_VDP_MST_OUTSTANDING VDP_MST_OUTSTANDING;

    VDP_MST_OUTSTANDING.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_OUTSTANDING.u32)));
    VDP_MST_OUTSTANDING.bits.mstr0_routstanding = mstr0_routstanding;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_OUTSTANDING.u32)),VDP_MST_OUTSTANDING.u32);

    return ;
}

HI_VOID VDP_MASTER_SetMidEnable( HI_U32 mid_enable)
{
    U_VDP_MST_CTRL VDP_MST_CTRL;

    VDP_MST_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)));
    VDP_MST_CTRL.bits.mid_enable = mid_enable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)),VDP_MST_CTRL.u32);

    return ;
}

HI_VOID VDP_MASTER_SetArbMode( HI_U32 arb_mode)
{
    U_VDP_MST_CTRL VDP_MST_CTRL;

    VDP_MST_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)));
    VDP_MST_CTRL.bits.arb_mode = arb_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)),VDP_MST_CTRL.u32);

    return ;
}

HI_VOID VDP_MASTER_SetSplitMode( HI_U32 split_mode)
{
    U_VDP_MST_CTRL VDP_MST_CTRL;

    VDP_MST_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)));
    VDP_MST_CTRL.bits.split_mode = split_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_CTRL.u32)),VDP_MST_CTRL.u32);

    return ;
}

HI_VOID VDP_MASTER_SetRchnPrio( HI_U32 id, HI_U32 prio)
{
    HI_U32 u32Prio = prio & 0x1;
    HI_U32 u32RchnPrio = 0;

    if(id<32)
    {
        u32RchnPrio = VDP_RegRead(((HI_ULONG)&(pVdpReg->VDP_MST_RCHN_PRIO0.u32)));
        u32RchnPrio &= (~(0x1 << id));
        u32RchnPrio |= (u32Prio << id);
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->VDP_MST_RCHN_PRIO0.u32)),u32RchnPrio);
    }

    return ;
}
