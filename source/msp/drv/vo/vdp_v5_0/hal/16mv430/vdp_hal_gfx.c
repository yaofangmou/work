#include "vdp_hal_gfx.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID  VDP_GP_SetUpdMode(HI_U32 u32Data, HI_U32  u32Rgup)
{
    U_GP0_CTRL GP0_CTRL;


    GP0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->GP0_CTRL.u32) + u32Data * GFX_OFFSET));
    GP0_CTRL.bits.rgup_mode = u32Rgup ;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->GP0_CTRL.u32) + u32Data * GFX_OFFSET), GP0_CTRL.u32);

    return ;
}

HI_VOID  VDP_GFX_SetUpdMode(HI_U32 u32Data, HI_U32 u32Mode)
{
    U_G0_CTRL G0_CTRL;

    /* G0 layer register update mode */
    G0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->G0_CTRL.u32)+ u32Data * GFX_OFFSET));
    G0_CTRL.bits.upd_mode = u32Mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->G0_CTRL.u32)+ u32Data * GFX_OFFSET), G0_CTRL.u32);
}

HI_VOID VDP_DRV_GetGfxState(HI_BOOL *pbNeedProcessGfx)
{
    DISP_INFO("98mv310 Nousing!\n");
}

