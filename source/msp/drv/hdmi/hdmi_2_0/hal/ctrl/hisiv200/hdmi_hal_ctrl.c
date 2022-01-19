/******************************************************************************

  Copyright (C), 2016-2016, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hdmi_hal_ctrl.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2015/08/13
  Description   :
  History       :
  Date          : 2015/08/13
  Author        : sdk
  Modification  :
*******************************************************************************/

#include "hdmi_reg_tx.h"
#include "hdmi_reg_audio_path.h"
#include "hdmi_reg_video_path.h"
#include "hdmi_reg_hdcp.h"
#include "hdmi_reg_crg.h"
#include "hdmi_reg_aon.h"
#include "hdmi_reg_ctrl.h"

#include "hdmi_hal_ncts.h"
#include "hdmi_hal_ddc.h"
#include "hdmi_hal_ctrl.h"
#include "hdmi_hal_intf.h"

#include "hdmi_product_define.h"

#ifndef HDMI_BUILD_IN_BOOT
#include "hdmi_osal.h"
#include "hdmi_hal_machine.h"
#endif

#define CTRL_SET_BIT(var,bit)   do{var |= 1 << bit;}while(0)
#define CTRL_CLR_BIT(var,bit)   do{var &= ~(1 << bit);}while(0)
#define IS_BIT_SET(var,bit)     ({(var) & (0x1<<bit) ? HI_TRUE : HI_FALSE ;})

#define CTRL_NULL_CHK(p) do{\
    if(HI_NULL == p)\
    {HDMI_WARN("%s is null pointer!\n",#p);\
    return HI_FAILURE;}\
}while(0)

#define CTRL_INIT_CHK(pstCtrlInfo) do{\
    CTRL_NULL_CHK(pstCtrlInfo);\
    if(pstCtrlInfo->bInit != HI_TRUE)\
    {HDMI_WARN("hdmi ctrl module didn't init!\n");\
    return HI_FAILURE;}\
}while(0)

/********************** VIDEO DEFINE *********************************/

#define CTRL_CHANNEL0_Y                 0x0
#define CTRL_CHANNEL0_Y422              0x3
#define CTRL_CHANNEL1_Cb                0x1
#define CTRL_CHANNEL1_Y422              0x4
#define CTRL_CHANNEL2_Cr                0x2
#define CTRL_CHANNEL2_Y422              0x3

#define CTRL_COLORMETRY_OUT_MASK        0xfc
#define CTRL_COLORMETRY_OUT_BIT         (4-4)
#define CTRL_COLORMETRY_IN_MASK         0xcf
#define CTRL_COLORMETRY_IN_BIT          (8-4)
#define CTRL_COLORMETRY_MASK            0x3

#define CTRL_RGB_OUT_BIT                (7-4)
#define CTRL_RGB_IN_BIT                 (11-4)

#define CTRL_QUANTIZAION_OUT_BIT        (6-4)
#define CTRL_QUANTIZAION_IN_BIT         (10-4)

#define CTRL_SYCN_POL_V_BIT             (25-25)
#define CTRL_SYCN_POL_H_BIT             (26-25)
#define CTRL_SYCN_POL_DE_BIT            (28-25)

#define CTRL_BLACK_Y_Cb_Cr      0x000000

typedef struct
{
    HI_BOOL             bVerDownSampBypass;
    HI_BOOL             bVerDownSampEnable;
    HI_BOOL             bHorDownSampEnable;
    HI_BOOL             bDemuxY420Enalbe;
    HI_BOOL             bPxlDivEnable;
    HI_BOOL             bHorFilterEnable;
}HDMI_VIDOE_DOWNSAMP_S;


/********************** AUDIO DEFINE *********************************/

#define CTRL_AUDIO_INVALID_CFG          0xff
#define CTRL_AUDIO_INVALID_RATE         0xffffffff

typedef struct
{
    HI_U32      u32BitValue;
    HI_U32      u32BitReg;
}HDMI_AUDIO_SAMP_BIT_S;


typedef struct
{
    HI_U32      u32RateValue;
    HI_U32      u32RateReg;
    HI_U32      u32RateOrgReg;
}HDMI_I2S_SAMP_RATE_S;

typedef struct
{
    HI_U32      u32RateValue;
    HI_U32      u32RateReg;
}HDMI_SPDIF_SAMP_RATE_S;

#ifndef HDMI_BUILD_IN_BOOT

static HDMI_AUDIO_SAMP_BIT_S s_au32SampBit[] =
{
    /* bit,     reg    */
    { 16,   0x2 },
    { 17,   0xc },
    { 18,   0x4 },
    { 19,   0x8 },
    { 20,   0xa },
    { 21,   0xd },
    { 22,   0x5 },
    { 23,   0x9 },
    { 24,   0xb },
};

static  HDMI_I2S_SAMP_RATE_S s_astI2sSmapRate[] =
{
    /* sample rate value,    Reg      orgReg,  */
    {HDMI_SAMPLE_RATE_8K  ,  0x01,     0x6   },
    {HDMI_SAMPLE_RATE_11K ,  0x01,     0xa   },
    {HDMI_SAMPLE_RATE_12K ,  0x01,     0x2   },
    {HDMI_SAMPLE_RATE_16K ,  0x01,     0x8   },
    {HDMI_SAMPLE_RATE_22K ,  0x04,     0xb   },
    {HDMI_SAMPLE_RATE_24K ,  0x06,     0x9   },
    {HDMI_SAMPLE_RATE_32K ,  0x03,     0xc   },
    {HDMI_SAMPLE_RATE_44K ,  0x00,     0xf   },
    {HDMI_SAMPLE_RATE_48K ,  0x02,     0xd   },
    {HDMI_SAMPLE_RATE_88K ,  0x08,     0x7   },
    {HDMI_SAMPLE_RATE_96K ,  0x0a,     0x5   },
    {HDMI_SAMPLE_RATE_176K,  0x0c,     0x3   },
    {HDMI_SAMPLE_RATE_192K,  0x0e,     0x1   },
    {HDMI_SAMPLE_RATE_768K,  0x09,     0x1   },
};

static HDMI_SPDIF_SAMP_RATE_S s_astSpdifSmapRate[] = {
    /* rate value,  reg */
     {   22050,  0x04   },
     {   44100,  0x00   },
     {   88200,  0x08   },
     {  176400,  0x0c   },
     {  352800,  0x0d   },
     {  705600,  0x2d   },
     { 1411200,  0x1d   },
     {   24000,  0x06   },
     {   48000,  0x02   }, /* default */
     {   96000,  0x0a   },
     {  192000,  0x0e   },
     {  384000,  0x05   },
     {  768000,  0x09   },
     { 1536000,  0x15   },
     {   32000,  0x03   },
     {   64000,  0x0b   },
     {  128000,  0x2b   },
     {  256000,  0x1b   },
     {  512000,  0x3b   },
     { 1024000,  0x35   },
 };

#endif

static HDMI_CTRL_INFO_S    s_stCtrlInfo[HDMI_DEVICE_ID_BUTT];

static HDMI_CTRL_INFO_S *CtrlInfoPtrGet(HDMI_DEVICE_ID_E enHdmi)
{
    if (enHdmi < HDMI_DEVICE_ID_BUTT)
    {
        return &s_stCtrlInfo[enHdmi];
    }
    return HI_NULL;
}

#ifndef HDMI_BUILD_IN_BOOT

/*
 *   retval:  a valid reg cfg / CTRL_AUDIO_INVALID_CFG
*/
static HI_U32  CtrlI2SRateRegGet(HI_U32 u32RateValue)
{
    HI_U32                  i = 0;
    HDMI_I2S_SAMP_RATE_S    *pstI2sRate = HI_NULL;

    for (pstI2sRate = &s_astI2sSmapRate[0];
        pstI2sRate && (i < HDMI_ARRAY_SIZE(s_astI2sSmapRate));
        pstI2sRate++,i++)
    {
        if (pstI2sRate->u32RateValue == u32RateValue)
        {
            return  pstI2sRate->u32RateReg;
        }
    }

    HDMI_ERR("ctrl can't find aduio¡¡rate= %u,force 48k\n",u32RateValue);

    return 0x02; /*16bit*/
}

/*
 *   retval:  a valid reg cfg / CTRL_AUDIO_INVALID_CFG
*/
static HI_U32  CtrlI2SRateOrgRegGet(HI_U32 u32RateValue)
{
    HI_U32                  i = 0;
    HDMI_I2S_SAMP_RATE_S    *pstI2sRate = HI_NULL;

    for (pstI2sRate = &s_astI2sSmapRate[0];
        pstI2sRate && (i < HDMI_ARRAY_SIZE(s_astI2sSmapRate));
        pstI2sRate++,i++)
    {
        if (pstI2sRate->u32RateValue == u32RateValue)
        {
            return  pstI2sRate->u32RateOrgReg;
        }
    }

    HDMI_ERR("ctrl can't find audio rate= %u,force 48k\n",u32RateValue);

    return 0x0d;/*48k*/
}

/*
 *   retval:  a valid sample rate / CTRL_AUDIO_INVALID_RATE
*/
static HI_U32 CtrlI2SRateValueGet(HI_VOID)
{
    HI_U32                  i = 0;
    HI_U32                  u32RateReg = 0;
    HI_U32                  u32RateOrgReg = 0;
    HDMI_I2S_SAMP_RATE_S    *pstI2sRate = HI_NULL;

    u32RateReg = HDMI_AUD_CHST_CFG0_chst_byte3_fsGet();
    u32RateOrgReg = HDMI_AUD_CHST_CFG1_chst_byte4_org_fsGet();

    for (pstI2sRate = &s_astI2sSmapRate[0];
        pstI2sRate && (i < HDMI_ARRAY_SIZE(s_astI2sSmapRate));
        pstI2sRate++,i++)
    {
        if ((pstI2sRate->u32RateReg  == u32RateReg)
            && (pstI2sRate->u32RateOrgReg  == u32RateOrgReg))
        {
            return  pstI2sRate->u32RateValue;
        }
    }

    return CTRL_AUDIO_INVALID_RATE;
}


