#include "vdp_hal_comm.h"
#include "vdp_hal_chn.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_DISP_SetUfOffineEn  (HI_U32 u32hd_id, HI_U32 u32UfOfflineEn)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.uf_offline_en = u32UfOfflineEn;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetDispMode  (HI_U32 u32hd_id, HI_U32 u32DispMode)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.disp_mode = u32DispMode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetTriggerEn  (HI_U32 u32hd_id, HI_U32 u32Data)
{
    U_DHD0_CTRL DHD0_CTRL          ;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.trigger_en = u32Data;
    VDP_RegWrite((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetHdSyncEn  (HI_U32 u32hd_id, HI_U32 u32Data)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.hd_sync_en = u32Data;
    VDP_RegWrite((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetFrmThd  (HI_U32 u32hd_id, HI_U32 u32Data)
{
    U_DHD0_FRM_THD DHD0_FRM_THD;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_FRM_THD.u32 = VDP_RegRead((HI_ULONG)(&(pVdpReg->DHD0_FRM_THD.u32)+u32hd_id*CHN_OFFSET));
    DHD0_FRM_THD.bits.frm_sync_thd = u32Data;
    VDP_RegWrite((HI_ULONG)(&(pVdpReg->DHD0_FRM_THD.u32)+u32hd_id*CHN_OFFSET),DHD0_FRM_THD.u32);
}

HI_VOID VDP_DISP_SetHdmiMode  (HI_U32 u32hd_id, HI_U32 u32hdmi_md)
{
   U_INTF_HDMI_CTRL INTF_HDMI_CTRL;

   INTF_HDMI_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->INTF_HDMI_CTRL.u32)+u32hd_id*CHN_OFFSET));
   INTF_HDMI_CTRL.bits.rgb_mode = (u32hdmi_md != 0) ? 0 : 1;
   VDP_RegWrite(((HI_ULONG)&(pVdpReg->INTF_HDMI_CTRL.u32)+u32hd_id*CHN_OFFSET),INTF_HDMI_CTRL.u32);
   return;
}

HI_VOID VDP_DISP_SetHdmi420Enable  (HI_U32 u32hd_id, HI_U32 u32Enable)
{
#if 0
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.hdmi420_en = u32Enable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
#endif
}

HI_VOID VDP_DISP_SetHdmi420CSel  (HI_U32 u32hd_id, HI_U32 u32Csel)
{
#if 0
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.hdmi420c_sel = u32Csel;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
#endif
}

HI_VOID VDP_DISP_SetRegUp (HI_U32 u32hd_id)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.regup = 0x1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetIntfEnable(HI_U32 u32hd_id, HI_U32 bTrue)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.intf_en = bTrue;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
    VDP_DISP_SetRegUp(u32hd_id);

    return;
}

HI_VOID VDP_DISP_SetIntfCbarEnable(HI_U32 u32hd_id, HI_U32 bTrue)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.cbar_en = bTrue;
    DHD0_CTRL.bits.cbar_sel= bTrue;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);

    VDP_DISP_SetRegUp(u32hd_id);
}

HI_VOID VDP_DISP_SetSplitMode  (HI_U32 u32hd_id, HI_U32 u32SplitMode)
{
    U_DHD0_CTRL1     DHD0_CTRL1;

    DHD0_CTRL1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL1.u32)));

    if(u32SplitMode == VDP_SPLIT_MODE_4P_1SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 2;
        DHD0_CTRL1.bits.multichn_split_mode  = 2;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_4P_4SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 2;
        DHD0_CTRL1.bits.multichn_split_mode  = 3;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_4P_2SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 2;
        DHD0_CTRL1.bits.multichn_split_mode  = 1;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_2P_1SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 1;
        DHD0_CTRL1.bits.multichn_split_mode  = 0;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_2P_2SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 1;
        DHD0_CTRL1.bits.multichn_split_mode  = 1;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_2P_ODDEVEN)
    {
        DHD0_CTRL1.bits.multichn_en        = 1;
        DHD0_CTRL1.bits.multichn_split_mode  = 0;
    }
    else if(u32SplitMode == VDP_SPLIT_MODE_1P_1SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 0;
        DHD0_CTRL1.bits.multichn_split_mode  = 4;
    }
    if(u32SplitMode == VDP_SPLIT_MODE_4P_2SPLIT)
    {
        DHD0_CTRL1.bits.multichn_en        = 2;
        DHD0_CTRL1.bits.multichn_split_mode  = 1;
    }

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL1.u32)), DHD0_CTRL1.u32);

}

