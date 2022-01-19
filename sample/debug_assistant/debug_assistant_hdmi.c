#include <string.h>
#include <stdlib.h>
#include "hi_unf_disp.h"
#include "hi_unf_hdmi.h"
#include "debug_assistant_hdmi.h"

#define YES             "YES"
#define OK              "OK"

#define HPD             "HotPlug"
#define RSEN            "Rsen"
#define OE              "PhyOutputEnable"
#define PHYPOWER        "PhyPowerEnable"
#define TMDSMode        "TMDSMode"
#define TMDS_DVI        "DVI"
#define TMDS_HDMI14     "HDMI1.4"
#define TMDS_HDMI20     "HDMI2.0"
#define AVMUTE          "AvMute"

#define HDCPMODE        "HDCPMode"
#define HDCPKEY         "HDCP1.4KeyLoad"
#define HDCPENABLE      "HDCPEnable"
#define HDCPAUTH        "HDCPAuthStatus"
#define HDCP14          "HDCP1.4"
#define HDCP22          "HDCP2.2"

#define HTOTAL          "HsyncTotal"
#define VTOTAL          "VsyncTotal"
#define HACTIVE         "HactiveCnt"
#define VACTIVE         "VactiveCnt"

#define SSC             "EmiEnable"

#define DISPFMT         "DispFmt"
#define INCOLOR         "InColorSpace"
#define OUTCOLOR        "OutColorSpace"
#define AVICOLOR        "ColorSpace"
#define RGB             "RGB"
#define YCbCr444        "YCbCr444"
#define YCbCr422        "YCbCr422"
#define YCbCr420        "YCbCr420"
#define AVIENABLE       "AVIInfoEnable"
#define CSCENABLE       "bCscSaturate"

#define OUTBIT          "OutBitDepth"
#define OUT8BIT         "08"
#define OUT10BIT        "10"
#define OUT12BIT        "12"

#define MAXTMDSCLK      "MaxTMDSClock"
#define DEEPCOLORCAPS   "DeepColor"
#define RGB30BIT        "RGB_30Bit"
#define RGB36BIT        "RGB_36Bit"
#define YUVDEEPCOLOR    "YCbCr444_SameRGB"

#define VMUTE           "VideoMute"

#define AUDIOENABLE     "AudioEnable"
#define AUDINFOFRAMEEN  "AudioInfoEnable"
#define AOAPPENABLE     "AoAppEnable"
#define AOIFAPPENABLE   "AoIfAppEnable"
#define AODRVENABLE     "AoDrvEnable"
#define AOSELENABLE     "AoSelEnable"
#define SWCTS           "SwCts"

#define SOUNDINTF       "SoundIntf"
#define CODETYPE        "CodeType"
#define SAMPLEFREQ      "SampleFreq"
#define REFCTS          "Ref_CTS"
#define REGCTSSW        "Reg_CTS(SW)"
#define REGCTSHW        "Reg_CTS(HW)"
#define REFN            "Ref_N"
#define REGN            "Reg_N"
#define SOUNDINTF       "SoundIntf"
#define I2S             "I2S"
#define SPDIF           "SPDIF"
#define CODETYPE        "CodeType"
#define PCM             "L-PCM"
#define AC3             "AC3"
#define DTS             "DTS"

typedef enum hiHDMI_TMDS_MODE_E
{
    HDMI_TMDS_MODE_DVI,
    HDMI_TMDS_MODE_HDMI_1_4,
    HDMI_TMDS_MODE_HDMI_2_0,
    HDMI_TMDS_MODE_BUTT
}HDMI_TMDS_MODE_E;

typedef enum hiHDMI_AUDIO_SOUNDIF_E
{
    HDMI_AUDIO_SOUNDINTF_I2S,
    HDMI_AUDIO_SOUNDINTF_SPDIF,
    HDMI_AUDIO_SOUNDINTF_HBRA,
}HDMI_AUDIO_SOUNDIF_E;

typedef enum hiHDMI_AUDIO_CODETYPE_E
{
    HDMI_AUDIO_CODETYPE_PCM,
    HDMI_AUDIO_CODETYPE_AC3,
    HDMI_AUDIO_CODETYPE_DTS,
    HDMI_AUDIO_CODETYPE_EAC3,
}HDMI_AUDIO_CODETYPE_E;

typedef struct hiHDMI_HW_STATUS_S
{
    HI_BOOL                     bHpd;
    HI_BOOL                     bRsen;
    HI_BOOL                     bOE;
    HI_BOOL                     bPhyPower;
    HI_BOOL                     bAVIEnable;
    HI_BOOL                     bAvMute;
    HDMI_TMDS_MODE_E            enHdmiMode;
    HI_BOOL                     bVideoMute;

    HI_BOOL                     bCscEnable;

    HI_BOOL                     bAudioEnable;
    HI_BOOL                     bAudioIFEnable;
    HI_BOOL                     bAudioMute;
    HI_BOOL                     bAoAppEnable;
    HI_BOOL                     bAoIfAppEnable;
    HI_BOOL                     bAoDrvEnable;
    HI_BOOL                     bAoSelEnable;
    HI_U32                      u32RefCTS;
    HI_U32                      u32RegCTSSW;
    HI_U32                      u32RegCTSHW;
    HI_U32                      u32RefN;
    HI_U32                      u32RegN;
    HI_BOOL                     bSwCTS;
    HI_U32                      u32AudioInFreq;
    HI_U32                      u32AudioOutFreq;
    HDMI_AUDIO_SOUNDIF_E        enSoundIf;
    HDMI_AUDIO_CODETYPE_E       enCodeType;

    HI_UNF_HDMI_HDCP_VERSION_E  enHdcpMode;
    HI_BOOL                     bHdcpEnable;
    HI_BOOL                     bHdcpKeyLoad;
    HI_BOOL                     bHdcpAuthSucc;

    HI_BOOL                     bSscEnable;
}HDMI_HW_STATUS_S;

typedef struct hiHDMI_FMT_INFO_S
{
    HI_UNF_ENC_FMT_E            enFmt;
    HI_U32                      u32HTotal;
    HI_U32                      u32HActive;
    HI_U32                      u32VTotal;
    HI_U32                      u32VActive;
    HI_UNF_HDMI_VIDEO_MODE_E    enInColorSpace;
    HI_UNF_HDMI_VIDEO_MODE_E    enOutColorSpace;
    HI_UNF_HDMI_VIDEO_MODE_E    enAviColorSpace;
    HI_UNF_HDMI_DEEP_COLOR_E    enDeepColor;
    HI_U32                      u32PixClk;
    HI_U32                      u32TmdsClk;
}HDMI_FMT_INFO_S;

typedef struct hiHDMI_TIMING_INFO_S
{
    HI_UNF_ENC_FMT_E            enFmt;
    HI_U32                      u32PixClk;
    HI_U32                      u32HTotal;
    HI_U32                      u32VTotal;
    HI_U32                      u32HActive;
    HI_U32                      u32VActive;
    HI_CHAR                     *pFmt;
}HDMI_TIMING_INFO_S;

typedef struct hiDEBUG_HDMI_INFO_S
{
    HDMI_HW_STATUS_S         stHwStatus;
    HDMI_FMT_INFO_S          stFmtInfo;
    HI_UNF_EDID_BASE_INFO_S  stSinkCaps;

}DEBUG_HDMI_INFO_S;

DEBUG_HDMI_INFO_S stHdmiInfo;

#define MAX_TIMING_IDX          12
HDMI_TIMING_INFO_S stTimingInfo[MAX_TIMING_IDX] =
{
    {HI_UNF_ENC_FMT_1080P_60,          148500, 2200, 1125, 1920, 1080, (HI_CHAR *)"1080P@60" },
    {HI_UNF_ENC_FMT_1080P_50,          148500, 2640, 1125, 1920, 1080, (HI_CHAR *)"1080P@50" },
    {HI_UNF_ENC_FMT_1080i_60,          74250 , 2200, 563 , 1920, 540, (HI_CHAR *)"1080I@60" },
    {HI_UNF_ENC_FMT_1080i_50,          74250 , 2640, 563 , 1920, 540, (HI_CHAR *)"1080I@50" },
    {HI_UNF_ENC_FMT_1080P_30,          74250 , 2200, 1125, 1920, 1080, (HI_CHAR *)"1080P@30" },

    {HI_UNF_ENC_FMT_720P_60,           74250 , 1650, 750 , 1280, 720 , (HI_CHAR *)"720P@60"   },
    {HI_UNF_ENC_FMT_720P_50,           74250 , 1980, 750 , 1280, 720 , (HI_CHAR *)"720P@50"   },
    {HI_UNF_ENC_FMT_576P_50,           27000 , 864 , 625 , 720 , 576 , (HI_CHAR *)"576P@50"   },
    {HI_UNF_ENC_FMT_480P_60,           27000 , 858 , 525 , 720 , 480 , (HI_CHAR *)"480P@60"   },
    {HI_UNF_ENC_FMT_PAL,               26948 , 1728, 313 , 1440, 288 , (HI_CHAR *)"PAL"     },
    {HI_UNF_ENC_FMT_NTSC,              26948 , 1716, 263 , 1440, 240 , (HI_CHAR *)"NTSC"    },
    {HI_UNF_ENC_FMT_861D_640X480_60,   25200 , 800 , 525 , 640 , 480 , (HI_CHAR *)"640x480@60"},
};

static HI_S32 HdmiTimingCheck(HI_VOID)
{
    HI_U8 i = 0;

    for (i = 0; i < MAX_TIMING_IDX; i++)
    {
        if (stHdmiInfo.stFmtInfo.enFmt == stTimingInfo[i].enFmt)
        {
            if (   stHdmiInfo.stFmtInfo.u32HTotal  != stTimingInfo[i].u32HTotal
                || stHdmiInfo.stFmtInfo.u32HActive != stTimingInfo[i].u32HActive
                || stHdmiInfo.stFmtInfo.u32VActive != stTimingInfo[i].u32VActive
                || (abs(stTimingInfo[i].u32VTotal - stHdmiInfo.stFmtInfo.u32VTotal) > 2))
            {
                assistant_printf_ext("Fmt[%s][%u-%u-%u-%u].\n", stTimingInfo[i].pFmt,
                                                                stTimingInfo[i].u32HTotal,
                                                                stTimingInfo[i].u32HActive,
                                                                stTimingInfo[i].u32VTotal,
                                                                stTimingInfo[i].u32VActive);

                assistant_printf_ext("HW detected timing unstable.\n");
                return HI_FAILURE;
            }

            assistant_printf_ext("check timing: %s\n", OK);
            return HI_SUCCESS;
        }
    }

    assistant_printf_ext("Timing check failed, can't find this fmt:%u.\n", stHdmiInfo.stFmtInfo.enFmt);

    return HI_FAILURE;
}

static HI_S32 HdmiTransCapsCheck(HI_VOID)
{
    if (stHdmiInfo.stFmtInfo.u32TmdsClk > stHdmiInfo.stSinkCaps.u32MaxTMDSClock * 1000)
    {
        assistant_printf_ext("The current output(%u) exceeds the maximum TV capability(%u).",
                                             stHdmiInfo.stFmtInfo.u32TmdsClk / 1000,
                                             stHdmiInfo.stSinkCaps.u32MaxTMDSClock);
        return HI_FAILURE;
    }

    if (HI_UNF_HDMI_DEEP_COLOR_30BIT == stHdmiInfo.stFmtInfo.enDeepColor)
    {
        if (HI_FALSE == stHdmiInfo.stSinkCaps.stDeepColor.bDeepColor30Bit)
        {
            assistant_printf("sink is not support 10bit\n");
            return HI_FAILURE;
        }
    }

    if (HI_UNF_HDMI_DEEP_COLOR_36BIT == stHdmiInfo.stFmtInfo.enDeepColor)
    {
        if (HI_FALSE == stHdmiInfo.stSinkCaps.stDeepColor.bDeepColor36Bit)
        {
            assistant_printf("sink is not support 12bit\n");
            return HI_FAILURE;
        }
    }

    if (   HI_UNF_HDMI_DEEP_COLOR_30BIT == stHdmiInfo.stFmtInfo.enDeepColor
        || HI_UNF_HDMI_DEEP_COLOR_36BIT == stHdmiInfo.stFmtInfo.enDeepColor)
    {
        if (HI_FALSE == stHdmiInfo.stSinkCaps.stDeepColor.bDeepColorY444)
        {
            assistant_printf("sink is not support YUV deepcolor!\n");
            return HI_FAILURE;
        }
    }

    assistant_printf_ext("check maximum transmission capacity: %s\n", OK);

    return HI_SUCCESS;
}

static HI_S32 HdmiTmdsClkCal(HI_VOID)
{
    HI_U32 u32TmdsClk = stHdmiInfo.stFmtInfo.u32PixClk;

    if (HI_UNF_HDMI_DEEP_COLOR_30BIT == stHdmiInfo.stFmtInfo.enDeepColor)
    {
        u32TmdsClk *= 5;
        u32TmdsClk /= 4;
    }
    else if (HI_UNF_HDMI_DEEP_COLOR_36BIT == stHdmiInfo.stFmtInfo.enDeepColor)
    {
        u32TmdsClk *= 3;
        u32TmdsClk /= 2;
    }

    stHdmiInfo.stFmtInfo.u32TmdsClk = u32TmdsClk;

    return HI_SUCCESS;
}

static HI_S32 HdmiTimingFind(HI_CHAR *pTiming)
{
    HI_U8 i = 0;

    if (HI_NULL == pTiming)
    {
        return HI_FAILURE;
    }

    stHdmiInfo.stFmtInfo.enFmt = HI_UNF_ENC_FMT_BUTT;

    for (i = 0; i < MAX_TIMING_IDX; i++)
    {
        if (0 == strncasecmp(pTiming, stTimingInfo[i].pFmt, strlen(pTiming)))
        {
            stHdmiInfo.stFmtInfo.enFmt = stTimingInfo[i].enFmt;
            stHdmiInfo.stFmtInfo.u32PixClk = stTimingInfo[i].u32PixClk;
            return HI_SUCCESS;
        }
    }

    assistant_printf_ext("can not find this fmt:%s\n", pTiming);

    return HI_FAILURE;
}

static HI_S32 HdmiColorSpaceFind(HI_CHAR *pColorSpace, HI_UNF_HDMI_VIDEO_MODE_E *penVideoMode)
{
    if (HI_NULL == pColorSpace || HI_NULL == penVideoMode)
    {
        return HI_FAILURE;
    }

    if (0 == strncasecmp(pColorSpace, RGB, strlen(pColorSpace)))
    {
        return HI_SUCCESS;
    }

    if (0 == strncasecmp(pColorSpace, YCbCr444, strlen(pColorSpace)))
    {
        return HI_SUCCESS;
    }

    if (0 == strncasecmp(pColorSpace, YCbCr422, strlen(pColorSpace)))
    {
        return HI_SUCCESS;
    }

    if (0 == strncasecmp(pColorSpace, YCbCr420, strlen(pColorSpace)))
    {
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

static HI_S32 HdmiDeepColorFind(HI_CHAR *pDeepColor)
{
    if (HI_NULL == pDeepColor)
    {
        return HI_FAILURE;
    }

    if (0 == strncasecmp(pDeepColor, OUT8BIT, strlen(pDeepColor)))
    {
        stHdmiInfo.stFmtInfo.enDeepColor = HI_UNF_HDMI_DEEP_COLOR_24BIT;
        return HI_SUCCESS;
    }

    if (0 == strncasecmp(pDeepColor, OUT10BIT, strlen(pDeepColor)))
    {
        stHdmiInfo.stFmtInfo.enDeepColor = HI_UNF_HDMI_DEEP_COLOR_30BIT;
        return HI_SUCCESS;
    }

    if (0 == strncasecmp(pDeepColor, OUT12BIT, strlen(pDeepColor)))
    {
        stHdmiInfo.stFmtInfo.enDeepColor = HI_UNF_HDMI_DEEP_COLOR_36BIT;
        return HI_SUCCESS;
    }

    return HI_FAILURE;
}


HI_VOID HdmiInit(HI_VOID)
{
    memset(&stHdmiInfo, 0, sizeof(DEBUG_HDMI_INFO_S));

    return ;
}

static HI_S32 FindString(const HI_CHAR *pField, HI_CHAR *pVlaue)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_U32 u32Pos = 0;
    HI_CHAR *pPtr = 0;

    if (HI_NULL == pField || HI_NULL == pVlaue)
    {
        return s32Ret;
    }

//    assistant_printf_ext("find %s, u32Len:%d\n", pField, u32Len);
    pPtr = pVlaue;

    while(u32Pos < u32Len)
    {
        if (0 == strncasecmp(pField, pszBuf + u32Pos, strlen(pField)))
        {
            u32Pos += strlen(pField);

            /* Find ':' */
            while ((':' != pszBuf[u32Pos]) && (u32Pos < u32Len))
            {
                u32Pos++;
            }

            u32Pos += 2;

            /* copy value */
            while(' ' != pszBuf[u32Pos])
            {
                *pPtr++ = pszBuf[u32Pos];
                u32Pos++;
            }

            *pPtr = '\0';

            s32Ret = HI_SUCCESS;

            goto RETURN;
        }
        else
        {
            u32Pos++;
        }
    }

RETURN:

//    assistant_printf_ext("value:%s\n", pVlaue);

    return s32Ret;
}

static HI_BOOL CheckValue(const HI_CHAR *pValue, HI_CHAR *pExp)
{
    if (HI_NULL == pValue || HI_NULL == pExp)
    {
        assistant_printf("null pointer!\n");
        return HI_FALSE;
    }

    if (0 == strncasecmp(pValue, pExp, strlen(pValue)))
    {
        return HI_TRUE;
    }

    return HI_FALSE;
}

static HI_S32 HdmiCheckYesOrNo(const HI_CHAR *pString, HI_BOOL *pbRet)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_CHAR cValue[32] = {0};

    if (HI_NULL == pString || HI_NULL == pbRet)
    {
        return HI_FAILURE;
    }

    s32Ret = FindString(pString, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        if (HI_TRUE == CheckValue(cValue, YES))
        {
            *pbRet = HI_TRUE;
            return HI_SUCCESS;
        }
    }

    *pbRet = HI_FALSE;

    return s32Ret;
}

static HI_U32 HdmiStringToU32(const HI_CHAR *pString, HI_U32 *pu32Data)
{
    HI_S32 s32Ret = HI_FAILURE;
    HI_CHAR cValue[32] = {0};

    if (HI_NULL == pString || HI_NULL == pu32Data)
    {
        return HI_FAILURE;
    }

    s32Ret = FindString(pString, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        *pu32Data = (HI_U32)atoi(cValue);
    }

    return HI_SUCCESS;
}

static HI_S32 FindAudioSampleFreq(HI_VOID)
{
    HI_U32 u32Pos = 0;
    HI_CHAR cValue[16] = {0};
    HI_CHAR *pPtr = cValue;
    HI_U8  u8Count = 0;

    while(u32Pos < u32Len)
    {
        if (0 == strncasecmp(SAMPLEFREQ, pszBuf + u32Pos, strlen(SAMPLEFREQ)))
        {
            u32Pos += strlen(SAMPLEFREQ);

            /* Find ':' */
            while ((':' != pszBuf[u32Pos]) && (u32Pos < u32Len))
            {
                u32Pos++;
            }

            u32Pos += 2;

            /* copy value */
            while(' ' != pszBuf[u32Pos])
            {
                *pPtr++ = pszBuf[u32Pos];
                u32Pos++;
            }

            *pPtr = '\0';

            if (0 == u8Count)
            {
                stHdmiInfo.stHwStatus.u32AudioInFreq = (HI_U32)atoi(cValue);
            }
            else if (2 == u8Count)
            {
                stHdmiInfo.stHwStatus.u32AudioOutFreq = (HI_U32)atoi(cValue);
                return HI_SUCCESS;
            }

            u8Count++;

            memset(cValue, 0, sizeof(cValue));
            pPtr = cValue;
        }

        u32Pos++;
    }

    assistant_printf("can not find audio sample freq!\n");

    return HI_FAILURE;
}

static HI_S32 FindAudioSoundIntf()
{
    HI_CHAR cValue[16] = {0};
    HI_S32  s32Ret = HI_SUCCESS;

    s32Ret = FindString(SOUNDINTF, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        if (0 == strncasecmp(I2S, cValue, strlen(cValue)))
        {
            stHdmiInfo.stHwStatus.enSoundIf = HDMI_AUDIO_SOUNDINTF_I2S;
        }
        else if (0 == strncasecmp(SPDIF, cValue, strlen(cValue)))
        {
            stHdmiInfo.stHwStatus.enSoundIf = HDMI_AUDIO_SOUNDINTF_SPDIF;
        }

        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

static HI_S32 FindAudioCodeType()
{
    HI_CHAR cValue[16] = {0};
    HI_S32  s32Ret = HI_SUCCESS;

    s32Ret = FindString(CODETYPE, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        if (0 == strncasecmp(PCM, cValue, strlen(cValue)))
        {
            stHdmiInfo.stHwStatus.enSoundIf = HDMI_AUDIO_CODETYPE_PCM;
        }
        else if (0 == strncasecmp(AC3, cValue, strlen(cValue)))
        {
            stHdmiInfo.stHwStatus.enSoundIf = HDMI_AUDIO_CODETYPE_AC3;
        }
        else if (0 == strncasecmp(DTS, cValue, strlen(cValue)))
        {
            stHdmiInfo.stHwStatus.enSoundIf = HDMI_AUDIO_CODETYPE_DTS;
        }

        return HI_SUCCESS;
    }

    return HI_FAILURE;
}

static HI_S32 HdmiStatusGet(HI_VOID)
{
    HI_CHAR cValue[32]       = {0};
    HI_S32  s32Ret           = HI_FAILURE;
    HI_UNF_EDID_BASE_INFO_S *pstSinkCaps = HI_NULL;
    HI_UNF_HDMI_OPEN_PARA_S stOpen;

    memset(cValue, 0, sizeof(cValue));

    pstSinkCaps = &stHdmiInfo.stSinkCaps;

    assistant_printf("HDMI output status analysing...\n");

    ReadProc("/proc/msp/hdmi0");
    /* hardware status get */

    /* check hotplug */
    HdmiCheckYesOrNo(HPD, &stHdmiInfo.stHwStatus.bHpd);
    /* check Rsen */
    HdmiCheckYesOrNo(RSEN, &stHdmiInfo.stHwStatus.bRsen);
    /* check OE */
    HdmiCheckYesOrNo(OE, &stHdmiInfo.stHwStatus.bOE);
    /* check phy power */
    HdmiCheckYesOrNo(PHYPOWER, &stHdmiInfo.stHwStatus.bPhyPower);

    /* check TMDS mode */
    s32Ret = FindString(TMDSMode, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        if (HI_TRUE == CheckValue(cValue, TMDS_DVI))
        {
            stHdmiInfo.stHwStatus.enHdmiMode = HDMI_TMDS_MODE_DVI;
        }

        if (HI_TRUE == CheckValue(cValue, TMDS_HDMI14))
        {
            stHdmiInfo.stHwStatus.enHdmiMode = HDMI_TMDS_MODE_HDMI_1_4;
        }

        if (HI_TRUE == CheckValue(cValue, TMDS_HDMI20))
        {
            stHdmiInfo.stHwStatus.enHdmiMode = HDMI_TMDS_MODE_HDMI_2_0;
        }
    }

    memset(cValue, 0, sizeof(cValue));

    /* HDCP status */
    s32Ret = FindString(HDCPMODE, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        if (HI_TRUE == CheckValue(cValue, HDCP14))
        {
            stHdmiInfo.stHwStatus.enHdcpMode = HI_UNF_HDMI_HDCP_VERSION_HDCP14;
        }
        else if (HI_TRUE == CheckValue(cValue, HDCP22))
        {
            stHdmiInfo.stHwStatus.enHdcpMode = HI_UNF_HDMI_HDCP_VERSION_HDCP22;
        }
    }

    memset(cValue, 0, sizeof(cValue));

    HdmiCheckYesOrNo(HDCPKEY,    &stHdmiInfo.stHwStatus.bHdcpKeyLoad);
    HdmiCheckYesOrNo(HDCPENABLE, &stHdmiInfo.stHwStatus.bHdcpEnable);
    HdmiCheckYesOrNo(HDCPAUTH,   &stHdmiInfo.stHwStatus.bHdcpAuthSucc);
    HdmiCheckYesOrNo(AVMUTE,     &stHdmiInfo.stHwStatus.bAvMute);

    /* timing */
    HdmiStringToU32(HTOTAL,  &stHdmiInfo.stFmtInfo.u32HTotal);
    HdmiStringToU32(HACTIVE, &stHdmiInfo.stFmtInfo.u32HActive);
    HdmiStringToU32(VTOTAL,  &stHdmiInfo.stFmtInfo.u32VTotal);
    HdmiStringToU32(VACTIVE, &stHdmiInfo.stFmtInfo.u32VActive);

    /* emi status */
    HdmiCheckYesOrNo(SSC, &stHdmiInfo.stHwStatus.bSscEnable);

    ReadProc("/proc/msp/hdmi0_vo");

    s32Ret = FindString(DISPFMT, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        HdmiTimingFind(cValue);
    }

    memset(cValue, 0, sizeof(cValue));

    s32Ret = FindString(OUTCOLOR, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        s32Ret = HdmiColorSpaceFind(cValue, &stHdmiInfo.stFmtInfo.enOutColorSpace);
        if (HI_SUCCESS != s32Ret)
        {
            assistant_printf_ext("Can't find OUTCOLOR: %s\n", cValue);
        }
    }

    memset(cValue, 0, sizeof(cValue));

    s32Ret = FindString(INCOLOR, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        s32Ret = HdmiColorSpaceFind(cValue, &stHdmiInfo.stFmtInfo.enInColorSpace);
        if (HI_SUCCESS != s32Ret)
        {
            assistant_printf_ext("Can't find INCOLOR: %s\n", cValue);
        }
    }

    memset(cValue, 0, sizeof(cValue));

    s32Ret = FindString(AVICOLOR, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        s32Ret = HdmiColorSpaceFind(cValue, &stHdmiInfo.stFmtInfo.enAviColorSpace);
        if (HI_SUCCESS != s32Ret)
        {
            assistant_printf_ext("Can't find AVICOLOR: %s\n", cValue);
        }
    }

    memset(cValue, 0, sizeof(cValue));

    HdmiCheckYesOrNo(AVIENABLE, &stHdmiInfo.stHwStatus.bAVIEnable);

    s32Ret = FindString(OUTBIT, cValue);
    if (HI_SUCCESS == s32Ret)
    {
        HdmiDeepColorFind(cValue);
    }

    HdmiCheckYesOrNo(VMUTE,     &stHdmiInfo.stHwStatus.bVideoMute);
    HdmiCheckYesOrNo(CSCENABLE, &stHdmiInfo.stHwStatus.bCscEnable);

    ReadProc("/proc/msp/hdmi0_ao");

    HdmiCheckYesOrNo(AUDIOENABLE,    &stHdmiInfo.stHwStatus.bAudioEnable);
    HdmiCheckYesOrNo(AUDINFOFRAMEEN, &stHdmiInfo.stHwStatus.bAudioIFEnable);
    HdmiCheckYesOrNo(AOAPPENABLE,    &stHdmiInfo.stHwStatus.bAoAppEnable);
    HdmiCheckYesOrNo(AOIFAPPENABLE,  &stHdmiInfo.stHwStatus.bAoIfAppEnable);
    HdmiCheckYesOrNo(AODRVENABLE,    &stHdmiInfo.stHwStatus.bAoDrvEnable);
    HdmiCheckYesOrNo(AOSELENABLE,    &stHdmiInfo.stHwStatus.bAoSelEnable);
    HdmiCheckYesOrNo(SWCTS,          &stHdmiInfo.stHwStatus.bSwCTS);

    HdmiStringToU32(REFCTS,          &stHdmiInfo.stHwStatus.u32RefCTS);
    HdmiStringToU32(REGCTSSW,        &stHdmiInfo.stHwStatus.u32RegCTSSW);
    HdmiStringToU32(REGCTSHW,        &stHdmiInfo.stHwStatus.u32RegCTSHW);
    HdmiStringToU32(REFN,            &stHdmiInfo.stHwStatus.u32RefN);
    HdmiStringToU32(REGN,            &stHdmiInfo.stHwStatus.u32RegN);

    FindAudioSampleFreq();
    FindAudioSoundIntf();
    FindAudioCodeType();

    ReadProc("/proc/msp/hdmi0_sink");

    HI_UNF_HDMI_Init();
    stOpen.enDefaultMode = HI_UNF_HDMI_DEFAULT_ACTION_HDMI;
    HI_UNF_HDMI_Open(HI_UNF_HDMI_ID_0, &stOpen);
    HI_UNF_HDMI_GetSinkCapability(HI_UNF_HDMI_ID_0, pstSinkCaps);
    HI_UNF_HDMI_Close(HI_UNF_HDMI_ID_0);
    HI_UNF_HDMI_DeInit();


    HdmiTmdsClkCal();

    return HI_SUCCESS;
}

static HI_VOID HdmiLogEnable(HI_BOOL bEnable)
{
    if (HI_TRUE == bEnable)
    {
        WriteProc("echo HI_HDMI=4 > /proc/msp/log");
    }
    else
    {
        WriteProc("echo HI_HDMI=1 > /proc/msp/log");
    }

    return ;
}

static HI_S32 HdmiSscCheck(HI_VOID)
{
    HI_CHAR cInput = 0;

    if (HI_TRUE == stHdmiInfo.stHwStatus.bSscEnable)
    {
        WriteProc("echo emi 0 > /proc/msp/hdmi0");
        Wait(3);
        assistant_printf("disable SSC(Spread Spectrum Clocking), TV is normally display? [y/n].\n");
        cInput = getchar();
        if ('y' == cInput || 'Y' == cInput)
        {
            assistant_printf("SSC problem.\n");
            return HI_FAILURE;
        }
    }

    assistant_printf_ext("check SSC: %s\n", OK);

    return HI_SUCCESS;
}


static HI_VOID HdmiNoSignal(HI_VOID)
{
    HI_S32  s32Ret = HI_SUCCESS;
    HI_CHAR cInput = 0;

    if (HI_FALSE == stHdmiInfo.stHwStatus.bHpd)
    {
        assistant_printf("No hotplug, maybe HDMI cable is loose. Please re-connect the cable and confirm that the voltage of HPD pin and +5V pin is higher than 2.4V.\n");
        return ;
    }

    assistant_printf_ext("check HPD: %s\n", OK);

    if (HI_FALSE == stHdmiInfo.stHwStatus.bRsen)
    {
        assistant_printf("No Rsen.\n");
        return ;
    }

    assistant_printf_ext("check Rsen: %s\n", OK);

    if (HI_FALSE == stHdmiInfo.stHwStatus.bOE)
    {
        assistant_printf("OE not enable.\n");
        return ;
    }

    assistant_printf_ext("check OE: %s\n", OK);

    if (HI_FALSE == stHdmiInfo.stHwStatus.bPhyPower)
    {
        assistant_printf("phy power not enable. please duplicate this issue. Wait 60 seconds.\n");
        HdmiLogEnable(HI_TRUE);

        Wait(60);
        return ;
    }

    assistant_printf_ext("check phy power: %s\n", OK);

    s32Ret = HdmiTimingCheck();
    if (HI_SUCCESS != s32Ret)
    {
        return ;
    }

    /* Maximum transmission capacity check */
    s32Ret = HdmiTransCapsCheck();
    if (HI_SUCCESS != s32Ret)
    {
        return ;
    }

    /* check ssc */
    if (HI_FAILURE == HdmiSscCheck())
    {
        return ;
    }

    /* maybe HDCP effects */
    if (HI_TRUE == stHdmiInfo.stHwStatus.bHdcpEnable)
    {
        if (HI_FALSE == stHdmiInfo.stHwStatus.bHdcpAuthSucc)
        {
            assistant_printf("HDCP enable, but authentication not success.\n");
            HdmiLogEnable(HI_TRUE);
            WriteProc("echo hdcp14 0 > /proc/msp/hdmi0");
            WriteProc("echo hdcp14 1 > /proc/msp/hdmi0");
            Wait(10);
            assistant_printf("re-start HDCP1.4, TV is normally display? [y/n].\n");
            cInput = getchar();
            if ('y' == cInput || 'Y' == cInput)
            {
                assistant_printf("The HDCP is abnormal.\n");
                return;
            }
            HdmiLogEnable(HI_FALSE);
        }

        assistant_printf("disable hdcp...\n");

        WriteProc("echo hdcp14 0 > /proc/msp/hdmi0");

        Wait(10);
        assistant_printf("TV is normally display? [y/n].\n");
        cInput = getchar();
        if ('y' == cInput || 'Y' == cInput)
        {
            assistant_printf("The HDCP is abnormal.\n");
            return;
        }
    }

    assistant_printf_ext("check HDCP: %s\n", OK);

    HdmiLogEnable(HI_TRUE);
    WriteProc("echo cmd 0 > /proc/msp/hdmi0");
    Wait(1);
    WriteProc("echo cmd 1 > /proc/msp/hdmi0");
    Wait(10);
    assistant_printf("TV is normally display? [y/n].\n");
    HdmiLogEnable(HI_FALSE);
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("re-start HDMI OK.\n");
        return;
    }

    return ;
}


static HI_S32 HdmiColorbarCheck(HI_VOID)
{
    HI_CHAR cInput = 0;

    WriteProc("echo cbar 1 > /proc/msp/hdmi0");
    assistant_printf("Enable colorbar, TV is normally display? [y/n].\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("No error on HDMI, please check other module.\n");
        WriteProc("echo cbar 0 > /proc/msp/hdmi0");

        return HI_FAILURE;
    }

    WriteProc("echo cbar 0 > /proc/msp/hdmi0");
    assistant_printf_ext("check Color Bar: %s\n", OK);

    return HI_SUCCESS;
}

static HI_VOID HdmiDisplayAbnormal(HI_VOID)
{
    HI_CHAR cInput = 0;

    /* check colorbar */
    if (HI_FAILURE == HdmiColorbarCheck())
    {
        return ;
    }

    /* check video mute */
    if (HI_TRUE == stHdmiInfo.stHwStatus.bVideoMute)
    {
        assistant_printf("Video has been mute.\n");
        WriteProc("echo vmute 0 > /proc/msp/hdmi0");
        assistant_printf("Disable video mute, TV is normally display? [y/n].\n");
        cInput = getchar();
        if ('y' == cInput || 'Y' == cInput)
        {
            assistant_printf("Please duplicate this issue, wait 30 seconds.\n");
            HdmiLogEnable(HI_TRUE);
            Wait(30);
            HdmiLogEnable(HI_FALSE);
        }

        return ;
    }

    assistant_printf_ext("check video mute: %s\n", OK);

    /* check avmute */
    if (HI_TRUE == stHdmiInfo.stHwStatus.bAvMute)
    {
        assistant_printf("TV's video and audio has been mute.\n");
        WriteProc("echo avmute 0 > /proc/msp/hdmi0");
        assistant_printf("Disable avmute, TV is normally display? [y/n].\n");
        cInput = getchar();
        if ('y' == cInput || 'Y' == cInput)
        {
            assistant_printf("Please duplicate this issue, wait 30 seconds.\n");
            HdmiLogEnable(HI_TRUE);
            Wait(30);
            HdmiLogEnable(HI_FALSE);
        }

        return ;
    }

    assistant_printf_ext("check avmute: %s\n", OK);

    /* check HDCP */
    if (HI_TRUE == stHdmiInfo.stHwStatus.bHdcpEnable)
    {
        WriteProc("echo hdcp14 0 > /proc/msp/hdmi0");
        assistant_printf("Disable HDCP, TV is normally display? [y/n].\n");
        cInput = getchar();
        if ('y' == cInput || 'Y' == cInput)
        {
            assistant_printf("An error occurs on the TV when HDCP is enabled.\n");
            return;
        }
    }

    assistant_printf_ext("check HDCP: %s\n", OK);

    /* check ssc */
    if (HI_FAILURE == HdmiSscCheck())
    {
        return ;
    }

    /* check csc */
    if (stHdmiInfo.stFmtInfo.enInColorSpace != stHdmiInfo.stFmtInfo.enOutColorSpace)
    {
        if (HI_FALSE == stHdmiInfo.stHwStatus.bCscEnable)
        {
            if (HI_UNF_HDMI_VIDEO_MODE_RGB444 == stHdmiInfo.stFmtInfo.enInColorSpace)
            {
                WriteProc("echo outclrspace 0 > /proc/msp/hdmi0");
            }
            else if (HI_UNF_HDMI_VIDEO_MODE_YCBCR444 == stHdmiInfo.stFmtInfo.enInColorSpace)
            {
                WriteProc("echo outclrspace 2 > /proc/msp/hdmi0");
            }

            assistant_printf("change output colorspace, TV is normally display? [y/n].\n");
            cInput = getchar();
            if ('y' == cInput || 'Y' == cInput)
            {
                assistant_printf_ext("CSC not enable, colorspace in(%d)-out(%d).\n",
                    stHdmiInfo.stFmtInfo.enInColorSpace,
                    stHdmiInfo.stFmtInfo.enOutColorSpace);
            }

            assistant_printf("CSC not enable, please duplicate this issue. wait 20 seconds and record the log.\n");
            HdmiLogEnable(HI_TRUE);
            Wait(20);
            HdmiLogEnable(HI_FALSE);

            return ;
        }
    }

    if (HDMI_TMDS_MODE_HDMI_1_4 == stHdmiInfo.stHwStatus.enHdmiMode)
    {
        if (HI_FALSE == stHdmiInfo.stHwStatus.bAVIEnable)
        {
            assistant_printf("AVI not enable, please duplicate this issue. wait 20 seconds and record the log.\n");
            HdmiLogEnable(HI_TRUE);
            Wait(20);
            HdmiLogEnable(HI_FALSE);

            return ;
        }

        if (stHdmiInfo.stFmtInfo.enOutColorSpace != stHdmiInfo.stFmtInfo.enAviColorSpace)
        {
            assistant_printf_ext("output colorspace(%d) is not equal avi colorspace(%d).\n",
                                stHdmiInfo.stFmtInfo.enOutColorSpace,
                                stHdmiInfo.stFmtInfo.enAviColorSpace);
            return ;
        }
    }

    if (HDMI_TMDS_MODE_DVI == stHdmiInfo.stHwStatus.enHdmiMode)
    {
        if (HI_UNF_HDMI_VIDEO_MODE_RGB444 != stHdmiInfo.stFmtInfo.enOutColorSpace)
        {
            assistant_printf("DVI mode, output colorspace is not RGB.\n");
            WriteProc("echo outclrspace 0 > /proc/msp/hdmi0");
            assistant_printf("change output colorspace to RGB, TV is normally display? [y/n].\n");
            cInput = getchar();
            if ('y' == cInput || 'Y' == cInput)
            {
                assistant_printf(".");
            }

            assistant_printf("please duplicate this issue. wait 30 seconds and record the log.");
            HdmiLogEnable(HI_TRUE);
            Wait(30);
            HdmiLogEnable(HI_FALSE);

            return;
        }
    }


    /* check TV */
    WriteProc("echo thread 0 > /proc/msp/hdmi0");
    assistant_printf("please plug out and plug in HDMI cable. TV is normally display? [y/n].\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("maybe TV has some trouble.\n");

        return ;
    }

    assistant_printf("please plug out HDMI cable and plug in another TV. TV is normally display? [y/n].\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("maybe TV has some trouble.\n");

        return ;
    }

    assistant_printf_ext("check TV: %s\n", OK);

    WriteProc("echo thread 1 > /proc/msp/hdmi0");


    return ;
}

static HI_VOID HdmiPictureJitter(HI_VOID)
{
    HI_CHAR cInput = 0;

    /* check ssc */
    if (HI_FAILURE == HdmiSscCheck())
    {
        return ;
    }

    /* check colorbar */
    if (HI_FAILURE == HdmiColorbarCheck())
    {
        return ;
    }

    /* check HDMI cable */
    assistant_printf("please plug out and plug in HDMI cable, TV is normally display? [y/n].\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("maybe HDMI cable in poor contact.\n");
        return ;
    }

    assistant_printf("please change another HDMI cable, TV is normally display? [y/n].\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("maybe the attenuation of this cable is too large.\n");
        return ;
    }

    return ;
}

static HI_S32 HdmiCheckN()
{
    if (stHdmiInfo.stHwStatus.u32RefN != stHdmiInfo.stHwStatus.u32RegN)
    {
        assistant_printf_ext("the value of N is incorrect, reference(%d)-reg(%d).\n",
                                stHdmiInfo.stHwStatus.u32RefN,
                                stHdmiInfo.stHwStatus.u32RegN);
        return HI_FAILURE;
    }

    assistant_printf_ext("check N: %s\n", OK);

    return HI_SUCCESS;
}

static HI_S32 HdmiCheckCts()
{
    HI_U32 u32Temp = 0;

    if (HI_TRUE == stHdmiInfo.stHwStatus.bSwCTS)
    {
        u32Temp = abs(stHdmiInfo.stHwStatus.u32RefCTS - stHdmiInfo.stHwStatus.u32RegCTSSW);
    }
    else
    {
        u32Temp = abs(stHdmiInfo.stHwStatus.u32RefCTS - stHdmiInfo.stHwStatus.u32RegCTSHW);
    }

    if (u32Temp >= 200)
    {
        assistant_printf_ext("the value of CTS is incorrect, reference(%d)-reg(%d).\n",
                                stHdmiInfo.stHwStatus.u32RefCTS,
                                (HI_TRUE == stHdmiInfo.stHwStatus.bSwCTS) ?
                                stHdmiInfo.stHwStatus.u32RegCTSSW : stHdmiInfo.stHwStatus.u32RegCTSHW);
        return HI_FAILURE;
    }

    assistant_printf_ext("check CTS: %s\n", OK);

    return HI_SUCCESS;
}

static HI_S32 HdmiCheckAudioCapacity()
{
    HI_U32 i = 0;
    HI_U32 j = 0;

    for (i = 0; i < HI_UNF_EDID_MAX_AUDIO_CAP_COUNT; i++)
    {
        if (HI_UNF_EDID_AUDIO_FORMAT_CODE_PCM == stHdmiInfo.stSinkCaps.stAudioInfo[i].enAudFmtCode)
        {
            if (HDMI_AUDIO_SOUNDINTF_I2S == stHdmiInfo.stHwStatus.enSoundIf)
            {
                for (j = 0; j < MAX_SAMPE_RATE_NUM; j++)
                {
                    if (stHdmiInfo.stHwStatus.u32AudioOutFreq == stHdmiInfo.stSinkCaps.stAudioInfo[i].enSupportSampleRate[j])
                    {
                        assistant_printf_ext("check audio capacity: %s\n", OK);
                        return HI_SUCCESS;
                    }
                }
            }
        }
        else if (   HI_UNF_EDID_AUDIO_FORMAT_CODE_AC3 == stHdmiInfo.stSinkCaps.stAudioInfo[i].enAudFmtCode
                 || HI_UNF_EDID_AUDIO_FORMAT_CODE_DTS == stHdmiInfo.stSinkCaps.stAudioInfo[i].enAudFmtCode)
        {
            if (HDMI_AUDIO_SOUNDINTF_SPDIF == stHdmiInfo.stHwStatus.enSoundIf)
            {
                for (j = 0; j < MAX_SAMPE_RATE_NUM; j++)
                {
                    if (stHdmiInfo.stHwStatus.u32AudioOutFreq == stHdmiInfo.stSinkCaps.stAudioInfo[i].enSupportSampleRate[j])
                    {
                        assistant_printf_ext("check audio capacity: %s\n", OK);
                        return HI_SUCCESS;
                    }
                }
            }
        }
    }

    assistant_printf_ext("sink is not support this code type(%d) or sample frequency(%d)\n",
                            stHdmiInfo.stHwStatus.enSoundIf,
                            stHdmiInfo.stHwStatus.u32AudioOutFreq);

    return HI_FAILURE;
}

static HI_VOID HdmiNoSound(HI_VOID)
{
    if (HI_FALSE == stHdmiInfo.stHwStatus.bAudioEnable)
    {
        assistant_printf("HDMI audio not enable.\n");
        return ;
    }

    assistant_printf_ext("check audio enable: %s\n", OK);

    if (HI_FALSE == stHdmiInfo.stHwStatus.bAudioIFEnable)
    {
        assistant_printf("audio infoframe not enable.\n");
        return ;
    }

    assistant_printf_ext("check audio infoframe enable: %s\n", OK);

    if (HI_TRUE == stHdmiInfo.stHwStatus.bAudioMute)
    {
        assistant_printf("audio has been mute.\n");
        return ;
    }

    assistant_printf_ext("check audio mute: %s\n", OK);

    if (HI_FAILURE == HdmiCheckN())
    {
        return ;
    }

    if (HI_FAILURE == HdmiCheckCts())
    {
        return ;
    }

    if (HI_FAILURE == HdmiCheckAudioCapacity())
    {
        return ;
    }

    return ;
}

static HI_VOID HdmiNoiseSound(HI_VOID)
{
    HI_CHAR cInput = 0;

    assistant_printf("please check whether the CVBS has noise or not? [y/n]\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("maybe some noise in audio data.\n");
        return ;
    }

    if (HI_FAILURE == HdmiCheckN())
    {
        return ;
    }

    if (HI_FAILURE == HdmiCheckCts())
    {
        return ;
    }

    if (HI_FAILURE == HdmiCheckAudioCapacity())
    {
        return ;
    }

    WriteProc("echo swrst 1 > /proc/msp/hdmi0");
    Wait(1);
    WriteProc("echo swrst 0 > /proc/msp/hdmi0");
    assistant_printf("please check the noise is disappear? [y/n]\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("the sound is restored to normal after ctrl reset.\n");
        return ;
    }

    WriteProc("echo cmd 0 > /proc/msp/hdmi0");
    Wait(1);
    WriteProc("echo cmd 1 > /proc/msp/hdmi0");
    assistant_printf("please check the noise is disappear? [y/n]\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("the sound is restored to normal after stop and start.\n");
        return ;
    }

    assistant_printf("please change to another resolution and check the noise is disappear?\n");
    cInput = getchar();
    if ('y' == cInput || 'Y' == cInput)
    {
        assistant_printf("the sound is restored to normal after change to another resolution.\n");
        return ;
    }

    return ;
}


HI_S32 HdmiIssueHandler(HI_VOID)
{
    HI_CHAR                 aszInputCmd[32];

HDMI_AGAIN:

    assistant_printf(CATALOG_2[u32Lang]);
    assistant_printf(CASE_SELECT_2_1[u32Lang]);
    assistant_printf(CASE_SELECT_2_2[u32Lang]);
    assistant_printf(CASE_SELECT_2_3[u32Lang]);
    assistant_printf(CASE_SELECT_2_4[u32Lang]);
    assistant_printf(CASE_SELECT_2_5[u32Lang]);
    assistant_printf(CASE_SELECT_BACK[u32Lang]);
    assistant_printf(CASE_SELECT_QUIT[u32Lang]);
    assistant_printf(CASE_SELECT_INPUT[u32Lang]);

    SAMPLE_GET_INPUTCMD(aszInputCmd);
    assistant_printf_ext("Input [%c]\r\n", aszInputCmd[0]);

    switch (aszInputCmd[0])
    {
        case '1':
            /* Get hdmi proc and analyse */
            HdmiStatusGet();
            HdmiNoSignal();
            return HI_DONE;
        case '2':
            /* Get hdmi proc and analyse */
            HdmiStatusGet();
            HdmiDisplayAbnormal();
            return HI_DONE;
        case '3':
            /* Get hdmi proc and analyse */
            HdmiStatusGet();
            HdmiPictureJitter();
            return HI_DONE;
        case '4':
            /* Get hdmi proc and analyse */
            HdmiStatusGet();
            HdmiNoSound();
            return HI_DONE;
        case '5':
            /* Get hdmi proc and analyse */
            HdmiStatusGet();
            HdmiNoiseSound();
            return HI_DONE;
        case '0':
            return HI_FAILURE;

        case 'q':
        case 'Q':
            return HI_SUCCESS;

        default:
            assistant_printf(RESPONSE_INVALID_INPUT[u32Lang]);
            goto HDMI_AGAIN;
    }

    return HI_SUCCESS;
}

