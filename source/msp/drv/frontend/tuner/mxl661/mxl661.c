/******************************************************************************

  Copyright (C), 2012-2050, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2013/12/16
  Description   :
  History       :
  1.Date        : 2013/12/16
    Modification: Created file
******************************************************************************/

#include <linux/kthread.h>
#include <linux/init.h>
#include <linux/delay.h>

#include "hi_type.h"

#include "MxL661_TunerApi.h"
#include "MxL661_OEM_Drv.h"
#include "drv_i2c_ext.h"
#include "drv_gpio_ext.h"
#include "drv_gpioi2c_ext.h"
#include "hi_unf_frontend.h"
#include "drv_demod.h"

#ifdef __cplusplus
 #if __cplusplus
    extern "C" {
 #endif
#endif /* __cplusplus */

#define MXL661_VHF_LOWMIN_FREQ    44000000UL    // Hz
#define MXL661_VHF_LOWMAX_FREQ    146000000UL   // Hz
#define MXL661_VHF_HIGHMIN_FREQ   146000000UL   // Hz
#define MXL661_VHF_HIGHMAX_FREQ   367000000UL   // Hz
#define MXL661_UHF_MIN_FREQ       367000000UL   // Hz
#define MXL661_UHF_MAX_FREQ       870000000UL   // Hz

#define MXL661_STEP               HI_UNF_TUNER_STEP_62_5KHz

#define MXL661_DEFAULT_PORT       0


#define MXL661_PIC_FREQ_DIFF_ANA_M_N        (1750)
#define MXL661_PIC_FREQ_DIFF_ANA_B          (2250)
#define MXL661_PIC_FREQ_DIFF_ANA_GH         (2250)
#define MXL661_PIC_FREQ_DIFF_ANA_I          (2750)
#define MXL661_PIC_FREQ_DIFF_ANA_D_K_L      (2750)
#define MXL661_PIC_FREQ_DIFF_SECAM          (2750)
#define MXL661_PIC_FREQ_DIFF_SECAM2         (2750)


HI_U32                 s_u8Mxl661I2cChannel;
HI_U32                 s_u32Mxl661I2cAddr;

I2C_EXT_FUNC_S       *s_pstMxl661I2cFunc;
GPIO_EXT_FUNC_S      *s_pstMxl661GpioFunc;
GPIO_I2C_EXT_FUNC_S  *s_pstMxl661GpioI2cFunc;
static HI_BOOL              bTunerMxl661Inited = HI_FALSE;
static HI_U32               s_u32Mxl661IFFreqKHz = 0;
static  HI_BOOL              bTunerMxl661SetRF = HI_FALSE;
static  MXL661_BW_E e_u8Mxl661BandWidth = MXL661_ANA_TV_DIG_CABLE_BW_8MHz;
static  MXL661_SIGNAL_MODE_E e_u8Mxl661AppMode = MXL661_DIG_DVB_C;
static HI_UNF_TUNER_ATTR_S s_stTunerAttr;

#define MXL661_DEFAULT_SINGLE_POWER_SUPPLY  MXL_ENABLE          // Single power supply

#define MXL661_DEFAULT_XTAL_FREQ_SEL        MXL661_XTAL_24MHz   //MXL661_XTAL_16MHz    // 24MHz
#define MXL661_DEFAULT_XTAL_CAP                 29                              //PF

#define MXL661_DEFAULT_XTAL_CLOCK_OUT       MXL_DISABLE             // V clock out
#define MXL661_DEFAULT_XTAL_CLOCK_DIV       MXL_DISABLE             // Disable clock div


#define MXL661_ATV_DVB_C_IF_PATH            MXL661_IF_PATH2             // IF path 2

#define MXL661_DTMB_IF_PATH                     MXL661_IF_PATH2            // IF path 2

#define MXL661_DEFAULT_IF_FREQ_SEL          MXL661_IF_5MHz              // 5MHz
#define MXL661_DEFAULT_IF_INVERSION         MXL_ENABLE                    // IF spectrum inversion
#define MXL661_DEFAULT_IF_GAIN                 9                                   // For digital range is 5 to 11

#ifndef HI_FPGA_SUPPORT
#define MXL661_DEFAULT_AGC_TYPE              MXL661_AGC_EXTERNAL    // External AGC
#else
#define MXL661_DEFAULT_AGC_TYPE              MXL661_AGC_SELF    // Slef AGC
#endif

#define MXL661_DEFAULT_ATV_DVB_C_AGC_SEL              MXL661_AGC2          // Select AGC2

#ifndef HI_FPGA_SUPPORT
#define MXL661_DEFAULT_DTMB_DVB_T_AGC_SEL             MXL661_AGC2          // Select AGC2
#else
#define MXL661_DEFAULT_DTMB_DVB_T_AGC_SEL             MXL661_AGC1          // Select AGC2
#endif

#define MXL661_DEFAULT_AGC_SET_POINT        66  // Default value for Self AGC

// Define MxL661 device power supply, Xtal, IF out and AGC setting
typedef struct
{

  MXL_BOOL Single_3_3_v_Supply; // Define Tuner is single 3.3v power supply or not.
  MXL661_XTAL_FREQ_E XtalFreqSel;  // XTAL frequency selection, either 16MHz or 24MHz
  UINT8 XtalCap;                // XTAL capacity
  MXL_BOOL XtalClkOut;          // XTAL clock out enable or disable
  MXL_BOOL XtalClkDiv;          // Define if clock out freq is divided by 4 or not
  UINT8 SignalMode;             // Tuner work mode, refers MXL_SIGNAL_MODE_E definition
  UINT8 BandWidth;              // signal band width in MHz unit
  UINT8 ATV_DVB_C_IFPath;            // define which IF path is selected
  UINT8 DTMB_IFPath;                 // define which IF path is selected
  MXL661_IF_FREQ_E IFFreqSel;      // IF out signel frequency selection. Refers MXL661_IF_FREQ_E define.
  MXL_BOOL IFInversion;         // IF spectrum is inverted or not
  UINT8 IFGain;                 // IF out gain level
  MXL661_AGC_TYPE_E AgcType;       // AGC mode selection, self or closed loop
  MXL661_AGC_ID_E ATV_DVB_C_AgcSel;          // AGC selection, AGC1 or AGC2
  MXL661_AGC_ID_E DTMB_DVB_T_AgcSel;          // AGC selection, AGC1 or AGC2
  UINT8 AgcSetPoint;            // AGC attack point set value
} MXL661_CHARACTER_SET_T;

static MXL661_CHARACTER_SET_T MxL661_Default_Set =
{
  MXL661_DEFAULT_SINGLE_POWER_SUPPLY, // power supply type
  MXL661_DEFAULT_XTAL_FREQ_SEL,  // Xtal freq selection
  MXL661_DEFAULT_XTAL_CAP,       // Xtal cap
  MXL661_DEFAULT_XTAL_CLOCK_OUT, // clock out
  MXL661_DEFAULT_XTAL_CLOCK_DIV, // clock div
  MXL661_DIG_DVB_C,  // DVB_C
  8,  // 8MHz
  MXL661_ATV_DVB_C_IF_PATH,      // V100:IF path 1; V200:IF path 2
  MXL661_DTMB_IF_PATH,           // IF path 2
  MXL661_DEFAULT_IF_FREQ_SEL, // IF freq selection
  MXL661_DEFAULT_IF_INVERSION, // IF spectrum inversion
  MXL661_DEFAULT_IF_GAIN,  // IF gain
  MXL661_DEFAULT_AGC_TYPE, // AGC type, self or external
  MXL661_DEFAULT_ATV_DVB_C_AGC_SEL,   // Select AGC1
  MXL661_DEFAULT_DTMB_DVB_T_AGC_SEL,  // V100:Select AGC2 ;V200:Select AGC1
  MXL661_DEFAULT_AGC_SET_POINT // AGC set point, effective for self AGC
};

UINT32 IFAbsFreqInKHz[] = {3650, 4000, 4100, 4150, 4500, 4570, 5000, 5380, 6000, 6280, 7200, 8250, 35250, 36000, 36150, 36650, 44000};

void MxL661_API_SetAppMode(UINT8 AppMode,MXL661_IF_FREQ_E IFFreqSel,MXL_BOOL iSIFInversion )
{
    MXL_STATUS status;
    MXL661_COMMAND_T apiCmd;

    // IF Out setting
    apiCmd.commandId = MXL661_DEV_IF_OUT_CFG;
    apiCmd.MxLIf.cmdIfOutCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdIfOutCfg.IFOutFreq = IFFreqSel;

    apiCmd.MxLIf.cmdIfOutCfg.IFInversion = iSIFInversion;
    apiCmd.MxLIf.cmdIfOutCfg.GainLevel = MxL661_Default_Set.IFGain;

    if((MXL661_DIG_DVB_T_DTMB == (MXL661_SIGNAL_MODE_E)AppMode)
      ||(MXL661_DIG_ISDBT_ATSC == (MXL661_SIGNAL_MODE_E)AppMode)
      ||(MXL661_DIG_DVB_C == (MXL661_SIGNAL_MODE_E)AppMode)
      ||(MXL661_DIG_J83B == (MXL661_SIGNAL_MODE_E)AppMode))
    {
        apiCmd.MxLIf.cmdIfOutCfg.PathSel = MxL661_Default_Set.DTMB_IFPath;
    }
    else
    {
        apiCmd.MxLIf.cmdIfOutCfg.PathSel = MxL661_Default_Set.ATV_DVB_C_IFPath;
    }

    if (s_stTunerAttr.enDemodDevType == HI_UNF_DEMOD_DEV_TYPE_3137)
    {
        apiCmd.MxLIf.cmdIfOutCfg.PathSel = MXL661_IF_PATH1;
    }


//#ifdef CUSTOM_TUNER_IF_PATH
#if 0
    if(HI_CUSTOM_TUNER_IF_PATH1 == CUSTOM_TUNER_IF_PATH)
    {
        apiCmd.MxLIf.cmdIfOutCfg.PathSel = MXL661_IF_PATH1;
    }
    else if(HI_CUSTOM_TUNER_IF_PATH2 == CUSTOM_TUNER_IF_PATH)
    {
        apiCmd.MxLIf.cmdIfOutCfg.PathSel = MXL661_IF_PATH2;
    }
    else
    {
        HI_ERR_TUNER(CUSTOM_TUNER_IF_PATH);
    }
#endif
    HI_INFO_TUNER("PathSel:%d.\n",apiCmd.MxLIf.cmdIfOutCfg.PathSel);

  //Manual or atuo FreqSet
    if((MXL661_DIG_DVB_C == (MXL661_SIGNAL_MODE_E)AppMode)
        ||(MXL661_DIG_ISDBT_ATSC == (MXL661_SIGNAL_MODE_E)AppMode)
        ||(MXL661_DIG_DVB_T_DTMB == (MXL661_SIGNAL_MODE_E)AppMode)
        ||(MXL661_DIG_J83B == (MXL661_SIGNAL_MODE_E)AppMode))
    {
        apiCmd.MxLIf.cmdIfOutCfg.ManualFreqSet = MXL_DISABLE;
    }
    else
    {
        apiCmd.MxLIf.cmdIfOutCfg.ManualFreqSet = MXL_ENABLE;
    }
    HI_INFO_TUNER("ManualFreqSet:%d.\n",apiCmd.MxLIf.cmdIfOutCfg.ManualFreqSet);

  apiCmd.MxLIf.cmdIfOutCfg.ManualIFOutFreqInKHz = s_u32Mxl661IFFreqKHz;
  status = MxLWare661_API_ConfigDevice(&apiCmd);
  if(status != MXL_TRUE)
  {
    HI_ERR_TUNER("status:%d.\n", status);
    HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    return;
  }

  // AGC Setting
  {
      apiCmd.commandId = MXL661_TUNER_AGC_CFG;
      apiCmd.MxLIf.cmdAgcSetCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;

      if(MXL661_DIG_DVB_T_DTMB == (MXL661_SIGNAL_MODE_E)AppMode)
      {
          apiCmd.MxLIf.cmdAgcSetCfg.AgcSel = MxL661_Default_Set.DTMB_DVB_T_AgcSel;
      }
      else
      {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcSel = MxL661_Default_Set.ATV_DVB_C_AgcSel;
      }

      if((MXL661_SIGNAL_MODE_E)AppMode <= MXL661_ANA_SECAM_L)
      {
          apiCmd.MxLIf.cmdAgcSetCfg.AgcType = MXL661_AGC_SELF;
          HI_INFO_TUNER("AgcType:%d.\n",apiCmd.MxLIf.cmdAgcSetCfg.AgcType);
      }
      else
      {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcType = MxL661_Default_Set.AgcType;//MXL661_AGC_EXTERNAL
      }

     apiCmd.MxLIf.cmdAgcSetCfg.SetPoint = MxL661_Default_Set.AgcSetPoint;
     apiCmd.MxLIf.cmdAgcSetCfg.AgcPolarityInverstion = MXL_DISABLE;
  }

    if (s_stTunerAttr.enDemodDevType == HI_UNF_DEMOD_DEV_TYPE_3137)
    {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcSel = MXL661_AGC1;
    }

//#ifdef CUSTOM_TUNER_IF_AGC
#if 0
    if(HI_CUSTOM_TUNER_IF_AGC1 == CUSTOM_TUNER_IF_AGC)
    {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcSel = MXL661_AGC1;
    }
    else if(HI_CUSTOM_TUNER_IF_AGC2 == CUSTOM_TUNER_IF_AGC)
    {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcSel = MXL661_AGC2;
    }
    else
    {
        HI_ERR_TUNER(CUSTOM_TUNER_IF_AGC);
    }
#endif
    HI_INFO_TUNER("AgcSel:%d.\n",apiCmd.MxLIf.cmdAgcSetCfg.AgcSel);

//#ifdef CUSTOM_TUNER_AGC_TYPE
#if 0
    if(HI_CUSTOM_TUNER_AGC_SELF == CUSTOM_TUNER_AGC_TYPE)
    {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcType = MXL661_AGC_SELF;
    }
    else if(HI_CUSTOM_TUNER_AGC_EXTERNAL == CUSTOM_TUNER_AGC_TYPE)
    {
        apiCmd.MxLIf.cmdAgcSetCfg.AgcType = MXL661_AGC_EXTERNAL;
    }
    else
    {
        HI_ERR_PrintU32(CUSTOM_TUNER_AGC_TYPE);
    }
#endif
    HI_INFO_TUNER("AgcType:%d.\n",apiCmd.MxLIf.cmdAgcSetCfg.AgcType);

    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(status != MXL_TRUE)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return;
    }

  // Application Mode setting
  apiCmd.commandId = MXL661_TUNER_MODE_CFG;
  apiCmd.MxLIf.cmdModeCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdModeCfg.SignalMode = (MXL661_SIGNAL_MODE_E)AppMode;
  //apiCmd.MxLIf.cmdModeCfg.IFOutFreqinKHz = IFAbsFreqInKHz[IFFreqSel];
  apiCmd.MxLIf.cmdModeCfg.IFOutFreqinKHz = s_u32Mxl661IFFreqKHz;
  apiCmd.MxLIf.cmdModeCfg.XtalFreqSel = MxL661_Default_Set.XtalFreqSel;
  apiCmd.MxLIf.cmdModeCfg.IFOutGainLevel = MxL661_Default_Set.IFGain;
  status = MxLWare661_API_ConfigTuner(&apiCmd);
  if(status != MXL_TRUE)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return;
  }

    apiCmd.commandId = MXL661_TUNER_CHAN_TUNE_CFG;
    apiCmd.MxLIf.cmdChanTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdChanTuneCfg.TuneType = MXL661_VIEW_MODE;
    apiCmd.MxLIf.cmdChanTuneCfg.BandWidth = e_u8Mxl661BandWidth;
    apiCmd.MxLIf.cmdChanTuneCfg.FreqInHz =  107250000;
    apiCmd.MxLIf.cmdChanTuneCfg.SignalMode = e_u8Mxl661AppMode;
    apiCmd.MxLIf.cmdChanTuneCfg.XtalFreqSel = MxL661_Default_Set.XtalFreqSel;
    apiCmd.MxLIf.cmdChanTuneCfg.IFOutFreqinKHz = s_u32Mxl661IFFreqKHz;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    }

    // Sequencer setting, disable tune
    apiCmd.commandId = MXL661_TUNER_START_TUNE_CFG;
    apiCmd.MxLIf.cmdStartTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdStartTuneCfg.StartTune = MXL_DISABLE;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    }

    // Sequencer setting, enable tune
    apiCmd.commandId = MXL661_TUNER_START_TUNE_CFG;
    apiCmd.MxLIf.cmdStartTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdStartTuneCfg.StartTune = MXL_ENABLE;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    }
}

