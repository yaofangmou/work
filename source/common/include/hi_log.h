/******************************************************************************

          Copyright (C), 2001-2015, HiSilicon Technologies Co., Ltd.
 ******************************************************************************
 File Name       : hi_log.h
 Version         : Initial draft
 Description     : All elements defined in this file can only be used by SDK.
 ******************************************************************************/

#ifndef __HI_LOG_H__
#define __HI_LOG_H__

/******************************************************************************/
/*  Header file references                                                    */
/*  Quote order                                                               */
/*  1. Global header file                                                     */
/*  2. Public header files of other modules                                   */
/*  3. Header files within this module                                        */
/*  4. Private files within this module (.inc)                                */
/******************************************************************************/

#include "hi_debug.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
/** \addtogroup     HI_LOG */
/** @{ */  /** <!-- [HI_LOG] */

/****** Macro switch definition ***********/


/**< SDK Internal Use Only */
/**< Allow modules to modify, If the related module does not define it, no information output */
#ifndef LOG_D_FUNCTRACE
#define LOG_D_FUNCTRACE                     (0)
#endif

/**< SDK Internal Use Only */
/**< allow modules to modify, If the related module does not define it, no information output */
#ifndef LOG_D_UNFTRACE
#define LOG_D_UNFTRACE                      (0)
#endif

/**< SDK Internal Use Only */
/**< allow modules to modify, default value is HI_ID_LOG, the general module id*/
#ifndef LOG_D_MODULE_ID
#define LOG_D_MODULE_ID                     HI_ID_SYS
#endif

#define LOG_D_PBLOCK_PERLINE                (16)
#define LOG_D_PBLOCK_BUFSIZE                (LOG_D_PBLOCK_PERLINE * 3 + 1)

/****** Internal Macro Functions definition (Only can be used in this file) ********/
#if defined(HI_DEBUG)
#if defined(LOG_ENGINE_OS)
#define LOG_Print(enLevel, fmt...)  \
do  \
{   \
    HI_PRINT("[LEVEL:%u-MODULE:%u]:%s[%d]: ", enLevel, LOG_D_MODULE_ID, __FUNCTION__, __LINE__); \
    HI_PRINT(fmt);  \
} while (0)
#else
#define LOG_Print(enLevel, fmt...)          HI_TRACE(enLevel, LOG_D_MODULE_ID, fmt)
#endif

#define LOG_PrintBlock(enLevel, pu8Block, u32Size)  \
{  \
    HI_U32 u32ii = 0;  \
    HI_CHAR aciOutStr[LOG_D_PBLOCK_BUFSIZE] = {0};  \
    HI_CHAR* pciBuffer = (HI_CHAR*)(pu8Block);  \
    LOG_Print(enLevel, " %s\n", #pu8Block);  \
    for (u32ii = 0; u32ii < (u32Size); u32ii++)  \
    {  \
        snprintf(&aciOutStr[(u32ii % LOG_D_PBLOCK_PERLINE) * 3], 4, " %02X", pciBuffer[u32ii]);  \
        if(((u32ii + 1) % LOG_D_PBLOCK_PERLINE) == 0)  \
        {  \
            LOG_Print(enLevel, " %s\n", aciOutStr);  \
            memset(aciOutStr, 0x00, sizeof(aciOutStr));\
        }  \
    }  \
    if(((u32ii % LOG_D_PBLOCK_PERLINE) != 0)  \
        && (0 != u32ii))  \
    { \
        LOG_Print(enLevel, " %s\n", aciOutStr);  \
    }\
}

#else
#define LOG_Print(enLevel, fmt...)
#define LOG_PrintBlock(enLevel, pu8Block, u32Size)
#endif

#if (HI_LOG_LEVEL == HI_TRACE_LEVEL_FATAL)
#define LOG_PrintFatal(fmt...)              LOG_Print(HI_TRACE_LEVEL_FATAL, fmt)
#define LOG_PrintError(fmt...)
#define LOG_PrintWarning(fmt...)
#define LOG_PrintInfo(fmt...)
#define LOG_PrintDebug(fmt...)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_ERROR)
#define LOG_PrintFatal(fmt...)              LOG_Print(HI_TRACE_LEVEL_FATAL,    fmt)
#define LOG_PrintError(fmt...)              LOG_Print(HI_TRACE_LEVEL_ERROR,    fmt)
#define LOG_PrintWarning(fmt...)
#define LOG_PrintInfo(fmt...)
#define LOG_PrintDebug(fmt...)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_WARN)
#define LOG_PrintFatal(fmt...)              LOG_Print(HI_TRACE_LEVEL_FATAL,    fmt)
#define LOG_PrintError(fmt...)              LOG_Print(HI_TRACE_LEVEL_ERROR,    fmt)
#define LOG_PrintWarning(fmt...)            LOG_Print(HI_TRACE_LEVEL_WARN,     fmt)
#define LOG_PrintInfo(fmt...)
#define LOG_PrintDebug(fmt...)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_INFO)
#define LOG_PrintFatal(fmt...)              LOG_Print(HI_TRACE_LEVEL_FATAL,    fmt)
#define LOG_PrintError(fmt...)              LOG_Print(HI_TRACE_LEVEL_ERROR,    fmt)
#define LOG_PrintWarning(fmt...)            LOG_Print(HI_TRACE_LEVEL_WARN,     fmt)
#define LOG_PrintInfo(fmt...)               LOG_Print(HI_TRACE_LEVEL_INFO,     fmt)
#define LOG_PrintDebug(fmt...)
#else
#define LOG_PrintFatal(fmt...)              LOG_Print(HI_TRACE_LEVEL_FATAL,    fmt)
#define LOG_PrintError(fmt...)              LOG_Print(HI_TRACE_LEVEL_ERROR,    fmt)
#define LOG_PrintWarning(fmt...)            LOG_Print(HI_TRACE_LEVEL_WARN,     fmt)
#define LOG_PrintInfo(fmt...)               LOG_Print(HI_TRACE_LEVEL_INFO,     fmt)
#define LOG_PrintDebug(fmt...)              LOG_Print(HI_TRACE_LEVEL_DBG,      fmt)
#endif

/****** Extern Macro Functions definition (can be used by sdk modules) ********/
#if (HI_LOG_LEVEL == HI_TRACE_LEVEL_FATAL)
#define HI_FATAL_PrintBlock(pu8Block, u32Size)  LOG_PrintBlock(HI_TRACE_LEVEL_FATAL, pu8Block, u32Size)
#define HI_ERR_PrintBlock(pu8Block, u32Size)
#define HI_WARN_PrintBlock(pu8Block, u32Size)
#define HI_INFO_PrintBlock(pu8Block, u32Size)
#define HI_DBG_PrintBlock(pu8Block, u32Size)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_ERROR)
#define HI_FATAL_PrintBlock(pu8Block, u32Size)  LOG_PrintBlock(HI_TRACE_LEVEL_FATAL, pu8Block, u32Size)
#define HI_ERR_PrintBlock(pu8Block, u32Size)    LOG_PrintBlock(HI_TRACE_LEVEL_ERROR, pu8Block, u32Size)
#define HI_WARN_PrintBlock(pu8Block, u32Size)
#define HI_INFO_PrintBlock(pu8Block, u32Size)
#define HI_DBG_PrintBlock(pu8Block, u32Size)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_WARN)
#define HI_FATAL_PrintBlock(pu8Block, u32Size)  LOG_PrintBlock(HI_TRACE_LEVEL_FATAL, pu8Block, u32Size)
#define HI_ERR_PrintBlock(pu8Block, u32Size)    LOG_PrintBlock(HI_TRACE_LEVEL_ERROR, pu8Block, u32Size)
#define HI_WARN_PrintBlock(pu8Block, u32Size)   LOG_PrintBlock(HI_TRACE_LEVEL_WARN, pu8Block, u32Size)
#define HI_INFO_PrintBlock(pu8Block, u32Size)
#define HI_DBG_PrintBlock(pu8Block, u32Size)
#elif (HI_LOG_LEVEL == HI_TRACE_LEVEL_INFO)
#define HI_FATAL_PrintBlock(pu8Block, u32Size)  LOG_PrintBlock(HI_TRACE_LEVEL_FATAL, pu8Block, u32Size)
#define HI_ERR_PrintBlock(pu8Block, u32Size)    LOG_PrintBlock(HI_TRACE_LEVEL_ERROR, pu8Block, u32Size)
#define HI_WARN_PrintBlock(pu8Block, u32Size)   LOG_PrintBlock(HI_TRACE_LEVEL_WARN, pu8Block, u32Size)
#define HI_INFO_PrintBlock(pu8Block, u32Size)   LOG_PrintBlock(HI_TRACE_LEVEL_INFO, pu8Block, u32Size)
#define HI_DBG_PrintBlock(pu8Block, u32Size)
#else
#define HI_FATAL_PrintBlock(pu8Block, u32Size)  LOG_PrintBlock(HI_TRACE_LEVEL_FATAL, pu8Block, u32Size)
#define HI_ERR_PrintBlock(pu8Block, u32Size)    LOG_PrintBlock(HI_TRACE_LEVEL_ERROR, pu8Block, u32Size)
#define HI_WARN_PrintBlock(pu8Block, u32Size)   LOG_PrintBlock(HI_TRACE_LEVEL_WARN, pu8Block, u32Size)
#define HI_INFO_PrintBlock(pu8Block, u32Size)   LOG_PrintBlock(HI_TRACE_LEVEL_INFO, pu8Block, u32Size)
#define HI_DBG_PrintBlock(pu8Block, u32Size)    LOG_PrintBlock(HI_TRACE_LEVEL_DBG, pu8Block, u32Size)
#endif

/**< Function trace log, strictly prohibited to expand */
#define HI_FATAL_PrintFuncResult(Func, ErrCode) LOG_PrintFatal("Call %s return [0x%08X]\n", #Func, ErrCode);
#define HI_FATAL_PrintErrCode(ErrCode)          LOG_PrintFatal("Error Code: [0x%08X]\n", ErrCode);

#define HI_ERR_PrintFuncResult(Func, ErrCode)   LOG_PrintError("Call %s return [0x%08X]\n", #Func, ErrCode);
#define HI_ERR_PrintErrCode(ErrCode)            LOG_PrintError("Error Code: [0x%08X]\n", ErrCode);

#define HI_WARN_PrintFuncResult(Func, ErrCode)  LOG_PrintWarning("Call %s return [0x%08X]\n", #Func, ErrCode);
#define HI_WARN_PrintErrCode(ErrCode)           LOG_PrintWarning("Error Code: [0x%08X]\n", ErrCode);

/**< Used for displaying more detailed fatal information */
#define HI_FATAL_PrintS32(val)                  LOG_PrintFatal("%s = %d\n",       #val, val)
#define HI_FATAL_PrintU32(val)                  LOG_PrintFatal("%s = %u\n",       #val, val)
#define HI_FATAL_PrintS64(val)                  LOG_PrintFatal("%s = %lld\n",     #val, val)
#define HI_FATAL_PrintU64(val)                  LOG_PrintFatal("%s = %llu\n",     #val, val)
#define HI_FATAL_PrintH32(val)                  LOG_PrintFatal("%s = 0x%08X\n",   #val, val)
#define HI_FATAL_PrintH64(val)                  LOG_PrintFatal("%s = 0x%016llX\n",#val, val)
#define HI_FATAL_PrintStr(val)                  LOG_PrintFatal("%s = %s\n",       #val, val)
#define HI_FATAL_PrintVoid(val)                 LOG_PrintFatal("%s = %p\n",       #val, val)
#define HI_FATAL_PrintFloat(val)                LOG_PrintFatal("%s = %f\n",       #val, val)
#define HI_FATAL_PrintBool(val)                 LOG_PrintFatal("%s = %s\n",       #val, val ? "True":"False")
#define HI_FATAL_PrintInfo(val)                 LOG_PrintFatal("<%s>\n",          val)

/**< Used for displaying more detailed error information */
#define HI_ERR_PrintS32(val)                    LOG_PrintError("%s = %d\n",       #val, val)
#define HI_ERR_PrintU32(val)                    LOG_PrintError("%s = %u\n",       #val, val)
#define HI_ERR_PrintS64(val)                    LOG_PrintError("%s = %lld\n",     #val, val)
#define HI_ERR_PrintU64(val)                    LOG_PrintError("%s = %llu\n",     #val, val)
#define HI_ERR_PrintH32(val)                    LOG_PrintError("%s = 0x%08X\n",   #val, val)
#define HI_ERR_PrintH64(val)                    LOG_PrintError("%s = 0x%016llX\n",#val, val)
#define HI_ERR_PrintStr(val)                    LOG_PrintError("%s = %s\n",       #val, val)
#define HI_ERR_PrintVoid(val)                   LOG_PrintError("%s = %p\n",       #val, val)
#define HI_ERR_PrintFloat(val)                  LOG_PrintError("%s = %f\n",       #val, val)
#define HI_ERR_PrintBool(val)                   LOG_PrintError("%s = %s\n",       #val, val ? "True":"False")
#define HI_ERR_PrintInfo(val)                   LOG_PrintError("<%s>\n",          val)

/**< Used for displaying more detailed warning information */
#define HI_WARN_PrintS32(val)                   LOG_PrintWarning("%s = %d\n",        #val, val)
#define HI_WARN_PrintU32(val)                   LOG_PrintWarning("%s = %u\n",        #val, val)
#define HI_WARN_PrintS64(val)                   LOG_PrintWarning("%s = %lld\n",      #val, val)
#define HI_WARN_PrintU64(val)                   LOG_PrintWarning("%s = %llu\n",      #val, val)
#define HI_WARN_PrintH32(val)                   LOG_PrintWarning("%s = 0x%08X\n",    #val, val)
#define HI_WARN_PrintH64(val)                   LOG_PrintWarning("%s = 0x%016llX\n", #val, val)
#define HI_WARN_PrintStr(val)                   LOG_PrintWarning("%s = %s\n",        #val, val)
#define HI_WARN_PrintVoid(val)                  LOG_PrintWarning("%s = %p\n",        #val, val)
#define HI_WARN_PrintFloat(val)                 LOG_PrintWarning("%s = %f\n",        #val, val)
#define HI_WARN_PrintBool(val)                  LOG_PrintWarning("%s = %s\n",        #val, val ? "True":"False")
#define HI_WARN_PrintInfo(val)                  LOG_PrintWarning("<%s>\n",           val)

/**< Only used for key info, Can be expanded as needed */
#define HI_INFO_PrintS32(val)                   LOG_PrintInfo("%s = %d\n",        #val, val)
#define HI_INFO_PrintU32(val)                   LOG_PrintInfo("%s = %u\n",        #val, val)
#define HI_INFO_PrintS64(val)                   LOG_PrintInfo("%s = %lld\n",      #val, val)
#define HI_INFO_PrintU64(val)                   LOG_PrintInfo("%s = %llu\n",      #val, val)
#define HI_INFO_PrintH32(val)                   LOG_PrintInfo("%s = 0x%08X\n",    #val, val)
#define HI_INFO_PrintH64(val)                   LOG_PrintInfo("%s = 0x%016llX\n", #val, val)
#define HI_INFO_PrintStr(val)                   LOG_PrintInfo("%s = %s\n",        #val, val)
#define HI_INFO_PrintVoid(val)                  LOG_PrintInfo("%s = %p\n",        #val, val)
#define HI_INFO_PrintFloat(val)                 LOG_PrintInfo("%s = %f\n",        #val, val)
#define HI_INFO_PrintBool(val)                  LOG_PrintInfo("%s = %s\n",        #val, val ? "True":"False")
#define HI_INFO_PrintInfo(val)                  LOG_PrintInfo("<%s>\n",           val)

/**< Only used for self debug, Can be expanded as needed */
#define HI_DBG_PrintS32(val)                    LOG_PrintDebug("%s = %d\n",       #val, val)
#define HI_DBG_PrintU32(val)                    LOG_PrintDebug("%s = %u\n",       #val, val)
#define HI_DBG_PrintS64(val)                    LOG_PrintDebug("%s = %lld\n",     #val, val)
#define HI_DBG_PrintU64(val)                    LOG_PrintDebug("%s = %llu\n",     #val, val)
#define HI_DBG_PrintH32(val)                    LOG_PrintDebug("%s = 0x%08X\n",   #val, val)
#define HI_DBG_PrintH64(val)                    LOG_PrintDebug("%s = 0x%016llX\n",#val, val)
#define HI_DBG_PrintStr(val)                    LOG_PrintDebug("%s = %s\n",       #val, val)
#define HI_DBG_PrintVoid(val)                   LOG_PrintDebug("%s = %p\n",       #val, val)
#define HI_DBG_PrintFloat(val)                  LOG_PrintDebug("%s = %f\n",       #val, val)
#define HI_DBG_PrintBool(val)                   LOG_PrintDebug("%s = %s\n",       #val, val ? "True":"False")
#define HI_DBG_PrintInfo(val)                   LOG_PrintDebug("<%s>\n",          val)


#if (LOG_D_FUNCTRACE == 1) || (LOG_D_UNFTRACE == 1)
#define HI_UNF_FuncEnter()                      LOG_PrintDebug(" >>>>>>[Enter]\n")    /**< Only used for unf interface */
#define HI_UNF_FuncExit()                       LOG_PrintDebug(" <<<<<<[Exit]\n")     /**< Only used for unf interface */
#else
#define HI_UNF_FuncEnter()
#define HI_UNF_FuncExit()
#endif

#if LOG_D_FUNCTRACE
#define HI_FuncEnter()                          LOG_PrintDebug(" =====>[Enter]\n")    /**< Used for all interface except unf */
#define HI_FuncExit()                           LOG_PrintDebug(" =====>[Exit]\n")     /**< Used for all interface except unf */
#else
#define HI_FuncEnter()
#define HI_FuncExit()
#endif

#define HI_CHECK(fnFunc)                                \
do                                                      \
{                                                       \
    HI_S32 s32iErrCode = fnFunc;                        \
    if (HI_SUCCESS != s32iErrCode)                      \
    {                                                   \
        HI_WARN_PrintFuncResult(#fnFunc, s32iErrCode);  \
    }                                                   \
} while (0)


#define HI_CHECK_PARAM(bVal, ErrCodePrint, ErrCodeRet)  \
do                                                      \
{                                                       \
    if (bVal)                                           \
    {                                                   \
        HI_ERR_PrintErrCode(ErrCodePrint);              \
        return ErrCodeRet;                              \
    }                                                   \
} while (0)


/** @} */  /*! <!-- Macro Definition End */

/*************************** Structure Definition *****************************/
/** \addtogroup     HI_LOG */
/** @{ */  /** <!-- [HI_LOG] */

/****** Enumeration definition ************/

/****** Structure definition **************/

/****** Union definition ******************/

/****** Global variable declaration *******/

/** @}*/  /** <!-- ==== Structure Definition End ====*/

/******************************* API Declaration ******************************/
/** \addtogroup     HI_LOG */
/** @{ */  /** <!-- [HI_LOG] */


/** @}*/  /** <!-- ==== API Declaration End ====*/


#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */


#endif  /* __HI_LOG_H__ */

