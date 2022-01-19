#ifndef __FSP_HEADER__
#define __FSP_HEADER__

#ifdef __cplusplus
extern "C" {
#endif

#include "public.h"
#include "vfmw.h"
#include "syn_cmn.h"

/*---------------------------- EXTERNAL MACRO --------------------------------*/
#define FSP_OK                      (0)
#define FSP_ERR                     (-1)
#define FSP_WAIT_ARRANGE            (2)

#define FSP_FALSE                   (0)
#define FSP_TRUE                    (1)

#define FSP_NOT_DISPLAY             (0)
#define FSP_WAIT_DISPLAY            (1)

#define MAX_PMV_NUM                 MAX_PMV_SLOT_NUM

#define FS_WATER_MARK               (0xaabbccdd)
#define FS_WATER_MARK_SIZE          (4)


/*----------------------------- EXTERNAL TYPE --------------------------------*/
typedef enum
{
    FS_TYPE_EXCLU,
    FS_TYPE_SHARE,
    FS_TYPE_LINK,
    FS_TYPE_DUMMY,
    FS_TYPE_BUTT
} FSP_FS_TYPE_E;

typedef enum
{
    FS_HARD_CORE,  // FS_TYPE_EXCLU && FS_TYPE_SHARE
    FS_SOFT_CORE,  // FS_TYPE_LINK
    FS_BOTH_CORE,
    FS_CORE_BUTT
} FSP_FS_CORE_E;

typedef enum
{
    FS_STORE_FRAME,
    FS_STORE_FIELD,
    FS_STORE_BUTT
} FSP_FS_STORE_TYPE_E;

typedef enum
{
    FS_STATE_NOT_USE,
    FS_STATE_IN_USE,
    FS_STATE_DEC_OVER,
    FS_STATE_WAIT_DISP,
    FS_STATE_OUT_HANGING,
    FS_STATE_BUTT
} FSP_FS_STATE_E;

typedef enum
{
    FSP_ARRANGE_NEW,
    FSP_ARRANGE_ADD,
    FSP_ARRANGE_REFRESH,
    FSP_ARRANGE_BUTT
} FSP_ARRANGE_MODE_E;

typedef enum
{
    FSP_INST_STATE_NULL,
    FSP_INST_STATE_INUSE,
    FSP_INST_STATE_BUTT
} FSP_INST_STATE_E;

typedef enum
{
    FSP_PARTITION_STATE_BIGIN = 0,
    FSP_PARTITION_STATE_WAIT,
    FSP_PARTITION_STATE_SUCCESS,
    FSP_PARTITION_STATE_FAIL,
    FSP_PARTITION_STATE_BUTT
} FSP_PARTITION_STATE_E;

typedef struct hiFSP_INST_CFG_S
{
    VID_STD_E eVidStd;
    UINT8  UserDec;
    UINT8  BitDepth;
    UINT32 DecFsWidth;
    UINT32 DecFsHeight;
    UINT32 DispFsWidth;
    UINT32 DispFsHeight;
    UINT32 ExpectDecFsNum;
    UINT32 ExpectPmvNum;
    VBOOL bOnlyOneIFrame;
} FSP_INST_CFG_S;

typedef struct
{
    UINT8  IsValid;
    UINT8  IsRef;
    UINT8  IsMap;
    UADDR  PhyAddr;
    UINT8 *VirAddr;
    UADDR  BackTunnelLineNumPhyAddr;
    UADDR  AttachedPhyAddr;
    UINT64 AttachedVirAddr;
    UINT32 AttachedSize;
    SINT32 PhyFsID;
    UINT32 BufSize;
    UINT32 YStride;
    UINT32 UVStride;
    SINT32 Stride_2bit;
    SINT32 LumaOffset_2bit;
    SINT32 ChromOffset_2bit;
    SINT32 HeadStride;
    SINT32 HeadInfoSize;
    SINT32 ChromOffset;
    UINT32 Tick;
    SINT32 LinkRef;
    FSP_FS_STATE_E FsState;
    FSP_FS_STORE_TYPE_E eStoreType;
} FSP_PHY_FS_S;

typedef struct
{
    UINT8  IsValid;
    UINT8  IsInUse;
    UINT8  IsMap;
    SINT32 PmvIdc;
    UADDR  PmvAddr;
    UINT32 PmvSize;
    SINT32 PmvHalfOffset;
    UINT32 Tick;
} FSP_PMV_S;

typedef struct
{
    UINT8  IsValid;
    UINT8  IsInUse;
    UINT8  IsOutHanging;
    SINT32 MetadataIdc;
    UADDR  MetadataAddr;
    UINT32 MetadataSize;
} FSP_METADATA_S;

typedef struct
{
    SINT8  IsRef;
    SINT8  IsDummyFs;
    SINT32 LogicFsID;
    UINT32 RealX_TR;
    UINT32 Tick;
    FSP_FS_TYPE_E  FsType;
    FSP_FS_STATE_E FsState;

    FSP_PHY_FS_S   *pstDecodeFs;
    FSP_PHY_FS_S   *pstDispOutFs;
    FSP_PMV_S      *pstPmv;
    FSP_METADATA_S *pstMetadata;
    IMAGE           stDispImg;
} FSP_LOGIC_FS_S;

typedef struct
{
    SINT32 InstID;
    UINT32 InstTick;
    UINT32 BeHDRChn;
    UINT32 CfgDecFsNum;
    UINT32 CfgDispFsNum;
    UINT32 CfgPmvNum;
    UINT32 CfgMetadataNum;
    FSP_INST_STATE_E eInstState;
    FSP_PARTITION_STATE_E ePartitionState;
    FRAMEBUFFER_ALLOC_TYPE_E eType;

    FSP_INST_CFG_S  stInstCfg;
    MEM_NEED_DESC_S stMemNeed;
    FSP_LOGIC_FS_S  stLogicFs[MAX_FRAME_NUM];
    FSP_PHY_FS_S    stDecFsRec[MAX_FRAME_NUM];
    FSP_PHY_FS_S    stDispFsRec[MAX_FRAME_NUM];
    FSP_PMV_S       stPmvRec[MAX_PMV_NUM];
    FSP_METADATA_S  stMetadataRec[MAX_FRAME_NUM];
} FSP_INST_S;


/*----------------------------EXTERNAL FUNCTION-------------------------------*/
VOID   FSP_Init(VOID);
VOID   FSP_Exit(VOID);
SINT32 FSP_EnableInstance(SINT32 InstID, FSP_INST_S *pFspInst);
VOID   FSP_DisableInstance(SINT32 InstID);
SINT32 FSP_ResetInstance(SINT32 InstID);
UINT8  FSP_IsLogicFsAvailable(FSP_LOGIC_FS_S *pLogicFs);
UINT8  FSP_IsDecFsAvailable(FSP_INST_S *pInst, FSP_PHY_FS_S *pFs);
UINT8  FSP_IsDispFsAvailable(FSP_INST_S *pInst, FSP_PHY_FS_S *pFs);
UINT8  FSP_IsPmvAvailable(FSP_INST_S *pInst, FSP_PMV_S *pPmv);
UINT8  FSP_IsMetadataAvailable(FSP_INST_S *pInst, FSP_METADATA_S *pMetadata);
SINT32 FSP_ArrangeFsPool(SINT32 InstID, FSP_INST_CFG_S *pFspCfg, FSP_ARRANGE_MODE_E Mode);
SINT32 FSP_BindRequireFs(SINT32 InstID, MEM_REPORT_S *pMem);
SINT32 FSP_NewLogicFs(SINT32 InstID, FSP_FS_TYPE_E eFsType);
FSP_LOGIC_FS_S *FSP_LinkLogicFs(SINT32 InstID, SINT32 LinkFsID);
SINT32 FSP_ClearNotInVoQueue(SINT32 InstID, VOID *pArgs);
SINT32 FSP_IfCanGetDecFs(SINT32 InstID, IMAGE_VO_QUEUE *pstVoQue);
VOID   FSP_ReleaseUnusedOldDecFs(SINT32 InstID);
VOID   FSP_ReleaseUnusedCurDecFs(SINT32 InstID);
UINT32 FSP_GetFreeDecFsSlotNum(SINT32 InstID);
VOID   FSP_ClearLogicFs(SINT32 InstID, SINT32 LogicFsID);
VOID   FSP_SetRef(SINT32 InstID, SINT32 LogicFsID, SINT32 IsRef);
SINT32 FSP_GetRef(SINT32 InstID, SINT32 LogicFsID);
VOID   FSP_SetDisplay(SINT32 InstID, SINT32 LogicFsID, SINT32 IsWaitDisp);
SINT32 FSP_GetDisplay(SINT32 InstID, SINT32 LogicFsID);
SINT32 FSP_SetStoreType(SINT32 InstID, SINT32 LogicFsID, FSP_FS_STORE_TYPE_E eStoreType);
FSP_FS_STORE_TYPE_E FSP_GetStoreType(SINT32 InstID, SINT32 PhyFsID);
VOID   FSP_ReleasePmv(SINT32 InstID, SINT32 LogicFsID);
UADDR  FSP_GetPmvAddr(SINT32 InstID, SINT32 LogicFsID);
SINT32 FSP_IsNewFsAvailable(SINT32 InstID);
VOID   FSP_GetDecFsAddrTab(SINT32 InstID, SINT32 *pDecFsNum, UADDR *pDecFsAddrTab);
VOID   FSP_GetPmvAddrTab(SINT32 InstID, SINT32 *pPmvNum, UADDR *pPmvAddrTab);
SINT32 FSP_GetNullLogicFs(SINT32 InstID);
UINT32 FSP_GetMinAvailableDecFsNum(SINT32 InstID);
UINT32 FSP_GetTotalDispFsNum(SINT32 InstID);
UINT32 FSP_GetWaitDispFsNum(SINT32 InstID);
SINT32 FSP_MarkImageOutHanging(SINT32 InstID, IMAGE *pImage);
SINT32 FSP_UnMarkImageOutHanging(SINT32 InstID, IMAGE *pImage);
IMAGE *FSP_GetFsImagePtr(SINT32 InstID, SINT32 LogicFsID);
VOID FSP_CheckIfFsPolluted(SINT32 InstID);
FSP_LOGIC_FS_S *FSP_GetLogicFs(SINT32 InstID, SINT32 LogicFsID);
FSP_LOGIC_FS_S *FSP_GetLogicFs_By_DecAddr(SINT32 InstID, FSP_FS_CORE_E TargetCore, UADDR DecAddr);
FSP_LOGIC_FS_S *FSP_GetLogicFs_By_DispAddr(SINT32 InstID, FSP_FS_CORE_E TargetCore, UADDR DispAddr);
FSP_PHY_FS_S *FSP_GetPairDispFs_By_DecAddr(SINT32 InstID, FSP_FS_CORE_E TargetCore, UADDR DecAddr);
FSP_INST_S *FSP_GetInst(SINT32 InstID);
SINT32 FSP_SetFrameBufferMode(SINT32 InstID, FRAMEBUFFER_ALLOC_TYPE_E eType);
SINT32 FSP_BindExternFs(SINT32 InstID, EXTERN_BUFFER_S *pExternBuffer);
SINT32 FSP_UnBindExternFs(SINT32 InstID, EXTERN_BUFFER_S *pExternBuffer);
SINT32 FSP_SetDispFsNum(SINT32 InstID, UINT32 Num);
VOID FSP_DumpState(SINT32 ChanId, VOID *Page);

SINT32 FSP_GetMemInfo(SINT32 ChanId, CHAN_MEM_INFO_S *pstMemInfo);

#ifdef __cplusplus
}
#endif

#endif

