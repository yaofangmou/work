/******************************************************************************

  Copyright (C), 2013-2014, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : mpi_userproc.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2013/07/15
  Description   : Support user proc function.
******************************************************************************/

#ifndef __MPI_USERPROC_H__
#define __MPI_USERPROC_H__

/******************************* Include Files *******************************/

/* add include here */
#include "hi_type.h"
#include "hi_module.h"
#include "hi_debug.h"
#include "hi_common.h"

#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif
#endif /* __cplusplus */

/***************************** Macro Definition ******************************/

/*************************** Structure Definition ****************************/
typedef enum hiMPI_UPROC_PARENT_DIR
{
    HI_MPI_UPROC_PARENT_DEFAULT,
    HI_MPI_UPROC_PARENT_MSP
}HI_MPI_UPROC_PARENT_DIR;

/********************** Global Variable declaration **************************/

/******************************* API declaration *****************************/
HI_S32 MPI_UPROC_Init(HI_VOID);
HI_S32 MPI_UPROC_DeInit(HI_VOID);
HI_S32 MPI_UPROC_AddDir(const HI_CHAR *pszName, HI_MPI_UPROC_PARENT_DIR pszParent);
HI_S32 MPI_UPROC_RemoveDir(const HI_CHAR *pszName, HI_MPI_UPROC_PARENT_DIR pszParent);
HI_S32 MPI_UPROC_AddEntry(HI_U32 u32ModuleID, const HI_PROC_ENTRY_S* pstEntry);
HI_S32 MPI_UPROC_RemoveEntry(HI_U32 u32ModuleID, const HI_PROC_ENTRY_S* pstEntry);

#ifdef __cplusplus
 #if __cplusplus
}
 #endif
#endif /* __cplusplus */

#endif /* __MPI_USERPROC_H__ */

