/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
*  and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
*****************************************************************************
File Name   : drv_pq_define.h
Author      : sdk
Version     : v3.0
Abstract    :
*****************************************************************************/

#ifndef _DRV_PQ_DEFINE_V3_H_
#define _DRV_PQ_DEFINE_V3_H_

#include "hi_type.h"

/*****************************************************************************
PQ Software Define
*****************************************************************************/
#define PQ_VERSION      "1.0.2.0"
#define PQ_DEF_NAME     "pqparam"
#define PQ_MAGIC_NUM    "HIPQ"
#if defined(CHIP_TYPE_hi3798mv100)
#define PQ_CHIP_NAME    "3798MV100"
#elif defined(CHIP_TYPE_hi3796mv100)
#define PQ_CHIP_NAME    "3798MV100"
#elif defined(CHIP_TYPE_hi3798cv200_a)||defined(CHIP_TYPE_hi3798cv200_b)
#define PQ_CHIP_NAME    "HiFoneB2"
#elif defined(CHIP_TYPE_hi3716mv410)||defined(CHIP_TYPE_hi3716mv420)
#define PQ_CHIP_NAME    "3716MV410"
#endif

/*****************************************************************************
PQ Proc Enable Define
*****************************************************************************/
#ifdef HI_PQ_PROC_SUPPORT
#define PQ_PROC_CTRL_SUPPORT
#endif

/*****************************************************************************
PQ Head File Define
*****************************************************************************/
#define STR_LEN_8                8
#define STR_LEN_32               32
#define STR_LEN_80               80
#define STR_LEN_256              256
#define STR_LEN_1024             1024
#if defined(CHIP_TYPE_hi3798cv200_a)||defined(CHIP_TYPE_hi3798cv200_b) || defined(CHIP_TYPE_hi3716mv410)||defined(CHIP_TYPE_hi3716mv420)
#define ACM_Y_NUM                9
#define ACM_S_NUM                13
#define ACM_H_NUM                29
#endif
#if defined(CHIP_TYPE_hi3798mv100) || defined(CHIP_TYPE_hi3796mv100)
#define ACM_Y_NUM                5
#define ACM_S_NUM                7
#define ACM_H_NUM                29
#endif
#define PHY_REG_MAX              2048
#define PQ_ALG_MODULE_MAX        32

#define PQ_HDR_ACM_REGCFG_SIZE   40

// 430
#define ACM_I_NUM                4
#define ACM_J_NUM                10

/*****************************************************************************
PQ Tools Virtual Command
*****************************************************************************/

#define PQ_CMD_VIRTUAL_BIN_EXPORT                                 0xffffff00
#define PQ_CMD_VIRTUAL_BIN_IMPORT                                 0xffffff04
#define PQ_CMD_VIRTUAL_BIN_FIXED                                  0xffffff08
#define PQ_CMD_VIRTUAL_DRIVER_VERSION                             0xffffffff

#define PQ_CMD_VIRTUAL_HD_CTRL                                    0xffff0001
#define PQ_CMD_VIRTUAL_SD_CTRL                                    0xffff0002
#define PQ_CMD_VIRTUAL_DEMO_CTRL                                  0xffff0003
#define PQ_CMD_VIRTUAL_SOURCE_SELECT                              0xffff0004
#define PQ_CMD_VIRTUAL_READ_REGTYPE                               0xffff0005
#define PQ_CMD_VIRTUAL_OUT_MODE                                   0xffff0006

#define PQ_CMD_VIRTUAL_ACM_RECMD_LUT                              0xffff0100
#define PQ_CMD_VIRTUAL_ACM_BLUE_LUT                               0xffff0101
#define PQ_CMD_VIRTUAL_ACM_GREEN_LUT                              0xffff0102
#define PQ_CMD_VIRTUAL_ACM_BG_LUT                                 0xffff0103
#define PQ_CMD_VIRTUAL_ACM_FLESH_LUT                              0xffff0104
#define PQ_CMD_VIRTUAL_ACM_6BCOLOR_LUT                            0xffff0105

#define PQ_CMD_VIRTUAL_DCI_LUT                                    0xffff0200
#define PQ_CMD_VIRTUAL_DCI_BS_LUT                                 0xffff0201

#define PQ_CMD_VIRTUAL_GAMM_PARA                                  0xffff0301
#define PQ_CMD_VIRTUAL_DEGAMM_PARA                                0xffff0302
#define PQ_CMD_VIRTUAL_GFX_GAMM_PARA                              0xffff0303
#define PQ_CMD_VIRTUAL_GFX_DEGAMM_PARA                            0xffff0304

#define PQ_CMD_VIRTUAL_HDR_TM_LUT                                 0xffff0401
#define PQ_CMD_VIRTUAL_HDR_PARA_MODE                              0xffff0402
#define PQ_CMD_VIRTUAL_HDR_SMAP                                   0xffff0407
#define PQ_CMD_VIRTUAL_HDR_TMAP                                   0xffff0408

#define PQ_CMD_VIRTUAL_ACC_LUT                                    0xffff0500

#define PQ_CMD_VIRTUAL_GFXHDR_MODE                                0xffff0600
#define PQ_CMD_VIRTUAL_GFXHDR_STEP                                0xffff0601
#define PQ_CMD_VIRTUAL_GFXHDR_TMAP                                0xffff0602

#define PQ_CMD_VIRTUAL_HDR_ACM_MODE                               0xffff0700
#define PQ_CMD_VIRTUAL_HDR_ACM_REGCFG                             0xffff0701
#define PQ_CMD_VIRTUAL_HDR_DYN_MODE                               0xffff0702

#define PQ_CMD_VIRTUAL_LCACM_430_LUT                              0xffff0800
#define PQ_CMD_VIRTUAL_ACC_430_LUT                                0xffff0801
#define PQ_CMD_VIRTUAL_SNR_MOTION_430_LUT                         0xffff0802
#define PQ_CMD_VIRTUAL_ZME_VID_SEL                                0xffff0809
#define PQ_CMD_VIRTUAL_ZME_WBC_SEL                                0xffff0810
#define PQ_CMD_VIRTUAL_ZME_GFX_SEL                                0xffff0811

/*****************************************************************************
PQ Bin Define
*****************************************************************************/

/**
* PQ Param
**/

/*PQ Module????*/
typedef enum hiPQ_ALG_MODULE_E
{
    PQ_ALG_MODULE_DCI = 0,
    PQ_ALG_MODULE_ACM,
    PQ_ALG_MODULE_BUTT,
} PQ_ALG_MODULE_E;

typedef struct hiPQ_FILE_HEADER_S
{
    HI_U32          u32FileCheckSum;             /* ??????????????????File Header????????????????data????????????????????????????????????????????????dirty */
    HI_U32          u32ParamSize;                /* ??????????????????File header??data */
    HI_CHAR         u8Version[STR_LEN_32];       /* ?????????????????? */
    HI_CHAR         u8Author[STR_LEN_32];        /* ?????????????????????????? */
    HI_CHAR         u8Desc[STR_LEN_1024];        /* ???????????????????? */
    HI_CHAR         u8Time[STR_LEN_32];          /* ??????????????????????????[0] ~ [5]??yy mm dd hh mm ss??[6]~[7]??????????????PQ??????PC???????????????????????? */
    HI_CHAR         u8ChipName[STR_LEN_32];      /* ????????????????ChipName*/
    HI_CHAR         u8SDKVersion[STR_LEN_80];    /* ????????????????SDK????*/
    HI_U32          u32PhyRegNum;                /* ????????????????????????????*/
    HI_U32          u32Offset[PQ_ALG_MODULE_MAX];/* ????????????????*/
    HI_U32          u32PhyOffset;                /* ????????????????*/
} PQ_FILE_HEADER_S;


/**
* DCI Coef
**/

/*DCI??????????*/
typedef struct hiPQ_DCI_LUT_S
{
    HI_S16 s16WgtCoef0[33];
    HI_S16 s16WgtCoef1[33];
    HI_S16 s16WgtCoef2[33];
    HI_U16 u16Gain0;
    HI_U16 u16Gain1;
    HI_U16 u16Gain2;
} PQ_DCI_LUT_S;

/*DCI Gain*/
typedef struct hiPQ_DCI_GAIN_S
{
    HI_U16 u16Gain0;
    HI_U16 u16Gain1;
    HI_U16 u16Gain2;
} PQ_DCI_GAIN_S;

typedef struct hiPQ_DCI_COEF_S
{
    PQ_DCI_LUT_S  stPqDciLut;
} PQ_DCI_COEF_S;


/**
*ACC Coef
**/
#define ACC_LUT_NUM             5
#define ACC_LUT_RESOLUTION      9

typedef struct hi_PQ_ACC_LUT_S
{
    HI_S32 as32AccLut[ACC_LUT_NUM][ACC_LUT_RESOLUTION];
} PQ_ACC_LUT_S;

/**
* ACM Coef
**/

typedef struct hiPQ_ACM_LUT_S
{
    HI_S16 as16Y[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];   /**<  */
    HI_S16 as16H[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];   /**<  */
    HI_S16 as16S[ACM_Y_NUM][ACM_S_NUM][ACM_H_NUM];   /**<  */
} PQ_ACM_LUT_S;

typedef struct hiPQ_ACM_MODE_S
{
    PQ_ACM_LUT_S stModeRecmd;
    PQ_ACM_LUT_S stModeBlue;
    PQ_ACM_LUT_S stModeGreen;
    PQ_ACM_LUT_S stModeBG;
    PQ_ACM_LUT_S stModeFleshtone;
    PQ_ACM_LUT_S stMode6BColor;
} PQ_ACM_MODE_S;

typedef struct
{
    HI_U32 u32Protectmode;
    HI_S32 as32AcmEn[4];
    HI_S32 as32AcmOffset[ACM_I_NUM][ACM_J_NUM];
} HI_PQ_LCACM_OFFSET_S;

typedef struct hiPQ_ACM_COEF_S
{
#if defined(PQ_LCACM_SUPPORT)
    HI_PQ_LCACM_OFFSET_S stAcmOffset;
#else
    PQ_ACM_MODE_S stModeLut;
#endif
} PQ_ACM_COEF_S;

typedef struct
{
    HI_S32 as32MotionedgeLut[16][16];
} HI_PQ_SNR_MOTIONEDGE_LUT_S;

typedef struct
{
    HI_U32 u32HLSel[7]; /* 0-7 : sel different  */
    HI_U32 u32HCSel[7];
    HI_U32 u32VLSel[7];
    HI_U32 u32VCSel[7];
} HI_PQ_ZME_VID_COEF_SEL_S;

typedef struct
{
    HI_U32 u32HLSel[7]; /* 0-7 : sel different  */
    HI_U32 u32HCSel[7];
    HI_U32 u32VLSel[7];
    HI_U32 u32VCSel[7];
} HI_PQ_ZME_WBC_COEF_SEL_S;

typedef struct
{
    HI_PQ_ZME_VID_COEF_SEL_S stVidSel;
    HI_PQ_ZME_WBC_COEF_SEL_S stWbcSel;
} HI_PQ_ZME_COEF_SEL_S;

/**
* PQ Phy Register
**/

typedef struct hiPQ_PHY_REG_S
{
    HI_U32 u32RegAddr;     //register addr
    HI_U8  u8Lsb;          //register lsb
    HI_U8  u8Msb;          //register msb
    HI_U8  u8SourceMode;   //video source
    HI_U8  u8OutputMode;   //output mode
    HI_U32 u32Module;      //module
    HI_U32 u32Value;       //register value
} PQ_PHY_REG_S;

/**
* PQ_PARAM_S
**/

typedef struct hiPQ_COEF_S
{
    PQ_DCI_COEF_S               stDciCoef;
    PQ_ACM_COEF_S               stAcmCoef;
} PQ_COEF_S;

typedef struct hiPQ_PARAM_S
{
    PQ_FILE_HEADER_S            stPQFileHeader;
    PQ_COEF_S                   stPQCoef;
    PQ_PHY_REG_S                stPQPhyReg[PHY_REG_MAX];
} PQ_PARAM_S;


#endif

