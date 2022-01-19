/***********************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
************************************************************************************************
File Name          : hi_gfx_comm.h
Version            : Initial Draft
Author             :
Created            : 2018/01/01
Description        : common used
                     CNcomment: 公共使用的接口 CNend\n
Function List      :
History            :
Date                            Author                     Modification
2018/01/01                      sdk                        Created file
************************************************************************************************/
#ifndef  __HI_GFX_COMM_H__
#define  __HI_GFX_COMM_H__

/*********************************add include here**********************************************/
#include "hi_type.h"
#include "exports.h"

/***************************** Macro Definition ************************************************/
#define FUNC_TAG             __func__
#define LINE_TAG             __LINE__
#define FORMAT_TAG           "format"
#define FAILURE_TAG          HI_FAILURE

/**============================================================================================
 **BEG DFX
 **===========================================================================================**/
#if defined(HI_LOG_SUPPORT) && (0 == HI_LOG_SUPPORT)
#define HI_GFX_Print(fmt,args...)//   {do{}while(0);}
#else
#define HI_GFX_Print                  printf
#endif

#ifndef CONFIG_USE_SDK_LOG
    #ifdef CONFIG_GFX_DFX_DEBUG
    #define HI_GFX_OutDebugFuncMsg(MsgType)                       HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG)
    #else
    #define HI_GFX_OutDebugFuncMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_INFO
    #define HI_GFX_OutDebugInfoMsg(MsgType, Value)                HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, Value)
    #define HI_GFX_OutDebugValueMsg(MsgType, Value)               HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, #Value, Value)
    #else
    #define HI_GFX_OutDebugInfoMsg(fmt,args...)
    #define HI_GFX_OutDebugValueMsg(fmt,args...)
    #endif

    #ifdef CONFIG_GFX_DFX_ERR
    #define HI_GFX_OutErrFuncMsg(MsgType, CallFunc, Value)        HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, #CallFunc, #Value, Value)
    #define HI_GFX_OutErrInfoMsg(MsgType, Value)                  HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, Value)
    #define HI_GFX_OutErrValueMsg(MsgType, Value)                 HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, #Value, Value)
    #else
    #define HI_GFX_OutErrFuncMsg(fmt,args...)
    #define HI_GFX_OutErrInfoMsg(fmt,args...)
    #define HI_GFX_OutErrValueMsg(fmt,args...)
    #endif

    #if defined(CONFIG_GFX_DFX_MINI) && defined(CONFIG_GFX_DFX_ERR)
    #define HI_GFX_OutMiniErrFuncMsg(MsgType, CallFunc, Value)    HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, #CallFunc, #Value, Value)
    #define HI_GFX_OutMiniErrInfoMsg(MsgType, Value)              HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, Value)
    #define HI_GFX_OutMiniErrValueMsg(MsgType, Value)             HI_GFX_LogOut(FUNC_TAG, LINE_TAG, MsgType, FORMAT_TAG, #Value, Value)
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

#define HI_GFX_INVALID_HANDLE       0

#define CONFIG_GFX_MINWIDTH         32
#define CONFIG_GFX_MINHEIGHT        32
#define CONFIG_GFX_MINSTRIDE        32
#define CONFIG_GFX_MAXWIDTH         8192
#define CONFIG_GFX_MAXHEIGHT        8192
#define CONFIG_GFX_MAXSTRIDE        65536
#define CONFIG_GFX_BITSPERPIX       32

#define USHRT_MAX                   ((u16)(~0U))             /** 65535       **/
#define SHRT_MAX                    ((s16)(USHRT_MAX>>1))    /** 32767       **/
#define SHRT_MIN                    ((s16)(-SHRT_MAX - 1))   /** -32768      **/
#define INT_MAX                     ((int)(~0U>>1))          /** 2147483647  **/
#define INT_MIN                     (-INT_MAX - 1)           /** -2147483648 **/
#define UINT_MAX                    (~0U)
#define LONG_MAX                    ((long)(~0UL>>1))        /** 2147483647  **/
#define LONG_MIN                    (-LONG_MAX - 1)          /** -2147483648 **/
#define ULONG_MAX                   (~0UL)
#define LLONG_MAX                   ((long long)(~0ULL>>1))
#define LLONG_MIN                   (-LLONG_MAX - 1)
#define ULLONG_MAX                  (~0ULL)
#define SIZE_MAX                    (~(size_t)0)

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
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, CurIndex);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, MaxIndex);\
                    return Ret;\
                }

#define HI_GFX_CHECK_ARRAY_OVER_RETURN_NOVALUE(CurIndex, MaxIndex) \
                if ((CurIndex) >= (MaxIndex))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, CurIndex);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, MaxIndex);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_VALUE(left_value, right_value, Ret) \
                if ((left_value) > (right_value))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_LARGER_RIGHT_RETURN_NOVALUE(left_value, right_value) \
                if ((left_value) > (right_value))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_VALUE(left_value, right_value, Ret) \
                if ((left_value) < (right_value))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_LITTLE_RIGHT_RETURN_NOVALUE(left_value, right_value) \
                if ((left_value) < (right_value))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, left_value); \
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, right_value);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_NOVALUE(para1, para2) \
                if ((para1) == (para2))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_EQUAL_RIGHT_RETURN_VALUE(para1, para2, Ret) \
                if ((para1) == (para2))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return Ret;\
                }

#define HI_GFX_CHECK_LEFT_UNEQUAL_RIGHT_RETURN_NOVALUE(para1, para2) \
                if ((para1) != (para2))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
                    return;\
                }

#define HI_GFX_CHECK_LEFT_UNEQUAL_RIGHT_RETURN_VALUE(para1, para2, Ret) \
                if ((para1) != (para2))\
                {\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para1);\
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para2);\
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
                    HI_GFX_OutMiniErrValueMsg(HI_GFX_MSG_ERR_UINT, para);\
                    return ret;\
                }
/**===============================================================================================
** END PARA CHECK
**==============================================================================================**/

/**============================================================================================
 **BEG SYS FUNC
 **===========================================================================================**/
HI_VOID HI_GFX_Memset(HI_VOID *pDst, HI_S32 InitValue, HI_U32 DstSize);
HI_VOID HI_GFX_Memcpy(HI_VOID *pDst, const HI_VOID *pSrc, HI_U32 SrcSize);
/**============================================================================================
 **END SYS FUNC
 **===========================================================================================**/

/*************************** Structure Definition **********************************************/
typedef struct hiGfxRectS
{
    HI_U32 x;
    HI_U32 y;
    HI_U32 w;
    HI_U32 h;
}HI_GFX_RECT_S;

typedef enum hiGfxLayerIdE
{
    HI_GFX_LAYER_HD_0         = 0,
    HI_GFX_LAYER_HD_1         = 1,
    HI_GFX_LAYER_HD_2         = 2,
    HI_GFX_LAYER_HD_3,
    HI_GFX_LAYER_SD_0,
    HI_GFX_LAYER_SD_1,
    HI_GFX_LAYER_ID_BUTT
}HI_GFX_LAYER_ID_E;

typedef struct tagGfxMMZBufferS
{
    HI_U8  *pu8StartVirAddr;
    HI_U32  u32StartSmmuAddr;
    HI_U32  u32StartPhyAddr;
    HI_U32  u32Size;
    HI_BOOL bSmmu;
}GFX_MMZ_BUFFER_S;

typedef enum tagGfxDebugLevel
{
    HI_GFX_DEBUG_LEVEL_1 = 1,
    HI_GFX_DEBUG_LEVEL_2,
    HI_GFX_DEBUG_LEVEL_3,
    HI_GFX_DEBUG_LEVEL_4,
    HI_GFX_DEBUG_LEVEL_BUTT,
}HI_GFX_DEBUG_LEVEL_E;

/********************** Global Variable declaration ********************************************/

typedef HI_GFX_RECT_S HI_RECT;

/******************************* API declaration ***********************************************/

#endif /*__HI_GFX_COMM_H__ */
