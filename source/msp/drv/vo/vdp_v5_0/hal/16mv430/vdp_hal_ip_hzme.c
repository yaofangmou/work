#include "vdp_hal_ip_hzme.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_HZME_SetOutFmt(HI_U32 u32OffsetAddr , HI_U32 out_fmt)
{
    U_V0_HPZME_HINFO V0_HPZME_HINFO;

    V0_HPZME_HINFO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HINFO.u32) + u32OffsetAddr);
    V0_HPZME_HINFO.bits.out_fmt = out_fmt;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HINFO.u32) + u32OffsetAddr),V0_HPZME_HINFO.u32);

    return;
}

HI_VOID VDP_HZME_SetOutWidth(HI_U32 u32OffsetAddr , HI_U32 out_width)
{
    U_V0_HPZME_HINFO V0_HPZME_HINFO;

    V0_HPZME_HINFO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HINFO.u32) + u32OffsetAddr);
    V0_HPZME_HINFO.bits.out_width = out_width;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HINFO.u32) + u32OffsetAddr),V0_HPZME_HINFO.u32);

    return ;
}

HI_VOID VDP_HZME_SetLhfirEn(HI_U32 u32OffsetAddr , HI_U32 lhfir_en)
{
    U_V0_HPZME_HSP V0_HPZME_HSP;

    V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
    V0_HPZME_HSP.bits.lhfir_en = lhfir_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

    return ;
}

HI_VOID VDP_HZME_SetChfirEn(HI_U32 u32OffsetAddr , HI_U32 chfir_en)
{
    U_V0_HPZME_HSP V0_HPZME_HSP;

    V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
    V0_HPZME_HSP.bits.chfir_en = chfir_en;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

    return ;
}

HI_VOID VDP_HZME_SetHratio(HI_U32 u32OffsetAddr , HI_U32 hratio)
{
    U_V0_HPZME_HSP V0_HPZME_HSP;

    V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
    V0_HPZME_HSP.bits.hratio = hratio;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

    return ;
}

HI_VOID VDP_HZME_SetLhmidEn(HI_U32 u32OffsetAddr , HI_U32 lhmid_en)
{
	U_V0_HPZME_HSP V0_HPZME_HSP;

	V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
	V0_HPZME_HSP.bits.lhmid_en = lhmid_en;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

	return ;
}


HI_VOID VDP_HZME_SetChmidEn(HI_U32 u32OffsetAddr , HI_U32 chmid_en)
{
	U_V0_HPZME_HSP V0_HPZME_HSP;

	V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
	V0_HPZME_HSP.bits.chmid_en = chmid_en;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

	return ;
}

HI_VOID VDP_HZME_SetLhfirMode(HI_U32 u32OffsetAddr , HI_U32 lhfir_mode)
{
	U_V0_HPZME_HSP V0_HPZME_HSP;

	V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
	V0_HPZME_HSP.bits.lhfir_mode = lhfir_mode;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

	return ;
}


HI_VOID VDP_HZME_SetChfirMode(HI_U32 u32OffsetAddr , HI_U32 chfir_mode)
{
	U_V0_HPZME_HSP V0_HPZME_HSP;

	V0_HPZME_HSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr);
	V0_HPZME_HSP.bits.chfir_mode = chfir_mode;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HSP.u32) + u32OffsetAddr),V0_HPZME_HSP.u32);

	return ;
}

HI_VOID VDP_HZME_SetLhfirOffset(HI_U32 u32OffsetAddr , HI_U32 lhfir_offset)
{
	U_V0_HPZME_HLOFFSET V0_HPZME_HLOFFSET;

	V0_HPZME_HLOFFSET.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HLOFFSET.u32) + u32OffsetAddr);
	V0_HPZME_HLOFFSET.bits.lhfir_offset = lhfir_offset;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HLOFFSET.u32) + u32OffsetAddr),V0_HPZME_HLOFFSET.u32);

	return ;
}


HI_VOID VDP_HZME_SetChfirOffset(HI_U32 u32OffsetAddr , HI_U32 chfir_offset)
{
	U_V0_HPZME_HCOFFSET V0_HPZME_HCOFFSET;

	V0_HPZME_HCOFFSET.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HCOFFSET.u32) + u32OffsetAddr);
	V0_HPZME_HCOFFSET.bits.chfir_offset = chfir_offset;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HCOFFSET.u32) + u32OffsetAddr),V0_HPZME_HCOFFSET.u32);

	return ;
}

HI_VOID VDP_HZME_SetHlShootctrlEn(HI_U32 u32OffsetAddr , HI_U32 hl_shootctrl_en)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_shootctrl_en = hl_shootctrl_en;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}


HI_VOID VDP_HZME_SetHlShootctrlMode(HI_U32 u32OffsetAddr , HI_U32 hl_shootctrl_mode)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_shootctrl_mode = hl_shootctrl_mode;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}


HI_VOID VDP_HZME_SetHlFlatdectMode(HI_U32 u32OffsetAddr , HI_U32 hl_flatdect_mode)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_flatdect_mode = hl_flatdect_mode;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}


HI_VOID VDP_HZME_SetHlCoringadjEn(HI_U32 u32OffsetAddr , HI_U32 hl_coringadj_en)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_coringadj_en = hl_coringadj_en;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}


HI_VOID VDP_HZME_SetHlGain(HI_U32 u32OffsetAddr , HI_U32 hl_gain)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_gain = hl_gain;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}


HI_VOID VDP_HZME_SetHlCoring(HI_U32 u32OffsetAddr , HI_U32 hl_coring)
{
	U_V0_HPZME_HL_SHOOTCTRL V0_HPZME_HL_SHOOTCTRL;

	V0_HPZME_HL_SHOOTCTRL.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr);
	V0_HPZME_HL_SHOOTCTRL.bits.hl_coring = hl_coring;
	VDP_RegWrite(((HI_ULONG)&(pVdpReg->V0_HPZME_HL_SHOOTCTRL.u32) + u32OffsetAddr),V0_HPZME_HL_SHOOTCTRL.u32);

	return ;
}

