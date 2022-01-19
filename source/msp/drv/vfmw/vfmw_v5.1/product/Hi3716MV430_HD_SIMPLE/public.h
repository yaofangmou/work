#ifndef __PUBLIC_H__
#define __PUBLIC_H__

#if defined(ENV_ARMLINUX) || defined( ENV_ARMLINUX_KERNEL )
#include "stdarg.h"
#endif

#include "basedef.h"
#include "sysconfig.h"
#include "vfmw.h"
#include "scd_drv.h"
#include "vdm_hal.h"
#include "vfmw_osal_ext.h"

#define VFMW_VERSION           "HiVDHFMWV500R001"
#define VFMW_MODIFICATION_DATE "2018-10-27-00"

/***********************************************************************
      constants
 ***********************************************************************/
#define TMP_MSG_SIZE                 (1024)

#define MIN_BOTTOM_SEG_LEN           (1 * 1024)
#define SM_MIN_SEG_BUF_SIZE          (256 * 1024)

#define MAX_PLAIN_SIZE               (MAX_CHIP_SUPPORT_WIDTH * MAX_CHIP_SUPPORT_HEIGHT)

#define VFMW_TRUE                    (0)
#define VFMW_FALSE                   (1)

// debug message print control
#define DEFAULT_PRINT_ENABLE         (0x0)
#define DEFAULT_PRINT_DEVICE         (DEV_SCREEN)

#define MAX_USERDATA_NUM             (4)

#define VFMW_INT_MAX  ((SINT32)(~0U >> 1))
#define VFMW_INT_MIN  (-VFMW_INT_MAX - 1)
#define VFMW_UINT_MAX (~0U)

/***********************************************************************
      enum
 ***********************************************************************/
typedef enum
{
    MEM_GROUP_FSP = 0,
    MEM_GROUP_BUTT
} MEM_GROUP_E;

typedef enum
{
    DEV_SCREEN = 1,
    DEV_SYSLOG,
    DEV_FILE,
    DEV_MEM
} PRINT_DEVICE_TYPE;

typedef enum
{
    PRN_FATAL = 0,       // 0.
    PRN_ERROR,           // 1.  such as syntax error
    PRN_WARN,            // 2.
    PRN_CTRL,            // 3.  state info
    PRN_VDMREG,          // 4.  VDH register
    PRN_DNMSG,           // 5.  down message
    PRN_RPMSG,           // 6.  repair message
    PRN_UPMSG,           // 7.  up message
    PRN_STREAM,          // 8.  stream info
    PRN_IMAGE,           // 9.  image info
    PRN_QUEUE,           // 10. image queue info
    PRN_REF,             // 11. reference info
    PRN_DPB,             // 12. decoded picture buffer info
    PRN_POC,             // 13. picture order count
    PRN_FSP,             // 14. fsp info
    PRN_SEQ,             // 15. sequence info
    PRN_PIC,             // 16.
    PRN_SLICE,           // 17. slice info
    PRN_SEI,             // 18. supplemental enhancement info
    PRN_SE,              // 19.
    PRN_DBG,             // 20. debug info
    PRN_SCD_INFO,        // 21. scd info
    PRN_TEE,             // 22. tee info
    PRN_BLOCK,           // 23. blocking info
    PRN_PTS,             // 24. pts info
    PRN_DEC_MODE,        // 25. decode mode info
    PRN_FRAME,           // 26. Get and release frame info
    PRN_UNUSED_27,       // 27.
    PRN_UNUSED_28,       // 28.
    PRN_UNUSED_29,       // 29.
    PRN_UNUSED_30,       // 30.
    PRN_UNUSED_31,       // 31.
    PRN_ALWS = 32        // 32.
} PRINT_MSG_TYPE;

/* state type */
typedef enum
{
    STATE_RCV_RAW = 0,
    STATE_SCD_START,
    STATE_SCD_INTERRUPT,

    STATE_DECSYNTAX_SEG,
    STATE_GENERATE_DECPARAM,

    STATE_VDH_START,
    STATE_VDH_INTERRUPT,
    STATE_VDH_REPAIR,
    STATE_1D_TO_QUEUE,

    STATE_VO_RCV_IMG,
    STATE_VO_REL_IMG
} VFMW_STATE_TYPE_E;

typedef struct
{
    UINT8    *VirAddr;
    UADDR     PhyAddr;
    SINT32    Length;
} STREAM_PARAM;

typedef struct
{
    SINT8    *buf_addr;
    SINT8    *cur_addr_offset;
    UINT32    buf_len;
    UINT32    total_msg_num;
} MEMPRINT;

typedef enum
{
    VFMW_STRING_VDH_IRQ = 0,
    VFMW_STRING_VDH_IRQ_SAFE,
    VFMW_STRING_VDH1_IRQ,
    VFMW_STRING_VDH2_IRQ,
    VFMW_STRING_SCD_IRQ,
    VFMW_STRING_SCD_IRQ_SAFE,
    VFMW_STRING_SCD1_IRQ,
    VFMW_STRING_CHAN_CTX,
    VFMW_STRING_CHAN_VDH,
    VFMW_STRING_CHAN_SCD,
    VFMW_STRING_DSPCTXMEM,
    VFMW_STRING_RESERVE1,
    VFMW_STRING_RESERVE2,
    VFMW_STRING_VDH_MMU_IRQ,
    VFMW_STRING_VDH_MMU_IRQ_SAFE,
    VFMW_STRING_VDH_HAL_MEM,
    VFMW_STRING_VP9_PROB_MEM,
    VFMW_STRING_SCD_MSG_MEM,
    VFMW_STRING_TRACER,
    VFMW_STRING_SAVE_YUV_MEM,
    VFMW_STRING_RAW_SAVE_PATH,
    VFMW_STRING_SEG_SAVE_PATH,
    VFMW_STRING_DISP_YUV_SAVE_PATH,
    VFMW_STRING_DEC_YUV_SAVE_PATH,
    VFMW_STRING_META_SAVE_NAME,
    VFMW_STRING_META_REORDER_SAVE_NAME,
    VFMW_STRING_HDR_EL_SAVE_NAME,

    VFMW_STRING_BUTT
} VFMW_STRING_E;

/***********************************************************************
      global vars
 ***********************************************************************/
extern SINT32 g_LogEnable;
extern UINT32 g_PrintEnable;
extern UINT32 g_PrintDevice;

extern SINT32(*g_EventReportFunc)(SINT32 InstID, SINT32 type, VOID *p_args, UINT32 len);

extern SINT32 g_TraceCtrl;
extern SINT32 g_TraceBsPeriod;
extern SINT32 g_TraceFramePeriod;
extern SINT32 g_TraceImgPeriod;

/***********************************************************************
      macro
 ***********************************************************************/
// add for check null point parament
#define CHECK_NULL_PTR_ReturnValue(parPoint,ReturnValue)                  \
    do                                                  \
    {                                                   \
        if (NULL == parPoint)                           \
        {                                               \
            dprint(PRN_FATAL, "NULL pointer: %s, L%d\n", __FILE__, __LINE__); \
            return ReturnValue;                         \
        }                                               \
    } while(0)

#define CHECK_NULL_PTR_Return(parPoint)             \
    do                                                  \
    {                                                   \
        if (NULL == parPoint)                           \
        {                                               \
            dprint(PRN_FATAL,"NULL pointer: %s, L%d\n", __FILE__, __LINE__); \
            return;                                     \
        }                                               \
    } while(0)

#define REPORT_DISP_AREA_CHANGE(chan_id, w, h, center_x, center_y)  \
    do {                                                         \
        if (NULL != g_EventReportFunc)                         \
        {                                                       \
            UINT16  para[4];                                    \
            para[0] = (UINT16)(w);                              \
            para[1] = (UINT16)(h);                              \
            para[2] = (UINT16)(center_x);                      \
            para[3] = (UINT16)(center_y);                      \
            g_EventReportFunc(chan_id, EVNT_DISP_EREA, (UINT8 *)para, sizeof(para));   \
        }                                                       \
    } while(0)

#define REPORT_IMGSIZE_CHANGE(chan_id, oldw, oldh, neww, newh)    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT16  para[4];                                    \
            para[0] = (UINT16)(oldw);                            \
            para[1] = (UINT16)(oldh);                              \
            para[2] = (UINT16)(neww);                              \
            para[3] = (UINT16)(newh);                              \
            g_EventReportFunc(chan_id, EVNT_IMG_SIZE_CHANGE, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_FRMRATE_CHANGE(chan_id, newfr)            \
    do {                                                          \
        if (NULL != g_EventReportFunc)                         \
        {                                                       \
            UINT32  para[1];                                    \
            para[0] = (UINT32)(newfr);                             \
            g_EventReportFunc(chan_id, EVNT_FRMRATE_CHANGE, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_SCAN_CHANGE(chan_id, newscan)             \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT8  para[1];                                     \
            para[0] = (UINT8)(newscan);                         \
            g_EventReportFunc(chan_id, EVNT_SCAN_CHANGE, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_NEW_FRAME(chan_id, pstFrame)                    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_NEW_IMAGE, (VOID *)pstFrame, 0); \
        }                                                       \
    } while(0)

#define REPORT_USRDAT( chan_id, p_usrdat )                  \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_USRDAT, (VDEC_USRDAT_S *)p_usrdat, sizeof(VDEC_USRDAT_S));     \
        }                                                       \
    } while(0)

#define REPORT_ASPR_CHANGE( chan_id, oldasp, newasp )          \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT8 para[2];                                     \
            para[0] = (UINT8)(oldasp);                            \
            para[1] = (UINT8)(newasp);                           \
            g_EventReportFunc(chan_id, EVNT_ASPR_CHANGE, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_OUTPUT_IMG_SIZE_CHANGE( chan_id, oldw, oldh, neww, newh )    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT16 para[4];                                    \
            para[0] = (UINT16)(oldw);                           \
            para[1] = (UINT16)(oldh);                           \
            para[2] = (UINT16)(neww);                           \
            para[3] = (UINT16)(newh);                           \
            g_EventReportFunc(chan_id, EVNT_OUTPUT_IMG_SIZE_CHANGE, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_FIND_IFRAME(chan_id, stream_size)          \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[1];                                    \
            para[0] = stream_size;                              \
            g_EventReportFunc(chan_id, EVNT_FIND_IFRAME, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)

#define REPORT_STRMERR(chan_id, err_code)                  \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32 para[1];                                    \
            para[0] = (UINT32)(err_code);                         \
            g_EventReportFunc(chan_id, EVNT_STREAM_ERR, (UINT8 *)para, sizeof(para));        \
        }                                                       \
    } while(0)

#define REPORT_VDMERR(chan_id)                               \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_VDM_ERR, (UINT8 *)0, 0);      \
        }                                                       \
    } while(0)

#define REPORT_UNSUPPORT(chan_id)                           \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_UNSUPPORT, (UINT8 *)0, 0);       \
        }                                                       \
    } while(0)

#define REPORT_SE_ERR(chan_id)                               \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_SE_ERR, (UINT8 *)0, 0);          \
        }                                                       \
    } while(0)

#define REPORT_OVER_REFTHR(chan_id, CurrRate, RefRate)      \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            UINT32 para[2];                                    \
            para[0] = (UINT32)(CurrRate);                        \
            para[1] = (UINT32)(RefRate);                        \
            g_EventReportFunc(chan_id, EVNT_OVER_REFTHR, (UINT8 *)para, sizeof(para));  \
        }                                                        \
    } while(0)

#define REPORT_OVER_OUTTHR(chan_id)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_OVER_OUTTHR, (UINT8 *)0, 0);  \
        }                                                       \
    } while(0)

#define REPORT_REF_NUM_OVER(chan_id, RefNum, MaxRefNum)        \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[2];                                    \
            para[0] = RefNum;                                   \
            para[1] = MaxRefNum;                                \
            g_EventReportFunc(chan_id, EVNT_REF_NUM_OVER, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)

#define REPORT_IMGSIZE_OVER(chan_id, w, h, maxw, maxh)    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT16 para[4];                                    \
            para[0] = (UINT16)(w);                                \
            para[1] = (UINT16)(h);                              \
            para[2] = (UINT16)(maxw);                              \
            para[3] = (UINT16)(maxh);                              \
            g_EventReportFunc(chan_id, EVNT_SIZE_OVER, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_SLICE_NUM_OVER( chan_id, SliceNum, MaxSliceNum )    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[2];                                    \
            para[0] = SliceNum;                                 \
            para[1] = MaxSliceNum;                              \
            g_EventReportFunc(chan_id, EVNT_SLICE_NUM_OVER, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_SPS_NUM_OVER(chan_id, SpsNum, MaxSpsNum)    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[2];                                    \
            para[0] = SpsNum;                                   \
            para[1] = MaxSpsNum;                                \
            g_EventReportFunc(chan_id, EVNT_SPS_NUM_OVER, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_PPS_NUM_OVER(chan_id, PpsNum, MaxPpsNum)    \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[2];                                    \
            para[0] = PpsNum;                                    \
            para[1] = MaxPpsNum;                                 \
            g_EventReportFunc(chan_id, EVNT_PPS_NUM_OVER, (UINT8 *)para, sizeof(para)); \
        }                                                       \
    } while(0)

#define REPORT_IFRAME_ERR(chan_id)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_IFRAME_ERR, (UINT8 *)0, 0);  \
        }                                                       \
    } while(0)

#define REPORT_MEET_NEWFRM(chan_id)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_MEET_NEWFRM, (UINT8 *)0, 0);  \
        }                                                       \
    } while(0)

#define REPORT_DECSYNTAX_ERR(chan_id)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            g_EventReportFunc(chan_id, EVNT_DECSYNTAX_ERR, (UINT8 *)0, 0);  \
        }                                                        \
    } while(0)

#define REPORT_RATIO_NOTZERO(chan_id, ErrRatio)                           \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            UINT32  para[1];                                    \
            para[0] = ErrRatio;                                   \
            g_EventReportFunc(chan_id, EVNT_RATIO_NOTZERO, (UINT8 *)para, sizeof(para));  \
        }                                                        \
    } while(0)

#define REPORT_LAST_FRAME(chan_id, flag)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            UINT32  para[1];                                    \
            para[0] = (UINT32)(flag);                         \
            g_EventReportFunc(chan_id, EVNT_LAST_FRAME, (UINT8 *)para, sizeof(para));  \
        }                                                        \
    } while(0)

#define REPORT_RESOLUTION_CHANGE(chan_id, Size, Num, Width, Height, Stride, BitDepth)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32 para[6];                                    \
            para[0] = Size;                             \
            para[1] = Num;                              \
            para[2] = (Width);                          \
            para[3] = (Height);                         \
            para[4] = (Stride);                         \
            para[5] = (BitDepth);                       \
            g_EventReportFunc(chan_id, EVNT_RESOLUTION_CHANGE, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)

#define REPORT_STREAM_END_SYNTAX(chan_id)                   \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            g_EventReportFunc(chan_id, EVNT_STREAM_END_SYNTAX, (UINT8 *)0, 0);  \
        }                                                        \
    } while(0)

#define REPORT_UNSUPPORT_SPEC(chan_id, unsupport_spec, data)                           \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT32  para[2];                                    \
            para[0] = unsupport_spec;                           \
            para[1] = data;                                     \
            g_EventReportFunc(chan_id, EVNT_UNSUPPORT_SPEC, (UINT8 *)para, sizeof(para));    \
        }                                                       \
    } while(0)

#define REPORT_FAKE_FRAME(chan_id)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                   \
            g_EventReportFunc(chan_id, EVNT_FAKE_FRAME, (UINT8 *)0, 0);  \
        }                                                       \
    } while(0)

#define REPORT_VID_STD_ERROR(chan_id)                       \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                        \
            g_EventReportFunc(chan_id, EVNT_VIDSTD_ERROR, (UINT8 *)0, 0);  \
        }                                                        \
    } while(0)

#define REPORT_SCD_BUFFER_REMAP(ChanID, virAddr)                           \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT64 para[1];                                    \
            para[0] = virAddr;                                  \
            g_EventReportFunc(ChanID, EVNT_SCD_BUFFER_REMAP, (UINT8 *)para, sizeof(para));    \
        }                                                       \
    } while(0)

#define REPORT_VDH_BUFFER_REMAP(ChanID, virAddr)                           \
    do {                                                         \
        if (NULL != g_EventReportFunc)                            \
        {                                                       \
            UINT64 para[1];                                    \
            para[0] = virAddr;                                  \
            g_EventReportFunc(ChanID, EVNT_VDH_BUFFER_REMAP, (UINT8 *)para, sizeof(para));    \
        }                                                       \
    } while(0)

#define REPORT_ERR_FRAME(chan_id)                               \
    do {                                                         \
        if (NULL != g_EventReportFunc)                             \
        {                                                       \
            g_EventReportFunc(chan_id, EVNT_ERR_FRAME, (UINT8 *)0, 0);  \
        }                                                       \
    } while(0)

#define REPORT_ALLOC_PRE_PROCESS(ChanId, pMemInfo)                         \
    do {                                                         \
        if (NULL != g_EventReportFunc)                          \
        {                                                       \
            UINT64  para[2];                                    \
            para[0] = (UINT64)(ChanId);                         \
            para[1] = (UINT64)(ULONG)(pMemInfo);                         \
            g_EventReportFunc(ChanId, EVNT_ALLOC_PRE_PROCESS, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)

#define REPORT_REQUIRE_ALLOC_MEM(ChanId, pMem)                  \
    do {                                                         \
        if (NULL != g_EventReportFunc)                          \
        {                                                       \
            g_EventReportFunc(ChanId, EVNT_ALLOC_MEM, (MEM_REPORT_S *)(pMem), sizeof(MEM_REPORT_S));  \
        }                                                       \
    } while(0)

#define REPORT_REQUIRE_RELEASE_MEM(ChanId, pMem)                \
    do {                                                         \
        if (NULL != g_EventReportFunc)                          \
        {                                                       \
            g_EventReportFunc(ChanId, EVNT_RELEASE_MEM, (MEM_REPORT_S *)(pMem), sizeof(MEM_REPORT_S));  \
        }                                                       \
    } while(0)

#define REPORT_REQUIRE_RELEASE_BURST_MEM(ChanId, PrivID, PrivMask)       \
    do {                                                         \
        if (NULL != g_EventReportFunc)                          \
        {                                                       \
            SINT64 para[2];                                     \
            para[0] = PrivID;                                   \
            para[1] = PrivMask;                                 \
            g_EventReportFunc(ChanId, EVNT_RELEASE_BURST_MEM, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)

#define REPORT_REQUIRE_CANCEL_ALLOC(ChanId, PrivID, PrivMask)   \
    do {                                                         \
        if (NULL != g_EventReportFunc)                          \
        {                                                       \
            SINT64 para[2];                                     \
            para[0] = PrivID;                                   \
            para[1] = PrivMask;                                 \
            g_EventReportFunc(ChanId, EVNT_CANCEL_ALLOC, (UINT8 *)para, sizeof(para));  \
        }                                                       \
    } while(0)


#ifdef ENV_SOS_KERNEL
#define dprint_secure(type, fmt, arg...) \
    do{ \
        if ((((PRN_ALWS == type) || (0 != (g_PrintEnable & (1 << type)))) \
             && (DEV_SCREEN == g_PrintDevice))) \
        { \
            OSAL_FP_print("VFMW_S: [%d] ", __LINE__);  \
            OSAL_FP_print(fmt, ##arg); \
        } \
    } while (0)
#endif

VOID dprint_nothing(VOID);

#ifdef HI_ADVCA_FUNCTION_RELEASE
#define dprint(type, fmt, arg...) dprint_nothing()
#else
#ifdef VFMW_DPRINT_SUPPORT
#if defined(ENV_ARMLINUX_KERNEL)
#define dprint(type, fmt, arg...) dprint_normal(type, __LINE__, fmt, ##arg)
#elif defined(ENV_SOS_KERNEL)
#define dprint(type, fmt, arg...) dprint_secure(type, fmt, ##arg)
#endif
#else
#define dprint(type, fmt, arg...)
#endif
#endif

#ifdef HI_PROC_SUPPORT
#define proc_dump(page, fmt, arg...) OSAL_FP_seq_printf(page, fmt, ##arg)
#else
#define proc_dump(page, fmt, arg...) dprint_nothing()
#endif

#define dprint_dec(v) dprint(PRN_ALWS, "%s = %d\n",   #v, (v))
#define dprint_hex(v) dprint(PRN_ALWS, "%s = 0x%x\n", #v, (v))
#define dprint_str(v) dprint(PRN_ALWS, "%s = %s\n",   #v, (v))

#define STAT_DUMP(Page, Fmt, Arg...) \
    do { \
        if (Page == NULL) \
        { \
            dprint(PRN_ALWS, Fmt, ##Arg); \
        } \
        else \
        { \
            proc_dump(Page, Fmt, ##Arg); \
        } \
    } while(0)

#define VFMW_ASSERT(Condition)                                           \
    do                                                                       \
    {                                                                        \
        if (!(Condition))                                                    \
        {                                                                    \
            dprint(PRN_ERROR, "[%s %d]assert warning\n",__func__,__LINE__);  \
            return;                                                          \
        }                                                                    \
    } while(0)

#define VFMW_ASSERT_RETURN(Condition, Ret)                               \
    do                                                                       \
    {                                                                        \
        if (!(Condition))                                                    \
        {                                                                    \
            dprint(PRN_ERROR, "[%s %d]assert warning\n",__func__,__LINE__);  \
            return Ret;                                                      \
        }                                                                    \
    } while(0)

#ifdef ENV_ARMLINUX_KERNEL
#define  DBG_OK       (0)
#define  DBG_ERR      (-1)

SINT32 dprint_normal(UINT32 type, UINT32 line, const SINT8 *format, ...);
SINT32 DBG_CreateTracer(VOID);
VOID   DBG_DestroyTracer(VOID);
VOID   DBG_AddTrace(SINT8 *pFuncName, SINT32 nLine, SINT32 Data);
VOID   DBG_PrintTracer(VOID);
#endif

VBOOL  IsPrintStateAllow(SINT32 ChanID);
char  *VFMW_GetString(VFMW_STRING_E enStringName);
VOID   vfmw_dprint_nothing(VOID);
SINT32 IsDprintTypeEnable(UINT32 type);
SINT32 CHECK_REC_POS_ENABLE(SINT32 type);
VOID   RecordPOS(SINT32 SmID, VFMW_STATE_TYPE_E VfmwStateType, UINT32 *LastRecPosTimeInMs, SINT8 *FunctionName, SINT32 LineNumber);
VOID   qsort(VOID *base, UINT32 num, UINT32 width, SINT32(*comp)(const VOID *, const VOID *));
SINT32 GetCompressRatio(SINT32 CompressRegCfg);
SINT32 string_to_value(char *str, UINT32 *data);

inline VBOOL check_signed_integer_operation_overflow(SINT32 a, SINT32 b);
inline VBOOL check_unsigned_integer_operation_overflow(UINT32 a, UINT32 b);

#endif

