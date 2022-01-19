#ifndef _VDP_DEFINE_H_
#define _VDP_DEFINE_H_

#include "vdp_ip_define.h"
#include "xdp_define.h"

typedef enum tagXDP_REGMEM_ID_E
{
    XDP_REGMEM_ID0 = 0,
    XDP_REGMEM_ID1 = 1,

    XDP_REGMEM_ID_BUTT

}XDP_REGMEM_ID_E;

//-----------------------------------
//debug define
//-----------------------------------
#define VDP_CBB_FPGA    1

//-----------------------------------
//architecture define
//-----------------------------------
#define VID_MAX        2
#define GFX_MAX        3
#define WBC_MAX        2
#define CHN_MAX        3
#define INTF_MAX       4
#define GP_MAX         2
#define VP_MAX         2
#define CBM_MAX        5

#define VDP_ASSERT(expr)  if(!(expr)) {printk("Error at :\n >>>>>>>>>>Function : %s\n >>>>>>>>>>LINE = %d\n >>>>>>>>>>Condition: %s\n",__FUNCTION__,__LINE__, #expr);  ; }

#if (!defined(HI_MINIBOOT_SUPPORT) &&  !defined(__DISP_PLATFORM_BOOT__))
  #define VDP_PRINT   DISP_ERROR
#else
  #define VDP_PRINT   printf
#endif//_DISP_PLATFORM_BOOT_

#define DISP_BASE_ADDRESS 0xf8cc0000UL
#define DISP_INT_NUMBER   112

typedef enum tagDISP_VENC_E
{
    DISP_VENC_HDATE0 = 0,
    DISP_VENC_SDATE0,
    DISP_VENC_VGA0,
    DISP_VENC_MAX
}DISP_VENC_E;

typedef enum tagVDP_RM_LAYER_E
{
    VDP_RM_LAYER_VID0 = 0,
    VDP_RM_LAYER_VID1,
    VDP_RM_LAYER_VID2,
    VDP_RM_LAYER_VID3,
    VDP_RM_LAYER_VID4,
    VDP_RM_LAYER_GFX0,
    VDP_RM_LAYER_GFX1,
    VDP_RM_LAYER_GFX2,
    VDP_RM_LAYER_GFX3,
    VDP_RM_LAYER_GFX4,
    VDP_RM_LAYER_WBC_HD0,
    VDP_RM_LAYER_WBC_GP0,
    VDP_RM_LAYER_GP0,
    VDP_RM_LAYER_GP1,
    VDP_RM_LAYER_VP0,
    VDP_RM_LAYER_TT,

} VDP_RM_LAYER_E;

#endif
