
/*
 * Copyright (c) (2014 - ...) Device Chipset Source Algorithm and Chipset Platform Development Dept
 * Hisilicon. All rights reserved.
 *
 * File:    drv_omxvdec.h
 *
 * Purpose: omxvdec export header file
 *
 * Author:  sdk
 *
 * Date:    26, 11, 2014
 *
 * NOTICE !!
 * 该文件同时被component 和driver 引用
 * 如修改，两边均需重新编译!!!
 */

#ifndef __DRV_OMXVDEC_H__
#define __DRV_OMXVDEC_H__

#include <linux/ioctl.h>

#include "hi_type.h"
#include "mpi_mmz.h"
#include "hi_drv_video.h"
#include "drv_omxvdec_ext.h"

#define OMXVDEC_NAME                    "hi_omxvdec"
#define DRIVER_PATH                     "/dev/hi_omxvdec"

#define PATH_LEN                        (64)
#define NAME_LEN                        (64)

#define MAX(a, b)                       (((a) > (b)) ?  (a) : (b))
#define MIN(a, b)                       (((a) > (b)) ?  (b) : (a))

#define UHD_FRAME_WIDTH                 (4096)
#define UHD_FRAME_HEIGHT                (2304)
#define HD_FRAME_WIDTH                  (1920)
#define HD_FRAME_HEIGHT                 (1088)
#define SD_FRAME_WIDTH                  (1280)
#define SD_FRAME_HEIGHT                 (768)

#define MAX_SUPPORT_WIDTH               (UHD_FRAME_WIDTH)
#define MAX_SUPPORT_HEIGHT              (UHD_FRAME_HEIGHT)

#define DEFAULT_FRAME_WIDTH             (HD_FRAME_WIDTH)
#define DEFAULT_FRAME_HEIGHT            (HD_FRAME_HEIGHT)

#define HI_OMX_ALIGN_10BIT(w)           ((w)*10+8-1)/8

#define DEFAULT_FRAME_SIZE(w, h)        (((w)*(h)*3)/2)
#define FRAME_SIZE_10BIT(w, h)          ((((w)*(h)*3)/2)*5/4)
#define HI_OMX_GET_STRIDE(w)            ((w + (16-1))&(~(16-1)))

#define DEF_MAX_IN_BUF_CNT                 (3)
#define DEF_MIN_IN_BUF_CNT                 (1)
#define DEF_MAX_OUT_BUF_CNT                (8)
#define DEF_MIN_OUT_BUF_CNT                (3)
#define DEF_MAX_IN_BUF_CNT_MAX             (320)

typedef enum  // omx color space enum
{
    OMX_PIX_FMT_NV12    ,          /* YUV 4:2:0 semiplanar */
    OMX_PIX_FMT_NV21    ,          /* YVU 4:2:0 semiplanar */
    OMX_PIX_FMT_YUV420Planar ,     /* YUV 4:2:0 planar     */
    OMX_PIX_FMT_YUV420Tile ,       /* YUV 4:2:0 tile       */
    OMX_PIX_BUTT
} OMX_PIX_FORMAT_E;

enum {
    VDEC_S_SUCCESS = 0,
    VDEC_S_FAILED  = 1,
};



/* ========================================================
 * internal struct enum definition
 * ========================================================*/
typedef enum
{
    PORT_DIR_INPUT,
    PORT_DIR_OUTPUT,
    PORT_DIR_BOTH = 0xFFFFFFFF
} ePORT_DIR;

typedef enum
{
    OMX_ALLOCATE_USR,
    OMX_USE_OTHER,
    OMX_USER_BIGBUF,
    OMX_USE_NATIVE,
    OMX_USE_SECURE,
    OMX_ALLOCATE_SECURE,
    OMX_ALLOCATE_WITH_META,
    OMX_BUTT_TYPE,
} eBUFFER_TYPE;

typedef enum
{
    OMX_START_RESERVED = 0,
    OMX_H264 = 1,
    OMX_VC1,
    OMX_MPEG4,
    OMX_MPEG2,
    OMX_H263,
    OMX_DIVX3,
    OMX_AVS,
    OMX_JPEG,
    OMX_REAL8 = 9,
    OMX_REAL9 = 10,
    OMX_VP6   = 11,
    OMX_VP6F,
    OMX_VP6A,
    OMX_VP8,
    OMX_SORENSON,
    OMX_MVC,
    OMX_HEVC,
    OMX_VP9,
    OMX_AVS2,
    OMX_RAW,
    OMX_USER,
    OMX_Dolby_Vision,
    OMX_MJPEG,
    OMX_END_RESERVED
} OMX_VID_STD_E;

//typedef VID_STD_E  VDEC_CODEC_TYPE;

/* CodecType Relative */
//typedef enum {
//    STD_WMV = STD_END_RESERVED + 1,
//    STD_MJPEG,
//    STD_EXT_RESERVED,
//} OMXVDEC_CODEC_EXT;

typedef union
{
    struct
    {
        HI_S32 IsAdvProfile;
        HI_S32 CodecVersion;
    } Vc1Ext;

    struct
    {
        HI_S32 bReversed;   /**<if the image need to be reversed, set to 1, otherwise set to 0 */
        HI_U32 u32DispWidth;
        HI_U32 u32DispHeight;
    } Vp6Ext;
} OMX_STD_EXT_U;

typedef struct
{
    HI_S8         s8BeHDRChan;        /* 0:not hdr chan, 1:hdr chan */
    HI_S8         isMiracastChan;
    HI_U8         bCompatible;        /* <Dolby frame is compatible or not. */
    HI_S32        bSampleFRDEnable;   /* 0:disable sample frd. 1:enable sample frd. */
    OMX_VID_STD_E eVidStd;            /* video compressing standard */
    OMX_STD_EXT_U StdExt;             /* extended info, for VC1 indicate AP or not, and other version info */
    HI_S32        s32ChanPriority;    /* channel priority */
    HI_S32        s32ChanErrThr;      /* channel error torlerance threshold. 0: zero torlerance; 100: display no matter how many error occured */
    HI_S32        s32ChanStrmOFThr;   /* stream overflow control threshold, must >= 0, 0 means do not enable overflow control */
    HI_U32        s32DecMode;         /* decode mode 0: IPB, 1: IP, 2: I */
    HI_U32        s32DecOrderOutput;  /* 0: output by display order, 1: output by decode order */
    HI_S32        s32CrcMode;         /* CRC MODE SELECT */
    HI_S32        s32LowdlyEnable;    /* lowdly enable */
    HI_S32        s32SedOnlyEnable;   /* sedonly enable */
    HI_S32        s32VcmpEn;          /* frame compress enable, 0: not care if is compress, 1: force compress, 2: force not compress */
    HI_S32        s32WmEn;            /* water marker enable */
    HI_S32        s32VcmpWmStartLine; /* water marker start line number */
    HI_S32        s32VcmpWmEndLine;   /* water marker end line number */
    HI_S32        s32SupportAllP;     /* support stream of all p frames */
    HI_S32        s32ModuleLowlyEnable;
    HI_S32        s32ChanLowlyEnable;
    HI_S32        s32IsOmxPath;       /* specify for omx path */
    HI_S32        s32IsTunneledPath;
    HI_S32        s32MaxRawPacketNum;
    HI_S32        s32MaxRawPacketSize;
    HI_S32        s32ExtraFrameStoreNum;
    HI_S32        s32MaxWidth;
    HI_S32        s32MaxHeight;/*if the stream to be decoded w*h > s32MaxWidth*s32MaxHeight vfmw will stop syntax stream*/
    HI_U32        dv_codec_capacity;/*only s8BeHDRChan==1 useful*/
    HI_U32        ves_imp;/*only s8BeHDRChan==1 useful*/
    HI_U32        layer_imp;/*only s8BeHDRChan==1 useful*/
    HI_U32        s32YCompRatio;
    HI_U32        s32UVCompRatio;
    HI_BOOL       bUVMOSEnable;
    HI_BOOL       AndroidTest;
    HI_BOOL       b98mv200Vp9Burst;
    HI_S32        BitDepthCfg;
    HI_S32        Source;
    HI_U32        hVdecHandle;
} OMX_CHAN_CFG_S;

typedef struct {
    HI_BOOL          is_tvp;
    HI_BOOL          bVpssBypass;
    HI_U32           output_view;
    HI_U32           cfg_width;
    HI_U32           cfg_height;
    HI_U32           cfg_stride;
    HI_U32           cfg_inbuf_num;
    HI_U32           cfg_outbuf_num;
    HI_U32           cfg_rotation;
    OMX_PIX_FORMAT_E cfg_color_format;
    HI_BOOL          m_use_native_buf;
    HI_U32           cfg_framerate;
    HI_BOOL          is_10bit;
    OMX_CHAN_CFG_S   chan_cfg;
    HI_U32           TunnelModeEnable;
    HI_BOOL          bIsOnLive;
    HI_BOOL          bIsGst;
    HI_BOOL          android_test;
    HI_BOOL          bMetaDataAlloc;
    HI_BOOL          bIndirectInput;
    HI_BOOL          bProDetectOff;
    HI_BOOL          force_bypass;
    HI_BOOL          is_adaptive;
    HI_U32           max_width;
    HI_U32           max_height;
} OMXVDEC_DRV_CFG;

typedef struct {
    HI_S32           video_driver_fd;
    HI_S32           chan_handle;
    OMXVDEC_DRV_CFG  drv_cfg;
    HI_VOID*         yuv_fp;
    HI_U8*           chrom_l;
    HI_U32           chrom_l_size;
} OMXVDEC_DRV_CONTEXT;

/* video frame buffer description */
typedef struct {
    HI_U32   phyaddr_Y;
    HI_U32   phyaddr_C;
    HI_U32   stride;
    HI_U32   width;
    HI_U32   height;
    HI_CHAR  save_path[PATH_LEN];
} OMXVDEC_FRAME_S;

typedef struct {
    HI_U32 errorratio;
} OMXVDEC_ERR_SIZE;

typedef struct {
    HI_U32 frame_width;
    HI_U32 frame_height;
    HI_U32 frame_stride;
    HI_U32 bit_depth;
    HI_U32 size;
    HI_U32 min_num;
    HI_U32 max_num;
} OMXVDEC_IMG_SIZE;

typedef struct {
    HI_U32 frame_width;
    HI_U32 frame_height;
    HI_U32 frame_stride;
    HI_U32 frame_size;
    HI_U32 max_frame_num;
    HI_U32 min_frame_num;
} OMXVDEC_DEC_SIZE;

typedef struct {
    HI_U8 mRange;
    HI_U8 mPrimaries;
    HI_U8 mTransfer;
    HI_U8 mMatrixCoeffs;
} OMXVDEC_DEC_COLOR_ASPECTS;

typedef struct {
    HI_U32           phyaddr;
    HI_U32           buffer_len;
    HI_U32           align;
    HI_U32           data_offset;
    HI_U32           data_len;
    HI_U32           private_phyaddr;
    HI_U64           private_user_viraddr;
    HI_U32           private_len;
    HI_U32           flags;
    HI_S64           timestamp;
    eBUFFER_TYPE     buffer_type;
    eBUFFER_TYPE     meta_type;
    ePORT_DIR        dir;
    HI_U64           bufferaddr;
    HI_U64           client_data;
    OMXVDEC_FRAME_S  out_frame;

    HI_U32           u32FrameIndex;
    HI_HANDLE        hTunnelSrc;
    HI_U32           u32FrameRate;

    HI_U32           private_fd;//add by sdk
    HI_U32           private_offset;
    HI_BOOL          need_release_frame;
    HI_BOOL          is_sec;
    HI_BOOL          is_first_buf;
    OMXVDEC_DEC_COLOR_ASPECTS dec_color_aspects;
}OMXVDEC_BUF_DESC;

typedef struct {
    HI_U32           status_code;
    HI_U32            msgcode;
    HI_U32            msgdatasize;

    union {
    OMXVDEC_ERR_SIZE err_size;      //image error ratio
    OMXVDEC_IMG_SIZE img_size;
    OMXVDEC_DEC_SIZE dec_size;
    OMXVDEC_BUF_DESC buf;
    } msgdata;

}OMXVDEC_MSG_INFO;

/* ========================================================
 * IOCTL for interaction with omx components
 * ========================================================*/
typedef struct {
    HI_U64    in;
    HI_U64    out;
    HI_S32    chan_num;
} OMXVDEC_IOCTL_MSG;

#define VDEC_IOCTL_MAGIC 'v'

#define VDEC_IOCTL_CHAN_CREATE   \
    _IO(VDEC_IOCTL_MAGIC, 1)

#define VDEC_IOCTL_CHAN_RELEASE  \
    _IO(VDEC_IOCTL_MAGIC, 2)

#define VDEC_IOCTL_SET_EXTRADATA \
    _IO(VDEC_IOCTL_MAGIC, 3)

#define VDEC_IOCTL_GET_EXTRADATA \
    _IO(VDEC_IOCTL_MAGIC, 4)

#define VDEC_IOCTL_FLUSH_PORT \
    _IO(VDEC_IOCTL_MAGIC, 5)

#define VDEC_IOCTL_CHAN_BIND_BUFFER \
    _IO(VDEC_IOCTL_MAGIC, 6)

#define VDEC_IOCTL_CHAN_UNBIND_BUFFER \
    _IO(VDEC_IOCTL_MAGIC, 7)

#define VDEC_IOCTL_FILL_OUTPUT_FRAME \
    _IO(VDEC_IOCTL_MAGIC, 8)

#define VDEC_IOCTL_EMPTY_INPUT_STREAM \
    _IO(VDEC_IOCTL_MAGIC, 9)

#define VDEC_IOCTL_CHAN_START \
    _IO(VDEC_IOCTL_MAGIC, 10)

#define VDEC_IOCTL_CHAN_STOP  \
    _IO(VDEC_IOCTL_MAGIC, 11)

#define VDEC_IOCTL_CHAN_PAUSE \
    _IO(VDEC_IOCTL_MAGIC, 12)

#define VDEC_IOCTL_CHAN_RESUME \
    _IO(VDEC_IOCTL_MAGIC, 13)

#define VDEC_IOCTL_CHAN_GET_MSG \
    _IO(VDEC_IOCTL_MAGIC, 14)

#define VDEC_IOCTL_CHAN_STOP_MSG \
    _IO(VDEC_IOCTL_MAGIC, 15)

#define VDEC_IOCTL_CHAN_ALLOC_BUF    \
    _IO(VDEC_IOCTL_MAGIC, 16)

#define VDEC_IOCTL_CHAN_RELEASE_BUF \
    _IO(VDEC_IOCTL_MAGIC, 17)


#define VDEC_IOCTL_CHAN_RELEASE_FRAME \
    _IO(VDEC_IOCTL_MAGIC, 18)

#define VDEC_IOCTL_CHAN_GET_BYPASS_INFO   \
    _IO(VDEC_IOCTL_MAGIC, 19)

#define VDEC_IOCTL_CHAN_SET_BYPASS_INFO   \
    _IO(VDEC_IOCTL_MAGIC, 20)

#define VDEC_IOCTL_CHAN_GLOBAL_RELEASE_FRAME \
    _IO(VDEC_IOCTL_MAGIC, 21)

#define VDEC_IOCTL_CHAN_PORT_ENABLE \
    _IO(VDEC_IOCTL_MAGIC, 22)

#define VDEC_IOCTL_CHAN_RECORD_OCCUPIED_FRAME \
    _IO(VDEC_IOCTL_MAGIC, 23)

#endif