void MxL661_API_GetLockStatus(UINT8* RfLock, UINT8* RefLock)
{
  MXL661_COMMAND_T apiCmd;

  // Read back Tuner lock status
  apiCmd.commandId = MXL661_TUNER_LOCK_STATUS_REQ;
  apiCmd.MxLIf.cmdTunerLockReq.I2cSlaveAddr = s_u32Mxl661I2cAddr;

  if (MXL_TRUE == MxLWare661_API_GetTunerStatus(&apiCmd))
  {
       *RfLock = apiCmd.MxLIf.cmdTunerLockReq.RfSynLock;
       *RefLock = apiCmd.MxLIf.cmdTunerLockReq.RefSynLock;
  }
  return;
}

void MxL661_API_ATV_Finetune(MXL_BOOL ScaleUp )
{
  MXL_STATUS status;
  MXL661_COMMAND_T apiCmd;

  apiCmd.commandId = MXL661_TUNER_ENABLE_FINE_TUNE_CFG;
  apiCmd.MxLIf.cmdEnableFineTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdEnableFineTuneCfg.EnableFineTune  = MXL_ENABLE;
  status = MxLWare661_API_ConfigTuner(&apiCmd);
  if(status != MXL_TRUE)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
  }
  apiCmd.commandId = MXL661_TUNER_FINE_TUNE_CFG;
  apiCmd.MxLIf.cmdFineTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdFineTuneCfg.ScaleUp = ScaleUp;
  status = MxLWare661_API_ConfigTuner(&apiCmd);
  if(status != MXL_TRUE)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
  }
  return;
}

HI_S32 MXL661_Init(HI_U8 u8I2cChannel, HI_U32 u32Addr)
{
  MXL_STATUS status = MXL_FALSE;
  MXL661_COMMAND_T apiCmd= {0}; ;

  HI_INFO_TUNER("u8I2cChannel:%d.\n",u8I2cChannel);
  HI_INFO_TUNER("u32Addr:%d.\n",u32Addr);

  s_u32Mxl661I2cAddr = u32Addr;
  s_u8Mxl661I2cChannel = u8I2cChannel;
   if (HI_TRUE == bTunerMxl661Inited)
  {
        return HI_SUCCESS;
  }

  // Soft Reset MxL661
  apiCmd.commandId = MXL661_DEV_SOFT_RESET_CFG;
  apiCmd.MxLIf.cmdResetCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  status = MxLWare661_API_ConfigDevice(&apiCmd);
  if(MXL_TRUE != status)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        goto TUNER_CLOSE;
  }
  // Overwrite Default
  apiCmd.commandId = MXL661_DEV_OVERWRITE_DEFAULT_CFG;
  apiCmd.MxLIf.cmdOverwriteDefault.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdOverwriteDefault.SingleSupply_3_3V = MxL661_Default_Set.Single_3_3_v_Supply;
  status = MxLWare661_API_ConfigDevice(&apiCmd);
  if(MXL_TRUE != status)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
  }



  // Xtal Setting
  apiCmd.commandId = MXL661_DEV_XTAL_SET_CFG;
  apiCmd.MxLIf.cmdXtalCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdXtalCfg.XtalFreqSel = MxL661_Default_Set.XtalFreqSel;
  apiCmd.MxLIf.cmdXtalCfg.XtalCap = MxL661_Default_Set.XtalCap;
  apiCmd.MxLIf.cmdXtalCfg.ClkOutEnable = MxL661_Default_Set.XtalClkOut;
  apiCmd.MxLIf.cmdXtalCfg.ClkOutDiv = MxL661_Default_Set.XtalClkDiv;
  apiCmd.MxLIf.cmdXtalCfg.SingleSupply_3_3V = MxL661_Default_Set.Single_3_3_v_Supply;
  status = MxLWare661_API_ConfigDevice(&apiCmd);
  if(MXL_TRUE != status)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        goto TUNER_CLOSE;
  }


  // Power up setting
  apiCmd.commandId = MXL661_TUNER_POWER_UP_CFG;
  apiCmd.MxLIf.cmdTunerPoweUpCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
  apiCmd.MxLIf.cmdTunerPoweUpCfg.Enable = MXL_ENABLE;
  status = MxLWare661_API_ConfigTuner(&apiCmd);
  if(MXL_TRUE != status)
  {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        goto TUNER_CLOSE;
  }

  bTunerMxl661Inited = HI_TRUE;
  return HI_SUCCESS;

TUNER_CLOSE:


    return HI_FAILURE;
}

HI_S32 MXL661_DeInit(HI_VOID)
{

    MXL_STATUS status = MXL_FALSE;
    MXL661_COMMAND_T apiCmd;
    // Soft Reset MxL661
    apiCmd.commandId = MXL661_DEV_POWER_MODE_CFG;
    apiCmd.MxLIf.cmdPwrModeCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdPwrModeCfg.PowerMode =  MXL661_PWR_MODE_SLEEP;
    status = MxLWare661_API_ConfigDevice(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    }

    bTunerMxl661Inited = HI_FALSE;

    return HI_SUCCESS;
}

HI_S32 MXL661_SetSystem(HI_U32 u32TunerPort )
{

    UINT8 AppMode = 0;
    MXL_BOOL iSIFInversion = MXL_ENABLE;
    MXL661_IF_FREQ_E IFFreqSel = 0;
    HI_U32 u32FreqIFKHz = 5000;

    IFFreqSel = MXL661_IF_5MHz;

    if (HI_UNF_TUNER_SIG_TYPE_CAB == g_stTunerOps[u32TunerPort].enSigType)
    {
        AppMode = MXL661_DIG_DVB_C;
        e_u8Mxl661BandWidth = MXL661_ANA_TV_DIG_CABLE_BW_8MHz;
        iSIFInversion = MXL_DISABLE;
    }
    else if (HI_UNF_TUNER_SIG_TYPE_J83B == g_stTunerOps[u32TunerPort].enSigType)
    {
        AppMode = MXL661_DIG_J83B;
        e_u8Mxl661BandWidth = MXL661_DIG_TERR_BW_6MHz;
        iSIFInversion = MXL_DISABLE;
    }
    else if ((HI_UNF_TUNER_SIG_TYPE_DVB_T == g_stTunerOps[u32TunerPort].enSigType)
            || (HI_UNF_TUNER_SIG_TYPE_DVB_T2 == g_stTunerOps[u32TunerPort].enSigType))
    {
        switch(g_stTunerOps[u32TunerPort].stCurrPara.unSRBW.u32BandWidth)
        {
            case 6000:
                AppMode = MXL661_DIG_DVB_T_DTMB;
                e_u8Mxl661BandWidth = MXL661_DIG_TERR_BW_6MHz;
                break;
            case 7000:
                AppMode = MXL661_DIG_DVB_T_DTMB;
                e_u8Mxl661BandWidth = MXL661_DIG_TERR_BW_7MHz;
                break;
            case 8000:
                AppMode = MXL661_DIG_DVB_T_DTMB;
                e_u8Mxl661BandWidth = MXL661_DIG_TERR_BW_8MHz;
                break;
            default:
                break;
        }
    }
    else if (HI_UNF_TUNER_SIG_TYPE_ISDB_T == g_stTunerOps[u32TunerPort].enSigType)
    {
        AppMode = MXL661_DIG_ISDBT_ATSC;
        e_u8Mxl661BandWidth = MXL661_DIG_TERR_BW_6MHz;
    }

    // Set appllication mode and related IF out, AGC setting parameters
    s_u32Mxl661IFFreqKHz = u32FreqIFKHz;
    e_u8Mxl661AppMode = (MXL661_SIGNAL_MODE_E)AppMode;

    MxL661_API_SetAppMode(AppMode,IFFreqSel,iSIFInversion);

    bTunerMxl661SetRF = 0;

    return HI_SUCCESS;
}

