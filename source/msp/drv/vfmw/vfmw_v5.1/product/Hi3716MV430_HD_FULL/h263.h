#ifndef __H263_H__
#define __H263_H__

#include "basedef.h"
#include "public.h"
#include "vfmw.h"
#include "vdm_hal.h"
#include "syntax.h"

#define H263_FAIL           -1
#define H263_OK             0
#define H263_NOTDEC         3

#define H263_INIT_SUCCESS   0
#define H263_INIT_FAIL      -1

#define H263_DEC_FAIL       -1
#define FRAME_REQ_ABNORMITY -2
#define FRAME_REQ_FAIL      -1
#define FRAME_REQ_SUCCESS   0

#define FRAME_ALLOC_NUM     8

//#define    OVERFLOW                     1
#define SYN_SHOK            3
#define SYNTAX_OK           1

#define NO_START_CODE       0xc5
#define SHORT_HEADER        0xc4

#define MARKER_THRESHOLD    6400
#define SH_THRESHOLD        18 // from 8 to 18,Because we found 13 Short Header in X-Men stream.
#define PEI_THRESHOLD       16 // shortheader PEI threshold

/* coding_mode */
#define ONLY_I_MODE         1
#define NEXT_I_MODE         2

/*start_code */
#define SHORT_VIDEO_START_CODE    0x00008000
#define START_CODE_PRE            0x00000100
#define VIDOBJLAY_START_CODE_MASK 0x0000000f
#define VIDOBJ_START_CODE_MASK    0x0000001f
#define VIDOBJ_START_CODE         0x00000100
#define VIDOBJLAY_START_CODE      0x00000120
#define VISOBJSEQ_START_CODE      0x000001b0
#define VISOBJSEQ_STOP_CODE       0x000001b1
#define GRPOFVOP_START_CODE       0x000001b3
#define VISOBJ_START_CODE         0x000001b5
#define VOP_START_CODE            0x000001b6
#define USERDATA_START_CODE       0x000001b2
#define HISI_END_OF_FRAME         0x0000011e
#define HISI_H263_STREAM_END_CODE 0x000001b600008000 // for bvt
#define HISI_STREAM_END_CODE      0x000001fe         // for eos

#define SP_LEVEL1  0x01
#define SP_LEVEL2  0x02
#define SP_LEVEL3  0x03
#define SP_LEVEL0  0x08
#define ASP_LEVEL0 0xF0
#define ASP_LEVEL1 0xF1
#define ASP_LEVEL2 0xF2
#define ASP_LEVEL3 0xF3
#define ASP_LEVEL4 0xF4
#define ASP_LEVEL5 0xF5

#define SYN_VOSOK  1
#define SYN_VOSERR 0
#define SYN_VOOK   1
#define SYN_VOERR  0
#define VIDEO_ID   1 // Visual_Object_type Video ID
#define SYN_GOPOK  1
#define SYN_GOPERR 0

#define SYN_VOLOK                   1
#define SYN_VOLERR                  0
#define VO_Type_SP                  0x00000001
#define VO_Type_ASP                 0x11
#define VIDOBJLAY_AR_EXTPAR         15
#define VIDOBJLAY_SHAPE_RECTANGULAR 0
#define VIDOBJLAY_SHAPE_BINARY_ONLY 2

#define SPRITE_NONE   0
#define SPRITE_STATIC 1
#define SPRITE_GMC    2

#define I_VOP      0
#define P_VOP      1
#define B_VOP      2
#define S_VOP      3
#define N_VOP      4
#define SYN_VOPOK  1
#define SYN_VOPERR 0

/*USERDATA*/
#define SYN_USERDATAOK  1
#define SYN_USERDATAERR 0

/* seg num in vop */
#define MAX_SEG_NUM_IN_VOP 1024
#define MAX_PKT_NUM_IN_HD  64

#define H263_FOUND_SEQHDR     (0x1)
#define H263_FOUND_VOPHDR     (0x1 << 1)
#define H263_FOUND_VOLHDR     (0x1 << 2)
#define H263_FOUND_SHHDR      (0x1 << 3)
#define H263_FOUND_SLCHDR     (0x1 << 4)
#define H263_FOUND_NEXTVOPHDR (0x1 << 5)
#define H263_FOUND_NEXTSHHDR  (0x1 << 6)
#define H263_FOUND_NVOP       (0x1 << 7)
#define H263_FOUND_HISIHDR    (0x1 << 8)
#define H263_PIC_OK           (H263_FOUND_VOPHDR | H263_FOUND_SLCHDR | H263_FOUND_NEXTVOPHDR | H263_FOUND_NVOP | H263_FOUND_HISIHDR)
#define H263_SH_PIC_OK        (H263_FOUND_SHHDR | H263_FOUND_SLCHDR | H263_FOUND_NEXTSHHDR)

#define SLICE_START_CODE_BASE_LEN   17

#define RDIV(a, b) (((a) > 0 ? ((a) + ((b) >> 1)) : ((a) - ((b) >> 1))) / (b))
#define FFMIN(a, b) ((a) > (b) ? (b) : (a))
#define FFMAX(a, b) ((a) > (b) ? (a) : (b))

typedef struct
{
    SINT32 x;
    SINT32 y;
} H263_MOTION_VECTOR;

typedef struct
{
    H263_MOTION_VECTOR duv[3];
} H263_WARPPOINTS;

typedef struct
{
    /*  0=none, 1=translation, 2,3 = warping
    *  a value of -1 means: "structure not initialized!" */
    SINT32 num_wp;
    /* {0,1,2,3}  =>   {1/2,1/4,1/8,1/16} pel */
    SINT32 accuracy;
    /* sprite size * 16 */
    SINT32 sW, sH;
    /* gradient, calculated from warp points */
    SINT32 dU[2], dV[2], Uo, Vo, Uco, Vco;
} H263_GMC_DATA;

typedef struct
{
    UINT8     is_visual_object_identifier;
    UINT8     visual_object_verid;
    UINT8     visual_object_priority;
    UINT8     visual_object_type;
    UINT8     video_signal_type;
    UINT8     video_format;
    UINT8     video_range;
    UINT8     colour_description;

    UINT32    profile_and_level_indication;
    UINT32    colour_primaries;
    UINT32    transfer_characteristics;
    UINT32    matrix_coefficients;
} H263_VOS;

typedef struct
{
    UINT8     is_object_layer_identifier;
    UINT8     video_object_layer_verid;
    UINT8     video_object_layer_priority;
    UINT8     aspect_ratio_info;
    UINT8     random_accessible_vol;
    UINT8     vol_control_parameters;
    UINT8     chroma_format;
    UINT8     low_delay;
    UINT8     video_object_layer_shape;
    UINT8     fixed_vop_rate;
    UINT8     interlaced;
    UINT8     obmc_disable;
    UINT8     sprite_enable;
    UINT8     not_8_bit;
    UINT8     quant_type;
    UINT8     load_intra_quant_mat;
    UINT8     load_nonintra_quant_mat;
    UINT8     quarter_sample;
    UINT8     complexity_estimation_disable;
    UINT8     resync_marker_disable;
    UINT8     data_partitioned;
    UINT8     newpred_enable;
    UINT8     reduced_resolution_vop_enable;
    UINT8     scalability;

    UINT8     sprite_warping_points;
    UINT8     sprite_warping_accuracy;
    UINT8     sprite_brightness_change;

    UINT32    video_object_type_indication;
    UINT32    par_width;
    UINT32    par_height;
    UINT32    vbv_parameters;
    UINT32    first_half_bit_rate;
    UINT32    latter_half_bit_rate;
    UINT32    first_half_vbv_buffer_size;
    UINT32    latter_half_vbv_buffer_size;
    UINT32    first_half_vbv_occupancy;
    UINT32    latter_half_vbv_occupancy;
    UINT32    vop_time_incr_bits;
    UINT32    vop_time_increment_resolution;
    UINT32    fixed_vop_time_increment;
    UINT32    video_object_layer_width;
    UINT32    video_object_layer_height;
    UINT32    intra_quant_mat[64];
    UINT32    nonintra_quant_mat[64];
    UINT32    time_code;

} H263_VOL;

typedef struct
{
    UINT8     vop_coding_type;
    UINT8     vop_coded;
    UINT8     vop_rounding_type;
    UINT8     vop_reduced_resolution;
    UINT8     intra_dc_vlc_thr;
    UINT8     top_field_first;
    UINT8     alternate_vertical_scan_flag;
    UINT8     vop_quant;
    UINT8     vop_fcode_forward;
    UINT8     vop_fcode_backward;
    UINT8     source_format;
    UINT8     num_gobs_invop;
    UINT16    num_mb_ingob;
    UINT32    temporal_reference;
    UINT32    split_screen_indicator;
    UINT32    document_camera_indicator;
    UINT32    full_picture_freeze_release;
    UINT32    mb_total;
    H263_WARPPOINTS gmc_warp;
    UINT16    num_mb_inlastgob;
    UINT8    version;
    UINT8    disposable;
    UINT8    deblockingflag;
} H263_VOP;

typedef struct
{
    UINT8     vos_decode_over;
    UINT8     vol_decode_over;
    UINT8     closed_gov;
    UINT8     broken_link;
    UINT8     packed_mode;
    UINT8     bs_version;
    UINT8     cartoon_mode;
    UINT8     coding_mode;
    UINT8     decode_syntax_OK;
    UINT8     is_short_header;

    UINT8     FF_BUG_EDGE_FIND_POINT;
    UINT8     FF_BUG_EDGE_EXTEND;
    UINT8     FF_BUG_DIVX500B413;
    UINT8     FF_BUG_QPEL_CHROMA;
    UINT8     FF_BUG_QPEL_CHROMA2;
    UINT8     FF_BUG_QPEL_FILED;
    H263_VOS   syn_vos;
    H263_VOL   syn_vol;
    H263_VOP   syn_vop;

    UINT32    image_height;
    UINT32    image_width;
    UINT32    time_incr;
    UINT32    time_increment;
    UINT32    time_base;
    UINT32    last_time_base;
    UINT32    time;
    UINT32    last_non_b_time;
    UINT32    time_pp;
    UINT32    time_bp;
    UINT32    SH_num;
    /* divx specific, used to workaround (many) bugs in divx5 */
    UINT32    divx_version;
    UINT32    divx_build;
    UINT32    divx_packed;
    UINT32    xvid_build;
    /* lavc specific stuff, used to workaround bugs in libavcodec */
    UINT32    lavc_build;

} H263_SYNTAX;

typedef struct
{
    UINT8     vos_decode_right;
    UINT8     vo_decode_right;
    UINT8     gop_decode_right;
    UINT8     vol_decode_right;
    UINT8     last_vol_decode_right;
    UINT8     vop_decode_right;
    UINT8     userdata_decode_right;
} H263_SYNTAX_STATE;

typedef struct
{
    UINT8     *pmv_vir_addr;
    UINT8     *frame_vir_addr;
    UADDR     pmv_phy_addr;
    UINT32    pmv_size;
    UADDR     frame_phy_addr;
    UINT32    frame_size;
} H263_VDM_MEM_ALLOT;

typedef struct
{
    UINT8     *vir_addr;
    UADDR     phy_addr;
    SINT32    len;
    UINT32    offset;
} H263_BITS_OBJ;

typedef struct
{
    DEC_STREAM_PACKET_S stLastPacket;
    MP4_SCD_UPMSG   stScdUpMsg;
    UINT32 StreamId[MAX_PKT_NUM_IN_HD];
    SINT32 StreamIDNum;
    UINT32 HeadCode;
    SINT32 GetHeadFirstFlag;
    SINT32 CountVopNum;
} H263_HDPKT_INFO_S;

typedef struct
{
    UINT8  IsSorenson;
    UINT8  FwdCodingType;
    UINT8  BwdCodingType;
    UINT8  CurCodingType;

    UINT8  TmpUserData[MAX_USRDAT_SIZE + 8];

    H263_DEC_PARAM_S *pH263DecParam;

    H263_DEC_PARAM_S H263DecParam;
    DEC_STREAM_PACKET_S  stCurPacket;
    MP4_SCD_UPMSG        ScdUpMsg;
    UINT32 StreamID[MAX_SEG_NUM_IN_VOP];
    UINT32 StreamIDNum;
    UINT32 PicIntegrality;
    UINT32 IsWaitToDecFlag;

    H263_VOS H263Vos;
    H263_VOL H263Vol;
    H263_VOL H263VolLastBack;
    H263_VOP H263Vop;
    H263_SYNTAX H263Syntax;
    H263_SYNTAX_STATE H263SyntaxState;
    H263_BITS_OBJ BitsObj;

    SYNTAX_EXTRA_DATA_S *pstExtraData;
    H263_VDM_MEM_ALLOT VdmMemAllot;
    SINT32 NumOfAllocatedFrameObj;

    DEC_MODE_E DecMode;
    H263_HDPKT_INFO_S stHdPktInfo;

    UINT32 SeqCnt;
    UINT32 ImgCntOfSeq;
    UINT32 ErrorLevel;

    UINT32 InitComplete;
    UINT32 FrameNum;
    UINT32 OldPicWidth;
    UINT32 OldPicHeight;
    UINT32 NewPicWidth;
    UINT32 NewPicHeight;
    UINT32 UserID;
    UINT32 PPicFound;

    VDEC_USRDAT_S  *UsrData[4];
    VDEC_USRDAT_S  *CurUsrData;

    UINT32 IPVopErr;

    IMAGE_VO_QUEUE     ImageQue;
    SINT32        ChanID;

    //FSP Used
    //IMAGE  img;
    SINT32 FspPartitionOK;
    SINT32 RefNum;
    SINT32 FwdFsID;
    SINT32 FwdTimePP;
    SINT32 BwdFsID;
    SINT32 BwdTimePP;
    SINT32 CurFsID;
    SINT32 ToQueFsID;
    UINT8 IsStreamEndFlag;
    UINT8 SeekReset;
    UINT32 LastPicIntegrality;
    MP4_SCD_UPMSG LastScdUpMsg;
} H263_CTX_S;


#ifdef __cplusplus
extern "C" {
#endif

SINT32 H263DEC_Init(H263_CTX_S *pCtx, SYNTAX_EXTRA_DATA_S *pstExtraData);
VOID   H263DEC_Destroy(H263_CTX_S *pCtx);
SINT32 H263DEC_Decode(H263_CTX_S *pCtx, const DEC_STREAM_PACKET_S *ptr_strm_para, UINT8 ucIsSorenson);
SINT32 H263DEC_RecycleImage(H263_CTX_S *pCtx, UINT32 ImgID);
VOID   H263DEC_FlushRemainImg(H263_CTX_S *pCtx);
SINT32 H263DEC_VDMPostProc(H263_CTX_S *pCtx, SINT32 ErrRatio);
SINT32 H263DEC_GetImageBuffer(H263_CTX_S *pCtx);
SINT32 H263_GetPacketState(H263_CTX_S *pCtx);
VOID   H263_ClearCurPic(H263_CTX_S *pCtx);
VOID   H263_Clean_HeadPacket(H263_CTX_S *pCtx);
UINT32 H263DEC_GetImageWidth(H263_CTX_S *pCtx);
UINT32 H263DEC_GetImageHeight(H263_CTX_S *pCtx);

#ifdef __cplusplus
}
#endif


#endif //__H263_H__
