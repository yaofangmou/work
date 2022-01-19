#include "vdp_hal_comm.h"
#include "vdp_hal_vid.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

#ifndef __DISP_PLATFORM_BOOT__
HI_VOID  VDP_VID_SetZmeOutReso(HI_U32 u32Data, VDP_RECT_S  stRect)
{
    U_V0_ZME_ORESO  V0_ZME_ORESO;

    V0_ZME_ORESO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ZME_ORESO.u32)));
    V0_ZME_ORESO.bits.ow = stRect.u32Wth - 1;
    V0_ZME_ORESO.bits.oh = stRect.u32Hgt - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ZME_ORESO.u32)), V0_ZME_ORESO.u32);

    return ;
}

HI_VOID  VDP_VID_SetLayerEnable(HI_U32 u32Data, HI_U32 u32bEnable )
{
    U_V0_CTRL V0_CTRL;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));

    V0_CTRL.bits.surface_en = u32bEnable ;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET), V0_CTRL.u32);

    return ;
}

HI_VOID  VDP_VID_GetLayerEnable(HI_U32 u32Data, HI_U32 *pu32bEnable)
{
    U_V0_CTRL V0_CTRL;
    V0_CTRL.u32  = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));

    *pu32bEnable = V0_CTRL.bits.surface_en;
    return ;
}

HI_VOID  VDP_VID_SetVideoPos(HI_U32 u32Data, VDP_RECT_S  stRect)
{
    U_V0_VFPOS V0_VFPOS;
    U_V0_VLPOS V0_VLPOS;

    /*video position */
    V0_VFPOS.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VFPOS.u32) + u32Data * VID_OFFSET));
    V0_VFPOS.bits.video_xfpos = stRect.u32X;
    V0_VFPOS.bits.video_yfpos = stRect.u32Y;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VFPOS.u32) + u32Data * VID_OFFSET), V0_VFPOS.u32);

    V0_VLPOS.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VLPOS.u32) + u32Data * VID_OFFSET));
    V0_VLPOS.bits.video_xlpos = stRect.u32X + stRect.u32Wth - 1;
    V0_VLPOS.bits.video_ylpos = stRect.u32Y + stRect.u32Hgt - 1;

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VLPOS.u32) + u32Data * VID_OFFSET), V0_VLPOS.u32);
    return ;
}

HI_VOID  VDP_VID_SetDispPos(HI_U32 u32Data, VDP_RECT_S  stRect)
{
    U_V0_DFPOS V0_DFPOS;
    U_V0_DLPOS V0_DLPOS;

    /*video position */
    V0_DFPOS.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_DFPOS.u32) + u32Data * VID_OFFSET));
    V0_DFPOS.bits.disp_xfpos = stRect.u32X;
    V0_DFPOS.bits.disp_yfpos = stRect.u32Y;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_DFPOS.u32) + u32Data * VID_OFFSET), V0_DFPOS.u32);

    V0_DLPOS.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_DLPOS.u32) + u32Data * VID_OFFSET));
    V0_DLPOS.bits.disp_xlpos = stRect.u32X + stRect.u32Wth - 1;
    V0_DLPOS.bits.disp_ylpos = stRect.u32Y + stRect.u32Hgt - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_DLPOS.u32) + u32Data * VID_OFFSET), V0_DLPOS.u32);
    return ;
}

