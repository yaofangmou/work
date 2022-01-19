#include "vdp_hal_comm.h"
#include "vdp_hal_ip_fdr.h"

extern S_VDP_REGS_TYPE *pVdpReg;
//--------------------------------------------
// fdr vid driver
//--------------------------------------------

HI_VOID VDP_FDR_VID_SetFlipEn(HI_U32 offset, HI_U32 flip_en)
{
    U_VID_READ_CTRL VID_READ_CTRL;


    VID_READ_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset));
    VID_READ_CTRL.bits.flip_en = flip_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset),VID_READ_CTRL.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetLmDrawMode(HI_U32 offset, HI_U32 lm_draw_mode)
{
    U_VID_READ_CTRL VID_READ_CTRL;


    VID_READ_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset));
    VID_READ_CTRL.bits.lm_draw_mode = lm_draw_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset),VID_READ_CTRL.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetChmDrawMode(HI_U32 offset, HI_U32 chm_draw_mode)
{
    U_VID_READ_CTRL VID_READ_CTRL;


    VID_READ_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset));
    VID_READ_CTRL.bits.chm_draw_mode = chm_draw_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_READ_CTRL.u32) + offset),VID_READ_CTRL.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetLmRmode(HI_U32 offset, HI_U32 lm_rmode)
{
    U_VID_READ_MODE VID_READ_MODE;


    VID_READ_MODE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_MODE.u32) + offset));
    VID_READ_MODE.bits.lm_rmode = lm_rmode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_READ_MODE.u32) + offset),VID_READ_MODE.u32);
    return ;
}


HI_VOID VDP_FDR_VID_SetChmRmode(HI_U32 offset, HI_U32 chm_rmode)
{
    U_VID_READ_MODE VID_READ_MODE;


    VID_READ_MODE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_MODE.u32) + offset));
    VID_READ_MODE.bits.chm_rmode = chm_rmode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_READ_MODE.u32) + offset),VID_READ_MODE.u32);
    return ;
}

HI_VOID VDP_FDR_VID_GetLmRmode(HI_U32 offset, HI_U32 *plm_rmode)
{
    U_VID_READ_MODE VID_READ_MODE;

    VID_READ_MODE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_READ_MODE.u32) + offset));
    *plm_rmode  = VID_READ_MODE.bits.lm_rmode;
    return ;
}

HI_VOID VDP_FDR_VID_SetPreRdEn(HI_U32 offset, HI_U32 pre_rd_en)
{
    U_VID_MAC_CTRL VID_MAC_CTRL;


    VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset));
    VID_MAC_CTRL.bits.pre_rd_en = pre_rd_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset),VID_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetReqLen(HI_U32 offset, HI_U32 req_len)
{
    U_VID_MAC_CTRL VID_MAC_CTRL;


    VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset));
    VID_MAC_CTRL.bits.req_len = req_len;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset),VID_MAC_CTRL.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetReqCtrl(HI_U32 offset, HI_U32 req_ctrl)
{
    U_VID_MAC_CTRL VID_MAC_CTRL;


    VID_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset));
    VID_MAC_CTRL.bits.req_ctrl = req_ctrl;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_MAC_CTRL.u32) + offset),VID_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetUvOrderEn(HI_U32 offset, HI_U32 uv_order_en)
{
    U_VID_SRC_INFO VID_SRC_INFO;


    VID_SRC_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset));
    VID_SRC_INFO.bits.uv_order_en = uv_order_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset),VID_SRC_INFO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetDrawPixelMode(HI_U32 offset, HI_U32 draw_pixel_mode)
{
    U_VID_OUT_CTRL VID_OUT_CTRL;


    VID_OUT_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_OUT_CTRL.u32) + offset));
    VID_OUT_CTRL.bits.draw_pixel_mode = draw_pixel_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_OUT_CTRL.u32) + offset),VID_OUT_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetDispMode(HI_U32 offset, HI_U32 disp_mode)
{
    U_VID_SRC_INFO VID_SRC_INFO;


    VID_SRC_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset));
    VID_SRC_INFO.bits.disp_mode = disp_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset),VID_SRC_INFO.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetDataWidth(HI_U32 offset, HI_U32 data_width)
{
    U_VID_SRC_BITW VID_SRC_BITW;


    VID_SRC_BITW.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_BITW.u32) + offset));
    VID_SRC_BITW.bits.data_width = data_width;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_BITW.u32) + offset),VID_SRC_BITW.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetDataFmt(HI_U32 offset, HI_U32 data_fmt)
{
    U_VID_SRC_INFO VID_SRC_INFO;


    VID_SRC_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset));
    VID_SRC_INFO.bits.data_fmt = data_fmt;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset),VID_SRC_INFO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetDataType(HI_U32 offset, HI_U32 data_type)
{
    U_VID_SRC_INFO VID_SRC_INFO;


    VID_SRC_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset));
    VID_SRC_INFO.bits.data_type = data_type;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_INFO.u32) + offset),VID_SRC_INFO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetSrcH(HI_U32 offset, HI_U32 src_h)
{
    U_VID_SRC_RESO VID_SRC_RESO;


    VID_SRC_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset));
    VID_SRC_RESO.bits.src_h = src_h;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset),VID_SRC_RESO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetSrcW(HI_U32 offset, HI_U32 src_w)
{
    U_VID_SRC_RESO VID_SRC_RESO;


    VID_SRC_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset));
    VID_SRC_RESO.bits.src_w = src_w;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset),VID_SRC_RESO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetSrcCropY(HI_U32 offset, HI_U32 src_crop_y)
{
    U_VID_SRC_CROP VID_SRC_CROP;


    VID_SRC_CROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset));
    VID_SRC_CROP.bits.src_crop_y = src_crop_y;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset),VID_SRC_CROP.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetSrcCropX(HI_U32 offset, HI_U32 src_crop_x)
{
    U_VID_SRC_CROP VID_SRC_CROP;


    VID_SRC_CROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset));
    VID_SRC_CROP.bits.src_crop_x = src_crop_x;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset),VID_SRC_CROP.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetIresoH(HI_U32 offset, HI_U32 ireso_h)
{
    U_VID_IN_RESO VID_IN_RESO;


    VID_IN_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset));
    VID_IN_RESO.bits.ireso_h = ireso_h;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset),VID_IN_RESO.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetIresoW(HI_U32 offset, HI_U32 ireso_w)
{
    U_VID_IN_RESO VID_IN_RESO;


    VID_IN_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset));
    VID_IN_RESO.bits.ireso_w = ireso_w;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset),VID_IN_RESO.u32);

    return ;
}

