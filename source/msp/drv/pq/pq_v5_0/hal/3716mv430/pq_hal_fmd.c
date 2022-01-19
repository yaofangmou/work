/****************************************************************************
*
* Copyright (C) 2014-2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_fmd.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2014/2/18
  Description   :

******************************************************************************/

#include "pq_hal_fmd.h"
#include "hi_math.h"

HI_S32 PQ_HAL_GetIFmdStatInfo(S_VPSS_STT_REGS_TYPE *pstVpssWbcReg, IFMD_TotalHardPara *pIfmdTotalHardPara)
{
    HI_U32 i = 0;

    PQ_CHECK_NULL_PTR_RE_FAIL(pIfmdTotalHardPara);
    //PQ_CHECK_NULL_PTR_RE_FAIL(pstIfmdCalcInfo);

    pIfmdTotalHardPara->stFmdRtlStatPara.frmHstBin.HISTOGRAM_BIN_1 = pstVpssWbcReg->VPSS_PDHISTBIN0.bits.hist_bin0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmHstBin.HISTOGRAM_BIN_2 = pstVpssWbcReg->VPSS_PDHISTBIN1.bits.hist_bin1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmHstBin.HISTOGRAM_BIN_3 = pstVpssWbcReg->VPSS_PDHISTBIN2.bits.hist_bin2;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmHstBin.HISTOGRAM_BIN_4 = pstVpssWbcReg->VPSS_PDHISTBIN3.bits.hist_bin3;

    pIfmdTotalHardPara->stFmdRtlStatPara.frmITDiff = pstVpssWbcReg->VPSS_PDFRMITDIFF.bits.frm_it_diff;

    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_BWD      = pstVpssWbcReg->VPSS_PDPCCBWD0.bits.pcc_bwd_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_FWD      = pstVpssWbcReg->VPSS_PDPCCFWD0.bits.pcc_fwd_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_FFWD     = pstVpssWbcReg->VPSS_PDPCCFFWD0.bits.pcc_ffwd_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_CRSS     = pstVpssWbcReg->VPSS_PDPCCCRSS0.bits.pcc_crss_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_FWD_TKR  = pstVpssWbcReg->VPSS_PDPCCFWDTKR0.bits.pcc_fwd_tkr_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc.PCC_BWD_TKR  = pstVpssWbcReg->VPSS_PDPCCBWDTKR0.bits.pcc_bwd_tkr_0;

    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_BWD     = pstVpssWbcReg->VPSS_PDPCCBWD1.bits.pcc_bwd_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_FWD     = pstVpssWbcReg->VPSS_PDPCCFWD1.bits.pcc_fwd_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_FFWD    = pstVpssWbcReg->VPSS_PDPCCFFWD1.bits.pcc_ffwd_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_CRSS    = pstVpssWbcReg->VPSS_PDPCCCRSS1.bits.pcc_crss_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_FWD_TKR = pstVpssWbcReg->VPSS_PDPCCFWDTKR1.bits.pcc_fwd_tkr_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmPcc2.PCC_BWD_TKR = pstVpssWbcReg->VPSS_PDPCCBWDTKR1.bits.pcc_bwd_tkr_1;

    pIfmdTotalHardPara->stFmdRtlStatPara.frmUm.match_UM      = pstVpssWbcReg->VPSS_PDUMMATCH0.bits.match_um0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmUm.nonmatch_UM   = pstVpssWbcReg->VPSS_PDUMNOMATCH0.bits.nomatch_um0;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmUm.match_UM2     = pstVpssWbcReg->VPSS_PDUMMATCH1.bits.match_um1;
    pIfmdTotalHardPara->stFmdRtlStatPara.frmUm.nonmatch_UM2  = pstVpssWbcReg->VPSS_PDUMNOMATCH1.bits.nomatch_um1;

    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat.lasiCnt14  = pstVpssWbcReg->VPSS_PDLASICNT140.bits.lasi_14_cnt_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat.lasiCnt32  = pstVpssWbcReg->VPSS_PDLASICNT320.bits.lasi_32_cnt_0;
    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat.lasiCnt34  = pstVpssWbcReg->VPSS_PDLASICNT340.bits.lasi_34_cnt_0;

    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat2.lasiCnt14 = pstVpssWbcReg->VPSS_PDLASICNT141.bits.lasi_14_cnt_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat2.lasiCnt32 = pstVpssWbcReg->VPSS_PDLASICNT321.bits.lasi_32_cnt_1;
    pIfmdTotalHardPara->stFmdRtlStatPara.lasiStat2.lasiCnt34 = pstVpssWbcReg->VPSS_PDLASICNT341.bits.lasi_34_cnt_1;

    pIfmdTotalHardPara->stFmdRtlStatPara.SceneChangeInfo.iCHD = pstVpssWbcReg->VPSS_PDICHD.bits.ichd;

    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[0] = pstVpssWbcReg->VPSS_PDSTLBLKSAD0.bits.stlblk_sad002;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[1] = pstVpssWbcReg->VPSS_PDSTLBLKSAD1.bits.stlblk_sad012;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[2] = pstVpssWbcReg->VPSS_PDSTLBLKSAD2.bits.stlblk_sad022;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[3] = pstVpssWbcReg->VPSS_PDSTLBLKSAD3.bits.stlblk_sad032;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[4] = pstVpssWbcReg->VPSS_PDSTLBLKSAD4.bits.stlblk_sad102;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[5] = pstVpssWbcReg->VPSS_PDSTLBLKSAD5.bits.stlblk_sad112;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[6] = pstVpssWbcReg->VPSS_PDSTLBLKSAD6.bits.stlblk_sad122;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[7] = pstVpssWbcReg->VPSS_PDSTLBLKSAD7.bits.stlblk_sad132;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[8] = pstVpssWbcReg->VPSS_PDSTLBLKSAD8.bits.stlblk_sad202;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[9] = pstVpssWbcReg->VPSS_PDSTLBLKSAD9.bits.stlblk_sad212;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[10] = pstVpssWbcReg->VPSS_PDSTLBLKSAD10.bits.stlblk_sad222;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[11] = pstVpssWbcReg->VPSS_PDSTLBLKSAD11.bits.stlblk_sad232;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[12] = pstVpssWbcReg->VPSS_PDSTLBLKSAD12.bits.stlblk_sad302;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[13] = pstVpssWbcReg->VPSS_PDSTLBLKSAD13.bits.stlblk_sad312;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[14] = pstVpssWbcReg->VPSS_PDSTLBLKSAD14.bits.stlblk_sad322;
    pIfmdTotalHardPara->stFmdRtlStatPara.StillBlkInfo.BlkSad[15] = pstVpssWbcReg->VPSS_PDSTLBLKSAD15.bits.stlblk_sad332;

    pIfmdTotalHardPara->stMadRtlStatPara.u32SmallMtnNum = pstVpssWbcReg->iglb_mtn_num0.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32SmallMtnSum = pstVpssWbcReg->iglb_mtn_sum0.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum0  = pstVpssWbcReg->iglb_mtn_num1.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum0  = pstVpssWbcReg->iglb_mtn_sum1.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum1  = pstVpssWbcReg->iglb_mtn_num2.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum1  = pstVpssWbcReg->iglb_mtn_sum2.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum2  = pstVpssWbcReg->iglb_mtn_num3.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum2  = pstVpssWbcReg->iglb_mtn_sum3.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32LargeMtnNum = pstVpssWbcReg->iglb_mtn_num4.u32;
    pIfmdTotalHardPara->stMadRtlStatPara.u32LargeMtnSum = pstVpssWbcReg->iglb_mtn_sum4.u32;

    pqprint(PQ_PRN_FMD_READ, "[%s]: frmITDiff:%d, SmallMtnNum:%d, SmallMtnSum:%d, MidMtnNum0:%d, MidMtnSum0:%d, MidMtnNum1:%d, "
            "MidMtnSum1:%d,MidMtnNum2:%d, MidMtnSum2:%d, LargeMtnNum:%d, LargeMtnSum:%d\n",
            __FUNCTION__,
            pIfmdTotalHardPara->stFmdRtlStatPara.frmITDiff,
            pIfmdTotalHardPara->stMadRtlStatPara.u32SmallMtnNum,
            pIfmdTotalHardPara->stMadRtlStatPara.u32SmallMtnSum,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum0,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum0,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum1,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum1,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnNum2,
            pIfmdTotalHardPara->stMadRtlStatPara.u32MidMtnSum2,
            pIfmdTotalHardPara->stMadRtlStatPara.u32LargeMtnNum,
            pIfmdTotalHardPara->stMadRtlStatPara.u32LargeMtnSum);



    /*PQ_SAFE_MEMCPY((HI_VOID *) & pIfmdTotalHardPara->stMadRtlStatPara.u32MotionHist[0], \
                   (HI_VOID *) & (pstVpssWbcReg->iglb_mtn_bin0.u32), sizeof(pIfmdTotalHardPara->stMadRtlStatPara.u32MotionHist));*/

    for (i = 0; i < PQ_STT_MOTION_NUM; i++)
    {
        pIfmdTotalHardPara->stMadRtlStatPara.u32MotionHist[i] = (*(&(pstVpssWbcReg->iglb_mtn_bin0) + i)).u32;
    }
    return HI_SUCCESS;
}


