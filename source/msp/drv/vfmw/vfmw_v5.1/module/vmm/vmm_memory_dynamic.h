#ifndef __VMM_MEMORY_DYNAMIC_H__
#define __VMM_MEMORY_DYNAMIC_H__

#include "vmm.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MEM_DYNAMIC_FAILURE      (0xFFFFFFFF)
#define MEM_DYNAMIC_INVALID_PARA (0xFF030001)
#define MEM_DYNAMIC_ALLOC_FAILED (0xFF030002)
#define MEM_DYNAMIC_MAP_FAILED   (0xFF030003)
#define MEM_DYNAMIC_NOT_SUPPORT  (0xFF030004)
#define MEM_DYNAMIC_NULL_PTR     (0xFF030005)

#define MEM_DYNAMIC_TRUE  (1)
#define MEM_DYNAMIC_FALSE (0)

SINT32 VMM_Dynamic_Alloc(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Dynamic_Release(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Dynamic_Map(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Dynamic_Unmap(VMM_BUFFER_S *pMemInfo);
SINT32 VMM_Dynamic_Init(VOID *pArgs);
VOID   VMM_Dynamic_Deinit(VOID);
SINT32 VMM_Dynamic_Invoke(VMM_INVOKE_ATTR_S *pParam);
VOID   VMM_Dynamic_ReadProc(VOID *p);

#ifdef __cplusplus
}
#endif

#endif  // __VMM_MEMORY_DYNAMIC_H__