HI_VOID  VDP_VID_SetIfirCoef(HI_U32 u32Data, HI_S32 * s32Coef)
{
    U_V0_HFIRCOEF01 V0_HFIRCOEF01;
    U_V0_HFIRCOEF23 V0_HFIRCOEF23;
    U_V0_HFIRCOEF45 V0_HFIRCOEF45;
    U_V0_HFIRCOEF67 V0_HFIRCOEF67;

    V0_HFIRCOEF01.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF01.u32) + u32Data * VID_HFIR_OFFSET));
    V0_HFIRCOEF23.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF23.u32) + u32Data * VID_HFIR_OFFSET));
    V0_HFIRCOEF45.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF45.u32) + u32Data * VID_HFIR_OFFSET));
    V0_HFIRCOEF67.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF67.u32) + u32Data * VID_HFIR_OFFSET));

    if(u32Data == VDP_LAYER_VID0)
    {
        V0_HFIRCOEF01.bits.coef0 = s32Coef[0];
        V0_HFIRCOEF01.bits.coef1 = s32Coef[1];
        V0_HFIRCOEF23.bits.coef2 = s32Coef[2];
        V0_HFIRCOEF23.bits.coef3 = s32Coef[3];
        V0_HFIRCOEF45.bits.coef4 = s32Coef[4];
        V0_HFIRCOEF45.bits.coef5 = s32Coef[5];
        V0_HFIRCOEF67.bits.coef6 = s32Coef[6];
        V0_HFIRCOEF67.bits.coef7 = s32Coef[7];
    }
    else
    {
        V0_HFIRCOEF01.bits.coef0 = s32Coef[7];
        V0_HFIRCOEF01.bits.coef1 = s32Coef[6];
        V0_HFIRCOEF23.bits.coef2 = s32Coef[2];
        V0_HFIRCOEF23.bits.coef3 = s32Coef[3];
        V0_HFIRCOEF45.bits.coef4 = s32Coef[4];
        V0_HFIRCOEF45.bits.coef5 = s32Coef[5];
        V0_HFIRCOEF67.bits.coef6 = s32Coef[0];
        V0_HFIRCOEF67.bits.coef7 = s32Coef[1];
    }

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF01.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIRCOEF01.u32);
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF23.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIRCOEF23.u32);
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF45.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIRCOEF45.u32);
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIRCOEF67.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIRCOEF67.u32);

    return ;
}

HI_VOID  VDP_VID_SetLayerGalpha(HI_U32 u32Data, HI_U32 u32Alpha0)
{
    U_V0_CTRL V0_CTRL;

    V0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));
    V0_CTRL.bits.galpha = u32Alpha0;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET), V0_CTRL.u32);

    return ;
}

HI_VOID  VDP_VID_SetFCropEn(HI_U32 u32Data, HI_U32 u32CropEn)
{
    U_V0_CCROP V0_CCROP;

    V0_CCROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_CCROP.u32) + u32Data * VID_OFFSET));
    V0_CCROP.bits.crop_en  = u32CropEn;

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_CCROP.u32) + u32Data * VID_OFFSET), V0_CCROP.u32);
    return ;
}

HI_VOID  VDP_VID_SetFCropReso(HI_U32 u32Data, VDP_RECT_S stRect)
{
    U_V0_FCROP V0_FCROP;
    U_V0_LCROP V0_LCROP;

    V0_FCROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_FCROP.u32) + u32Data * VID_OFFSET));
    V0_FCROP.bits.wfcrop  = stRect.u32X;
    V0_FCROP.bits.hfcrop  = stRect.u32Y;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_FCROP.u32) + u32Data * VID_OFFSET), V0_FCROP.u32);

    V0_LCROP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_LCROP.u32) + u32Data * VID_OFFSET));
    V0_LCROP.bits.wlcrop  = stRect.u32X + stRect.u32Wth - 1;
    V0_LCROP.bits.hlcrop  = stRect.u32Y + stRect.u32Hgt - 1;

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_LCROP.u32) + u32Data * VID_OFFSET), V0_LCROP.u32);

    return ;
}

HI_VOID  VDP_VID_SetLayerBkg(HI_U32 u32Data, VDP_BKG_S stBkg)
{
    U_V0_BK    V0_BK;
    U_V0_ALPHA V0_ALPHA;

    V0_BK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_BK.u32) + u32Data * VID_OFFSET));
    V0_BK.bits.vbk_y  = stBkg.u32BkgY;
    V0_BK.bits.vbk_cb = stBkg.u32BkgU;
    V0_BK.bits.vbk_cr = stBkg.u32BkgV;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_BK.u32) + u32Data * VID_OFFSET), V0_BK.u32);

    V0_ALPHA.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ALPHA.u32) + u32Data * VID_OFFSET));
    V0_ALPHA.bits.vbk_alpha = stBkg.u32BkgA;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ALPHA.u32) + u32Data * VID_OFFSET), V0_ALPHA.u32);

    return;
}

HI_VOID  VDP_VID_SetLayerMute(HI_U32 u32Data, HI_BOOL bEnable)
{
    U_V0_MUTE_BK    V0_MUTE_BK;

    V0_MUTE_BK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_MUTE_BK.u32) + u32Data * VID_OFFSET));
    V0_MUTE_BK.bits.mute_en  = bEnable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_MUTE_BK.u32) + u32Data * VID_OFFSET), V0_MUTE_BK.u32);

    return;
}

HI_VOID  VDP_VID_SetRegUp(HI_U32 u32Data)
{
    U_V0_UPD V0_UPD;

    /* VHD layer register update */
    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_UPD.bits.regup = 0x1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_UPD.u32) + u32Data * VID_OFFSET), V0_UPD.u32);

    return ;
}

HI_VOID VDP_VID_SetZmeHorRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    U_V0_HSP V0_HSP;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
    V0_HSP.bits.hratio = u32Ratio;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);

    return ;
}

HI_VOID  VDP_VID_SetZmeVerRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    U_V0_VSR V0_VSR;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_VSR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VSR.u32) + u32Data * VID_OFFSET));
    V0_VSR.bits.vratio = u32Ratio;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VSR.u32) + u32Data * VID_OFFSET), V0_VSR.u32);

    return ;
}
#endif

HI_VOID  VDP_SetParaUpMode(HI_U32 u32Data,HI_U32 u32Mode)
{
    U_V0_CTRL V0_CTRL;

    V0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET));
    V0_CTRL.bits.vup_mode = u32Mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_CTRL.u32) + u32Data * VID_OFFSET), V0_CTRL.u32);

    return ;
}

HI_VOID VDP_VID_SetIfirMode(HI_U32 u32Data, VDP_IFIRMODE_E enMode)
{
    U_V0_HFIR_CTRL V0_HFIR_CTRL;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    V0_HFIR_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIR_CTRL.u32) + u32Data * VID_HFIR_OFFSET));
    V0_HFIR_CTRL.bits.hfir_mode = enMode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIR_CTRL.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIR_CTRL.u32);
     return ;
}

HI_VOID VDP_VID_SetIfirCkGtEn(HI_U32 u32Data, HI_U32 u32En)
{
    U_V0_HFIR_CTRL V0_HFIR_CTRL;

    V0_HFIR_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HFIR_CTRL.u32) + u32Data * VID_HFIR_OFFSET));
    V0_HFIR_CTRL.bits.ck_gt_en  = u32En;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HFIR_CTRL.u32) + u32Data * VID_HFIR_OFFSET), V0_HFIR_CTRL.u32);
    return ;
}

