#ifndef __POST_PROCESS_H__
#define __POST_PROCESS_H__


#include "basedef.h"
#include "vdm_hal.h"

#define OPEN_REPAIR

typedef enum
{
    POSTPRO_TRUE  = 0,
    POSTPRO_FALSE = 1
} POSTPRO_RETVAL_E;

typedef enum
{
    RP_STRATAGE_NORMAL,
    RP_STRATAGE_DISABLE_REPAIR,
    RP_STRATAGE_BUTT
} RP_STRATAGE_E;

typedef struct
{
    SINT32    VdhId;
    VID_STD_E VidStd;
    VOID     *pDecParam;
} GetErrRatio_S;

#ifdef __cplusplus
extern "C" {
#endif

#ifdef VFMW_MPEG4_SUPPORT
VOID PostPro_PrepairMpeg4CopyParam(MP4_DEC_PARAM_S *pMp4DecParam, SINT32 VdhId);
#endif
#ifdef VFMW_VC1_SUPPORT
VOID PostPro_PrepairVc1CopyParam(VC1_DEC_PARAM_S *pVc1DecParam, SINT32 VdhId);
#endif
#ifdef VFMW_VP6_SUPPORT
VOID PostPro_PrepairVp6CopyParam(VP6_DEC_PARAM_S *pVp6DecParam, SINT32 VdhId);
#endif
#ifdef VFMW_VP9_SUPPORT
VOID PostPro_PrepairVp9CopyParam(VP9_DEC_PARAM_S *pVp9DecParam, SINT32 VdhId);
#endif

SINT32 PostPro_GetErrRatio(GetErrRatio_S *pParam);
SINT32 PostPro_SetFullRepair(VID_STD_E VidStd, VOID *pDecParam, SINT32 VdhId);
RP_STRATAGE_E PostPro_GetRepairStratage(SINT32 ChanID, VID_STD_E VidStd, VOID *pDecParam);

#ifdef __cplusplus
}
#endif

#endif //__POST_PROCESS_H__

