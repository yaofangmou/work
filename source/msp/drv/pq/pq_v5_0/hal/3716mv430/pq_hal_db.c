/******************************************************************************

Copyright (C), 2012-2014, Hisilicon Tech. Co., Ltd.

******************************************************************************
File Name     : pq_hal_db.c
Version       : Initial Draft
Author        :
Created       : 2015/10/09
Description   : De-blocking

******************************************************************************/
#include <linux/string.h>
#include "pq_hal_db.h"
#include "pq_hal_comm.h"
#include "drv_pq_comm.h"
//#include "hi_math.h"
HI_U32  g_u32HalDbStr = 8;

HI_S32 PQ_HAL_SetDBStrengh(HI_U32 u32HandleNo, HI_U32 u32Strength)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    g_u32HalDbStr       = u32Strength * 16 / 100; /* 0~15; Low:4; Mid:8; High:12 */

    pstVpssReg->VPSS_DB_RATIO.bits.db_global_db_strenth_lum = g_u32HalDbStr;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetDbDrvInFromReg(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DB_REG_IN_S *pstRegIn)
{
    int i = 0;
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssReg = HI_NULL;
    S_VPSS_STT_REGS_TYPE *pstVpssWbcReg = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstRegIn);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssReg);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssWbcReg);

    /* stDbDetectRegIn */
    pstRegIn->stDbDetectRegIn.u16DetSizeEn      = HI_TRUE;//pstVpssRegInfo->pstVpssReg->V0_VPSS_CTRL.bits.blk_det_en    ; //

    pstVpssReg = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssReg);
    pstVpssWbcReg = (S_VPSS_STT_REGS_TYPE *)(pstVpssRegInfo->pstVpssWbcReg);

    pstRegIn->stDbDetectRegIn.u16DetHyEn        = pstVpssReg->VPSS_DBM_CTRL.bits.det_hy_en    ;

    pstRegIn->stDbDetectRegIn.s32HyCounter      = pstVpssWbcReg->DB_HY_SIZE.bits.hy_counter   ;
    pstRegIn->stDbDetectRegIn.s32HySize         = pstVpssWbcReg->DB_HY_SIZE.bits.hy_size      ;
    pqprint(PQ_PRN_DB_READ, "s32HyCounter = 0x%x, db s32HySize = 0x%x\n", pstRegIn->stDbDetectRegIn.s32HyCounter, pstRegIn->stDbDetectRegIn.s32HySize);

    pstRegIn->stDbDetectRegIn.u16TestBlkNumHy   = pstVpssReg->VPSS_DBD_TSTBLKNUM.bits.dbd_hy_tst_blk_num    ;
    pstRegIn->stDbDetectRegIn.u16MinBlkSize     = pstVpssReg->VPSS_DBD_BLKSIZE.bits.dbd_min_blk_size        ;
    pstRegIn->stDbDetectRegIn.u16MaxBlkSizeHy   = pstVpssReg->VPSS_DBD_BLKSIZE.bits.dbd_hy_max_blk_size     ;

    for (i = 0; i < 128; i++)
    {
        pstRegIn->stDbDetectRegIn.au32DbBorder[i] = pstVpssWbcReg->DB_BORDER[i].u32;
        pqprint(PQ_PRN_DB_READ, "i = %d, db border = %d\n", i, pstVpssWbcReg->DB_BORDER[i].u32);
    }

    for (i = 0; i < DB_BORDER_COUNTER; i++)
    {
        pstRegIn->stDbDetectRegIn.as32DbHyCounter[i] = pstVpssWbcReg->DB_HY_COUNTER[i].u32;
        pqprint(PQ_PRN_DB_READ, "i = %d, db counter = %d\n", i, pstVpssWbcReg->DB_HY_COUNTER[i].u32);
    }

    /* stDbFltRegIn */
    pstRegIn->stDbFltRegIn.u8DbEn           = pstVpssReg->VPSS_DBM_CTRL.bits.db_en                      ;
    pqprint(PQ_PRN_DB_READ, "db en = %d\n", pstRegIn->stDbFltRegIn.u8DbEn);

    pstRegIn->stDbFltRegIn.u8DBLumHorEn     = pstVpssReg->VPSS_DBM_CTRL.bits.db_lum_hor_en              ;

    pstRegIn->stDbFltRegIn.u16LumHBlkSize   = pstVpssReg->VPSS_DB_BLK.bits.db_lum_h_blk_size            ;
    pstRegIn->stDbFltRegIn.s32LumHBlkNum    = 0;//pstVpssReg->VPSS_DBD_TSTBLKNUM.bits.dbd_hy_tst_blk_num    ;

    pstRegIn->stDbFltRegIn.u8GradSubRatio   = pstVpssReg->VPSS_DB_DIR.bits.db_grad_sub_ratio            ;
    pstRegIn->stDbFltRegIn.u8CtrstThresh    = pstVpssReg->VPSS_DB_DIR.bits.db_ctrst_thresh              ;

    pstRegIn->stDbFltRegIn.au8DirStrGainLut[0]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p0        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[1]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p1        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[2]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p2        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[3]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p3        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[4]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p4        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[5]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p5        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[6]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p6        ;
    pstRegIn->stDbFltRegIn.au8DirStrGainLut[7]        = pstVpssReg->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p7        ;

    pstRegIn->stDbFltRegIn.au8DirStrLut[0]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p0             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[1]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p1             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[2]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p2             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[3]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p3             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[4]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p4             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[5]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p5             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[6]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p6             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[7]            = pstVpssReg->VPSS_DB_LUT5.bits.db_dir_str_lut_p7             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[8]            = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p8             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[9]            = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p9             ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[10]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p10            ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[11]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p11            ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[12]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p12            ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[13]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p13            ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[14]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p14            ;
    pstRegIn->stDbFltRegIn.au8DirStrLut[15]           = pstVpssReg->VPSS_DB_LUT6.bits.db_dir_str_lut_p15            ;

    pstRegIn->stDbFltRegIn.u8LumHorScaleRatio        = pstVpssReg->VPSS_DB_RATIO.bits.db_lum_hor_scale_ratio       ;
    pstRegIn->stDbFltRegIn.u8LumHorFilterSel         = pstVpssReg->VPSS_DB_RATIO.bits.db_lum_hor_filter_sel        ;

    pstRegIn->stDbFltRegIn.u8GlobalDbStrengthLum     = pstVpssReg->VPSS_DB_RATIO.bits.db_global_db_strenth_lum     ;
    pstRegIn->stDbFltRegIn.u8LumHorTxtWinSize        = pstVpssReg->VPSS_DB_RATIO.bits.db_lum_hor_txt_win_size      ;
    pstRegIn->stDbFltRegIn.u8MaxLumHorDbDist         = pstVpssReg->VPSS_DB_CTRS.bits.db_max_lum_hor_db_dist        ;

    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[0 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p0 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[1 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p1 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[2 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p2 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[3 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p3 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[4 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p4 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[5 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p5 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[6 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p6 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[7 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p7 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[8 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p8 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[9 ]        = pstVpssReg->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p9 ;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[10]        = pstVpssReg->VPSS_DB_LUT3.bits.db_lum_h_str_fade_lut_p10;
    pstRegIn->stDbFltRegIn.au8LumHStrFadeLut[11]        = pstVpssReg->VPSS_DB_LUT3.bits.db_lum_h_str_fade_lut_p11;

    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[0 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p0 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[1 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p1 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[2 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p2 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[3 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p3 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[4 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p4 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[5 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p5 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[6 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p6 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[7 ]        = pstVpssReg->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p7 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[8 ]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p8 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[9 ]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p9 ;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[10]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p10;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[11]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p11;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[12]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p12;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[13]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p13;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[14]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p14;
    pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[15]        = pstVpssReg->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p15;
    //pstRegIn->stDbFltRegIn.au8LumHorDeltaLut[16]        =  //没有这个

    pstRegIn->stDbFltRegIn.u16LumHorHFDiffCore      =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_core       ;
    pstRegIn->stDbFltRegIn.u16LumHorHFDiffGain1     =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_gain1      ;
    pstRegIn->stDbFltRegIn.u16LumHorHFDiffGain2     =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_gain2      ;
    pstRegIn->stDbFltRegIn.u16LumHorHFVarCore       =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_core        ;
    pstRegIn->stDbFltRegIn.u16LumHorHFVarGain1      =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_gain1       ;
    pstRegIn->stDbFltRegIn.u16LumHorHFVarGain2      =     pstVpssReg->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_gain2       ;
    pstRegIn->stDbFltRegIn.u16LumHorBordAdjGain     =     pstVpssReg->VPSS_DB_LVHF.bits.db_lum_hor_bord_adj_gain      ;

    pstRegIn->stDbFltRegIn.u16CtrstAdjCore          =     pstVpssReg->VPSS_DB_CTRS.bits.db_ctrst_adj_core             ;
    pstRegIn->stDbFltRegIn.u16CtrstAdjGain1         =     pstVpssReg->VPSS_DB_CTRS.bits.db_ctrst_adj_gain1            ;
    pstRegIn->stDbFltRegIn.u16CtrstAdjGain2         =     pstVpssReg->VPSS_DB_CTRS.bits.db_ctrst_adj_gain2            ;
    pstRegIn->stDbFltRegIn.u16DirSmoothMode         =     pstVpssReg->VPSS_DB_CTRS.bits.db_dir_smooth_mode            ;
    //printk("db in %d\n",pstRegIn->stDbFltRegIn.u16LumHorAdjGain);

    pstRegIn->stDbFltRegIn.u16LumHorAdjGain         =     pstVpssReg->VPSS_DB_LVHF.bits.db_lum_hor_adj_gain           ;

    return HI_SUCCESS;
}


HI_S32 PQ_HAL_SetDbRegFromRegout(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DB_REG_OUT_S *pstRegOut)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstRegOut);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    /* stDbDetectRegIn */
    //pstVpssRegInfo->pstVpssAlgRegOut->V0_VPSS_CTRL.bits.blk_det_en    =   pstRegOut->stDbDetectRegOut.u16DetSizeEn    ;  //do not need to set here

    pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.det_hy_en    =   pstRegOut->stDbDetectRegOut.u16DetHyEn      ;

    pstVpssAlgRegOut->VPSS_DBD_TSTBLKNUM.bits.dbd_hy_tst_blk_num =    pstRegOut->stDbDetectRegOut.u16TestBlkNumHy   ;
    pstVpssAlgRegOut->VPSS_DBD_BLKSIZE.bits.dbd_min_blk_size     =    pstRegOut->stDbDetectRegOut.u16MinBlkSize     ;
    pstVpssAlgRegOut->VPSS_DBD_BLKSIZE.bits.dbd_hy_max_blk_size  =    pstRegOut->stDbDetectRegOut.u16MaxBlkSizeHy   ;

    //VPSS_DB_BORD_FLAG   //只使用其中的32个
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG0.bits.vpss_db_bord_flag_0   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[0];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG1.bits.vpss_db_bord_flag_1   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[1];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG2.bits.vpss_db_bord_flag_2   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[2];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG3.bits.vpss_db_bord_flag_3   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[3];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG4.bits.vpss_db_bord_flag_4   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[4];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG5.bits.vpss_db_bord_flag_5   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[5];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG6.bits.vpss_db_bord_flag_6   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[6];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG7.bits.vpss_db_bord_flag_7   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[7];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG8.bits.vpss_db_bord_flag_8   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[8];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG9.bits.vpss_db_bord_flag_9   = pstRegOut->stDbDetectRegOut.au32DbBordFlag[9];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG10.bits.vpss_db_bord_flag_10 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[10];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG11.bits.vpss_db_bord_flag_11 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[11];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG12.bits.vpss_db_bord_flag_12 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[12];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG13.bits.vpss_db_bord_flag_13 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[13];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG14.bits.vpss_db_bord_flag_14 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[14];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG15.bits.vpss_db_bord_flag_15 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[15];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG16.bits.vpss_db_bord_flag_16 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[16];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG17.bits.vpss_db_bord_flag_17 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[17];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG18.bits.vpss_db_bord_flag_18 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[18];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG19.bits.vpss_db_bord_flag_19 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[19];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG20.bits.vpss_db_bord_flag_20 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[20];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG21.bits.vpss_db_bord_flag_21 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[21];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG22.bits.vpss_db_bord_flag_22 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[22];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG23.bits.vpss_db_bord_flag_23 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[23];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG24.bits.vpss_db_bord_flag_24 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[24];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG25.bits.vpss_db_bord_flag_25 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[25];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG26.bits.vpss_db_bord_flag_26 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[26];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG27.bits.vpss_db_bord_flag_27 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[27];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG28.bits.vpss_db_bord_flag_28 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[28];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG29.bits.vpss_db_bord_flag_29 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[29];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG30.bits.vpss_db_bord_flag_30 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[30];
    pstVpssAlgRegOut->VPSS_DB_BORD_FLAG31.bits.vpss_db_bord_flag_31 = pstRegOut->stDbDetectRegOut.au32DbBordFlag[31];

    /* stDbFltRegIn */
    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.db_en                    =    pstRegOut->stDbFltRegOut.u8DbEn          ;
    pqprint(PQ_PRN_DB_CALC, "set db en = %d\n", pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.db_en);

    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.db_lum_hor_en            =    pstRegOut->stDbFltRegOut.u8DBLumHorEn    ;

    pstVpssAlgRegOut->VPSS_DB_BLK.bits.db_lum_h_blk_size          =    pstRegOut->stDbFltRegOut.u16LumHBlkSize  ;
    //pstVpssAlgRegOut->VPSS_DBD_TSTBLKNUM.bits.dbd_hy_tst_blk_num  =    pstRegOut->stDbFltRegOut.s32LumHBlkNum   ;

    pstVpssAlgRegOut->VPSS_DB_DIR.bits.db_grad_sub_ratio          =    pstRegOut->stDbFltRegOut.u8GradSubRatio  ;
    pstVpssAlgRegOut->VPSS_DB_DIR.bits.db_ctrst_thresh            =    pstRegOut->stDbFltRegOut.u8CtrstThresh   ;

    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p0    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[0]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p1    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[1]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p2    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[2]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p3    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[3]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p4    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[4]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p5    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[5]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p6    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[6]        ;
    pstVpssAlgRegOut->VPSS_DB_LUT4.bits.db_dir_str_gain_lut_p7    =     pstRegOut->stDbFltRegOut.au8DirStrGainLut[7]        ;

    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p0           =    pstRegOut->stDbFltRegOut.au8DirStrLut[0]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p1           =    pstRegOut->stDbFltRegOut.au8DirStrLut[1]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p2           =    pstRegOut->stDbFltRegOut.au8DirStrLut[2]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p3           =    pstRegOut->stDbFltRegOut.au8DirStrLut[3]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p4           =    pstRegOut->stDbFltRegOut.au8DirStrLut[4]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p5           =    pstRegOut->stDbFltRegOut.au8DirStrLut[5]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p6           =    pstRegOut->stDbFltRegOut.au8DirStrLut[6]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT5.bits.db_dir_str_lut_p7           =    pstRegOut->stDbFltRegOut.au8DirStrLut[7]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p8           =    pstRegOut->stDbFltRegOut.au8DirStrLut[8]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p9           =    pstRegOut->stDbFltRegOut.au8DirStrLut[9]      ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p10          =    pstRegOut->stDbFltRegOut.au8DirStrLut[10]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p11          =    pstRegOut->stDbFltRegOut.au8DirStrLut[11]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p12          =    pstRegOut->stDbFltRegOut.au8DirStrLut[12]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p13          =    pstRegOut->stDbFltRegOut.au8DirStrLut[13]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p14          =    pstRegOut->stDbFltRegOut.au8DirStrLut[14]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT6.bits.db_dir_str_lut_p15          =    pstRegOut->stDbFltRegOut.au8DirStrLut[15]     ;

    pstVpssAlgRegOut->VPSS_DB_RATIO.bits.db_lum_hor_scale_ratio     =    pstRegOut->stDbFltRegOut.u8LumHorScaleRatio       ;
    pstVpssAlgRegOut->VPSS_DB_RATIO.bits.db_lum_hor_filter_sel      =    pstRegOut->stDbFltRegOut.u8LumHorFilterSel        ;

    pstVpssAlgRegOut->VPSS_DB_RATIO.bits.db_global_db_strenth_lum  =     pstRegOut->stDbFltRegOut.u8GlobalDbStrengthLum     ;
    pstVpssAlgRegOut->VPSS_DB_RATIO.bits.db_lum_hor_txt_win_size   =     pstRegOut->stDbFltRegOut.u8LumHorTxtWinSize     ;
    pstVpssAlgRegOut->VPSS_DB_CTRS.bits.db_max_lum_hor_db_dist     =     pstRegOut->stDbFltRegOut.u8MaxLumHorDbDist        ;

    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p0    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[0 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p1    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[1 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p2    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[2 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p3    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[3 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p4    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[4 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p5    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[5 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p6    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[6 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p7    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[7 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p8    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[8 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT2.bits.db_lum_h_str_fade_lut_p9    = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[9 ]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT3.bits.db_lum_h_str_fade_lut_p10   = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[10]     ;
    pstVpssAlgRegOut->VPSS_DB_LUT3.bits.db_lum_h_str_fade_lut_p11   = pstRegOut->stDbFltRegOut.au8LumHStrFadeLut[11]     ;

    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p0     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[0 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p1     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[1 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p2     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[2 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p3     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[3 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p4     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[4 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p5     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[5 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p6     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[6 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT0.bits.db_lum_hor_delta_lut_p7     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[7 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p8     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[8 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p9     = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[9 ]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p10    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[10]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p11    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[11]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p12    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[12]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p13    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[13]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p14    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[14]    ;
    pstVpssAlgRegOut->VPSS_DB_LUT1.bits.db_lum_hor_delta_lut_p15    = pstRegOut->stDbFltRegOut.au8LumHorDeltaLut[15]    ;

    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_core     = pstRegOut->stDbFltRegOut.u16LumHorHFDiffCore     ;
    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_gain1    = pstRegOut->stDbFltRegOut.u16LumHorHFDiffGain1    ;
    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_diff_gain2    = pstRegOut->stDbFltRegOut.u16LumHorHFDiffGain2    ;
    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_core      = pstRegOut->stDbFltRegOut.u16LumHorHFVarCore      ;
    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_gain1     = pstRegOut->stDbFltRegOut.u16LumHorHFVarGain1     ;
    pstVpssAlgRegOut->VPSS_DB_LHHF.bits.db_lum_hor_hf_var_gain2     = pstRegOut->stDbFltRegOut.u16LumHorHFVarGain2     ;
    pstVpssAlgRegOut->VPSS_DB_LVHF.bits.db_lum_hor_bord_adj_gain    = pstRegOut->stDbFltRegOut.u16LumHorBordAdjGain    ;

    pstVpssAlgRegOut->VPSS_DB_CTRS.bits.db_ctrst_adj_core       =    pstRegOut->stDbFltRegOut.u16CtrstAdjCore           ;
    pstVpssAlgRegOut->VPSS_DB_CTRS.bits.db_ctrst_adj_gain1      =    pstRegOut->stDbFltRegOut.u16CtrstAdjGain1          ;
    pstVpssAlgRegOut->VPSS_DB_CTRS.bits.db_ctrst_adj_gain2      =    pstRegOut->stDbFltRegOut.u16CtrstAdjGain2          ;
    pstVpssAlgRegOut->VPSS_DB_CTRS.bits.db_dir_smooth_mode      =    pstRegOut->stDbFltRegOut.u16DirSmoothMode          ;

    pstVpssAlgRegOut->VPSS_DB_LVHF.bits.db_lum_hor_adj_gain     =    pstRegOut->stDbFltRegOut.u16LumHorAdjGain          ;

    pstVpssRegInfo->pstVpssAlgRegOut = (HI_VOID *)pstVpssAlgRegOut;

    return HI_SUCCESS;
}



/* Set DB Enable */
HI_S32 PQ_HAL_EnableDB(HI_U32 u32Data, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32Data);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    pstVpssReg->VPSS_DBM_CTRL.bits.db_en = bOnOff;

    return HI_SUCCESS;
}

/* Set DB Demo */
HI_S32 PQ_HAL_EnableDBDemo(HI_U32 u32Data, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32Data);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);
    pstVpssReg->VPSS_DBM_CTRL.bits.dbm_demo_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetDbmDemoMode(HI_U32 u32Data, PQ_DEMO_MODE_E enMode)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;
    DBM_DEMO_MODE_E enDbmDemoMode = DBM_DEMO_ENABLE_L;

    pstVpssReg = PQ_HAL_GetVpssReg(u32Data);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);

    enDbmDemoMode = (enMode == PQ_DEMO_ENABLE_L) ? DBM_DEMO_ENABLE_L : DBM_DEMO_ENABLE_R;

    pstVpssReg->VPSS_DBM_CTRL.bits.dbm_demo_mode = enMode;

    return HI_SUCCESS;
}

/* Set DB Pos */
HI_S32 PQ_HAL_DBDemoPos(HI_U32 u32HandleNo, HI_U32 u32DBDemoPos)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32HandleNo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);
    pstVpssReg->VPSS_DBM_DEMO.bits.dbm_demo_pos_x = u32DBDemoPos;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_ResetDbStatus(HI_U32 u32HandleNo, ALG_DB_S *pstPQDbInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut)
{
    DBM_DEMO_MODE_E enDbmDemoMode = DBM_DEMO_ENABLE_L;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstPQDbInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssAlgRegOut);

    /* en ctrl */
    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.db_en = pstPQDbInfo->bEnable;

    /* demo ctrl */
    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.dbm_demo_en = pstPQDbInfo->bDemoEnable;

    enDbmDemoMode = (pstPQDbInfo->eDemoMode == PQ_DEMO_ENABLE_L) ? DBM_DEMO_ENABLE_L : DBM_DEMO_ENABLE_R;
    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.dbm_demo_mode = enDbmDemoMode;
    pstVpssAlgRegOut->VPSS_DBM_DEMO.bits.dbm_demo_pos_x = pstPQDbInfo->u32DemoPos;

    /* strength ctrl */
    g_u32HalDbStr = pstPQDbInfo->u32Strength * 16 / 100; /* 0~15; Low:4; Mid:8; High:12 */
    pstVpssAlgRegOut->VPSS_DB_RATIO.bits.db_global_db_strenth_lum = g_u32HalDbStr;

    return HI_SUCCESS;
}


