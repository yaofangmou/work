#ifndef __VDP_HAL_COMM_H__
#define __VDP_HAL_COMM_H__

#include "vdp_define.h"
#include "hi_register_vdp.h"
#include "vdp_hal_ip_master.h"
#include "drv_disp_osal.h"

//==============================================================================
/* Define the global struct */
#if defined(HI_MINIBOOT_SUPPORT)
#define offsetof(TYPE, MEMBER)  ((size_t)&((TYPE *)0)->MEMBER)
#endif


#define VDP_REG_SIZE_CALC(start, end)\
    (offsetof(S_VDP_REGS_TYPE, end)  -\
     offsetof(S_VDP_REGS_TYPE, start))


#define SET_NODEREG_FLAG(bEof, bCfgVal, u32ActiveRange, bMask, u32MaskType)  \
                     ( (((bEof)&0x1)<<7) | \
                       (((bCfgVal)&0x1)<<6) | \
                       (((u32ActiveRange)&0x3)<<4) | \
                       (((bMask)&0x1)<<3) | \
                       (((u32MaskType)&0x7)<<0) )

HI_U32 VDP_RegRead( HI_ULONG a);
HI_VOID VDP_RegWrite( HI_ULONG  a, HI_U32 b);
HI_U32  VDP_DdrRead(volatile HI_U32 a);

HI_U32  VDP_RegReadEx(HI_U32 a);
HI_VOID VDP_RegWriteEx(HI_U32 a, HI_U32 b);
HI_U32 VDP_NodeRead(volatile HI_U32* a);
HI_VOID VDP_NodeWrite(HI_U32 *pCfgNode,HI_U32 u32RegOffsetAddr, HI_U32 u32Flag,HI_U32 u32RegCfg);

HI_VOID VDP_SetVdpFpgaDebugWrite(HI_U32 u32Data);
HI_S32 VDP_SetVdpFpgaDebugRead(HI_VOID);
#ifndef __DISP_PLATFORM_BOOT__
HI_S32 XDP_CalcRunTime(HI_VOID);
#endif

//-------------------------------------------------------------------
//Bus Function BEGIN
//-------------------------------------------------------------------
HI_VOID VDP_SetVDPMemLowPower (HI_VOID);

//MV300 SYSTEM
HI_VOID VDP_SetClkGateEn       ( HI_U32 u32Data);
HI_VOID VDP_SetCheckSumEnable  ( HI_U32 bEnable);
HI_VOID VDP_CBM_Clear_MixvPrio ( HI_U32 u32layer_id);
HI_VOID VDP_CBM_SetMixerBkg    ( VDP_CBM_MIX_E u32mixer_id, VDP_BKG_S stBkg);
HI_VOID VDP_CBM_SetMixerPrio   ( VDP_CBM_MIX_E u32mixer_id, HI_U32 u32layer_id,HI_U32 u32prio);
HI_VOID VDP_CBM_ResetMixerPrio ( VDP_CBM_MIX_E u32mixer_id);

#endif//__HAL_COMM_H__
