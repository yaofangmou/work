/******************************************************************************

Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : hal_klad.h
Version       : Initial draft
Author        : Hisilicon hisecurity team
Created       : 2016-12-08
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __HAL_KLAD_H__
#define __HAL_KLAD_H__

#include "hi_type.h"
#include "hi_debug.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */


#define HI_FATAL_KLAD(fmt...)    HI_FATAL_PRINT(HI_ID_CA, fmt)
#define HI_ERR_KLAD(fmt...)      HI_ERR_PRINT(HI_ID_CA, fmt)
#define HI_WARN_KLAD(fmt...)     HI_WARN_PRINT(HI_ID_CA, fmt)
#define HI_INFO_KLAD(fmt...)     HI_INFO_PRINT(HI_ID_CA, fmt)
#define HI_DEBUG_KLAD(fmt...)    HI_DBG_PRINT(HI_ID_CA, fmt)

HI_VOID HAL_KLAD_RegisterMap(void);

HI_VOID HAL_KLAD_RegisterUnMap(void);

HI_VOID HAL_KLAD_WriteReg(HI_U32 addr, HI_U32 val);

HI_U32 HAL_KLAD_ReadReg(HI_U32 addr);

HI_U8 HAL_KLAD_ReadOtpShadowByte(HI_U32 addr);

HI_S32 HAL_KLAD_ProcReadOtpShadowReg(HI_U32 addr, HI_U32 *value);

HI_S32 HAL_KLAD_ProcReadOtpShadowByte(HI_U32 addr, HI_U8 *value);

HI_S32 HAL_KLAD_ProcWriteOtpShadowReg(HI_U32 addr, HI_U32 value);

HI_S32 HAL_KLAD_CheckState(HI_VOID);

HI_VOID HAL_KLAD_SetDataIn(HI_U8 *data);

HI_VOID HAL_KLAD_SetComDataIn(HI_U8 *data);

HI_S32 HAL_KLAD_HWEnable(HI_VOID);

#if (defined(CHIP_TYPE_hi3716mv430))
HI_VOID HAL_KLAD_SetAddr(HI_U8 addr, HI_U8 odd);
#endif

#ifdef HI_KLAD_INT_SUPPORT
HI_VOID HAL_KLAD_IntEn(HI_VOID);
HI_VOID HAL_KLAD_IntDis(HI_VOID);
HI_VOID HAL_KLAD_IntClr(HI_VOID);
HI_U32 HAL_KLAD_GetIntSta(HI_VOID);
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HAL_KLAD_H__ */
