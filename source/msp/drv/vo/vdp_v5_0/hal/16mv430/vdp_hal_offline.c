#include "vdp_hal_offline.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_OFF_SetSyncMode(S_VDP_REGS_TYPE * pstReg, HI_U32 sync_mode)
{
    U_ON_OFFLINE_BUF_CTRL ON_OFFLINE_BUF_CTRL;

    ON_OFFLINE_BUF_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->ON_OFFLINE_BUF_CTRL.u32)));
    ON_OFFLINE_BUF_CTRL.bits.sync_mode = sync_mode;
    VDP_RegWrite((HI_ULONG)(&(pstReg->ON_OFFLINE_BUF_CTRL.u32)),ON_OFFLINE_BUF_CTRL.u32);

    return ;
}

HI_VOID VDP_OFF_GetSyncMode(S_VDP_REGS_TYPE * pstReg, HI_U32 *psync_mode)
{
    U_ON_OFFLINE_BUF_CTRL ON_OFFLINE_BUF_CTRL;

    ON_OFFLINE_BUF_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->ON_OFFLINE_BUF_CTRL.u32)));
    *psync_mode = ON_OFFLINE_BUF_CTRL.bits.sync_mode;
    return ;
}

HI_VOID VDP_OFF_SetStartMode(S_VDP_REGS_TYPE * pstReg, HI_U32 start)
{
    U_OFFLINE_FPGADBG OFFLINE_FPGADBG;

    OFFLINE_FPGADBG.u32 = start;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_FPGADBG.u32)),OFFLINE_FPGADBG.u32);

    return ;
}

HI_VOID VDP_OFF_SetRegup(S_VDP_REGS_TYPE * pstReg, HI_U32 regup)
{
    U_OFFLINE_UPD OFFLINE_UPD;

    OFFLINE_UPD.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_UPD.u32)));
    OFFLINE_UPD.bits.regup = regup;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_UPD.u32)),OFFLINE_UPD.u32);

    return ;
}

HI_VOID VDP_OFF_SetHoldEn(S_VDP_REGS_TYPE * pstReg, HI_U32 hold_en)
{
    U_OFFLINE_CTRL OFFLINE_CTRL;

    OFFLINE_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_CTRL.u32)));
    OFFLINE_CTRL.bits.hold_en = hold_en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_CTRL.u32)),OFFLINE_CTRL.u32);

    return ;
}

HI_VOID VDP_OFF_SetHoldBreak(S_VDP_REGS_TYPE * pstReg)
{
    U_OFFLINE_HOLD_BREAK OFFLINE_HOLD_BREAK;

    OFFLINE_HOLD_BREAK.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_HOLD_BREAK.u32)));
    OFFLINE_HOLD_BREAK.bits.hold_break = HI_TRUE;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_HOLD_BREAK.u32)),OFFLINE_HOLD_BREAK.u32);

    return ;
}


HI_VOID VDP_OFF_GetHoldEn(S_VDP_REGS_TYPE * pstReg, HI_U32 *phold_en)
{
    U_OFFLINE_CTRL OFFLINE_CTRL;

    OFFLINE_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_CTRL.u32)));
    *phold_en = OFFLINE_CTRL.bits.hold_en;
    return ;
}

HI_VOID VDP_OFF_RestEn(S_VDP_REGS_TYPE * pstReg, HI_U32 offline_reset_en)
{
    U_OFFLINE_CTRL OFFLINE_CTRL;

    OFFLINE_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_CTRL.u32)));
    OFFLINE_CTRL.bits.offline_reset_en = offline_reset_en;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_CTRL.u32)),OFFLINE_CTRL.u32);

    return ;
}

HI_VOID VDP_OFF_SetStart(S_VDP_REGS_TYPE * pstReg, HI_U32 start)
{
    U_OFFLINE_START OFFLINE_START;

    OFFLINE_START.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_START.u32)));
    OFFLINE_START.bits.start = start;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_START.u32)),OFFLINE_START.u32);

    return ;
}

