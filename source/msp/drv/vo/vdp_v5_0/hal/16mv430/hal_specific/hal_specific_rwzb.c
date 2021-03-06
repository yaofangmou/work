#ifdef HI_DISP_BUILD_FULL
#include <linux/kernel.h>
#endif

#include "hal_specific_rwzb.h"
#include "vdp_hal_comm.h"
extern  volatile S_VDP_REGS_TYPE* pVdpReg;

#define  MAX_SONCHIPNUMBER_SUPPORT 10
#define  VO_DAC_CTRL1_DAC_OTP_REG 0x4100


#ifdef HI_VO_VDAC_LC_CIRCUIT
/*VDAC_DEFAULT_VALUE*/
const HI_U32 g_u32VdacGain[MAX_SONCHIPNUMBER_SUPPORT] = {0x80000390};
#else
/*VDAC_DEFAULT_VALUE*/
const HI_U32 g_u32VdacGain[MAX_SONCHIPNUMBER_SUPPORT] = {0x80000070};
#endif


static HI_U32 u32aDATESrc13Coef[][18]=
{

     /*720p/1080i.*/
    {0x0,0x7fe0000,0x50000,0x7f50001,0x1607fd,0x7d80006,0x4707f5,0x7790014,
    0x15907cc,0x159024f,0x77907cc,0x470014,0x7d807f5,0x160006,0x7f507fd,0x50001,
    0x7fe0000,0x0
    },

    /*480p/576p*/
    {0x0      ,  0x7fd0000,  0x607ff  ,  0x7f50003,  0x1407fa ,  0x7dd0009,  0x3e07f3 ,  0x78b0013,
     0x14f07dd,  0x14f0233,  0x78b07dd,  0x3e0013 ,  0x7dd07f3,  0x140009 ,  0x7f507fa,  0x60003  ,
     0x7fd07ff,  0x0,
    },

     /*720p/1080i.*/
    {0x0,0x7fe0000,0x50000,0x7f50001,0x1607fd,0x7d80006,0x4707f5,0x7790014,
    0x15907cc,0x159024f,0x77907cc,0x470014,0x7d807f5,0x160006,0x7f507fd,0x50001,
    0x7fe0000,0x0
    },

    /*1080p*/
    {0x0 ,  0x7fd07fd,  0x80004  ,  0x7ee07fa,  0x230008 ,  0x7c307f8,  0x690003 ,  0x747000e,
     0x17807ad,  0x178028e,  0x74707ad,  0x69000e ,  0x7c30003,  0x2307f8 ,  0x7ee0008,  0x807fa  ,
     0x7fd0004,  0x7fd ,
    },
};

#ifdef HI_VO_VDAC_LC_CIRCUIT

HI_U32 u32aSDDATESrcCoef[][10]=
{
    /*default para*/
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x113},

        /* FIDELITY_576I_YPBPR FIDELITY_480I_YPBPR 3796c 3798c */
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x113},

    /* 3719m  FIDELITY_SKN FIDELITY_ZDN  */
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x00000102},

        /* 3719m FIDELITY_MOTO_CVBS  luma Noline */
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x113},/*vector*/
        /* 3719m FIDELITY_033   Vector */
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x113},

    /* 3719m   FIDELITY_MATRIX525 Vector */
    {0x79a000a ,  0x79a02b8 ,  0xa ,   0x78a0013 ,  0x1630163 ,  0x13078a,
        0x00000001, 0x80808181, 0x00808080,0x113},
};
#else
HI_U32 u32aSDDATESrcCoef[][10]=
{
    /*default para*/
    {0x7f9 ,  0x20e ,  0x7f9 ,   0x79f0014 ,  0x14d014d ,  0x14079f,
        0x00000001, 0x80808181, 0x00808080,0x113},

        /* FIDELITY_576I_YPBPR FIDELITY_480I_YPBPR 3796c 3798c */
    {0x7d20007,  0x7d2024e,  0x7,   0x7af000d,  0x1430143,0xd07af,
        0x00000001, 0x80808181, 0x00808080,0x113},

    /* 3719m  FIDELITY_SKN FIDELITY_ZDN  */
    {0x7f9,  0x20e,  0x7f9,   0x79f0014,  0x14d014d,0x14079f,
        0x00000001, 0x80808181, 0x00808080,0x00000102},

        /* 3719m FIDELITY_MOTO_CVBS  luma Noline */
    {0x7f9,  0x20e,  0x7f9,   0x79f0014,  0x14d014d,0x14079f,
        0x00000001, 0x80808181, 0x00808080,0x113},/*vector*/
        /* 3719m FIDELITY_033   Vector */
    {0x7f9,  0x20e,  0x7f9,   0x79f0014,  0x14d014d,0x14079f,
        0x00000001, 0x80808181, 0x00808080,0x113},

    /* 3719m   FIDELITY_MATRIX525 Vector */
    {0x7f1,  0x21e,  0x7f1,   0x7760021,  0x1690169,0x210776,
        0x00000001, 0x80808181, 0x00808080,0x113},
};

#endif

HI_U32 * VDP_Get_HDateSrc13Coef( HI_U32 u32Fmt)
{
    return u32aDATESrc13Coef[u32Fmt];
}

HI_U32 * VDP_Get_SDateSrcCoef( HI_U32 Index)
{
    return u32aSDDATESrcCoef[Index];
}

HI_VOID VDP_Set_VDAC_GAIN(HI_U32 uVdac)
{
    HI_U32 u32GainValue = 0;
    HI_CHIP_TYPE_E enChipType = HI_CHIP_TYPE_BUTT;
    HI_CHIP_VERSION_E enChipVersion = HI_CHIP_VERSION_BUTT;

    HI_DRV_SYS_GetChipVersion(&enChipType, &enChipVersion);

    u32GainValue = g_u32VdacGain[0];

    switch(uVdac)
    {
        case 3:
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_C_CTRL.u32)), u32GainValue);
            break;

        case 0:
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_R_CTRL.u32)), u32GainValue);
            break;

        case 1:
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_G_CTRL.u32)), u32GainValue);
            break;
        case 2:
            VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_B_CTRL.u32)), u32GainValue);
            break;
        default:
            return;
    }

    /*430 delete the tiny gain adjust.*/
#if 0
    if (HI_CHIP_VERSION_V300 == enChipVersion)
    {
        u32TinyAdjustGainValue = VDP_RegRead((HI_ULONG)&(pVdpReg->VO_DAC_CTRL0.u32));
        u32TinyAdjustGainValue |= VDAC_DEFAULT_GAIN_TINYADJUST_MASK;
        VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_CTRL0.u32)), u32TinyAdjustGainValue);
    }
#endif

    return;
}


HI_VOID VDP_VDAC_SetCvbsAndYpbprDriveMode(HI_VOID)
{
    U_VO_DAC_CTRL1   VO_DAC_CTRL1;

    memset((HI_VOID*)&VO_DAC_CTRL1, 0x0, sizeof(VO_DAC_CTRL1));

    VO_DAC_CTRL1.u32 = VDP_RegRead((HI_ULONG) &(pVdpReg->VO_DAC_CTRL1.u32));
    VO_DAC_CTRL1.bits.dac_otp_reg = VO_DAC_CTRL1_DAC_OTP_REG;
    VDP_RegWrite(((HI_ULONG)&(pVdpReg->VO_DAC_CTRL1.u32)),VO_DAC_CTRL1.u32);

    return ;
}
