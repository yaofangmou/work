#include "vdp_hal_comm.h"
#include "vdp_drv_comm.h"

volatile S_VDP_REGS_TYPE* pVdpReg;
extern VPSS_REGCFG_ADDR_S gstVpssRegCfgAddr;
extern volatile HI_U32 g_pOptmRegVirAddrDci ;
extern MMZ_BUFFER_S  gstVdpRegMem[XDP_REGMEM_ID_BUTT];
extern HI_U32 VDP_FhdShpVirAddr;
extern HI_U32 VDP_MrgVirAddr;

HI_U32 VDP_RegRead(HI_ULONG a)
{
    return (*((volatile HI_U32 *)a));

}

HI_VOID VDP_RegWrite(HI_ULONG  a, HI_U32 b)
{
    *((volatile HI_U32 *)a) = b;
    return ;
}

HI_U32 VDP_DdrRead(volatile HI_U32 a)
{
#ifndef __DISP_PLATFORM_BOOT__
    HI_U32 *pu32RegBegin;
    HI_U32 u64Regoffset ;

    pu32RegBegin = (HI_U32 *)pVdpReg ;
    u64Regoffset = (HI_U32)((HI_U32 *)a - pu32RegBegin);
    u64Regoffset = u64Regoffset * 4;
    return (*(HI_U32 *)(gstVdpRegMem[XDP_REGMEM_ID0].pu8StartVirAddr + u64Regoffset));
#else
    return 0;
#endif
}


HI_U32 VDP_RegReadEx(HI_U32 a)
{
    return HI_SUCCESS;
}


HI_VOID VDP_RegWriteEx(HI_U32 a, HI_U32 b)
{

}

HI_U32 VDP_NodeRead(volatile HI_U32* a)
{
    return(*a);
}

HI_VOID VDP_NodeWrite(HI_U32 *pCfgNode,HI_U32 u32RegOffsetAddr, HI_U32 u32Flag,HI_U32 u32RegCfg)
{
    HI_U32 u32Info ;

    u32Info = (u32Flag<<24)| (u32RegOffsetAddr&0x00ffffff);

    *(HI_U32 *)(pCfgNode - 1)     = u32Info;
    *(HI_U32 *)(pCfgNode    )     = u32RegCfg;

    return ;
}


#ifndef __DISP_PLATFORM_BOOT__
HI_S32 XDP_CalcRunTime(HI_VOID)
{
    HI_ULONG ulTimeusec;
    struct timeval stTime;
    do_gettimeofday(&stTime);
    ulTimeusec = stTime.tv_usec;
    return ulTimeusec;
}
#endif

//--------------------------------------------------------------------
// FPGA DEBUG
//--------------------------------------------------------------------
HI_VOID VDP_SetVdpFpgaDebugWrite(HI_U32 u32Data)
{
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VOFPGATEST.u32)), u32Data);
}

HI_S32 VDP_SetVdpFpgaDebugRead(HI_VOID)
{
    return VDP_RegRead(((HI_ULONG)&(pVdpReg->VOFPGATEST.u32)));
}


//--------------------------------------------------------------------
// AXI BUS BEING
//--------------------------------------------------------------------
HI_VOID VDP_SetVDPMemLowPower(HI_VOID)
{
    #if 0
    U_VOLOWPOWER_CTRL VOLOWPOWER_CTRL;

    VOLOWPOWER_CTRL.u32 = 0x00005b2b;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VOLOWPOWER_CTRL.u32)), VOLOWPOWER_CTRL.u32);
    #endif
}

HI_VOID VDP_SetClkGateEn(HI_U32 u32Data)
{
    U_VOCTRL VOCTRL;

    VOCTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->VOCTRL.u32)));
    VOCTRL.bits.vo_ck_gt_en = u32Data;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VOCTRL.u32)), VOCTRL.u32);
}