HI_VOID VDP_OFF_SetOfflineTimeout(S_VDP_REGS_TYPE * pstReg, HI_U32 offline_timeout)
{
    U_OFFLINE_TIMEOUT OFFLINE_TIMEOUT;

    OFFLINE_TIMEOUT.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_TIMEOUT.u32)));
    OFFLINE_TIMEOUT.bits.offline_timeout = offline_timeout;
    VDP_RegWrite((HI_ULONG)(&(pstReg->OFFLINE_TIMEOUT.u32)),OFFLINE_TIMEOUT.u32);

    return ;
}

HI_VOID VDP_OFF_SetBufMode(S_VDP_REGS_TYPE * pstReg, HI_U32 buf_mode)
{
    U_ON_OFFLINE_BUF_CTRL ON_OFFLINE_BUF_CTRL;

    ON_OFFLINE_BUF_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->ON_OFFLINE_BUF_CTRL.u32)));
    ON_OFFLINE_BUF_CTRL.bits.buf_mode = buf_mode;
    VDP_RegWrite((HI_ULONG)(&(pstReg->ON_OFFLINE_BUF_CTRL.u32)),ON_OFFLINE_BUF_CTRL.u32);

    return ;
}

HI_VOID VDP_OFF_SetOnOfflineMode(S_VDP_REGS_TYPE * pstReg, HI_U32 on_offline_mode)
{
    U_ON_OFFLINE_MODE_CTRL ON_OFFLINE_MODE_CTRL;

    ON_OFFLINE_MODE_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->ON_OFFLINE_MODE_CTRL.u32)));
    ON_OFFLINE_MODE_CTRL.bits.on_offline_mode = on_offline_mode;
    VDP_RegWrite((HI_ULONG)(&(pstReg->ON_OFFLINE_MODE_CTRL.u32)),ON_OFFLINE_MODE_CTRL.u32);

    return ;
}

HI_VOID VDP_OFF_SetOnOfflineSwSrc(S_VDP_REGS_TYPE * pstReg, HI_U32 on_offline_sw_src)
{
    U_ON_OFFLINE_MODE_CTRL ON_OFFLINE_MODE_CTRL;

    ON_OFFLINE_MODE_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->ON_OFFLINE_MODE_CTRL.u32)));
    ON_OFFLINE_MODE_CTRL.bits.on_offline_sw_src = on_offline_sw_src;
    VDP_RegWrite((HI_ULONG)(&(pstReg->ON_OFFLINE_MODE_CTRL.u32)),ON_OFFLINE_MODE_CTRL.u32);

    return ;
}

HI_U32 VDP_OFF_GetOnlineId(S_VDP_REGS_TYPE * pstReg)
{
    U_OFFLINE_DEBUG0 OFFLINE_DEBUG0;
    OFFLINE_DEBUG0.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_DEBUG0.u32)));
    return OFFLINE_DEBUG0.bits.online_id;
}

HI_U32 VDP_OFF_GetOfflineId(S_VDP_REGS_TYPE * pstReg)
{
    U_OFFLINE_DEBUG0 OFFLINE_DEBUG0;
    OFFLINE_DEBUG0.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_DEBUG0.u32)));
    return OFFLINE_DEBUG0.bits.offline_id;
}

HI_U32 VDP_OFF_GetOflineState(S_VDP_REGS_TYPE * pstReg)
{
       U_OFFLINE_STATE0 OFFLINE_STATE0;
       OFFLINE_STATE0.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_STATE0.u32)));
       return OFFLINE_STATE0.u32;
}

HI_U32 VDP_OFF_GetStartMode(S_VDP_REGS_TYPE * pstReg)
{
       U_OFFLINE_FPGADBG OFFLINE_FPGADBG;
       OFFLINE_FPGADBG.u32 = VDP_RegRead((HI_ULONG)(&(pstReg->OFFLINE_FPGADBG.u32)));
       return OFFLINE_FPGADBG.u32;
}
