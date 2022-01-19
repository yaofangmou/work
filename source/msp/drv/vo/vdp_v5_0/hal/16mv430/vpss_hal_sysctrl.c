#include "vpss_hal_sysctrl.h"
#include "vdp_hal_comm.h"

//======== REG LOAD ===========
HI_VOID VPSS_Sys_SetRegloadUp(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 regload_up)
{
    U_VPSS_REGLOAD_UP VPSS_REGLOAD_UP;

    VPSS_REGLOAD_UP.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_UP.u32) + u32AddrOffset));
    VPSS_REGLOAD_UP.bits.regload_up = regload_up;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_UP.u32) + u32AddrOffset),VPSS_REGLOAD_UP.u32);

    return ;
}
HI_VOID VPSS_Sys_SetStartAddr(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 addr)
{
    U_VPSS_REGLOAD_START_ADDR VPSS_REGLOAD_START_ADDR;

    VPSS_REGLOAD_START_ADDR.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_START_ADDR.u32) + u32AddrOffset));
    VPSS_REGLOAD_START_ADDR.bits.vpss_st_addr = addr;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_START_ADDR.u32) + u32AddrOffset),VPSS_REGLOAD_START_ADDR.u32);

    return ;
}

HI_VOID VPSS_Sys_SetMask0(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 mask0)
{
    U_VPSS_REGLOAD_MASK0 VPSS_REGLOAD_MASK0;

    VPSS_REGLOAD_MASK0.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_MASK0.u32) + u32AddrOffset));
    VPSS_REGLOAD_MASK0.bits.vpss_mask0 = mask0;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_MASK0.u32) + u32AddrOffset),VPSS_REGLOAD_MASK0.u32);

    return ;
}

HI_VOID VPSS_Sys_SetMask1(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 mask1)
{
    U_VPSS_REGLOAD_MASK1 VPSS_REGLOAD_MASK1;

    VPSS_REGLOAD_MASK1.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_MASK1.u32) + u32AddrOffset));
    VPSS_REGLOAD_MASK1.bits.vpss_mask1 = mask1;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_REGLOAD_MASK1.u32) + u32AddrOffset),VPSS_REGLOAD_MASK1.u32);

    return ;
}

HI_VOID VPSS_Sys_SetSttWAddr(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 u32SttAddrH, HI_U32 u32SttAddrL)
{
    U_VPSS_STT_W_ADDR_LOW VPSS_STT_W_ADDR_LOW;

    VPSS_STT_W_ADDR_LOW.u32  = u32SttAddrL;

    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_STT_W_ADDR_LOW)), VPSS_STT_W_ADDR_LOW.u32);

    return ;
}

HI_VOID VPSS_Sys_SetProt(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 prot)
{
    U_VPSS_CHN_CFG_CTRL VPSS_CHN_CFG_CTRL;

    VPSS_CHN_CFG_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset));
    VPSS_CHN_CFG_CTRL.bits.prot = prot;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset),VPSS_CHN_CFG_CTRL.u32);

    return ;
}


HI_VOID VPSS_Sys_SetMaxReqNum(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 max_req_num)
{
    U_VPSS_CHN_CFG_CTRL VPSS_CHN_CFG_CTRL;

    VPSS_CHN_CFG_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset));
    VPSS_CHN_CFG_CTRL.bits.max_req_num = max_req_num;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset),VPSS_CHN_CFG_CTRL.u32);

    return ;
}

HI_VOID VPSS_Sys_SetMaxReqLen(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 max_req_len)
{
    U_VPSS_CHN_CFG_CTRL VPSS_CHN_CFG_CTRL;

    VPSS_CHN_CFG_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset));
    VPSS_CHN_CFG_CTRL.bits.max_req_len = max_req_len;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_CHN_CFG_CTRL.u32) + u32AddrOffset),VPSS_CHN_CFG_CTRL.u32);

    return ;
}

//cycbuf
HI_VOID VPSS_Sys_SetDiCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 di_cycbuf_en)
{
    U_VPSS_DI_CYC_CTRL VPSS_DI_CYC_CTRL;

    VPSS_DI_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_DI_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_DI_CYC_CTRL.bits.di_cycbuf_en = di_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_DI_CYC_CTRL.u32) + u32AddrOffset),VPSS_DI_CYC_CTRL.u32);

    return ;
}
HI_VOID VPSS_Sys_SetHismCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 hism_cycbuf_en)
{
    U_VPSS_HISM_CYC_CTRL VPSS_HISM_CYC_CTRL;

    VPSS_HISM_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_HISM_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_HISM_CYC_CTRL.bits.hism_cycbuf_en = hism_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_HISM_CYC_CTRL.u32) + u32AddrOffset),VPSS_HISM_CYC_CTRL.u32);

    return ;
}
HI_VOID VPSS_Sys_SetDmCntCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 dm_cnt_cycbuf_en)
{
    U_VPSS_DM_CNT_CYC_CTRL VPSS_DM_CNT_CYC_CTRL;

    VPSS_DM_CNT_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_DM_CNT_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_DM_CNT_CYC_CTRL.bits.dm_cnt_cycbuf_en = dm_cnt_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_DM_CNT_CYC_CTRL.u32) + u32AddrOffset),VPSS_DM_CNT_CYC_CTRL.u32);

    return ;
}


HI_VOID VPSS_Sys_SetNrMadCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 nr_mad_cycbuf_en)
{
    U_VPSS_NR_MAD_CYC_CTRL VPSS_NR_MAD_CYC_CTRL;

    VPSS_NR_MAD_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_NR_MAD_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_NR_MAD_CYC_CTRL.bits.nr_mad_cycbuf_en = nr_mad_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_NR_MAD_CYC_CTRL.u32) + u32AddrOffset),VPSS_NR_MAD_CYC_CTRL.u32);

    return ;
}


HI_VOID VPSS_Sys_SetStathCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 stath_cycbuf_en)
{
    U_VPSS_STATH_CYC_CTRL VPSS_STATH_CYC_CTRL;

    VPSS_STATH_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_STATH_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_STATH_CYC_CTRL.bits.stath_cycbuf_en = stath_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_STATH_CYC_CTRL.u32) + u32AddrOffset),VPSS_STATH_CYC_CTRL.u32);

    return ;
}

HI_VOID VPSS_Sys_SetStatvCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 statv_cycbuf_en)
{
    U_VPSS_STATV_CYC_CTRL VPSS_STATV_CYC_CTRL;

    VPSS_STATV_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_STATV_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_STATV_CYC_CTRL.bits.statv_cycbuf_en = statv_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_STATV_CYC_CTRL.u32) + u32AddrOffset),VPSS_STATV_CYC_CTRL.u32);

    return ;
}
HI_VOID VPSS_Sys_SetRgmvCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 rgmv_cycbuf_en)
{
    U_VPSS_RGMV_CYC_CTRL VPSS_RGMV_CYC_CTRL;

    VPSS_RGMV_CYC_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstVpssRegs->VPSS_RGMV_CYC_CTRL.u32) + u32AddrOffset));
    VPSS_RGMV_CYC_CTRL.bits.rgmv_cycbuf_en = rgmv_cycbuf_en;
    VDP_RegWrite((HI_ULONG)(&(pstVpssRegs->VPSS_RGMV_CYC_CTRL.u32) + u32AddrOffset),VPSS_RGMV_CYC_CTRL.u32);

    return ;
}
