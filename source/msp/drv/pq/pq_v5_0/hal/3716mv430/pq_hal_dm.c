/******************************************************************************

Copyright (C), 2012-2014, Hisilicon Tech. Co., Ltd.

******************************************************************************
File Name     : pq_hal_dm.c
Version       : Initial Draft
Author        :
Created       : 2015/10/09
Description   : De-Mosquito

******************************************************************************/
#include <linux/string.h>
#include "pq_hal_dm.h"
#include "pq_hal_comm.h"
#include "drv_pq_comm.h"

HI_S32 PQ_HAL_EnableDM(HI_U32 u32Data, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32Data);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);
    pstVpssReg->VPSS_DBM_CTRL.bits.dm_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_EnableDMDemo(HI_U32 u32Data, HI_BOOL bOnOff)
{
    S_VPSS_REGS_TYPE *pstVpssReg = HI_NULL;

    pstVpssReg = PQ_HAL_GetVpssReg(u32Data);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssReg);
    //pstVpssReg->VPSS_DBM_CTRL.bits.dbm_demo_en = bOnOff;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_ResetDmStatus(HI_U32 u32HandleNo, ALG_DM_S *pstPQDmInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut)
{
    PQ_CHECK_NULL_PTR_RE_FAIL(pstPQDmInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssAlgRegOut);

    /* en ctrl */
    pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.dm_en = pstPQDmInfo->bEnable;

    /* demo ctrl */

    /* strength ctrl */

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_GetDmDrvInFromReg(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DM_REG_IN_S *pstDmRegIn)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssReg = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstDmRegIn);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssReg);

    pstVpssReg = (S_VPSSIP_ALG_SET_REGS_TYPE *) (pstVpssRegInfo->pstVpssReg);

    pstDmRegIn->s32DmEn             = pstVpssReg->VPSS_DBM_CTRL.bits.dm_en;

    pstDmRegIn->u16OppAngCtrstT     = pstVpssReg->VPSS_DM_DIR.bits.dm_opp_ang_ctrst_t             ;
    pstDmRegIn->u16MNDirOppCtrstT   = pstVpssReg->VPSS_DM_DIRC.bits.dm_mndir_opp_ctrst_t          ;
    pstDmRegIn->u16cSWTrsntLT       = pstVpssReg->VPSS_DM_MMFLR.bits.dm_csw_trsnt_lt              ;
    pstDmRegIn->u16cSWTrsntLT10bit  = pstVpssReg->VPSS_DM_MMFSR.bits.dm_csw_trsnt_lt_10           ;
    pstDmRegIn->u8LSWRatio          = pstVpssReg->VPSS_DM_LSW.bits.dm_lsw_ratio                   ;
    pstDmRegIn->u8LimitLSWRatio     = pstVpssReg->VPSS_DM_THR0.bits.dm_limit_lsw_ratio            ;
    pstDmRegIn->s16MMFLR            = pstVpssReg->VPSS_DM_MMFLR.bits.dm_mmf_lr                    ;
    pstDmRegIn->s16MMFLR10bit       = pstVpssReg->VPSS_DM_MMFLR.bits.dm_mmf_lr_10                 ;
    pstDmRegIn->s16MMFSR            = pstVpssReg->VPSS_DM_MMFSR.bits.dm_mmf_sr                    ;
    pstDmRegIn->s16MMFSR10bit       = pstVpssReg->VPSS_DM_MMFSR.bits.dm_mmf_sr_10                 ;
    pstDmRegIn->u8MMFlimitEn        = pstVpssReg->VPSS_DM_DIRC.bits.dm_mmf_limit_en               ;
    pstDmRegIn->u8MMFSet            = pstVpssReg->VPSS_DM_EDGE.bits.dm_mmf_set                    ;
    pstDmRegIn->u8InitValStep       = pstVpssReg->VPSS_DM_EDGE.bits.dm_init_val_step              ;

    pstDmRegIn->au16TransBand[0]              = pstVpssReg->VPSS_DM_LUT5.bits.dm_trans_band_lut_p0          ;
    pstDmRegIn->au16TransBand[1]              = pstVpssReg->VPSS_DM_LUT5.bits.dm_trans_band_lut_p1          ;
    pstDmRegIn->au16TransBand[2]              = pstVpssReg->VPSS_DM_LUT5.bits.dm_trans_band_lut_p2          ;
    pstDmRegIn->au16TransBand[3]              = pstVpssReg->VPSS_DM_LUT5.bits.dm_trans_band_lut_p3          ;
    pstDmRegIn->au16TransBand[4]              = pstVpssReg->VPSS_DM_LUT5.bits.dm_trans_band_lut_p4          ;
    pstDmRegIn->au16TransBand[5]              = pstVpssReg->VPSS_DM_LUT6.bits.dm_trans_band_lut_p5          ;
    pstDmRegIn->au16TransBand[6]              = pstVpssReg->VPSS_DM_LUT6.bits.dm_trans_band_lut_p6          ;
    pstDmRegIn->au16TransBand[7]              = pstVpssReg->VPSS_DM_LUT6.bits.dm_trans_band_lut_p7          ;
    pstDmRegIn->au16TransBand[8]              = pstVpssReg->VPSS_DM_LUT6.bits.dm_trans_band_lut_p8          ;
    pstDmRegIn->au16TransBand[9]              = pstVpssReg->VPSS_DM_LUT6.bits.dm_trans_band_lut_p9          ;
    pstDmRegIn->au16TransBand[10]             = pstVpssReg->VPSS_DM_LUT7.bits.dm_trans_band_lut_p10         ;
    pstDmRegIn->au16TransBand[11]             = pstVpssReg->VPSS_DM_LUT7.bits.dm_trans_band_lut_p11         ;
    pstDmRegIn->au16TransBand[12]             = pstVpssReg->VPSS_DM_LUT7.bits.dm_trans_band_lut_p12         ;
    pstDmRegIn->au16TransBand[13]             = pstVpssReg->VPSS_DM_LUT7.bits.dm_trans_band_lut_p13         ;
    pstDmRegIn->au16TransBand[14]             = pstVpssReg->VPSS_DM_LUT7.bits.dm_trans_band_lut_p14         ;
    pstDmRegIn->au16TransBand[15]             = pstVpssReg->VPSS_DM_LUT8.bits.dm_trans_band_lut_p15         ;
    pstDmRegIn->au16TransBand[16]             = pstVpssReg->VPSS_DM_LUT8.bits.dm_trans_band_lut_p16         ;
    pstDmRegIn->au16TransBand[17]             = pstVpssReg->VPSS_DM_LUT8.bits.dm_trans_band_lut_p17         ;
    pstDmRegIn->au16TransBand[18]             = pstVpssReg->VPSS_DM_LUT8.bits.dm_trans_band_lut_p18         ;
    pstDmRegIn->au16TransBand[19]             = pstVpssReg->VPSS_DM_LUT8.bits.dm_trans_band_lut_p19         ;
    pstDmRegIn->au16TransBand[20]             = pstVpssReg->VPSS_DM_LUT9.bits.dm_trans_band_lut_p20         ;
    pstDmRegIn->au16TransBand[21]             = pstVpssReg->VPSS_DM_LUT9.bits.dm_trans_band_lut_p21         ;
    pstDmRegIn->au16TransBand[22]             = pstVpssReg->VPSS_DM_LUT9.bits.dm_trans_band_lut_p22         ;
    pstDmRegIn->au16TransBand[23]             = pstVpssReg->VPSS_DM_LUT9.bits.dm_trans_band_lut_p23         ;
    pstDmRegIn->au16TransBand[24]             = pstVpssReg->VPSS_DM_LUT9.bits.dm_trans_band_lut_p24         ;
    pstDmRegIn->au16TransBand[25]             = pstVpssReg->VPSS_DM_LUT10.bits.dm_trans_band_lut_p25        ;
    pstDmRegIn->au16TransBand[26]             = pstVpssReg->VPSS_DM_LUT10.bits.dm_trans_band_lut_p26        ;
    pstDmRegIn->au16TransBand[27]             = pstVpssReg->VPSS_DM_LUT10.bits.dm_trans_band_lut_p27        ;
    pstDmRegIn->au16TransBand[28]             = pstVpssReg->VPSS_DM_LUT10.bits.dm_trans_band_lut_p28        ;
    pstDmRegIn->au16TransBand[29]             = pstVpssReg->VPSS_DM_LUT10.bits.dm_trans_band_lut_p29        ;
    pstDmRegIn->au16TransBand[30]             = pstVpssReg->VPSS_DM_LUT11.bits.dm_trans_band_lut_p30        ;

    pstDmRegIn->u16LimitT                     = pstVpssReg->VPSS_DM_LUT1.bits.dm_limit_t                    ;
    pstDmRegIn->u16LimitT10bit                = pstVpssReg->VPSS_DM_LUT1.bits.dm_limit_t_10                 ;
    pstDmRegIn->u8LimResBlendStr1             = pstVpssReg->VPSS_DM_THR0.bits.dm_lim_res_blend_str1         ;
    pstDmRegIn->u8LimResBlendStr2             = pstVpssReg->VPSS_DM_THR0.bits.dm_lim_res_blend_str2         ;
    pstDmRegIn->u8DirBlendStr                 = pstVpssReg->VPSS_DM_THR0.bits.dm_dir_blend_str              ;
    pstDmRegIn->u16LWCtrstT                   = pstVpssReg->VPSS_DM_LSW.bits.dm_lw_ctrst_t                  ;
    pstDmRegIn->u16LWCtrstT10bit              = pstVpssReg->VPSS_DM_LSW.bits.dm_lw_ctrst_t_10               ;
    pstDmRegIn->u16cSWTrsntST                 = pstVpssReg->VPSS_DM_LSW.bits.dm_csw_trsnt_st                ;
    pstDmRegIn->u16cSWTrsntST10bit            = pstVpssReg->VPSS_DM_DIRO.bits.dm_csw_trsnt_st_10            ;

    pstDmRegIn->s32RoSubInfoEn               = pstVpssReg->VPSS_DM_DIRO.bits.dm_rosubinfo_en ;

    pstDmRegIn->astRoSub[ 0].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft0     ;
    pstDmRegIn->astRoSub[ 0].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft0     ;
    pstDmRegIn->astRoSub[ 0].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt0     ;
    pstDmRegIn->astRoSub[ 0].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt0     ;
    pstDmRegIn->astRoSub[ 1].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft1     ;
    pstDmRegIn->astRoSub[ 1].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft1     ;
    pstDmRegIn->astRoSub[ 1].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt1     ;
    pstDmRegIn->astRoSub[ 1].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt1     ;
    pstDmRegIn->astRoSub[ 2].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft2     ;
    pstDmRegIn->astRoSub[ 2].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft2     ;
    pstDmRegIn->astRoSub[ 2].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt2     ;
    pstDmRegIn->astRoSub[ 2].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt2     ;
    pstDmRegIn->astRoSub[ 3].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft3     ;
    pstDmRegIn->astRoSub[ 3].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft3     ;
    pstDmRegIn->astRoSub[ 3].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt3     ;
    pstDmRegIn->astRoSub[ 3].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt3     ;
    pstDmRegIn->astRoSub[ 4].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft4     ;
    pstDmRegIn->astRoSub[ 4].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft4     ;
    pstDmRegIn->astRoSub[ 4].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt4     ;
    pstDmRegIn->astRoSub[ 4].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt4     ;
    pstDmRegIn->astRoSub[ 5].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft5     ;
    pstDmRegIn->astRoSub[ 5].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft5     ;
    pstDmRegIn->astRoSub[ 5].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt5     ;
    pstDmRegIn->astRoSub[ 5].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt5     ;
    pstDmRegIn->astRoSub[ 6].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft6     ;
    pstDmRegIn->astRoSub[ 6].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft6     ;
    pstDmRegIn->astRoSub[ 6].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt6     ;
    pstDmRegIn->astRoSub[ 6].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt6     ;
    pstDmRegIn->astRoSub[ 7].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft7     ;
    pstDmRegIn->astRoSub[ 7].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft7     ;
    pstDmRegIn->astRoSub[ 7].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt7     ;
    pstDmRegIn->astRoSub[ 7].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt7     ;
    pstDmRegIn->astRoSub[ 8].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft8     ;
    pstDmRegIn->astRoSub[ 8].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft8     ;
    pstDmRegIn->astRoSub[ 8].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt8     ;
    pstDmRegIn->astRoSub[ 8].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt8     ;
    pstDmRegIn->astRoSub[ 9].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft9     ;
    pstDmRegIn->astRoSub[ 9].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft9     ;
    pstDmRegIn->astRoSub[ 9].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt9     ;
    pstDmRegIn->astRoSub[ 9].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt9     ;
    pstDmRegIn->astRoSub[10].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft10    ;
    pstDmRegIn->astRoSub[10].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft10    ;
    pstDmRegIn->astRoSub[10].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt10    ;
    pstDmRegIn->astRoSub[10].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt10    ;
    pstDmRegIn->astRoSub[11].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft11    ;
    pstDmRegIn->astRoSub[11].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft11    ;
    pstDmRegIn->astRoSub[11].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt11    ;
    pstDmRegIn->astRoSub[11].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt11    ;
    pstDmRegIn->astRoSub[12].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft12    ;
    pstDmRegIn->astRoSub[12].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft12    ;
    pstDmRegIn->astRoSub[12].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt12    ;
    pstDmRegIn->astRoSub[12].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt12    ;
    pstDmRegIn->astRoSub[13].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft13    ;
    pstDmRegIn->astRoSub[13].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft13    ;
    pstDmRegIn->astRoSub[13].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt13    ;
    pstDmRegIn->astRoSub[13].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt13    ;
    pstDmRegIn->astRoSub[14].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft14    ;
    pstDmRegIn->astRoSub[14].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft14    ;
    pstDmRegIn->astRoSub[14].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt14    ;
    pstDmRegIn->astRoSub[14].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt14    ;
    pstDmRegIn->astRoSub[15].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft15    ;
    pstDmRegIn->astRoSub[15].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft15    ;
    pstDmRegIn->astRoSub[15].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt15    ;
    pstDmRegIn->astRoSub[15].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt15    ;
    pstDmRegIn->astRoSub[16].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft16    ;
    pstDmRegIn->astRoSub[16].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft16    ;
    pstDmRegIn->astRoSub[16].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt16    ;
    pstDmRegIn->astRoSub[16].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt16    ;
    pstDmRegIn->astRoSub[17].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft17    ;
    pstDmRegIn->astRoSub[17].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft17    ;
    pstDmRegIn->astRoSub[17].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt17    ;
    pstDmRegIn->astRoSub[17].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt17    ;
    pstDmRegIn->astRoSub[18].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft18    ;
    pstDmRegIn->astRoSub[18].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft18    ;
    pstDmRegIn->astRoSub[18].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt18    ;
    pstDmRegIn->astRoSub[18].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt18    ;
    pstDmRegIn->astRoSub[19].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft19    ;
    pstDmRegIn->astRoSub[19].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft19    ;
    pstDmRegIn->astRoSub[19].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt19    ;
    pstDmRegIn->astRoSub[19].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt19    ;
    pstDmRegIn->astRoSub[20].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft20    ;
    pstDmRegIn->astRoSub[20].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft20    ;
    pstDmRegIn->astRoSub[20].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt20    ;
    pstDmRegIn->astRoSub[20].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt20    ;
    pstDmRegIn->astRoSub[21].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft21    ;
    pstDmRegIn->astRoSub[21].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft21    ;
    pstDmRegIn->astRoSub[21].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt21    ;
    pstDmRegIn->astRoSub[21].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt21    ;
    pstDmRegIn->astRoSub[22].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft22    ;
    pstDmRegIn->astRoSub[22].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft22    ;
    pstDmRegIn->astRoSub[22].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt22    ;
    pstDmRegIn->astRoSub[22].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt22    ;
    pstDmRegIn->astRoSub[23].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft23    ;
    pstDmRegIn->astRoSub[23].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft23    ;
    pstDmRegIn->astRoSub[23].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt23    ;
    pstDmRegIn->astRoSub[23].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt23    ;
    pstDmRegIn->astRoSub[24].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft24    ;
    pstDmRegIn->astRoSub[24].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft24    ;
    pstDmRegIn->astRoSub[24].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt24    ;
    pstDmRegIn->astRoSub[24].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt24    ;
    pstDmRegIn->astRoSub[25].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft25    ;
    pstDmRegIn->astRoSub[25].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft25    ;
    pstDmRegIn->astRoSub[25].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt25    ;
    pstDmRegIn->astRoSub[25].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt25    ;
    pstDmRegIn->astRoSub[26].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft26    ;
    pstDmRegIn->astRoSub[26].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft26    ;
    pstDmRegIn->astRoSub[26].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt26    ;
    pstDmRegIn->astRoSub[26].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt26    ;
    pstDmRegIn->astRoSub[27].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft27    ;
    pstDmRegIn->astRoSub[27].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft27    ;
    pstDmRegIn->astRoSub[27].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt27    ;
    pstDmRegIn->astRoSub[27].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt27    ;
    pstDmRegIn->astRoSub[28].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft28    ;
    pstDmRegIn->astRoSub[28].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft28    ;
    pstDmRegIn->astRoSub[28].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt28    ;
    pstDmRegIn->astRoSub[28].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt28    ;
    pstDmRegIn->astRoSub[29].u16TopLftPx     = pstVpssReg->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft29    ;
    pstDmRegIn->astRoSub[29].u16TopLftPy     = pstVpssReg->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft29    ;
    pstDmRegIn->astRoSub[29].u16BotRgtPx     = pstVpssReg->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt29    ;
    pstDmRegIn->astRoSub[29].u16BotRgtPy     = pstVpssReg->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt29    ;

    pstDmRegIn->u16SizeOfRoSub = pstVpssReg->VPSS_DM_DIRO.bits.dm_sizeof_rosub ;

    return HI_SUCCESS;
}

