#ifndef _XDP_DEFINE_H_
#define _XDP_DEFINE_H_

#include "hi_type.h"

typedef enum
{
    XDP_DATA_TYPE_SP_LINEAR = 0x0,
    XDP_DATA_TYPE_SP_TILE   = 0x1,
    XDP_DATA_TYPE_PACKAGE   = 0x2,
    XDP_DATA_TYPE_PLANAR    = 0x3,
    XDP_DATA_TYPE_BUTT
}XDP_DATA_TYPE_E;

typedef enum
{
    XDP_PROC_FMT_SP_420      = 0x0,
    XDP_PROC_FMT_SP_422      = 0x1,
    XDP_PROC_FMT_SP_444      = 0x2,//plannar,in YUV color domain
    XDP_PROC_FMT_SP_400      = 0x3,//plannar,in YUV color domain
    XDP_PROC_FMT_RGB_888     = 0x4,//package,in RGB color domain
    XDP_PROC_FMT_RGB_444     = 0x5,//plannar,in RGB color domain

    XDP_PROC_FMT_BUTT

}XDP_PROC_FMT_E;

typedef enum
{
    XDP_RMODE_INTERFACE   = 0,
    XDP_RMODE_INTERLACE   = 0,
    XDP_RMODE_PROGRESSIVE = 1,
    XDP_RMODE_TOP         = 2,
    XDP_RMODE_BOTTOM      = 3,
    XDP_RMODE_PRO_TOP     = 4,
    XDP_RMODE_PRO_BOTTOM  = 5,
    XDP_RMODE_PRO_INTERFACE  = 6,
    XDP_RMODE_BUTT

} XDP_DATA_RMODE_E;

typedef enum
{
    XDP_DATA_WTH_8  = 0,
    XDP_DATA_WTH_10 = 1,
    XDP_DATA_WTH_12 = 2,
    XDP_DATA_WTH_16 = 3,
    XDP_DATA_WTH_BUTT
}XDP_DATA_WTH;

typedef struct
{
    HI_U64 u64Addr;
    HI_U32 u32Str;
}XDP_SOLO_ADDR_S;

typedef struct
{
    HI_U32 u32X;
    HI_U32 u32Y;

    HI_U32 u32Wth;
    HI_U32 u32Hgt;

    HI_U32 u32SrcW;
    HI_U32 u32SrcH;

}XDP_RECT_S;

#endif