/*
 *   retval:  a valid reg cfg / CTRL_AUDIO_INVALID_CFG
*/
static HI_U32  CtrlAudioBitRegGet(HI_U32 u32BitValue)
{
    HI_U32                  i = 0;
    HDMI_AUDIO_SAMP_BIT_S   *pstAudioBit = HI_NULL;

    for (pstAudioBit = &s_au32SampBit[0];
        pstAudioBit && (i < HDMI_ARRAY_SIZE(s_au32SampBit));
        pstAudioBit++,i++)
    {
        if (pstAudioBit->u32BitValue == u32BitValue)
        {
            return  pstAudioBit->u32BitReg;
        }
    }

    HDMI_ERR("ctrl can't find audio bit= %u,force 16\n",u32BitValue);
    return 0x02;/*16bit*/
}

/*
 *   retval:  a valid sample rate / CTRL_AUDIO_INVALID_RATE
*/
static HI_U32 CtrlAudioBitValueGet(HI_BOOL bSpdif)
{
    HI_U32                  i = 0;
    HI_U32                  u32BitReg = 0;
    HDMI_AUDIO_SAMP_BIT_S   *pstAudioBit = HI_NULL;

    if (bSpdif)
    {
        u32BitReg = HDMI_TX_AUDIO_STATE_aud_lengthGet();
    }
    else
    {
        u32BitReg = HDMI_AUD_CHST_CFG1_chst_byte4_lengthGet();
    }

    for (pstAudioBit = &s_au32SampBit[0];
        pstAudioBit && (i < HDMI_ARRAY_SIZE(s_au32SampBit));
        pstAudioBit++,i++)
    {
        if (pstAudioBit->u32BitReg  == u32BitReg)
        {
            return  pstAudioBit->u32BitValue;
        }
    }

    return CTRL_AUDIO_INVALID_RATE;
}


/*
 *   retval:  a valid sample rate / CTRL_AUDIO_INVALID_RATE
*/
static HI_U32   CtrlSpdifRateValueGet(HI_VOID)
{
    HI_U32                  i = 0;
    HI_U32                  u32SpdifCfg = 0;
    HDMI_SPDIF_SAMP_RATE_S  *pstSpdif = HI_NULL;

    u32SpdifCfg = HDMI_TX_AUDIO_STATE_aud_spdif_fsGet();

    for (pstSpdif = &s_astSpdifSmapRate[0];
        pstSpdif && (i < HDMI_ARRAY_SIZE(s_astSpdifSmapRate));
        pstSpdif++,i++)
    {
        if (pstSpdif->u32RateReg  == u32SpdifCfg)
        {
            return  pstSpdif->u32RateValue;
        }
    }

    return CTRL_AUDIO_INVALID_RATE;
}

/******************************* private interface  ***********************************/

static HI_VOID CtrlAudioMuteSet(HI_BOOL bEnable)
{
    //HDMI_TX_AUDIO_CTRL_aud_mute_enSet(bEnable);
#ifdef HDMI_HDCP_SUPPORT
    HDMI_HDCP_MUTE_CTRL_hdcp1x_amute_ctrlSet(bEnable);
#endif

    return ;
}

static HI_BOOL CtrlAudioMuteGet(HI_VOID)
{
    if (HDMI_TX_AUDIO_CTRL_aud_mute_enGet())
    {
        return HI_TRUE;
    }

#ifdef HDMI_HDCP_SUPPORT
    if (HDMI_HDCP_MUTE_CTRL_hdcp1x_amute_ctrlGet())
    {
        return HI_TRUE;
    }
#endif

    return HI_FALSE;
}

static HI_BOOL CtrlAudioI2sEnalbeGet(HI_VOID)
{
    if (HDMI_TX_AUDIO_CTRL_aud_i2s_enGet())
    {
        return  HI_TRUE;
    }

    return  HI_FALSE;
}


static HI_BOOL CtrlAudioSpdifEnalbeGet(HI_VOID)
{
    if (HDMI_TX_AUDIO_CTRL_aud_spdif_enGet())
    {
        return  HI_TRUE;
    }

    return  HI_FALSE;
}

static HI_BOOL CtrlAudioPathEnableGet(HI_VOID)
{
    if (HDMI_TX_AUDIO_CTRL_aud_in_enGet())
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}


static HI_U32 CtrlAudioPathNvalueGet(HI_VOID)
{
    HI_U32 u32NValue = 0;

    u32NValue = HDMI_ACR_N_VAL_SW_acr_n_val_swGet();

    return u32NValue;
}



static HI_VOID CtrlAudioPathCtsValueGet(HI_U32 *pu32HwCts,HI_U32 *pu32SwCts,HI_BOOL *pbSw)
{
    if (   HI_NULL == pu32HwCts
        || HI_NULL == pu32SwCts
        || HI_NULL == pbSw)
    {
        HDMI_ERR("null pointer!\n");
        return;
    }

    msleep(1); //wait reg valid

    HDMI_AUD_CtsGet(pu32HwCts, pu32SwCts, pbSw);

    return ;
}

static HI_VOID CtrlAudioPathLayoutSet(HI_BOOL bMutiLayout)
{
    HDMI_TX_AUDIO_CTRL_aud_layoutSet(bMutiLayout);
    return ;
}

static HI_U32 CtrlAudioPathLayoutGet(HI_VOID)
{
    HI_U32 u32Layout = 0;

    u32Layout = HDMI_TX_AUDIO_CTRL_aud_layoutGet();

    return u32Layout;
}



static HI_BOOL CtrlAudioHbraEnableGet(HI_VOID)
{
    if(HDMI_AUD_I2S_CTRL_i2s_hbra_onGet())
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}

static HI_S32 CtrlAudioI2sCtrlSet(CTRL_I2S_CTRL_S *pstI2sCtrl)
{
    HDMI_AUD_I2S_CtrlSet(pstI2sCtrl);

    return HI_SUCCESS;
}

static HI_S32 CtrlAudioI2sStatusSet(CTRL_I2S_STATUS_S *pstI2sStatus)
{
    HDMI_AUD_CHST_StatusSet(pstI2sStatus);

    return HI_SUCCESS;
}

static HI_S32 CtrlAudioFifoCtrlSet(CTRL_FIFO_CTRL_S *pstFifoCtrl)
{
    HDMI_AUD_FIFO_CtrlSet(pstFifoCtrl);
    return HI_SUCCESS;
}

#endif

static HI_VOID CtrlVideoPathDeepClrSet(HI_BOOL bEnalbeGcp, HDMI_DEEP_COLOR_E enDeepColorBit)
{
    HDMI_REG_VIDEO_DeepColorSet(bEnalbeGcp, enDeepColorBit);

    return ;
}

static HI_S32 CtrlVideoPathPolaritySet(HDMI_SYNC_POL_S *pstOutSyncPol)
{
    HI_U32  u32SyncPolCfg = 0;

    CTRL_NULL_CHK(pstOutSyncPol);

    if (pstOutSyncPol->bHPolInver)
    {
        CTRL_SET_BIT(u32SyncPolCfg,CTRL_SYCN_POL_H_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32SyncPolCfg,CTRL_SYCN_POL_H_BIT);
    }

    if (pstOutSyncPol->bVPolInver)
    {
        CTRL_SET_BIT(u32SyncPolCfg,CTRL_SYCN_POL_V_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32SyncPolCfg,CTRL_SYCN_POL_V_BIT);
    }

    if (pstOutSyncPol->bDeInver)
    {
        CTRL_SET_BIT(u32SyncPolCfg,CTRL_SYCN_POL_DE_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32SyncPolCfg,CTRL_SYCN_POL_DE_BIT);
    }

    HDMI_VIDEO_DMUX_CTRL_reg_inver_syncSet(u32SyncPolCfg);
    HDMI_VIDEO_DMUX_CTRL_reg_syncmask_enSet(HI_FALSE);

    return HI_SUCCESS;

}

static HI_VOID CtrlVideoPathDitherSet(HI_BOOL bEnable,HDMI_VIDEO_DITHER_E enDitherMode)
{
    HDMI_DITHER_CONFIG_dither_rnd_bypSet((!bEnable));
    HDMI_DITHER_CONFIG_dither_modeSet(enDitherMode);
    return ;
}

static HI_VOID CtrlVideoColorRgbSet(HI_BOOL bRgbIn,HI_BOOL bRgbOut)
{
    HI_U32  u32RegValue  = 0;

    u32RegValue = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    if (bRgbIn)
    {
        CTRL_SET_BIT(u32RegValue,CTRL_RGB_IN_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32RegValue,CTRL_RGB_IN_BIT);
    }

    if (bRgbOut)
    {
        CTRL_SET_BIT(u32RegValue,CTRL_RGB_OUT_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32RegValue,CTRL_RGB_OUT_BIT);
    }
    HDMI_MULTI_CSC_CTRL_reg_csc_modeSet(u32RegValue);

    return ;
}

