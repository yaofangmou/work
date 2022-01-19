#include "hdr_info.h"
#include "public.h"
#include "mem_manage.h"
#include "vfmw_osal_ext.h"
#include "vfmw_osal_proc.h"
#include "vfmw_adapter.h"
#include "hi_drv_video.h"
#include "hi_unf_video.h"


/*----------------------------GLOBAL CONTROL----------------------------------*/
UINT8 g_HDREnable = 1;

#ifdef HI_HDR10PLUS_SUPPORT
HI_DRV_VIDEO_HDR10PLUS_DYNAMIC_METADATA_S g_stDynamicMetadata;
#endif

/*-----------------------------   MACRO  -------------------------------------*/
#define HDR_OK                (0)
#define HDR_ERR               (-1)

//#define VFMW_PROC_PRINT(arg...) seq_printf(arg)


/*-----------------------------LOCAL DEFINITION-------------------------------*/

#define HDR_PROC_NAME        "vfmw_hdr"
#define HDR_CMD_LEN          (256)

#define HDR_CMD              "hdr"

extern SINT32 g_CurProcChan;

#define MAX_VID_STD_NAME     (20)

#define MAX_HDR_CHAN_NUM     (2)

typedef struct
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType;
    HI_DRV_COLOUR_DESCRIPTION_INFO_S stColourInfo;
    HI_DRV_VIDEO_HDR_INFO_U unHDRInfo;
} HDR_OUTPUT_S;

typedef struct tagVDEC_HDR_PROC_S
{
    SINT32 ChanID;
    VID_STD_E   eVidStd;
    HDR_INPUT_S stHDRInput;
    HDR_OUTPUT_S stHDRoutput;
} HDR_PROC_S;

HDR_PROC_S g_HDRChan[MAX_HDR_CHAN_NUM];

/*----------------------------INTERNAL FUNCTION DECLEAR-----------------------*/
#ifdef VFMW_STB_PRODUCT
VOID HDR_CovertVidStd(VID_STD_E eVidStd, HI_DRV_VIDEO_STD_E *penCodecType);
VOID HDR_GetColorInfo(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput);
#else
VOID HDR_CheckGammaType_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput);
VOID HDR_CheckGammaType_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput);
VOID HDR_GetColorSpace_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput);
VOID HDR_GetColorSpace_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput);
static VOID HDR_GetGammaTypeInfo(HI_DRV_GAMMA_TYPE_E enGammaType, HI_CHAR *pGammaType, UINT32 Size);
static VOID HDR_GetColorSpaceInfo(HI_DRV_COLOR_SPACE_E enColorSpace, HI_CHAR *pColorSpace, UINT32 Size);
static VOID HDR_GetLuminaceSysInfo(HI_DRV_LUMINACE_SYS_TYPE_E enLuminaceSys, SINT8 *pLuminaceSys, UINT32 Size);
#endif

#ifdef VFMW_STB_PRODUCT
VOID HDR_CovertVidStd(VID_STD_E eVidStd, HI_DRV_VIDEO_STD_E *penCodecType)
{
    if (eVidStd == VFMW_HEVC)
    {
        *penCodecType = HI_DRV_STD_HEVC;
    }
    else if (eVidStd == VFMW_VP9)
    {
        *penCodecType = HI_DRV_STD_VP9;
    }
    else if (eVidStd == VFMW_AVS2)
    {
        *penCodecType = HI_DRV_STD_AVS2;
    }
    else
    {
        *penCodecType = HI_DRV_STD_START_RESERVED;
    }

    return;
}

VOID HDR_GetColorInfo(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    pstHDROutput->stColourInfo.u8FullRangeFlag = pstHDRInput->ColourInfo.FullRangeFlag;
    pstHDROutput->stColourInfo.u8ColourPrimaries = pstHDRInput->ColourInfo.ColourPrimaries;
    pstHDROutput->stColourInfo.u8MatrixCoeffs = pstHDRInput->ColourInfo.MatrixCoeffs;

    return;
}
#else
VOID HDR_CheckGammaType_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_GAMMA_TYPE_E GammaType = HI_DRV_GAMMA_TYPE_1886;

    switch (pstHDRInput->ColourInfo.TransferCharacteristics)
    {
        case 11:
            GammaType = HI_DRV_GAMMA_TYPE_XVYCC;
            break;

        case 14:
            if (pstHDRInput->ComapitibilityInfo.HDRTransferCharacteristicIdc == 18)
            {
                GammaType = HI_DRV_GAMMA_TYPE_ARIB_HLG;
            }

            break;

        case 16:
            GammaType = HI_DRV_GAMMA_TYPE_2084;
            break;

        case 18:
            GammaType = HI_DRV_GAMMA_TYPE_ARIB_HLG;
            break;

        default:
            break;
    }

    pstHDROutput->stColourInfo.enGammaType = GammaType;

    return;
}

VOID HDR_CheckGammaType_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_GAMMA_TYPE_E GammaType = HI_DRV_GAMMA_TYPE_1886;
    UINT32 TransferCharacteristics = pstHDRInput->ColourInfo.TransferCharacteristics;

    switch (TransferCharacteristics)
    {
        case 12:
            GammaType = HI_DRV_GAMMA_TYPE_2084;
            break;

        case 13:
            GammaType = HI_DRV_GAMMA_TYPE_AVS2_SLF;
            break;

        case 14:
            GammaType = HI_DRV_GAMMA_TYPE_ARIB_HLG;
            break;

        default:
            break;
    }

    pstHDROutput->stColourInfo.enGammaType = GammaType;

    return;
}

VOID HDR_GetColorSpace_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    UINT8 MatrixCoeffs = pstHDRInput->ColourInfo.MatrixCoeffs;
    UINT8 FullRangeFlag = pstHDRInput->ColourInfo.FullRangeFlag;

    HI_DRV_COLOR_SPACE_E ColorSpace = HI_DRV_CS_BT709_YUV_LIMITED;
    HI_DRV_LUMINACE_SYS_TYPE_E LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_NON_CONSTANCE;

    switch (MatrixCoeffs)
    {
        case 1:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BUTT;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT709_YUV_FULL : HI_DRV_CS_BT709_YUV_LIMITED;
            break;

        case 5:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BUTT;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT601_YUV_FULL : HI_DRV_CS_BT601_YUV_LIMITED;
            break;

        case 9:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_NON_CONSTANCE;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            break;

        case 10:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_CONSTANCE;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            break;

        default:
            break;
    }

    pstHDROutput->stColourInfo.bFullRange = FullRangeFlag;
    pstHDROutput->stColourInfo.enColorSpace = ColorSpace;
    pstHDROutput->stColourInfo.enLuminaceSys = LuminaceSys;

    return;
}

VOID HDR_GetColorSpace_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    UINT8 MatrixCoeffs = pstHDRInput->ColourInfo.MatrixCoeffs;
    UINT8 FullRangeFlag = pstHDRInput->ColourInfo.FullRangeFlag;

    HI_DRV_COLOR_SPACE_E ColorSpace = HI_DRV_CS_BT709_YUV_LIMITED;
    HI_DRV_LUMINACE_SYS_TYPE_E LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_NON_CONSTANCE;

    switch (MatrixCoeffs)
    {
        case 1:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BUTT;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT709_YUV_FULL : HI_DRV_CS_BT709_YUV_LIMITED;
            break;

        case 5:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BUTT;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT601_YUV_FULL : HI_DRV_CS_BT601_YUV_LIMITED;
            break;

        case 8:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_NON_CONSTANCE;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            break;

        case 9:
            LuminaceSys = HI_DRV_LUMINACE_SYS_BT2020_CONSTANCE;
            ColorSpace = (FullRangeFlag == 1) ? HI_DRV_CS_BT2020_YUV_FULL : HI_DRV_CS_BT2020_YUV_LIMITED;
            break;

        default:
            break;
    }

    pstHDROutput->stColourInfo.bFullRange = FullRangeFlag;
    pstHDROutput->stColourInfo.enColorSpace = ColorSpace;
    pstHDROutput->stColourInfo.enLuminaceSys = LuminaceSys;

    return;
}

