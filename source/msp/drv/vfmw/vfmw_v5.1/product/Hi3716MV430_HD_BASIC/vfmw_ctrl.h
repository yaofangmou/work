#ifndef __VFMV_CTRL_H__
#define __VFMV_CTRL_H__

#include "vfmw.h"
#include "fsp.h"
#include "sysconfig.h"
#include "syntax.h"
#ifdef ENV_SOS_KERNEL
#include "vfmw_tee_client.h"
#endif

#define VCTRL_OK               (0)
#define VCTRL_ERR              (-1)
#define VCTRL_ERR_VDM_BUSY     (-2)
#define VCTRL_ERR_NO_FSTORE    (-3)
#define VCTRL_ERR_NO_STREAM    (-4)

#define VCTRL_FIND_PTS         (0)
#define VCTRL_PTS_ILLEAGLE     (-1)
#define VCTRL_SEEKING_PTS      (-2)

#define VCTRL_ADD_EXTRA        (1)
#define VCTRL_IGNOR_EXTRA      (2)

#define MAX_USRDEC_FRAME_NUM   (16)

// time record pos
#define THREAD_START           (0)
#define THREAD_END             (1)

#define SEGCOPY_START          (2)
#define SEGCOPY_END            (3)

#define MAP_START              (4)
#define MAP_END                (5)

#define SYNTAX_START           (6)
#define SYNTAX_END             (7)

#define VDH_HARDWARE_START     (8)
#define VDH_HARDWARE_END       (9)

#define ISR_START              (9)
#define ISR_END                (10)

#define NEXT_THREAD_START      (11)

#define COPY_SIZE_DATA         (0)
#define VDH_DATA               (1)

#define MAX_RECORD_NUM         (15)

#define MAX_RECORD_POS         (12)   //TIME
#define MAX_RECORD_DATA        (2)    //DATA

#define STAT_GET_RESIZE_START_TIME(ChanID)                        \
    if (g_VfmwChanStat[ChanID].bCalcResizeCostTime == VDEC_FALSE)     \
    {                                                                 \
        g_VfmwChanStat[ChanID].bCalcResizeCostTime = VDEC_TRUE;       \
        g_VfmwChanStat[ChanID].u32ResizeStart = OSAL_FP_get_time_ms();\
    }

#define STAT_GET_PARTITION_START_TIME(ChanID)                         \
    if (g_VfmwChanStat[ChanID].bCalcResizeCostTime == VDEC_TRUE && g_VfmwChanStat[ChanID].u32PartitionStart == 0)          \
    {                                                                     \
        g_VfmwChanStat[ChanID].u32PartitionStart = OSAL_FP_get_time_ms(); \
    }

#define STAT_CALC_RESIZE_COST_TIME(ChanID)                            \
    if (g_VfmwChanStat[ChanID].bCalcResizeCostTime)                       \
    {                                                                     \
        UINT32 CurTime = OSAL_FP_get_time_ms();                           \
        g_VfmwChanStat[ChanID].u32WaitCost = g_VfmwChanStat[ChanID].u32PartitionStart - g_VfmwChanStat[ChanID].u32ResizeStart; \
        g_VfmwChanStat[ChanID].u32PartitionCost = CurTime - g_VfmwChanStat[ChanID].u32PartitionStart; \
        g_VfmwChanStat[ChanID].u32ResizeTotalCost = CurTime - g_VfmwChanStat[ChanID].u32ResizeStart;  \
        g_VfmwChanStat[ChanID].u32ResizeStart = 0;                        \
        g_VfmwChanStat[ChanID].u32PartitionStart = 0;                     \
        g_VfmwChanStat[ChanID].bCalcResizeCostTime = VDEC_FALSE;          \
    }

