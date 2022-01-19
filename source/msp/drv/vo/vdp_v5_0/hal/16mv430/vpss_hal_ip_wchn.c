#include "vpss_hal_ip_wchn.h"
#include "vpss_mac_define.h"
#include "vdp_hal_comm.h"

// Base Image Reg Use: VPSS_RFR_CTRL
// Base Solo  Reg Use: VPSS_WHISM_CTRL

//-------------------------------------------------
// vpss mac wchn hal image
//-------------------------------------------------
HI_VOID VPSS_WCHN_SetEn(S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en)
{
    U_VPSS_BASE_WR_IMG_CTRL VPSS_BASE_WR_IMG_CTRL;

    VPSS_BASE_WR_IMG_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->VPSS_RFR_CTRL.u32) + (offsetof(S_VPSS_BASE_WR_IMG_REGS_TYPE, VPSS_BASE_WR_IMG_CTRL)/4) + offset));
    VPSS_BASE_WR_IMG_CTRL.bits.en = en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->VPSS_RFR_CTRL.u32) + (offsetof(S_VPSS_BASE_WR_IMG_REGS_TYPE, VPSS_BASE_WR_IMG_CTRL)/4) + offset),VPSS_BASE_WR_IMG_CTRL.u32);

    return ;
}

//-------------------------------------------------
// vpss mac wchn hal solo
//-------------------------------------------------

HI_VOID VPSS_WCHN_SOLO_SetEn(S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en)
{
    U_VPSS_BASE_WR_SOLO_CTRL VPSS_BASE_WR_SOLO_CTRL;

    VPSS_BASE_WR_SOLO_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->VPSS_WHISM_CTRL.u32) + (offsetof(S_VPSS_BASE_WR_SOLO_REGS_TYPE, VPSS_BASE_WR_SOLO_CTRL)/4) + offset));
    VPSS_BASE_WR_SOLO_CTRL.bits.en = en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->VPSS_WHISM_CTRL.u32) + (offsetof(S_VPSS_BASE_WR_SOLO_REGS_TYPE, VPSS_BASE_WR_SOLO_CTRL)/4) + offset),VPSS_BASE_WR_SOLO_CTRL.u32);

    return ;
}
