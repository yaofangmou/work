#ifndef __HI_DRV_VMM_H__
#define __HI_DRV_VMM_H__

#include "vfmw.h"

#ifdef __cplusplus
extern "C" {
#endif

#define VMM_MAX_NAME_LEN (32)
#define VMM_SUCCESS                     (SINT32)(0)
#define VMM_FAILURE                     (SINT32)(0xFFFFFFFF)
#define ERR_VMM_ALLOC_FAILED            (SINT32)(0xFF000000)
#define ERR_VMM_INIT_FAILED             (SINT32)(0xFF000001)
#define ERR_VMM_INVALID_PARA            (SINT32)(0xFF000002)
#define ERR_VMM_NULL_PTR                (SINT32)(0xFF000003)
#define ERR_VMM_NOT_SUPPORT             (SINT32)(0xFF000004)
#define ERR_VMM_FULL                    (SINT32)(0xFF000005)
#define ERR_VMM_EMPTY                   (SINT32)(0xFF000006)
#define ERR_VMM_NOT_INIT                (SINT32)(0xFF000007)
#define ERR_VMM_NODE_ALREADY_EXIST      (SINT32)(0xFF000008)
#define ERR_VMM_LOCATION_CONFLICT       (SINT32)(0xFF000009)
#define ERR_VMM_NODE_NOT_EXIST          (SINT32)(0xFF00000A)
#define ERR_VMM_INVALID_STATE           (SINT32)(0xFF00000B)
#define ERR_VMM_MSG_NEED_REPROCESS      (SINT32)(0xFF00000C)

#define VMM_TRUE                        (SINT32)(1)
#define VMM_FALSE                       (SINT32)(0)

/******************************************************************************************************************/
/*      CMD_TYPE                        |         INPUT_PARAM_TYPE        |          OUTPUT_PARAM_TYPE            */
/*----------------------------------------------------------------------------------------------------------------*/
/*     VMM_CMD_Alloc                    |        VMM_BUFFER_S             |            VMM_BUFFER_S               */
/*     VMM_CMD_Release                  |        VMM_BUFFER_S             |            VMM_BUFFER_S               */
/*     VMM_CMD_ReleaseBurst             |        VMM_RLS_BURST_S          |            VMM_RLS_BURST_S            */
/*----------------------------------------------------------------------------------------------------------------*/
/*     VMM_CMD_BLK_Alloc                |        VMM_BUFFER_S             |            VMM_BUFFER_S               */
/*     VMM_CMD_BLK_Release              |        VMM_BUFFER_S             |            NULL                       */
/*     VMM_CMD_BLK_Map                  |        VMM_BUFFER_S             |            VMM_BUFFER_S               */
/*     VMM_CMD_BLK_Unmap                |        VMM_BUFFER_S             |            NULL                       */
/*     VMM_CMD_BLK_ReleaseBurst         |        VMM_RLS_BURST_S          |            NULL                       */
/*     VMM_CMD_BLK_SetPriorityPolicy    |        undetermined             |            NULL                       */
/*     VMM_CMD_BLK_GetMemNodeInfo       |        undetermined             |            undetermined               */
/*     VMM_CMD_BLK_SetLocation          |        VMM_ATTR_S               |            NULL                       */
/*     VMM_CMD_BLK_CancleCmd            |        VMM_CANCLE_CMD_S         |            NULL                       */
/*     VMM_CMD_BLK_OpsInvoke            |        VMM_INVOKE_ATTR_S        |            NULL                       */
/*----------------------------------------------------------------------------------------------------------------*/

typedef enum
{
    VMM_CMD_Alloc = 0,
    VMM_CMD_Release,
    VMM_CMD_ReleaseBurst,
    VMM_CMD_TYPE_BUTT
} VMM_CMD_TYPE_E;

typedef enum
{
    VMM_CMD_BLK_Alloc = 0,
    VMM_CMD_BLK_Release,
    VMM_CMD_BLK_Map,
    VMM_CMD_BLK_Unmap,
    VMM_CMD_BLK_ConfigMemNode, /*External configuration frame memory(just one Node)*/
    VMM_CMD_BLK_ReleaseBurst,
    VMM_CMD_BLK_SetPriorityPolicy,
    VMM_CMD_BLK_GetMemNodeInfo,
    VMM_CMD_BLK_SetLocation,
    VMM_CMD_BLK_CancleCmd,
    VMM_CMD_BLK_OpsInvoke,
    VMM_CMD_BLK_TYPE_BUTT
} VMM_CMD_BLK_TYPE_E;

typedef enum
{
    VMM_CMD_PRIO_MIN = 0,
    VMM_CMD_PRIO_MAX,
    VMM_CMD_PRIO_SECONDARY,
    VMM_CMD_PRIO_BUTT
} VMM_CMD_PRIO_E;

typedef enum
{
    VMM_MEM_TYPE_SYS_ADAPT = 0,
    VMM_MEM_TYPE_FORCE_MMZ,
    VMM_MEM_TYPE_PRE_ALLOC,
    VMM_MEM_TYPE_EXT_RESERVE,
    VMM_MEM_TYPE_EXT_CONFIG,
    VMM_MEM_TYPE_BUTT
} VMM_MEM_TYPE_E;

typedef enum
{
    VMM_LOCATION_INSIDE = 0,
    VMM_LOCATION_OUTSIDE,
    VMM_LOCATION_BUTT
} VMM_LOCATION_E;

typedef enum
{
    VMM_INVOKE_CONFIG_MEM_POOL     = 0,       /*ParamType: VMM_BUFFER_S*/
    VMM_INVOKE_NOTICE_ALLOC,                  /*ParamType: VMM_NOTICE_PARAM_S*/
    VMM_INVOKE_GET_RESERVED_BUF,              /*ParamType: VMM_BUFFER_S*/
    VMM_INVOKE_PUT_RESERVED_BUF,              /*ParamType: VMM_BUFFER_S*/
    VMM_INVOKE_BUTT
} VMM_INVOKE_E;

typedef struct
{
    SINT8  BufName[VMM_MAX_NAME_LEN];
    ULONG  pStartVirAddr;
    UADDR  StartPhyAddr;
    UINT32 Size;
    UINT32 Map;
    UINT32 Cache;
} VMM_BUFFER_NODE_S;

typedef struct
{
    SINT8             IsValid;
    VMM_BUFFER_NODE_S BackTunelBuf;
} VMM_BUFFER_SUPPLEMENT_S;

typedef struct
{
    SINT8  BufName[VMM_MAX_NAME_LEN];
    ULONG  pStartVirAddr;
    UADDR  StartPhyAddr;
    UINT32 Size;
    UINT32 AlignSize;
    UINT32 UnionNum;
    UINT32 SecFlag;
    UINT32 Map;
    UINT32 Cache;
    VMM_MEM_TYPE_E MemType;
    VMM_BUFFER_SUPPLEMENT_S SupplementInfo;

    SINT64 PrivID;
} VMM_BUFFER_S;

typedef struct
{
    SINT32 ChanId;
    SINT32 (*pExtIntf)(SINT32 ChanID, VOID *pFuncPtr);

    CHAN_MEM_INFO_S MemInfo;
} VMM_NOTICE_PARAM_S;

typedef struct
{
    VMM_INVOKE_E Type;
    VMM_MEM_TYPE_E MemType;

    union
    {
        VMM_BUFFER_S       BufInfo;
        VMM_NOTICE_PARAM_S NoticeParam;
    }AttrUnion;

} VMM_INVOKE_ATTR_S;

typedef struct
{
    UADDR          PhyAddr;
    VMM_LOCATION_E Location;
} VMM_ATTR_S;

typedef struct
{
    SINT64         PrivID;
    UINT64         PrivMask;
} VMM_RLS_BURST_S;

typedef struct
{
    VMM_CMD_TYPE_E CmdID;
    SINT64         PrivID;
    UINT64         PrivMask;
} VMM_CANCLE_CMD_S;

typedef struct hiVMM_CALL_FUN_PTR_S
{
    SINT32 (*pfun_Vmm_CmdCallBack)(VMM_CMD_TYPE_E CmdID, VOID *pParamOut, SINT32 RetVal);
    SINT32 (*pfun_Vmm_GetBufDetail)(SINT32 ChanID, VOID *pstMemInfo);
} VMM_CALL_FUN_PTR_S;

SINT32 VMM_ModuleInit(VMM_CALL_FUN_PTR_S *pVmmCallback);
SINT32 VMM_ModuleDeInit(VOID);
SINT32 VMM_SendCommandBlock(VMM_CMD_BLK_TYPE_E CmdID, VOID *pParamInOut);
SINT32 VMM_SendCommand(VMM_CMD_TYPE_E CmdID, VMM_CMD_PRIO_E Proir, VOID *pParamIn);

#ifdef __cplusplus
}
#endif


#endif //__HI_DRV_VMM_H__
