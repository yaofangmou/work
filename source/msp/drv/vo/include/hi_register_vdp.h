
#ifndef __HI_REFISTER_VDP_H__
#define __HI_REFISTER_VDP_H__

#include "hi_type.h"

#if defined(CHIP_TYPE_hi3798mv100) || defined(CHIP_TYPE_hi3796mv100)

#include "./hi3798mv100/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3716mv410) || defined(CHIP_TYPE_hi3716mv420)

#include "./hi3716mv410/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3798mv200) || defined(CHIP_TYPE_hi3798mv300)

#include "./hi3798mv200/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3798mv310)

#include "./hi3798mv310/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3798cv200)

#include "./hi3798cv200/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450)

#include "./hi3796mv200/hi_reg_vdp.h"

#elif defined(CHIP_TYPE_hi3716mv430)

#include "./hi3716mv430/hi_reg_vdp.h"
#include "./hi3716mv430/hi_reg_vpss_wbc.h"

#endif

#endif
