/******************************************************************************

          Copyright (C), 2001-2015, HiSilicon Technologies Co., Ltd.
 ******************************************************************************
 File Name       : ui_display.h
 Version         : Initial draft
 Author          : Device Chipset STB Development Dept
 Created Date    : 2015-07-29
 Last Modified by: sdk
 Description     :
 Function List   :
 Change History  :
 Version  Date        Author     DefectNum         Description
 main\1   2015-07-29  sdk  N/A               Create this file.
 ******************************************************************************/

#ifndef __UI_DISPLAY_H__
#define __UI_DISPLAY_H__

/******************************************************************************/
/*  Header file references                                                    */
/*  Quote order                                                               */
/*  1. Global header file                                                     */
/*  2. Public header files of other modules                                   */
/*  3. Header files within this module                                        */
/*  4. Private files within this module (.inc)                                */
/******************************************************************************/


#if defined(HI_LOADER_RUNNING_ENVIRONMENT_MINIBOOT)
#include "hi_drv_pdm.h"
#elif defined(HI_LOADER_RUNNING_ENVIRONMENT_UBOOT)
#include "hi_drv_pdm.h"
#else
#include "hi_unf_pdm.h"
#include "ui_config.h"
#endif
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup      UI_DISPLAY */
/** @{ */  /** <!-- [UI_DISPLAY] */


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup      UI_DISPLAY */
/** @{ */  /** <!-- [UI_DISPLAY] */

/****** Enumeration definition ************/

/****** Structure definition **************/

/****** Union definition ******************/

/****** Global variable declaration *******/
/** @} */  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup      UI_DISPLAY */
/** @{ */  /** <!-- [UI_DISPLAY] */
#ifdef HI_LOADER_APPLOADER
HI_S32 UI_DisplayInit(HI_UNF_PDM_DISP_PARAM_S* pstDispParam);

HI_S32 UI_DisplayDeInit(HI_VOID);
#endif

/** @} */  /** <!-- ==== API Declaration End ==== */

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif /*__UI_DISPLAY_H__*/
