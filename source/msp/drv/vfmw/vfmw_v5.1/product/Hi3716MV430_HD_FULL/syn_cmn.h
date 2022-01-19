#ifndef __SYNTAX_COMMON_HEADER__
#define __SYNTAX_COMMON_HEADER__

#include "vfmw.h"
#include "scd_drv.h"


#define IMG_ID_MAGIC_STEP      (100)

typedef struct
{
    STREAM_SEG_S    StreamPack[2];
} DEC_STREAM_PACKET_S;

typedef struct
{
    UINT8           FoundPicFlag;
    UINT8           IsCurrSegWaitDec;
    UINT8           ConvolutionPacketNum;
    STREAM_SEG_S    CurrSeg;
    DEC_STREAM_PACKET_S    Pack;
    DEC_STREAM_PACKET_S    LastPack;
    UINT8                  u32SCDWrapAround;
} STREAM_SEG_PACKET_S;

typedef struct hiIMAGE_SIDE_INFO_S
{
    UINT32     OldAspectRatio;
    UINT32     OldScanType;
    UINT32     OldSeqCnt;
    UINT32     OldFrameRate;
    UINT32     OldDispSize;
    UINT32     OldDispCenter;
    UINT32     LastImageIdPlus2;

    UINT32     ImageWidth;
    UINT32     ImageHeight;
    UINT32     VideoFormat;
    IMAGE_FORMAT ImageFormat;

    UINT32     SeqImgCnt;
    UINT32     SeqCnt;

    /* time stamp calculation */
    UINT32     PrevNumFramesBtwPTS;
    UINT64     PrevPts;
    UINT64     AveragePtsStep;  /* smoothed by a FIR filter */

} IMAGE_SIDE_INFO_S;

/* video output queue(VO queue)  */
typedef struct
{
    UINT16     max_queue_size;
    UINT16     queue_size;
    UINT16     history;
    UINT16     head;
    UINT16     tail;
    IMAGE      *image_ptr[MAX_QUEUE_IMAGE_NUM];
    IMAGE_SIDE_INFO_S  SideInfo;
    UINT32     ResetMagicWord;
} IMAGE_VO_QUEUE;


typedef struct hiSYNTAX_EXTRA_DATA_S
{
    SINT32     s32RefErrThr;
    SINT32     s32OutErrThr;
    SINT32     s32DecMode;   /* 0,1,2 = IPB,IP,I */
    OUTPUT_ORDER_E eOutputOrder;
    VDEC_CHAN_CAP_LEVEL_E eCapLevel;
    UADDR      ChanHalAddr;
    SINT32     ChanHalSize;
    UINT8      DVDualLayer;
    UINT64     pts;
    UINT64     NextPts;
    UINT64     Usertag;
    UINT64     NextUsertag;
    UINT64     DispTime;
    UINT64     NextDispTime;
    UINT32     DispEnableFlag;
    UINT32     DispFrameDistance;
    UINT32     DistanceBeforeFirstFrame;
    UINT32     NextDispEnableFlag;
    UINT32     NextDispFrameDistance;
    UINT32     NextDistanceBeforeFirstFrame;
    UINT32     GopNum;
    UINT32     NextGopNum;

    STREAM_SEG_PACKET_S  stSegPacket;
    SINT32     s32NewPicSegDetector;
    STD_EXTENSION_U    StdExt;
    UINT32     profile;
    UINT32     level;
    SINT32     error_frame_num;
    SINT32     s32BasicCtxSize;
    UADDR      s32ContextMemAddr;
    SINT32     s32ContextMemSize;
    SINT32     CompressEn;
    SINT32     DecCompressEn;
    SINT32     LossCompressEn;
    SINT32     YCompRatio;
    SINT32     UVCompRatio;
    SINT32     s32MoreGapEnable;
    SINT32     s32FastForwardBackwardSpeed;
    SINT32     s32KeepSPSPPS;                      /* keep global info in ctx for seek reset */
    SINT32     s32SupportAllP;                     /* support stream of all p frames */

    SINT32     s32ModuleLowlyEnable;
    SINT32     s32LowdlyEnable;
    SINT32     s32SedOnlyEnable;
    SINT32     s32UVMOSEnable;
    SINT32     s32ScdMmuEn;
    SINT32     s32VdhMmuEn;

    VFMW_CONTROLINFO_S stPvrInfo;
    VDEC_CHAN_OPTION_S stChanOption;
    VDEC_DISPIC_PARAM_S stDisParams;
    SINT32     s32WaitFsFlag;
    SINT32     s32BitDepth;
    SINT32     s32BitDepthChanged;
    SINT32     s32Is4k60fps;
    UINT8      StopRecord;
    SINT32     s32IsResizeHaveOldFrm;
    VBOOL bOnlyOneIFrame;
} SYNTAX_EXTRA_DATA_S;


SINT32 InitUsdPool(SINT32 ChanID);
VOID   ReleasePacket(VID_STD_E VidStd, VOID *pCtx);
VOID   FreeUsdByDec(SINT32 ChanID, VDEC_USRDAT_S *pUsrdat);
VDEC_USRDAT_S *GetUsd(SINT32 ChanID);

#endif