VOID HDR_GetColorPrime(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_PRIMARY_E enColorPrime = HI_DRV_PRIMARY_BT709;
    UINT8 ColourPrimaries = pstHDRInput->ColourInfo.ColourPrimaries;

    switch (ColourPrimaries)
    {
        case 1:
            enColorPrime = HI_DRV_PRIMARY_BT709;
            break;

        case 5:
            enColorPrime = HI_DRV_PRIMARY_BT601_625;
            break;

        case 6:
            enColorPrime = HI_DRV_PRIMARY_BT601_525;
            break;

        case 9:
            enColorPrime = HI_DRV_PRIMARY_BT2020;
            break;

        default:
            break;
    }

    pstHDROutput->stColourInfo.enColorPrime = enColorPrime;

    return;
}

static VOID HDR_GetGammaTypeInfo(HI_DRV_GAMMA_TYPE_E enGammaType, HI_CHAR *pGammaType, UINT32 Size)
{
    switch (enGammaType)
    {
        case HI_DRV_GAMMA_TYPE_1886:
            OSAL_FP_snprintf(pGammaType, Size, "GAMMA_TYPE_1886");
            break;

        case HI_DRV_GAMMA_TYPE_2084:
            OSAL_FP_snprintf(pGammaType, Size, "GAMMA_TYPE_2084");
            break;

        case HI_DRV_GAMMA_TYPE_ARIB_HLG:
            OSAL_FP_snprintf(pGammaType, Size, "GAMMA_TYPE_ARIB_HLG");
            break;

        case HI_DRV_GAMMA_TYPE_AVS2_SLF:
            OSAL_FP_snprintf(pGammaType, Size, "GAMMA_TYPE_AVS2_SLF");
            break;

        default:
            OSAL_FP_snprintf(pGammaType, Size, "UNKNOWN(%d)", enGammaType);
            break;
    }

    return;
}

static VOID HDR_GetColorSpaceInfo(HI_DRV_COLOR_SPACE_E enColorSpace, HI_CHAR *pColorSpace, UINT32 Size)
{
    switch (enColorSpace)
    {
        case HI_DRV_CS_BT601_YUV_LIMITED:
            OSAL_FP_snprintf(pColorSpace, Size, "BT601_YUV_LIMITED");
            break;

        case HI_DRV_CS_BT709_YUV_LIMITED:
            OSAL_FP_snprintf(pColorSpace, Size, "BT709_YUV_LIMITED");
            break;

        case HI_DRV_CS_BT2020_YUV_LIMITED:
            OSAL_FP_snprintf(pColorSpace, Size, "BT2020_YUV_LIMITED");
            break;

        case HI_DRV_CS_BT2020_YUV_FULL:
            OSAL_FP_snprintf(pColorSpace, Size, "BT2020_YUV_FULL");
            break;

        default:
            OSAL_FP_snprintf(pColorSpace, Size, "UNKNOWN(%d)", enColorSpace);
            break;
    }

    return;
}

static VOID HDR_GetLuminaceSysInfo(HI_DRV_LUMINACE_SYS_TYPE_E enLuminaceSys, SINT8 *pLuminaceSys, UINT32 Size)
{
    switch (enLuminaceSys)
    {
        case HI_DRV_LUMINACE_SYS_BT2020_NON_CONSTANCE:
            OSAL_FP_snprintf(pLuminaceSys, Size, "SYS_BT2020_NON_CONSTANCE");
            break;

        case HI_DRV_LUMINACE_SYS_BT2020_CONSTANCE:
            OSAL_FP_snprintf(pLuminaceSys, Size, "SYS_BT2020_CONSTANCE");
            break;

        case HI_DRV_LUMINACE_SYS_XVYCC_709:
            OSAL_FP_snprintf(pLuminaceSys, Size, "SYS_XVYCC_709");
            break;

        default:
            OSAL_FP_snprintf(pLuminaceSys, Size, "HI_DRV_LUMINACE_SYS_BUTT(%d)", enLuminaceSys);
            break;
    }

    return;
}

static VOID HDR_GetColorPrimeInfo(HI_DRV_PRIMARY_E enColorPrime, SINT8 *pColorPrime, UINT32 Size)
{
    switch (enColorPrime)
    {
        case HI_DRV_PRIMARY_BT709:
            OSAL_FP_snprintf(pColorPrime, Size, "PRIMARY_BT709");
            break;

        case HI_DRV_PRIMARY_BT601_525:
            OSAL_FP_snprintf(pColorPrime, Size, "PRIMARY_BT601_525");
            break;

        case HI_DRV_PRIMARY_BT601_625:
            OSAL_FP_snprintf(pColorPrime, Size, "PRIMARY_BT601_625");
            break;

        case HI_DRV_PRIMARY_BT2020:
            OSAL_FP_snprintf(pColorPrime, Size, "PRIMARY_BT2020");
            break;

        default:
            OSAL_FP_snprintf(pColorPrime, Size, "HI_DRV_PRIMARY_COLOR_BUTT(%d)", enColorPrime);
            break;
    }

    return;
}
#endif

VOID HDR_CheckType_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
    pstHDRInput->IsBackwardsCompatible = 0;

    switch (pstHDRInput->ColourInfo.TransferCharacteristics)
    {
        case 14:
            if (pstHDRInput->ComapitibilityInfo.HDRTransferCharacteristicIdc == 18)
            {
                enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HLG;
                pstHDRInput->IsBackwardsCompatible = 1;
            }
            else
            {
                enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
            }

            break;

        case 16:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HDR10;
            break;

        case 18:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HLG;
            break;

        default:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
            break;
    }

    if (pstHDRInput->BeDVHDRChan == 1)
    {
        if (pstHDRInput->DVCapacity == DV_BL_DECODING_SUPPORT)
        {
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL;
        }
        else if (pstHDRInput->DVCapacity == DV_EL_DECODING_SUPPORT)
        {
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL;
        }
        else
        {
            dprint(PRN_ERROR, "[%s %d] invalid DVCapacity = %d !!\n", __func__, __LINE__, pstHDRInput->DVCapacity);
        }
    }

    if (pstHDRInput->SlHDR1MetadataAvailable)
    {
        enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR;
    }

#ifdef HI_HDR10PLUS_SUPPORT
    if (pstHDRInput->bDynamicMetadataValid)
    {
        enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HDR10PLUS;
    }
#endif

    pstHDROutput->enSrcFrameType = enSrcFrameType;

#ifdef VFMW_DPT_PRODUCT
    HDR_CheckGammaType_HEVC(pstHDRInput, pstHDROutput);
#endif

    return;
}

VOID HDR_CheckType_H264(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
    pstHDRInput->IsBackwardsCompatible = 0;

    if (pstHDRInput->BeDVHDRChan == 1)
    {
        if (pstHDRInput->DVCapacity == DV_BL_DECODING_SUPPORT)
        {
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL;
        }
        else if (pstHDRInput->DVCapacity == DV_EL_DECODING_SUPPORT)
        {
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL;
        }
        else
        {
            dprint(PRN_ERROR, "[%s %d] invalid DVCapacity = %d !!\n", __func__, __LINE__, pstHDRInput->DVCapacity);
        }
    }

    pstHDROutput->enSrcFrameType = enSrcFrameType;

    return;
}

