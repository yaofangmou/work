#include <uboot.h>

#include "hi_type.h"
#include "hi_debug.h"
#include "hi_reg_common.h"

#include "hal_aiao_priv.h"
#include "hi_drv_ao.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

static volatile S_AIAO_COM_REGS_TYPE*     g_pAIAOComReg = NULL;
static volatile S_AIAO_RX_REGS_TYPE*      g_pAIAORxReg[AIAO_MAX_PORT_NUMBER];
static volatile S_AIAO_TX_REGS_TYPE*      g_pAIAOTxReg[AIAO_MAX_PORT_NUMBER];
static volatile S_AIAO_TXSPDIF_REGS_TYPE* g_pAIAOTxSpdifReg[AIAO_MAX_PORT_NUMBER];  //AIAO_MAX_PORT_NUMBER=8, for Codecc
static volatile S_AIAO_SPDIFER_REGS_TYPE* g_pAIAOSpdiferReg[AIAO_MAX_PORT_NUMBER];  //AIAO_MAX_PORT_NUMBER=8, for Codecc

/* global */
static HI_VOID          AIAO_LOW_SetRxCrgClkEn(HI_U32 u32ChnId, HI_S32 bEn);
static HI_VOID          AIAO_LOW_SetTxCrgClkEn(HI_U32 u32ChnId, HI_S32 bEn);

static HI_VOID          AIAO_LOW_SetRxI2SSlaveClk(HI_U32 u32ChnId, AIAO_IfAttr_S* pstIfAttrSlave);
static HI_VOID          AIAO_LOW_SetTxI2SSlaveClk(HI_U32 u32ChnId, AIAO_IfAttr_S* pstIfAttrSlave);

static HI_VOID          AIAO_LOW_SetRxI2SMasterClk(HI_U32 u32ChnId, AIAO_IfAttr_S* pstIfAttrMaster);
static HI_VOID          AIAO_LOW_SetTxI2SMasterClk(HI_U32 u32ChnId, AIAO_IfAttr_S* pstIfAttrMaster);

static HI_VOID          AIAO_LOW_SetSPDIFMasterClk(HI_U32 u32ChnId, AIAO_IfAttr_S *pstIfAttrMaster);
static HI_VOID          AIAO_LOW_SetI2SDulicateClk(HI_U32 u32ChnId, HI_S32 Dir, AIAO_IfAttr_S *pstIfAttrDuplicate);

/* tx/rx i2s interface */
static HI_VOID            AIAO_LOW_SetI2SSourceSelect(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_SOURCE_E eI2SSel);
static HI_VOID            AIAO_LOW_SetI2SDataSelect(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_SD_E eOrgSd,
                                                  AIAO_I2S_SD_E eSrcSd);
static HI_VOID            AIAO_LOW_SetI2SBitDepth(HI_U32 u32ChnId, HI_S32 Dir, AIAO_BITDEPTH_E eBitDepth);
static HI_VOID            AIAO_LOW_SetI2SMode(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_MODE_E eMode);
static HI_VOID            AIAO_LOW_SetMultislotMode(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 bEn);
static HI_VOID            AIAO_LOW_SetI2SChNum(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 isMultislot, AIAO_I2S_CHNUM_E eChaNum);
static HI_VOID            AIAO_LOW_SetPcmSyncDelay(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 nDelayCycles);
static HI_VOID            AIAO_LOW_SPDIFSetBitDepth(HI_U32 u32ChnId, AIAO_BITDEPTH_E eBitDepth);
static HI_VOID            AIAO_LOW_SPDIFSetChNum(HI_U32 u32ChnId, AIAO_I2S_CHNUM_E eChaNum);

/* tx/rx i2s/spdif interface */
HI_VOID                    AIAO_HW_SetI2SSourceSelect(AIAO_PORT_ID_E enPortID, AIAO_I2S_SOURCE_E eI2SSel);
HI_VOID                    AIAO_HW_SetI2SDataSelect(AIAO_PORT_ID_E enPortID, AIAO_I2S_SD_E eOrgSd, AIAO_I2S_SD_E eSrcSd);
HI_VOID                    AIAO_HW_SetI2SBitDepth(AIAO_PORT_ID_E enPortID, AIAO_BITDEPTH_E eBitDepth);
HI_VOID                    AIAO_HW_SetI2SMode(AIAO_PORT_ID_E enPortID, AIAO_I2S_MODE_E eMode);
HI_VOID                    AIAO_HW_SetMultislotMode(AIAO_PORT_ID_E enPortID, HI_S32 bEn);
HI_VOID                    AIAO_HW_SetI2SChNum(AIAO_PORT_ID_E enPortID, HI_S32 isMultislot, AIAO_I2S_CHNUM_E eChaNum);
HI_VOID                    AIAO_HW_SetPcmSyncDelay(AIAO_PORT_ID_E enPortID, HI_S32 nDelayCycles);

/*****************************************************************************
 Description  : SPDIF IP HAL API
*****************************************************************************/
HI_VOID                    AIAO_SPDIF_HAL_SetBitWidth(AIAO_PORT_ID_E enPortID, AIAO_BITDEPTH_E enBitwidth);
HI_VOID                    AIAO_SPDIF_HAL_SetSamplerate(AIAO_PORT_ID_E enPortID, AIAO_SAMPLE_RATE_E enSampleRate);

static const HI_U16 g_u16BclkDivTab[16] =
{
    1, 3, 2, 4, 6, 8, 12, 16, 24, 32, 48, 64, 8, 8, 8, 8
};

static const HI_U16 g_u16FsDivTab[6] =
{
    16, 32, 48, 64, 128, 256,
};

/* aiao_replace */
#define AIAO_0128FS_TAB_IDX 0
#define AIAO_0256FS_TAB_IDX 1
#define AIAO_0384FS_TAB_IDX 2
#define AIAO_0512FS_TAB_IDX 3
#define AIAO_1024FS_TAB_IDX 4

#define AIAO_008KHz_SUB_IDX 0
#define AIAO_011KHz_SUB_IDX 1
#define AIAO_012KHz_SUB_IDX 2
#define AIAO_016KHz_SUB_IDX 3
#define AIAO_022KHz_SUB_IDX 4
#define AIAO_024KHz_SUB_IDX 5
#define AIAO_032KHz_SUB_IDX 6
#define AIAO_044KHz_SUB_IDX 7
#define AIAO_048KHz_SUB_IDX 8
#define AIAO_088KHz_SUB_IDX 9
#define AIAO_096KHz_SUB_IDX 10
#define AIAO_176KHz_SUB_IDX 11
#define AIAO_192KHz_SUB_IDX 12

/*
 * This file is machine generated, DO NOT EDIT!
 */
#if defined (AIAO_PLL_600MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00037ec8,/* 8000 */ 0x0004d120,/* 11025 */ 0x00053e2d,/* 12000 */ 0x0006fd91,/* 16000 */ 0x0009a240,/* 22050 */ 0x000a7c5a,/* 24000 */ 0x000dfb23,/* 32000 */
    0x00134480,/* 44100 */ 0x0014f8b5,/* 48000 */ 0x00268900,/* 88200 */ 0x0029f16b,/* 96000 */ 0x004d1201,/* 176400 */ 0x0053e2d6,/* 192000 */ },
    /* 256*FS mclk */
    {0x0006fd91,/* 8000 */ 0x0009a240,/* 11025 */ 0x000a7c5a,/* 12000 */ 0x000dfb23,/* 16000 */ 0x00134480,/* 22050 */ 0x0014f8b5,/* 24000 */ 0x001bf647,/* 32000 */
    0x00268900,/* 44100 */ 0x0029f16b,/* 48000 */ 0x004d1201,/* 88200 */ 0x0053e2d6,/* 96000 */ 0x009a2403,/* 176400 */ 0x00a7c5ac,/* 192000 */ },
    /* 384*FS mclk */
    {0x000a7c5a,/* 8000 */ 0x000e7360,/* 11025 */ 0x000fba88,/* 12000 */ 0x0014f8b5,/* 16000 */ 0x001ce6c0,/* 22050 */ 0x001f7510,/* 24000 */ 0x0029f16b,/* 32000 */
    0x0039cd81,/* 44100 */ 0x003eea20,/* 48000 */ 0x00739b02,/* 88200 */ 0x007dd441,/* 96000 */ 0x00e73605,/* 176400 */ 0x00fba882,/* 192000 */ },
    /* 512*FS mclk */
    {0x000dfb23,/* 8000 */ 0x00134480,/* 11025 */ 0x0014f8b5,/* 12000 */ 0x001bf647,/* 16000 */ 0x00268900,/* 22050 */ 0x0029f16b,/* 24000 */ 0x0037ec8e,/* 32000 */
    0x004d1201,/* 44100 */ 0x0053e2d6,/* 48000 */ 0x009a2403,/* 88200 */ 0x00a7c5ac,/* 96000 */ 0x01344806,/* 176400 */ 0x014f8b58,/* 192000 */ },
    /* 1024*FS mclk */
    {0x001bf647,/* 8000 */ 0x00268900,/* 11025 */ 0x0029f16b,/* 12000 */ 0x0037ec8e,/* 16000 */ 0x004d1201,/* 22050 */ 0x0053e2d6,/* 24000 */ 0x006fd91d,/* 32000 */
    0x009a2403,/* 44100 */ 0x00a7c5ac,/* 48000 */ 0x01344806,/* 88200 */ 0x014f8b58,/* 96000 */ 0x0268900c,/* 176400 */ 0x029f16b0,/* 192000 */ },
};

