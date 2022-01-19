#include "vdp_assert.h"
#include "vdp_ip_define.h"
#include "vdp_define.h"
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/module.h>
#include "drv_disp_osal.h"

#ifdef VDP_REG_ASSERT_CHECK_SUPPORT
static S_VDP_REGS_TYPE       stVdpVpssRegTmp;
static S_VDP_REGS_TYPE       *pstVdpVpssRegTmp = &stVdpVpssRegTmp;
extern S_VDP_REGS_TYPE * pVdpReg;

static HI_VOID VDP_DRV_CheckVpssSysCtrlCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en==pstVdpRegTmp->VPSS_RHISM_CTRL.bits.rhism_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en==pstVdpRegTmp->VPSS_WHISM_CTRL.bits.whism_en);

    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en==pstVdpRegTmp->VPSS_RDM_CNT_CTRL.bits.rdm_cnt_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en==pstVdpRegTmp->VPSS_WDM_CNT_CTRL.bits.wdm_cnt_en);

    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en==pstVdpRegTmp->VPSS_NR_RMAD_CTRL.bits.nr_rmad_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en==pstVdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_en);

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.mcnr_en)
    {
        VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en==HI_TRUE);
        VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==HI_TRUE);
    }

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en)
    {
        VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.mcnr_en==HI_TRUE);
        VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en==HI_TRUE);
    }

    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_en);
    VDP_ASSERT(pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en==pstVdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_en);

    if(HI_TRUE==pstVdpRegTmp->VPSS_SNR_RMAD_CTRL.bits.snr_rmad_en)
    {
        VDP_ASSERT(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en);
        VDP_ASSERT(HI_TRUE==pstVdpRegTmp->VPSS_NR_WMAD_CTRL.bits.nr_wmad_en);//must snr_en = tnr_en
    }

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.frm_init)
    {
        VDP_ASSERT(1==pstVdpRegTmp->VPSS_DI_CYC_CTRL.bits.di_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_HISM_CYC_CTRL.bits.hism_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_HISM_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_HISM_CYC_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_DM_CNT_CYC_CTRL.bits.dm_cnt_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DM_CNT_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_DM_CNT_CYC_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_NR_MAD_CYC_CTRL.bits.nr_mad_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_NR_MAD_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_NR_MAD_CYC_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_STATH_CYC_CTRL.bits.stath_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_STATH_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_STATH_CYC_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_STATV_CYC_CTRL.bits.statv_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_STATV_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_STATV_CYC_END_ADDR_LOW.u32 != 0);

        VDP_ASSERT(1==pstVdpRegTmp->VPSS_RGMV_CYC_CTRL.bits.rgmv_cycbuf_en);
        VDP_ASSERT(pstVdpRegTmp->VPSS_RGMV_CYC_START_ADDR_LOW.u32 != 0);
        VDP_ASSERT(pstVdpRegTmp->VPSS_RGMV_CYC_END_ADDR_LOW.u32 != 0);
    }

    return;
}

static HI_VOID VDP_DRV_CheckHpzme(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    HI_U32 u32HpzmeOutWth = pstVdpRegTmp->V0_HPZME_HINFO.bits.out_width+1;
    HI_U32 u32V0InWth     = pstVdpRegTmp->VID_IN_RESO.bits.ireso_w+1;
    HI_U32 u32HorDrawMode = pstVdpRegTmp->VID_OUT_CTRL.bits.draw_pixel_mode;
    HI_U32 u32V0FdrOutWth = (u32V0InWth>>u32HorDrawMode);

    if(HI_TRUE==pstVdpRegTmp->V0_HPZME_HSP.bits.lhfir_en)
    {
        //hpzme's outfmt must equal to fdr's fmt.
        VDP_ASSERT((pstVdpRegTmp->V0_HPZME_HINFO.bits.out_fmt+2)==pstVdpRegTmp->VID_SRC_INFO.bits.data_type);
        VDP_ASSERT(u32HpzmeOutWth<=u32V0FdrOutWth);
        VDP_ASSERT(pstVdpRegTmp->V0_HPZME_HSP.bits.hratio != 0);
        VDP_ASSERT(u32HpzmeOutWth != 0);
        VDP_ASSERT(pstVdpRegTmp->V0_HPZME_HSP.bits.hratio==((u32V0FdrOutWth/2*ZME_HPREC)/(u32HpzmeOutWth/2)));
    }

    return;
}

static HI_VOID VDP_DRV_CheckDeiTnrCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    HI_U32 u32V0InWth       = 0;
    HI_U32 u32V0InHgt       = 0;
    HI_U32 u32HorDrawMode   = 0;
    HI_U32 u32VerDrawMode   = 0;
    HI_U32 u32ReadMode      = 0;
    HI_U32 u32V0FdrOutWth   = 0;
    HI_U32 u32V0FdrOutHgt   = 0;
    HI_U32 u32HpzmeOutWth   = 0;
    HI_U32 u32P2Wth         = 0;
    HI_U32 u32P2Hgt         = 0;
    HI_U32 u32RfrYStrd      = 0;
    HI_U32 u32RfrCStrd      = 0;
    HI_U32 u32DiYStrAddr    = 0;
    HI_U32 u32DiYEndAddr    = 0;
    HI_U32 u32DiCStrAddr    = 0;
    HI_U32 u32DiCEndAddr    = 0;
    HI_U32 u32HismWth       = 0;
    HI_U32 u32HismHgt       = 0;
    HI_U32 u32RhismStrd     = 0;
    HI_U32 u32WhismStrd     = 0;
    HI_U32 u32HismStrAddr   = 0;
    HI_U32 u32HismEndAddr   = 0;
    HI_U32 u32MadMode       = 0;
    HI_U32 u32MadWth        = 0;
    HI_U32 u32MadHgt        = 0;
    HI_U32 u32NrMadStrAddr  = 0;
    HI_U32 u32NrMadEndAddr  = 0;
    HI_U32 u32MadRStrd      = 0;
    HI_U32 u32MadWStrd      = 0;
    HI_BOOL bHpzme          = 0;
    HI_U32 u32HpZmeOutWth   = 0;

    bHpzme                  = pstVdpRegTmp->V0_HPZME_HSP.bits.lhfir_en;
    u32HpZmeOutWth          = pstVdpRegTmp->V0_HPZME_HINFO.bits.out_width+1;
    u32V0InWth              = pstVdpRegTmp->VID_IN_RESO.bits.ireso_w+1;
    u32V0InHgt              = pstVdpRegTmp->VID_IN_RESO.bits.ireso_h+1;
    u32HorDrawMode          = pstVdpRegTmp->VID_OUT_CTRL.bits.draw_pixel_mode;
    u32VerDrawMode          = pstVdpRegTmp->VID_READ_CTRL.bits.lm_draw_mode;
    u32ReadMode             = pstVdpRegTmp->VID_READ_MODE.bits.lm_rmode;
    u32V0FdrOutWth          = (u32V0InWth>>u32HorDrawMode);
    u32V0FdrOutHgt          = (u32V0InHgt>>u32VerDrawMode);

    u32HpzmeOutWth          = (HI_TRUE==bHpzme) ? u32HpZmeOutWth : u32V0FdrOutWth;
    u32P2Wth                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_width+1;
    u32P2Hgt                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_height+1;
    u32RfrYStrd             = pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfry_stride;
    u32RfrCStrd             = pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfrc_stride;
    u32DiYStrAddr           = pstVdpRegTmp->VPSS_DI_CYC_Y_START_ADDR_LOW.u32;
    u32DiYEndAddr           = pstVdpRegTmp->VPSS_DI_CYC_Y_END_ADDR_LOW.u32;
    u32DiCStrAddr           = pstVdpRegTmp->VPSS_DI_CYC_C_START_ADDR_LOW.u32;
    u32DiCEndAddr           = pstVdpRegTmp->VPSS_DI_CYC_C_END_ADDR_LOW.u32;
    u32HismWth              = pstVdpRegTmp->VPSS_RHISM_SIZE.bits.rhism_width+1;
    u32HismHgt              = pstVdpRegTmp->VPSS_RHISM_SIZE.bits.rhism_height+1;
    u32RhismStrd            = pstVdpRegTmp->VPSS_RHISM_STRIDE.bits.rhism_stride;
    u32WhismStrd            = pstVdpRegTmp->VPSS_WHISM_STRIDE.bits.whism_stride;
    u32HismStrAddr          = pstVdpRegTmp->VPSS_HISM_CYC_START_ADDR_LOW.u32;
    u32HismEndAddr          = pstVdpRegTmp->VPSS_HISM_CYC_END_ADDR_LOW.u32;
    u32MadMode              = pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_mad_mode;
    u32MadWth               = pstVdpRegTmp->VPSS_NR_RMAD_SIZE.bits.nr_rmad_width+1;
    u32MadHgt               = pstVdpRegTmp->VPSS_NR_RMAD_SIZE.bits.nr_rmad_height+1;
    u32NrMadStrAddr         = pstVdpRegTmp->VPSS_NR_MAD_CYC_START_ADDR_LOW.u32;
    u32NrMadEndAddr         = pstVdpRegTmp->VPSS_NR_MAD_CYC_END_ADDR_LOW.u32;
    u32MadRStrd             = pstVdpRegTmp->VPSS_NR_RMAD_STRIDE.bits.nr_rmad_stride;
    u32MadWStrd             = pstVdpRegTmp->VPSS_NR_WMAD_STRIDE.bits.nr_wmad_stride;

    if((HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en) || (HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en) || (HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.frm_init))
    {
        VDP_ASSERT(u32P2Wth==u32HpzmeOutWth);
        VDP_ASSERT(u32P2Hgt==u32V0FdrOutHgt);

        if(pstVdpRegTmp->VID_SRC_INFO.bits.data_type==2)
        {
            VDP_ASSERT(u32P2Hgt%4==0);//420 need?
        }
        VDP_ASSERT(u32RfrYStrd==pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2y_stride);
        VDP_ASSERT(u32RfrCStrd==pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2c_stride);
        VDP_ASSERT(pstVdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw==pstVdpRegTmp->VPSS_P2_CTRL.bits.p2_bitw);
        VDP_ASSERT(u32RfrYStrd==u32RfrCStrd);
    }

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en)
    {
        VDP_ASSERT(u32RfrYStrd == pstVdpRegTmp->VPSS_P1_STRIDE.bits.p1y_stride);
        VDP_ASSERT(u32RfrCStrd == pstVdpRegTmp->VPSS_P1_STRIDE.bits.p1c_stride);

        VDP_ASSERT(u32RfrYStrd == pstVdpRegTmp->VPSS_P3_STRIDE.bits.p3y_stride);
        VDP_ASSERT(u32RfrCStrd == pstVdpRegTmp->VPSS_P3_STRIDE.bits.p3c_stride);

        VDP_ASSERT(pstVdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw == pstVdpRegTmp->VPSS_P1_CTRL.bits.p1_bitw);
        VDP_ASSERT(pstVdpRegTmp->VPSS_RFR_CTRL.bits.rfr_bitw == pstVdpRegTmp->VPSS_P3_CTRL.bits.p3_bitw);

        VDP_ASSERT(u32HismWth == (u32P2Wth + 2) / 4);
        VDP_ASSERT(u32HismHgt == u32P2Hgt / 2);

        VDP_ASSERT(u32RhismStrd == u32WhismStrd);
        VDP_ASSERT((u32HismEndAddr - u32HismStrAddr) == (u32RhismStrd * u32HismHgt * 2));
    }

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en)
    {
        if(u32MadMode==2)
        {
            VDP_ASSERT(u32MadWth==((u32HpzmeOutWth+7)/8*2));
        }
        else
        {
            VDP_ASSERT(u32MadWth==u32HpzmeOutWth);
        }

        VDP_ASSERT(u32MadHgt==(u32V0FdrOutHgt>>(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en)));

        VDP_ASSERT(u32MadRStrd==u32MadWStrd);

        if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en)
        {
            VDP_ASSERT((u32NrMadEndAddr-u32NrMadStrAddr)==(u32MadWStrd*(u32MadHgt*2+13)));
        }
        else
        {
            VDP_ASSERT((u32NrMadEndAddr-u32NrMadStrAddr)==(u32MadWStrd*u32MadHgt));
        }
    }

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en)
    {
        VDP_ASSERT((u32DiYEndAddr-u32DiYStrAddr)==(u32RfrYStrd*(3*(u32P2Hgt/2)+2)));
        VDP_ASSERT((u32DiCEndAddr-u32DiCStrAddr)==(u32RfrCStrd*(3*(u32P2Hgt/4)+3)));
    }
    else if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en)
    {
        VDP_ASSERT((u32DiYEndAddr-u32DiYStrAddr)==(u32RfrYStrd*(u32P2Hgt)));
        VDP_ASSERT((u32DiCEndAddr-u32DiCStrAddr)==(u32RfrCStrd*(u32P2Hgt/2)));
    }

    return;
}

