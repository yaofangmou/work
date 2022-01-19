#ifndef __DRV_MASK_H__
#define __DRV_MASK_H__

#include "hi_type.h"
#include "hi_register_vdp.h"

#include "drv_win_priv.h"


typedef struct
{
    HI_U32 u32CurIdx;
    HI_U8 *pu8QBufVirAddr;
    HI_BOOL bProgress;
    HI_BOOL bTopFirst;
    HI_BOOL bReadTop;
    HI_BOOL bReadBtm;
    HI_U32  u32TopTaskType;
    HI_U32  u32BtmTaskType;
    HI_BOOL  bTopHwareOffline;
    HI_BOOL  bBtmHwareOffline;

    HI_U32 u32SrcWth;
    HI_U32 u32SrcHgt;
    HI_U32 u32V0InWth;
    HI_U32 u32V0InHgt;
    HI_U32 u32VfInWth;
    HI_U32 u32VfInHgt;
    HI_U32 u32ZmeOutWth;
    HI_U32 u32ZmeOutHgt;
    HI_U32 u32IntfWth;
    HI_U32 u32IntfHgt;
}VDP_QBUFINFO_S;


HI_VOID VDP_InitDispResoChangeFlow(HI_VOID);

HI_S32 VDP_DispResoChangeCfgFlow(WINDOW_S *pstWin,
                                            HI_DISP_DISPLAY_INFO_S *pstInfo,
                                            VDP_CHANGEINFO_S *pstChgInfo);


#endif