typedef struct hiVFMW_CHAN_STAT
{
    UINT32 u32FrBeginTime;
    UINT32 u32FrImgNum;
    UINT32 u32FrFrameRate;

    UINT32 u32FirstRawArrivedTime;
    UINT32 u32FirstFrameStoreRequireTime;
    UINT32 u32FirstFrameStoreReadyTime;
    UINT32 u32FirstFrameStartDecodeTime;
    UINT32 u32FirstFrameDecodeOverTime;
    UINT32 u32FirstFrameOutputTime;
    UINT32 u32FirstFrameReceiveTime;

    UINT32 u32ChanStartTime;
    UINT32 u32ChanCreatTime;
    UINT32 u32ChanAllocMemTime;
    UINT32 u32ChanDestroyTime;
    UINT32 u32ChanFreeMemTime;
    UINT32 u32ChanRestTime;

    VBOOL  bCalcResizeCostTime;
    UINT32 u32ResizeStart;
    UINT32 u32PartitionStart;
    UINT32 u32WaitCost;
    UINT32 u32PartitionCost;
    UINT32 u32ResizeTotalCost;

    UINT32 u32SkipFind;
    UINT32 u32SkipDiscard;
    UINT32 u32IsFieldFlag;
} VFMW_CHAN_STAT_S;

typedef struct hiVFMW_GLOBAL_STAT
{
    UINT32 u32VdhStatisticStartTimeInMs;
    UINT32 u32VdhLastStartTimeInMs;
    UINT32 u32VdhWorkTimeInMs;
    UINT32 u32VdhCycleTime;
    UINT32 u32VdhLoad;
    UINT32 u32VdhCycleLoad;
    UINT32 u32VdhIrqPerSec;

    UINT32 u32PicNum;
    UINT32 u32AccountVdhKiloCycle;
    UINT32 u32VdhKiloCyclePerSecond;
    UINT32 u32Period;

    UINT32 u32ScdBeginTime;
    UINT32 u32ScdLastStartTime;
    UINT32 u32ScdWorkTime;
    UINT32 u32ScdLoad;
} VFMW_GLOBAL_STAT_S;

typedef enum
{
    CAP_HEVC_SPECIFIC     = -2,
    INVALID_CHAN_ID       = -1,
    VALID_CHAN_ID_START   = 0,
} ARRANGE_FLAG_E;

typedef enum hiTASKSTATE_E
{
    TASK_STATE_EXIT = 0,
    TASK_STATE_STOP,
    TASK_STATE_RUNNING,
    TASK_STATE_BUTT
} TASK_STATE_E;

typedef enum hiTASKCMD_E
{
    TASK_CMD_NONE = 0,
    TASK_CMD_START,
    TASK_CMD_STOP,
    TASK_CMD_KILL,
    TASK_CMD_BUTT
} TASK_CMD_E;

typedef enum hiChanDecCore
{
    DEC_CORE_VDM,
    DEC_CORE_IMEDIA_H263,
    DEC_CORE_IMEDIA_SORENSON,
    DEC_CORE_BUTT
} CHAN_DEC_CORE_E;

typedef enum hiLastFrameState
{
    LAST_FRAME_INIT = 0,
    LAST_FRAME_RECEIVE,
    LAST_FRAME_REPORT_SUCCESS,
    LAST_FRAME_REPORT_FAILURE,
    LAST_FRAME_REPORT_FRAMEID,
    LAST_FRAME_BUTT
} LAST_FRAME_STATE_E;

typedef struct
{
    SINT32 SelfAllocChanMem_vdh;
    SINT32 SelfAllocChanMem_scd;
    SINT32 SelfAllocChanMem_ctx;
} VDEC_CHAN_MEM_FLAG_S;

typedef struct hiDRV_MEM_S
{
    MEM_RECORD_S  stVdmHalMem[MAX_VDH_NUM];
    MEM_RECORD_S  stScdCmnMem[MAX_SCD_NUM];
#ifdef VFMW_VP9_SUPPORT
    MEM_RECORD_S  stVp9ProbMem[MAX_VDH_NUM];
#endif
    MEM_DESC_S    stExtHalMem;
    MEM_RECORD_S  stVdmReg;
    MEM_RECORD_S  stSystemReg;
} DRV_MEM_S;

typedef struct hiDRV_IRQ_RECORD_S
{
    SINT32 VdhIrq[MAX_VDH_NUM];
    SINT32 ScdIrq[MAX_SCD_NUM];
    SINT32 vdh_mmu_irq[MAX_VDH_NUM];
} DRV_IRQ_RECORD_S;

typedef struct hi_VFMW_CHAN_CMP_PARA
{
    UINT32 VCmpEnable;
    UINT32 LossCmpEnable;
    UINT32 YCmpRatio;
    UINT32 UVCmpRatio;
} VFMW_CHAN_CMP_PARA_S;

typedef struct hiVFMW_CTRL_DATA_S
{
    SINT32        s32IsVCTRLOpen;
    TASK_STATE_E  eTaskState;
    TASK_CMD_E    eTaskCommand;
    VOID *hThread;
    SINT32        s32ThreadPos;
    SINT32        s32ThisChanIDPlus1;
    DRV_MEM_S     stDrvMem;
    SINT32(*event_report_vdec)(SINT32 ChanID, SINT32 type, VOID *p_args);
    SINT32(*event_report_omxvdec)(SINT32 ChanID, SINT32 type, VOID *p_args);
    DRV_IRQ_RECORD_S stIrqRecord;
} VFMW_CTRL_DATA_S;

typedef struct hiVFMW_CHAN_MEM_S
{
    SINT32 s32SelfAllocChanMem_vdh;
    SINT32 s32SelfAllocChanMem_scd;
    SINT32 s32SelfAllocChanMem_ctx;
    MEM_RECORD_S *pChanMem_vdh;
    MEM_RECORD_S *pChanMem_scd;
    MEM_RECORD_S *pChanMem_ctx;
} VFMW_CHAN_MEM_S;

typedef struct hiVFMW_CHAN_S
{
    SINT8  isMiracastChan;
    SINT32 s32ChanID;
    SINT64 UniqueID;
    SINT32 s32IsOpen;
    SINT32 s32IsRun;
    SINT32 s32IsInit;
    SINT32 s32Priority;
    SINT32 s32StopSyntax;
    SINT32 MatchVdhIdPlus1;
    UINT32 u32timeLastDecParamReady;
    SINT32 s32SCDInstID;
    SINT32 s32VDMInstID;
    SINT32 s32SendStreamAgainFlag;
    UINT32 u32DynamicFrameStoreAllocEn;
    SINT32 s32H264Score;
    SINT32 s32Mpeg2Score;
    SINT32 s32FindStartCodeCnt;
    SINT32 s32LastTwoStartCode;
    SINT32 s32LastOneStartCode;
    SINT32 s32CurrentStartCode;
    SINT32 s32ScdInputMmuEn;
    UINT32 DecodeFrameNumber;
    UINT32 OutputFrameNumber;
    UINT32 DecIFrameNum;
    UINT32 DecPFrameNum;
    UINT32 DecBFrameNum;
    SINT32 s32CountNoDecparamFlag;
    UINT32 u32NoDecparamStartTime;
    UADDR  ChanCreateTimeInMs;
    VBOOL  AndroidTest;
    VBOOL  bWakeUpDecThread;
    VID_STD_E eVidStd;
    CHAN_DEC_CORE_E eDecCore;
    FRAME_PACKING_TYPE_E  eLastFramePackingType;
    LAST_FRAME_STATE_E eLastFrameState;
    VDEC_ADAPTER_TYPE_E   eAdapterType;
    VDEC_CHAN_CAP_LEVEL_E eChanCapLevel;

    SINT32 s32SelfAllocChanMem_vdh;
    SINT32 s32SelfAllocChanMem_scd;
    SINT32 s32SelfAllocChanMem_ctx;

    UADDR  ChanScdMem;
    SINT32 ChanScdSize;
    UADDR  ChanHalMem;
    SINT32 ChanHalSize;
    MEM_RECORD_S stChanMem_ctx;
    MEM_RECORD_S stChanMem_vdh;
    MEM_RECORD_S stChanMem_scd;

    FSP_INST_S      FspInst;
    STREAM_INTF_S   stStreamIntf;
    IMAGE_INTF_S    stImageIntf;
    DEI_MEM_QUERY_INTF_S  deiMemQueryIntf;
    IMAGE_FORMAT    stRecentImgformat;
    SM_INSTANCE_S   SmInstArray;
    VDEC_CHAN_CFG_S stChanCfg;
    USRDEC_FRAME_DESC_S stRecentUsrdecFrame;
    SYNTAX_EXTRA_DATA_S stSynExtraData;

    SYNTAX_CTX_S stSynCtx; // this member must be the last one
} VFMW_CHAN_S;

extern VFMW_CHAN_STAT_S g_VfmwChanStat[MAX_CHAN_NUM];
extern VFMW_GLOBAL_STAT_S g_VfmwGlobalStat[MAX_VDH_NUM];

SINT32 VCTRL_OpenVfmw(VDEC_OPERATION_S *pArgs);
SINT32 VCTRL_SetCallBack(VDEC_ADAPTER_TYPE_E eType, SINT32(*event_report)(SINT32 ChanID, SINT32 type, VOID *p_args));
SINT32 VCTRL_CloseVfmw(VOID);
VOID   VCTRL_Suspend(VOID);
VOID   VCTRL_Resume(VOID);
SINT32 VCTRL_CreateChan(VDEC_CHAN_CAP_LEVEL_E eCapLevel, VDEC_CHAN_OPTION_S *pChanOption, SINT32 flag, SINT32 OneChanMemFlag);
SINT32 VCTRL_DestroyChan(SINT32 ChanID);
SINT32 VCTRL_StartChan(SINT32 ChanID);
SINT32 VCTRL_StopChan(SINT32 ChanID);
SINT32 VCTRL_StopChanWithCheck(SINT32 ChanID);
SINT32 VCTRL_GetChanCfg(SINT32 ChanID, VDEC_CHAN_CFG_S *pstCfg);
SINT32 VCTRL_ConfigChan(SINT32 ChanID, VDEC_CHAN_CFG_S *pstCfg);
SINT32 VCTRL_ResetChanWithOption(SINT32 ChanID, VDEC_CHAN_RESET_OPTION_S *pOption);
SINT32 VCTRL_ReleaseStream(SINT32 ChanID);
SINT64 VCTRL_GetChanUniqueID(SINT32 ChanID);
SINT32 VCTRL_ResetChan(SINT32 ChanID);
VOID   VCTRL_GetChanState(SINT32 ChanID, VDEC_CHAN_STATE_S *pstChanState);
SINT32 VCTRL_SetStreamInterface(SINT32 ChanID, VOID *pstStreamIntf);
STREAM_INTF_S *VCTRL_GetStreamInterface(SINT32 ChanID);
SINT32 VCTRL_GetChanMemSize(VDEC_CHAN_CAP_LEVEL_E eCapLevel, VDEC_CHAN_OPTION_S *pChanOption, DETAIL_MEM_SIZE *pDetailMemSize, SINT32 flag);
SINT32 VCTRL_GetStreamSize(SINT32 ChanID, SINT32 *pArgs);
SINT32 VCTRL_SetDiscardPicParam(SINT32 ChanID, VDEC_DISPIC_PARAM_S *pArgs);
VID_STD_E VCTRL_GetVidStd(SINT32 ChanId);
VOID   VCTRL_GetHDRConfigInfo(SINT32 ChanId, HDR_INPUT_S *pstHDRInput);
VOID  *VCTRL_GetDecParam(SINT32 ChanId);
VOID   VCTRL_VdmPostProc(SINT32 ChanId, SINT32 ErrRatio, LUMA_INFO_S *pLumaInfo, SINT32 VdhId);
SINT32 VCTRL_GetChanImage(SINT32 ChanID, IMAGE *pImage);
SINT32 VCTRL_ReleaseChanImage(SINT32 ChanID, IMAGE *pImage);
SINT32 VCTRL_RunProcess(VOID);
VOID   VCTRL_ExtraWakeUpThread(VOID);
SINT32 VCTRL_GetImageBuffer(SINT32 ChanId);
SINT32 VCTRL_GetChanIDByCtx(VOID *pCtx);
SINT32 VCTRL_IsChanActive(SINT32 ChanID);
VOID   VCTRL_GetChanImgNum(SINT32 ChanID, SINT32 *pRefImgNum, SINT32 *pReadImgNum, SINT32 *pNewImgNum);
SINT32 VCTRL_SeekPts(SINT32 ChanID, UINT64 *pArgs);
SINT32 VCTRL_ConfigFFFBSpeed(SINT32 ChanID, SINT32 *pArgs);
SINT32 VCTRL_ConfigPVRInfo(SINT32 ChanID, VFMW_CONTROLINFO_S *pArgs);
SINT32 VCTRL_SetDbgOption(UINT32 opt, UINT8 *p_args);
VOID   VCTRL_SetLastFrameState(SINT32 ChanID, LAST_FRAME_STATE_E eState);
SINT32 VCTRL_OutputLastFrame(SINT32 ChanId);
VOID   VCTRL_ResetHardware(SINT32 ChanID);
VOID   VCTRL_OpenHardware(SINT32 ChanID);
VOID   VCTRL_CloseHardware(SINT32 CurChanID);
IMAGE_VO_QUEUE *VCTRL_GetChanVoQue(SINT32 ChanID);
VOID   VCTRL_EnableEsBuf(SINT32 ChanID);
VOID   VCTRL_DisableEsBuf(SINT32 ChanID);
VBOOL  VCTRL_IfNoGapEnable(SINT32 ChanID);
SINT32 VCTRL_IfEsBufEnable(SINT32 ChanID);
SINT32 VCTRL_GetChanCrcMode(SINT32 ChanID);
VOID   VCTRL_SetChanWaitFsFlag(SINT32 ChanID, SINT32 NewFlag);
VOID   VCTRL_ClearDecparam(SINT32 ChanId);
SINT32 VCTRL_BindRequireMem(SINT32 ChanID, MEM_REPORT_S *pMem);
UINT32 VCTRL_GetOccupiedNum(SINT32 ChanID, SINT32 Width, SINT32 Height);
UINT32 VCTRL_GetExtraFrameNum(SINT32 ChanID);
VBOOL  VCTRL_IsResolutionValid(SINT32 ChanID, SINT32 Width, SINT32 Height);
VOID   VCTRL_RecordPosTime(UINT32 pos);
VOID   VCTRL_RecordData(UINT32 pos, UINT32 Data);
#ifdef HI_PROC_SUPPORT
SINT32 VCTRL_ShowProcCommand(UINT32 Index, char *pShowStr, UINT32 StrLen);
#endif
SINT32 VCTRL_SetFrameBufferMode(SINT32 ChanID, FRAMEBUFFER_ALLOC_TYPE_E eType);
SINT32 VCTRL_BindExternBuffer(SINT32 ChanID, EXTERN_BUFFER_S *pExternBuffer);
SINT32 VCTRL_UnBindExternBuffer(SINT32 ChanID, EXTERN_BUFFER_S *pExternBuffer);
SINT32 VCTRL_SetFrameBufferNum(SINT32 ChanID, UINT32 Num);
VOID   VCTRL_InformVdmFree(SINT32 ChanID);

#ifdef VFMW_USER_SUPPORT
SINT32 VCTRL_USERDEC_GetFrameBuffer(SINT32 ChanID, USRDEC_FRAME_DESC_S *pUsrdecFrame);
SINT32 VCTRL_USERDEC_PutFrameBuffer(SINT32 ChanID, USRDEC_FRAME_DESC_S *pUsrdecFrame);
SINT32 VCTRL_USERDEC_RecycleFrameBuffer(USER_CTX_S *pCtx, UINT32 ImgID);
#endif

#if defined(VFMW_H264_SED_ONLY_SUPPORT) || defined(VFMW_HEVC_SED_ONLY_SUPPORT)
SINT32 VCTRL_CheckFreshRaw(SINT32 ChanID);
SINT32 VCTRL_CheckFreshSeg(SINT32 ChanID);
VOID   VCTRL_VdmProcSedOnly(SINT32 ChanId, SINT32 VdhId);
UINT8  VCTRL_IsSedOnlyMode(VID_STD_E VidStd, VOID *pDecParam);
#endif

SINT32 VCTRL_SetDeiMemQueryInterface(SINT32 ChanID, VOID *pDeiMemIntf);
SINT32 VCTRL_GetChanMemInfo(SINT32 ChanID, VOID *pMemInfo);

#endif
