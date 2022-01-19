/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_upgrade.h
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#ifndef __SSA_UPGRADE_H__
#define __SSA_UPGRADE_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup      SSA_UPGRADE */
/** @{ */  /** <!-- [SSA_UPGRADE] */


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup      SSA_UPGRADE */
/** @{ */  /** <!-- [SSA_UPGRADE] */

/****** Enumeration definition ************/

/****** Structure definition **************/


/****** Union definition ******************/

/****** Global variable declaration *******/

/** @} */  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup      SSA_UPGRADE */
/** @{ */  /** <!-- [SSA_UPGRADE] */

HI_S32 SSA_CheckUpgrade(HI_BOOL *pbNeedUpgrade, HI_BOOL bRestoreLoaderDB);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif /*__SSA_UPGRADE_H__*/
