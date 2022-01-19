#include "vdp_hal_ip_wd_lbox.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_WBC_LBOX_SetLbxEn(HI_U32 u32AddrOffset, HI_U32 lbx_en)
{
    U_WBC_DHD0_LBX_CTRL WBC_DHD0_LBX_CTRL;

    WBC_DHD0_LBX_CTRL.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_CTRL.u32) + u32AddrOffset));
    WBC_DHD0_LBX_CTRL.bits.lbx_en = lbx_en;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_CTRL.u32) + u32AddrOffset),WBC_DHD0_LBX_CTRL.u32);

    return;
}

HI_VOID VDP_WBC_LBOX_SetOh(HI_U32 u32AddrOffset, HI_U32 oh)
{
    U_WBC_DHD0_LBX_ORESO WBC_DHD0_LBX_ORESO;

    WBC_DHD0_LBX_ORESO.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_ORESO.u32) + u32AddrOffset));
    WBC_DHD0_LBX_ORESO.bits.oh = oh-1;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_ORESO.u32) + u32AddrOffset),WBC_DHD0_LBX_ORESO.u32);

    return ;
}

HI_VOID VDP_WBC_LBOX_SetOw(HI_U32 u32AddrOffset, HI_U32 ow)
{
    U_WBC_DHD0_LBX_ORESO WBC_DHD0_LBX_ORESO;

    WBC_DHD0_LBX_ORESO.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_ORESO.u32) + u32AddrOffset));
    WBC_DHD0_LBX_ORESO.bits.ow = ow-1;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_ORESO.u32) + u32AddrOffset),WBC_DHD0_LBX_ORESO.u32);

    return ;
}

HI_VOID VDP_WBC_LBOX_SetVideoYfpos(HI_U32 u32AddrOffset, HI_U32 video_yfpos)
{
    U_WBC_DHD0_LBX_VFPOS WBC_DHD0_LBX_VFPOS;

    WBC_DHD0_LBX_VFPOS.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VFPOS.u32) + u32AddrOffset));
    WBC_DHD0_LBX_VFPOS.bits.video_yfpos = video_yfpos;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VFPOS.u32) + u32AddrOffset),WBC_DHD0_LBX_VFPOS.u32);

    return ;
}

HI_VOID VDP_WBC_LBOX_SetVideoXfpos(HI_U32 u32AddrOffset, HI_U32 video_xfpos)
{
    U_WBC_DHD0_LBX_VFPOS WBC_DHD0_LBX_VFPOS;

    WBC_DHD0_LBX_VFPOS.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VFPOS.u32) + u32AddrOffset));
    WBC_DHD0_LBX_VFPOS.bits.video_xfpos = video_xfpos;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VFPOS.u32) + u32AddrOffset),WBC_DHD0_LBX_VFPOS.u32);

    return ;
}

HI_VOID VDP_WBC_LBOX_SetVideoYlpos(HI_U32 u32AddrOffset, HI_U32 video_ylpos)
{
    U_WBC_DHD0_LBX_VLPOS WBC_DHD0_LBX_VLPOS;

    WBC_DHD0_LBX_VLPOS.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VLPOS.u32) + u32AddrOffset));
    WBC_DHD0_LBX_VLPOS.bits.video_ylpos = video_ylpos;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VLPOS.u32) + u32AddrOffset),WBC_DHD0_LBX_VLPOS.u32);

    return ;
}

HI_VOID VDP_WBC_LBOX_SetVideoXlpos(HI_U32 u32AddrOffset, HI_U32 video_xlpos)
{
    U_WBC_DHD0_LBX_VLPOS WBC_DHD0_LBX_VLPOS;

    WBC_DHD0_LBX_VLPOS.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VLPOS.u32) + u32AddrOffset));
    WBC_DHD0_LBX_VLPOS.bits.video_xlpos = video_xlpos;
    VDP_RegWrite((HI_ULONG)((HI_ULONG)&(pVdpReg->WBC_DHD0_LBX_VLPOS.u32) + u32AddrOffset),WBC_DHD0_LBX_VLPOS.u32);

    return ;
}
HI_VOID VDP_WBC_LBOX_SetVbkAlpha(HI_U32 u32AddrOffset, HI_U32 vbk_alpha)
{
    U_WBC_DHD0_LBX_ALPHA WBC_DHD0_LBX_ALPHA;
    WBC_DHD0_LBX_ALPHA.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG) & (pVdpReg->WBC_DHD0_LBX_ALPHA.u32) + u32AddrOffset));
    WBC_DHD0_LBX_ALPHA.bits.vbk_alpha = vbk_alpha;
    VDP_RegWrite((HI_ULONG)((HI_ULONG) & (pVdpReg->WBC_DHD0_LBX_ALPHA.u32) + u32AddrOffset), WBC_DHD0_LBX_ALPHA.u32);
    return ;
}

HI_VOID VDP_WBC_LBOX_SetVbkYCbCr(HI_U32 u32AddrOffset, HI_U32 vbk_y, HI_U32 vbk_cb, HI_U32 vbk_cr)
{
    U_WBC_DHD0_LBX_BK WBC_DHD0_LBX_BK;
    WBC_DHD0_LBX_BK.u32 = VDP_RegRead((HI_ULONG)((HI_ULONG) & (pVdpReg->WBC_DHD0_LBX_BK.u32) + u32AddrOffset));
    WBC_DHD0_LBX_BK.bits.vbk_y = vbk_y;
    WBC_DHD0_LBX_BK.bits.vbk_cb = vbk_cb;
    WBC_DHD0_LBX_BK.bits.vbk_cr = vbk_cr;
    VDP_RegWrite((HI_ULONG)((HI_ULONG) & (pVdpReg->WBC_DHD0_LBX_BK.u32) + u32AddrOffset), WBC_DHD0_LBX_BK.u32);
    return ;
}
