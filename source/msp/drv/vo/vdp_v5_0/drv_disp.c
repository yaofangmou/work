/******************************************************************************

  Copyright (C), 2001-2011, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_disp.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2012/09/20
  Description   :
  History       :
  1.Date        :
  Author        :
  Modification  : Created file

*******************************************************************************/
#include <linux/vmalloc.h>
#include <linux/kernel.h>
#include <linux/version.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/errno.h>
#include <linux/fcntl.h>
#include <linux/mm.h>
#include <linux/miscdevice.h>
#include <linux/proc_fs.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/seq_file.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#include <linux/interrupt.h>
#include <linux/ioport.h>
#include <linux/string.h>

#include "hi_drv_dev.h"
#include "hi_drv_proc.h"
#include "hi_kernel_adapt.h"

#include "hi_drv_module.h"

#include "hi_drv_disp.h"
#include "drv_disp.h"
#include "drv_disp_ioctl.h"
#include "drv_display.h"
#include "drv_disp_debug.h"
#include "drv_disp_ext.h"
#include "drv_disp_osal.h"
#include "drv_disp_bufcore.h"
#include "hi_osal.h"
#include "drv_win_ext.h"
#include "drv_disp_priv.h"
#include "hi_drv_stat.h"

#include "drv_hdmi_ext.h"
#include "drv_window.h"
#include "drv_disp_debug.h"


#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif


DRV_DISP_STATE_S         g_DispModState;
DRV_DISP_GLOBAL_STATE_S  g_DispUserCountState;
DRV_DISP_GLOBAL_STATE_S  g_DispKernelCountState;
DRV_DISP_GLOBAL_STATE_S  g_DispAllCountState;
HI_BOOL g_DispSuspend = HI_FALSE;
HI_S32 g_s32DispAttachCount = 0;
HI_U32 g_bDispPrivateInformation = 0;
extern HI_BOOL g_bVDPIsogenyBypass;

#define DISP_PROC_BASE               0
#define DISP_PROC_EXTREN_XDR_INFO    1
HI_U32 g_pDispProcLevel = DISP_PROC_BASE;

typedef struct tagDISP_PROC_COMMAND
{
    const HI_CHAR *command_name;
    HI_S32 (*PF_DebugFun)(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2);
}DISP_PROC_COMMAND;

static atomic_t        g_DispCount = ATOMIC_INIT(0);
HI_DECLARE_MUTEX(g_DispMutex);

HI_S32 DRV_DISP_ProcessCmd(unsigned int cmd, HI_VOID *arg, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser);
HI_S32 DRV_DISP_Compat_ProcessCmd(unsigned int cmd, HI_VOID *arg, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser);
HI_S32 DISP_ExtOpen(HI_DRV_DISPLAY_E enDisp, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser);
HI_S32 DISP_ExtClose(HI_DRV_DISPLAY_E enDisp, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser);

/* ================================================ */
#define CHECK_ARRAY_RANGE(dst, max) \
        {\
            if (dst >= max) \
            { \
                dst = max - 1; \
            } \
        }

#define DEF_DRV_DISP_PROC_FUNCTION_START_FROM_HERE

#define DISP_HDR_CFG_EOTF_TYPE_BUTT     3
HI_U8 *g_pDispHdrCfgEotfType[DISP_HDR_CFG_EOTF_TYPE_BUTT] = {
    "EotfBT1886",
    "EotfPQ",
    "BUTT"
};

#define DISP_HDR_CFG_CHRM_FORMAT_BUTT        4
HI_U8 *g_pDispHdrCfgChrmFormat[DISP_HDR_CFG_CHRM_FORMAT_BUTT] = {
    "420",
    "422",
    "444",
    "BUTT",
};

HI_U8 *g_pDispXdrSrcFrmType[HI_DRV_VIDEO_FRAME_TYPE_BUTT+1] = {
    "SDR Frame",
    "Dolby Frame",
    "Dolby EL Frame",
    "HDR10 Frame",
    "HLG Frame",
    "SLF Frame",
    "TECHNICOLOR Frame",
    "BUTT"
};


HI_U8 *g_pDispOutputTypeString[HI_DRV_DISP_TYPE_BUTT+1] = {
    "SDR",
    "SDR CERT",
    "AUTO MODE",
    "DOLBYVISION",
    "HDR10",
    "HDR10 CERT",
    "HLG",
    "TECHNICOLOR",
    "FOLLOW_FIRST_FRM",
    "BUTT",
};

HI_U8 *g_pDispXdrEngineTypeString[DRV_XDR_ENGINE_BUTT+1] = {
    "AUTO",
    "SDR",
    "HDR10",
    "HLG",
    "SLF",
    "DOLBY",
    "JTP",
    "BUTT",
};

#define DISP_HDR_CFG_CS_STRING_BUTT      4
HI_U8 *g_pDispHdrCfgCsString[DISP_HDR_CFG_CS_STRING_BUTT] = {
    "SIGNAL_CS_YCBCR",  /* YCbCr */
    "SIGNAL_CS_RGB",    /* RGB */
    "SIGNAL_CS_IPT",    /* IPT */
    "BUTT"
};

#define DISP_HDR_CFG_CLR_STRING_BUTT        5
HI_U8 *g_pDispHdrCfgClrString[DISP_HDR_CFG_CLR_STRING_BUTT] = {
    "KClrYuv",
    "KClrRgb",
    "KClrRgba",
    "KClrIpt",
    "BUTT",
};

#define DISP_YN_STRING_BUTT     3
HI_U8  *g_pDispYNString[DISP_YN_STRING_BUTT] = {
    "N",
    "Y",
    "BUTT"
};

HI_U8 *g_pDispLayerString[HI_DRV_DISP_LAYER_BUTT+1] = {
    "NONE",
    "VIDEO",
    "GFX",
    "BUTT"
};

HI_U8 *g_pDispUserSetCsString[HI_DRV_DISP_COLOR_SPACE_BUTT+1] = {
    "AUTO",
    "BT601",
    "BT709",
    "BT2020",
    "BUTT"
};

//TODO
static const  DRV_DISP_FMT_STRING_S s_aFmtStringMap[HI_DRV_DISP_FMT_BUTT+1] =
{
    {"1080p60", HI_DRV_DISP_FMT_1080P_60},
    {"1080p50", HI_DRV_DISP_FMT_1080P_50},
    {"1080p30", HI_DRV_DISP_FMT_1080P_30},
    {"1080p25", HI_DRV_DISP_FMT_1080P_25},
    {"1080p24", HI_DRV_DISP_FMT_1080P_24},
    {"1080i60", HI_DRV_DISP_FMT_1080i_60},
    {"1080i50", HI_DRV_DISP_FMT_1080i_50},
    {"720p60", HI_DRV_DISP_FMT_720P_60},
    {"720p50", HI_DRV_DISP_FMT_720P_50},
    {"576p50", HI_DRV_DISP_FMT_576P_50},
    {"480p60", HI_DRV_DISP_FMT_480P_60},
    {"pal", HI_DRV_DISP_FMT_PAL},
    {"PAL_B", HI_DRV_DISP_FMT_PAL_B},
    {"PAL_B1", HI_DRV_DISP_FMT_PAL_B1},
    {"PAL_D", HI_DRV_DISP_FMT_PAL_D},
    {"PAL_D1", HI_DRV_DISP_FMT_PAL_D1},
    {"PAL_G", HI_DRV_DISP_FMT_PAL_G},
    {"PAL_H", HI_DRV_DISP_FMT_PAL_H},
    {"PAL_K", HI_DRV_DISP_FMT_PAL_K},
    {"PAL_I", HI_DRV_DISP_FMT_PAL_I},
    {"PAL_M", HI_DRV_DISP_FMT_PAL_N},
    {"PAL_N", HI_DRV_DISP_FMT_PAL_Nc},
    {"PAL_Nc", HI_DRV_DISP_FMT_PAL_M},
    {"PAL_60", HI_DRV_DISP_FMT_PAL_60},
    {"ntsc", HI_DRV_DISP_FMT_NTSC},
    {"NTSC_J", HI_DRV_DISP_FMT_NTSC_J},
    {"NTSC_443", HI_DRV_DISP_FMT_NTSC_443},
    {"SECAM_SIN", HI_DRV_DISP_FMT_SECAM_SIN},
    {"SECAM_COS", HI_DRV_DISP_FMT_SECAM_COS},
    {"SECAM_L", HI_DRV_DISP_FMT_SECAM_L},
    {"SECAM_B", HI_DRV_DISP_FMT_SECAM_B},
    {"SECAM_G", HI_DRV_DISP_FMT_SECAM_G},
    {"SECAM_D", HI_DRV_DISP_FMT_SECAM_D},
    {"SECAM_K", HI_DRV_DISP_FMT_SECAM_K},
    {"SECAM_H", HI_DRV_DISP_FMT_SECAM_H},
    {"1440x576i", HI_DRV_DISP_FMT_1440x576i_50},
    {"1440x480i", HI_DRV_DISP_FMT_1440x480i_60},
    {"1080p24fp", HI_DRV_DISP_FMT_1080P_24_FP},
    {"720p60fp", HI_DRV_DISP_FMT_720P_60_FP},
    {"720p50fp", HI_DRV_DISP_FMT_720P_50_FP},
    {"640x480", HI_DRV_DISP_FMT_861D_640X480_60},
    {"800x600", HI_DRV_DISP_FMT_VESA_800X600_60},
    {"1024x768", HI_DRV_DISP_FMT_VESA_1024X768_60},
    {"vesa", HI_DRV_DISP_FMT_VESA_1280X720_60},
    {"1280x800", HI_DRV_DISP_FMT_VESA_1280X800_60},
    {"1280x1024", HI_DRV_DISP_FMT_VESA_1280X1024_60},
    {"1360x768", HI_DRV_DISP_FMT_VESA_1360X768_60},
    {"1366x768", HI_DRV_DISP_FMT_VESA_1366X768_60},
    {"1400x1050", HI_DRV_DISP_FMT_VESA_1400X1050_60},
    {"1440x900", HI_DRV_DISP_FMT_VESA_1440X900_60},
    {"1440x900_RB", HI_DRV_DISP_FMT_VESA_1440X900_60_RB},
    {"1600x900_RB", HI_DRV_DISP_FMT_VESA_1600X900_60_RB},
    {"1600x1200", HI_DRV_DISP_FMT_VESA_1600X1200_60},
    {"1680x1050", HI_DRV_DISP_FMT_VESA_1680X1050_60},
    {"1680x1050_RB", HI_DRV_DISP_FMT_VESA_1680X1050_60_RB},
    {"1920x1080", HI_DRV_DISP_FMT_VESA_1920X1080_60},
    {"1920x1200", HI_DRV_DISP_FMT_VESA_1920X1200_60},
    {"1920x1440", HI_DRV_DISP_FMT_VESA_1920X1440_60},
    {"2048x1152", HI_DRV_DISP_FMT_VESA_2048X1152_60},
    {"2560x1440_RB", HI_DRV_DISP_FMT_VESA_2560X1440_60_RB},
    {"2560x1600_RB", HI_DRV_DISP_FMT_VESA_2560X1600_60_RB},
    {"3840*2160_24", HI_DRV_DISP_FMT_3840X2160_24},
    {"3840*2160_25", HI_DRV_DISP_FMT_3840X2160_25},
    {"3840*2160_30", HI_DRV_DISP_FMT_3840X2160_30},
    {"3840*2160_50", HI_DRV_DISP_FMT_3840X2160_50},
    {"3840*2160_60", HI_DRV_DISP_FMT_3840X2160_60},
    {"4096*2160_24", HI_DRV_DISP_FMT_4096X2160_24},
    {"4096x2160_25", HI_DRV_DISP_FMT_4096X2160_25},
    {"4096x2160_30", HI_DRV_DISP_FMT_4096X2160_30},
    {"4096x2160_50", HI_DRV_DISP_FMT_4096X2160_50},
    {"4096x2160_60", HI_DRV_DISP_FMT_4096X2160_60},
    {"3840*2160_23_976", HI_DRV_DISP_FMT_3840X2160_23_976},
    {"3840*2160_29_97", HI_DRV_DISP_FMT_3840X2160_29_97},
    {"1280*720_59_94", HI_DRV_DISP_FMT_720P_59_94},
    {"1920*1080_59_94", HI_DRV_DISP_FMT_1080P_59_94},
    {"1920*1080_29_97", HI_DRV_DISP_FMT_1080P_29_97},
    {"1920*1080_23_976", HI_DRV_DISP_FMT_1080P_23_976},
    {"1920*1080i_59_94", HI_DRV_DISP_FMT_1080i_59_94},
    {"CustomerTiming", HI_DRV_DISP_FMT_CUSTOM},
    {"BUTT", HI_DRV_DISP_FMT_BUTT}
};

HI_U8 *g_pVDPDispModeString[DISP_STEREO_BUTT+1] = {
    "2D",
    "FPK",
    "SBS_HALF",
    "TAB",
    "FILED_ALTE",
    "LINE_ALTE",
    "SBS_FULL",
    "L_DEPTH",
    "L_DEPTH_G_DEPTH",
    "BUTT",
};


HI_U8 *g_pVDPColorSpaceString[HI_DRV_CS_BUTT+1] = {
    "Unknown",
    "Default",
    "BT601_YUV_LIMITED",
    "BT601_YUV_FULL",
    "BT601_RGB_LIMITED",
    "BT601_RGB_FULL",
    "NTSC1953",
    "BT470_M",
    "BT470_BG",
    "BT709_YUV_LIMITED",
    "BT709_YUV_FULL",
    "BT709_RGB_LIMITED",
    "BT709_RGB_FULL",
    "BT2020_YUV_LIMITED",
    "BT2020_YUV_FULL",
    "BT2020_RGB_LIMITED",
    "BT2020_RGB_FULL",
    "REC709",
    "SMPT170M",
    "SMPT240M",
    "BT878",
    "XVYCC",
    "JPEG",
    "BUTT",
};


HI_U8 *g_pVDPCInterfaceString[HI_DRV_DISP_INTF_ID_MAX+1] = {
    "YPbPr0",
      "RGB0",
    "S_VIDEO0",
    "CVBS0",
    "VGA0",
    "HDMI0",
    "HDMI1",
    "HDMI2",
    "BT656_0",
    "BT656_1",
    "BT656_2",
    "BT1120_0",
    "BT1120_1",
    "BT1120_2",
    "LCD_0",
    "LCD_1",
    "LCD_2",
    "BUTT",
};

#define DISPLAY_INVALID_ID 0xFFFFFFFFul
static HI_U32 s_DispProcId[HI_DRV_DISPLAY_BUTT]={DISPLAY_INVALID_ID};

static HI_S32 DISP_ProcRead(struct seq_file *p, HI_VOID *v);
static HI_S32 DISP_ProcWrite(struct file * file,
    const char __user * buf, size_t count, loff_t *ppos);

static HI_S32 DISPProcessCmdAttach(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdDetach(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdOpen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdClose(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetEnable(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetEnable(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdAddIntf(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdDelIntf(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetFormat(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetFormat(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetREFirst(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetVirtScreen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetVirtScreen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetScreenOFFSet(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetScreenOFFSet(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetZorder(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetOrder(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetDevRatio(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetDevRatio(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetBGC(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetBGC(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdCreateVBIChannel(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdDestroyVBIChannel(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSendVBI(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetWSS(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetMCRVSN(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetMCRVSN(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetCGMS(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);

static HI_S32 DISPProcessCmdSuspend(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdResume(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetAlpha(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetAlpha(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdSetSinkCapability(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdGetOutputStatus(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
static HI_S32 DISPProcessCmdNoSupprot(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);

typedef struct DISPProcessCmdFunc
{
    unsigned int cmd;
    HI_S32(*pDISP_ProcessCmdFunc)(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser);
}stDISPProcessCmdFunc;

static const stDISPProcessCmdFunc s_aDISPCmdFuncTab[] =
{
    {CMD_DISP_ATTACH, DISPProcessCmdAttach},
    {CMD_DISP_DETACH, DISPProcessCmdDetach},
    {CMD_DISP_OPEN, DISPProcessCmdOpen},
    {CMD_DISP_CLOSE, DISPProcessCmdClose},
    {CMD_DISP_SET_ENABLE, DISPProcessCmdSetEnable},
    {CMD_DISP_GET_ENABLE, DISPProcessCmdGetEnable},
    {CMD_DISP_ADD_INTF, DISPProcessCmdAddIntf},
    {CMD_DISP_DEL_INTF, DISPProcessCmdDelIntf},
    {CMD_DISP_SET_FORMAT, DISPProcessCmdSetFormat},
    {CMD_DISP_GET_FORMAT, DISPProcessCmdGetFormat},
    {CMD_DISP_SET_R_E_FIRST, DISPProcessCmdSetREFirst},
    {CMD_DISP_SET_VIRTSCREEN, DISPProcessCmdSetVirtScreen},
    {CMD_DISP_GET_VIRTSCREEN, DISPProcessCmdGetVirtScreen},
    {CMD_DISP_SET_SCREENOFFSET, DISPProcessCmdSetScreenOFFSet},
    {CMD_DISP_GET_SCREENOFFSET, DISPProcessCmdGetScreenOFFSet},
    {CMD_DISP_SET_TIMING, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_TIMING, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_ZORDER, DISPProcessCmdSetZorder},
    {CMD_DISP_GET_ORDER, DISPProcessCmdGetOrder},
    {CMD_DISP_SET_DEV_RATIO, DISPProcessCmdSetDevRatio},
    {CMD_DISP_GET_DEV_RATIO, DISPProcessCmdGetDevRatio},
    {CMD_DISP_SET_BGC, DISPProcessCmdSetBGC},
    {CMD_DISP_GET_BGC, DISPProcessCmdGetBGC},
    {CMD_DISP_CREATE_VBI_CHANNEL, DISPProcessCmdCreateVBIChannel},
    {CMD_DISP_DESTROY_VBI_CHANNEL, DISPProcessCmdDestroyVBIChannel},
    {CMD_DISP_SEND_VBI, DISPProcessCmdSendVBI},
    {CMD_DISP_SET_WSS, DISPProcessCmdSetWSS},
    {CMD_DISP_SET_MCRVSN, DISPProcessCmdSetMCRVSN},
    {CMD_DISP_GET_MCRVSN, DISPProcessCmdGetMCRVSN},
    {CMD_DISP_SET_CGMS, DISPProcessCmdSetCGMS},
    {CMD_DISP_CREATE_CAST, DISPProcessCmdNoSupprot},
    {CMD_DISP_DESTROY_CAST, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_CAST_ENABLE, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_CAST_ENABLE, DISPProcessCmdNoSupprot},
    {CMD_DISP_ACQUIRE_CAST_FRAME, DISPProcessCmdNoSupprot},
    {CMD_DISP_RELEASE_CAST_FRAME, DISPProcessCmdNoSupprot},
    {CMD_DISP_ACQUIRE_SNAPSHOT, DISPProcessCmdNoSupprot},
    {CMD_DISP_RELEASE_SNAPSHOT, DISPProcessCmdNoSupprot},
    {CMD_DISP_EXT_ATTACH, DISPProcessCmdNoSupprot},
    {CMD_DISP_EXT_DEATTACH, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_CASTATTR, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_CASTATTR, DISPProcessCmdNoSupprot},
    {CMD_DISP_SUSPEND, DISPProcessCmdSuspend},
    {CMD_DISP_RESUME, DISPProcessCmdResume},
    {CMD_DISP_FORCESET_DAC_ENABLE, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_OUTPUT_TYPE, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_OUTPUT_TYPE, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_OUTPUT_COLOR_SPACE, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_OUTPUT_COLOR_SPACE, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_XDR_ENGINE, DISPProcessCmdNoSupprot},
    {CMD_DISP_GET_XDR_ENGINE, DISPProcessCmdNoSupprot},
    {CMD_DISP_SET_ALPHA, DISPProcessCmdSetAlpha},
    {CMD_DISP_GET_ALPHA, DISPProcessCmdGetAlpha},
    {CMD_DISP_SET_SINK_CAPABILITY, DISPProcessCmdSetSinkCapability},
    {CMD_DISP_GET_OUTPUT_STATUS, DISPProcessCmdGetOutputStatus},
};

static HI_S32 DRV_DISP_ProcInit(HI_VOID)
{
    HI_U32 u;

    for(u=0; u<(HI_U32)HI_DRV_DISPLAY_BUTT; u++)
    {
        s_DispProcId[u] = DISPLAY_INVALID_ID;
    }

    return HI_SUCCESS;
}

static HI_VOID DRV_DISP_ProcDeInit(HI_VOID)
{
    HI_CHAR ProcName[12];
    HI_U32 u;

    for(u=0; u<(HI_U32)HI_DRV_DISPLAY_BUTT; u++)
    {
        if (s_DispProcId[u] != DISPLAY_INVALID_ID)
        {
            HI_OSAL_Snprintf(ProcName, 12, "%s%d", HI_MOD_DISP, u);
            HI_DRV_PROC_RemoveModule(ProcName);
        }
    }

    return;
}

static HI_S32 DRV_DISP_ProcAdd(HI_DRV_DISPLAY_E enDisp)
{
    DRV_PROC_ITEM_S  *pProcItem;
    HI_CHAR           ProcName[12];

    /* register HD-display PROC*/
    HI_OSAL_Snprintf(ProcName, 12, "%s%d", HI_MOD_DISP, enDisp);
    pProcItem = HI_DRV_PROC_AddModule(ProcName, HI_NULL, HI_NULL);
    if (!pProcItem)
    {
        HI_FATAL_DISP("add %s proc failed.\n", ProcName);
        DISP_Close(enDisp);

        return HI_ERR_DISP_CREATE_ERR;
    }

    pProcItem->read  = DISP_ProcRead;
    pProcItem->write = DISP_ProcWrite;
    pProcItem->data  = (HI_VOID *)enDisp;

    s_DispProcId[enDisp] = enDisp;

    return HI_SUCCESS;
}

static HI_S32 DRV_DISP_ProcDel(HI_DRV_DISPLAY_E enDisp)
{
    HI_CHAR ProcName[12];

    /* register HD-display PROC*/
    HI_OSAL_Snprintf(ProcName, 12, "%s%d", HI_MOD_DISP, enDisp);
    HI_DRV_PROC_RemoveModule(ProcName);

    s_DispProcId[enDisp] = DISPLAY_INVALID_ID;
    return HI_SUCCESS;
}

#ifdef HI_PROC_SUPPORT
HI_CHAR *g_pVDPDispName[HI_DRV_DISPLAY_BUTT+1] = {"display0", "display1","display2","invalid  display"};
HI_CHAR *g_pVDPDispState[2] = {"Close", "Open"};
HI_CHAR *g_pVDPDispState_1[2] = {"Disable", "Enable"};
HI_CHAR *g_pVDPDispARMode[2] = {"Auto", "Custmer Setting"};
HI_CHAR *g_pVDPDispCastAllocMode[2] = {"DispAllocate", "UserAllocate"};
HI_U32  g_pVDPDispCastBufferState[5] = {1, 4, 2, 3, 4};
static DISP_PROC_INFO_S  s_DispAttr;


#endif

extern HI_S32 WinGetProcInfo(HI_HANDLE hWin, WIN_PROC_INFO_S *pstInfo);
extern HI_VOID Win_GetProcBufStatus(struct seq_file *p, WIN_PROC_INFO_S *pstProcInfo);
HI_HANDLE g_hWin = 0;
HI_VOID Debug_Proc(struct seq_file *p)
{
    WIN_PROC_INFO_S  *pstProcInfo;

    pstProcInfo = (WIN_PROC_INFO_S *)DISP_MALLOC(sizeof(WIN_PROC_INFO_S));
    if (!pstProcInfo)
    {
        PROC_PRINT(p, "-------- Malloc Proc Buffer Failed!--------\n");
        return;
    }

    WinGetProcInfo(g_hWin, pstProcInfo);
    Win_GetProcBufStatus(p, pstProcInfo);

    DISP_FREE(pstProcInfo);
    return;
}

static HI_S32 DISP_ProcRead(struct seq_file *p, HI_VOID *v)
{
#ifdef HI_PROC_SUPPORT
    DRV_PROC_ITEM_S  *pProcItem;
    HI_DRV_DISPLAY_E enDisp;
    HI_S32 Ret, i;

    pProcItem = p->private;
    enDisp = (HI_DRV_DISPLAY_E)pProcItem->data;

    /* Disp PROC*/
    Ret = DISP_GetProcInto(enDisp, &s_DispAttr);
    if (Ret)
    {
        PROC_PRINT(p,"---------Get Hisilicon DISP %d Out Info Failed!---------\n", enDisp);
        return HI_SUCCESS;
    }

    PROC_PRINT(p,"---------Hisilicon DISP %d State---------201805022101\n", enDisp);

    PROC_PRINT(p, "%-20s:%s\n", "State",g_pVDPDispState[s_DispAttr.bEnable]);
    PROC_PRINT(p, "%-20s:%s/%s\n", "Formt/DispMode", s_aFmtStringMap[s_DispAttr.eFmt].pfmtString, g_pVDPDispModeString[s_DispAttr.eDispMode]);

    if (HI_DRV_DISP_FMT_CUSTOM == s_DispAttr.eFmt)
    {
        PROC_PRINT(p, "%-20s:\n", "------Custom Timing Para List------");
        PROC_PRINT(p, "       %-20s: %d/%d/%d\n","HACT/VACT/VFreq" ,s_DispAttr.stTiming.u32HACT,s_DispAttr.stTiming.u32VACT,s_DispAttr.stTiming.u32VertFreq);
        PROC_PRINT(p, "       %-20s: %d/%d/%d\n","HBB/HFB/HPW " ,s_DispAttr.stTiming.u32HBB,s_DispAttr.stTiming.u32HFB,s_DispAttr.stTiming.u32HPW);
        PROC_PRINT(p, "       %-20s: %d/%d/%d\n","VBB/VFB/VPW" ,s_DispAttr.stTiming.u32VBB,s_DispAttr.stTiming.u32VFB,s_DispAttr.stTiming.u32VPW);
        PROC_PRINT(p, "       %-20s: %d/%d/%d/%d\n","Inter/IDV/IHS/IVS" ,s_DispAttr.stTiming.bInterlace,s_DispAttr.stTiming.bIDV,s_DispAttr.stTiming.bIHS,s_DispAttr.stTiming.bIVS);
        PROC_PRINT(p, "       %-20s: %d/%d/%d\n","PixFreq/ARW/ARH",s_DispAttr.stTiming.u32PixFreq, s_DispAttr.stTiming.u32AspectRatioW,s_DispAttr.stTiming.u32AspectRatioH);
        PROC_PRINT(p, "       %-20s: 0x%x/0x%x\n","ClkPara0/ClkPara1/" ,s_DispAttr.stTiming.u32ClkPara0,s_DispAttr.stTiming.u32ClkPara1);
    }
    PROC_PRINT(p, "%-20s:%s\n", "RightEyeFirst",g_pVDPDispState_1[s_DispAttr.bRightEyeFirst]);
    PROC_PRINT(p, "%-20s:%d/%d\n", "VirtualScreen",s_DispAttr.stVirtaulScreen.s32Width,s_DispAttr.stVirtaulScreen.s32Height);
    PROC_PRINT(p, "%-20s:%d/%d/%d/%d\n", "Offset(L/T/R/B)",s_DispAttr.stOffsetInfo.u32Left,
                                                  s_DispAttr.stOffsetInfo.u32Top,
                                                  s_DispAttr.stOffsetInfo.u32Right,
                                                  s_DispAttr.stOffsetInfo.u32Bottom);

    PROC_PRINT(p, "%-20s:%s\n", "AspectRatioMode",g_pVDPDispARMode[(HI_U32)s_DispAttr.bCustAspectRatio]);
    PROC_PRINT(p, "%-20s:%d:%d\n", "AspectRatio",s_DispAttr.u32AR_w,s_DispAttr.u32AR_h);

    PROC_PRINT(p, "%-20s:%s\n", "ColorSpace",g_pVDPColorSpaceString[(HI_U32)s_DispAttr.eDispColorSpace]);
    PROC_PRINT(p, "%-20s:%d\n", "Alpha",s_DispAttr.u32Alpha);
    PROC_PRINT(p, "%-20s:0x%x/0x%x/0x%x\n", "Background (R/G/B)",s_DispAttr.stBgColor.u8Red,
                                                     s_DispAttr.stBgColor.u8Green,
                                                     s_DispAttr.stBgColor.u8Blue);
    PROC_PRINT(p, "%-20s:%s->%s\n", "Zorder(Bot->Top)",g_pDispLayerString[s_DispAttr.enLayer[0]],
                                                        g_pDispLayerString[s_DispAttr.enLayer[1]]);

    if (s_DispAttr.bMaster == HI_TRUE)
        PROC_PRINT(p, "%-20s:%s\n", "AttachRole","source");

    if (s_DispAttr.bSlave == HI_TRUE)
        PROC_PRINT(p, "%-20s:%s\n", "AttachRole","destination");

    if ((s_DispAttr.bMaster != HI_TRUE) && (s_DispAttr.bSlave != HI_TRUE))
        PROC_PRINT(p, "%-20s:%s\n", "AttachRole","single running.");

    PROC_PRINT(p, "%-20s:%s\n", "AttachDisp",g_pVDPDispName[s_DispAttr.enAttachedDisp]);

    PROC_PRINT(p, "%-20s:", "Interface");
    for(i=0; i<s_DispAttr.u32IntfNumber;i++)
    {
        PROC_PRINT(p, "%s ", g_pVDPCInterfaceString[(HI_S32)s_DispAttr.stIntf[i].eID]);

        if (s_DispAttr.stIntf[i].eID <= HI_DRV_DISP_INTF_VGA0)
            PROC_PRINT(p, "(%3d/%3d/%3d) ",
                s_DispAttr.stIntf[i].u8VDAC_Pr_R,
                s_DispAttr.stIntf[i].u8VDAC_Y_G,
                s_DispAttr.stIntf[i].u8VDAC_Pb_B);
    }
    PROC_PRINT(p, "\n");

    PROC_PRINT(p, "%-20s:%s/%s\n", "Cvbs/Ypbpr BootClose", g_pVDPDispState_1[s_DispAttr.bBootArgsShutdownCvbs], g_pVDPDispState_1[s_DispAttr.bBootArgsShutdownYpbpr]);

    PROC_PRINT(p, "%-20s:%d\n", "InitCount", atomic_read(&g_DispCount));
    PROC_PRINT(p, "%-20s:%d/%d\n", "OpenCnt[User/Kernel]", g_DispUserCountState.DispOpenNum[enDisp], g_DispKernelCountState.DispOpenNum[enDisp]);
    PROC_PRINT(p, "%-20s:%d\n", "LowbandCount", s_DispAttr.u32Underflow);
    PROC_PRINT(p, "%-20s:%d\n", "VfRerrCount", s_DispAttr.u32VfRerrCnt);


    if (HI_DRV_DISPLAY_1 == enDisp)
    {
        HI_U32 u32Index = 0, u32WinNum = 0;
        HI_BOOL bValidFrm = HI_FALSE;
        WIN_INFO_S *pstWinInfo = HI_NULL;
        u32WinNum = s_DispAttr.stXdrProcInfo.u32HdWinNum;
        PROC_PRINT(p, "%-20s:%s\n", "UserSetColorSpace", g_pDispUserSetCsString[s_DispAttr.enUserSetColorSpace]);
        PROC_PRINT(p, "%-20s:%s\n", "UserSetDispOutType", g_pDispOutputTypeString[s_DispAttr.enDispOutput]);

        PROC_PRINT(p, "%-20s:%s\n", "ActualOutColorSpace", g_pVDPColorSpaceString[s_DispAttr.stXdrProcInfo.stXdrPlayInfo.enColorSpace]);
        PROC_PRINT(p, "%-20s:%s\n", "ActualDispOutType", g_pDispOutputTypeString[s_DispAttr.stXdrProcInfo.stXdrPlayInfo.enOutType]);

        PROC_PRINT(p, "-------------------Set Sink Info--------------------\n");
        CHECK_ARRAY_RANGE(s_DispAttr.stSinkCap.bDolbySupport, DISP_YN_STRING_BUTT);
        PROC_PRINT(p, "%-20s:%s\n", "bDolbySupport", g_pDispYNString[s_DispAttr.stSinkCap.bDolbySupport]);
        CHECK_ARRAY_RANGE(s_DispAttr.stSinkCap.bHdr10Support, DISP_YN_STRING_BUTT);
        PROC_PRINT(p, "%-20s:%s\n", "bHdr10Support", g_pDispYNString[s_DispAttr.stSinkCap.bHdr10Support]);
        CHECK_ARRAY_RANGE(s_DispAttr.stSinkCap.bHlgSupport, DISP_YN_STRING_BUTT);
        PROC_PRINT(p, "%-20s:%s\n", "bHlgSupport", g_pDispYNString[s_DispAttr.stSinkCap.bHlgSupport]);
        CHECK_ARRAY_RANGE(s_DispAttr.stSinkCap.bBT2020Support, DISP_YN_STRING_BUTT);
        PROC_PRINT(p, "%-20s:%s\n", "bBT2020Support", g_pDispYNString[s_DispAttr.stSinkCap.bBT2020Support]);

        if (g_pDispProcLevel >= DISP_PROC_EXTREN_XDR_INFO)
        {
            PROC_PRINT(p, "\n%-20s:%s\n", "XdrEngine", g_pDispXdrEngineTypeString[s_DispAttr.enUserSetXdrEngine]);

            #ifdef HI_GFX_SDR2HDR_WEAK_PARA
            PROC_PRINT(p, "%-20s:%s\n", "GFX Color Para", "Weak");
            #else
            PROC_PRINT(p, "%-20s:%s\n", "GFX Color Para", "Strong");
            #endif

            for (u32Index = 0; u32Index < WINDOW_MAX_NUMBER; u32Index++)
            {
                pstWinInfo = &s_DispAttr.stXdrProcInfo.stWinInfo[u32Index];
                bValidFrm  = (HI_NULL != pstWinInfo->pCurrentFrame) ? HI_TRUE : HI_FALSE;
                if (WIN_SHARE_HandleValid(pstWinInfo->hWinHandle))
                {
                    //---------------------------------xdr proc info------------------------------
                    PROC_PRINT(p, "-------------------XDR Info-------------------------\n");
                    PROC_PRINT(p, "%-20s:%#x\n", "hWinHandle", pstWinInfo->hWinHandle);
                    PROC_PRINT(p, "%-20s:%d\n", "LayerId", pstWinInfo->u32LayerId);
                    PROC_PRINT(p, "%-20s:%d  %d\n", "OutRect", pstWinInfo->stDisp.s32Width, pstWinInfo->stDisp.s32Height);
                    CHECK_ARRAY_RANGE(pstWinInfo->bRegionEnable, DISP_YN_STRING_BUTT);
                    PROC_PRINT(p, "%-20s:%s\n", "bRegionEn", g_pDispYNString[pstWinInfo->bRegionEnable]);
                    CHECK_ARRAY_RANGE(bValidFrm, DISP_YN_STRING_BUTT);
                    PROC_PRINT(p, "%-20s:%s\n", "bValidFrm", g_pDispYNString[bValidFrm]);
                    CHECK_ARRAY_RANGE(pstWinInfo->bCloseHdr, DISP_YN_STRING_BUTT);
                    PROC_PRINT(p, "%-20s:%s\n", "bCloseHdr", g_pDispYNString[pstWinInfo->bCloseHdr]);
                    PROC_PRINT(p, "%-20s:(%d)\n", "bCloseY2R", pstWinInfo->bCloseY2R);
                    if (bValidFrm)
                    {
                        PROC_PRINT(p, "%-20s:%s\n", "InCs", g_pVDPColorSpaceString[pstWinInfo->enInCsc]);
                        PROC_PRINT(p, "%-20s:%s\n", "SrcType", g_pDispXdrSrcFrmType[pstWinInfo->pCurrentFrame->enSrcFrameType]);
                    }
                    PROC_PRINT(p, "%-20s:%s\n", "OutCs", g_pVDPColorSpaceString[pstWinInfo->enOutCsc]);
                    PROC_PRINT(p, "%-20s:%s\n", "OutType", g_pDispOutputTypeString[pstWinInfo->enOutType]);
                }
            }
        }

    }

    Debug_Proc(p);

#endif

    return HI_SUCCESS;
}


#define ARG_LENGTH_MAX 256

static HI_S32 DispProcParsePara(HI_CHAR *pProcPara,HI_CHAR **ppArg1,HI_CHAR **ppArg2)
{
    HI_CHAR *pChar = HI_NULL;

    if (strlen(pProcPara) == 0)
    {
        /* not fined arg1 and arg2, return failed */
        *ppArg1  = HI_NULL;
        *ppArg2  = HI_NULL;
        return HI_FAILURE;
    }

    /* find arg1 */
    pChar = pProcPara;
    while( (*pChar == ' ') )
    {
        pChar++;

        if ((pChar - pProcPara) > ARG_LENGTH_MAX)
        {
            return HI_FAILURE;
        }

    }

    if (*pChar != '\0')
    {
        *ppArg1 = pChar;
    }
    else
    {
        *ppArg1  = HI_NULL;

        return HI_FAILURE;
    }

    /* ignor arg1 */
    while( (*pChar != ' ') && (*pChar != '\0') )
    {
        pChar++;

        if ((pChar - pProcPara) > ARG_LENGTH_MAX)
        {
            return HI_FAILURE;
        }
    }

    /* Not find arg2, return */
    if (*pChar == '\0')
    {
        *ppArg2 = HI_NULL;

        return HI_SUCCESS;
    }

    /* add '\0' for arg1 */
    *pChar = '\0';

    /* start to find arg2 */
    pChar = pChar + 1;
    while( (*pChar == ' ') )
    {
        pChar++;

        if ((pChar - pProcPara) > ARG_LENGTH_MAX)
        {
            return HI_FAILURE;
        }
    }

    if (*pChar != '\0')
    {
        *ppArg2 = pChar;
    }
    else
    {
        *ppArg2 = HI_NULL;
    }

    return HI_SUCCESS;
}

HI_DRV_DISP_FMT_E DispGetFmtbyString(HI_CHAR* pFmtString)
{
    HI_S32 index = 0;
    HI_DRV_DISP_FMT_E fmt = HI_DRV_DISP_FMT_BUTT;

    for (index = 0; index < sizeof(s_aFmtStringMap) / sizeof(DRV_DISP_FMT_STRING_S); index++)
    {
        if (0 == HI_OSAL_Strncmp(pFmtString, s_aFmtStringMap[index].pfmtString, strlen(s_aFmtStringMap[index].pfmtString)))
        {
            fmt = s_aFmtStringMap[index].enFmt;
            break;
        }
    }

    return fmt;
}

HI_VOID DISP_ProcPrintHelp(HI_VOID)
{
/*
    printk("Please input these commands:\n"
           "echo enfromat = 0(1080P60)|1(1080P50)|2(1080p30)|3(1080p25)|4(1080p24)|\n"
                "5(1080i60)|6(1080i50)|7(720p60)|8(720p50)|9(576p50)|10(480p60)\n "
                "11(pal)|12(pal_n)|13(pal_nc)|14(ntsc)|15(ntsc_j)|16(ntsc_pal_m)\n "
                "17(secam_sin)|18(secam_cos) > /proc/msp/dispX\n"
           "echo bright = 0~100 > /proc/msp/dispxxx\n"
           "echo contrast = 0~100 > /proc/msp/dispxxx\n"
           "echo saturation = 0~100 > /proc/msp/dispxxx\n");
*/
    HI_DRV_PROC_EchoHelper("echo help                            > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo fmt 1080i50/720p50/pal/ntsc/... > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo 3d fp/sbs_hf/tab                > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo rf on/off                       > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo left     X                      > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo top      X                      > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo right    X                      > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo bottom   X                      > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo video up/down                   > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo reset                           > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo cat AbsolutePath                > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo bkg red/green/blue/black/white  > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo sinkcap  0~7  (dolby hdr10 hlg) > /proc/msp/dispX\n");
    HI_DRV_PROC_EchoHelper("echo bt2020  on/off/                 > /proc/msp/dispX\n");
}

HI_S32 DispProcHelp(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    DISP_ProcPrintHelp();
    return HI_SUCCESS;
}

HI_S32 DispProcSetFormat(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_FMT_E fmt;

    fmt = DispGetFmtbyString(pArg2);

    if (HI_DRV_DISP_FMT_BUTT == fmt)
    {
        return HI_ERR_DISP_NOT_SUPPORT_FMT;
    }
    else if ( (fmt >= HI_DRV_DISP_FMT_1080P_24_FP) && (fmt <= HI_DRV_DISP_FMT_720P_50_FP))
    {
        nRet = DISP_SetFormat(enDisp, HI_DRV_DISP_STEREO_FRAME_PACKING, fmt);
    }
    else
    {
        HI_DRV_DISP_FMT_E fmtold;
        HI_DRV_DISP_STEREO_MODE_E enStereoold;

        nRet = DISP_GetFormat(enDisp, &enStereoold, &fmtold);
        if (nRet == HI_SUCCESS)
        {
            nRet = DISP_SetFormat(enDisp, enStereoold, fmt);
        }
    }

    return nRet;
}

HI_S32 DispProcSet3DMode(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_FMT_E fmtold;
    HI_DRV_DISP_STEREO_MODE_E enStereoold;

    nRet = DISP_GetFormat(enDisp, &enStereoold, &fmtold);
    if (nRet != HI_SUCCESS)
    {
        return nRet;
    }

    if (0 == HI_OSAL_Strncmp(pArg2, "2d", strlen("2d")))
    {
        nRet = DISP_SetFormat(enDisp, HI_DRV_DISP_STEREO_NONE, fmtold);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "sbs_hf", strlen("sbs_hf")))
    {
        nRet = DISP_SetFormat(enDisp, HI_DRV_DISP_STEREO_SBS_HALF, fmtold);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "tab", strlen("tab")))
    {
        nRet = DISP_SetFormat(enDisp, HI_DRV_DISP_STEREO_TAB, fmtold);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetRightEyeFirst(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    if (0 == HI_OSAL_Strncmp(pArg2, "on", strlen("on")))
    {
        nRet = DISP_SetRightEyeFirst(enDisp, HI_TRUE);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("off")))
    {
        nRet = DISP_SetRightEyeFirst(enDisp, HI_FALSE);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetLeft(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_OFFSET_S screenoffset;

    nRet = DISP_GetScreenOffset(enDisp, &screenoffset);
    if (nRet == HI_SUCCESS)
    {
        screenoffset.u32Left = (HI_U32)simple_strtol(pArg2, NULL, 10);
        nRet = DISP_SetScreenOffset(enDisp, &screenoffset);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetRight(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_OFFSET_S screenoffset;

    nRet = DISP_GetScreenOffset(enDisp, &screenoffset);
    if (nRet == HI_SUCCESS)
    {
        screenoffset.u32Right = (HI_U32)simple_strtol(pArg2, NULL, 10);
        nRet = DISP_SetScreenOffset(enDisp, &screenoffset);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetBottom(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_OFFSET_S screenoffset;

    nRet = DISP_GetScreenOffset(enDisp, &screenoffset);
    if (nRet == HI_SUCCESS)
    {
        screenoffset.u32Bottom = (HI_U32)simple_strtol(pArg2, NULL, 10);
        nRet = DISP_SetScreenOffset(enDisp, &screenoffset);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetTop(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_OFFSET_S screenoffset;

    nRet = DISP_GetScreenOffset(enDisp, &screenoffset);
    if (nRet == HI_SUCCESS)
    {
        screenoffset.u32Top = (HI_U32)simple_strtol(pArg2, NULL, 10);
        nRet = DISP_SetScreenOffset(enDisp, &screenoffset);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcSetZorder(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    if (0 == HI_OSAL_Strncmp(pArg2, "up", strlen("up")))
    {
        nRet = DISP_SetLayerZorder(enDisp, HI_DRV_DISP_LAYER_VIDEO, HI_DRV_DISP_ZORDER_MOVEUP);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "down", strlen("down")))
    {
        nRet = DISP_SetLayerZorder(enDisp, HI_DRV_DISP_LAYER_VIDEO, HI_DRV_DISP_ZORDER_MOVEDOWN);
    }
    else
    {
        nRet = HI_FAILURE;
    }

    return nRet;
}

HI_S32 DispProcReset(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_ERR_DISP("Not support set rotation now\n");
    return HI_ERR_DISP_NOT_SUPPORT;
}


HI_S32 DispProcSetRdDoor(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    if (0 == HI_OSAL_Strncmp(pArg2, "start", strlen("start")))
    {
        g_bDispPrivateInformation = HI_TRUE;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "stop", strlen("stop")))
    {
        g_bDispPrivateInformation = HI_FALSE;
    }

    return HI_SUCCESS;
}

HI_S32 DispProcFpgaTestStart(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
#if 0
    fpga_test_disp_Init(pArg2);
    fpga_test_vo_createwin();
    fpga_openfile_queue_frame(720,576,768);
#endif

    return HI_SUCCESS;
}

HI_S32 DispProcFpgaTestStop(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
#if 0
    fpga_test_vo_destroywin();
    fpga_test_disp_deInit();
#endif

    return HI_SUCCESS;
}


extern volatile S_VDP_REGS_TYPE *pVdpReg;
extern HI_VOID VDP_DRV_CheckOffPart(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_OFFLINE_DFX(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_QBUFSTATUS_DFX(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_DRV_CheckOnlPart(S_VDP_REGS_TYPE *pstLogicRegs);
extern HI_VOID VDP_DRV_CheckAllPath(S_VDP_REGS_TYPE *pstLogicRegs);

#ifdef VDP_REG_ASSERT_CHECK_SUPPORT
HI_S32 DispProcCheckRegConfig(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    if (0 == HI_OSAL_Strncmp(pArg2, "video", strlen("video")))
    {
        nRet = DISP_CheckRegConfig("video");
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "wbc_dhd", strlen("wbc_dhd")))
    {
        nRet = DISP_CheckRegConfig("wbc_dhd");
    }

    VDP_DRV_CheckOffPart((S_VDP_REGS_TYPE *)pVdpReg);
    VDP_OFFLINE_DFX((S_VDP_REGS_TYPE *)pVdpReg);
    VDP_QBUFSTATUS_DFX((S_VDP_REGS_TYPE *)pVdpReg);

    VDP_DRV_CheckOnlPart((S_VDP_REGS_TYPE *)pVdpReg);
    VDP_DRV_CheckAllPath((S_VDP_REGS_TYPE *)pVdpReg);

    return nRet;
}
#endif

HI_S32 DispProcSetWinGlobalInfor(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S stWinCtrlInfor = {0};

    if (0 == HI_OSAL_Strncmp(pArg2, "prog", strlen("prog")))
    {
        stWinCtrlInfor.ePlayctrlType               = HI_DRV_WIN_PROGRESSIVE_INTERLEAVE_REVISE_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eProgRevise = WIN_FRAME_FORCE_PROG;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "int", strlen("int")))
    {
        stWinCtrlInfor.ePlayctrlType               = HI_DRV_WIN_PROGRESSIVE_INTERLEAVE_REVISE_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eProgRevise = WIN_FRAME_FORCE_INTERLEAVE;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "close", strlen("close")))
    {
        stWinCtrlInfor.ePlayctrlType               = HI_DRV_WIN_PROGRESSIVE_INTERLEAVE_REVISE_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eProgRevise = WIN_FRAME_FORCE_CLOSE;
    }

    HI_DRV_WIN_SetWinPlayCtrl(&stWinCtrlInfor);
    return nRet;
}

HI_S32 DispProcSetWinAlgClose(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S stWinCtrlInfor = {0};

    if (0 == HI_OSAL_Strncmp(pArg2, "open", strlen("open")))
    {
        stWinCtrlInfor.ePlayctrlType                 = HI_DRV_WIN_SOFTALG_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eSoftAlgCtrl = WIN_FRAME_SOFTALG_OPEN;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "close", strlen("close")))
    {
        stWinCtrlInfor.ePlayctrlType               = HI_DRV_WIN_SOFTALG_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eSoftAlgCtrl = WIN_FRAME_SOFTALG_CLOSE;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("off")))
    {
        stWinCtrlInfor.ePlayctrlType               = HI_DRV_WIN_SOFTALG_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eSoftAlgCtrl = WIN_FRAME_SHUTDOWN_CTRL;
    }

    HI_DRV_WIN_SetWinPlayCtrl(&stWinCtrlInfor);
    return nRet;
}

HI_S32 DispProcWinConfigCheck(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S stWinCtrlInfor = {0};

    if (0 == HI_OSAL_Strncmp(pArg2, "open", strlen("open")))
    {
        stWinCtrlInfor.ePlayctrlType                   = HI_DRV_WIN_HW_CONFIG_CHECK;
        stWinCtrlInfor.stPlayCtrlInfor.eWinConfigCheck = WIN_HW_CONFIG_CHECK_OPEN;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "close", strlen("close")))
    {
        stWinCtrlInfor.ePlayctrlType                   = HI_DRV_WIN_HW_CONFIG_CHECK;
        stWinCtrlInfor.stPlayCtrlInfor.eWinConfigCheck = WIN_HW_CONFIG_CHECK_CLOSE;
    }

    HI_DRV_WIN_SetWinPlayCtrl(&stWinCtrlInfor);
    return nRet;
}


HI_S32 DispProcWinQueueCtrl(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_WIN_PLAYCTRL_OPERATION_INFOR_S stWinCtrlInfor = {0};

    if (0 == HI_OSAL_Strncmp(pArg2, "on", strlen("on")))
    {
        stWinCtrlInfor.ePlayctrlType              = HI_DRV_WIN_QUEUE_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eQueueCtrl = WIN_QUEUE_CTRL_STEP_BY_STEP;
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("off")))
    {
        stWinCtrlInfor.ePlayctrlType              = HI_DRV_WIN_QUEUE_CTRL;
        stWinCtrlInfor.stPlayCtrlInfor.eQueueCtrl = WIN_QUEUE_CTRL_NORMAL;
    }

    HI_DRV_WIN_SetWinPlayCtrl(&stWinCtrlInfor);
    return nRet;
}


HI_S32 DispProcIsogenySetBypass(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;

    if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("on")))
    {
        g_bVDPIsogenyBypass = HI_TRUE;
    }
    else
    {
        g_bVDPIsogenyBypass = HI_FALSE;
    }

    return nRet;
}


HI_S32 DispProcDebugLevel(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    if (0 != strstr(pArg2, "1"))
    {
        Disp_SetDebugFlag(AVSYNC_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "2"))
    {
        Disp_SetDebugFlag(BUFFER_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "3"))
    {
        Disp_SetDebugFlag(VPSS_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "4"))
    {
        Disp_SetDebugFlag(WINATTR_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "5"))
    {
        Disp_SetDebugFlag(MASK_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "6"))
    {
        Disp_SetDebugFlag(IOCTL_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "7"))
    {
        Disp_SetDebugFlag(SOFTALG_INFOR, HI_FALSE);
    }

    if (0 != strstr(pArg2, "25"))
    {
        Disp_SetDebugFlag(0, HI_TRUE);
        Disp_DestroyDebugFile();
    }

    if (0 != strstr(pArg2, "26"))
    {
        Disp_CreateDebugFile("/dev/debug.xdp");
        Disp_SetDebugFlag(FILE_INFOR, HI_FALSE);
    }

    return HI_SUCCESS;
}



HI_S32 DispProcStopLowbandWidth(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    if (0 == HI_OSAL_Strncmp(pArg2, "on", strlen("on")))
    {
        DISP_ISR_SetIsrControlFlag(ISRFUNC_CTRL_FLAG_STOP_WHEN_LOWBAND);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("off")))
    {
        DISP_ISR_ClearIsrControlFlag(ISRFUNC_CTRL_FLAG_STOP_WHEN_LOWBAND);
    }

    return nRet;
}

HI_S32 DispProcSetApha(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;

    DISP_SetDispAlpha(enDisp,(HI_U32)simple_strtol(pArg2, NULL, 10));

    return nRet;
}

HI_S32 DispProcStopSendHDMIIfo(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{

    if (0 == HI_OSAL_Strncmp(pArg2, "on", strlen("on")))
    {
        DispSetStopHDMIInfo(enDisp,HI_TRUE);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "off", strlen("off")))
    {
        DispSetStopHDMIInfo(enDisp,HI_FALSE);
    }

    return HI_SUCCESS;
}

HI_S32 DispProcSetISRDelayTimeMS(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    Disp_ISR_CheckDelayTimeMS(enDisp,(HI_U32)simple_strtol(pArg2, NULL, 10));

    return HI_SUCCESS;
}

HI_S32 DispProcSetBkgColor(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_COLOR_S stBGColor = {0};

    if (0 == HI_OSAL_Strncmp(pArg2, "red", strlen("red")))
    {
        stBGColor.u8Red   = 0xff;
        stBGColor.u8Green = 0;
        stBGColor.u8Blue  = 0;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "green", strlen("green")))
    {
        stBGColor.u8Red   = 0;
        stBGColor.u8Green = 0xff;
        stBGColor.u8Blue  = 0;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "blue", strlen("blue")))
    {
        stBGColor.u8Red   = 0;
        stBGColor.u8Green = 0;
        stBGColor.u8Blue  = 0xff;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "black", strlen("black")))
    {
        stBGColor.u8Red   = 0;
        stBGColor.u8Green = 0;
        stBGColor.u8Blue  = 0;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "white", strlen("white")))
    {
        stBGColor.u8Red   = 0xff;
        stBGColor.u8Green = 0xff;
        stBGColor.u8Blue  = 0xff;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }
    else
    {
        HI_ERR_DISP("Unsupport type color, will set black color!\n");
        stBGColor.u8Red   = 0;
        stBGColor.u8Green = 0;
        stBGColor.u8Blue  = 0;
        nRet = DISP_SetBGColor(enDisp, &stBGColor);
    }

    return nRet;
}

HI_S32 DispProcSetBT2020Support(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{

    HI_S32  nRet = HI_SUCCESS;
    HI_DRV_DISP_SINK_CAPABILITY_S stSinkCap = {0};

    nRet = DISP_GetSinkCapability(enDisp, &stSinkCap);
    if (nRet != HI_SUCCESS)
    {
        return nRet;
    }

    if (0 == HI_OSAL_Strncmp(pArg2, "on", strlen("on")))
    {
        stSinkCap.bBT2020Support = HI_TRUE;
    }
    else
    {
        stSinkCap.bBT2020Support = HI_FALSE;
    }

    nRet = DISP_SetSinkCapability(enDisp, &stSinkCap);

    return nRet;
}

HI_S32 DispProcSetHdrSinkSupport(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{

    HI_S32  nRet = HI_SUCCESS;
    HI_U8   u8HdrSinkCap = 0;
    HI_DRV_DISP_SINK_CAPABILITY_S stSinkCap = {0};

    nRet = DISP_GetSinkCapability(enDisp, &stSinkCap);
    if(nRet != HI_SUCCESS)
    {
        HI_ERR_DISP("DISP_GetSinkCapability err 0x%x!\n",nRet);
        return nRet;
    }

    u8HdrSinkCap = simple_strtol(pArg2, NULL, 10);
    stSinkCap.bHlgSupport = u8HdrSinkCap & 0x1;
    stSinkCap.bHdr10Support = (u8HdrSinkCap >> 1) & 0x1;
    stSinkCap.bDolbySupport = (u8HdrSinkCap >> 2) & 0x1;

    nRet = DISP_SetSinkCapability(enDisp, &stSinkCap);

    return nRet;
}



HI_S32 DispProcSetProcLevel(HI_HANDLE hWin, HI_CHAR *pArg2)
{
    g_pDispProcLevel = (HI_U32)simple_strtol(pArg2, NULL, 10);

    return HI_SUCCESS;
}


#if 0
HI_S32 fpga_test_disp_Init(char *filenametmp);
HI_S32 fpga_test_disp_deInit(HI_VOID);
HI_S32 fpga_test_vo_createwin(HI_VOID);
HI_S32 fpga_test_vo_destroywin(HI_VOID);
HI_S32 fpga_test_queue_frame(HI_DRV_VIDEO_FRAME_S *pFrame);
HI_S32  fpga_openfile_queue_frame(HI_U32 u32Width,
                                  HI_U32 u32Height,
                                  HI_U32 u32Stride);


HI_S32 DispProcloadyuv(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg2)
{
    HI_FATAL_DISP("\n");
    if (0 == HI_OSAL_Strncmp(pArg2, "start", strlen("start")))
    {
        HI_FATAL_DISP("\n");
        fpga_test_disp_Init(pArg2);
        HI_FATAL_DISP("\n");
        fpga_test_vo_createwin();
        HI_FATAL_DISP("\n");
        fpga_openfile_queue_frame(720,576,720);
        HI_FATAL_DISP("\n");
    }
    else if (0 == HI_OSAL_Strncmp(pArg2, "stop", strlen("stop")))
    {
        HI_FATAL_DISP("\n");
        fpga_test_vo_destroywin();
        fpga_test_disp_deInit();
    }

    return 0;
}
#endif

static const DISP_PROC_COMMAND DispProcCmds[] =
{
    {"help",            DispProcHelp},
    {"fmt",             DispProcSetFormat},
    {"3d",              DispProcSet3DMode},
    {"rf",              DispProcSetRightEyeFirst},
    {"left",            DispProcSetLeft},
    {"right",           DispProcSetRight},
    {"bottom",          DispProcSetBottom},
    {"top",             DispProcSetTop},
    {"video",           DispProcSetZorder},
    {"reset",           DispProcReset},
    {"rd_door",         DispProcSetRdDoor},
 #ifdef VDP_REG_ASSERT_CHECK_SUPPORT
    {"config_check",    DispProcCheckRegConfig},
#endif
    {"bkg",             DispProcSetBkgColor},
    {"lowband",         DispProcStopLowbandWidth},
    {"proc",            DispProcSetProcLevel},
    {"alpha",           DispProcSetApha},
    {"bt2020",          DispProcSetBT2020Support},
    {"sinkcap",         DispProcSetHdrSinkSupport},
    {"stopsendhdmi",    DispProcStopSendHDMIIfo},
    {"isr_delaytime",   DispProcSetISRDelayTimeMS},
    //{"loadyuv", DispProcloadyuv},
    {"framerevise",     DispProcSetWinGlobalInfor},
    {"softalg",         DispProcSetWinAlgClose},
    {"hwcheck",         DispProcWinConfigCheck},
    {"isogeny",         DispProcIsogenySetBypass},
    {"debug",           DispProcDebugLevel},
    {"step",           DispProcWinQueueCtrl}
};

static HI_S32 DispProcCmdProcee(HI_DRV_DISPLAY_E enDisp, HI_CHAR *pArg1,HI_CHAR *pArg2)
{
    HI_S32 nRet = HI_SUCCESS;
    HI_U32 u32CmdNum = 0;

    for (u32CmdNum = 0; u32CmdNum < sizeof(DispProcCmds)/sizeof(DISP_PROC_COMMAND); u32CmdNum++)
    {
        if (0 == HI_OSAL_Strncmp(pArg1, DispProcCmds[u32CmdNum].command_name, strlen(DispProcCmds[u32CmdNum].command_name)))
        {
            nRet = DispProcCmds[u32CmdNum].PF_DebugFun(enDisp,pArg2);
            break;
        }
    }

    return nRet;
}

HI_CHAR u8DispProcBuffer[ARG_LENGTH_MAX];
static HI_S32 DISP_ProcWrite(struct file * file,
    const char __user * buf, size_t count, loff_t *ppos)
{
    struct seq_file   *p = HI_NULL;
    DRV_PROC_ITEM_S  *pProcItem = HI_NULL;
    HI_CHAR *pArg1 = HI_NULL, *pArg2 = HI_NULL;
    HI_DRV_DISPLAY_E enDisp = HI_DRV_DISPLAY_1;
    HI_S32 nRet;

    if (HI_NULL == file || HI_NULL == buf  || HI_NULL == ppos)
    {
        HI_FATAL_DISP("Input parameter ptr is null!\n");
        return -EFAULT;
    }

    p = file->private_data;

    pProcItem = p->private;
    enDisp = (HI_DRV_DISPLAY_E)pProcItem->data;

    if(count >= sizeof(u8DispProcBuffer))
    {
        HI_ERR_DISP("your parameter string is too long!\n");
        return -EFAULT;
    }

    memset(u8DispProcBuffer, 0, sizeof(u8DispProcBuffer));
    if (copy_from_user(u8DispProcBuffer, buf, count))
    {
        HI_ERR_DISP("MMZ: copy_from_user failed!\n");
        return -EFAULT;
    }
    u8DispProcBuffer[count] = 0;

    nRet = DispProcParsePara(u8DispProcBuffer, &pArg1, &pArg2);
    if(  (nRet != HI_SUCCESS)
        ||(0 == HI_OSAL_Strncmp(pArg1, "help", strlen("help")))
        ||(pArg2 == HI_NULL) )
    {
        DISP_ProcPrintHelp();
        return count;
    }

    HI_PRINT("====================echo debug disp%d\n", enDisp);
    nRet = DispProcCmdProcee(enDisp, pArg1, pArg2);
    if (nRet != HI_SUCCESS)
    {
        DISP_ProcPrintHelp();
    }
    return count;
}



/***************************************************************/
#define DEF_DRV_DISP_FILE_FUNCTION_START_FROM_HERE

HI_S32 DISP_CheckPara(HI_DRV_DISPLAY_E enDisp, DRV_DISP_STATE_S *pDispState)
{
    if ((enDisp < HI_DRV_DISPLAY_2) && pDispState->bDispOpen[enDisp])
    {
        return HI_SUCCESS;
    }

    return HI_ERR_DISP_INVALID_PARA;
}

HI_S32 DISP_FileOpen(struct inode *finode, struct file  *ffile)
{
    DRV_DISP_STATE_S *pDispState = HI_NULL;
    HI_DRV_DISPLAY_E u;
    HI_S32 Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed !\n");
        return HI_FAILURE;
    }

    pDispState = HI_KMALLOC(HI_ID_DISP, sizeof(DRV_DISP_STATE_S), GFP_KERNEL);
    if (!pDispState)
    {
        HI_FATAL_DISP("malloc pDispState failed.\n");
        up(&g_DispMutex);
        return HI_ERR_DISP_MALLOC_FAILED;
    }

    if (1 == atomic_inc_return(&g_DispCount))
    {
        /* for configuration such as start clock, pins re-use, etc  */
        Ret = DISP_Init();
        if (Ret != HI_SUCCESS)
        {
            HI_KFREE(HI_ID_DISP, pDispState);
            pDispState = HI_NULL;
            HI_FATAL_DISP("call DISP_Init failed.\n");
            atomic_dec(&g_DispCount);
            up(&g_DispMutex);
            return Ret;
        }
    }

    for(u=0; u<HI_DRV_DISPLAY_BUTT; u++)
    {
        pDispState->bDispOpen[u] = HI_FALSE;
        pDispState->hCastHandle[u] = HI_NULL;
        pDispState->hSnapshot[u] = HI_NULL;
        pDispState->hVbi[u] = HI_FALSE;
    }

    ffile->private_data = pDispState;

    up(&g_DispMutex);
    return 0;
}


HI_S32 DISP_FileClose(struct inode *finode, struct file  *ffile)
{
    DRV_DISP_STATE_S *pDispState;
    HI_DRV_DISPLAY_E u;
    HI_S32 Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed.\n");
        return HI_FAILURE;
    }

    pDispState = ffile->private_data;

    for(u=0; u<HI_DRV_DISPLAY_BUTT; u++)
    {
        if (pDispState->hVbi[u])
        {
            Ret = DRV_VBI_DeInit();
            if (Ret != HI_SUCCESS)
            {
                HI_ERR_DISP("destroy vbi  %d  failed!\n", u);
                break;
            }
        }

        if (pDispState->bDispOpen[u])
        {
            Ret = DISP_ExtClose(u, pDispState, HI_TRUE);
            if (Ret != HI_SUCCESS)
            {
                HI_ERR_DISP("Display %d close failed!\n", u);
                break;
            }
        }
    }

    if (atomic_dec_and_test(&g_DispCount))
    {
        /* for close of clock */
        DISP_DeInit();

        // add for multiple process
        g_s32DispAttachCount = 0;
    }

    if (HI_NULL != ffile->private_data)
    {
        HI_KFREE(HI_ID_DISP, ffile->private_data);
        ffile->private_data = HI_NULL;
    }

    up(&g_DispMutex);
    return Ret;
}


HI_S32 DRV_DISP_Ioctl(struct inode *inode, struct file *file, unsigned int cmd, HI_VOID *arg)
{
    DRV_DISP_STATE_S *pDispState;
    HI_S32 Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_ERR_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    pDispState = file->private_data;

    Ret = DRV_DISP_ProcessCmd(cmd, arg, pDispState, HI_TRUE);

    up(&g_DispMutex);
    return Ret;
}
HI_S32 DRV_DISP_Compat_Ioctl(struct inode *inode, struct file *file, unsigned int cmd, HI_VOID *arg)
{
    DRV_DISP_STATE_S *pDispState;
    HI_S32 Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    pDispState = file->private_data;

    Ret = DRV_DISP_Compat_ProcessCmd(cmd, arg, pDispState, HI_TRUE);

    up(&g_DispMutex);
    return Ret;
}

/***************************************************************/
#define DEF_DRV_DISP_DRV_FUNCTION_START_FROM_HERE

HI_S32 HI_DRV_DISP_Process(HI_U32 cmd, HI_VOID *arg)
{
    DRV_DISP_STATE_S    *pDispState;
    HI_S32          Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    pDispState = &g_DispModState;

    Ret = DRV_DISP_ProcessCmd(cmd, arg, pDispState, HI_FALSE);

    up(&g_DispMutex);

    return Ret;
}

HI_S32 HI_DRV_DISP_Process_Intr(HI_U32 cmd, HI_VOID *arg)
{
    DRV_DISP_STATE_S    *pDispState;
    HI_S32          Ret;
    pDispState = &g_DispModState;
    Ret = DRV_DISP_ProcessCmd(cmd, arg, pDispState, HI_FALSE);
    return Ret;
}
HI_U32 DISP_ResetCountStatus(void)
{
    HI_DRV_DISPLAY_E u;

    for(u=0; u<HI_DRV_DISPLAY_BUTT; u++)
    {
        g_DispAllCountState.DispOpenNum[u] = 0;
        g_DispUserCountState.DispOpenNum[u] = 0;
        g_DispKernelCountState.DispOpenNum[u] = 0;
        g_DispModState.bDispOpen[u] = HI_FALSE;
        g_DispModState.hCastHandle[u] = HI_NULL;
        g_DispModState.hSnapshot[u] = HI_NULL;
    }

    g_DispSuspend = HI_FALSE;
    g_s32DispAttachCount = 0;

    return HI_SUCCESS;
}


HI_S32 DISP_ExtOpen(HI_DRV_DISPLAY_E enDisp, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser)
{
    HI_S32            Ret;


    if (enDisp >= HI_DRV_DISPLAY_2)
    {
        HI_ERR_DISP("enDisp out of range\n");
        return HI_FAILURE;
    }

    /* create DISP for the first time */
    if (HI_TRUE != pDispState->bDispOpen[enDisp])
    {
        /* call basic interface for the first time creating DISP globally*/
        Ret = DISP_Open(enDisp);
        if (Ret != HI_SUCCESS)
        {
            HI_ERR_DISP(" Error number is: %x.\n", Ret);
            return Ret;
        }


        pDispState->bDispOpen[enDisp] = HI_TRUE;

        g_DispAllCountState.DispOpenNum[enDisp]++;
        if (HI_TRUE == bUser)
        {
            g_DispUserCountState.DispOpenNum[enDisp]++;
        }
        else
        {
            g_DispKernelCountState.DispOpenNum[enDisp]++;
        }
    }

    return HI_SUCCESS;
}

HI_S32 DISP_ExtClose(HI_DRV_DISPLAY_E enDisp, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;

    if (enDisp >= HI_DRV_DISPLAY_2)
    {
        HI_ERR_DISP("enDisp out of range\n");
        return HI_FAILURE;
    }

    /* destroy DISP */
    if ( HI_TRUE == pDispState->bDispOpen[enDisp])
    {
        if (HI_TRUE == bUser)
        {
            if (g_DispUserCountState.DispOpenNum[enDisp] == 0)
            {
                HI_WARN_DISP("Already Close User display%d =0\n", enDisp);
                return HI_SUCCESS;
            }

            g_DispUserCountState.DispOpenNum[enDisp]--;  /* User count --   */
        }
        else
        {
            if (g_DispKernelCountState.DispOpenNum[enDisp] == 0)
            {
                HI_WARN_DISP("Already Close kernel display%d =0\n", enDisp);
                return HI_SUCCESS;
            }
            g_DispKernelCountState.DispOpenNum[enDisp]--;

        }

        g_DispAllCountState.DispOpenNum[enDisp]--;  /* Global count -- */

        if (!g_DispAllCountState.DispOpenNum[enDisp])
        {
            Ret = DISP_Close(enDisp);
            if (Ret != HI_SUCCESS)
            {
                HI_FATAL_DISP("call DISP_Close failed.\n");
            }

            g_s32DispAttachCount = 0;
        }

        pDispState->bDispOpen[enDisp] = HI_FALSE;
    }

    return Ret;
}


HI_S32 DISP_ExtAttach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave)
{
    HI_S32 nRet = HI_FAILURE;

    if ( (enMaster != HI_DRV_DISPLAY_1) || (enSlave != HI_DRV_DISPLAY_0))
    {
        HI_FATAL_DISP("Attach parameters invalid.\n");
        return HI_ERR_DISP_INVALID_OPT;
    }

    nRet = DISP_Attach(enMaster, enSlave);

    return nRet;
}

HI_S32 DISP_ExtDetach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave)
{
    HI_S32 nRet = HI_FAILURE;

    if ( (enMaster != HI_DRV_DISPLAY_1) || (enSlave != HI_DRV_DISPLAY_0))
    {
        HI_FATAL_DISP("Attach parameters invalid.\n");
        return HI_ERR_DISP_INVALID_OPT;
    }

    nRet = DISP_Detach(enMaster, enSlave);

    return nRet;
}

#if 0
HI_S32 HI_DRV_DISP_FreeLogoMem(HI_VOID)
{
    HI_DRV_LOGO_FreeLogoMem();
    return HI_SUCCESS;
}

HI_S32 HI_DRV_DISP_GetLogoInfor(HI_DRV_DISP_VideoLogoInfo *pstLogoInfor)
{
    HI_DRV_LOGO_GetLogoInfor(pstLogoInfor);
    return HI_SUCCESS;
}
#endif

HI_S32 HI_DRV_DISP_Attach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave)
{
    HI_S32 Ret;
    DISP_ATTACH_S  enDispAttach;
    DispCheckID(enMaster);
    DispCheckID(enSlave);

    enDispAttach.enMaster = enMaster;
    enDispAttach.enSlave  = enSlave;
    Ret = HI_DRV_DISP_Process(CMD_DISP_ATTACH, &enDispAttach);
    return Ret;
}

HI_S32 HI_DRV_DISP_Detach(HI_DRV_DISPLAY_E enMaster, HI_DRV_DISPLAY_E enSlave)
{
    HI_S32 Ret;
    DISP_ATTACH_S  enDispAttach;
    DispCheckID(enMaster);
    DispCheckID(enSlave);

    enDispAttach.enMaster = enMaster;
    enDispAttach.enSlave  = enSlave;
    Ret = HI_DRV_DISP_Process(CMD_DISP_DETACH, &enDispAttach);
    return Ret;
}

HI_S32 HI_DRV_DISP_SetFormat(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_FMT_E enFormat)
{
    HI_S32 Ret;
    DISP_FORMAT_S  enDispFormat;
    DispCheckID(enDisp);
    if (  ((enFormat >= HI_DRV_DISP_FMT_1080P_24_FP)
          && (enFormat <= HI_DRV_DISP_FMT_720P_50_FP))
          || (enFormat >= HI_DRV_DISP_FMT_BUTT)
       )
    {
        DISP_ERROR("Invalid format.\n");
        return HI_ERR_DISP_INVALID_PARA;
    }

    memset(&enDispFormat, 0, sizeof(DISP_FORMAT_S));
    enDispFormat.enDisp = enDisp;
    enDispFormat.enFormat = enFormat;
    enDispFormat.enStereo = HI_DRV_DISP_STEREO_NONE;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_FORMAT,  &enDispFormat);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetFormat(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_FMT_E *penFormat)
{
    HI_S32 Ret;
    DISP_FORMAT_S  stDispFormat = {0};
    DispCheckID(enDisp);
    DispCheckNullPointer(penFormat);

    memset(&stDispFormat, 0, sizeof(DISP_FORMAT_S));
    stDispFormat.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_FORMAT,  &stDispFormat);
    if (!Ret)
    {
        *penFormat = stDispFormat.enFormat;
    }
    return Ret;
}

HI_S32 HI_DRV_DISP_SetHDMI420(HI_DRV_DISPLAY_E enDisp,HI_BOOL bEnable)
{
    DispCheckID(enDisp);
    return Disp_SetHDMI420( enDisp,bEnable);
}

HI_S32 HI_DRV_DISP_SetCustomTiming(HI_DRV_DISPLAY_E enDisp,  HI_DRV_DISP_TIMING_S *pstTiming)
{
    HI_S32 Ret;
    DISP_TIMING_S  DispTiming = {0};
    DispCheckID(enDisp);
    DispCheckNullPointer(pstTiming);
    if (pstTiming->u32DataWidth >= HI_DRV_DISP_INTF_DATA_WIDTH_BUTT ||
        pstTiming->eDataFmt >= HI_DRV_DISP_INTF_DATA_FMT_BUTT)
    {
        HI_ERR_DISP("para is invalid.\n");
        return HI_ERR_DISP_INVALID_PARA;
    }


    memset(&DispTiming, 0, sizeof(DISP_TIMING_S));
    DispTiming.enDisp = enDisp;
    memcpy(&DispTiming.stTimingPara, pstTiming, sizeof(HI_DRV_DISP_TIMING_S));
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_TIMING, &DispTiming);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetCustomTiming(HI_DRV_DISPLAY_E enDisp,  HI_DRV_DISP_TIMING_S *pstTiming)
{
    HI_S32 Ret;
    DISP_TIMING_S  DispTiming = {0};
    DispCheckID(enDisp);
    DispCheckNullPointer(pstTiming);
    memset(&DispTiming, 0, sizeof(DISP_TIMING_S));
    DispTiming.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_TIMING, &DispTiming);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }
    memcpy(pstTiming, &DispTiming.stTimingPara, sizeof(HI_DRV_DISP_TIMING_S));
    return Ret;
}

HI_S32 HI_DRV_DISP_AddIntf(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_S *pstIntf)
{
    HI_S32          Ret;
    DISP_SET_INTF_S DispIntf = {0};

    DispCheckID(enDisp);
    DispCheckNullPointer(pstIntf);
    DispIntf.enDisp = enDisp;

    memcpy(&DispIntf.stIntf, pstIntf, sizeof(HI_DRV_DISP_INTF_S));

    Ret = HI_DRV_DISP_Process(CMD_DISP_ADD_INTF, &DispIntf);
    return Ret;
}

HI_S32 HI_DRV_DISP_DelIntf(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_INTF_S *pstIntf)
{
    HI_S32          Ret;
    DISP_SET_INTF_S DispIntf = {0};

    DispCheckID(enDisp);
    DispCheckNullPointer(pstIntf);
    DispIntf.enDisp = enDisp;

    memcpy(&DispIntf.stIntf, pstIntf, sizeof(HI_DRV_DISP_INTF_S));

    Ret = HI_DRV_DISP_Process(CMD_DISP_DEL_INTF, &DispIntf);
    return Ret;
}


HI_S32 HI_DRV_DISP_Open(HI_DRV_DISPLAY_E enDisp)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    Ret = HI_DRV_DISP_Process(CMD_DISP_OPEN, &enDisp);
    return Ret;
}

HI_S32 HI_DRV_DISP_Close(HI_DRV_DISPLAY_E enDisp)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    Ret = HI_DRV_DISP_Process(CMD_DISP_CLOSE, &enDisp);
    return Ret;
}

HI_S32 HI_DRV_DISP_SetEnable(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable)
{
    HI_S32 Ret;
    DISP_ENABLE_S  stDispEnable = {0};

    DispCheckID(enDisp);
    memset(&stDispEnable, 0, sizeof(DISP_ENABLE_S));
    stDispEnable.bEnable = bEnable;
    stDispEnable.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_ENABLE, &stDispEnable);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetEnable(HI_DRV_DISPLAY_E enDisp, HI_BOOL *pbEnable)
{
    HI_S32 Ret;
    DISP_ENABLE_S  stDispEnable = {0};
    DispCheckID(enDisp);
    DispCheckNullPointer(pbEnable);

    memset(&stDispEnable, 0, sizeof(DISP_ENABLE_S));
    stDispEnable.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_ENABLE, &stDispEnable);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }
    *pbEnable = stDispEnable.bEnable;
    return Ret;
}

HI_S32 HI_DRV_DISP_SetRightEyeFirst(HI_DRV_DISPLAY_E enDisp, HI_BOOL bEnable)
{
    HI_S32 Ret;
    DISP_R_EYE_FIRST_S  stREFirst = {0};

    DispCheckID(enDisp);
    stREFirst.bREFirst = bEnable;
    stREFirst.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_R_E_FIRST, &stREFirst);
    return Ret;
}

HI_S32 HI_DRV_DISP_SetBgColor(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_COLOR_S *pstBgColor)
{
    HI_S32 Ret;
    DISP_BGC_S  stDispBgc = {0};

    DispCheckID(enDisp);
    DispCheckNullPointer(pstBgColor);
    memset(&stDispBgc, 0, sizeof(DISP_BGC_S));
    stDispBgc.stBgColor = *pstBgColor;
    stDispBgc.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_BGC, &stDispBgc);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetBgColor(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_COLOR_S *pstBgColor)
{
    HI_S32 Ret;
    DISP_BGC_S  stDispBgc = {0};
    DispCheckID(enDisp);
    DispCheckNullPointer(pstBgColor);

    memset(&stDispBgc, 0, sizeof(DISP_BGC_S));
    stDispBgc.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_BGC, &stDispBgc);
    if (HI_SUCCESS != Ret)
    {
        return Ret;
    }

    *pstBgColor = stDispBgc.stBgColor ;
    return Ret;
}

HI_S32 HI_DRV_DISP_SetAspectRatio(HI_DRV_DISPLAY_E enDisp, HI_U32 u32Ratio_h, HI_U32 u32Ratio_v)
{
    HI_S32 Ret;
    DISP_ASPECT_RATIO_S stDispRatio = {0};

    DispCheckID(enDisp);
    memset(&stDispRatio, 0, sizeof(DISP_ASPECT_RATIO_S));
    stDispRatio.enDisp = enDisp;
    stDispRatio.u32ARHori = u32Ratio_h;
    stDispRatio.u32ARVert = u32Ratio_v;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_DEV_RATIO, &stDispRatio);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetAspectRatio(HI_DRV_DISPLAY_E enDisp, HI_U32 *pu32Ratio_h, HI_U32 *pu32Ratio_v)
{
    HI_S32 Ret;
    DISP_ASPECT_RATIO_S stDispRatio = {0};

    DispCheckID(enDisp);
    DispCheckNullPointer(pu32Ratio_h);
    DispCheckNullPointer(pu32Ratio_v);

    memset(&stDispRatio, 0, sizeof(DISP_ASPECT_RATIO_S));
    stDispRatio.enDisp = enDisp;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_DEV_RATIO, &stDispRatio);
    if(HI_SUCCESS == Ret)
    {
        *pu32Ratio_h = stDispRatio.u32ARHori;
        *pu32Ratio_v = stDispRatio.u32ARVert;
    }
    return Ret;
}

HI_S32 HI_DRV_DISP_SetLayerZorder(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer, HI_DRV_DISP_ZORDER_E enZFlag)
{
    HI_S32 Ret;
    DISP_ZORDER_S stDispZorder = {0};

    if ((enLayer >= HI_DRV_DISP_LAYER_BUTT) || (enZFlag >= HI_DRV_DISP_ZORDER_BUTT))
    {
        DISP_ERROR("Invalid layer or zorder flag.\n");
        return HI_ERR_DISP_INVALID_PARA;
    }

    DispCheckID(enDisp);
    memset(&stDispZorder, 0, sizeof(DISP_ZORDER_S));
    stDispZorder.enDisp = enDisp;
    stDispZorder.Layer  = enLayer;
    stDispZorder.ZFlag  = enZFlag;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_ZORDER, &stDispZorder);
    return Ret;
}

HI_S32 HI_DRV_DISP_GetLayerZorder(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_LAYER_E enLayer, HI_U32 *pu32Zorder)
{
    HI_S32 Ret;
    DISP_ZORDER_S stDispZorder = {0};
    if (enLayer >= HI_DRV_DISP_LAYER_BUTT)
    {
        DISP_ERROR("Invalid layer or zorder flag.\n");
        return HI_ERR_DISP_INVALID_PARA;
    }
    DispCheckID(enDisp);
    DispCheckNullPointer(pu32Zorder);
    memset(&stDispZorder, 0, sizeof(DISP_ZORDER_S));
    stDispZorder.enDisp = enDisp;
    stDispZorder.Layer  = enLayer;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_ZORDER, &stDispZorder);
    *pu32Zorder = stDispZorder.ZFlag;
    return Ret;
}

HI_S32 HI_DRV_DISP_CreateCast (HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CAST_CFG_S * pstCfg, HI_HANDLE *phCast)
{
    HI_S32 Ret;
    DISP_CAST_CREATE_S stCastCreate = {0};

    DispCheckID(enDisp);
    DispCheckNullPointer(pstCfg);
    DispCheckNullPointer(phCast);
    stCastCreate.enDisp = enDisp;
    stCastCreate.hCast = *phCast;
    stCastCreate.stCfg = *pstCfg;
    Ret = HI_DRV_DISP_Process(CMD_DISP_CREATE_CAST, &stCastCreate);
    return Ret;
}

HI_S32  HI_DRV_DISP_DestroyCast(HI_HANDLE hCast)
{
    HI_S32 Ret;
    DISP_CAST_DESTROY_S stCastDestroy = {0};

    stCastDestroy.hCast = hCast;
    Ret = HI_DRV_DISP_Process(CMD_DISP_DESTROY_CAST, &stCastDestroy);
    return Ret;
}

HI_S32 HI_DRV_DISP_SetCastEnable(HI_HANDLE hCast, HI_BOOL bEnable)
{
    HI_S32 Ret;
    DISP_CAST_ENABLE_S stCastEnable = {0};
    memset(&stCastEnable, 0, sizeof(DISP_CAST_ENABLE_S));
    stCastEnable.hCast = hCast;
    stCastEnable.bEnable = bEnable;
    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_CAST_ENABLE, &stCastEnable);
    return Ret;
}

HI_S32  HI_DRV_DISP_GetCastEnable(HI_HANDLE hCast, HI_BOOL *pbEnable)
{
    HI_S32 Ret;
    DISP_CAST_ENABLE_S stCastEnable = {0};

    DispCheckNullPointer(pbEnable);
    memset(&stCastEnable, 0, sizeof(DISP_CAST_ENABLE_S));
    stCastEnable.hCast = hCast;
    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_CAST_ENABLE, &stCastEnable);
    if(!Ret)
    {
        *pbEnable = stCastEnable.bEnable;
    }
    return Ret ;
}

HI_S32  HI_DRV_DISP_AcquireCastFrame(HI_HANDLE hCast, HI_DRV_VIDEO_FRAME_S *pstCastFrame)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_CAST_FRAME_S stCastFrame = {0};

    DispCheckNullPointer(pstCastFrame);

    memset(&stCastFrame, 0, sizeof(DISP_CAST_FRAME_S));
    stCastFrame.hCast = hCast;
    Ret = HI_DRV_DISP_Process(CMD_DISP_ACQUIRE_CAST_FRAME, &stCastFrame);
    if(!Ret)
    {
        *pstCastFrame = stCastFrame.stFrame;
    }
    return Ret ;
}

HI_S32 HI_DRV_DISP_ReleaseCastFrame(HI_HANDLE hCast, HI_DRV_VIDEO_FRAME_S *pstCastFrame)
{
    HI_S32 Ret;
    DISP_CAST_FRAME_S stCastFrame = {0};

    DispCheckNullPointer(pstCastFrame);
    memset(&stCastFrame, 0, sizeof(DISP_CAST_FRAME_S));
    stCastFrame.hCast = hCast;
    stCastFrame.stFrame = *pstCastFrame;

    Ret = HI_DRV_DISP_Process_Intr(CMD_DISP_RELEASE_CAST_FRAME, &stCastFrame);

    return Ret ;
}

HI_S32 HI_DRV_DISP_ExternlAttach(HI_HANDLE hCast, HI_HANDLE hSink)
{
    HI_S32 Ret;
    DISP_EXT_ATTACH_S disp_attach_info = {0};

    disp_attach_info.hCast = hCast;
    disp_attach_info.hMutual = hSink;
    disp_attach_info.enType = EXT_ATTACH_TYPE_SINK;

    Ret = HI_DRV_DISP_Process(CMD_DISP_EXT_ATTACH, &disp_attach_info);

    return Ret ;
}

HI_S32 HI_DRV_DISP_SetCastAttr(HI_HANDLE hCast,
                                HI_U32 u32Width,
                                HI_U32 u32Height,
                                HI_U32 u32FrmRate)
{
    HI_S32 Ret;
    DISP_CAST_EXT_ATTR_S disp_cast_attr = {0};
    memset((void*)&disp_cast_attr, 0, sizeof(DISP_CAST_EXT_ATTR_S));
    disp_cast_attr.hCast = hCast;
    disp_cast_attr.castAttr.s32Width =  u32Width;
    disp_cast_attr.castAttr.s32Height = u32Height;

    Ret = HI_DRV_DISP_Process(CMD_DISP_SET_CASTATTR, &disp_cast_attr);
    return Ret ;
}

HI_S32 HI_DRV_DISP_GetCastAttr(HI_HANDLE hCast, HI_DRV_DISP_Cast_Attr_S *pstCastAttr)
{
    HI_S32 Ret;
    DISP_CAST_EXT_ATTR_S disp_cast_attr = {0};
    DispCheckNullPointer(pstCastAttr);
    memset((void*)&disp_cast_attr, 0, sizeof(DISP_CAST_EXT_ATTR_S));

    disp_cast_attr.hCast = hCast;

    Ret = HI_DRV_DISP_Process(CMD_DISP_GET_CASTATTR, &disp_cast_attr);
    if (HI_FAILURE ==  Ret)
        return  Ret;

    *pstCastAttr = disp_cast_attr.castAttr;
    return Ret ;
}

HI_S32 HI_DRV_DISP_ExternlDetach(HI_HANDLE hCast, HI_HANDLE hSink)
{
    HI_S32 Ret;
    DISP_EXT_ATTACH_S disp_attach_info;

    disp_attach_info.hCast = hCast;
    disp_attach_info.hMutual = hSink;
    disp_attach_info.enType = EXT_ATTACH_TYPE_SINK;

    Ret = HI_DRV_DISP_Process(CMD_DISP_EXT_DEATTACH, &disp_attach_info);

    return Ret ;
}

HI_S32 HI_DRV_DISP_GetInitFlag(HI_BOOL *pbInited)
{
    HI_S32 Ret;

    DispCheckNullPointer(pbInited);
    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    Ret = DISP_GetInitFlag(pbInited);

    up(&g_DispMutex);

    return Ret;
}

HI_S32 HI_DRV_DISP_GetVersion(HI_DRV_DISP_VERSION_S *pstVersion)
{
    HI_S32 Ret;
    DispCheckNullPointer(pstVersion);

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    Ret = DISP_GetVersion(pstVersion);

    up(&g_DispMutex);

    return Ret;
}

HI_BOOL HI_DRV_DISP_IsOpened(HI_DRV_DISPLAY_E enDisp)
{
    HI_BOOL Ret;

    if ( (enDisp >= HI_DRV_DISPLAY_BUTT) )
    {
        HI_FATAL_DISP("DISP ERROR! Invalid display in %s!\n", __FUNCTION__);
        return HI_FALSE;
    }

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FALSE;
    }

    Ret = DISP_IsOpened(enDisp);

    up(&g_DispMutex);

    return Ret;
}

HI_S32 HI_DRV_DISP_GetSlave(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISPLAY_E *penSlave)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    DispCheckNullPointer(penSlave);
    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    Ret = DISP_GetSlave(enDisp, penSlave);

    up(&g_DispMutex);

    return Ret;
}

HI_S32 HI_DRV_DISP_GetMaster(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISPLAY_E *penMaster)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    DispCheckNullPointer(penMaster);
    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }

    Ret = DISP_GetMaster(enDisp, penMaster);

    up(&g_DispMutex);

    return Ret;
}

HI_S32 HI_DRV_DISP_GetDisplayInfo(HI_DRV_DISPLAY_E enDisp, HI_DISP_DISPLAY_INFO_S *pstInfo)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    DispCheckNullPointer(pstInfo);

    Ret = DISP_GetDisplayInfo(enDisp, pstInfo);
    return Ret;
}

HI_S32 HI_DRV_DISP_RegCallback(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CALLBACK_TYPE_E eType,
                            HI_DRV_DISP_CALLBACK_S *pstCallback)
{
    HI_S32 Ret;
    DispCheckID(enDisp);
    DispCheckNullPointer(pstCallback);
    if (eType >= HI_DRV_DISP_C_TYPE_BUTT)
    {
        DISP_ERROR("Invalid display callback type!\n");
        return HI_ERR_DISP_INVALID_PARA;
    }

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }
    pstCallback->eCallBackPrior =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
    Ret = DISP_RegCallback(enDisp, eType, pstCallback);
    up(&g_DispMutex);
    return Ret;
}

HI_S32 HI_DRV_DISP_UnRegCallback(HI_DRV_DISPLAY_E enDisp, HI_DRV_DISP_CALLBACK_TYPE_E eType,
                              HI_DRV_DISP_CALLBACK_S *pstCallback)
{
    HI_S32 Ret;

    DispCheckID(enDisp);
    DispCheckNullPointer(pstCallback);
    if (eType >= HI_DRV_DISP_C_TYPE_BUTT)
    {
        DISP_ERROR("Invalid display callback type!\n");
        return HI_ERR_DISP_INVALID_PARA;
    }
    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_VoMutex failed.\n");
        return HI_FAILURE;
    }
    pstCallback->eCallBackPrior =  HI_DRV_DISP_CALLBACK_PRIORTY_MIDDLE;
    Ret = DISP_UnRegCallback(enDisp, eType, pstCallback);
    up(&g_DispMutex);
    return Ret;
}

HI_S32 DRV_DISP_Suspend(PM_BASEDEV_S *pdev, pm_message_t state)
{
    HI_S32 Ret;

    HDMI_EXPORT_FUNC_S* pstHDMIFunc = HI_NULL;

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_HDMI, (HI_VOID**)&pstHDMIFunc);

    if ((Ret != HI_SUCCESS) || (pstHDMIFunc == HI_NULL))
    {
        DISP_ERROR("DISP_get HDMI func failed!");
        return HI_FAILURE;
    }

    DispCheckNullPointer(pstHDMIFunc->pfnHdmiSuspend);
    pstHDMIFunc->pfnHdmiSuspend(NULL,state);

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed.\n");
        return HI_FAILURE;
    }

    /* no process opened the equipment, return directly */
    if (!atomic_read(&g_DispCount))
    {
        up(&g_DispMutex);
        return 0;
    }

    DISP_Suspend();

    msleep(50);

    g_DispSuspend = HI_TRUE;

    HI_PRINT("DISP suspend OK\n");

    up(&g_DispMutex);

    return 0;
}

HI_S32 DRV_DISP_Resume(PM_BASEDEV_S *pdev)
{
    HI_S32  Ret;
    HDMI_EXPORT_FUNC_S* pstHDMIFunc = HI_NULL;

    Ret = down_interruptible(&g_DispMutex);
    if (Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed.\n");
        return HI_FAILURE;
    }

    /* no process opened the equipment, return directly */
    if (!atomic_read(&g_DispCount))
    {
        up(&g_DispMutex);
        return 0;
    }

    DISP_Resume();

    g_DispSuspend = HI_FALSE;

    HI_PRINT("DISP resume OK\n");

    up(&g_DispMutex);

    Ret = HI_DRV_MODULE_GetFunction(HI_ID_HDMI, (HI_VOID**)&pstHDMIFunc);

    if ((Ret != HI_SUCCESS) || (pstHDMIFunc == HI_NULL))
    {
        DISP_ERROR("DISP_get HDMI func failed!");
        return HI_FAILURE;
    }

    DispCheckNullPointer(pstHDMIFunc->pfnHdmiResume);
    pstHDMIFunc->pfnHdmiResume(NULL);

    return 0;
}

HI_S32 DRV_DISP_Compat_ProcessCmd(unsigned int cmd, HI_VOID *arg, DRV_DISP_STATE_S *pDispState, HI_BOOL bUser)
{
    HI_S32       Ret = HI_FAILURE;

    if ((HI_NULL == arg) || (HI_NULL == pDispState))
    {
        HI_FATAL_DISP("pass null ptr.\n");
        Ret = HI_ERR_DISP_NULL_PTR;
        return Ret;
    }

    switch(cmd)
    {
        case CMD_DISP_COMPAT_SEND_VBI:
        {
            DISP_COMPAT_VBI_S  *pDispVbi;
            HI_DRV_DISP_VBI_DATA_S stVbiData;

            pDispVbi = (DISP_COMPAT_VBI_S *)arg;

            stVbiData.eType       = pDispVbi->stVbiData.eType;
            stVbiData.pu8DataAddr = (HI_U8*)(HI_SIZE_T)pDispVbi->stVbiData.u32DataAddr;
            stVbiData.u32DataLen  = pDispVbi->stVbiData.u32DataLen;

            Ret = DISP_SendVbiData(pDispVbi->hVbi, &stVbiData);
            break;
        }
    default:
        {
            Ret = DRV_DISP_ProcessCmd(cmd,arg,pDispState, bUser);
            break;
        }
    }

    return Ret;
}