static HI_BOOL CtrlVideoPathColormetrySet(HDMI_COLORMETRY_E enInColormetry,HDMI_COLORMETRY_E enOutColormetry)
{
    HI_U32 u32CscMode = 0;

    u32CscMode = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    enOutColormetry &= CTRL_COLORMETRY_MASK;
    u32CscMode &= CTRL_COLORMETRY_OUT_MASK;
    u32CscMode |= enOutColormetry << CTRL_COLORMETRY_OUT_BIT;

    enInColormetry &= CTRL_COLORMETRY_MASK;
    u32CscMode &= CTRL_COLORMETRY_IN_MASK;
    u32CscMode |= enInColormetry << CTRL_COLORMETRY_IN_BIT;

    HDMI_MULTI_CSC_CTRL_reg_csc_modeSet(u32CscMode);

    return (enOutColormetry != enInColormetry);
}

static HI_BOOL CtrlVideoPathColorSpaceSet(HDMI_COLORSPACE_E enInColorSpace,HDMI_COLORSPACE_E enOutColorSpace)
{
    HI_BOOL     bInRgb          = HI_FALSE;
    HI_BOOL     bOutRgb         = HI_FALSE;
    HI_BOOL     bCscEnable      = HI_FALSE;

    if (enInColorSpace == HDMI_COLORSPACE_YCbCr444 )
    {
        bInRgb = HI_FALSE;

        if (HDMI_COLORSPACE_RGB == enOutColorSpace)
        {
            bOutRgb         = HI_TRUE;
            bCscEnable      = HI_TRUE;
        }
    }
    else if (enInColorSpace == HDMI_COLORSPACE_RGB )
    {
        bInRgb        = HI_TRUE;
        bCscEnable    = HI_TRUE;

        if (HDMI_COLORSPACE_RGB == enOutColorSpace)
        {
            bOutRgb         = HI_TRUE;
            bCscEnable      = HI_FALSE;
        }
    }
    else
    {
        HDMI_WARN("un-expected enInColorSpace=%u\n",enInColorSpace);
    }

    if (HDMI_COLORSPACE_YCbCr422 == enOutColorSpace)
    {
        HDMI_WARN("unsupport enOutColorSpace=%u\n", enOutColorSpace);
    }

    HDMI_INFO(  "CSC:bIn=%d,bOut=%d,bEn=%d \n", bInRgb, bOutRgb, bCscEnable);

    CtrlVideoColorRgbSet(bInRgb, bOutRgb);

    HDMI_MULTI_CSC_CTRL_reg_csc_enSet(bCscEnable);
    HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enSet(bCscEnable);
    return bCscEnable;
}

static HI_BOOL CtrlVideoPathQuantizationSet(HDMI_QUANTIZATION_E enInQuantization,HDMI_QUANTIZATION_E enOutQuantization)
{
    HI_U32 u32CscMode = 0;
    HI_BOOL bCscSatuerate = HI_FALSE;

    u32CscMode = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    if (HDMI_QUANTIZATION_LIMITED != enInQuantization)
    {
        CTRL_SET_BIT(u32CscMode,CTRL_QUANTIZAION_IN_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32CscMode,CTRL_QUANTIZAION_IN_BIT);
    }


    if (HDMI_QUANTIZATION_LIMITED != enOutQuantization)
    {
        CTRL_SET_BIT(u32CscMode,CTRL_QUANTIZAION_OUT_BIT);
    }
    else
    {
        CTRL_CLR_BIT(u32CscMode,CTRL_QUANTIZAION_OUT_BIT);
    }

    bCscSatuerate = (enInQuantization != enOutQuantization) ? HI_TRUE : HI_FALSE;
    HDMI_MULTI_CSC_CTRL_reg_csc_modeSet(u32CscMode);
    HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enSet(bCscSatuerate);

    return bCscSatuerate;
}

static HI_S32 CtrlTmdsModeSet(HDMI_TMDS_MODE_E enTmdsMode)
{
    switch(enTmdsMode)
    {
        case HDMI_TMDS_MODE_DVI:
            HDMI_AVMIXER_CONFIG_hdmi_modeSet(HI_FALSE);

            break;
        case HDMI_TMDS_MODE_HDMI_1_4:
            HDMI_AVMIXER_CONFIG_hdmi_modeSet(HI_TRUE);
            break;

        default:
            HDMI_WARN("un-known tmds mode:%u\n",enTmdsMode);
            return HI_FAILURE;
            //break;
    }

    return HI_SUCCESS;
}

static  HI_BOOL CtrlHpdGet(HI_VOID)
{
    HI_BOOL bHpd;
    HI_BOOL bHotplugPol;

    bHotplugPol = HDMI_HOTPLUG_ST_CFG_hpd_polarity_ctlGet();
    bHpd        = HDMI_TX_AON_STATE_hotplug_stateGet();
    return bHotplugPol ? (!bHpd) : bHpd;
}

static HI_BOOL CtrlRsenGet(HI_VOID)
{
    if(HDMI_TX_AON_STATE_phy_rx_senseGet())
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}


#ifndef HDMI_BUILD_IN_BOOT

static HI_S32 CtrlVideoPathDeepClrGet(HI_BOOL *pbEnalbeGcp,HDMI_DEEP_COLOR_E *penDeepColorBit)
{
    CTRL_NULL_CHK(pbEnalbeGcp);
    CTRL_NULL_CHK(penDeepColorBit);

    *penDeepColorBit = HDMI_TX_PACK_FIFO_CTRL_tmds_pack_modeGet();
    if (HDMI_AVMIXER_CONFIG_dc_pkt_enGet())
    {
        *pbEnalbeGcp = HI_TRUE;
    }
    else
    {
        *pbEnalbeGcp = HI_FALSE;
    }

    return HI_SUCCESS;
}

static HI_S32 CtrlVideoPathPolarityGet(HDMI_SYNC_POL_S *pstOutSyncPol)
{
    HI_U32  u32SyncPolCfg = 0;

    CTRL_NULL_CHK(pstOutSyncPol);

    u32SyncPolCfg = HDMI_VIDEO_DMUX_CTRL_reg_inver_syncGet();
    pstOutSyncPol->bHPolInver = IS_BIT_SET(u32SyncPolCfg,CTRL_SYCN_POL_H_BIT) ? HI_TRUE : HI_FALSE;
    pstOutSyncPol->bVPolInver = IS_BIT_SET(u32SyncPolCfg,CTRL_SYCN_POL_V_BIT) ? HI_TRUE : HI_FALSE;
    pstOutSyncPol->bDeInver = IS_BIT_SET(u32SyncPolCfg,CTRL_SYCN_POL_DE_BIT) ? HI_TRUE : HI_FALSE;

    return HI_SUCCESS;
}


static HI_S32 CtrlVideoPathDitherGet(HI_BOOL *pbEnable,HDMI_VIDEO_DITHER_E *penDitherMode)
{
    CTRL_NULL_CHK(pbEnable);
    CTRL_NULL_CHK(penDitherMode);

    if(HDMI_DITHER_CONFIG_dither_rnd_bypGet())
    {
        *pbEnable = HI_FALSE;
    }
    else
    {
        *pbEnable = HI_TRUE;
    }

    *penDitherMode = HDMI_DITHER_CONFIG_dither_modeGet();

    return HI_SUCCESS;
}



static HI_S32 CtrlVideoColorRgbGet(HI_BOOL *pbRgbIn,HI_BOOL *pbRgbOut)
{
    HI_U32  u32RegValue  = 0;

    CTRL_NULL_CHK(pbRgbIn);
    CTRL_NULL_CHK(pbRgbOut);

    u32RegValue = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    *pbRgbIn    = IS_BIT_SET(u32RegValue, CTRL_RGB_IN_BIT);
    *pbRgbOut   = IS_BIT_SET(u32RegValue, CTRL_RGB_OUT_BIT);

    return HI_SUCCESS;
}


static HI_BOOL CtrlVideoColorCscGet(HI_VOID)
{
    if (HDMI_MULTI_CSC_CTRL_reg_csc_enGet())
    {
        return  HI_TRUE;
    }

    return HI_FALSE;
}

static HI_S32 CtrlVideoPathColorSpaceGet(HDMI_COLORSPACE_E *penInColorSpace,HDMI_COLORSPACE_E *penOutColorSpace)
{
    HI_BOOL     bInRgb          = HI_FALSE;
    HI_BOOL     bOutRgb         = HI_FALSE;

    CTRL_NULL_CHK(penInColorSpace);
    CTRL_NULL_CHK(penOutColorSpace);

    CtrlVideoColorRgbGet(&bInRgb,&bOutRgb);
    /* in */
    *penInColorSpace = bInRgb ? HDMI_COLORSPACE_RGB : HDMI_COLORSPACE_YCbCr444;

    /* out */
    *penOutColorSpace = bOutRgb ? HDMI_COLORSPACE_RGB : HDMI_COLORSPACE_YCbCr444;

    return HI_SUCCESS;
}

static HI_S32 CtrlVideoPathColormetryGet(HDMI_COLORMETRY_E *penInColormetry,HDMI_COLORMETRY_E *penOutColormetry)
{
    HI_U32 u32CscMode = 0;

    CTRL_NULL_CHK(penInColormetry);
    CTRL_NULL_CHK(penOutColormetry);

    u32CscMode = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    *penOutColormetry = (u32CscMode & CTRL_COLORMETRY_OUT_MASK) >> CTRL_COLORMETRY_OUT_BIT;
    *penInColormetry = (u32CscMode & CTRL_COLORMETRY_OUT_MASK) >> CTRL_COLORMETRY_IN_BIT;

    return HI_SUCCESS;
}

