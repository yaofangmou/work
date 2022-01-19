#ifndef __VMM_MEMLIST_MANAGER_H__
#define __VMM_MEMLIST_MANAGER_H__

#include "vmm.h"
#include "vmm_osal.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
    Node_Status_InUse  = 0,
    Node_Status_NoUse,
    Node_Status_BUTT
} Node_Status_E;

typedef struct
{
    UINT32 AllocTimeConsumeInUs;
} Mem_DBG_S;

typedef struct
{
    Node_Status_E  Status;
    VMM_LOCATION_E Location;
    UINT32         ActualSize;
    UINT32         RefCnt;
    UINT32         UseCnt;
    VMM_BUFFER_S   BufInfo;
    ULONG          ReTunnelVirAddr;
    Mem_DBG_S      DbgInfo;
} Mem_Data_S;

typedef struct
{
    struct list_head list;
    Mem_Data_S Data;
} Mem_Node_S;

SINT32 VMM_Memlist_Init(VOID);
VOID VMM_Memlist_Deinit(VOID);
SINT32 VMM_Memlist_AddNode(Mem_Data_S *pData);
SINT32 VMM_Memlist_FindNodeByPhyaddr(UADDR TargetPhyAddr, Mem_Data_S *pData);
SINT32 VMM_Memlist_DeleteNodeByPhyaddr(UADDR TargetPhyAddr);
SINT32 VMM_Memlist_MarkLocation(UADDR TargetPhyAddr, VMM_LOCATION_E Location);
SINT32 VMM_Memlist_MarkStatus(UADDR TargetPhyAddr, Node_Status_E Status);
SINT32 VMM_Memlist_IsEmpty(VOID);
//SINT32 VMM_Memlist_PrintNodeStatus(VOID);
SINT32 VMM_Memlist_ReadProc(VOID *p);
SINT32 VMM_Memlist_FindOneNodeCanBeRls(Mem_Data_S *pData);
SINT32 VMM_Memlist_IsOneNodeCanBeRls(UADDR TargetPhyAddr);
SINT32 VMM_Memlist_SetSpecifiedNodeNoUse(VMM_RLS_BURST_S *pRlsBurst);
SINT32 VMM_Memlist_ShowOneNodeCanBeRls(VMM_RLS_BURST_S *pRlsBurst, Mem_Data_S *pData);
SINT32 VMM_Memlist_ShowOneNode(Mem_Data_S *pData);
SINT32 VMM_Memlist_UpdateBufRec(VMM_BUFFER_S *pBufRec);
SINT32 VMM_Memlist_IsOneBlockExist(VMM_BUFFER_S *pTargetBuf);
SINT32 VMM_Memlist_FindNodeCanBeSplit(UINT32 ExpectLen, SINT64 ExpectPrivID, Mem_Data_S *pData);

#ifdef VCODEC_UT_ENABLE
VMM_PRIVATE SINT32 IsMemNodeOverlap(const VMM_BUFFER_S *pBufA, const VMM_BUFFER_S *pBufB);
VMM_PRIVATE SINT32 IsMemNodeIncludedTargetPhyaddr(const Mem_Data_S *pMemNode, UADDR TargetPhyaddr);
#endif

#ifdef __cplusplus
}
#endif

#endif //__VMM_MEMLIST_MANAGER_H__
