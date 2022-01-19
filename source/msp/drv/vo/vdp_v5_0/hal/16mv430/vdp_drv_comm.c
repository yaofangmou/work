#include "vdp_drv_comm.h"
#include "outer_depend.h"

#ifndef __DISP_PLATFORM_BOOT__
#include "hi_drv_mmz.h"
#endif
extern  HI_S32 HI_DRV_PDM_AllocReserveMem(const HI_CHAR *BufName, HI_U32 u32Len, HI_U32 *pu32PhyAddr);

//----------------------------------------------------------------------
// memory/address managerment
//----------------------------------------------------------------------
HI_S32 VDP_DRV_AllocateMem(HI_U32 u32Size, VDP_MMZ_BUFFER_S* stVdpMmzBuffer)
{
#ifdef __DISP_PLATFORM_BOOT__
    HI_S32 nRet;
    nRet = HI_DRV_PDM_AllocReserveMem(VDP_DDR_NAME_UBOOT, u32Size, &stVdpMmzBuffer->u32StartPhyAddr);
    if (nRet != 0)
    {
         VDP_PRINT("VDP_DDR_CFG  failed\n");
         return HI_FAILURE;
    }

    stVdpMmzBuffer->pu8StartVirAddr = HI_NULL;
    stVdpMmzBuffer->u32Size         = u32Size;
#else
    HI_S32 nRet;
    nRet = HI_DRV_MMZ_AllocAndMap("VDP_DDR_CFG", HI_NULL, u32Size, 0, (MMZ_BUFFER_S *)stVdpMmzBuffer);

    if (nRet != 0)
    {
        VDP_PRINT("VDP_DDR_CFG  failed\n");
        return HI_FAILURE;
    }
#endif
    return HI_SUCCESS;

}

HI_S32 VPSS_DRV_AllocateCfgMem(HI_U32 u32Size, VDP_MMZ_BUFFER_S* stVpssMmzBuffer)
{
#ifdef __DISP_PLATFORM_BOOT__

#else
    HI_S32 nRet;
    nRet = HI_DRV_MMZ_AllocAndMap("VPSS_CFG_MEM", HI_NULL, u32Size, 0, (MMZ_BUFFER_S *)stVpssMmzBuffer);

    if (nRet != 0)
    {
        VDP_PRINT("VPSS_CFG_MEM  failed\n");
        return HI_FAILURE;
    }

#endif
    return HI_SUCCESS;

}
