#include "vdp_hal_ip_hipp_csc.h"

HI_VOID VDP_HIPP_CSC_SetHippCscCkGtEn(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_ck_gt_en)
{
    U_V0_HIPP_CSC_CTRL HIPP_CSC_CTRL;

    HIPP_CSC_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_CTRL.u32) + u32OffsetAddr);
    HIPP_CSC_CTRL.bits.hipp_csc_ck_gt_en = hipp_csc_ck_gt_en;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_CTRL.u32) + u32OffsetAddr),HIPP_CSC_CTRL.u32);

    return ;
}

HI_VOID VDP_HIPP_CSC_SetHippCscEn(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_en)
{
    U_V0_HIPP_CSC_CTRL HIPP_CSC_CTRL;

    HIPP_CSC_CTRL.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_CTRL.u32) + u32OffsetAddr);
    HIPP_CSC_CTRL.bits.hipp_csc_en = hipp_csc_en;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_CTRL.u32) + u32OffsetAddr),HIPP_CSC_CTRL.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef00(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef00)
{
    U_V0_HIPP_CSC_COEF00 HIPP_CSC_COEF00;

    HIPP_CSC_COEF00.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF00.u32) + u32OffsetAddr);
    HIPP_CSC_COEF00.bits.hipp_csc_coef00 = hipp_csc_coef00;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF00.u32) + u32OffsetAddr),HIPP_CSC_COEF00.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef01(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef01)
{
    U_V0_HIPP_CSC_COEF01 HIPP_CSC_COEF01;

    HIPP_CSC_COEF01.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF01.u32) + u32OffsetAddr);
    HIPP_CSC_COEF01.bits.hipp_csc_coef01 = hipp_csc_coef01;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF01.u32) + u32OffsetAddr),HIPP_CSC_COEF01.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef02(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef02)
{
    U_V0_HIPP_CSC_COEF02 HIPP_CSC_COEF02;

    HIPP_CSC_COEF02.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF02.u32) + u32OffsetAddr);
    HIPP_CSC_COEF02.bits.hipp_csc_coef02 = hipp_csc_coef02;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF02.u32) + u32OffsetAddr),HIPP_CSC_COEF02.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef10(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef10)
{
    U_V0_HIPP_CSC_COEF10 HIPP_CSC_COEF10;

    HIPP_CSC_COEF10.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF10.u32) + u32OffsetAddr);
    HIPP_CSC_COEF10.bits.hipp_csc_coef10 = hipp_csc_coef10;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF10.u32) + u32OffsetAddr),HIPP_CSC_COEF10.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef11(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef11)
{
    U_V0_HIPP_CSC_COEF11 HIPP_CSC_COEF11;

    HIPP_CSC_COEF11.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF11.u32) + u32OffsetAddr);
    HIPP_CSC_COEF11.bits.hipp_csc_coef11 = hipp_csc_coef11;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF11.u32) + u32OffsetAddr),HIPP_CSC_COEF11.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef12(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef12)
{
    U_V0_HIPP_CSC_COEF12 HIPP_CSC_COEF12;

    HIPP_CSC_COEF12.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF12.u32) + u32OffsetAddr);
    HIPP_CSC_COEF12.bits.hipp_csc_coef12 = hipp_csc_coef12;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF12.u32) + u32OffsetAddr),HIPP_CSC_COEF12.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef20(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef20)
{
    U_V0_HIPP_CSC_COEF20 HIPP_CSC_COEF20;

    HIPP_CSC_COEF20.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF20.u32) + u32OffsetAddr);
    HIPP_CSC_COEF20.bits.hipp_csc_coef20 = hipp_csc_coef20;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF20.u32) + u32OffsetAddr),HIPP_CSC_COEF20.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef21(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef21)
{
    U_V0_HIPP_CSC_COEF21 HIPP_CSC_COEF21;

    HIPP_CSC_COEF21.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF21.u32) + u32OffsetAddr);
    HIPP_CSC_COEF21.bits.hipp_csc_coef21 = hipp_csc_coef21;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF21.u32) + u32OffsetAddr),HIPP_CSC_COEF21.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscCoef22(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_coef22)
{
    U_V0_HIPP_CSC_COEF22 HIPP_CSC_COEF22;

    HIPP_CSC_COEF22.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF22.u32) + u32OffsetAddr);
    HIPP_CSC_COEF22.bits.hipp_csc_coef22 = hipp_csc_coef22;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_COEF22.u32) + u32OffsetAddr),HIPP_CSC_COEF22.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscScale(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_scale)
{
    U_V0_HIPP_CSC_SCALE HIPP_CSC_SCALE;

    HIPP_CSC_SCALE.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_SCALE.u32) + u32OffsetAddr);
    HIPP_CSC_SCALE.bits.hipp_csc_scale = hipp_csc_scale;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_SCALE.u32) + u32OffsetAddr),HIPP_CSC_SCALE.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscIdc0(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc0)
{
    U_V0_HIPP_CSC_IDC0 HIPP_CSC_IDC0;

    HIPP_CSC_IDC0.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC0.u32) + u32OffsetAddr);
    HIPP_CSC_IDC0.bits.hipp_csc_idc0 = hipp_csc_idc0;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC0.u32) + u32OffsetAddr),HIPP_CSC_IDC0.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscIdc1(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc1)
{
    U_V0_HIPP_CSC_IDC1 HIPP_CSC_IDC1;

    HIPP_CSC_IDC1.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC1.u32) + u32OffsetAddr);
    HIPP_CSC_IDC1.bits.hipp_csc_idc1 = hipp_csc_idc1;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC1.u32) + u32OffsetAddr),HIPP_CSC_IDC1.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscIdc2(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_idc2)
{
    U_V0_HIPP_CSC_IDC2 HIPP_CSC_IDC2;

    HIPP_CSC_IDC2.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC2.u32) + u32OffsetAddr);
    HIPP_CSC_IDC2.bits.hipp_csc_idc2 = hipp_csc_idc2;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_IDC2.u32) + u32OffsetAddr),HIPP_CSC_IDC2.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscOdc0(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc0)
{
    U_V0_HIPP_CSC_ODC0 HIPP_CSC_ODC0;

    HIPP_CSC_ODC0.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC0.u32) + u32OffsetAddr);
    HIPP_CSC_ODC0.bits.hipp_csc_odc0 = hipp_csc_odc0;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC0.u32) + u32OffsetAddr),HIPP_CSC_ODC0.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscOdc1(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc1)
{
    U_V0_HIPP_CSC_ODC1 HIPP_CSC_ODC1;

    HIPP_CSC_ODC1.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC1.u32) + u32OffsetAddr);
    HIPP_CSC_ODC1.bits.hipp_csc_odc1 = hipp_csc_odc1;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC1.u32) + u32OffsetAddr),HIPP_CSC_ODC1.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscOdc2(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_odc2)
{
    U_V0_HIPP_CSC_ODC2 HIPP_CSC_ODC2;

    HIPP_CSC_ODC2.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC2.u32) + u32OffsetAddr);
    HIPP_CSC_ODC2.bits.hipp_csc_odc2 = hipp_csc_odc2;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_ODC2.u32) + u32OffsetAddr),HIPP_CSC_ODC2.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscMinY(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_min_y)
{
    U_V0_HIPP_CSC_MIN_Y HIPP_CSC_MIN_Y;

    HIPP_CSC_MIN_Y.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MIN_Y.u32) + u32OffsetAddr);
    HIPP_CSC_MIN_Y.bits.hipp_csc_min_y = hipp_csc_min_y;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MIN_Y.u32) + u32OffsetAddr),HIPP_CSC_MIN_Y.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscMinC(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_min_c)
{
    U_V0_HIPP_CSC_MIN_C HIPP_CSC_MIN_C;

    HIPP_CSC_MIN_C.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MIN_C.u32) + u32OffsetAddr);
    HIPP_CSC_MIN_C.bits.hipp_csc_min_c = hipp_csc_min_c;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MIN_C.u32) + u32OffsetAddr),HIPP_CSC_MIN_C.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscMaxY(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_max_y)
{
    U_V0_HIPP_CSC_MAX_Y HIPP_CSC_MAX_Y;

    HIPP_CSC_MAX_Y.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MAX_Y.u32) + u32OffsetAddr);
    HIPP_CSC_MAX_Y.bits.hipp_csc_max_y = hipp_csc_max_y;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MAX_Y.u32) + u32OffsetAddr),HIPP_CSC_MAX_Y.u32);

    return ;
}


HI_VOID VDP_HIPP_CSC_SetHippCscMaxC(volatile S_VDP_REGS_TYPE *pstVdpReg, HI_U32 u32OffsetAddr, HI_U32 hipp_csc_max_c)
{
    U_V0_HIPP_CSC_MAX_C HIPP_CSC_MAX_C;

    HIPP_CSC_MAX_C.u32 = VDP_RegRead((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MAX_C.u32) + u32OffsetAddr);
    HIPP_CSC_MAX_C.bits.hipp_csc_max_c = hipp_csc_max_c;
    VDP_RegWrite(((HI_ULONG)&(pstVdpReg->V0_HIPP_CSC_MAX_C.u32) + u32OffsetAddr),HIPP_CSC_MAX_C.u32);

    return ;
}