HI_VOID VDP_DISP_SetIntMask  (HI_U32 u32masktypeen)
{
    U_VOINTMSK VOINTMSK;

    /* Dispaly interrupt mask enable */
    VOINTMSK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VOINTMSK.u32)));
    VOINTMSK.u32 = VOINTMSK.u32 | u32masktypeen;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VOINTMSK.u32)), VOINTMSK.u32);

    return ;
}

HI_VOID VDP_DISP_SetVPSSIntMask  (HI_U32 u32masktypeen)
{
    U_OFFLINE_INTMSK OFFLINE_INTMSK;
    OFFLINE_INTMSK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->OFFLINE_INTMSK.u32)));
    OFFLINE_INTMSK.u32 = OFFLINE_INTMSK.u32 | u32masktypeen;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->OFFLINE_INTMSK.u32)), OFFLINE_INTMSK.u32);
    return ;
}

HI_VOID VDP_DISP_ClearVPSSIntMask  (HI_U32 u32masktypeen)
{
    U_OFFLINE_INTMSK OFFLINE_INTMSK;
    OFFLINE_INTMSK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->OFFLINE_INTMSK.u32)));
    OFFLINE_INTMSK.u32 = OFFLINE_INTMSK.u32 & (~u32masktypeen);
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->OFFLINE_INTMSK.u32)), OFFLINE_INTMSK.u32);
    return ;
}

HI_VOID VDP_DISP_ClearIntMask  (HI_U32 u32masktypeen)
{
    U_VOINTMSK  VOINTMSK;

    /* Dispaly interrupt mask enable */
    VOINTMSK.u32 = u32masktypeen;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VOINTMSK.u32)), VOINTMSK.u32);
    return ;
}

HI_VOID  VDP_DISP_SetIntDisable(HI_U32 u32masktypeen)
{
    U_VOINTMSK VOINTMSK;

    /* Dispaly interrupt mask enable */
    VOINTMSK.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VOINTMSK.u32)));
    VOINTMSK.u32 = VOINTMSK.u32 & (~u32masktypeen);
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VOINTMSK.u32), VOINTMSK.u32);

    return ;
}

HI_VOID VDP_DISP_SetOflIntMask  (HI_U32 u32masktypeen)
{
    VDP_PRINT("98mv310 Nousing!\n");
    return ;
}

HI_VOID  VDP_DISP_SetOflIntDisable(HI_U32 u32masktypeen)
{
    VDP_PRINT("98mv310 Nousing!\n");
    return ;
}

HI_VOID  VDP_DISP_BfmClkSel(HI_U32 u32Num)
{
    U_VODEBUG  VODEBUG ;
    /* Dispaly interrupt mask enable */
    VODEBUG.u32        = VDP_RegRead(((HI_ULONG)&(pVdpReg->VODEBUG.u32)));
    VODEBUG.bits.bfm_clk_sel = u32Num;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VODEBUG.u32), VODEBUG.u32);
    return ;
}

HI_VOID  VDP_DISP_OpenIntf(HI_U32 u32hd_id,VDP_DISP_SYNCINFO_S stSyncInfo)
{
    U_DHD0_CTRL DHD0_CTRL;
    U_DHD0_VSYNC1 DHD0_VSYNC1;
    U_DHD0_VSYNC2 DHD0_VSYNC2;
    U_DHD0_VPLUS1 DHD0_VPLUS1;
    U_DHD0_VPLUS2 DHD0_VPLUS2;
    U_DHD0_PWR DHD0_PWR;
    U_DHD0_HSYNC1 DHD0_HSYNC1;
    U_DHD0_HSYNC2 DHD0_HSYNC2;

    if (u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.iop   = stSyncInfo.bIop;//
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);


    DHD0_HSYNC1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_HSYNC1.u32)+u32hd_id*CHN_OFFSET));
    DHD0_HSYNC2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_HSYNC2.u32)+u32hd_id*CHN_OFFSET));
    DHD0_HSYNC1.bits.hact = stSyncInfo.u32Hact -1;
    DHD0_HSYNC1.bits.hbb  = stSyncInfo.u32Hbb -1;
    DHD0_HSYNC2.bits.hfb  = stSyncInfo.u32Hfb -1;
    DHD0_HSYNC2.bits.hmid = (stSyncInfo.u32Hmid == 0) ? 0 : stSyncInfo.u32Hmid -1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_HSYNC1.u32)+u32hd_id*CHN_OFFSET), DHD0_HSYNC1.u32);
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_HSYNC2.u32)+u32hd_id*CHN_OFFSET), DHD0_HSYNC2.u32);

    //Config VHD interface veritical timming
    DHD0_VSYNC1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VSYNC1.u32)+u32hd_id*CHN_OFFSET));
    DHD0_VSYNC1.bits.vact = stSyncInfo.u32Vact  -1;
    DHD0_VSYNC1.bits.vbb = stSyncInfo.u32Vbb - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VSYNC1.u32)+u32hd_id*CHN_OFFSET), DHD0_VSYNC1.u32);

    DHD0_VSYNC2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VSYNC2.u32)+u32hd_id*CHN_OFFSET));
    DHD0_VSYNC2.bits.vfb =  stSyncInfo.u32Vfb - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VSYNC2.u32)+u32hd_id*CHN_OFFSET), DHD0_VSYNC2.u32);

    //Config VHD interface veritical bottom timming,no use in progressive mode
    DHD0_VPLUS1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VPLUS1.u32)+u32hd_id*CHN_OFFSET));
    DHD0_VPLUS1.bits.bvact = stSyncInfo.u32Bvact - 1;
    DHD0_VPLUS1.bits.bvbb =  stSyncInfo.u32Bvbb - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VPLUS1.u32)+u32hd_id*CHN_OFFSET), DHD0_VPLUS1.u32);

    DHD0_VPLUS2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VPLUS2.u32)+u32hd_id*CHN_OFFSET));
    DHD0_VPLUS2.bits.bvfb =  stSyncInfo.u32Bvfb - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VPLUS2.u32)+u32hd_id*CHN_OFFSET), DHD0_VPLUS2.u32);

    //Config VHD interface veritical bottom timming,
    DHD0_PWR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_PWR.u32)+u32hd_id*CHN_OFFSET));
    DHD0_PWR.bits.hpw = stSyncInfo.u32Hpw - 1;
    DHD0_PWR.bits.vpw = stSyncInfo.u32Vpw - 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_PWR.u32)+u32hd_id*CHN_OFFSET), DHD0_PWR.u32);
}

HI_VOID VDP_DISP_SetSyncInv(HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, VDP_DISP_SYNCINV_S enInv)
{
    U_INTF_HDMI_SYNC_INV INTF_HDMI_SYNC_INV;
    U_INTF_DATE_SYNC_INV INTF_DATE_SYNC_INV;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    switch(enIntf)
    {
        case VDP_DISP_INTF_HDDATE:
        case VDP_DISP_INTF_SDDATE:
        {
            INTF_DATE_SYNC_INV.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->INTF_DATE_SYNC_INV.u32)+0*CHN_OFFSET));
            INTF_DATE_SYNC_INV.bits.f_inv  = enInv.u32FdInv;
            INTF_DATE_SYNC_INV.bits.vs_inv = enInv.u32VsInv;
            INTF_DATE_SYNC_INV.bits.hs_inv = enInv.u32HsInv;
            INTF_DATE_SYNC_INV.bits.dv_inv = enInv.u32DvInv;
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->INTF_DATE_SYNC_INV.u32)+0*CHN_OFFSET),INTF_DATE_SYNC_INV.u32);

            break;
        }
        case VDP_DISP_INTF_HDMI:
        {
            INTF_HDMI_SYNC_INV.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->INTF_HDMI_SYNC_INV.u32)+0*CHN_OFFSET));
            INTF_HDMI_SYNC_INV.bits.vs_inv = enInv.u32VsInv;
            INTF_HDMI_SYNC_INV.bits.hs_inv = enInv.u32HsInv;
            INTF_HDMI_SYNC_INV.bits.dv_inv = enInv.u32DvInv;
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->INTF_HDMI_SYNC_INV.u32)+0*CHN_OFFSET),INTF_HDMI_SYNC_INV.u32);

            break;
        }
        case VDP_DISP_INTF_VGA:
        {
            VDP_PRINT("98mv310 Nousing!\n");
            break;
        }
        case VDP_DISP_INTF_LCD:
        {
            VDP_PRINT("98mv310 Nousing!\n");
            break;
        }
        default:
        {
            VDP_PRINT("Error! DP_DISP_SetSyncInv Wrong Select\n");
            return ;
        }
    }
    return ;
}

