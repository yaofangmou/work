/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_secureos.h
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-09-17
  Description   :
  History       :
  1.Date        : 2018-09-17
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#ifndef __SSA_SECUREOS_H__
#define __SSA_SECUREOS_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup      SSA_SECUREOS */
/** @{ */  /** <!-- [SSA_SECUREOS] */


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup      SSA_SECUREOS */
/** @{ */  /** <!-- [SSA_SECUREOS] */

/****** Enumeration definition ************/

/****** Structure definition **************/


/****** Union definition ******************/

/****** Global variable declaration *******/

/** @} */  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup      SSA_SECUREOS */
/** @{ */  /** <!-- [SSA_SECUREOS] */

HI_BOOL SSA_SecureOS_CheckRecoverFlag(HI_VOID);

HI_S32 SSA_SecureOS_RecoverImage(HI_VOID);

HI_S32 SSA_SecureOS_LoadImage(HI_VOID);

HI_S32 SSA_SecureOS_Process(HI_VOID);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif /*__SSA_SECUREOS_H__*/
