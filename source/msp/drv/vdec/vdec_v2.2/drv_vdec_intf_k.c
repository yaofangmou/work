/* Sys headers */
#include <linux/version.h>
#include <linux/proc_fs.h>
#include <linux/ioport.h>
#include <linux/string.h>
#include <linux/ioctl.h>
#include <linux/fs.h>
#include <linux/delay.h>
#include <linux/sched.h>
#include <linux/kthread.h>
#include <linux/vmalloc.h>
#include <linux/interrupt.h>
#include <linux/seq_file.h>
#include <asm/uaccess.h>
#include <asm/io.h>

/* Unf headers */
#include "hi_unf_avplay.h"
#include "hi_error_mpi.h"
#include "hi_unf_common.h"

/* Drv headers */
#include "hi_kernel_adapt.h"
#include "hi_drv_demux.h"
#include "hi_drv_vpss.h"
#include "drv_demux_ext.h"
#include "drv_vdec_ext.h"
#include "drv_win_ext.h"
#include "vfmw.h"
#include "vfmw_ext.h"

/* Local headers */
#include "drv_vdec_private.h"
#include "drv_vdec_buf_mng.h"
#include "drv_vdec_userdata.h"
#include "hi_drv_vdec.h"
#include "hi_mpi_vdec.h"
#include "hi_drv_stat.h"

#include <linux/dma-buf.h>

#include "drv_omxvdec.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* __cplusplus */

/***************************** Macro Definition ******************************/
#define MCE_INVALID_FILP (0xffffffff)
#define VDEC_NAME "HI_VDEC"
#define VDEC_IFRAME_MAX_READTIMES (2)
#define EXTERNAL_CONFIG_MAGIC_STEP (0x200)

#define HI_VMALLOC_BUFMNG(size)     HI_VMALLOC(HI_ID_VDEC, size)
#define HI_VFREE_BUFMNG(addr)       HI_VFREE(HI_ID_VDEC, addr)
#define HI_KMALLOC_ATOMIC_BUFMNG(size)     HI_KMALLOC(HI_ID_VDEC, size, GFP_ATOMIC)
#define HI_KFREE_BUFMNG(addr)       HI_KFREE(HI_ID_VDEC, addr)

#define VDEC_CHAN_STRMBUF_ATTACHED(pstChan) \
    (((HI_INVALID_HANDLE != pstChan->hStrmBuf) && (HI_INVALID_HANDLE == pstChan->hDmxVidChn)) \
     || ((HI_INVALID_HANDLE == pstChan->hStrmBuf) && (HI_INVALID_HANDLE != pstChan->hDmxVidChn)))

#define VDEC_CHAN_TRY_USE_DOWN(pstEnt) \
    s32Ret = VDEC_CHAN_TRY_USE_DOWN_HELP((pstEnt), (HI_S8 *)__FUNCTION__, __LINE__);

#define VDEC_CHAN_USE_UP(pstEnt) \
    VDEC_CHAN_USE_UP_HELP((pstEnt), (HI_S8 *)__FUNCTION__, __LINE__);

#define VDEC_CHAN_RLS_DOWN(pstEnt, time) \
    s32Ret = VDEC_CHAN_RLS_DOWN_HELP((pstEnt), (time));

#define VDEC_CHAN_RLS_UP(pstEnt) \
    VDEC_CHAN_RLS_UP_HELP((pstEnt), (HI_S8 *)__FUNCTION__, __LINE__);

#define HI_VDEC_SCD_EXT_MEM     (79 * 1024)
#define HI_VDEC_EOS_MEM_SIZE    (1024)

#define HI_VDEC_SVDEC_VDH_MEM   (45 * 1024 * 1024)
#define HI_VDEC_REF_FRAME_MIN   (4)
#define HI_VDEC_REF_FRAME_MAX   (16)
#define HI_VDEC_DISP_FRAME_MIN  (3)
#define HI_VDEC_DISP_FRAME_MAX  (18)
#define HI_VDEC_SVDEC_FRAME_MIN (6)
#define HI_VDEC_CC_FROM_IMAGE   (1)
#define MAX_ESBUF_SIZE (6 * 1024 * 1024)

#define VDEC_InitEvent(WaitQueue)                                          \
    do                                                                     \
    {                                                                      \
        init_waitqueue_head(&(WaitQueue));                                 \
    } while(0)

#define VDEC_WaitEvent(WaitQueue, Condition, TimeOut)                          \
    do                                                                         \
    {   HI_U32 ret;                                                            \
        ret = wait_event_interruptible_timeout(WaitQueue, Condition, TimeOut); \
        if (ret == 0)                                                          \
        {                                                                      \
            HI_WARN_VDEC("[%s %d] ret=%d\n",__func__,__LINE__, ret);           \
        }                                                                      \
    } while(0)

#define VDEC_GiveEvent(WaitQueue)                                     \
    do                                                                \
    {                                                                 \
        wake_up_interruptible(&(WaitQueue));                          \
    } while(0)

#define VDEC_ASSERT_RETURN(Condition, RetValue)                         \
    do                                                                  \
    {                                                                   \
        if (!(Condition))                                               \
        {                                                               \
            HI_ERR_VDEC("[%s %d]assert warning\n", __func__, __LINE__); \
            return RetValue;                                            \
        }                                                               \
    } while(0)

/*************************** Structure Definition ****************************/

/* Channel entity */
typedef struct tagVDEC_CHAN_ENTITY_S
{
    VDEC_CHANNEL_S     *pstChan;        /* Channel structure pointer for vfmw*/
    HI_U64              u64File;        /* File handle*/
    HI_BOOL             bUsed;          /* Busy or free */
    atomic_t            atmUseCnt;      /* Channel use count, support multi user */
    atomic_t            atmRlsFlag;     /* Channel release flag */
    wait_queue_head_t   stRlsQue;       /* Release queue */
    EventCallBack       eCallBack;      /*for opentv5*/
    GetDmxHdlCallBack   DmxHdlCallBack; /*for opentv5*/
    HI_U32              u32DFBEn;
    HI_U32              u32TunnelModeEn;
} VDEC_CHAN_ENTITY_S;

/* Global parameter */
typedef struct
{
    HI_U32                  u32ChanNum;     /* Record vfmw channel num */
    VDEC_CAP_S              stVdecCap;      /* Vfmw capability */
    VDEC_CHAN_ENTITY_S      astChanEntity[HI_VDEC_MAX_INSTANCE_NEW];   /* Channel parameter */
    struct semaphore        stSem;
    struct semaphore        stVdecChanSem;
    struct semaphore        device_sem;
    struct timer_list       stTimer;
    atomic_t                atmOpenCnt;     /* Open times */
    HI_BOOL                 bReady;         /* Init flag */
    HI_UNF_VCODEC_ATTR_S    stDefCfg;       /* Default channel config */
    VDEC_REGISTER_PARAM_S  *pstProcParam;   /* VDEC Proc functions */
    DEMUX_EXPORT_FUNC_S    *pDmxFunc;       /* Demux extenal functions */
    VFMW_EXPORT_FUNC_S     *pVfmwFunc;      /* VFMW extenal functions */
    OMX_EXPORT_FUNC_S      *pOmxFunc;
    WIN_EXPORT_FUNC_S      *pVoFunc;
    struct task_struct     *pVdecTask;
    VDEC_EXPORT_FUNC_S      stExtFunc;      /* VDEC extenal functions */
} VDEC_GLOBAL_PARAM_S;

/***************************** Global Definition *****************************/
HI_U32 MaskCtrlWord = 0;

#define DEFAULT_MAP_FRM   (HI_FALSE)
#define DEFAULT_EOP_EN    (HI_TRUE)

HI_BOOL g_bMapFrmEnable = DEFAULT_MAP_FRM;
HI_BOOL g_bEopEnable = DEFAULT_EOP_EN;

HI_CHAR g_EopTab_H264[] = {0x00, 0x00, 0x01, 0x1E, 0x48, 0x53, 0x50, 0x49, 0x43, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x01, 0x00};
HI_CHAR g_EopTab_MPEG4[] = {0x00, 0x00, 0x01, 0x1E, 0x48, 0x53, 0x50, 0x49, 0x43, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x01};
HI_CHAR g_EopTab_H265[] = {0x00, 0x00, 0x01, 0x60, 0x00, 0x48, 0x53, 0x50, 0x49, 0x43, 0x45, 0x4E, 0x44, 0x00, 0x00, 0x01};

HI_U32 g_CHAN_FRAME_RATE[HI_VDEC_MAX_INSTANCE_NEW] = {0};
HI_SYS_VIDEO_CODEC_E g_enSysCodec = HI_SYS_VIDEO_MASK;

VDEC_KPI_STATINFO_S g_KpiInfo = {0};

#ifdef HI_VIDEO_MAX_DISP_FRAME_NUM
#define DISP_FRAME_NUM HI_VIDEO_MAX_DISP_FRAME_NUM
#else
#define DISP_FRAME_NUM 4
#endif

#ifdef HI_VDEC_EXTRA_PVR_FRAME_NUM
#define EXTRA_PVR_FRAME_NUM HI_VDEC_EXTRA_PVR_FRAME_NUM
#else
#define EXTRA_PVR_FRAME_NUM 1
#endif

typedef HI_S32(*FN_IOCTL_HANDLER)(struct file  *filp, unsigned int cmd, void *arg);
typedef struct
{
    HI_U32 Code;
    FN_IOCTL_HANDLER pHandler;
} IOCTL_COMMAND_NODE;

typedef HI_S32(*FN_VDEC_EVENT_HANDLER)(VDEC_CHANNEL_S *pstChan,
                                       HI_HANDLE hHandle,
                                       HI_VOID *pArgs);
typedef struct
{
    HI_U32 Code;
    FN_VDEC_EVENT_HANDLER pHandler;
} VDECEVENT_COMMAND_NODE;

typedef HI_VOID(*FN_CapLEVEL_HANDLER)(VDEC_CHANNEL_S *pstChan);
typedef struct
{
    HI_U32 Code;
    FN_CapLEVEL_HANDLER pHandler;
} CapLEVEL_NODE;

extern VDEC_COMPRESS_E GlbCompStrategy;

#ifdef HI_PROC_SUPPORT
static HI_S32 VDEC_RegChanProc(HI_S32 s32Num);
static HI_VOID  VDEC_UnRegChanProc(HI_S32 s32Num);
#endif

static HI_VOID VDEC_ConvertFrm(HI_UNF_VCODEC_TYPE_E enType, VDEC_CHANNEL_S *pstChan,
                               IMAGE *pstImage, HI_DRV_VIDEO_FRAME_S *pstFrame);
//static HI_U32 VDEC_ConverColorSpace(HI_U32 u32ColorSpace);
static HI_UNF_VIDEO_FRAME_PACKING_TYPE_E VDEC_ConverFrameType(HI_DRV_FRAME_TYPE_E  eFrmType);
//HI_S32 HI_DRV_VDEC_GetVideoBypassInfo(HI_HANDLE hHandle, HI_BOOL *pbVideoBypass);
static HI_S32 VDEC_RlsStrmBuf(HI_HANDLE hHandle, STREAM_DATA_S *pstPacket, HI_BOOL bUserSpace);
static HI_S32 VDEC_Chan_Free(HI_HANDLE hHandle);
static HI_S32 HI_VDEC_Chan_VOGetDeiMem(HI_HANDLE hHandle, HI_DRV_DEI_MEM_INFO_S *pMem);
static HI_S32 HI_VDEC_Chan_VOReleaseDeiMem(HI_HANDLE hHandle, HI_DRV_DEI_MEM_INFO_S *pMem);

HI_U32 VDEC_GetTimeInMs(VOID);

static VDEC_GLOBAL_PARAM_S s_stVdecDrv =
{
    .atmOpenCnt = ATOMIC_INIT(0),
    .bReady = HI_FALSE,
    .stDefCfg =
    {
        .enType         = HI_UNF_VCODEC_TYPE_H264,
        .enMode         = HI_UNF_VCODEC_MODE_NORMAL,
        .u32ErrCover    = 100,
        .bOrderOutput   = 0,
        .u32Priority    = 15
    },
    .pstProcParam = HI_NULL,
    .pDmxFunc = HI_NULL,
    .pVfmwFunc = HI_NULL,
    .pVoFunc = HI_NULL,
    .stExtFunc =
    {
        .pfnVDEC_Suspend     = (HI_VOID *)VDEC_DRV_Suspend,
        .pfnVDEC_Resume      = (HI_VOID *)VDEC_DRV_Resume,
        .pfnVORlsFrame       = (HI_VOID *)HI_VDEC_Chan_VORlsFrame,
        .pfnVDEC_SetOmxCallBacks = (HI_VOID *)HI_DRV_VDEC_SetOmxCallBacks,
        .pfnVDEC_ReportEsRels = (HI_VOID *)HI_DRV_VDEC_ReportEsRels,
        .pfnVDEC_GetDeiMem = HI_VDEC_Chan_VOGetDeiMem,
        .pfnVDEC_ReleaseDeiMem = HI_VDEC_Chan_VOReleaseDeiMem
    },
    .pVdecTask = HI_NULL,
    .pOmxFunc = HI_NULL,
};

/*********************************** Code ************************************/
static inline HI_S32  VDEC_CHAN_TRY_USE_DOWN_HELP(VDEC_CHAN_ENTITY_S *pstEnt,
        const HI_S8 *FunctionName,
        const HI_S32 LineNumber)
{
    if (HI_NULL == pstEnt)
    {
        return HI_FAILURE;
    }

    atomic_inc(&pstEnt->atmUseCnt);

    if (atomic_read(&pstEnt->atmRlsFlag) != 0)
    {
        atomic_dec(&pstEnt->atmUseCnt);

        if (atomic_read(&pstEnt->atmRlsFlag) != 1)
        {
            HI_ERR_VDEC("Use lock err by %s %d\n", FunctionName, LineNumber);
        }

        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static inline HI_S32  VDEC_CHAN_USE_UP_HELP(VDEC_CHAN_ENTITY_S *pstEnt,
        const HI_S8 *FunctionName,
        const HI_S32 LineNumber)
{
    if (HI_NULL == pstEnt)
    {
        return HI_FAILURE;
    }

    if ((atomic_read(&pstEnt->atmUseCnt) != 0) && (atomic_dec_return(&pstEnt->atmUseCnt) < 0))
    {
        HI_ERR_VDEC("Use unlock err by %s %d\n", FunctionName, LineNumber);
    }

    return HI_SUCCESS;
}

static inline HI_S32  VDEC_CHAN_RLS_DOWN_HELP(VDEC_CHAN_ENTITY_S *pstEnt, HI_U32 time)
{
    HI_S32 s32Ret;

    if (HI_NULL == pstEnt)
    {
        return HI_FAILURE;
    }

    /* Realse all */
    if (atomic_inc_return(&pstEnt->atmRlsFlag) != 1)
    {
        atomic_dec(&pstEnt->atmRlsFlag);
        return HI_FAILURE;
    }

    if (atomic_read(&pstEnt->atmUseCnt) != 0)
    {
        if (HI_INVALID_TIME == time)
        {
            s32Ret = wait_event_interruptible(pstEnt->stRlsQue, (atomic_read(&pstEnt->atmUseCnt) == 0));
        }
        else
        {
            s32Ret = wait_event_interruptible_timeout(pstEnt->stRlsQue, (atomic_read(&pstEnt->atmUseCnt) == 0), time);
        }

        if (s32Ret == 0)
        {
            return HI_SUCCESS;
        }
        else
        {
            if (s32Ret < 0)
            {
                return HI_SUCCESS;
            }

            atomic_dec(&pstEnt->atmRlsFlag);
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}

static inline HI_VOID VDEC_CHAN_RLS_UP_HELP(VDEC_CHAN_ENTITY_S *pstEnt,
        const HI_S8 *FunctionName,
        const HI_S32 LineNumber)
{
    if (HI_NULL == pstEnt)
    {
        return;
    }

    if (atomic_dec_return(&pstEnt->atmRlsFlag) < 0)
    {
        HI_ERR_VDEC("Use unlock err by %s %d\n", FunctionName, LineNumber);
    }

    return;
}

static HI_S32 GetImage(VDEC_CHANNEL_S *pstChan, HI_S32 InstID, IMAGE *pFrame)
{
    HI_S32 Ret;

    if (pstChan && pstChan->stImageIntf.read_image)
    {
        Ret = pstChan->stImageIntf.read_image(InstID, pFrame);

        if (Ret == HI_SUCCESS)
        {
            pFrame->image_id  += pstChan->VfmwMagicWord;
            pFrame->image_id_1 += pstChan->VfmwMagicWord;
        }

        return Ret;
    }
    else
    {
        HI_ERR_VDEC("pstChan = NULL, invalid!\n");
        return VDEC_ERR;
    }
}

static HI_S32 RlsImage(VDEC_CHANNEL_S *pstChan, HI_S32 InstID, IMAGE *pFrame)
{
    if (pstChan && pstChan->stImageIntf.release_image)
    {
        pFrame->image_id  -= pstChan->VfmwMagicWord;
        pFrame->image_id_1 -= pstChan->VfmwMagicWord;

        return pstChan->stImageIntf.release_image(InstID, pFrame);
    }
    else
    {
        HI_ERR_VDEC("pstChan = NULL, invalid!\n");
        return VDEC_ERR;
    }
}


HI_U32 VDEC_GetTimeInMs(VOID)
{
    UINT64 SysTime;

    SysTime = sched_clock();
    do_div(SysTime, 1000000);
    return (HI_U32)SysTime;
}

HI_S32 VDEC_InitSpinLock(VDEC_SPIN_LOCK_S *pLock)
{
    if (HI_NULL == pLock)
    {
        return HI_FAILURE;
    }

    spin_lock_init(&pLock->irq_lock);
    pLock->isInit = HI_TRUE;

    return HI_SUCCESS;
}

HI_VOID VDEC_SpinLockIRQ(VDEC_SPIN_LOCK_S *pLock)
{
    if (HI_NULL == pLock)
    {
        return;
    }

    if (pLock->isInit == HI_FALSE)
    {
        spin_lock_init(&pLock->irq_lock);
        pLock->isInit = HI_TRUE;
    }

    spin_lock_irqsave(&pLock->irq_lock, pLock->irq_lockflags);

    return;
}

HI_VOID VDEC_SpinUnLockIRQ(VDEC_SPIN_LOCK_S *pLock)
{
    if (HI_NULL == pLock)
    {
        return;
    }

    if (pLock->isInit == HI_TRUE)
    {
        spin_unlock_irqrestore(&pLock->irq_lock, pLock->irq_lockflags);
    }

    return;
}

static VOID HI_DRV_VDEC_REPORT_TO_OMX(VDEC_CHANNEL_S *pstChan, HI_U32 EventID, HI_S32 result, HI_VOID *PrivData)
{
    if ((pstChan->OmxTunnelMode) && (pstChan->hOmxChn != HI_INVALID_HANDLE)
        && (s_stVdecDrv.pOmxFunc) && (s_stVdecDrv.pOmxFunc->pfnOmxVdecEventReport))
    {
        (s_stVdecDrv.pOmxFunc->pfnOmxVdecEventReport)((HI_S32)(pstChan->hOmxChn), EventID, result, PrivData);
    }
}


HI_S32 VDEC_FindChannelHandleByInstance(HI_HANDLE hHandle, VDEC_CHANNEL_S **pstChan)
{
    if (HI_NULL == pstChan)
    {
        HI_ERR_VDEC("null point pstChan\n");
        return HI_FAILURE;
    }

    *pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    return HI_SUCCESS;
}

HI_S32 VDEC_FindVdecHandleByESBufferHandle(HI_HANDLE hStreamBufferHandle, HI_HANDLE *phVdec)
{
    HI_U32 i;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        pstChan = s_stVdecDrv.astChanEntity[i].pstChan;

        if (HI_NULL == pstChan)
        {
            continue;
        }

        if (hStreamBufferHandle == pstChan->hStrmBuf)
        {
            *phVdec = i;
            break;
        }
    }

    if (i >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_NewImage(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    IMAGE *pstImage;

    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);
    pstImage = (IMAGE *)(pArgs);

    if ((pstImage->disp_height != pstChan->stNormChangeParam.u32ImageHeight)
        || (pstImage->disp_width != pstChan->stNormChangeParam.u32ImageWidth))
    {
        switch (pstImage->format.source_format)
        {
            case 0: /* PROGRESSIVE */
            case 2: /* INFERED_PROGRESSIVE */
                pstChan->stNormChangeParam.bProgressive = HI_TRUE;
                break;

            case 1: /* INTERLACE */
            case 3: /* INFERED_INTERLACE */
            default:
                pstChan->stNormChangeParam.bProgressive = HI_FALSE;
                break;
        }

        if (pstImage->disp_height <= 288)
        {
            pstChan->stNormChangeParam.bProgressive = HI_TRUE;
        }

        pstChan->stNormChangeParam.enNewFormat    = pstChan->enDisplayNorm;
        pstChan->stNormChangeParam.u32ImageWidth  = pstImage->disp_width  & 0xfffffffe;
        pstChan->stNormChangeParam.u32ImageHeight = pstImage->disp_height & 0xfffffffc;
        pstChan->stNormChangeParam.u32FrameRate   = 25000;
        pstChan->bNormChange                      = HI_TRUE;

        if ((pstChan->enCurState == VDEC_CHAN_STATE_RUN)
            && (pstChan->OmxTunnelMode == 1)
            && (pstChan->hOmxChn != HI_INVALID_HANDLE))
        {
            HI_DRV_VDEC_REPORT_TO_OMX(pstChan,VDEC_EVT_REPORT_IMG_SIZE_CHG, HI_SUCCESS, pstImage);
        }
    }

    pstChan->bWakeUp = HI_TRUE;

    if (pstChan->stStatInfo.u32DecoderReportTime == 0)
    {
        pstChan->stStatInfo.u32DecoderReportTime = VDEC_GetTimeInMs();
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_FindIFrame(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    HI_U32 u32IStreamSize = 0;

    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle != HI_INVALID_HANDLE, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);

    pstChan->stStatInfo.u32TotalVdecParseIFrame++;

    if (1 == pstChan->stStatInfo.u32TotalVdecParseIFrame)
    {
        u32IStreamSize = *(HI_U32 *)pArgs;
        HI_DRV_STAT_Event(STAT_EVENT_ISTREAMGET, u32IStreamSize);
    }

    return HI_SUCCESS;
}

HI_UNF_VIDEO_USER_DATA_POSITION_E VDEC_Convert_Userdata_SourceType(VDEC_USD_TYPE_E vdec_userdata_source_type)
{
    HI_UNF_VIDEO_USER_DATA_POSITION_E unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_BUTT;

    switch (vdec_userdata_source_type)
    {
        case USD_INVALID:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_UNKNOWN;
            break;

        case USD_MP2SEQ:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_SEQ;
            break;

        case USD_MP2GOP:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_GOP;
            break;

        case USD_MP2PIC:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG2_FRAME;
            break;

        case USD_MP4VSOS:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VSOS;
            break;

        case USD_MP4VSO:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VSO;
            break;

        case USD_MP4VOL:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_VOL;
            break;

        case USD_MP4GOP:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_MPEG4_GOP;
            break;

        case USD_H264_REG:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_H264_REG;
            break;

        case USD_H264_UNREG:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_H264_UNREG;
            break;

        case USD_AVSSEQ:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_BUTT;
            break;

        case USD_AVSPIC:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_BUTT;
            break;

        default:
            unf_userdata_source_type = HI_UNF_VIDEO_USER_DATA_POSITION_BUTT;
            break;
    }

    return unf_userdata_source_type;
}

static HI_S32 VDEC_Event_UsrData(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    USRDAT *pstUsrData = HI_NULL;
    HI_U32 u32WriteID;
    HI_U32 u32ReadID;

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
#if (0 == HI_VDEC_CC_FROM_IMAGE)
    HI_U32 u32ID;
    HI_U8 u8Type;
#endif
#endif

    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle != HI_INVALID_HANDLE, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);

#ifdef HI_TEE_SUPPORT

    if (pstChan->bTvp)
    {
        HI_ERR_VDEC("TVP not support USERDATA!\n");
        return HI_FAILURE;
    }
    else
#endif
    {
        pstUsrData = (USRDAT *)(pArgs);

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
#if (0 == HI_VDEC_CC_FROM_IMAGE)

        if (pstUsrData->data_size > 5)
        {
            u32ID = *((HI_U32 *)pstUsrData->data);
            u8Type = pstUsrData->data[4];

            if ((VDEC_USERDATA_IDENTIFIER_DVB1 == u32ID) && (VDEC_USERDATA_TYPE_DVB1_CC == u8Type))
            {
#if (1 == VDEC_USERDATA_NEED_ARRANGE)
                USRDATA_Arrange(hHandle, pstUsrData);
#endif
                return HI_SUCCESS;
            }
        }

#endif
#endif

        if (pstChan->pstUsrData == HI_NULL)
        {
            pstChan->pstUsrData = HI_KMALLOC_ATOMIC_VDEC(sizeof(VDEC_USRDATA_PARAM_S));

            if (pstChan->pstUsrData == HI_NULL)
            {
                HI_ERR_VDEC("No memory\n");
                return HI_FAILURE;
            }

            memset(pstChan->pstUsrData, 0, sizeof(VDEC_USRDATA_PARAM_S));
        }

        /* Discard if the buffer of user data full */
        u32WriteID = pstChan->pstUsrData->u32WriteID;
        u32ReadID = pstChan->pstUsrData->u32ReadID;

        if ((u32WriteID + 1) % VDEC_UDC_MAX_NUM == u32ReadID)
        {
            HI_INFO_VDEC("Chan %d drop user data\n", hHandle);
            return HI_FAILURE;
        }

        pstChan->pstUsrData->stAttr[u32WriteID].enBroadcastProfile = HI_UNF_VIDEO_BROADCAST_DVB;
        pstChan->pstUsrData->stAttr[u32WriteID].enPositionInStream = VDEC_Convert_Userdata_SourceType(pstUsrData->from);
        pstChan->pstUsrData->stAttr[u32WriteID].u32Pts = (HI_U32)pstUsrData->PTS;
        pstChan->pstUsrData->stAttr[u32WriteID].u32SeqCnt = pstUsrData->seq_cnt;
        pstChan->pstUsrData->stAttr[u32WriteID].u32SeqFrameCnt  = pstUsrData->seq_img_cnt;
        pstChan->pstUsrData->stAttr[u32WriteID].bBufferOverflow = (pstUsrData->data_size > VDEC_KUD_MAX_LEN);
        pstChan->pstUsrData->stAttr[u32WriteID].pu8Buffer = pstChan->pstUsrData->au8Buf[u32WriteID];
        pstChan->pstUsrData->stAttr[u32WriteID].u32Length =
            (pstUsrData->data_size > VDEC_KUD_MAX_LEN) ? MAX_USER_DATA_LEN : pstUsrData->data_size;

        memcpy(pstChan->pstUsrData->stAttr[u32WriteID].pu8Buffer, pstUsrData->data,
               pstChan->pstUsrData->stAttr[u32WriteID].u32Length);

        pstChan->pstUsrData->u32WriteID = (u32WriteID + 1) % VDEC_UDC_MAX_NUM;
        HI_INFO_VDEC("Chan: %d get user data\n", hHandle);
        pstChan->bNewUserData = HI_TRUE;
        return HI_SUCCESS;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_StreamErr(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    pstChan->stStatInfo.u32TotalStreamErrNum++;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_IFrameErr(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    pstChan->bIFrameErr = HI_TRUE;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_ErrFrame(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    pstChan->bErrorFrame = HI_TRUE;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_LastFrame(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle != HI_INVALID_HANDLE, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);

    /* *(HI_U32*)pArgs: 0 success, 1 fail,  2 report last frame image id */
    if (1 == *(HI_U32 *)pArgs)
    {
        pstChan->eEofReportStatus = EOF_STATUS_FAILURE;
    }
    else if (2 <= *(HI_U32 *)pArgs)
    {
        pstChan->eEofReportStatus = EOF_STATUS_WITH_ID;
        pstChan->u32LastFrmId = *(HI_U32 *)pArgs - 2;
    }

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_SetEosFlag(hHandle);
#endif

    pstChan->bEndOfStrm = HI_TRUE;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_FakeFrame(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    pstChan->eEofReportStatus = EOF_STATUS_FAKE_EOF;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_ResolutionChange(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_FAILURE);

    if (s_stVdecDrv.astChanEntity[hHandle].eCallBack)
    {
        s_stVdecDrv.astChanEntity[hHandle].eCallBack(hHandle, NULL, VIDDEC_EVT_STREAM_INFO_CHANGE);
    }

    pstChan->u8ResolutionChange = 1;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_UnsupportSpec(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    UNSUPPORT_SPEC_E e_SpecType;
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);
    e_SpecType = ((HI_U32 *)pArgs)[0];

    switch (e_SpecType)
    {
        case SPEC_BIT_DEPTH:
            pstChan->u32LastLumaBitdepth   = ((HI_U32 *)pArgs)[1];
            pstChan->u32LastChromaBitdepth = ((HI_U32 *)pArgs)[1];
            break;

        default:
            break;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].eCallBack)
    {
        s_stVdecDrv.astChanEntity[hHandle].eCallBack(hHandle, NULL, VIDDEC_EVT_UNSUPPORTED_STREAM_TYPE);
    }

    pstChan->bUnSupportStream = 1;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_Unsupport(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_FAILURE);

    if (s_stVdecDrv.astChanEntity[hHandle].eCallBack)
    {
        s_stVdecDrv.astChanEntity[hHandle].eCallBack(hHandle, NULL, VIDDEC_EVT_UNSUPPORTED_STREAM_TYPE);
    }

    pstChan->bUnSupportStream = 1;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_RatioNotZero(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(pArgs != HI_NULL, HI_FAILURE);

    pstChan->u32ErrRatio = *(HI_U32 *)pArgs;
    pstChan->stStatInfo.u32VdecDecErrFrame++;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_VideoStdError(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);

    if (HI_UNF_VCODEC_TYPE_MPEG2 == pstChan->stCurCfg.enType)
    {
        pstChan->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_TRUE;
        pstChan->stProbeStreamInfo.enCodecType = HI_UNF_VCODEC_TYPE_H264;
    }

    if (HI_UNF_VCODEC_TYPE_H264 == pstChan->stCurCfg.enType)
    {
        pstChan->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_TRUE;
        pstChan->stProbeStreamInfo.enCodecType = HI_UNF_VCODEC_TYPE_MPEG2;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Event_MeetNewFrame(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, HI_VOID *pArgs)
{
    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);

    pstChan->stStatInfo.u32TotalVfmwOutFrame++;

    if (pstChan->stStatInfo.u32DecoderStartVDMTime == 0)
    {
        pstChan->stStatInfo.u32DecoderStartVDMTime = VDEC_GetTimeInMs();
    }

    return HI_SUCCESS;
}

static const VDECEVENT_COMMAND_NODE g_EVENT_CommandTable[] =
{
    {EVNT_NEW_IMAGE,         VDEC_Event_NewImage},
    {EVNT_FIND_IFRAME,       VDEC_Event_FindIFrame},
    {EVNT_USRDAT,            VDEC_Event_UsrData},
    {EVNT_VDM_ERR,           VDEC_Event_StreamErr},
    {EVNT_SE_ERR,            VDEC_Event_StreamErr},
    {EVNT_IFRAME_ERR,        VDEC_Event_IFrameErr},
    {EVNT_ERR_FRAME,         VDEC_Event_ErrFrame},
    {EVNT_LAST_FRAME,        VDEC_Event_LastFrame},
    {EVNT_FAKE_FRAME,        VDEC_Event_FakeFrame},
    {EVNT_RESOLUTION_CHANGE, VDEC_Event_ResolutionChange},
    {EVNT_UNSUPPORT_SPEC,    VDEC_Event_UnsupportSpec},
    {EVNT_UNSUPPORT,         VDEC_Event_Unsupport},
    {EVNT_RATIO_NOTZERO,     VDEC_Event_RatioNotZero},
    {EVNT_VIDSTD_ERROR,      VDEC_Event_VideoStdError},
    {EVNT_MEET_NEWFRM,       VDEC_Event_MeetNewFrame},

    {EVNT_BUTT, HI_NULL}, //terminal element
};

FN_VDEC_EVENT_HANDLER VDEC_Event_Get_Handler(HI_U32 Code)
{
    HI_U32 Index = 0;
    FN_VDEC_EVENT_HANDLER pTargetHandler = HI_NULL;

    while (1)
    {
        if (g_EVENT_CommandTable[Index].Code == EVNT_BUTT || g_EVENT_CommandTable[Index].pHandler == HI_NULL)
        {
            break;
        }

        if (Code == g_EVENT_CommandTable[Index].Code)
        {
            pTargetHandler = g_EVENT_CommandTable[Index].pHandler;
            break;
        }

        Index++;
    }

    return pTargetHandler;
}

static HI_S32 VDEC_EventHandle(HI_S32 s32ChanID, HI_S32 s32EventType, HI_VOID *pArgs)
{
    HI_S32 s32Ret;
    HI_HANDLE hHandle;
    FN_VDEC_EVENT_HANDLER pEvent_Handler = HI_NULL;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* Find channel number */
    for (hHandle = 0; hHandle < HI_VDEC_MAX_INSTANCE_NEW; hHandle++)
    {
        if (s_stVdecDrv.astChanEntity[hHandle].pstChan)
        {
            if (s_stVdecDrv.astChanEntity[hHandle].pstChan->hChan == s32ChanID)
            {
                break;
            }
        }
    }

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("bad handle %d!\n", hHandle);
        return HI_FAILURE;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (s32Ret != HI_SUCCESS)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    pEvent_Handler = VDEC_Event_Get_Handler(s32EventType);

    if (pEvent_Handler == HI_NULL)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    s32Ret = pEvent_Handler(pstChan, hHandle, pArgs);
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return s32Ret;
}

static HI_BOOL VDEC_CheckCodecSupport(HI_UNF_VCODEC_TYPE_E enType)
{
    HI_SYS_VIDEO_CODEC_E enSysCodec = HI_SYS_VIDEO_MASK;
    HI_S32 s32ret = HI_SUCCESS;
    HI_BOOL ret = HI_TRUE;

    s32ret = HI_DRV_SYS_GetVideoCodecSupport(&enSysCodec);

    if (s32ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("SYS_GetVideoCodecSupport fail\n");
        return HI_FALSE;
    }

    g_enSysCodec = enSysCodec;
    switch(enType)
    {
        case HI_UNF_VCODEC_TYPE_MPEG2:
            ret = ((enSysCodec & HI_SYS_VIDEO_MPEG2) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_MPEG4:
            ret = ((enSysCodec & HI_SYS_VIDEO_MPEG4) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_VC1:
           ret = ((enSysCodec & HI_SYS_VIDEO_VC1) == 0) ? HI_FALSE : HI_TRUE;
           break;

        case HI_UNF_VCODEC_TYPE_H264:
            ret = ((enSysCodec & HI_SYS_VIDEO_H264) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_MVC:
            ret = ((enSysCodec & HI_SYS_VIDEO_MVC) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_HEVC:
            ret = ((enSysCodec & HI_SYS_VIDEO_H265) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_AVS:
            ret = ((enSysCodec & HI_SYS_VIDEO_AVS) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_DIVX3:
            ret = ((enSysCodec & HI_SYS_VIDEO_DIVX) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_REAL8:
            ret = ((enSysCodec & HI_SYS_VIDEO_REAL8) == 0) ? HI_FALSE : HI_TRUE;
            break;

        case HI_UNF_VCODEC_TYPE_REAL9:
            ret = ((enSysCodec & HI_SYS_VIDEO_REAL9) == 0) ? HI_FALSE : HI_TRUE;
            break;

        default:
            ret = HI_TRUE;
            break;
   }

   return ret;
}

static VID_STD_E VDEC_CodecTypeUnfToFmw(HI_UNF_VCODEC_TYPE_E unfType)
{
    switch (unfType)
    {
        case HI_UNF_VCODEC_TYPE_MPEG2:
            return STD_MPEG2;

        case HI_UNF_VCODEC_TYPE_MPEG4:
            return STD_MPEG4;

        case HI_UNF_VCODEC_TYPE_AVS:
            return STD_AVS;

        case HI_UNF_VCODEC_TYPE_H263:
            return STD_H263;

        case HI_UNF_VCODEC_TYPE_VP6:
            return STD_VP6;

        case HI_UNF_VCODEC_TYPE_VP6F:
            return STD_VP6F;

        case HI_UNF_VCODEC_TYPE_VP6A:
            return STD_VP6A;

        case HI_UNF_VCODEC_TYPE_VP8:
            return STD_VP8;

        case HI_UNF_VCODEC_TYPE_SORENSON:
            return STD_SORENSON;

        case HI_UNF_VCODEC_TYPE_H264:
            return STD_H264;

        case HI_UNF_VCODEC_TYPE_HEVC:
            return STD_HEVC;

        case HI_UNF_VCODEC_TYPE_REAL9:
            return STD_REAL9;

        case HI_UNF_VCODEC_TYPE_REAL8:
            return STD_REAL8;

        case HI_UNF_VCODEC_TYPE_VC1:
            return STD_VC1;

        case HI_UNF_VCODEC_TYPE_DIVX3:
            return STD_DIVX3;

        case HI_UNF_VCODEC_TYPE_MVC:
            return STD_MVC;

        case HI_UNF_VCODEC_TYPE_RAW:
            return STD_RAW;

        case HI_UNF_VCODEC_TYPE_MJPEG:
            return STD_USER;

        case HI_UNF_VCODEC_TYPE_VP9:
            return STD_VP9;

        case HI_UNF_VCODEC_TYPE_AVS2:
            return STD_AVS2;

        default:
            return STD_END_RESERVED;
    }
}

static HI_VOID GetDecMode(HI_UNF_VCODEC_MODE_E enMode, VDEC_CHAN_CFG_S *pstVdecChanCfg)
{
    switch (enMode)
    {
        case HI_UNF_VCODEC_MODE_NORMAL:
            pstVdecChanCfg->s32DecMode = IPB_MODE;
            break;

        case HI_UNF_VCODEC_MODE_IP:
            pstVdecChanCfg->s32DecMode = IP_MODE;
            break;

        case HI_UNF_VCODEC_MODE_I:
            pstVdecChanCfg->s32DecMode = I_MODE;
            break;

        case HI_UNF_VCODEC_MODE_DROP_INVALID_B:
            pstVdecChanCfg->s32DecMode = DISCARD_B_BF_P_MODE;
            break;

        case HI_UNF_VCODEC_MODE_BUTT:
        default:
            pstVdecChanCfg->s32DecMode = IPB_MODE;
            break;
    }

    return;
}

#ifdef HI_HDR_DOLBYVISION_SUPPORT
static HI_VOID SetHDRAttr(VDEC_CHANNEL_S *pstChan, VDEC_CHAN_CFG_S *pstVdecChanCfg)
{
    /* set hdr info*/
    if (pstChan->stVdecHdrAttr.enVdecHDRType != HI_VDEC_HDR_CHAN_TYPE_BUTT)
    {
        pstVdecChanCfg->s8BeHDRChan = 1;

        if (pstChan->stVdecHdrAttr.enVdecHDRType == HI_VDEC_HDR_CHAN_TYPE_BL)
        {
            pstVdecChanCfg->dv_codec_capacity = DV_BL_DECODING_SUPPORT;
        }
        else if (pstChan->stVdecHdrAttr.enVdecHDRType == HI_VDEC_HDR_CHAN_TYPE_EL)
        {
            pstVdecChanCfg->dv_codec_capacity = DV_EL_DECODING_SUPPORT;
        }
        else
        {
            HI_ERR_VDEC("hdr info error!");
        }

        if (pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_SINGLE_VES
            || pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_SL_VES)
        {
            pstVdecChanCfg->ves_imp = DV_SINGLE_VES_IMP;
        }
        else if (pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_DUAL_VES)
        {
            pstVdecChanCfg->ves_imp = DV_DUAL_VES_IMP;
        }
        else
        {
            pstVdecChanCfg->ves_imp = DV_MAX_VES_IMP;
        }

        if (pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_SL_VES)
        {
            pstVdecChanCfg->layer_imp = DV_SINGLE_LAYER_IMP;
        }
        else if (pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_SINGLE_VES
                 || pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType == HI_UNF_AVPLAY_HDR_STREAM_TYPE_DL_DUAL_VES)
        {
            pstVdecChanCfg->layer_imp = DV_DUAL_LAYER_IMP;
        }
        else
        {
            pstVdecChanCfg->layer_imp = DV_MAX_LAYER_IMP;
        }

        pstVdecChanCfg->bCompatible = pstChan->stVdecHdrAttr.AvplayHDRAttr.bCompatible;
    }
    else
    {
        pstVdecChanCfg->s8BeHDRChan = 0;
    }

    return;
}
#endif

static HI_S32 VDEC_SetAttr(HI_HANDLE hHandle, VDEC_CHANNEL_S *pstChan)
{
    HI_S32 s32Ret = HI_FAILURE;
    VDEC_CHAN_CFG_S stVdecChanCfg;
    HI_UNF_VCODEC_ATTR_S *pstCfg = &pstChan->stCurCfg;
    HI_U32 CtrlOptions = pstCfg->s32CtrlOptions;

    memset(&stVdecChanCfg, 0, sizeof(VDEC_CHAN_CFG_S));
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_CHAN_CFG, &stVdecChanCfg, sizeof(stVdecChanCfg));

    if (s32Ret != VDEC_OK)
    {
        HI_ERR_VDEC("VFMW GET_CHAN_CFG err!\n");
        return HI_FAILURE;
    }

    if (VDEC_CheckCodecSupport(pstCfg->enType) == HI_FALSE)
    {
        HI_ERR_VDEC("codec %d disabled, 0x%x\n", pstCfg->enType, g_enSysCodec);
        return HI_FAILURE;
    }

    if (((CtrlOptions >> 1) & 0x1) == 1)
    {
        pstChan->bLowdelay = 0;
        stVdecChanCfg.isMiracastChan = 1;
    }
    else
    {
        stVdecChanCfg.isMiracastChan = 0;
    }

    stVdecChanCfg.s32ModuleLowlyEnable = pstChan->bLowdelay;
    stVdecChanCfg.s32LowdlyEnable = 0;
    stVdecChanCfg.s32SedOnlyEnable = 1;

    stVdecChanCfg.s32DecOrderOutput = (pstCfg->bOrderOutput == HI_TRUE) ? DEC_ORDER : DISP_ORDER;
    stVdecChanCfg.eVidStd = VDEC_CodecTypeUnfToFmw(pstCfg->enType);

    if (pstCfg->enType == HI_UNF_VCODEC_TYPE_VC1)
    {
        stVdecChanCfg.StdExt.Vc1Ext.IsAdvProfile = pstCfg->unExtAttr.stVC1Attr.bAdvancedProfile;
        stVdecChanCfg.StdExt.Vc1Ext.CodecVersion = (HI_S32)(pstCfg->unExtAttr.stVC1Attr.u32CodecVersion);
    }
    else if ((pstCfg->enType == HI_UNF_VCODEC_TYPE_VP6)
             || (pstCfg->enType == HI_UNF_VCODEC_TYPE_VP6F)
             || (pstCfg->enType == HI_UNF_VCODEC_TYPE_VP6A))
    {
        stVdecChanCfg.StdExt.Vp6Ext.bReversed = pstCfg->unExtAttr.stVP6Attr.bReversed;
    }

    stVdecChanCfg.s32ExtraFrameStoreNum = (DISP_FRAME_NUM > 0) ? (DISP_FRAME_NUM - 1) : 0;
    stVdecChanCfg.s32ExtraFrameStoreNum += EXTRA_PVR_FRAME_NUM;
    stVdecChanCfg.s32ChanPriority = pstCfg->u32Priority;
    stVdecChanCfg.s32ChanErrThr = pstCfg->u32ErrCover;
    stVdecChanCfg.bOnlyOneIFrame = 0;

    GetDecMode(pstCfg->enMode, &stVdecChanCfg);

    if (pstChan->bLowdelay)
    {
        stVdecChanCfg.s32DecMode = IP_MODE;
        pstCfg->enMode = HI_UNF_VCODEC_MODE_IP;
    }

    if (pstCfg->bOrderOutput == HI_TRUE)
    {
        stVdecChanCfg.s32DecOrderOutput = pstCfg->bOrderOutput + (CtrlOptions & 0x1);
    }
    else
    {
        stVdecChanCfg.s32DecOrderOutput = 0;
    }

    stVdecChanCfg.s32ChanStrmOFThr = (pstChan->u32DmxBufSize * 95) / 100;
    stVdecChanCfg.enCompress = GlbCompStrategy;

    stVdecChanCfg.s32VcmpWmStartLine = 0;
    stVdecChanCfg.s32VcmpWmEndLine = 0;

    /* Only if pstCfg->orderOutput is 1 we do the judge */
    if (pstCfg->bOrderOutput)
    {
        if ((CtrlOptions & 0x1) == HI_UNF_VCODEC_CTRL_OPTION_NORMAL_DPB)
        {
            /*just want to set output by decode order*/
            stVdecChanCfg.s32DecOrderOutput = 1;
        }
        else if (((CtrlOptions & 0x1) & HI_UNF_VCODEC_CTRL_OPTION_SIMPLE_DPB) || pstChan->bLowdelay)
        {
            /* set to 2 means both bOrderoutput and SIMPLE_DPB */
            stVdecChanCfg.s32DecOrderOutput = 2;
        }
    }

    if (pstChan->bDPBFullCtrl)
    {
        stVdecChanCfg.s32DecOrderOutput = 3;
    }

    if (pstChan->bUVMOSEnable)
    {
        stVdecChanCfg.bUVMOSEnable = HI_TRUE;
    }

    stVdecChanCfg.s32MaxWidth = 1920;
    stVdecChanCfg.s32MaxHeight = 1088;
#ifdef HI_HDR_DOLBYVISION_SUPPORT
    SetHDRAttr(pstChan, &stVdecChanCfg);
#endif

    if (pstChan->OmxTunnelMode)
    {
        stVdecChanCfg.s32IsTunneledPath = 1;
    }

    stVdecChanCfg.hVdecHandle = ((HI_ID_VDEC << 16) | hHandle);

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_CFG_CHAN, &stVdecChanCfg, sizeof(stVdecChanCfg));

    if (VDEC_OK != s32Ret)
    {
        HI_ERR_VDEC("VFMW CFG_CHAN err!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_SeekPTS(HI_HANDLE hHandle, HI_U32 *pu32SeekPts, HI_U32 u32Gap)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_U64 pTmpUserData[3] = {0};
    BUFMNG_STATUS_S stBMStatus = {0};
    HI_U32 u32RawBufferNum = 0;
    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /*TS mode not support SeekPts*/
    if (pstChan->hDmxVidChn != HI_INVALID_HANDLE)
    {
        HI_ERR_VDEC("ERR: %d  VDEC do not support ts mode Now! \n", hHandle);
        return  HI_FAILURE;
    }

    /* stop vpss and vfmw */
    if (pstChan->enCurState != VDEC_CHAN_STATE_STOP)
    {
        /* Stop VFMW */
        if (HI_INVALID_HANDLE != pstChan->hChan)
        {
            s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_STOP_CHAN, HI_NULL, 0);

            if (VDEC_OK != s32Ret)
            {
                HI_ERR_VDEC("Chan %d STOP_CHAN err!\n", pstChan->hChan);
                return HI_FAILURE;
            }
        }

        /* Save state */
        pstChan->enCurState = VDEC_CHAN_STATE_STOP;
    }

    /*calc rawbuffer num*/
    s32Ret = BUFMNG_GetStatus(pstChan->hStrmBuf, &stBMStatus);

    if (HI_SUCCESS == s32Ret)
    {
        u32RawBufferNum = stBMStatus.u32PutOK - stBMStatus.u32RlsOK;
    }

    /*call vfmw seek pts*/
    pTmpUserData[0] = *(pu32SeekPts);
    pTmpUserData[1] = u32Gap;
    pTmpUserData[2] = u32RawBufferNum;
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_PTS_TO_SEEK, &pTmpUserData[0], sizeof(pTmpUserData[0]));

    if (s32Ret != VDEC_OK)
    {
        HI_ERR_VDEC("VDEC_CID_SET_PTS_TO_SEEK err!\n");
        return HI_FAILURE;
    }

    *(pu32SeekPts) = pTmpUserData[0];

    /*start VFMW*/
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_START_CHAN, HI_NULL, 0);

    if (VDEC_OK != s32Ret)
    {
        HI_ERR_VDEC("Chan %d VDEC_CID_START_CHAN err!\n", pstChan->hChan);
        return HI_FAILURE;
    }

    /* Save state */
    pstChan->enCurState = VDEC_CHAN_STATE_RUN;

    return  s32Ret;
}

static HI_CODEC_ID_E VDEC_VFMW_STD2CodecId(VID_STD_E VidStd)
{
    switch (VidStd)
    {
        case VFMW_H264:
            return HI_CODEC_ID_VIDEO_H264;

        case VFMW_HEVC:
            return HI_CODEC_ID_VIDEO_HEVC;

        case VFMW_VC1:
            return HI_CODEC_ID_VIDEO_VC1;

        case VFMW_MPEG4:
            return HI_CODEC_ID_VIDEO_MPEG4;

        case VFMW_MPEG2:
            return HI_CODEC_ID_VIDEO_MPEG2;

        case VFMW_H263:
            return HI_CODEC_ID_VIDEO_H263;

        case VFMW_DIVX3:
            return HI_CODEC_ID_VIDEO_DIVX3;

        case VFMW_AVS:
            return HI_CODEC_ID_VIDEO_AVS;

        case VFMW_JPEG:
            return HI_CODEC_ID_VIDEO_JPEG;

        case VFMW_REAL8:
            return HI_CODEC_ID_VIDEO_REAL8;

        case VFMW_REAL9:
            return HI_CODEC_ID_VIDEO_REAL9;

        case VFMW_VP6:
            return HI_CODEC_ID_VIDEO_VP6;

        case VFMW_VP6F:
            return HI_CODEC_ID_VIDEO_VP6F;

        case VFMW_VP6A:
            return HI_CODEC_ID_VIDEO_VP6A;

        case VFMW_VP8:
            return HI_CODEC_ID_VIDEO_VP8;

        case VFMW_SORENSON:
            return HI_CODEC_ID_VIDEO_SORENSON;

        case VFMW_RAW:
            return HI_CODEC_ID_VIDEO_RAW;

        case VFMW_VP9:
            return HI_CODEC_ID_VIDEO_VP9;

        case VFMW_AVS2:
            return HI_CODEC_ID_VIDEO_AVS2;

        case VFMW_END_RESERVED:
            return HI_CODEC_ID_BUTT;

        default:
            return HI_CODEC_ID_NONE;
    }
}

static HI_S32 VDEC_GetCap(VDEC_IOCTL_MSG *pMsg)
{
    HI_S32 s32Ret;
    VDEC_CAP_S stCap;
    HI_S32 i = 0;
    HI_CODEC_ID_E codec[32];

    if (pMsg == HI_NULL)
    {
        return HI_FAILURE;
    }

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(HI_INVALID_HANDLE, VDEC_CID_GET_CAPABILITY, &stCap, sizeof(VDEC_CAP_S));

    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_VDEC("VFMW GET_CAPABILITY err: %d!\n", s32Ret);
        return HI_FAILURE;
    }

    for (i = 0; i < 32; i++)
    {
        codec[i] = VDEC_VFMW_STD2CodecId(stCap.SupportedStd[i]);

        if (stCap.SupportedStd[i] == VFMW_END_RESERVED)
        {
            break;
        }
    }

    if (copy_to_user((HI_VOID *)(HI_SIZE_T)(pMsg->up_msg), codec, (sizeof(HI_CODEC_ID_E) * 32)))
    {
        HI_ERR_VDEC("%s: call copy_to_user failed!\n", __func__);

        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_CreateStrmBuf(HI_DRV_VDEC_STREAM_BUF_S *pstBuf)
{
    HI_S32 s32Ret;
    BUFMNG_INST_CONFIG_S stBufInstCfg;
    HI_HANDLE hVdec;

    if (HI_NULL == pstBuf)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hVdec = pstBuf->hVdec & 0xff;

    memset(&stBufInstCfg, 0, sizeof(stBufInstCfg));

    /* Create buffer manager instance */
    stBufInstCfg.enAllocType = BUFMNG_ALLOC_INNER;
    stBufInstCfg.u32PhyAddr = 0;
    stBufInstCfg.pu8UsrVirAddr = HI_NULL;
    stBufInstCfg.pu8KnlVirAddr = HI_NULL;
    stBufInstCfg.u32Size = pstBuf->u32Size;

#ifdef HI_TEE_SUPPORT
    stBufInstCfg.bTvp = pstBuf->bTvp;
#endif
    strncpy(stBufInstCfg.aszName, "VDEC_ESBuf", 16);
    s32Ret = BUFMNG_Create(pstBuf->hVdec, &stBufInstCfg);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("BUFMNG_Create err!\n");
        return HI_FAILURE;
    }

    pstBuf->hHandle = pstBuf->hVdec;
    pstBuf->u32PhyAddr = stBufInstCfg.u32PhyAddr;

    return HI_SUCCESS;
}

static HI_S32 VDEC_StrmBuf_SetUserAddr(HI_HANDLE hHandle, HI_U64 u64Addr)
{
    return BUFMNG_SetUserAddr(hHandle, u64Addr);
}

static HI_S32 VDEC_DestroyStrmBuf(HI_HANDLE hHandle)
{
    /* Destroy instance */
    if (HI_SUCCESS != BUFMNG_Destroy(hHandle))
    {
        HI_ERR_VDEC("Destroy buf %d err!\n", hHandle);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_AttachStrmBuf(HI_HANDLE hHandle, HI_U32 u32BufSize, HI_HANDLE hDmxVidChn, HI_HANDLE hStrmBuf)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_ERR_VDEC_INVALID_CHANID;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Must attach buffer before start */
    if (pstChan->enCurState != VDEC_CHAN_STATE_STOP)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d state err:%d!\n", hHandle, pstChan->enCurState);
        return HI_ERR_VDEC_INVALID_STATE;
    }

    if (VDEC_CHAN_STRMBUF_ATTACHED(pstChan))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d has strm buf:%d!\n", hHandle, pstChan->hStrmBuf);
        return HI_ERR_VDEC_BUFFER_ATTACHED;
    }

    if (HI_INVALID_HANDLE != hDmxVidChn)
    {
        pstChan->hDmxVidChn = hDmxVidChn;
        pstChan->u32DmxBufSize = u32BufSize;
        pstChan->hStrmBuf = HI_INVALID_HANDLE;
        pstChan->u32StrmBufSize = 0;
    }
    else
    {
        pstChan->hStrmBuf = hStrmBuf;
        pstChan->u32StrmBufSize = u32BufSize;
        pstChan->hDmxVidChn = HI_INVALID_HANDLE;
        pstChan->u32DmxBufSize = 0;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_DetachStrmBuf(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Must stop channel first */
    if (pstChan->enCurState != VDEC_CHAN_STATE_STOP)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d state err:%d!\n", hHandle, pstChan->enCurState);
        return HI_FAILURE;
    }

    /* Clear handles */
    pstChan->hStrmBuf = HI_INVALID_HANDLE;
    pstChan->u32StrmBufSize = 0;
    pstChan->hDmxVidChn = HI_INVALID_HANDLE;
    pstChan->u32DmxBufSize = 0;
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetEosFlag(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    pstChan->bSetEosFlag = HI_TRUE;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    HI_INFO_VDEC("Chan %d STREAM_END OK\n", hHandle);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_DiscardFrm(HI_HANDLE hHandle, VDEC_DISCARD_FRAME_S *pstParam)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_NULL == pstParam)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Call vfmw */
    if (HI_INVALID_HANDLE != pstChan->hChan)
    {
        s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_DISCARDPICS_PARAM, pstParam, sizeof(VDEC_DISCARD_FRAME_S));

        if (VDEC_OK != s32Ret)
        {
            HI_ERR_VDEC("Chan %d DISCARDPICS err!\n", pstChan->hChan);
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    HI_INFO_VDEC("Chan %d DiscardFrm mode %d OK\n", hHandle, pstParam->enMode);
    return HI_SUCCESS;
}

static HI_S32 VDEC_GetStrmBuf(HI_HANDLE hHandle, VDEC_ES_BUF_PRI_S *pstEsBuf, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret;
    BUFMNG_BUF_S stElem;

    if (HI_NULL == pstEsBuf)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Get buffer */
    stElem.u32Size = pstEsBuf->u32BufSize;
    s32Ret = BUFMNG_GetWriteBuffer(hHandle, &stElem);

    if (s32Ret != HI_SUCCESS)
    {
        return s32Ret;
    }

    pstEsBuf->u32BufSize = stElem.u32Size;

    /* If invoked by user space, return user virtual address */
    if (bUserSpace)
    {
        pstEsBuf->u64Addr = (HI_U64)(HI_SIZE_T)stElem.pu8UsrVirAddr;
    }
    /* else, invoked by kernel space, return kernel virtual address */
    else
    {
        pstEsBuf->u64Addr = (HI_U64)(HI_SIZE_T)stElem.pu8KnlVirAddr;
    }

    pstEsBuf->u32PhyAddr = stElem.u32PhyAddr;

    return HI_SUCCESS;
}

static HI_S32 VDEC_PutStrmBuf(HI_HANDLE hHandle, VDEC_ES_BUF_PRI_S *pstEsBuf, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret;
    BUFMNG_BUF_S stElem;
    HI_HANDLE hVdec = HI_INVALID_HANDLE;
    HI_S32 flag = 0;

    /* Check parameter */
    if (HI_NULL == pstEsBuf)
    {
        HI_INFO_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    /* If user sapce, put by pu8UsrVirAddr */
    if (bUserSpace)
    {
        stElem.pu8UsrVirAddr = (HI_U8 *)(HI_SIZE_T)pstEsBuf->u64Addr;
        stElem.pu8KnlVirAddr = 0;
    }
    /* If kernek sapce, put by pu8KnlVirAddr */
    else
    {
        stElem.pu8KnlVirAddr = (HI_U8 *)(HI_SIZE_T)pstEsBuf->u64Addr;
        stElem.pu8UsrVirAddr = 0;
    }

    stElem.u64Pts = pstEsBuf->u64Pts;
    stElem.u32Marker = 0;

    if (!pstEsBuf->bEndOfFrame)
    {
        stElem.u32Marker |= BUFMNG_NOT_END_FRAME_BIT;
    }

    if (pstEsBuf->bDiscontinuous)
    {
        stElem.u32Marker |= BUFMNG_DISCONTINUOUS_BIT;
    }

    if (pstEsBuf->bDualLayer)
    {
        stElem.u32Marker |= BUFMNG_DV_DL_BIT;
    }

    stElem.u32Size = pstEsBuf->u32BufSize;
    s32Ret = BUFMNG_PutWriteBuffer(hHandle, &stElem);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Buf %d put err!\n", hHandle);
        return HI_FAILURE;
    }

#ifndef HI_NVR_SUPPORT
    /* save raw stream */
    (VOID)VDEC_FindVdecHandleByESBufferHandle(hHandle, &hVdec);
#ifdef HI_PROC_SUPPORT
    (VOID)BUFMNG_SaveRaw((hVdec & 0xff), stElem.pu8KnlVirAddr, stElem.u32Size);
#endif
#endif

    if (g_bEopEnable == HI_TRUE)
    {
        if (hVdec != HI_INVALID_HANDLE)
        {
            //flag |= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType == HI_UNF_VCODEC_TYPE_MPEG2);
            //flag |= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType == HI_UNF_VCODEC_TYPE_MPEG4);
            flag |= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType == HI_UNF_VCODEC_TYPE_HEVC);
            flag |= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType == HI_UNF_VCODEC_TYPE_H264);
#ifdef HI_HDR_DOLBYVISION_SUPPORT
            flag &= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stVdecHdrAttr.enVdecHDRType != HI_VDEC_HDR_CHAN_TYPE_BL);
            flag &= (s_stVdecDrv.astChanEntity[hVdec].pstChan->stVdecHdrAttr.enVdecHDRType != HI_VDEC_HDR_CHAN_TYPE_EL);
#endif
            flag &= (s_stVdecDrv.astChanEntity[hVdec].pstChan->bTvp != HI_TRUE);
        }

        if ((pstEsBuf->bEndOfFrame) && (flag))
        {
            /* Get buffer */

            switch (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType)
            {
                case HI_UNF_VCODEC_TYPE_MPEG4:
                    stElem.u32Size = sizeof(g_EopTab_MPEG4) / sizeof(HI_CHAR);
                    break;

                case HI_UNF_VCODEC_TYPE_HEVC:
                    stElem.u32Size = sizeof(g_EopTab_H265) / sizeof(HI_CHAR);
                    break;

                case HI_UNF_VCODEC_TYPE_H264:
                    stElem.u32Size = sizeof(g_EopTab_H264) / sizeof(HI_CHAR);
                    break;

                default:
                    break;
            }

            s32Ret = BUFMNG_GetWriteBuffer(hHandle, &stElem);

            if ((s32Ret == HI_SUCCESS) && (stElem.pu8KnlVirAddr))
            {
                stElem.u64Pts = pstEsBuf->u64Pts;
                stElem.u32Marker = 0;

                if (!pstEsBuf->bEndOfFrame)
                {
                    stElem.u32Marker |= BUFMNG_NOT_END_FRAME_BIT;
                }

                if (pstEsBuf->bDiscontinuous)
                {
                    stElem.u32Marker |= BUFMNG_DISCONTINUOUS_BIT;
                }

                stElem.u32Marker |= BUFMNG_EXTERN_EOP_BIT;

                switch (s_stVdecDrv.astChanEntity[hVdec].pstChan->stCurCfg.enType)
                {
                    case HI_UNF_VCODEC_TYPE_MPEG4:
                        memcpy(stElem.pu8KnlVirAddr, g_EopTab_MPEG4, sizeof(HI_CHAR)*stElem.u32Size);
                        break;

                    case HI_UNF_VCODEC_TYPE_HEVC:
                        memcpy(stElem.pu8KnlVirAddr, g_EopTab_H265, sizeof(HI_CHAR)*stElem.u32Size);
                        break;

                    case HI_UNF_VCODEC_TYPE_H264:
                        memcpy(stElem.pu8KnlVirAddr, g_EopTab_H264, sizeof(HI_CHAR)*stElem.u32Size);
                        break;

                    default:
                        break;
                }

                s32Ret = BUFMNG_PutWriteBuffer(hHandle, &stElem);

                if (s32Ret != HI_SUCCESS)
                {
                    HI_ERR_VDEC("Buf %d put err!\n", hHandle);
                }
            }
            else
            {
                HI_INFO_VDEC("BUFMNG_GetWriteBuffer (extern size = %d,pu8KnlVirAddr = %p) failed\n", stElem.u32Size, stElem.pu8KnlVirAddr);
            }
        }
    }

    if (hVdec != HI_INVALID_HANDLE)
    {
        if (s_stVdecDrv.astChanEntity[hVdec].pstChan->bWakeUpVfmw == HI_TRUE)
        {
            s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(s_stVdecDrv.astChanEntity[hVdec].pstChan->hChan, VDEC_CID_EXTRA_WAKEUP_THREAD, HI_NULL, 0);
            s_stVdecDrv.astChanEntity[hVdec].pstChan->bWakeUpVfmw = HI_FALSE;
        }

        if (s_stVdecDrv.astChanEntity[hVdec].pstChan->stStatInfo.u32PutStreamTime == 0)
        {
            s_stVdecDrv.astChanEntity[hVdec].pstChan->stStatInfo.u32PutStreamTime = VDEC_GetTimeInMs();
        }
    }

    return HI_SUCCESS;
}

HI_S32 VDEC_GetEsFromDmx(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle, STREAM_DATA_S *pstPacket)
{
    HI_S32 s32Ret = HI_FAILURE;
    DMX_Stream_S vidEsBuf = {0};

    pstChan->stStatInfo.u32VdecAcqBufTry++;
    s32Ret = (s_stVdecDrv.pDmxFunc->pfnDmxAcquireEs)(pstChan->hDmxVidChn, &vidEsBuf);

    if (s32Ret != HI_SUCCESS)
    {
        if (s32Ret == HI_ERR_DMX_INVALID_PARA)
        {
            pstChan->hDmxVidChn = HI_INVALID_HANDLE;
        }

        return s32Ret;
    }

    pstPacket->PhyAddr = vidEsBuf.u32BufPhyAddr;
    pstPacket->VirAddr = (HI_U64)(HI_SIZE_T)(vidEsBuf.pu8BufVirAddr);
    pstPacket->Length = vidEsBuf.u32BufLen;
    pstPacket->Pts   = vidEsBuf.u32PtsMs;
    pstPacket->Index = vidEsBuf.u32Index;
    pstPacket->DispTime = (HI_U64)vidEsBuf.u32DispTime;
    pstPacket->DispEnableFlag = vidEsBuf.u32DispEnableFlag;
    pstPacket->DispFrameDistance = vidEsBuf.u32DispFrameDistance;
    pstPacket->DistanceBeforeFirstFrame = vidEsBuf.u32DistanceBeforeFirstFrame;
    pstPacket->GopNum = vidEsBuf.u32GopNum;
    pstPacket->is_not_last_packet_flag = 0;
    pstPacket->UserTag = 0;

    pstPacket->is_stream_end_flag = 0;
    pstPacket->is_extern_eop_flag = 0;

    if (0 == pstChan->u32ValidPtsFlag && -1 != vidEsBuf.u32PtsMs) /*get first valid pts*/
    {
        pstChan->bFirstValidPts = HI_TRUE;
        pstChan->u32FirstValidPts = vidEsBuf.u32PtsMs;
        pstChan->u32ValidPtsFlag = 1;
    }
    else if (1 == pstChan->u32ValidPtsFlag && -1 != vidEsBuf.u32PtsMs) /*get second valid pts*/
    {
        pstChan->bSecondValidPts = HI_TRUE;
        pstChan->u32SecondValidPts = vidEsBuf.u32PtsMs;
        pstChan->u32ValidPtsFlag = 2;
    }

    if (0 == pstChan->stStatInfo.u32TotalVdecInByte)
    {
        HI_DRV_STAT_Event(STAT_EVENT_STREAMIN, 0);
    }

    pstChan->stStatInfo.u32TotalVdecInByte   += pstPacket->Length;
    pstChan->stStatInfo.u32TotalVdecHoldByte += pstPacket->Length;
    pstChan->stStatInfo.u32VdecAcqBufOK++;

    return s32Ret;
}

HI_S32 VDEC_GetEsFromBM(VDEC_CHANNEL_S *pstChan,
                        HI_HANDLE hHandle,
                        STREAM_DATA_S *pstPacket,
                        HI_BOOL bUserSpace)
{
    HI_S32 s32Ret = HI_FAILURE;
    BUFMNG_BUF_S stEsBuf = {0};

    s32Ret = BUFMNG_AcqReadBuffer(pstChan->hStrmBuf, &stEsBuf);

    if (s32Ret != HI_SUCCESS)
    {
        return s32Ret;
    }

    pstPacket->PhyAddr = stEsBuf.u32PhyAddr;

    if (bUserSpace)
    {
        pstPacket->VirAddr = (HI_U64)(HI_SIZE_T)(stEsBuf.pu8UsrVirAddr);
    }
    else
    {
        pstPacket->VirAddr = (HI_U64)(HI_SIZE_T)(stEsBuf.pu8KnlVirAddr);
    }

    pstPacket->Length = stEsBuf.u32Size;
    pstPacket->Pts = stEsBuf.u64Pts;
    pstPacket->Index = stEsBuf.u32Index;
    pstPacket->is_not_last_packet_flag = stEsBuf.u32Marker & BUFMNG_NOT_END_FRAME_BIT;
    pstPacket->DVDualLayer = (stEsBuf.u32Marker & BUFMNG_DV_DL_BIT) ? 1 : 0;
    pstPacket->is_extern_eop_flag = (stEsBuf.u32Marker & BUFMNG_EXTERN_EOP_BIT) ? 1 : 0;
    pstPacket->UserTag = 0;
    pstPacket->is_stream_end_flag = (stEsBuf.u32Marker & BUFMNG_END_OF_STREAM_BIT) ? 1 : 0;

    if (0 == pstChan->u32ValidPtsFlag && -1 != (HI_U32)stEsBuf.u64Pts)
    {
        pstChan->bFirstValidPts = HI_TRUE;
        pstChan->u32FirstValidPts = (HI_U32)stEsBuf.u64Pts;
        pstChan->u32ValidPtsFlag = 1;
    }
    else if (1 == pstChan->u32ValidPtsFlag && -1 != (HI_U32)stEsBuf.u64Pts)
    {
        pstChan->bSecondValidPts = HI_TRUE;
        pstChan->u32SecondValidPts = (HI_U32)stEsBuf.u64Pts;
        pstChan->u32ValidPtsFlag = 2;
    }

    pstChan->stStatInfo.u32TotalVdecInByte   += pstPacket->Length;
    pstChan->stStatInfo.u32TotalVdecHoldByte += pstPacket->Length;

    return s32Ret;
}

static HI_S32 VDEC_GetIDRPacket(HI_HANDLE hHandle, STREAM_DATA_S *pstPacket, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_U32 u32PtsThd = 40;
    HI_U32 u32TargetPts;

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        s32Ret = HI_FAILURE;

        return s32Ret;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    u32TargetPts = (pstChan->IDRPts > u32PtsThd) ? (pstChan->IDRPts - u32PtsThd) : pstChan->IDRPts;

    if ((pstPacket->Pts >= (HI_U64)u32TargetPts) && (pstPacket->Pts != (HI_U64)0xffffffff))
    {
        return HI_SUCCESS;
    }
    else
    {
        VDEC_RlsStrmBuf(hHandle, pstPacket, bUserSpace);
        return HI_FAILURE;
    }
}

static HI_S32 VDEC_RecvStrmBuf(HI_HANDLE hHandle, STREAM_DATA_S *pstPacket, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    BUFMNG_BUF_S stEsBuf;

    memset(&stEsBuf, 0, sizeof(BUFMNG_BUF_S));
    VDEC_ASSERT_RETURN(pstPacket != HI_NULL, HI_FAILURE);

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);
    VDEC_ASSERT_RETURN(s32Ret == HI_SUCCESS, HI_FAILURE);

    /* Check and get pstChan pointer */
    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        s32Ret = HI_FAILURE;
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return s32Ret;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan->hDmxVidChn == HI_INVALID_HANDLE && s_stVdecDrv.astChanEntity[hHandle].DmxHdlCallBack)
    {
        s_stVdecDrv.astChanEntity[hHandle].DmxHdlCallBack(pstChan->u32DmxID, 2, &(pstChan->hDmxVidChn));
    }

    /* Get ES data from demux directly */
    if ((pstChan->hDmxVidChn != HI_INVALID_HANDLE) && s_stVdecDrv.pDmxFunc && s_stVdecDrv.pDmxFunc->pfnDmxAcquireEs)
    {
        s32Ret = VDEC_GetEsFromDmx(pstChan, hHandle, pstPacket);

        if (s32Ret != HI_SUCCESS)
        {
            goto OUT;
        }
    }
    else if ((pstChan->OmxTunnelMode) && (pstChan->hOmxChn != HI_INVALID_HANDLE)
             && (s_stVdecDrv.pOmxFunc) && (s_stVdecDrv.pOmxFunc->pfnOmxAcquireStream))
    {
        pstChan->stStatInfo.u32VdecAcqBufTry++;

        s32Ret = (s_stVdecDrv.pOmxFunc->pfnOmxAcquireStream)(pstChan->hOmxChn, (HI_VOID *)pstPacket);

        if (HI_SUCCESS != s32Ret)
        {
            goto OUT;
        }

        pstChan->stStatInfo.u32TotalVdecInByte   += pstPacket->Length;
        pstChan->stStatInfo.u32TotalVdecHoldByte += pstPacket->Length;
        pstChan->stStatInfo.u32VdecAcqBufOK++;
    }
    /* Get ES data from BM */
    else
    {
        s32Ret = VDEC_GetEsFromBM(pstChan, hHandle, pstPacket, bUserSpace);

        if (s32Ret != HI_SUCCESS)
        {
            goto OUT;
        }
    }

    if (pstChan->bSetIDRPtsMode == HI_TRUE)
    {
        s32Ret = VDEC_GetIDRPacket(hHandle, pstPacket, bUserSpace);

        if (s32Ret == HI_SUCCESS)
        {
            pstChan->bSetIDRPtsMode = HI_FALSE;
        }
    }

    if ((s32Ret == HI_SUCCESS) && (pstChan->stStatInfo.u32DecoderReadStreamTime == 0))
    {
        pstChan->stStatInfo.u32DecoderReadStreamTime = VDEC_GetTimeInMs();

        // demux or tunnel path do not put stream,so set the time same with read stream
        if (pstChan->stStatInfo.u32PutStreamTime == 0)
        {
            pstChan->stStatInfo.u32PutStreamTime = pstChan->stStatInfo.u32DecoderReadStreamTime;
        }
    }

OUT:

    /* Added for set eos flag */
    /* Must be end of stream */
    if ((pstChan->bSetEosFlag)
        && (((pstChan->hStrmBuf != HI_INVALID_HANDLE) && (HI_SUCCESS != s32Ret))
            || ((pstChan->hDmxVidChn != HI_INVALID_HANDLE) && (HI_ERR_DMX_EMPTY_BUFFER == s32Ret)))
        && (pstChan->OmxTunnelMode != 1))
    {
        pstPacket->PhyAddr = pstChan->stEOSBuffer.u32StartPhyAddr;
        pstPacket->VirAddr = (HI_U64)(HI_SIZE_T)(pstChan->stEOSBuffer.pu8StartVirAddr);
        pstPacket->Length = pstChan->stEOSBuffer.u32Size;
        pstPacket->Pts = HI_INVALID_PTS;
        pstPacket->Index = 0;
        pstPacket->UserTag = 0;
        pstPacket->is_not_last_packet_flag = 0;
        pstPacket->is_stream_end_flag = 1;
        pstChan->bSetEosFlag = HI_FALSE;
        s32Ret = HI_SUCCESS;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return s32Ret;
}

static HI_S32 VDEC_RlsStrmBuf(HI_HANDLE hHandle, STREAM_DATA_S *pstPacket, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    BUFMNG_BUF_S stBuf;

    if (HI_NULL == pstPacket)
    {
        HI_INFO_VDEC("INFO: %d pstPacket == HI_NULL!\n", hHandle);
        return HI_FAILURE;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Release EOS MMZ buffer */
    if (pstPacket->PhyAddr == pstChan->stEOSBuffer.u32StartPhyAddr)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_SUCCESS;
    }

    /* Put ES buffer of demux */
    if ((pstChan->hDmxVidChn != HI_INVALID_HANDLE) && s_stVdecDrv.pDmxFunc && s_stVdecDrv.pDmxFunc->pfnDmxReleaseEs)
    {
        DMX_Stream_S vidEsBuf;

        pstChan->stStatInfo.u32VdecRlsBufTry++;
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

        vidEsBuf.u32BufPhyAddr = pstPacket->PhyAddr;
        vidEsBuf.pu8BufVirAddr = (HI_U8 *)(HI_SIZE_T)(pstPacket->VirAddr);
        vidEsBuf.u32BufLen = pstPacket->Length;
        vidEsBuf.u32PtsMs = pstPacket->Pts;
        vidEsBuf.u32Index = pstPacket->Index;

        s32Ret = (s_stVdecDrv.pDmxFunc->pfnDmxReleaseEs)(pstChan->hDmxVidChn, &vidEsBuf);

        if (HI_SUCCESS != s32Ret)
        {
            HI_WARN_VDEC("VDEC ReleaseBuf(%#x) to Dmx err:%#x.\n", pstPacket->PhyAddr, s32Ret);
        }
        else
        {
            pstChan->stStatInfo.u32TotalVdecHoldByte -= vidEsBuf.u32BufLen;
            pstChan->stStatInfo.u32VdecRlsBufOK++;
        }

        return s32Ret;
    }
    else if ((pstChan->OmxTunnelMode) && (pstChan->hOmxChn != HI_INVALID_HANDLE) && \
             (s_stVdecDrv.pOmxFunc) && (s_stVdecDrv.pOmxFunc->pfnOmxReleaseStream))
    {
        pstChan->stStatInfo.u32VdecRlsBufTry++;

        s32Ret = (s_stVdecDrv.pOmxFunc->pfnOmxReleaseStream)(pstChan->hOmxChn, (HI_VOID *)pstPacket);

        if (HI_SUCCESS != s32Ret)
        {
            HI_WARN_VDEC("VDEC ReleaseBuf(%#x) to Dmx err:%#x.\n", pstPacket->PhyAddr, s32Ret);
        }
        else
        {
            pstChan->stStatInfo.u32TotalVdecHoldByte -= pstPacket->Length;
            pstChan->stStatInfo.u32VdecRlsBufOK++;
        }

        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return s32Ret;

    }
    /* Put BM buffer */
    else
    {
        stBuf.u32PhyAddr = 0;

        if (bUserSpace)
        {
            stBuf.pu8UsrVirAddr = (HI_U8 *)(HI_SIZE_T)(pstPacket->VirAddr);
            stBuf.pu8KnlVirAddr = HI_NULL;
        }
        else
        {
            stBuf.pu8KnlVirAddr = (HI_U8 *)(HI_SIZE_T)(pstPacket->VirAddr);
            stBuf.pu8UsrVirAddr = HI_NULL;
        }

        stBuf.u32Size  = pstPacket->Length;
        stBuf.u32Index = pstPacket->Index;
        stBuf.u64Pts = pstPacket->Pts;
        /* Don't care stBuf.u32Marker here. */

        /* Put */
        s32Ret = BUFMNG_RlsReadBuffer(pstChan->hStrmBuf, &stBuf);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }

        pstChan->stStatInfo.u32TotalVdecHoldByte -= stBuf.u32Size;
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_QueryDeiMemSize(HI_HANDLE hHandle, VFMW_DEI_MEM_INFO_S *pDeiMemInfo)
{
    HI_S32 s32Ret;
    HI_DRV_DEI_MEM_INFO_S DeiMemInfo;

    VDEC_ASSERT_RETURN((pDeiMemInfo != HI_NULL), HI_FAILURE);

    memset(&DeiMemInfo, 0, sizeof(HI_DRV_DEI_MEM_INFO_S));

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);
    VDEC_ASSERT_RETURN(s32Ret == HI_SUCCESS, HI_FAILURE);

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    if (!s_stVdecDrv.pVoFunc || !s_stVdecDrv.pVoFunc->pfnWinGetAlgMemSize)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    DeiMemInfo.u32Width = pDeiMemInfo->Width;
    DeiMemInfo.u32Height = pDeiMemInfo->Height;
    DeiMemInfo.u32BitDepth = pDeiMemInfo->BitDepth;

    s32Ret = s_stVdecDrv.pVoFunc->pfnWinGetAlgMemSize(hHandle, &DeiMemInfo);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Chan %d: Call pfnWinGetDeiMemSize failed\n", hHandle);
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    pDeiMemInfo->DeiMemSize = DeiMemInfo.u32DeiMemSize;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return s32Ret;
}


static HI_S32 VDEC_Chan_RecvStrmBuf(HI_S32 hHandle, HI_VOID *pStreamPacket)
{
    STREAM_DATA_S *pstPacket = (STREAM_DATA_S *)(pStreamPacket);
    hHandle = hHandle & 0xff;

    if (hHandle < 0 || hHandle >= HI_VDEC_MAX_INSTANCE_NEW || pstPacket == HI_NULL)
    {
        HI_ERR_VDEC("Param is invalid\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    return VDEC_RecvStrmBuf((HI_HANDLE)hHandle, pstPacket, HI_FALSE);
}

static HI_S32 VDEC_Chan_RlsStrmBuf(HI_S32 hHandle, HI_VOID *pStreamPacket)
{
    STREAM_DATA_S *pstPacket = (STREAM_DATA_S *)(pStreamPacket);
    hHandle = hHandle & 0xff;

    if (hHandle < 0 || hHandle >= HI_VDEC_MAX_INSTANCE_NEW || pstPacket == HI_NULL)
    {
        HI_ERR_VDEC("Param is invalid\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    return VDEC_RlsStrmBuf((HI_HANDLE)hHandle, pstPacket, HI_FALSE);
}

static HI_S32 VDEC_Chan_QueryDeiMem(HI_S32 hHandle, HI_VOID *pMem)
{
    VFMW_DEI_MEM_INFO_S *pstMem = (VFMW_DEI_MEM_INFO_S *)(pMem);
    hHandle = hHandle & 0xff;

    if (hHandle < 0 || hHandle >= HI_VDEC_MAX_INSTANCE_NEW || pstMem == HI_NULL)
    {
        HI_ERR_VDEC("Param is invalid\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    return VDEC_QueryDeiMemSize(hHandle, pstMem);
}

static HI_S32 VDEC_ConvertFrame2Image(HI_DRV_VIDEO_FRAME_S *pFrame, IMAGE *pImage)
{
    HI_DRV_VIDEO_PRIVATE_S *pVideoPriv = NULL;
    HI_VDEC_PRIV_FRAMEINFO_S *pFramePriv = NULL;

    if (pFrame == HI_NULL)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    pVideoPriv = (HI_DRV_VIDEO_PRIVATE_S *)(pFrame->u32Priv);
    pFramePriv = (HI_VDEC_PRIV_FRAMEINFO_S *)(pVideoPriv->u32Reserve);

    memset(pImage, 0, sizeof(IMAGE));
    pImage->image_height = pFrame->u32Height;
    pImage->image_width  = pFrame->u32Width;
    pImage->image_id = pFramePriv->image_id;
    pImage->image_id_1 = pFramePriv->image_id_1;
    pImage->stDispInfo.luma_phy_addr = pFrame->stBufAddr[0].u32PhyAddr_Y - pFrame->stBufAddr[0].u32Head_Size;
    pImage->stHDRInput.HDR_Metadata_phy_addr = pVideoPriv->HdrPhyAddr;

    pImage->stDecInfo.back_tunnel_line_num_phy_addr = pFrame->BackTunnelPhyAddr;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_VORlsFrame(HI_HANDLE hVdec, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    IMAGE *pImage = HI_NULL;

    if ((HI_INVALID_HANDLE == hVdec) || (HI_NULL == pstFrame))
    {
        goto error;
    }

    hVdec = hVdec & 0xff;

    pstChan = VDEC_DRV_GetChan(hVdec);

    if (HI_NULL != pstChan)
    {
        pstChan->stStatInfo.u32AvplayRlsFrameTry++;
    }
    else
    {
        HI_INFO_VDEC("VDEC_Chan_VORlsFrame call VDEC_DRV_GetChan ERROR!\n");
        goto error;
    }

    s32Ret = HI_DRV_VDEC_RlsFrmBuf(hVdec, pstFrame);

    if (HI_SUCCESS == s32Ret)
    {
        pstChan->stStatInfo.u32AvplayRlsFrameOK++;
        return s32Ret;
    }

error:
    if (pstFrame != HI_NULL)
    {
        pImage = HI_KMALLOC_ATOMIC_VDEC(sizeof(IMAGE));

        if (!pImage)
        {
            HI_ERR_VDEC("Vmalloc IMAGE failed\n");
            return HI_FAILURE;
        }

        s32Ret = VDEC_ConvertFrame2Image(pstFrame, pImage);
        if (s32Ret != HI_SUCCESS)
        {
            HI_KFREE_VDEC(pImage);
            return HI_ERR_VDEC_INVALID_PARA;
        }

        s32Ret = s_stVdecDrv.pVfmwFunc->pfnVfmwGlobalReleaseImage(pImage);

        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Global release frame failed, image.stDispInfo.luma_phy_addr = 0x%x\n", pImage->stDispInfo.luma_phy_addr);
        }

        HI_KFREE_VDEC(pImage);

        return s32Ret;
    }

    HI_ERR_VDEC("VDEC_Chan_VORlsFrame failed\n");

    return HI_FAILURE;
}

HI_S32 HI_VDEC_Chan_VORlsFrame(HI_HANDLE hVdec, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 s32Ret;

    if (!pstFrame)
    {
        HI_ERR_VDEC("invalid param !\n");
        return HI_FAILURE;
    }

    s32Ret = VDEC_Chan_VORlsFrame(hVdec, pstFrame);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("VDEC_Chan_VORlsFrame err ! Phyaddr = 0x%x\n", pstFrame->stBufAddr[0].u32PhyAddr_YHead);
        return HI_FAILURE;
    }

    return s32Ret;
}

static HI_S32 VDEC_Chan_GetLeftStreamFrm(HI_HANDLE hHandle, HI_U32 *pLeftFrm)
{
    HI_S32 s32Ret = HI_SUCCESS;
    BUFMNG_STATUS_S stStatus;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_INVALID_HANDLE != pstChan->hStrmBuf)
    {
        s32Ret = BUFMNG_GetStatus(pstChan->hStrmBuf, &stStatus);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            HI_ERR_VDEC("Chan %d get strm buf status err!\n", hHandle);
            return HI_FAILURE;
        }

        *pLeftFrm = (stStatus.u32PutOK > pstChan->stStatInfo.u32TotalVfmwOutFrame)
                    ? (stStatus.u32PutOK - pstChan->stStatInfo.u32TotalVfmwOutFrame) : 0;
    }
    else
    {
        *pLeftFrm = 0;
        HI_ERR_VDEC("Chan %d strm buf handle = NULL!\n", hHandle);
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

static HI_UNF_VIDEO_FRAME_PACKING_TYPE_E VDEC_ConverFrameType(HI_DRV_FRAME_TYPE_E  eFrmType)
{
    switch (eFrmType)
    {
        case HI_DRV_FT_NOT_STEREO:
            return HI_UNF_FRAME_PACKING_TYPE_NONE;

        case HI_DRV_FT_SBS:
            return HI_UNF_FRAME_PACKING_TYPE_SIDE_BY_SIDE;

        case HI_DRV_FT_TAB:
            return HI_UNF_FRAME_PACKING_TYPE_TOP_AND_BOTTOM;

        case HI_DRV_FT_FPK:
            return HI_UNF_FRAME_PACKING_TYPE_FRAME_PACKING;

        case HI_DRV_FT_TILE:
            return HI_UNF_FRAME_PACKING_TYPE_3D_TILE;

        default:
            return HI_UNF_FRAME_PACKING_TYPE_BUTT;
    }
}

HI_S32 HI_DRV_VDEC_GetVideoFrameInfo(HI_HANDLE hVdec, HI_UNF_AVPLAY_VIDEO_FRAME_INFO_S *pstVideoFrameInfo)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    hVdec = hVdec & 0xff;

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hVdec].pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hVdec);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pstVideoFrameInfo->u32Width           = pstChan->stLastFrm.u32Width;
    pstVideoFrameInfo->u32Height          = pstChan->stLastFrm.u32Height;
    pstVideoFrameInfo->u32AspectWidth     = pstChan->stLastFrm.u32AspectWidth;
    pstVideoFrameInfo->u32AspectHeight    = pstChan->stLastFrm.u32AspectHeight;
//    pstVideoFrameInfo->u32fpsInteger      = pstChan->stLastVpssFrm.u32FrameRate / 1000;
    pstVideoFrameInfo->u32fpsInteger      = pstChan->stLastFrm.u32FrameRate / 1000;
    pstVideoFrameInfo->u32fpsDecimal      = 0;
//    pstVideoFrameInfo->bProgressive       = pstChan->stLastVpssFrm.bProgressive;
//    pstVideoFrameInfo->enFramePackingType = VDEC_ConverFrameType(pstChan->stLastVpssFrm.eFrmType);

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_SendEos(HI_HANDLE hVdec)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    hVdec = hVdec & 0xff;

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("%s %d hVdec:%d\n", __func__, __LINE__, hVdec);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hVdec]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("Chan %d lock fail!\n", hVdec);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hVdec].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);
        HI_WARN_VDEC("Chan %d not init!\n", hVdec);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    ((HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstChan->stLastFrm.u32Priv))->u32Reserve))->u8EndFrame = 1;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_GetFrmStatusInfo(HI_HANDLE hVdec, HI_HANDLE hPort, VDEC_FRMSTATUSINFO_S *pstVdecFrmStatusInfo)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_STATE_S stChanState;

    /* check input parameters */
    if (HI_NULL == pstVdecFrmStatusInfo)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    memset(&stChanState, 0, sizeof(VDEC_CHAN_STATE_S));

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hVdec]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hVdec);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hVdec].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);
        HI_ERR_VDEC("Chan %d not init!\n", hVdec);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_CHAN_STATE, &stChanState, sizeof(stChanState));

    if (VDEC_OK != s32Ret)
    {
        HI_FATAL_VDEC("hVdec = %d , vfmw Chan %d GET_CHAN_STATE err\n", hVdec, pstChan->hChan);
    }
    else
    {
        pstVdecFrmStatusInfo->u32DecodedFrmNum = stChanState.decoded_1d_frame_num + stChanState.wait_disp_frame_num;
        pstVdecFrmStatusInfo->u32StrmSize = stChanState.buffered_stream_size;//u32StrmSize;
        pstVdecFrmStatusInfo->u32FrameStoreNum = stChanState.total_disp_frame_num;
    }

    /*copy from VDEC_Chan_GetStatusInfo*/
    pstVdecFrmStatusInfo->u32StrmInBps = pstChan->stStatInfo.u32AvrgVdecInBps;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);

    return s32Ret;
}

HI_S32 HI_DRV_VDEC_GetEsBuf(HI_HANDLE hHandle, VDEC_ES_BUF_S *pstEsBuf)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_ES_BUF_PRI_S stEsBufPri = {0};

    VDEC_ASSERT_RETURN(pstEsBuf != HI_NULL, HI_FAILURE);
    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Get */
    memset(&stEsBufPri, 0, sizeof(stEsBufPri));
    stEsBufPri.u32BufSize = pstEsBuf->u32BufSize;
    s32Ret = VDEC_GetStrmBuf(pstChan->hStrmBuf, &stEsBufPri, HI_FALSE);

    if (HI_SUCCESS != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return s32Ret;
    }

    pstEsBuf->pu8Addr          = (HI_U8 *)(HI_SIZE_T)stEsBufPri.u64Addr;
    pstEsBuf->u32PhyAddr       = stEsBufPri.u32PhyAddr;
    pstEsBuf->u32BufSize       = stEsBufPri.u32BufSize;
    pstEsBuf->u64Pts           = stEsBufPri.u64Pts;
    pstEsBuf->bEndOfFrame      = stEsBufPri.bEndOfFrame;
    pstEsBuf->bDiscontinuous   = stEsBufPri.bDiscontinuous;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_PutEsBuf(HI_HANDLE hHandle, VDEC_ES_BUF_S *pstEsBuf)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_ES_BUF_PRI_S stEsBufPri;

    if (HI_NULL == pstEsBuf)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    stEsBufPri.u64Addr         = (HI_U64)(HI_SIZE_T)pstEsBuf->pu8Addr;
    stEsBufPri.u32PhyAddr      = pstEsBuf->u32PhyAddr;
    stEsBufPri.u32BufSize      = pstEsBuf->u32BufSize;
    stEsBufPri.u64Pts          = pstEsBuf->u64Pts;
    stEsBufPri.bEndOfFrame     = pstEsBuf->bEndOfFrame;
    stEsBufPri.bDiscontinuous  = pstEsBuf->bDiscontinuous;
    s32Ret = VDEC_PutStrmBuf(pstChan->hStrmBuf, &stEsBufPri, HI_FALSE);

    if (HI_SUCCESS != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return s32Ret;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

VOID VDEC_GetColorSpaceType(IMAGE *pstImage, HI_DRV_COLOR_SPACE_E *pColorSpace)
{
    HI_U8 ColourPrimaries = 0;
    HI_U8 MatrixCoeffs = 0;
    HI_U8 FullRangeFlag = 0;

    if (pstImage == HI_NULL || pColorSpace == HI_NULL)
    {
        return;
    }

    ColourPrimaries = pstImage->stHDRInput.ColourInfo.ColourPrimaries;
    MatrixCoeffs = pstImage->stHDRInput.ColourInfo.MatrixCoeffs;
    FullRangeFlag = pstImage->stHDRInput.ColourInfo.FullRangeFlag;

    switch (ColourPrimaries)
    {
        case 1:
            if (MatrixCoeffs == 1)
            {
                * pColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT709_YUV_FULL : HI_DRV_CS_BT709_YUV_LIMITED;
            }

            break;

        case 5:
            if (MatrixCoeffs == 5)
            {
                * pColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT601_YUV_FULL : HI_DRV_CS_BT601_YUV_LIMITED;
            }

            break;

        case 9:
            if (MatrixCoeffs == 9)
            {
                * pColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            }
            else if (MatrixCoeffs == 10)
            {
                * pColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            }

            break;

        default:
            break;
    }

    return;
}

VOID VDEC_GetColorSpace_DEFUALT(IMAGE *pstImage, HI_DRV_COLOR_SPACE_E *pColorSpace)
{
    if (* pColorSpace == HI_DRV_CS_UNKNOWN)
    {
        if (pstImage->image_width >= 1280 || pstImage->image_height >= 720)
        {
            * pColorSpace  = HI_DRV_CS_BT709_YUV_LIMITED;
        }
        else
        {
            * pColorSpace  = HI_DRV_CS_BT601_YUV_LIMITED;
        }
    }

    return;
}

HI_DRV_COLOR_SPACE_E VDEC_GetColorSpace(HI_UNF_VCODEC_TYPE_E enType, IMAGE *pstImage)
{
    HI_DRV_COLOR_SPACE_E ColorSpace = HI_DRV_CS_UNKNOWN;

    switch (enType)
    {
        case HI_UNF_VCODEC_TYPE_HEVC:
        case HI_UNF_VCODEC_TYPE_H264:
            VDEC_GetColorSpaceType(pstImage, &ColorSpace);

            break;

        default:

            break;
    }

    VDEC_GetColorSpace_DEFUALT(pstImage, &ColorSpace);

    return ColorSpace;
}

static const HI_U32 g_TypeMjpg_Table[][2] =
{
    {SPYCbCr400,          HI_DRV_PIX_FMT_NV08},
    {SPYCbCr411,          HI_DRV_PIX_FMT_NV12_411},
    {SPYCbCr422_1X2,      HI_DRV_PIX_FMT_NV16},
    {SPYCbCr422_2X1,      HI_DRV_PIX_FMT_NV61_2X1},
    {SPYCbCr444,          HI_DRV_PIX_FMT_NV24},
    {PLNYCbCr400,         HI_DRV_PIX_FMT_YUV400},
    {PLNYCbCr411,         HI_DRV_PIX_FMT_YUV411},
    {PLNYCbCr420,         HI_DRV_PIX_FMT_YUV420p},
    {PLNYCbCr422_1X2,     HI_DRV_PIX_FMT_YUV422_1X2},
    {PLNYCbCr422_2X1,     HI_DRV_PIX_FMT_YUV422_2X1},
    {PLNYCbCr444,         HI_DRV_PIX_FMT_YUV_444},
    {PLNYCbCr410,         HI_DRV_PIX_FMT_YUV410p},
    {SPYCbCr420,          HI_DRV_PIX_FMT_NV21},

    {YCbCrBUTT,           HI_DRV_PIX_BUTT}, //terminal element n
};

HI_U32 TypeMjpgConvert(HI_U32 Code)
{
    HI_U32 Index = 0;
    HI_U32 ConvertedCode = HI_DRV_PIX_FMT_NV21;

    while (1)
    {
        if (g_TypeMjpg_Table[Index][0] == YCbCrBUTT || g_TypeMjpg_Table[Index][1] == HI_DRV_PIX_BUTT)
        {
            break;
        }

        if (Code == g_TypeMjpg_Table[Index][0])
        {
            ConvertedCode = g_TypeMjpg_Table[Index][1];
            break;
        }

        Index++;
    }

    return ConvertedCode;
}

static HI_VOID ConvertFrm_GetPixFormat(HI_UNF_VCODEC_TYPE_E enType,
                                       IMAGE *pstImage,
                                       HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (enType == HI_UNF_VCODEC_TYPE_MJPEG)
    {
        pstFrame->ePixFormat = TypeMjpgConvert(pstImage->yuvFormat);
    }
    else
    {
        switch (pstImage->format.linear_en)
        {
            case 0:
                if (pstImage->CompressEn)
                {
                    pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV21_TILE_CMP;
                }
                else
                {
                    pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV21_TILE;
                }

                break;

            case 1:
                if (pstImage->CompressEn)
                {
                    pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV21_CMP;
                }
                else
                {
                    pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV21;
                }

                break;

            default:
                pstFrame->ePixFormat = HI_DRV_PIX_FMT_NV21_TILE_CMP;
                break;
        }
    }

    return;
}

static HI_VOID ConvertFrm_GetDisplayNorm(VDEC_CHANNEL_S *pstChan, IMAGE *pstImage)
{
    switch (pstImage->format.video_format)
    {
        case 0x1:
            pstChan->enDisplayNorm = HI_UNF_ENC_FMT_PAL;
            break;

        case 0x2:
            pstChan->enDisplayNorm = HI_UNF_ENC_FMT_NTSC;
            break;

        default:
            pstChan->enDisplayNorm = HI_UNF_ENC_FMT_BUTT;
            break;
    }

    return;
}

static HI_VOID ConvertFrm_GetProgressiveInfo(VDEC_CHANNEL_S *pstChan,
        IMAGE *pstImage,
        HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    switch (pstImage->format.source_format)
    {
        case 0: /* PROGRESSIVE */
            pstFrame->bProgressive = HI_TRUE;
            pstChan->stStatInfo.u32FrameType[1]++;
            break;

        case 1: /* INTERLACE */
        case 2: /* INFERED_PROGRESSIVE */
        case 3: /* INFERED_INTERLACE */
        default:
            pstFrame->bProgressive = HI_FALSE;
            pstChan->stStatInfo.u32FrameType[0]++;
            break;
    }

    return;
}

static HI_VOID ConvertFrm_GetSampleType(HI_DRV_VIDEO_PRIVATE_S *pstVideoPriv,
                                        IMAGE *pstImage)
{
    switch (pstImage->format.source_format)
    {
        case 0: /* PROGRESSIVE */
            pstVideoPriv->eSampleType = HI_DRV_SAMPLE_TYPE_PROGRESSIVE;
            break;

        case 1: /* INTERLACE */
            pstVideoPriv->eSampleType = HI_DRV_SAMPLE_TYPE_INTERLACE;
            break;

        case 2: /* INFERED_PROGRESSIVE */
        case 3: /* INFERED_INTERLACE */
        default:
            pstVideoPriv->eSampleType = HI_DRV_SAMPLE_TYPE_UNKNOWN;

            break;
    }

    return;
}

static HI_VOID ConvertFrm_GetFieldMode(IMAGE *pstImage,
                                       HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    switch (pstImage->format.field_valid_flag)
    {
        case 1:
            pstFrame->enFieldMode = HI_DRV_FIELD_TOP;
            break;

        case 2:
            pstFrame->enFieldMode = HI_DRV_FIELD_BOTTOM;
            break;

        case 3:
            pstFrame->enFieldMode = HI_DRV_FIELD_ALL;
            break;

        default:
            pstFrame->enFieldMode = HI_DRV_FIELD_BUTT;
            break;
    }

    return;
}

static HI_VOID ConvertFrm_GetBitWidth(HI_UNF_VCODEC_TYPE_E enType, IMAGE *pstImage, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (pstImage->bit_depth > 8)
    {
        pstFrame->enBitWidth = HI_DRV_PIXEL_BITWIDTH_10BIT;
    }
    else
    {
        pstFrame->enBitWidth = HI_DRV_PIXEL_BITWIDTH_8BIT;
    }
}

static HI_VOID ConvertFrm_GetBufAddr(HI_UNF_VCODEC_TYPE_E enType, IMAGE *pstImage, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (enType == HI_UNF_VCODEC_TYPE_MJPEG)
    {
        pstFrame->stBufAddr[0].u32PhyAddr_Y      = pstImage->stDispInfo.luma_phy_addr;
        pstFrame->stBufAddr[0].u32Stride_Y       = pstImage->stDispInfo.y_stride;
        pstFrame->stBufAddr[0].u32PhyAddr_C      = pstImage->stDispInfo.chrom_phy_addr;
        pstFrame->stBufAddr[0].u32Stride_C       = pstFrame->stBufAddr[0].u32Stride_Y;
    }
    else
    {
        if (pstImage->CompressEn == 0)
        {
            pstFrame->stBufAddr[0].u32PhyAddr_YHead = pstImage->stDispInfo.luma_phy_addr;
            pstFrame->stBufAddr[0].u32PhyAddr_Y = pstImage->stDispInfo.luma_phy_addr;
            pstFrame->stBufAddr[0].u32Stride_Y  = pstImage->stDispInfo.y_stride / 16;
            pstFrame->stBufAddr[0].u32PhyAddr_CHead = pstImage->stDispInfo.chrom_phy_addr;
            pstFrame->stBufAddr[0].u32PhyAddr_C = pstImage->stDispInfo.chrom_phy_addr;
            pstFrame->stBufAddr[0].u32Stride_C  = pstFrame->stBufAddr[0].u32Stride_Y;

            if (pstFrame->enBitWidth == HI_DRV_PIXEL_BITWIDTH_10BIT)
            {
                pstFrame->stBufAddr_LB[0].u32PhyAddr_Y = pstImage->stDispInfo.luma_phy_addr_2bit;
                pstFrame->stBufAddr_LB[0].u32Stride_Y  = pstImage->stDispInfo.stride_2bit / 32;
                pstFrame->stBufAddr_LB[0].u32PhyAddr_C = pstImage->stDispInfo.chrom_phy_addr_2bit;
                pstFrame->stBufAddr_LB[0].u32Stride_C  = pstImage->stDispInfo.stride_2bit / 32;
            }

            pstFrame->stBufAddr[0].u32Head_Stride = 0;
            pstFrame->stBufAddr[0].u32Head_Size   = 0;
        }
        else
        {
            pstFrame->stBufAddr[0].u32PhyAddr_YHead = pstImage->stDispInfo.luma_phy_addr;
            pstFrame->stBufAddr[0].u32PhyAddr_Y     = pstImage->stDispInfo.luma_phy_addr + pstImage->stDispInfo.head_info_size;
            pstFrame->stBufAddr[0].u32Stride_Y      = pstImage->stDispInfo.y_stride / 16;
            pstFrame->stBufAddr[0].u32PhyAddr_CHead = pstImage->stDispInfo.chrom_phy_addr;
            pstFrame->stBufAddr[0].u32PhyAddr_C     = pstImage->stDispInfo.chrom_phy_addr + (pstImage->stDispInfo.head_info_size / 2);
            pstFrame->stBufAddr[0].u32Stride_C      = pstFrame->stBufAddr[0].u32Stride_Y;

            if (pstFrame->enBitWidth == HI_DRV_PIXEL_BITWIDTH_10BIT)
            {
                pstFrame->stBufAddr_LB[0].u32PhyAddr_Y = pstImage->stDispInfo.luma_phy_addr_2bit;
                pstFrame->stBufAddr_LB[0].u32Stride_Y  = pstImage->stDispInfo.stride_2bit / 32;
                pstFrame->stBufAddr_LB[0].u32PhyAddr_C = pstImage->stDispInfo.chrom_phy_addr_2bit;
                pstFrame->stBufAddr_LB[0].u32Stride_C  = pstImage->stDispInfo.stride_2bit / 32;
            }

            pstFrame->stBufAddr[0].u32Head_Stride = pstImage->stDispInfo.head_stride;
            pstFrame->stBufAddr[0].u32Head_Size   = pstImage->stDispInfo.head_info_size;
        }
    }

    if (pstImage->is_3D)
    {
        pstFrame->stBufAddr[1].u32PhyAddr_YHead = pstImage->stDispInfo.luma_phy_addr_1;
        pstFrame->stBufAddr[1].u32Stride_Y      = pstImage->stDispInfo.y_stride / 16;

        pstFrame->stBufAddr[1].u32PhyAddr_CHead = pstImage->stDispInfo.chrom_phy_addr_1;
        pstFrame->stBufAddr[1].u32Stride_C      = pstFrame->stBufAddr[1].u32Stride_Y;

        if (pstImage->CompressEn == 0)
        {
            pstFrame->stBufAddr[1].u32PhyAddr_Y = pstImage->stDispInfo.luma_phy_addr_1;
            pstFrame->stBufAddr[1].u32PhyAddr_C = pstImage->stDispInfo.chrom_phy_addr_1;
        }
        else
        {
            pstFrame->stBufAddr[1].u32PhyAddr_Y = pstImage->stDispInfo.luma_phy_addr_1 + (pstImage->image_height + 31) / 32 * 32 * 16;
            pstFrame->stBufAddr[1].u32PhyAddr_C = pstImage->stDispInfo.chrom_phy_addr_1 + (pstImage->image_height + 31) / 32 * 32 * 8;
        }
    }

    return;
}

static HI_VOID ConvertFrm_GetVP6ExtAttr(HI_UNF_VCODEC_TYPE_E enType,
                                        VDEC_CHANNEL_S *pstChan,
                                        HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if ((enType == HI_UNF_VCODEC_TYPE_VP6)
        || (enType == HI_UNF_VCODEC_TYPE_VP6F)
        || (enType == HI_UNF_VCODEC_TYPE_VP6A))
    {
        if (HI_UNF_VCODEC_TYPE_VP6A == enType)
        {
            pstFrame->u32Circumrotate = pstChan->stCurCfg.unExtAttr.stVP6Attr.bReversed & 0x1;
        }
        else
        {
            pstFrame->u32Circumrotate = !(pstChan->stCurCfg.unExtAttr.stVP6Attr.bReversed & 0x1);
        }

        if ((pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispWidth != 0)
            && (pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispHeight != 0))
        {
            pstFrame->u32Width = pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispWidth;
            pstFrame->u32Height = pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispHeight;
            pstFrame->stDispRect.s32Width = pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispWidth;
            pstFrame->stDispRect.s32Height = pstChan->stCurCfg.unExtAttr.stVP6Attr.u16DispHeight;
        }
    }
    else
    {
        pstFrame->u32Circumrotate = 0;
    }

    return;
}

static HI_VOID ConvertFrm_GetFrmType(HI_UNF_VCODEC_TYPE_E enType,
                                     IMAGE *pstImage,
                                     HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (enType == HI_UNF_VCODEC_TYPE_MVC)
    {
        switch (pstImage->eFramePackingType)
        {
            case FRAME_PACKING_TYPE_NONE:
                pstFrame->eFrmType = HI_DRV_FT_NOT_STEREO;
                break;

            case FRAME_PACKING_TYPE_SIDE_BY_SIDE:
                pstFrame->eFrmType = HI_DRV_FT_SBS;
                break;

            case FRAME_PACKING_TYPE_TOP_BOTTOM:
                pstFrame->eFrmType = HI_DRV_FT_TAB;
                break;

            case FRAME_PACKING_TYPE_TIME_INTERLACED:
                pstFrame->eFrmType = HI_DRV_FT_FPK;
                break;

            default:
                pstFrame->eFrmType = FRAME_PACKING_TYPE_BUTT;
                break;
        }
    }

    return;
}

static HI_VOID ConvertFrm_GetFrameRate(VDEC_CHANNEL_S *pstChan,
                                       IMAGE *pstImage,
                                       HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_U32 u32fpsInteger, u32fpsDecimal;

    switch (pstChan->stFrameRateParam.enFrmRateType)
    {
        case HI_UNF_AVPLAY_FRMRATE_TYPE_USER:
            u32fpsInteger = pstChan->stFrameRateParam.stSetFrmRate.u32fpsInteger;
            u32fpsDecimal = pstChan->stFrameRateParam.stSetFrmRate.u32fpsDecimal;

            break;

        case HI_UNF_AVPLAY_FRMRATE_TYPE_PTS:
        case HI_UNF_AVPLAY_FRMRATE_TYPE_USER_PTS:
        case HI_UNF_AVPLAY_FRMRATE_TYPE_STREAM:
        default:
            u32fpsInteger = pstImage->frame_rate / 1000;
            u32fpsDecimal = pstImage->frame_rate % 1000;

            break;
    }

    pstFrame->u32FrameRate = u32fpsInteger * 1000 + u32fpsDecimal;

    /*60.0~60.5fps is setted to 60fps just for CES*/
    if ((pstFrame->u32FrameRate >= 60000) && (pstFrame->u32FrameRate < 60500))
    {
        pstFrame->u32FrameRate = 60000;
    }

    if (pstFrame->u32FrameRate < 1000)
    {
        pstFrame->u32FrameRate = 25000;
    }

    return;
}

static HI_VOID ConvertFrm_GetTunnelPhyAddr(VDEC_CHANNEL_S *pstChan,
        IMAGE *pstImage,
        HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (HI_TRUE == pstChan->bLowdelay)
    {
        pstFrame->u32TunnelPhyAddr = pstImage->line_num_phy_addr;
        //pstFrame->u64TunnelVirAddr = pstImage->line_num_vir_addr;
    }
    else
    {
        pstFrame->u32TunnelPhyAddr = 0;
    }

    return;
}

static HI_VOID ConvertFrm_GetUvMOSParameter(IMAGE *pstImage, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    pstFrame->u32FrameStreamSize = pstImage->uvmosParam.FrameStreamSize;
    pstFrame->u32AvgQp = pstImage->uvmosParam.AvgQp;
    pstFrame->u32FrameType = pstImage->format.frame_type;
    pstFrame->u32MaxMV = pstImage->uvmosParam.MaxMV;
    pstFrame->u32MinMV = pstImage->uvmosParam.MinMV;
    pstFrame->u32AvgMV = pstImage->uvmosParam.AvgMV;
    pstFrame->u32SkipRatio = pstImage->uvmosParam.SkipRatio;

    HI_WARN_VDEC("FrameStreamSize = %d, AvgQp = %d, FrameType = %d, MaxMV = %d, MinMV = %d, AvgMV = %d, SkipRatio = %d, bDiscard: %d\n",
                 pstFrame->u32FrameStreamSize,
                 pstFrame->u32AvgQp,
                 pstFrame->u32FrameType,
                 pstFrame->u32MaxMV,
                 pstFrame->u32MinMV,
                 pstFrame->u32AvgMV,
                 pstFrame->u32SkipRatio,
                 pstFrame->bDiscard);
}

static HI_VOID VDEC_ConvertFrm(HI_UNF_VCODEC_TYPE_E enType, VDEC_CHANNEL_S *pstChan,
                               IMAGE *pstImage, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32Reserve);
    HI_DRV_VIDEO_PRIVATE_S *pstVideoPriv = (HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv);

    pstFrame->bTopFieldFirst = (pstImage->format.top_field_first != 0) ? HI_TRUE : HI_FALSE;

    ConvertFrm_GetPixFormat(enType, pstImage, pstFrame);
    ConvertFrm_GetDisplayNorm(pstChan, pstImage);
    ConvertFrm_GetProgressiveInfo(pstChan, pstImage, pstFrame);
    ConvertFrm_GetSampleType(pstVideoPriv, pstImage);
    ConvertFrm_GetFieldMode(pstImage, pstFrame);

    if (enType == HI_UNF_VCODEC_TYPE_HEVC || enType == HI_UNF_VCODEC_TYPE_AVS2)
    {
        pstFrame->enBufValidMode = HI_DRV_FIELD_ALL;
    }
    else if (enType == HI_UNF_VCODEC_TYPE_H264)
    {
        pstFrame->enBufValidMode = pstFrame->enFieldMode;
    }

    pstFrame->u32Width                         = (HI_U32)pstImage->disp_width;
    pstFrame->u32Height                        = (HI_U32)pstImage->disp_height;
    pstFrame->stDispRect.s32Width              = (HI_S32)pstImage->disp_width;
    pstFrame->stDispRect.s32Height             = (HI_S32)pstImage->disp_height;
    //pstFrame->u32DisplayHorizontalSize         = pstImage->display_horizontal_size;
    //pstFrame->u32DisplayVerticalSize           = pstImage->display_vertical_size;

    ConvertFrm_GetBitWidth(enType, pstImage, pstFrame);
    ConvertFrm_GetBufAddr(enType, pstImage, pstFrame);
    ConvertFrm_GetVP6ExtAttr(enType, pstChan, pstFrame);

    pstFrame->active_format_flag = (HI_BOOL)(pstImage->afd_info.active_format_flag);
    pstFrame->active_format = (HI_DRV_VIDEO_AFD_TYPE_E)(pstImage->afd_info.active_format);

    pstFrame->u32AspectWidth                   = pstImage->u32AspectWidth;
    pstFrame->u32AspectHeight                  = pstImage->u32AspectHeight;

    if (pstFrame->u32AspectWidth == 0)
    {
        pstFrame->u32AspectWidth               = (HI_U32)pstImage->disp_width;
        pstFrame->u32AspectHeight              = (HI_U32)pstImage->disp_height;
    }

    if ((enType == HI_UNF_VCODEC_TYPE_HEVC)
        && (pstImage->u32AspectWidth == 0)
        && (pstFrame->enBufValidMode == HI_DRV_FIELD_ALL)
        && (pstFrame->enFieldMode != HI_DRV_FIELD_ALL))
    {
        pstFrame->u32AspectWidth               = (HI_U32)pstImage->disp_width;
        pstFrame->u32AspectHeight              = (HI_U32)pstImage->disp_height * 2;
    }

    pstFrame->stDispRect.s32X                  = 0;
    pstFrame->stDispRect.s32Y                  = 0;

    pstFrame->u32ErrorLevel                    = pstImage->error_level;
    pstFrame->u32SrcPts                        = (HI_U32)pstImage->SrcPts;
    pstFrame->u32Pts                           = (HI_U32)pstImage->PTS;
    pstFrame->DVDualLayer                      =  pstImage->DVDualLayer;
    //pstFrame->u32FrmCnt                        = pstImage->seq_img_cnt;
    pstFrame->u32FrameIndex                    = pstImage->seq_img_cnt;
    pstChan->u32DecodeAspectWidth              = pstFrame->u32AspectWidth;
    pstChan->u32DecodeAspectHeight             = pstFrame->u32AspectHeight;
    pstChan->u32LastLumaBitdepth               = pstImage->bit_depth;
    pstChan->u32LastChromaBitdepth             = pstImage->bit_depth;
    //pstFrame->DispCtrlWidth                    = pstImage->DispCtrlWidth;
    //pstFrame->DispCtrlHeight                   = pstImage->DispCtrlHeight;
    if (pstImage->error_level > pstChan->stCurCfg.u32ErrCover && pstChan->bUVMOSEnable == 1)
    {
        pstFrame->bDiscard = 1;
    }

    ConvertFrm_GetUvMOSParameter(pstImage, pstFrame);
    ConvertFrm_GetFrmType(enType, pstImage, pstFrame);

    pstPrivInfo->image_id       = pstImage->image_id;
    pstPrivInfo->image_id_1     = pstImage->image_id_1;
    pstPrivInfo->u32SeqFrameCnt = pstImage->seq_img_cnt;
    //pstPrivInfo->u8Repeat       = !(pstImage->format & 0x80000);  /* control vo discard frame bit19 */
    pstPrivInfo->u8TestFlag     = pstImage->optm_inf.Rwzb;
    pstPrivInfo->u8EndFrame     = pstImage->last_frame;
    pstPrivInfo->s32FrameFormat = pstImage->format.frame_type;
    pstPrivInfo->s32TopFieldFrameFormat = pstImage->top_fld_type & 0x03;
    pstPrivInfo->s32BottomFieldFrameFormat = pstImage->bottom_fld_type & 0x03;
    pstPrivInfo->s32FieldFlag      = pstImage->is_fld_save;
    pstPrivInfo->s32GopNum      = pstImage->GopNum;

    if ((pstFrame->u32Height <= 288)
        && (enType != HI_UNF_VCODEC_TYPE_HEVC)
        && (enType != HI_UNF_VCODEC_TYPE_H264)
        && (enType != HI_UNF_VCODEC_TYPE_AVS2))
    {
        pstFrame->bProgressive = HI_TRUE;
    }

    ConvertFrm_GetFrameRate(pstChan, pstImage, pstFrame);
    ConvertFrm_GetTunnelPhyAddr(pstChan, pstImage, pstFrame);
    pstFrame->BackTunnelPhyAddr = pstImage->stDecInfo.back_tunnel_line_num_phy_addr;

    if (enType == HI_UNF_VCODEC_TYPE_MPEG4 || enType == HI_UNF_VCODEC_TYPE_VC1
        || enType == HI_UNF_VCODEC_TYPE_VP6 || enType == HI_UNF_VCODEC_TYPE_VP6A
        || enType == HI_UNF_VCODEC_TYPE_VP6F || enType == HI_UNF_VCODEC_TYPE_VP9
        || enType == HI_UNF_VCODEC_TYPE_MJPEG)
    {
        pstFrame->BackTunnelPhyAddr = 0;
    }

    pstPrivInfo->entype = enType;
#ifdef HI_TEE_SUPPORT
    pstFrame->bSecure = (pstImage->is_SecureFrame != 0) ? HI_TRUE : HI_FALSE;
#endif

    if (0 == pstImage->is_fld_save)
    {
        pstVideoPriv->ePictureMode = HI_DRV_PICTURE_FRAME;
    }
    else if (1 == pstImage->is_fld_save)
    {
        pstVideoPriv->ePictureMode = HI_DRV_PICTURE_FIELD;
    }
    else
    {
        pstVideoPriv->ePictureMode = HI_DRV_PICTURE_BUTT;
    }

    ((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32PrivDispTime = pstImage->DispTime;
    ((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32PlayTime = pstImage->u32RepeatCnt;
    ((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->eColorSpace  = VDEC_GetColorSpace(enType, pstImage);
    pstVideoPriv->stVideoOriginalInfo.enSource = HI_DRV_SOURCE_DTV;
    pstVideoPriv->stVideoOriginalInfo.u32Width = pstImage->disp_width;
    pstVideoPriv->stVideoOriginalInfo.u32Height = pstImage->disp_height;
    pstVideoPriv->stVideoOriginalInfo.u32FrmRate = pstFrame->u32FrameRate;
    pstVideoPriv->stVideoOriginalInfo.en3dType = pstFrame->eFrmType;
    pstVideoPriv->stVideoOriginalInfo.enSrcColorSpace = HI_DRV_CS_BT601_YUV_LIMITED;
    pstVideoPriv->stVideoOriginalInfo.enColorSys = HI_DRV_COLOR_SYS_AUTO;
    pstVideoPriv->stVideoOriginalInfo.bGraphicMode = HI_FALSE;
    pstVideoPriv->stVideoOriginalInfo.bInterlace = (pstFrame->bProgressive == HI_FALSE) ? HI_TRUE : HI_FALSE;
}

static HI_S32 VDEC_RlsFrm(VDEC_CHANNEL_S *pstChan, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 s32Ret;
    IMAGE stImage;
    IMAGE_INTF_S *pstImgInft = &pstChan->stImageIntf;
    VDEC_CHAN_STATINFO_S *pstStatInfo = &pstChan->stStatInfo;
    HI_DRV_VIDEO_PRIVATE_S *pstVideoPrivate = NULL;
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = NULL;

    pstVideoPrivate = (HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv);

    if (pstVideoPrivate == NULL)
    {
        return HI_FAILURE;
    }

    pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(pstVideoPrivate->u32Reserve);

    if (pstPrivInfo == NULL)
    {
        return HI_FAILURE;
    }

    if (pstImgInft->release_image == NULL)
    {
        return HI_FAILURE;
    }

    memset(&stImage, 0, sizeof(stImage));
    stImage.image_width   = pstFrame->u32Width;
    stImage.image_height = pstFrame->u32Height;
    stImage.image_id   = pstPrivInfo->image_id;
    stImage.image_id_1 = pstPrivInfo->image_id_1;
    stImage.stDispInfo.luma_phy_addr = pstFrame->stBufAddr[0].u32PhyAddr_Y - pstFrame->stBufAddr[0].u32Head_Size;
    stImage.stHDRInput.HDR_Metadata_phy_addr = pstVideoPrivate->HdrPhyAddr;

    stImage.stDecInfo.back_tunnel_line_num_phy_addr = pstFrame->BackTunnelPhyAddr;

    if (pstPrivInfo->image_id_1 != -1)
    {
        stImage.stDispInfo.luma_phy_addr_1 = pstFrame->stBufAddr[1].u32PhyAddr_YHead;
    }

    pstStatInfo->u32VdecRlsFrameTry++;

    s32Ret = RlsImage(pstChan, pstImgInft->image_provider_inst_id, &stImage);

    if (VDEC_OK != s32Ret)
    {
        s32Ret = s_stVdecDrv.pVfmwFunc->pfnVfmwGlobalReleaseImage(&stImage);
    }

    if (VDEC_OK != s32Ret)
    {
        pstStatInfo->u32VdecRlsFrameFail++;
        return HI_FAILURE;
    }
    else
    {
        pstStatInfo->u32VdecRlsFrameOK++;
        return HI_SUCCESS;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_CheckConvertFrm(VDEC_CHANNEL_S *pstChan, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    if (0 == pstFrame->u32Height || 0 == pstFrame->u32Width)
    {
        (HI_VOID)VDEC_RlsFrm(pstChan, pstFrame);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

HI_S32 VDEC_CheckGetFirstIFrameFlag(IMAGE *pstImage)
{
    if (((pstImage->is_fld_save == 0) && (0 == pstImage->format.frame_type))
        || ((pstImage->is_fld_save == 1) && ((0 == (pstImage->top_fld_type & 0x03))
                || (0 == (pstImage->bottom_fld_type & 0x03)))))
    {
        return HI_TRUE;
    }
    else
    {
        return HI_FALSE;
    }
}

static HI_S32 RecvFrm_ReadFailProcess(VDEC_CHANNEL_S *pstChan,
                                      HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo,
                                      HI_VDEC_PRIV_FRAMEINFO_S *pstLastFrmPrivInfo,
                                      HI_DRV_VIDEO_PRIVATE_S *pstVideoPriv,
                                      HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_BOOL NeedHandleEOF = HI_FALSE;

    if (pstChan->eEofReportStatus == EOF_STATUS_NULL)
    {
        return HI_FAILURE;
    }

    switch (pstChan->eEofReportStatus)
    {
        case EOF_STATUS_WITH_ID:
            if (pstLastFrmPrivInfo->image_id % 100 == pstChan->u32LastFrmId)
            {
                NeedHandleEOF = HI_TRUE;
            }

            break;

        case EOF_STATUS_FAILURE:
            if (pstChan->u32LastFrmTryTimes++ >= 4)
            {
                NeedHandleEOF = HI_TRUE;
            }

            break;

        case EOF_STATUS_USER_DEC:
        case EOF_STATUS_FAKE_EOF:
            NeedHandleEOF = HI_TRUE;
            break;

        default:
            break;
    }

    if (NeedHandleEOF == HI_TRUE)
    {
        pstPrivInfo->u8EndFrame = 2;
        pstVideoPriv->u32LastFlag = DEF_HI_DRV_VPSS_LAST_ERROR_FLAG;
        pstChan->u32LastFrmTryTimes = 0;
        pstChan->u32LastFrmId = -1;
        pstChan->bEndOfFrm = (pstChan->eEofReportStatus != EOF_STATUS_FAKE_EOF) ? HI_TRUE : HI_FALSE;
        pstFrame->bProgressive = HI_FALSE;
        pstFrame->enFieldMode = HI_DRV_FIELD_ALL;
#ifdef HI_TEE_SUPPORT
        pstFrame->bSecure = pstChan->bTvp == HI_TRUE ? HI_TRUE : HI_FALSE;
#endif
        pstChan->eEofReportStatus = EOF_STATUS_NULL;

        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

static HI_BOOL VDEC_IFrameCheck(IMAGE *pstImage)
{
    if (pstImage->format.frame_type == 0)
    {
        return HI_TRUE;
    }

    if ((pstImage->format.frame_type == 1) && (pstImage->is_fld_save))
    {
        if ((pstImage->top_fld_type == 0) || (pstImage->bottom_fld_type == 0))
        {
            return HI_TRUE;
        }
    }

    return HI_FALSE;
}

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
#if (1 == HI_VDEC_CC_FROM_IMAGE)
static HI_VOID RecvFrm_UserDataProcess(HI_HANDLE hHandle, IMAGE *pstImage)
{
    HI_U32 u32ID;
    HI_U8 u8Type;
    HI_U32 u32Index;
    USRDAT *pstUsrData = HI_NULL;

    /* TVP not support userdata*/
    if (pstImage->is_SecureFrame != HI_TRUE)
    {
        for (u32Index = 0 ; u32Index < 4; u32Index++)
        {
            pstUsrData = (VOID *)(HI_SIZE_T)(pstImage->p_usrdat[u32Index]);

            if (pstUsrData == NULL)
            {
                return;
            }

            if (pstUsrData->data_size <= 0)
            {
                return;
            }

            pstUsrData->PTS = pstImage->PTS;
            u32ID = *((HI_U32 *)pstUsrData->data);
            u8Type = pstUsrData->data[4];

            switch (u32ID)
            {
                case VDEC_USERDATA_IDENTIFIER_DVB1:
                    if (VDEC_USERDATA_TYPE_DVB1_CC == u8Type)
                    {
                        USRDATA_Put(hHandle, pstUsrData, HI_UNF_VIDEO_USERDATA_DVB1_CC);
                    }

                    break;

                case VDEC_USERDATA_IDENTIFIER_AFD:
                    USRDATA_Put(hHandle, pstUsrData, HI_UNF_VIDEO_USERDATA_AFD);
                    break;

                default:
                    break;
            }
        }
    }

    return;
}
#endif
#endif

HI_S32 FastBackwardCheckForNewIFrame(HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo, HI_HANDLE hHandle)
{
    VDEC_ASSERT_RETURN((pstPrivInfo != HI_NULL), HI_FAILURE);
    VDEC_ASSERT_RETURN((hHandle != HI_INVALID_HANDLE), HI_FAILURE);

    if ((s_stVdecDrv.astChanEntity[hHandle].pstChan->s32GetFirstFrameFlag == HI_TRUE)
        && (((0 == pstPrivInfo->s32FrameFormat) && (0 == pstPrivInfo->s32FieldFlag))
           || (((0 == pstPrivInfo->s32BottomFieldFrameFormat) || (0 == pstPrivInfo->s32TopFieldFrameFormat))
              && (1 == pstPrivInfo->s32FieldFlag))))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

HI_S32 FastBackwardCheckForNewGop(HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo, HI_HANDLE hHandle)
{
    VDEC_ASSERT_RETURN(pstPrivInfo != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(hHandle != HI_INVALID_HANDLE, HI_FAILURE);

    if ((s_stVdecDrv.astChanEntity[hHandle].pstChan->s32GetFirstFrameFlag == HI_TRUE)
        && (pstPrivInfo->s32GopNum != s_stVdecDrv.astChanEntity[hHandle].pstChan->s32LastFrameGopNum)
        && (s_stVdecDrv.astChanEntity[hHandle].pstChan->TmpListPos > 0))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

static HI_S32 VDEC_InsertFrameIntoTmpList(HI_HANDLE hVdec, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 index = 0;
    VDEC_SPIN_LOCK_S *pListLock = HI_NULL;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_VDEC_PRIV_FRAMEINFO_S *pFirstTmpFramePrivInfo = HI_NULL;
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32Reserve);

    VDEC_ASSERT_RETURN(hVdec != HI_INVALID_HANDLE, HI_FAILURE);

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pListLock = &(pstChan->FrameListLock);

    VDEC_SpinLockIRQ(pListLock);

    index = pstChan->TmpListPos;

    if (index >= VDEC_MAX_TMP_LIST_FRAME)
    {
        HI_ERR_VDEC("Invalid List Index: %d\n", index);
        VDEC_SpinUnLockIRQ(pListLock);

        return HI_FAILURE;
    }

    memcpy(&(pstChan->TmpList[index].stOutFrame), pstFrame, sizeof(HI_DRV_VIDEO_FRAME_S));

    // due to the last frame decoded by decoder is not the last frame output to post module
    // exchange the flag with the first frame of the gop
    if (pstPrivInfo->u8EndFrame == 1)
    {
        pFirstTmpFramePrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstChan->TmpList[0].stOutFrame.u32Priv))->u32Reserve);
        pFirstTmpFramePrivInfo->u8EndFrame = 1;
        pstPrivInfo->u8EndFrame = 0;
    }

    pstChan->TmpListPos++;

    VDEC_SpinUnLockIRQ(pListLock);

    return HI_SUCCESS;
}

static HI_S32 VDEC_InsertTmpListIntoFinalList(HI_HANDLE hVdec)
{
    HI_S32 i = 0;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    struct list_head *pFrameList;
    struct list_head *pNode;
    VDEC_SPIN_LOCK_S *pListLock = HI_NULL;
    VDEC_FRAME_LIST_NODE_S *pListNode = HI_NULL;
    VDEC_FRAME_LIST_NODE_S *insertedFrame[VDEC_MAX_TMP_LIST_FRAME] = {0};
    HI_U32 insertedFrameIndex = 0;

    if (hVdec == HI_INVALID_HANDLE)
    {
        HI_ERR_VDEC("Bad param\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pListLock = &(pstChan->FrameListLock);

    VDEC_SpinLockIRQ(pListLock); // conside narrow the scope of spinlock
    i = pstChan->TmpListPos - 1;

    if (i < 0)
    {
        VDEC_SpinUnLockIRQ(pListLock);
        return HI_FAILURE;
    }

    pFrameList = &(pstChan->FrameList);

    for (; i >= 0; i--)
    {
        pListNode = HI_KMALLOC_ATOMIC_VDEC(sizeof(VDEC_FRAME_LIST_NODE_S));

        if (pListNode)
        {
            if (insertedFrameIndex < VDEC_MAX_TMP_LIST_FRAME)
            {
                insertedFrame[insertedFrameIndex] = pListNode;
                insertedFrameIndex++;
            }
        }
        else
        {
            HI_ERR_VDEC("Allocate VDEC_FRAME_LIST_NODE_S failed.\n");

            for (i = 0; i < insertedFrameIndex; i++)
            {
                if (insertedFrame[i])
                {
                    HI_KFREE_VDEC(insertedFrame[i]);
                }
            }

            VDEC_SpinUnLockIRQ(pListLock);
            return HI_ERR_BM_NO_MEMORY;
        }

        memcpy(&(pListNode->stOutFrame), &(pstChan->TmpList[i].stOutFrame), sizeof(HI_DRV_VIDEO_FRAME_S));
        pNode = &(pListNode->node);
        list_add_tail(pNode, pFrameList);
    }

    pstChan->TmpListPos = 0;

    VDEC_SpinUnLockIRQ(pListLock);

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_RecvFrameFromFinalList(HI_HANDLE hVdec, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_SPIN_LOCK_S *pListLock = HI_NULL;
    VDEC_FRAME_LIST_NODE_S *pListNode = HI_NULL;

    if ((hVdec == HI_INVALID_HANDLE) || (!pstFrame))
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pListLock = &(pstChan->FrameListLock);

    VDEC_SpinLockIRQ(pListLock);

    if (&(pstChan->FrameList) == pstChan->FrameList.next)
    {
        VDEC_SpinUnLockIRQ(pListLock);

        return HI_FAILURE;
    }

    pListNode = list_entry(pstChan->FrameList.next, VDEC_FRAME_LIST_NODE_S, node);
    memcpy(pstFrame, &(pListNode->stOutFrame), sizeof(HI_DRV_VIDEO_FRAME_S));
    list_del_init(&(pListNode->node));
    HI_KFREE_BUFMNG(pListNode);
    VDEC_SpinUnLockIRQ(pListLock);

    return HI_SUCCESS;
}

static HI_S32 VDEC_ClearFastBackwardList(HI_HANDLE hHandle, VDEC_CHANNEL_S *pstChan)
{
    HI_S32 ret;
    HI_S32 i = 0;
    HI_DRV_VIDEO_FRAME_S *pFrame = HI_NULL;
    VDEC_FRAME_LIST_NODE_S *pNode = HI_NULL;
    VDEC_SPIN_LOCK_S *pListLock = HI_NULL;

    if (hHandle == HI_INVALID_HANDLE || !pstChan)
    {
        HI_ERR_VDEC("Para is invalid, hHandl = %d\n", hHandle);

        return HI_FAILURE;
    }

    pListLock = &(pstChan->FrameListLock);

    VDEC_SpinLockIRQ(pListLock);

    // clear tmp list
    for (i = 0; i < pstChan->TmpListPos; i++)
    {
        pFrame = &(pstChan->TmpList[i].stOutFrame);
        ret = HI_VDEC_Chan_VORlsFrame(hHandle, pFrame);
        if (ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Clear tmp list failed, frame's addr = 0x%x\n", pFrame->stBufAddr[0].u32PhyAddr_YHead);
        }
    }

    pstChan->TmpListPos = 0;

    // clear final list
    while ((pstChan->FrameList.next) && (&(pstChan->FrameList) != pstChan->FrameList.next))
    {
        pNode = list_entry(pstChan->FrameList.next, VDEC_FRAME_LIST_NODE_S, node);
        if (!pNode)
        {
            HI_ERR_VDEC("pNode is null\n");
            continue;
        }

        pFrame = &(pNode->stOutFrame);
        ret = HI_VDEC_Chan_VORlsFrame(hHandle, pFrame);
        if (ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Clear final list failed, frame's addr = 0x%x\n", pFrame->stBufAddr[0].u32PhyAddr_YHead);
        }

        list_del_init(&(pNode->node));
        HI_KFREE_VDEC(pNode);
    }

    VDEC_SpinUnLockIRQ(pListLock);

    return HI_SUCCESS;
}

static HI_S32 VDEC_FastBackwardProcessDistance(HI_HANDLE hHandle, VDEC_CHANNEL_S *pstChan, IMAGE *pImage)
{
    HI_S32 ret = HI_FAILURE;

    if (pImage->last_frame == 1)
    {
        return HI_SUCCESS;
    }

    if (pstChan->u32BackwardOptimizeFlag)
    {
        if (!pImage->DispEnableFlag)
        {
            ret = RlsImage(pstChan, pstChan->stImageIntf.image_provider_inst_id, pImage);
            if (ret != HI_SUCCESS)
            {
                HI_ERR_VDEC("Release VFMW image failed\n");
            }

            return HI_FAILURE;
        }

        if (pstChan->s32GetFirstIFrameFlag)
        {
            if (pstChan->s32ImageDistance == 0)
            {
                pstChan->s32ImageDistance = pImage->DispFrameDistance;
                return HI_SUCCESS;
            }
            else
            {
                pstChan->s32ImageDistance--;
                ret = RlsImage(pstChan, pstChan->stImageIntf.image_provider_inst_id, pImage);
                if (ret != HI_SUCCESS)
                {
                    HI_ERR_VDEC("Release VFMW image failed\n");
                }

                return HI_FAILURE;
            }
        }

        pstChan->s32GetFirstIFrameFlag = HI_TRUE;
        pstChan->s32ImageDistance = pImage->DispFrameDistance;

        if (pstChan->s32ImageDistance == 0)
        {
            return HI_SUCCESS;
        }

        pstChan->s32ImageDistance--;
        ret = RlsImage(pstChan, pstChan->stImageIntf.image_provider_inst_id, pImage);
        if (ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Release VFMW image failed\n");
        }

        return HI_FAILURE;
    }

    if (pstChan->s32GetFirstIFrameFlag)
    {
        return HI_SUCCESS;
    }

    if (VDEC_IFrameCheck(pImage))
    {
        pstChan->s32GetFirstIFrameFlag = HI_TRUE;
        return HI_SUCCESS;
    }

    ret = RlsImage(pstChan, pstChan->stImageIntf.image_provider_inst_id, pImage);
    if (ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Release VFMW image failed\n");
    }

    return HI_FAILURE;
}

static HI_S32 VDEC_FastBackwardRecvFrm(HI_HANDLE hHandle, VDEC_CHANNEL_S *pstChan, HI_DRV_VIDEO_FRAME_S *pstFrame)
{
    HI_S32 s32Ret = HI_FAILURE;
    IMAGE stImage = {0};
    HI_U8 EndFrameFlag = 0;

    IMAGE_INTF_S *pstImgInft = &pstChan->stImageIntf;
    HI_DRV_VIDEO_PRIVATE_S *pstVideoPriv = (HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv);
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32Reserve);
    HI_VDEC_PRIV_FRAMEINFO_S *pstLastFrmPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstChan->stLastDispFrameInfo.u32Priv))->u32Reserve);

    if (pstLastFrmPrivInfo->u8EndFrame == 1)
    {
        pstPrivInfo->u8EndFrame = 2;
        pstChan->eEofReportStatus = EOF_STATUS_NULL;
        pstChan->u32LastFrmTryTimes = 0;
        pstChan->u32LastFrmId = -1;
        pstFrame->bProgressive = HI_FALSE;
        pstFrame->enFieldMode = HI_DRV_FIELD_ALL;
        pstVideoPriv->u32LastFlag = DEF_HI_DRV_VPSS_LAST_ERROR_FLAG;
        pstChan->bEndOfFrm = HI_TRUE;

        return HI_SUCCESS;
    }

    memset(&stImage, 0, sizeof(stImage));
    stImage.pOutFrame = (HI_U64)(HI_SIZE_T)pstFrame;

    s32Ret = GetImage(s_stVdecDrv.astChanEntity[hHandle].pstChan, pstImgInft->image_provider_inst_id, &stImage);

    if (s32Ret == HI_SUCCESS)
    {
        s32Ret = VDEC_FastBackwardProcessDistance(hHandle, pstChan, &stImage);
        if (s32Ret != HI_SUCCESS)
        {
            goto RECV_BACKWARDFRAME;
        }

        VDEC_ConvertFrm(pstChan->stCurCfg.enType, pstChan, &stImage, pstFrame);

        // based on current solution,
        // we need reverse field order
        // when pass the frame to post module
        // in PVR fast backward scenes
        pstFrame->bTopFieldFirst = !pstFrame->bTopFieldFirst;

        if (pstChan->u32BackwardOptimizeFlag)
        {
            if (FastBackwardCheckForNewGop(pstPrivInfo, hHandle))
            {
                s32Ret = VDEC_InsertTmpListIntoFinalList(hHandle);
                if (s32Ret != HI_SUCCESS)
                {
                    HI_ERR_VDEC("Insert tmp list to final list failed\n");
                }
                pstChan->s32LastFrameGopNum = pstPrivInfo->s32GopNum;
            }
            else
            {
                pstChan->s32GetFirstFrameFlag = HI_TRUE;
            }
        }
        else
        {
            if (FastBackwardCheckForNewIFrame(pstPrivInfo, hHandle))
            {
                s32Ret = VDEC_InsertTmpListIntoFinalList(hHandle);
                if (s32Ret != HI_SUCCESS)
                {
                    HI_ERR_VDEC("Insert tmp list to final list failed\n");
                }
                pstChan->lastFrameType = pstPrivInfo->s32FrameFormat;
            }
            else
            {
                pstChan->s32GetFirstFrameFlag = HI_TRUE;
            }
        }

        EndFrameFlag = pstPrivInfo->u8EndFrame;

        s32Ret = VDEC_InsertFrameIntoTmpList(hHandle, pstFrame);
        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Insert frame to tmp list failed\n");
        }

        // if last frame has been decoded and insert into tmplist, we need to
        // output tmplist frames to finallist
        if (EndFrameFlag == 1)
        {
            s32Ret = VDEC_InsertTmpListIntoFinalList(hHandle);
            if (s32Ret != HI_SUCCESS)
            {
                HI_ERR_VDEC("Insert tmp list to final list failed\n");
            }

            if (pstChan->u32BackwardOptimizeFlag)
            {
                pstChan->s32LastFrameGopNum = pstPrivInfo->s32GopNum;
            }
            else
            {
                pstChan->lastFrameType = pstPrivInfo->s32FrameFormat;
            }
        }
    }

RECV_BACKWARDFRAME:
    s32Ret = VDEC_Chan_RecvFrameFromFinalList(hHandle, pstFrame);

    if (s32Ret != HI_SUCCESS)
    {
        return RecvFrm_ReadFailProcess(pstChan, pstPrivInfo, pstLastFrmPrivInfo, pstVideoPriv, pstFrame);
    }

    return s32Ret;
}

static HI_S32 VDEC_RecvFrm(HI_HANDLE hHandle, VDEC_CHANNEL_S *pstChan, HI_DRV_VIDEO_FRAME_S *pstFrame, HI_U32 TimeOut)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32UserdataId;
    IMAGE stImage = {0};
    VDEC_CHAN_STATE_S stChanState = {0};

    IMAGE_INTF_S *pstImgInft = &pstChan->stImageIntf;
    VDEC_CHAN_STATINFO_S *pstStatInfo = &pstChan->stStatInfo;
    HI_VDEC_PRIV_FRAMEINFO_S *pstPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv))->u32Reserve);
    HI_VDEC_PRIV_FRAMEINFO_S *pstLastFrmPrivInfo = (HI_VDEC_PRIV_FRAMEINFO_S *)(((HI_DRV_VIDEO_PRIVATE_S *)(pstChan->stLastDispFrameInfo.u32Priv))->u32Reserve);
    HI_DRV_VIDEO_PRIVATE_S *pstVideoPriv = (HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv);
    memset(&stImage, 0, sizeof(stImage));

    if (pstLastFrmPrivInfo->u8EndFrame == 1)
    {
        pstPrivInfo->u8EndFrame = 2;
        pstChan->eEofReportStatus = EOF_STATUS_NULL;
        pstChan->u32LastFrmTryTimes = 0;
        pstChan->u32LastFrmId = -1;
        pstFrame->bProgressive = HI_FALSE;
        pstFrame->enFieldMode = HI_DRV_FIELD_ALL;
        pstVideoPriv->u32LastFlag = DEF_HI_DRV_VPSS_LAST_ERROR_FLAG;
        pstChan->bEndOfFrm = HI_TRUE;

        return HI_SUCCESS;
    }

    pstStatInfo->u32VdecRcvFrameTry++;
    stImage.pOutFrame = (HI_U64)(HI_SIZE_T)pstFrame;

    s32Ret = GetImage(pstChan, pstImgInft->image_provider_inst_id, &stImage);

    if (s32Ret != VDEC_OK)
    {
        VDEC_WaitEvent(pstChan->WaitQueue, pstChan->bWakeUp, msecs_to_jiffies(TimeOut));

        if (pstChan->bWakeUp == HI_TRUE)
        {
            pstChan->bWakeUp = HI_FALSE;
            s32Ret = GetImage(pstChan, pstImgInft->image_provider_inst_id, &stImage);
        }

        if (s32Ret != VDEC_OK)
        {
            return RecvFrm_ReadFailProcess(pstChan, pstPrivInfo, pstLastFrmPrivInfo, pstVideoPriv, pstFrame);
        }
    }

    pstChan->u32LastFrmTryTimes = 0;

    pstStatInfo->u32VdecRcvFrameOK++;
    pstStatInfo->u32TotalVdecOutFrame++;
    pstPrivInfo->s32InterPtsDelta = stImage.InterPtsDelta;

    for (u32UserdataId = 0; u32UserdataId < 4; u32UserdataId++)
    {
        pstChan->pu8UsrDataForWaterMark[u32UserdataId] = (VOID *)(HI_SIZE_T)(stImage.p_usrdat[u32UserdataId]);
    }

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_CHAN_STATE, &stChanState, sizeof(stChanState));

    if (s32Ret != VDEC_OK)
    {
        HI_FATAL_VDEC("Chan %d GET_CHAN_STATE err\n", pstChan->hChan);
    }

#if (0 == VDEC_USERDATA_NEED_ARRANGE)

    if (stImage.p_usrdat != HI_NULL)
    {
        USRDATA_Arrange(hHandle, (VOID *)(HI_SIZE_T)(stImage.p_usrdat[0]));
    }

#endif

    VDEC_ConvertFrm(pstChan->stCurCfg.enType, pstChan, &stImage, pstFrame);
    s32Ret = VDEC_CheckConvertFrm(pstChan, pstFrame);

    if (s32Ret != HI_SUCCESS)
    {
        return HI_FAILURE;
    }

    if (pstFrame->eFrmType != pstChan->stLastFrm.eFrmType)
    {
        pstChan->bFramePackingChange = HI_TRUE;
        pstChan->enFramePackingType = VDEC_ConverFrameType(pstFrame->eFrmType);
    }

    memcpy(&(pstChan->stLastFrm), pstFrame, sizeof(HI_DRV_VIDEO_FRAME_S));

    pstFrame->hTunnelSrc = (HI_ID_VDEC << 16) | hHandle;

    if (stImage.image_id % 100 == pstChan->u32LastFrmId)
    {
        pstPrivInfo->u8EndFrame = 1;
        pstVideoPriv->u32LastFlag = DEF_HI_DRV_VPSS_LAST_FRAME_FLAG;
        pstChan->bEndOfFrm = HI_TRUE;
    }

    pstStatInfo->u32VdecErrFrame = stChanState.error_frame_num;
    pstFrame->bIsFirstIFrame = HI_FALSE;

    if (VDEC_IFrameCheck(&stImage))
    {
        HI_DRV_STAT_Event(STAT_EVENT_IFRAMEINTER, pstFrame->u32Pts);

        if (1 == pstStatInfo->u32TotalVdecOutFrame)
        {
            pstFrame->bIsFirstIFrame = HI_TRUE;
            HI_DRV_STAT_Event(STAT_EVENT_IFRAMEOUT, 0);
        }
    }

    if (pstChan->bIsIFrameDec)
    {
        pstFrame->bProgressive = HI_TRUE;
        pstPrivInfo->u8Marker |= 0x2;
    }
    else
    {
        pstPrivInfo->u8Marker &= 0xfd;
    }

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
#if (1 == HI_VDEC_CC_FROM_IMAGE)
    RecvFrm_UserDataProcess(hHandle, &stImage);
#endif
#endif

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetFrmBuf(HI_HANDLE hHandle, HI_DRV_VDEC_FRAME_BUF_S *pstFrm)
{
    HI_S32 s32Ret;
    USRDEC_FRAME_DESC_S stFrameDesc;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_NULL == pstFrm)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    memset(&stFrameDesc, 0, sizeof(USRDEC_FRAME_DESC_S));

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Get from VFMW */
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_USRDEC_FRAME, &stFrameDesc, sizeof(stFrameDesc));

    if (VDEC_OK != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("hHandle=%d, vfmw Chan %d GET_USRDEC_FRAME err!\n", hHandle, pstChan->hChan);
        return HI_FAILURE;
    }

    pstFrm->u32PhyAddr = stFrameDesc.s32LumaPhyAddr;
    pstFrm->u32Size = stFrameDesc.s32FrameSize;

    if (HI_TRUE == pstChan->bLowdelay)
    {
        pstFrm->u32LineNumPhyAddr = stFrameDesc.s32LineNumPhyAddr;
        //pstFrm->u64LineNumVirAddr = stFrameDesc.u64LineNumVirAddr;
    }
    else
    {
        pstFrm->u32LineNumPhyAddr = 0;
        pstFrm->u64LineNumVirAddr = 0;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_PutFrmBuf(HI_HANDLE hHandle, HI_DRV_VDEC_USR_FRAME_S *pstFrm)
{
    HI_S32 s32Ret;
    USRDEC_FRAME_DESC_S stFrameDesc;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_NULL == pstFrm)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Convert color format */
    switch (pstFrm->enFormat)
    {
        case HI_UNF_FORMAT_YUV_SEMIPLANAR_422:
            stFrameDesc.yuvFormat = SPYCbCr422_2X1;
            break;

        case HI_UNF_FORMAT_YUV_SEMIPLANAR_420:
            stFrameDesc.yuvFormat = SPYCbCr420;
            break;

        case HI_UNF_FORMAT_YUV_SEMIPLANAR_400:
            stFrameDesc.yuvFormat = SPYCbCr400;
            break;

        case HI_UNF_FORMAT_YUV_SEMIPLANAR_411:
            stFrameDesc.yuvFormat = SPYCbCr411;
            break;

        case HI_UNF_FORMAT_YUV_SEMIPLANAR_422_1X2:
            stFrameDesc.yuvFormat = SPYCbCr422_1X2;
            break;

        case HI_UNF_FORMAT_YUV_SEMIPLANAR_444:
            stFrameDesc.yuvFormat = SPYCbCr444;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_400:
            stFrameDesc.yuvFormat = PLNYCbCr400;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_411:
            stFrameDesc.yuvFormat = PLNYCbCr411;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_420:
            stFrameDesc.yuvFormat = PLNYCbCr420;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_422_1X2:
            stFrameDesc.yuvFormat = PLNYCbCr422_1X2;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_422_2X1:
            stFrameDesc.yuvFormat = PLNYCbCr422_2X1;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_444:
            stFrameDesc.yuvFormat = PLNYCbCr444;
            break;

        case HI_UNF_FORMAT_YUV_PLANAR_410:
            stFrameDesc.yuvFormat = PLNYCbCr410;
            break;

        case HI_UNF_FORMAT_YUV_PACKAGE_UYVY:
        case HI_UNF_FORMAT_YUV_PACKAGE_YUYV:
        case HI_UNF_FORMAT_YUV_PACKAGE_YVYU:
        default:
            stFrameDesc.yuvFormat = YCbCrBUTT;
            break;
    }

    stFrameDesc.Pts = pstFrm->u32Pts;
    stFrameDesc.s32YWidth  = pstFrm->s32YWidth;
    stFrameDesc.s32YHeight = pstFrm->s32YHeight;
    stFrameDesc.s32LumaPhyAddr = pstFrm->s32LumaPhyAddr;
    stFrameDesc.s32LumaStride = pstFrm->s32LumaStride;
    stFrameDesc.s32CbPhyAddr    = pstFrm->s32CbPhyAddr;
    stFrameDesc.s32CrPhyAddr    = pstFrm->s32CrPhyAddr;
    stFrameDesc.s32ChromStride  = pstFrm->s32ChromStride;
    stFrameDesc.s32ChromCrStride  = pstFrm->s32ChromCrStride;
    stFrameDesc.s32IsFrameValid = pstFrm->bFrameValid;
    stFrameDesc.s32LineNumPhyAddr = pstFrm->s32LineNumPhyAddr;
    //stFrameDesc.u64LineNumVirAddr = pstFrm->u64LineNumVirAddr;

    /* Last frame is the end frame */
    if (pstFrm->bEndOfStream)
    {
        pstChan->eEofReportStatus = EOF_STATUS_USER_DEC;
    }

    /* Put */
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_PUT_USRDEC_FRAME, &stFrameDesc, sizeof(stFrameDesc));

    if (VDEC_OK != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d PUT_USRDEC_FRAME err!\n", pstChan->hChan);
        return HI_FAILURE;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_RecvFrmBuf(HI_HANDLE hHandle, HI_DRV_VIDEO_FRAME_S *pstFrm)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_STATINFO_S *pstStatInfo;

    if ((HI_NULL == pstFrm) || (HI_INVALID_HANDLE == hHandle))
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    memset(pstFrm, 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (VDEC_CHAN_STATE_RUN != pstChan->enCurState)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d isn't runnig!\n", hHandle);
        return HI_FAILURE;
    }

    /*VPSS Read a frame from VDEC */
    pstChan->stStatInfo.u32UserAcqFrameTry++;

    if (pstChan->s32Speed < 0)
    {
        s32Ret = VDEC_FastBackwardRecvFrm(hHandle, pstChan, pstFrm);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }
    }
    else
    {
        s32Ret = VDEC_RecvFrm(hHandle, pstChan, pstFrm, 0);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }
    }

    pstChan->stStatInfo.u32UserAcqFrameOK++;
    pstChan->stLastDispFrameInfo = *pstFrm;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

#ifdef HI_PROC_SUPPORT
    BUFMNG_SaveYuv(hHandle, pstFrm, pstChan->stCurCfg.enType);

    if (BUFMNG_SaveRPU(hHandle, pstFrm) < 0)
    {
        HI_WARN_VDEC("Chan %d save rpu failed!!!\n", hHandle);
    }
#endif

    pstStatInfo = &s_stVdecDrv.astChanEntity[hHandle].pstChan->stStatInfo;
    if (pstStatInfo->u32ReceiveFrameTime == 0)
    {
        pstStatInfo->u32ReceiveFrameTime = VDEC_GetTimeInMs();
        g_KpiInfo.ReceiveFirstFrameTime = pstStatInfo->u32ReceiveFrameTime;
    }

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_RecvFrmBufWithTimeOut(HI_HANDLE hHandle, HI_DRV_VIDEO_FRAME_S *pstFrm, HI_U32 TimeOut)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if ((HI_NULL == pstFrm) || (HI_INVALID_HANDLE == hHandle))
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    memset(pstFrm, 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (VDEC_CHAN_STATE_RUN != pstChan->enCurState)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d isn't runnig!\n", hHandle);
        return HI_FAILURE;
    }

    /*VPSS Read a frame from VDEC */
    pstChan->stStatInfo.u32UserAcqFrameTry++;

    if (pstChan->s32Speed < 0)
    {
        s32Ret = VDEC_FastBackwardRecvFrm(hHandle, pstChan, pstFrm);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }
    }
    else
    {
        s32Ret = VDEC_RecvFrm(hHandle, pstChan, pstFrm, TimeOut);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            return HI_FAILURE;
        }
    }

    pstChan->stStatInfo.u32UserAcqFrameOK++;
    pstChan->stLastDispFrameInfo = *pstFrm;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

#ifdef HI_PROC_SUPPORT
    BUFMNG_SaveYuv(hHandle, pstFrm, pstChan->stCurCfg.enType);

    if (BUFMNG_SaveRPU(hHandle, pstFrm) < 0)
    {
        HI_WARN_VDEC("Chan %d save rpu failed!!!\n", hHandle);
    }
#endif

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetNewestDecodedFrame(HI_HANDLE hHandle, HI_DRV_VIDEO_FRAME_S *pFrame)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if ((hHandle == HI_INVALID_HANDLE) || (pFrame == HI_NULL))
    {
        HI_ERR_VDEC("Bad param!\n");

        return HI_FAILURE;
    }

    memset(pFrame, 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("Chan %d lock fail!\n", hHandle);

        return HI_FAILURE;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);

        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan->enCurState != VDEC_CHAN_STATE_RUN)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d isn't runnig!\n", hHandle);

        return HI_FAILURE;
    }

    memcpy(pFrame, &(pstChan->stLastFrm), sizeof(HI_DRV_VIDEO_FRAME_S));

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_RlsFrmBuf(HI_HANDLE hHandle, HI_DRV_VIDEO_FRAME_S *pstFrm)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if ((HI_NULL == pstFrm) || (HI_INVALID_HANDLE == hHandle))
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    pstChan->stStatInfo.u32UserRlsFrameTry++;

    s32Ret = VDEC_RlsFrm(pstChan, pstFrm);

    if (HI_SUCCESS != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

        return HI_FAILURE;
    }

    pstChan->stStatInfo.u32UserRlsFrameOK++;
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

static inline HI_VOID VDEC_YUVFormat_UNF2VFMW(HI_DRV_PIX_FORMAT_E enVideo, YUV_FORMAT_E *penVFMW)
{
    switch (enVideo)
    {
        case HI_DRV_PIX_FMT_NV08:
            *penVFMW = SPYCbCr400;
            break;

        case HI_DRV_PIX_FMT_NV12_411:
            *penVFMW = SPYCbCr411;
            break;

        case HI_DRV_PIX_FMT_NV16:
            *penVFMW = SPYCbCr422_1X2;
            break;

        case HI_DRV_PIX_FMT_NV16_2X1:
            *penVFMW = SPYCbCr422_2X1;
            break;

        case HI_DRV_PIX_FMT_NV24:
            *penVFMW = SPYCbCr444;
            break;

        case HI_DRV_PIX_FMT_YUV400:
            *penVFMW = PLNYCbCr400;
            break;

        case HI_DRV_PIX_FMT_YUV411:
            *penVFMW = PLNYCbCr411;
            break;

        case HI_DRV_PIX_FMT_YUV420p:
            *penVFMW = PLNYCbCr420;
            break;

        case HI_DRV_PIX_FMT_YUV422_1X2:
            *penVFMW = PLNYCbCr422_1X2;
            break;

        case HI_DRV_PIX_FMT_YUV422_2X1:
            *penVFMW = PLNYCbCr422_2X1;
            break;

        case HI_DRV_PIX_FMT_YUV_444:
            *penVFMW = PLNYCbCr444;
            break;

        case HI_DRV_PIX_FMT_YUV410p:
            *penVFMW = PLNYCbCr410;
            break;

        case HI_DRV_PIX_FMT_NV21:
        default:
            *penVFMW = SPYCbCr420;
            break;
    }
}

static const HI_U32 g_CapLevelConvertTable[][3] =
{
    {HI_UNF_VCODEC_CAP_LEVEL_QCIF,          CAP_LEVEL_H264_QCIF,    CAP_LEVEL_MPEG_QCIF},
    {HI_UNF_VCODEC_CAP_LEVEL_CIF,           CAP_LEVEL_H264_CIF,     CAP_LEVEL_MPEG_CIF},
    {HI_UNF_VCODEC_CAP_LEVEL_D1,            CAP_LEVEL_H264_D1,      CAP_LEVEL_MPEG_D1},
    {HI_UNF_VCODEC_CAP_LEVEL_720P,          CAP_LEVEL_H264_720,     CAP_LEVEL_MPEG_720},
    {HI_UNF_VCODEC_CAP_LEVEL_FULLHD,        CAP_LEVEL_H264_FHD,     CAP_LEVEL_MPEG_FHD},
    {HI_UNF_VCODEC_CAP_LEVEL_1280x800,      CAP_LEVEL_1280x800,     CAP_LEVEL_1280x800},
    {HI_UNF_VCODEC_CAP_LEVEL_800x1280,      CAP_LEVEL_800x1280,     CAP_LEVEL_800x1280},
    {HI_UNF_VCODEC_CAP_LEVEL_1488x1280,     CAP_LEVEL_1488x1280,    CAP_LEVEL_1488x1280},
    {HI_UNF_VCODEC_CAP_LEVEL_1280x1488,     CAP_LEVEL_1280x1488,    CAP_LEVEL_1280x1488},
    {HI_UNF_VCODEC_CAP_LEVEL_2160x1280,     CAP_LEVEL_2160x1280,    CAP_LEVEL_2160x1280},
    {HI_UNF_VCODEC_CAP_LEVEL_1280x2160,     CAP_LEVEL_1280x2160,    CAP_LEVEL_1280x2160},
    {HI_UNF_VCODEC_CAP_LEVEL_2160x2160,     CAP_LEVEL_2160x2160,    CAP_LEVEL_2160x2160},
    {HI_UNF_VCODEC_CAP_LEVEL_4096x2160,     CAP_LEVEL_4096x2160,    CAP_LEVEL_4096x2160},
    {HI_UNF_VCODEC_CAP_LEVEL_2160x4096,     CAP_LEVEL_2160x4096,    CAP_LEVEL_2160x4096},
    {HI_UNF_VCODEC_CAP_LEVEL_4096x4096,     CAP_LEVEL_4096x4096,    CAP_LEVEL_4096x4096},
    {HI_UNF_VCODEC_CAP_LEVEL_8192x4096,     CAP_LEVEL_8192x4096,    CAP_LEVEL_8192x4096},
    {HI_UNF_VCODEC_CAP_LEVEL_4096x8192,     CAP_LEVEL_4096x8192,    CAP_LEVEL_4096x8192},
    {HI_UNF_VCODEC_CAP_LEVEL_8192x8192,     CAP_LEVEL_8192x8192,    CAP_LEVEL_8192x8192},

    {HI_UNF_VCODEC_CAP_LEVEL_BUTT,          CAP_LEVEL_BUTT,         CAP_LEVEL_BUTT}, //terminal element
};

HI_U32 VDEC_CapLevelConvert(HI_U32 Code, HI_UNF_VCODEC_PRTCL_LEVEL_E PrctlLevel)
{
    HI_U32 Index = 0;
    HI_U32 TargetIndex = 0;
    HI_U32 ConvertedCode = CAP_LEVEL_BUTT;

    TargetIndex = (PrctlLevel == HI_UNF_VCODEC_PRTCL_LEVEL_H264) ? 1 : 2;
    ConvertedCode = (PrctlLevel == HI_UNF_VCODEC_PRTCL_LEVEL_H264) ? CAP_LEVEL_H264_FHD : CAP_LEVEL_MPEG_FHD;

    while (1)
    {
        if (g_CapLevelConvertTable[Index][0] == HI_UNF_VCODEC_CAP_LEVEL_BUTT
            || g_CapLevelConvertTable[Index][TargetIndex] == CAP_LEVEL_BUTT)
        {
            break;
        }

        if (Code == g_CapLevelConvertTable[Index][0])
        {
            ConvertedCode = g_CapLevelConvertTable[Index][TargetIndex];
            break;
        }

        Index++;
    }

    return ConvertedCode;
}

static VDEC_CHAN_CAP_LEVEL_E VDEC_CapLevelUnfToFmw(HI_UNF_AVPLAY_OPEN_OPT_S *pstVdecCapParam)
{
    if (HI_UNF_VCODEC_DEC_TYPE_ISINGLE == pstVdecCapParam->enDecType)
    {
        return CAP_LEVEL_SINGLE_IFRAME_FHD;
    }
    else if (HI_UNF_VCODEC_DEC_TYPE_NORMAL == pstVdecCapParam->enDecType)
    {
        if (HI_UNF_VCODEC_PRTCL_LEVEL_MVC == pstVdecCapParam->enProtocolLevel)
        {
            return CAP_LEVEL_MVC_FHD;
        }

        return VDEC_CapLevelConvert(pstVdecCapParam->enCapLevel, pstVdecCapParam->enProtocolLevel);
    }
    else
    {
        return CAP_LEVEL_BUTT;
    }
}

static PTS_FRMRATE_TYPE_E VDEC_UNF_2_VFMW_FRMRATE_TYPE(HI_UNF_AVPLAY_FRMRATE_TYPE_E enInType)
{
    PTS_FRMRATE_TYPE_E enOutType;

    switch (enInType)
    {
        case HI_UNF_AVPLAY_FRMRATE_TYPE_PTS:
            enOutType = PTS_FRMRATE_TYPE_PTS;
            break;

        case HI_UNF_AVPLAY_FRMRATE_TYPE_STREAM:
            enOutType = PTS_FRMRATE_TYPE_STREAM;
            break;

        case HI_UNF_AVPLAY_FRMRATE_TYPE_USER:
            enOutType = PTS_FRMRATE_TYPE_USER;
            break;

        case HI_UNF_AVPLAY_FRMRATE_TYPE_USER_PTS:
            enOutType = PTS_FRMRATE_TYPE_USER_PTS;
            break;

        default:
            HI_ERR_VDEC("%s: unkown unf frame rate type %d.\n", __func__, enInType);
            enOutType = PTS_FRMRATE_TYPE_USER_PTS;
            break;
    }

    return enOutType;
}

static HI_S32 VDEC_SetChanFrameRate(VDEC_CHANNEL_S *pstChan, HI_UNF_AVPLAY_FRMRATE_PARAM_S *pFrmRate)
{
    HI_S32 Ret;
    PTS_FRMRATE_S stFrmRate = {0};

    VDEC_ASSERT_RETURN(pstChan != HI_NULL, HI_FAILURE);
    VDEC_ASSERT_RETURN(pFrmRate != HI_NULL, HI_FAILURE);

    if (pstChan->hChan != HI_INVALID_HANDLE)
    {
        stFrmRate.enFrmRateType = VDEC_UNF_2_VFMW_FRMRATE_TYPE(pFrmRate->enFrmRateType);
        stFrmRate.stSetFrmRate.FpsDecimal = pFrmRate->stSetFrmRate.u32fpsDecimal;
        stFrmRate.stSetFrmRate.FpsInteger = pFrmRate->stSetFrmRate.u32fpsInteger;

        Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_FRAME_RATE_TYPE, &stFrmRate, sizeof(stFrmRate));

        if (Ret != VDEC_OK)
        {
            HI_ERR_VDEC("%s: set frame rate failed!\n", __func__);
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}

HI_S32 VDEC_Chan_SetIDRPts(HI_HANDLE hHandle, HI_U32 u32IDRPts)
{
    HI_S32 s32Ret = HI_FAILURE;
    VDEC_CHANNEL_S *pstChan = NULL;

    if (HI_INVALID_HANDLE == hHandle)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("Bad handle: %d\n", hHandle);
        return HI_FAILURE;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == NULL)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    pstChan->bSetIDRPtsMode = HI_TRUE;
    pstChan->IDRPts = u32IDRPts;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_InitParam(HI_HANDLE hHandle, HI_UNF_AVPLAY_OPEN_OPT_S *pstCapParam)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_CAP_LEVEL_E enCapToFmw = 0;

    if (HI_NULL == pstCapParam)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        pstChan = HI_VMALLOC_VDEC(sizeof(VDEC_CHANNEL_S));

        if (HI_NULL == pstChan)
        {
            HI_ERR_VDEC("No memory\n");
            goto err0;
        }
        else
        {
            memset(pstChan, 0, sizeof(VDEC_CHANNEL_S));
            s_stVdecDrv.astChanEntity[hHandle].pstChan = pstChan;
            s_stVdecDrv.astChanEntity[hHandle].bUsed = HI_TRUE;
        }
    }
    else
    {
        pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    }

    if (pstChan->bInitialized)
    {
        HI_ERR_VDEC("Chan: %d was initialized\n", hHandle);
        return HI_FAILURE;
    }

    pstChan->hVdec = hHandle;
    pstChan->hChan = HI_INVALID_HANDLE;
    pstChan->hStrmBuf = HI_INVALID_HANDLE;
    pstChan->u32StrmBufSize = 0;
    pstChan->hDmxVidChn = HI_INVALID_HANDLE;
    pstChan->u32DmxBufSize = 0;
    pstChan->bNormChange = HI_FALSE;
    pstChan->stNormChangeParam.enNewFormat    = HI_UNF_ENC_FMT_BUTT;
    pstChan->stNormChangeParam.u32ImageWidth  = 0;
    pstChan->stNormChangeParam.u32ImageHeight = 0;
    pstChan->stNormChangeParam.u32FrameRate   = 0;
    pstChan->stNormChangeParam.bProgressive = HI_FALSE;
    pstChan->stIFrame.st2dBuf.u32Size = 0;
    pstChan->bNewFrame = HI_FALSE;
    pstChan->bFramePackingChange = HI_FALSE;
    pstChan->bNewSeq = HI_FALSE;
    pstChan->bNewUserData = HI_FALSE;
    pstChan->bIFrameErr = HI_FALSE;
    pstChan->bErrorFrame = HI_FALSE;
    pstChan->bUnSupportStream = HI_FALSE;
    pstChan->pstUsrData = HI_NULL;
    pstChan->stFrameRateParam.enFrmRateType = HI_UNF_AVPLAY_FRMRATE_TYPE_PTS;
    pstChan->stFrameRateParam.stSetFrmRate.u32fpsInteger = 25;
    pstChan->stFrameRateParam.stSetFrmRate.u32fpsDecimal = 0;
    pstChan->bSetEosFlag = HI_FALSE;
    pstChan->bProcRegister = HI_FALSE;
    pstChan->u8ResolutionChange = 0;
    pstChan->s32Speed = 1024;
    pstChan->u32FrameCnt = 0;
    pstChan->bIsIFrameDec = HI_FALSE;
    pstChan->u32ErrRatio = 0;
    pstChan->u32LastFrmId = -1;
    pstChan->OmxTunnelMode = s_stVdecDrv.astChanEntity[hHandle].u32TunnelModeEn;
    pstChan->hOmxChn = HI_INVALID_HANDLE;
    /* Get proper buffer size */
    enCapToFmw = VDEC_CapLevelUnfToFmw(pstCapParam);
    pstChan->enCapToFmw = enCapToFmw;
    pstChan->stOption.eAdapterType = ADAPTER_TYPE_VDEC;
    pstChan->stOption.Purpose = PURPOSE_DECODE;
    pstChan->stOption.MemAllocMode = MODE_PART_BY_SDK;
    pstChan->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_FALSE;
    pstChan->stOption.u32DFSEn = ((MaskCtrlWord & 0x1) == 1) ? 0 : s_stVdecDrv.astChanEntity[hHandle].u32DFBEn;
    //pstChan->stOption.s32ExtraFrameStoreNum = PLUS_FS_NUM + 1;
    //pstChan->stOption.s32DelayTime = 0;
    //pstChan->stOption.u32CfgFrameNum = 0;
    pstChan->stOption.u32MaxMemUse = -1;
    pstChan->stOption.s32MaxSliceNum = 136;
    pstChan->stOption.s32MaxSpsNum = 32;
    pstChan->stOption.s32MaxPpsNum = 256;
    pstChan->stOption.s32SupportBFrame = 1;
    pstChan->stOption.s32SupportH264 = 1;
    pstChan->stOption.s32ReRangeEn = 1;     /* Support rerange frame buffer when definition change */
    pstChan->stOption.s32SlotWidth = 0;
    pstChan->stOption.s32SlotHeight = 0;

    pstChan->stOption.s32SCDBufSize = HI_VDEC_SCD_BUFSIZE_IN_KB * 1024;

#ifdef HI_HDR_DOLBYVISION_SUPPORT
    pstChan->stVdecHdrAttr.enVdecHDRType = HI_VDEC_HDR_CHAN_TYPE_BUTT;
    pstChan->stVdecHdrAttr.AvplayHDRAttr.enHDRStreamType = HI_UNF_AVPLAY_HDR_STREAM_TYPE_BUTT;
#endif

    if (HI_FALSE == pstChan->bProcRegister)
    {
    #ifdef HI_PROC_SUPPORT
        HI_S32 s32Ret;
        s32Ret = VDEC_RegChanProc(hHandle);

        if (HI_SUCCESS == s32Ret)
        {
            pstChan->bProcRegister = HI_TRUE;
        }
        else
        {
            pstChan->bProcRegister = HI_FALSE;
        }
    #endif
    }

    pstChan->stCurCfg = s_stVdecDrv.stDefCfg;
    pstChan->enDisplayNorm = HI_UNF_ENC_FMT_BUTT;
    pstChan->stLastFrm.eFrmType = HI_DRV_FT_BUTT;
    pstChan->u32ValidPtsFlag = 0;
    pstChan->stUserCfgCap = *pstCapParam;
    pstChan->bInitialized = HI_TRUE;
    pstChan->u32BackwardOptimizeFlag = HI_FALSE;
    pstChan->s32GetFirstFrameFlag = HI_FALSE;
    pstChan->s32GetFirstIFrameFlag = HI_FALSE;
    pstChan->s32ImageDistance = HI_FALSE;
    pstChan->s32LastFrameGopNum = -1;
    INIT_LIST_HEAD(&(pstChan->FrameList));

    VDEC_InitSpinLock(&(pstChan->FrameListLock));

    HI_INFO_VDEC("Chan %d alloc OK!\n", hHandle);
    return HI_SUCCESS;

err0:
    return HI_FAILURE;
}