HI_VOID VDP_FDR_VID_GetSrcH(HI_U32 offset, HI_U32 *p32src_h)
{
    U_VID_SRC_RESO VID_SRC_RESO;

    VID_SRC_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset));
    *p32src_h  = VID_SRC_RESO.bits.src_h + 1;

    return ;
}


HI_VOID VDP_FDR_VID_GetSrcW(HI_U32 offset, HI_U32 *p32src_w)
{
    U_VID_SRC_RESO VID_SRC_RESO;

    VID_SRC_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_RESO.u32) + offset));
    *p32src_w = VID_SRC_RESO.bits.src_w + 1;

    return ;
}


HI_VOID VDP_FDR_VID_GetSrcCropY(HI_U32 offset, HI_U32 *pu32src_crop_y)
{
    U_VID_SRC_CROP VID_SRC_CROP;

    VID_SRC_CROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset));
    *pu32src_crop_y = VID_SRC_CROP.bits.src_crop_y;

    return ;
}


HI_VOID VDP_FDR_VID_GetSrcCropX(HI_U32 offset, HI_U32 *pu32src_crop_x)
{
    U_VID_SRC_CROP VID_SRC_CROP;


    VID_SRC_CROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_SRC_CROP.u32) + offset));
    *pu32src_crop_x = VID_SRC_CROP.bits.src_crop_x;

    return ;
}


HI_VOID VDP_FDR_VID_GetIresoH(HI_U32 offset, HI_U32 *pireso_h)
{
    U_VID_IN_RESO VID_IN_RESO;

    VID_IN_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset));
    *pireso_h = VID_IN_RESO.bits.ireso_h + 1;

    return ;
}


HI_VOID VDP_FDR_VID_GetIresoW(HI_U32 offset, HI_U32 *pireso_w)
{
    U_VID_IN_RESO VID_IN_RESO;

    VID_IN_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_IN_RESO.u32) + offset));
    *pireso_w = VID_IN_RESO.bits.ireso_w + 1;

    return ;
}


HI_VOID VDP_FDR_VID_SetVhdaddrL(HI_U32 offset, HI_U32 vhdaddr_l)
{
    U_VID_ADDR_L VID_ADDR_L;


    VID_ADDR_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_ADDR_L.u32) + offset));
    VID_ADDR_L.bits.vhdaddr_l = vhdaddr_l;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_ADDR_L.u32) + offset),VID_ADDR_L.u32);

    return ;
}

HI_U32 VDP_FDR_VID_GetVhdaddrL(HI_U32 offset)
{
	U_VID_LAST_YADDR VID_LAST_YADDR;
	VID_LAST_YADDR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_LAST_YADDR.u32) + offset));
	return VID_LAST_YADDR.bits.y_last_addr;
}

HI_U32 VDP_FDR_VID_GetCurVhdaddrL(HI_U32 offset)
{
	U_VID_WORK_Y_ADDR VID_WORK_Y_ADDR;
	VID_WORK_Y_ADDR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_WORK_Y_ADDR.u32) + offset));
	return VID_WORK_Y_ADDR.bits.work_y_addr;
}

HI_U32 VDP_FDR_VID_GetOutReso(HI_U32 offset)
{
	U_VPSS_OUT_SIZE VPSS_OUT_SIZE;
	VPSS_OUT_SIZE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VPSS_OUT_SIZE.u32) + offset));
	return VPSS_OUT_SIZE.u32;
}

HI_U32 VDP_FDR_VID_GetTunlAddr(HI_U32 offset)
{
	U_VID_WTUNL_ADDR_L VID_WTUNL_ADDR_L;
	VID_WTUNL_ADDR_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_WTUNL_ADDR_L.u32) + offset));
	return VID_WTUNL_ADDR_L.u32;
}

