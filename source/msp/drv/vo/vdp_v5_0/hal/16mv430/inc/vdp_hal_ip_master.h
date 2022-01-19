#ifndef __VDP_HAL_IP_MASTER_H__
#define __VDP_HAL_IP_MASTER_H__

#include "hi_type.h"

HI_VOID VDP_MASTER_SetMstr0Woutstanding(HI_U32 mstr0_woutstanding);
HI_VOID VDP_MASTER_SetMstr0Routstanding(HI_U32 mstr0_routstanding);
HI_VOID VDP_MASTER_SetMidEnable(HI_U32 mid_enable);
HI_VOID VDP_MASTER_SetArbMode(HI_U32 arb_mode);
HI_VOID VDP_MASTER_SetSplitMode(HI_U32 split_mode);
HI_VOID VDP_MASTER_SetRchnPrio(HI_U32 id, HI_U32 prio);

#endif