VOID HDR_CheckType_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
    UINT32 TransferCharacteristics = pstHDRInput->ColourInfo.TransferCharacteristics;

    pstHDRInput->IsBackwardsCompatible = 0;

    switch (TransferCharacteristics)
    {
        case 12:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HDR10;
            break;

        case 13:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SLF;
            break;

        case 14:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HLG;
            break;

        default:
            enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
            break;
    }

    pstHDROutput->enSrcFrameType = enSrcFrameType;
#ifdef VFMW_DPT_PRODUCT
    HDR_CheckGammaType_AVS2(pstHDRInput, pstHDROutput);
#endif
    return;
}

static VOID HDR_CopyHdr10Metadata(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDRInput->MasteringAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHDR10Info.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stMasteringInfo),
               &(pstHDRInput->MasteringDisplayColourVolume),
               sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
    }

    if (pstHDRInput->ContentAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHDR10Info.u8ContentAvailable = pstHDRInput->ContentAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stContentInfo),
               &(pstHDRInput->ContentLightLevel),
               sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
    }

    return;
}

static VOID HDR_CopyHlgMetadata(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDRInput->MasteringAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHLGInfo.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHLGInfo.stMasteringInfo),
               &(pstHDRInput->MasteringDisplayColourVolume),
               sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
    }

    if (pstHDRInput->ContentAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHLGInfo.u8ContentAvailable = pstHDRInput->ContentAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHLGInfo.stContentInfo),
               &(pstHDRInput->ContentLightLevel),
               sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
    }

    return;
}

#ifdef HI_HDR10PLUS_SUPPORT
static VOID HDR_CopyHdr10PlusStaticMetadata(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDRInput->MasteringAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHDR10PlusInfo.stStaticMetadata.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10PlusInfo.stStaticMetadata.stMasteringInfo),
                       &(pstHDRInput->MasteringDisplayColourVolume),
                       sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
    }

    if (pstHDRInput->ContentAvailable == 1)
    {
        pstHDROutput->unHDRInfo.stHDR10PlusInfo.stStaticMetadata.u8ContentAvailable = pstHDRInput->ContentAvailable;
        OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10PlusInfo.stStaticMetadata.stContentInfo),
               &(pstHDRInput->ContentLightLevel),
               sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
    }
}
#endif

static VOID HDR_GetMetadata_HEVC(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_HDR10)
    {
#ifdef VFMW_STB_PRODUCT
        pstHDROutput->unHDRInfo.stHDR10Info.u8TransferCharacteristics = pstHDRInput->ColourInfo.TransferCharacteristics;
#endif

        HDR_CopyHdr10Metadata(pstHDRInput, pstHDROutput);
    }
    else if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_HLG)
    {
#ifdef VFMW_STB_PRODUCT
        pstHDROutput->unHDRInfo.stHLGInfo.IsBackwardsCompatible = pstHDRInput->IsBackwardsCompatible;
#else
        pstHDROutput->unHDRInfo.stHLGInfo.u8BackWardsCompatible = pstHDRInput->IsBackwardsCompatible;
    #endif
        HDR_CopyHlgMetadata(pstHDRInput, pstHDROutput);
    }
    else if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR)
    {
        if (pstHDRInput->SlHDR1MetadataAvailable == 1)
        {
#if 0
            pstHDROutput->unHDRInfo.stTechnicolorInfo.bMetadataValid = 1;
            pstHDROutput->enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
            pstHDROutput->unHDRInfo.stTechnicolorInfo.u32Length = pstHDRInput->HDR_Metadata_size;
            pstHDROutput->unHDRInfo.stTechnicolorInfo.u32PhyAddr = pstHDRInput->HDR_Metadata_phy_addr;
#endif
        }
    }
#ifdef HI_HDR10PLUS_SUPPORT
    else if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_HDR10PLUS)
    {
        HDR_CopyHdr10PlusStaticMetadata(pstHDRInput, pstHDROutput);

        if ((pstHDRInput->MasteringAvailable == 1) || (pstHDRInput->ContentAvailable == 1))
        {
            pstHDROutput->unHDRInfo.stHDR10PlusInfo.bStaticMetadataValid = 1;
        }

        if (pstHDRInput->bDynamicMetadataValid == 1)
        {
            pstHDROutput->unHDRInfo.stHDR10PlusInfo.bDynamicMetadataValid = 1;
            pstHDROutput->unHDRInfo.stHDR10PlusInfo.stDynamicMetadata.u32Length = pstHDRInput->HDR_Metadata_size;
            pstHDROutput->unHDRInfo.stHDR10PlusInfo.stDynamicMetadata.u32Addr   = pstHDRInput->HDR_Metadata_phy_addr;
        }
    }
#endif
    else if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL
             || pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL)
    {
        pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Length = pstHDRInput->HDR_Metadata_size;
        pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Addr   = pstHDRInput->HDR_Metadata_phy_addr;
        pstHDROutput->unHDRInfo.stDolbyInfo.bCompatible = pstHDRInput->bDVCompatible;

        if (pstHDRInput->HDR_Metadata_size > 0)
        {
            pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid = 1;
        }
        else
        {
            pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid = 0;

        #ifdef VFMW_STB_PRODUCT
            pstHDROutput->unHDRInfo.stHDR10Info.u8TransferCharacteristics = pstHDRInput->ColourInfo.TransferCharacteristics;
        #endif
            if (pstHDRInput->MasteringAvailable == 1)
            {
                pstHDROutput->unHDRInfo.stHDR10Info.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
                OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stMasteringInfo),
                       &(pstHDRInput->MasteringDisplayColourVolume),
                       sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
            }

            if (pstHDRInput->ContentAvailable == 1)
            {
                pstHDROutput->unHDRInfo.stHDR10Info.u8ContentAvailable = pstHDRInput->ContentAvailable;
                OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stContentInfo),
                       &(pstHDRInput->ContentLightLevel),
                       sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
            }
        }
    }

    return;
}

static VOID HDR_GetMetadata_H264(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL
        || pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL)
    {

        pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Length = pstHDRInput->HDR_Metadata_size;
        pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Addr = pstHDRInput->HDR_Metadata_phy_addr;

        if (pstHDRInput->HDR_Metadata_size > 0)
        {
            pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid = 1;
        }
        else
        {
            pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid = 0;
        }

        pstHDROutput->unHDRInfo.stDolbyInfo.bCompatible = pstHDRInput->bDVCompatible;
    }

    return;
}

static VOID HDR_GetMetadata_AVS2(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_HDR10)
    {
        if (pstHDRInput->MasteringAvailable == 1)
        {
            pstHDROutput->unHDRInfo.stHDR10Info.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
            OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stMasteringInfo),
                           &(pstHDRInput->MasteringDisplayColourVolume),
                           sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
        }

        if (pstHDRInput->ContentAvailable == 1)
        {
            pstHDROutput->unHDRInfo.stHDR10Info.u8ContentAvailable = pstHDRInput->ContentAvailable;
            OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stHDR10Info.stContentInfo),
                           &(pstHDRInput->ContentLightLevel),
                           sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
        }
    }
    else if (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_SLF)
    {
        if (pstHDRInput->MasteringAvailable == 1)
        {
            pstHDROutput->unHDRInfo.stSLFInfo.u8MasteringAvailable = pstHDRInput->MasteringAvailable;
            OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stSLFInfo.stMasteringInfo),
                           &(pstHDRInput->MasteringDisplayColourVolume),
                           sizeof(MASTERING_DISPLAY_COLOUR_VOLUME_S));
        }

        if (pstHDRInput->ContentAvailable == 1)
        {
            pstHDROutput->unHDRInfo.stSLFInfo.u8ContentAvailable = pstHDRInput->ContentAvailable;
            OSAL_FP_memcpy(&(pstHDROutput->unHDRInfo.stSLFInfo.stContentInfo),
                           &(pstHDRInput->ContentLightLevel),
                           sizeof(CONTENT_LIGHT_LEVEL_INFO_S));
        }
    }

    return;
}