#elif defined (AIAO_PLL_492MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00044444,/* 8000 */ 0x0005e147,/* 11025 */ 0x00066666,/* 12000 */ 0x00088888,/* 16000 */ 0x000bc28f,/* 22050 */ 0x000ccccc,/* 24000 */ 0x00111111,/* 32000 */
    0x0017851e,/* 44100 */ 0x00199999,/* 48000 */ 0x002f0a3d,/* 88200 */ 0x00333333,/* 96000 */ 0x005e147b,/* 176400 */ 0x00666666,/* 192000 */ },
    /* 256*FS mclk */
    {0x00088888,/* 8000 */ 0x000bc28f,/* 11025 */ 0x000ccccc,/* 12000 */ 0x00111111,/* 16000 */ 0x0017851e,/* 22050 */ 0x00199999,/* 24000 */ 0x00222222,/* 32000 */
    0x002f0a3d,/* 44100 */ 0x00333333,/* 48000 */ 0x005e147b,/* 88200 */ 0x00666666,/* 96000 */ 0x00bc28f6,/* 176400 */ 0x00cccccd,/* 192000 */ },
    /* 384*FS mclk */
    {0x000ccccc,/* 8000 */ 0x0011a3d7,/* 11025 */ 0x00133333,/* 12000 */ 0x00199999,/* 16000 */ 0x002347ae,/* 22050 */ 0x00266666,/* 24000 */ 0x00333333,/* 32000 */
    0x00468f5c,/* 44100 */ 0x004ccccd,/* 48000 */ 0x008d1eb8,/* 88200 */ 0x0099999a,/* 96000 */ 0x011a3d70,/* 176400 */ 0x01333334,/* 192000 */ },
    /* 512*FS mclk */
    {0x00111111,/* 8000 */ 0x0017851e,/* 11025 */ 0x00199999,/* 12000 */ 0x00222222,/* 16000 */ 0x002f0a3d,/* 22050 */ 0x00333333,/* 24000 */ 0x00444444,/* 32000 */
    0x005e147b,/* 44100 */ 0x00666666,/* 48000 */ 0x00bc28f6,/* 88200 */ 0x00cccccd,/* 96000 */ 0x017851ec,/* 176400 */ 0x0199999a,/* 192000 */ },
    /* 1024*FS mclk */
    {0x00222222,/* 8000 */ 0x002f0a3d,/* 11025 */ 0x00333333,/* 12000 */ 0x00444444,/* 16000 */ 0x005e147b,/* 22050 */ 0x00666666,/* 24000 */ 0x00888889,/* 32000 */
    0x00bc28f6,/* 44100 */ 0x00cccccd,/* 48000 */ 0x017851ec,/* 88200 */ 0x0199999a,/* 96000 */ 0x02f0a3d8,/* 176400 */ 0x03333334,/* 192000 */ },
};

#elif defined (AIAO_PLL_995MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00021b64,/* 8000 */  0x0002e759,/* 11025 */ 0x00032916,/* 12000 */ 0x000436c8,/* 16000 */ 0x0005ceb2,/* 22050 */ 0x0006522c,/* 24000 */ 0x00086d90,/* 32000 */
    0x000b9d64,/* 44100 */ 0x000ca458,/* 48000 */ 0x00173ac9,/* 88200 */ 0x001948b1,/* 96000 */ 0x002e7592,/* 176400 */ 0x00329162,/* 192000 */ },
    /* 256*FS mclk */
    {0x000436c8,/* 8000 */ 0x0005ceb2,/* 11025 */ 0x0006522c,/* 12000 */ 0x00086d90,/* 16000 */ 0x000b9d64,/* 22050 */ 0x000ca458,/* 24000 */ 0x0010db20,/* 32000 */
    0x00173ac9,/* 44100 */ 0x001948b1,/* 48000 */ 0x002e7592,/* 88200 */ 0x00329162,/* 96000 */ 0x005ceb24,/* 176400 */ 0x006522c4,/* 192000 */ },
    /* 384*FS mclk */
    {0x0006522c,/* 8000 */ 0x0008b60b,/* 11025 */ 0x00097b42,/* 12000 */ 0x000ca458,/* 16000 */ 0x00116c16,/* 22050 */ 0x0012f684,/* 24000 */ 0x001948b1,/* 32000 */
    0x0022d82d,/* 44100 */ 0x0025ed09,/* 48000 */ 0x0045b05b,/* 88200 */ 0x004bda13,/* 96000 */ 0x008b60b6,/* 176400 */ 0x0097b426,/* 192000 */ },
    /* 512*FS mclk */
    {0x00086d90,/* 8000 */ 0x000b9d64,/* 11025 */ 0x000ca458,/* 12000 */ 0x0010db20,/* 16000 */ 0x00173ac9,/* 22050 */ 0x001948b1,/* 24000 */ 0x0021b641,/* 32000 */
    0x002e7592,/* 44100 */ 0x00329162,/* 48000 */ 0x005ceb24,/* 88200 */ 0x006522c4,/* 96000 */ 0x00b9d648,/* 176400 */ 0x00ca4588,/* 192000 */ },
    /* 1024*FS mclk */
    {0x0010db20,/* 8000 */ 0x00173ac9,/* 11025 */ 0x001948b1,/* 12000 */ 0x0021b641,/* 16000 */ 0x002e7592,/* 22050 */ 0x00329162,/* 24000 */ 0x00436c82,/* 32000 */
    0x005ceb24,/* 44100 */ 0x006522c4,/* 48000 */ 0x00b9d648,/* 88200 */ 0x00ca4588,/* 96000 */ 0x0173ac90,/* 176400 */ 0x01948b10,/* 192000 */ },
};

#elif defined (AIAO_PLL_750MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x0002cc3d,/* 8000 */ 0x0003db11,/* 11025 */ 0x0004325c,/* 12000 */ 0x0005987b,/* 16000 */ 0x0007b623,/* 22050 */ 0x000864b8,/* 24000 */ 0x000b30f6,/* 32000 */
    0x000f6c46,/* 44100 */ 0x0010c971,/* 48000 */ 0x001ed88d,/* 88200 */ 0x002192e2,/* 96000 */ 0x003db11a,/* 176400 */ 0x004325c5,/* 192000 */ },
    /* 256*FS mclk */
    {0x0005987b,/* 8000 */ 0x0007b623,/* 11025 */ 0x000864b8,/* 12000 */ 0x000b30f6,/* 16000 */ 0x000f6c46,/* 22050 */ 0x0010c971,/* 24000 */ 0x001661ec,/* 32000 */
    0x001ed88d,/* 44100 */ 0x002192e2,/* 48000 */ 0x003db11a,/* 88200 */ 0x004325c5,/* 96000 */ 0x007b6234,/* 176400 */ 0x00864b8a,/* 192000 */ },
    /* 384*FS mclk */
    {0x000864b8,/* 8000 */ 0x000b9134,/* 11025 */ 0x000c9715,/* 12000 */ 0x0010c971,/* 16000 */ 0x00172269,/* 22050 */ 0x00192e2a,/* 24000 */ 0x002192e2,/* 32000 */
    0x002e44d3,/* 44100 */ 0x00325c54,/* 48000 */ 0x005c89a7,/* 88200 */ 0x0064b8a8,/* 96000 */ 0x00b9134e,/* 176400 */ 0x00c97150,/* 192000 */ },
    /* 512*FS mclk */
    {0x000b30f6,/* 8000 */ 0x000f6c46,/* 11025 */ 0x0010c971,/* 12000 */ 0x001661ec,/* 16000 */ 0x001ed88d,/* 22050 */ 0x002192e2,/* 24000 */ 0x002cc3d8,/* 32000 */
    0x003db11a,/* 44100 */ 0x004325c5,/* 48000 */ 0x007b6234,/* 88200 */ 0x00864b8a,/* 96000 */ 0x00f6c468,/* 176400 */ 0x010c9714,/* 192000 */ },
    /* 1024*FS mclk */
    {0x001661ec,/* 8000 */ 0x001ed88d,/* 11025 */ 0x002192e2,/* 12000 */ 0x002cc3d8,/* 16000 */ 0x003db11a,/* 22050 */ 0x004325c5,/* 24000 */ 0x005987b1,/* 32000 */
    0x007b6234,/* 44100 */ 0x00864b8a,/* 48000 */ 0x00f6c468,/* 88200 */ 0x010c9714,/* 96000 */ 0x01ed88d0,/* 176400 */ 0x02192e28,/* 192000 */ },
};

