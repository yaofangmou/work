/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_gfxzme.c
  Version       : Initial Draft
  Author        : sdk sdk
  Created       : 2015/10/15
  Description   :

******************************************************************************/

#include "pq_hal_gfxzme.h"

HI_VOID PQ_HAL_SetGZmeEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_GP0_ZME_HSP GP0_ZME_HSP;
    volatile U_GP0_ZME_VSP GP0_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    /* GP zoom enable */
    if ((enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hsc_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vsc_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }

    return;
}


HI_VOID PQ_HAL_SetGZmePhase(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_S32 s32Phase)
{
    volatile U_GP0_ZME_HLOFFSET  GP0_ZME_HLOFFSET;
    volatile U_GP0_ZME_HCOFFSET  GP0_ZME_HCOFFSET;
    volatile U_GP0_ZME_VOFFSET   GP0_ZME_VOFFSET;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    if ((enMode == PQ_GZME_MODE_HORL) || (enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HLOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HLOFFSET.u32)) ));
        GP0_ZME_HLOFFSET.bits.hor_loffset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HLOFFSET.u32)) ), GP0_ZME_HLOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_HORC) || (enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HCOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HCOFFSET.u32)) ));
        GP0_ZME_HCOFFSET.bits.hor_coffset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HCOFFSET.u32)) ), GP0_ZME_HCOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERL) || (enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VOFFSET.u32)) ));
        GP0_ZME_VOFFSET.bits.vbtm_offset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VOFFSET.u32)) ), GP0_ZME_VOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERC) || (enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VOFFSET.u32)) ));
        GP0_ZME_VOFFSET.bits.vtp_offset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VOFFSET.u32)) ), GP0_ZME_VOFFSET.u32);
    }

    return;
}

HI_VOID PQ_HAL_SetGZmeFirEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_GP0_ZME_HSP        GP0_ZME_HSP;
    volatile U_GP0_ZME_VSP        GP0_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    if ((enMode == PQ_GZME_MODE_ALPHA) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hafir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hfir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_ALPHAV) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vafir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vfir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }

    return;
}

HI_VOID PQ_HAL_SetGZmeMidEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_GP0_ZME_HSP        GP0_ZME_HSP;
    volatile U_GP0_ZME_VSP        GP0_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    /* VHD layer zoom enable */
    if ((enMode == PQ_GZME_MODE_ALPHA) || (enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hamid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }
    if ((enMode == PQ_GZME_MODE_HORL) || (enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hlmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_HORC) || (enMode == PQ_GZME_MODE_HOR) )
    {
        GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
        GP0_ZME_HSP.bits.hchmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_ALPHAV) || (enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vamid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }
    if ((enMode == PQ_GZME_MODE_VERL) || (enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vlmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERC) || (enMode == PQ_GZME_MODE_VER) )
    {
        GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
        GP0_ZME_VSP.bits.vchmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);
    }

    return;
}


HI_VOID PQ_HAL_SetGZmeHorRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    volatile U_GP0_ZME_HSP        GP0_ZME_HSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
    GP0_ZME_HSP.bits.hratio = u32Ratio;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeHorOutWidth(HI_U32 u32Width)
{
    volatile U_GP0_ZME_HINFO        GP0_ZME_HINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_HINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HINFO.u32)) ));
    GP0_ZME_HINFO.bits.out_width = u32Width - 1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HINFO.u32)) ), GP0_ZME_HINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeVerRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    volatile U_GP0_ZME_VSR        GP0_ZME_VSR;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_VSR.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSR.u32)) ));
    GP0_ZME_VSR.bits.vratio = u32Ratio;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSR.u32)) ), GP0_ZME_VSR.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeVerOutWidth(HI_U32 u32Height)
{
    volatile U_GP0_ZME_VINFO        GP0_ZME_VINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_VINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VINFO.u32)) ));
    GP0_ZME_VINFO.bits.out_height = u32Height - 1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VINFO.u32)) ), GP0_ZME_VINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeVerOutPro(HI_BOOL bOutPro)
{
    volatile U_GP0_ZME_VINFO        GP0_ZME_VINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_VINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VINFO.u32)) ));
    GP0_ZME_VINFO.bits.out_pro = bOutPro;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VINFO.u32)) ), GP0_ZME_VINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeHfirOrder(HI_U32 u32Data, HI_U32 u32HfirOrder)
{
    volatile U_GP0_ZME_HSP        GP0_ZME_HSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ));
    GP0_ZME_HSP.bits.hfir_order = u32HfirOrder;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_HSP.u32)) ), GP0_ZME_HSP.u32);

    return;
}

HI_VOID PQ_HAL_SetGZmeCoefAddr(HI_U32 u32Data, HI_U32 u32Mode, HI_U32 u32Addr)
{
    volatile U_PARA_ADDR_VHD_CHN04 PARA_ADDR_VHD_CHN04;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    PARA_ADDR_VHD_CHN04.bits.para_addr_vhd_chn04 = u32Addr;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_ADDR_VHD_CHN04.u32))), PARA_ADDR_VHD_CHN04.u32);

    return;
}

HI_VOID  PQ_HAL_SetGZmeParaUpd       (HI_U32 u32Data, HI_U32 enMode)
{
    volatile U_PARA_UP_VHD PARA_UP_VHD;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    PARA_UP_VHD.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_UP_VHD.u32))));
    PARA_UP_VHD.bits.para_up_vhd_chn04 = 0x1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    return ;
}

/***************************************************************************************
* func          : PQ_HAL_SetGZmeTabV
* description   : CNcomment: 设置ZME阶数，用来做微缩使用 HIFONE B02新增 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID PQ_HAL_SetGZmeTabV(HI_U32 u32Data, HI_U32 u32ZmeTabV)
{
    volatile U_GP0_ZME_VSP   GP0_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    GP0_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ));
    GP0_ZME_VSP.bits.vfir_2tap_en = u32ZmeTabV;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->GP0_ZME_VSP.u32)) ), GP0_ZME_VSP.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_WBC_GP_ZME_HSP WBC_GP_ZME_HSP;
    volatile U_WBC_GP_ZME_VSP WBC_GP_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    /* GP zoom enable */
    if ((enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hsc_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vsc_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }

    return;
}


HI_VOID PQ_HAL_SetWbcGpZmePhase(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_S32 s32Phase)
{
    volatile U_WBC_GP_ZME_HLOFFSET  WBC_GP_ZME_HLOFFSET;
    volatile U_WBC_GP_ZME_HCOFFSET  WBC_GP_ZME_HCOFFSET;
    volatile U_WBC_GP_ZME_VOFFSET   WBC_GP_ZME_VOFFSET;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    if ((enMode == PQ_GZME_MODE_HORL) || (enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HLOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HLOFFSET.u32)) ));
        WBC_GP_ZME_HLOFFSET.bits.hor_loffset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HLOFFSET.u32)) ), WBC_GP_ZME_HLOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_HORC) || (enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HCOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HCOFFSET.u32)) ));
        WBC_GP_ZME_HCOFFSET.bits.hor_coffset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HCOFFSET.u32)) ), WBC_GP_ZME_HCOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERL) || (enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VOFFSET.u32)) ));
        WBC_GP_ZME_VOFFSET.bits.vbtm_offset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VOFFSET.u32)) ), WBC_GP_ZME_VOFFSET.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERC) || (enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VOFFSET.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VOFFSET.u32)) ));
        WBC_GP_ZME_VOFFSET.bits.vtp_offset = s32Phase;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VOFFSET.u32)) ), WBC_GP_ZME_VOFFSET.u32);
    }

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeFirEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_WBC_GP_ZME_HSP        WBC_GP_ZME_HSP;
    volatile U_WBC_GP_ZME_VSP        WBC_GP_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    if ((enMode == PQ_GZME_MODE_ALPHA) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hafir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hfir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_ALPHAV) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vafir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vfir_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeMidEnable(HI_U32 u32Data, PQ_GZME_MODE_E enMode, HI_U32 u32bEnable)
{
    volatile U_WBC_GP_ZME_HSP        WBC_GP_ZME_HSP;
    volatile U_WBC_GP_ZME_VSP        WBC_GP_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    /* VHD layer zoom enable */
    if ((enMode == PQ_GZME_MODE_ALPHA) || (enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hamid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }
    if ((enMode == PQ_GZME_MODE_HORL) || (enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hlmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_HORC) || (enMode == PQ_GZME_MODE_HOR) )
    {
        WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
        WBC_GP_ZME_HSP.bits.hchmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_ALPHAV) || (enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vamid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }
    if ((enMode == PQ_GZME_MODE_VERL) || (enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vlmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }

    if ((enMode == PQ_GZME_MODE_VERC) || (enMode == PQ_GZME_MODE_VER) )
    {
        WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
        WBC_GP_ZME_VSP.bits.vchmid_en = u32bEnable;
        PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);
    }

    return;
}


HI_VOID PQ_HAL_SetWbcGpZmeHorRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    volatile U_WBC_GP_ZME_HSP        WBC_GP_ZME_HSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
    WBC_GP_ZME_HSP.bits.hratio = u32Ratio;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeHorOutWidth(HI_U32 u32Width)
{
    volatile U_WBC_GP_ZME_HINFO        WBC_GP_ZME_HINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_HINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HINFO.u32)) ));
    WBC_GP_ZME_HINFO.bits.out_width = u32Width - 1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HINFO.u32)) ), WBC_GP_ZME_HINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeVerRatio(HI_U32 u32Data, HI_U32 u32Ratio)
{
    volatile U_WBC_GP_ZME_VSR        WBC_GP_ZME_VSR;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_VSR.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSR.u32)) ));
    WBC_GP_ZME_VSR.bits.vratio = u32Ratio;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSR.u32)) ), WBC_GP_ZME_VSR.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeVerOutWidth(HI_U32 u32Height)
{
    volatile U_WBC_GP_ZME_VINFO        WBC_GP_ZME_VINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_VINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VINFO.u32)) ));
    WBC_GP_ZME_VINFO.bits.out_height = u32Height - 1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VINFO.u32)) ), WBC_GP_ZME_VINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeVerOutPro(HI_BOOL bOutPro)
{
    volatile U_WBC_GP_ZME_VINFO        WBC_GP_ZME_VINFO;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_VINFO.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VINFO.u32)) ));
    WBC_GP_ZME_VINFO.bits.out_pro = bOutPro;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VINFO.u32)) ), WBC_GP_ZME_VINFO.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeHfirOrder(HI_U32 u32Data, HI_U32 u32HfirOrder)
{
    volatile U_WBC_GP_ZME_HSP        WBC_GP_ZME_HSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_HSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ));
    WBC_GP_ZME_HSP.bits.hfir_order = u32HfirOrder;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_HSP.u32)) ), WBC_GP_ZME_HSP.u32);

    return;
}

HI_VOID PQ_HAL_SetWbcGpZmeCoefAddr(HI_U32 u32Data, HI_U32 u32Mode, HI_U32 u32Addr)
{
    volatile U_PARA_ADDR_VHD_CHN10 PARA_ADDR_VHD_CHN10;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    PARA_ADDR_VHD_CHN10.bits.para_addr_vhd_chn10 = u32Addr;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_ADDR_VHD_CHN10.u32))), PARA_ADDR_VHD_CHN10.u32);

    return;
}

HI_VOID  PQ_HAL_SetWbcGpZmeParaUpd       (HI_U32 u32Data, HI_U32 enMode)
{
    volatile U_PARA_UP_VHD PARA_UP_VHD;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    PARA_UP_VHD.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_UP_VHD.u32))));
    PARA_UP_VHD.bits.para_up_vhd_chn10 = 0x1;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->PARA_UP_VHD.u32))), PARA_UP_VHD.u32);
    return ;
}

/***************************************************************************************
* func          : PQ_HAL_SetWbcGpZmeTabV
* description   : CNcomment: 设置ZME阶数，用来做微缩使用 HIFONE B02新增 CNend\n
* param[in]     : HI_VOID
* retval        : NA
* others:       : NA
***************************************************************************************/
HI_VOID PQ_HAL_SetWbcGpZmeTabV(HI_U32 u32Data, HI_U32 u32ZmeTabV)
{
    volatile U_WBC_GP_ZME_VSP   WBC_GP_ZME_VSP;
    S_VDP_REGS_TYPE *pVDPReg = HI_NULL;

    pVDPReg = PQ_HAL_GetVdpRealReg();
    PQ_CHECK_NULL_PTR_RE_NULL(pVDPReg);

    WBC_GP_ZME_VSP.u32 = PQ_HAL_RegRead((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ));
    WBC_GP_ZME_VSP.bits.vfir_2tap_en = u32ZmeTabV;
    PQ_HAL_RegWrite((HI_U32 *)((unsigned long)(&(pVDPReg->WBC_GP_ZME_VSP.u32)) ), WBC_GP_ZME_VSP.u32);

    return;
}

