#ifndef __SCD_DRV_H__
#define __SCD_DRV_H__

#include "mem_manage.h"
#include "vfmw.h"
#include "sysconfig.h"

#define REG_SCD_START                  0x800
#define REG_LIST_ADDRESS               0x804
#define REG_UP_ADDRESS                 0x808
#define REG_UP_LEN                     0x80c
#define REG_BUFFER_FIRST               0x810
#define REG_BUFFER_LAST                0x814
#define REG_BUFFER_INI_LSB             0x818
#define REG_SCD_INT_MASK               0x81c
#define REG_SCD_PROTOCOL               0x820
#define REG_SCD_INI_CLR                0x824
#define REG_SCD_OVER                   0x840
#define REG_PREVIOUS_BYTE_LSB          0x83c
#define REG_PREVIOUS_BYTE_MSB          0x844
#define REG_SCD_NUM                    0x84c
#define REG_ROLL_ADDR                  0x850
#define REG_SRC_EATEN                  0x854
#define REG_SEG_BUFFER_OFFSET          0x858
#define REG_SEG_NEXT_ADDR              0x85c
#define REG_SCD_CLK_CFG                0x880

#define REG_AVS_FLAG                   0x0000
#define REG_EMAR_ID                    0x0004
#define REG_VDH_SELRST                 0x0008
#define REG_VDH_CK_GT                  0x000c
#define REG_VDH_ARBIT_CTRL_STATE       0X0010
#define REG_DSP_WATCH_DOG              0X0018

#define SCDDRV_OK                      (0)
#define SCDDRV_ERR                     (-1)
#define SCD_IDLE                       (0)
#define SCD_BUSY                       (1)

#define SM_INST_MODE_IDLE              (0)
#define SM_INST_MODE_WORK              (1)
#define SM_INST_MODE_WAIT              (2)

#define SEG_CUT_NORMAL                 (0)
#define SEG_CUT_REPEAT                 (1)
#define SEG_CUT_HALF                   (2)

#define SMSEG_STATE_INVALID            (0)
#define SMSEG_STATE_FRESH              (1)
#define SMSEG_STATE_READOUT            (2)

#define HEADER_BUFFER_SIZE             (256)

#ifdef CFG_MAX_RAW_NUM
#define MAX_STREAM_RAW_NUM             (CFG_MAX_RAW_NUM)
#else
#define MAX_STREAM_RAW_NUM             (1024)
#endif

#ifdef CFG_MAX_SEG_NUM
#define MAX_STREAM_SEG_NUM             (CFG_MAX_SEG_NUM)
#else
#define MAX_STREAM_SEG_NUM             (4096)
#endif

#define SM_SCD_DOWN_INFO_STEP          (3)
#define SM_SCD_UP_INFO_STEP            (2)
#define SM_MAX_SCD_UP_INFO_STEP        (3)
#define SM_MAX_DOWNMSG_SIZE            (MAX_STREAM_RAW_NUM * sizeof(SINT32) * SM_SCD_DOWN_INFO_STEP)
#define SM_MAX_UPMSG_SIZE              (MAX_STREAM_SEG_NUM * sizeof(SINT32) * SM_MAX_SCD_UP_INFO_STEP)

#define SCD_MSG_SIZE                   (SM_MAX_DOWNMSG_SIZE + SM_MAX_UPMSG_SIZE + 1024) // add 1024 for align lost

#define SMSEG_SET_ISREAD(seg)          ((seg).SegState = SMSEG_STATE_READOUT)
#define SMSEG_SET_ISRELEASED(seg)      ((seg).SegState = SMSEG_STATE_INVALID)
#define SMSEG_SET_ISFRESH(seg)         ((seg).SegState = SMSEG_STATE_FRESH)

#define SMSEG_IS_READ(seg)             (((seg).SegState == SMSEG_STATE_READOUT) ? 1 : 0)
#define SMSEG_IS_RELEASED(seg)         (((seg).SegState == SMSEG_STATE_INVALID) ? 1 : 0)
#define SMSEG_IS_FRESH(seg)            (((seg).SegState == SMSEG_STATE_FRESH)   ? 1 : 0)

#define SMSEG_PHY2VIR(SegArrayPtr, phy, vir) \
    do {\
        (vir) = SegArrayPtr->pSegBufVirAddr + ((phy) - SegArrayPtr->SegBufPhyAddr);\
    } while (0)