#elif defined (AIAO_PLL_307MHZ)
static int g_u32MclkPLLTab[5][13] = {
        /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x0006d3a0,/* 8000 */ 0x00096872,/* 11025 */ 0x000a3d70,/* 12000 */ 0x000da740,/* 16000 */ 0x0012d0e5,/* 22050 */ 0x00147ae1,/* 24000 */ 0x001b4e81,/* 32000 */
    0x0025a1ca,/* 44100 */ 0x0028f5c2,/* 48000 */ 0x004b4395,/* 88200 */ 0x0051eb85,/* 96000 */ 0x0096872b,/* 176400 */ 0x00a3d70a,/* 192000 */ },
    /* 256*FS mclk */
    {0x000da740,/* 8000 */ 0x0012d0e5,/* 11025 */ 0x00147ae1,/* 12000 */ 0x001b4e81,/* 16000 */ 0x0025a1ca,/* 22050 */ 0x0028f5c2,/* 24000 */ 0x00369d03,/* 32000 */
    0x004b4395,/* 44100 */ 0x0051eb85,/* 48000 */ 0x0096872b,/* 88200 */ 0x00a3d70a,/* 96000 */ 0x012d0e56,/* 176400 */ 0x0147ae14,/* 192000 */ },
    /* 384*FS mclk */
    {0x00147ae1,/* 8000 */ 0x001c3958,/* 11025 */ 0x001eb851,/* 12000 */ 0x0028f5c2,/* 16000 */ 0x003872b0,/* 22050 */ 0x003d70a3,/* 24000 */ 0x0051eb85,/* 32000 */
    0x0070e560,/* 44100 */ 0x007ae147,/* 48000 */ 0x00e1cac1,/* 88200 */ 0x00f5c28f,/* 96000 */ 0x01c39582,/* 176400 */ 0x01eb851e,/* 192000 */ },
    /* 512*FS mclk */
    {0x001b4e81,/* 8000 */ 0x0025a1ca,/* 11025 */ 0x0028f5c2,/* 12000 */ 0x00369d03,/* 16000 */ 0x004b4395,/* 22050 */ 0x0051eb85,/* 24000 */ 0x006d3a07,/* 32000 */
    0x0096872b,/* 44100 */ 0x00a3d70a,/* 48000 */ 0x012d0e56,/* 88200 */ 0x0147ae14,/* 96000 */ 0x025a1cac,/* 176400 */ 0x028f5c28,/* 192000 */ },
    /* 1024*FS mclk */
    {0x00369d03,/* 8000 */ 0x004b4395,/* 11025 */ 0x0051eb85,/* 12000 */ 0x006d3a07,/* 16000 */ 0x0096872b,/* 22050 */ 0x00a3d70a,/* 24000 */ 0x00da740e,/* 32000 */
    0x012d0e56,/* 44100 */ 0x0147ae14,/* 48000 */ 0x025a1cac,/* 88200 */ 0x028f5c28,/* 96000 */ 0x04b43958,/* 176400 */ 0x051eb850,/* 192000 */ },
};
#elif defined (AIAO_PLL_100MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    {0x0014f8b5,/* 8000 */ 0x001ce6c0,/* 11025 */ 0x001f7510,/* 12000 */ 0x0029f16b,/* 16000 */ 0x0039cd81,/* 22050 */ 0x003eea20,/* 24000 */ 0x0053e2d6,/* 32000 */
    0x00739b02,/* 44100 */ 0x007dd441,/* 48000 */ 0x00e73605,/* 88200 */ 0x00fba882,/* 96000 */ 0x01ce6c0a,/* 176400 */ 0x01f75104,/* 192000 */ },
    {0x0029f16b,/* 8000 */ 0x0039cd81,/* 11025 */ 0x003eea20,/* 12000 */ 0x0053e2d6,/* 16000 */ 0x00739b02,/* 22050 */ 0x007dd441,/* 24000 */ 0x00a7c5ac,/* 32000 */
    0x00e73605,/* 44100 */ 0x00fba882,/* 48000 */ 0x01ce6c0a,/* 88200 */ 0x01f75104,/* 96000 */ 0x039cd814,/* 176400 */ 0x03eea208,/* 192000 */ },
    {0x003eea20,/* 8000 */ 0x0056b441,/* 11025 */ 0x005e5f31,/* 12000 */ 0x007dd441,/* 16000 */ 0x00ad6883,/* 22050 */ 0x00bcbe62,/* 24000 */ 0x00fba882,/* 32000 */
    0x015ad106,/* 44100 */ 0x01797cc4,/* 48000 */ 0x02b5a20c,/* 88200 */ 0x02f2f988,/* 96000 */ 0x056b4418,/* 176400 */ 0x05e5f310,/* 192000 */ },
    {0x0053e2d6,/* 8000 */ 0x00739b02,/* 11025 */ 0x007dd441,/* 12000 */ 0x00a7c5ac,/* 16000 */ 0x00e73605,/* 22050 */ 0x00fba882,/* 24000 */ 0x014f8b58,/* 32000 */
    0x01ce6c0a,/* 44100 */ 0x01f75104,/* 48000 */ 0x039cd814,/* 88200 */ 0x03eea208,/* 96000 */ 0x0739b028,/* 176400 */ 0x07dd4410,/* 192000 */ },
    {0x00a7c5ac,/* 8000 */ 0x00e73605,/* 11025 */ 0x00fba882,/* 12000 */ 0x014f8b58,/* 16000 */ 0x01ce6c0a,/* 22050 */ 0x01f75104,/* 24000 */ 0x029f16b0,/* 32000 */
    0x039cd814,/* 44100 */ 0x03eea208,/* 48000 */ 0x0739b028,/* 88200 */ 0x07dd4410,/* 96000 */ 0x0e736050,/* 176400 */ 0x0fba8820,/* 192000 */ },

};
#elif defined (AIAO_PLL_860MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00027027,/* 8000 */ 0x00035c28,/* 11025 */ 0x0003a83a,/* 12000 */ 0x0004e04e,/* 16000 */ 0x0006b851,/* 22050 */ 0x00075075,/* 24000 */ 0x0009c09c,/* 32000 */
    0x000d70a3,/* 44100 */ 0x000ea0ea,/* 48000 */ 0x001ae147,/* 88200 */ 0x001d41d4,/* 96000 */ 0x0035c28f,/* 176400 */ 0x003a83a8,/* 192000 */ },
    /* 256*FS mclk */
    {0x0004e04e,/* 8000 */ 0x0006b851,/* 11025 */ 0x00075075,/* 12000 */ 0x0009c09c,/* 16000 */ 0x000d70a3,/* 22050 */ 0x000ea0ea,/* 24000 */ 0x00138138,/* 32000 */
    0x001ae147,/* 44100 */ 0x001d41d4,/* 48000 */ 0x0035c28f,/* 88200 */ 0x003a83a8,/* 96000 */ 0x006b851e,/* 176400 */ 0x00750750,/* 192000 */ },
    /* 384*FS mclk */
    {0x00075075,/* 8000 */ 0x000a147a,/* 11025 */ 0x000af8af,/* 12000 */ 0x000ea0ea,/* 16000 */ 0x001428f5,/* 22050 */ 0x0015f15f,/* 24000 */ 0x001d41d4,/* 32000 */
    0x002851eb,/* 44100 */ 0x002be2be,/* 48000 */ 0x0050a3d7,/* 88200 */ 0x0057c57c,/* 96000 */ 0x00a147ae,/* 176400 */ 0x00af8af9,/* 192000 */ },
    /* 512*FS mclk */
    {0x0009c09c,/* 8000 */ 0x000d70a3,/* 11025 */ 0x000ea0ea,/* 12000 */ 0x00138138,/* 16000 */ 0x001ae147,/* 22050 */ 0x001d41d4,/* 24000 */ 0x00270270,/* 32000 */
    0x0035c28f,/* 44100 */ 0x003a83a8,/* 48000 */ 0x006b851e,/* 88200 */ 0x00750750,/* 96000 */ 0x00d70a3d,/* 176400 */ 0x00ea0ea1,/* 192000 */ },
    /* 1024*FS mclk */
    {0x00138138,/* 8000 */ 0x001ae147,/* 11025 */ 0x001d41d4,/* 12000 */ 0x00270270,/* 16000 */ 0x0035c28f,/* 22050 */ 0x003a83a8,/* 24000 */ 0x004e04e0,/* 32000 */
    0x006b851e,/* 44100 */ 0x00750750,/* 48000 */ 0x00d70a3d,/* 88200 */ 0x00ea0ea1,/* 96000 */ 0x01ae147a,/* 176400 */ 0x01d41d42,/* 192000 */ },
};

#elif defined (AIAO_PLL_297MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk0*pow(2, CRG_POW)/ ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00070fa5,/* 8000 */ 0x0009bb29,/* 11025 */ 0x000a9778,/* 12000 */ 0x000e1f4a,/* 16000 */ 0x00137653, /* 22050 */ 0x00152ef0,/* 24000 */ 0x001c3e95, /* 32000 */
     0x0026eca6,/* 44100 */ 0x002a5de0,/* 48000 */ 0x004dd94c,/* 88200 */ 0x0054bbc1,/* 96000 */ 0x009bb299,/* 176400 */ 0x00a97782, /* 192000 */ },
    /* 256*FS mclk */
    {0x000e1f4a,/* 8000 */ 0x00137653,/* 11025 */ 0x00152ef0,/* 12000 */ 0x001c3e95,/* 16000 */ 0x0026eca6,/* 22050 */ 0x002a5de0,/* 24000 */ 0x00387d2b, /* 32000 */
     0x004dd94c,/* 44100 */ 0x0054bbc1,/* 48000 */ 0x009bb299,/* 88200 */ 0x00a97782,/* 96000 */ 0x01376532,/* 176400 */ 0x0152ef04, /* 192000 */ },
    /* 384*FS mclk */
    {0x00152ef0,/* 8000 */ 0x001d317c,/* 11025 */ 0x001fc668,/* 12000 */ 0x002a5de0,/* 16000 */ 0x003a62f9,/* 22050 */ 0x003f8cd0,/* 24000 */ 0x0054bbc1, /* 32000 */
     0x0074c5f3,/* 44100 */ 0x007f19a1,/* 48000 */ 0x00e98be6,/* 88200 */ 0x00fe3343,/* 96000 */ 0x01d317cc,/* 176400 */ 0x01fc6686, /* 192000 */ },
    /* 512*FS mclk */
    {0x001c3e95,/* 8000 */ 0x0026eca6,/* 11025 */ 0x002a5de0,/* 12000 */ 0x00387d2b,/* 16000 */ 0x004dd94c,/* 22050 */ 0x0054bbc1,/* 24000 */ 0x0070fa56,/* 32000 */
     0x009bb299,/* 44100 */ 0x00a97782,/* 48000 */ 0x01376532,/* 88200 */ 0x0152ef04,/* 96000 */ 0x026eca64,/* 176400 */ 0x02a5de08, /* 192000 */ },
    /* 1024*FS mclk */
    {0x00387d2b,/* 8000 */ 0x004dd94c,/* 11025 */ 0x0054bbc1,/* 12000 */ 0x0070fa56,/* 16000 */ 0x009bb299,/* 22050 */ 0x00a97782,/* 24000 */ 0x00e1f4ad,/* 32000 */
     0x01376532,/* 44100 */ 0x0152ef04,/* 48000 */ 0x026eca64,/* 88200 */ 0x02a5de08,/* 96000 */ 0x04dd94c8,/* 176400 */ 0x054bbc10, /* 192000 */ },
};

#elif defined (AIAO_PLL_663MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00032916,/* 8000 */ 0x00045b05,/* 11025 */ 0x0004bda1,/* 12000 */ 0x0006522c,/* 16000 */ 0x0008b60b,/* 22050 */ 0x00097b42,/* 24000 */ 0x000ca458,/* 32000 */
    0x00116c16,/* 44100 */ 0x0012f684,/* 48000 */ 0x0022d82d,/* 88200 */ 0x0025ed09,/* 96000 */ 0x0045b05b,/* 176400 */ 0x004bda13,/* 192000 */ },
    /* 256*FS mclk */
    {0x0006522c,/* 8000 */ 0x0008b60b,/* 11025 */ 0x00097b42,/* 12000 */ 0x000ca458,/* 16000 */ 0x00116c16,/* 22050 */ 0x0012f684,/* 24000 */ 0x001948b1,/* 32000 */
    0x0022d82d,/* 44100 */ 0x0025ed09,/* 48000 */ 0x0045b05b,/* 88200 */ 0x004bda13,/* 96000 */ 0x008b60b6,/* 176400 */ 0x0097b426,/* 192000 */ },
    /* 384*FS mclk */
    {0x00097b42,/* 8000 */ 0x000d1111,/* 11025 */ 0x000e38e3,/* 12000 */ 0x0012f684,/* 16000 */ 0x001a2222,/* 22050 */ 0x001c71c7,/* 24000 */ 0x0025ed09,/* 32000 */
    0x00344444,/* 44100 */ 0x0038e38e,/* 48000 */ 0x00688888,/* 88200 */ 0x0071c71c,/* 96000 */ 0x00d11111,/* 176400 */ 0x00e38e39,/* 192000 */ },
    /* 512*FS mclk */
    {0x000ca458,/* 8000 */ 0x00116c16,/* 11025 */ 0x0012f684,/* 12000 */ 0x001948b1,/* 16000 */ 0x0022d82d,/* 22050 */ 0x0025ed09,/* 24000 */ 0x00329162,/* 32000 */
    0x0045b05b,/* 44100 */ 0x004bda13,/* 48000 */ 0x008b60b6,/* 88200 */ 0x0097b426,/* 96000 */ 0x0116c16c,/* 176400 */ 0x012f684c,/* 192000 */ },
    /* 1024*FS mclk */
    {0x001948b1,/* 8000 */ 0x0022d82d,/* 11025 */ 0x0025ed09,/* 12000 */ 0x00329162,/* 16000 */ 0x0045b05b,/* 22050 */ 0x004bda13,/* 24000 */ 0x006522c4,/* 32000 */
    0x008b60b6,/* 44100 */ 0x0097b426,/* 48000 */ 0x0116c16c,/* 88200 */ 0x012f684c,/* 96000 */ 0x022d82d8,/* 176400 */ 0x025ed098,/* 192000 */ },
};

#elif defined (AIAO_PLL_933MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00023ee0,/* 8000 */ 0x00031840,/* 11025 */ 0x00035e50,/* 12000 */ 0x00047dc1,/* 16000 */ 0x00063081,/* 22050 */ 0x0006bca1,/* 24000 */ 0x0008fb82,/* 32000 */
    0x000c6102,/* 44100 */ 0x000d7943,/* 48000 */ 0x0018c205,/* 88200 */ 0x001af286,/* 96000 */ 0x0031840a,/* 176400 */ 0x0035e50d,/* 192000 */ },
    /* 256*FS mclk */
    {0x00047dc1,/* 8000 */ 0x00063081,/* 11025 */ 0x0006bca1,/* 12000 */ 0x0008fb82,/* 16000 */ 0x000c6102,/* 22050 */ 0x000d7943,/* 24000 */ 0x0011f704,/* 32000 */
    0x0018c205,/* 44100 */ 0x001af286,/* 48000 */ 0x0031840a,/* 88200 */ 0x0035e50d,/* 96000 */ 0x00630815,/* 176400 */ 0x006bca1b,/* 192000 */ },
    /* 384*FS mclk */
    {0x0006bca1,/* 8000 */ 0x000948c2,/* 11025 */ 0x000a1af2,/* 12000 */ 0x000d7943,/* 16000 */ 0x00129184,/* 22050 */ 0x001435e5,/* 24000 */ 0x001af286,/* 32000 */
    0x00252308,/* 44100 */ 0x00286bca,/* 48000 */ 0x004a4610,/* 88200 */ 0x0050d794,/* 96000 */ 0x00948c20,/* 176400 */ 0x00a1af28,/* 192000 */ },
    /* 512*FS mclk */
    {0x0008fb82,/* 8000 */ 0x000c6102,/* 11025 */ 0x000d7943,/* 12000 */ 0x0011f704,/* 16000 */ 0x0018c205,/* 22050 */ 0x001af286,/* 24000 */ 0x0023ee09,/* 32000 */
    0x0031840a,/* 44100 */ 0x0035e50d,/* 48000 */ 0x00630815,/* 88200 */ 0x006bca1b,/* 96000 */ 0x00c6102b,/* 176400 */ 0x00d79436,/* 192000 */ },
    /* 1024*FS mclk */
    {0x0011f704,/* 8000 */ 0x0018c205,/* 11025 */ 0x001af286,/* 12000 */ 0x0023ee09,/* 16000 */ 0x0031840a,/* 22050 */ 0x0035e50d,/* 24000 */ 0x0047dc12,/* 32000 */
    0x00630815,/* 44100 */ 0x006bca1b,/* 48000 */ 0x00c6102b,/* 88200 */ 0x00d79436,/* 96000 */ 0x018c2056,/* 176400 */ 0x01af286c,/* 192000 */ },
};

#elif defined (AIAO_PLL_909MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x00024e6a,/* 8000 */ 0x00032daa,/* 11025 */ 0x0003759f,/* 12000 */ 0x00049cd4,/* 16000 */ 0x00065b54,/* 22050 */ 0x0006eb3e,/* 24000 */ 0x000939a8,/* 32000 */
    0x000cb6a8,/* 44100 */ 0x000dd67c,/* 48000 */ 0x00196d51,/* 88200 */ 0x001bacf9,/* 96000 */ 0x0032daa3,/* 176400 */ 0x003759f2,/* 192000 */ },
    /* 256*FS mclk */
    {0x00049cd4,/* 8000 */ 0x00065b54,/* 11025 */ 0x0006eb3e,/* 12000 */ 0x000939a8,/* 16000 */ 0x000cb6a8,/* 22050 */ 0x000dd67c,/* 24000 */ 0x00127350,/* 32000 */
    0x00196d51,/* 44100 */ 0x001bacf9,/* 48000 */ 0x0032daa3,/* 88200 */ 0x003759f2,/* 96000 */ 0x0065b546,/* 176400 */ 0x006eb3e4,/* 192000 */ },
    /* 384*FS mclk */
    {0x0006eb3e,/* 8000 */ 0x000988fe,/* 11025 */ 0x000a60dd,/* 12000 */ 0x000dd67c,/* 16000 */ 0x001311fd,/* 22050 */ 0x0014c1ba,/* 24000 */ 0x001bacf9,/* 32000 */
    0x002623fa,/* 44100 */ 0x00298375,/* 48000 */ 0x004c47f5,/* 88200 */ 0x005306eb,/* 96000 */ 0x00988fea,/* 176400 */ 0x00a60dd6,/* 192000 */ },
    /* 512*FS mclk */
    {0x000939a8,/* 8000 */ 0x000cb6a8,/* 11025 */ 0x000dd67c,/* 12000 */ 0x00127350,/* 16000 */ 0x00196d51,/* 22050 */ 0x001bacf9,/* 24000 */ 0x0024e6a1,/* 32000 */
    0x0032daa3,/* 44100 */ 0x003759f2,/* 48000 */ 0x0065b546,/* 88200 */ 0x006eb3e4,/* 96000 */ 0x00cb6a8d,/* 176400 */ 0x00dd67c9,/* 192000 */ },
    /* 1024*FS mclk */
    {0x00127350,/* 8000 */ 0x00196d51,/* 11025 */ 0x001bacf9,/* 12000 */ 0x0024e6a1,/* 16000 */ 0x0032daa3,/* 22050 */ 0x003759f2,/* 24000 */ 0x0049cd43,/* 32000 */
    0x0065b546,/* 44100 */ 0x006eb3e4,/* 48000 */ 0x00cb6a8d,/* 88200 */ 0x00dd67c9,/* 96000 */ 0x0196d51a,/* 176400 */ 0x01bacf92,/* 192000 */ },
};

#elif defined (AIAO_PLL_1081MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x0001f07c,/* 8000 */ 0x0002ac37,/* 11025 */ 0x0002e8ba,/* 12000 */ 0x0003e0f8,/* 16000 */ 0x0005586f,/* 22050 */ 0x0005d174,/* 24000 */ 0x0007c1f0,/* 32000 */
    0x000ab0df,/* 44100 */ 0x000ba2e8,/* 48000 */ 0x001561be,/* 88200 */ 0x001745d1,/* 96000 */ 0x002ac37d,/* 176400 */ 0x002e8ba3,/* 192000 */ },
    /* 256*FS mclk */
    {0x0003e0f8,/* 8000 */ 0x0005586f,/* 11025 */ 0x0005d174,/* 12000 */ 0x0007c1f0,/* 16000 */ 0x000ab0df,/* 22050 */ 0x000ba2e8,/* 24000 */ 0x000f83e1,/* 32000 */
    0x001561be,/* 44100 */ 0x001745d1,/* 48000 */ 0x002ac37d,/* 88200 */ 0x002e8ba3,/* 96000 */ 0x005586fb,/* 176400 */ 0x005d1746,/* 192000 */ },
    /* 384*FS mclk */
    {0x0005d174,/* 8000 */ 0x000804a7,/* 11025 */ 0x0008ba2e,/* 12000 */ 0x000ba2e8,/* 16000 */ 0x0010094f,/* 22050 */ 0x0011745d,/* 24000 */ 0x001745d1,/* 32000 */
    0x0020129e,/* 44100 */ 0x0022e8ba,/* 48000 */ 0x0040253c,/* 88200 */ 0x0045d174,/* 96000 */ 0x00804a79,/* 176400 */ 0x008ba2e9,/* 192000 */ },
    /* 512*FS mclk */
    {0x0007c1f0,/* 8000 */ 0x000ab0df,/* 11025 */ 0x000ba2e8,/* 12000 */ 0x000f83e1,/* 16000 */ 0x001561be,/* 22050 */ 0x001745d1,/* 24000 */ 0x001f07c2,/* 32000 */
    0x002ac37d,/* 44100 */ 0x002e8ba3,/* 48000 */ 0x005586fb,/* 88200 */ 0x005d1746,/* 96000 */ 0x00ab0df7,/* 176400 */ 0x00ba2e8c,/* 192000 */ },
    /* 1024*FS mclk */
    {0x000f83e1,/* 8000 */ 0x001561be,/* 11025 */ 0x001745d1,/* 12000 */ 0x001f07c2,/* 16000 */ 0x002ac37d,/* 22050 */ 0x002e8ba3,/* 24000 */ 0x003e0f84,/* 32000 */
    0x005586fb,/* 44100 */ 0x005d1746,/* 48000 */ 0x00ab0df7,/* 88200 */ 0x00ba2e8c,/* 96000 */ 0x01561bee,/* 176400 */ 0x01745d18,/* 192000 */ },
};

#elif defined (AIAO_PLL_798MHZ)
static HI_U32 g_u32MclkPLLTab[5][13] = {
    /* crg = mclk * FS * pow(2, CRG_POW) / ARM_BPLL_FREQ */
    /* 128*FS mclk */
    {0x0002a02a,/* 8000 */ 0x00039e53,/* 11025 */ 0x0003f03f,/* 12000 */ 0x00054054,/* 16000 */ 0x00073ca7,/* 22050 */ 0x0007e07e,/* 24000 */ 0x000a80a8,/* 32000 */
    0x000e794e,/* 44100 */ 0x000fc0fc,/* 48000 */ 0x001cf29c,/* 88200 */ 0x001f81f8,/* 96000 */ 0x0039e538,/* 176400 */ 0x003f03f0,/* 192000 */ },
    /* 256*FS mclk */
    {0x00054054,/* 8000 */ 0x00073ca7,/* 11025 */ 0x0007e07e,/* 12000 */ 0x000a80a8,/* 16000 */ 0x000e794e,/* 22050 */ 0x000fc0fc,/* 24000 */ 0x00150150,/* 32000 */
    0x001cf29c,/* 44100 */ 0x001f81f8,/* 48000 */ 0x0039e538,/* 88200 */ 0x003f03f0,/* 96000 */ 0x0073ca70,/* 176400 */ 0x007e07e0,/* 192000 */ },
    /* 384*FS mclk */
    {0x0007e07e,/* 8000 */ 0x000adafa,/* 11025 */ 0x000bd0bd,/* 12000 */ 0x000fc0fc,/* 16000 */ 0x0015b5f5,/* 22050 */ 0x0017a17a,/* 24000 */ 0x001f81f8,/* 32000 */
    0x002b6bea,/* 44100 */ 0x002f42f4,/* 48000 */ 0x0056d7d4,/* 88200 */ 0x005e85e8,/* 96000 */ 0x00adafa8,/* 176400 */ 0x00bd0bd1,/* 192000 */ },
    /* 512*FS mclk */
    {0x000a80a8,/* 8000 */ 0x000e794e,/* 11025 */ 0x000fc0fc,/* 12000 */ 0x00150150,/* 16000 */ 0x001cf29c,/* 22050 */ 0x001f81f8,/* 24000 */ 0x002a02a0,/* 32000 */
    0x0039e538,/* 44100 */ 0x003f03f0,/* 48000 */ 0x0073ca70,/* 88200 */ 0x007e07e0,/* 96000 */ 0x00e794e0,/* 176400 */ 0x00fc0fc1,/* 192000 */ },
    /* 1024*FS mclk */
    {0x00150150,/* 8000 */ 0x001cf29c,/* 11025 */ 0x001f81f8,/* 12000 */ 0x002a02a0,/* 16000 */ 0x0039e538,/* 22050 */ 0x003f03f0,/* 24000 */ 0x00540540,/* 32000 */
    0x0073ca70,/* 44100 */ 0x007e07e0,/* 48000 */ 0x00e794e0,/* 88200 */ 0x00fc0fc1,/* 96000 */ 0x01cf29c0,/* 176400 */ 0x01f81f82,/* 192000 */ },
};

#else
#error "YOU MUST DEFINE AIAO PLL SOURCE!"
#endif

static HI_U32 GetMclkCrg(HI_U32 u32SampleRate, HI_U32 bclk_div, HI_U32 fclk_div)
{
    HI_U32 *pu32MclkTab;
    HI_U32 (*pu32MclkPLLTab)[13];
    HI_U32 mclk_div = bclk_div * fclk_div;

    pu32MclkPLLTab = g_u32MclkPLLTab;

    switch (mclk_div)
    {
    case 128:
        pu32MclkTab = pu32MclkPLLTab[AIAO_0128FS_TAB_IDX];
        break;
    case 256:
        pu32MclkTab = pu32MclkPLLTab[AIAO_0256FS_TAB_IDX];
        break;
    case 384:
        pu32MclkTab = pu32MclkPLLTab[AIAO_0384FS_TAB_IDX];
        break;
    case 512:
        pu32MclkTab = pu32MclkPLLTab[AIAO_0512FS_TAB_IDX];
        break;
    case 1024:
        pu32MclkTab = pu32MclkPLLTab[AIAO_1024FS_TAB_IDX];
        break;
    default:
        pu32MclkTab = pu32MclkPLLTab[AIAO_0256FS_TAB_IDX];    /* defaulse 256*FS */
    }

    switch (u32SampleRate)
    {
    case 8000:
        return pu32MclkTab[AIAO_008KHz_SUB_IDX];
    case 11025:
        return pu32MclkTab[AIAO_011KHz_SUB_IDX];
    case 12000:
        return pu32MclkTab[AIAO_012KHz_SUB_IDX];
    case 16000:
        return pu32MclkTab[AIAO_016KHz_SUB_IDX];
    case 22050:
        return pu32MclkTab[AIAO_022KHz_SUB_IDX];
    case 24000:
        return pu32MclkTab[AIAO_024KHz_SUB_IDX];
    case 32000:
        return pu32MclkTab[AIAO_032KHz_SUB_IDX];
    case 44100:
        return pu32MclkTab[AIAO_044KHz_SUB_IDX];
    case 48000:
        return pu32MclkTab[AIAO_048KHz_SUB_IDX];
    case 88200:
        return pu32MclkTab[AIAO_088KHz_SUB_IDX];
    case 96000:
        return pu32MclkTab[AIAO_096KHz_SUB_IDX];
    case 176400:
        return pu32MclkTab[AIAO_176KHz_SUB_IDX];
    case 192000:
        return pu32MclkTab[AIAO_192KHz_SUB_IDX];
    default:
        return pu32MclkTab[AIAO_048KHz_SUB_IDX];
    }
}

static HI_U32 GetFslkDiv(HI_U32 u32FSDiv)
{
    HI_U32 n;

    for (n = 0; n < sizeof(g_u16FsDivTab) / sizeof(g_u16FsDivTab[0]); n++)
    {
        if (((HI_U32)g_u16FsDivTab[n]) == u32FSDiv)
        {
            break;
        }
    }

    return (HI_U32)n;
}

static HI_U32 GetBclkDiv(HI_U32 u32XclkDiv)
{
    HI_U32 n;

    for (n = 0; n < 16; n++)
    {
        if (((HI_U32)g_u16BclkDivTab[n]) == u32XclkDiv)
        {
            break;
        }
    }

    return (HI_U32)n;
}

static HI_VOID IOAddressMap(HI_VOID)
{
    HI_VOID *pRegAIAOVirAddr;
    HI_S32 ch;

    pRegAIAOVirAddr = (HI_VOID *)AIAO_CBB_REGBASE;
    g_pAIAOComReg = (S_AIAO_COM_REGS_TYPE *)pRegAIAOVirAddr;

    for (ch = 0; ch < AIAO_MAX_RX_PORT_NUMBER; ch++)
    {
        g_pAIAORxReg[ch] = (S_AIAO_RX_REGS_TYPE *)((pRegAIAOVirAddr + AIAO_RX_OFFSET) + AIAO_RX_REG_BANDSIZE * ch);
    }

    for (ch = 0; ch < AIAO_MAX_TX_PORT_NUMBER; ch++)
    {
        g_pAIAOTxReg[ch] = (S_AIAO_TX_REGS_TYPE *)((pRegAIAOVirAddr + AIAO_TX_OFFSET) + AIAO_TX_REG_BANDSIZE * ch);
    }

    for (ch = 0; ch < AIAO_MAX_TXSPDIF_PORT_NUMBER; ch++)
    {
        g_pAIAOTxSpdifReg[ch] = (S_AIAO_TXSPDIF_REGS_TYPE *)((pRegAIAOVirAddr
                                                              + AIAO_TXSDPIF_OFFSET) + AIAO_TXSPDIF_REG_BANDSIZE
                                                             * ch);
    }

    for (ch = 0; ch < AIAO_MAX_TXSPDIF_PORT_NUMBER; ch++)
    {
        g_pAIAOSpdiferReg[ch] = (S_AIAO_SPDIFER_REGS_TYPE *)((pRegAIAOVirAddr
                                                              + AIAO_SDPIFER_OFFSET) + AIAO_SPDIFER_REG_BANDSIZE
                                                             * ch);
    }

    return;
}

static HI_VOID IOaddressUnmap(HI_VOID)
{
    HI_S32 ch;

    if (HI_NULL != g_pAIAOComReg)
    {
        g_pAIAOComReg = HI_NULL;
    }

    for (ch = 0; ch < AIAO_MAX_RX_PORT_NUMBER; ch++)
    {
        g_pAIAORxReg[ch] = HI_NULL;
    }

    for (ch = 0; ch < AIAO_MAX_TX_PORT_NUMBER; ch++)
    {
        g_pAIAOTxReg[ch] = HI_NULL;
    }

    for (ch = 0; ch < AIAO_MAX_TXSPDIF_PORT_NUMBER; ch++)
    {
        g_pAIAOTxSpdifReg[ch] = HI_NULL;
    }

    for (ch = 0; ch < AIAO_MAX_TXSPDIF_PORT_NUMBER; ch++)
    {
        g_pAIAOSpdiferReg[ch] = HI_NULL;
    }
}

HI_S32 AIAO_HW_PowerOn(HI_VOID)
{
    HI_U32 timeout = 0;
    U_PERI_CRG70 uTmpVal;
/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_srst_req = 1;  /* reset */
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    while (timeout < 10)
    {
        if (0 == g_pAIAOComReg->AIAO_STATUS.bits.srst_rdy)
        {
            break;
        }
        timeout++;
    }

    if (10 == timeout)
    {
        HI_FATAL_AIAO("aiao_srst_req failed!\n");
        return HI_FAILURE;
    }

/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;

#if defined (AIAO_PLL_492MHZ) || \
    defined (AIAO_PLL_933MHZ) || \
    defined (AIAO_PLL_750MHZ) || \
    defined (AIAO_PLL_307MHZ)
    uTmpVal.bits.aiao_mclk_sel = 0;
#elif defined (AIAO_PLL_600MHZ)
    uTmpVal.bits.aiao_mclk_sel = 1;
#endif

    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;
/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_cken = 1;      /* enable aiao working clock */
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;
    udelay(1);
/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_srst_req = 0;  /* enable aiao */
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    while (timeout < 10)
    {
        if (1 == g_pAIAOComReg->AIAO_STATUS.bits.srst_rdy)
        {
            break;
        }
        timeout++;
    }

    if (10 == timeout)
    {
        HI_FATAL_AIAO("aiao_srst_req failed!\n");
        return HI_FAILURE;
    }

/*############################################################################*/
#if    defined(CHIP_TYPE_hi3798mv100)    \
    || defined(CHIP_TYPE_hi3796mv100)

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 0;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_skipcfg = 0x10;    //aiaoclk = 100M
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 1;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

#elif  defined(CHIP_TYPE_hi3716mv410)  \
    || defined(CHIP_TYPE_hi3716mv420)

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 0;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_skipcfg = 0x18;    //aiaoclk = 50M
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 1;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

#elif   defined(CHIP_TYPE_hi3798cv200)   \
     || defined(CHIP_TYPE_hi3798mv200)   \
     || defined(CHIP_TYPE_hi3798mv300)   \
     || defined(CHIP_TYPE_hi3796mv200)   \
     || defined(CHIP_TYPE_hi3716mv450)   \
     || defined(CHIP_TYPE_hi3798mv310)   \
     || defined(CHIP_TYPE_hi3716mv430)

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_clk_sel = 1;         //aiao_clk_sel = 1 --> 50M;aiao_clk_sel = 0 --> 100M
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 0;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_skipcfg = 0x0;    //aiaoclk = 50M
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;

    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiaoclk_loaden = 1;
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;
#endif

    if (!g_pAIAOComReg->HW_CAPABILITY)
    {
        return HI_FAILURE;
    }
/*############################################################################*/
    return HI_SUCCESS;
}

