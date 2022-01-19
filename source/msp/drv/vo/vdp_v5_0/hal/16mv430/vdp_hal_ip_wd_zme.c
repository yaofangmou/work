#include "vdp_hal_ip_wd_zme.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_WBC_VZME_SetOutHeight(HI_U32 out_height)
{
    U_WBC_DHD0_VZME_VINFO WBC_DHD0_VZME_VINFO;

    WBC_DHD0_VZME_VINFO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VINFO.u32));
    WBC_DHD0_VZME_VINFO.bits.out_height = out_height;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VINFO.u32),WBC_DHD0_VZME_VINFO.u32);

    return ;
}

HI_VOID VDP_WBC_VZME_SetZmeInFmt(HI_U32 zme_in_fmt)
{
    U_WBC_DHD0_VZME_VSP WBC_DHD0_VZME_VSP;

    WBC_DHD0_VZME_VSP.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VSP.u32));
    WBC_DHD0_VZME_VSP.bits.zme_in_fmt = zme_in_fmt;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VSP.u32),WBC_DHD0_VZME_VSP.u32);

    return ;
}

HI_VOID VDP_WBC_VZME_SetVratio(HI_U32 vratio)
{
    U_WBC_DHD0_VZME_VSR WBC_DHD0_VZME_VSR;

    WBC_DHD0_VZME_VSR.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VSR.u32));
    WBC_DHD0_VZME_VSR.bits.vratio = vratio;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->WBC_DHD0_VZME_VSR.u32),WBC_DHD0_VZME_VSR.u32);

    return ;
}

HI_VOID VDP_WBC_HZME_SetOutWidth(HI_U32 out_width)
{
    U_WBC_DHD0_ZME_HINFO WBC_DHD0_ZME_HINFO;

    WBC_DHD0_ZME_HINFO.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->WBC_DHD0_ZME_HINFO.u32)));
    WBC_DHD0_ZME_HINFO.bits.out_width = out_width;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->WBC_DHD0_ZME_HINFO.u32)),WBC_DHD0_ZME_HINFO.u32);

    return ;
}

HI_VOID VDP_WBC_HZME_SetHratio(HI_U32 hratio)
{
    U_WBC_DHD0_ZME_HSP WBC_DHD0_ZME_HSP;

    WBC_DHD0_ZME_HSP.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->WBC_DHD0_ZME_HSP.u32)));
    WBC_DHD0_ZME_HSP.bits.hratio = hratio;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->WBC_DHD0_ZME_HSP.u32)),WBC_DHD0_ZME_HSP.u32);

    return ;
}