/*--------------------------------------------------------------------------------*
Function        : HI_VOID SetIFmdInfo(HI_U32 u32HandleNo,IFMD_TotalHardPara *pIfmdTotalHardPara)

Description     : 每场回写给OSD的寄存器值
Calls           :
Data Accessed   :
Data Updated    :
Input           : u32HandleNo
                : pIfmdTotalHardPara
Output          : NA
Return          : NA
*--------------------------------------------------------------------------------*/

HI_S32 PQ_HAL_SetIFmdInfo(HI_U32 u32HandleNo, HI_PQ_VPSS_OUT_INFO_S *pstPqVpssOutInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPqVpssOutInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssAlgRegOut);

    pstVpssAlgRegOut->VPSS_DIECTRL.bits.die_out_sel_c = pstPqVpssOutInfo->die_out_sel;
    pstVpssAlgRegOut->VPSS_DIECTRL.bits.die_out_sel_l = pstPqVpssOutInfo->die_out_sel;
    pstVpssAlgRegOut->VPSS_DIECTRL.bits.mchdir_c      = pstPqVpssOutInfo->dir_mch;
    pstVpssAlgRegOut->VPSS_DIECTRL.bits.mchdir_l      = pstPqVpssOutInfo->dir_mch;

    pqprint(PQ_PRN_FMD_CALC, "die_out_sel_c:%d, die_out_sel_l:%d, mchdir_c:%d, mchdir_l:%d u32FieldOrder:%d\n",
            pstVpssAlgRegOut->VPSS_DIECTRL.bits.die_out_sel_c,
            pstVpssAlgRegOut->VPSS_DIECTRL.bits.die_out_sel_l,
            pstVpssAlgRegOut->VPSS_DIECTRL.bits.mchdir_c,
            pstVpssAlgRegOut->VPSS_DIECTRL.bits.mchdir_l,
            pstPqVpssOutInfo->u32FieldOrder);
    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetIFmdEn(HI_U32 u32HandleNo, HI_U32 u32IFmdEn)
{
    S_VPSS_REGS_TYPE *pstVpssVirReg = NULL;
    pstVpssVirReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssVirReg);

    /* Logic limit: When dei close, can not open ifmd_en*/
    pstVpssVirReg->V0_VPSS_CTRL.bits.ifmd_en = u32IFmdEn;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetEdgeSmoothEn(HI_U32 u32HandleNo, HI_BOOL bEdgeSmoothEn, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssAlgRegOut);

    pstVpssAlgRegOut->VPSS_DIECTRL.bits.edge_smooth_en = bEdgeSmoothEn;

    pqprint(PQ_PRN_FMD_CALC, "edge_smooth_en:%d\n", pstVpssAlgRegOut->VPSS_DIECTRL.bits.edge_smooth_en);

    return HI_SUCCESS;
}


