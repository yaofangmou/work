#ifndef __VMM_MEMORY_OPS_H__
#define __VMM_MEMORY_OPS_H__

#include "vmm.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MEM_OPS_SUCCESS       (0x0)
#define MEM_OPS_FAILURE       (0xFFFFFFFF)
#define MEM_OPS_INVALID_PARA  (0xFF020001)
#define MEM_OPS_ALLOC_FAILED  (0xFF020002)
#define MEM_OPS_MAP_FAILED    (0xFF020003)
#define MEM_OPS_NOT_SUPPORT   (0xFF020004)
#define MEM_OPS_NULL_PTR      (0xFF020005)
#define MEM_OPS_NULL_FUNC_PTR (0xFF020006)
#define MEM_OPS_NOT_INIT      (0xFF020007)

#define MEM_OPS_TRUE  (1)
#define MEM_OPS_FALSE (0)

#define INVALID_HANDLE (0xFFFFFFFF)

SINT32 VMM_Ops_Init(VMM_CALL_FUN_PTR_S *pCallBack);
VOID VMM_Ops_Deinit(VOID);
SINT32 VMM_Ops_Alloc(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Ops_Release(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Ops_Map(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Ops_Unmap(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Ops_Invoke(VMM_INVOKE_ATTR_S *pParam);
VOID VMM_Ops_ReadProc(VOID *p);

#ifdef __cplusplus
}
#endif

#endif  // __VMM_MEMORY_OPS_H__

