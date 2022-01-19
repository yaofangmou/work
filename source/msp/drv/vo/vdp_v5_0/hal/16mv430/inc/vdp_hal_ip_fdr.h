#ifndef __VDP_HAL_IP_FDR_H__
#define __VDP_HAL_IP_FDR_H__

#include "hi_type.h"

//-------------------------------------------------
// vid fdr driver
//-------------------------------------------------
HI_VOID VDP_FDR_VID_SetLmDrawMode( HI_U32 offset, HI_U32 lm_draw_mode      );
HI_VOID VDP_FDR_VID_SetChmDrawMode( HI_U32 offset, HI_U32 chm_draw_mode     );
HI_VOID VDP_FDR_VID_SetWTunlEn(HI_U32 offset, HI_U32 wtunl_en);
HI_VOID VDP_FDR_VID_SetReqLen( HI_U32 offset, HI_U32 req_len           );
HI_VOID VDP_FDR_VID_SetReqCtrl( HI_U32 offset, HI_U32 req_ctrl          );
HI_VOID VDP_FDR_VID_SetPreRdEn( HI_U32 offset, HI_U32 pre_rd_en         );
HI_VOID VDP_FDR_VID_SetChecksumEn( HI_U32 offset, HI_U32 checksum_en       );
HI_VOID VDP_FDR_VID_SetSrcCropY( HI_U32 offset, HI_U32 src_crop_y        );
HI_VOID VDP_FDR_VID_SetSrcCropX( HI_U32 offset, HI_U32 src_crop_x        );
HI_VOID VDP_FDR_VID_SetIresoH( HI_U32 offset, HI_U32 ireso_h           );
HI_VOID VDP_FDR_VID_SetIresoW( HI_U32 offset, HI_U32 ireso_w           );
HI_VOID VDP_FDR_VID_SetSrcH( HI_U32 offset, HI_U32 src_h             );
HI_VOID VDP_FDR_VID_SetSrcW( HI_U32 offset, HI_U32 src_w             );
HI_VOID VDP_FDR_VID_SetDispMode( HI_U32 offset, HI_U32 disp_mode         );
HI_VOID VDP_FDR_VID_SetUvOrderEn( HI_U32 offset, HI_U32 uv_order_en       );
HI_VOID VDP_FDR_VID_SetDrawPixelMode( HI_U32 offset, HI_U32 draw_pixel_mode   );
HI_VOID VDP_FDR_VID_SetChmStride( HI_U32 offset, HI_U32 chm_stride        );
HI_VOID VDP_FDR_VID_SetLmStride( HI_U32 offset, HI_U32 lm_stride         );
HI_VOID VDP_FDR_VID_SetVhdaddrL( HI_U32 offset, HI_U32 vhdaddr_l         );
HI_VOID VDP_FDR_VID_SetVhdcaddrL( HI_U32 offset, HI_U32 vhdcaddr_l        );
HI_VOID VDP_FDR_VID_SetDataWidth( HI_U32 offset, HI_U32 data_width        );
HI_VOID VDP_FDR_VID_SetDataFmt( HI_U32 offset, HI_U32 data_fmt          );
HI_VOID VDP_FDR_VID_SetDataType( HI_U32 offset, HI_U32 data_type         );
HI_VOID VDP_FDR_VID_SetLmRmode( HI_U32 offset, HI_U32 lm_rmode          );
HI_VOID VDP_FDR_VID_SetChmRmode( HI_U32 offset, HI_U32 chm_rmode         );
HI_VOID VDP_FDR_VID_SetFlipEn( HI_U32 offset, HI_U32 flip_en           );

HI_U32 VDP_FDR_VID_GetVhdaddrL( HI_U32 offset);
HI_U32 VDP_FDR_VID_GetCurVhdaddrL(HI_U32 offset);
HI_U32 VDP_FDR_VID_GetOutReso(HI_U32 offset);
HI_U32 VDP_FDR_VID_GetTunlAddr(HI_U32 offset);
//-------------------------------------------------
// gfx fdr driver
//-------------------------------------------------
HI_VOID VDP_FDR_GFX_SetReqLen( HI_U32 offset, HI_U32 req_len          );
HI_VOID VDP_FDR_GFX_SetReqCtrl( HI_U32 offset, HI_U32 req_ctrl         );
HI_VOID VDP_FDR_GFX_SetChecksumEn( HI_U32 offset, HI_U32 checksum_en      );
HI_U32 VDP_FDR_VF_GetSrcOutReso(HI_U32 offset, VDP_RECT_S *pstSrcRect);
HI_U32 VDP_FDR_VF_GetSrcCropSize(HI_U32 offset, VDP_RECT_S *pstSrcCrop);

HI_VOID VDP_FDR_VID_GetSrcH(HI_U32 offset, HI_U32 *p32src_h);

HI_VOID VDP_FDR_VID_GetSrcW(HI_U32 offset, HI_U32 *p32src_w);

HI_VOID VDP_FDR_VID_GetSrcCropY(HI_U32 offset, HI_U32 *pu32src_crop_y);

HI_VOID VDP_FDR_VID_GetSrcCropX(HI_U32 offset, HI_U32 *pu32src_crop_x);

HI_VOID VDP_FDR_VID_GetIresoH(HI_U32 offset, HI_U32 *pireso_h);

HI_VOID VDP_FDR_VID_GetIresoW(HI_U32 offset, HI_U32 *pireso_w);

#endif
