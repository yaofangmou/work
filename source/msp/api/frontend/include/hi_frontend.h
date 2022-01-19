#ifndef __HI_FRONTEND_H__
#define __HI_FRONTEND_H__

#include "hi_type.h"
#include "hi_common.h"
#include "hi_mpi_mem.h"
#include "hi_unf_frontend.h"

#define QAM_RF_MIN 45000  /*kHz*/
#define QAM_RF_MAX 870000 /*kHz*/
#define TER_RF_MIN 48000  //kHz
#define TER_RF_MAX 870000 //kHz
#define TER_BW_MIN 1700  //KHz
#define TER_BW_MAX 10000 //KHz
#define     PI     3.14159265
#define UNF_TUNER_NUM 8

#define MAX_BLINDSCAN_TIMES (4)

#define SAT_C_MIN (3000)
#define SAT_C_MAX (4200)
#define SAT_KU_MIN (10600)
#define SAT_KU_MAX (12750)
#define SAT_KA_MIN (17300)
#define SAT_KA_MAX (22200)
#define SAT_IF_MIN_KHZ (950000)
#define SAT_IF_MAX_KHZ (2150000)
#define SAT_C_MIN_KHZ (3000000)
#define SAT_C_MAX_KHZ (4200000)
#define SAT_KU_MIN_KHZ (10600000)
#define SAT_KU_MAX_KHZ (12750000)
#define SAT_KA_MIN_KHZ (17300000)
#define SAT_KA_MAX_KHZ (22200000)

#define SAT_SYMBOLRATE_MAX (60000000)//(45000000)

#define SAT_IF_MIN (950)
#define SAT_IF_MAX (2150)
#define SAT_IF_C_H_MIN (1550)
#define SAT_IF_C_H_MAX (2150)
#define SAT_IF_C_L_MIN (950)
#define SAT_IF_C_L_MAX (1550)
//#define SAT_IF_KU_H_MIN_1 (1100)
//#define SAT_IF_KU_H_MAX_1 (2150)
//#define SAT_IF_KU_H_MIN_2 (950)
//#define SAT_IF_KU_H_MAX_2 (2000)
//#define SAT_IF_KU_L_MIN (950)
//#define SAT_IF_KU_L_MAX (1950)

#define SAT_LO_C_L (5150)
#define SAT_LO_C_H (5750)
//#define SAT_LO_KU_L_1 (9750)
//#define SAT_LO_KU_H_1 (10600)
//#define SAT_LO_KU_L_2 (9750)
//#define SAT_LO_KU_H_2 (10750)

#define ABSS_SYMBOLRATE_MAX (43200000)

#define SPEC_RF_START_KHZ (1000) /*Hz,1kHz*/
#define SPEC_RF_END_KHZ (1300000000) /*Hz,1.3GHz*/
#define SPEC_RF_STEP_MIN_KHZ (10000) /*Hz,10kHz*/


#define SAT_DOWNLINK_FREQ_KU_MID (11700)
#define SAT_DOWNLINK_AB_FREQ_KA_MID (18588)
#define SAT_DOWNLINK_AEB_FREQ_KA_MID (18950)
#define SAT_DOWNLINK_BC_FREQ_KA_MID (20200)
#define SAT_DOWNLINK_FREQ_KA_TRIPLE_MIN_KHZ (17300)
#define SAT_DOWNLINK_FREQ_KA_TRIPLE_MAX_KHZ (20200)
#define SAT_DOWNLINK_FREQ_KA_TRIPLE_MID0 (18300)
#define SAT_DOWNLINK_FREQ_KA_TRIPLE_MID1 (19300)

#define DISEQC_DELAY_TIME_MS (15)

#define T2_GROUP_SUM            (16)
#define NORDIG_SQI_SSI  (0)

#define GET_REFER_SNR(ref, array, FECRate) \
    { \
        HI_U32 i = 0; \
        for (i = 0; i < sizeof(array) / sizeof(TUNER_REFER_SNR_S); i++) \
        { \
            if (array[i].enFECRate == FECRate) \
            { \
                ref = array[i].u8ReferSNR; \
            } \
        } \
    }

#define     CONFLICT_CHECK              (1)
#define     HI_UNICABLE_OUTPUT_PRINT    (1)
#if HI_UNICABLE_OUTPUT_PRINT
#define     HI_UNICABLE_TRACE(...)       printf(__VA_ARGS__)
#else
#define     HI_UNICABLE_TRACE(...)
#endif

typedef struct
{
    HI_U32                        u32Port;
    HI_UNF_TUNER_BLINDSCAN_PARA_S stPara;
} BLINDSCAN_PARA_S;

typedef struct
{
    HI_UNF_TUNER_FE_LNB_22K_E      enLNB22K;
    HI_UNF_TUNER_FE_POLARIZATION_E enPolar;
    HI_U16                         u16StartFreq; /* MHz */
    HI_U16                         u16StopFreq;  /* MHz */
} BLINDSCAN_CONDITION_T;

typedef struct
{
    HI_U32                u32ScanTimes;
    BLINDSCAN_CONDITION_T astScanCond[MAX_BLINDSCAN_TIMES];
} BLINDSCAN_CTRL_T;

typedef struct
{
    HI_UNF_TUNER_FE_LNB_CONFIG_S     stLNBConfig;/* LNB configuration */
    HI_UNF_TUNER_FE_LNB_POWER_E     enLNBPower; /* LNB power */
    HI_UNF_TUNER_FE_POLARIZATION_E  enPolar;    /* LNB polarization */
    HI_UNF_TUNER_FE_LNB_22K_E       enLNB22K;   /* LNB 22K on or off */
    pthread_t*                      pBlindScanMonitor; /* Blind scan thread */
    //pthread_t*                      pConnectMonitor; /* connect thread using while the symbol rate is low*/
    HI_BOOL                         bBlindScanStop; /* Blind scan stop flag */
    HI_BOOL                         bBlindScanBusy; /* Blind scan stop flag */
    //HI_BOOL                         bConnectStop; /* Blind scan stop flag */
    //HI_UNF_TUNER_SWITCH_22K_E       enSavedSwitch22K;
    HI_UNF_TUNER_SWITCH_22K_E       enSwitch22K;
    HI_UNF_TUNER_SWITCH_TONEBURST_E enToneBurst;
} TUNER_STATUS_SAT_S;

typedef struct
{
    HI_U16 u16SignalLevel;
    HI_S16 s16SignalDBUV;
} TUNER_SIGNAL_LEVEL_SAT_S;

typedef struct
{
    HI_UNF_TUNER_TER_ANTENNA_POWER_E enAntennaPower;
}TUNER_STATUS_TERR_S;

extern TUNER_STATUS_SAT_S s_stSatPara[UNF_TUNER_NUM];
extern HI_S32  s_s32TunerFd;
extern HI_S32 TUNER_DISEQC_Stop22K(HI_U32 u32TunerId);
extern HI_S32 TUNER_DISEQC_Resume22K(HI_U32 u32TunerId);
//extern HI_S32 TUNER_SetLnbOutLevel(HI_U32 u32TunerId, TUNER_LNB_OUT_E enOut);
extern HI_UNF_TUNER_SWITCH_TONEBURST_E TUNER_DISEQC_GetToneBurstStatus(HI_U32 u32TunerId);
extern HI_S32 UNICABLE_DISEQC_SendRecvMessage(HI_U32 u32TunerId,
                                           const HI_UNF_TUNER_DISEQC_SENDMSG_S * pstSendMsg,
                                           HI_UNF_TUNER_DISEQC_RECVMSG_S * pstRecvMsg);

HI_S32 UNIC2_Scan(HI_U32 u32TunerId);
HI_S32 UNIC2_Avail(HI_U32 u32TunerId);
HI_S32 UNIC2_SwitchONAll(HI_U32 u32TunerId);
HI_S32 UNIC2_SwitchOffAll(HI_U32 u32TunerId,HI_U8 u8Switches);
HI_S32 UNIC2_ChanChange(HI_U32 u32TunerId, HI_U32 u32Freq_MHz, HI_UNF_TUNER_FE_POLARIZATION_E enPolar);
HI_U32 UNIC2_rand(void);

#endif

