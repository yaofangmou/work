
#ifndef _VDM_HAL_HEADER_
#define _VDM_HAL_HEADER_

#ifdef __cplusplus
extern "C" {
#endif

#include "decparam.h"
#include "vdm_drv.h"

#ifdef VDH_DISTRIBUTOR_ENABLE
#ifdef ENV_SOS_KERNEL
#include "vdh_secure.h"
#else
#include "vdh_normal.h"
#endif
#endif

#define   VDMHAL_OK                       (0)
#define   VDMHAL_ERR                      (-1)
#define   VDMHAL_NOT_ARRANGE              (2)
#define   VDMHAL_FUN_FALSE                (0)
#define   VDMHAL_FUN_TRUE                 (1)

// VDM MAKE REPORT
#define   VDM_RET_RIGHT                   (0)
#define   VDM_RET_ERROR                   (1)

// define para
#define   DNR_FRAME                       (0)
#define   DNR_TOP_FIELD                   (1)
#define   DNR_BOTTOM_FIELD                (2)
#define   DNR_BAFF                        (3)
#define   DNR_FIELD_PAIR                  (4)

#define RD_VREG(reg, dat, VdhId)               \
    do {                    \
        if (VdhId < MAX_VDH_NUM)                \
        {                    \
            dat = *((volatile SINT32 *)((SINT8 *)g_HwMem[VdhId].pVdmRegVirAddr + reg)); \
        }                    \
        else                 \
        {                    \
            dprint(PRN_ALWS,"%s: RD_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n", __func__, VdhId, MAX_VDH_NUM); \
        }                    \
    } while (0)

#define WR_VREG(reg, dat, VdhId)               \
    do {                     \
        if (VdhId < MAX_VDH_NUM)                \
        {                    \
            *((volatile SINT32 *)((SINT8 *)g_HwMem[VdhId].pVdmRegVirAddr + reg)) = dat; \
        }                    \
        else                 \
        {                    \
            dprint(PRN_ALWS,"%s: WR_VREG but VdhId(%d) > MAX_VDH_NUM(%d)\n", __func__, VdhId, MAX_VDH_NUM); \
        }                    \
    } while (0)

#define RD_BPD_VREG( reg, dat )               \
    do {                    \
        dat = *((volatile SINT32 *)((SINT8 *)g_HwMem[0].pBpdRegVirAddr + reg)); \
    } while (0)

#define WR_BPD_VREG( reg, dat )               \
    do {                    \
        *((volatile SINT32 *)((SINT8 *)g_HwMem[0].pBpdRegVirAddr + reg)) = dat; \
    } while (0)

#define RD_MSGWORD(vir_addr, dat)          \
    do {                 \
        dat = *((volatile SINT32 *)((SINT8 *)vir_addr));                        \
    } while (0)

#define WR_MSGWORD(vir_addr, dat)          \
    do {                 \
        if ((SINT8 *)vir_addr - (SINT8 *)(g_HwMem[0].pDnMsgStartAddr) >= g_HwMem[0].DnMsgSize) \
        { \
            g_HwMem[0].IsDnMsgPolluted = VDEC_TRUE; \
        } \
        else \
        { \
            *((volatile SINT32 *)((SINT8 *)(vir_addr))) = dat;                  \
        } \
    } while(0)

#define VDMHAL_ASSERT_RET(cond, else_print)     \
    do {               \
        if (!(cond))            \
        {               \
            dprint(PRN_FATAL,"%s: %s\n", __func__, else_print); \
            return VDMHAL_ERR;          \
        }               \
    } while (0)

#define VDMHAL_ASSERT(cond, else_print)      \
    do {               \
        if (!(cond))            \
        {               \
            dprint(PRN_FATAL,"%s: %s\n", __func__, else_print); \
            return;             \
        }               \
    } while (0)

typedef enum
{
    MEM_REQ_TYPE_SELF_DEC,
    MEM_REQ_TYPE_USER_DEC,
    MEM_REQ_TYPE_BUTT,
} MEM_REQ_TYPE_E;

typedef struct
{
    UINT8   LinearEn;
    UINT8   CompressEn;
    UINT8   BitDepth;
    UINT32  DecFsNum;
    UINT32  DecFsSize;
    UINT32  HeadStride;
    UINT32  HeadSize;
    UINT32  YStride;
    UINT32  UVStride;
    UINT32  ChromOffset;
    UINT32  Stride_nbit;
    UINT32  LumaOffset_nbit;
    UINT32  ChromOffset_nbit;
} MEM_DEC_S;

typedef struct
{
    UINT8   LinearEn;
    UINT8   CompressEn;
    UINT8   BitDepth;
    UINT32  DispFsNum;
    UINT32  DispFsSize;
    UINT32  HeadStride;
    UINT32  HeadSize;
    UINT32  YStride;
    UINT32  UVStride;
    UINT32  ChromOffset;
} MEM_DISP_S;

typedef struct
{
    VBOOL   NeedDispFs;
    VBOOL   NeedPmv;
    VBOOL   NeedMetadata;
    VBOOL   IsPmvNeedMap;
    UINT32  PmvSize;
    UINT32  PmvNum;
    UINT32  MetadataSize;
    UINT32  MetadataNum;
    UINT32  BackTunnelSize;
    UINT32  LineNumOffset;

    MEM_DEC_S  stDecInfo;
    MEM_DISP_S stDispInfo;
} MEM_NEED_DESC_S;

typedef struct
{
    SINT32  ChanID;
    UINT8   CompressEn;
    UINT8   DispCompressEn;
    UINT8   DecBitDepth;
    SINT8   DispBitDepth;
    UINT32  BeHDRChn;
    VID_STD_E eVidStd;
    UINT32  DecFsWidth;
    UINT32  DecFsHeight;
    UINT32  DispFsWidth;
    UINT32  DispFsHeight;
    UINT32  ExpectDecNum;
    UINT32  ExpectPmvNum;
    VBOOL   bOnlyOneIFrame;
    VBOOL   NoGapEn;
} MEM_REQ_DESC_S;

typedef enum
{
    DUMP_YUV_DEC,
    DUMP_YUV_DISP,
    DUMP_YUV_BUTT
} DUMP_YUV_TYPE_E;

#define MPEG2_DUMMY_BITS              24

#define SHORT_HEADER_ID       1
#define NON_SHORT_HEADER_ID   2
#define RSHIFT(a,b) ( (a)>0 ? (((a) + ((1<<(b))>>1))>>(b)) : (((a) + ((1<<(b))>>1)-1)>>(b)))

/* Filter strength tables */
/* default strength specified by RV_Default_Deblocking_Strength (0) */
#define RV8_Default_Deblocking_Strength     0

/* Filter strength tables */
/* default strength specified by RV_Default_Deblocking_Strength (0) */
#define RV9_Default_Deblocking_Strength     0

typedef struct hiVDMHAL_FUN_PTR_S
{
    /*VDM_DRV*/
    VOID (*pfun_VDMDRV_SetClockSkip)(UINT32 SkipValue);
    VOID (*pfun_VDMDRV_OpenHardware)(SINT32 VdhId);
    VOID (*pfun_VDMDRV_CloseHardware)(SINT32 VdhId);
    VOID (*pfun_DSPDRV_OpenHardware)(SINT32 VdhId);
    VOID (*pfun_DSPDRV_CloseHardware)(SINT32 VdhId);
    VOID (*pfun_SCDDRV_OpenHardware)(SINT32 ScdId);
    VOID (*pfun_SCDDRV_CloseHardware)(SINT32 ScdId);
    VOID (*pfun_BPDDRV_OpenHardware)(SINT32 BpdId);
    VOID (*pfun_BPDDRV_CloseHardware)(SINT32 BpdId);
    VOID (*pfun_MMUDRV_OpenHardware)(SINT32 MmuId);
    VOID (*pfun_MMUDRV_CloseHardware)(SINT32 MmuId);
    /*VDM_HAL*/
    SINT32(*pfun_VDMHAL_GetHalMemSize)(UINT32 VdhId);
    SINT32(*pfun_VDMHAL_OpenHAL)(VDMHAL_OPENPARAM_S *pOpenParam);
    VOID (*pfun_VDMHAL_CloseHAL)(SINT32 VdhId);
    SINT32(*pfun_VDMHAL_InquireMemNeed)(MEM_REQ_TYPE_E eMemType, MEM_REQ_DESC_S *pMemReq, MEM_NEED_DESC_S *pMemNeed);
    VOID (*pfun_VDMHAL_SetSmmuPageTableAddr)(UINT32 VdhId);
    VOID (*pfun_VDMHAL_EnableSmmu)(VOID);
    VOID (*pfun_VDMHAL_ResetVdm)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_GlbReset)(VOID);
    VOID (*pfun_VDMHAL_GlbResetX)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_ClearIntState)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_ClearMMUIntState)(SINT32 vdh_id);
    VOID (*pfun_VDMHAL_MaskInt)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_EnableInt)(SINT32 VdhId);
    SINT32(*pfun_VDMHAL_CheckReg)(REG_ID_E reg_id, SINT32 VdhId);
    UINT32(*pfun_VDMHAL_ReadMMUMask)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_WriteMMUMask)(UINT32 mask, SINT32 VdhId);
    VOID (*pfun_VDMHAL_StartHwRepair)(SINT32 VdhId, VOID *pTask);
    VOID (*pfun_VDMHAL_StartHwDecode)(SINT32 VdhId, VOID *pTask);
    SINT32(*pfun_VDMHAL_PrepareDec)(VID_STD_E VidStd, VOID *pDecParam, SINT32 VdhId, VOID *pTask);
    SINT32(*pfun_VDMHAL_IsVdmReady)(SINT32 VdhId);
    SINT32(*pfun_VDMHAL_IsVdmRun)(SINT32 VdhId);
    SINT32(*pfun_VDMHAL_PrepareRepair)(VID_STD_E VidStd, VOID *pDecParam, VDMDRV_STATEMACHINE_E RepairState, SINT32 VdhId, VOID *pTask);
    SINT32(*pfun_VDMHAL_GetUvMOSParam)(UvMOSParam *pUvMOSParam, SINT32 VdhId);
    SINT32(*pfun_VDMHAL_MakeDecReport)(MAKE_DEC_REPORT_S *pMakeDecReport);
    SINT32(*pfun_VDMHAL_UpdateHardwareInfo)(SINT32 VdhId);
    VOID (*pfun_VDMHAL_WriteScdEMARID)(VOID);
    SINT32(*pfun_VDMHAL_IsVdhDecOver)(REG_ID_E reg_id, SINT32 VdhId);
    SINT32(*pfun_VDMHAL_IsVdhPartDecOver)(REG_ID_E reg_id, SINT32 VdhId);
    VOID (*pfun_VDMHAL_GetRepairRequire)(VDMDRV_REPAIR_REQUIRE_E *pRepairRequire);
    SINT32(*pfun_VDMHAL_DumpYuv)(SINT32 ChanID, IMAGE *pImage, VOID *pFileHandler, DUMP_YUV_TYPE_E eType);

    SINT32(*pfun_VDMHAL_DeriveMemSize)(MEM_REQ_DESC_S *pMemReq, MEM_NEED_DESC_S *pMemNeed);
} VDMHAL_FUN_PTR_S;

