#ifndef __VDP_ASSERT_H__
#define __VDP_ASSERT_H__

#include "hi_register_vdp.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

HI_VOID VDP_DRV_CheckOffPart(S_VDP_REGS_TYPE *pstLogicRegs);

HI_VOID VDP_DRV_CheckOnlPart(S_VDP_REGS_TYPE *pstLogicRegs);

HI_VOID VDP_DRV_CheckAllPath(S_VDP_REGS_TYPE *pstLogicRegs);


#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
