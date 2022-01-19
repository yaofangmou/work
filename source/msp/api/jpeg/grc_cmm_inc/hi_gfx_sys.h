/**************************************************************************************************
*
* Copyright (C) 2018 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
***************************************************************************************************
File Name       : hi_gfx_sys.h
Version         : version 1.0
Author          :
Created         : 2018/01/01
Description     : define system function
Function List   :

History         :
Date                        Author                Modification
2018/01/01                  sdk                       create
*************************************************************************************************/
#ifndef  _HI_GFX_SYS_H_
#define  _HI_GFX_SYS_H_


#ifdef __cplusplus
 #if __cplusplus
extern "C" {
 #endif /* __cplusplus */
#endif  /* __cplusplus */

/*********************************add include here***********************************************/
#ifdef CONFIG_GFX_ANDROID_SDK
#include <utils/Log.h>
#endif

/***************************** Macro Definition *************************************************/
#ifdef LOG_TAG
#undef LOG_TAG
#endif
#define LOG_TAG "libhi_gfx"

/*************************** Enum Definition ****************************************************/
/**============================================================================================
 **BEG DFX
 **===========================================================================================**/
#if defined(HI_LOG_SUPPORT) && (0 == HI_LOG_SUPPORT)
#define HI_GFX_Print(fmt,args...)//   {do{}while(0);}
#else
  #ifdef CONFIG_GFX_ANDROID_SDK
    #define HI_GFX_Print    ALOGE
  #else
    #define HI_GFX_Print    printf
  #endif
#endif
/**============================================================================================
 **BEG DFX
 **===========================================================================================**/
extern HI_U32 jpge_log_level;
extern HI_U32 jpeg_log_level;
extern HI_U32 png_log_level;
extern HI_U32 tde_log_level;
extern HI_U32 gfx2d_log_level;
extern HI_U32 fb_log_level;
extern HI_U32 higo_log_level;
#ifdef CONFIG_GFX_DFX_MOD_JPGE
#define gfx_log_level   jpge_log_level
#elif defined(CONFIG_GFX_DFX_MOD_JPEG)
#define gfx_log_level   jpeg_log_level
#elif defined(CONFIG_GFX_DFX_MOD_PNG)
#define gfx_log_level   png_log_level
#elif defined(CONFIG_GFX_DFX_MOD_TDE)
#define gfx_log_level   tde_log_level
#elif defined(CONFIG_GFX_DFX_MOD_GFX2D)
#define gfx_log_level   gfx2d_log_level
#elif defined(CONFIG_GFX_DFX_MOD_FB)
#define gfx_log_level   fb_log_level
#endif

/**======================
**level1
**======================**/
#define HI_GFX_LOG_PrintFuncErr(func,err_code) HI_GFX_Print("[module-gfx] : %s[%d] : call %s return [0x%08x]\n", __FUNCTION__,__LINE__,#func,err_code);
#define HI_GFX_LOG_PrintErrVoid(err_code)      HI_GFX_Print("[module-gfx] : %s[%d] : %s = %p\n", __FUNCTION__,__LINE__,#err_code,err_code);
#define HI_GFX_LOG_PrintErrInt(err_code)       HI_GFX_Print("[module-gfx] : %s[%d] : %s = %d\n",   __FUNCTION__,__LINE__,#err_code,err_code);
#define HI_GFX_LOG_PrintErrXInt(err_code)      HI_GFX_Print("[module-gfx] : %s[%d] : %s = 0x%x\n", __FUNCTION__,__LINE__,#err_code,err_code);
#define HI_GFX_LOG_PrintErrUInt(err_code)      HI_GFX_Print("[module-gfx] : %s[%d] : %s = %u\n",   __FUNCTION__,__LINE__,#err_code,err_code);
#define HI_GFX_LOG_PrintErrULong(err_code)     HI_GFX_Print("[module-gfx] : %s[%d] : %s = %lu\n",  __FUNCTION__,__LINE__,#err_code,err_code);
#define HI_GFX_LOG_PrintErrInfo(err_code)      HI_GFX_Print("[module-gfx] : %s[%d] : <%s>\n",      __FUNCTION__,__LINE__,err_code);
#define HI_GFX_LOG_PrintErrCode(err_code)      HI_GFX_Print("[module-gfx] : %s[%d] : error code %s = [0x%08x]\n",__FUNCTION__,__LINE__,#err_code,err_code);
/**======================
**level2
**======================**/
#define HI_GFX_UNF_FuncEnter()      if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : >>>>>>>>>>>>>>>>[enter]\n",__FUNCTION__,__LINE__);}
#define HI_GFX_UNF_FuncExit()       if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : >>>>>>>>>>>>>>>>[exit]\n", __FUNCTION__,__LINE__);}
#define HI_GFX_INNER_FuncEnter()    if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : ===============>[enter]\n",__FUNCTION__,__LINE__);}
#define HI_GFX_INNER_FuncExit()     if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : ===============>[exit]\n", __FUNCTION__,__LINE__);}
/**======================
**level3
**======================**/
#define HI_GFX_LOG_PrintInt(val)    if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %d\n",   __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintUInt(val)   if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %u\n",   __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintXInt(val)   if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = 0x%x\n", __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintLong(val)   if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %lld\n", __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintULong(val)  if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %llu\n", __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintStr(val)    if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %s\n",   __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintVoid(val)   if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %p\n", __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintFloat(val)  if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : %s = %f\n",   __FUNCTION__,__LINE__,#val,val);}
#define HI_GFX_LOG_PrintInfo(val)   if (6 == gfx_log_level){HI_GFX_Print("[module-gfx] : %s[%d] : <%s>\n",      __FUNCTION__,__LINE__,val);}


#define HI_GFX_LOG_Beg()            if (6 == gfx_log_level){HI_GFX_Print("\n[module-gfx-log-beg] :=======================================================================\n");}
#define HI_GFX_LOG_End()            if (6 == gfx_log_level){HI_GFX_Print("[module-gfx-log-end] :=======================================================================\n");}
/**============================================================================================
 **END DFX
 **===========================================================================================**/

/*************************** Structure Definition ***********************************************/


/********************** Global Variable declaration *********************************************/

/******************************* API declaration ************************************************/
#ifdef __cplusplus
 #if __cplusplus
}
 #endif /* __cplusplus */
#endif  /* __cplusplus */
#endif /*_HI_GFX_SYS_H_ */