static HI_VOID VDP_DRV_CheckRgmvCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    HI_U32 u32P2Wth         = 0;
    HI_U32 u32P2Hgt         = 0;
    HI_BOOL bDeiEn          = 0;
    HI_BOOL bRgmvEn         = 0;
    HI_BOOL bRPrjhEn        = 0;
    HI_BOOL bWPrjhEn        = 0;
    HI_U32 u32PrjhWth       = 0;
    HI_U32 u32PrjhHgt       = 0;
    HI_U32 u32RPrjhStrd     = 0;
    HI_U32 u32WPrjhStrd     = 0;
    HI_U32 u32PrjhStrAddr   = 0;
    HI_U32 u32PrjhEndAddr   = 0;
    HI_BOOL bRPrjvEn        = 0;
    HI_BOOL bWPrjvEn        = 0;
    HI_U32 u32PrjvWth       = 0;
    HI_U32 u32PrjvHgt       = 0;
    HI_U32 u32RPrjvStrd     = 0;
    HI_U32 u32WPrjvStrd     = 0;
    HI_U32 u32PrjvStrAddr   = 0;
    HI_U32 u32PrjvEndAddr   = 0;
    HI_BOOL bP2RgmvEn       = 0;
    HI_BOOL bP1RgmvEn       = 0;
    HI_BOOL bCfRgmvEn       = 0;
    HI_U32 u32RgmvWth       = 0;
    HI_U32 u32RgmvHgt       = 0;
    HI_U32 u32P2RgmvStrd    = 0;
    HI_U32 u32P1RgmvStrd    = 0;
    HI_U32 u32CfRgmvStrd    = 0;
    HI_U32 u32RgmvStrAddr   = 0;
    HI_U32 u32RgmvEndAddr   = 0;

    u32P2Wth                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_width+1;
    u32P2Hgt                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_height+1;
    bDeiEn                  = pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en;
    bRgmvEn                 = pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en;
    bRPrjhEn                = pstVdpRegTmp->VPSS_P2STATH_CTRL.bits.p2stath_en;
    bWPrjhEn                = pstVdpRegTmp->VPSS_CFSTATH_CTRL.bits.cfstath_en;
    u32PrjhWth              = pstVdpRegTmp->VPSS_P2STATH_SIZE.bits.p2stath_width+1;
    u32PrjhHgt              = pstVdpRegTmp->VPSS_P2STATH_SIZE.bits.p2stath_height+1;
    u32RPrjhStrd            = pstVdpRegTmp->VPSS_P2STATH_STRIDE.bits.p2stath_stride;
    u32WPrjhStrd            = pstVdpRegTmp->VPSS_CFSTATH_STRIDE.bits.cfstath_stride;
    u32PrjhStrAddr          = pstVdpRegTmp->VPSS_STATH_CYC_START_ADDR_LOW.u32;
    u32PrjhEndAddr          = pstVdpRegTmp->VPSS_STATH_CYC_END_ADDR_LOW.u32;
    bRPrjvEn                = pstVdpRegTmp->VPSS_P2STATV_CTRL.bits.p2statv_en;
    bWPrjvEn                = pstVdpRegTmp->VPSS_CFSTATV_CTRL.bits.cfstatv_en;
    u32PrjvWth              = pstVdpRegTmp->VPSS_P2STATV_SIZE.bits.p2statv_width+1;
    u32PrjvHgt              = pstVdpRegTmp->VPSS_P2STATV_SIZE.bits.p2statv_height+1;
    u32RPrjvStrd            = pstVdpRegTmp->VPSS_P2STATV_STRIDE.bits.p2statv_stride;
    u32WPrjvStrd            = pstVdpRegTmp->VPSS_CFSTATV_STRIDE.bits.cfstatv_stride;
    u32PrjvStrAddr          = pstVdpRegTmp->VPSS_STATV_CYC_START_ADDR_LOW.u32;
    u32PrjvEndAddr          = pstVdpRegTmp->VPSS_STATV_CYC_END_ADDR_LOW.u32;
    bP2RgmvEn               = pstVdpRegTmp->VPSS_P2RGMV_CTRL.bits.p2rgmv_en;
    bP1RgmvEn               = pstVdpRegTmp->VPSS_P1RGMV_CTRL.bits.p1rgmv_en;
    bCfRgmvEn               = pstVdpRegTmp->VPSS_CFRGMV_CTRL.bits.cfrgmv_en;
    u32RgmvWth              = pstVdpRegTmp->VPSS_P2RGMV_SIZE.bits.p2rgmv_width+1;
    u32RgmvHgt              = pstVdpRegTmp->VPSS_P2RGMV_SIZE.bits.p2rgmv_height+1;
    u32P2RgmvStrd           = pstVdpRegTmp->VPSS_P2RGMV_STRIDE.bits.p2rgmv_stride;
    u32P1RgmvStrd           = pstVdpRegTmp->VPSS_P1RGMV_STRIDE.bits.p1rgmv_stride;
    u32CfRgmvStrd           = pstVdpRegTmp->VPSS_CFRGMV_STRIDE.bits.cfrgmv_stride;
    u32RgmvStrAddr          = pstVdpRegTmp->VPSS_RGMV_CYC_START_ADDR_LOW.u32;
    u32RgmvEndAddr          = pstVdpRegTmp->VPSS_RGMV_CYC_END_ADDR_LOW.u32;

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en)
    {
        VDP_ASSERT(u32PrjhWth==((u32P2Wth+33)/64*128/4));
        VDP_ASSERT(u32PrjhHgt==(((u32P2Hgt>>(HI_TRUE==bDeiEn))+5)/8));

        VDP_ASSERT(u32WPrjhStrd==u32RPrjhStrd);

        if(HI_TRUE==bDeiEn)
        {
            VDP_ASSERT((u32PrjhEndAddr-u32PrjhStrAddr)==(u32WPrjhStrd*(2*u32PrjhHgt+1)));
        }
        else
        {
            VDP_ASSERT((u32PrjhEndAddr-u32PrjhStrAddr)==(u32WPrjhStrd*(u32PrjhHgt+1)));
        }

        VDP_ASSERT(u32PrjvWth==((u32P2Wth+33)/64*16/4));
        VDP_ASSERT(u32PrjvHgt==(((u32P2Hgt>>(HI_TRUE==bDeiEn))+5)/8));

        VDP_ASSERT(u32WPrjvStrd==u32RPrjvStrd);

        if(HI_TRUE==bDeiEn)
        {
            VDP_ASSERT((u32PrjvEndAddr-u32PrjvStrAddr)==(u32WPrjvStrd*(2*u32PrjvHgt+1)));
        }
        else
        {
            VDP_ASSERT((u32PrjvEndAddr-u32PrjvStrAddr)==(u32WPrjvStrd*(u32PrjvHgt+1)));
        }

        VDP_ASSERT(u32RgmvWth==((u32P2Wth+33)/64));
        VDP_ASSERT(u32RgmvHgt==(((u32P2Hgt>>(HI_TRUE==bDeiEn))+5)/8));

        VDP_ASSERT(u32CfRgmvStrd==u32P1RgmvStrd);
        VDP_ASSERT(u32CfRgmvStrd==u32P2RgmvStrd);

        if(HI_TRUE==bDeiEn)
        {
            VDP_ASSERT((u32RgmvEndAddr-u32RgmvStrAddr)==(u32CfRgmvStrd*(3*u32RgmvHgt)));
        }
        else
        {
            VDP_ASSERT((u32RgmvEndAddr-u32RgmvStrAddr)==(u32CfRgmvStrd*(2*u32RgmvHgt)));
        }
    }

    return;
}

static HI_VOID VDP_DRV_CheckSnrCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    HI_U32 u32P2Wth         = 0;
    HI_U32 u32P2Hgt         = 0;
    HI_BOOL bDeiEn          = 0;
    HI_BOOL bSnrEn          = 0;
    HI_BOOL bTnrEn          = 0;
    HI_U32 u32RDmWth        = 0;
    HI_U32 u32RDmHgt        = 0;
    HI_U32 u32RdmStrd       = 0;
    HI_U32 u32WdmStrd       = 0;
    HI_U32 u32DmCntStrAddr  = 0;
    HI_U32 u32DmCntEndAddr  = 0;
    HI_U32 u32SnrMadStrd    = 0;
    HI_U32 u32MadWStrd      = 0;
    HI_U32 u32MacMadEn      = 0;
    HI_U32 u32MadVfirEn     = 0;

    u32P2Wth                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_width+1;
    u32P2Hgt                = pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_height+1;
    bDeiEn                  = pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en;
    bSnrEn                  = pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en;
    bTnrEn                  = pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en;
    u32RDmWth               = pstVdpRegTmp->VPSS_RDM_CNT_SIZE.bits.rdm_cnt_width+1;
    u32RDmHgt               = pstVdpRegTmp->VPSS_RDM_CNT_SIZE.bits.rdm_cnt_height+1;
    u32RdmStrd              = pstVdpRegTmp->VPSS_RDM_CNT_STRIDE.bits.rdm_cnt_stride;
    u32WdmStrd              = pstVdpRegTmp->VPSS_WDM_CNT_STRIDE.bits.wdm_cnt_stride;
    u32DmCntStrAddr         = pstVdpRegTmp->VPSS_DM_CNT_CYC_START_ADDR_LOW.u32;
    u32DmCntEndAddr         = pstVdpRegTmp->VPSS_DM_CNT_CYC_END_ADDR_LOW.u32;
    u32SnrMadStrd           = pstVdpRegTmp->VPSS_SNR_RMAD_STRIDE.bits.snr_rmad_stride;
    u32MadWStrd             = pstVdpRegTmp->VPSS_NR_WMAD_STRIDE.bits.nr_wmad_stride;
    u32MacMadEn             = pstVdpRegTmp->V0_VPSS_CTRL.bits.mac_mad_en;
    u32MadVfirEn            = pstVdpRegTmp->VPSS_SNR_RMAD_CTRL1.bits.snr_rmad_vifir_en;

    if(HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en)
    {
        VDP_ASSERT(bTnrEn==bSnrEn);
        VDP_ASSERT(u32RDmWth==((u32P2Wth+3)/4));
        VDP_ASSERT(u32RDmHgt==((u32P2Hgt+3)/4));
        VDP_ASSERT(u32RdmStrd==u32WdmStrd);

        if(HI_TRUE==bDeiEn)
        {
            VDP_ASSERT((u32DmCntEndAddr-u32DmCntStrAddr)==(u32WdmStrd*u32RDmHgt*2));
            VDP_ASSERT(u32MacMadEn==1);
            VDP_ASSERT(u32MadVfirEn==1);
        }
        else
        {
            VDP_ASSERT((u32DmCntEndAddr-u32DmCntStrAddr)==(u32WdmStrd*(u32RDmHgt+1)));
        }

        VDP_ASSERT(u32SnrMadStrd==u32MadWStrd);
    }

    return;
}

static HI_VOID VPD_DRV_CheckZmeCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    #if 0
    HI_U32 u32VfInWth       = 0;
    HI_U32 u32VfInHgt       = 0;
    HI_U32 u32VfReadMode    = 0;
    HI_U32 u32VfHorDrawMode = 0;
    HI_U32 u32VfVerDrawMode = 0;
    HI_U32 u32InWth         = 0;
    HI_U32 u32InHgt         = 0;
    HI_U32 u32ReadMode      = 0;
    HI_U32 u32HorDrawMode   = 0;
    HI_U32 u32VerDrawMode   = 0;
    HI_U32 u32FdrOutWth     = 0;
    HI_U32 u32FdrOutHgt     = 0;
    HI_BOOL bZmeEn          = 0;
    HI_U32 u32HfirOrder     = 0;
    HI_U32 u32Hratio        = 0;
    HI_U32 u32Vratio        = 0;
    HI_U32 u32ZmeOutWth     = 0;
    HI_U32 u32ZmeOutHgt     = 0;
    HI_U32 u32VfFdrOutWth   = 0;
    HI_U32 u32VfFdrOutHgt   = 0;
    HI_BOOL bHpzmeEn        = 0;
    HI_U32 u32HpzmeOutWth   = 0;
    HI_U32 u32ZmeInWth      = 0;
    HI_U32 u32IntfWth       = 0;
    HI_U32 u32IntfHgt       = 0;
    HI_U32 u32VideoHgt             = 0;
    HI_U32 u32VideoHgtDrawMode     = 0;
    HI_U32 u32VideoWth             = 0;
    HI_U32 u32VideoVerDrawMode     = 0;
    HI_U32 u32IntfVerRatio         = 0;
    HI_U32 u32SrcVerRatio          = 0;
    HI_U32 u32SrcHorRatio          = 0;
    HI_U32 u32SrcVerRatioDrawMode  = 0;
    HI_BOOL bOfflineFreeze         = HI_FALSE;/*(((pstVdpRegTmp->VID_DTV_DEBUG3.bits.underload_sta)&0x1 == 1) ||
                                      ((pstVdpRegTmp->VID_DTV_MODE_IMG.bits.reset_en == 1)&&(pstVdpRegTmp->VID_DTV_MODE_IMG.bits.reset_mode==0)));*/

    u32VfInWth            = pstVdpRegTmp->VF_VID_IN_RESO.bits.ireso_w+1;
    u32VfInHgt            = pstVdpRegTmp->VF_VID_IN_RESO.bits.ireso_h+1;
    u32VfReadMode         = pstVdpRegTmp->VF_VID_READ_MODE.bits.lm_rmode;
    u32VfHorDrawMode      = pstVdpRegTmp->VF_VID_OUT_CTRL.bits.draw_pixel_mode;
    u32VfVerDrawMode      = pstVdpRegTmp->VF_VID_READ_CTRL.bits.lm_draw_mode;
    u32VfFdrOutWth        = (u32VfInWth>>u32VfHorDrawMode);
    u32VfFdrOutHgt        = (u32VfInHgt>>u32VfVerDrawMode);

    bZmeEn                = pstVdpRegTmp->V0_VSP.bits.vlmsc_en;
    u32HfirOrder          = pstVdpRegTmp->V0_HSP.bits.hfir_order;
    u32Hratio             = pstVdpRegTmp->V0_HSP.bits.hratio;
    u32Vratio             = pstVdpRegTmp->V0_VSR.bits.vratio;
    u32ZmeOutWth          = pstVdpRegTmp->V0_ZME_ORESO.bits.ow+1;
    u32ZmeOutHgt          = pstVdpRegTmp->V0_ZME_ORESO.bits.oh+1;

    u32InWth              = pstVdpRegTmp->VID_IN_RESO.bits.ireso_w+1;
    u32InHgt              = pstVdpRegTmp->VID_IN_RESO.bits.ireso_h+1;
    u32ReadMode           = pstVdpRegTmp->VID_READ_MODE.bits.lm_rmode;
    u32HorDrawMode        = pstVdpRegTmp->VID_OUT_CTRL.bits.draw_pixel_mode;
    u32VerDrawMode        = pstVdpRegTmp->VID_READ_CTRL.bits.lm_draw_mode;
    u32FdrOutWth          = (u32InWth>>u32HorDrawMode);
    u32FdrOutHgt          = ((HI_TRUE==pstVdpRegTmp->V0_VPSS_CTRL.bits.frm_init)&&((u32ReadMode == 2)||(u32ReadMode == 3)||(u32ReadMode == 4)||(u32ReadMode == 5))) ? ((u32InHgt>>u32VerDrawMode)>>1) : (u32InHgt>>u32VerDrawMode);

    bHpzmeEn              = pstVdpRegTmp->V0_HPZME_HSP.bits.lhfir_en;
    u32HpzmeOutWth        = pstVdpRegTmp->V0_HPZME_HINFO.bits.out_width+1;

    u32IntfHgt            = pstVdpRegTmp->DHD0_VSYNC1.bits.vact + 1;
    u32IntfWth            = pstVdpRegTmp->DHD0_HSYNC1.bits.hact + 1;

    u32ZmeInWth           = (HI_TRUE == bHpzmeEn) ? u32HpzmeOutWth : u32FdrOutWth;

    bOfflineFreeze          = ((pstVdpRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode == 1) && (bOfflineFreeze == HI_TRUE)) ? HI_TRUE : HI_FALSE;
    u32VideoHgt             = (bOfflineFreeze == HI_TRUE) ? u32VfInHgt : u32InHgt;
    u32VideoHgtDrawMode     = (bOfflineFreeze == HI_TRUE) ? u32VfFdrOutHgt : u32FdrOutHgt;
    u32VideoWth             = (bOfflineFreeze == HI_TRUE) ? u32VfFdrOutWth : u32FdrOutWth;
    u32VideoVerDrawMode     = (bOfflineFreeze == HI_TRUE) ? u32VfVerDrawMode : u32VerDrawMode;
    u32IntfVerRatio         = u32IntfHgt/u32ZmeOutHgt;
    u32SrcVerRatio          = u32VideoHgt/u32ZmeOutHgt;
    u32SrcHorRatio          = u32VideoWth/u32ZmeOutWth;
    u32SrcVerRatioDrawMode  = u32VideoHgtDrawMode/u32ZmeOutHgt;

    if(HI_TRUE == bZmeEn)
    {
        VDP_ASSERT(u32HfirOrder == 1);
        VDP_ASSERT(u32Hratio != 0);
        VDP_ASSERT(u32Vratio != 0);

        if (HI_TRUE == pstVdpRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
        {
            VDP_ASSERT(u32VfInWth % 2 == 0);
            VDP_ASSERT(u32VfInHgt % 2 == 0);
        }

        VDP_ASSERT(u32ZmeOutWth % 2 == 0);
        VDP_ASSERT(u32ZmeOutHgt % 2 == 0);
        VDP_ASSERT(u32InWth % 2 == 0);
        VDP_ASSERT(u32InHgt % 2 == 0);
        VDP_ASSERT(u32IntfHgt % 2 == 0);
        VDP_ASSERT(u32IntfWth % 2 == 0);

        if (HI_TRUE == bHpzmeEn)
        {
            VDP_ASSERT(u32HpzmeOutWth % 2 == 0);
        }

        if (bOfflineFreeze == HI_TRUE)
        {
            VDP_ASSERT(u32Hratio == ((u32VfFdrOutWth / 2 * ZME_HPREC) / (u32ZmeOutWth / 2)));
            VDP_ASSERT(u32Vratio == ((u32VfFdrOutHgt / 2 * ZME_VPREC) / (u32ZmeOutHgt / 2)));
        }
        else
        {
            VDP_ASSERT(u32Hratio == ((u32ZmeInWth / 2 * ZME_HPREC) / (u32ZmeOutWth / 2)));
            VDP_ASSERT(u32Vratio == ((u32FdrOutHgt / 2 * ZME_VPREC) / (u32ZmeOutHgt / 2)));
        }

        if (((u32IntfVerRatio >= 4) && (u32IntfVerRatio < 8)) || ((u32SrcVerRatio > 6) && (u32SrcVerRatio <= 12)))
        {
            VDP_ASSERT(u32VideoVerDrawMode == 1);
        }
        else if (((u32IntfVerRatio >= 8) && (u32IntfVerRatio < 16)) || ((u32SrcVerRatio > 12) && (u32SrcVerRatio <= 24)))
        {
            VDP_ASSERT(u32VideoVerDrawMode == 2);
        }
        else if (((u32IntfVerRatio >= 16) && (u32IntfVerRatio < 32)) || ((u32SrcVerRatio > 24) && (u32SrcVerRatio <= 48)))
        {
            VDP_ASSERT(u32VideoVerDrawMode == 3);
        }
        else
        {
            VDP_ASSERT(u32VideoVerDrawMode == 0);
        }

        if (u32SrcHorRatio <= 1)
        {
            VDP_ASSERT(bHpzmeEn == 0);
        }
        else if ((u32SrcHorRatio * 6 / 5) >= u32SrcVerRatioDrawMode)
        {
            VDP_ASSERT(bHpzmeEn == 1);
            VDP_ASSERT(pstVdpRegTmp->V0_HSP.bits.hlmsc_en == 0);
        }
        else if ((u32SrcHorRatio * 6 / 5) < u32SrcVerRatioDrawMode)
        {
            VDP_ASSERT(bHpzmeEn == 1);
            VDP_ASSERT(pstVdpRegTmp->V0_HSP.bits.hlmsc_en == 1);
        }
    }

    VDP_PRINT("--v0 V0_ORESO_READ out, w:%d,h:%d!\n", pstVdpRegTmp->V0_ORESO_READ.bits.ow,
                                                      pstVdpRegTmp->V0_ORESO_READ.bits.oh);

    VDP_PRINT("--v0 V0_DFPOS , x:%d,y:%d!\n", pstVdpRegTmp->V0_DFPOS.bits.disp_xfpos,
                                                      pstVdpRegTmp->V0_DFPOS.bits.disp_yfpos);


    VDP_PRINT("--v0 V0_DLPOS , ex:%d,ey:%d!\n", pstVdpRegTmp->V0_DLPOS.bits.disp_xlpos,
                                                      pstVdpRegTmp->V0_DLPOS.bits.disp_ylpos);

    VDP_PRINT("--v0 V0_VFPOS , x:%d,y:%d!\n", pstVdpRegTmp->V0_VFPOS.bits.video_xfpos,
                                                      pstVdpRegTmp->V0_VFPOS.bits.video_yfpos);


    VDP_PRINT("--v0 V0_VLPOS , ex:%d,ey:%d!\n", pstVdpRegTmp->V0_VLPOS.bits.video_xlpos,
                                                      pstVdpRegTmp->V0_VLPOS.bits.video_ylpos);


    VDP_PRINT("--v0 V0_FCROP , x:%d,y:%d!\n", pstVdpRegTmp->V0_FCROP.bits.wfcrop,
                                                      pstVdpRegTmp->V0_FCROP.bits.hfcrop);

    VDP_PRINT("--v0 V0_LCROP , ex:%d,ey:%d!\n", pstVdpRegTmp->V0_LCROP.bits.wlcrop + 1,
                                                      pstVdpRegTmp->V0_LCROP.bits.hlcrop + 1);


    VDP_PRINT("--vid VID_SRC_RESO src, w:%d,h:%d!\n", pstVdpRegTmp->VID_SRC_RESO.bits.src_w,
                                                          pstVdpRegTmp->VID_SRC_RESO.bits.src_h);
    VDP_PRINT("--vid VID_SRC_CROP src, x:%d,y:%d!\n", pstVdpRegTmp->VID_SRC_CROP.bits.src_crop_x,
                                                          pstVdpRegTmp->VID_SRC_CROP.bits.src_crop_y);
    VDP_PRINT("--vid VID_IN_RESO src, w:%d,h:%d!\n", pstVdpRegTmp->VID_IN_RESO.bits.ireso_w + 1,
                                                          pstVdpRegTmp->VID_IN_RESO.bits.ireso_h + 1);


    VDP_PRINT("--vpssout VPSS_OUT_SIZE src, w:%d,h:%d!\n", pstVdpRegTmp->VPSS_OUT_SIZE.bits.out_width + 1,
                                                          pstVdpRegTmp->VPSS_OUT_SIZE.bits.out_height + 1);
    VDP_PRINT("--vpssp2  VPSS_P2_SIZE src, w:%d,h:%d!\n", pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_width + 1,
                                                          pstVdpRegTmp->VPSS_P2_SIZE.bits.p2_height + 1);

    VDP_PRINT("--vf  V0_CTRL  field:%d!\n", pstVdpRegTmp->V0_CTRL.bits.field_match);

#endif
    return;
}

static HI_VOID VPD_DRV_CheckSysCfg(S_VDP_REGS_TYPE *pstVdpRegTmp)
{
    if (HI_FALSE == pstVdpRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
    {
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->VPSS_OUT_CTRL.bits.out_en);
        VDP_ASSERT(0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_btm_disp_num);
        VDP_ASSERT(0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_btm_task_typ);
        VDP_ASSERT(0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_top_task_typ);
    }
    else
    {
        VDP_ASSERT(HI_TRUE == pstVdpRegTmp->VPSS_OUT_CTRL.bits.out_en);

        if (0 != pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_btm_task_typ)
        {
            VDP_ASSERT(0 != pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_btm_disp_num);
        }

        if (0 != pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_top_task_typ)
        {
            VDP_ASSERT(0 != pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_top_disp_num);
        }

        if (0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_index)
        {
            if (HI_FALSE == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_first_field_sel)
            {
                VDP_ASSERT(0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_top_task_typ);
            }
            else
            {
                VDP_ASSERT(0 == pstVdpRegTmp->VID_DTV_DEBUG7.bits.cur_btm_task_typ);
            }
        }
    }

    if (VDP_VID_DATA_FMT_PKG == pstVdpRegTmp->VID_SRC_INFO.bits.data_fmt)
    {
        VDP_ASSERT(HI_TRUE == pstVdpRegTmp->LINK_CTRL.bits.v0_link_ctrl);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.vc1_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_HPZME_HSP.bits.lhfir_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->VPSS_OUT_CTRL.bits.out_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_HSP.bits.hlmsc_en);
        VDP_ASSERT(HI_FALSE == pstVdpRegTmp->V0_VSP.bits.vlmsc_en);
    }

    VDP_ASSERT(HI_TRUE == pstVdpRegTmp->VDP_MST_CTRL.bits.mid_enable);

    if (1 == pstVdpRegTmp->V0_CTRL.bits.surface_en)
    {
        VDP_ASSERT(0 != pstVdpRegTmp->VID_STRIDE.bits.lm_stride);
        VDP_ASSERT(0 != pstVdpRegTmp->VID_STRIDE.bits.chm_stride);

        if ((1 == pstVdpRegTmp->VID_SRC_INFO.bits.data_fmt) && (1 == pstVdpRegTmp->VID_SRC_BITW.bits.data_width))
        {
            VDP_ASSERT(0 != pstVdpRegTmp->VID_2BIT_STRIDE.bits.lm_tile_stride);
            VDP_ASSERT(0 != pstVdpRegTmp->VID_2BIT_STRIDE.bits.chm_tile_stride);
        }

        if (1 == pstVdpRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
        {
            VDP_ASSERT(0 != pstVdpRegTmp->VF_VID_STRIDE.bits.lm_stride);
            VDP_ASSERT(0 != pstVdpRegTmp->VF_VID_STRIDE.bits.chm_stride);
            VDP_ASSERT(0 != pstVdpRegTmp->VPSS_OUT_STRIDE.bits.outy_stride);
            VDP_ASSERT(0 != pstVdpRegTmp->VPSS_OUT_STRIDE.bits.outc_stride);

            if (HI_TRUE == pstVdpRegTmp->V0_VPSS_CTRL.bits.dei_en)
            {
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P1_STRIDE.bits.p1y_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P1_STRIDE.bits.p1c_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2y_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2c_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P3_STRIDE.bits.p3y_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P3_STRIDE.bits.p3c_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfry_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfrc_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RHISM_STRIDE.bits.rhism_stride);
            }

            if (HI_TRUE == pstVdpRegTmp->V0_VPSS_CTRL.bits.tnr_en)
            {
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2y_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2_STRIDE.bits.p2c_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfry_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RFR_STRIDE.bits.rfrc_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_NR_RMAD_STRIDE.bits.nr_rmad_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_NR_WMAD_STRIDE.bits.nr_wmad_stride);
            }

            if (HI_TRUE == pstVdpRegTmp->V0_VPSS_CTRL.bits.snr_en)
            {
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_SNR_RMAD_STRIDE.bits.snr_rmad_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_WDM_CNT_STRIDE.bits.wdm_cnt_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_RDM_CNT_STRIDE.bits.rdm_cnt_stride);
            }

            if (HI_TRUE == pstVdpRegTmp->V0_VPSS_CTRL.bits.rgme_en)
            {
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2STATH_STRIDE.bits.p2stath_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2STATV_STRIDE.bits.p2statv_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P2RGMV_STRIDE.bits.p2rgmv_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_P1RGMV_STRIDE.bits.p1rgmv_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_WHISM_STRIDE.bits.whism_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_CFSTATH_STRIDE.bits.cfstath_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_CFSTATV_STRIDE.bits.cfstatv_stride);
                VDP_ASSERT(0 != pstVdpRegTmp->VPSS_CFRGMV_STRIDE.bits.cfrgmv_stride);
            }
        }

    }


    if (1 == pstVdpRegTmp->V1_CTRL.bits.surface_en)
    {
        VDP_ASSERT(0 != pstVdpRegTmp->V1_VID_STRIDE.bits.lm_stride);
        VDP_ASSERT(0 != pstVdpRegTmp->V1_VID_STRIDE.bits.chm_stride);
    }


    if (1 == pstVdpRegTmp->WBC_DHD0_CTRL.bits.wbc_en)
    {
        VDP_ASSERT(0 != pstVdpRegTmp->WBC_YSTRIDE.bits.wbc_ystride);
        VDP_ASSERT(0 != pstVdpRegTmp->WBC_CSTRIDE.bits.wbc_cstride);

    }

    return;
}


