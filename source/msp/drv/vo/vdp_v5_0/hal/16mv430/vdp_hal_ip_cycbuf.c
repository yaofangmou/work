#include "vdp_hal_comm.h"
#include "vdp_hal_ip_cycbuf.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_CYCBUF_SetVid0BindEn( HI_U32 offset, HI_U32 vid0_bind_en)
{
    U_HWLD_TOP_CTRL HWLD_TOP_CTRL;

    HWLD_TOP_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->HWLD_TOP_CTRL.u32) + (offset/4)));
    HWLD_TOP_CTRL.bits.vid0_bind_en = vid0_bind_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->HWLD_TOP_CTRL.u32) + (offset/4)),HWLD_TOP_CTRL.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetVid0SuccEn( HI_U32 offset, HI_U32 vid0_succ_en)
{
    U_HWLD_TOP_CTRL HWLD_TOP_CTRL;

    HWLD_TOP_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->HWLD_TOP_CTRL.u32) + (offset/4)));
    HWLD_TOP_CTRL.bits.vid0_succ_en = vid0_succ_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->HWLD_TOP_CTRL.u32) + (offset/4)),HWLD_TOP_CTRL.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetRegup( HI_U32 offset, HI_U32 regup)
{
    U_HWLD_TOP_REGUP HWLD_TOP_REGUP;

    HWLD_TOP_REGUP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->HWLD_TOP_REGUP.u32) + (offset/4)));
    HWLD_TOP_REGUP.bits.regup = regup;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->HWLD_TOP_REGUP.u32) + (offset/4)),HWLD_TOP_REGUP.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetDtvMode( HI_U32 offset, HI_U32 dtv_mode)
{
    U_VID_DTV_MODE VID_DTV_MODE;

    VID_DTV_MODE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_MODE.u32) + (offset/4)));
    VID_DTV_MODE.bits.dtv_mode = dtv_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_MODE.u32) + (offset/4)),VID_DTV_MODE.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetResetMode( HI_U32 offset, HI_U32 reset_mode)
{
    U_VID_DTV_MODE_IMG VID_DTV_MODE_IMG;

    VID_DTV_MODE_IMG.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_MODE_IMG.u32) + (offset/4)));
    VID_DTV_MODE_IMG.bits.reset_mode = reset_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_MODE_IMG.u32) + (offset/4)),VID_DTV_MODE_IMG.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetBackMode( HI_U32 offset, HI_U32 back_mode)
{
    U_VID_DTV_MODE VID_DTV_MODE;
    VID_DTV_MODE.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_MODE.u32) + (offset/4)));
    VID_DTV_MODE.bits.back_mode = back_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_MODE.u32) + (offset/4)),VID_DTV_MODE.u32);
    return ;
}

HI_VOID VDP_CYCBUF_SetResetEn( HI_U32 offset, HI_U32 reset_en)
{
    U_VID_DTV_MODE_IMG VID_DTV_MODE_IMG;
    VID_DTV_MODE_IMG.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_MODE_IMG.u32) + (offset/4)));
    VID_DTV_MODE_IMG.bits.reset_en = reset_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_MODE_IMG.u32) + (offset/4)),VID_DTV_MODE_IMG.u32);

    return ;
}

HI_VOID VDP_CYCBUF_GetResetEn( HI_U32 offset, HI_BOOL *preset_en)
{
    U_VID_DTV_MODE_IMG VID_DTV_MODE_IMG;
    VID_DTV_MODE_IMG.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_MODE_IMG.u32) + (offset/4)));
    *preset_en = VID_DTV_MODE_IMG.bits.reset_en;
    return ;
}

HI_VOID VDP_CYCBUF_SetHburstNum( HI_U32 offset, HI_U32 hburst_num)
{
    U_VID_DTV_GLB_FRM_INFO VID_DTV_GLB_FRM_INFO;

    VID_DTV_GLB_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_GLB_FRM_INFO.u32) + (offset/4)));
    VID_DTV_GLB_FRM_INFO.bits.hburst_num = hburst_num;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_GLB_FRM_INFO.u32) + (offset/4)),VID_DTV_GLB_FRM_INFO.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetLburstNum( HI_U32 offset, HI_U32 lburst_num)
{
    U_VID_DTV_GLB_FRM_INFO VID_DTV_GLB_FRM_INFO;

    VID_DTV_GLB_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_GLB_FRM_INFO.u32) + (offset/4)));
    VID_DTV_GLB_FRM_INFO.bits.lburst_num = lburst_num;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_GLB_FRM_INFO.u32) + (offset/4)),VID_DTV_GLB_FRM_INFO.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetWriteReady( HI_U32 offset, HI_U32 write_ready)
{
    U_VID_DTV_LOC_FRM_INFO_READY VID_DTV_LOC_FRM_INFO_READY;

    VID_DTV_LOC_FRM_INFO_READY.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO_READY.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO_READY.bits.write_ready = write_ready;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO_READY.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO_READY.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetFirstFieldSel( HI_U32 offset, HI_U32 first_field_sel)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;

    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.first_field_sel = first_field_sel;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetBtmDispNum( HI_U32 offset, HI_U32 btm_disp_num)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;

    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.btm_disp_num = btm_disp_num;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);

    return ;
}


HI_VOID VDP_CYCBUF_SetTopDispNum( HI_U32 offset, HI_U32 top_disp_num)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;

    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.top_disp_num = top_disp_num;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);

    return ;
}
HI_VOID VDP_CYCBUF_SetAddrMode( HI_U32 offset, HI_U32 u32AddrMode)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;
    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.addr_mode = u32AddrMode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);
    return ;
}
HI_VOID VDP_CYCBUF_SetBtmTaskTyp( HI_U32 offset, HI_U32 btm_task_typ)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;
    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.btm_task_typ = btm_task_typ;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);
    return ;
}
HI_VOID VDP_CYCBUF_SetTopTaskTyp( HI_U32 offset, HI_U32 top_task_typ)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;

    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.top_task_typ = top_task_typ;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetOnOffMode( HI_U32 offset, HI_U32 on_off_mode)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;

    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.on_off_mode = on_off_mode;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetIndex( HI_U32 offset, HI_U32 index)
{
    U_VID_DTV_LOC_FRM_INFO VID_DTV_LOC_FRM_INFO;
    VID_DTV_LOC_FRM_INFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO.bits.index = index;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO.u32);
    return ;
}

HI_VOID VDP_CYCBUF_SetDtvCfgAddr( HI_U32 offset, HI_U32 dtv_cfg_addr)
{
    U_VID_DTV_LOC_FRM_INFO1 VID_DTV_LOC_FRM_INFO1;

    VID_DTV_LOC_FRM_INFO1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO1.u32) + (offset/4)));
    VID_DTV_LOC_FRM_INFO1.bits.dtv_cfg_addr = dtv_cfg_addr;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO1.u32) + (offset/4)),VID_DTV_LOC_FRM_INFO1.u32);

    return ;
}

HI_VOID VDP_CYCBUF_SetDtvBackPassword( HI_U32 offset, HI_U32 dtv_back_password)
{
    U_VID_DTV_BACK_PSW VID_DTV_BACK_PSW;

    VID_DTV_BACK_PSW.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_BACK_PSW.u32) + (offset/4)));
    VID_DTV_BACK_PSW.bits.dtv_back_password = dtv_back_password;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VID_DTV_BACK_PSW.u32) + (offset/4)),VID_DTV_BACK_PSW.u32);

    return ;
}

HI_U32 VDP_CYCBUF_GetUnderloadSta( HI_U32 offset)
{
    U_VID_DTV_DEBUG3 VID_DTV_DEBUG3;

    VID_DTV_DEBUG3.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->VID_DTV_DEBUG3.u32) + (offset / 4)));

    return VID_DTV_DEBUG3.bits.underload_sta;
}

HI_U32 VDP_CYCBUF_GetUnderloadCnt( HI_U32 offset)
{
    U_VID_DTV_DEBUG4 VID_DTV_DEBUG4;

    VID_DTV_DEBUG4.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->VID_DTV_DEBUG4.u32) + (offset / 4)));

    return VID_DTV_DEBUG4.bits.underload_cnt;
}

HI_U32  VDP_CYCBUF_GetDtvBackAddr( HI_U32 offset)
{
    U_VID_DTV_BACK_ADDR VID_DTV_BACK_ADDR;

    VID_DTV_BACK_ADDR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_BACK_ADDR.u32) + (offset/4)));
    return VID_DTV_BACK_ADDR.bits.dtv_back_addr;
}

HI_U32  VDP_CYCBUF_GetDtvDispAddr( HI_U32 offset)
{
    U_VID_DTV_DISP_ADDR VID_DTV_DISP_ADDR;

    VID_DTV_DISP_ADDR.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_DISP_ADDR.u32) + (offset/4)));

    return VID_DTV_DISP_ADDR.bits.dtv_disp_addr;
}

HI_U32  VDP_CYCBUF_GetDtvCfgAddr( HI_U32 offset)
{
    U_VID_DTV_LOC_FRM_INFO1 VID_DTV_LOC_FRM_INFO1;

    VID_DTV_LOC_FRM_INFO1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_LOC_FRM_INFO1.u32) + (offset/4)));

    return VID_DTV_LOC_FRM_INFO1.bits.dtv_cfg_addr;
}

HI_U32  VDP_CYCBUF_GetBackNum( HI_U32 offset)
{
    U_VID_DTV_BACK_NUM VID_DTV_BACK_NUM;

    VID_DTV_BACK_NUM.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_BACK_NUM.u32) + (offset/4)));

    return VID_DTV_BACK_NUM.bits.back_num;
}

HI_U32  VDP_CYCBUF_GetBackErr( HI_U32 offset)
{
    U_VID_DTV_ERR_STA VID_DTV_ERR_STA;

    VID_DTV_ERR_STA.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_ERR_STA.u32) + (offset/4)));

    return VID_DTV_ERR_STA.bits.back_err;
}

HI_U32  VDP_CYCBUF_GetSendErr( HI_U32 offset)
{
    U_VID_DTV_ERR_STA VID_DTV_ERR_STA;

    VID_DTV_ERR_STA.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VID_DTV_ERR_STA.u32) + (offset/4)));

    return VID_DTV_ERR_STA.bits.send_err;
}

HI_U32  VDP_CYCBUF_GetDispCurIdex( HI_U32 offset)
{
    U_VID_DTV_DEBUG7 VID_DTV_DEBUG7;

    VID_DTV_DEBUG7.u32 = VDP_RegRead(((HI_ULONG) & (pVdpReg->VID_DTV_DEBUG7.u32) + (offset / 4)));

    return VID_DTV_DEBUG7.bits.cur_index;
}

HI_VOID VDP_CYCBUF_ClearUnloadFlag( HI_U32 offset)
{
    U_VID_DTV_DEBUG_CLR VID_DTV_DEBUG_CLR;

    VID_DTV_DEBUG_CLR.u32 = VDP_RegRead((HI_ULONG) & (pVdpReg->VID_DTV_DEBUG_CLR.u32));
    VID_DTV_DEBUG_CLR.bits.debug_clr = 1;

    VDP_RegWrite((HI_ULONG) & (pVdpReg->VID_DTV_DEBUG_CLR.u32), VID_DTV_DEBUG_CLR.u32);

    return ;
}

