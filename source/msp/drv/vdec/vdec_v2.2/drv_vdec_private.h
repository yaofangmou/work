#ifndef __HI_VDEC_PRIVATE_H__
#define __HI_VDEC_PRIVATE_H__

#include "hi_type.h"
#include "hi_module.h"
#include "hi_drv_sys.h"
#include "hi_drv_dev.h"
#include "hi_drv_mmz.h"
#include "hi_drv_mem.h"
#include "hi_drv_proc.h"
#include "hi_drv_stat.h"
#include "hi_drv_module.h"
#include "drv_vdec_buf_mng.h"
#include "hi_unf_avplay.h"
#include "hi_drv_video.h"
#include "hi_drv_vdec.h"
#include "vfmw_ext.h"
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/* VDEC VERSION */
#define VDEC_VERSION                (2018102900)
#define VDEC_DBG_MODULE_VDI         (0x0)
#define VDEC_DEBUG                  (0)

#define VDEC_KUD_MAX_NUM 4      /*max user data num of each frame*/
#define VDEC_KUD_MAX_LEN 256UL  /*max user data length*/
#define VDEC_UDC_MAX_NUM 16

#define VDEC_MAX_PROC_ARGS_SIZE 30
#define VDEC_MAX_PORT_NUM 3
#define VDEC_MAX_TMP_LIST_FRAME 20
#define HI_KMALLOC_VDEC(size)           HI_KMALLOC(HI_ID_VDEC, size, GFP_KERNEL)
#define HI_KMALLOC_ATOMIC_VDEC(size)    HI_KMALLOC(HI_ID_VDEC, size, GFP_ATOMIC)
#define HI_KFREE_VDEC(addr)             HI_KFREE(HI_ID_VDEC, addr)
#define HI_VMALLOC_VDEC(size)           HI_VMALLOC(HI_ID_VDEC, size)
#define HI_VFREE_VDEC(addr)             HI_VFREE(HI_ID_VDEC, addr)

typedef enum tagVDEC_CHAN_STATE_E
{
    VDEC_CHAN_STATE_STOP = 0,
    VDEC_CHAN_STATE_RUN,
    VDEC_CHAN_STATE_INVALID
} VDEC_CHAN_STATE_E;

typedef enum tagVDEC_FRAME_FORMAT_E
{
    VDEC_I_FRAME = 0,
    VDEC_P_FRAME,
    VDEC_B_FRAME,
    VDEC_FRAME_BUTT
} VDEC_FRAME_FORMAT_E;

typedef enum hiDRV_VDEC_FRAMEBUFFER_TYPE_E
{
    HI_DRV_VDEC_BUF_VPSS_ALLOC_MANAGE = 0,
    HI_DRV_VDEC_BUF_USER_ALLOC_MANAGE,
    HI_DRV_VDEC_BUF_VDEC_ALLOC_MANAGE,
    HI_DRV_VDEC_BUF_USER_ALLOC_VPSS_MANAGE,
    HI_DRV_VDEC_BUF_TYPE_BUTT
} HI_DRV_VDEC_FRAMEBUFFER_TYPE_E;

typedef enum hiDRV_VDEC_FRAMEBUFFER_STATE_E
{
    HI_DRV_VDEC_BUF_STATE_IN_VDEC_EMPTY = 0,
    HI_DRV_VDEC_BUF_STATE_IN_VDEC_FULL,
    HI_DRV_VDEC_BUF_STATE_IN_VPSS,
    HI_DRV_VDEC_BUF_STATE_IN_USER,
    HI_DRV_VDEC_BUF_STATE_BUTT
} HI_DRV_VDEC_FRAMEBUFFER_STATE_E;

typedef struct tagVDEC_KPI_STATINFO_S
{
    HI_U32 Creat;
    HI_U32 Start;
    HI_U32 ResetVdec;
    HI_U32 Stop;
    HI_U32 Destroy;

    HI_U32 CreateDecoder;
    HI_U32 StartDecoder;

    HI_U32 ChanStartTime;
    HI_U32 ReceiveFirstFrameTime;
} VDEC_KPI_STATINFO_S;

typedef struct tagVDEC_CHAN_STATINFO_S
{
    HI_U32 u32TotalVdecOutFrame;    /*the number of total output frames*/
    HI_U32 u32TotalVdecParseIFrame; /*the number of total I frames decoded from stream*/
    HI_U32 u32TotalVdecInByte;      /*total bytes of the input stream*/
    HI_U32 u32TotalVdecHoldByte;    /*bytes of stream in VDEC_Frimware buffer*/
    HI_U32 u32TotalVdecTime;        /*total run time of the vdec channel*/
    HI_U32 u32CalcBpsVdecTime;      /*run time of the vdec channel, can be reset, used by calculate bps*/
    HI_U32 u32AvrgVdecFps;          /*the integer part of average output frame rate*/
    HI_U32 u32AvrgVdecFpsLittle;    /*the decimal part of average output frame rate*/
    HI_U32 u32AvrgVdecInBps;        /*the average stream input bit rate(bps)*/
    HI_U32 u32TotalStreamErrNum;    /*the totoal error number of stream*/

    HI_U32 u32VdecRcvFrameTry;      /*the frame number try to acquire*/
    HI_U32 u32VdecRcvFrameOK;       /*the frame number acquire success*/
    HI_U32 u32VdecRlsFrameTry;      /*the frame number try to release*/
    HI_U32 u32VdecRlsFrameOK;       /*the frame number release success*/
    HI_U32 u32VdecRlsFrameFail;     /*the frame number release fail*/
    HI_U32 u32VdecErrFrame;         /*the error frame number*/
    HI_U32 u32VdecDecErrFrame;         /*the number of Frame which pErrRatio is not 0*/

    HI_U32 u32VdecAcqBufTry;
    HI_U32 u32VdecAcqBufOK;
    HI_U32 u32VdecRlsBufTry;
    HI_U32 u32VdecRlsBufOK;

    HI_U32 u32UserAcqFrameTry;
    HI_U32 u32UserAcqFrameOK;
    HI_U32 u32UserRlsFrameTry;
    HI_U32 u32UserRlsFrameOK;

    HI_U32 u32AvplayRcvFrameTry;
    HI_U32 u32AvplayRcvFrameOK;
    HI_U32 u32AvplayRlsFrameTry;
    HI_U32 u32AvplayRlsFrameOK;
    HI_U32 u32TotalVfmwOutFrame;

    HI_U32 u32FrameType[2];

    HI_U32 u32ChanStartTime;
    HI_U32 u32PutStreamTime;
    HI_U32 u32DecoderReadStreamTime;
    HI_U32 u32DecoderStartVDMTime;
    HI_U32 u32DecoderReportTime;
    HI_U32 u32ReceiveFrameTime;
} VDEC_CHAN_STATINFO_S;

typedef struct
{
    VDEC_BUFFER_S    stMMZBuf;
    VDEC_BUFFER_S    st2dBuf;
    HI_U32          u32ReadTimes;
} VDEC_IFRAME_PARAM_S;

typedef struct
{
    HI_U32 u32ReadID;
    HI_U32 u32WriteID;
    HI_U8  au8Buf[VDEC_UDC_MAX_NUM][MAX_USER_DATA_LEN];
    HI_UNF_VIDEO_USERDATA_S stAttr[VDEC_UDC_MAX_NUM];
} VDEC_USRDATA_PARAM_S;

typedef struct tagVDEC_FRAME_LIST_NODE_S
{
    HI_DRV_VIDEO_FRAME_S stOutFrame;
    struct list_head node;
} VDEC_FRAME_LIST_NODE_S;

typedef struct tagVDEC_FRAME_LIST_LOCK_S
{
    spinlock_t     irq_lock;
    unsigned long  irq_lockflags;
    int            isInit;
} VDEC_SPIN_LOCK_S;

typedef enum
{
    EOF_STATUS_NULL,
    EOF_STATUS_WITH_ID,
    EOF_STATUS_FAILURE,
    EOF_STATUS_FAKE_EOF,
    EOF_STATUS_USER_DEC,
} VDEC_EOF_REPORT_STATUS;

typedef enum
{
    VDEC_OUTPUTFORMAT_AUTO, /* default */
    VDEC_OUTPUTFORMAT_2D,   /* 2D format output */
    VDEC_OUTPUTFORMAT_BUTT
} VDEC_VIDEO_OUTPUT_FORMAT;

typedef struct tagVDEC_CHANNEL_S
{
    /* For configurate */
    HI_UNF_VCODEC_ATTR_S    stCurCfg;       /* Configurate */
    HI_UNF_AVPLAY_OPEN_OPT_S stUserCfgCap;

    /* State */
    VDEC_CHAN_STATE_E       enCurState;

    /* Parameters from or to VFMW */
    VDEC_CHAN_CAP_LEVEL_E   enCapToFmw;
    DETAIL_MEM_SIZE         stMemSize;
    VDEC_CHAN_OPTION_S      stOption;
    VDEC_BUFFER_S           stSCDMMZBuf;
    VDEC_BUFFER_S           stVDHMMZBuf;
    STREAM_INTF_S           stStrmIntf ;
    IMAGE_INTF_S            stImageIntf;
    DEI_MEM_QUERY_INTF_S    deiMemQueryIntf;
    VDEC_USRDAT_S          *pu8UsrDataForWaterMark[4];
    HI_DRV_VIDEO_FRAME_S    stLastFrm;
    HI_U32                  u32UserSetAspectWidth;
    HI_U32                  u32UserSetAspectHeight;
    HI_U32                  u32DecodeAspectWidth;
    HI_U32                  u32DecodeAspectHeight;
    HI_U32                  u32LastFrmId;
    HI_U32                  u32LastFrmTryTimes;
    VDEC_EOF_REPORT_STATUS  eEofReportStatus;
    HI_BOOL                 bEndOfStrm;
    HI_BOOL                 bReportEos;
    HI_BOOL                 bEndOfFrm;
    HI_UNF_ENC_FMT_E        enDisplayNorm;
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E eFramePackType;
    /* Last display frame info */
    HI_DRV_VIDEO_FRAME_S stLastDispFrameInfo;

    HI_U32                  u32BitRate;
    HI_U32                  u32Profile;
    HI_U32                  u32LastLumaBitdepth;
    HI_U32                  u32LastChromaBitdepth;
    HI_U32                  u32Level;

    /* Channel status */
    VDEC_CHAN_STATINFO_S    stStatInfo;

    /* For stream buffer */
    HI_HANDLE               hChan;          /* VFMW handle */
    HI_HANDLE               hVdec;          /*VDEC handle*/
    HI_HANDLE               hDmxVidChn;     /* Dmx handle */
    HI_U32                  u32DmxID;
    HI_U32                  u32DmxBufSize;  /* Dmx buffer size */
    HI_HANDLE               hStrmBuf;       /* Stream buffer handle */
    HI_U32                  u32StrmBufSize; /* Stream buffer size */

    /* For event */
    HI_BOOL                             bNormChange;
    HI_UNF_NORMCHANGE_PARAM_S           stNormChangeParam;
    HI_BOOL                             bFramePackingChange;
    HI_UNF_VIDEO_FRAME_PACKING_TYPE_E   enFramePackingType;
    HI_BOOL                             bNewSeq;
    HI_BOOL                         bNewFrame;      /* use tlastFrm */
    HI_BOOL                         bNewUserData;
    HI_BOOL                         bIFrameErr;
    HI_BOOL                         bErrorFrame;
    HI_U8                           bAvsPlus;

    /*0: 1st and 2nd not get; 1: 1st get 2nd not get; 2: 1st and 2nd both get*/
    HI_U32                          u32ValidPtsFlag;

    HI_BOOL                         bFirstValidPts;
    HI_U32                          u32FirstValidPts;
    HI_BOOL                         bSecondValidPts;
    HI_U32                          u32SecondValidPts;

    /* For I frame decode */
    VDEC_IFRAME_PARAM_S             stIFrame;

    /* For user data */
    VDEC_USRDATA_PARAM_S           *pstUsrData;

    /* For frame rate */
    HI_UNF_AVPLAY_FRMRATE_PARAM_S   stFrameRateParam;

    /* For trick mode */
    HI_S32                          s32Speed;

    /* For end of stream flag */
    VDEC_BUFFER_S                   stEOSBuffer;
    HI_BOOL                         bSetEosFlag;
    HI_BOOL                         bReceiveEosFlag;

    /* For resolution change */
    HI_U8                           u8ResolutionChange;

    HI_BOOL                         bIsIFrameDec;
    HI_BOOL                         bUnSupportStream;
    HI_BOOL                         bLowdelay;
    HI_BOOL                         bProcRegister;
    HI_BOOL                         bTvp;
    HI_U32                          u32FrameCnt;
    HI_U32                          u32ErrRatio;
    HI_BOOL                         bDPBFullCtrl;
    HI_BOOL                         bKeepSpsPps;
    HI_BOOL                         bUVMOSEnable;
    VDEC_PROBE_STREAM_INFO_S        stProbeStreamInfo;

#ifdef HI_HDR_DOLBYVISION_SUPPORT
    VDEC_HDR_ATTR_S stVdecHdrAttr;
#endif
    HI_U32 OmxTunnelMode;
    HI_HANDLE  hOmxChn;
    HI_BOOL             bWakeUp;
    wait_queue_head_t   WaitQueue;

    HI_U32  IDRPts;
    HI_BOOL bSetIDRPtsMode;
    HI_BOOL b98mv200Vp9Burst;
    HI_BOOL bNeedVp9Enhance;

    VDEC_BUFFER_S stEsBuf;
    HI_U32  VfmwMagicWord;
    HI_BOOL bInitialized;
    HI_BOOL bWakeUpVfmw;
    HI_U32 u32BackwardOptimizeFlag;
    HI_S32 s32GetFirstIFrameFlag;
    HI_S32 s32ImageDistance;
    HI_S32 s32GetFirstFrameFlag;
    HI_S32 s32LastFrameGopNum;
    VDEC_FRAME_FORMAT_E lastFrameType;
    HI_S32 TmpListPos;
    struct list_head FrameList;
    VDEC_SPIN_LOCK_S FrameListLock;
    VDEC_FRAME_LIST_NODE_S TmpList[VDEC_MAX_TMP_LIST_FRAME];
} VDEC_CHANNEL_S;