HI_VOID  VDP_DISP_SetIntfMuxSel(HI_U32 u32hd_id,VDP_DISP_INTF_E enIntf)
{
    U_VO_MUX VO_MUX;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    switch(enIntf)
    {
        case VDP_DISP_INTF_LCD:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.digital_sel = u32hd_id*2;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        case VDP_DISP_INTF_BT1120:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.digital_sel = 1+u32hd_id*2;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        case VDP_DISP_INTF_HDMI:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.hdmi_sel = u32hd_id;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        case VDP_DISP_INTF_VGA:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.vga_sel = u32hd_id;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        case VDP_DISP_INTF_HDDATE:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.hddate_sel = u32hd_id;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        case VDP_DISP_INTF_SDDATE:
        {
            VO_MUX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VO_MUX.u32)));
            VO_MUX.bits.sddate_sel = u32hd_id;
            VDP_RegWrite((HI_ULONG)&(pVdpReg->VO_MUX.u32), VO_MUX.u32);

            break;
        }
        default:
        {
            VDP_PRINT("Error! VDP_DISP_SetIntfMuxSel Wrong Select\n");
            return ;
        }
    }
    return ;
}

HI_U32 VDP_DISP_GetIntSta(HI_U32 u32intmask)
{
    U_VOINTSTA VOINTSTA;

    /* read interrupt status */
    VOINTSTA.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VOINTSTA.u32)));

    return (VOINTSTA.u32 & u32intmask);
}



HI_VOID  VDP_DISP_ClearIntSta(HI_U32 u32intmask )
{
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VOMSKINTSTA.u32), u32intmask);
}

HI_VOID  VDP_DISP_ClearVPSSIntSta(HI_U32 u32intmask )
{
    VDP_RegWrite((HI_ULONG)&(pVdpReg->OFFLINE_MSKINTSTA.u32), u32intmask);
}

HI_U32 VDP_DISP_GetOflIntSta(HI_U32 u32intmask)
{
    VDP_PRINT("98mv310 Nousing!\n");
    return HI_SUCCESS;
}

HI_VOID VDP_DISP_SetVtThdMode(HI_U32 u32hd_id, HI_U32 u32uthdnum, HI_U32 u32mode)
{
    U_DHD0_VTTHD3 DHD0_VTTHD3;
    U_DHD0_VTTHD  DHD0_VTTHD;
    U_DHD0_VTTHD5 DHD0_VTTHD5;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    if(u32uthdnum == 1)//threshold 1 int mode
    {
        DHD0_VTTHD.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD.bits.thd1_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD.u32);
    }
    else if(u32uthdnum == 2)//threshold 2 int mode
    {
        DHD0_VTTHD.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD.bits.thd2_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD.u32);
    }
    else if(u32uthdnum == 3)//threshold 3 int mode
    {
        DHD0_VTTHD3.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD3.bits.thd3_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD3.u32);
    }
    else if(u32uthdnum == 4)//threshold 3 int mode
    {
        DHD0_VTTHD3.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD3.bits.thd4_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD3.u32);
    }
    else if(u32uthdnum == 5)//threshold 3 int mode
    {
        DHD0_VTTHD5.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD5.bits.thd5_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD5.u32);
    }
    else if(u32uthdnum == 6)//threshold 3 int mode
    {
        DHD0_VTTHD5.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD5.bits.thd6_mode = u32mode;// frame or field
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD5.u32);
    }
}

HI_VOID VDP_DISP_SetVtThd(HI_U32 u32hd_id, HI_U32 u32uthdnum, HI_U32 u32vtthd)
{

    U_DHD0_VTTHD DHD0_VTTHD;
    U_DHD0_VTTHD3 DHD0_VTTHD3;
    U_DHD0_VTTHD5 DHD0_VTTHD5;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    if(u32uthdnum == 1)
    {
        DHD0_VTTHD.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD.bits.vtmgthd1 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD.u32);
    }
    else if(u32uthdnum == 2)
    {
        DHD0_VTTHD.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD.bits.vtmgthd2 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD.u32);
    }
    else if(u32uthdnum== 3)
    {
        DHD0_VTTHD3.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD3.bits.vtmgthd3 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD3.u32);
    }
    else if(u32uthdnum== 4)
    {
        DHD0_VTTHD3.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD3.bits.vtmgthd4 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD3.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD3.u32);
    }
    else if(u32uthdnum== 5)
    {
        DHD0_VTTHD5.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD5.bits.vtmgthd5 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD5.u32);
    }
    else if(u32uthdnum== 6)
    {
        DHD0_VTTHD5.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET));
        DHD0_VTTHD5.bits.vtmgthd6 = u32vtthd;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_VTTHD5.u32)+u32hd_id*CHN_OFFSET), DHD0_VTTHD5.u32);
    }
}

