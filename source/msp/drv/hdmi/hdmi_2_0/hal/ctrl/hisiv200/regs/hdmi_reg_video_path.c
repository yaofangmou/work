// ******************************************************************************
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co. Ltd.
// File name     :  video_path_reg_c_union_define.c
// Project line  :  Platform And Key Technologies Development
// Department    :  CAD Development Department
// Author        :  sdk
// Version       :  1.0
// Date          :  Tester
// Description   :  The description of xxx project
// Others        :  Generated automatically by nManager V4.0.2.5
// History       :  sdk 2015/06/15 16:25:01 Create file
// ******************************************************************************
#include "hi_type.h"
#include "hdmi_reg_video_path.h"
#include "hdmi_product_define.h"
#include "hdmi_platform.h"
#ifndef HDMI_BUILD_IN_BOOT
#include "drv_hdmi_platform.h"
#endif

#define CTRL_BLACK_DATA_YUV_CR      (0x80<<2)
#define CTRL_BLACK_DATA_YUV_Y       (0x10<<2)
#define CTRL_BLACK_DATA_YUV_CB      (0x80<<2)

#define CTRL_BLACK_DATA_RGB_R       (0x10<<2)
#define CTRL_BLACK_DATA_RGB_G       (0x10<<2)
#define CTRL_BLACK_DATA_RGB_B       (0x10<<2)

/* Define the struct pointor of the module video_path_reg */
volatile S_video_path_reg_REGS_TYPE *gopvideo_path_regAllReg = NULL;


int HDMI_TX_S_video_path_reg_REGS_TYPE_Init(void)
{
    if (gopvideo_path_regAllReg)
    {
        return HI_SUCCESS;
    }

    gopvideo_path_regAllReg = (volatile S_video_path_reg_REGS_TYPE*)HDMI_IO_MAP(BASE_ADDR_video_path_reg,4);

    if (!gopvideo_path_regAllReg)
    {
        HDMI_ERR("gopvideo_path_regAllReg = null,fail!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

int HDMI_TX_S_video_path_reg_REGS_TYPE_DeInit(void)
{
    if (gopvideo_path_regAllReg)
    {
        HDMI_IO_UNMAP(gopvideo_path_regAllReg);
        gopvideo_path_regAllReg = HI_NULL;
    }

    return HI_SUCCESS;
}

#ifndef HDMI_BUILD_IN_BOOT

HI_VOID HDMI_REG_VIDEO_TimmingGet(CTRL_TIMMING_DETECT_S *pstTimming)
{
    U_FDET_STATUS o_fdet_status;
    U_FDET_VERT_RES o_fdet_vert_res;
    U_FDET_HORI_RES o_fdet_hori_res;

    if(!pstTimming)
    {
        return ;
    }

    o_fdet_status.u32 = HDMI_RegRead((HI_U32*)&(gopvideo_path_regAllReg->FDET_STATUS.u32));
    pstTimming->bHsyncPolarity = o_fdet_status.bits.hsync_polarity ? HI_TRUE : HI_FALSE;
    pstTimming->bVsyncPolarity = o_fdet_status.bits.vsync_polarity ? HI_TRUE : HI_FALSE;
    pstTimming->bProgressive   = o_fdet_status.bits.interlaced ? HI_TRUE : HI_FALSE;

    o_fdet_vert_res.u32 = HDMI_RegRead((HI_U32*)&(gopvideo_path_regAllReg->FDET_VERT_RES.u32));
    pstTimming->u32VactiveCnt = o_fdet_vert_res.bits.vsync_active_cnt;
    pstTimming->u32VsyncTotal = o_fdet_vert_res.bits.vsync_total_cnt;

    o_fdet_hori_res.u32 = HDMI_RegRead((HI_U32*)&(gopvideo_path_regAllReg->FDET_HORI_RES.u32));
    pstTimming->u32HactiveCnt = o_fdet_hori_res.bits.hsync_active_cnt;
    pstTimming->u32HsyncTotal = o_fdet_hori_res.bits.hsync_total_cnt;

    return ;
}

//******************************************************************************
//  Function    : HDMI_VIDEO_DMUX_CTRL_reg_inver_syncGet
//  Description : Set the value of the member VIDEO_DMUX_CTRL.reg_inver_sync
//  Input       : unsigned int ureg_inver_sync: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_VIDEO_DMUX_CTRL_reg_inver_syncGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_VIDEO_DMUX_CTRL o_video_dmux_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_DMUX_CTRL.u32);
    o_video_dmux_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_video_dmux_ctrl.bits.reg_inver_sync;
}

//******************************************************************************
//  Function    : HDMI_DITHER_CONFIG_dither_modeGet
//  Description : Set the value of the member DITHER_CONFIG.dither_mode
//  Input       : unsigned int udither_mode: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_DITHER_CONFIG_dither_modeGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_DITHER_CONFIG o_dither_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->DITHER_CONFIG.u32);
    o_dither_config.u32 = HDMI_RegRead(pu32RegAddr);
    return o_dither_config.bits.dither_mode;
}

//******************************************************************************
//  Function    : HDMI_DITHER_CONFIG_dither_rnd_bypGet
//  Description : Set the value of the member DITHER_CONFIG.dither_rnd_byp
//  Input       : unsigned int udither_rnd_byp: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_DITHER_CONFIG_dither_rnd_bypGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_DITHER_CONFIG o_dither_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->DITHER_CONFIG.u32);
    o_dither_config.u32 = HDMI_RegRead(pu32RegAddr);
    return o_dither_config.bits.dither_rnd_byp;
}

//******************************************************************************
//  Function    : HDMI_MULTI_CSC_CTRL_reg_csc_enGet
//  Description : Set the value of the member MULTI_CSC_CTRL.reg_csc_en
//  Input       : unsigned int ureg_csc_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_MULTI_CSC_CTRL_reg_csc_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_multi_csc_ctrl.bits.reg_csc_en;
}

int HDMI_REG_VIDEO_MuteSet(HI_BOOL bEnable, HI_U32 u32InColorSpace, HI_U32 u32OutColorSpace)
{
    HI_U32 u32DataValue = 0;
    HI_U32 *pu32RegAddr = NULL;
    U_SOLID_PATTERN_CONFIG o_solid_pattern_config;
    U_VIDEO_PATH_CTRL o_video_path_ctrl;
    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;

    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->SOLID_PATTERN_CONFIG.u32);
    o_solid_pattern_config.u32 = HDMI_RegRead(pu32RegAddr);

    u32DataValue = (0 == u32InColorSpace) ? CTRL_BLACK_DATA_RGB_R : CTRL_BLACK_DATA_YUV_CR;
    o_solid_pattern_config.bits.solid_pattern_cr = u32DataValue;
    u32DataValue = (0 == u32InColorSpace) ? CTRL_BLACK_DATA_RGB_G : CTRL_BLACK_DATA_YUV_Y;
    o_solid_pattern_config.bits.solid_pattern_y = u32DataValue;
    u32DataValue = (0 == u32InColorSpace) ? CTRL_BLACK_DATA_RGB_B : CTRL_BLACK_DATA_YUV_CB;
    o_solid_pattern_config.bits.solid_pattern_cb = u32DataValue;
    HDMI_RegWrite(pu32RegAddr, o_solid_pattern_config.u32);

    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_PATH_CTRL.u32);
    o_video_path_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_video_path_ctrl.bits.reg_video_blank_en = bEnable;
    HDMI_RegWrite(pu32RegAddr, o_video_path_ctrl.u32);

    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.solid_pattern_en = bEnable;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);

    return HI_SUCCESS;
}

HI_BOOL HDMI_REG_VIDEO_MuteGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;
    U_VIDEO_PATH_CTRL o_video_path_ctrl;
    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;

    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_PATH_CTRL.u32);
    o_video_path_ctrl.u32 = HDMI_RegRead(pu32RegAddr);

    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);

    if (   0 != o_video_path_ctrl.bits.reg_video_blank_en
        && 0 != o_pattern_gen_ctrl.bits.solid_pattern_en)
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}

#endif