#define FMW_ASSERT(cond) \
    do {\
        if (!(cond))\
        {\
            dprint(PRN_ALWS, "%s %d: ASSERT!\n", __func__, __LINE__); \
            return;\
        }\
    } while (0)

#define FMW_ASSERT_RET(cond, ret) \
    do {\
        if (!(cond))\
        {\
            dprint(PRN_ALWS, "%s %d: ASSERT return!\n", __func__, __LINE__); \
            return (ret);\
        }\
    } while (0)


typedef enum
{
    FMW_OK          =  0,
    FMW_ERR_PARAM   = -1,
    FMW_ERR_NOMEM   = -2,
    FMW_ERR_NOTRDY  = -3,
    FMW_ERR_BUSY    = -4,
    FMW_ERR_RAWNULL = -5,
    FMW_ERR_SEGFULL = -6,
    FMW_ERR_SCD     = -7
} FMW_RETVAL_E;

typedef enum
{
    SCDDRV_SLEEP_STAGE_NONE = 0,
    SCDDRV_SLEEP_STAGE_PREPARE,
    SCDDRV_SLEEP_STAGE_SLEEP,
    SCDDRV_SLEEP_STAGE_BUTT
} SCDDRV_SLEEP_STAGE_E;

typedef enum
{
    INITIALISE = 0,
    WRITE_DOWN_MSG,
    IN_ISR,
    SEEK_PTS,
} PUSH_RAW_OVER_STATE;

typedef enum
{
    SM_NOT_MPEG4 = 0,
    SM_MPEG4_NOTH263,
    SM_MPEG4_H263
} MPEG4_SUB_STD;

typedef struct
{
    STREAM_DATA_S RawPacket[MAX_STREAM_RAW_NUM];
    SINT32  Head;
    SINT32  Tail;
    SINT32  History;
    SINT32  FirstPacketOffset;
    SINT32  CurShowIndex;
    SINT32  RawTotalSize;
} RAW_ARRAY_S;

typedef struct
{
    SINT8   ScdIntMask;
    UINT8   SliceCheckFlag;
    SINT8   ScdStart;
    UADDR   DownMsgPhyAddr;
    SINT32 *pDownMsgVirAddr;
    SINT32 *pUpMsgVirAddr;
    UADDR   UpMsgPhyAddr;
    SINT32  UpLen;
    UADDR   BufferFirst;
    UADDR   BufferLast;
    UADDR   BufferIni;
    UINT32  ScdProtocol;
    SINT32  ScdIniClr;
    UINT32  ScdLowdlyEnable;
    UINT32  ScdMmuEn;
    UINT32  VdhMmuEn;
    UINT32  ScdInputMmuEn;
    SINT32  AvsFlag;
} SM_CTRLREG_S;

typedef struct
{
    SINT32  Scdover;
    SINT32  ScdInt;
    SINT32  ShortScdNum;
    UINT32  StartCodeNum;
    UADDR   ScdRollAddr;
    SINT32  SrcEaten;
    UINT32  UpMsgLenInWord;
    UADDR   SegNextAddr;
} SM_STATEREG_S;

typedef struct
{
    USIGN   IsShStreamFlag:        1;
    USIGN   SliceFlag:             1;
    USIGN   IsShortHeader:         1;
    USIGN   StartCodeBitOffset:    4;
    USIGN   StartCodeLength:       4;
    USIGN   Reserved:              21;
} MP4_SCD_UPMSG;

typedef struct
{
    UINT8  *VirAddr;
    SINT8   SegState;
    SINT8   CutResult;
    UINT8   IsLastSeg;
    UINT8   IsStreamEnd;
    UINT8   DVDualLayer;
    UINT8   DspCheckPicOverFlag;
    UADDR   PhyAddr;
    UINT32  LenInByte;
    SINT32  StreamID;
    UINT64  Pts;
    UINT64  RawPts;
    UINT64  Usertag;
    UINT64  DispTime;
    UINT32  DispEnableFlag;
    UINT32  DispFrameDistance;
    UINT32  DistanceBeforeFirstFrame;
    UINT32  GopNum;
    MP4_SCD_UPMSG stMp4UpMsg;
} STREAM_SEG_S;

typedef struct
{
    UINT8  *pSegBufVirAddr;
    STREAM_SEG_S StreamSeg[MAX_STREAM_SEG_NUM];
    SINT32  Head;
    SINT32  Tail;
    SINT32  History;
    SINT32  Current;
    UADDR   SegBufPhyAddr;
    SINT32  SegBufSize;
    UADDR   SegBufReadAddr;
    UADDR   SegBufWriteAddr;
    SINT32  SegTotalSize;
    SINT32  SegFreshSize;
    SINT32  SegFreshNum;
} SEG_ARRAY_S;

typedef struct
{
    UINT8  *pBufVirAddr;
    UINT8   Priority;
    VID_STD_E VidStd;
    UADDR   BufPhyAddr;
    SINT32  BufSize;
    UADDR   RegPhyBaseAddr;
    STD_EXTENSION_U StdExt;
    SINT32  ScdLowdlyEnable;
    SINT32  SedOnlyEnable;
    SINT32  ChanLowlyEnable;
    SINT32  IsOmxPath;
    SINT32  IsTunneledPath;
    SINT32  MaxRawPacketNum;
    SINT32  MaxRawPacketSize;
    SINT32  ScdMmuEn;
    SINT32  VdhMmuEn;
} SM_CFG_S;

typedef struct
{
    UINT8  *pSegBufVirAddr;
    UINT32 *pDownMsgVirAddr;
    SINT32  DownMsgSize;
    UADDR   DownMsgPhyAddr;
    UINT32 *pUpMsgVirAddr;
    UADDR   UpMsgPhyAddr;
    SINT32  UpMsgSize;
    SINT32  UpMsgNum;
    UADDR   SegBufPhyAddr;
    SINT32  SegBufSize;
} SM_BUFFERCFG_S;

typedef struct
{
    SINT8   InstMode;
    SINT32  RawNum;
    SINT32  SegNum;
    SINT32  TotalRawSize;
    SINT32  TotalSegSize;
    SINT32  ReadSegFailCount;
} SM_INST_INFO_S;

typedef struct
{
    UINT8  *pCurrStartVirAddr;
    UINT8  *pCurrEndVirAddr;
    UADDR   CurrStartPhyAddr;
    UADDR   CurrEndPhyAddr;
    SINT32  Length;
    SINT32  TotalLen;
    UINT64  Pts;
} SM_PUSHRAWPACKET_S;

typedef struct
{
    SINT32  PushRawNum;
    SINT32  PushRawTotalLen;
    PUSH_RAW_OVER_STATE PushRawOverState;
} SM_PUSHRAW_S;

typedef struct
{
    UINT8  *pSegBufVirAddr;
    UINT32 *pScdUpMsg;
    SINT32  ProtocolType;
    SINT32  ModeFlag;       //0: not Mpeg4 mode; 1: not H263 mode, 2: H263 mode
    SINT32  LastH263Num;
    UADDR   SegBufPhyAddr;
    SINT32  SegBufSize;
    UADDR   SegBufRollAddr;
    SINT32  SegNum;
    SINT32  SMInstID;
} SM_SEGSTREAMFILTER_S;

typedef struct
{
    SINT8   SegFullFlag;
    SINT8   IsCounting;
    SINT8   LastCfgAllRawFlag;
    SINT8   FillNewRawFlag;
    SM_CFG_S Config;
    RAW_ARRAY_S RawPacketArray;
    SEG_ARRAY_S StreamSegArray;
    SM_PUSHRAW_S SmPushRaw;
    SM_BUFFERCFG_S BufAddrCfg;
    SINT32  InstID;
    SINT32  ScdID;
    SINT32  CutingFlag;
    SINT32  MatchScdIdPlus1;
    SINT32  Mode;
    UINT32  Mpeg4ModeFlag;
    UINT32  LastH263Num;
    UINT32  BlockTimeInMs;
    UINT32  LastBlockTime;
    UINT64  LastPts;   // if same with last, equal -1
    SINT32  PrevCfgRawSize;
    SINT32  PrevCfgSegSize;
    SINT32  TotalRawSize;
    UINT32  LastStatTime;
    UINT32  BitRate;   // Kbps
    SINT32  ReadSegFailCount;
    SINT32  LastSCDStartTime;
    UINT32  UpMsgStepInWord;
    UINT32  RawSizeCount;
    UINT32  RawNumCount;
    SINT32  ChanLowlyEnable;
    UINT32  HeaderLen;
    UINT8   HeaderBuf[HEADER_BUFFER_SIZE];
    SINT32  ScdInputMmuEn;
    UINT16  PreByteMSB;
    UINT32  PreByteLSB;
    UINT16  ScdPreByteMSB;
    UINT32  ScdPreByteLSB; // near to the next seg
    UADDR   SegNextAddr;
    UINT32  FirstStartScdFlag;
    UADDR   LastStartCodeAddr;
    UINT32  LastUndoneSegSize;
    UINT32  RollFlag;
    UADDR   RollAddr;

    STREAM_SEG_S LastUndoneSeg;
    UINT64 RawMsgAddr[MAX_STREAM_RAW_NUM][2];
} SM_INSTANCE_S;

