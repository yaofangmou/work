#include "vpss_mac_define.h"

//--------------------------------------------
// channel register offset
//--------------------------------------------
const HI_U32 gu32VpssRchnAddr[VPSS_RCHN_MAX] =
{
    (0x9900/4),   // img  rchn_P1
    (0x9980/4),   // img  rchn_p2
    (0x9a00/4),   // img  rchn_p3
    (0x9a80/4),   // solo rchn_di_rst
    (0x9ac0/4),   // solo rchn_dm_cnt
    (0x9b00/4),   // solo rchn_nr_rmad
    (0x9b40/4),   // solo rchn_snr_rmad
    (0x9b80/4),   // solo rchn_rprjh
    (0x9bc0/4),   // solo rchn_rprjv
    (0x9c00/4),   // solo rchn_p2rgmv
    (0x9c40/4),   // solo rchn_p1rgmv
};

const HI_U32 gu32VpssWchnAddr[VPSS_WCHN_MAX] =
{
    (0x9e00/4),   // img  wchn_nr_rfr
    (0xa080/4),   // img  wchn_vpss_out
    (0x9e80/4),   // solo wchn_di_wst
    (0x9ec0/4),   // solo wchn_dm_cnt
    (0x9f00/4),   // solo wchn_nr_wmad
    (0x9f40/4),   // solo wchn_wprjh
    (0x9f80/4),   // solo wchn_wprjv
    (0x9fc0/4),   // solo wchn_cfrgmv
};

HI_U32 VpssGetWchnDataWidth(VPSS_MAC_WCHN_E enLayer)
{
    HI_U32 u32DataWidth = 8 ;

    switch(enLayer)
    {
        case VPSS_MAC_WCHN_NR_RFR  : break ;
        case VPSS_MAC_WCHN_VPSS_OUT  : break ;
        case VPSS_MAC_WCHN_DI_WST  : u32DataWidth = 16; break ;
        case VPSS_MAC_WCHN_DM_CNT  : u32DataWidth = 8 ; break ;
        case VPSS_MAC_WCHN_NR_WMAD : u32DataWidth = 5 ; break ;
        case VPSS_MAC_WCHN_WPRJH   : u32DataWidth = 64; break ;
        case VPSS_MAC_WCHN_WPRJV   : u32DataWidth = 64; break ;
        case VPSS_MAC_WCHN_CFRGMV  : u32DataWidth = 64; break ;

        default : break;
    }

    return u32DataWidth;
}
