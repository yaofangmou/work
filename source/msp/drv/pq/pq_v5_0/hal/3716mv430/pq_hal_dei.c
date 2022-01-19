/******************************************************************************

  Copyright (C), 2012-2050, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : pq_hal_dei.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2013/11/20
  Description   :

******************************************************************************/
#include "hi_type.h"
#include "pq_hal_dei.h"
#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"


/* ����globalmotion ��������˶���Ϣ����gainֵ */
HI_S32 PQ_HAL_SetDeiAdjustGain(HI_U32 u32HandleNo, HI_U32 u32AdjustGain)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    pstVpssVirReg->VPSS_DIEMTNADJ.bits.motion_adjust_gain = u32AdjustGain;
    return HI_SUCCESS;
}

/* ��ȡ�����˶���Ϣinterlace globa motion����״̬ */
HI_S32 PQ_HAL_GetInterlaceMotionEn(HI_U32 u32HandleNo, HI_BOOL *bIgbmEn)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    *bIgbmEn = pstVpssVirReg->V0_VPSS_CTRL.bits.igbm_en & 0x1;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetInterlaceMotionEn(HI_U32 u32HandleNo, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    /* Logic limit: When dei close, can not open igbm_en; So PQ do not control */
    pstVpssVirReg->V0_VPSS_CTRL.bits.igbm_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetSoftRegByReso(HI_U32 u32HandleNo, HI_U32 u32R0_MC)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    pstVpssVirReg->VPSS_MCDI_MC5.bits.r0_mc = u32R0_MC;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetSoftReg(HI_U32 u32HandleNo, HI_Mc_DeiParam_S *pstMcParm, HI_DEI_Variable_S *pstDeiVar)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);
    /*
        pstVpssVirReg->VPSS_DIEMTNADJ.bits.motion_adjust_gain = pstDeiVar->stMDINFO.ADJUST_GAIN;
        pstVpssVirReg->VPSS_DIEHISMODE.bits.rec_mode_fld_motion_step_1 = pstDeiVar->stMDINFO.rec_mode_fld_motion_step_1 ;
        pstVpssVirReg->VPSS_DIEHISMODE.bits.rec_mode_fld_motion_step_0 = pstDeiVar->stMDINFO.rec_mode_fld_motion_step_0 ;
    */
    return HI_SUCCESS;
}

HI_S32 PQ_HAL_UpdateBlkRect(HI_U32 u32HandleNo, HI_U32 u32Width, HI_U32 u32Height)
{
    HI_U32 blkmvendc, blkmvstartc;
    //S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;

    blkmvstartc = 0;

    if (u32Width >= 2)
    {
        if (u32Width > 960)
        {
            blkmvendc = u32Width / 2 - 1;
        }
        else
        {
            blkmvendc = u32Width - 1;
        }
    }
    else
    {
        blkmvendc = 1;
    }

    //pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    //PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    //pstVpssVirReg->VPSS_MCDI_BLKH.bits.blkmvendc   = blkmvendc;
    //pstVpssVirReg->VPSS_MCDI_BLKH.bits.blkmvstartc = blkmvstartc;

    return HI_SUCCESS;
}


HI_S32 PQ_HAL_EnableDeiDemo(HI_U32 u32HandleNo, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = HI_NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetMaDeiEn(HI_U32 u32HandleNo, HI_BOOL *pbOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    *pbOnOff = pstVpssVirReg->V0_VPSS_CTRL.bits.dei_en;


    return HI_SUCCESS;
}


HI_S32 PQ_HAL_SetDeiDemoMode(HI_U32 u32HandleNo, DEI_DEMO_MODE_E enMode)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = HI_NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    if (DEI_DEMO_ENABLE_L == enMode) /* Enable_L: L-McEnable; R-McDisable */
    {
        pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_mode_l = MC_DIOUTPUT;
        pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_mode_r = MC_DIDISABLE;
    }
    else /* Enable_R: R-McEnable; L-McDisable */
    {
        pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_mode_l = MC_DIDISABLE;
        pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_mode_r = MC_DIOUTPUT;
    }

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetDeiDemoModeCoor(HI_U32 u32HandleNo, HI_U32 u32XPos)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = HI_NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    pstVpssVirReg->VPSS_MCDI_DEMO.bits.demo_border = u32XPos;

    return HI_SUCCESS;
}