HI_VOID VDP_DISP_SetCbarEnable(HI_U32 u32hd_id,HI_U32 bTrue)
{
    U_DHD0_CTRL DHD0_CTRL;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }
    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.cbar_en = bTrue;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetCbarSel(HI_U32 u32hd_id,HI_U32 u32_cbar_sel)
{
    U_DHD0_CTRL DHD0_CTRL;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }
    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.cbar_sel = u32_cbar_sel;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetCbarMode(HI_U32 u32hd_id,HI_U32 u32_cbar_mode)
{
    U_DHD0_CTRL DHD0_CTRL;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }
    DHD0_CTRL.u32 = VDP_RegRead((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.cbar_mode = u32_cbar_mode;
    VDP_RegWrite((HI_ULONG)(&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetDitherEnable(HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, HI_U32 u32Enable)
{
    VDP_PRINT("98mv310 Nousing!\n");
}


HI_VOID VDP_DISP_SetDitherRoundEnable(HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, HI_U32 u32Enable)
{
    VDP_PRINT("98mv310 Nousing!\n");
}

HI_VOID VDP_DISP_SetDitherMode  (HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, VDP_DITHER_E enDitherMode)
{
    VDP_PRINT("98mv310 Nousing!\n");
}

HI_VOID VDP_DISP_SetDitherCoef  (HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf, VDP_DITHER_COEF_S dither_coef)
{
    VDP_PRINT("98mv310 Nousing!\n");
}

HI_VOID  VDP_DISP_SetClipEnable  (HI_U32 u32hd_id, VDP_DISP_INTF_E enIntf)
{
    VDP_PRINT("98mv310 Nousing!\n");
}

HI_VOID  VDP_DISP_SetClipCoef (HI_U32 u32hd_id, VDP_DISP_INTF_E clipsel, VDP_DISP_CLIP_S stClipData)
{
#if 1
    U_INTF_HDMI_CLIP_L     INTF_HDMI_CLIP_L ;
    U_INTF_HDMI_CLIP_H     INTF_HDMI_CLIP_H ;
    U_DATE_CLIP0_L         DATE_CLIP0_L     ;
    U_DATE_CLIP0_H         DATE_CLIP0_H     ;

    if(clipsel == VDP_DISP_INTF_HDMI)
    {
        INTF_HDMI_CLIP_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->INTF_HDMI_CLIP_L.u32)+u32hd_id*CHN_OFFSET));
        INTF_HDMI_CLIP_L.bits.hdmi_clip_en  = stClipData.bClipEn;
        INTF_HDMI_CLIP_L.bits.hdmi_cl2 = stClipData.u32ClipLow_y;
        INTF_HDMI_CLIP_L.bits.hdmi_cl1 = stClipData.u32ClipLow_cb;
        INTF_HDMI_CLIP_L.bits.hdmi_cl0 = stClipData.u32ClipLow_cr;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->INTF_HDMI_CLIP_L.u32)+u32hd_id*CHN_OFFSET), INTF_HDMI_CLIP_L.u32);

        INTF_HDMI_CLIP_H.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->INTF_HDMI_CLIP_H.u32)+u32hd_id*CHN_OFFSET));
        INTF_HDMI_CLIP_H.bits.hdmi_ch2 = stClipData.u32ClipHigh_y;
        INTF_HDMI_CLIP_H.bits.hdmi_ch1 = stClipData.u32ClipHigh_cb;
        INTF_HDMI_CLIP_H.bits.hdmi_ch0 = stClipData.u32ClipHigh_cr;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->INTF_HDMI_CLIP_H.u32)+u32hd_id*CHN_OFFSET), INTF_HDMI_CLIP_H.u32);
    }

    //DATE
    else if(clipsel == VDP_DISP_INTF_SDDATE)
    {

        DATE_CLIP0_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DATE_CLIP0_L.u32)+u32hd_id*CHN_OFFSET));
        DATE_CLIP0_L.bits.clip_en  = stClipData.bClipEn;
        DATE_CLIP0_L.bits.clip_cl2 = stClipData.u32ClipLow_y;
        DATE_CLIP0_L.bits.clip_cl1 = stClipData.u32ClipLow_cb;
        DATE_CLIP0_L.bits.clip_cl0 = stClipData.u32ClipLow_cr;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DATE_CLIP0_L.u32)+u32hd_id*CHN_OFFSET), DATE_CLIP0_L.u32);

        DATE_CLIP0_H.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DATE_CLIP0_H.u32)+u32hd_id*CHN_OFFSET));
        DATE_CLIP0_H.bits.clip_ch2 = stClipData.u32ClipHigh_y;
        DATE_CLIP0_H.bits.clip_ch1 = stClipData.u32ClipHigh_cb;
        DATE_CLIP0_H.bits.clip_ch0 = stClipData.u32ClipHigh_cr;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->DATE_CLIP0_H.u32)+u32hd_id*CHN_OFFSET), DATE_CLIP0_H.u32);
    }
#endif
}

HI_VOID  VDP_DISP_SetCscEnable  (HI_U32 u32hd_id, HI_U32 enCSC)
{
    return;
}

HI_VOID   VDP_DISP_SetCscDcCoef(HI_U32 u32hd_id,VDP_CSC_DC_COEF_S stCscCoef)
{
    return;
}

HI_VOID   VDP_DISP_SetCscCoef(HI_U32 u32hd_id,VDP_CSC_COEF_S stCscCoef)
{
    return;
}

HI_VOID VDP_DISP_SetCscMode(HI_U32 u32hd_id, VDP_CSC_MODE_E enCscMode)
{
    VDP_PRINT("98mv310 Nousing!\n");

    return ;
}

HI_VOID VDP_DISP_SetGammaEnable(HI_U32 u32hd_id, HI_U32 u32GmmEn)
{
    U_DHD0_CTRL DHD0_CTRL;

    //Set Vou Dhd Channel Gamma Correct Enable
    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.gmm_en = u32GmmEn;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET), DHD0_CTRL.u32);
}
HI_VOID VDP_DISP_SetMirrorEnable(HI_U32 u32hd_id, HI_U32 u32MirrEn)
{
    U_DHD0_CTRL DHD0_CTRL;

    //Set Vou Dhd Channel Gamma Correct Enable
    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.mirror_en = 0;//u32MirrEn;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET), DHD0_CTRL.u32);
}

HI_VOID VDP_DISP_SetGammaAddr(HI_U32 u32hd_id, HI_U32 uGmmAddr)
{
    VDP_PRINT("98mv310 Nousing!\n");

}

HI_VOID  VDP_DISP_SetParaUpd (HI_U32 u32Data, VDP_DISP_PARA_E enMode)
{
    VDP_PRINT("98mv310 Nousing!\n");

    return ;
}


//mod me
HI_VOID VDP_DISP_SetProToInterEnable   (HI_U32 u32hd_id, HI_U32 u32Enable)
{
    U_DHD0_CTRL DHD0_CTRL;
    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CTRL.bits.p2i_en = 0;//u32Enable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32)+u32hd_id*CHN_OFFSET),DHD0_CTRL.u32);
}



HI_VOID VDP_DISP_SetPauseMode(HI_U32 u32hd_id, HI_U32 enable)
{
    U_DHD0_PAUSE DHD0_PAUSE;
    if(u32hd_id>=CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }
    DHD0_PAUSE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_PAUSE.u32)+u32hd_id*CHN_OFFSET));
    DHD0_PAUSE.bits.pause_mode = enable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_PAUSE.u32)+u32hd_id*CHN_OFFSET), DHD0_PAUSE.u32);
}

HI_VOID VDP_DISP_SetPreStartPos(HI_U32 pre_start_pos)
{
    U_DHD0_START_POS2 DHD0_START_POS2;

    DHD0_START_POS2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD0_START_POS2.u32));
    DHD0_START_POS2.bits.pre_start_pos = pre_start_pos;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD0_START_POS2.u32),DHD0_START_POS2.u32);

    return ;
}

HI_VOID VDP_DISP_SetPreStartLinePos(HI_U32 pre_start_line_pos)
{
    U_DHD0_START_POS2 DHD0_START_POS2;

    DHD0_START_POS2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD0_START_POS2.u32));
    DHD0_START_POS2.bits.pre_start_line_pos = pre_start_line_pos;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD0_START_POS2.u32),DHD0_START_POS2.u32);

    return ;
}

HI_VOID VDP_DISP_SetStartPos (HI_U32 u32Data, HI_U32 u32StartPos)
{
    U_DHD0_START_POS   DHD0_START_POS;

    if(u32Data >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_START_POS.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_START_POS.u32)+u32Data*CHN_OFFSET));
    DHD0_START_POS.bits.start_pos = u32StartPos;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_START_POS.u32)+u32Data*CHN_OFFSET),DHD0_START_POS.u32);
}

HI_VOID VDP_DISP_SetParaLoadPos (HI_U32 u32Data, HI_U32 u32StartPos)
{
    U_DHD0_PARATHD   DHD0_PARATHD;

    if(u32Data >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_PARATHD.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_PARATHD.u32)+u32Data*CHN_OFFSET));
    DHD0_PARATHD.bits.para_thd = u32StartPos;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_PARATHD.u32)+u32Data*CHN_OFFSET),DHD0_PARATHD.u32);
}

HI_VOID VDP_DISP_SetIntfRgbModeEn(HI_U32 u32En)
{
    U_INTF_HDMI_CTRL INTF_HDMI_CTRL;

    INTF_HDMI_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->INTF_HDMI_CTRL.u32));
    INTF_HDMI_CTRL.bits.rgb_mode = ~u32En;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->INTF_HDMI_CTRL.u32),INTF_HDMI_CTRL.u32);

    return ;
}


HI_VOID VDP_DISP_GetVactState(HI_U32 u32hd_id, HI_BOOL *pbBtm, HI_U32 *pu32Vcnt)
{
    U_DHD0_STATE DHD0_STATE;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    //Set Vou Dhd Channel Gamma Correct Enable
    DHD0_STATE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_STATE.u32)+u32hd_id*CHN_OFFSET));
    *pbBtm   = DHD0_STATE.bits.bottom_field;
    *pu32Vcnt = DHD0_STATE.bits.count_vcnt;

    return;
}

HI_VOID VDP_DISP_GetDhdEven(HI_U32 u32hd_id, HI_U32 *pu32dhd_even)
{
    U_DHD0_STATE DHD0_STATE;

    if(u32hd_id >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    //Set Vou Dhd Channel Gamma Correct Enable
    DHD0_STATE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_STATE.u32)+u32hd_id*CHN_OFFSET));
    *pu32dhd_even   = DHD0_STATE.bits.dhd_even;

    return;
}


HI_U32 VDP_DISP_GetDispMode(HI_U32 u32hd_id)
{
    U_DHD0_CTRL DHD0_CTRL;
    DHD0_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD0_CTRL.u32) + u32hd_id*CHN_OFFSET);

    return DHD0_CTRL.bits.iop;
}


HI_VOID VDP_DISP_SetNxgDataSwapEnable(HI_U32 u32hd_id, HI_U32 enable)
{
    VDP_PRINT("98mv310 Nousing!\n");
}

HI_VOID VDP_DISP_SetReqStartPos(HI_U32 req_start_pos)
{
    U_DHD0_START_POS1 DHD0_START_POS1;

    DHD0_START_POS1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD0_START_POS1.u32));
    DHD0_START_POS1.bits.req_start_pos = req_start_pos;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD0_START_POS1.u32),DHD0_START_POS1.u32);

    return ;
}

HI_VOID VDP_DISP_SetReqStartLinePos(HI_U32 req_start_line_pos)
{
    U_DHD0_START_POS1 DHD0_START_POS1;

    DHD0_START_POS1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD0_START_POS1.u32));
    DHD0_START_POS1.bits.req_start_line_pos = req_start_line_pos;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD0_START_POS1.u32),DHD0_START_POS1.u32);

    return ;
}




HI_VOID VDP_DISP_SetIntfMultiChnEn(HI_U32 u32Data, HI_U32 en)
{
    U_DHD0_CTRL1 DHD0_CTRL1;

    if(u32Data >= CHN_MAX)
    {
        VDP_PRINT("error ID\n");
        return ;
    }

    DHD0_CTRL1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CTRL1.u32)+u32Data*CHN_OFFSET));
    DHD0_CTRL1.bits.multichn_en =  (en == 1) ? 2 : 1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CTRL1.u32)+u32Data*CHN_OFFSET),DHD0_CTRL1.u32);

}

HI_VOID VDP_DISP_SetDneedEnMode(HI_U32 u32Data, HI_U32 dneed_en_mode)
{
    U_DHD0_PRECHARGE_THD1 DHD0_PRECHARGE_THD1;

    DHD0_PRECHARGE_THD1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_PRECHARGE_THD1.u32)+u32Data*CHN_OFFSET));
    DHD0_PRECHARGE_THD1.bits.dneed_en_mode = dneed_en_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_PRECHARGE_THD1.u32)+u32Data*CHN_OFFSET),DHD0_PRECHARGE_THD1.u32);

    return ;
}

HI_VOID  VDP_DISP_SetIntfClipEn  (HI_U32 u32hd_id, HI_U32 u32Data)
{
    U_DHD0_CLIP_L DHD0_CLIP_L;

    DHD0_CLIP_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_L.bits.intf_clip_en = u32Data;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_L.u32);
}


HI_VOID VDP_DISP_SetIntfClipCl2(HI_U32 u32hd_id, HI_U32 clip_cl2)
{
    U_DHD0_CLIP_L DHD0_CLIP_L;

    DHD0_CLIP_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_L.bits.intf_clip_cl2 = clip_cl2;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_L.u32);

    return ;
}


HI_VOID VDP_DISP_SetIntfClipCl1(HI_U32 u32hd_id, HI_U32 clip_cl1)
{
    U_DHD0_CLIP_L DHD0_CLIP_L;

    DHD0_CLIP_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_L.bits.intf_clip_cl1 = clip_cl1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_L.u32);

    return ;
}


HI_VOID VDP_DISP_SetIntfClipCl0(HI_U32 u32hd_id, HI_U32 clip_cl0)
{
    U_DHD0_CLIP_L DHD0_CLIP_L;

    DHD0_CLIP_L.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_L.bits.intf_clip_cl0 = clip_cl0;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_L.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_L.u32);

    return ;
}


HI_VOID VDP_DISP_SetIntfClipCh2(HI_U32 u32hd_id, HI_U32 clip_ch2)
{
    U_DHD0_CLIP_H DHD0_CLIP_H;

    DHD0_CLIP_H.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_H.bits.intf_clip_ch2 = clip_ch2;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_H.u32);

    return ;
}


HI_VOID VDP_DISP_SetIntfClipCh1(HI_U32 u32hd_id, HI_U32 clip_ch1)
{
    U_DHD0_CLIP_H DHD0_CLIP_H;

    DHD0_CLIP_H.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_H.bits.intf_clip_ch1 = clip_ch1;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_H.u32);

    return ;
}

HI_VOID VDP_DISP_SetIntfClipCh0(HI_U32 u32hd_id, HI_U32 clip_ch0)
{
    U_DHD0_CLIP_H DHD0_CLIP_H;

    DHD0_CLIP_H.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET));
    DHD0_CLIP_H.bits.intf_clip_ch0 = clip_ch0;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD0_CLIP_H.u32)+u32hd_id*CHN_OFFSET),DHD0_CLIP_H.u32);

    return ;
}

HI_VOID VDP_XDP_INTF_SetFiStartPos(HI_U32 fi_start_pos)
{
    U_DHD0_START_POS DHD0_START_POS;

    DHD0_START_POS.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->DHD0_START_POS.u32));
    DHD0_START_POS.bits.fi_start_pos = fi_start_pos;
    VDP_RegWrite((HI_ULONG) & (pVdpReg->DHD0_START_POS.u32), DHD0_START_POS.u32);

    return ;
}


HI_VOID VDP_XDP_INTF_SetPreStartPos(HI_U32 pre_start_pos)
{
    U_DHD0_START_POS2 DHD0_START_POS2;

    DHD0_START_POS2.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->DHD0_START_POS2.u32));
    DHD0_START_POS2.bits.pre_start_pos = pre_start_pos;
    VDP_RegWrite((HI_ULONG) & (pVdpReg->DHD0_START_POS2.u32), DHD0_START_POS2.u32);

    return ;
}


HI_VOID VDP_XDP_INTF_DHD1_SetTriggerEn(HI_U32 trigger_en)
{
    U_DHD1_CTRL DHD1_CTRL;

    DHD1_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD1_CTRL.u32));
    DHD1_CTRL.bits.trigger_en = trigger_en;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD1_CTRL.u32),DHD1_CTRL.u32);

    return ;
}

HI_VOID VDP_XDP_INTF_DHD1_SetHdSyncEn(HI_U32 u32Data)
{
    U_DHD1_CTRL DHD1_CTRL;

    DHD1_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD1_CTRL.u32));
    DHD1_CTRL.bits.hd_sync_en = u32Data;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD1_CTRL.u32),DHD1_CTRL.u32);
}

HI_VOID VDP_XDP_INTF_DHD1_SetFrmThd(HI_U32 u32Data)
{
    U_DHD1_FRM_THD DHD1_FRM_THD;

    DHD1_FRM_THD.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->DHD1_FRM_THD.u32));
    DHD1_FRM_THD.bits.frm_sync_thd = u32Data;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->DHD1_FRM_THD.u32),DHD1_FRM_THD.u32);
}
