#ifndef __DRV_MCE_BOARDCFG_H__
#define __DRV_MCE_BOARDCFG_H__

#include "hi_type.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TUNER_USE        (0)
#define MCE_TUNER_NUM    (1)


typedef struct hiMCE_TUNER_INFO_s
{
    HI_UNF_TUNER_SIG_TYPE_E   SigType;

    HI_UNF_TUNER_DEV_TYPE_E   TunerType;
    HI_U32                    TunerI2cAddr; /* tuner i2c address,8 bits.*/

    HI_UNF_DEMOD_DEV_TYPE_E   DemodType;
    HI_U32                    DemodI2cAddr; /* demod i2c address,8 bits.*/

    HI_UNF_TUNER_OUPUT_MODE_E DemodOutPutMode;
    HI_BOOL                   DemodRstType;  /* HI_FALSE-internal demod,no need to reset, HI_TRUE-external demod,reset is needed. */
    HI_U32                    DemodRstGpio;  /* the gpio pin to reset demod. for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */

    HI_BOOL                   I2cType;       /* HI_FALSE-use general I2C, HI_TRUE-use GPIOI2C. */
    HI_U32                    I2cChNum;      /* general I2C channel. */
    HI_U32                    GpioI2cScl;    /* for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */
    HI_U32                    GpioI2cSda;    /* for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */

    HI_BOOL                   DemodTsOutMode; /* HI_FALSE-use default tsout, HI_TRUE-redefined tsout line by user. */
    HI_UNF_TUNER_OUTPUT_TS_E  DemodOutputTS[11];

    HI_UNF_DMX_PORT_E         DemuxPort;
    HI_UNF_DMX_PORT_TYPE_E    DemuxPortType;
    HI_UNF_DMX_PORT_E         DemuxPortShareClk;
    HI_U32                    DemuxInClk;   /* whether to reverse the phase of clock,0-do not reverse,1-reverse. */
    HI_U32                    DemuxBitSel;  /* in parallel mode, 0-data7 is MSB,1-data0 is MSB.
                                                                              in serial mode,0-data7 is data line, 1-data0 is data line. */

    union
    {
        struct
        {
            HI_U32                         CabDemodClk;    /* KHz,the clock of demod crystal. */
            HI_UNF_TUNER_TS_SERIAL_PIN_E   CabTsSerialPIN;

        }CabAttr;
        struct
        {
            HI_U32                         SatDemodClk;    /* KHz,the clock of demod crystal. */
            HI_UNF_TUNER_TS_SERIAL_PIN_E   SatTsSerialPin;
            HI_U16                         SatTunerMaxLPF; /* MHz,the passband frequency of lowpass filter. */
            HI_U16                         SatTunerI2cClk; /* KHz,the clock of i2c. */
            HI_UNF_TUNER_RFAGC_MODE_E      SatRfAgc;
            HI_UNF_TUNER_IQSPECTRUM_MODE_E SatIQSpectrum;
            HI_UNF_TUNER_TSCLK_POLAR_E     SatTsClkPolar;
            HI_UNF_TUNER_TS_FORMAT_E       SatTsFormat;
            HI_UNF_TUNER_DISEQCWAVE_MODE_E SatDiseqcWave;
            HI_UNF_LNBCTRL_DEV_TYPE_E      SatLnbCtrlDev;
            HI_U16                         SatLnbCtrlDevAddr; /* lnb control device i2c address,8 bits. */
        }SatAttr;
        struct
        {
            HI_U32                         TerDemodeClk;   /* KHz,the clock of demod crystal. */
            HI_UNF_TUNER_TS_SERIAL_PIN_E   TerTsSerialPIN;
            HI_U16                         TerTunerMaxLPF; /* MHz,the passband frequency of lowpass filter. */
            HI_U16                         TerTunerI2CClk; /* KHz,the clock of i2c. */
            HI_UNF_TUNER_RFAGC_MODE_E      TerRfAgc;
            HI_UNF_TUNER_IQSPECTRUM_MODE_E TerIQSpectrum;
            HI_UNF_TUNER_TSCLK_POLAR_E     TerTsClkPolar;
            HI_UNF_TUNER_TS_FORMAT_E       TerTsFormat;
            HI_UNF_TUNER_TS_SYNC_HEAD_E    TerTsSyncHead;
        }TerAttr;
    }additional;
} HI_MCE_TUNER_INFO_S;


/* configure the board information of frontend, used by mce. */
HI_MCE_TUNER_INFO_S mceTunerInfo[MCE_TUNER_NUM]=
    {
        /* tunerinfo0*/
        {
            .SigType         = HI_UNF_TUNER_SIG_TYPE_CAB,
            .TunerType       = HI_UNF_TUNER_DEV_TYPE_TDA18250B,
            .TunerI2cAddr    = 0xc0,

            .DemodType       = HI_UNF_DEMOD_DEV_TYPE_3130E,
            .DemodI2cAddr    = 0xa0,
            .DemodOutPutMode = HI_UNF_TUNER_OUTPUT_MODE_SERIAL,
            .DemodRstType    = HI_TRUE, /* HI_FALSE-no need to reset, HI_TRUE- neet to reset*/
            .DemodRstGpio    = 0,       /* for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */

            .I2cType         = HI_FALSE,/* HI_FALSE-use general I2C, HI_TRUE-use GPIOI2C.  */
            .I2cChNum        = 1,
            .GpioI2cScl      = 0,       /* for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */
            .GpioI2cSda      = 0,       /* for example: GPIO1_4 is 12=1*8+4, GPIO2_5 is 21=2*8+5  */

            .DemodTsOutMode    = HI_FALSE, /* HI_FALSE-use default tsout, HI_TRUE-redefined tsout by user */
            .DemodOutputTS[0]  = HI_UNF_TUNER_OUTPUT_TSDAT0,
            .DemodOutputTS[1]  = HI_UNF_TUNER_OUTPUT_TSDAT1,
            .DemodOutputTS[2]  = HI_UNF_TUNER_OUTPUT_TSDAT2,
            .DemodOutputTS[3]  = HI_UNF_TUNER_OUTPUT_TSDAT3,
            .DemodOutputTS[4]  = HI_UNF_TUNER_OUTPUT_TSDAT4,
            .DemodOutputTS[5]  = HI_UNF_TUNER_OUTPUT_TSDAT5,
            .DemodOutputTS[6]  = HI_UNF_TUNER_OUTPUT_TSDAT6,
            .DemodOutputTS[7]  = HI_UNF_TUNER_OUTPUT_TSDAT7,
            .DemodOutputTS[8]  = HI_UNF_TUNER_OUTPUT_TSSYNC,
            .DemodOutputTS[9]  = HI_UNF_TUNER_OUTPUT_TSVLD,
            .DemodOutputTS[10] = HI_UNF_TUNER_OUTPUT_TSERR,

            .DemuxPort         = HI_UNF_DMX_PORT_TSI_0,
            .DemuxPortType     = HI_UNF_DMX_PORT_TYPE_SERIAL_NOSYNC,
            .DemuxPortShareClk = HI_UNF_DMX_PORT_TSI_0,
            .DemuxInClk        = 0,
            .DemuxBitSel       = 1,

            /* additional attr need to match with signal type. */
            #if 1
            /* cab attr */
            .additional.CabAttr.CabDemodClk    = 24000,
            .additional.CabAttr.CabTsSerialPIN = HI_UNF_TUNER_TS_SERIAL_PIN_0
            #endif
            #if 0
            /* sat attr */
            .additional.SatAttr.SatDemodClk    = 16000,
            .additional.SatAttr.SatTsSerialPin = HI_UNF_TUNER_TS_SERIAL_PIN_0,
            .additional.SatAttr.SatTunerMaxLPF = 34,
            .additional.SatAttr.SatTunerI2cClk = 400,
            .additional.SatAttr.SatRfAgc       = HI_UNF_TUNER_RFAGC_INVERT,
            .additional.SatAttr.SatIQSpectrum  = HI_UNF_TUNER_IQSPECTRUM_NORMAL,
            .additional.SatAttr.SatTsClkPolar  = HI_UNF_TUNER_TSCLK_POLAR_RISING,
            .additional.SatAttr.SatTsFormat    = HI_UNF_TUNER_TS_FORMAT_TS,
            .additional.SatAttr.SatDiseqcWave  = HI_UNF_TUNER_DISEQCWAVE_NORMAL,
            .additional.SatAttr.SatLnbCtrlDev  = 1,
            .additional.SatAttr.SatLnbCtrlDevAddr = 0x0
            #endif
            #if 0
            /* ter attr */
            .additional.TerAttr.TerDemodeClk   = 24000,
            .additional.TerAttr.TerTsSerialPIN = HI_UNF_TUNER_TS_SERIAL_PIN_0,
            .additional.TerAttr.TerTunerMaxLPF = 34,
            .additional.TerAttr.TerTunerI2CClk = 400,
            .additional.TerAttr.TerRfAgc       = HI_UNF_TUNER_RFAGC_INVERT,
            .additional.TerAttr.TerIQSpectrum  = HI_UNF_TUNER_IQSPECTRUM_NORMAL,
            .additional.TerAttr.TerTsClkPolar  = HI_UNF_TUNER_TSCLK_POLAR_RISING,
            .additional.TerAttr.TerTsFormat    = HI_UNF_TUNER_TS_FORMAT_TS,
            .additional.TerAttr.TerTsSyncHead  = HI_UNF_TUNER_TS_SYNC_HEAD_AUTO
            #endif
        }
        /* tunerinfo1*/
    };


#ifdef __cplusplus
}
#endif

#endif