HI_VOID VDP_CBM_SetMixerBkg(VDP_CBM_MIX_E u32mixer_id, VDP_BKG_S stBkg)
{
    U_CBM_BKG1 CBM_BKG1;
    U_CBM_BKG2 CBM_BKG2;

    if (u32mixer_id == VDP_CBM_MIX0)
    {
        /* DHD0  mixer link */
        CBM_BKG1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_BKG1.u32)));
        CBM_BKG1.bits.cbm_bkgy1  = stBkg.u32BkgY;
        CBM_BKG1.bits.cbm_bkgcb1 = stBkg.u32BkgU;
        CBM_BKG1.bits.cbm_bkgcr1 = stBkg.u32BkgV;
        VDP_RegWrite((HI_ULONG)&(pVdpReg->CBM_BKG1.u32), CBM_BKG1.u32);
    }
    else if (u32mixer_id == VDP_CBM_MIX1)
    {
        /* DHD1  mixer link */
        CBM_BKG2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_BKG2.u32)));
        CBM_BKG2.bits.cbm_bkgy2  = stBkg.u32BkgY;
        CBM_BKG2.bits.cbm_bkgcb2 = stBkg.u32BkgU;
        CBM_BKG2.bits.cbm_bkgcr2 = stBkg.u32BkgV;
        VDP_RegWrite((HI_ULONG)&(pVdpReg->CBM_BKG2.u32), CBM_BKG2.u32);
    }
#if MIXG_EN
    else if (u32mixer_id == VDP_CBM_MIXG0)
    {
        U_MIXG0_BKG MIXG0_BKG;
        U_MIXG0_BKALPHA MIXG0_BKALPHA;
        /* G0 mixer link */
        MIXG0_BKG.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_BKG.u32)));
        MIXG0_BKG.bits.mixer_bkgy  = stBkg.u32BkgY;
        MIXG0_BKG.bits.mixer_bkgcb = stBkg.u32BkgU;
        MIXG0_BKG.bits.mixer_bkgcr = stBkg.u32BkgV;
        VDP_RegWrite((HI_ULONG)&(pVdpReg->MIXG0_BKG.u32), MIXG0_BKG.u32);

        MIXG0_BKALPHA.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_BKALPHA.u32)));
        MIXG0_BKALPHA.bits.mixer_alpha  = stBkg.u32BkgA;
        VDP_RegWrite((HI_ULONG)&(pVdpReg->MIXG0_BKALPHA.u32), MIXG0_BKALPHA.u32);
    }
    else if (u32mixer_id == VDP_CBM_MIXV0)
    {
        U_MIXV0_BKG MIXV0_BKG;
        MIXV0_BKG.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXV0_BKG.u32)));
        MIXV0_BKG.bits.mixer_bkgy  = stBkg.u32BkgY;
        MIXV0_BKG.bits.mixer_bkgcb = stBkg.u32BkgU;
        MIXV0_BKG.bits.mixer_bkgcr = stBkg.u32BkgV;
        VDP_RegWrite((HI_ULONG)&(pVdpReg->MIXV0_BKG.u32), MIXV0_BKG.u32);
    }

#endif
    else
    {
        //VDP_PRINT("Error! VDP_CBM_SetMixerBkg() Select Wrong mixer ID\n");
    }

    return ;
}

HI_VOID VDP_CBM_Clear_MixvPrio(HI_U32 u32layer_id)
{
    U_MIXV0_MIX MIXV0_MIX;
    MIXV0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)));

    if (MIXV0_MIX.bits.mixer_prio0 == (u32layer_id + 1))
    {
        MIXV0_MIX.bits.mixer_prio0 = 0;
    }

    if (MIXV0_MIX.bits.mixer_prio1 == (u32layer_id + 1))
    {
        MIXV0_MIX.bits.mixer_prio1 = 0;
    }

    VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)), MIXV0_MIX.u32);

    return;
}

HI_VOID VDP_CBM_SetMixerPrio(VDP_CBM_MIX_E u32mixer_id, HI_U32 u32layer_id, HI_U32 u32prio)
{
    U_CBM_MIX1  CBM_MIX1;
    U_CBM_MIX2  CBM_MIX2;
    U_MIXG0_MIX MIXG0_MIX;
    U_MIXV0_MIX MIXV0_MIX;

    if (u32mixer_id == VDP_CBM_MIX0) //DHD0
    {
        switch (u32prio)
        {
            case 0:
            {
                CBM_MIX1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_MIX1.u32)));
                CBM_MIX1.bits.mixer_prio0 = u32layer_id;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX1.u32)), CBM_MIX1.u32);
                break;
            }

            case 1:
            {
                CBM_MIX1.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_MIX1.u32)));
                CBM_MIX1.bits.mixer_prio1 = u32layer_id;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX1.u32)), CBM_MIX1.u32);
                break;
            }

            default:
            {
                return ;
            }

        }
    }
    else if (u32mixer_id == VDP_CBM_MIX1) //DHD1
    {
        switch (u32prio)
        {
            case 0:
            {
                CBM_MIX2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_MIX2.u32)));
                CBM_MIX2.bits.mixer_prio0 = u32layer_id;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX2.u32)), CBM_MIX2.u32);
                break;
            }

            case 1:
            {
                CBM_MIX2.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->CBM_MIX2.u32)));
                CBM_MIX2.bits.mixer_prio1 = u32layer_id;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX2.u32)), CBM_MIX2.u32);
                break;
            }

            default:
            {
                return ;
            }

        }
    }
    else if (u32mixer_id == VDP_CBM_MIXG0)
    {
        switch (u32prio)
        {
            case 0:
            {
                MIXG0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)));
                MIXG0_MIX.bits.mixer_prio0 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
                break;
            }

            case 1:
            {
                MIXG0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)));
                MIXG0_MIX.bits.mixer_prio1 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
                break;
            }

            case 2:
            {
                MIXG0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)));
                MIXG0_MIX.bits.mixer_prio2 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
                break;
            }

            case 3:
            {
                MIXG0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)));
                MIXG0_MIX.bits.mixer_prio3 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
                break;
            }

            default:
            {
                return ;
            }

        }
    }
    else if (u32mixer_id == VDP_CBM_MIXV0)
    {
        switch (u32prio)
        {
            case 0:
            {
                MIXV0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)));
                MIXV0_MIX.bits.mixer_prio0 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)), MIXV0_MIX.u32);
                break;
            }

            case 1:
            {
                MIXV0_MIX.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)));
                MIXV0_MIX.bits.mixer_prio1 = u32layer_id + 1;
                VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)), MIXV0_MIX.u32);
                break;
            }

            default:
            {
                return ;
            }

        }
    }
}

HI_VOID VDP_CBM_ResetMixerPrio(VDP_CBM_MIX_E u32mixer_id)
{

    if (u32mixer_id == VDP_CBM_MIX0) //DHD0
    {
        U_CBM_MIX1 CBM_MIX1;
        CBM_MIX1.u32 = 0;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX1.u32)), CBM_MIX1.u32);
    }
    else if (u32mixer_id == VDP_CBM_MIX1) //DHD1
    {
        U_CBM_MIX2 CBM_MIX2;
        CBM_MIX2.u32 = 0;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->CBM_MIX2.u32)), CBM_MIX2.u32);
    }
    else if (u32mixer_id == VDP_CBM_MIXG0)
    {
        U_MIXG0_MIX MIXG0_MIX;
        MIXG0_MIX.u32 = 0;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXG0_MIX.u32)), MIXG0_MIX.u32);
    }
    else if (u32mixer_id == VDP_CBM_MIXV0)
    {
        U_MIXV0_MIX MIXV0_MIX;
        MIXV0_MIX.u32 = 0;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->MIXV0_MIX.u32)), MIXV0_MIX.u32);
    }
    else
    {
        VDP_PRINT("error ID\n");
    }

    return ;
}

HI_VOID VDP_SetCheckSumEnable(HI_U32  bEnable)
{
    U_DHD_TOP_CTRL  DHD_TOP_CTRL;

    DHD_TOP_CTRL.u32 = VDP_RegRead(((HI_ULONG)&(pVdpReg->DHD_TOP_CTRL.u32)));
    DHD_TOP_CTRL.bits.chk_sum_en = bEnable;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->DHD_TOP_CTRL.u32)), DHD_TOP_CTRL.u32);
}