static HI_S32 CtrlVideoPathQuantizationGet(HDMI_QUANTIZATION_E *penInQuantization,HDMI_QUANTIZATION_E *penOutQuantization,HI_BOOL *pbCscSaturate)
{
    HI_U32 u32CscMode = 0;

    CTRL_NULL_CHK(penInQuantization);
    CTRL_NULL_CHK(penOutQuantization);
    CTRL_NULL_CHK(pbCscSaturate);

    u32CscMode = HDMI_MULTI_CSC_CTRL_reg_csc_modeGet();

    *penInQuantization  = IS_BIT_SET(u32CscMode,CTRL_QUANTIZAION_IN_BIT) ? HDMI_QUANTIZATION_FULL : HDMI_QUANTIZATION_LIMITED ;
    *penOutQuantization = IS_BIT_SET(u32CscMode,CTRL_QUANTIZAION_OUT_BIT) ? HDMI_QUANTIZATION_FULL : HDMI_QUANTIZATION_LIMITED ;
    *pbCscSaturate      = HDMI_MULTI_CSC_CTRL_reg_csc_saturate_enGet();
    return HI_SUCCESS;
}

static HI_S32 CtrlTmdsModeGet(HDMI_TMDS_MODE_E *penTmdsMode)
{
    CTRL_NULL_CHK(penTmdsMode);

    *penTmdsMode = HDMI_TMDS_MODE_DVI;

    if (HDMI_AVMIXER_CONFIG_hdmi_modeGet())
    {
        *penTmdsMode = HDMI_TMDS_MODE_HDMI_1_4;
    }

    return HI_SUCCESS;
}

static HI_S32 CtrlTimmingDecectGet(CTRL_TIMMING_DETECT_S *pstTimming)
{
    CTRL_NULL_CHK(pstTimming);

    pstTimming->bSyncSwEnable = HI_FALSE; //logic default is 0.

    HDMI_REG_VIDEO_TimmingGet(pstTimming);

    return HI_SUCCESS;
}


static HI_VOID CtrlVideoMuteSet(HI_BOOL bEnable)
{
    HDMI_COLORSPACE_E       enInColorSpace;
    HDMI_COLORSPACE_E       enOutColorSpace;

    CtrlVideoPathColorSpaceGet(&enInColorSpace,&enOutColorSpace);

    HDMI_REG_VIDEO_MuteSet(bEnable, enInColorSpace, enOutColorSpace);

    return ;
}

static HI_S32 CtrlVideoMuteGet(HI_BOOL *pbEnable)
{
    CTRL_NULL_CHK(pbEnable);

    *pbEnable = HDMI_REG_VIDEO_MuteGet();

    return HI_SUCCESS;
}

static HI_VOID CtrlHpdIntrEnalbe(HI_BOOL bEnalbe)
{
    HDMI_TX_AON_INTR_STATE_aon_intr_stat0Set(HI_TRUE);
    HDMI_TX_AON_INTR_MASK_aon_intr_mask0Set(bEnalbe);
    return ;
}

#ifdef HDMI_HDR_SUPPORT
static HI_VOID CtrlHdrTimerInvoke(HDMI_CTRL_INFO_S *pstCtrlInfo)
{
    HI_U32              i = 0;
    HI_U64              u64TimeOut = 0;
    CTRL_HDR_TIMER_S    *pstHdrTimer = HI_NULL;

    if (!pstCtrlInfo)
    {
        return ;
    }

    for (i = 0; i<HDMI_TIMER_TYPE_BUTT ;i++)
    {
        pstHdrTimer = &pstCtrlInfo->astHdrTimer[i];
        if (pstHdrTimer->bEnable)
        {
            u64TimeOut = HAL_HDMI_MachMsGet() - pstHdrTimer->u64StartTime;
            if(u64TimeOut >= pstHdrTimer->u64TimeLength)
            {
                pstHdrTimer->bEnable = HI_FALSE;
                HDMI_INFO("ctrl timer %d disable!\n",pstHdrTimer->enTimerType);
                switch(pstHdrTimer->enTimerType)
                {
                    case HDMI_TIMER_ZERO_DRMIF:
                        pstCtrlInfo->pfnEventCallBack(pstCtrlInfo->pvEventData,HDMI_EVENT_ZERO_DRMIF_TIMEOUT);
                        break;

                    case HDMI_TIMER_SDR_TO_HDR10:
                        pstCtrlInfo->pfnEventCallBack(pstCtrlInfo->pvEventData,HDMI_EVENT_SWITCH_TO_HDRMODE_TIMEOUT);
                        break;
                    default :
                        break;
                }
            }
        }
    }

    return ;
}
#endif

HI_VOID CtrlMachPpdCallBack(HI_VOID *pvData)
{
    HDMI_CTRL_INFO_S  *pstCtrlInfo = (HDMI_CTRL_INFO_S  *)pvData;
    HI_BOOL           bHpdRsen     = HI_FALSE;
    HDMI_EVENT_E      enEvent      = HDMI_EVENT_BUTT;

    if ((!pvData )
        || (!pstCtrlInfo->pfnEventCallBack )
        || (!pstCtrlInfo->pvEventData ) )
    {
        HDMI_WARN("null pointer!\n");
        return ;
    }

    if ( (HI_TRUE == pstCtrlInfo->bHardwareInit)
        && HDMI_TX_AON_INTR_STATE_aon_intr_stat0Get() )
    {
        /* clr intr */
        HDMI_TX_AON_INTR_STATE_aon_intr_stat0Set(HI_TRUE);
        /* event */
        bHpdRsen = CtrlHpdGet();
        if (bHpdRsen != pstCtrlInfo->bHotPlug)
        {
            pstCtrlInfo->bHotPlug = bHpdRsen;
            enEvent = bHpdRsen ? HDMI_EVENT_HOTPLUG : HDMI_EVENT_HOTUNPLUG;
            pstCtrlInfo->pfnEventCallBack(pstCtrlInfo->pvEventData, enEvent);
        }
    }

    if ( (HI_TRUE == pstCtrlInfo->bHardwareInit)
        && HDMI_TX_AON_INTR_STATE_aon_intr_stat1Get() )
    {
        /* clr intr */
        HDMI_TX_AON_INTR_STATE_aon_intr_stat1Set(HI_TRUE);
        /* event */
        bHpdRsen = CtrlRsenGet();
        if (bHpdRsen != pstCtrlInfo->bRsen)
        {
            pstCtrlInfo->bRsen = bHpdRsen;
            enEvent = bHpdRsen ? HDMI_EVENT_RSEN_CONNECT : HDMI_EVENT_RSEN_DISCONNECT;
            pstCtrlInfo->pfnEventCallBack(pstCtrlInfo->pvEventData, enEvent);
        }
    }

#ifdef HDMI_HDR_SUPPORT
     CtrlHdrTimerInvoke(pstCtrlInfo);
#endif

    return ;
}



#endif

/******************************* public interface  ***********************************/
HI_S32 HAL_HDMI_CtrlInit(HDMI_DEVICE_ID_E enHdmi,HDMI_HAL_INIT_S *pstHalInit)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

#ifndef HDMI_BUILD_IN_BOOT
    HDMI_MACH_CTRL_S    stMachCtrl = {0};
#endif

    CTRL_NULL_CHK(pstCtrlInfo);
    //CTRL_NULL_CHK(pstHalInit);

    if (!pstCtrlInfo->bInit)
    {
        s32Ret |= REG_HDMI_CRG_reg_Init();
        s32Ret |= HDMI_TX_S_tx_aon_reg_REGS_TYPE_Init();
#ifndef HDMI_BUILD_IN_BOOT
        s32Ret |= HDMI_TX_S_audio_path_reg_REGS_TYPE_Init();
        //s32Ret |= HDMI_TX_S_mcu_cpu_reg_REGS_TYPE_Init();
#endif
        s32Ret |= HDMI_TX_S_tx_ctrl_reg_REGS_TYPE_Init();
        s32Ret |= HDMI_TX_S_tx_hdmi_reg_REGS_TYPE_Init();
        s32Ret |= HDMI_TX_S_video_path_reg_REGS_TYPE_Init();

        if (pstHalInit)
        {
            pstCtrlInfo->pfnEventCallBack   = pstHalInit->pfnEventCallBack;
            pstCtrlInfo->pvEventData        = pstHalInit->pvEventData;
        }
        pstCtrlInfo->bInit              = HI_TRUE;
#ifndef HDMI_BUILD_IN_BOOT
        stMachCtrl.pCbData      = pstCtrlInfo;
        stMachCtrl.pfnCallBack  = CtrlMachPpdCallBack;
        stMachCtrl.u64Interval  = 10;
        stMachCtrl.pu8Name      = "HPD";
        s32Ret |= HAL_HDMI_MachRegister(&stMachCtrl,&pstCtrlInfo->u32MachId);
        s32Ret |= HAL_HDMI_MachStart(pstCtrlInfo->u32MachId);

        CtrlHpdIntrEnalbe(HI_TRUE);
#endif
    }
    return s32Ret;


}

HI_S32 HAL_HDMI_CtrlDeinit(HDMI_DEVICE_ID_E enHdmi)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);
#ifndef HDMI_BUILD_IN_BOOT
    CtrlHpdIntrEnalbe(HI_FALSE);
    s32Ret |= HAL_HDMI_MachStop(pstCtrlInfo->u32MachId);
    s32Ret |= HAL_HDMI_MachUnRegister(pstCtrlInfo->u32MachId);

    s32Ret |= HDMI_TX_S_audio_path_reg_REGS_TYPE_DeInit();
    //s32Ret |= HDMI_TX_S_mcu_cpu_reg_REGS_TYPE_DeInit();
#endif
    s32Ret |= HDMI_TX_S_tx_aon_reg_REGS_TYPE_DeInit();
    s32Ret |= HDMI_TX_S_tx_ctrl_reg_REGS_TYPE_DeInit();
    s32Ret |= HDMI_TX_S_tx_hdmi_reg_REGS_TYPE_DeInit();
    s32Ret |= HDMI_TX_S_video_path_reg_REGS_TYPE_DeInit();
    //s32Ret |= REG_HDMI_CRG_reg_DeInit();
    pstCtrlInfo->bInit = HI_FALSE;

    return s32Ret;
}


HI_S32 HAL_HDMI_CtrlSrst(HDMI_DEVICE_ID_E enHdmi)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    HDMI_AVMUTE_CFG_S   stAvmuteCfg = {0};

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    stAvmuteCfg.bMuteClr   = HI_FALSE;
    stAvmuteCfg.bMuteSet   = HI_FALSE;
    stAvmuteCfg.bMutePkgEn = HI_FALSE;
    stAvmuteCfg.bMuteRptEn = HI_FALSE;
    HDMI_REG_TX_AvmuteSet(&stAvmuteCfg);
    HDMI_TX_PWD_RST_CTRL_tx_pwd_srst_reqSet(HI_TRUE);
    udelay(5);
    HDMI_TX_PWD_RST_CTRL_tx_pwd_srst_reqSet(HI_FALSE);

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_CtrlDataReset(HDMI_DEVICE_ID_E enHdmi,HI_BOOL bDebugMode,HI_U32 u32DelayMs)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    static HI_U32       s_u32Delay = 0;

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    HDMI_TX_PWD_RST_CTRL_tx_hdmi_srst_reqSet(HI_TRUE);
    HDMI_REG_CTRL_PWD_RST_CTRL_AudioSet(HI_TRUE);

    udelay(5);

    HDMI_REG_CTRL_PWD_RST_CTRL_AudioSet(HI_FALSE);
    HDMI_TX_PWD_RST_CTRL_tx_hdmi_srst_reqSet(HI_FALSE);

    if(bDebugMode)
    {
        s_u32Delay = u32DelayMs;
    }

    if(s_u32Delay)
    {
        msleep(s_u32Delay);
        HDMI_INFO("dataRst %u ms\n",s_u32Delay);
    }

    return HI_SUCCESS;
}


HI_S32 HAL_HDMI_CtrlAvmuteSet(HDMI_DEVICE_ID_E enHdmi,HDMI_AVMUTE_CFG_S *pstAvmuteCfg)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstAvmuteCfg);
    CTRL_INIT_CHK(pstCtrlInfo);

    HDMI_REG_TX_AvmuteSet(pstAvmuteCfg);

    return HI_SUCCESS;
}



HI_S32 HAL_HDMI_CtrlAvmuteGet(HDMI_DEVICE_ID_E enHdmi,HI_BOOL *pbEnable)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    HDMI_AVMUTE_CFG_S   stAvmuteCfg;
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pbEnable);

    HDMI_REG_TX_AvmuteGet(&stAvmuteCfg);
    *pbEnable = (stAvmuteCfg.bMuteSet
                 && (!stAvmuteCfg.bMuteClr)
                 && stAvmuteCfg.bMutePkgEn ) ? HI_TRUE : HI_FALSE;

    return HI_SUCCESS;
}


HI_S32 CtrlVideoDitherSet(HDMI_VIDEO_PATH_S *pstVideoPath)
{
    HI_BOOL             bEnableGcp = HI_FALSE;
    HI_BOOL             bEnalbeDither = HI_FALSE;
    HDMI_VIDEO_DITHER_E enDitherMode = HDMI_VIDEO_DITHER_DISALBE;
    /* dither */
    switch(pstVideoPath->enOutDeepColor)
    {
           case  HDMI_DEEP_COLOR_24BIT :
                bEnableGcp      = HI_FALSE;
                switch(pstVideoPath->enInDeepColor)
                {
                    case  HDMI_DEEP_COLOR_30BIT:
                        bEnalbeDither   = HI_TRUE;
                        enDitherMode    = HDMI_VIDEO_DITHER_10_8;
                        break;
                    case  HDMI_DEEP_COLOR_36BIT:
                        bEnalbeDither   = HI_TRUE;
                        enDitherMode    = HDMI_VIDEO_DITHER_12_8;
                        break;
                    case  HDMI_DEEP_COLOR_24BIT:
                    default:
                        bEnalbeDither = HI_FALSE;
                        enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
                        break;
                }


                break;

           case  HDMI_DEEP_COLOR_30BIT:

                bEnableGcp      = HI_TRUE;
                if(pstVideoPath->enInDeepColor==HDMI_DEEP_COLOR_36BIT)
                {
                    bEnalbeDither   = HI_TRUE;
                    enDitherMode    = HDMI_VIDEO_DITHER_12_10;
                }
                else
                {
                    bEnalbeDither   = HI_FALSE;
                    enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
                }
                break;

           case  HDMI_DEEP_COLOR_36BIT:
                bEnableGcp      = HI_TRUE;
                bEnalbeDither   = HI_FALSE;
                enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
                break;

           //case  HDMI_DEEP_COLOR_48BIT:
           //     HDMI_WARN("ctrl  deepcolor un-support 48bit!force disable!\n");
           //case  HDMI_DEEP_COLOR_OFF:
           default:
                pstVideoPath->enOutDeepColor   = HDMI_DEEP_COLOR_24BIT;
                bEnableGcp      = HI_FALSE;
                switch(pstVideoPath->enInDeepColor)
                {
                    case  HDMI_DEEP_COLOR_30BIT:
                        bEnalbeDither   = HI_TRUE;
                        enDitherMode    = HDMI_VIDEO_DITHER_10_8;
                        break;
                    case  HDMI_DEEP_COLOR_36BIT:
                        bEnalbeDither   = HI_TRUE;
                        enDitherMode    = HDMI_VIDEO_DITHER_12_8;
                        break;
                    case  HDMI_DEEP_COLOR_24BIT:
                    default:
                        bEnalbeDither = HI_FALSE;
                        enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
                        break;
                }
                break;
    }

    if( HDMI_VIDEO_TIMING_1440X480I_60000 == pstVideoPath->enTimming
        || HDMI_VIDEO_TIMING_1440X576I_50000 == pstVideoPath->enTimming
        || HDMI_COLORSPACE_YCbCr422 == pstVideoPath->enOutColorSpace
        || HDMI_HDR_MODE_DOLBY_NORMAL == pstVideoPath->enHdrMode
        || HDMI_HDR_MODE_DOLBY_TUNNELING == pstVideoPath->enHdrMode)
    {
        bEnalbeDither   = HI_FALSE;
        enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
    }

    CtrlVideoPathDitherSet(bEnalbeDither,enDitherMode);
    //HDMI_ERR("bEnableGcp=%d,deepcolor=%d\n",bEnableGcp,pstVideoPath->enOutDeepColor);
    CtrlVideoPathDeepClrSet(bEnableGcp,pstVideoPath->enOutDeepColor);

    return HI_SUCCESS;
}



HI_S32 HAL_HDMI_CtrlVideoPathSet(HDMI_DEVICE_ID_E enHdmi,HDMI_VIDEO_PATH_S *pstVideoPath)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstVideoPath);
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    HDMI_MEMCPY(&pstCtrlInfo->stVideoPath,pstVideoPath,sizeof(HDMI_VIDEO_PATH_S));

    s32Ret |= CtrlVideoDitherSet(pstVideoPath);
    s32Ret |= CtrlVideoPathPolaritySet(&pstVideoPath->stOutHvSyncPol);
    if ((pstVideoPath->enOutColormetry!=HDMI_COLORMETRY_BT2020_CONST)
        &&(pstVideoPath->enOutColormetry!=HDMI_COLORMETRY_BT2020))
    {
        CtrlVideoPathColormetrySet(pstVideoPath->enInColormetry,pstVideoPath->enOutColormetry);
    }
    CtrlVideoPathQuantizationSet(pstVideoPath->enInQuantization,pstVideoPath->enOutQuantization);
    CtrlVideoPathColorSpaceSet(pstVideoPath->enInColorSpace,pstVideoPath->enOutColorSpace);

    return s32Ret;
}


HI_S32 HAL_HDMI_CtrlTmdsModeSet(HDMI_DEVICE_ID_E enHdmi,HDMI_TMDS_MODE_E enTmdsMode)
{
    HI_S32            s32Ret      = HI_SUCCESS;
    HDMI_CTRL_INFO_S *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    s32Ret = CtrlTmdsModeSet(enTmdsMode);

    return s32Ret;
}

HI_S32 HAL_HDMI_CtrlInfoFrameEnSet(HDMI_DEVICE_ID_E enHdmi, HDMI_INFOFRAME_ID_E enInfoFrameId, HI_BOOL bEnable)
{
    HI_S32      s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    switch(enInfoFrameId)
    {
        case HDMI_INFOFRAME_TYPE_VENDOR  :
            HDMI_REG_TX_CEA_VSIF_CFG_EnSet(bEnable);
            break;
        case HDMI_INFOFRAME_TYPE_AVI     :
            HDMI_REG_TX_CEA_AVI_CFG_EnSet(bEnable);
            break;
#ifndef HDMI_BUILD_IN_BOOT
        case HDMI_INFOFRAME_TYPE_AUDIO   :
            HDMI_REG_TX_CEA_AUD_CFG_EnSet(bEnable);
            break;
#endif
        default:
            HDMI_WARN("ctrl un-support infoframe type:%u!\n",enInfoFrameId);
            s32Ret = HI_FAILURE;
            break;
    }

    return s32Ret;
}