HI_VOID VDP_FDR_VID_SetVhdcaddrL(HI_U32 offset, HI_U32 vhdcaddr_l)
{
    U_VID_CADDR_L VID_CADDR_L;


    VID_CADDR_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_CADDR_L.u32) + offset));
    VID_CADDR_L.bits.vhdcaddr_l = vhdcaddr_l;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_CADDR_L.u32) + offset),VID_CADDR_L.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetChmStride(HI_U32 offset, HI_U32 chm_stride)
{
    U_VID_STRIDE VID_STRIDE;


    VID_STRIDE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_STRIDE.u32) + offset));
    VID_STRIDE.bits.chm_stride = chm_stride;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_STRIDE.u32) + offset),VID_STRIDE.u32);

    return ;
}


HI_VOID VDP_FDR_VID_SetLmStride(HI_U32 offset, HI_U32 lm_stride)
{
    U_VID_STRIDE VID_STRIDE;


    VID_STRIDE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_STRIDE.u32) + offset));
    VID_STRIDE.bits.lm_stride = lm_stride;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_STRIDE.u32) + offset),VID_STRIDE.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetChecksumEn(HI_U32 offset, HI_U32 checksum_en)
{
    U_VID_DEBUG_CTRL VID_DEBUG_CTRL;

    VID_DEBUG_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DEBUG_CTRL.u32) + offset));
    VID_DEBUG_CTRL.bits.checksum_en = checksum_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DEBUG_CTRL.u32) + offset),VID_DEBUG_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_VID_SetWTunlEn(HI_U32 offset, HI_U32 wtunl_en)
{
    U_VID_WTUNL_CTRL VID_WTUNL_CTRL;

    VID_WTUNL_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_WTUNL_CTRL.u32) + offset));
    VID_WTUNL_CTRL.bits.wtunl_en = wtunl_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_WTUNL_CTRL.u32) + offset),VID_WTUNL_CTRL.u32);

    return ;
}

//--------------------------------------------
// gfx fdr driver
//--------------------------------------------
HI_VOID VDP_FDR_GFX_SetReqLen(HI_U32 offset, HI_U32 req_len)
{
    U_GFX_MAC_CTRL GFX_MAC_CTRL;


    GFX_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->GFX_MAC_CTRL.u32) + offset));
    GFX_MAC_CTRL.bits.req_len = req_len;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->GFX_MAC_CTRL.u32) + offset),GFX_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_GFX_SetReqCtrl(HI_U32 offset, HI_U32 req_ctrl)
{
    U_GFX_MAC_CTRL GFX_MAC_CTRL;


    GFX_MAC_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->GFX_MAC_CTRL.u32) + offset));
    GFX_MAC_CTRL.bits.req_ctrl = req_ctrl;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->GFX_MAC_CTRL.u32) + offset),GFX_MAC_CTRL.u32);

    return ;
}

HI_VOID VDP_FDR_GFX_SetChecksumEn(HI_U32 offset, HI_U32 checksum_en)
{
    U_GFX_DEBUG_CTRL GFX_DEBUG_CTRL;

    GFX_DEBUG_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->GFX_DEBUG_CTRL.u32) + offset));
    GFX_DEBUG_CTRL.bits.checksum_en = checksum_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->GFX_DEBUG_CTRL.u32) + offset),GFX_DEBUG_CTRL.u32);

    return ;
}

HI_U32 VDP_FDR_VF_GetSrcOutReso(HI_U32 offset, VDP_RECT_S *pstSrcRect)
{
    U_VF_VID_SRC_RESO VF_VID_SRC_RESO;
    VF_VID_SRC_RESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_SRC_RESO.u32) + offset));

    pstSrcRect->u32X   = 0;
    pstSrcRect->u32Y   = 0;
    pstSrcRect->u32Wth = VF_VID_SRC_RESO.bits.src_w + 1;
    pstSrcRect->u32Hgt = VF_VID_SRC_RESO.bits.src_h + 1;

    return HI_SUCCESS;
}


HI_U32 VDP_FDR_VF_GetSrcCropSize(HI_U32 offset, VDP_RECT_S *pstSrcCrop)
{
    U_VF_VID_SRC_CROP VF_VID_SRC_CROP;
    U_VF_VID_IN_RESO  VF_VID_IN_RESO;

    VF_VID_SRC_CROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_SRC_CROP.u32) + offset));
    VF_VID_IN_RESO.u32  = VDP_RegRead(((HI_ULONG)&(pVdpReg->VF_VID_IN_RESO.u32) + offset));

    pstSrcCrop->u32X   = VF_VID_SRC_CROP.bits.src_crop_x;
    pstSrcCrop->u32Y   = VF_VID_SRC_CROP.bits.src_crop_y;
    pstSrcCrop->u32Wth = VF_VID_IN_RESO.bits.ireso_w + 1;
    pstSrcCrop->u32Hgt = VF_VID_IN_RESO.bits.ireso_h + 1;

    return HI_SUCCESS;
}