HI_VOID HDR_JudgeDVMixStreamType(HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    if (pstHDRInput->HDR_Metadata_size == 0
     && pstHDRInput->DVCapacity == DV_BL_DECODING_SUPPORT
     &&  ((pstHDRInput->VesImp == DV_SINGLE_VES_IMP && pstHDRInput->LayerImp == DV_SINGLE_LAYER_IMP)
      ||  (pstHDRInput->VesImp == DV_SINGLE_VES_IMP && pstHDRInput->LayerImp == DV_DUAL_LAYER_IMP)))

    {
        if (pstHDRInput->ColourInfo.TransferCharacteristics == 16)
        {
            pstHDROutput->enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_HDR10;
        }
        else
        {
            pstHDROutput->enSrcFrameType = HI_DRV_VIDEO_FRAME_TYPE_SDR;
        }
    }

    return;
}

VOID HDR_FillOutputHDRInfo(VID_STD_E eVidStd, HDR_INPUT_S *pstHDRInput, HDR_OUTPUT_S *pstHDROutput)
{
    switch (eVidStd)
    {
        case VFMW_H264:
            HDR_CheckType_H264(pstHDRInput, pstHDROutput);

            if (pstHDROutput->enSrcFrameType != HI_DRV_VIDEO_FRAME_TYPE_SDR)
            {
                HDR_GetMetadata_H264(pstHDRInput, pstHDROutput);
            }

            break;

        case VFMW_HEVC:
            HDR_CheckType_HEVC(pstHDRInput, pstHDROutput);
#ifdef VFMW_DPT_PRODUCT
            HDR_GetColorSpace_HEVC(pstHDRInput, pstHDROutput);
            HDR_GetColorPrime(pstHDRInput, pstHDROutput);
#endif

            if (pstHDROutput->enSrcFrameType != HI_DRV_VIDEO_FRAME_TYPE_SDR)
            {
#ifdef VFMW_STB_PRODUCT
                HDR_GetColorInfo(pstHDRInput, pstHDROutput);
#endif
                HDR_GetMetadata_HEVC(pstHDRInput, pstHDROutput);
            }

            break;

        case VFMW_AVS2:
            HDR_CheckType_AVS2(pstHDRInput, pstHDROutput);
#ifdef VFMW_DPT_PRODUCT
            HDR_GetColorSpace_AVS2(pstHDRInput, pstHDROutput);
            HDR_GetColorPrime(pstHDRInput, pstHDROutput);
#endif

            if (pstHDROutput->enSrcFrameType != HI_DRV_VIDEO_FRAME_TYPE_SDR)
            {
#ifdef VFMW_STB_PRODUCT
                HDR_GetColorInfo(pstHDRInput, pstHDROutput);
#endif
                HDR_GetMetadata_AVS2(pstHDRInput, pstHDROutput);
            }

            break;

        default :
            //do nothing
            break;
    }

    HDR_JudgeDVMixStreamType(pstHDRInput, pstHDROutput);
    return ;
}

#ifdef HI_PROC_SUPPORT
static VOID HDR_RecordProcInfo(SINT32 ChanID, IMAGE *pstImage, HDR_OUTPUT_S *pstHDROutput)
{
    UINT8 pos = 0;
    HDR_INPUT_S *pstHDRInput = &pstImage->stHDRInput;

    pos = (pstHDROutput->enSrcFrameType == HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL) ? 1 : 0;
    OSAL_FP_memset(&g_HDRChan[pos], 0, sizeof(HDR_PROC_S));
    g_HDRChan[pos].ChanID = ChanID;
    g_HDRChan[pos].eVidStd = pstImage->eVidStd;

    OSAL_FP_memcpy(&g_HDRChan[pos].stHDRInput, pstHDRInput,  sizeof(HDR_INPUT_S));
    OSAL_FP_memcpy(&g_HDRChan[pos].stHDRoutput, pstHDROutput,  sizeof(HDR_OUTPUT_S));

    return;
}

VOID HDR_ShowStandard(VID_STD_E eVidStd, SINT8 *strVidStd)
{
    SINT8 *strVidstdTemp = NULL;

    switch (eVidStd)
    {
        case VFMW_H264:
            strVidstdTemp = "H264";
            break;

        case VFMW_AVS2:
            strVidstdTemp = "AVS2";
            break;

        case VFMW_VP9:
            strVidstdTemp = "VP9";
            break;

        case VFMW_HEVC:
            strVidstdTemp = "HEVC";
            break;

        case VFMW_END_RESERVED:
            strVidstdTemp = "RESERVED";
            break;

        default:
            *strVidStd = '\0';
            break;
    }

    if (strVidstdTemp)
    {
        strncpy(strVidStd, strVidstdTemp, strlen(strVidstdTemp));
        strVidStd[strlen(strVidstdTemp)] = '\0';
    }

    return;
}

static VOID HDR_ReadHDR10MetadataInfo(struct seq_file *p, HI_DRV_VIDEO_HDR10_INFO_S *pstHDR10Info)
{
    if (pstHDR10Info->u8MasteringAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "bMasteringAvailable", pstHDR10Info->u8MasteringAvailable);
        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_x",
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_x[0],
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_x[1],
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_x[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_y",
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_y[0],
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_y[1],
                   pstHDR10Info->stMasteringInfo.u16DisplayPrimaries_y[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d)\n", "WhitePoint",
                   pstHDR10Info->stMasteringInfo.u16WhitePoint_x,
                   pstHDR10Info->stMasteringInfo.u16WhitePoint_y);

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxDisplayMasteringLuminance",
                   pstHDR10Info->stMasteringInfo.u32MaxDisplayMasteringLuminance);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MinDisplayMasteringLuminance",
                   pstHDR10Info->stMasteringInfo.u32MinDisplayMasteringLuminance);
    }

    if (pstHDR10Info->u8ContentAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxContentLightLevel",
                   pstHDR10Info->stContentInfo.u32MaxContentLightLevel);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxPicAverageLightLevel",
                   pstHDR10Info->stContentInfo.u32MaxPicAverageLightLevel);
    }

    return;
}

static VOID HDR_ReadHLGMetadataInfo(struct seq_file *p, HI_DRV_VIDEO_HLG_INFO_S *pstHLGInfo)
{
    if (p == HI_NULL || pstHLGInfo == HI_NULL)
    {
        return;
    }

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "BackWardsCompatible", pstHLGInfo->IsBackwardsCompatible);

    if (pstHLGInfo->u8MasteringAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "bMasteringAvailable", pstHLGInfo->u8MasteringAvailable);
        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_x",
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_x[0],
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_x[1],
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_x[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_y",
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_y[0],
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_y[1],
                      pstHLGInfo->stMasteringInfo.u16DisplayPrimaries_y[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d)\n", "WhitePoint",
                      pstHLGInfo->stMasteringInfo.u16WhitePoint_x,
                      pstHLGInfo->stMasteringInfo.u16WhitePoint_y);

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxDisplayMasteringLuminance",
                      pstHLGInfo->stMasteringInfo.u32MaxDisplayMasteringLuminance);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MinDisplayMasteringLuminance",
                      pstHLGInfo->stMasteringInfo.u32MinDisplayMasteringLuminance);
    }

    if (pstHLGInfo->u8ContentAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxContentLightLevel",
                      pstHLGInfo->stContentInfo.u32MaxContentLightLevel);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxPicAverageLightLevel",
                      pstHLGInfo->stContentInfo.u32MaxPicAverageLightLevel);
    }

    return;
}

#ifdef HI_HDR10PLUS_SUPPORT
#ifndef ENV_SOS_KERNEL
static VOID HDR_ReadHDR10PlusDynamicMetadataInfo(struct seq_file *p, HI_DRV_VIDEO_HDR10PLUS_DYNAMIC_METADATA_S *pstDynamicMetadata)
{
    UINT8 i = 0;
    UINT8 j = 0;
    UINT8 w = 0;

    PROC_PRINT(p, "%-35s\n", "---DynamicMetadata Start---");
    PROC_PRINT(p, "%-35s : %d\n", "Windows Num", pstDynamicMetadata->u8NumWindows);

    for (w = 1; w < pstDynamicMetadata->u8NumWindows; w++)
    {
        PROC_PRINT(p, "%-35s : %d\n", "WindowUpperLeftCornerX", pstDynamicMetadata->u16WindowUpperLeftCornerX[w]);
        PROC_PRINT(p, "%-35s : %d\n", "WindowUpperLeftCornerY", pstDynamicMetadata->u16WindowUpperLeftCornerY[w]);
        PROC_PRINT(p, "%-35s : %d\n", "WindowLowerRightCornerX", pstDynamicMetadata->u16WindowLowerRightCornerX[w]);
        PROC_PRINT(p, "%-35s : %d\n", "WindowLowerRightCornerY", pstDynamicMetadata->u16WindowLowerRightCornerY[w]);
        PROC_PRINT(p, "%-35s : %d\n", "CenterOfEllipseX", pstDynamicMetadata->u16CenterOfEllipseX[w]);
        PROC_PRINT(p, "%-35s : %d\n", "CenterOfEllipseY", pstDynamicMetadata->u16CenterOfEllipseY[w]);
        PROC_PRINT(p, "%-35s : %d\n", "RotationAngle", pstDynamicMetadata->u8RotationAngle[w]);
        PROC_PRINT(p, "%-35s : %d\n", "SemimajorAxisInternalEllipse", pstDynamicMetadata->u16SemimajorAxisInternalEllipse[w]);
        PROC_PRINT(p, "%-35s : %d\n", "SemimajorAxisExternalEllipse", pstDynamicMetadata->u16SemimajorAxisExternalEllipse[w]);
        PROC_PRINT(p, "%-35s : %d\n", "SemiminorAxisExternalEllipse", pstDynamicMetadata->u16SemiminorAxisExternalEllipse[w]);
        PROC_PRINT(p, "%-35s : %d\n", "OverlapProcessOption", pstDynamicMetadata->u8OverlapProcessOption[w]);
    }

    PROC_PRINT(p, "%-35s : %d\n", "T_DisplayMaximumLuminance", pstDynamicMetadata->u32_T_DisplayMaximumLuminance);
    PROC_PRINT(p, "%-35s : %d\n", "T_Display_APL_Flag", pstDynamicMetadata->b_T_Display_APL_Flag);

    if (pstDynamicMetadata->b_T_Display_APL_Flag)
    {
        PROC_PRINT(p, "%-35s : %d\n", "NumRows_T_Display_APL", pstDynamicMetadata->u8NumRows_T_Display_APL);
        PROC_PRINT(p, "%-35s : %d\n", "NumCols_T_Display_APL", pstDynamicMetadata->u8NumCols_T_Display_APL);

        for (i = 0; i < pstDynamicMetadata->u8NumRows_T_Display_APL; i++)
        {
            for (j = 0; j < pstDynamicMetadata->u8NumCols_T_Display_APL; j++)
            {
                PROC_PRINT(p, "%-35s : %d\n", "T_display_APL", pstDynamicMetadata->u8_T_display_APL[i][j]);
            }
        }
    }

    for (w = 0; w < pstDynamicMetadata->u8NumWindows; w++)
    {
        for (i = 0; i < 3; i++)
        {
            PROC_PRINT(p, "%-35s : %d\n", "MaxScl", pstDynamicMetadata->u32MaxScl[w][i]);
        }

        PROC_PRINT(p, "%-35s : %d\n", "AverageMaxrgb", pstDynamicMetadata->u32AverageMaxrgb[w]);
        PROC_PRINT(p, "%-35s : %d\n", "NumDistMaxrgbPercentiles", pstDynamicMetadata->u8NumDistMaxrgbPercentiles[w]);

        for (i = 0; i < pstDynamicMetadata->u8NumDistMaxrgbPercentiles[w]; i++)
        {
             PROC_PRINT(p, "%-35s[%d] : %d\n", "DistMaxrgbPercentages", i, pstDynamicMetadata->u8DistMaxrgbPercentages[w][i]);
        }

        for (i = 0; i < pstDynamicMetadata->u8NumDistMaxrgbPercentiles[w]; i++)
        {
             PROC_PRINT(p, "%-35s[%d] : %d\n", "DistMaxrgbPercentiles", i, pstDynamicMetadata->u32DistMaxrgbPercentiles[w][i]);
        }

        PROC_PRINT(p, "%-35s : %d\n", "FractionBrightPixels", pstDynamicMetadata->u16FractionBrightPixels[w]);
    }

    PROC_PRINT(p, "%-35s : %d\n", "M_Display_APL_Flag", pstDynamicMetadata->b_M_Display_APL_Flag);

    if (pstDynamicMetadata->b_M_Display_APL_Flag)
    {
        PROC_PRINT(p, "%-35s : %d\n", "NumRows_M_Display_APL", pstDynamicMetadata->u8NumRows_M_Display_APL);
        PROC_PRINT(p, "%-35s : %d\n", "NumCols_M_Display_APL", pstDynamicMetadata->u8NumCols_M_Display_APL);

        for (i = 0; i < pstDynamicMetadata->u8NumRows_M_Display_APL; i++)
        {
            for (j = 0; j < pstDynamicMetadata->u8NumCols_M_Display_APL; j++)
            {
                PROC_PRINT(p, "%-35s : %d\n", "M_Display_APL", pstDynamicMetadata->u8_M_Display_APL[i][j]);
            }
        }
    }

    for (w = 0; w < pstDynamicMetadata->u8NumWindows; w++)
    {
        PROC_PRINT(p, "%-35s : %d\n", "ToneMappingFlag", pstDynamicMetadata->bToneMappingFlag[w]);
        if (pstDynamicMetadata->bToneMappingFlag[w])
        {
            PROC_PRINT(p, "%-35s : %d\n", "KneePointX", pstDynamicMetadata->u16KneePointX[w]);
            PROC_PRINT(p, "%-35s : %d\n", "KneePointY", pstDynamicMetadata->u16KneePointY[w]);
            PROC_PRINT(p, "%-35s : %d\n", "NumBezierCurveAnchors", pstDynamicMetadata->u8NumBezierCurveAnchors[w]);

            for (i = 0; i < pstDynamicMetadata->u8NumBezierCurveAnchors[w]; i++)
            {
                PROC_PRINT(p, "%-35s : %d\n", "bezierCurveAnchors", pstDynamicMetadata->u16bezierCurveAnchors[w][i]);
            }
        }

        PROC_PRINT(p, "%-35s : %d\n", "ColorSaturationMappingFlag", pstDynamicMetadata->bColorSaturationMappingFlag[w]);

        if (pstDynamicMetadata->bColorSaturationMappingFlag[w])
        {
            PROC_PRINT(p, "%-35s : %d\n", "ColorSaturationWeight", pstDynamicMetadata->u8ColorSaturationWeight[w]);
        }
    }

    PROC_PRINT(p, "%-35s\n", "---DynamicMetadata End---");

    return;
}
#endif
#endif

static VOID HDR_ReadVideoFrameType(struct seq_file *p, HI_DRV_VIDEO_FRAME_TYPE_E enSrcFrameType)
{
    switch (enSrcFrameType)
    {
        case HI_DRV_VIDEO_FRAME_TYPE_SDR:
            VFMW_PROC_PRINT(p, "%-35s : SDR\n", "SrcFrmType");
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL:
            VFMW_PROC_PRINT(p, "%-35s : DOLBY_BL\n", "SrcFrmType");
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL:
            VFMW_PROC_PRINT(p, "%-35s : DOLBY_EL\n", "SrcFrmType");
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_HDR10:
            VFMW_PROC_PRINT(p, "%-35s : HDR10\n", "SrcFrmType");
            break;
    #ifdef HI_HDR10PLUS_SUPPORT
        case HI_DRV_VIDEO_FRAME_TYPE_HDR10PLUS:
            PROC_PRINT(p, "%-35s : HDR10+\n", "SrcFrmType");
            break;
    #endif
        case HI_DRV_VIDEO_FRAME_TYPE_HLG:
            VFMW_PROC_PRINT(p, "%-35s : HLG\n",    "SrcFrmType");
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_SLF:
            VFMW_PROC_PRINT(p, "%-35s : SLF\n",    "SrcFrmType");
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR:
            VFMW_PROC_PRINT(p, "%-35s : TECHNICOLOR\n",    "SrcFrmType");
            break;

        default:
            VFMW_PROC_PRINT(p, "%-35s : UNKNOWN\n",    "SrcFrmType");

            break;
    }

    return;
}

static VOID HDR_ReadInputHDRInfo(struct seq_file *p, VID_STD_E eVidStd, HDR_INPUT_S *pstHDRInput)
{
    SINT8 strVidStd[MAX_VID_STD_NAME];

    HDR_ShowStandard(eVidStd, strVidStd);

    VFMW_PROC_PRINT(p, "%-35s : %s\n", "Cfg standard", strVidStd);
    VFMW_PROC_PRINT(p, "%-35s : 0x%x\n", "HDR_Metadata_phy_addr", pstHDRInput->HDR_Metadata_phy_addr);
    VFMW_PROC_PRINT(p, "%-35s : 0x%llx\n", "HDR_Metadata_vir_addr", pstHDRInput->HDR_Metadata_vir_addr);
    VFMW_PROC_PRINT(p, "%-35s : 0x%x\n", "HDR_Metadata_size", pstHDRInput->HDR_Metadata_size);

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "FullRangeFlag", pstHDRInput->ColourInfo.FullRangeFlag);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "ColourPrimaries", pstHDRInput->ColourInfo.ColourPrimaries);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "MatrixCoeffs", pstHDRInput->ColourInfo.MatrixCoeffs);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "TransferCharacteristics", pstHDRInput->ColourInfo.TransferCharacteristics);

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "MasteringAvailable", pstHDRInput->MasteringAvailable);

    if (pstHDRInput->MasteringAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_x",
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_x[0],
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_x[1],
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_x[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d, %d)\n", "DisplayPrimaries_y",
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_y[0],
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_y[1],
                   pstHDRInput->MasteringDisplayColourVolume.DisplayPrimaries_y[2]);

        VFMW_PROC_PRINT(p, "%-35s : (%d, %d)\n", "WhitePoint",
                   pstHDRInput->MasteringDisplayColourVolume.WhitePoint_x,
                   pstHDRInput->MasteringDisplayColourVolume.WhitePoint_x);

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxDisplayMasteringLuminance",
                   pstHDRInput->MasteringDisplayColourVolume.MaxDisplayMasteringLuminance);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MinDisplayMasteringLuminance",
                   pstHDRInput->MasteringDisplayColourVolume.MinDisplayMasteringLuminance);
    }

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "ContentAvailable", pstHDRInput->ContentAvailable);

    if (pstHDRInput->ContentAvailable == 1)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxContentLightLevel",
                   pstHDRInput->ContentLightLevel.MaxContentLightLevel);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "MaxPicAverageLightLevel",
                   pstHDRInput->ContentLightLevel.MaxPicAverageLightLevel);
    }

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "HDRTransferCharacteristicIdc", pstHDRInput->ComapitibilityInfo.HDRTransferCharacteristicIdc);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "SlHDR1MetadataAvailable", pstHDRInput->SlHDR1MetadataAvailable);

#ifdef DOLBY_VISION_HDR_SUPPORT
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "BeDVHDRChan", pstHDRInput->BeDVHDRChan);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "DVCapacity", pstHDRInput->DVCapacity);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "VesImp", pstHDRInput->VesImp);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "LayerImp", pstHDRInput->LayerImp);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "bDVCompatible", pstHDRInput->bDVCompatible);
#endif

    return;
}

#if 0
static VOID HDR_ReadSLHDR1Info(struct seq_file *p, SL_HDR1_METADATA *pSlHDR1Metadata)
{
    UINT32 i = 0;

    SL_HDR1_METADATA_VARIABLES *pVariables = &(pSlHDR1Metadata->Metadata.Variables);
    SL_HDR1_METADATA_TABLES *pTables = &(pSlHDR1Metadata->Metadata.Tables);

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "specVersion", pSlHDR1Metadata->SpecVersion);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "payloadMode", pSlHDR1Metadata->PayloadMode);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "hdrPicColourSpace", pSlHDR1Metadata->HdrPicColourSpace);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "hdrMasterDisplayColourSpace", pSlHDR1Metadata->HdrMasterDisplayColourSpace);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "hdrMasterDisplayMaxLuminance", pSlHDR1Metadata->HdrMasterDisplayMaxLuminance);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "hdrMasterDisplayMinLuminance", pSlHDR1Metadata->HdrMasterDisplayMinLuminance);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "sdrPicColourSpace", pSlHDR1Metadata->SdrPicColourSpace);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "sdrMasterDisplayColourSpace", pSlHDR1Metadata->SdrMasterDisplayColourSpace);

    if (!pSlHDR1Metadata->PayloadMode)
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "tmInputSignalBlackLevelOffset", pVariables->TmInputSignalBlackLevelOffset);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "tmInputSignalWhiteLevelOffset", pVariables->TmInputSignalWhiteLevelOffset);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "shadowGain", pVariables->ShadowGain);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "highlightGain", pVariables->HighlightGain);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "midToneWidthAdjFactor", pVariables->MidToneWidthAdjFactor);

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "tmOutputFineTuningNumVal", pVariables->TmOutputFineTuningNumVal);

        for (i = 0; i < pVariables->TmOutputFineTuningNumVal; i++)
        {
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "tmOutputFineTuningX", i, pVariables->TmOutputFineTuningX[i]);
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "tmOutputFineTuningY", i, pVariables->TmOutputFineTuningY[i]);
        }

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "saturationGainNumVal", pVariables->SaturationGainNumVal);

        for (i = 0; i < pVariables->SaturationGainNumVal; i++)
        {
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "saturationGainX", i, pVariables->SaturationGainX[i]);
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "saturationGainY", i, pVariables->SaturationGainY[i]);
        }
    }
    else
    {
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "luminanceMappingNumVal", pTables->LuminanceMappingNumVal);

        for (i = 0; i < pTables->LuminanceMappingNumVal; i++)
        {
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "luminanceMappingX[%d]", i, pTables->LuminanceMappingX[i]);
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "luminanceMappingY[%d]", i, pTables->LuminanceMappingY[i]);
        }

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "colourCorrectionNumVal", pTables->ColourCorrectionNumVal);

        for (i = 0; i < pTables->ColourCorrectionNumVal; i++)
        {
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "colourCorrectionX", i, pTables->ColourCorrectionX[i]);
            VFMW_PROC_PRINT(p, "%-35s : [%d] %d\n", "colourCorrectionY", i, pTables->ColourCorrectionY[i]);
        }

        VFMW_PROC_PRINT(p, "%-35s : %d\n", "chromaToLumaInjectionMuA", pTables->ChromaToLumaInjectionMuA);
        VFMW_PROC_PRINT(p, "%-35s : %d\n", "chromaToLumaInjectionMuB", pTables->ChromaToLumaInjectionMuB);
    }

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "SL_HDR1_METADATA", (UINT32)sizeof(SL_HDR1_METADATA));

    return;
}
#endif

