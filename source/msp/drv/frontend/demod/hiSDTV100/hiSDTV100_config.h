/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2018/07/05
  Description   :
  History       :
  1.Date        : 2018/07/05
    Modification: Created file
******************************************************************************/
#ifndef __HIMDTV_CONFIG_H__
#define __HIMDTV_CONFIG_H__

#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

/*fpga--start*/
    //#define HISDTV100_TUNER_AGC_EXTERN_DISABLE

/*fpga--end*/

/*chip support signal standard--start*/
//#define HISDTV100_TER_SUPPORT  /* defined in Makefile */
//#define HISDTV100_CAB_SUPPORT  /* defined in Makefile */
//#define HISDTV100_SAT_SUPPORT  /* defined in Makefile */

#ifdef HISDTV100_TER_SUPPORT
    //#define HISDTV100_SUPPORT_DTMB
    //#define HISDTV100_SUPPORT_DVBT
    #define HISDTV100_SUPPORT_DVBT2
    //#define HISDTV100_SUPPORT_ATSC1_0
    //#define HISDTV100_SUPPORT_ATSC3_0
    #define HISDTV100_SUPPORT_ISDBT
#endif

#ifdef HISDTV100_CAB_SUPPORT
    #define HISDTV100_SUPPORT_DVBC
    //#define HISDTV100_SUPPORT_DVBC2
    #define HISDTV100_SUPPORT_J83B
#endif

#ifdef HISDTV100_SAT_SUPPORT
    #define HISDTV100_SUPPORT_DVBS
    #define HISDTV100_SUPPORT_DVBS2
    #define HISDTV100_SUPPORT_DVBS2X
    //#define HISDTV100_SUPPORT_DISEQC_RECV
    #define HISDTV100_SUPPORT_UNICABLE
    //#define HISDTV100_SUPPORT_UNICABLE2
#endif
/*chip support signal standard--end*/

/*tuner configuration--start*/
#define HI_TUNER_IF_PATH (0)
#define HI_TUNER_IF_AGC_PATH (0)
#define HI_TUNER_IF_AGC_EXTERNAL_EN (HI_TRUE)
/*tuner configuration--end*/

/*demod configuration--start*/
#define HI_DEMOD_I2C_CHAN_NUM (3)
#define HI_DEMOD_I2C_DEV_ADDR (0xB8)
/*demod configuration--end*/

/*tuner and demod common configuration--start*/
#define HI_FRONTEND_IF_FREQ_KHZ (5000)
//#define HI_FRONTEND_IF_BANDWITH_KHZ (8000)
#define HI_FRONTEND_IF_SPECTRUM_NORMAL_EN (HI_TRUE)
/*tuner and demod common configuration--end*/

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif
