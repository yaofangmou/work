#include "vdp_drv_coef.h"
#include "vdp_drv_comm.h"
#include "vdp_drv_pq_tchdr.h"
#include "vdp_hal_ip_tchdr.h"

extern S_VDP_REGS_TYPE *pVdpReg;

HI_U16 lutc_New[65];
HI_U16 lutp_New[65];
HI_U16 luts_New[65];
HI_U16 luti_New[65];
HI_U16 lutd_New[65];

extern VDP_COEF_ADDR_S gstVdpCoefBufAddr;

HI_S32 VDP_DRV_SetTchdrCoef_C(HI_U16 * plutc)
{
    VDP_COEF_SEND_CFG   stCoefSend;
    HI_U8*              addr                = 0;
    FILE*               fp_tchdr_c_coef     = NULL;
    void*               p_coef_array[1]     = {plutc};
    HI_U32              lut_length[1]       = {65};
    HI_U32              coef_bit_length[1]  = {16};

    addr = gstVdpCoefBufAddr.pu8CoefVirAddr[VDP_COEF_BUF_TCHDR_C];

    stCoefSend.coef_addr         = addr;
    stCoefSend.sti_type          = STI_FILE_TYPE_BUTT;
    stCoefSend.fp_coef           = fp_tchdr_c_coef;
    stCoefSend.lut_num           = 1;
    stCoefSend.burst_num         = 1;
    stCoefSend.cycle_num         = 8;
    stCoefSend.p_coef_array      = p_coef_array;
    stCoefSend.lut_length        = lut_length;
    stCoefSend.coef_bit_length   = coef_bit_length;
    stCoefSend.data_type         = COEF_DATA_TYPE_U16;

    (HI_VOID)VDP_FUNC_SendCoef(&stCoefSend);

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_SetTchdrCoef_P(HI_U16 * plutp)
{
    VDP_COEF_SEND_CFG   stCoefSend;
    HI_U8*              addr                = 0;
    FILE*               fp_tchdr_coef       = NULL;
    void*               p_coef_array[1]     = {plutp};
    HI_U32              lut_length[1]       = {65};
    HI_U32              coef_bit_length[1]  = {16};

    addr = gstVdpCoefBufAddr.pu8CoefVirAddr[VDP_COEF_BUF_TCHDR_P];

    stCoefSend.coef_addr         = addr;
    stCoefSend.sti_type          = STI_FILE_TYPE_BUTT;
    stCoefSend.fp_coef           = fp_tchdr_coef;
    stCoefSend.lut_num           = 1;
    stCoefSend.burst_num         = 1;
    stCoefSend.cycle_num         = 8;
    stCoefSend.p_coef_array      = p_coef_array;
    stCoefSend.lut_length        = lut_length;
    stCoefSend.coef_bit_length   = coef_bit_length;
    stCoefSend.data_type         = COEF_DATA_TYPE_U16;

    (HI_VOID)VDP_FUNC_SendCoef(&stCoefSend);

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_SetTchdrCoef_S(HI_U16 * pluts)
{
    VDP_COEF_SEND_CFG   stCoefSend;
    HI_U8*              addr                = 0;
    FILE*               fp_tchdr_coef       = NULL;
    void*               p_coef_array[1]     = {pluts};
    HI_U32              lut_length[1]       = {65};
    HI_U32              coef_bit_length[1]  = {16};

    addr = gstVdpCoefBufAddr.pu8CoefVirAddr[VDP_COEF_BUF_TCHDR_S];

    stCoefSend.coef_addr         = addr;
    stCoefSend.sti_type          = STI_FILE_TYPE_BUTT;
    stCoefSend.fp_coef           = fp_tchdr_coef;
    stCoefSend.lut_num           = 1;
    stCoefSend.burst_num         = 1;
    stCoefSend.cycle_num         = 8;
    stCoefSend.p_coef_array      = p_coef_array;
    stCoefSend.lut_length        = lut_length;
    stCoefSend.coef_bit_length   = coef_bit_length;
    stCoefSend.data_type         = COEF_DATA_TYPE_U16;

    (HI_VOID)VDP_FUNC_SendCoef(&stCoefSend);

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_SetTchdrCoef_I(HI_U16 * pluti)
{
    VDP_COEF_SEND_CFG   stCoefSend;
    HI_U8*              addr                = 0;
    FILE*               fp_tchdr_coef       = NULL;
    void*               p_coef_array[1]     = {pluti};
    HI_U32              lut_length[1]       = {65};
    HI_U32              coef_bit_length[1]  = {16};

    addr = gstVdpCoefBufAddr.pu8CoefVirAddr[VDP_COEF_BUF_TCHDR_I];

    stCoefSend.coef_addr         = addr;
    stCoefSend.sti_type          = STI_FILE_TYPE_BUTT;
    stCoefSend.fp_coef           = fp_tchdr_coef;
    stCoefSend.lut_num           = 1;
    stCoefSend.burst_num         = 1;
    stCoefSend.cycle_num         = 8;
    stCoefSend.p_coef_array      = p_coef_array;
    stCoefSend.lut_length        = lut_length;
    stCoefSend.coef_bit_length   = coef_bit_length;
    stCoefSend.data_type         = COEF_DATA_TYPE_U16;

    (HI_VOID)VDP_FUNC_SendCoef(&stCoefSend);

    return HI_SUCCESS;
}

HI_S32 VDP_DRV_SetTchdrCoef_D(HI_U16 * plutd)
{
    VDP_COEF_SEND_CFG   stCoefSend;
    HI_U8*              addr                = 0;
    FILE*               fp_tchdr_coef       = NULL;
    void*               p_coef_array[1]     = {plutd};
    HI_U32              lut_length[1]       = {65};
    HI_U32              coef_bit_length[1]  = {16};

    addr = gstVdpCoefBufAddr.pu8CoefVirAddr[VDP_COEF_BUF_TCHDR_D];

    stCoefSend.coef_addr         = addr;
    stCoefSend.sti_type          = STI_FILE_TYPE_BUTT;
    stCoefSend.fp_coef           = fp_tchdr_coef;
    stCoefSend.lut_num           = 1;
    stCoefSend.burst_num         = 1;
    stCoefSend.cycle_num         = 8;
    stCoefSend.p_coef_array      = p_coef_array;
    stCoefSend.lut_length        = lut_length;
    stCoefSend.coef_bit_length   = coef_bit_length;
    stCoefSend.data_type         = COEF_DATA_TYPE_U16;

    (HI_VOID)VDP_FUNC_SendCoef(&stCoefSend);

    return HI_SUCCESS;
}


HI_VOID VDP_FUNC_FormatTchdrCoefToDDR(VDP_RM_COEF_MODE_E enCoefMode, HI_PQ_SL_HDR_PS_PARAM_S *stPsParam)
{
    VDP_DRV_COEF_GEN_CFG   stCoefGen = {0};

    /*memset((HI_VOID *)stPsParam->C_LUT, 0, sizeof(stPsParam->C_LUT));
    memset((HI_VOID *)stPsParam->P_LUT, 0, sizeof(stPsParam->P_LUT));
    memset((HI_VOID *)stPsParam->S_LUT, 0, sizeof(stPsParam->S_LUT));
    memset((HI_VOID *)stPsParam->I_LUT, 0, sizeof(stPsParam->I_LUT));
    memset((HI_VOID *)stPsParam->D_LUT, 0, sizeof(stPsParam->D_LUT));*/

    HI_VOID *plutc = (HI_VOID *)stPsParam->C_LUT;
    HI_VOID *plutp = (HI_VOID *)stPsParam->P_LUT;
    HI_VOID *pluts = (HI_VOID *)stPsParam->S_LUT;
    HI_VOID *pluti = (HI_VOID *)stPsParam->I_LUT;
    HI_VOID *plutd = (HI_VOID *)stPsParam->D_LUT;

    stCoefGen.p_coef         = plutc;
    stCoefGen.p_coef_new     = lutc_New;
    stCoefGen.length         = 65;
    stCoefGen.coef_data_type = COEF_DATA_TYPE_U16;
    stCoefGen.coef_data_mode = enCoefMode;
    stCoefGen.coef_max       = ((1<<11) - 1);
    stCoefGen.coef_min       = 0;

    VDP_DRV_GenCoef(&stCoefGen);

    stCoefGen.p_coef         = plutp;
    stCoefGen.p_coef_new     = lutp_New;
    stCoefGen.length         = 65;
    stCoefGen.coef_data_type = COEF_DATA_TYPE_U16;
    stCoefGen.coef_data_mode = enCoefMode;
    stCoefGen.coef_max       = ((1<<14) - 1);
    stCoefGen.coef_min       = 0;

    VDP_DRV_GenCoef(&stCoefGen);

    stCoefGen.p_coef         = pluts;
    stCoefGen.p_coef_new     = luts_New;
    stCoefGen.length         = 65;
    stCoefGen.coef_data_type = COEF_DATA_TYPE_U16;
    stCoefGen.coef_data_mode = enCoefMode;
    stCoefGen.coef_max       = ((1<<10) - 1);
    stCoefGen.coef_min       = 0;

    VDP_DRV_GenCoef(&stCoefGen);

    stCoefGen.p_coef         = pluti;
    stCoefGen.p_coef_new     = luti_New;
    stCoefGen.length         = 65;
    stCoefGen.coef_data_type = COEF_DATA_TYPE_U16;
    stCoefGen.coef_data_mode = enCoefMode;
    stCoefGen.coef_max       = ((1<<8) - 1);
    stCoefGen.coef_min       = 0;

    VDP_DRV_GenCoef(&stCoefGen);

    stCoefGen.p_coef         = plutd;
    stCoefGen.p_coef_new     = lutd_New;
    stCoefGen.length         = 65;
    stCoefGen.coef_data_type = COEF_DATA_TYPE_U16;
    stCoefGen.coef_data_mode = enCoefMode;
    stCoefGen.coef_max       = ((1<<12) - 1);
    stCoefGen.coef_min       = 0;

    VDP_DRV_GenCoef(&stCoefGen);

    //send coef to DDR

    VDP_DRV_SetTchdrCoef_C(lutc_New);
    VDP_DRV_SetTchdrCoef_P(lutp_New);
    VDP_DRV_SetTchdrCoef_S(luts_New);
    VDP_DRV_SetTchdrCoef_I(luti_New);
    VDP_DRV_SetTchdrCoef_D(lutd_New);

    return;
}


HI_VOID VDP_FUNC_LoadTchdrCoefFromDdr2Reg(HI_VOID)
{
    VDP_TCHDR_SetTchdrParaCAddr(gstVdpCoefBufAddr.u32CoefPhyAddr[VDP_COEF_BUF_TCHDR_C]);
    VDP_TCHDR_SetTchdrParaPAddr(gstVdpCoefBufAddr.u32CoefPhyAddr[VDP_COEF_BUF_TCHDR_P]);
    VDP_TCHDR_SetTchdrParaSAddr(gstVdpCoefBufAddr.u32CoefPhyAddr[VDP_COEF_BUF_TCHDR_S]);
    VDP_TCHDR_SetTchdrParaIAddr(gstVdpCoefBufAddr.u32CoefPhyAddr[VDP_COEF_BUF_TCHDR_I]);
    VDP_TCHDR_SetTchdrParaDAddr(gstVdpCoefBufAddr.u32CoefPhyAddr[VDP_COEF_BUF_TCHDR_D]);

    VDP_TCHDR_SetTchdrParaDUpd(1);
    VDP_TCHDR_SetTchdrParaIUpd(1);
    VDP_TCHDR_SetTchdrParaSUpd(1);
    VDP_TCHDR_SetTchdrParaPUpd(1);
    VDP_TCHDR_SetTchdrParaCUpd(1);

    return;
}


