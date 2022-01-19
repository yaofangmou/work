#ifndef __VDP_HAL_IP_WD_LBOX_H__
#define __VDP_HAL_IP_WD_LBOX_H__

#include "hi_type.h"


HI_VOID VDP_WBC_LBOX_SetLbxEn(HI_U32 u32AddrOffset, HI_U32 lbx_en);
HI_VOID VDP_WBC_LBOX_SetOh(HI_U32 u32AddrOffset, HI_U32 oh);
HI_VOID VDP_WBC_LBOX_SetOw(HI_U32 u32AddrOffset, HI_U32 ow);
HI_VOID VDP_WBC_LBOX_SetVideoYfpos(HI_U32 u32AddrOffset, HI_U32 video_yfpos);
HI_VOID VDP_WBC_LBOX_SetVideoXfpos(HI_U32 u32AddrOffset, HI_U32 video_xfpos);
HI_VOID VDP_WBC_LBOX_SetVideoYlpos(HI_U32 u32AddrOffset, HI_U32 video_ylpos);
HI_VOID VDP_WBC_LBOX_SetVideoXlpos(HI_U32 u32AddrOffset, HI_U32 video_xlpos);
HI_VOID VDP_WBC_LBOX_SetVbkAlpha(HI_U32 u32AddrOffset, HI_U32 vbk_alpha);
HI_VOID VDP_WBC_LBOX_SetVbkYCbCr(HI_U32 u32AddrOffset, HI_U32 vbk_y, HI_U32 vbk_cb, HI_U32 vbk_cr);

#endif