HI_VOID VDP_DRV_CheckOffPart(S_VDP_REGS_TYPE *pstLogicRegs)
{
    memcpy(pstVdpVpssRegTmp, pstLogicRegs, sizeof(S_VDP_REGS_TYPE));

    if(HI_TRUE == pstVdpVpssRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
    {
        VPD_DRV_CheckSysCfg(pstVdpVpssRegTmp);

        VDP_DRV_CheckHpzme(pstVdpVpssRegTmp);

        VDP_DRV_CheckVpssSysCtrlCfg(pstVdpVpssRegTmp);

        VDP_DRV_CheckDeiTnrCfg(pstVdpVpssRegTmp);

        VDP_DRV_CheckRgmvCfg(pstVdpVpssRegTmp);

        VDP_DRV_CheckSnrCfg(pstVdpVpssRegTmp);
    }

    return;
}

HI_VOID VDP_DRV_CheckOnlPart(S_VDP_REGS_TYPE *pstLogicRegs)
{
    memcpy(pstVdpVpssRegTmp, pstLogicRegs, sizeof(S_VDP_REGS_TYPE));

    if(HI_TRUE == pstVdpVpssRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
    {
        VPD_DRV_CheckZmeCfg(pstVdpVpssRegTmp);
    }

    return;
}

HI_VOID VDP_DRV_CheckAllPath(S_VDP_REGS_TYPE *pstLogicRegs)
{
    memcpy(pstVdpVpssRegTmp, pstLogicRegs, sizeof(S_VDP_REGS_TYPE));

    if(HI_FALSE == pstVdpVpssRegTmp->CUR_LINE_MODE_STA.bits.cur_line_mode)
    {
        VPD_DRV_CheckSysCfg(pstVdpVpssRegTmp);
        VDP_DRV_CheckHpzme(pstVdpVpssRegTmp);
        VPD_DRV_CheckZmeCfg(pstVdpVpssRegTmp);
    }

    return;
}

HI_VOID VDP_OFFLINE_DFX(S_VDP_REGS_TYPE *pstLogicRegs)
{
    HI_U32 u32OfflineFsmState=0;
    HI_U32 u32StartMode=0;
    HI_U32 u32OffLId=0;
    HI_U32 u32OnLId=0;
    U_OFFLINE_DEBUG0 OFFLINE_DEBUG0;
    HI_U32 u32V0En=0;

    u32OfflineFsmState      = (pstLogicRegs->OFFLINE_STATE0.u32)&0xf;
    u32StartMode            = (pstLogicRegs->OFFLINE_FPGADBG.u32)&0x1;
    OFFLINE_DEBUG0.u32      = (pstLogicRegs->OFFLINE_DEBUG0.u32);
    u32OffLId               = OFFLINE_DEBUG0.bits.offline_id;
    u32OnLId                = OFFLINE_DEBUG0.bits.online_id;
    u32V0En                 = ((pstLogicRegs->V0_CTRL.u32)&0x80000000)>>31;

    if((0==u32OfflineFsmState) && (1==u32StartMode)) //idle
    {
        DISP_ERROR("Fsm:idle, start mode, but software don't give 'start'\n");
    }
    else if(1==u32OfflineFsmState)//wait Q frm
    {
        DISP_ERROR("Fsm:wait Q frm, no Q frm Buf, need Q frm\n");
    }
    else if((7==u32OfflineFsmState)&&(u32OffLId>u32OnLId)&&(u32V0En==0))
    {
        DISP_ERROR("Fsm:wbc no valid, need open v0 surface en\n");
    }
    else if(5==u32OfflineFsmState)//wait sync start
    {
        DISP_ERROR("Fsm: wait sync start, need sync start\n");
    }
    else if(8==u32OfflineFsmState)//hold
    {
        DISP_ERROR("Fsm: hold state, need hold disable\n");
    }

    if(((pstLogicRegs->CUR_LINE_MODE_STA.u32)&0x1) != (((pstLogicRegs->VID_DTV_DEBUG7.u32)&0x400000)>>22))
    {
        DISP_ERROR("Logic Work Online and Offline State Error \n");
    }
}

HI_U32 g_index = 0;
/*Get buffer's status.*/
HI_VOID VDP_QBUFSTATUS_DFX(S_VDP_REGS_TYPE *pstLogicRegs)
{
    U_VID_DTV_MODE_IMG VID_DTV_MODE_IMG;
    U_VID_DTV_CFG_READY VID_DTV_CFG_READY;
    U_VID_DTV_ERR_STA VID_DTV_ERR_STA;
    U_VID_DTV_DEBUG2 VID_DTV_DEBUG2;
    U_VID_DTV_DEBUG7 VID_DTV_DEBUG7;
    U_V0_VPSS_CTRL                  V0_VPSS_CTRL;
    U_OFFLINE_MAC_STATE             OFFLINE_MAC_STATE;
    U_VID_DTV_CHANGE_INFO           VID_DTV_CHANGE_INFO;
    U_VID_DTV_LOC_FRM_INFO          VID_DTV_LOC_FRM_INFO;
    U_VID_WORK_FINFO                VID_WORK_FINFO;

    VID_DTV_MODE_IMG.u32 = pstLogicRegs->VID_DTV_MODE_IMG.u32;
    VID_DTV_CFG_READY.u32= pstLogicRegs->VID_DTV_CFG_READY.u32;
    VID_DTV_ERR_STA.u32 = pstLogicRegs->VID_DTV_ERR_STA.u32;
    VID_DTV_DEBUG2.u32 = pstLogicRegs->VID_DTV_DEBUG2.u32;
    VID_DTV_DEBUG7.u32 = pstLogicRegs->VID_DTV_DEBUG7.u32;
    V0_VPSS_CTRL.u32  =pstLogicRegs->V0_VPSS_CTRL.u32;
    OFFLINE_MAC_STATE.u32  =pstLogicRegs->OFFLINE_MAC_STATE.u32;
    VID_DTV_CHANGE_INFO.u32  =pstLogicRegs->VID_DTV_CHANGE_INFO.u32;
    VID_DTV_LOC_FRM_INFO.u32  =pstLogicRegs->VID_DTV_LOC_FRM_INFO.u32;
    VID_WORK_FINFO.u32  = pstLogicRegs->VID_WORK_FINFO.u32;

    if(VID_DTV_MODE_IMG.bits.reset_en)
    {
        DISP_ERROR("Logic in Q frm reset status\n");
    }

    if(VID_DTV_CFG_READY.bits.mute_clr)
    {
        DISP_ERROR("Logic in black frm reset status, you need to clr mute\n");
    }

    if(VID_DTV_ERR_STA.bits.send_err)
    {
        DISP_ERROR("Send buf is overflow\n");

    }

    if(VID_DTV_ERR_STA.bits.back_err)
    {
        DISP_ERROR("back buf is overflow\n");
    }

    if (g_index != VID_DTV_DEBUG7.bits.cur_index)
    {
        DISP_ERROR("send buf num is:%d\n",(VID_DTV_DEBUG2.bits.disp_fifo_sta&0xf0)>>4);
        DISP_ERROR("back buf num is:%d\n",(VID_DTV_DEBUG2.bits.back_fifo_sta&0xf0)>>4);

        DISP_ERROR("cur_index :%d\n",           VID_DTV_DEBUG7.bits.cur_index);
        DISP_ERROR("cur_on_off_mode :%d\n",     VID_DTV_DEBUG7.bits.cur_on_off_mode);
        DISP_ERROR("cur_addr_mode :%d\n",       VID_DTV_DEBUG7.bits.cur_addr_mode);
        DISP_ERROR("cur_btm_task_typ :%d\n",    VID_DTV_DEBUG7.bits.cur_btm_task_typ);
        DISP_ERROR("cur_top_task_typ :%d\n",    VID_DTV_DEBUG7.bits.cur_top_task_typ);
        DISP_ERROR("cur_first_field_sel :%d\n", VID_DTV_DEBUG7.bits.cur_first_field_sel);
        DISP_ERROR("cur_btm_disp_num :%d\n",    VID_DTV_DEBUG7.bits.cur_btm_disp_num);
        DISP_ERROR("cur_top_disp_num :%d\n\n\n",VID_DTV_DEBUG7.bits.cur_top_disp_num);
    }

    VDP_PRINT("--index cur:%d, nex:%d,queue:%d!\n",  VID_DTV_DEBUG7.bits.cur_index,
                                                     VID_DTV_CHANGE_INFO.bits.nxt_index,
                                                     VID_DTV_LOC_FRM_INFO.bits.index);

    VDP_PRINT("--frm_init:%d \n mac_mad_en:%d,\n igbm_en:%d,\nifmd_en:%d,\ntnr_en:%d,\n"
              "snr_en:%d,\n dei_fld_mode:%d,\n blk_det_en:%d, \n rgme_en:%d, \n"
              "vc1_en:%d, \n dei_en:%d, \n mcnr_en:%d,\n tnr_mad_mode:%d !\n",  V0_VPSS_CTRL.bits.frm_init,
                                                     V0_VPSS_CTRL.bits.mac_mad_en,
                                                     V0_VPSS_CTRL.bits.igbm_en,
                                                     V0_VPSS_CTRL.bits.ifmd_en,
                                                     V0_VPSS_CTRL.bits.tnr_en,
                                                     V0_VPSS_CTRL.bits.snr_en,
                                                     V0_VPSS_CTRL.bits.dei_fld_mode,
                                                     V0_VPSS_CTRL.bits.blk_det_en,
                                                     V0_VPSS_CTRL.bits.rgme_en,
                                                     V0_VPSS_CTRL.bits.vc1_en,
                                                     V0_VPSS_CTRL.bits.dei_en,
                                                     V0_VPSS_CTRL.bits.mcnr_en,
                                                     V0_VPSS_CTRL.bits.tnr_mad_mode);

    VDP_PRINT("--current field:%d \n", VID_WORK_FINFO.bits.out_bfiled);
    VDP_PRINT("--current node addr:%x \n", pstLogicRegs->VID_DTV_DISP_ADDR.u32);

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p1y_done)
      {
        VDP_PRINT("-- p1y_done not finish\n");
      }


      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p1c_done)
      {
        VDP_PRINT("-- p1c_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p2y_done)
      {
        VDP_PRINT("-- p2y_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p2c_done)
      {
        VDP_PRINT("-- p2c_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p3y_done)
      {
        VDP_PRINT("-- p3y_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p3c_done)
      {
        VDP_PRINT("-- p3c_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.rhism_done)
      {
        VDP_PRINT("-- rhism_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.rdmcnt_done)
      {
        VDP_PRINT("-- rdmcnt_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.nr_rmad_done)
      {
        VDP_PRINT("-- nr_rmad_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.snr_rmad_done)
      {
        VDP_PRINT("-- snr_rmad_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p2stath_done)
      {
        VDP_PRINT("-- p2stath_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p2statv_done)
      {
        VDP_PRINT("-- p2statv_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p2rgmv_done)
      {
        VDP_PRINT("-- p2rgmv_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.p1rgmv_done)
      {
        VDP_PRINT("-- p1rgmv_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.rfry_done)
      {
        VDP_PRINT("-- rfry_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.rfrc_done)
      {
        VDP_PRINT("-- rfrc_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.whism_done)
      {
        VDP_PRINT("-- whism_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.wdmcnt_done)
      {
        VDP_PRINT("-- wdmcnt_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.nr_wmad_done)
      {
        VDP_PRINT("-- nr_wmad_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.cfstath_done)
      {
        VDP_PRINT("-- cfstath_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.cfstatv_done)
      {
        VDP_PRINT("-- cfstatv_done not finish\n");
      }

       if (HI_TRUE != OFFLINE_MAC_STATE.bits.cfrgmv_done)
      {
        VDP_PRINT("-- cfrgmv_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.outy_done)
      {
        VDP_PRINT("-- outy_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.outc_done)
      {
        VDP_PRINT("-- outc_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.stt_done)
      {
        VDP_PRINT("-- stt_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.v0_wtunl_done)
      {
        VDP_PRINT("-- v0_wtunl_done not finish\n");
      }

      if (HI_TRUE != OFFLINE_MAC_STATE.bits.V0_done)
      {
        VDP_PRINT("-- V0_done not finish\n");
      }

      g_index = VID_DTV_DEBUG7.bits.cur_index;
}

extern HI_U32 VDP_DISP_GetIntSta(HI_U32 u32intmask);
HI_S32 VDP_EchoAbNormalStatus(HI_VOID)
{
    HI_S32 s32Ret=HI_SUCCESS;
    HI_U32 u32OffRdErr=0;
    U_OFFLINE_STATE0 OFFLINE_STATE0;
    U_VID_DTV_ERR_STA VID_DTV_ERR_STA;
    U_VID_DTV_DEBUG3 VID_DTV_DEBUG3;
    U_VID_DTV_DEBUG4 VID_DTV_DEBUG4;

    OFFLINE_STATE0.u32=pVdpReg->OFFLINE_STATE0.u32;
    u32OffRdErr=(OFFLINE_STATE0.bits.offline_err_state)&0x1;
    if(1==u32OffRdErr)
    {
        DISP_ERROR("VF RdErr\n");
        DISP_ERROR("err addr:0x%x\n",pVdpReg->OFFLINE_STATE3.bits.offline_err_addr);
        s32Ret=HI_FAILURE;
        pVdpReg->ON_OFFLINE_BUF_RESET.u32 = 0x00000008;
    }

    VID_DTV_ERR_STA.u32=pVdpReg->VID_DTV_ERR_STA.u32;
    if(VID_DTV_ERR_STA.bits.send_err==1)
    {
        DISP_ERROR("send err\n");
        s32Ret=HI_FAILURE;
    }
    if(VID_DTV_ERR_STA.bits.back_err==1)
    {
        DISP_ERROR("back err\n");
        s32Ret=HI_FAILURE;
    }

    if (VDP_DISP_GetIntSta(VDP_INTMSK_DHD0_UFINT) == (HI_U32) VDP_INTMSK_DHD0_UFINT)
    {
        DISP_ERROR(" underflow !!!\n");
        s32Ret = HI_FAILURE;
    }

    VID_DTV_DEBUG3.u32 = pVdpReg->VID_DTV_DEBUG3.u32;
    VID_DTV_DEBUG4.u32 = pVdpReg->VID_DTV_DEBUG4.u32;
    if ((VID_DTV_DEBUG3.u32&0x1) == 1)
    {
        DISP_ERROR("unload cnt = %d\n", VID_DTV_DEBUG4.u32);
        s32Ret=HI_FAILURE;
    }

    return s32Ret;
}

extern HI_U32 VDP_OFF_GetOfflineId(S_VDP_REGS_TYPE * pstReg);
extern HI_U32 VDP_FDR_VID_GetVhdaddrL(HI_U32 offset);
extern HI_U32 VDP_FDR_VID_GetCurVhdaddrL(HI_U32 offset);
extern HI_U32 VDP_FDR_VID_GetTunlAddr(HI_U32 offset);
extern HI_U32 VDP_CYCBUF_GetDtvDispAddr(HI_U32 offset);

HI_VOID VDP_WTUNL_DFX(S_VDP_REGS_TYPE *pstLogicRegs)
{
    HI_U32 u32DtvDispAddr;
    HI_U32 u32CurFdrLumAddr;
    HI_U32 u32LastFdrLumAddr;
    HI_U32 u32WtunlAddr;
    HI_U32 u32OfflineId;

    u32DtvDispAddr    = VDP_CYCBUF_GetDtvDispAddr(0);
    u32CurFdrLumAddr  = VDP_FDR_VID_GetCurVhdaddrL(0);
    u32LastFdrLumAddr = VDP_FDR_VID_GetVhdaddrL(0);
    u32OfflineId      = VDP_OFF_GetOfflineId((S_VDP_REGS_TYPE *) pVdpReg);
    u32WtunlAddr      = VDP_FDR_VID_GetTunlAddr(0);

    //printk("2222222 ISR_CallbackForStartLogic: dtv_disp_addr = %x , offline_id = %d \n", u32DtvDispAddr,u32OfflineId);
    //printk("2222222 ISR_CallbackForStartLogic: cur lum addr  = %x , offline_id = %d \n", u32CurFdrLumAddr,u32OfflineId);
    //printk("2222222 ISR_CallbackForStartLogic: last lum addr = %x , offline_id = %d \n", u32LastFdrLumAddr,u32OfflineId);
    //printk("2222222 ISR_CallbackForStartLogic: u32TunlAddr   = %x , offline_id = %d \n", u32WtunlAddr,u32OfflineId);

    return;
}
#endif