typedef struct tagVDEC_CONTROLINFO_S
{
    HI_S32  u32BackwardOptimizeFlag;  /*Backward optimize flag, 1 means optimize the backward fast play performance*/
    HI_S32  u32DispOptimizeFlag;      /*Display optimize flag, 1 means optimize the VO display performance*/
} VDEC_CONTROLINFO_S;

typedef enum
{
    VDEC_VPSS_BYPASSMODE_AUTO = 0,
    VDEC_VPSS_BYPASSMODE_ENABLE,
    VDEC_VPSS_BYPASSMODE_DISABLE,
    VDEC_VPSS_BYPASSMODE_BUTT
} VDEC_BUF_BYPASSMODE_E;

typedef struct tagVDEC_REGISTER_PARAM_S
{
    DRV_PROC_READ_FN  pfnCtrlReadProc;
    DRV_PROC_WRITE_FN pfnCtrlWriteProc;
    DRV_PROC_READ_FN  pfnReadProc;
    DRV_PROC_WRITE_FN pfnWriteProc;
} VDEC_REGISTER_PARAM_S;

#ifdef HI_PROC_SUPPORT
HI_S32 VDEC_DRV_RegisterProc(VDEC_REGISTER_PARAM_S *pstParam);
HI_VOID VDEC_DRV_UnregisterProc(HI_VOID);
#endif

HI_S32 VDEC_DRV_Suspend(PM_BASEDEV_S *pdev, pm_message_t state);
HI_S32 VDEC_DRV_Resume(PM_BASEDEV_S *pdev);
VDEC_CHANNEL_S *VDEC_DRV_GetChan(HI_HANDLE hHandle);
VFMW_EXPORT_FUNC_S *VDEC_DRV_GetVfmwExportFunc(HI_VOID);

HI_UNF_VIDEO_USER_DATA_POSITION_E VDEC_Convert_Userdata_SourceType(VDEC_USD_TYPE_E vdec_userdata_source_type);


HI_S32 VDEC_DRV_Init(HI_VOID);
HI_VOID VDEC_DRV_Exit(HI_VOID);
HI_S32 VDEC_DRV_Open(struct inode *inode,  struct file  *filp);
HI_S32 VDEC_DRV_Release(struct inode *inode,  struct file  *filp);
HI_S32 VDEC_Ioctl(struct inode *inode,  struct file  *filp,  unsigned int  cmd,  void *arg);
//HI_S32 VDEC_FindVpssHandleByVdecHandle(HI_HANDLE hVdec, HI_HANDLE *phVpss);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __HI_VDEC_KER_TEST_H__ */

