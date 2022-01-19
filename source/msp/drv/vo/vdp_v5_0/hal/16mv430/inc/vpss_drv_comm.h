#ifndef __VPSS_DRV_COMM_H__
#define __VPSS_DRV_COMM_H__

#include "xdp_define.h"
#include "vdp_ip_define.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

HI_U32 VpssUpAlign  (HI_U32 u32DataIn, HI_U32 u32Align);

HI_U32 VpssCalcChmWth(HI_U32 u32LumWth, XDP_PROC_FMT_E enDataFmt);
HI_U32 VpssCalcChmHgt(HI_U32 u32LumHgt, XDP_PROC_FMT_E enDataFmt);

HI_U32 VPSS_CalcAddrStr(XDP_SOLO_ADDR_S * pstAddr, XDP_RECT_S * pstRect, HI_U32 u32DataWidth, HI_BOOL bRandModeEn, HI_U32 u32AlignByte);

XDP_DATA_RMODE_E RMODE_ADP(VDP_DATA_RMODE_E enRmod);
XDP_PROC_FMT_E FMT_ADP(VDP_VID_IFMT_E enFmt);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif//__VPSS_DRV_COMM_H__
