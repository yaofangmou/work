/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_utiliy.h
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#ifndef __SSA_UTILIY_H__
#define __SSA_UTILIY_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup      SSA_UTILIY */
/** @{ */  /** <!-- [SSA_UTILIY] */


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup      SSA_UTILIY */
/** @{ */  /** <!-- [SSA_UTILIY] */

/****** Enumeration definition ************/

/****** Structure definition **************/

/****** Union definition ******************/

/****** Global variable declaration *******/

/** @} */  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup      SSA_UTILIY */
/** @{ */  /** <!-- [SSA_UTILIY] */
HI_VOID SSA_Reboot(HI_VOID);

HI_VOID SSA_SReset(HI_VOID);

HI_VOID SSA_BootM(HI_U8 *address);

HI_VOID SSA_Go(HI_U8 *address);


/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif /*__SSA_UTILIY_H__*/
