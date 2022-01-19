#ifndef __VMM_MEMORY_PRESERVE_H__
#define __VMM_MEMORY_PRESERVE_H__

#include "vmm.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
    UINT8  IsInit;
    UINT8  IsAvailable;
    UINT8  ReservedBufValid;
    UINT8  ReservedBufOutSide;
    UINT32 FreeSize;
    UINT32 FreezeSize;
    VMM_BUFFER_S MemPool;
    VMM_BUFFER_S ReservedBufInfo;
} MEM_PRE_ALLOCATION_CTX;

#define MEM_PRESERVE_FAILURE                  (0xFFFFFFFF)
#define MEM_PRESERVE_INVALID_PARA             (0xFF040001)
#define MEM_PRESERVE_ALLOC_FAILED             (0xFF040002)
#define MEM_PRESERVE_MAP_FAILED               (0xFF040003)
#define MEM_PRESERVE_NOT_SUPPORT              (0xFF040004)
#define MEM_PRESERVE_NULL_PTR                 (0xFF040005)
#define MEM_PRESERVE_NOT_AVAILABLE            (0xFF040006)
#define MEM_PRESERVE_NOT_ENOUGH               (0xFF040007)
#define MEM_PRESERVE_NOT_INIT                 (0xFF040008)
#define MEM_PRESERVE_STATE_ABNORMAL           (0xFF040009)

#define MEM_PRESERVE_TRUE                     (1)
#define MEM_PRESERVE_FALSE                    (0)

SINT32 VMM_Preserve_Init(VOID *pArgs);

VOID   VMM_Preserve_Deinit(VOID);

SINT32 VMM_Preserve_Alloc(VMM_BUFFER_S *pMemInfo);

SINT32 VMM_Preserve_Release(VMM_BUFFER_S *pMemInfo);

SINT32 VMM_Preserve_Map(VMM_BUFFER_S *pMemInfo);

SINT32 VMM_Preserve_Unmap(VMM_BUFFER_S *pMemInfo);

SINT32 VMM_Preserve_Invoke(VMM_INVOKE_ATTR_S *pParam);

VOID   VMM_Preserve_ReadProc(VOID *p);


#ifdef __cplusplus
}
#endif

#endif  // __VMM_MEMORY_PRESERVE_H__