HI_VOID  VDP_VID_SetZmeEnable   (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable)
{
    U_V0_HSP V0_HSP;
    U_V0_VSP V0_VSP;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    /* VHD layer zoom enable */
    if((enMode == VDP_ZME_MODE_HORL)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hlmsc_en = u32bEnable;
        V0_HSP.bits.hlfir_en = 1;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }
    if((enMode == VDP_ZME_MODE_HORC)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hchmsc_en = u32bEnable;
        V0_HSP.bits.hchfir_en = 1;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }
    if((enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vlmsc_en = u32bEnable;
        V0_VSP.bits.vlfir_en = 1;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }
    if((enMode == VDP_ZME_MODE_VERC)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vchmsc_en = u32bEnable;
        V0_VSP.bits.vchfir_en = 1;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }
    return;
}

HI_VOID  VDP_VID_SetZmeShootCtrlEnable  (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable,HI_U32 u32bMode)
{
    U_V0_ZME_SHOOTCTRL_HL V0_ZME_SHOOTCTRL_HL;
    U_V0_ZME_SHOOTCTRL_VL V0_ZME_SHOOTCTRL_VL;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    if(u32Data != VDP_LAYER_VID0)
    {
        VDP_PRINT("error ID\n");
        return;
    }

    /* VHD layer zoom enable */
    if((enMode == VDP_ZME_MODE_HORL)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_ZME_SHOOTCTRL_HL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_HL.u32) + u32Data * VID_OFFSET));
        V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_en   = u32bEnable;
        V0_ZME_SHOOTCTRL_HL.bits.hl_shootctrl_mode = u32bMode;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_HL.u32) + u32Data * VID_OFFSET), V0_ZME_SHOOTCTRL_HL.u32);
    }
    if((enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_ZME_SHOOTCTRL_VL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_VL.u32) + u32Data * VID_OFFSET));
        V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_en   = u32bEnable;
        V0_ZME_SHOOTCTRL_VL.bits.vl_shootctrl_mode = u32bMode;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_VL.u32) + u32Data * VID_OFFSET), V0_ZME_SHOOTCTRL_VL.u32);
    }
    return ;
}


HI_VOID  VDP_VID_SetZmeShootCtrlPara  (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32Flatdect_mode,HI_U32 u32Coringadj_en,HI_U32 u32Gain,HI_U32 u32Coring)
{
    U_V0_ZME_SHOOTCTRL_HL V0_ZME_SHOOTCTRL_HL;
    U_V0_ZME_SHOOTCTRL_VL V0_ZME_SHOOTCTRL_VL;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    if(u32Data != VDP_LAYER_VID0)
    {
        VDP_PRINT("error ID\n");
        return;
    }

    /* VHD layer zoom enable */
    if((enMode == VDP_ZME_MODE_HORL)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_ZME_SHOOTCTRL_HL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_HL.u32) + u32Data * VID_OFFSET));
        V0_ZME_SHOOTCTRL_HL.bits.hl_flatdect_mode  = u32Flatdect_mode;
        V0_ZME_SHOOTCTRL_HL.bits.hl_coringadj_en   = u32Coringadj_en;
        V0_ZME_SHOOTCTRL_HL.bits.hl_gain           = u32Gain;
        V0_ZME_SHOOTCTRL_HL.bits.hl_coring         = u32Coring;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_HL.u32) + u32Data * VID_OFFSET), V0_ZME_SHOOTCTRL_HL.u32);
    }
    if((enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_ZME_SHOOTCTRL_VL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_VL.u32) + u32Data * VID_OFFSET));
        V0_ZME_SHOOTCTRL_VL.bits.vl_flatdect_mode  = u32Flatdect_mode;
        V0_ZME_SHOOTCTRL_VL.bits.vl_coringadj_en   = u32Coringadj_en;
        V0_ZME_SHOOTCTRL_VL.bits.vl_gain           = u32Gain;
        V0_ZME_SHOOTCTRL_VL.bits.vl_coring         = u32Coring;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_ZME_SHOOTCTRL_VL.u32) + u32Data * VID_OFFSET), V0_ZME_SHOOTCTRL_VL.u32);
    }
    return ;
}

HI_VOID  VDP_VID_SetZmePhase    (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_S32 s32Phase)
{
    U_V0_HLOFFSET  V0_HLOFFSET;
    U_V0_HCOFFSET  V0_HCOFFSET;
    U_V0_VOFFSET   V0_VOFFSET;
    U_V0_VBOFFSET  V0_VBOFFSET;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    /* VHD layer zoom enable */
    if((enMode == VDP_ZME_MODE_HORL) || (enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HLOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HLOFFSET.u32) + u32Data * VID_OFFSET));
        V0_HLOFFSET.bits.hor_loffset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HLOFFSET.u32) + u32Data * VID_OFFSET), V0_HLOFFSET.u32);
    }

    if((enMode == VDP_ZME_MODE_HORC) || (enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HCOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HCOFFSET.u32) + u32Data * VID_OFFSET));
        V0_HCOFFSET.bits.hor_coffset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HCOFFSET.u32) + u32Data * VID_OFFSET), V0_HCOFFSET.u32);
    }

    if((enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VOFFSET.u32) + u32Data * VID_OFFSET));
        V0_VOFFSET.bits.vluma_offset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VOFFSET.u32) + u32Data * VID_OFFSET), V0_VOFFSET.u32);
    }

    if((enMode == VDP_ZME_MODE_VERC)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VOFFSET.u32) + u32Data * VID_OFFSET));
        V0_VOFFSET.bits.vchroma_offset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VOFFSET.u32) + u32Data * VID_OFFSET), V0_VOFFSET.u32);
    }

    if((enMode == VDP_ZME_MODE_VERB)||(enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VBOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VBOFFSET.u32) + u32Data * VID_OFFSET));
        V0_VBOFFSET.bits.vbluma_offset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VBOFFSET.u32) + u32Data * VID_OFFSET), V0_VBOFFSET.u32);
    }

    if((enMode == VDP_ZME_MODE_VERB)||(enMode == VDP_ZME_MODE_VERC)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VBOFFSET.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VBOFFSET.u32) + u32Data * VID_OFFSET));
        V0_VBOFFSET.bits.vbchroma_offset = s32Phase;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VBOFFSET.u32) + u32Data * VID_OFFSET), V0_VBOFFSET.u32);
    }

    return ;
}

HI_VOID  VDP_VID_SetZmeFirEnable(HI_U32 u32Data, VDP_ZME_MODE_E enMode, HI_U32 u32bEnable)
{
    U_V0_HSP V0_HSP;
    U_V0_VSP V0_VSP;

    if(u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    if((enMode == VDP_ZME_MODE_HORL)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hlfir_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }

    if((enMode == VDP_ZME_MODE_HORC)||(enMode == VDP_ZME_MODE_HOR)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hchfir_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }

    if((enMode == VDP_ZME_MODE_VERL)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vlfir_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }

    if((enMode == VDP_ZME_MODE_VERC)||(enMode == VDP_ZME_MODE_VER)||(enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vchfir_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }

    return ;
}

HI_VOID  VDP_VID_SetZmeMidEnable   (HI_U32 u32Data, VDP_ZME_MODE_E enMode,HI_U32 u32bEnable)
{
    U_V0_HSP V0_HSP;
    U_V0_VSP V0_VSP;

    if (u32Data >= VID_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    /* VHD layer zoom enable */
    if ((enMode == VDP_ZME_MODE_HORL) || (enMode == VDP_ZME_MODE_HOR) || (enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hlmid_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG) & (pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }

    if ((enMode == VDP_ZME_MODE_HORC) || (enMode == VDP_ZME_MODE_HOR) || (enMode == VDP_ZME_MODE_ALL))
    {
        V0_HSP.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET));
        V0_HSP.bits.hchmid_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG) & (pVdpReg->V0_HSP.u32) + u32Data * VID_OFFSET), V0_HSP.u32);
    }
    if ((enMode == VDP_ZME_MODE_VERL) || (enMode == VDP_ZME_MODE_VER) || (enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vlmid_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG) & (pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }

    if ((enMode == VDP_ZME_MODE_VERC) || (enMode == VDP_ZME_MODE_VER) || (enMode == VDP_ZME_MODE_ALL))
    {
        V0_VSP.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET));
        V0_VSP.bits.vchmid_en = u32bEnable;
        VDP_RegWrite(((HI_ULONG) & (pVdpReg->V0_VSP.u32) + u32Data * VID_OFFSET), V0_VSP.u32);
    }
    return ;
}
