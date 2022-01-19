/******************************************************************************
*
* Copyright (C) 2015 -2016  Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

 File Name    : pq_hal_tnr.h
 Version        : Initial Draft
 Author         : sdk
 Created       : 2016/05/25
 Description   :
******************************************************************************/
#ifndef __PQ_HAL_TNR_H__
#define __PQ_HAL_TNR_H__

#include "drv_pq_ext.h"
#include "drv_pq_comm.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/* tnr demo mode */
typedef enum
{
    TNR_DEMO_ENABLE_R = 0,
    TNR_DEMO_ENABLE_L
} TNR_DEMO_MODE_E;

typedef struct hiALG_TNR_S
{
    HI_BOOL     bInit;
    HI_BOOL     bEnable;
    HI_U32      u32Strength;
    HI_BOOL     bDemoEnable;
    PQ_DEMO_MODE_E eDemoMode;
    HI_U32      u32DemoPos;
} ALG_TNR_S;


HI_S32 PQ_HAL_SetTnrStr(HI_U32 u32HandleNo, HI_U32 u32TnrStr);

HI_S32 PQ_HAL_EnableTNR(HI_U32 u32HandleNo, HI_BOOL bNROnOff);

HI_S32 PQ_HAL_EnableTNRDemo(HI_U32 u32HandleNo, HI_BOOL bTNRDemoEn);

HI_S32 PQ_HAL_SetTNRDemoMode(HI_U32 u32HandleNo, PQ_DEMO_MODE_E enMode);

HI_S32 PQ_HAL_SetTnrDemoModeCoor(HI_U32 u32HandleNo, HI_U32 u32XPos);

HI_S32 PQ_HAL_SetTNRBlendingAlphaLut(HI_U32 u32HandleNo);

HI_S32 PQ_HAL_ResetTnrStatus(HI_U32 u32HandleNo, ALG_TNR_S *pstPQTNRInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif

