/******************************************************************************

  Copyright (C), 2017-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2017/01/19
  Description   :
  History       :
  1.Date        : 2017/01/19
    Modification: Created file
******************************************************************************/
#ifndef __LNB_TPS65233_H__
#define __LNB_TPS65233_H__



#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

#define TPS65233_CTRL_0 0x00
#define TPS65233_CTRL_1 0x01
#define TPS65233_STATUS 0x02


HI_S32 TPS65233_init(HI_U32 u32TunerPort, HI_U32 u32I2CNum, HI_U8 u8DevAddr, HI_UNF_DEMOD_DEV_TYPE_E enDemodDevType);
HI_S32 TPS65233_standby(HI_U32 u32TunerPort, HI_U32 u32Standby);
HI_S32 TPS65233_set_lnb_out(HI_U32 u32TunerPort, TUNER_LNB_OUT_E enOut);
HI_S32 TPS65233_send_continuous_22K(HI_U32 u32TunerPort, HI_U32 u32Continuous22K);
HI_S32 TPS65233_deinit(HI_U32 u32TunerPort);

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif
