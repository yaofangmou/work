#ifndef __VDP_DRV_PQ_TCHDR_H__
#define __VDP_DRV_PQ_TCHDR_H__

#include "hi_type.h"
#include "vdp_gen_coef.h"
#include "drv_disp_technicolor.h"


HI_VOID VDP_FUNC_FormatTchdrCoefToDDR(VDP_RM_COEF_MODE_E enCoefMode, HI_PQ_SL_HDR_PS_PARAM_S *stPsParam);
HI_VOID VDP_FUNC_LoadTchdrCoefFromDdr2Reg(HI_VOID);


#endif
