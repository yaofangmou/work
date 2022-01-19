#ifndef __HI_DRV_AO_H__
#define __HI_DRV_AO_H__

#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

HI_S32  HI_UNF_AO_Init(HI_VOID);
HI_VOID HI_UNF_AO_DeInit(HI_VOID);

#ifdef HI_ADVCA_FUNCTION_RELEASE
#define HI_FATAL_AIAO(fmt...)
#define HI_ERR_AIAO(fmt...)
#define HI_WARN_AIAO(fmt...)
#define HI_INFO_AIAO(fmt...)
#else
#define HI_FATAL_AIAO(fmt...)  HI_PRINT(fmt)
#define HI_ERR_AIAO(fmt...)    HI_PRINT(fmt)
#define HI_WARN_AIAO(fmt...)   HI_PRINT(fmt)
#define HI_INFO_AIAO(fmt...)   HI_PRINT(fmt)
#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