static HI_S32 VDEC_Chan_AllocHandle(HI_HANDLE *phHandle, struct file *pstFile)
{
    HI_U32 i;
    HI_UNF_AVPLAY_OPEN_OPT_S stCapParam;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_U32 StartTime = 0;

    StartTime = VDEC_GetTimeInMs();

    if (HI_NULL == phHandle)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_ASSERT_RETURN(pstFile != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    memset(&stCapParam, 0, sizeof(HI_UNF_AVPLAY_OPEN_OPT_S));

    /* Check ready flag */
    if (s_stVdecDrv.bReady != HI_TRUE)
    {
        HI_ERR_VDEC("Need open first!\n");
        return HI_ERR_VDEC_NOT_OPEN;
    }

    down(&(s_stVdecDrv.stVdecChanSem));
    down(&(s_stVdecDrv.stSem));

    /* Check channel number */
    if ((s_stVdecDrv.u32ChanNum >= HI_VDEC_MAX_INSTANCE_NEW)
        || (s_stVdecDrv.u32ChanNum >= s_stVdecDrv.stVdecCap.s32MaxChanNum))
    {
        HI_ERR_VDEC("Too many chans:%d!\n", s_stVdecDrv.u32ChanNum);
        goto err0;
    }

    /* Allocate new channel */
    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        if (HI_FALSE == s_stVdecDrv.astChanEntity[i].bUsed)
        {
            s_stVdecDrv.astChanEntity[i].bUsed = HI_TRUE;
            s_stVdecDrv.astChanEntity[i].pstChan = HI_NULL;
            s_stVdecDrv.astChanEntity[i].eCallBack = 0;
            s_stVdecDrv.astChanEntity[i].DmxHdlCallBack = 0;
            s_stVdecDrv.astChanEntity[i].u64File = (HI_U64)HI_NULL;
            atomic_set(&s_stVdecDrv.astChanEntity[i].atmUseCnt, 0);
            atomic_set(&s_stVdecDrv.astChanEntity[i].atmRlsFlag, 0);
            break;
        }
    }

    if (i >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("Too many chans!\n");
        goto err0;
    }

    s_stVdecDrv.astChanEntity[i].pstChan = HI_NULL;
    s_stVdecDrv.astChanEntity[i].u64File = (HI_U64)(HI_SIZE_T)pstFile;
    s_stVdecDrv.u32ChanNum++;
    *phHandle = (HI_ID_VDEC << 16) | i;

    if (HI_NULL == s_stVdecDrv.astChanEntity[i].pstChan)
    {
        pstChan = HI_VMALLOC_VDEC(sizeof(VDEC_CHANNEL_S));

        if (HI_NULL == pstChan)
        {
            HI_ERR_VDEC("No memory\n");
            goto err1;
        }
        else
        {
            /* Initialize the channel attributes */
            memset(pstChan, 0, sizeof(VDEC_CHANNEL_S));
            pstChan->hVdec = HI_INVALID_HANDLE;
            pstChan->hChan = HI_INVALID_HANDLE;
            pstChan->bTvp  = HI_FALSE;
            pstChan->bWakeUp       = HI_FALSE;
            pstChan->bWakeUpVfmw   = HI_FALSE;
            pstChan->VfmwMagicWord = EXTERNAL_CONFIG_MAGIC_STEP;
            VDEC_InitEvent(pstChan->WaitQueue);
        }
    }

    s_stVdecDrv.astChanEntity[i].pstChan = pstChan;
    up(&(s_stVdecDrv.stSem));
    up(&(s_stVdecDrv.stVdecChanSem));
    g_KpiInfo.Creat = VDEC_GetTimeInMs() - StartTime;

    return HI_SUCCESS;

err1:
    s_stVdecDrv.u32ChanNum--;
    s_stVdecDrv.astChanEntity[i].bUsed = HI_FALSE;

err0:
    up(&s_stVdecDrv.stSem);
    up(&s_stVdecDrv.stVdecChanSem);

    return HI_FAILURE;
}

static HI_S32 VDEC_Chan_FreeHandle(HI_HANDLE hHandle)
{
    HI_S32 s32Ret = HI_FAILURE;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("Invalid handle :%d\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan != NULL && pstChan->hChan != HI_INVALID_HANDLE)
    {
        s32Ret = VDEC_Chan_Free(hHandle);

        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("Chan: %d call VDEC_Chan_Free failed\n", hHandle);
            return HI_FAILURE;
        }
    }

    VDEC_CHAN_RLS_DOWN(&s_stVdecDrv.astChanEntity[hHandle], msecs_to_jiffies(10));

    down(&(s_stVdecDrv.stVdecChanSem));
    down(&(s_stVdecDrv.stSem));

    if (s_stVdecDrv.u32ChanNum > 0)
    {
        s_stVdecDrv.u32ChanNum--;
    }

    s_stVdecDrv.astChanEntity[hHandle].bUsed = HI_FALSE;
    s_stVdecDrv.astChanEntity[hHandle].pstChan = HI_NULL;
    s_stVdecDrv.astChanEntity[hHandle].u64File = (HI_U64)HI_NULL;

    if (pstChan)
    {
        HI_VFREE_VDEC(pstChan);
    }

    up(&(s_stVdecDrv.stSem));
    up(&(s_stVdecDrv.stVdecChanSem));

    VDEC_CHAN_RLS_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

#ifdef HI_TEE_SUPPORT
HI_S32 VDEC_Chan_AllocMemForTEE(VDEC_CHANNEL_S *pstChan, HI_HANDLE hHandle)
{
    if (pstChan->stMemSize.ScdDetailMem > 0)
    {
        if (HI_SUCCESS != HI_DRV_VDEC_Alloc_TVP("VDEC_Sec_Eos", HI_NULL, HI_VDEC_EOS_MEM_SIZE, 0, &pstChan->stEOSBuffer))
        {
            HI_ERR_VDEC("Chan %d alloc SEC Eos Mem err!\n", hHandle);
            return HI_FAILURE;;
        }
    }

    if (1 != pstChan->stOption.u32DFSEn)
    {
        if (pstChan->stMemSize.VdhDetailMem > 0)
        {
            if (HI_SUCCESS != HI_DRV_VDEC_Alloc_TVP("VDEC_Sec_Vdh", HI_NULL, pstChan->stMemSize.VdhDetailMem, 0, &pstChan->stVDHMMZBuf))
            {
                HI_ERR_VDEC("Chan %d alloc SEC vdh Mem err!\n", hHandle);
                HI_DRV_VDEC_Release_TVP(&pstChan->stEOSBuffer);
                return HI_FAILURE;;
            }
        }
    }
    else
    {
        pstChan->stVDHMMZBuf.u32Size = 0;
        pstChan->stVDHMMZBuf.u32StartPhyAddr = HI_NULL;
        pstChan->stVDHMMZBuf.pu8StartVirAddr = HI_NULL;
    }

    pstChan->stOption.Purpose = PURPOSE_DECODE;
    pstChan->stOption.MemDetail.ChanMemCtx.Length  = 0;
    pstChan->stOption.MemDetail.ChanMemCtx.PhyAddr = 0;
    pstChan->stOption.MemDetail.ChanMemCtx.VirAddr = HI_NULL;
    pstChan->stOption.MemDetail.ChanMemScd.Length  = 0;
    pstChan->stOption.MemDetail.ChanMemScd.PhyAddr = 0;
    pstChan->stOption.MemDetail.ChanMemScd.VirAddr = HI_NULL;
    pstChan->stOption.MemDetail.ChanMemVdh.Length  = pstChan->stVDHMMZBuf.u32Size;
    pstChan->stOption.MemDetail.ChanMemVdh.PhyAddr = pstChan->stVDHMMZBuf.u32StartPhyAddr;
    pstChan->stOption.MemDetail.ChanMemVdh.VirAddr = HI_NULL;

    return HI_SUCCESS;
}
#endif

HI_VOID AllocVFMWMemGetVDHSize(VDEC_CHANNEL_S *pstChan, HI_U32 *p32VDHSize)
{
    *p32VDHSize = pstChan->stMemSize.VdhDetailMem;
    return;
}

HI_S32 VDEC_Chan_AllocVFMWMem(VDEC_CHANNEL_S *pstChan)
{
    HI_S32 s32Ret;

    s32Ret = HI_DRV_VDEC_AllocMem("VFMW_EOS", HI_NULL, HI_VDEC_EOS_MEM_SIZE, 0, &pstChan->stEOSBuffer, pstChan->bTvp, HI_TRUE);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Chan %d alloc VFMW_EOS err! size:%d bTvp:%d\n", pstChan->hVdec, HI_VDEC_EOS_MEM_SIZE, pstChan->bTvp);
        return HI_FAILURE;
    }

    pstChan->stOption.Purpose = PURPOSE_DECODE;
    pstChan->stOption.MemDetail.ChanMemCtx.Length  = 0;
    pstChan->stOption.MemDetail.ChanMemCtx.PhyAddr = 0;
    pstChan->stOption.MemDetail.ChanMemCtx.VirAddr = HI_NULL;
    pstChan->stOption.MemDetail.ChanMemScd.Length  = 0;
    pstChan->stOption.MemDetail.ChanMemScd.PhyAddr = 0;
    pstChan->stOption.MemDetail.ChanMemScd.VirAddr = HI_NULL;
    pstChan->stOption.MemDetail.ChanMemVdh.Length  = 0;
    pstChan->stOption.MemDetail.ChanMemVdh.PhyAddr = 0;
    pstChan->stOption.MemDetail.ChanMemVdh.VirAddr = HI_NULL;

    return HI_SUCCESS;
}

HI_S32 VDEC_Chan_FreeVFMWMem(VDEC_CHANNEL_S *pstChan)
{
    if (HI_NULL == pstChan)
    {
        HI_ERR_VDEC("VDEC_Chan_FreeVFMWMem err, pstChan is null\n");
        return HI_FAILURE;
    }

    HI_DRV_VDEC_ReleaseMem(&pstChan->stEOSBuffer, pstChan->bTvp, HI_TRUE);

    pstChan->stEOSBuffer.u32StartPhyAddr = 0;
    pstChan->stEOSBuffer.pu8StartVirAddr = 0;
    pstChan->stEOSBuffer.u32Size = 0;

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_Create(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    HI_S8 as8TmpBuf[128];
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    IMAGE_INTF_S *pstImageIntf  = HI_NULL;
    STREAM_INTF_S *pstStreamIntf = HI_NULL;
    DEI_MEM_QUERY_INTF_S *pDeiMemQueryIntf = HI_NULL;

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_NULL == pstChan)
    {
        HI_ERR_VDEC("VDEC_Chan_Create err , chan %d invalid!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan->stOption.s32IsSecMode = pstChan->bTvp;

    /*1:alloc memory for vfmw*/
    s32Ret = VDEC_Chan_AllocVFMWMem(pstChan);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_Chan_AllocMem err , no memory!\n");
        return HI_FAILURE;
    }

#if 0

    //vc1 have resolution 2048*1536,if donnot set this vdh will write out of buffer
    if (HI_UNF_VCODEC_TYPE_VC1 == pstChan->stCurCfg.enType)
    {
        pstChan->stOption.s32MaxWidth  = 2048;
        pstChan->stOption.s32MaxHeight = 1536;
    }

#endif

    pstChan->stOption.s32ScdInputMmuEn = SCD_INPUT_SMMU;
    pstChan->VfmwMagicWord += EXTERNAL_CONFIG_MAGIC_STEP;
    ((HI_U64 *)as8TmpBuf)[0] = (HI_U64)pstChan->enCapToFmw;
    ((HI_U64 *)as8TmpBuf)[1] = (HI_U64)(HI_SIZE_T)(&pstChan->stOption);

    /*2:create vfmw channel*/
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(HI_INVALID_HANDLE, VDEC_CID_CREATE_CHAN, as8TmpBuf, sizeof(as8TmpBuf));

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VFMW CREATE_CHAN_WITH_OPTION err!\n");
        goto free_vfmw_mem;
    }

    /* Record hHandle */
    pstChan->hChan = *(HI_U32 *)as8TmpBuf;
    pstChan->enCurState = VDEC_CHAN_STATE_STOP;
    HI_INFO_VDEC("Create channel success:%d!\n", pstChan->hChan);

    /* 3:Set interface of read/release stream buffer */
    pstStreamIntf = &pstChan->stStrmIntf;
    pstStreamIntf->stream_provider_inst_id = hHandle;
    pstStreamIntf->read_stream = VDEC_Chan_RecvStrmBuf;
    pstStreamIntf->release_stream = VDEC_Chan_RlsStrmBuf;
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_STREAM_INTF, pstStreamIntf, sizeof(STREAM_INTF_S));

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("Chan %d SET_STREAM_INTF err!\n", hHandle);
        goto destory_vfmw;
    }

    pDeiMemQueryIntf = &(pstChan->deiMemQueryIntf);
    pDeiMemQueryIntf->inst_id = hHandle;
    pDeiMemQueryIntf->query_dei_mem_size = VDEC_Chan_QueryDeiMem;
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_DEIMEMQUERY_INTF, pDeiMemQueryIntf, sizeof(DEI_MEM_QUERY_INTF_S));
    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("Chan %d SET_DEIMEM_INTF err!\n", hHandle);
        goto destory_vfmw;
    }

    pstImageIntf = &pstChan->stImageIntf;
    pstImageIntf->image_provider_inst_id = pstChan->hChan;
    pstImageIntf->read_image = s_stVdecDrv.pVfmwFunc->pfnVfmwGetImage;
    pstImageIntf->release_image = s_stVdecDrv.pVfmwFunc->pfnVfmwReleaseImage;

    /* Set PTS module frame rate */
    s32Ret = VDEC_SetChanFrameRate(pstChan, &pstChan->stFrameRateParam);

    if (s32Ret != VDEC_OK)
    {
        HI_ERR_VDEC("VFMW set frame rate type failed!\n");
    }

    return HI_SUCCESS;

destory_vfmw:
    (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_DESTROY_CHAN, HI_NULL, 0);
    pstChan->hChan = HI_INVALID_HANDLE;

free_vfmw_mem:
    VDEC_Chan_FreeVFMWMem(pstChan);

    return HI_FAILURE;
}

static HI_S32 VDEC_Chan_Destroy(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;

    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_NULL == pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    /* Destroy VFMW decode channel */
    if (HI_INVALID_HANDLE != pstChan->hChan)
    {
        s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_DESTROY_CHAN, HI_NULL, 0);

        if (VDEC_OK != s32Ret)
        {
            HI_ERR_VDEC("Chan %d DESTROY_CHAN err!\n", hHandle);
            return HI_FAILURE;
        }

        pstChan->hChan = HI_INVALID_HANDLE;
        /*free vfmw channel mem*/
        s32Ret = VDEC_Chan_FreeVFMWMem(pstChan);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("VDEC_Chan_FreeVFMWMem err:%d \n", s32Ret);
        }
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_Free(HI_HANDLE hHandle)
{
    HI_S32 s32Ret = HI_FAILURE;

    VDEC_CHANNEL_S *pstChan = HI_NULL;

    s32Ret = HI_DRV_VDEC_ChanStop(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("INFO: VDEC_Chan_Free call HI_DRV_VDEC_ChanStop %d err !\n", hHandle);
        return HI_FAILURE;
    }

    VDEC_CHAN_RLS_DOWN(&s_stVdecDrv.astChanEntity[hHandle], msecs_to_jiffies(10));

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("INFO: %d use too long !\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_RLS_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    s32Ret = VDEC_Chan_Destroy(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_Chan_Destroy err! s32Ret:%#x\n", s32Ret);
    }

    /* Remove proc interface */
    if (HI_TRUE == pstChan->bProcRegister)
    {
    #ifdef HI_PROC_SUPPORT
        VDEC_UnRegChanProc(hHandle);
        pstChan->bProcRegister = HI_FALSE;
    #endif
    }

#ifdef TEST_VDEC_SAVEFILE
    VDEC_Dbg_CloseSaveFile(hHandle);
#endif

    /* Free I frame 2d buffer */
    if (0 != pstChan->stIFrame.st2dBuf.u32Size)
    {
        HI_DRV_VDEC_UnmapAndRelease(&pstChan->stIFrame.st2dBuf);
        pstChan->stIFrame.st2dBuf.u32Size = 0;
    }

    /* Free user data */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_GlobalFree(hHandle);
#endif


    /* Free resource */
    //if (pstChan)
    //{
    if (pstChan->pstUsrData)
    {
        HI_KFREE_VDEC(pstChan->pstUsrData);
    }

#if 0
    HI_VFREE_VDEC(pstChan);
#endif
    //}

    VDEC_CHAN_RLS_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    HI_INFO_VDEC("Chan %d free OK!\n", hHandle);
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_ChanStart(HI_HANDLE hHandle)
{
    HI_S32 s32Ret = HI_FAILURE;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    MMZ_BUFFER_S stMMZBuffer;
    HI_U32 StartTime = 0;
    HI_U32 StartDecoderTime = 0;

    StartTime = VDEC_GetTimeInMs();

    memset(&stMMZBuffer, 0, sizeof(MMZ_BUFFER_S));
    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan %d Start err , not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_INVALID_HANDLE == s_stVdecDrv.astChanEntity[hHandle].pstChan->hChan)
    {
        pstChan->enCurState = VDEC_CHAN_STATE_STOP;
        s32Ret = VDEC_Chan_Create(hHandle);
        g_KpiInfo.CreateDecoder = VDEC_GetTimeInMs() - StartTime;

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("Chan %d Start err ,VDEC_Chan_Create err! HI_DRV_VPSS_USER_COMMAND_STOP:%d\n", hHandle, s32Ret);
            HI_DRV_VDEC_REPORT_TO_OMX(pstChan, VDEC_MSG_RESP_START_DONE, s32Ret, NULL);
            return HI_FAILURE;
        }
    }

    s32Ret = VDEC_SetAttr(hHandle, pstChan);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("Chan %d SetAttr err!\n", hHandle);
        goto error_1;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Lock %d err!\n", hHandle);
        goto error_1;
    }

    if ((HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
        || (HI_INVALID_HANDLE == s_stVdecDrv.astChanEntity[hHandle].pstChan->hChan))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        goto error_1;
    }

    /* Already running, retrun HI_SUCCESS */
    if (pstChan->enCurState == VDEC_CHAN_STATE_RUN)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_SUCCESS;
    }

    /* Initialize status information*/
    memset(&(pstChan->stStatInfo), 0, sizeof(VDEC_CHAN_STATINFO_S));
    pstChan->bEndOfStrm = HI_FALSE;
    pstChan->eEofReportStatus = EOF_STATUS_NULL;
    pstChan->u32LastFrmId = -1;
    pstChan->u32LastFrmTryTimes = 0;
    pstChan->u8ResolutionChange = 0;

    pstChan->s32Speed = 1024;
    pstChan->bSetEosFlag = HI_FALSE;
    pstChan->bWakeUpVfmw = HI_TRUE;

    StartDecoderTime = VDEC_GetTimeInMs();

    /* Start VFMW channel */
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_START_CHAN, HI_NULL, 0);

    if (VDEC_OK != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d VDEC_CID_START_CHAN err!\n", pstChan->hChan);
        goto error_1;
    }

    g_KpiInfo.StartDecoder = VDEC_GetTimeInMs() - StartDecoderTime;

    /* Start user data channel */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_Start(hHandle);
#endif

    /* Save state */
    pstChan->enCurState = VDEC_CHAN_STATE_RUN;
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    HI_INFO_VDEC("Chan %d start OK\n", hHandle);
    HI_DRV_VDEC_REPORT_TO_OMX(pstChan, VDEC_MSG_RESP_START_DONE, s32Ret, &(pstChan->hChan));
    pstChan->stStatInfo.u32ChanStartTime = VDEC_GetTimeInMs();
    g_KpiInfo.ChanStartTime = pstChan->stStatInfo.u32ChanStartTime;

    return HI_SUCCESS;

error_1:
    s32Ret = HI_DRV_VDEC_ChanStop(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("inter HI_DRV_VDEC_ChanStop err!\n");
    }

    HI_DRV_VDEC_REPORT_TO_OMX(pstChan, VDEC_MSG_RESP_START_DONE, s32Ret, NULL);
    return HI_FAILURE;
}

HI_S32 HI_DRV_VDEC_ChanStop(HI_HANDLE hHandle)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 i = 0;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        s32Ret = HI_FAILURE;
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    g_CHAN_FRAME_RATE[hHandle] = 0;

#if 0
    /* Already stop, retrun HI_SUCCESS */
    if (pstChan->enCurState == VDEC_CHAN_STATE_STOP)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_SUCCESS;
    }
#endif

    /* Stop VFMW */
    if (HI_INVALID_HANDLE != pstChan->hChan)
    {
        for (i = 0; i < 50; i++)
        {
            s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_STOP_CHAN, HI_NULL, 0);

            if (VDEC_OK != s32Ret)
            {
                msleep(10);
                HI_ERR_VDEC("VDEC_CID_STOP_CHAN err!\n");
                continue;
            }
            else
            {
                break;
            }
        }
    }

    if (i == 50)
    {
        HI_ERR_VDEC("VDEC stop vfmw failed, tried more than 50 times\n");
    }

    down(&s_stVdecDrv.stSem);

#if 1
    /* Destroy VFMW decode channel */
    s32Ret = VDEC_Chan_Destroy(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_Chan_Destroy err! s32Ret:%#x\n", s32Ret);
    }

#endif

    pstChan->enCurState = VDEC_CHAN_STATE_STOP;
    up(&s_stVdecDrv.stSem);

    /* Stop user data channel */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_Stop(hHandle);
#endif

    /* Save state */
    pstChan->bEndOfStrm = HI_FALSE;
    pstChan->eEofReportStatus = EOF_STATUS_NULL;
    pstChan->u32LastFrmId = -1;
    pstChan->u32LastFrmTryTimes = 0;
    pstChan->u32ValidPtsFlag = 0;
    pstChan->u8ResolutionChange = 0;

    pstChan->s32Speed = 1024;
    pstChan->bSetEosFlag = HI_FALSE;

    //wake up wait queue
    if (pstChan->WaitQueue.task_list.next != HI_NULL)
    {
        pstChan->bWakeUp = HI_TRUE;
        VDEC_GiveEvent(pstChan->WaitQueue);
    }

    HI_DRV_LD_Stop_Statistics();
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    HI_INFO_VDEC("Chan %d stop ret:%x\n", hHandle, s32Ret);
    HI_DRV_VDEC_REPORT_TO_OMX(pstChan, VDEC_MSG_RESP_STOP_DONE, s32Ret, NULL);
    return s32Ret;
}

static HI_S32 VDEC_Chan_Reset(HI_HANDLE hHandle, HI_DRV_VDEC_RESET_TYPE_E enType)
{
    VDEC_CHAN_RESET_OPTION_S stResetOption;
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_FAILURE);

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_INVALID_HANDLE != pstChan->hStrmBuf)
    {
        s32Ret = BUFMNG_Reset(pstChan->hStrmBuf);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("Chan %d strm buf reset err!\n", hHandle);
        }
    }

    /* Reset vfmw */
    if (HI_INVALID_HANDLE != pstChan->hChan)
    {
        memset(&stResetOption, 0, sizeof(VDEC_CHAN_RESET_OPTION_S));

        if (pstChan->bKeepSpsPps)
        {
            stResetOption.s32KeepBS = 0;
            stResetOption.s32KeepSPSPPS = 1;
            stResetOption.s32KeepFSP = 1;

            s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_RESET_CHAN_WITH_OPTION, &stResetOption, sizeof(VDEC_CHAN_RESET_OPTION_S));

            if (s32Ret != VDEC_OK)
            {
                HI_ERR_VDEC("Chan %d RESET_CHAN_WITH_OPTION err!\n", pstChan->hChan);
            }
        }
        else
        {
            s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_RESET_CHAN, HI_NULL, 0);

            if (s32Ret != VDEC_OK)
            {
                HI_ERR_VDEC("Chan %d RESET_CHAN err!\n", pstChan->hChan);
            }
        }
    }

    s32Ret = VDEC_ClearFastBackwardList(hHandle, pstChan);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("VDEC_ClearFastBackwardList failed\n");
    }

    /* Reset end frame flag */
    pstChan->bEndOfStrm = HI_FALSE;
    pstChan->eEofReportStatus = EOF_STATUS_NULL;
    pstChan->u32LastFrmId = -1;
    pstChan->u32LastFrmTryTimes = 0;

    pstChan->u32ValidPtsFlag = 0;
    pstChan->u8ResolutionChange = 0;

    pstChan->s32Speed = 1024;
    pstChan->bSetEosFlag = HI_FALSE;
    pstChan->bUnSupportStream = HI_FALSE;
    pstChan->u32FrameCnt = 0;

    pstChan->u32BackwardOptimizeFlag = HI_FALSE;
    pstChan->s32GetFirstFrameFlag = HI_FALSE;
    pstChan->s32GetFirstIFrameFlag = HI_FALSE;
    pstChan->s32ImageDistance = HI_FALSE;
    pstChan->s32LastFrameGopNum = -1;

    memset(&(pstChan->stLastFrm), 0, sizeof(HI_DRV_VIDEO_FRAME_S));
    memset(&(pstChan->stLastDispFrameInfo), 0, sizeof(HI_DRV_VIDEO_FRAME_S));

    /* Reset user data channel */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_GlobalReset(hHandle);
#endif

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    HI_INFO_VDEC("Chan %d reset OK\n", hHandle);
    return HI_SUCCESS;
}

static HI_S32 VDEC_Chan_CheckCfg(VDEC_CHANNEL_S *pstChan, VDEC_VCODEC_ATTR_S *pstCfgParam)
{
    HI_S32 s32Level = 0;
    HI_UNF_VCODEC_ATTR_S *pstCfg = &pstChan->stCurCfg;

    if (pstCfgParam->enType >= HI_UNF_VCODEC_TYPE_BUTT)
    {
        HI_ERR_VDEC("Bad type:%d!\n", pstCfgParam->enType);
        return HI_FAILURE;
    }

    if (pstCfgParam->enMode >= HI_UNF_VCODEC_MODE_BUTT)
    {
        HI_ERR_VDEC("Bad mode:%d!\n", pstCfgParam->enMode);
        return HI_FAILURE;
    }

    if (pstCfgParam->u32ErrCover > 100)
    {
        HI_ERR_VDEC("Bad err_cover:%d!\n", pstCfgParam->u32ErrCover);
        return HI_FAILURE;
    }

    if (pstCfgParam->u32Priority > HI_UNF_VCODEC_MAX_PRIORITY)
    {
        HI_ERR_VDEC("Bad priority:%d!\n", pstCfgParam->u32Priority);
        return HI_FAILURE;
    }

    /* enVdecType can't be set dynamically */
    if (pstCfg->enType != pstCfgParam->enType)
    {
        s32Level |= 1;
    }
    else if ((HI_UNF_VCODEC_TYPE_VC1 == pstCfg->enType)
             && ((pstCfg->unExtAttr.stVC1Attr.bAdvancedProfile != pstCfgParam->unExtAttr.stVC1Attr.bAdvancedProfile)
                 || (pstCfg->unExtAttr.stVC1Attr.u32CodecVersion != pstCfgParam->unExtAttr.stVC1Attr.u32CodecVersion)))
    {
        s32Level |= 1;
    }

    /* priority can't be set dynamically */
    if (pstCfg->u32Priority != pstCfgParam->u32Priority)
    {
        s32Level |= 1;
    }

    return s32Level;
}

HI_S32 DRV_VDEC_SetChanAttr(HI_HANDLE hHandle, VDEC_VCODEC_ATTR_S *pstCfgParam)
{
    HI_S32 s32Ret;
    HI_S32 s32Level;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* check input parameters */
    if (HI_NULL == pstCfgParam)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if ((HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if ((pstChan->OmxTunnelMode) && (pstChan->hOmxChn == HI_INVALID_HANDLE))
    {
        pstChan->hOmxChn = (HI_S32)(pstCfgParam->CodecContext);
    }

    /* Check parameter */
    s32Level = VDEC_Chan_CheckCfg(pstChan, pstCfgParam);

    if (s32Level < 0)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    /* Some parameter can't be set when channel is running */
    if ((pstChan->enCurState != VDEC_CHAN_STATE_STOP) && (s32Level))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d state err:%d!\n", hHandle, pstChan->enCurState);
        return HI_FAILURE;
    }

    //    pstChan->stCurCfg = *pstCfgParam;
    //@sdk fot 64 bit
    pstChan->stCurCfg.bOrderOutput   = pstCfgParam->bOrderOutput;
    pstChan->stCurCfg.enMode         = pstCfgParam->enMode;
    pstChan->stCurCfg.enType         = pstCfgParam->enType;
    pstChan->stCurCfg.s32CtrlOptions = pstCfgParam->s32CtrlOptions;
    pstChan->stCurCfg.u32ErrCover    = pstCfgParam->u32ErrCover;
    pstChan->stCurCfg.u32Priority    = pstCfgParam->u32Priority;
    pstChan->stCurCfg.unExtAttr      = pstCfgParam->unExtAttr;
    pstChan->stCurCfg.pCodecContext  = (HI_VOID *)(HI_SIZE_T)pstCfgParam->CodecContext;

    if (pstChan->enCurState == VDEC_CHAN_STATE_RUN)
    {
        s32Ret = VDEC_SetAttr(hHandle, pstChan);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            HI_ERR_VDEC("Chan %d SetAttr err!\n", hHandle);
            return HI_FAILURE;
        }
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    HI_INFO_VDEC("Chan %d SetAttr OK\n", hHandle);
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetChanAttr(HI_HANDLE hHandle, HI_UNF_VCODEC_ATTR_S *pstCfgParam)
{
    HI_S32 s32Ret;
    VDEC_VCODEC_ATTR_S stVdecVcodecAttr;

    VDEC_ASSERT_RETURN(pstCfgParam != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    stVdecVcodecAttr.bOrderOutput      = pstCfgParam->bOrderOutput;
    stVdecVcodecAttr.CodecContext      = (HI_SIZE_T)pstCfgParam->pCodecContext;
    stVdecVcodecAttr.enMode            = pstCfgParam->enMode;
    stVdecVcodecAttr.enType            = pstCfgParam->enType;
    stVdecVcodecAttr.s32CtrlOptions    = pstCfgParam->s32CtrlOptions;
    stVdecVcodecAttr.u32ErrCover       = pstCfgParam->u32ErrCover;
    stVdecVcodecAttr.u32Priority       = pstCfgParam->u32Priority;
    stVdecVcodecAttr.unExtAttr         = pstCfgParam->unExtAttr;
    s32Ret = DRV_VDEC_SetChanAttr(hHandle, &stVdecVcodecAttr);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("chan %d DRV_VDEC_SetChanAttr fail!\n", hHandle);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

#ifdef HI_HDR_DOLBYVISION_SUPPORT
HI_S32 HI_DRV_VDEC_SetChanHDRAttr(HI_HANDLE hHandle, VDEC_HDR_ATTR_S *vdec_hdr_attr)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* check input parameters */
    if (HI_NULL == vdec_hdr_attr)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if ((HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Set config */
    pstChan->stVdecHdrAttr = *vdec_hdr_attr;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    HI_INFO_VDEC("Chan %d SetHDRAttr OK\n", hHandle);
    return HI_SUCCESS;
}
#endif

HI_S32 DRV_VDEC_GetChanAttr(HI_HANDLE hHandle, VDEC_VCODEC_ATTR_S *pstCfgParam)
{
    HI_S32 s32Ret;

    /* check input parameters */
    if (HI_NULL == pstCfgParam)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstCfgParam->bOrderOutput = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.bOrderOutput;
    pstCfgParam->enMode       = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.enMode;
    pstCfgParam->enType       = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.enType;
    pstCfgParam->s32CtrlOptions = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.s32CtrlOptions;
    pstCfgParam->u32ErrCover    = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.u32ErrCover;
    pstCfgParam->u32Priority    = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.u32Priority;
    pstCfgParam->unExtAttr      = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.unExtAttr;
    pstCfgParam->CodecContext   = (HI_U64)(HI_SIZE_T)(s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg.pCodecContext);
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    HI_INFO_VDEC("Chan %d GetAttr OK\n", hHandle);
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetChanAttr(HI_HANDLE hHandle, HI_UNF_VCODEC_ATTR_S *pstCfgParam)
{
    /* check input parameters */
    if (HI_NULL == pstCfgParam)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    *pstCfgParam = s_stVdecDrv.astChanEntity[hHandle].pstChan->stCurCfg;

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetChanStatusInfo(HI_HANDLE hHandle, VDEC_STATUSINFO_S *pstStatus)
{
    HI_U32 freeSize;
    HI_U32 busySize;
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_STATE_S stChanState = {0};
    BUFMNG_STATUS_S stStatus = {0};
    //HI_DRV_VPSS_PORT_BUFLIST_STATE_S stVpssBufListState = {0};

    /* check input parameters */
    VDEC_ASSERT_RETURN(pstStatus != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    memset(&stChanState, 0, sizeof(VDEC_CHAN_STATE_S));

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);
    VDEC_ASSERT_RETURN(s32Ret == HI_SUCCESS, HI_FAILURE);

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (HI_INVALID_HANDLE != pstChan->hStrmBuf)
    {
        s32Ret = BUFMNG_GetStatus(pstChan->hStrmBuf, &stStatus);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            HI_ERR_VDEC("Chan %d get strm buf status err!\n", hHandle);
            return HI_FAILURE;
        }

        freeSize = stStatus.u32Free;
        busySize = stStatus.u32Used;
        pstStatus->u32BufferSize = pstChan->u32StrmBufSize;
        pstStatus->u32BufferUsed = busySize;
        pstStatus->u32BufferAvailable = stStatus.u32Available;
    }

    pstStatus->u32StrmInBps = pstChan->stStatInfo.u32AvrgVdecInBps;
    pstStatus->u32TotalDecFrmNum = pstChan->stStatInfo.u32TotalVdecOutFrame;
    pstStatus->u32TotalErrFrmNum = pstChan->stStatInfo.u32VdecErrFrame;
    pstStatus->u32TotalErrStrmNum = pstChan->stStatInfo.u32TotalStreamErrNum;

    /* judge if reach end of stream */
    if (HI_INVALID_HANDLE != pstChan->hChan)
    {
        s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_CHAN_STATE, &stChanState, sizeof(stChanState));

        if (VDEC_OK != s32Ret)
        {
            HI_WARN_VDEC("hHandle:%d, Chan %d GET_CHAN_STATE err\n", hHandle, pstChan->hChan);
        }
    }

    pstStatus->u32FrameBufNum = stChanState.wait_disp_frame_num;

    /* Get frame num and stream size vfmw holded */
    pstStatus->u32VfmwFrmNum  = stChanState.decoded_1d_frame_num;
    pstStatus->u32VfmwStrmSize = stChanState.buffered_stream_size;
    pstStatus->stVfmwFrameRate.u32fpsInteger = stChanState.frame_rate / 10;
    pstStatus->stVfmwFrameRate.u32fpsDecimal = stChanState.frame_rate % 10 * 100;
    pstStatus->u32VfmwStrmNum = stChanState.buffered_stream_num;
    pstStatus->u32VfmwTotalDispFrmNum = EXTRA_PVR_FRAME_NUM;
    pstStatus->u32FieldFlag = stChanState.is_field_flg;
    pstStatus->bEndOfStream = (pstChan->bEndOfStrm == HI_TRUE) ? HI_TRUE : HI_FALSE;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

static HI_U32 VDEC_ConvertColorSpaceToUNF(HI_U32 u32ColorSpace)
{
    switch (u32ColorSpace)
    {
        case HI_DRV_CS_UNKNOWN:
            return HI_UNF_COLOR_SPACE_UNKNOWN;

        case HI_DRV_CS_BT601_YUV_LIMITED:
            return HI_UNF_COLOR_SPACE_BT601_YUV_LIMITED;


        case HI_DRV_CS_BT601_YUV_FULL:
            return HI_UNF_COLOR_SPACE_BT601_YUV_FULL;

        case HI_DRV_CS_BT601_RGB_LIMITED:
            return HI_UNF_COLOR_SPACE_BT601_RGB_LIMITED;

        case HI_DRV_CS_BT601_RGB_FULL:
            return HI_UNF_COLOR_SPACE_BT601_RGB_FULL;

        case HI_DRV_CS_NTSC1953:
            return HI_UNF_COLOR_SPACE_NTSC1953;

        case HI_DRV_CS_BT470_SYSTEM_M:
            return HI_UNF_COLOR_SPACE_BT470_SYSTEM_M;

        case HI_DRV_CS_BT470_SYSTEM_BG:
            return HI_UNF_COLOR_SPACE_BT470_SYSTEM_BG;

        case HI_DRV_CS_BT709_YUV_LIMITED:
            return HI_UNF_COLOR_SPACE_BT709_YUV_LIMITED;

        case HI_DRV_CS_BT709_YUV_FULL:
            return HI_UNF_COLOR_SPACE_BT709_YUV_FULL;

        case HI_DRV_CS_BT709_RGB_LIMITED:
            return HI_UNF_COLOR_SPACE_BT709_RGB_LIMITED;

        case HI_DRV_CS_BT709_RGB_FULL:
            return HI_UNF_COLOR_SPACE_BT709_RGB_FULL;

        case HI_DRV_CS_BT2020_YUV_LIMITED:
            return HI_UNF_COLOR_SPACE_BT2020_YUV_LIMITED;

        case HI_DRV_CS_BT2020_YUV_FULL:
            return HI_UNF_COLOR_SPACE_BT2020_YUV_FULL;

        case HI_DRV_CS_BT2020_RGB_LIMITED:
            return HI_UNF_COLOR_SPACE_BT2020_RGB_LIMITED;

        case HI_DRV_CS_BT2020_RGB_FULL:
            return HI_UNF_COLOR_SPACE_BT2020_RGB_FULL;

        case HI_DRV_CS_REC709:
            return HI_UNF_COLOR_SPACE_REC709;

        case HI_DRV_CS_SMPT170M:
            return HI_UNF_COLOR_SPACE_SMPT170M;

        case HI_DRV_CS_SMPT240M:
            return HI_UNF_COLOR_SPACE_SMPT240M;

        case HI_DRV_CS_BT878:
            return HI_UNF_COLOR_SPACE_BT878;

        case HI_DRV_CS_XVYCC:
            return HI_UNF_COLOR_SPACE_XVYCC;

        case HI_DRV_CS_JPEG:
            return HI_UNF_COLOR_SPACE_JPEG;

        default:
            HI_ERR_VDEC("HI_DRV_VDEC_SetColorSpace Unknow type %d,use default!\n");
            return HI_DRV_CS_DEFAULT;
    }

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetUserBuffer(HI_HANDLE hHandle, VDEC_CMD_USER_BUFFER_S *stUserBuffer)
{
    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);
    VDEC_ASSERT_RETURN(stUserBuffer != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    stUserBuffer->u32PhyAddr = s_stVdecDrv.astChanEntity[hHandle].pstChan->stVDHMMZBuf.u32StartPhyAddr;
    stUserBuffer->u32Size    = s_stVdecDrv.astChanEntity[hHandle].pstChan->stVDHMMZBuf.u32Size;

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetChanStreamInfo(HI_HANDLE hHandle, HI_UNF_VCODEC_STREAMINFO_S *pstStreamInfo)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_STATE_S stChanState;

    VDEC_ASSERT_RETURN(pstStreamInfo != HI_NULL, HI_ERR_VDEC_INVALID_PARA);
    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    memset(&stChanState, 0, sizeof(VDEC_CHAN_STATE_S));

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_GET_CHAN_STATE, &stChanState, sizeof(stChanState));

    if (VDEC_OK != s32Ret)
    {
        HI_WARN_VDEC("Chan %d GET_CHAN_STATE err\n", pstChan->hChan);
    }

    pstStreamInfo->enVCodecType  = pstChan->stCurCfg.enType;
    pstStreamInfo->enSubStandard = HI_UNF_VIDEO_SUB_STANDARD_UNKNOWN;
    pstStreamInfo->u32SubVersion = 0;
    pstStreamInfo->u32Profile = stChanState.profile;
    pstStreamInfo->u32Level = stChanState.level;
    pstStreamInfo->enDisplayNorm = pstChan->enDisplayNorm;
    pstStreamInfo->bProgressive = (pstChan->stLastFrm.bProgressive);
    pstStreamInfo->u32AspectWidth = pstChan->stLastFrm.u32AspectWidth;
    pstStreamInfo->u32AspectHeight = pstChan->stLastFrm.u32AspectHeight;
    pstStreamInfo->u32bps = stChanState.bit_rate;
    //pstStreamInfo->u32fpsInteger = pstChan->stLastFrm.stFrameRate.u32fpsInteger;
    //pstStreamInfo->u32fpsDecimal = pstChan->stLastFrm.stFrameRate.u32fpsDecimal;
    pstStreamInfo->u32fpsInteger = pstChan->stLastFrm.u32FrameRate / 1000;
    pstStreamInfo->u32fpsDecimal = pstChan->stLastFrm.u32FrameRate % 1000;
    pstStreamInfo->u32Width  = pstChan->stLastFrm.u32Width;
    pstStreamInfo->u32Height = pstChan->stLastFrm.u32Height;
    pstStreamInfo->u32DisplayWidth   = pstChan->stLastFrm.stDispRect.s32Width;
    pstStreamInfo->u32DisplayHeight  = pstChan->stLastFrm.stDispRect.s32Height;
    pstStreamInfo->u32DisplayCenterX = pstChan->stLastFrm.stDispRect.s32Width / 2;
    pstStreamInfo->u32DisplayCenterY = pstChan->stLastFrm.stDispRect.s32Height / 2;
    pstStreamInfo->enSrcColorSpace = VDEC_ConvertColorSpaceToUNF(((HI_DRV_VIDEO_PRIVATE_S *)(pstChan->stLastFrm.u32Priv))->eColorSpace);

    switch (pstChan->stLastFrm.enBitWidth)
    {
        case HI_DRV_PIXEL_BITWIDTH_8BIT:
            pstStreamInfo->enBitWidth = HI_UNF_PIXEL_BITWIDTH_8BIT;
            break;

        case HI_DRV_PIXEL_BITWIDTH_10BIT:
        case HI_DRV_PIXEL_BITWIDTH_10BIT_CTS:
            pstStreamInfo->enBitWidth = HI_UNF_PIXEL_BITWIDTH_10BIT;
            break;

        case HI_DRV_PIXEL_BITWIDTH_12BIT:
            pstStreamInfo->enBitWidth = HI_UNF_PIXEL_BITWIDTH_12BIT;
            break;

        case HI_DRV_PIXEL_BITWIDTH_BUTT:
            pstStreamInfo->enBitWidth = HI_UNF_PIXEL_BITWIDTH_BUTT;
            break;

        default:
            pstStreamInfo->enBitWidth = HI_UNF_PIXEL_BITWIDTH_8BIT;
            break;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_CheckNewEvent(HI_HANDLE hHandle, VDEC_EVENT_S *pstEvent)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    /* check input parameters */
    VDEC_ASSERT_RETURN(pstEvent != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);
    VDEC_ASSERT_RETURN(s32Ret == HI_SUCCESS, HI_FAILURE);

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == HI_NULL)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* Check norm change event */
    if (pstChan->bNormChange)
    {
        pstChan->bNormChange = HI_FALSE;
        pstEvent->bNormChange = HI_TRUE;
        pstEvent->stNormChangeParam = pstChan->stNormChangeParam;
    }
    else
    {
        pstEvent->bNormChange = HI_FALSE;
    }

    /* Check error frame event */
    pstEvent->bErrorFrame = pstChan->bErrorFrame;
    pstChan->bErrorFrame = HI_FALSE;

    /* Check frame packing event */
    if (pstChan->bFramePackingChange)
    {
        pstChan->bFramePackingChange = HI_FALSE;
        pstEvent->bFramePackingChange = HI_TRUE;
        pstEvent->enFramePackingType = pstChan->enFramePackingType;
    }
    else
    {
        pstEvent->bFramePackingChange = HI_FALSE;
        pstEvent->enFramePackingType = HI_UNF_FRAME_PACKING_TYPE_NONE;
    }

    /* Check new frame event */
    if (pstChan->bNewFrame)
    {
        pstChan->bNewFrame = HI_FALSE;
        pstEvent->bNewFrame = HI_TRUE;
    }
    else
    {
        pstEvent->bNewFrame = HI_FALSE;
    }

    /* Check new seq event */
    if (pstChan->bNewSeq)
    {
        pstChan->bNewSeq = HI_FALSE;
        pstEvent->bNewSeq = HI_TRUE;
    }
    else
    {
        pstEvent->bNewSeq = HI_FALSE;
    }

    /* Check new user data event */
    if (pstChan->bNewUserData)
    {
        pstChan->bNewUserData = HI_FALSE;
        pstEvent->bNewUserData = HI_TRUE;
    }
    else
    {
        pstEvent->bNewUserData = HI_FALSE;
    }

    /* Check I frame err event */
    if (pstChan->bIFrameErr)
    {
        pstChan->bIFrameErr = HI_FALSE;
        pstEvent->bIFrameErr = HI_TRUE;
    }
    else
    {
        pstEvent->bIFrameErr = HI_FALSE;
    }

    if (pstChan->bFirstValidPts)
    {
        pstChan->bFirstValidPts = HI_FALSE;
        pstEvent->bFirstValidPts = HI_TRUE;
        pstEvent->u32FirstValidPts = pstChan->u32FirstValidPts;
    }

    if (pstChan->bSecondValidPts)
    {
        pstChan->bSecondValidPts = HI_FALSE;
        pstEvent->bSecondValidPts = HI_TRUE;
        pstEvent->u32SecondValidPts = pstChan->u32SecondValidPts;
    }

    if (pstChan->bUnSupportStream)
    {
        pstChan->bUnSupportStream = HI_FALSE;
        pstEvent->bUnSupportStream = HI_TRUE;
    }
    else
    {
        pstEvent->bUnSupportStream = HI_FALSE;
    }

    if (0 != pstChan->u32ErrRatio)
    {
        pstEvent->u32ErrRatio = pstChan->u32ErrRatio;
        pstChan->u32ErrRatio = 0;
    }
    else
    {
        pstEvent->u32ErrRatio = 0;
    }

    if (pstChan->stProbeStreamInfo.bProbeCodecTypeChangeFlag)
    {
        pstChan->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_FALSE;
        pstEvent->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_TRUE;
        pstEvent->stProbeStreamInfo.enCodecType = pstChan->stProbeStreamInfo.enCodecType;
    }
    else
    {
        pstEvent->stProbeStreamInfo.bProbeCodecTypeChangeFlag = HI_FALSE;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 DRV_VDEC_GetUsrData(HI_HANDLE hHandle, VDEC_VIDEO_USERDATA_S *pstUsrData)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    VDEC_ASSERT_RETURN(pstUsrData != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    /* If pstUsrData is null, it must be none user data */
    if (HI_NULL == pstChan->pstUsrData)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d none user data!\n", hHandle);
        return HI_FAILURE;
    }

    if (pstChan->pstUsrData->u32ReadID >= VDEC_UDC_MAX_NUM)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d u32ReadID %d too large!\n", hHandle, pstChan->pstUsrData->u32ReadID);
        return HI_FAILURE;
    }

    /* Copy usrdata data */
    s32Ret = copy_to_user((HI_U8 *)(HI_SIZE_T)pstUsrData->pu8Buffer,
                          pstChan->pstUsrData->au8Buf[pstChan->pstUsrData->u32ReadID],
                          pstChan->pstUsrData->stAttr[pstChan->pstUsrData->u32ReadID].u32Length);

    if (s32Ret != 0)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d copy_to_user err!\n", hHandle);
        return HI_FAILURE;
    }

    /* copy usrdata attribute */
    memcpy(pstUsrData,
           &pstChan->pstUsrData->stAttr[pstChan->pstUsrData->u32ReadID],
           sizeof(HI_UNF_VIDEO_USERDATA_S));
    pstChan->pstUsrData->u32ReadID = (pstChan->pstUsrData->u32ReadID + 1) % VDEC_UDC_MAX_NUM;
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetUsrData(HI_HANDLE hHandle, HI_UNF_VIDEO_USERDATA_S *pstUsrData)
{
    HI_S32 s32Ret;
    VDEC_VIDEO_USERDATA_S stVdecUsrData = {0};

    VDEC_ASSERT_RETURN(pstUsrData != HI_NULL, HI_ERR_VDEC_INVALID_PARA);

    hHandle = hHandle & 0xff;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    memset(&stVdecUsrData, 0, sizeof(VDEC_VIDEO_USERDATA_S));

    s32Ret = DRV_VDEC_GetUsrData(hHandle, &stVdecUsrData);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("vdec call HI_DRV_VDEC_GetUsrData err\n");
        return HI_FAILURE;
    }

    pstUsrData->bBufferOverflow      = stVdecUsrData.bBufferOverflow;
    pstUsrData->bTopFieldFirst       = stVdecUsrData.bTopFieldFirst;
    pstUsrData->enBroadcastProfile   = stVdecUsrData.enBroadcastProfile;
    pstUsrData->enPositionInStream   = stVdecUsrData.enPositionInStream;
    pstUsrData->pu8Buffer            = (HI_U8 *)(HI_SIZE_T)stVdecUsrData.pu8Buffer;
    pstUsrData->u32Length            = stVdecUsrData.u32Length;
    pstUsrData->u32Pts               = stVdecUsrData.u32Pts;
    pstUsrData->u32SeqCnt            = stVdecUsrData.u32SeqCnt;
    pstUsrData->u32SeqFrameCnt       = stVdecUsrData.u32SeqFrameCnt;

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetDPBFullCtrl(HI_HANDLE hHandle, HI_BOOL bDPBFullCtrl)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    hHandle &= 0xFF;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan not create!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    pstChan->bDPBFullCtrl = bDPBFullCtrl;
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetUVMOS(HI_HANDLE hHandle, HI_BOOL bUVMOSEnable)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    hHandle &= 0xFF;
    VDEC_ASSERT_RETURN(hHandle < HI_VDEC_MAX_INSTANCE_NEW, HI_ERR_VDEC_INVALID_PARA);

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan not create!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    pstChan->bUVMOSEnable = bUVMOSEnable;
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_KeepSpsPps(HI_HANDLE hHandle, HI_BOOL bKeepSpsPps)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_INVALID_HANDLE == hHandle)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hHandle &= 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("HI_DRV_VDEC_SetLowdelay err hvdec:%d too large!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        HI_ERR_VDEC("Chan not create!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;
    pstChan->bKeepSpsPps = bKeepSpsPps;

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetTrickMode(HI_HANDLE hHandle, HI_UNF_AVPLAY_TPLAY_OPT_S *pstOpt)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_S32 s32Speed;

    /* check input parameters */
    if (HI_NULL == pstOpt)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (VDEC_CHAN_STATE_RUN != pstChan->enCurState)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d isn't runnig!\n", hHandle);
        return HI_FAILURE;
    }

    s32Speed = (pstOpt->u32SpeedInteger * 1000 + pstOpt->u32SpeedDecimal) * 1024 / 1000;

    if (HI_UNF_AVPLAY_TPLAY_DIRECT_BACKWARD == pstOpt->enTplayDirect)
    {
        s32Speed = -s32Speed;
    }

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_TRICK_MODE, &s32Speed, sizeof(s32Speed));

    if (VDEC_OK != s32Ret)
    {
        HI_ERR_VDEC("VFMW Chan %d set trick mode err\n", pstChan->hChan);
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    pstChan->s32Speed = s32Speed;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_SetCtrlInfo(HI_HANDLE hHandle, HI_UNF_AVPLAY_CONTROL_INFO_S *pstCtrlInfo)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VFMW_CONTROLINFO_S stInfo;

    /* check input parameters */
    if (HI_NULL == pstCtrlInfo)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (VDEC_CHAN_STATE_RUN != pstChan->enCurState)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_WARN_VDEC("Chan %d isn't runnig!\n", hHandle);
        return HI_FAILURE;
    }

    stInfo.u32IDRFlag = pstCtrlInfo->u32IDRFlag;
    stInfo.u32BFrmRefFlag = pstCtrlInfo->u32BFrmRefFlag;
    stInfo.u32ContinuousFlag = pstCtrlInfo->u32ContinuousFlag;
    stInfo.u32BackwardOptimizeFlag = pstCtrlInfo->u32BackwardOptimizeFlag;
    stInfo.u32DispOptimizeFlag = pstCtrlInfo->u32DispOptimizeFlag;

    pstChan->u32BackwardOptimizeFlag = pstCtrlInfo->u32BackwardOptimizeFlag;

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_CTRL_INFO, &stInfo, sizeof(stInfo));

    if (VDEC_OK != s32Ret)
    {
        HI_ERR_VDEC("VFMW Chan %d set ctrl info err\n", pstChan->hChan);
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    return HI_SUCCESS;
}

static HI_S32 VDEC_IFrame_GetStrm(HI_S32 hHandle, HI_VOID *pStreamPacket)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    STREAM_DATA_S *pstPacket = (STREAM_DATA_S *)(pStreamPacket);

    if (HI_NULL == pstPacket)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("bad handle %d!\n", hHandle);
        return HI_FAILURE;
    }

    s32Ret = VDEC_CHAN_TRY_USE_DOWN_HELP(&s_stVdecDrv.astChanEntity[hHandle], __func__, __LINE__);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan->stIFrame.u32ReadTimes >= VDEC_IFRAME_MAX_READTIMES)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        return HI_FAILURE;
    }

    pstPacket->PhyAddr = pstChan->stIFrame.stMMZBuf.u32StartPhyAddr;
    pstPacket->VirAddr = (HI_U64)(HI_SIZE_T)(pstChan->stIFrame.stMMZBuf.pu8StartVirAddr);
    pstPacket->Length = pstChan->stIFrame.stMMZBuf.u32Size;
    pstPacket->Pts = 0;
    pstPacket->Index = 0;
    pstPacket->is_not_last_packet_flag = 0;
    pstPacket->UserTag = 0;
    pstPacket->is_stream_end_flag = 0;

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    pstChan->stIFrame.u32ReadTimes++;
    return HI_SUCCESS;
}

static HI_S32 VDEC_IFrame_PutStrm(HI_S32 hHandle, HI_VOID *pstPacket)
{
    return HI_SUCCESS;
}

static HI_S32 VDEC_IFrame_SetAttr(VDEC_CHANNEL_S *pstChan, HI_UNF_VCODEC_TYPE_E type)
{
    HI_S32 s32Ret;
    VDEC_CHAN_CFG_S stVdecChanCfg   = {0};

    if (HI_NULL == pstChan)
    {
        HI_ERR_VDEC("Invalid parameter!\n");
        return HI_FAILURE;
    }

    if (HI_INVALID_HANDLE == pstChan->hChan)
    {
        HI_ERR_VDEC("Invalid parameter!\n");
        return HI_FAILURE;
    }

    stVdecChanCfg.s32ExtraFrameStoreNum = 0;
    stVdecChanCfg.eVidStd = VDEC_CodecTypeUnfToFmw(type);
    stVdecChanCfg.s32ChanPriority = 18;
    stVdecChanCfg.s32ChanErrThr = 100;
    stVdecChanCfg.s32DecMode = I_MODE;
    stVdecChanCfg.s32DecOrderOutput = 1;
    stVdecChanCfg.s32MaxWidth = 1920;
    stVdecChanCfg.s32MaxHeight = 1088;
    stVdecChanCfg.bOnlyOneIFrame = 1;

    stVdecChanCfg.enCompress = GlbCompStrategy;
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_CFG_CHAN, &stVdecChanCfg, sizeof(stVdecChanCfg));

    if (VDEC_OK != s32Ret)
    {
        HI_ERR_VDEC("VFMW CFG_CHAN err!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 VDEC_IFrame_BufInit(HI_U32 u32BufSize, VDEC_CHANNEL_S *pstChan)
{
    VDEC_BUFFER_S *pstMMZBuf = &pstChan->stIFrame.stMMZBuf;
#ifdef HI_TEE_SUPPORT

    if (HI_TRUE == pstChan->bTvp)
    {
        return HI_DRV_VDEC_Alloc_TVP("VDEC_Sec_IFrm", HI_NULL, u32BufSize, 0, pstMMZBuf);
    }
    else
#endif
    {
        return HI_DRV_VDEC_AllocAndMap("VDEC_IFrame", HI_NULL, u32BufSize, 0, pstMMZBuf);
    }
}

static HI_VOID VDEC_IFrame_BufDeInit(VDEC_CHANNEL_S *pstChan)
{
    VDEC_BUFFER_S *pstMMZBuf = &pstChan->stIFrame.stMMZBuf;

#ifdef HI_TEE_SUPPORT

    if (HI_TRUE == pstChan->bTvp)
    {
        HI_DRV_VDEC_Release_TVP(pstMMZBuf);
    }
    else
#endif
    {
        HI_DRV_VDEC_UnmapAndRelease(pstMMZBuf);
    }

    memset(pstMMZBuf, 0, sizeof(MMZ_BUFFER_S));
    return;
}

HI_S32 HI_DRV_VDEC_DecodeIFrame(VDEC_CMD_IFRAME_DEC_64BIT_S *pVDECIFrame, HI_BOOL bUserSpace)
{
    HI_S32 s32Ret, i;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    STREAM_INTF_S stSteamIntf;
    HI_HANDLE hHandle;

    if (HI_NULL == pVDECIFrame)
    {
        HI_ERR_VDEC("bad param\n");
        return HI_FAILURE;
    }

    hHandle = pVDECIFrame->hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("bad handle %d!\n", hHandle);
        return HI_FAILURE;
    }

    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan->enCurState != VDEC_CHAN_STATE_STOP)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d state err:%d!\n", hHandle, pstChan->enCurState);
        return HI_FAILURE;
    }

    if (!VDEC_CHAN_STRMBUF_ATTACHED(pstChan))
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d bad strm buf!\n", hHandle);
        return HI_FAILURE;
    }

    if (HI_INVALID_HANDLE == pstChan->hChan)
    {
        s32Ret = VDEC_Chan_Create(hHandle);

        if (HI_SUCCESS != s32Ret)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            HI_ERR_VDEC("IFrame VDEC_Chan_Create err\n");
            return HI_FAILURE;
        }
    }

    /* Modify the decoder's attributes */
    s32Ret = VDEC_IFrame_SetAttr(pstChan, pVDECIFrame->stIFrame.enType);

    if (HI_SUCCESS != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("IFrame_SetAttr err\n");
        return HI_FAILURE;
    }

    pstChan->bIsIFrameDec = HI_TRUE;

    /* Init I frame buffer */
    pstChan->stIFrame.u32ReadTimes = 0;
    /* malloc the memory to save the stream from user,unmalloc below (OUT1) until read the frame from vfmw successly */
    s32Ret = VDEC_IFrame_BufInit(pVDECIFrame->stIFrame.u32BufSize, pstChan);

    if (HI_SUCCESS != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Alloc IFrame buf err\n");
        goto OUT0;
    }

#ifdef HI_TEE_SUPPORT

    if (HI_TRUE == pstChan->bTvp)
    {
        //memcpy((HI_U8 *)pstChan->stIFrame.stMMZBuf.pu8StartVirAddr, pstStreamInfo->pu8Addr, pstStreamInfo->u32BufSize);
    }
    else
#endif
    {
        if (!bUserSpace)
        {
            /*not from user space : from kernel ddr ,use memcpy is ok*/
            memcpy((HI_U8 *)pstChan->stIFrame.stMMZBuf.pu8StartVirAddr, (HI_U8 *)(HI_SIZE_T)pVDECIFrame->stIFrame.Addr, pVDECIFrame->stIFrame.u32BufSize);
        }
        else
        {
            /*I MODE : the stream from user is one IFrame stream, copy the stream from user space , should use function : copy_from_user*/
            if (0 != copy_from_user((HI_U8 *)pstChan->stIFrame.stMMZBuf.pu8StartVirAddr,
                                    (HI_U8 *)(HI_SIZE_T)pVDECIFrame->stIFrame.Addr, pVDECIFrame->stIFrame.u32BufSize))
            {
                VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
                HI_ERR_VDEC("Chan %d IFrame copy copy from user err!\n");

                goto OUT1;
            }
        }
    }

    /* Set IFrame stream read functions */
    stSteamIntf.stream_provider_inst_id = hHandle;
    stSteamIntf.read_stream = VDEC_IFrame_GetStrm;
    stSteamIntf.release_stream = VDEC_IFrame_PutStrm;
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_SET_STREAM_INTF, &stSteamIntf, sizeof(STREAM_INTF_S));

    if (VDEC_OK != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d SET_STREAM_INTF err!\n", hHandle);
        goto OUT1;
    }

    /* Start decode */
    memset(&pstChan->stStatInfo, 0, sizeof(VDEC_CHAN_STATINFO_S));
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_START_CHAN, HI_NULL, 0);

    if (VDEC_OK != s32Ret)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d START_CHAN err!\n", hHandle);
        goto OUT2;
    }

    pstChan->enCurState = VDEC_CHAN_STATE_RUN;

    /* Here we invoke USE_UP function to release the atomic number, so that the VFMW can decode
      by invoking the interface of get stream, the VDEC_Event_Handle function can also hHandle
      EVNT_NEW_IMAGE */
    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);

    /* wait for vdec process complete */
    for (i = 0; i < 10; i++)
    {
        s32Ret = HI_DRV_VDEC_RecvFrmBufWithTimeOut(hHandle, &(pVDECIFrame->stFrame), 10);
        if (s32Ret == HI_SUCCESS)
        {
            break;
        }

        msleep(10);
    }

    (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_STOP_CHAN, HI_NULL, 0);

    down(&s_stVdecDrv.stSem);
    pstChan->enCurState = VDEC_CHAN_STATE_STOP;
    up(&s_stVdecDrv.stSem);

OUT2:
OUT1:

    /* Free MMZ buffer */
    VDEC_IFrame_BufDeInit(pstChan);
    pstChan->stIFrame.u32ReadTimes = 0;

OUT0:
    /* Resume channel attribute */
    s32Ret = VDEC_SetAttr(hHandle, pstChan);
    s32Ret |= VDEC_Chan_Destroy(hHandle);

    pstChan->bIsIFrameDec = HI_FALSE;

    return s32Ret;
}

HI_S32 HI_DRV_VDEC_ReleaseIFrame(HI_HANDLE hHandle, HI_DRV_VIDEO_FRAME_S *pstFrameInfo)
{
    HI_S32 s32Ret = HI_SUCCESS;
    // VDEC_CHANNEL_S *pstChan = HI_NULL;
    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    return s32Ret;
#if 0

    if (HI_NULL == pstFrameInfo)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    /* Lock */
    VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("Chan %d lock fail!\n", hHandle);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
        HI_ERR_VDEC("Chan %d not init!\n", hHandle);
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (0 != pstChan->stIFrame.st2dBuf.u32Size)
    {
        HI_DRV_MMZ_UnmapAndRelease(&pstChan->stIFrame.st2dBuf);
        pstChan->stIFrame.st2dBuf.u32Size = 0;
    }

    VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    return HI_SUCCESS;
#endif
}

HI_S32 HI_DRV_VDEC_SetLowdelay(HI_HANDLE hVdec, HI_BOOL bLowdelay)
{
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_INVALID_HANDLE == hVdec)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hVdec &= 0xFF;

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("HI_DRV_VDEC_SetLowdelay err hvdec:%d too large!\n", hVdec);
        return HI_FAILURE;
    }

    /* Check and get pstChan pointer */
    if (HI_NULL == s_stVdecDrv.astChanEntity[hVdec].pstChan)
    {
        HI_ERR_VDEC("Chan not create!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pstChan->bLowdelay = bLowdelay;

    if (bLowdelay)
    {
        pstChan->stCurCfg.enMode = HI_UNF_VCODEC_MODE_IP;
        pstChan->stCurCfg.bOrderOutput = 1;
        pstChan->stCurCfg.s32CtrlOptions = (pstChan->stCurCfg.s32CtrlOptions & 0xfffffffe) + 1;
    }
    else
    {
        pstChan->stCurCfg.enMode = HI_UNF_VCODEC_MODE_NORMAL;
        pstChan->stCurCfg.bOrderOutput = 0;
        pstChan->stCurCfg.s32CtrlOptions = (pstChan->stCurCfg.s32CtrlOptions & 0xfffffffe);
    }

    return HI_SUCCESS;
}

#ifdef HI_TEE_SUPPORT
HI_S32 HI_DRV_VDEC_SetTvp(HI_HANDLE hVdec, HI_BOOL bTvp)
{

    VDEC_OPERATION_S stOpt;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (HI_INVALID_HANDLE == hVdec)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    hVdec &= 0xFF;

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("HI_DRV_VDEC_SetTvp err hvdec:%d too large!\n", hVdec);
        return HI_FAILURE;
    }

    if (HI_NULL == s_stVdecDrv.astChanEntity[hVdec].pstChan)
    {
        HI_ERR_VDEC("Chan not create!\n");
        return HI_FAILURE;
    }

    pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;
    pstChan->bTvp = bTvp;

    if (HI_TRUE == pstChan->bTvp)
    {
        memset(&stOpt, 0, sizeof(VDEC_OPERATION_S));
        stOpt.eAdapterType = ADAPTER_TYPE_VDEC;
        stOpt.VdecCallback = VDEC_EventHandle;
        stOpt.mem_malloc = HI_NULL;
        stOpt.mem_free = HI_NULL;
        stOpt.is_secure = HI_TRUE;

        if (HI_SUCCESS != (s_stVdecDrv.pVfmwFunc->pfnVfmwInit)(&stOpt))
        {
            HI_ERR_VDEC("Init trusted vfmw failed\n");
            return HI_FAILURE;
        }
    }

    return HI_SUCCESS;
}
#endif

static HI_S32 VDEC_Ioctl_GetAndCheckHandle(unsigned int cmd, void *arg, HI_HANDLE *pHandle)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    *pHandle = (*((HI_HANDLE *)arg)) & 0xff;

    if ((*pHandle) >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("CMD %d bad handle:%d!\n", cmd, *pHandle);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetUsrData(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = DRV_VDEC_GetUsrData(hHandle, &(((VDEC_CMD_USERDATA_S *)arg)->stUserData));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("DRV_VDEC_GetUsrData err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_IFRMDECODE(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    VDEC_CMD_IFRAME_DEC_64BIT_S *pVDECIFrame = HI_NULL;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    pVDECIFrame = (VDEC_CMD_IFRAME_DEC_64BIT_S *)(arg);

    s32Ret = HI_DRV_VDEC_DecodeIFrame(pVDECIFrame, HI_TRUE);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_DecodeIFrame err!:%d\n", s32Ret);
    }

    s32Ret |= VDEC_Chan_Reset((pVDECIFrame->hHandle & 0xff), VDEC_RESET_TYPE_ALL);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_Reset err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ReleaseIFrame(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_ReleaseIFrame(hHandle, &(((VDEC_CMD_IFRAME_RLS_S *)arg)->stVoFrameInfo));

    if (HI_SUCCESS != s32Ret)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_ReleaseIFrame err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanAlloc(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (((VDEC_CMD_ALLOC_S *)arg)->u32DFBEn > 1)
    {
        ((VDEC_CMD_ALLOC_S *)arg)->u32DFBEn = 0;
    }

    if (((VDEC_CMD_ALLOC_S *)arg)->u32TunnelModeEnable > 1)
    {
        ((VDEC_CMD_ALLOC_S *)arg)->u32TunnelModeEnable = 0;
    }

    s_stVdecDrv.astChanEntity[hHandle].u32DFBEn = 1;
    s_stVdecDrv.astChanEntity[hHandle].u32TunnelModeEn = ((VDEC_CMD_ALLOC_S *)arg)->u32TunnelModeEnable;
    s32Ret = VDEC_Chan_InitParam(hHandle, &(((VDEC_CMD_ALLOC_S *)arg)->stOpenOpt));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_InitParam err!:%d\n", s32Ret);
    }

    *((HI_HANDLE *)arg) = hHandle;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanFree(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_U32 StartTime = 0;

    StartTime = VDEC_GetTimeInMs();

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_Free(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_Free err!:%d\n", s32Ret);
    }

    g_KpiInfo.Destroy = VDEC_GetTimeInMs() - StartTime;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanStart(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_U32 StartTime = 0;

    StartTime = VDEC_GetTimeInMs();

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_ChanStart(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_ChanStart err!:%d\n", s32Ret);
    }

    g_KpiInfo.Start = VDEC_GetTimeInMs() - StartTime;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanStop(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_U32 StartTime = 0;

    StartTime = VDEC_GetTimeInMs();

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_ChanStop(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_ChanStop err!:%d\n", s32Ret);
    }

    g_KpiInfo.Stop = VDEC_GetTimeInMs() - StartTime;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanReset(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_U32 StartTime = 0;

    StartTime = VDEC_GetTimeInMs();

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_Reset(hHandle, ((VDEC_CMD_RESET_S *)arg)->enType);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_Reset err!:%d\n", s32Ret);
    }

    g_KpiInfo.ResetVdec = VDEC_GetTimeInMs() - StartTime;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ChanSetAttr(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = DRV_VDEC_SetChanAttr(hHandle, &(((VDEC_CMD_ATTR_S *)arg)->stAttr));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("DRV_VDEC_SetChanAttr err!:%d\n", s32Ret);
    }

    return s32Ret;
}

#ifdef HI_HDR_DOLBYVISION_SUPPORT
static HI_S32 VDEC_Ioctl_ChanSetHDRAttr(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetChanHDRAttr(hHandle, &(((VDEC_CMD_HDR_ATTR_S *)arg)->vdec_hdr_attr));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetChanHDRAttr err!: %d\n", s32Ret);
    }

    return s32Ret;
}
#endif

static HI_S32 VDEC_Ioctl_ChanGetAttr(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = DRV_VDEC_GetChanAttr(hHandle, &(((VDEC_CMD_ATTR_S *)arg)->stAttr));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("DRV_VDEC_GetChanAttr err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_CreatEsBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hVdec;
    VDEC_BUFFER_S *pstEsBuf = HI_NULL;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    hVdec = ((HI_DRV_VDEC_STREAM_BUF_S *)arg)->hVdec & 0xff;

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("CMD %d bad handle:%d!\n", cmd, hVdec);

        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (s_stVdecDrv.astChanEntity[hVdec].pstChan == NULL)
    {
        HI_INFO_VDEC("pstChan is null!\n");

        return HI_FAILURE;
    }

    if (((HI_DRV_VDEC_STREAM_BUF_S *)arg)->u32Size > MAX_ESBUF_SIZE)
    {
        HI_ERR_VDEC("Create ES_BUFFER size(%d) out of range, MAX_ESBUF_SIZE = %d\n", ((HI_DRV_VDEC_STREAM_BUF_S *)arg)->u32Size, MAX_ESBUF_SIZE);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_CreateStrmBuf((HI_DRV_VDEC_STREAM_BUF_S *)arg);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_CreateStrmBuf err!:%d\n", s32Ret);
    }
    else
    {
        pstEsBuf = &(s_stVdecDrv.astChanEntity[hVdec].pstChan->stEsBuf);
        pstEsBuf->u32StartPhyAddr = ((HI_DRV_VDEC_STREAM_BUF_S *)arg)->u32PhyAddr;
        pstEsBuf->u32Size = ((HI_DRV_VDEC_STREAM_BUF_S *)arg)->u32Size;
        pstEsBuf->pu8StartVirAddr = NULL;
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_DestroyEsBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_DestroyStrmBuf(*((HI_HANDLE *)arg));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_DestroyStrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetEsBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    VDEC_CMD_BUF_S *pstBuf = (VDEC_CMD_BUF_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_GetStrmBuf(pstBuf->hHandle, &(pstBuf->stBuf), HI_TRUE);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_GetStrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_PutEsBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    VDEC_CMD_BUF_S *pstBuf = (VDEC_CMD_BUF_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_PutStrmBuf(pstBuf->hHandle, &(pstBuf->stBuf), HI_TRUE);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_PutStrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetUserAddr(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    VDEC_CMD_BUF_USERADDR_S *pstUserAddr = (VDEC_CMD_BUF_USERADDR_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_StrmBuf_SetUserAddr(pstUserAddr->hHandle, pstUserAddr->u64UserAddr);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_StrmBuf_SetUserAddr err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_RcveiveBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    BUFMNG_BUF_S stEsBuf;
    VDEC_CMD_BUF_S *pstBuf = (VDEC_CMD_BUF_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = BUFMNG_AcqReadBuffer(pstBuf->hHandle, &stEsBuf);

    if (s32Ret == HI_SUCCESS)
    {
        pstBuf->stBuf.u64Addr = (HI_U64)(HI_SIZE_T)stEsBuf.pu8UsrVirAddr;
        pstBuf->stBuf.u32PhyAddr = stEsBuf.u32PhyAddr;
        pstBuf->stBuf.u32BufSize = stEsBuf.u32Size;
        pstBuf->stBuf.u64Pts = stEsBuf.u64Pts;
        pstBuf->stBuf.bEndOfFrame = !(stEsBuf.u32Marker & BUFMNG_NOT_END_FRAME_BIT);
        pstBuf->stBuf.bDiscontinuous = (stEsBuf.u32Marker & BUFMNG_DISCONTINUOUS_BIT) ? 1 : 0;
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_RleaseBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    BUFMNG_BUF_S stEsBuf;
    VDEC_CMD_BUF_S *pstBuf = (VDEC_CMD_BUF_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    stEsBuf.u32PhyAddr = 0;
    stEsBuf.pu8UsrVirAddr = (HI_U8 *)(HI_SIZE_T)pstBuf->stBuf.u64Addr;
    stEsBuf.pu8KnlVirAddr = HI_NULL;
    stEsBuf.u32Size = pstBuf->stBuf.u32BufSize;
    stEsBuf.u64Pts = pstBuf->stBuf.u64Pts;
    /* Don't care stEsBuf.u32Marker here. */
    s32Ret = BUFMNG_RlsReadBuffer(pstBuf->hHandle, &stEsBuf);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("BUFMNG_RlsReadBuffer err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ResetEsBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = BUFMNG_Reset((*((HI_HANDLE *)arg)));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("BUFMNG_Reset err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetStatus(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    BUFMNG_STATUS_S stBMStatus;
    VDEC_CMD_BUF_STATUS_S *pstStatus = (VDEC_CMD_BUF_STATUS_S *)arg;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = BUFMNG_GetStatus(pstStatus->hHandle, &stBMStatus);

    if (s32Ret == HI_SUCCESS)
    {
        pstStatus->stStatus.u32Size = stBMStatus.u32Used + stBMStatus.u32Free;
        pstStatus->stStatus.u32Available = stBMStatus.u32Available;
        pstStatus->stStatus.u32Used = stBMStatus.u32Used;
        pstStatus->stStatus.u32DataNum = stBMStatus.u32DataNum;
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ReleaseFrame(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_RlsFrmBuf(hHandle, &(((VDEC_CMD_VO_FRAME_S *)arg)->stFrame));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_RlsFrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ReceiveFrame(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_RecvFrmBufWithTimeOut(hHandle, &(((VDEC_CMD_VO_FRAME_S *)arg)->stFrame), ((VDEC_CMD_VO_FRAME_S *)arg)->TimeOut);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_RecvFrmBufWithTimeOut err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetNewestDecodedFrame(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_GetNewestDecodedFrame(hHandle, &(((VDEC_CMD_VO_FRAME_S *)arg)->stFrame));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Ioctl_GetNewestDecodedFrame err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetChanStatusInfo(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_GetChanStatusInfo(hHandle, &(((VDEC_CMD_STATUS_S *)arg)->stStatus));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_GetChanStatusInfo err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetChanStreamInfo(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_GetChanStreamInfo(hHandle, &(((VDEC_CMD_STREAM_INFO_S *)arg)->stInfo));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_GetChanStreamInfo err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_AttachStrmBuf(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    VDEC_CMD_ATTACH_BUF_S stParam;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    stParam = *((VDEC_CMD_ATTACH_BUF_S *)arg);
    s32Ret = VDEC_Chan_AttachStrmBuf(hHandle, stParam.u32BufSize, stParam.hDmxVidChn, stParam.hStrmBuf);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_AttachStrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_DetachStrmBuf(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_DetachStrmBuf(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_DetachStrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetEosFlag(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetEosFlag(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetEosFlag err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_DiscardFrm(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_DiscardFrm(hHandle, &(((VDEC_CMD_DISCARD_FRAME_S *)arg)->stDiscardOpt));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_DiscardFrm err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_CheckNewEvent(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_CheckNewEvent(hHandle, &(((VDEC_CMD_EVENT_S *)arg)->stEvent));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_CheckNewEvent err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_EventNewFrm(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    VDEC_CMD_FRAME_S *pstFrameCmd = (VDEC_CMD_FRAME_S *)arg;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == NULL)
    {
        HI_INFO_VDEC("pstChan is null!\n");
        return HI_FAILURE;
    }

    pstFrameCmd->stFrame = s_stVdecDrv.astChanEntity[hHandle].pstChan->stLastFrm;

    s32Ret = (pstFrameCmd->stFrame.u32Width != 0) ? HI_SUCCESS : HI_FAILURE;

    HI_INFO_VDEC("UMAPC_VDEC_CHAN_EVNET_NEWFRAME return:%d\n", s32Ret);

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetFrmBuf(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_GetFrmBuf(hHandle, &(((VDEC_CMD_GET_FRAME_S *)arg)->stFrame));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_GetFrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_PutFrmBuf(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_PutFrmBuf(hHandle, &(((VDEC_CMD_PUT_FRAME_S *)arg)->stFrame));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_PutFrmBuf err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetFrmRate(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_UNF_AVPLAY_FRMRATE_PARAM_S *pstParam = HI_NULL;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    pstParam = &(((VDEC_CMD_FRAME_RATE_S *)arg)->stFrameRate);

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan != HI_NULL)
    {
        s_stVdecDrv.astChanEntity[hHandle].pstChan->stFrameRateParam = *pstParam;

        s32Ret = VDEC_SetChanFrameRate(s_stVdecDrv.astChanEntity[hHandle].pstChan, pstParam);

        if (s32Ret != HI_SUCCESS)
        {
            HI_ERR_VDEC("%s VDEC_SetChanFrameRate failed!\n", __func__);
        }
    }
    else
    {
        s32Ret = HI_FAILURE;
        HI_ERR_VDEC("UMAPC_VDEC_CHAN_SETFRMRATE return :%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetFrmRate(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;
    HI_UNF_AVPLAY_FRMRATE_PARAM_S *pstParam = HI_NULL;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    pstParam = &(((VDEC_CMD_FRAME_RATE_S *)arg)->stFrameRate);

    if (HI_NULL != s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        *pstParam = s_stVdecDrv.astChanEntity[hHandle].pstChan->stFrameRateParam;
        s32Ret = HI_SUCCESS;
        HI_INFO_VDEC("UMAPC_VDEC_CHAN_GETFRMRATE return :%d\n", s32Ret);
    }
    else
    {
        s32Ret = HI_FAILURE;
        HI_ERR_VDEC("UMAPC_VDEC_CHAN_GETFRMRATE return :%d\n", s32Ret);
    }

    return s32Ret;
}

#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
static HI_S32 VDEC_Ioctl_UserDataInitBuf(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == NULL)
    {
        HI_INFO_VDEC("pstChan is null!\n");

        return HI_FAILURE;
    }

    s32Ret = USRDATA_Alloc(hHandle, &(((VDEC_CMD_USERDATABUF_S *)arg)->stBuf));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("USRDATA_Alloc err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_UserDataSetBufAddr(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = USRDATA_SetUserAddr(hHandle, ((VDEC_CMD_BUF_USERADDR_S *)arg)->u64UserAddr, ((VDEC_CMD_BUF_USERADDR_S *)arg)->UserDataType);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("USRDATA_SetUserAddr err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_AcqueUserData(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = USRDATA_Acq(hHandle, &(((VDEC_CMD_USERDATA_S *)arg)->stUserData), &(((VDEC_CMD_USERDATA_S *)arg)->enType));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("USRDATA_Acq err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_ReleaseUserData(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = USRDATA_Rls(hHandle, &(((VDEC_CMD_USERDATA_S *)arg)->stUserData), &(((VDEC_CMD_USERDATA_S *)arg)->enType));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("USRDATA_Rls err!:%d\n", s32Ret);
    }

    return s32Ret;
}
#endif

static HI_S32 VDEC_Ioctl_KeepSpsPps(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_KeepSpsPps(hHandle, ((VDEC_CMD_KEEP_SPSPPS_CTRL_S *)arg)->bKeepSpsPps);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("USRDATA_Rls err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SeekPts(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_SeekPTS(hHandle, &(((VDEC_CMD_SEEK_PTS_S *)(arg))->u32SeekPts),
                          ((VDEC_CMD_SEEK_PTS_S *)(arg))->u32Gap);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_SeekPTS err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetCap(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_GetCap((VDEC_IOCTL_MSG *)arg);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_GetCap err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_AllocHandle(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_AllocHandle((HI_HANDLE *)arg, filp);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_AllocHandle err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_FreeHandle(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_FreeHandle(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_FreeHandle err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetTrickMode(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetTrickMode(hHandle, &(((VDEC_CMD_TRICKMODE_OPT_S *)arg)->stTPlayOpt));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetTrickMode err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetCtrlInfo(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetCtrlInfo(hHandle, &(((VDEC_CMD_SET_CTRL_INFO_S *)arg)->stCtrlInfo));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetCtrlInfo err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetDPBFullCtrl(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetDPBFullCtrl(hHandle, ((VDEC_CMD_SET_DPBFULL_CTRL_S *)arg)->bDPBFullCtrl);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetDPBFullCtrl err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetUVMOS(struct file  *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetUVMOS(hHandle, ((VDEC_CMD_SET_UVMOS_CTRL_S *)arg)->bUVMOSEnable);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetUVMOS err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetLowdelay(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetLowdelay(hHandle, ((VDEC_CMD_SET_LOWDELAY_S *)arg)->bLowdelay);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetLowdelay err!:%d\n", s32Ret);
    }

    return s32Ret;
}

#ifdef HI_TEE_SUPPORT
static HI_S32 VDEC_Ioctl_SetTvp(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_SetTvp(hHandle, ((VDEC_CMD_SET_TVP_S *)arg)->bTVP);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetTvp err!:%d\n", s32Ret);
    }

    return s32Ret;
}
#endif

static HI_S32 VDEC_Ioctl_GetUserBuffer(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = HI_DRV_VDEC_GetUserBuffer(hHandle, ((VDEC_CMD_USER_BUFFER_S *)arg));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("HI_DRV_VDEC_SetColorSpace err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SendEos(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_SendEos(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_SendEos err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetFrmStatusInfo(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_GetFrmStatusInfo(hHandle, ((VDEC_CMD_VPSS_FRAME_S *)arg)->hPort,
                                        &((VDEC_CMD_VPSS_FRAME_S *)arg)->stVdecFrmStatusInfo);

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_GetFrmStatusInfo err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetVfmwHandle(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan == NULL)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    ((VDEC_GET_VFMW_HANDLE *)arg)->hVfmwHandle = s_stVdecDrv.astChanEntity[hHandle].pstChan->hChan;

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GetLeftStreamFrm(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_GetLeftStreamFrm(hHandle, &(((VDEC_CMD_GETLEFTSTREAMFRAME_S *)arg)->u32LeftFrm));

    if (s32Ret != HI_SUCCESS)
    {
        HI_WARN_VDEC("VDEC_Chan_GetLeftStreamFrm err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_SetIDRPts(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    HI_HANDLE hHandle = HI_INVALID_HANDLE;

    if (VDEC_Ioctl_GetAndCheckHandle(cmd, arg, &hHandle) != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = VDEC_Chan_SetIDRPts(hHandle, ((VDEC_CMD_SET_IDRPTS_S *)arg)->IDRPts);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("VDEC_Chan_SetIDRPts err!:%d\n", s32Ret);
    }

    return s32Ret;
}

static HI_S32 VDEC_Ioctl_GlobalRelease(struct file *filp, unsigned int cmd, void *arg)
{
    HI_S32 s32Ret = HI_SUCCESS;
    IMAGE image;
    HI_DRV_VIDEO_FRAME_S *pFrame = HI_NULL;

    if (arg == HI_NULL)
    {
        HI_ERR_VDEC("CMD %d Bad arg!\n", cmd);
        return HI_ERR_VDEC_INVALID_PARA;
    }

    pFrame = (HI_DRV_VIDEO_FRAME_S *)(arg);

    s32Ret = VDEC_ConvertFrame2Image(pFrame, &image);

    if (s32Ret != HI_SUCCESS)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    s32Ret = s_stVdecDrv.pVfmwFunc->pfnVfmwGlobalReleaseImage(&image);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Global release frame failed, image.stDispInfo.luma_phy_addr = 0x%x\n", image.stDispInfo.luma_phy_addr);
    }

    return s32Ret;
}

static const IOCTL_COMMAND_NODE g_IOCTL_CommandTable[] =
{
    {UMAPC_VDEC_CHAN_USRDATA,               VDEC_Ioctl_GetUsrData},
    {UMAPC_VDEC_CHAN_IFRMDECODE,            VDEC_Ioctl_IFRMDECODE},
    {UMAPC_VDEC_CHAN_IFRMRELEASE,           VDEC_Ioctl_ReleaseIFrame},
    {UMAPC_VDEC_CHAN_ALLOC,                 VDEC_Ioctl_ChanAlloc},
    {UMAPC_VDEC_CHAN_FREE,                  VDEC_Ioctl_ChanFree},
    {UMAPC_VDEC_CHAN_START,                 VDEC_Ioctl_ChanStart},
    {UMAPC_VDEC_CHAN_STOP,                  VDEC_Ioctl_ChanStop},
    {UMAPC_VDEC_CHAN_RESET,                 VDEC_Ioctl_ChanReset},
    {UMAPC_VDEC_CHAN_SETATTR,               VDEC_Ioctl_ChanSetAttr},
#ifdef HI_HDR_DOLBYVISION_SUPPORT
    {UMAPC_VDEC_CHAN_SET_HDR_ATTR,          VDEC_Ioctl_ChanSetHDRAttr},
#endif
    {UMAPC_VDEC_CHAN_GETATTR,               VDEC_Ioctl_ChanGetAttr},
    {UMAPC_VDEC_CREATE_ESBUF,               VDEC_Ioctl_CreatEsBuffer},
    {UMAPC_VDEC_DESTROY_ESBUF,              VDEC_Ioctl_DestroyEsBuffer},
    {UMAPC_VDEC_GETBUF,                     VDEC_Ioctl_GetEsBuffer},
    {UMAPC_VDEC_PUTBUF,                     VDEC_Ioctl_PutEsBuffer},
    {UMAPC_VDEC_SETUSERADDR,                VDEC_Ioctl_SetUserAddr},
    {UMAPC_VDEC_RCVBUF,                     VDEC_Ioctl_RcveiveBuffer},
    {UMAPC_VDEC_RLSBUF,                     VDEC_Ioctl_RleaseBuffer},
    {UMAPC_VDEC_RESET_ESBUF,                VDEC_Ioctl_ResetEsBuffer},
    {UMAPC_VDEC_GET_ESBUF_STATUS,           VDEC_Ioctl_GetStatus},
    {UMAPC_VDEC_CHAN_RCVFRM,                VDEC_Ioctl_ReceiveFrame},
    {UMAPC_VDEC_CHAN_RLSFRM,                VDEC_Ioctl_ReleaseFrame},
    {UMAPC_VDEC_CHAN_STATUSINFO,            VDEC_Ioctl_GetChanStatusInfo},
    {UMAPC_VDEC_CHAN_STREAMINFO,            VDEC_Ioctl_GetChanStreamInfo},
    {UMAPC_VDEC_CHAN_ATTACHBUF,             VDEC_Ioctl_AttachStrmBuf},
    {UMAPC_VDEC_CHAN_DETACHBUF,             VDEC_Ioctl_DetachStrmBuf},
    {UMAPC_VDEC_CHAN_SETEOSFLAG,            VDEC_Ioctl_SetEosFlag},
    {UMAPC_VDEC_CHAN_DISCARDFRM,            VDEC_Ioctl_DiscardFrm},
    {UMAPC_VDEC_CHAN_CHECKEVT,              VDEC_Ioctl_CheckNewEvent},
    {UMAPC_VDEC_CHAN_EVNET_NEWFRAME,        VDEC_Ioctl_EventNewFrm},
    {UMAPC_VDEC_CHAN_GETFRM,                VDEC_Ioctl_GetFrmBuf},
    {UMAPC_VDEC_CHAN_PUTFRM,                VDEC_Ioctl_PutFrmBuf},
    {UMAPC_VDEC_CHAN_SETFRMRATE,            VDEC_Ioctl_SetFrmRate},
    {UMAPC_VDEC_CHAN_GETFRMRATE,            VDEC_Ioctl_GetFrmRate},
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    {UMAPC_VDEC_CHAN_USERDATAINITBUF,       VDEC_Ioctl_UserDataInitBuf},
    {UMAPC_VDEC_CHAN_USERDATASETBUFADDR,    VDEC_Ioctl_UserDataSetBufAddr},
    {UMAPC_VDEC_CHAN_ACQUSERDATA,           VDEC_Ioctl_AcqueUserData},
    {UMAPC_VDEC_CHAN_RLSUSERDATA,           VDEC_Ioctl_ReleaseUserData},
#endif
    {UMAPC_VDEC_CHAN_KEEPSPSPPS,            VDEC_Ioctl_KeepSpsPps},
    {UMAPC_VDEC_CHAN_SEEKPTS,               VDEC_Ioctl_SeekPts},
    {UMAPC_VDEC_GETCODEC,                   VDEC_Ioctl_GetCap},
    {UMAPC_VDEC_ALLOCHANDLE,                VDEC_Ioctl_AllocHandle},
    {UMAPC_VDEC_FREEHANDLE,                 VDEC_Ioctl_FreeHandle},
    {UMAPC_VDEC_CHAN_SETTRICKMODE,          VDEC_Ioctl_SetTrickMode},
    {UMAPC_VDEC_CHAN_SETCTRLINFO,           VDEC_Ioctl_SetCtrlInfo},
    //{UMAPC_VDEC_CHAN_PROGRSSIVE,            VDEC_Ioctl_SetProgressive},
    {UMAPC_VDEC_CHAN_DPBFULL,               VDEC_Ioctl_SetDPBFullCtrl},
    {UMAPC_VDEC_CHAN_UVMOS,                 VDEC_Ioctl_SetUVMOS},
    {UMAPC_VDEC_CHAN_LOWDELAY,              VDEC_Ioctl_SetLowdelay},
#ifdef HI_TEE_SUPPORT
    {UMAPC_VDEC_CHAN_TVP,                   VDEC_Ioctl_SetTvp},
#endif
    //{UMAPC_VDEC_CHAN_SETCOLORSPACE,         VDEC_Ioctl_SetColorSpace},
    {UMAPC_VDEC_GETUSERBUFFER,              VDEC_Ioctl_GetUserBuffer},
//    {UMAPC_VDEC_CHAN_RCVVPSSFRM,            VDEC_Ioctl_RcvVpssFrm},
//     {UMAPC_VDEC_CHAN_RLSPORTFRM,            VDEC_Ioctl_ReleasePortFrm},
    //{UMAPC_VDEC_CHAN_CREATEVPSS,            VDEC_Ioctl_CreateVpss},
    //{UMAPC_VDEC_CHAN_DESTORYVPSS,           VDEC_Ioctl_DestroyVpss},
    //{UMAPC_VDEC_CHAN_CREATEPORT,            VDEC_Ioctl_CreatePort},
    //{UMAPC_VDEC_CHAN_DESTROYPORT,           VDEC_Ioctl_DestroyPort},
    //{UMAPC_VDEC_CHAN_ENABLEPORT,            VDEC_Ioctl_EnablePort},
    //{UMAPC_VDEC_CHAN_DISABLEPORT,           VDEC_Ioctl_DisablePort},
    //{UMAPC_VDEC_CHAN_SETPORTTYPE,           VDEC_Ioctl_SetPortType},
    //{UMAPC_VDEC_CHAN_CANCLEMAINPORT,        VDEC_Ioctl_CancleMainPort},
    //{UMAPC_VDEC_CHAN_SETFRMPACKTYPE,        VDEC_Ioctl_SetFrmPackingType},
    //{UMAPC_VDEC_CHAN_GETFRMPACKTYPE,        VDEC_Ioctl_GetFrmPackingType},
    //{UMAPC_VDEC_CHAN_RESETVPSS,             VDEC_Ioctl_ResetVpss},
    {UMAPC_VDEC_CHAN_SENDEOS,               VDEC_Ioctl_SendEos},
    //{UMAPC_VDEC_CHAN_GETPORTSTATE,          VDEC_Ioctl_GetPortState},
    {UMAPC_VDEC_CHAN_GETFRMSTATUSINFO,      VDEC_Ioctl_GetFrmStatusInfo},
    //{UMAPC_VDEC_CHAN_SETPORTATTR,           VDEC_Ioctl_SetPortAttr},
    //{UMAPC_VDEC_CHAN_GETPORTATTR,           VDEC_Ioctl_GetPortAttr},
    //{UMAPC_VDEC_CHAN_SETEXTBUFFER,          VDEC_Ioctl_SetExtBuffer},
    //{UMAPC_VDEC_CHAN_SETBUFFERMODE,         VDEC_Ioctl_SetFrameBufferMode},
    //{UMAPC_VDEC_CHAN_CHECKANDDELBUFFER,     VDEC_Ioctl_CheckAndDelBuffer},
    //{UMAPC_VDEC_CHAN_SETEXTBUFFERSTATE,     VDEC_Ioctl_SetExtBufferState},
    //{UMAPC_VDEC_CHAN_SETRESOLUTION,         VDEC_Ioctl_SetResolution},
    {UMAPC_VDEC_CHAN_GETLEFTSTREAMFRAME,    VDEC_Ioctl_GetLeftStreamFrm},
    {UMAPC_VDEC_CHAN_GLOBALREL,             VDEC_Ioctl_GlobalRelease},
    //{UMAPC_VDEC_CHAN_GETVIDEOBYPASS,        VDEC_Ioctl_GetVidoByPass},
    {UMAPC_VDEC_CHAN_SETIDRPTS,             VDEC_Ioctl_SetIDRPts},
    //{UMAPC_VDEC_CHAN_SCENE_MODE,            VDEC_Ioctl_SetSceneMode},
    {UMAPC_VDEC_GET_VFMW_HANDLE,            VDEC_Ioctl_GetVfmwHandle},
    {UMAPC_VDEC_CHAN_GET_NEWEST_DECODED_FRAME, VDEC_Ioctl_GetNewestDecodedFrame},

    {0,        HI_NULL}, //terminal element
};

FN_IOCTL_HANDLER VDEC_Ioctl_Get_Handler(HI_U32 Code)
{
    HI_U32 Index = 0;
    FN_IOCTL_HANDLER pTargetHandler = HI_NULL;

    while (1)
    {
        if (g_IOCTL_CommandTable[Index].Code == 0 || g_IOCTL_CommandTable[Index].pHandler == HI_NULL)
        {
            break;
        }

        if (Code == g_IOCTL_CommandTable[Index].Code)
        {
            pTargetHandler = g_IOCTL_CommandTable[Index].pHandler;
            break;
        }

        Index++;
    }

    return pTargetHandler;
}

HI_S32 VDEC_Ioctl(struct inode *inode, struct file *filp, unsigned int cmd, void *arg)
{
    FN_IOCTL_HANDLER pIOCTL_Handler = HI_NULL;

    pIOCTL_Handler = VDEC_Ioctl_Get_Handler(cmd);

    if (pIOCTL_Handler == HI_NULL)
    {
        HI_ERR_VDEC("%s: ERROR cmd 0x%x is not supported!\n", __func__, cmd);

        return HI_FAILURE;
    }

    return pIOCTL_Handler(filp, cmd, arg);
}

#ifdef HI_PROC_SUPPORT
static HI_S32 VDEC_RegChanProc(HI_S32 s32Num)
{
    HI_CHAR aszBuf[16];
    DRV_PROC_ITEM_S *pstItem;

    /* Check parameters */
    if (HI_NULL == s_stVdecDrv.pstProcParam)
    {
        return HI_FAILURE;
    }

    /* Create proc */
    if (-1 == s32Num)
    {
        snprintf(aszBuf, sizeof(aszBuf), "vdec_ctrl");
    }
    else
    {
        snprintf(aszBuf, sizeof(aszBuf), "vdec%02d", s32Num);
    }

    pstItem = HI_DRV_PROC_AddModule(aszBuf, HI_NULL, HI_NULL);

    if (!pstItem)
    {
        HI_FATAL_VDEC("Create vdec proc entry fail!\n");
        return HI_FAILURE;
    }

    /* Set functions */
    if (-1 == s32Num)
    {
        pstItem->read  = s_stVdecDrv.pstProcParam->pfnCtrlReadProc;
        pstItem->write = s_stVdecDrv.pstProcParam->pfnCtrlWriteProc;
    }
    else
    {
        pstItem->read  = s_stVdecDrv.pstProcParam->pfnReadProc;
        pstItem->write = s_stVdecDrv.pstProcParam->pfnWriteProc;
    }

    HI_INFO_VDEC("Create proc entry for vdec%d OK!\n", s32Num);
    return HI_SUCCESS;
}

static HI_VOID VDEC_UnRegChanProc(HI_S32 s32Num)
{
    HI_CHAR aszBuf[16];

    if (-1 == s32Num)
    {
        snprintf(aszBuf, sizeof(aszBuf), "vdec_ctrl");
    }
    else
    {
        snprintf(aszBuf, sizeof(aszBuf), "vdec%02d", s32Num);
    }

    HI_DRV_PROC_RemoveModule(aszBuf);
    return;
}
#endif

static HI_VOID VDEC_TimerFunc(HI_LENGTH_T value)
{
    HI_HANDLE hHandle;
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    VDEC_CHAN_STATINFO_S *pstStatInfo = HI_NULL;

    s_stVdecDrv.stTimer.expires  = jiffies + (HZ);
    s_stVdecDrv.stTimer.function = VDEC_TimerFunc;

    for (hHandle = 0; hHandle < HI_VDEC_MAX_INSTANCE_NEW; hHandle++)
    {
        VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hHandle]);

        if (HI_SUCCESS != s32Ret)
        {
            continue;
        }

        if (HI_NULL == s_stVdecDrv.astChanEntity[hHandle].pstChan)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            continue;
        }

        pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

        if (pstChan->enCurState != VDEC_CHAN_STATE_RUN)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            continue;
        }

        pstStatInfo = &pstChan->stStatInfo;
        pstStatInfo->u32TotalVdecTime++;
        pstStatInfo->u32CalcBpsVdecTime++;

        if (pstStatInfo->u32TotalVdecTime == 0
            || pstStatInfo->u32CalcBpsVdecTime == 0)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
            continue;
        }

        pstStatInfo->u32AvrgVdecFpsLittle = (HI_U32)((pstStatInfo->u32TotalVdecOutFrame
                                            * 100) / pstStatInfo->u32TotalVdecTime);

        pstStatInfo->u32AvrgVdecFps = (HI_U32)(pstStatInfo->u32TotalVdecOutFrame / pstStatInfo->u32TotalVdecTime);
        pstStatInfo->u32AvrgVdecFpsLittle -= (pstStatInfo->u32AvrgVdecFps * 100);
        pstStatInfo->u32AvrgVdecInBps = (HI_U32)(pstStatInfo->u32TotalVdecInByte / pstStatInfo->u32CalcBpsVdecTime * 8);

        //pstStatInfo->u32AvrgVdecInBps = (HI_U32)(pstStatInfo->u32TotalVdecInByte / 1024);
        //pstStatInfo->u32TotalVdecInByte = 0;
        if (pstStatInfo->u32TotalVdecInByte > 0xFEFFFFFFUL)
        {
            pstStatInfo->u32TotalVdecInByte = 0;
            pstStatInfo->u32CalcBpsVdecTime = 0;
        }

        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hHandle]);
    }

    add_timer(&s_stVdecDrv.stTimer);
    return;
}

HI_S32 VDEC_DRV_FreeAll(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    VDEC_CHANNEL_S *pstChan = HI_NULL;
    HI_U32 WaitCnt = 0;

    hHandle = hHandle & 0xff;

    if (hHandle >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    down(&(s_stVdecDrv.stVdecChanSem));
    pstChan = s_stVdecDrv.astChanEntity[hHandle].pstChan;

    if (pstChan == HI_NULL)
    {
        HI_ERR_VDEC("pstChan is null, hHandle = %d\n", hHandle);
        up(&s_stVdecDrv.stVdecChanSem);

        return HI_FAILURE;
    }

    if (s_stVdecDrv.astChanEntity[hHandle].pstChan)
    {
        while (pstChan->stStatInfo.u32AvplayRcvFrameOK > pstChan->stStatInfo.u32AvplayRlsFrameOK)
        {
            msleep(10);
            WaitCnt++;

            if (WaitCnt > 100)
            {
                HI_INFO_VDEC("Wait vo release occupied frame failed! (RcvFrame %d > RlsFrame %d)\n", pstChan->stStatInfo.u32AvplayRcvFrameOK, pstChan->stStatInfo.u32AvplayRlsFrameOK);
                break;
            }
        }
    }

    s32Ret = HI_DRV_VDEC_ChanStop(hHandle);

    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("%s stop chan %d failed!\n", __func__, hHandle);
    }

    /*3:destroy vfmw and vdec*/
    if (s_stVdecDrv.astChanEntity[hHandle].bUsed)
    {
        if (s_stVdecDrv.astChanEntity[hHandle].pstChan)
        {
            VDEC_Chan_Free(hHandle);
        }

        /*4:destory stream buf*/
        if (HI_INVALID_HANDLE == s_stVdecDrv.astChanEntity[hHandle].pstChan->hDmxVidChn)
        {
            s32Ret = VDEC_DestroyStrmBuf(s_stVdecDrv.astChanEntity[hHandle].pstChan->hStrmBuf);

            if (s32Ret != HI_SUCCESS)
            {
                HI_WARN_VDEC("VDEC_DestroyStrmBuf err!:%d\n", s32Ret);
            }
        }
    }

    up(&(s_stVdecDrv.stVdecChanSem));
    if (s_stVdecDrv.astChanEntity[hHandle].bUsed)
    {
        VDEC_Chan_FreeHandle(hHandle);
    }

    return HI_SUCCESS;
}

HI_VOID HI_DRV_VDEC_SetOmxCallBacks(OMX_EXPORT_FUNC_S *OmxCallbacks)
{
    s_stVdecDrv.pOmxFunc = OmxCallbacks;
}

static HI_S32 VDEC_OpenDev(HI_VOID)
{
    HI_U32 i;
    HI_S32 s32Ret;
    VDEC_OPERATION_S stOpt;

    /* Init global parameter */
    init_timer(&s_stVdecDrv.stTimer);

    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        atomic_set(&s_stVdecDrv.astChanEntity[i].atmUseCnt, 0);
        atomic_set(&s_stVdecDrv.astChanEntity[i].atmRlsFlag, 0);
        init_waitqueue_head(&s_stVdecDrv.astChanEntity[i].stRlsQue);
        s_stVdecDrv.astChanEntity[i].pstChan = HI_NULL;
        s_stVdecDrv.astChanEntity[i].u32DFBEn = 0;
    }

    /* Init buffer manager */
    BUFMNG_Init();

    /* Init vfmw */
    memset(&stOpt, 0, sizeof(VDEC_OPERATION_S));
    stOpt.eAdapterType = ADAPTER_TYPE_VDEC;
    stOpt.VdecCallback = VDEC_EventHandle;
    stOpt.mem_malloc = HI_NULL;
    stOpt.mem_free = HI_NULL;
    stOpt.is_secure = HI_FALSE;

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwInit)(&stOpt);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("Init vfmw err:%d!\n", s32Ret);
        goto err1;
    }

    /* Get vfmw capabilite */
    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(HI_INVALID_HANDLE, VDEC_CID_GET_CAPABILITY, &s_stVdecDrv.stVdecCap, sizeof(VDEC_CAP_S));

    if (HI_SUCCESS != s32Ret)
    {
        HI_FATAL_VDEC("VFMW GET_CAPABILITY err:%d!\n", s32Ret);
        goto err2;
    }

    /* Init CC user data function */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_Init();
#endif

    /* Set global timer */
    s_stVdecDrv.stTimer.expires  = jiffies + (HZ);
    s_stVdecDrv.stTimer.function = VDEC_TimerFunc;
    add_timer(&s_stVdecDrv.stTimer);

    /* Set ready flag */
    s_stVdecDrv.bReady = HI_TRUE;

    HI_INFO_VDEC("VDEC_OpenDev OK.\n");

    return HI_SUCCESS;

err2:
    (s_stVdecDrv.pVfmwFunc->pfnVfmwExit)(HI_FALSE);
err1:
    BUFMNG_DeInit();
    return HI_FAILURE;
}

static HI_S32 VDEC_CloseDev(HI_VOID)
{
    HI_U32 i;

    /* Reentrant */
    if (s_stVdecDrv.bReady == HI_FALSE)
    {
        return HI_SUCCESS;
    }

    /* Free all channels */
    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        if (HI_NULL != s_stVdecDrv.astChanEntity[i].pstChan)
        {
            VDEC_DRV_FreeAll(i);
        }
    }

    /* Set ready flag */
    s_stVdecDrv.bReady = HI_FALSE;

    /* Delete timer */
    del_timer(&s_stVdecDrv.stTimer);

    /* Vfmw exit */
#ifdef HI_TEE_SUPPORT
    (s_stVdecDrv.pVfmwFunc->pfnVfmwExit)(HI_TRUE);
#endif
    (s_stVdecDrv.pVfmwFunc->pfnVfmwExit)(HI_FALSE);


    /* Buffer manager exit  */
    BUFMNG_DeInit();

    /* CC user data exit */
#if (1 == HI_VDEC_USERDATA_CC_SUPPORT)
    USRDATA_DeInit();
#endif

    return HI_SUCCESS;
}

HI_S32 VDEC_DRV_Open(struct inode *inode, struct file  *filp)
{
    HI_S32 s32Ret;

    down(&(s_stVdecDrv.device_sem));
    if (atomic_inc_return(&s_stVdecDrv.atmOpenCnt) == 1)
    {
        s_stVdecDrv.pDmxFunc  = HI_NULL;
        s_stVdecDrv.pVfmwFunc = HI_NULL;

#ifdef HI_DEMUX_SUPPORT
        /* Get demux functions */
        s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_DEMUX, (HI_VOID **)&s_stVdecDrv.pDmxFunc);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("Get demux function err: %#x!\n", s32Ret);
        }
#endif

        /* Get vfmw functions */
        s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VFMW, (HI_VOID **)&s_stVdecDrv.pVfmwFunc);

        /* Check vfmw functions */
        if ((HI_SUCCESS != s32Ret)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc->pfnVfmwInit)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc->pfnVfmwExit)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc->pfnVfmwControl)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc->pfnVfmwSuspend)
            || (HI_NULL == s_stVdecDrv.pVfmwFunc->pfnVfmwResume))
        {
            HI_FATAL_VDEC("Get vfmw function err!\n");
            goto err;
        }

        s32Ret = HI_DRV_MODULE_GetFunction(HI_ID_VO, (HI_VOID **)&s_stVdecDrv.pVoFunc);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("Get window function err: %#x!\n", s32Ret);
        }

        /* Init device */
        if (HI_SUCCESS != VDEC_OpenDev())
        {
            HI_FATAL_VDEC("VDEC_OpenDev err!\n");
            goto err;
        }
    }

    up(&(s_stVdecDrv.device_sem));

    return HI_SUCCESS;

err:
    atomic_dec(&s_stVdecDrv.atmOpenCnt);
    up(&(s_stVdecDrv.device_sem));

    return HI_FAILURE;
}

HI_S32 VDEC_DRV_Release(struct inode *inode, struct file *filp)
{
    HI_S32 i;
    HI_S32 s32Ret;

    down(&(s_stVdecDrv.device_sem));

    /* Not the last close, only close the channel match with the 'filp' */
    if (0 != atomic_dec_return(&s_stVdecDrv.atmOpenCnt))
    {
        for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
        {
            VDEC_CHAN_ENTITY_S *Chan = &s_stVdecDrv.astChanEntity[i];

            if (Chan->u64File != ((HI_U64)(HI_SIZE_T)filp))
            {
                continue;
            }

            if (s_stVdecDrv.astChanEntity[i].pstChan != HI_NULL)
            {
                s32Ret = VDEC_DRV_FreeAll(i);

                if (HI_SUCCESS != s32Ret)
                {
                    HI_ERR_VDEC("VDEC_DRV_FreeAll err:%#x\n", s32Ret);
                }
            }
        }
    }
    /* Last close */
    else
    {
        VDEC_CloseDev();
    }

    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        if (HI_TRUE == s_stVdecDrv.astChanEntity[i].bUsed)
        {
            break;
        }
    }

    up(&(s_stVdecDrv.device_sem));

    return HI_SUCCESS;
}

#ifdef HI_PROC_SUPPORT
HI_S32 VDEC_DRV_RegisterProc(VDEC_REGISTER_PARAM_S *pstParam)
{
    HI_S32 i;
    HI_S32 s32Ret = HI_FAILURE;

    if (HI_NULL == pstParam)
    {
        HI_ERR_VDEC("null pointer pstParam\n");
        return HI_FAILURE;
    }

    s_stVdecDrv.pstProcParam = pstParam;

    /* Create ctrl proc */
    s32Ret = VDEC_RegChanProc(-1);

    if (HI_SUCCESS != s32Ret)
    {
        HI_INFO_VDEC("VDEC_RegChanProc Err!\n");
    }

    /* Create proc */
    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        if (s_stVdecDrv.astChanEntity[i].pstChan)
        {
            if (HI_FALSE == s_stVdecDrv.astChanEntity[i].pstChan->bProcRegister)
            {
                s32Ret  = VDEC_RegChanProc(i);

                if (HI_SUCCESS == s32Ret)
                {
                    s_stVdecDrv.astChanEntity[i].pstChan->bProcRegister = HI_TRUE;
                }
                else
                {
                    s_stVdecDrv.astChanEntity[i].pstChan->bProcRegister = HI_FALSE;
                }
            }
        }
    }

    return HI_SUCCESS;
}

HI_VOID VDEC_DRV_UnregisterProc(HI_VOID)
{
    HI_S32 i;

    /* Unregister ctrl proc*/
    VDEC_UnRegChanProc(-1);

    /* Unregister */
    for (i = 0; i < HI_VDEC_MAX_INSTANCE_NEW; i++)
    {
        if (s_stVdecDrv.astChanEntity[i].pstChan)
        {
            if (HI_TRUE == s_stVdecDrv.astChanEntity[i].pstChan->bProcRegister)
            {
                VDEC_UnRegChanProc(i);
                s_stVdecDrv.astChanEntity[i].pstChan->bProcRegister = HI_FALSE;
            }
        }
    }

    /* Clear param */
    s_stVdecDrv.pstProcParam = HI_NULL;
    return;
}
#endif

HI_S32 VDEC_DRV_Suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    if (s_stVdecDrv.pVfmwFunc && s_stVdecDrv.pVfmwFunc->pfnVfmwSuspend)
    {
        if ((s_stVdecDrv.pVfmwFunc->pfnVfmwSuspend)())
        {
            HI_FATAL_VDEC("Suspend err!\n");
            return HI_FAILURE;
        }
    }

    HI_PRINT("VDEC suspend OK\n");
    return HI_SUCCESS;
}

HI_S32 VDEC_DRV_Resume(PM_BASEDEV_S *pdev)
{
    if (s_stVdecDrv.pVfmwFunc && s_stVdecDrv.pVfmwFunc->pfnVfmwResume)
    {
        if ((s_stVdecDrv.pVfmwFunc->pfnVfmwResume)())
        {
            HI_FATAL_VDEC("Resume err!\n");
            return HI_FAILURE;
        }
    }

    HI_PRINT("VDEC resume OK\n");
    return HI_SUCCESS;
}

VDEC_CHANNEL_S *VDEC_DRV_GetChan(HI_HANDLE hHandle)
{
    if (s_stVdecDrv.bReady)
    {
        if (hHandle < HI_VDEC_MAX_INSTANCE_NEW)
        {
            if (s_stVdecDrv.astChanEntity[hHandle].pstChan)
            {
                return s_stVdecDrv.astChanEntity[hHandle].pstChan;
            }
        }
    }

    return HI_NULL;
}

VFMW_EXPORT_FUNC_S *VDEC_DRV_GetVfmwExportFunc(HI_VOID)
{
    return s_stVdecDrv.pVfmwFunc;
}

HI_S32 VDEC_DRV_Init(HI_VOID)
{
    HI_S32 ret;

    memset(s_stVdecDrv.astChanEntity, 0, sizeof(s_stVdecDrv.astChanEntity));
    BUFMNG_SaveInit();

    ret = HI_DRV_MODULE_Register(HI_ID_VDEC, VDEC_NAME, (HI_VOID *)&s_stVdecDrv.stExtFunc);

    if (HI_SUCCESS != ret)
    {
        HI_FATAL_VDEC("Reg module fail:%#x!\n", ret);
        return ret;
    }

    HI_INIT_MUTEX(&(s_stVdecDrv.stSem));
    HI_INIT_MUTEX(&(s_stVdecDrv.stVdecChanSem));
    HI_INIT_MUTEX(&(s_stVdecDrv.device_sem));

    return HI_SUCCESS;
}

HI_VOID VDEC_DRV_Exit(HI_VOID)
{
    HI_DRV_MODULE_UnRegister(HI_ID_VDEC);

    return;
}

HI_S32 HI_DRV_VDEC_Init(HI_VOID)
{
    return VDEC_DRV_Init();
}

HI_VOID HI_DRV_VDEC_DeInit(HI_VOID)
{
    return VDEC_DRV_Exit();
}

HI_S32 HI_DRV_VDEC_Open(HI_VOID)
{
    return VDEC_DRV_Open(HI_NULL, HI_NULL);
}

HI_S32 HI_DRV_VDEC_Close(HI_VOID)
{
    return VDEC_DRV_Release(HI_NULL, HI_NULL);
}

HI_S32 HI_DRV_VDEC_AllocChan(HI_HANDLE *phHandle, HI_UNF_AVPLAY_OPEN_OPT_S *pstCapParam)
{
    HI_S32 s32Ret;

    s32Ret = VDEC_Chan_AllocHandle(phHandle, (struct file *)MCE_INVALID_FILP);

    if (HI_SUCCESS != s32Ret)
    {
        return s32Ret;
    }

    s_stVdecDrv.astChanEntity[(*phHandle) & 0xff].u32DFBEn = 1;

    //return VDEC_Chan_Alloc((*phHandle)&0xff, pstCapParam);
    return VDEC_Chan_InitParam((*phHandle) & 0xff, pstCapParam);
}

HI_S32 HI_DRV_VDEC_FreeChan(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;

    s32Ret = VDEC_Chan_Free(hHandle & 0xff);
    s32Ret |= VDEC_Chan_FreeHandle(hHandle & 0xff);

    return s32Ret;
}

HI_S32 HI_DRV_VDEC_CreateStrmBuf(HI_HANDLE hVdec, HI_DRV_VDEC_STREAM_BUF_S *pstBuf)
{
    HI_S32 s32Ret;
    s32Ret = VDEC_CreateStrmBuf(pstBuf);
    VDEC_Chan_AttachStrmBuf(hVdec, pstBuf->u32Size, HI_INVALID_HANDLE, pstBuf->hHandle);

    return s32Ret;
}

HI_S32 HI_DRV_VDEC_ChanBufferInit(HI_HANDLE hHandle, HI_U32 u32BufSize, HI_HANDLE hDmxVidChn)
{
    HI_S32 s32Ret;
    HI_DRV_VDEC_STREAM_BUF_S stBuf = {0};

    if (HI_INVALID_HANDLE == hDmxVidChn)
    {
        stBuf.u32Size = u32BufSize;
        s32Ret = HI_DRV_VDEC_CreateStrmBuf(hHandle & 0xff, &stBuf);

        if (HI_SUCCESS != s32Ret)
        {
            return HI_FAILURE;
        }
    }
    else
    {
        s32Ret = VDEC_Chan_AttachStrmBuf(hHandle & 0xff, u32BufSize, hDmxVidChn, HI_INVALID_HANDLE);
    }

    return s32Ret;
}

HI_S32 HI_DRV_VDEC_ChanBufferDeInit(HI_HANDLE hHandle)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_HANDLE hDemuxHandle;

    if ((hHandle & 0xff) > HI_VDEC_MAX_INSTANCE_NEW - 1)
    {
        HI_ERR_VDEC("HI_DRV_VDEC_ChanBufferDeInit error hHandle:%d wrong!\n", hHandle);
        return s32Ret;
    }

    hDemuxHandle = s_stVdecDrv.astChanEntity[hHandle & 0xff].pstChan->hDmxVidChn;

    if (HI_INVALID_HANDLE == hDemuxHandle)
    {
        s32Ret = VDEC_DestroyStrmBuf(s_stVdecDrv.astChanEntity[hHandle & 0xff].pstChan->hStrmBuf);

        if (HI_SUCCESS != s32Ret)
        {
            HI_ERR_VDEC("VDEC_DestroyStrmBuf error!\n");
            return s32Ret;
        }
    }

    s32Ret = VDEC_Chan_DetachStrmBuf(hHandle & 0xff);
    return s32Ret;
}

HI_S32 HI_DRV_VDEC_ResetChan(HI_HANDLE hHandle)
{
    return VDEC_Chan_Reset(hHandle & 0xff, VDEC_RESET_TYPE_ALL);
}

HI_S32 HI_DRV_VDEC_DestroyStrmBuf(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    s32Ret = VDEC_DestroyStrmBuf(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_DestroyStrmBuf err!\n");
        return s32Ret;
    }

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_Chan_AttachStrmBuf(HI_HANDLE hHandle, HI_U32 u32BufSize, HI_HANDLE hDmxVidChn, HI_HANDLE hStrmBuf)
{
    HI_S32 s32Ret;
    s32Ret = VDEC_Chan_AttachStrmBuf(hHandle, u32BufSize, hDmxVidChn, hStrmBuf);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_Chan_AttachStrmBuf err!\n");
        return s32Ret;
    }

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_Chan_DetachStrmBuf(HI_HANDLE hHandle)
{
    HI_S32 s32Ret;
    s32Ret = VDEC_Chan_DetachStrmBuf(hHandle);

    if (HI_SUCCESS != s32Ret)
    {
        HI_ERR_VDEC("VDEC_Chan_DetachStrmBuf err!\n");
        return s32Ret;
    }

    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_GetCap(VDEC_CAP_S *pstCap)
{
    HI_S32 s32Ret;

    if (pstCap == HI_NULL)
    {
        HI_FATAL_VDEC("pstCap is null\n");
        return HI_FAILURE;
    }

    s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(HI_INVALID_HANDLE, VDEC_CID_GET_CAPABILITY, &pstCap, sizeof(VDEC_CAP_S));

    if (s32Ret != HI_SUCCESS)
    {
        HI_FATAL_VDEC("VFMW GET_CAPABILITY err: %d!\n", s32Ret);
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

VDEC_CHANNEL_S *HI_DRV_VDEC_DRV_GetChan(HI_HANDLE hHandle)
{
    VDEC_CHANNEL_S *stVdecChn = HI_NULL;
    stVdecChn = VDEC_DRV_GetChan(hHandle);

    if (HI_NULL == stVdecChn)
    {
        HI_ERR_VDEC("VDEC_DRV_GetChan err!\n");
        return HI_NULL;
    }

    return stVdecChn;
}

HI_S32 HI_DRV_VDEC_RegisterEventCallback(HI_HANDLE hHandle, EventCallBack fCallback)
{
    HI_HANDLE hHnd = hHandle & 0xff;

    if (hHnd >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("bad handle %d!\n", hHnd);
        return HI_FAILURE;
    }

    s_stVdecDrv.astChanEntity[hHnd].eCallBack = fCallback;
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_RegisterDmxHdlCallback(HI_U32  hHandle, GetDmxHdlCallBack fCallback, HI_U32 dmxID)
{
    HI_HANDLE hHnd = hHandle & 0xff;

    if (hHnd >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_ERR_VDEC("bad handle %d!\n", hHnd);
        return HI_FAILURE;
    }

    s_stVdecDrv.astChanEntity[hHnd].pstChan->u32DmxID = dmxID;
    s_stVdecDrv.astChanEntity[hHnd].DmxHdlCallBack = fCallback;
    return HI_SUCCESS;
}

HI_S32 HI_DRV_VDEC_CheckIfSupportRandomStream(HI_UNF_VCODEC_TYPE_E enType, HI_UNF_VCODEC_EXTATTR_U *pExtAttr, HI_BOOL *pbSupport)
{
    if ((pbSupport == HI_NULL) || (pExtAttr == HI_NULL))
    {
        return HI_ERR_VDEC_INVALID_PARA;
    }

    if ((enType == HI_UNF_VCODEC_TYPE_H264)
        || (enType == HI_UNF_VCODEC_TYPE_HEVC)
        || (enType == HI_UNF_VCODEC_TYPE_MPEG2)
        || (enType == HI_UNF_VCODEC_TYPE_MPEG4)
        || (enType == HI_UNF_VCODEC_TYPE_AVS)
        || (enType == HI_UNF_VCODEC_TYPE_MVC)
        || ((enType == HI_UNF_VCODEC_TYPE_VC1) && (pExtAttr->stVC1Attr.bAdvancedProfile != 0)))
    {
        *pbSupport = HI_TRUE;
    }
    else
    {
        *pbSupport = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_VOID HI_DRV_VDEC_ReportEsRels(HI_HANDLE hDmxVidChn)
{
    HI_S32 s32Ret = VDEC_ERR;
    HI_HANDLE hVdec;
    VDEC_CHANNEL_S *pstChan = HI_NULL;

    if (hDmxVidChn == HI_INVALID_HANDLE)
    {
        return;
    }

    for (hVdec = 0; hVdec < HI_VDEC_MAX_INSTANCE_NEW; hVdec++)
    {
        VDEC_CHAN_TRY_USE_DOWN(&s_stVdecDrv.astChanEntity[hVdec]);

        if (s32Ret != HI_SUCCESS)
        {
            continue;
        }

        pstChan = s_stVdecDrv.astChanEntity[hVdec].pstChan;

        if (pstChan == HI_NULL)
        {
            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);
            continue;
        }

        if (pstChan->hDmxVidChn == hDmxVidChn)
        {
            if (pstChan->hChan != HI_INVALID_HANDLE)
            {
                s32Ret = (s_stVdecDrv.pVfmwFunc->pfnVfmwControl)(pstChan->hChan, VDEC_CID_REPORT_DEMUX_RELEASE, HI_NULL, 0);

                if (s32Ret != VDEC_OK)
                {
                    HI_ERR_VDEC("Chan %d VDEC_CID_REPORT_DEMUX_RELEASE err!\n", pstChan->hChan);
                }
            }

            VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);
            break;
        }

        VDEC_CHAN_USE_UP(&s_stVdecDrv.astChanEntity[hVdec]);
    }

    if (hVdec >= HI_VDEC_MAX_INSTANCE_NEW)
    {
        HI_WARN_VDEC("hDmxVidChn = %x ERROR!\n", hDmxVidChn);
    }
}

static HI_S32 HI_VDEC_Chan_VOGetDeiMem(HI_HANDLE hHandle, HI_DRV_DEI_MEM_INFO_S *pMem)
{
    HI_S32 s32Ret;

    if (!pMem)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    if (!s_stVdecDrv.pVfmwFunc || !s_stVdecDrv.pVfmwFunc->pfnVfmwAllocDeiMem)
    {
        HI_ERR_VDEC("alloc_dei_mem is not init\n", hHandle);
        return HI_FAILURE;
    }

    s32Ret = s_stVdecDrv.pVfmwFunc->pfnVfmwAllocDeiMem(0, pMem);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Call alloc_dei_mem failed\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

static HI_S32 HI_VDEC_Chan_VOReleaseDeiMem(HI_HANDLE hHandle, HI_DRV_DEI_MEM_INFO_S *pMem)
{
    HI_S32 s32Ret;

    if (!pMem)
    {
        HI_ERR_VDEC("Bad param!\n");
        return HI_FAILURE;
    }

    if (!s_stVdecDrv.pVfmwFunc || !s_stVdecDrv.pVfmwFunc->pfnVfmwReleaseDeiMem)
    {
        HI_ERR_VDEC("release_dei_mem is not init\n", hHandle);
        return HI_FAILURE;
    }

    s32Ret = s_stVdecDrv.pVfmwFunc->pfnVfmwReleaseDeiMem(0, pMem);
    if (s32Ret != HI_SUCCESS)
    {
        HI_ERR_VDEC("Call release_dei_mem failed\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;

}



EXPORT_SYMBOL(HI_DRV_VDEC_GetChanStatusInfo);
EXPORT_SYMBOL(HI_DRV_VDEC_Open);
EXPORT_SYMBOL(HI_DRV_VDEC_ResetChan);
EXPORT_SYMBOL(HI_DRV_VDEC_GetEsBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_PutEsBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_SetEosFlag);
EXPORT_SYMBOL(HI_DRV_VDEC_AllocChan);
EXPORT_SYMBOL(HI_DRV_VDEC_SetChanAttr);
//EXPORT_SYMBOL(HI_DRV_VDEC_DestroyPort);
//EXPORT_SYMBOL(HI_DRV_VDEC_GetPortParam);
//EXPORT_SYMBOL(HI_DRV_VDEC_CreatePort);
//EXPORT_SYMBOL(HI_DRV_VDEC_Chan_RecvVpssFrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_GetChanStreamInfo);
EXPORT_SYMBOL(HI_DRV_VDEC_ChanStop);
EXPORT_SYMBOL(HI_DRV_VDEC_ChanStart);
EXPORT_SYMBOL(HI_DRV_VDEC_FreeChan);
EXPORT_SYMBOL(HI_DRV_VDEC_RecvFrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_RecvFrmBufWithTimeOut);
EXPORT_SYMBOL(HI_DRV_VDEC_RlsFrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_GetChanAttr);
//EXPORT_SYMBOL(HI_DRV_VDEC_SetPortType);
//EXPORT_SYMBOL(HI_DRV_VDEC_EnablePort);
EXPORT_SYMBOL(HI_DRV_VDEC_Close);
EXPORT_SYMBOL(HI_DRV_VDEC_CreateStrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_ChanBufferInit);
EXPORT_SYMBOL(HI_DRV_VDEC_ChanBufferDeInit);
EXPORT_SYMBOL(HI_DRV_VDEC_DestroyStrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_Chan_AttachStrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_Chan_DetachStrmBuf);
EXPORT_SYMBOL(HI_DRV_VDEC_GetCap);
EXPORT_SYMBOL(HI_DRV_VDEC_DRV_GetChan);
EXPORT_SYMBOL(HI_DRV_VDEC_RegisterEventCallback);
EXPORT_SYMBOL(HI_DRV_VDEC_RegisterDmxHdlCallback);
EXPORT_SYMBOL(HI_DRV_VDEC_SetOmxCallBacks);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