HI_VOID AIAO_HW_PowerOff(HI_VOID)
{
    HI_U32 timeout = 0;
    U_PERI_CRG70 uTmpVal;
/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_srst_req = 1;  /* disable aiao */
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;
    while (timeout < 10)
    {
        if (0 == g_pAIAOComReg->AIAO_STATUS.bits.srst_rdy)
        {
            break;
        }
        timeout++;
    }

    if (10 == timeout)
    {
        HI_FATAL_AIAO("aiao_srst_req failed!\n");
        return;
    }

/*############################################################################*/
    uTmpVal.u32 = g_pstRegCrg->PERI_CRG70.u32;
    uTmpVal.bits.aiao_cken = 0;      /* disable aiao working clock */
    g_pstRegCrg->PERI_CRG70.u32 = uTmpVal.u32;
    udelay(1);
/*############################################################################*/
}

static HI_VOID AIAO_HW_SetOutstanding(HI_VOID)
{
    g_pAIAOComReg->OUT_STANDING.bits.vhb_outst_num = 2;
}

HI_S32 AIAO_HW_Init(HI_VOID)
{
    HI_U32 Ret;
    IOAddressMap();

    Ret = AIAO_HW_PowerOn();
    if(HI_SUCCESS !=  Ret)
    {
        return Ret;
    }

     AIAO_HW_SetOutstanding();

     return HI_SUCCESS;
}

HI_VOID  AIAO_HW_DeInit(HI_VOID)
{
    AIAO_HW_PowerOff();
    IOaddressUnmap();
}

HI_VOID  AIAO_HW_SetI2SSlaveClk(AIAO_PORT_ID_E enPortID, AIAO_IfAttr_S *pstIfAttrSlave)
{
    HI_U32 ChnId = PORT2CHID(enPortID);
    HI_U32 CrgId = 0;

    AIAO_LOW_SetI2SMode(ChnId, PORT2DIR(enPortID), pstIfAttrSlave->enI2SMode);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
        CrgId = RX_CRG2ID(pstIfAttrSlave->eCrgSource);
        AIAO_LOW_SetRxI2SSlaveClk(CrgId, pstIfAttrSlave);
        AIAO_LOW_SetRxCrgClkEn(CrgId, 1);
        break;
    case AIAO_MODE_TXI2S:
        CrgId = TX_CRG2ID(pstIfAttrSlave->eCrgSource);
        AIAO_LOW_SetTxI2SSlaveClk(CrgId, pstIfAttrSlave);
        AIAO_LOW_SetTxCrgClkEn(CrgId, 1);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SMasterClk(AIAO_PORT_ID_E enPortID, AIAO_IfAttr_S *pstIfAttrMaster)
{
    HI_U32 ChnId = PORT2CHID(enPortID);
    HI_U32 CrgId = 0;

    AIAO_LOW_SetI2SMode(ChnId, PORT2DIR(enPortID), pstIfAttrMaster->enI2SMode);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
        CrgId = RX_CRG2ID(pstIfAttrMaster->eCrgSource);
        AIAO_LOW_SetRxI2SMasterClk(CrgId, pstIfAttrMaster);
        AIAO_LOW_SetRxCrgClkEn(CrgId, 1);
        break;
    case AIAO_MODE_TXI2S:
        CrgId = TX_CRG2ID(pstIfAttrMaster->eCrgSource);
        AIAO_LOW_SetTxI2SMasterClk(CrgId, pstIfAttrMaster);
        AIAO_LOW_SetTxCrgClkEn(CrgId, 1);
        break;
    case AIAO_MODE_TXSPDIF:
        ChnId = SPDIF_TX_PORT2CHID(enPortID);
        AIAO_LOW_SetSPDIFMasterClk(ChnId, pstIfAttrMaster);
        AIAO_SPDIF_HAL_SetSamplerate(enPortID, pstIfAttrMaster->enRate);
        break;
    default:
        break;

    }
}

static HI_VOID  AIAO_HW_SetI2SDulicateClk(AIAO_PORT_ID_E enPortID, AIAO_IfAttr_S *pstIfAttrDuplicate)
{
    HI_U32 ChnId = 0;
    HI_U32 CrgId = 0;

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
        ChnId = RX_PORT2CHID(enPortID);
        CrgId = RX_CRG2ID(pstIfAttrDuplicate->eCrgSource);
        AIAO_LOW_SetI2SDulicateClk(ChnId, PORT2DIR(enPortID), pstIfAttrDuplicate);
        AIAO_LOW_SetRxCrgClkEn(CrgId, 1);
        break;
    case AIAO_MODE_TXI2S:
        ChnId = TX_PORT2CHID(enPortID);
        CrgId = TX_CRG2ID(pstIfAttrDuplicate->eCrgSource);
        AIAO_LOW_SetI2SDulicateClk(ChnId, PORT2DIR(enPortID), pstIfAttrDuplicate);
        AIAO_LOW_SetTxCrgClkEn(CrgId, 1);
        break;
    default:
        break;
    }
}

#if 1 //#ifdef HI_SND_HDMI_I2S_SPDIF_MUX
HI_VOID AIAO_HW_SetOpType(AIAO_PORT_ID_E enPortID, AIAO_OP_TYPE_E enOpType)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        g_pAIAOTxReg[ChnId]->TX_IF_ATTRI.bits.tx_spd_i2s_sel = enOpType;
        break;
    case AIAO_MODE_TXSPDIF:
        g_pAIAOTxSpdifReg[ChnId]->SPDIFTX_IF_ATTRI.bits.tx_spd_i2s_sel = enOpType;
    default:
        break;
    }
}
#endif

HI_VOID  AIAO_HW_SetIfAttr(AIAO_PORT_ID_E enPortID, AIAO_IfAttr_S *pstIfAttr)
{
    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        if (AIAO_MODE_PCM == pstIfAttr->enI2SMode)
        {
            AIAO_HW_SetPcmSyncDelay(enPortID, pstIfAttr->u32PcmDelayCycles);
        }
        else
        {
            AIAO_HW_SetI2SDataSelect(enPortID, AIAO_I2S_SD0, pstIfAttr->enSD0);
            AIAO_HW_SetI2SDataSelect(enPortID, AIAO_I2S_SD1, pstIfAttr->enSD1);
            AIAO_HW_SetI2SDataSelect(enPortID, AIAO_I2S_SD2, pstIfAttr->enSD2);
            AIAO_HW_SetI2SDataSelect(enPortID, AIAO_I2S_SD3, pstIfAttr->enSD3);
        }
        AIAO_HW_SetOpType(enPortID, SND_OP_TYPE_I2S);

        break;
    case AIAO_MODE_TXSPDIF:
        AIAO_HW_SetSPDIFPortEn(enPortID, 1);
        break;

    default:
        break;
    }

    AIAO_HW_SetMultislotMode(enPortID, pstIfAttr->bMultislot);
    AIAO_HW_SetI2SChNum(enPortID, pstIfAttr->bMultislot, pstIfAttr->enChNum);
    AIAO_HW_SetI2SBitDepth(enPortID, pstIfAttr->enBitDepth);
    AIAO_HW_SetI2SSourceSelect(enPortID, pstIfAttr->enSource);

    switch (pstIfAttr->enCrgMode)
    {
    case AIAO_CRG_MODE_MASTER:
        AIAO_HW_SetI2SMasterClk(enPortID, pstIfAttr);
        AIAO_HW_SetI2SDulicateClk(enPortID, pstIfAttr);
        break;
    case AIAO_CRG_MODE_SLAVE:
        AIAO_HW_SetI2SSlaveClk(enPortID, pstIfAttr);
        AIAO_HW_SetI2SDulicateClk(enPortID, pstIfAttr);
        break;
    case AIAO_CRG_MODE_DUPLICATE:
        AIAO_HW_SetI2SDulicateClk(enPortID, pstIfAttr);
        break;
    default:
        break;
    }
}

HI_VOID AIAO_HW_SetSPDIFPortEn(AIAO_PORT_ID_E enPortID, HI_S32 bEn)
{
    switch (PORT2CHID(enPortID))
    {
    case 0:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_0_port_en = bEn;
        break;

    case 1:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_1_port_en = bEn;
        break;
    case 2:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_2_port_en = bEn;
        break;

    case 3:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_3_port_en = bEn;
        break;

    default:
        break;
    }
}