HI_S32 PQ_HAL_SetDmRegFromRegout(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DM_REG_OUT_S *pstDmRegOut)
{
    S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut = HI_NULL;

    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstDmRegOut);
    PQ_CHECK_NULL_PTR_RE_FAIL(pstVpssRegInfo->pstVpssAlgRegOut);

    //pstVpssRegInfo->pstVpssAlgRegOut->VPSS_DBM_CTRL.bits.dm_en  =      pstDmRegOut->s32DmEn           ;
    pstVpssAlgRegOut = (S_VPSSIP_ALG_SET_REGS_TYPE *)(pstVpssRegInfo->pstVpssAlgRegOut);

    pstVpssAlgRegOut->VPSS_DM_DIR.bits.dm_opp_ang_ctrst_t      =    pstDmRegOut->u16OppAngCtrstT         ;
    pstVpssAlgRegOut->VPSS_DM_DIRC.bits.dm_mndir_opp_ctrst_t   =    pstDmRegOut->u16MNDirOppCtrstT       ;
    pstVpssAlgRegOut->VPSS_DM_MMFLR.bits.dm_csw_trsnt_lt       =    pstDmRegOut->u16cSWTrsntLT           ;
    pstVpssAlgRegOut->VPSS_DM_MMFSR.bits.dm_csw_trsnt_lt_10    =    pstDmRegOut->u16cSWTrsntLT10bit      ;
    pstVpssAlgRegOut->VPSS_DM_LSW.bits.dm_lsw_ratio            =    pstDmRegOut->u8LSWRatio              ;
    pstVpssAlgRegOut->VPSS_DM_THR0.bits.dm_limit_lsw_ratio     =    pstDmRegOut->u8LimitLSWRatio         ;
    pstVpssAlgRegOut->VPSS_DM_MMFLR.bits.dm_mmf_lr             =    pstDmRegOut->s16MMFLR                ;
    pstVpssAlgRegOut->VPSS_DM_MMFLR.bits.dm_mmf_lr_10          =    pstDmRegOut->s16MMFLR10bit           ;
    pstVpssAlgRegOut->VPSS_DM_MMFSR.bits.dm_mmf_sr             =    pstDmRegOut->s16MMFSR                ;
    pstVpssAlgRegOut->VPSS_DM_MMFSR.bits.dm_mmf_sr_10          =    pstDmRegOut->s16MMFSR10bit           ;
    pstVpssAlgRegOut->VPSS_DM_DIRC.bits.dm_mmf_limit_en        =    pstDmRegOut->u8MMFlimitEn            ;
    pstVpssAlgRegOut->VPSS_DM_EDGE.bits.dm_mmf_set             =    pstDmRegOut->u8MMFSet                ;
    pstVpssAlgRegOut->VPSS_DM_EDGE.bits.dm_init_val_step       =    pstDmRegOut->u8InitValStep           ;

    pstVpssAlgRegOut->VPSS_DM_LUT5.bits.dm_trans_band_lut_p0       =     pstDmRegOut->au16TransBand[0]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT5.bits.dm_trans_band_lut_p1       =     pstDmRegOut->au16TransBand[1]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT5.bits.dm_trans_band_lut_p2       =     pstDmRegOut->au16TransBand[2]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT5.bits.dm_trans_band_lut_p3       =     pstDmRegOut->au16TransBand[3]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT5.bits.dm_trans_band_lut_p4       =     pstDmRegOut->au16TransBand[4]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT6.bits.dm_trans_band_lut_p5       =     pstDmRegOut->au16TransBand[5]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT6.bits.dm_trans_band_lut_p6       =     pstDmRegOut->au16TransBand[6]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT6.bits.dm_trans_band_lut_p7       =     pstDmRegOut->au16TransBand[7]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT6.bits.dm_trans_band_lut_p8       =     pstDmRegOut->au16TransBand[8]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT6.bits.dm_trans_band_lut_p9       =     pstDmRegOut->au16TransBand[9]             ;
    pstVpssAlgRegOut->VPSS_DM_LUT7.bits.dm_trans_band_lut_p10      =     pstDmRegOut->au16TransBand[10]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT7.bits.dm_trans_band_lut_p11      =     pstDmRegOut->au16TransBand[11]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT7.bits.dm_trans_band_lut_p12      =     pstDmRegOut->au16TransBand[12]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT7.bits.dm_trans_band_lut_p13      =     pstDmRegOut->au16TransBand[13]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT7.bits.dm_trans_band_lut_p14      =     pstDmRegOut->au16TransBand[14]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT8.bits.dm_trans_band_lut_p15      =     pstDmRegOut->au16TransBand[15]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT8.bits.dm_trans_band_lut_p16      =     pstDmRegOut->au16TransBand[16]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT8.bits.dm_trans_band_lut_p17      =     pstDmRegOut->au16TransBand[17]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT8.bits.dm_trans_band_lut_p18      =     pstDmRegOut->au16TransBand[18]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT8.bits.dm_trans_band_lut_p19      =     pstDmRegOut->au16TransBand[19]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT9.bits.dm_trans_band_lut_p20      =     pstDmRegOut->au16TransBand[20]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT9.bits.dm_trans_band_lut_p21      =     pstDmRegOut->au16TransBand[21]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT9.bits.dm_trans_band_lut_p22      =     pstDmRegOut->au16TransBand[22]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT9.bits.dm_trans_band_lut_p23      =     pstDmRegOut->au16TransBand[23]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT9.bits.dm_trans_band_lut_p24      =     pstDmRegOut->au16TransBand[24]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT10.bits.dm_trans_band_lut_p25     =     pstDmRegOut->au16TransBand[25]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT10.bits.dm_trans_band_lut_p26     =     pstDmRegOut->au16TransBand[26]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT10.bits.dm_trans_band_lut_p27     =     pstDmRegOut->au16TransBand[27]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT10.bits.dm_trans_band_lut_p28     =     pstDmRegOut->au16TransBand[28]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT10.bits.dm_trans_band_lut_p29     =     pstDmRegOut->au16TransBand[29]            ;
    pstVpssAlgRegOut->VPSS_DM_LUT11.bits.dm_trans_band_lut_p30     =     pstDmRegOut->au16TransBand[30]            ;

    pstVpssAlgRegOut->VPSS_DM_LUT1.bits.dm_limit_t               =    pstDmRegOut->u16LimitT                       ;
    pstVpssAlgRegOut->VPSS_DM_LUT1.bits.dm_limit_t_10            =    pstDmRegOut->u16LimitT10bit                  ;
    pstVpssAlgRegOut->VPSS_DM_THR0.bits.dm_lim_res_blend_str1    =    pstDmRegOut->u8LimResBlendStr1               ;
    pstVpssAlgRegOut->VPSS_DM_THR0.bits.dm_lim_res_blend_str2    =    pstDmRegOut->u8LimResBlendStr2               ;
    pstVpssAlgRegOut->VPSS_DM_THR0.bits.dm_dir_blend_str         =    pstDmRegOut->u8DirBlendStr                   ;
    pstVpssAlgRegOut->VPSS_DM_LSW.bits.dm_lw_ctrst_t             =    pstDmRegOut->u16LWCtrstT                     ;
    pstVpssAlgRegOut->VPSS_DM_LSW.bits.dm_lw_ctrst_t_10          =    pstDmRegOut->u16LWCtrstT10bit                ;
    pstVpssAlgRegOut->VPSS_DM_LSW.bits.dm_csw_trsnt_st           =    pstDmRegOut->u16cSWTrsntST                   ;
    pstVpssAlgRegOut->VPSS_DM_DIRO.bits.dm_csw_trsnt_st_10       =    pstDmRegOut->u16cSWTrsntST10bit              ;

    //pstVpssAlgRegOut->VPSS_DM_DIRO.bits.dm_rosubinfo_en      =  pstDmRegOut->s32RoSubInfoEn         ;

    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft0   =   pstDmRegOut->astRoSub[ 0].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft0   =   pstDmRegOut->astRoSub[ 0].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt0   =   pstDmRegOut->astRoSub[ 0].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt0   =   pstDmRegOut->astRoSub[ 0].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft1   =   pstDmRegOut->astRoSub[ 1].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft1   =   pstDmRegOut->astRoSub[ 1].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt1   =   pstDmRegOut->astRoSub[ 1].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt1   =   pstDmRegOut->astRoSub[ 1].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL0.bits.dm_rosub_px_toplft2   =   pstDmRegOut->astRoSub[ 2].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL0.bits.dm_rosub_py_toplft2   =   pstDmRegOut->astRoSub[ 2].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR0.bits.dm_rosub_px_botrgt2   =   pstDmRegOut->astRoSub[ 2].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR0.bits.dm_rosub_py_botrgt2   =   pstDmRegOut->astRoSub[ 2].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft3   =   pstDmRegOut->astRoSub[ 3].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft3   =   pstDmRegOut->astRoSub[ 3].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt3   =   pstDmRegOut->astRoSub[ 3].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt3   =   pstDmRegOut->astRoSub[ 3].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft4   =   pstDmRegOut->astRoSub[ 4].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft4   =   pstDmRegOut->astRoSub[ 4].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt4   =   pstDmRegOut->astRoSub[ 4].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt4   =   pstDmRegOut->astRoSub[ 4].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL1.bits.dm_rosub_px_toplft5   =   pstDmRegOut->astRoSub[ 5].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL1.bits.dm_rosub_py_toplft5   =   pstDmRegOut->astRoSub[ 5].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR1.bits.dm_rosub_px_botrgt5   =   pstDmRegOut->astRoSub[ 5].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR1.bits.dm_rosub_py_botrgt5   =   pstDmRegOut->astRoSub[ 5].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft6   =   pstDmRegOut->astRoSub[ 6].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft6   =   pstDmRegOut->astRoSub[ 6].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt6   =   pstDmRegOut->astRoSub[ 6].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt6   =   pstDmRegOut->astRoSub[ 6].u16BotRgtPy     ;

    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft7    =  pstDmRegOut->astRoSub[ 7].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft7    =  pstDmRegOut->astRoSub[ 7].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt7    =  pstDmRegOut->astRoSub[ 7].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt7    =  pstDmRegOut->astRoSub[ 7].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL2.bits.dm_rosub_px_toplft8    =  pstDmRegOut->astRoSub[ 8].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL2.bits.dm_rosub_py_toplft8    =  pstDmRegOut->astRoSub[ 8].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR2.bits.dm_rosub_px_botrgt8    =  pstDmRegOut->astRoSub[ 8].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR2.bits.dm_rosub_py_botrgt8    =  pstDmRegOut->astRoSub[ 8].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft9    =  pstDmRegOut->astRoSub[ 9].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft9    =  pstDmRegOut->astRoSub[ 9].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt9    =  pstDmRegOut->astRoSub[ 9].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt9    =  pstDmRegOut->astRoSub[ 9].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft10   =  pstDmRegOut->astRoSub[10].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft10   =  pstDmRegOut->astRoSub[10].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt10   =  pstDmRegOut->astRoSub[10].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt10   =  pstDmRegOut->astRoSub[10].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL3.bits.dm_rosub_px_toplft11   =  pstDmRegOut->astRoSub[11].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL3.bits.dm_rosub_py_toplft11   =  pstDmRegOut->astRoSub[11].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR3.bits.dm_rosub_px_botrgt11   =  pstDmRegOut->astRoSub[11].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR3.bits.dm_rosub_py_botrgt11   =  pstDmRegOut->astRoSub[11].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft12   =  pstDmRegOut->astRoSub[12].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft12   =  pstDmRegOut->astRoSub[12].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt12   =  pstDmRegOut->astRoSub[12].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt12   =  pstDmRegOut->astRoSub[12].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft13   =  pstDmRegOut->astRoSub[13].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft13   =  pstDmRegOut->astRoSub[13].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt13   =  pstDmRegOut->astRoSub[13].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt13   =  pstDmRegOut->astRoSub[13].u16BotRgtPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL4.bits.dm_rosub_px_toplft14   =  pstDmRegOut->astRoSub[14].u16TopLftPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL4.bits.dm_rosub_py_toplft14   =  pstDmRegOut->astRoSub[14].u16TopLftPy     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR4.bits.dm_rosub_px_botrgt14   =  pstDmRegOut->astRoSub[14].u16BotRgtPx     ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR4.bits.dm_rosub_py_botrgt14   =  pstDmRegOut->astRoSub[14].u16BotRgtPy     ;

    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft15   =   pstDmRegOut->astRoSub[15].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft15   =   pstDmRegOut->astRoSub[15].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt15   =   pstDmRegOut->astRoSub[15].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt15   =   pstDmRegOut->astRoSub[15].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft16   =   pstDmRegOut->astRoSub[16].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft16   =   pstDmRegOut->astRoSub[16].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt16   =   pstDmRegOut->astRoSub[16].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt16   =   pstDmRegOut->astRoSub[16].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL5.bits.dm_rosub_px_toplft17   =   pstDmRegOut->astRoSub[17].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL5.bits.dm_rosub_py_toplft17   =   pstDmRegOut->astRoSub[17].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR5.bits.dm_rosub_px_botrgt17   =   pstDmRegOut->astRoSub[17].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR5.bits.dm_rosub_py_botrgt17   =   pstDmRegOut->astRoSub[17].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft18   =   pstDmRegOut->astRoSub[18].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft18   =   pstDmRegOut->astRoSub[18].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt18   =   pstDmRegOut->astRoSub[18].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt18   =   pstDmRegOut->astRoSub[18].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft19   =   pstDmRegOut->astRoSub[19].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft19   =   pstDmRegOut->astRoSub[19].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt19   =   pstDmRegOut->astRoSub[19].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt19   =   pstDmRegOut->astRoSub[19].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL6.bits.dm_rosub_px_toplft20   =   pstDmRegOut->astRoSub[20].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL6.bits.dm_rosub_py_toplft20   =   pstDmRegOut->astRoSub[20].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR6.bits.dm_rosub_px_botrgt20   =   pstDmRegOut->astRoSub[20].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR6.bits.dm_rosub_py_botrgt20   =   pstDmRegOut->astRoSub[20].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft21   =   pstDmRegOut->astRoSub[21].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft21   =   pstDmRegOut->astRoSub[21].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt21   =   pstDmRegOut->astRoSub[21].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt21   =   pstDmRegOut->astRoSub[21].u16BotRgtPy    ;

    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft22   =   pstDmRegOut->astRoSub[22].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft22   =   pstDmRegOut->astRoSub[22].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt22   =   pstDmRegOut->astRoSub[22].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt22   =   pstDmRegOut->astRoSub[22].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL7.bits.dm_rosub_px_toplft23   =   pstDmRegOut->astRoSub[23].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL7.bits.dm_rosub_py_toplft23   =   pstDmRegOut->astRoSub[23].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR7.bits.dm_rosub_px_botrgt23   =   pstDmRegOut->astRoSub[23].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR7.bits.dm_rosub_py_botrgt23   =   pstDmRegOut->astRoSub[23].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft24   =   pstDmRegOut->astRoSub[24].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft24   =   pstDmRegOut->astRoSub[24].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt24   =   pstDmRegOut->astRoSub[24].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt24   =   pstDmRegOut->astRoSub[24].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft25   =   pstDmRegOut->astRoSub[25].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft25   =   pstDmRegOut->astRoSub[25].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt25   =   pstDmRegOut->astRoSub[25].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt25   =   pstDmRegOut->astRoSub[25].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL8.bits.dm_rosub_px_toplft26   =   pstDmRegOut->astRoSub[26].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL8.bits.dm_rosub_py_toplft26   =   pstDmRegOut->astRoSub[26].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR8.bits.dm_rosub_px_botrgt26   =   pstDmRegOut->astRoSub[26].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR8.bits.dm_rosub_py_botrgt26   =   pstDmRegOut->astRoSub[26].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft27   =   pstDmRegOut->astRoSub[27].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft27   =   pstDmRegOut->astRoSub[27].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt27   =   pstDmRegOut->astRoSub[27].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt27   =   pstDmRegOut->astRoSub[27].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft28   =   pstDmRegOut->astRoSub[28].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft28   =   pstDmRegOut->astRoSub[28].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt28   =   pstDmRegOut->astRoSub[28].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt28   =   pstDmRegOut->astRoSub[28].u16BotRgtPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_TL9.bits.dm_rosub_px_toplft29   =   pstDmRegOut->astRoSub[29].u16TopLftPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_TL9.bits.dm_rosub_py_toplft29   =   pstDmRegOut->astRoSub[29].u16TopLftPy    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPX_BR9.bits.dm_rosub_px_botrgt29   =   pstDmRegOut->astRoSub[29].u16BotRgtPx    ;
    pstVpssAlgRegOut->VPSS_DM_SUBPY_BR9.bits.dm_rosub_py_botrgt29   =   pstDmRegOut->astRoSub[29].u16BotRgtPy    ;

    pstVpssAlgRegOut->VPSS_DM_DIRO.bits.dm_sizeof_rosub = pstDmRegOut->u16SizeOfRoSub ;

    pstVpssRegInfo->pstVpssAlgRegOut = (HI_VOID *)(pstVpssAlgRegOut);

    return HI_SUCCESS;
}


