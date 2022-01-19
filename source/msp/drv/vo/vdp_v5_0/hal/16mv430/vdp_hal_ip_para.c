#include "vdp_hal_ip_para.h"
#include "vdp_hal_comm.h"

extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_PARA_SetParaAddrVhdChn00( HI_U32 para_addr_vhd_chn00)
{
    U_PARA_ADDR_VHD_CHN00 PARA_ADDR_VHD_CHN00;

    PARA_ADDR_VHD_CHN00.bits.para_addr_vhd_chn00 = para_addr_vhd_chn00;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_ADDR_VHD_CHN00.u32),PARA_ADDR_VHD_CHN00.u32);

    return ;
}

HI_VOID VDP_PARA_SetParaAddrVhdChn01( HI_U32 para_addr_vhd_chn01)
{
    U_PARA_ADDR_VHD_CHN01 PARA_ADDR_VHD_CHN01;

    PARA_ADDR_VHD_CHN01.bits.para_addr_vhd_chn01 = para_addr_vhd_chn01;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_ADDR_VHD_CHN01.u32),PARA_ADDR_VHD_CHN01.u32);

    return ;
}

HI_VOID VDP_PARA_SetParaAddrVhdChn02( HI_U32 para_addr_vhd_chn02)
{
    U_PARA_ADDR_VHD_CHN02 PARA_ADDR_VHD_CHN02;

    PARA_ADDR_VHD_CHN02.bits.para_addr_vhd_chn02 = para_addr_vhd_chn02;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_ADDR_VHD_CHN02.u32),PARA_ADDR_VHD_CHN02.u32);

    return ;
}

HI_VOID VDP_PARA_SetParaAddrVhdChn07( HI_U32 para_addr_vhd_chn07)
{
    U_PARA_ADDR_VHD_CHN07 PARA_ADDR_VHD_CHN07;

    PARA_ADDR_VHD_CHN07.bits.para_addr_vhd_chn07 = para_addr_vhd_chn07;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_ADDR_VHD_CHN07.u32),PARA_ADDR_VHD_CHN07.u32);

    return ;
}

HI_VOID VDP_PARA_SetParaAddrVhdChn08( HI_U32 para_addr_vhd_chn08)
{
    U_PARA_ADDR_VHD_CHN08 PARA_ADDR_VHD_CHN08;

    PARA_ADDR_VHD_CHN08.bits.para_addr_vhd_chn08 = para_addr_vhd_chn08;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_ADDR_VHD_CHN08.u32),PARA_ADDR_VHD_CHN08.u32);

    return ;
}

HI_VOID VDP_PARA_SetParaUpVhdChn( HI_U32 u32ChnNum)
{
    U_PARA_UP_VHD PARA_UP_VHD;
    if(u32ChnNum <=31)
    {
        PARA_UP_VHD.u32 = (1 << u32ChnNum);
        VDP_RegWrite((HI_ULONG)&(pVdpReg->PARA_UP_VHD.u32),PARA_UP_VHD.u32);
    }
    return ;
}