extern VDMHAL_FUN_PTR_S g_vdm_hal_fun_ptr;

#define  VDMHAL_NULL_FUN_PTR             -1
#define  VDMHAL_NULL_FUN_PRINT   dprint(PRN_FATAL,"VDMHAL_NULL_FUN_PRINT,L%d\n", __LINE__)

#define VDMDRV_SetClockSkip(SkipValue) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMDRV_SetClockSkip)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMDRV_SetClockSkip(SkipValue); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_OpenHardware(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMDRV_OpenHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMDRV_OpenHardware(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_CloseHardware(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMDRV_CloseHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMDRV_CloseHardware(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define DSPDRV_OpenHardware(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_DSPDRV_OpenHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_DSPDRV_OpenHardware(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define DSPDRV_CloseHardware(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_DSPDRV_CloseHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_DSPDRV_CloseHardware(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)


#define SCDDRV_OpenHardware(ScdId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_SCDDRV_OpenHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_SCDDRV_OpenHardware(ScdId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define SCDDRV_CloseHardware(ScdId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_SCDDRV_CloseHardware)  \
        { \
            g_vdm_hal_fun_ptr.pfun_SCDDRV_CloseHardware(ScdId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_CloseHAL(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_CloseHAL)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_CloseHAL(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_ResetVdm(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_ResetVdm)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_ResetVdm(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_SetSmmuPageTableAddr(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_SetSmmuPageTableAddr)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_SetSmmuPageTableAddr(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_EnableSmmu() \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_EnableSmmu)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_EnableSmmu(); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_GlbReset( ) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_GlbReset)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_GlbReset( ); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_GlbResetX(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_GlbResetX)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_GlbResetX(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_ClearIntState(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_ClearIntState)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_ClearIntState(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_ClearMMUIntState(VdhId) \
    do \
    { \
        if (NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_ClearMMUIntState)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_ClearMMUIntState(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    } while(0)

#define VDMDRV_MaskInt(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_MaskInt)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_MaskInt(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_EnableInt(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_EnableInt)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_EnableInt(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_StartHwRepair(VdhId, pTask) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_StartHwRepair)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_StartHwRepair(VdhId, pTask); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_StartHwDecode(VdhId, pTask) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_StartHwDecode)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_StartHwDecode(VdhId, pTask); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_GetUvMOSParam(pUvMOSParam, VdhId, Ret) \
    do \
    { \
        if (NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_GetUvMOSParam)  \
        { \
            Ret = g_vdm_hal_fun_ptr.pfun_VDMHAL_GetUvMOSParam(pUvMOSParam, VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    } while(0)


#define VDMDRV_MakeDecReport(pMakeDecReport) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_MakeDecReport)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_MakeDecReport(pMakeDecReport); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_UpdateHardwareInfo(VdhId) \
    do \
    { \
        if(NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_UpdateHardwareInfo)  \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_UpdateHardwareInfo(VdhId); \
        }  \
        else  \
        {  \
            VDMHAL_NULL_FUN_PRINT;  \
        }  \
    }while(0)

#define VDMDRV_WriteScdEMARID() \
    do \
    { \
        if (NULL != g_vdm_hal_fun_ptr.pfun_VDMHAL_WriteScdEMARID) \
        { \
            g_vdm_hal_fun_ptr.pfun_VDMHAL_WriteScdEMARID(); \
        } \
        else \
        { \
            VDMHAL_NULL_FUN_PRINT; \
        } \
    } while (0)

#define BPDDRV_OpenHardware(BpdId) \
    (g_vdm_hal_fun_ptr.pfun_BPDDRV_OpenHardware? \
     g_vdm_hal_fun_ptr.pfun_BPDDRV_OpenHardware(BpdId): \
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_GetHalMemSize(VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_GetHalMemSize? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_GetHalMemSize(VdhId): \
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_OpenHAL(pOpenParam) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_OpenHAL? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_OpenHAL(pOpenParam): \
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_InquireMemNeed(eMemType, pMemReq, pMemNeed) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_InquireMemNeed? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_InquireMemNeed(eMemType, pMemReq, pMemNeed):\
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_CheckReg(reg_id, VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_CheckReg? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_CheckReg(reg_id, VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_ReadMMUMask(VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_ReadMMUMask ? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_ReadMMUMask(VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_WriteMMUMask(mask, VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_WriteMMUMask? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_WriteMMUMask(mask, VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_PrepareDec(VidStd, pDecParam, VdhId, pTask) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_PrepareDec? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_PrepareDec(VidStd, pDecParam, VdhId, pTask): \
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_IsVdmReady(VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdmReady? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdmReady(VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_IsVdmRun(VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdmRun? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdmRun(VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_DeriveMemSize(pMemReq, pMemNeed) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_DeriveMemSize? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_DeriveMemSize(pMemReq, pMemNeed): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_PrepareRepair(VidStd, pDecParam, RepairState, VdhId, pTask) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_PrepareRepair? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_PrepareRepair(VidStd, pDecParam, RepairState, VdhId, pTask): \
     VDMHAL_NULL_FUN_PTR)

#define BPDDRV_CloseHardware(BpdId) \
    (g_vdm_hal_fun_ptr.pfun_BPDDRV_CloseHardware? \
     g_vdm_hal_fun_ptr.pfun_BPDDRV_CloseHardware(BpdId): \
     VDMHAL_NULL_FUN_PTR)

#define MMUDRV_OpenHardware(MmuId) \
    (g_vdm_hal_fun_ptr.pfun_MMUDRV_OpenHardware? \
     g_vdm_hal_fun_ptr.pfun_MMUDRV_OpenHardware(MmuId): \
     VDMHAL_NULL_FUN_PTR)

#define MMUDRV_CloseHardware(MmuId) \
    (g_vdm_hal_fun_ptr.pfun_MMUDRV_CloseHardware? \
     g_vdm_hal_fun_ptr.pfun_MMUDRV_CloseHardware(MmuId): \
     VDMHAL_NULL_FUN_PTR)

#define VDMDRV_IsVdhDecOver(reg_id, VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdhDecOver? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdhDecOver(reg_id, VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_IsVdhPartDecOver(reg_id, VdhId) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdhPartDecOver? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_IsVdhPartDecOver(reg_id, VdhId): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_GetRepairRequire(pRepairRequire) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_GetRepairRequire? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_GetRepairRequire(pRepairRequire): \
     VDMHAL_FUN_FALSE)

#define VDMDRV_DumpYuv(ChanID, pImage, pFileHandler, eType) \
    (g_vdm_hal_fun_ptr.pfun_VDMHAL_DumpYuv? \
     g_vdm_hal_fun_ptr.pfun_VDMHAL_DumpYuv(ChanID, pImage, pFileHandler, eType): \
     VDMHAL_FUN_FALSE)

#ifdef __cplusplus
}
#endif


#endif
