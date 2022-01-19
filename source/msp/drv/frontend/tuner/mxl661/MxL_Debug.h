/*******************************************************************************
 *
 * FILE NAME          : MxL_Debug.h
 *
 * AUTHOR             : Brenndon Lee
 *
 * DATE CREATED       : 10/25/2010
 *
 * DESCRIPTION        : Debug header files
 *
 *******************************************************************************
 *                Copyright (c) 2010, MaxLinear, Inc.
 ******************************************************************************/

#ifndef __MXL_DEBUG_H__
#define __MXL_DEBUG_H__

/******************************************************************************
    Include Header Files
    (No absolute paths - paths handled by make file)
******************************************************************************/

//#include <stdio.h>
#include "MaxLinearDataTypes.h"

#include "hi_type.h"
#include "hi_drv_proc.h"


/******************************************************************************
    Macros
******************************************************************************/

//#define MxL_DLL_DEBUG0 printf
#define MxL_DLL_DEBUG0(fmt...) do{}while(0)



#endif /* __MXL_DEBUG_H__*/