HI_S32 MXL661_SetFreq(HI_U32 u32Freq)
{

    MXL_STATUS status;
    MXL661_COMMAND_T apiCmd;
    HI_S32 u32Temp = u32Freq*1000;
    UINT8 RfLock = 0, RefLock = 0;

    HI_INFO_TUNER("u32Freq:%d.\n",u32Freq);

    // Channel frequency & bandwidth setting
    apiCmd.commandId = MXL661_TUNER_CHAN_TUNE_CFG;
    apiCmd.MxLIf.cmdChanTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdChanTuneCfg.TuneType = MXL661_VIEW_MODE;
    apiCmd.MxLIf.cmdChanTuneCfg.BandWidth = e_u8Mxl661BandWidth;
    apiCmd.MxLIf.cmdChanTuneCfg.FreqInHz =  u32Temp;
    apiCmd.MxLIf.cmdChanTuneCfg.SignalMode = e_u8Mxl661AppMode;
    apiCmd.MxLIf.cmdChanTuneCfg.XtalFreqSel = MxL661_Default_Set.XtalFreqSel;
    apiCmd.MxLIf.cmdChanTuneCfg.IFOutFreqinKHz = s_u32Mxl661IFFreqKHz;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return HI_FAILURE;
    }

    // For debug test aim, enable Tuner AFC feature  06/09
    apiCmd.commandId = MXL661_TUNER_AFC_CFG;
    apiCmd.MxLIf.cmdAfcCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdAfcCfg.AfcRangeInKHz = MXL661_AFC_DEFAULT;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
     {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return HI_FAILURE;
     }

    // Sequencer setting, disable tune
    apiCmd.commandId = MXL661_TUNER_START_TUNE_CFG;
    apiCmd.MxLIf.cmdStartTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdStartTuneCfg.StartTune = MXL_DISABLE;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return HI_FAILURE;
    }

    // Sequencer setting, enable tune
    apiCmd.commandId = MXL661_TUNER_START_TUNE_CFG;
    apiCmd.MxLIf.cmdStartTuneCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdStartTuneCfg.StartTune = MXL_ENABLE;
    status = MxLWare661_API_ConfigTuner(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
        return HI_FAILURE;
    }
    //MxL661_Default_Set.BandWidth = BandWidthInMHz;
    MxL661_Default_Set.BandWidth = e_u8Mxl661BandWidth;

    #if 1
    // Inquire Tuner lock status
    MxL661_API_GetLockStatus(&RfLock, &RefLock);
    if ((MXL_LOCKED == RfLock) && (MXL_LOCKED == RefLock))
    {
        HI_INFO_TUNER("mxl661 locked.\n");
    }
    else
    {
        HI_INFO_TUNER("mxl661 unlocked!!!\n");
    }
    #endif

    return HI_SUCCESS;
}

