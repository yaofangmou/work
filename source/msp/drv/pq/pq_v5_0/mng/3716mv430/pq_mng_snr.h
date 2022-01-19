/******************************************************************************
*
* Copyright (C) 2015 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_snr.c
  Version       : Initial Draft
  Author        : sdk
  Created       : 2015/10/19
  Description   :

******************************************************************************/

#ifndef __PQ_MNG_SNR_H__
#define __PQ_MNG_SNR_H__

#include "drv_pq_comm.h"
#include "pq_hal_snr.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

HI_S32 PQ_MNG_RegisterSNR(PQ_REG_TYPE_E  enType);

HI_S32 PQ_MNG_UnRegisterSNR(HI_VOID);

HI_S32 PQ_MNG_SetToolSnrMotiongLut(HI_PQ_SNR_MOTIONEDGE_LUT_S *pstLut);

HI_S32 PQ_MNG_GetToolSnrMotiongLut(HI_PQ_SNR_MOTIONEDGE_LUT_S *pstLut);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif /*End of #ifndef __MNG_PQ_NR_H__ */



