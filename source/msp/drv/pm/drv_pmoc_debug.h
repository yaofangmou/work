/******************************************************************************

Copyright (C), 2018, Hisilicon Tech. Co., Ltd.
******************************************************************************
File Name     : drv_pmoc_debug.h
Version       : Initial draft
Author        :
Created       : 2018-07-23
Last Modified :
Description   :
Function List :
History       :
******************************************************************************/
#ifndef __DRV_PMOC_DEBUG_H__
#define __DRV_PMOC_DEBUG_H__

#include "hi_log.h"

#include "hi_error_mpi.h"
#include "hi_type.h"
#include "hi_debug.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#define PM_ERR_PrintS32(val)                HI_ERR_PM("%s = %d\n", #val, val)
#define PM_ERR_PrintU32(val)                HI_ERR_PM("%s = %u\n", #val, val)
#define PM_ERR_PrintHex(val)                HI_ERR_PM("%s = 0x%08X\n",#val, val)
#define PM_ERR_PrintInfo(val)               HI_ERR_PM("%s\n", val)
#define PM_ERR_PrintPoint(val)              HI_ERR_PM("%s = %p\n",    #val, val)
#define PM_ERR_PrintStr(val)                HI_ERR_PM("%s = %s\n",       #val, val)
#define PM_ERR_PrintU64(val)                HI_ERR_PM("%s = %llu\n",     #val, val)

#define PM_WARN_PrintS32(val)               HI_WARN_PM("%s = %d\n", #val, val)
#define PM_WARN_PrintHex(val)               HI_WARN_PM("%s = 0x%08X\n",#val, val)
#define PM_WARN_PrintInfo(val)              HI_WARN_PM("%s\n", val)
#define PM_WARN_PrintPoint(val)             HI_WARN_PM("%s = %p\n",    #val, val)

#define PM_INFO_PrintS32(val)               HI_INFO_PM("%s = %d\n", #val, val)
#define PM_INFO_PrintU32(val)               HI_INFO_PM("%s = %u\n", #val, val)
#define PM_INFO_PrintHex(val)               HI_INFO_PM("%s = 0x%08X\n",#val, val)
#define PM_INFO_PrintInfo(val)              HI_INFO_PM("%s\n", val)
#define PM_INFO_PrintPoint(val)             HI_INFO_PM("%s = %p\n",    #val, val)

#define PM_DBG_PrintHex(val)                HI_DEBUG_PM("%s = 0x%08X\n",#val, val)
#define PM_DBG_PrintInfo(val)               HI_DEBUG_PM("%s\n", val)
#define PM_DBG_PrintPoint(val)              HI_DEBUG_PM("%s = %p\n",    #val, val)


#define PM_PrintErrorCode(errCode)          HI_ERR_PM("Error Code: [0x%08x]\n", errCode)
#define PM_PrintErrorFunc(func,errCode)     HI_ERR_PM("Call [%s] return [0x%08x]\n", #func, errCode)
#define PM_PrintWarnFunc(func,errCode)      HI_WARN_PM("Call [%s] return [0x%08x]\n", #func, errCode)

#define PM_FUNC_ENTER()                     HI_DBG_PRINT(HI_ID_PM, "[ENTER]:%s\n", __FUNCTION__)
#define PM_FUNC_EXIT()                      HI_DBG_PRINT(HI_ID_PM, "[EXIT] :%s\n", __FUNCTION__)

#define PM_CHECK_PARAM(value) \
    do{ \
        if (value) \
        {\
            HI_ERR_PM("ERR: %s\n",#value);\
            return HI_ERR_PM_INVALID_PARAM;\
        }\
    }while(0)


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */

#endif /* End of #ifndef __DRV_PM_DEBUG_H__ */
