#ifndef __VDP_HAL_IP_HZME_H__
#define __VDP_HAL_IP_HZME_H__

#include "hi_type.h"

HI_VOID VDP_HZME_SetHratio(HI_U32 u32OffsetAddr , HI_U32 hratio);
HI_VOID VDP_HZME_SetOutFmt(HI_U32 u32OffsetAddr , HI_U32 out_fmt);
HI_VOID VDP_HZME_SetOutWidth(HI_U32 u32OffsetAddr , HI_U32 out_width);
HI_VOID VDP_HZME_SetLhfirEn(HI_U32 u32OffsetAddr , HI_U32 lhfir_en);
HI_VOID VDP_HZME_SetChfirEn(HI_U32 u32OffsetAddr , HI_U32 chfir_en);
HI_VOID VDP_HZME_SetLhmidEn(HI_U32 u32OffsetAddr , HI_U32 lhmid_en);
HI_VOID VDP_HZME_SetChmidEn(HI_U32 u32OffsetAddr , HI_U32 chmid_en);
HI_VOID VDP_HZME_SetLhfirMode(HI_U32 u32OffsetAddr , HI_U32 lhfir_mode);
HI_VOID VDP_HZME_SetChfirMode(HI_U32 u32OffsetAddr , HI_U32 chfir_mode);
HI_VOID VDP_HZME_SetLhfirOffset(HI_U32 u32OffsetAddr , HI_U32 lhfir_offset);
HI_VOID VDP_HZME_SetChfirOffset(HI_U32 u32OffsetAddr , HI_U32 chfir_offset);
HI_VOID VDP_HZME_SetHlShootctrlEn(HI_U32 u32OffsetAddr , HI_U32 hl_shootctrl_en);
HI_VOID VDP_HZME_SetHlShootctrlMode(HI_U32 u32OffsetAddr , HI_U32 hl_shootctrl_mode);
HI_VOID VDP_HZME_SetHlFlatdectMode(HI_U32 u32OffsetAddr , HI_U32 hl_flatdect_mode);
HI_VOID VDP_HZME_SetHlCoringadjEn(HI_U32 u32OffsetAddr , HI_U32 hl_coringadj_en);
HI_VOID VDP_HZME_SetHlGain(HI_U32 u32OffsetAddr , HI_U32 hl_gain);
HI_VOID VDP_HZME_SetHlCoring(HI_U32 u32OffsetAddr , HI_U32 hl_coring);

#endif
