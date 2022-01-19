#ifndef __VMM_CUSTOM_H__
#define __VMM_CUSTOM_H__

#include "vmm.h"

#ifdef __cplusplus
extern "C" {
#endif

SINT32 Custom_Init(VOID *pArgs);
VOID   Custom_Deinit(VOID);
UINT32 Custom_GetPreMemSize(VOID);
SINT32 Custom_AllocMemPreProcess(VMM_NOTICE_PARAM_S *pNoticeParam);
SINT32 Custom_GetReservedBuf(VMM_BUFFER_S *pMemInfo);
SINT32 Custom_PutReservedBuf(VMM_BUFFER_S *pMemInfo);
SINT32 Custom_SupplementBufDetail(VMM_BUFFER_S *pBufInfo);

SINT32 Custom_GetBackTunlBuf(VMM_BUFFER_S *pBufInfo);
VOID   Custom_PutBackTunlBuf(VMM_BUFFER_S *pBufInfo);

#ifdef __cplusplus
}
#endif

#endif  // __VMM_CUSTOM_H__

