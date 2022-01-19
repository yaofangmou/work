#ifndef __HAL_IP_VPSS_WCHN_H__
#define __HAL_IP_VPSS_WCHN_H__

#include "hi_register_vdp.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

//-------------------------------------------------
// vpss mac wchn hal image
//-------------------------------------------------
HI_VOID VPSS_WCHN_SetEn              ( S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en            );
HI_VOID VPSS_WCHN_SOLO_SetEn         ( S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en            );

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
