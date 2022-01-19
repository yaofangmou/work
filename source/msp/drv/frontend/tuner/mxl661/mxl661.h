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

#ifndef __DRV_FE_ADP_TUNER_MXL661_H__
#define __DRV_FE_ADP_TUNER_MXL661_H__

#include "hi_type.h"
#include "hi_osal.h"
#include "hi_unf_frontend.h"

#ifdef __cplusplus
 #if __cplusplus
        extern "C" {
 #endif
#endif /* __cplusplus */
extern HI_U32               s_u8Mxl661I2cChannel;
extern HI_U32               s_u32Mxl661I2cAddr;
extern  I2C_EXT_FUNC_S       *s_pstMxl661I2cFunc;
extern GPIO_EXT_FUNC_S      *s_pstMxl661GpioFunc;
extern GPIO_I2C_EXT_FUNC_S  *s_pstMxl661GpioI2cFunc;

extern HI_S32 mxl661_init_tuner(HI_U32 u32TunerPort);
extern HI_S32 mxl661_set_tuner(HI_U32 u32TunerPort, HI_U8 i2c_channel, HI_U32 puRF);
extern HI_S32 mxl661_get_signal_strength(HI_U32 u32TunerPort, HI_U32 * pu32strength);

#ifdef __cplusplus
 #if __cplusplus
    }
 #endif
#endif /* __cplusplus */

#endif
