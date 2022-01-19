#ifndef __TECHNICOLOR_WRAP_H__
#define __TECHNICOLOR_WRAP_H__
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>


/********************************************************************************
structure for CMD_GET_VERSION_INFO
*********************************************************************************/
typedef struct tag_technicolor_version_info_s{
    char *pbuild_time;
    char *pversion;
}technicolor_version_info_s;


/********************************************************************************
structure for CMD_GENERATE_CONFIG
*********************************************************************************/
typedef struct hiPQ_SL_HDR_PS_PARAM_S
{
    /* TCHDR enable signal */
    HI_U8 tchdr_en;             /* TCHDR使能 */
    HI_U8 tchdr_cert_en;        /* TCHDR认证使能：0：不走认证分支，YUV输出；1：走认证分支，RGB输出。*/
    HI_U8 tchdr_demo_en;        /* TCHDR DEMO模式使能 */
    HI_U8 tchdr_demo_mode;      /* TCHDR DEMO模式选择： 0：右边处理，左边不处理 */
    HI_U8 tchdr_demo_pos;       /* TCHDR DEMO位置 */

    /* Range Adaption Params */
    HI_S32 yuv_range;           /* tchdr_yuv_range */
    HI_S32 inv_y_ratio;         /* not for 96MV200 */
    HI_S32 inv_chroma_ratio;    /* not for 96MV200 */
    HI_S32 footroom;            /* not for 96MV200 */
    HI_S32 l_headroom;          /* not for 96MV200 */
    HI_S32 c_headroom;          /* not for 96MV200 */

    /* Coef Params */
    HI_U16 mu0;                 /* tchdr_alpha_a */
    HI_U16 mu1;                 /* tchdr_alpha_b */
    HI_S32 OCT[7];              /* tchdr_oct */

    /* LUT Params */
    HI_U16 C_LUT[65];
    HI_U16 P_LUT[65];
    HI_U16 S_LUT[65];
    HI_U16 I_LUT[65];
    HI_U16 D_LUT[65];
    HI_U16 D_LUT_THRESHOLD[3];  /* tchdr_d_lut_thr */
    HI_U16 D_LUT_STEP[4];       /* tchdr_d_lut_step */
} HI_PQ_SL_HDR_PS_PARAM_S;

typedef struct hiPQ_SL_HDR_R2Y_PARAM_S
{
    /* TCHDR R2Y enable signal */
    HI_U8 tchdr_r2y_clip_en;    /* tchdr_r2y_clip_en */

    /* R2Y Params */
    HI_S16 s16R2yCoef[9];       /* tchdr_r2y_coef */
    HI_S16 s16R2yScale2P;       /* tchdr_r2y_scale2p */
    HI_S16 s16R2yDcOut[3];      /* tchdr_r2y_out_dc */
    HI_U16 s16R2yClipMax;       /* tchdr_r2y_clip_max */
    HI_U16 s16R2yClipMin;       /* tchdr_r2y_clip_min */
} HI_PQ_SL_HDR_R2Y_PARAM_S;

typedef struct hiPQ_SL_HDR_DISP_S
{
    HI_S32 s32Display_OETF;         // display_OETF: 0 :bt1886   1: pq    2: linear
    HI_S32 s32Display_Brightness;   // Target diaplay luminance(nits)
} HI_PQ_SL_HDR_DISP_S;


typedef struct hi_TECHNICOLOR_PS_PARA_IN_S
{
    HI_SL_HDR_Metadata_S    *pstAvsSlHdrMetadata;
    HI_PQ_SL_HDR_DISP_S     stAvsSlHdrDispSet;
    HI_S32  s32YuvRange;
}HI_TECHNICOLOR_PS_PARA_IN_S;

typedef struct hi_TECHNICOLOR_PS_CFG_S
{
    HI_PQ_SL_HDR_PS_PARAM_S     stPsParam;
    HI_PQ_SL_HDR_R2Y_PARAM_S    stPsR2yParam;
}HI_TECHNICOLOR_PS_CFG_S;


/********************************************************************************
command for technicolor lib
*********************************************************************************/
typedef enum hiTECHNICOLOR_LIB_COMMAND_E
{
    /* arg1 is para in, arg2 is para out. */
    CMD_TECHNICOLOR_LIB_INIT  = 0x0,      /* arg1:null, arg2:null. */
    CMD_TECHNICOLOR_LIB_DEINIT,           /* arg1:null, arg2:null. */
    CMD_TECHNICOLOR_GET_VERSION_INFO,     /* arg1:null, arg2:technicolor_version_info_s. */
    CMD_TECHNICOLOR_SET_BRIGHTNESS,       /* arg1:brightness, arg2:null. */
    CMD_TECHNICOLOR_GET_BRIGHTNESS,       /* arg1:null, arg2:brightness. */
    CMD_TECHNICOLOR_GENERATE_CONFIG,      /* arg1:HI_TECHNICOLOR_PS_PARA_IN_S, arg2:cmd_jtp_config_para_out_s*/
    CMD_TECHNICOLOR_BUTT
}HI_TECHNICOLOR_LIB_COMMAND_E;


int technicolor_lib_wrap_interface(HI_TECHNICOLOR_LIB_COMMAND_E enCmd,
                                     void *pstParaIn,
                                     void *pstParaOut);


typedef int (*FN_technicolor_lib_wrap_interface)(HI_TECHNICOLOR_LIB_COMMAND_E enCmd,
                                     void *pstParaIn,
                                     void *pstParaOut);

typedef struct
{
    FN_technicolor_lib_wrap_interface  pfn_technicolor_lib_wrap_interface;
}TECHNICOLOR_UNIVERSAL_FUN_S;

#endif