//******************************************************************************
//  Function    : HDMI_MULTI_CSC_CTRL_reg_csc_modeGet
//  Description : Set the value of the member MULTI_CSC_CTRL.reg_csc_mode
//  Input       : unsigned int ureg_csc_mode: 8 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_MULTI_CSC_CTRL_reg_csc_modeGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_multi_csc_ctrl.bits.reg_csc_mode;
}

//******************************************************************************
//  Function    : HDMI_DITHER_CONFIG_dither_modeSet
//  Description : Set the value of the member DITHER_CONFIG.dither_mode
//  Input       : unsigned int udither_mode: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_DITHER_CONFIG_dither_modeSet(unsigned int udither_mode)
{
    HI_U32 *pu32RegAddr = NULL;

    U_DITHER_CONFIG o_dither_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->DITHER_CONFIG.u32);
    o_dither_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_dither_config.bits.dither_mode = udither_mode;
    HDMI_RegWrite(pu32RegAddr, o_dither_config.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_DITHER_CONFIG_dither_rnd_bypSet
//  Description : Set the value of the member DITHER_CONFIG.dither_rnd_byp
//  Input       : unsigned int udither_rnd_byp: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_DITHER_CONFIG_dither_rnd_bypSet(unsigned int udither_rnd_byp)
{
    HI_U32 *pu32RegAddr = NULL;

    U_DITHER_CONFIG o_dither_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->DITHER_CONFIG.u32);
    o_dither_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_dither_config.bits.dither_rnd_byp = udither_rnd_byp;
    HDMI_RegWrite(pu32RegAddr, o_dither_config.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enSet
//  Description : Set the value of the member MULTI_CSC_CTRL.reg_csc_saturate_en
//  Input       : unsigned int ureg_csc_saturate_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enSet(unsigned int ureg_csc_saturate_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_multi_csc_ctrl.bits.reg_csc_saturate_en = ureg_csc_saturate_en;
    HDMI_RegWrite(pu32RegAddr, o_multi_csc_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_MULTI_CSC_CTRL_reg_csc_enSet
//  Description : Set the value of the member MULTI_CSC_CTRL.reg_csc_en
//  Input       : unsigned int ureg_csc_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_MULTI_CSC_CTRL_reg_csc_enSet(unsigned int ureg_csc_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_multi_csc_ctrl.bits.reg_csc_en = ureg_csc_en;
    HDMI_RegWrite(pu32RegAddr, o_multi_csc_ctrl.u32);

    return HI_SUCCESS;
}

int HDMI_MULTI_CSC_CTRL_reg_csc_modeSet(unsigned int ureg_csc_mode)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_multi_csc_ctrl.bits.reg_csc_mode = ureg_csc_mode;
    HDMI_RegWrite(pu32RegAddr, o_multi_csc_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_VIDEO_DMUX_CTRL_reg_inver_syncSet
//  Description : Set the value of the member VIDEO_DMUX_CTRL.reg_inver_sync
//  Input       : unsigned int ureg_inver_sync: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_VIDEO_DMUX_CTRL_reg_inver_syncSet(unsigned int ureg_inver_sync)
{
    HI_U32 *pu32RegAddr = NULL;

    U_VIDEO_DMUX_CTRL o_video_dmux_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_DMUX_CTRL.u32);
    o_video_dmux_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_video_dmux_ctrl.bits.reg_inver_sync = ureg_inver_sync;
    HDMI_RegWrite(pu32RegAddr, o_video_dmux_ctrl.u32);

    return HI_SUCCESS;
}


//******************************************************************************
//  Function    : HDMI_VIDEO_DMUX_CTRL_reg_syncmask_enSet
//  Description : Set the value of the member VIDEO_DMUX_CTRL.reg_syncmask_en
//  Input       : unsigned int ureg_syncmask_en: 4 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_VIDEO_DMUX_CTRL_reg_syncmask_enSet(unsigned int ureg_syncmask_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_VIDEO_DMUX_CTRL o_video_dmux_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_DMUX_CTRL.u32);
    o_video_dmux_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_video_dmux_ctrl.bits.reg_syncmask_en = ureg_syncmask_en;
    HDMI_RegWrite(pu32RegAddr, o_video_dmux_ctrl.u32);

    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enGet
//  Description : Set the value of the member MULTI_CSC_CTRL.reg_csc_saturate_en
//  Input       : unsigned int ureg_csc_saturate_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_MULTI_CSC_CTRL o_multi_csc_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->MULTI_CSC_CTRL.u32);
    o_multi_csc_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_multi_csc_ctrl.bits.reg_csc_saturate_en;
}

#ifdef DBG_CMD
//#if 0
//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_sync_polaritySet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_sync_polarity
//  Input       : unsigned int ureg_sync_polarity: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_sync_polaritySet(unsigned int ureg_sync_polarity)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_timing_gen_ctrl.bits.reg_sync_polarity = ureg_sync_polarity;
    HDMI_RegWrite(pu32RegAddr, o_timing_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_sync_polarityGet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_sync_polarity
//  Input       : unsigned int ureg_sync_polarity: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_sync_polarityGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_timing_gen_ctrl.bits.reg_sync_polarity;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_timing_selSet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_timing_sel
//  Input       : unsigned int ureg_timing_sel: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_timing_selSet(unsigned int ureg_timing_sel)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_timing_gen_ctrl.bits.reg_timing_sel = ureg_timing_sel;
    HDMI_RegWrite(pu32RegAddr, o_timing_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_timing_selGet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_timing_sel
//  Input       : unsigned int ureg_timing_sel: 6 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_timing_selGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_timing_gen_ctrl.bits.reg_timing_sel;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_extmodeSet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_extmode
//  Input       : unsigned int ureg_extmode: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_extmodeSet(unsigned int ureg_extmode)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_timing_gen_ctrl.bits.reg_extmode = ureg_extmode;
    HDMI_RegWrite(pu32RegAddr, o_timing_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_extmodeGet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_extmode
//  Input       : unsigned int ureg_extmode: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_extmodeGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_timing_gen_ctrl.bits.reg_extmode;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_timing_gen_enSet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_timing_gen_en
//  Input       : unsigned int ureg_timing_gen_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_timing_gen_enSet(unsigned int ureg_timing_gen_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_timing_gen_ctrl.bits.reg_timing_gen_en = ureg_timing_gen_en;
    HDMI_RegWrite(pu32RegAddr, o_timing_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_TIMING_GEN_CTRL_reg_timing_gen_enGet
//  Description : Set the value of the member TIMING_GEN_CTRL.reg_timing_gen_en
//  Input       : unsigned int ureg_timing_gen_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_TIMING_GEN_CTRL_reg_timing_gen_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_TIMING_GEN_CTRL o_timing_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->TIMING_GEN_CTRL.u32);
    o_timing_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_timing_gen_ctrl.bits.reg_timing_gen_en;
}


//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_cbar_pattern_selSet
//  Description : Set the value of the member PATTERN_GEN_CTRL.cbar_pattern_sel
//  Input       : unsigned int ucbar_pattern_sel: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_cbar_pattern_selSet(unsigned int ucbar_pattern_sel)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.cbar_pattern_sel = ucbar_pattern_sel;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);


    return HI_SUCCESS;
}


//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_mask_pattern_enSet
//  Description : Set the value of the member PATTERN_GEN_CTRL.mask_pattern_en
//  Input       : unsigned int umask_pattern_en: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_mask_pattern_enSet(unsigned int umask_pattern_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.mask_pattern_en = umask_pattern_en;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_square_pattern_enSet
//  Description : Set the value of the member PATTERN_GEN_CTRL.square_pattern_en
//  Input       : unsigned int usquare_pattern_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_square_pattern_enSet(unsigned int usquare_pattern_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.square_pattern_en = usquare_pattern_en;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);


    return HI_SUCCESS;
}


//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_colorbar_enSet
//  Description : Set the value of the member PATTERN_GEN_CTRL.colorbar_en
//  Input       : unsigned int ucolorbar_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_colorbar_enSet(unsigned int ucolorbar_en)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.colorbar_en = ucolorbar_en;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);


    return HI_SUCCESS;
}




//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_video_formatSet
//  Description : Set the value of the member PATTERN_GEN_CTRL.video_format
//  Input       : unsigned int uvideo_format: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_video_formatSet(unsigned int uvideo_format)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    o_pattern_gen_ctrl.bits.video_format = uvideo_format;
    HDMI_RegWrite(pu32RegAddr, o_pattern_gen_ctrl.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_SOLID_PATTERN_CONFIG_solid_pattern_crSet
//  Description : Set the value of the member SOLID_PATTERN_CONFIG.solid_pattern_cr
//  Input       : unsigned int usolid_pattern_cr: 10 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_SOLID_PATTERN_CONFIG_solid_pattern_crSet(unsigned int usolid_pattern_cr)
{
    HI_U32 *pu32RegAddr = NULL;

    U_SOLID_PATTERN_CONFIG o_solid_pattern_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->SOLID_PATTERN_CONFIG.u32);
    o_solid_pattern_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_solid_pattern_config.bits.solid_pattern_cr = usolid_pattern_cr;
    HDMI_RegWrite(pu32RegAddr, o_solid_pattern_config.u32);


    return HI_SUCCESS;
}

//******************************************************************************
//  Function    : HDMI_SOLID_PATTERN_CONFIG_solid_pattern_cbSet
//  Description : Set the value of the member SOLID_PATTERN_CONFIG.solid_pattern_cb
//  Input       : unsigned int usolid_pattern_cb: 10 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_SOLID_PATTERN_CONFIG_solid_pattern_cbSet(unsigned int usolid_pattern_cb)
{
    HI_U32 *pu32RegAddr = NULL;

    U_SOLID_PATTERN_CONFIG o_solid_pattern_config;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->SOLID_PATTERN_CONFIG.u32);
    o_solid_pattern_config.u32 = HDMI_RegRead(pu32RegAddr);
    o_solid_pattern_config.bits.solid_pattern_cb = usolid_pattern_cb;
    HDMI_RegWrite(pu32RegAddr, o_solid_pattern_config.u32);


    return HI_SUCCESS;
}





//******************************************************************************
//  Function    : HDMI_VIDEO_PATH_CTRL_reg_video_blank_enGet
//  Description : Get the value of the member VIDEO_PATH_CTRL.reg_video_blank_en
//  Input       : unsigned int reg_video_blank_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_VIDEO_PATH_CTRL_reg_video_blank_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_VIDEO_PATH_CTRL o_video_path_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->VIDEO_PATH_CTRL.u32);
    o_video_path_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_video_path_ctrl.bits.reg_video_blank_en;
}


//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_colorbar_enGet
//  Description : Set the value of the member PATTERN_GEN_CTRL.colorbar_en
//  Input       : unsigned int ucolorbar_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_colorbar_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_pattern_gen_ctrl.bits.colorbar_en;
}





//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_video_formatGet
//  Description : Set the value of the member PATTERN_GEN_CTRL.video_format
//  Input       : unsigned int uvideo_format: 2 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_video_formatGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_pattern_gen_ctrl.bits.video_format;
}

//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_mask_pattern_enGet
//  Description : Set the value of the member PATTERN_GEN_CTRL.mask_pattern_en
//  Input       : unsigned int umask_pattern_en: 3 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_mask_pattern_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_pattern_gen_ctrl.bits.mask_pattern_en;
}



//******************************************************************************
//  Function    : HDMI_PATTERN_GEN_CTRL_square_pattern_enGet
//  Description : Set the value of the member PATTERN_GEN_CTRL.square_pattern_en
//  Input       : unsigned int usquare_pattern_en: 1 bits
//  Return      : int: 0-Error, 1-Success
//******************************************************************************
int HDMI_PATTERN_GEN_CTRL_square_pattern_enGet(HI_VOID)
{
    HI_U32 *pu32RegAddr = NULL;

    U_PATTERN_GEN_CTRL o_pattern_gen_ctrl;
    pu32RegAddr = (HI_U32*)&(gopvideo_path_regAllReg->PATTERN_GEN_CTRL.u32);
    o_pattern_gen_ctrl.u32 = HDMI_RegRead(pu32RegAddr);
    return o_pattern_gen_ctrl.bits.square_pattern_en;
}
#endif



