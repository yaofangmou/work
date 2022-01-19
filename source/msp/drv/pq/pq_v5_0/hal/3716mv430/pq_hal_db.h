/******************************************************************************
*
* Copyright (C) 2016 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************

  File Name     : pq_hal_db.h
  Version       : Initial Draft
  Author        :
  Created       : 2015/10/09
  Description   : De-blocking

******************************************************************************/
#ifndef __PQ_HAL_DB_H__
#define __PQ_HAL_DB_H__

#include "hi_type.h"
#include "pq_hal_comm.h"
#include "pq_mng_db_alg.h"
#include "drv_pq_ext.h"
#include "drv_pq_comm.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

/* dbm demo mode */
typedef enum
{
    DBM_DEMO_ENABLE_R = 0, /* Enable Left process for reg design different */
    DBM_DEMO_ENABLE_L    ,
    DBM_DEMO_BUTT
} DBM_DEMO_MODE_E;

typedef struct hiALG_DB_S
{
    HI_BOOL     bInit;
    HI_BOOL     bEnable;
    HI_U32      u32Strength;
    HI_BOOL     bDemoEnable;
    PQ_DEMO_MODE_E eDemoMode;
    HI_U32      u32DemoPos;
} ALG_DB_S;

HI_S32 PQ_HAL_SetDBStrengh(HI_U32 u32HandleNo, HI_U32 u32Strength);

HI_S32 PQ_HAL_EnableDB(HI_U32 u32Data, HI_BOOL bOnOff);
HI_S32 PQ_HAL_EnableDBDemo(HI_U32 u32Data, HI_BOOL bOnOff);
HI_S32 PQ_HAL_SetDbmDemoMode(HI_U32 u32Data, PQ_DEMO_MODE_E enMode);

HI_S32 PQ_HAL_DBDemoPos(HI_U32 u32HandleNo, HI_U32 u32DBDemoPos);
HI_S32 PQ_HAL_ResetDbStatus(HI_U32 u32HandleNo, ALG_DB_S *pstPQDbInfo, S_VPSSIP_ALG_SET_REGS_TYPE *pstVpssAlgRegOut);

HI_S32 PQ_HAL_GetDbDrvInFromReg(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DB_REG_IN_S *pstRegIn);
HI_S32 PQ_HAL_SetDbRegFromRegout(HI_U32 u32HandleNo, HI_PQ_VPSS_REG_INFO_S *pstVpssRegInfo, DB_REG_OUT_S *pstRegOut);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif



