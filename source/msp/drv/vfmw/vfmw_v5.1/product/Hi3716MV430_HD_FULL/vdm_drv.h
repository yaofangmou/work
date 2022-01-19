#ifndef __VDM_DRV_HEADER__
#define __VDM_DRV_HEADER__
#include "vfmw.h"
#include "sysconfig.h"

#ifdef __cplusplus
extern "C" {
#endif

#define VDH_IDLE                  (0)
#define VDH_BUSY                  (1)

#define MAX_TIME_VDM_DEC          (500)

#define COUNT_WAIT_NO_ISR         (400)
#define MAX_TIME_WAIT_MORE_START  (200)

#define VDMDRV_OK                 (0)
#define VDMDRV_ERR                (-1)

#define LUMA_HISTORGAM_NUM        (32)

typedef enum
{
    VDH_STATE_REG        = 1,
    INT_STATE_REG        = 2,
    INT_MASK_REG         = 3,
    VCTRL_STATE_REG      = 4,
    MMU_INT_STATE_REG    = 5,
    MMU_ERR_RDADDR_REG   = 6,
    MMU_ERR_WRADDR_REG   = 7,
} REG_ID_E;

typedef enum
{
    VDM_NULL_STATE = 0,
    VDM_DECODE_STATE,
    VDM_REPAIR_INNER_PIC,
    VDM_REPAIR_OUTER_PIC,
    VDM_STATE_BUTT
} VDMDRV_STATEMACHINE_E;

typedef enum
{
    VDM_REPAIR_OUTER = 0,
    VDM_REPAIR_OUTER_AND_INNER,
} VDMDRV_REPAIR_REQUIRE_E;

typedef enum
{
    VDMDRV_SLEEP_STAGE_NONE = 0,
    VDMDRV_SLEEP_STAGE_PREPARE,
    VDMDRV_SLEEP_STAGE_SLEEP
} VDMDRV_SLEEP_STAGE_E;

typedef enum
{
    VDMDRV_PERFORMANCE_1080P30  = 0,
    VDMDRV_PERFORMANCE_1080P60  = 1,
    VDMDRV_PERFORMANCE_1080P120 = 2,
    VDMDRV_PERFORMANCE_4K30     = 3,
    VDMDRV_PERFORMANCE_4K60     = 4,
} VDMDRV_PERFORMANCE_E;

typedef enum
{
    VDMDRV_ATTACH_NULL = 0,
    VDMDRV_ATTACH_ALREADY = 1
} VDMDRV_ATTACH_MODE_E;

typedef enum
{
    VDMDRV_ATTACH_FOR_NONE = 0,
    VDMDRV_ATTACH_FOR_PERFORMANCE = 1,
    VDMDRV_ATTACH_FOR_RESOLUTION = 2
} VDMDRV_ATTACH_REASON_E;

#ifdef VFMW_MODULE_LOWDLY_SUPPORT
typedef enum
{
    VDMDRV_CHAN_INT_STATE_BOTH_DEC_OVER = 1,
    VDMDRV_CHAN_INT_STATE_PART_DEC_OVER,
    VDMDRV_CHAN_INT_STATE_DEC_OVER,
} VDMDRV_CHAN_INT_STATE;
#endif

typedef enum
{
    ERR_RATIO_CORRECT_NOT_REPAIR = 0,
    ERR_RATIO_CORRECT_ABNORMAL,
    ERR_RATIO_CORRECT_NORMAL,
} VDMDRV_ERR_RATIO_CORRECT_TYPE;

typedef struct
{
    VDMDRV_ATTACH_MODE_E VdmAttachMode;
    VDMDRV_ATTACH_REASON_E VdmAttachReason[MAX_CHAN_NUM];
    SINT32 ChanIdAttachPlus1[MAX_CHAN_NUM];
    SINT32 AttachNum;
} VDMDRV_ATTACH_S;

typedef struct
{
    VDMDRV_PERFORMANCE_E VdmPreformance;
    VDMDRV_ATTACH_S VdmAttachStr;
} VDMDRV_EXT_S;

typedef enum
{
    VDH_FRAME_DEC = 0,
    VDH_SED_ONLY  = 1
} VDH_DEC_MODE_E;

typedef struct
{
    VDMDRV_STATEMACHINE_E VdmStateMachine;
    SINT32 ErrRatio;
    SINT32 ChanId;
    VID_STD_E VidStd;

    UINT32 Clk;
    UINT32 StartTime;
    UINT32 CurrTime;
    SINT32 VdmTimeOut;
    UINT32 LastWaitMoreStartTime;
    SINT32 DspReloadFlag;
#ifdef VFMW_MODULE_LOWDLY_SUPPORT
    VDMDRV_CHAN_INT_STATE ChanIntState;
#endif
    VOID *pDecParam;
    VDH_DEC_MODE_E VdhWorkMode;
} VDMDRV_PARAM_S;

typedef struct
{
    SINT32 PriorByChanId[MAX_CHAN_NUM];
    SINT32 ChanIdTabByPrior[MAX_CHAN_NUM];
    SINT32 ChanDecByVdhPlusOne[MAX_CHAN_NUM];
} CHAN_CTX;

typedef struct
{
    /* vdm register base vir addr */
    SINT32   *pVdmRegVirAddr;
    SINT32   *pBpdRegVirAddr;

    /* vdm hal base addr */
    UADDR     HALMemBaseAddr;
    SINT32    HALMemSize;

    /* message pool */
    UADDR     MsgSlotAddr[MSG_SLOT_NUM];
    UINT32    TotalMsgSize;

    /* down message */
    VBOOL     IsDnMsgPolluted;
    SINT8    *pDnMsgStartAddr;
    UINT32    DnMsgSize;

    /* fix mem */
    UADDR     H264MnAddr;
    UADDR     H265MnAddr;

    /* other */
    UADDR     ItransTopAddr;
    UADDR     Vc1ConvTabAddr;
    UADDR     Vp6TabAddr;
    UADDR     Vp8TabAddr;
    UADDR     UnUsedAddr;

    UADDR     OtherSedTopAddr;
    UADDR     OtherPmvTopAddr;
    UADDR     OtherRcnTopAddr;
    UADDR     OtherDblkTopAddr;

    /* h264 */
    UADDR     H264SedTopAddr;
    UADDR     H264PmvTopAddr;
    UADDR     H264RcnTopAddr;
    UADDR     H264DblkTopAddr;

    /* h265 */
    UADDR     H265DblkLeftAddr;
    UADDR     H265PmvLeftAddr;
    UADDR     H265SaoLeftAddr;
    UADDR     H265TileSegmentInfoAddr;
    UADDR     H265SedTopAddr;
    UADDR     H265PmvTopAddr;
    UADDR     H265RcnTopAddr;
    UADDR     H265SaoTopAddr;
    UADDR     H265DblkTopAddr;

    /* vp9 */
    UADDR     Vp9DblkLeftAddr;
    UADDR     Vp9ProbTabAddr;
    UADDR     Vp9ProbCntAddr;
    UADDR     Vp9SedTopAddr;
    UADDR     Vp9PmvTopAddr;
    UADDR     Vp9RcnTopAddr;
    UADDR     Vp9DblkTopAddr;

    /* avs2 */
    UADDR     Avs2SedTopAddr;
    UADDR     Avs2PmvTopAddr;
    UADDR     Avs2RcnTopAddr;
    UADDR     Avs2SaoTopAddr;
    UADDR     Avs2DblkTopAddr;
} VDMHAL_HWMEM_S;

typedef struct
{
    UINT32    LumaSumHigh;
    UINT32    LumaSumLow;
    UINT32    LumaHistorgam[LUMA_HISTORGAM_NUM];
} LUMA_INFO_S;

typedef struct
{
    SINT32 ModuleLowlyEnable;
    LUMA_INFO_S LumaInfo;
    VOID  *pTask;
    UINT8 FromISR;
} VDMDRV_PARAM_EXT_S;

typedef struct
{
    UINT32    BasicCfg1;
    UINT32    VdmState;
    UINT32    Mb0QpInCurrPic;
    UINT32    SwitchRounding;
    UINT32    SedSta;
    UINT32    SedEnd0;

    UINT32    DecCyclePerPic;
    UINT32    RdBdwidthPerPic;
    UINT32    WrBdWidthPerPic;
    UINT32    RdReqPerPic;
    UINT32    WrReqPerPic;
    UINT32    LumaSumHigh;
    UINT32    LumaSumLow;
    UINT32    LumaHistorgam[LUMA_HISTORGAM_NUM];
    UADDR     UpMsgPhyAddr;
} VDMHAL_BACKUP_S;

typedef struct
{
    UINT8     linear_en;
    UINT8     BitDepth;
    UINT8     IsCopy;

    VID_STD_E VidStd;
    UADDR     ImageAddr;
    UADDR     RefImageAddr;
    SINT32    ImageWidth;
    SINT32    ImageHeight;
    SINT32    IsFrame;            // 0:fld, 1:frm
    SINT32    ImageCSP;           // 0:420, 1:400
    SINT32    ValidGroupNum;
    SINT32    rpr_ref_pic_type;
    SINT32    Pic_type;
    SINT32    FullRepair;
    UINT32    CtbSize;            // ctbsize
    UINT32    tiles_enabled_flag; // for hevc

    struct
    {
        UINT32 StartMbn;
        UINT32 EndMbn;
    } MbGroup[MAX_UP_MSG_SLICE_NUM];
} VDMHAL_REPAIR_PARAM_S;

typedef struct
{
    UINT32    RetType;
    UINT32    ImgStride;
    UINT32    UVStride;
    UINT32    DecSliceNum;
    UINT16    SliceMbRange[MAX_UP_MSG_SLICE_NUM + 1][2];
} VDMHAL_DEC_REPORT_S;

typedef struct
{
    UADDR  MemBaseAddr;
    SINT32 Size;
    SINT32 VdhId;
    UADDR  MemBaseAddr_Sec;
    SINT32 Size_Sec;
} VDMHAL_OPENPARAM_S;

typedef struct
{
    UINT32 *pMb0QpInCurrPic;
    SINT32 VdhId;
} BACKUP_INFO_S;

typedef struct
{
    VID_STD_E VidStd;
    VDMHAL_HWMEM_S *pHwMem;
    VOID *pDecParam;
    SINT32 VdhId;
} CFG_REPAIR_REG_S;

typedef struct
{
    VDMHAL_REPAIR_PARAM_S *pRepairParam;
    VDMHAL_HWMEM_S *pHwMem;
    SINT32 VdhId;
} CFG_REPAIR_MSG_S;


typedef struct
{
    VID_STD_E VidStd;
    VDMHAL_DEC_REPORT_S *pDecReport;
    SINT32 VdhId;
} MAKE_DEC_REPORT_S;

extern VDMHAL_HWMEM_S g_HwMem[MAX_VDH_NUM];
extern UINT32 g_UpMsg[MAX_VDH_NUM][UP_MSG_SIZE];
extern VDMHAL_REPAIR_PARAM_S g_RepairParam[MAX_VDH_NUM][2];
extern VDMHAL_DEC_REPORT_S g_DecReport[MAX_VDH_NUM];
extern VDMHAL_BACKUP_S       g_BackUp[MAX_VDH_NUM];

extern UINT32 g_Use_FFAPT_Enable;
extern VDMDRV_PARAM_S g_VdmDrvParam[MAX_VDH_NUM];
extern CHAN_CTX g_ChanCtx;
extern VDMDRV_EXT_S g_VdmExtParam[MAX_VDH_NUM];

VOID   VDMDRV_Init(SINT32 VdhId);
VOID   VDMDRV_Reset(SINT32 VdhId);
VOID   VDMDRV_SetPriority(SINT32 *pPrioArray);
VOID   VDMDRV_IsrProcess(SINT32 VdhId);
VOID   VDMDRV_MMUIntServeProc(SINT32 vdh_id);
VOID   VDMDRV_WakeUpVdm(VOID);
VOID   VDMDRV_SetStateIdle(SINT32 VdhId);
SINT32 VDMDRV_IsVdmIdle(SINT32 VdhId);
SINT32 VDMDRV_WaitVdmReadyIfNoIsr(SINT32 VdhId);
SINT32 VDMDRV_GetCurrChanID(SINT32 VdhId);
SINT32 VDMDRV_IsVdmInISR(SINT32 VdhId);
SINT32 VDMDRV_PrepareSleep(SINT32 VdhId);
VDMDRV_SLEEP_STAGE_E VDMDRV_GetSleepStage(SINT32 VdhId);
VOID   VDMDRV_ForceSleep(SINT32 VdhId);
VOID   VDMDRV_ExitSleep(SINT32 VdhId);
VOID   VDMDRV_ClearChanIsDec(SINT32 ChanID);
VOID   VDMDRV_SetChanIsDec(SINT32 ChanID, SINT32 VdhID);
VOID   VDMDRV_ClearChanIsDec(SINT32 ChanID);
SINT32 VDMDRV_IsChanDec(SINT32 ChanID);
VOID   VDMDRV_ResetVDH(SINT32 ChanID);
VOID   VDMDRV_ParamInit(VOID);
VOID   VDMDRV_MarkReloadDsp(SINT32 VdhId, SINT32 ChanID);
VOID   VDMDRV_UpdateMatchMode(SINT32 VdhId, SINT32 ChanID);

SINT32 VDMDRV_GetMb0QpInCurrPic(SINT32 VdhId);
SINT32 VDMDRV_GetSwitchRounding(SINT32 VdhId);

#ifdef __cplusplus
}
#endif


#endif  //__VDM_DRV_H__