typedef struct hiSCD_DRV_MEM_S
{
    UADDR   ScdRegAddr;
    UADDR   HwMemAddr;
    SINT32  HwMemSize;
    UADDR   DownMsgMemAddr;
    UINT32 *pDownMsgMemVirAddr;
    SINT32  DownMsgMemSize;
    UADDR   UpMsgMemAddr;
    UINT32 *pUpMsgMemVirAddr;
    SINT32  UpMsgMemSize;
} SCD_DRV_MEM_S;

typedef struct
{
    SCD_DRV_MEM_S ScdDrvMem;
    SINT32  IsScdDrvOpen;
    SINT32  ThisInstID;
    SINT32  SCDState;
    UINT32  LastProcessTime;
    SINT32  DspReloadFlag;
} SMDRV_PARAM_S;

typedef struct
{
    SM_INSTANCE_S *pSmInstArray;
    SINT32  SmInstPriority;
} SM_IIS_S;


extern UADDR  s_ScdRegPhyBaseAddr[MAX_SCD_NUM];

#define WR_SCDREG(id,reg,dat)   MEM_WritePhyWord((s_ScdRegPhyBaseAddr[id] + reg), (dat))
#define RD_SCDREG(id,reg)       MEM_ReadPhyWord((s_ScdRegPhyBaseAddr[id] + reg))

SINT32 ResetSCD(SINT32 ScdId);
SINT32 DeleteRawPacketInBuffer(SINT32 SmID, SINT32 ResetFlag);
SINT32 GetRawStreamSize(RAW_ARRAY_S *pRawStreamArray, SINT32 *pStreamSize);
SINT32 GetRawStreamNum(RAW_ARRAY_S *pRawStreamArray, SINT32 *pStreamNum);
SINT32 GetSegStreamSize(SEG_ARRAY_S *pSegStreamArray, SINT32 *pStreamSize);
UINT32 GetSegStreamNum(SEG_ARRAY_S *pSegStreamArray);
VOID   GetFreshSegStream(SEG_ARRAY_S *pSegStreamArray, SINT32 *pFreshNum, SINT32 *pFreshSize);
SINT32 SM_OpenSCDDrv(UADDR MemAddr, SINT32 MemSize, SINT32 ScdId);
SINT32 SM_CloseSCDDrv(SINT32 ScdId);
VOID   SM_InstInit(VOID);
VOID   SCDDRV_ResetSCD(SINT32 ChanID);
SINT32 SM_ClearInst(SINT32 SmID);
SINT32 SM_Reset(SINT32 SmID);
SINT32 SM_Start(SINT32 SmID);
SINT32 SM_Stop(SINT32 SmID);
SINT32 SM_Config(SINT32 SmID, SM_CFG_S *pSmCfg);
SINT32 SM_GetInfo(SINT32 SmID, SM_INST_INFO_S *pSmInstInfo);
SINT32 SM_ReadSegStream(SINT32 SmID, STREAM_SEG_S *pStreamSeg);
SINT32 SM_ReleaseStreamSeg(SINT32 SmID, SINT32 StreamID);
VOID   SM_SCDIntServeProc(SINT32 ScdId);
VOID   SM_Wakeup(VOID);
VOID   PrintScdRawState(SINT32 SmID, SINT32 PrintDetail);
SINT32 SM_SeekPts(SINT32 ChanID, UINT64 *pArgs);
VOID   SCDDRV_SetStateIdle(SINT32 ScdId);
SINT32 SCDDRV_IsChanDec(SINT32 SmID);
VOID   SCD_ConfigReg(UINT32 Reg, UINT32 Data, SINT32 Id, VOID *pTask);
SINT32 SCDDRV_PrepareSleep(SINT32 ScdId);
VOID   SCDDRV_ForceSleep(SINT32 ScdId);
VOID   SCDDRV_ExitSleep(SINT32 ScdId);
SCDDRV_SLEEP_STAGE_E SCDDRV_GetSleepStage(SINT32 ScdId);

#endif  // __SCD_DRV_H__
