/************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*************************************************************************************************
File Name        : hi_gfx_sys_k.h
Version          : version 1.0
Author           :
Created          : 2018/01/01
Description      : define system function
Function List    :

History          :
Date               Author                Modification
2018/01/01          sdk
***********************************************************************************************/
#ifndef  _HI_GFX_SYS_K_H_
#define  _HI_GFX_SYS_K_H_


#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif /* __cplusplus */
#endif  /* __cplusplus */

/*********************************add include here*********************************************/
#include <linux/ctype.h>
#include <linux/kernel.h>
#include <linux/string.h>
#include <linux/delay.h>
#include <linux/seq_file.h>

#ifdef CONFIG_USE_SDK_LOG
#include "hi_log.h"
#endif
/***************************** Macro Definition ***********************************************/
#define FUNC_TAG             __func__
#define LINE_TAG             __LINE__
#define FORMAT_TAG           "format"
#define FAILURE_TAG          HI_FAILURE
/**============================================================================================
 **BEG DFX
 **===========================================================================================**/
#ifdef HI_GFX_Print
#undef HI_GFX_Print
#endif

#if defined(HI_LOG_SUPPORT) && (0 == HI_LOG_SUPPORT)
#define HI_GFX_Print(fmt,args...)     //{do{}while(0);}
#else
#define HI_GFX_Print                  printk
#endif

#ifdef CONFIG_GFX_DFX_MOD_JPGE
#define HI_GFX_LogOut                 DRV_JPGE_OutputMessage
#define HI_GFX_SetLogFunc             DRV_JPGE_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_JPGE_SetLogLevel
#define HI_GFX_SetLogSave             DRV_JPGE_SetLogSave
#define HI_GFX_ProcMsg                DRV_JPGE_ProcMsg
#elif defined(CONFIG_GFX_DFX_MOD_JPEG)
#define HI_GFX_LogOut                 DRV_JPEG_OutputMessage
#define HI_GFX_SetLogFunc             DRV_JPEG_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_JPEG_SetLogLevel
#define HI_GFX_SetLogSave             DRV_JPEG_SetLogSave
#define HI_GFX_ProcMsg                DRV_JPEG_ProcMsg
#elif defined(CONFIG_GFX_DFX_MOD_PNG)
#define HI_GFX_LogOut                 DRV_PNG_OutputMessage
#define HI_GFX_SetLogFunc             DRV_PNG_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_PNG_SetLogLevel
#define HI_GFX_SetLogSave             DRV_PNG_SetLogSave
#define HI_GFX_ProcMsg                DRV_PNG_ProcMsg
#elif defined(CONFIG_GFX_DFX_MOD_TDE)
#define HI_GFX_LogOut                 DRV_TDE_OutputMessage
#define HI_GFX_SetLogFunc             DRV_TDE_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_TDE_SetLogLevel
#define HI_GFX_SetLogSave             DRV_TDE_SetLogSave
#define HI_GFX_ProcMsg                DRV_TDE_ProcMsg
#elif defined(CONFIG_GFX_DFX_MOD_GFX2D)
#define HI_GFX_LogOut                 DRV_GFX2D_OutputMessage
#define HI_GFX_SetLogFunc             DRV_GFX2D_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_GFX2D_SetLogLevel
#define HI_GFX_SetLogSave             DRV_GFX2D_SetLogSave
#define HI_GFX_ProcMsg                DRV_GFX2D_ProcMsg
#elif defined(CONFIG_GFX_DFX_MOD_FB)
#define HI_GFX_LogOut                 DRV_HIFB_OutputMessage
#define HI_GFX_SetLogFunc             DRV_HIFB_SetLogFunc
#define HI_GFX_SetLogLevel            DRV_HIFB_SetLogLevel
#define HI_GFX_SetLogSave             DRV_HIFB_SetLogSave
#define HI_GFX_ProcMsg                DRV_HIFB_ProcMsg
#endif

#ifndef CONFIG_USE_SDK_LOG
    #ifdef CONFIG_GFX_DFX_DEBUG
    #define HI_GFX_OutDebugFuncMsg(MsgType)                       HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 0)
    #else
    #define HI_GFX_OutDebugFuncMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_INFO
    #define HI_GFX_OutDebugInfoMsg(MsgType, Value)                HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 1, Value)
    #define HI_GFX_OutDebugValueMsg(MsgType, Value)               HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 0, #Value, Value)
    #else
    #define HI_GFX_OutDebugInfoMsg(fmt,args...)
    #define HI_GFX_OutDebugValueMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_ERR
    #define HI_GFX_OutErrFuncMsg(MsgType, CallFunc, Value)        HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 3, #CallFunc, #Value, Value)
    #define HI_GFX_OutErrInfoMsg(MsgType, Value)                  HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 1, Value)
    #define HI_GFX_OutErrValueMsg(MsgType, Value)                 HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 2, #Value, Value)
    #else
    #define HI_GFX_OutErrFuncMsg(fmt,args...)
    #define HI_GFX_OutErrInfoMsg(fmt,args...)
    #define HI_GFX_OutErrValueMsg(fmt,args...)
    #endif

    #if defined(CONFIG_GFX_DFX_MINI) && defined(CONFIG_GFX_DFX_ERR)
    #define HI_GFX_OutMiniErrFuncMsg(MsgType, CallFunc, Value)    HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 3, #CallFunc, #Value, Value)
    #define HI_GFX_OutMiniErrInfoMsg(MsgType, Value)              HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 1, Value)
    #define HI_GFX_OutMiniErrValueMsg(MsgType, Value)             HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, 2, #Value, Value)
    #else
    #define HI_GFX_OutMiniErrFuncMsg(fmt,args...)
    #define HI_GFX_OutMiniErrInfoMsg(fmt,args...)
    #define HI_GFX_OutMiniErrValueMsg(fmt,args...)
    #endif
#else
    #ifdef CONFIG_GFX_DFX_DEBUG
    #define HI_GFX_OutDebugFuncMsg(MsgType)\
    {\
        if   (HI_GFX_MSG_UNF_ENTER_FUNC == MsgType)\
           HI_UNF_FuncEnter();\
        else if (HI_GFX_MSG_UNF_EXIT_FUNC == MsgType)\
           HI_UNF_FuncExit();\
        else if (HI_GFX_MSG_INNER_ENTER_FUNC == MsgType)\
           HI_FuncEnter();\
        else\
           HI_FuncExit();\
    }
    #else
    #define HI_GFX_OutDebugFuncMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_INFO
    #define HI_GFX_OutDebugInfoMsg(MsgType, Value)\
    {\
        if (HI_GFX_MSG_DEBUG_INFO == MsgType)\
           HI_DBG_PrintInfo(Value);\
    }
    #define HI_GFX_OutDebugValueMsg(MsgType, Value)\
    {\
        if   (HI_GFX_MSG_DEBUG_INT == MsgType)\
           HI_DBG_PrintS32(Value);\
        else if (HI_GFX_MSG_DEBUG_UINT == MsgType)\
           HI_DBG_PrintU32(Value);\
        else if (HI_GFX_MSG_DEBUG_XINT == MsgType)\
           HI_DBG_PrintH32(Value);\
        else if (HI_GFX_MSG_DEBUG_LONG == MsgType)\
           HI_DBG_PrintU64(Value);\
        else if (HI_GFX_MSG_DEBUG_ULONG == MsgType)\
           HI_DBG_PrintU64(Value);\
        else if (HI_GFX_MSG_DEBUG_FLOAT == MsgType)\
           HI_DBG_PrintFloat(Value);\
        else if (HI_GFX_MSG_DEBUG_VOID == MsgType)\
           HI_DBG_PrintVoid(Value);\
        else if (HI_GFX_MSG_DEBUG_STR == MsgType)\
           HI_DBG_PrintStr(Value);\
        else\
           HI_DBG_PrintS32(Value);\
    }
    #else
    #define HI_GFX_OutDebugInfoMsg(fmt,args...)
    #define HI_GFX_OutDebugValueMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_ERR
    #define HI_GFX_OutErrFuncMsg(MsgType, CallFunc, Value)\
    {\
        if (HI_GFX_MSG_ERR_FUNC == MsgType)\
           HI_ERR_PrintFuncResult(CallFunc,Value);\
    }
    #define HI_GFX_OutErrInfoMsg(MsgType, Value)\
    {\
        if (HI_GFX_MSG_ERR_INFO == MsgType)\
           HI_ERR_PrintInfo(Value);\
    }
    #define HI_GFX_OutErrValueMsg(MsgType, Value)\
    {\
        if   (HI_GFX_MSG_ERR_INT == MsgType)\
           HI_ERR_PrintS32(Value);\
        else if (HI_GFX_MSG_ERR_UINT == MsgType)\
           HI_ERR_PrintU32(Value);\
        else if (HI_GFX_MSG_ERR_XINT == MsgType)\
           HI_ERR_PrintH32(Value);\
        else if (HI_GFX_MSG_ERR_LONG == MsgType)\
           HI_ERR_PrintU64(Value);\
        else if (HI_GFX_MSG_ERR_ULONG == MsgType)\
           HI_ERR_PrintU64(Value);\
        else if (HI_GFX_MSG_ERR_FLOAT == MsgType)\
           HI_ERR_PrintFloat(Value);\
        else if (HI_GFX_MSG_ERR_VOID == MsgType)\
           HI_ERR_PrintVoid(Value);\
        else if (HI_GFX_MSG_ERR_STR == MsgType)\
           HI_ERR_PrintStr(Value);\
        else\
           HI_ERR_PrintS32(Value);\
    }
    #else
    #define HI_GFX_OutErrFuncMsg(fmt,args...)
    #define HI_GFX_OutErrInfoMsg(fmt,args...)
    #define HI_GFX_OutErrValueMsg(fmt,args...)
    #endif

    #if defined(CONFIG_GFX_DFX_MINI) && defined(CONFIG_GFX_DFX_ERR)
    #define HI_GFX_OutMiniErrFuncMsg(MsgType, CallFunc, Value)\
    {\
        if (HI_GFX_MSG_ERR_FUNC == MsgType)\
           HI_ERR_PrintFuncResult(CallFunc,Value);\
    }
    #define HI_GFX_OutMiniErrInfoMsg(MsgType, Value)\
    {\
        if (HI_GFX_MSG_ERR_INFO == MsgType)\
           HI_ERR_PrintInfo(Value);\
    }
    #define HI_GFX_OutMiniErrValueMsg(MsgType, Value)\
    {\
        if   (HI_GFX_MSG_ERR_INT == MsgType)\
           HI_ERR_PrintS32(Value);\
        else if (HI_GFX_MSG_ERR_UINT == MsgType)\
           HI_ERR_PrintU32(Value);\
        else if (HI_GFX_MSG_ERR_XINT == MsgType)\
           HI_ERR_PrintH32(Value);\
        else if (HI_GFX_MSG_ERR_LONG == MsgType)\
           HI_ERR_PrintU64(Value);\
        else if (HI_GFX_MSG_ERR_ULONG == MsgType)\
           HI_ERR_PrintU64(Value);\
        else if (HI_GFX_MSG_ERR_FLOAT == MsgType)\
           HI_ERR_PrintFloat(Value);\
        else if (HI_GFX_MSG_ERR_VOID == MsgType)\
           HI_ERR_PrintVoid(Value);\
        else if (HI_GFX_MSG_ERR_STR == MsgType)\
           HI_ERR_PrintStr(Value);\
        else\
           HI_ERR_PrintS32(Value);\
    }
    #else
    #define HI_GFX_OutMiniErrFuncMsg(fmt,args...)
    #define HI_GFX_OutMiniErrInfoMsg(fmt,args...)
    #define HI_GFX_OutMiniErrValueMsg(fmt,args...)
    #endif
#endif
/**============================================================================================
 **END DFX
 **===========================================================================================**/
/**===============================================================================================
 ** 确保运算不出现反转
 **==============================================================================================**/
#define HI_GFX_CHECK_U64_ADDITION_REVERSAL_UNRETURN(left_value, right_value) do{\
                            if ((0 == (left_value)) || ((left_value) > (ULONG_MAX - (right_value)))) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return;}\
                            }while(0)

#define HI_GFX_CHECK_U64_ADDITION_REVERSAL_RETURN(left_value, right_value, ret) do{\
                            if ((0 == (left_value)) || ((left_value) > (ULONG_MAX - (right_value)))) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return ret;}\
                            }while(0)

/** addition by unsigned int, maybe equal to 0 **/
#define HI_GFX_CHECK_UINT_ADDITION_REVERSAL_UNRETURN(left_value, right_value) do{\
                            if ((0 == (left_value)) || ((left_value) > (UINT_MAX - (right_value)))) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return;}\
                            }while(0)

#define HI_GFX_CHECK_UINT_ADDITION_REVERSAL_RETURN(left_value, right_value, ret) do{\
                            if ((0 == (left_value)) || ((left_value) > (UINT_MAX - (right_value)))) {\
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                 return ret;}\
                            }while(0)

/** addition by unsigned int, maybe equal to 0 **/
#define HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_UNRETURN(left_value, right_value) do{\
                            unsigned long tmp_value = (unsigned long)(left_value) * (unsigned long)(right_value);\
                            if ((0 == tmp_value) || (tmp_value > UINT_MAX)) {\
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_value);  \
                                 return;}\
                            }while(0)

#define HI_GFX_CHECK_UINT_MULTIPLICATION_REVERSAL_RETURN(left_value, right_value, ret) do{\
                            unsigned long tmp_value = (unsigned long)(left_value) * (unsigned long)(right_value);\
                            if ((0 == tmp_value) || (tmp_value > UINT_MAX)) {\
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                 HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, tmp_value);  \
                                 return ret;}\
                            }while(0)


/** addition by int, maybe equal to 0 **/
#define HI_GFX_CHECK_INT_ADDITION_REVERSAL_UNRETURN(left_value, right_value) do{\
                            if (((left_value) <= 0) || ((left_value) > (INT_MAX - (right_value)))) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return;}\
                            }while(0)

#define HI_GFX_CHECK_INT_ADDITION_REVERSAL_RETURN(left_value, right_value, ret) do{\
                            if (((left_value) <= 0) || ((left_value) > (INT_MAX - (right_value)))) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return ret;}\
                            }while(0)

/** addition by char, maybe equal to -128 **/
#define HI_GFX_CHECK_CHAR_ADDITION_REVERSAL_UNRETURN(left_value, right_value) do{\
                            if (((left_value) <= 0) || ((right_value) < 0) || ((left_value) > (SCHAR_MAX - (right_value)))) {\
                               HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                               HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                               return;}\
                            }while(0)

#define HI_GFX_CHECK_CHAR_ADDITION_REVERSAL_RETURN(left_value, right_value, ret) do{\
                            if (((left_value) <= 0) || ((right_value) < 0) || ((left_value) > (SCHAR_MAX - (right_value)))) {\
                               HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                               HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                               return ret;}\
                            }while(0)


/**===============================================================================================
 ** 确保整型转换时不会出现截断错误
 **==============================================================================================**/
/** long to char **/
#define HI_GFX_CHECK_SLONG_TO_CHAR_REVERSAL_UNRETURN(right_value) do{\
                            if (((right_value) < SCHAR_MIN) || ((right_value) > SCHAR_MAX)) {\
                               HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                               return;}\
                            }while(0)

#define HI_GFX_CHECK_SLONG_TO_CHAR_REVERSAL_RETURN(right_value, ret) do{\
                            if (((right_value) < SCHAR_MIN) || ((right_value) > SCHAR_MAX)){\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return ret;}\
                            }while(0)

/** unsigned long to unsigned int **/
#define HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_UNRETURN(right_value) do{\
                            if ((right_value) > UINT_MAX) {\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return;}\
                            }while(0)

#define HI_GFX_CHECK_ULONG_TO_UINT_REVERSAL_RETURN(right_value, ret) do{\
                            if ((right_value) > UINT_MAX){\
                                HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                                return ret;}\
                            }while(0)


/**===============================================================================================
** BEG PARA CHECK
**==============================================================================================**/
#define HI_GFX_CHECK_ARRAY_OVER_RETURN_VALUE(CurIndex, MaxIndex, Ret) \
                if ((CurIndex) >= (MaxIndex))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CurIndex);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, MaxIndex);\
                    return Ret;\
                }

#define HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(CurIndex, MaxIndex) \
                if ((CurIndex) >= (MaxIndex))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, CurIndex);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, MaxIndex);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(left_value, right_value, Ret) \
                if ((left_value) > (right_value))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_NOVALUE(left_value, right_value) \
                if ((left_value) > (right_value))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(left_value, right_value, Ret) \
                if ((left_value) < (right_value))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_NOVALUE(left_value, right_value) \
                if ((left_value) < (right_value))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(para1, para2) \
                if ((para1) == (para2))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(para1, para2, Ret) \
                if ((para1) == (para2))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_UNEQUAL_RIGHT_RETURN_NOVALUE(para1, para2) \
                if ((para1) != (para2))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_UNEQUAL_RIGHT_RETURN_VALUE(para1, para2, Ret) \
                if ((para1) != (para2))\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return Ret;\
                }

#define HI_GFX_CHECK_NULLPOINTER_RETURN_VALUE(Pointer, Ret) \
                if (NULL == (Pointer))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, Pointer);\
                    HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "pointer is null");\
                    return Ret;\
                }

#define HI_GFX_CHECK_NULLPOINTER_RETURN_NOVALUE(Pointer) \
                if (NULL == (Pointer))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_VOID, Pointer);\
                    HI_GFX_OutMiniErrInfoMsg(HI_GFX_MSG_ERR_INFO, "pointer is null");\
                    return;\
                }

#define HI_GFX_CHECK_EQUAL_ZERO_RETURN_VALUE(para, ret)\
                if (0 == para)\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para);\
                    return ret;\
                }

#define HI_GFX_CHECK_EQUAL_ZERO_RETURN_NOVALUE(para)\
                if (0 == para)\
                {\
                    HI_GFX_OutErrValueMsg(HI_GFX_MSG_ERR_UINT, para);\
                    return;\
                }
/**===============================================================================================
** END PARA CHECK
**==============================================================================================**/
/**===============================================================================================
** 数组合法性检查
**==============================================================================================**/
#define HI_GFX_ARRAY_SIZE(array)      (sizeof(array) / sizeof(array[0]))

/**===============================================================================================
** 时间函数封装
**==============================================================================================**/
#define HI_GFX_TINIT()             struct timeval tv_cur
#define HI_GFX_TSTART(StartTimes)  do_gettimeofday(&tv_cur); StartTimes = tv_cur.tv_sec * 1000 + tv_cur.tv_usec / 1000
#define HI_GFX_TEND(EndTimes)      do_gettimeofday(&tv_cur); EndTimes   = tv_cur.tv_sec * 1000 + tv_cur.tv_usec / 1000

/*************************** Structure Definition *********************************************/

/*************************** Enum Definition **************************************************/
typedef enum tagGfxMsgType
{
    HI_GFX_MSG_ERR_FUNC = 0,
    HI_GFX_MSG_ERR_INT,
    HI_GFX_MSG_ERR_UINT,
    HI_GFX_MSG_ERR_XINT,
    HI_GFX_MSG_ERR_LONG,
    HI_GFX_MSG_ERR_ULONG,
    HI_GFX_MSG_ERR_FLOAT,
    HI_GFX_MSG_ERR_VOID,
    HI_GFX_MSG_ERR_STR,
    HI_GFX_MSG_ERR_INFO,
    HI_GFX_MSG_BEG,
    HI_GFX_MSG_END,
    HI_GFX_MSG_UNF_ENTER_FUNC,
    HI_GFX_MSG_UNF_EXIT_FUNC,
    HI_GFX_MSG_INNER_ENTER_FUNC,
    HI_GFX_MSG_INNER_EXIT_FUNC,
    HI_GFX_MSG_DEBUG_INT,
    HI_GFX_MSG_DEBUG_UINT,
    HI_GFX_MSG_DEBUG_XINT,
    HI_GFX_MSG_DEBUG_LONG,
    HI_GFX_MSG_DEBUG_ULONG,
    HI_GFX_MSG_DEBUG_FLOAT,
    HI_GFX_MSG_DEBUG_VOID,
    HI_GFX_MSG_DEBUG_STR,
    HI_GFX_MSG_DEBUG_INFO,
    HI_GFX_MSG_BUTT,
}HI_GFX_MSG_TYPE_E;
/********************** Global Variable declaration *******************************************/


/******************************* API declaration **********************************************/

/**********************************************************************************************/

#ifdef __cplusplus
 #if __cplusplus
}
 #endif /* __cplusplus */
#endif  /* __cplusplus */
#endif /*_HI_GFX_SYS_K_H_ */