HI_VOID AIAO_HW_SetSPDIFPortSelect(AIAO_PORT_ID_E enPortID, AIAO_SPDIFPORT_SOURCE_E eSrcChnId)
{
    switch (PORT2CHID(enPortID))
    {
    case 0:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_0_port_sel = eSrcChnId;
        break;

    case 1:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_1_port_sel = eSrcChnId;
        break;
    case 2:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_2_port_sel = eSrcChnId;
        break;

    case 3:
        g_pAIAOComReg->SPDIF_TX_MUX.bits.spdif_tx_3_port_sel = eSrcChnId;
        break;

    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SSourceSelect(AIAO_PORT_ID_E enPortID, AIAO_I2S_SOURCE_E eI2SSel)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetI2SSourceSelect(ChnId, PORT2DIR(enPortID), eI2SSel);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SDataSelect(AIAO_PORT_ID_E enPortID, AIAO_I2S_SD_E eOrgSd, AIAO_I2S_SD_E eSrcSd)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetI2SDataSelect(ChnId, PORT2DIR(enPortID), eOrgSd, eSrcSd);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SBitDepth(AIAO_PORT_ID_E enPortID, AIAO_BITDEPTH_E eBitDepth)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetI2SBitDepth(ChnId, PORT2DIR(enPortID), eBitDepth);
        break;
    case AIAO_MODE_TXSPDIF:
        AIAO_LOW_SPDIFSetBitDepth(ChnId, eBitDepth);
        AIAO_SPDIF_HAL_SetBitWidth(enPortID, eBitDepth);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SMode(AIAO_PORT_ID_E enPortID, AIAO_I2S_MODE_E eMode)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetI2SMode(ChnId, PORT2DIR(enPortID), eMode);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetMultislotMode(AIAO_PORT_ID_E enPortID, HI_S32 bEn)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetMultislotMode(ChnId, PORT2DIR(enPortID), bEn);
        break;
    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetI2SChNum(AIAO_PORT_ID_E enPortID, HI_S32 isMultislot, AIAO_I2S_CHNUM_E eChaNum)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetI2SChNum(ChnId, PORT2DIR(enPortID), isMultislot, eChaNum);
        break;
    case AIAO_MODE_TXSPDIF:
        AIAO_LOW_SPDIFSetChNum(ChnId, eChaNum);
        break;

    default:
        break;
    }
}

HI_VOID  AIAO_HW_SetPcmSyncDelay(AIAO_PORT_ID_E enPortID, HI_S32 nDelayCycles)
{
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (PORT2MODE(enPortID))
    {
    case AIAO_MODE_RXI2S:
    case AIAO_MODE_TXI2S:
        AIAO_LOW_SetPcmSyncDelay(ChnId, PORT2DIR(enPortID), nDelayCycles);
        break;
    default:
        break;
    }
}

static HI_VOID AIAO_LOW_SetRxI2SSlaveClk(HI_U32 u32CrgId, AIAO_IfAttr_S* pstIfAttrSlave)
{
    HI_U32 mclk;

    mclk = GetMclkCrg((HI_U32)(pstIfAttrSlave->enRate), pstIfAttrSlave->u32BCLK_DIV, pstIfAttrSlave->u32FCLK_DIV);

    if (AIAO_MODE_EDGE_RISE == pstIfAttrSlave->enRiseEdge)
    {
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div     = mclk;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 1;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen     = 1;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel     = 1;
        if (AIAO_MODE_I2S == pstIfAttrSlave->enI2SMode)
        {
            // i2s allways aiao_bclkin_pctrl 0
            g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 0;
        }
    }
    else
    {
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div     = mclk;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 0;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen     = 1;
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel     = 1;
    }
}

static HI_VOID AIAO_LOW_SetTxI2SSlaveClk(HI_U32 u32CrgId, AIAO_IfAttr_S* pstIfAttrSlave)
{
    HI_U32 mclk;

    mclk = GetMclkCrg((HI_U32)(pstIfAttrSlave->enRate), pstIfAttrSlave->u32BCLK_DIV, pstIfAttrSlave->u32FCLK_DIV);

    if (AIAO_MODE_EDGE_RISE == pstIfAttrSlave->enRiseEdge)
    {
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div     = mclk;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 1;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen     = 1;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel     = 1;
        if (AIAO_MODE_I2S == pstIfAttrSlave->enI2SMode)
        {
            // i2s allways aiao_bclkin_pctrl 0
            g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 0;
        }
    }
    else
    {
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div     = mclk;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkin_pctrl = 0;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen     = 1;
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel     = 1;
    }
}

static HI_VOID  AIAO_LOW_SetRxCrgClkEn(HI_U32 u32CrgId, HI_S32 bEn)
{
    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_cken = bEn;
}

static HI_VOID  AIAO_LOW_SetTxCrgClkEn(HI_U32 u32CrgId, HI_S32 bEn)
{
    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_cken = bEn;
}

static HI_VOID  AIAO_LOW_SetRxI2SMasterClk(HI_U32 u32CrgId, AIAO_IfAttr_S* pstIfAttrMaster)
{
    HI_U32 mclk, bclk, fclk;

    mclk = GetMclkCrg((HI_U32)(pstIfAttrMaster->enRate), pstIfAttrMaster->u32BCLK_DIV, pstIfAttrMaster->u32FCLK_DIV);
    bclk = GetBclkDiv(pstIfAttrMaster->u32BCLK_DIV);
    fclk = GetFslkDiv(pstIfAttrMaster->u32FCLK_DIV);

    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div  = mclk;
    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_div  = bclk;
    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_fsclk_div = fclk;
    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen  = 0;
    g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel  = 0;

    if (AIAO_MODE_EDGE_RISE == pstIfAttrMaster->enRiseEdge)
    {
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 1;
    }
    else
    {
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 0;
    }

    if (AIAO_MODE_I2S == pstIfAttrMaster->enI2SMode)
    {
        // i2s allways aiao_bclkout_pctrl 0
        g_pAIAOComReg->I2S_RX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 0;
    }
}

static HI_VOID AIAO_LOW_SetTxI2SMasterClk(HI_U32 u32CrgId, AIAO_IfAttr_S* pstIfAttrMaster)
{
    HI_U32 mclk, bclk, fclk;

    mclk = GetMclkCrg((HI_U32)(pstIfAttrMaster->enRate), pstIfAttrMaster->u32BCLK_DIV, pstIfAttrMaster->u32FCLK_DIV);
    bclk = GetBclkDiv(pstIfAttrMaster->u32BCLK_DIV);
    fclk = GetFslkDiv(pstIfAttrMaster->u32FCLK_DIV);

    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG0.bits.aiao_mclk_div  = mclk;
    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_div  = bclk;
    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_fsclk_div = fclk;
    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_oen  = 0;
    g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclk_sel  = 0;

    if (AIAO_MODE_EDGE_RISE == pstIfAttrMaster->enRiseEdge)
    {
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 1;
    }
    else
    {
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 0;
    }

    if (AIAO_MODE_I2S == pstIfAttrMaster->enI2SMode)
    {
        // i2s allways aiao_bclkout_pctrl 0
        g_pAIAOComReg->I2S_TX_CRG[u32CrgId].I2S_CRG_CFG1.bits.aiao_bclkout_pctrl = 0;
    }
}

static HI_VOID  AIAO_LOW_SetI2SDulicateClk(HI_U32 u32ChnId, HI_S32 Dir, AIAO_IfAttr_S *pstIfAttrDuplicate)
{
    AIAO_CRG_SOURCE_E org_eSource = pstIfAttrDuplicate->eCrgSource;

    if (AIAO_DIR_RX == Dir)
    {
        switch (u32ChnId)
        {
        case 0:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_00 = org_eSource;
            break;

        case 1:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_01 = org_eSource;
            break;
        case 2:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_02 = org_eSource;
            break;
        case 3:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_03 = org_eSource;
            break;

        case 4:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_04 = org_eSource;
            break;

        case 5:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_05 = org_eSource;
            break;
        case 6:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_06 = org_eSource;
            break;
        case 7:
            g_pAIAOComReg->AIAO_SWITCH_RX_BCLK.bits.inner_bclk_ws_sel_rx_07 = org_eSource;
            break;
        default:
            break;
        }
    }
    else if (AIAO_DIR_TX == Dir)
    {
        switch (u32ChnId)
        {
        case 0:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_00 = org_eSource;
            break;

        case 1:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_01 = org_eSource;
            break;
        case 2:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_02 = org_eSource;
            break;

        case 3:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_03 = org_eSource;
            break;
        case 4:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_04 = org_eSource;
            break;

        case 5:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_05 = org_eSource;
            break;
        case 6:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_06 = org_eSource;
            break;

        case 7:
            g_pAIAOComReg->AIAO_SWITCH_TX_BCLK.bits.inner_bclk_ws_sel_tx_07 = org_eSource;
            break;

        default:
            break;
        }
    }

    AIAO_LOW_SetI2SMode(u32ChnId, Dir, pstIfAttrDuplicate->enI2SMode);
}

static HI_VOID  AIAO_LOW_SetSPDIFMasterClk(HI_U32 u32ChnId, AIAO_IfAttr_S *pstIfAttrMaster)
{
    HI_U32 mclk, bclk, fclk;

    mclk = GetMclkCrg((HI_U32)(pstIfAttrMaster->enRate), pstIfAttrMaster->u32BCLK_DIV, pstIfAttrMaster->u32FCLK_DIV);
    bclk = GetBclkDiv(pstIfAttrMaster->u32BCLK_DIV);
    fclk = GetFslkDiv(pstIfAttrMaster->u32FCLK_DIV);
    g_pAIAOComReg->SPDIF_CRG[u32ChnId].SPDIF_CRG_CFG0.bits.aiao_mclk_div_spdif  = mclk;
    g_pAIAOComReg->SPDIF_CRG[u32ChnId].SPDIF_CRG_CFG1.bits.aiao_bclk_div_spdif  = bclk;
    g_pAIAOComReg->SPDIF_CRG[u32ChnId].SPDIF_CRG_CFG1.bits.aiao_fsclk_div_spdif = fclk;
    g_pAIAOComReg->SPDIF_CRG[u32ChnId].SPDIF_CRG_CFG1.bits.aiao_cken_spdif = 1;
}

static HI_VOID AIAO_LOW_SetI2SSourceSelect(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_SOURCE_E eI2SSel)
{
    if (AIAO_DIR_RX == Dir)
    {
        g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd_source_sel = eI2SSel;
    }
    else if (AIAO_DIR_TX == Dir)
    {
        g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd_source_sel = eI2SSel;
    }
}

