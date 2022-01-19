/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_mng_mcnr.h
  Version       : Initial Draft
  Author        : sdk
  Created       : 2016/07/18
  Description   :

******************************************************************************/
#ifndef __PQ_MNG_MCNR_H__
#define __PQ_MNG_MCNR_H__

#include "hi_type.h"
#include "pq_hal_mcnr.h"
#include "drv_pq_ext.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#define PQ_MCNR_SPLIT_WTH 384
#define PQ_MCNR_RGMV_WTH  64
#define PQ_MCNR_ALIGN_8BIT_YSTRIDE(x)  HI_SYS_GET_STRIDE(x)


//HI_S32 PQ_MNG_UpdateMCNRCfg(HI_PQ_WBC_INFO_S *pstVpssWbcInfo);
HI_S32 PQ_MNG_RefreshMcnrCfg(HI_PQ_FRAME_INFO_S *pstPqFrameInfo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo);

HI_S32 PQ_MNG_SetMCNREn(HI_BOOL bOnOff);

HI_S32 PQ_MNG_GetMCNREn(HI_BOOL *pbOnOff);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif /*End of #ifndef __PQ_MNG_MCNR_H__ */



