#include "vdp_hal_comm.h"


HI_VOID VDP_OFF_SetSyncMode(S_VDP_REGS_TYPE * pstReg, HI_U32 sync_mode);
HI_VOID VDP_OFF_GetSyncMode(S_VDP_REGS_TYPE * pstReg, HI_U32 *psync_mode);
HI_VOID VDP_OFF_SetOnOfflineMode(S_VDP_REGS_TYPE * pstReg, HI_U32 on_offline_mode);
HI_VOID VDP_OFF_SetOnOfflineSwSrc(S_VDP_REGS_TYPE * pstReg, HI_U32 on_offline_sw_src);
HI_VOID VDP_OFF_SetHoldEn(S_VDP_REGS_TYPE * pstReg, HI_U32 hold_en);
HI_VOID VDP_OFF_SetHoldBreak(S_VDP_REGS_TYPE * pstReg);
HI_VOID VDP_OFF_GetHoldEn(S_VDP_REGS_TYPE * pstReg, HI_U32 *phold_en);
HI_VOID VDP_OFF_RestEn(S_VDP_REGS_TYPE * pstReg, HI_U32 offline_reset_en);
HI_VOID VDP_OFF_SetStart(S_VDP_REGS_TYPE * pstReg, HI_U32 start);
HI_VOID VDP_OFF_SetStartMode(S_VDP_REGS_TYPE * pstReg, HI_U32 start);
HI_VOID VDP_OFF_SetRegup(S_VDP_REGS_TYPE * pstReg, HI_U32 regup);

HI_VOID VDP_OFF_SetOfflineTimeout(S_VDP_REGS_TYPE * pstReg, HI_U32 offline_timeout);
HI_VOID VDP_OFF_SetBufMode(S_VDP_REGS_TYPE * pstReg, HI_U32 buf_mode);
HI_U32 VDP_OFF_GetOflineState(S_VDP_REGS_TYPE * pstReg);
HI_U32 VDP_OFF_GetStartMode(S_VDP_REGS_TYPE * pstReg);
