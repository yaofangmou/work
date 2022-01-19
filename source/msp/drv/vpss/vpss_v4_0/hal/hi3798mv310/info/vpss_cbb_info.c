#include "vpss_cbb_info.h"
//#include "vpss_cbb_reg.h"

static VPSS_MAC_RCHN_CFG_S g_stRchnCfg;
static VPSS_MAC_WCHN_CFG_S g_stWchnCfg;

HI_VOID VPSS_InfoCfg_Dei_ST(CBB_INFO_S *pstInfoDeiCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_DI_RST;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_DI_WST;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoDeiCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoDeiCfg->bSmmu_R;
    g_stRchnCfg.stInRect.u32Wth = pstInfoDeiCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoDeiCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoDeiCfg->u32RPhyAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoDeiCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoDeiCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoDeiCfg->bSmmu_W;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoDeiCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoDeiCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoDeiCfg->u32WPhyAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoDeiCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}

HI_VOID VPSS_InfoGet_All(S_VPSS_STT_REGS_TYPE *pstSttReg, CBB_INFO_S *pstInfoStt)
{
    //VPSS_SAFE_MEMCPY(pstSttReg, pstInfoStt->pu8RVirAddr, sizeof(S_STT_REGS_TYPE));
}

HI_VOID VPSS_InfoCfg_Prjv(CBB_INFO_PRJV_S *pstInfoPrjvCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_RPRJV;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_WPRJV;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoPrjvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoPrjvCfg->bSmmu_Cur;
    g_stRchnCfg.stInRect.u32Wth = pstInfoPrjvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoPrjvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoPrjvCfg->u32CurReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoPrjvCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoPrjvCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoPrjvCfg->bSmmu_Nx2;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoPrjvCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoPrjvCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoPrjvCfg->u32Nx2WriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoPrjvCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_Prjh(CBB_INFO_PRJH_S *pstInfoPrjhCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_RPRJH;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_WPRJH;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoPrjhCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoPrjhCfg->bSmmu_Cur;
    g_stRchnCfg.stInRect.u32Wth = pstInfoPrjhCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoPrjhCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoPrjhCfg->u32CurReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoPrjhCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoPrjhCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoPrjhCfg->bSmmu_Nx2;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoPrjhCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoPrjhCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoPrjhCfg->u32Nx2WriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoPrjhCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}


HI_VOID VPSS_InfoCfg_Di(CBB_INFO_DI_S *pstInfoDiCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_DI_STCNT;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_DI_STCNT;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoDiCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoDiCfg->bSmmu_r;
    g_stRchnCfg.stInRect.u32Wth = pstInfoDiCfg->u32Width;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoDiCfg->u32Hight;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoDiCfg->u32ReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoDiCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoDiCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoDiCfg->bSmmu_w;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoDiCfg->u32Width;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoDiCfg->u32Hight;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoDiCfg->u32WriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoDiCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}


HI_VOID VPSS_InfoCfg_Blkmv(CBB_INFO_BLKMV_S *pstInfoBlkmvCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_P2MV;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_CFMV;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoBlkmvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoBlkmvCfg->bSmmu_Cur;
    g_stRchnCfg.stInRect.u32Wth = pstInfoBlkmvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoBlkmvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoBlkmvCfg->u32CurReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoBlkmvCfg->u32Stride;
    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    enVpssMacRchn             = VPSS_MAC_RCHN_P3MV;
    g_stRchnCfg.bSetFlag        = HI_FALSE;
    g_stRchnCfg.bEn             = pstInfoBlkmvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoBlkmvCfg->bSmmu_Ref;
    g_stRchnCfg.stInRect.u32Wth = pstInfoBlkmvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoBlkmvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoBlkmvCfg->u32RefReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoBlkmvCfg->u32Stride;
    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoBlkmvCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoBlkmvCfg->bSmmu_Nx1;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoBlkmvCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoBlkmvCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoBlkmvCfg->u32Nx1WriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoBlkmvCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_Blkmt(CBB_INFO_BLKMT_S *pstInfoBlkmtCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_P3MT;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_P2MT;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoBlkmtCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoBlkmtCfg->bSmmu_Ref;
    g_stRchnCfg.stInRect.u32Wth = pstInfoBlkmtCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoBlkmtCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoBlkmtCfg->u32RefReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoBlkmtCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoBlkmtCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoBlkmtCfg->bSmmu_Cur;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoBlkmtCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoBlkmtCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoBlkmtCfg->u32CurWriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoBlkmtCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_Rgmv(CBB_INFO_RGMV_S *pstInfoRgmvCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_P1RGMV;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_CFRGMV;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_WCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoRgmvCfg->bEn;
    g_stRchnCfg.bEn1            = pstInfoRgmvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoRgmvCfg->bSmmu_Nx1;
    g_stRchnCfg.stInRect.u32Wth = pstInfoRgmvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoRgmvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoRgmvCfg->u32Nx1ReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoRgmvCfg->u32Stride;
    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    enVpssMacRchn             = VPSS_MAC_RCHN_P2RGMV;
    g_stRchnCfg.bSetFlag        = HI_FALSE;
    g_stRchnCfg.bEn             = pstInfoRgmvCfg->bEn;
    g_stRchnCfg.bEn1            = pstInfoRgmvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoRgmvCfg->bSmmu_Cur;
    g_stRchnCfg.stInRect.u32Wth = pstInfoRgmvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoRgmvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoRgmvCfg->u32CurReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoRgmvCfg->u32Stride;
    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoRgmvCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoRgmvCfg->bSmmu_Nx2;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoRgmvCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoRgmvCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoRgmvCfg->u32Nx2WriteAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoRgmvCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_TnrRgmv(CBB_INFO_RGMV_S *pstInfoRgmvCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_P2RGMV;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoRgmvCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoRgmvCfg->bSmmu_Cur;
    g_stRchnCfg.stInRect.u32Wth = pstInfoRgmvCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoRgmvCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoRgmvCfg->u32CurReadAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoRgmvCfg->u32Stride;
    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_Snr_Mad(CBB_INFO_S *pstInfoSnrCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_NR_RMAD;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoSnrCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoSnrCfg->bSmmu_R;
    g_stRchnCfg.stInRect.u32Wth = pstInfoSnrCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoSnrCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoSnrCfg->u32RPhyAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoSnrCfg->u32Stride;

#if 0
    VPSS_DBG_INFO("en:%d bsmmu:%d w h %d %d yadd:%#x, stid:%d\n",
                  g_stRchnCfg.bEn,
                  g_stRchnCfg.bMmuBypass,
                  g_stRchnCfg.stInRect.u32Wth,
                  g_stRchnCfg.stInRect.u32Hgt,
                  pstInfoSnrCfg->u32RPhyAddr,
                  g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr
                 );
#endif

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    return ;
}

HI_VOID VPSS_InfoCfg_Tnr_Mad(CBB_INFO_S *pstInfoTnrCfg, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    VPSS_MAC_RCHN_E enVpssMacRchn = VPSS_MAC_RCHN_NR_RMAD;
    VPSS_MAC_WCHN_E enVpssMacWchn = VPSS_MAC_WCHN_NR_WMAD;
    memset(&g_stRchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));
    memset(&g_stWchnCfg, 0, sizeof(VPSS_MAC_RCHN_CFG_S));

    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    //read chn
    g_stRchnCfg.bEn             = pstInfoTnrCfg->bEn;
    g_stRchnCfg.bMmuBypass      = !pstInfoTnrCfg->bSmmu_R;
    g_stRchnCfg.stInRect.u32Wth = pstInfoTnrCfg->u32Wth;
    g_stRchnCfg.stInRect.u32Hgt = pstInfoTnrCfg->u32Hgt;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoTnrCfg->u32RPhyAddr;
    g_stRchnCfg.stAddr[VPSS_RCHN_ADDR_DATA].u32YStr  = pstInfoTnrCfg->u32Stride;

    CBB_MAC_SetRchnCfg(pstVpssNode, enVpssMacRchn, &g_stRchnCfg);

    //write chn
    g_stWchnCfg.bEn              = pstInfoTnrCfg->bEn;
    g_stWchnCfg.bMmuBypass       = !pstInfoTnrCfg->bSmmu_W;
    g_stWchnCfg.stOutRect.u32Wth = pstInfoTnrCfg->u32Wth;
    g_stWchnCfg.stOutRect.u32Hgt = pstInfoTnrCfg->u32Hgt;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u64YAddr = (HI_U64)pstInfoTnrCfg->u32WPhyAddr;
    g_stWchnCfg.stAddr[VPSS_WCHN_ADDR_DATA].u32YStr  = pstInfoTnrCfg->u32Stride;

    CBB_MAC_SetWchnCfg(pstVpssNode, enVpssMacWchn, &g_stWchnCfg);

    return ;
}


HI_VOID VPSS_InfoCfg_SttInfo(CBB_INFO_S *pstInfoStt, CBB_REG_ADDR_S stRegAddr)
{
    S_VPSS_REGS_TYPE *pstVpssNode;  //DDR??????
    pstVpssNode = (S_VPSS_REGS_TYPE *)stRegAddr.pu8NodeVirAddr;

    pstVpssNode->VPSS_STT_W_ADDR_LOW.u32 = pstInfoStt->u32WPhyAddr;

    return ;
}

