#include "vpss_hal_ip_rchn.h"
#include "vpss_mac_define.h"
#include "vdp_hal_comm.h"

// Base Image Reg Use: VPSS_P1_CTRL
// Base Solo  Reg Use: VPSS_RHISM_CTRL

//-------------------------------------------------
// vpss mac rchn hal image
//-------------------------------------------------
HI_VOID VPSS_RCHN_SetEn(S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en)
{
    U_VPSS_BASE_RD_IMG_CTRL VPSS_BASE_RD_IMG_CTRL;

    VPSS_BASE_RD_IMG_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->VPSS_P1_CTRL.u32) + offset));
    VPSS_BASE_RD_IMG_CTRL.bits.en = en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->VPSS_P1_CTRL.u32) + offset),VPSS_BASE_RD_IMG_CTRL.u32);

    return ;
}
//-------------------------------------------------
// vpss mac rchn hal solo
//-------------------------------------------------

HI_VOID VPSS_RCHN_SOLO_SetEn(S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en)
{
    U_VPSS_BASE_RD_SOLO_CTRL VPSS_BASE_RD_SOLO_CTRL;

    VPSS_BASE_RD_SOLO_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->VPSS_RHISM_CTRL.u32) + offset));
    VPSS_BASE_RD_SOLO_CTRL.bits.en = en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->VPSS_RHISM_CTRL.u32) + offset),VPSS_BASE_RD_SOLO_CTRL.u32);

    return ;
}
