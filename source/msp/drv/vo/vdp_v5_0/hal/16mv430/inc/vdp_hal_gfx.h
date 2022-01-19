#ifndef __HAL_GFX_H__
#define __HAL_GFX_H__

#include "hi_type.h"

HI_VOID VDP_GFX_SetUpdMode(HI_U32 u32Data, HI_U32 u32Mode);
HI_VOID VDP_GP_SetUpdMode(HI_U32 u32Data, HI_U32  u32Rgup);
HI_VOID VDP_DRV_GetGfxState(HI_BOOL *pbNeedProcessGfx);

#endif
