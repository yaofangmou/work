#include "vdp_hal_ip_link.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_LINK_SetCscLink(HI_U32 u32Link)
{
    U_LINK_CTRL LINK_CTRL;

    LINK_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->LINK_CTRL.u32));
    LINK_CTRL.bits.csc_link_ctrl = u32Link;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->LINK_CTRL.u32),LINK_CTRL.u32);

    return ;
}