HI_VOID MXL661_Resume(HI_VOID)
{

    MXL_STATUS status;
    MXL661_COMMAND_T apiCmd;
    apiCmd.commandId = MXL661_DEV_POWER_MODE_CFG;
    apiCmd.MxLIf.cmdPwrModeCfg.I2cSlaveAddr = s_u32Mxl661I2cAddr;
    apiCmd.MxLIf.cmdPwrModeCfg.PowerMode =  MXL661_PWR_MODE_ACTIVE;
    status = MxLWare661_API_ConfigDevice(&apiCmd);
    if(MXL_TRUE != status)
    {
        HI_ERR_TUNER("status:%d.\n", status);
        HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
    }
}

HI_S32 MXL661_GetSignalStrength(HI_U32 *pu32SignalStrength)
{
      MXL_STATUS status;
      MXL661_COMMAND_T apiCmd;

        HI_INFO_TUNER("MXL661_GetSignalStrength.\n");

      apiCmd.commandId = MXL661_TUNER_RX_PWR_REQ;
      apiCmd.MxLIf.cmdTunerPwrReq.I2cSlaveAddr = s_u32Mxl661I2cAddr;
      status = MxLWare661_API_GetTunerStatus(&apiCmd);
      if(MXL_TRUE != status)
      {
            HI_ERR_TUNER("status:%d.\n", status);
            HI_ERR_TUNER("commandId:%d.\n",apiCmd.commandId);
            return HI_FAILURE;
      }
      else
      {
         pu32SignalStrength[1] = (HI_U32)((apiCmd.MxLIf.cmdTunerPwrReq.RxPwr)/100 + 107);
      }

        HI_INFO_TUNER("SignalStrength:%d.\n",pu32SignalStrength[1]);

      return HI_SUCCESS;
}

