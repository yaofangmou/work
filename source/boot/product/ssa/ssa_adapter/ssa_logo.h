/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_logo.h
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/

#ifndef __SSA_LOGO_H__
#define __SSA_LOGO_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup      SSA_LOGO */
/** @{ */  /** <!-- [SSA_LOGO] */


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup      SSA_LOGO */
/** @{ */  /** <!-- [SSA_LOGO] */

/****** Enumeration definition ************/

/****** Structure definition **************/
typedef HI_S32 (*PLoadLogoFunc)(HI_U32 *pLogoAddress, HI_U32 *pLogoLength);


/****** Union definition ******************/

/****** Global variable declaration *******/

/** @} */  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup      SSA_LOGO */
/** @{ */  /** <!-- [SSA_LOGO] */
HI_S32 SSA_ShowLogo(PLoadLogoFunc pfunc);

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif /*__SSA_LOGO_H__*/
