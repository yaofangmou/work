/******************************************************************************

  Copyright (C), 2012-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : hi_drv_ssp.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2012/12/23
  Description   :
  History       :
  1.Date        : 2012/12/23
    Author      :
    Modification: Created file
******************************************************************************/
#ifndef __HI_DRV_SSP_H__
#define __HI_DRV_SSP_H__

typedef enum enumSPI_SEL
{
    SPI0_SEL = 0,
    SPI1_SEL,
    //SPI2_SEL,
    //SPI3_SEL,
    SPI_SEL_MAX
} SPI_SEL_E;

typedef enum enumSPI0_CS_SEL
{
    SPI0_CS_SEL_0 = 0,
    SPI0_CS_SEL_1,
    SPI0_CS_SEL_2,
    SPI0_CS_SEL_3,
    SPI0_CS_SEL_MAX
} SPI0_CS_SEL_E;

typedef enum enumSPI1_CS_SEL
{
    SPI1_CS_SEL_0 = 0,
    SPI1_CS_SEL_1,
    SPI1_CS_SEL_2,
    SPI1_CS_SEL_3,
    SPI1_CS_SEL_MAX
} SPI1_CS_SEL_E;

typedef struct {
    unsigned int spi_sel;
    unsigned int spi_cs_sel;
    unsigned int addr;
    unsigned int data;
} ssp_info;

#define SSPT    's'

#define SSP_READ    _IOR(SSPT, 1, ssp_info)
#define SSP_WRITE    _IOW(SSPT, 2, ssp_info)

extern int spi_read(ssp_info *pssp_Info);
extern int spi_write(ssp_info *pssp_Info);

#endif