HI_S32 MXL661_GetPif(HI_U32 *pu32Pif)
{
    if (NULL == pu32Pif)
    {
        HI_ERR_TUNER("Null pointer!\n");
        return HI_FAILURE;
    }

    *pu32Pif = 0;

    return HI_SUCCESS;
}

HI_S32 MXL661_SetTopAdjust(HI_U32 u32Top)
{
    return HI_SUCCESS;
}

HI_S32 MXL661_SetFineTune(HI_S8 s8Step)
{

    MXL_BOOL ScaleUp = MXL_FINE_TUNE_STEP_DOWN;
    if(s8Step > 0)
    {
        ScaleUp = MXL_FINE_TUNE_STEP_UP;
    }
    else
    {
        ScaleUp = MXL_FINE_TUNE_STEP_DOWN;
    }

    MxL661_API_ATV_Finetune( ScaleUp);

    return HI_SUCCESS;
}

HI_BOOL MXL661_CheckTunerChipID(HI_VOID)
{
    MXL661_COMMAND_T ParamPtr;

    ParamPtr.commandId = MXL661_DEV_ID_VERSION_REQ;
    ParamPtr.MxLIf.cmdDevInfoReq.I2cSlaveAddr = s_u32Mxl661I2cAddr;

    return MxLWare661_API_GetDeviceStatus(&ParamPtr);
}

HI_S32 mxl661_init_tuner(HI_U32 u32TunerPort)
{
    MXL661_Init(g_stTunerOps[u32TunerPort].enI2cChannel, g_stTunerOps[u32TunerPort].u32TunerAddress);
    return HI_SUCCESS;
}

HI_S32 mxl661_set_tuner(HI_U32 u32TunerPort, HI_U8 i2c_channel, HI_U32 puRF)
{
    MXL661_SetSystem(u32TunerPort);

    MXL661_SetFreq(puRF);

    return HI_SUCCESS;
}

HI_S32 mxl661_get_signal_strength(HI_U32 u32TunerPort, HI_U32 * pu32strength)
{
    MXL661_GetSignalStrength(pu32strength);

    return HI_SUCCESS;
}


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */


