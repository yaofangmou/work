#ifndef __HAL_IP_VPSS_RCHN_H__
#define __HAL_IP_VPSS_RCHN_H__

#include "hi_register_vdp.h"
#include "hi_type.h"

#ifdef __cplusplus
#if __cplusplus
extern "C"{
#endif
#endif /* __cplusplus */

//-------------------------------------------------
// vpss mac rchn hal image
//-------------------------------------------------
HI_VOID VPSS_RCHN_SetEn               ( S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en                );
//-------------------------------------------------
// vpss mac rchn hal solo
//-------------------------------------------------
HI_VOID VPSS_RCHN_SOLO_SetEn          ( S_VPSS_REGS_TYPE *pstReg, HI_U32 offset, HI_U32 en                );

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif
