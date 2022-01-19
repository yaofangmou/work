#ifndef __HAL_SYSCTRL_H__
#define __HAL_SYSCTRL_H__

#include "hi_register_vdp.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

HI_VOID VPSS_Sys_SetRegloadUp(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 regload_up);
HI_VOID VPSS_Sys_SetStartAddr(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 addr);
HI_VOID VPSS_Sys_SetMask0(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 mask0);
HI_VOID VPSS_Sys_SetMask1(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 mask1);

HI_VOID VPSS_Sys_SetSttWAddr(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 u32SttAddrH, HI_U32 u32SttAddrL);

HI_VOID VPSS_Sys_SetProt(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 prot);
HI_VOID VPSS_Sys_SetMaxReqNum(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 max_req_num);
HI_VOID VPSS_Sys_SetMaxReqLen(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 max_req_len);

HI_VOID VPSS_Sys_SetDiCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 di_cycbuf_en);
HI_VOID VPSS_Sys_SetHismCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 hism_cycbuf_en);
HI_VOID VPSS_Sys_SetDmCntCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 dm_cnt_cycbuf_en);
HI_VOID VPSS_Sys_SetNrMadCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 nr_mad_cycbuf_en);
HI_VOID VPSS_Sys_SetStathCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 stath_cycbuf_en);
HI_VOID VPSS_Sys_SetStatvCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 statv_cycbuf_en);
HI_VOID VPSS_Sys_SetRgmvCycbufEn(volatile S_VPSS_REGS_TYPE *pstVpssRegs, HI_U32 u32AddrOffset, HI_U32 rgmv_cycbuf_en);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
