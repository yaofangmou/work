#include "hi_type.h"
#include "vdp_drv_comm.h"
#include "vdp_drv_wbc.h"
#include "vdp_drv_vid.h"
#include "vdp_drv_vid.h"
extern VDP_LAYER_WBC_INFO_S g_stLayWBCInfo;
HI_S32 VDP_DRV_SetWbcLayer(HI_U32 u32LayerId, VDP_LAYER_WBC_INFO_S *pstInfo)
{
    g_stLayWBCInfo = *pstInfo;
    return  HI_SUCCESS;
}
