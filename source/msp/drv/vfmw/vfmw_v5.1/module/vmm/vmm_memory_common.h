#ifndef __VMM_MEMORY_COMMON_H__
#define __VMM_MEMORY_COMMON_H__

#include "vmm.h"

SINT32 VMM_Alloc_ForceMMZ(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo);
VOID   VMM_Release_ForceMMZ(VMM_BUFFER_S *pBufInfo);
SINT32 VMM_Map_ForceMMZ(UINT32 IsCached, VMM_BUFFER_S *pBufInfo);
VOID   VMM_Unmap_ForceMMZ(VMM_BUFFER_S *pBufInfo);
SINT32 VMM_AllocAndMap_ForceMMZ(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo);
VOID   VMM_UnmapAndRelease_ForceMMZ(VMM_BUFFER_S *pBufInfo);

SINT32 VMM_Alloc_Adapt(SINT8 *pBufferName, UINT32 BufSize, VMM_BUFFER_S *pOutBufInfo);
VOID   VMM_Release_Adapt(VMM_BUFFER_S *pBufInfo);
SINT32 VMM_Map_Adapt(UINT32 IsCached, VMM_BUFFER_S *pBufInfo);
VOID   VMM_Unmap_Adapt(VMM_BUFFER_S *pBufInfo);
SINT32 VMM_AllocAndMap_Adapt(SINT8 *pBufferName, UINT32 BufSize, UINT32 IsCached, VMM_BUFFER_S *pOutBufInfo);
VOID   VMM_UnmapAndRelease_Adapt(VMM_BUFFER_S *pBufInfo);

#endif  // __VMM_MEMORY_COMMON_H__