HI_S32 HAL_HDMI_CtrlInfoFrameDataSet(HDMI_DEVICE_ID_E enHdmi, HDMI_INFOFRAME_ID_E enInfoFrameId, HI_U8 *pu8IfData)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    HI_U8               *pu8Tmp = HI_NULL;

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pu8IfData);
    CTRL_NULL_CHK(pstCtrlInfo);

    for (pu8Tmp = pu8IfData; pu8Tmp < pu8IfData+30; pu8Tmp++)
    {
        CTRL_NULL_CHK(pu8Tmp);
    }

    switch(enInfoFrameId)
    {
        case HDMI_INFOFRAME_TYPE_VENDOR  :
            HDMI_REG_TX_VSIF_SUB_PKT_Set(pu8IfData);
            break;
        case HDMI_INFOFRAME_TYPE_AVI     :
            HDMI_REG_TX_AVI_SUB_PKT_Set(pu8IfData);
            break;
#ifndef HDMI_BUILD_IN_BOOT
        case HDMI_INFOFRAME_TYPE_AUDIO   :
            HDMI_REG_TX_AIF_SUB_PKT_Set(pu8IfData);
            break;
#endif
        default:
            HDMI_WARN("un-support infoframe type:%u!\n",enInfoFrameId);
            s32Ret = HI_FAILURE;
            break;
    }

    return s32Ret;
}

HI_S32 HAL_HDMI_CtrlTmdsStableGet(HDMI_DEVICE_ID_E enHdmi, HI_BOOL *pbStable)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pbStable);
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    *pbStable = HDMI_TX_PACK_FIFO_ST_pclk2tclk_stableGet() ? HI_TRUE : HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 CtrlHpdFillter(HDMI_HPD_FILLTER_S *pstHpd)
{
    HDMI_HOTPLUG_FillterSet(pstHpd->bFillterEnable, pstHpd->u32FillTerHigh, pstHpd->u32FillTerLow);

    return HI_SUCCESS;
}

HI_S32 CtrlHpdSimulate(HI_U32 u32HpdSimulate)
{
    HI_BOOL bSoftHpdEnalbe = HI_FALSE;
    HI_BOOL bSoftHpdState  = HI_FALSE;

    if(u32HpdSimulate < 2)
    {
        bSoftHpdEnalbe = HI_TRUE;
        bSoftHpdState  = (HI_BOOL)u32HpdSimulate;
    }

    HDMI_HOTPLUG_ST_CFG_SimulateSet(bSoftHpdEnalbe, bSoftHpdState);

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_CtrlHpdRsenGet(HDMI_DEVICE_ID_E enHdmi,HDMI_HPD_RSEN_S *pstHpdRsen)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstHpdRsen);
    CTRL_INIT_CHK(pstCtrlInfo);

    pstHpdRsen->bRsenOn = CtrlRsenGet();
    pstHpdRsen->bHpdOn  = CtrlHpdGet();

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_CtrlHpdFillter(HDMI_DEVICE_ID_E  enHdmi,HDMI_HPD_FILLTER_S *pstHpd)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstHpd);
    CTRL_INIT_CHK(pstCtrlInfo);

    return CtrlHpdFillter(pstHpd);
}

#ifndef HDMI_BUILD_IN_BOOT

HI_VOID HAL_HDMI_CtrlAudioCtsSet(HI_U32 u32CtsSwVal)
{
    HDMI_ACR_CTS_VAL_SW_acr_cts_val_swSet(u32CtsSwVal);
    return ;
}

HI_VOID HAL_HDMI_CtrlAudioNSet(HI_U32 u32AudioNvalue)
{
    HDMI_ACR_N_VAL_SW_acr_n_val_swSet(u32AudioNvalue);
    return ;
}
HI_S32 HAL_HDMI_CtrlVideoMuteSet(HDMI_DEVICE_ID_E enHdmi,HI_BOOL bEnable)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);
    CtrlVideoMuteSet(bEnable);
    return HI_SUCCESS;
}
HI_S32 HAL_HDMI_CtrlVideoMuteGet(HDMI_DEVICE_ID_E enHdmi,HI_BOOL *pbEnable)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    return CtrlVideoMuteGet(pbEnable);
}



HI_VOID HAL_HDMI_CtrlAudioSwSet(HI_BOOL bSw)
{
    HDMI_AUD_ACR_CTRL_acr_cts_hw_sw_selSet(bSw);
    return ;
}

HI_S32 HAL_HDMI_CtrlAudioMuteSet(HDMI_DEVICE_ID_E enHdmi,HI_BOOL bEnable,HI_BOOL bDebugMode,HI_U32 u32DelayMs)
{
    static HI_U32     u32AudioDelay = 0; /* default val, suggested by jinjunhao*/
    HDMI_CTRL_INFO_S *pstCtrlInfo   = CtrlInfoPtrGet(enHdmi);
    HDMI_TMDS_MODE_E  enTmdsMode    = HDMI_TMDS_MODE_HDMI_1_4;
//    HI_BOOL           bNullPkg      = HI_FALSE;
    HI_U32            u32Abs        = 0;
    HI_U32            u32Hw         = 0;
    HI_U32            u32Sw         = 0;
    HI_U32            i =0;

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    if(bDebugMode)
    {
        u32AudioDelay = u32DelayMs;
    }

    HAL_HDMI_CtrlAudioSwSet(bEnable);

    /*fix no audio after wakeup.*/
    if (!bEnable)
    {
        /*check CTS stable*/
        do
        {
            u32Hw = HDMI_ACR_CTS_VAL_HW_acr_cts_val_hwGet();
            u32Sw = HDMI_ACR_CTS_VAL_SW_acr_cts_val_swGet();

            u32Abs = ( (u32Hw > u32Sw)?(u32Hw - u32Sw):(u32Sw - u32Hw) );

            if (u32Abs <= 30)
            {
                break;
            }

            msleep(1);

        }while( i++ < 20 );

        HDMI_INFO("i = %d,AudioDelay %u ms.\n",i,u32AudioDelay);

        if (u32AudioDelay)
        {
            msleep(u32AudioDelay);
        }
    }

    CtrlAudioMuteSet(bEnable);

    CtrlTmdsModeGet(&enTmdsMode);
//    bNullPkg = ( (enTmdsMode == HDMI_TMDS_MODE_DVI) || (!bEnable) ) ? HI_FALSE : HI_TRUE;

//    CtrlNullPacketEnSet(bNullPkg);

    return HI_SUCCESS;
}

HI_VOID HAL_HDMI_CtrlAudioEnable(HDMI_DEVICE_ID_E enHdmi,HI_BOOL bEnable)
{
    HDMI_TX_AUDIO_CTRL_aud_in_enSet(bEnable);
    //HDMI_TX_AUDIO_CTRL_aud_mute_enSet(bEnable);

    return ;
}

static HI_VOID CtrlAudioReset(HI_VOID)
{
    HDMI_TX_PWD_RST_CTRL_tx_afifo_srst_reqSet(HI_TRUE);
    HDMI_TX_PWD_RST_CTRL_tx_acr_srst_reqSet(HI_TRUE);
    HDMI_TX_PWD_RST_CTRL_tx_aud_srst_reqSet(HI_TRUE);

    udelay(500);

    HDMI_TX_PWD_RST_CTRL_tx_afifo_srst_reqSet(HI_FALSE);
    HDMI_TX_PWD_RST_CTRL_tx_acr_srst_reqSet(HI_FALSE);
    HDMI_TX_PWD_RST_CTRL_tx_aud_srst_reqSet(HI_FALSE);
}