static HI_VOID AIAO_LOW_SetI2SDataSelect(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_SD_E eOrgSd, AIAO_I2S_SD_E eSrcSd)
{
    if (AIAO_DIR_RX == Dir)
    {
        switch (eOrgSd)
        {
        case AIAO_I2S_SD0:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd0_sel = eSrcSd;
            break;
        case AIAO_I2S_SD1:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd1_sel = eSrcSd;
            break;
        case AIAO_I2S_SD2:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd2_sel = eSrcSd;
            break;
        case AIAO_I2S_SD3:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd3_sel = eSrcSd;
            break;
        }
    }
    else if (AIAO_DIR_TX == Dir)
    {
        switch (eOrgSd)
        {
        case AIAO_I2S_SD0:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd0_sel = eSrcSd;
            break;
        case AIAO_I2S_SD1:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd1_sel = eSrcSd;
            break;
        case AIAO_I2S_SD2:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd2_sel = eSrcSd;
            break;
        case AIAO_I2S_SD3:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd3_sel = eSrcSd;
            break;
        }
    }
}

static HI_VOID AIAO_LOW_SetI2SBitDepth(HI_U32 u32ChnId, HI_S32 Dir, AIAO_BITDEPTH_E eBitDepth)
{
    if (AIAO_DIR_RX == Dir)
    {
        switch (eBitDepth)
        {
        case AIAO_BIT_DEPTH_8:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_i2s_precision = 0;
            break;
        case AIAO_BIT_DEPTH_16:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_i2s_precision = 1;
            break;
        case AIAO_BIT_DEPTH_24:
            g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_i2s_precision = 2;
            break;
        }
    }
    else if (AIAO_DIR_TX == Dir)
    {
        switch (eBitDepth)
        {
        case AIAO_BIT_DEPTH_8:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_i2s_precision = 0;
            break;
        case AIAO_BIT_DEPTH_16:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_i2s_precision = 1;
            break;
        case AIAO_BIT_DEPTH_24:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_i2s_precision = 2;
            break;
        }
    }
}

static HI_VOID AIAO_LOW_SetI2SMode(HI_U32 u32ChnId, HI_S32 Dir, AIAO_I2S_MODE_E eMode)
{
    if (AIAO_DIR_RX == Dir)
    {
        g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_mode = eMode;
    }
    else if (AIAO_DIR_TX == Dir)
    {
        g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_mode = eMode;
    }
}

static HI_VOID AIAO_LOW_SetPcmSyncDelay(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 nDelayCycles)
{
    if (AIAO_DIR_RX == Dir)
    {
        g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_sd_offset = nDelayCycles;
    }
    else if (AIAO_DIR_TX == Dir)
    {
        g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_sd_offset = nDelayCycles;
    }
}

static HI_VOID AIAO_LOW_SetI2SChNum(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 isMultislot, AIAO_I2S_CHNUM_E eChaNum)
{
    if (AIAO_DIR_RX == Dir)
    {
        if (isMultislot)
        {
            switch (eChaNum)
            {
            case AIAO_I2S_CHNUM_2:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 0;
                break;
            case AIAO_I2S_CHNUM_4:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 1;
                break;
            case AIAO_I2S_CHNUM_8:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 2;
                break;
            case AIAO_I2S_CHNUM_16:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 3;
                break;
            default:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 0;
            }
        }
        else
        {
            switch (eChaNum)
            {
            case AIAO_I2S_CHNUM_1:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 0;
                break;
            case AIAO_I2S_CHNUM_2:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 1;
                break;
            case AIAO_I2S_CHNUM_8:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 3;
                break;
            default:
                g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_ch_num = 1;
            }
        }
    }
    else if (AIAO_DIR_TX == Dir)
    {
        switch (eChaNum)
        {
        case AIAO_I2S_CHNUM_1:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_ch_num = 0;
            break;
        case AIAO_I2S_CHNUM_2:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_ch_num = 1;
            break;
        case AIAO_I2S_CHNUM_8:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_ch_num = 3;
            break;
        default:
            g_pAIAOTxReg[u32ChnId]->TX_IF_ATTRI.bits.tx_ch_num = 1;
        }
    }
}

static HI_VOID AIAO_LOW_SetMultislotMode(HI_U32 u32ChnId, HI_S32 Dir, HI_S32 bEn)
{
    if (AIAO_DIR_RX == Dir)
    {
        g_pAIAORxReg[u32ChnId]->RX_IF_ATTRI.bits.rx_multislot_en = bEn;
    }
    else if (AIAO_DIR_TX == Dir)
    {
    }
}

/* tx SPDIF interface */
static HI_VOID AIAO_LOW_SPDIFSetBitDepth(HI_U32 u32ChnId, AIAO_BITDEPTH_E eBitDepth)
{
    switch (eBitDepth)
    {
    case AIAO_BIT_DEPTH_16:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_i2s_precision = 1;
        break;
    case AIAO_BIT_DEPTH_24:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_i2s_precision = 2;
        break;
    default:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_i2s_precision = 1;
        break;
    }
}

static HI_VOID AIAO_LOW_SPDIFSetChNum(HI_U32 u32ChnId, AIAO_I2S_CHNUM_E eChaNum)
{
    switch (eChaNum)
    {
    case AIAO_I2S_CHNUM_1:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_ch_num = 0;
        break;
    case AIAO_I2S_CHNUM_2:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_ch_num = 1;
        break;
    default:
        g_pAIAOTxSpdifReg[u32ChnId]->SPDIFTX_IF_ATTRI.bits.tx_ch_num = 1;
    }
}

HI_VOID AIAO_SPDIF_HAL_SetBitWidth(AIAO_PORT_ID_E enPortID, AIAO_BITDEPTH_E enBitwidth)
{
    HI_U32 tmp;
    HI_U32 maxsamplebits;
    HI_U32 cursamplebits;
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (enBitwidth)
    {
    case AIAO_BIT_DEPTH_16:
        cursamplebits = 0x1;
        maxsamplebits = 0;
        break;
    case AIAO_BIT_DEPTH_24:
        cursamplebits = 0x5;
        maxsamplebits = 1;
        break;
    default:
        cursamplebits = 0x1;
        maxsamplebits = 0;
        HI_WARN_AIAO("Invaild Bitwidth For Spdif %d\n", enBitwidth);
    }

    tmp  = g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS5.u32;
    tmp &= (~0x1);
    tmp |= maxsamplebits;
    tmp &= (~(0x1 << 8));
    tmp |= ((maxsamplebits) << 8);
    tmp &= (0xfffffff1);
    tmp |= (cursamplebits << 1);
    tmp &= (0xfffff1ff);
    tmp |= ((cursamplebits) << 9);
    g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS5.u32 = tmp;
}

HI_VOID AIAO_SPDIF_HAL_SetSamplerate(AIAO_PORT_ID_E enPortID, AIAO_SAMPLE_RATE_E enSampleRate)
{
    HI_U32 playsamplerate;
    HI_U32 orgsamplerate;
    HI_U32 tmp;
    HI_U32 ChnId = PORT2CHID(enPortID);

    switch (enSampleRate)
    {
    case AIAO_SAMPLE_RATE_32K:
        playsamplerate = 0x3;
        orgsamplerate = 0xc;
        break;
    case AIAO_SAMPLE_RATE_44K:
        playsamplerate = 0x0;
        orgsamplerate = 0xf;
        break;
    case AIAO_SAMPLE_RATE_48K:
        playsamplerate = 0x2;
        orgsamplerate = 0xd;
        break;
    case AIAO_SAMPLE_RATE_88K:
        playsamplerate = 0x8;
        orgsamplerate = 0x7;
        break;
    case AIAO_SAMPLE_RATE_96K:
        playsamplerate = 0xa;
        orgsamplerate = 0x5;
        break;
    case AIAO_SAMPLE_RATE_176K:
        playsamplerate = 0xc;
        orgsamplerate = 0xf;
        break;
    case AIAO_SAMPLE_RATE_192K:
        playsamplerate = 0xe;
        orgsamplerate = 0xd;
        break;
    default:
        playsamplerate = 0x2;
        orgsamplerate = 0xd;
    }

    /* config SPDIF IP channel status Reg for samplerate */
    tmp  = g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS4.u32;
    tmp &= 0xf0f0;
    tmp |= playsamplerate;
    tmp |= (playsamplerate << 8);
    g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS4.u32 = tmp;

    tmp  = g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS5.u32;
    tmp &= 0x0f0f;
    tmp |= (orgsamplerate << 4);
    tmp |= (orgsamplerate << 12);
    g_pAIAOSpdiferReg[ChnId]->SPDIF_CH_STATUS5.u32 = tmp;
}

#if    defined(CHIP_TYPE_hi3798mv200)    \
    || defined(CHIP_TYPE_hi3798mv300)    \
    || defined(CHIP_TYPE_hi3796mv200)    \
    || defined(CHIP_TYPE_hi3716mv450)    \
    || defined(CHIP_TYPE_hi3798mv310)    \
    || defined(CHIP_TYPE_hi3716mv430)

#define HDMI_TX_CRG     AIAO_TX_CRG2
#define HDMI_TX_SOURCE  AIAO_TX2
#define HDMI_TX_PORT    AIAO_PORT_TX2
#else

#define HDMI_TX_CRG     AIAO_TX_CRG3
#define HDMI_TX_SOURCE  AIAO_TX3
#define HDMI_TX_PORT    AIAO_PORT_TX3
#endif

HI_S32  HI_UNF_AO_Init(HI_VOID)
{
    AIAO_IfAttr_S stHDMIIfAttr =
    {
        .enCrgMode         = AIAO_CRG_MODE_MASTER,
        .enChNum           = AIAO_I2S_CHNUM_2,
        .enBitDepth        = AIAO_BIT_DEPTH_16,
        .enRiseEdge        = AIAO_MODE_EDGE_RISE,
        .enRate            = AIAO_SAMPLE_RATE_48K,
        .u32FCLK_DIV       = 64,
        .u32BCLK_DIV       = 4,
        .eCrgSource        = HDMI_TX_CRG,
        .u32PcmDelayCycles = 1,
        .enI2SMode         = AIAO_MODE_I2S,
        .enSource          = HDMI_TX_SOURCE,
        .enSD0             = AIAO_I2S_SD0,
        .enSD1             = AIAO_I2S_SD1,
        .enSD2             = AIAO_I2S_SD2,
        .enSD3             = AIAO_I2S_SD3,
        .bMultislot        = HI_FALSE,
    };

    AIAO_HW_Init();

    AIAO_HW_SetIfAttr(HDMI_TX_PORT, &stHDMIIfAttr);

    return HI_SUCCESS;
}

HI_VOID HI_UNF_AO_DeInit(HI_VOID)
{
    AIAO_HW_PowerOff();
    return;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */
