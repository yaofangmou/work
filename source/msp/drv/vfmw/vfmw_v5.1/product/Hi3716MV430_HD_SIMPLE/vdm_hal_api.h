#ifndef _VDM_HAL_API_HEADER_
#define _VDM_HAL_API_HEADER_

#include "basedef.h"
#include "mem_manage.h"
#include "vfmw.h"
#include "vfmw_ctrl.h"

#ifdef __cplusplus
extern "C" {
#endif

SINT32 VDMHAL_GetHalMemSize(UINT32 VdhId);
SINT32 VDMHAL_OpenHAL(VDMHAL_OPENPARAM_S *pOpenParam);
VOID   VDMHAL_CloseHAL(SINT32 VdhId);
SINT32 VDMHAL_InquireMemNeed(MEM_REQ_TYPE_E eMemType, MEM_REQ_DESC_S *pMemReq, MEM_NEED_DESC_S *pMemNeed);
VOID   VDMHAL_ResetVdm(SINT32 VdhId);
VOID   VDMHAL_SetSmmuPageTableAddr(UINT32 VdhId);
VOID   VDMHAL_EnableSmmu(VOID);
VOID   VDMHAL_GlbReset(VOID);
VOID   VDMHAL_GlbResetX(SINT32 VdhId);
VOID   VDMHAL_ClearIntState(SINT32 VdhId);
VOID   VDMHAL_ClearMMUIntState(SINT32 VdhId);
VOID   VDMHAL_MaskInt(SINT32 VdhId);
VOID   VDMHAL_EnableInt(SINT32 VdhId);
SINT32 VDMHAL_CheckReg(REG_ID_E reg_id, SINT32 VdhId);
UINT32 VDMHAL_ReadMMUMask(SINT32 VdhId);
VOID   VDMHAL_WriteMMUMask(UINT32 mask, SINT32 VdhId);
VOID   VDMHAL_StartHwRepair(SINT32 VdhId, VOID *pTask);
VOID   VDMHAL_StartHwDecode(SINT32 VdhId, VOID *pTask);
SINT32 VDMHAL_PrepareDec(VID_STD_E VidStd, VOID *pDecParam, SINT32 VdhId, VOID *pTask);
SINT32 VDMHAL_IsVdmReady(SINT32 VdhId);
SINT32 VDMHAL_IsVdmRun(SINT32 VdhId);
SINT32 VDMHAL_PrepareRepair(VID_STD_E VidStd, VOID *pDecParam, VDMDRV_STATEMACHINE_E RepairState, SINT32 VdhId, VOID *pTask);
SINT32 VDMHAL_GetUvMOSParam(UvMOSParam *pUvMOSParam, SINT32 VdhId);
SINT32 VDMHAL_MakeDecReport(MAKE_DEC_REPORT_S *pMakeDecReport);
SINT32 VDMHAL_UpdateHardwareInfo(SINT32 VdhId);
SINT32 VDMHAL_IsVdhDecOver(REG_ID_E reg_id, SINT32 VdhId);
SINT32 VDMHAL_IsVdhPartDecOver(REG_ID_E reg_id, SINT32 VdhId);
VOID   VDMHAL_GetRepairRequire(VDMDRV_REPAIR_REQUIRE_E *pRepairRequire);
VOID   VDMHAL_DeriveDecCmpHeadInfo(UINT32 Width, UINT32 Height, UINT32 *pHeadStride, UINT32 *pHeadInfSize);
VOID   CRG_ConfigReg(UINT32 Reg, UINT32 Data, VOID *pTask);
VOID   MFDE_ConfigReg(UINT32 Reg, UINT32 Data, SINT32 Id, VOID *pTask);
SINT32 VDMHAL_DeriveMemSize(MEM_REQ_DESC_S *pMemReq, MEM_NEED_DESC_S *pMemNeed);

#ifdef ENV_ARMLINUX_KERNEL
SINT32 VDMHAL_DumpYuv(SINT32 ChanID, IMAGE *pImage, VOID *pFileHandler, DUMP_YUV_TYPE_E eType);
#endif

#ifdef __cplusplus
}
#endif

#endif

