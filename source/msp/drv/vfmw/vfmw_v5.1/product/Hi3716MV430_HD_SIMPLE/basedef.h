#ifndef __BASETYPE_DEFS__
#define __BASETYPE_DEFS__

#ifdef __cplusplus
extern "C" {
#endif

#define H264_ENABLE
#define MVC_ENABLE
#define MPEG2_ENABLE
#define AVS_ENABLE
#define AVS2_ENABLE
#define MPEG4_ENABLE
#define REAL8_ENABLE
#define REAL9_ENABLE
#define VC1_ENABLE
#define DIVX3_ENABLE
#define VP6_ENABLE
#define VP8_ENABLE
#define HEVC_ENABLE
#define VP9_ENABLE

#define COMPRESS_RATIO_LCM 8 // Lowest common multiple
#define COMPRESS_RATIO_0   4
#define COMPRESS_RATIO_1   5
#define COMPRESS_RATIO_2   6
#define COMPRESS_RATIO_3   7

#if defined(VFMW_DPRINT_SUPPORT) && defined(ENV_ARMLINUX_KERNEL)
#define REC_POS(Data)  DBG_AddTrace( (SINT8*)__FUNCTION__, __LINE__, (SINT32)Data)
#else
#define REC_POS(Data)
#endif

#if defined(VFMW_DPRINT_SUPPORT) && defined(ENV_ARMLINUX_KERNEL)
#define REC_POS_NEW(FuncName, LineNum, Data) DBG_AddTrace(FuncName, LineNum, (SINT32)Data)
#else
#define REC_POS_NEW(FuncName, LineNum, Data)
#endif

#define MAX(a, b)         (( (a) < (b) ) ?  (b) : (a))
#define MIN(a, b)         (( (a) > (b) ) ?  (b) : (a))
#define ABS(x)            (( (x) <  0  ) ? -(x) : (x))
#define SIGN(a)           (( (a)<0 ) ? (-1) : (1))
#define MEDIAN(a, b, c)   ((a) + (b) + (c) - MIN((a), MIN((b), (c))) - MAX((a), MAX((b), (c))))

#define CLIP1(high, x)             (MAX( MIN((x), high), 0))
#define CLIP3(low, high, x)        (MAX( MIN((x), high), low))
#define CLIP255(x)                 (MAX( MIN((x), 255), 0))

#define HICEILING(x, a)           (((x)+(a)-1)/(a))

#if defined(HI_DDRC_CHANNEL_DUAL)
#define HI_SYS_GET_STRIDE(w)   ((((w)%256)==0)?(w):(((((w)/256)%2)==0)?((((w)/256)+1)*256):((((w)/256)+2)*256)))
#elif defined(HI_DDRC_CHANNEL_SINGLE)
#define HI_SYS_GET_STRIDE(w)   (HICEILING(w,64))
#else
#define HI_SYS_GET_STRIDE(w)   ((((w)%256)==0)?(w):(((((w)/256)%2)==0)?((((w)/256)+1)*256):((((w)/256)+2)*256)))
#endif

#if defined(ENV_ARMLINUX_KERNEL) || defined(ENV_SOS_KERNEL)
#ifdef HI_ADVCA_FUNCTION_RELEASE
#define pos()
#else
#define pos() dprint(PRN_ALWS, "%s: %d\n", __func__, __LINE__)
#endif
#endif

#ifdef __cplusplus
}
#endif

#endif    //end of "#ifndef __BASETYPE_DEFS__"