HI_S32 HAL_HDMI_CtrlAudioIntfSet(HDMI_DEVICE_ID_E enHdmi,HDMI_AUDIO_INTERFACE_E enAudioIntf)
{
    CTRL_AUDIO_EN_S  stAudioEn = {0};

    switch(enAudioIntf)
    {

        case HDMI_AUDIO_INTERFACE__SPDIF:
            stAudioEn.bSpdifEnable      = HI_TRUE;
            stAudioEn.bHbraEnable       = HI_FALSE;
            stAudioEn.enI2sSdEanble     = AUDIO_I2S_SD_EN_NONE;
            break;

        case HDMI_AUDIO_INTERFACE__HBRA:
            stAudioEn.bSpdifEnable      = HI_FALSE;
            stAudioEn.bHbraEnable       = HI_TRUE;
            stAudioEn.enI2sSdEanble     = AUDIO_I2S_SD_EN_ALL;  //4 //4 I2S channels sent data in hbra
            break;

        case HDMI_AUDIO_INTERFACE__I2S:
        default :
            stAudioEn.bSpdifEnable      = HI_FALSE;
            stAudioEn.bHbraEnable       = HI_FALSE;
            stAudioEn.enI2sSdEanble     = AUDIO_I2S_SD_EN_ALL;//4   //1 I2S channel sent data in I2S
            break;
    }


    /* NOTE:HDMI_TX_AUDIO_CTRL aud_in_en ;HDMI_TX_AUDIO_CTRL aud_mute_en set in boot.or N / CTS not OK */
    HDMI_TX_AUDIO_IntfSet(&stAudioEn);

    return HI_SUCCESS;

}
HI_S32 HAL_HDMI_CtrlAudioPathSet(HDMI_DEVICE_ID_E enHdmi,HDMI_AUDIO_PATH_S *pstAudioPath)
{

     HI_U32              u32CtsSw       = 0;
     HI_U32              u32CtsHw       = 0;
     HI_BOOL             bCtsSw         = 0;
     HI_U32              u32Nvalue      = 0;
     HI_BOOL             bMutiLayout    = HI_FALSE;
     HI_BOOL             bHbra          = HI_FALSE;
     CTRL_I2S_STATUS_S   stI2sStatus    = {0};
     CTRL_I2S_CTRL_S     stI2sCtrl      = {0};
     CTRL_FIFO_CTRL_S    stFifoCtrl     = {0};
     HDMI_CTRL_INFO_S    *pstCtrlInfo   = CtrlInfoPtrGet(enHdmi);
     HI_U32              u32OrgRegRateCfg = 0;

    CTRL_NULL_CHK(pstAudioPath);
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    HDMI_MEMCPY(&pstCtrlInfo->stAudioPath,pstAudioPath,sizeof(HDMI_AUDIO_PATH_S));

    HAL_HDMI_CtrlAudioIntfSet(enHdmi,pstAudioPath->enSoundIntf);

    u32OrgRegRateCfg = pstAudioPath->enSampleRate;

    if( HDMI_AUDIO_INTERFACE__HBRA==pstAudioPath->enSoundIntf)
    {
        bHbra               = HI_TRUE;
        u32OrgRegRateCfg    = HDMI_SAMPLE_RATE_768K;
    }

    /* i2s */
    if (HDMI_AUDIO_INTERFACE__SPDIF != pstAudioPath->enSoundIntf)
    {
        /* I2S layout */
        if (bHbra|| pstAudioPath->enChanneNum == HDMI_AUDIO_FORMAT_2CH)
        {
            bMutiLayout = HI_FALSE;
        }
        else if(pstAudioPath->enChanneNum < HDMI_AUDIO_FORMAT_BUTT)
        {
            bMutiLayout = HI_TRUE;
        }
        else
        {
            HDMI_WARN("error audio channel number:%u\n",pstAudioPath->enChanneNum);
            bMutiLayout = HI_FALSE;
        }
        CtrlAudioPathLayoutSet(bMutiLayout);

        /* i2s ctrl */
        stI2sCtrl.bChannelLRSwap      = HI_FALSE;
        stI2sCtrl.u32InBitLength      = CtrlAudioBitRegGet(pstAudioPath->enSampleBit) ;
        stI2sCtrl.bVbitCompress       = HI_FALSE;
        stI2sCtrl.bDataDirMsbFirst    = HI_FALSE;
        stI2sCtrl.bJustifyWsRight     = HI_FALSE;
        stI2sCtrl.bPolarityWsMsbLeft  = HI_FALSE;
        stI2sCtrl.bSckShiftOne        = HI_FALSE;
        stI2sCtrl.bHbraEnable         = bHbra;
        CtrlAudioI2sCtrlSet(&stI2sCtrl);

        /* i2s status */
        stI2sStatus.enClkAccuracy     = AUDIO_CLK_ACCURACY_LEVEL2;;
        stI2sStatus.bProfessionalApp  = HI_FALSE;
        stI2sStatus.bCompress         = HI_FALSE;
        stI2sStatus.u32SampRate       = CtrlI2SRateRegGet(u32OrgRegRateCfg);
        stI2sStatus.u32OrgRate        = CtrlI2SRateOrgRegGet(pstAudioPath->enSampleRate);
        stI2sStatus.u32OutBitLength   = CtrlAudioBitRegGet(pstAudioPath->enSampleBit);
        CtrlAudioI2sStatusSet(&stI2sStatus);
    }

    stFifoCtrl.bTest        = HI_FALSE;//!pstAudioPath->bEnableAudio;
    stFifoCtrl.enHbraMask   = bHbra ? AUDIO_HBRA_MASK_ALL : AUDIO_HBRA_MASK_NONE;
    CtrlAudioFifoCtrlSet(&stFifoCtrl);

    /* CTS &  N value */

    u32Nvalue   = HAL_HDMI_NValueGet(pstAudioPath->enSampleRate,pstAudioPath->u32PixelClk);
    u32CtsSw    = HAL_HDMI_CtsValueGet(pstAudioPath->enSampleRate,pstAudioPath->u32PixelClk);
    DRV_HDMI_CompatAudNCtsGet(enHdmi, &u32Nvalue, &u32CtsSw);
    HAL_HDMI_CtrlAudioCtsSet(u32CtsSw);
    HAL_HDMI_CtrlAudioNSet(u32Nvalue);
    CtrlAudioReset();
    CtrlAudioPathCtsValueGet(&u32CtsHw,&u32CtsSw,&bCtsSw);

    HDMI_INFO("fs=%u,bit=%u,intf=%u,tmds=%u\n"
              "\tref N=%u,real N=%u,ref cts=%u,HwCts=%u,SwCts=%u,bSw=%d\n",
                    pstAudioPath->enSampleRate,
                    pstAudioPath->enSampleBit,
                    pstAudioPath->enSoundIntf,
                    pstAudioPath->u32PixelClk,

                    u32Nvalue,
                    CtrlAudioPathNvalueGet(),
                    HAL_HDMI_CtsValueGet(pstAudioPath->enSampleRate,pstAudioPath->u32PixelClk),
                    u32CtsHw,
                    u32CtsSw,
                    bCtsSw);


    return HI_SUCCESS;
}


HI_S32 HAL_HDMI_CtrlAudioPathGet(HDMI_DEVICE_ID_E enHdmi,CTRL_AUDIO_STATUS_S *pstAudioStat)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    HDMI_AUDIO_PATH_S   *pstAudioPath = HI_NULL;

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstAudioStat);
    pstAudioPath = &pstCtrlInfo->stAudioPath;
    CTRL_NULL_CHK(pstAudioPath);

    if (CtrlAudioSpdifEnalbeGet())
    {
        pstAudioStat->enSoundIntf =  HDMI_AUDIO_INTERFACE__SPDIF;
    }
    else if (CtrlAudioHbraEnableGet())
    {
        pstAudioStat->enSoundIntf =  HDMI_AUDIO_INTERFACE__HBRA;
    }
    else if (CtrlAudioI2sEnalbeGet())
    {
        pstAudioStat->enSoundIntf =  HDMI_AUDIO_INTERFACE__I2S;
    }
    else
    {
        pstAudioStat->enSoundIntf =  HDMI_AUDIO_INTERFACE__BUTT;
    }

    pstAudioStat->bEnableAudio = CtrlAudioPathEnableGet();
    pstAudioStat->bAudioMute   = CtrlAudioMuteGet();

    switch(pstAudioStat->enSoundIntf)
    {
        case HDMI_AUDIO_INTERFACE__SPDIF :
            pstAudioStat->enSampleBit  = CtrlAudioBitValueGet(HI_TRUE);
            pstAudioStat->enSampleRate = CtrlSpdifRateValueGet();
            pstAudioStat->enChanneNum  = HDMI_AUDIO_FORMAT_BUTT;
            break;
        case HDMI_AUDIO_INTERFACE__HBRA :
        case HDMI_AUDIO_INTERFACE__I2S  :
        default:
            pstAudioStat->enSampleBit  = CtrlAudioBitValueGet(HI_FALSE);
            pstAudioStat->enSampleRate = CtrlI2SRateValueGet();
            pstAudioStat->enChanneNum  = CtrlAudioPathLayoutGet() ? 8 : 2;
            break;
    }

    CtrlAudioPathCtsValueGet(&pstAudioStat->u32HwCtsvalue,&pstAudioStat->u32SwCtsvalue,&pstAudioStat->bSwCts );
    pstAudioStat->u32RefCtsvalue = HAL_HDMI_CtsValueGet(pstAudioPath->enSampleRate,pstAudioPath->u32PixelClk);
    pstAudioStat->u32RefNvalue   = HAL_HDMI_NValueGet(pstAudioPath->enSampleRate,pstAudioPath->u32PixelClk);
    pstAudioStat->u32RegNvalue   = CtrlAudioPathNvalueGet();

    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_CtrlVideoPathGet(HDMI_DEVICE_ID_E enHdmi,CTRL_VIDEO_STATUS_S *pstVideoStat)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HI_BOOL             bEnableGcp = HI_FALSE;
    HI_BOOL             bEnalbeDither = HI_FALSE;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstVideoStat);
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    s32Ret |= CtrlTimmingDecectGet(&pstVideoStat->stTimming);
    s32Ret |= CtrlVideoPathPolarityGet(&pstVideoStat->stOutHvSyncPol);
    s32Ret |= CtrlVideoPathColorSpaceGet(&pstVideoStat->enInColorSpace, &pstVideoStat->enOutColorSpace);
    s32Ret |= CtrlVideoPathDitherGet(&bEnalbeDither,&pstVideoStat->enDitherMode);
    s32Ret |= CtrlVideoPathColormetryGet(&pstVideoStat->enInColormetry,&pstVideoStat->enOutColormetry);
    s32Ret |= CtrlVideoPathQuantizationGet(&pstVideoStat->enInQuantization,&pstVideoStat->enOutQuantization,&pstVideoStat->bCscSaturate);
    s32Ret |= CtrlVideoPathDeepClrGet(&bEnableGcp,&pstVideoStat->enOutDeepColor);
    pstVideoStat->bCscEnable = CtrlVideoColorCscGet();

    if (!bEnableGcp)
    {
        pstVideoStat->enOutDeepColor = HDMI_DEEP_COLOR_OFF;
    }

    switch(pstVideoStat->enDitherMode)
    {
        case HDMI_VIDEO_DITHER_12_10    :
        case HDMI_VIDEO_DITHER_12_8     :
            pstVideoStat->enInDeepColor = HDMI_DEEP_COLOR_36BIT;
            break;
        case HDMI_VIDEO_DITHER_10_8     :
            pstVideoStat->enInDeepColor = HDMI_DEEP_COLOR_30BIT;
            break;

        case HDMI_VIDEO_DITHER_DISALBE  :
        default:
            pstVideoStat->enInDeepColor = pstVideoStat->enOutDeepColor;
            break;
    }

    pstVideoStat->bY422Enalbe = HI_FALSE;
    pstVideoStat->bY420Enalbe = HI_FALSE;

    return s32Ret;
}



HI_S32 HAL_HDMI_CtrlTmdsModeGet(HDMI_DEVICE_ID_E enHdmi,HDMI_TMDS_MODE_E *penTmdsMode)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(penTmdsMode);
    CTRL_INIT_CHK(pstCtrlInfo);
    s32Ret = CtrlTmdsModeGet(penTmdsMode);
    return s32Ret;
}


HI_S32 HAL_HDMI_CtrlInfoFrameEnGet(HDMI_DEVICE_ID_E enHdmi, HDMI_INFOFRAME_ID_E enInfoFrameId, HI_BOOL *pbEnable)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pbEnable);
    CTRL_INIT_CHK(pstCtrlInfo);

    switch(enInfoFrameId)
    {
        case HDMI_INFOFRAME_TYPE_VENDOR  :
            *pbEnable = HDMI_REG_TX_CEA_VSIF_CFG_EnGet();
            break;
        case HDMI_INFOFRAME_TYPE_AVI     :
            *pbEnable = HDMI_REG_TX_CEA_AVI_CFG_EnGet();
            break;

        case HDMI_INFOFRAME_TYPE_AUDIO   :
            *pbEnable = HDMI_REG_TX_CEA_AUD_CFG_EnGet();
            break;

        default:
            HDMI_WARN("ctrl un-support infoframe type:%u!\n",enInfoFrameId);
            s32Ret = HI_FAILURE;
            break;
    }

    return s32Ret;
}



HI_S32 HAL_HDMI_CtrlInfoFrameDataGet(HDMI_DEVICE_ID_E enHdmi, HDMI_INFOFRAME_ID_E enInfoFrameId, HI_U8 *pu8IfData)
{
    HI_S32              s32Ret = HI_SUCCESS;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);
    HI_U8               *pu8Tmp = HI_NULL;

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pu8IfData);
    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    for (pu8Tmp = pu8IfData; pu8Tmp < pu8IfData+30; pu8Tmp++)
    {
        CTRL_NULL_CHK(pu8Tmp);
    }

    switch(enInfoFrameId)
    {
        case HDMI_INFOFRAME_TYPE_VENDOR  :
            HDMI_REG_TX_VSIF_SUB_PKT_Get(pu8IfData);
            break;
        case HDMI_INFOFRAME_TYPE_AVI     :
            HDMI_REG_TX_AVI_SUB_PKT_Get(pu8IfData);
            break;

        case HDMI_INFOFRAME_TYPE_AUDIO   :
            HDMI_REG_TX_AIF_SUB_PKT_Get(pu8IfData);
            break;

        default:
            HDMI_WARN("ctrl un-support infoframe type:%u!\n",enInfoFrameId);
            s32Ret = HI_FAILURE;
            break;
    }

    return s32Ret;
}

HI_S32 HAL_HDMI_CtrlHpdSimulate(HDMI_DEVICE_ID_E  enHdmi,HI_U32 u32SimulateHpd)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    return CtrlHpdSimulate(u32SimulateHpd);
}

HI_S32 HAL_HDMI_CtrlVideoDbgSet(HDMI_DEVICE_ID_E  enHdmi,HDMI_DBG_VIDEO_S *pstDbgVideo)
{
#if 0
    HI_U32              u32Polarlity = 0x0;
    HI_U32              u32Mask = 0x0;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstDbgVideo);
    CTRL_INIT_CHK(pstCtrlInfo);

    //u32Polarlity = HDMI_TIMING_GEN_CTRL_reg_sync_polarityGet();
    u32Polarlity |= (pstDbgVideo->bVsyncPolarlity && 0x1) << 1;
    u32Polarlity |= pstDbgVideo->bHsyncPolarlity && 0x1;
    HDMI_TIMING_GEN_CTRL_reg_sync_polaritySet(u32Polarlity);
    HDMI_TIMING_GEN_CTRL_reg_timing_selSet(pstDbgVideo->enTimming);
    HDMI_TIMING_GEN_CTRL_reg_extmodeSet(pstDbgVideo->bSelfDefineTimming);
    HDMI_TIMING_GEN_CTRL_reg_timing_gen_enSet(pstDbgVideo->bTimmingEnable);

    u32Mask |= pstDbgVideo->bCbMask & 0x1;
    u32Mask <<= 1;
    u32Mask |= pstDbgVideo->bYMask & 0x1;
    u32Mask <<= 1;
    u32Mask |= pstDbgVideo->bCrMask & 0x1;

    //HDMI_PATTERN_GEN_CTRL_cbar_pattern_selSet(pstDbgVideo->bMixColor);
    HDMI_PATTERN_GEN_CTRL_cbar_pattern_selSet(pstDbgVideo->bYCbCrSpace);
    HDMI_PATTERN_GEN_CTRL_mask_pattern_enSet(u32Mask);
    HDMI_PATTERN_GEN_CTRL_square_pattern_enSet(pstDbgVideo->bSquarePattern);
    HDMI_PATTERN_GEN_CTRL_colorbar_enSet(pstDbgVideo->bColorBar);
    HDMI_PATTERN_GEN_CTRL_video_formatSet(pstDbgVideo->enPixFormat);
    HDMI_PATTERN_GEN_CTRL_solid_pattern_enSet(pstDbgVideo->bSolidPattern);
    HDMI_VIDEO_PATH_CTRL_reg_video_blank_enSet(pstDbgVideo->bPatternEnable);
#endif
    return HI_SUCCESS;
}

HI_S32 HAL_HDMI_CtrlVideoDbgGet(HDMI_DEVICE_ID_E  enHdmi,HDMI_DBG_VIDEO_S *pstDbgVideo)
{
#if 0
    HI_U32              u32Polarlity = 0x0;
    HI_U32              u32Mask = 0x0;
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_NULL_CHK(pstDbgVideo);
    CTRL_INIT_CHK(pstCtrlInfo);

    u32Polarlity = HDMI_TIMING_GEN_CTRL_reg_sync_polarityGet();
    pstDbgVideo->bHsyncPolarlity = (u32Polarlity & 0x1) ? HI_TRUE : HI_FALSE;
    pstDbgVideo->bVsyncPolarlity = (u32Polarlity & 0x2) ? HI_TRUE : HI_FALSE;
    pstDbgVideo->enTimming = (HDMI_DBG_TIMMING_E)HDMI_TIMING_GEN_CTRL_reg_timing_selGet();
    pstDbgVideo->bSelfDefineTimming = HDMI_TIMING_GEN_CTRL_reg_extmodeGet() ? HI_TRUE : HI_FALSE ;
    pstDbgVideo->bTimmingEnable = HDMI_TIMING_GEN_CTRL_reg_timing_gen_enGet() ? HI_TRUE : HI_FALSE ;
    //pstDbgVideo->bMixColor = HDMI_PATTERN_GEN_CTRL_cbar_pattern_selGet()? HI_TRUE : HI_FALSE ;
    pstDbgVideo->bYCbCrSpace = HDMI_PATTERN_GEN_CTRL_colorbar_enGet() ? HI_TRUE : HI_FALSE ;
    u32Mask = HDMI_PATTERN_GEN_CTRL_mask_pattern_enGet();
    pstDbgVideo->bCbMask    = u32Mask & 0x1;
    pstDbgVideo->bYMask     = u32Mask & 0x2;
    pstDbgVideo->bCrMask    = u32Mask & 0x4;
    pstDbgVideo->bSquarePattern = HDMI_PATTERN_GEN_CTRL_square_pattern_enGet() ? HI_TRUE : HI_FALSE ;
    pstDbgVideo->bColorBar = HDMI_PATTERN_GEN_CTRL_colorbar_enGet() ? HI_TRUE : HI_FALSE ;
    pstDbgVideo->enPixFormat = (HDMI_DBG_PIX_FMT_E)HDMI_PATTERN_GEN_CTRL_video_formatGet();
    pstDbgVideo->bSolidPattern  = HDMI_PATTERN_GEN_CTRL_solid_pattern_enGet() ? HI_TRUE : HI_FALSE ;
    pstDbgVideo->bPatternEnable = HDMI_VIDEO_PATH_CTRL_reg_video_blank_enGet() ? HI_TRUE : HI_FALSE ;
#endif
    return HI_SUCCESS;
}

HI_VOID HAL_HDMI_CtrlDiterDbgSet(HDMI_DEVICE_ID_E  enHdmi,HDMI_VIDEO_DITHER_E enDitherMode)
{
    HI_BOOL bEnalbeDither = HI_FALSE;

    if(enDitherMode >= HDMI_VIDEO_DITHER_DISALBE)
    {
        bEnalbeDither   = HI_FALSE;
        enDitherMode    = HDMI_VIDEO_DITHER_DISALBE;
    }
    else
    {
        bEnalbeDither   = HI_TRUE;
    }

    CtrlVideoPathDitherSet(bEnalbeDither,enDitherMode);

    return ;
}

HI_S32 HAL_HDMI_CtrlHWInitSet(HDMI_DEVICE_ID_E  enHdmi, HI_BOOL bHWInitStatus)
{
    HDMI_CTRL_INFO_S    *pstCtrlInfo = CtrlInfoPtrGet(enHdmi);

    CTRL_NULL_CHK(pstCtrlInfo);
    CTRL_INIT_CHK(pstCtrlInfo);

    pstCtrlInfo->bHardwareInit = bHWInitStatus;
    pstCtrlInfo->bHotPlug      = CtrlHpdGet();
    pstCtrlInfo->bRsen         = CtrlRsenGet();

    return HI_SUCCESS;
}

#endif