static HI_S32 DISPProcessCmdAttach(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ATTACH_S*  pDispAttach;

    pDispAttach = (DISP_ATTACH_S*)arg;

    Ret = DISP_ExtAttach(pDispAttach->enMaster, pDispAttach->enSlave);

    return Ret;
}

static HI_S32 DISPProcessCmdDetach(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ATTACH_S  *pDispAttach;

    pDispAttach = (DISP_ATTACH_S *)arg;

    Ret = DISP_ExtDetach(pDispAttach->enMaster, pDispAttach->enSlave);

    return Ret;
}

static HI_S32 DISPProcessCmdOpen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;

     Ret = DISP_ExtOpen(*((HI_DRV_DISPLAY_E *)arg), pDispState, bUser);

    return Ret;
}

static HI_S32 DISPProcessCmdClose(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;

    Ret = DISP_CheckPara(*((HI_DRV_DISPLAY_E*)arg), pDispState);

    if (HI_SUCCESS == Ret)
    {
        Ret = DISP_ExtClose(*((HI_DRV_DISPLAY_E*)arg), pDispState, bUser);
    }
    else
    {
        Ret = HI_SUCCESS;
    }

    return Ret;
}

static HI_S32 DISPProcessCmdSetEnable(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ENABLE_S*  pDispEnable;

    pDispEnable = (DISP_ENABLE_S*)arg;

    Ret = DISP_CheckPara(pDispEnable->enDisp, pDispState);

    if (HI_SUCCESS == Ret)
    {
        Ret = DISP_ExternSetEnable(pDispEnable->enDisp, pDispEnable->bEnable);
    }

    return Ret;
}

static HI_S32 DISPProcessCmdGetEnable(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ENABLE_S*  pDispEnable;

    pDispEnable = (DISP_ENABLE_S*)arg;

    Ret = DISP_GetEnable(pDispEnable->enDisp, &pDispEnable->bEnable);

    return Ret;
}

static HI_S32 DISPProcessCmdAddIntf(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_SET_INTF_S*  pDispIntf;

    pDispIntf = (DISP_SET_INTF_S*)arg;

    Ret = DISP_AddIntf(pDispIntf->enDisp, &pDispIntf->stIntf);

    return Ret;
}

static HI_S32 DISPProcessCmdDelIntf(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_SET_INTF_S*  pDispIntf;

    pDispIntf = (DISP_SET_INTF_S*)arg;
    Ret = DISP_DelIntf(pDispIntf->enDisp, &pDispIntf->stIntf);

    return Ret;
}

static HI_S32 DISPProcessCmdSetFormat(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_FORMAT_S*  pDispFormat;

    pDispFormat = (DISP_FORMAT_S*)arg;

    Ret = DISP_SetFormat(pDispFormat->enDisp, pDispFormat->enStereo, pDispFormat->enFormat);

    return Ret;
}

static HI_S32 DISPProcessCmdGetFormat(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_FORMAT_S*  pDispFormat;

    pDispFormat = (DISP_FORMAT_S*)arg;

    Ret = DISP_GetFormat(pDispFormat->enDisp, &pDispFormat->enStereo, &pDispFormat->enFormat);

    return Ret;
}

static HI_S32 DISPProcessCmdSetREFirst(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_R_EYE_FIRST_S* pREFirst;

    pREFirst = (DISP_R_EYE_FIRST_S*)arg;

    Ret = DISP_SetRightEyeFirst(pREFirst->enDisp, pREFirst->bREFirst);

    return Ret;
}

static HI_S32 DISPProcessCmdSetVirtScreen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_VIRTSCREEN_S  pVirtScreen;
    pVirtScreen = *((DISP_VIRTSCREEN_S *)arg);

    Ret = DISP_SetVirtScreen(pVirtScreen.enDisp, pVirtScreen.stVirtScreen);

    return Ret;
}

static HI_S32 DISPProcessCmdGetVirtScreen(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_VIRTSCREEN_S  *pVirtScreen;
    pVirtScreen = (DISP_VIRTSCREEN_S *)arg;

    Ret = DISP_GetVirtScreen(pVirtScreen->enDisp, &pVirtScreen->stVirtScreen);

    return Ret;
}

static HI_S32 DISPProcessCmdSetScreenOFFSet(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_SCREENOFFSET_S  *pOffset;
    pOffset = (DISP_SCREENOFFSET_S *)arg;

    /*SD not support ,but return sucess*/
    if (HI_DRV_DISPLAY_0 == pOffset->enDisp)
    {
        return HI_SUCCESS;
    }

    Ret = DISP_SetScreenOffset(pOffset->enDisp, &pOffset->stScreenOffset);

    return Ret;
}

static HI_S32 DISPProcessCmdGetScreenOFFSet(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_SCREENOFFSET_S  *pOffset;
    pOffset = (DISP_SCREENOFFSET_S *)arg;

    Ret = DISP_GetScreenOffset(pOffset->enDisp, &pOffset->stScreenOffset);

    return Ret;
}

static HI_S32 DISPProcessCmdSetZorder(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ZORDER_S*  pDispZorder;

    pDispZorder = (DISP_ZORDER_S*)arg;

    Ret = DISP_SetLayerZorder(pDispZorder->enDisp, pDispZorder->Layer, pDispZorder->ZFlag);

    return Ret;
}

static HI_S32 DISPProcessCmdGetOrder(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ORDER_S    *pDispOrder;

    pDispOrder = (DISP_ORDER_S *)arg;

    Ret = DISP_GetLayerZorder(pDispOrder->enDisp, pDispOrder->Layer, &pDispOrder->Order);

    return Ret;
}

static HI_S32 DISPProcessCmdSetDevRatio(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ASPECT_RATIO_S* pDispAspectRatio;

    pDispAspectRatio = (DISP_ASPECT_RATIO_S*)arg;

    /*SD not support ,but return sucess*/
    if (HI_DRV_DISPLAY_0 == pDispAspectRatio->enDisp)
    {
        return HI_SUCCESS;
    }

    Ret = DISP_SetAspectRatio(pDispAspectRatio->enDisp, pDispAspectRatio->u32ARHori, pDispAspectRatio->u32ARVert);

    return Ret;
}

static HI_S32 DISPProcessCmdGetDevRatio(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ASPECT_RATIO_S* pDispAspectRatio;

    pDispAspectRatio = (DISP_ASPECT_RATIO_S*)arg;

    Ret = DISP_GetAspectRatio(pDispAspectRatio->enDisp, &pDispAspectRatio->u32ARHori, &pDispAspectRatio->u32ARVert);

    return Ret;
}

static HI_S32 DISPProcessCmdSetBGC(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_BGC_S* pDispBgc;

    pDispBgc = (DISP_BGC_S*)arg;

    /*SD not support ,but return sucess*/
    if (HI_DRV_DISPLAY_0 == pDispBgc->enDisp)
    {
        return HI_SUCCESS;
    }

    Ret = DISP_SetBGColor(pDispBgc->enDisp, &pDispBgc->stBgColor);

    return Ret;
}