static VOID HDR_ReadOutputHDRInfo(struct seq_file *p, HDR_OUTPUT_S *pstHDROutput)
{
#ifdef HI_HDR10PLUS_SUPPORT
    UINT8* pMetaData = NULL;
#endif
#ifdef VFMW_DPT_PRODUCT
    SINT8 aszGammaType[32] = {0};
    SINT8 aszColorSpace[32] = {0};
    SINT8 aszLuminaceSys[32] = {0};
    SINT8 aszColorPrime[32] = {0};

    HDR_GetGammaTypeInfo(pstHDROutput->stColourInfo.enGammaType, aszGammaType, sizeof(aszGammaType));
    HDR_GetColorSpaceInfo(pstHDROutput->stColourInfo.enColorSpace, aszColorSpace, sizeof(aszColorSpace));
    HDR_GetLuminaceSysInfo(pstHDROutput->stColourInfo.enLuminaceSys, aszLuminaceSys, sizeof(aszLuminaceSys));
    HDR_GetColorPrimeInfo(pstHDROutput->stColourInfo.enColorPrime, aszColorPrime, sizeof(aszColorPrime));

    HDR_ReadVideoFrameType(p, pstHDROutput->enSrcFrameType);

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "bFullRange", pstHDROutput->stColourInfo.bFullRange);
    VFMW_PROC_PRINT(p, "%-35s : %s\n", "GammaType", aszGammaType);
    VFMW_PROC_PRINT(p, "%-35s : %s\n", "ColorSpace", aszColorSpace);
    VFMW_PROC_PRINT(p, "%-35s : %s\n", "LuminaceSys", aszLuminaceSys);
    VFMW_PROC_PRINT(p, "%-35s : %s\n", "ColorPrimaries", aszColorPrime);
#else
    HDR_ReadVideoFrameType(p, pstHDROutput->enSrcFrameType);

    VFMW_PROC_PRINT(p, "%-35s : %d\n", "FullRangeFlag", pstHDROutput->stColourInfo.u8FullRangeFlag);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "ColourPrimaries", pstHDROutput->stColourInfo.u8ColourPrimaries);
    VFMW_PROC_PRINT(p, "%-35s : %d\n", "MatrixCoeffs", pstHDROutput->stColourInfo.u8MatrixCoeffs);
#endif

    switch (pstHDROutput->enSrcFrameType)
    {
        case HI_DRV_VIDEO_FRAME_TYPE_SDR:
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_DOLBY_BL:
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "bCompatible", pstHDROutput->unHDRInfo.stDolbyInfo.bCompatible);
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "bMetadataValid", pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid);
            VFMW_PROC_PRINT(p, "%-35s : 0x%x\n", "u32Addr", pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Addr);
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "u32Length", pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Length);
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_DOLBY_EL:
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "bCompatible", pstHDROutput->unHDRInfo.stDolbyInfo.bCompatible);
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "bMetadataValid", pstHDROutput->unHDRInfo.stDolbyInfo.bMetadataValid);
            VFMW_PROC_PRINT(p, "%-35s : 0x%x\n", "u32Addr", pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Addr);
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "u32Length", pstHDROutput->unHDRInfo.stDolbyInfo.stMetadata.u32Length);
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_HDR10:
            HDR_ReadHDR10MetadataInfo(p, &(pstHDROutput->unHDRInfo.stHDR10Info));
            break;

    #ifdef HI_HDR10PLUS_SUPPORT
        case HI_DRV_VIDEO_FRAME_TYPE_HDR10PLUS:
            PROC_PRINT(p, "%-35s : %d\n", "bStaticMetadataValid", pstHDROutput->unHDRInfo.stHDR10PlusInfo.bStaticMetadataValid);
            PROC_PRINT(p, "%-35s : %d\n", "bDynamicMetadataValid", pstHDROutput->unHDRInfo.stHDR10PlusInfo.bDynamicMetadataValid);
            HDR_ReadHDR10MetadataInfo(p, &(pstHDROutput->unHDRInfo.stHDR10PlusInfo.stStaticMetadata));

            PROC_PRINT(p, "%-35s : 0x%x\n", "Metadata u32Addr", pstHDROutput->unHDRInfo.stHDR10PlusInfo.stDynamicMetadata.u32Addr);
            PROC_PRINT(p, "%-35s : %d\n", "Metadata u32Length", pstHDROutput->unHDRInfo.stHDR10PlusInfo.stDynamicMetadata.u32Length);

        #ifndef ENV_SOS_KERNEL
            pMetaData = UINT64_PTR(MEM_Phy2Vir(pstHDROutput->unHDRInfo.stHDR10PlusInfo.stDynamicMetadata.u32Addr));
            OSAL_FP_memcpy(&g_stDynamicMetadata, pMetaData, sizeof(g_stDynamicMetadata));

            HDR_ReadHDR10PlusDynamicMetadataInfo(p, &g_stDynamicMetadata);
        #endif
            break;
    #endif

        case HI_DRV_VIDEO_FRAME_TYPE_HLG:
            HDR_ReadHLGMetadataInfo(p, &(pstHDROutput->unHDRInfo.stHLGInfo));
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_SLF:
            break;

        case HI_DRV_VIDEO_FRAME_TYPE_JTP_SL_HDR:
        {
#if 0
            SL_HDR1_METADATA SlHDR1Metadata = {0};
            VOID *pstTechnicolorInfoVirAddr = MEM_Phy2Vir(pstHDROutput->unHDRInfo.stTechnicolorInfo.u32PhyAddr);

            memset(&SlHDR1Metadata, 0, sizeof(SL_HDR1_METADATA));
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "bMetadataValid", pstHDROutput->unHDRInfo.stTechnicolorInfo.bMetadataValid);
            VFMW_PROC_PRINT(p, "%-35s : 0x%x\n", "u32PhyAddr", pstHDROutput->unHDRInfo.stTechnicolorInfo.u32PhyAddr);
            VFMW_PROC_PRINT(p, "%-35s : %d\n", "u32Length", pstHDROutput->unHDRInfo.stTechnicolorInfo.u32Length);

            if (pstTechnicolorInfoVirAddr != NULL)
            {
                memcpy(&SlHDR1Metadata, pstTechnicolorInfoVirAddr, sizeof(SL_HDR1_METADATA));
                HDR_ReadSLHDR1Info(p, &SlHDR1Metadata);

            }
            else
            {
                VFMW_PROC_PRINT(p, "pstTechnicolorInfoVirAddr == NULL\n");
            }

#endif
        }

        break;

        default:
            VFMW_PROC_PRINT(p, "%-35s : UNKNOWN\n",    "SrcFrmType");

            break;
    }
}

static VOID HDR_ReadInfo(struct seq_file *p, HDR_PROC_S *pstHDRInfo)
{
    VFMW_PROC_PRINT(p, "-------------------HDR input Information------------------\n");
    HDR_ReadInputHDRInfo(p, pstHDRInfo->eVidStd, &(pstHDRInfo->stHDRInput));
    VFMW_PROC_PRINT(p, "-------------------HDR output Informatio------------------\n");
    HDR_ReadOutputHDRInfo(p, &(pstHDRInfo->stHDRoutput));

    return;
}

/******************************************
 Read HDR Proc Info
******************************************/
SINT32 HDR_Read_Proc(struct seq_file *p, VOID *v)
{
    if (g_HDREnable == 0)
    {
        seq_printf(p, "HDR Disable\n\n");
    }
    else
    {
        if (g_CurProcChan == g_HDRChan[0].ChanID)
        {
            HDR_ReadInfo(p, &g_HDRChan[0]);
        }
        else if (g_CurProcChan == g_HDRChan[1].ChanID)
        {
            HDR_ReadInfo(p, &g_HDRChan[1]);
        }
    }

    return HDR_OK;
}

static VOID HDR_GetSeprateParam(UINT8 *str, UINT8 *buf, size_t count, UINT32 *index)
{
    UINT32 j = 0;
    UINT32 i = *index;

    for (; i < count; i++)
    {
        if (j == 0 && buf[i] == ' ')
        {
            continue;
        }

        if (buf[i] > ' ')
        {
            str[j++] = buf[i];
        }

        if (j > 0 && buf[i] == ' ')
        {
            break;
        }
    }

    str[j] = 0;
    *index = i;
}

/******************************************
 Write HDR Proc Info
******************************************/
SINT32 HDR_Write_Proc(struct file *file, const char __user *buffer, size_t count, loff_t *data)
{
    UINT32 i;
    UINT8  buf[HDR_CMD_LEN];
    UINT8  str1[HDR_CMD_LEN] = {'\0'};
    UINT8  str2[HDR_CMD_LEN] = {'\0'};

    if (count >= sizeof(buf))
    {
        dprint(PRN_ALWS, "Parameter string is too long!\n");
        return HDR_ERR;
    }

    OSAL_FP_memset(buf, 0, sizeof(buf));

    if (copy_from_user(buf, buffer, count))
    {
        dprint(PRN_ALWS, "Copy from user failed!\n");
        return HDR_ERR;
    }

    buf[count] = 0;

    if (count < 1)
    {
        dprint(PRN_ALWS, "No valid commad!\n");
    }
    else
    {
        /* dat1 */
        i = 0;
        HDR_GetSeprateParam(str1, buf, count, &i);

        /* dat2 */
        HDR_GetSeprateParam(str2, buf, count, &i);

        if (!strncmp(str1, HDR_CMD, strlen(HDR_CMD)))
        {
            if (strncmp(str2, "on", 2) == 0)
            {
                g_HDREnable = 1;
                dprint(PRN_ALWS, "Enable HDR proc.\n");
            }
            else if (strncmp(str2, "off", 3) == 0)
            {
                g_HDREnable = 0;
                dprint(PRN_ALWS, "Disable HDR proc.\n");
            }
            else
            {
                dprint(PRN_ALWS, "Invalid string %s, should be on/off.\n", str2);
            }
        }
        else
        {
            dprint(PRN_ALWS, "Unkown commad!\n");
        }
    }

    return count;
}
#endif

/*----------------------------EXTERNAL FUNCTION-------------------------------*/

/******************************************
 Create HDR proc
******************************************/
VOID HDR_Info_Init(VOID)
{
#ifdef HI_PROC_SUPPORT
    SINT32 ret;
    ret = vfmw_proc_create(HDR_PROC_NAME, HDR_Read_Proc, HDR_Write_Proc);

    if (0 != ret)
    {
        dprint(PRN_ERROR, "%s create proc %s failed!\n", __func__, HDR_PROC_NAME);
        return;
    }
#endif

    return;
}


/******************************************
 Destroy HDR proc
******************************************/
VOID HDR_Info_Exit(VOID)
{
#ifdef HI_PROC_SUPPORT
    vfmw_proc_destroy(HDR_PROC_NAME);
#endif

    return;
}

UINT32 HDR_CheckVidStd(VID_STD_E eVidStd)
{
    if (eVidStd == VFMW_H264
        || eVidStd == VFMW_HEVC
        || eVidStd == VFMW_AVS2)
    {
        return 1;
    }

    return 0;
}

SINT32 HDR_Info_Convert(SINT32 ChanID, IMAGE *pstImage)
{
    HDR_INPUT_S *pstHDRInput;
    HI_DRV_VIDEO_FRAME_S *pstFrame;
    HDR_OUTPUT_S stHDROutput = {0};
    VID_STD_E eVidStd;
    HI_DRV_VIDEO_PRIVATE_S *pstVideoPrivate = NULL;

    VFMW_ASSERT_RETURN((ChanID >= 0 && ChanID < MAX_CHAN_NUM), VDEC_ERR);
    VFMW_ASSERT_RETURN(pstImage != NULL, VDEC_ERR);

    eVidStd = pstImage->eVidStd;

    if (HDR_CheckVidStd(eVidStd) == 0)
    {
        return VDEC_OK;
    }

    pstHDRInput = &(pstImage->stHDRInput);

    pstFrame = (HI_DRV_VIDEO_FRAME_S *)(ULONG)(pstImage->pOutFrame);
    VFMW_ASSERT_RETURN(pstFrame != NULL, VDEC_ERR);

    pstVideoPrivate = (HI_DRV_VIDEO_PRIVATE_S *)(pstFrame->u32Priv);

    VFMW_ASSERT_RETURN(pstVideoPrivate != NULL, VDEC_ERR);

    OSAL_FP_memset(&stHDROutput, 0, sizeof(HDR_OUTPUT_S));

    HDR_FillOutputHDRInfo(eVidStd, pstHDRInput, &stHDROutput);

    pstFrame->enSrcFrameType = stHDROutput.enSrcFrameType;
    pstVideoPrivate->HdrPhyAddr = pstImage->stHDRInput.HDR_Metadata_phy_addr;

    if (sizeof(pstFrame->unHDRInfo) != sizeof(stHDROutput.unHDRInfo))
    {
        dprint(PRN_ERROR, "%s ERROR: size1 %d != size2 %d!\n", __func__, sizeof(pstFrame->unHDRInfo), sizeof(stHDROutput.unHDRInfo));

        return VDEC_ERR;
    }

    OSAL_FP_memcpy(&(pstFrame->unHDRInfo), &(stHDROutput.unHDRInfo), sizeof(pstFrame->unHDRInfo));

#ifdef VFMW_DPT_PRODUCT
    OSAL_FP_memcpy(&(pstFrame->stAdjustedColorDesc), &(stHDROutput.stColourInfo), sizeof(HI_DRV_COLOR_DESCRIPTION_S));
#else
    HDR_CovertVidStd(eVidStd, &pstFrame->enCodecType);
    OSAL_FP_memcpy(&(pstFrame->stColourInfo), &(stHDROutput.stColourInfo), sizeof(stHDROutput.stColourInfo));
#endif

    if (g_HDREnable == HI_TRUE)
    {
    #ifdef HI_PROC_SUPPORT
        HDR_RecordProcInfo(ChanID, pstImage, &stHDROutput);
    #endif
    }

    return VDEC_OK;
}

#ifdef VCODEC_UT_ENABLE
EXPORT_SYMBOL(HDR_Info_Convert);
#endif


