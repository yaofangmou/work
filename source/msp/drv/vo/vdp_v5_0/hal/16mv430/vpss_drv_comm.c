#include "vpss_drv_comm.h"

XDP_DATA_RMODE_E RMODE_ADP(VDP_DATA_RMODE_E enRmod)
{
    XDP_DATA_RMODE_E enDataRmod = XDP_RMODE_INTERFACE;

    switch (enRmod)
    {
        case VDP_RMODE_INTERLACE:
        {
            enDataRmod = XDP_RMODE_INTERLACE;
            break;
        }
        case VDP_RMODE_PROGRESSIVE:
        {
            enDataRmod = XDP_RMODE_PROGRESSIVE;
            break;
        }
        case VDP_RMODE_TOP:
        {
            enDataRmod = XDP_RMODE_TOP;
            break;
        }
        case VDP_RMODE_BOTTOM:
        {
            enDataRmod = XDP_RMODE_BOTTOM;
            break;
        }
        case VDP_RMODE_PRO_TOP:
        {
            enDataRmod = XDP_RMODE_PRO_TOP;
            break;
        }
        case VDP_RMODE_PRO_BOTTOM:
        {
            enDataRmod = XDP_RMODE_PRO_BOTTOM;
            break;
        }
        default:
            break;

    }

    return enDataRmod;
}

XDP_PROC_FMT_E FMT_ADP(VDP_VID_IFMT_E enFmt)
{
    XDP_PROC_FMT_E enProcFmt = XDP_PROC_FMT_SP_420;

    switch (enFmt)
    {
        case VDP_VID_IFMT_SP_400:
        case VDP_VID_IFMT_SP_TILE_400:
        {
            enProcFmt = XDP_PROC_FMT_SP_400;
            break;
        }
        case VDP_VID_IFMT_SP_420:
        case VDP_VID_IFMT_SP_TILE:
        case VDP_VID_IFMT_SP_TILE_64:
        {
            enProcFmt = XDP_PROC_FMT_SP_420;
            break;
        }
        case VDP_VID_IFMT_SP_422:
        {
            enProcFmt = XDP_PROC_FMT_SP_422;
            break;
        }
        case VDP_VID_IFMT_SP_444:
        {
            enProcFmt = XDP_PROC_FMT_SP_444;
            break;
        }
        case VDP_VID_IFMT_RGB_888:
        case VDP_VID_IFMT_PKG_888:
        {
            enProcFmt = XDP_PROC_FMT_RGB_888;
            break;
        }
        case VDP_VID_IFMT_PKG_444:
        case VDP_VID_IFMT_PKG_YUV444:
        {
            enProcFmt = XDP_PROC_FMT_RGB_444;
            break;
        }
        default:
            break;
    }

    return enProcFmt;
}

HI_U32 VpssCalcChmWth(HI_U32 u32LumWth, XDP_PROC_FMT_E enDataFmt)
{
    HI_U32 u32ChmWth = 0;
    switch(enDataFmt)
    {
        case XDP_PROC_FMT_SP_420:
        case XDP_PROC_FMT_SP_422:
            {
                u32ChmWth = u32LumWth/2;
                break;
            }
        case XDP_PROC_FMT_SP_444:
            {
                u32ChmWth = u32LumWth;
                break;
            }
        case XDP_PROC_FMT_SP_400:
            {
                u32ChmWth = 0;
                break;
            }
        default:break;
    }

    return u32ChmWth;

}

HI_U32 VpssCalcChmHgt(HI_U32 u32LumHgt, XDP_PROC_FMT_E enDataFmt)
{
    HI_U32 u32ChmHgt = 0;
    switch(enDataFmt)
    {
        case XDP_PROC_FMT_SP_420:
            {
                u32ChmHgt = u32LumHgt/2;
                break;
            }
        case XDP_PROC_FMT_SP_422:
        case XDP_PROC_FMT_SP_444:
            {
                u32ChmHgt = u32LumHgt;
                break;
            }
        case XDP_PROC_FMT_SP_400:
            {
                u32ChmHgt = 0;
                break;
            }
        default:break;
    }

    return u32ChmHgt;
}

HI_U32 VpssUpAlign(HI_U32 u32DataIn, HI_U32 u32Align)
{
    HI_U32 u32DataOut = u32DataIn;
    u32DataOut = (u32DataIn + u32Align - 1)/u32Align*u32Align;
    return u32DataOut;
}

HI_U32 VPSS_CalcAddrStr(XDP_SOLO_ADDR_S * pstAddr, XDP_RECT_S * pstRect, HI_U32 u32DataWidth, HI_BOOL bRandModeEn, HI_U32 u32AlignByte)
{
    HI_U32  u32AddrSeg    = 0 ;

    pstAddr->u32Str = VpssUpAlign((pstRect->u32Wth*u32DataWidth+7)/8, u32AlignByte);

    u32AddrSeg = pstAddr->u32Str*pstRect->u32Hgt;
    pstAddr->u64Addr += u32AddrSeg;

    return u32AddrSeg;
}