static HI_S32 DISPProcessCmdGetBGC(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_BGC_S* pDispBgc;

    pDispBgc = (DISP_BGC_S*)arg;

    Ret = DISP_GetBGColor(pDispBgc->enDisp, &pDispBgc->stBgColor);

    return Ret;
}

static HI_S32 DISPProcessCmdCreateVBIChannel(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_VBI_CREATE_CHANNEL_S*  pstDispVbiCrtChanl;

    pstDispVbiCrtChanl = (DISP_VBI_CREATE_CHANNEL_S*)arg;

    /*if vbi already open , return failed*/
    if (pDispState->hVbi[HI_DRV_DISPLAY_0] == HI_TRUE)
    {
        return HI_ERR_DISP_INVALID_OPT;
    }

    Ret = DISP_CreateVBIChannel(pstDispVbiCrtChanl->enDisp,  &pstDispVbiCrtChanl->stCfg, &pstDispVbiCrtChanl->hVbi);

    if (HI_SUCCESS == Ret)
    {
        pDispState->hVbi[HI_DRV_DISPLAY_0] = HI_TRUE;
    }

    return Ret;
}

static HI_S32 DISPProcessCmdDestroyVBIChannel(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_HANDLE  *pnVbiHandle;

    pnVbiHandle = (HI_HANDLE *)arg;

    if (pDispState->hVbi[HI_DRV_DISPLAY_0] == HI_FALSE)
        return HI_ERR_DISP_INVALID_OPT;

    Ret = DISP_DestroyVBIChannel(*pnVbiHandle);

    if (HI_SUCCESS == Ret)
    {
        pDispState->hVbi[HI_DRV_DISPLAY_0] = HI_FALSE;
    }

    return Ret;
}

static HI_S32 DISPProcessCmdSendVBI(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_VBI_S  *pDispVbi;

    pDispVbi = (DISP_VBI_S *)arg;

    Ret = DISP_SendVbiData(pDispVbi->hVbi, &pDispVbi->stVbiData);

    return Ret;
}

static HI_S32 DISPProcessCmdSetWSS(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_WSS_S* pDispWss;

    pDispWss = (DISP_WSS_S*)arg;

    Ret = DISP_SetWss(pDispWss->enDisp, &pDispWss->WssData);

    return Ret;
}

static HI_S32 DISPProcessCmdSetMCRVSN(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_MCRVSN_S  *pDispMcrvsn;

    pDispMcrvsn = (DISP_MCRVSN_S *)arg;

    Ret = DISP_SetMacrovision(pDispMcrvsn->enDisp, pDispMcrvsn->eMcrvsn);

    return Ret;
}

static HI_S32 DISPProcessCmdGetMCRVSN(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_MCRVSN_S  *pDispMcrvsn;

    pDispMcrvsn = (DISP_MCRVSN_S *)arg;

    Ret = DISP_GetMacrovision(pDispMcrvsn->enDisp, &pDispMcrvsn->eMcrvsn);

    return Ret;
}

static HI_S32 DISPProcessCmdSetCGMS(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_CGMS_S  *pDispCgms;

    pDispCgms = (DISP_CGMS_S *)arg;

    Ret = DISP_SetCGMS(pDispCgms->enDisp, &pDispCgms->stCgmsCfg);

    return Ret;
}

static HI_S32 DISPProcessCmdSuspend(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    return DISP_Suspend();
}

static HI_S32 DISPProcessCmdResume(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    return DISP_Resume();
}

static HI_S32 DISPProcessCmdSetAlpha(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ALPHA_S* pstDispAlpha = (DISP_ALPHA_S*)arg;

    Ret = DISP_SetDispAlpha(pstDispAlpha->enDisp, pstDispAlpha->u32ALpha);

    return Ret;
}

static HI_S32 DISPProcessCmdGetAlpha(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_ALPHA_S* pstDispAlpha = (DISP_ALPHA_S*)arg;

    Ret = DISP_GetDispAlpha(pstDispAlpha->enDisp, &pstDispAlpha->u32ALpha);

    return Ret;
}

static HI_S32 DISPProcessCmdSetSinkCapability(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_SINK_CAPABILITY_S* pstDispSinkCap = (DISP_SINK_CAPABILITY_S*)arg;

    Ret = DISP_SetSinkCapability(pstDispSinkCap->enDisp, &pstDispSinkCap->stSinkCapability);
    return Ret;
}

static HI_S32 DISPProcessCmdGetOutputStatus(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32 Ret = HI_SUCCESS;
    DISP_OUTPUT_STATUS_S* pstDispOutputStatus = (DISP_OUTPUT_STATUS_S*)arg;

    Ret = DISP_GetOutputStatus(pstDispOutputStatus->enDisp, &pstDispOutputStatus->stOutputStatus);
    return Ret;
}

static HI_S32 DISPProcessCmdNoSupprot(HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_ERR_DISP("no supprot this cmd.\n");
    return HI_ERR_DISP_NOT_SUPPORT;
}



HI_S32 DRV_DISP_ProcessCmd(unsigned int cmd, HI_VOID* arg, DRV_DISP_STATE_S* pDispState, HI_BOOL bUser)
{
    HI_S32  Ret = -ENOIOCTLCMD;
    HI_U32  u32Index = 0;

    if ((HI_NULL == arg) || (HI_NULL == pDispState))
    {
        HI_FATAL_DISP("pass null ptr.\n");
        Ret = HI_ERR_DISP_NULL_PTR;
        return Ret;
    }

    for (u32Index = 0; (u32Index < sizeof(s_aDISPCmdFuncTab) / sizeof(stDISPProcessCmdFunc)); u32Index++)
    {
        if ((s_aDISPCmdFuncTab[u32Index].cmd == cmd)
             && (HI_NULL != s_aDISPCmdFuncTab[u32Index].pDISP_ProcessCmdFunc))
        {
            Ret = s_aDISPCmdFuncTab[u32Index].pDISP_ProcessCmdFunc(arg, pDispState, bUser);
            break;
        }
    }

    return Ret;
}

HI_S32 DRV_DISP_Init2(HI_VOID)
{
    atomic_set(&g_DispCount, 1);

    DRV_DISP_ProcInit();

    DRV_DISP_ProcAdd(HI_DRV_DISPLAY_0);
    DRV_DISP_ProcAdd(HI_DRV_DISPLAY_1);

    if (HI_SUCCESS == DISP_Init())
    {
        HI_DRV_DISP_Open(HI_DRV_DISPLAY_0);
        HI_DRV_DISP_Open(HI_DRV_DISPLAY_1);
    }

    return HI_SUCCESS;
}

HI_S32 DRV_DISP_DeInit2(HI_VOID)
{
    DRV_DISP_ProcDel(HI_DRV_DISPLAY_1);
    DRV_DISP_ProcDel(HI_DRV_DISPLAY_0);

    DRV_DISP_ProcDeInit();

    HI_DRV_DISP_Close(HI_DRV_DISPLAY_0);
    HI_DRV_DISP_Close(HI_DRV_DISPLAY_1);

    /* closing clock */
    DISP_DeInit();
    atomic_set(&g_DispCount, 0);
    return HI_SUCCESS;
}

static HI_S32 __init __attribute__((unused)) DRV_DISP_DelIntf(char *s)
{
    if (0 == HI_OSAL_Strncmp(s, "cvbs", strlen("cvbs")))
    {
        DISP_SetVdacControlFlag(HI_TRUE, HI_FALSE);
    }
    else if (0 == HI_OSAL_Strncmp(s, "ypbpr", strlen("ypbpr")))
    {
        DISP_SetVdacControlFlag(HI_FALSE, HI_TRUE);
    }
    else if (0 == HI_OSAL_Strncmp(s, "all", strlen("all")))
    {
        DISP_SetVdacControlFlag(HI_TRUE, HI_TRUE);
    }

    return HI_SUCCESS;
}

__setup("novdac=", DRV_DISP_DelIntf);


//may be delete
HI_S32 HI_DRV_DISP_Init(HI_VOID)
{
    HI_S32          Ret;

    Ret = down_interruptible(&g_DispMutex);
    if (HI_SUCCESS != Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed.\n");
        return HI_FAILURE;
    }

    if (1 == atomic_inc_return(&g_DispCount))
    {
        /* for configuration such as start clock, re-use pins, etc */
        Ret = DISP_Init();
        if (Ret != HI_SUCCESS)
        {
            HI_FATAL_DISP("call DISP_Init failed.\n");
            atomic_dec(&g_DispCount);
            up(&g_DispMutex);
            return HI_FAILURE;
        }
    }

    up(&g_DispMutex);
        Ret = DRV_DISP_Register();
    return Ret;
}

//HI_S32 HI_DRV_DISP_ModDeinit(HI_VOID)
HI_S32 HI_DRV_DISP_DeInit(HI_VOID)
{
    HI_S32 Ret;
    HI_DRV_DISPLAY_E u;

    Ret = down_interruptible(&g_DispMutex);
    if (HI_SUCCESS != Ret)
    {
        HI_FATAL_DISP("down g_DispMutex failed.\n");
        return HI_FAILURE;
    }

    for(u=0; u<HI_DRV_DISPLAY_BUTT; u++)
    {
        if (g_DispModState.bDispOpen[u])
        {
            HI_INFO_DISP("DISP_MOD_ExtClose HD0\n");
            Ret = DISP_ExtClose(u, &g_DispModState, HI_FALSE);
            if (Ret != HI_SUCCESS)
            {
                HI_FATAL_DISP("DISP_MOD_ExtClose Display %d failed!\n", u);
            }
        }
    }

    HI_INFO_DISP("HI_DRV_DISP_Deinit:atomic g_DispCount:%d\n", atomic_read(&g_DispCount));

    if (atomic_dec_and_test(&g_DispCount))
    {
        HI_INFO_DISP("close clock\n");

        /* closing clock */
        DISP_DeInit();
    }

    up(&g_DispMutex);
    return 0;
}

static DISP_EXPORT_FUNC_S s_stDispExportFuncs = {
    .pfnDispInit             = HI_DRV_DISP_Init            ,
    .pfnDispDeInit           = HI_DRV_DISP_DeInit          ,
    .pfnDispAttach           = HI_DRV_DISP_Attach          ,
    .pfnDispDetach           = HI_DRV_DISP_Detach          ,
    .pfnDispSetFormat        = HI_DRV_DISP_SetFormat       ,
    .pfnDispGetFormat        = HI_DRV_DISP_GetFormat       ,
    .pfnDispSetHDMI420       = HI_DRV_DISP_SetHDMI420      ,
    .pfnDispSetCustomTiming  = HI_DRV_DISP_SetCustomTiming ,
    .pfnDispGetCustomTiming  = HI_DRV_DISP_GetCustomTiming ,
    .pfnDispAddIntf          = HI_DRV_DISP_AddIntf         ,
    .pfnDispDeIntf           = HI_DRV_DISP_DelIntf         ,

    .pfnDispOpen             = HI_DRV_DISP_Open            ,
    .pfnDispClose            = HI_DRV_DISP_Close           ,
    .pfnDispSetEnable        = HI_DRV_DISP_SetEnable       ,
    .pfnDispGetEnable        = HI_DRV_DISP_GetEnable       ,
    .pfnDispSetRightEyeFirst = HI_DRV_DISP_SetRightEyeFirst,
    .pfnDispSetBgColor       = HI_DRV_DISP_SetBgColor      ,
    .pfnDispGetBgColor       = HI_DRV_DISP_GetBgColor      ,
    .pfnDispSetAspectRatio   = HI_DRV_DISP_SetAspectRatio  ,
    .pfnDispGetAspectRatio   = HI_DRV_DISP_GetAspectRatio  ,
    .pfnDispSetLayerZorder   = HI_DRV_DISP_SetLayerZorder  ,
    .pfnDispGetLayerZorder   = HI_DRV_DISP_GetLayerZorder  ,

    .pfnDispCreatCast        = HI_DRV_DISP_CreateCast      ,
    .pfnDispDestoryCast      = HI_DRV_DISP_DestroyCast     ,
    .pfnDispSetCastEnable    = HI_DRV_DISP_SetCastEnable   ,
    .pfnDispGetCastEnable    = HI_DRV_DISP_GetCastEnable   ,
    .pfnDispAcquireCastFrm   = HI_DRV_DISP_AcquireCastFrame,
    .pfnDispRlsCastFrm       = HI_DRV_DISP_ReleaseCastFrame,

    .pfnDispExtAttach        = HI_DRV_DISP_ExternlAttach,
    .pfnDispExtDeAttach      = HI_DRV_DISP_ExternlDetach,
    .pfnDispSetCastAttr      = HI_DRV_DISP_SetCastAttr,
    .pfnDispGetCastAttr      = HI_DRV_DISP_GetCastAttr,

    .pfnDispGetInitFlag      = HI_DRV_DISP_GetInitFlag     ,
    .pfnDispGetVersion       = HI_DRV_DISP_GetVersion      ,
    .pfnDispIsOpen           = HI_DRV_DISP_IsOpened        ,
    .pfnDispGetSlave         = HI_DRV_DISP_GetSlave        ,
    .pfnDispGetMaster        = HI_DRV_DISP_GetMaster       ,
    .pfnDispGetDispInfo      = HI_DRV_DISP_GetDisplayInfo  ,

    .pfnDispIoctl            = HI_DRV_DISP_Process,
    .pfnDispRegCallback      = HI_DRV_DISP_RegCallback,
    .pfnDispUnRegCallback    = HI_DRV_DISP_UnRegCallback,
    .pfnDispSuspend          = DRV_DISP_Suspend,
    .pfnDispResume           = DRV_DISP_Resume,
#if 0
    .pfnDispFreeLogoMem      = HI_DRV_DISP_FreeLogoMem,
    .pfnDispGetLogoInfor     = HI_DRV_DISP_GetLogoInfor,
#endif
};

HI_S32 DRV_DISP_Register(HI_VOID)
{
    HI_S32 Ret;

    // add for multiple process
    DISP_ResetCountStatus();
    //DRV_DISP_ProcInit();

    Ret = HI_DRV_MODULE_Register((HI_U32)HI_ID_DISP, "HI_DISP", (HI_VOID *)(&s_stDispExportFuncs));
    if (HI_SUCCESS != Ret)
    {
        HI_FATAL_DISP("HI_DRV_MODULE_Register DISP failed\n");
        return Ret;
    }

    return  0;
}

HI_VOID DRV_DISP_UnRegister(HI_VOID)
{
    HI_DRV_MODULE_UnRegister((HI_U32)HI_ID_DISP);
    //DRV_DISP_ProcDeInit();
    return;
}

EXPORT_SYMBOL(HI_DRV_DISP_SetFormat);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif
