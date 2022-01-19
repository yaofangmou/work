/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     :
  Version       : Initial Draft
  Created       : 2018/05/18
  Description   :
  History       :
  1.Date        : 2018/05/18
    Modification: Created file
******************************************************************************/
#ifndef __HIMDTV_QTC_H__
#define __HIMDTV_QTC_H__

#include "hi_drv_mmz.h"
#include "hi_unf_frontend.h"

#ifdef __cplusplus
    #if __cplusplus
        extern "C" {
    #endif
#endif /* __cplusplus */

/* define QTC register Union   */
typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int collect_en         : 1;//[0]
        unsigned int loop_write_disable : 1;//[1]
        unsigned int overflow_stop_en   : 1;//[2]
        unsigned int data_sel_mode      : 1;//[3]
        unsigned int int_ena            : 1;//[4]
        unsigned int qtc_int            : 1;//[5]
        unsigned int iq_sel_mode        : 1;//[6]
        unsigned int reserved           : 1;//[7]
        unsigned int data_sel_mode_eff  : 1;//[8]
        unsigned int reserved1          :23;//[31..9]
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_QTC_CTRL;

typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int dump_end      : 1; //[0]
        unsigned int overflow      : 1; //[1]
        unsigned int reserved      : 5; //[6..2]
        unsigned int cur_wr_addr   : 25;//[31..7]
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_QTC_STATUS;

typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int start_addr : 32;//[31..0]
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_QTC_STARTATTR;

typedef union
{
    // Define the struct bits
    struct
    {
        unsigned int end_addr : 32;//[31..0]
    } bits;

    // Define an unsigned member
    unsigned int    u32;

} U_QTC_ENDATTR;


#define HISDTV100_QTC_CRG_RESET_ADDR            ((HI_U8 *)(g_pstRegCrg) + 0xE0)         /*0xF8A22000*/
#define HISDTV100_QTC_PERI_MODE_ADDR            ((HI_U8 *)(g_pstRegPeri) + 0x848)     /*0xF8A20000*/
#define HISDTV100_QTC_PERI_EQUASEL_ADDR       ((HI_U8 *)(g_pstRegPeri) + 0x894)
#define HISDTV100_QTC_PERI_VBI_CTRL_ADDR       ((HI_U8 *)(g_pstRegPeri) + 0x8EC)

#define HISDTV100_QTC_REGS_BASE_ADDR             0xf8a60000
#define HISDTV100_QTC_REGS_SIZE                    0x100

#if 0
#define HISDTV100_QTC_BUF_SIZE                     3   //3M
#define HISDTV100_QTC_DATA_NUM                    ((HIDTV200_QTC_BUF_SIZE*1024*1024)/8)       // 采集点数
#define HISDTV100_QTC_SORTED_DATA_NUM      (((HIDTV200_QTC_BUF_SIZE*1024*1024)/8)/5)       // 采集点数
#endif

#define HISDTV100_QTC_FILE_NAME               "fe_qtc_data"
#define HISDTV100_QTC_FILE_POSTFIX           "bin"
#define HISDTV100_QTC_FILE_NAME_LEN        (128)

#define HISDTV100_QTC_RegWrite(pu32RegAddr, u32Value)   ({*((volatile HI_U32*)pu32RegAddr) = u32Value;})
#define HISDTV100_QTC_RegRead(pu32RegAddr)              (*(volatile HI_U32*)(pu32RegAddr))
#define HISDTV100_TEST_RW_CNT (10)

typedef struct hiMDTV_QTC_CTX_S
{
    HI_BOOL                             bInit;
    HI_BOOL                             bQtcEndFlag;
//    TVD_SELECT_QTCDATA_E    enQtcDataSel;
    MMZ_BUFFER_S                 stFrameBuffer;       /* QTC buffer */  /*u32Size,u32StartPhyAddr,u32StartVirAddr*/
} MDTV_QTC_CTX_S;

typedef enum hiMDTV_QTC_MODE_E
{
    HIMDTV_QTC_MODE_EQUATOR_YPBPR = 0,
    HIMDTV_QTC_MODE_EQUATOR_CVBS,
    HIMDTV_QTC_MODE_AIF_ADC,
    HIMDTV_QTC_MODE_AIF_SIF,
    HIMDTV_QTC_MODE_AIF_CVBS,
    HIMDTV_QTC_MODE_TVD_DEBUG_13MHZ,
    HIMDTV_QTC_MODE_TVD_DEBUG_60MHZ,
    HIMDTV_QTC_MODE_AUDIO_ADC_TEST,

    HIMDTV_QTC_MODE_BUTT,
}MDTV_QTC_MODE_E;

typedef enum hiDRV_FE_QTC_Data_Fmt_E
{
    HIMDTV_QTC_DATA_FMT_128BIT = 0,
    HIMDTV_QTC_DATA_FMT_16BIT = 1,

    HIMDTV_QTC_DATA_FMT_BUTT,
}MDTV_QTC_DATA_FMT_E;

typedef enum hiDRV_FE_QTC_CHNL_IQ_E
{
    HIMDTV_QTC_CHNL_I = 0,
    HIMDTV_QTC_CHNL_Q = 1,
    HIMDTV_QTC_CHNL_IQ = 2,

    HIMDTV_QTC_CHNL_BUTT,
}MDTV_QTC_CHNL_IQ_E;

HI_VOID HiSDTV100_QTC_HAL_ClkEn(HI_U32 u32TunerPort, HI_BOOL bEn);
HI_S32 HiSDTV100_QTC_Init(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB);
HI_VOID HiSDTV100_QTC_DeInit(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_QTC_Dump(HI_U32 u32TunerPort, HI_BOOL bLoopWirteDisable);
HI_S32 HiSDTV100_QTC_Check_EndFlag(HI_U32 u32TunerPort, HI_BOOL *pbFlag);
HI_S32 HiSDTV100_QTC_GetState(HI_U32 u32TunerPort, HI_BOOL *pbState);
HI_S32 HiSDTV100_QTC_ConvertData(HI_U32 u32TunerPort);
HI_S32 HiSDTV100_QTC_GetBufAddr(HI_U32 u32TunerPort, HI_U32 *pu32QtcStartPhyAddr);
HI_S32 HiSDTV100_QTC_GetQtcData(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB);
HI_S32 HiSDTV100_ADP_QTC_GetDataContinues(HI_U32 u32TunerPort, HI_U32 u32QtcBuffSizeMB, HI_U32 u32RecordFileSizeMB);


#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif /* __cplusplus */

#endif

