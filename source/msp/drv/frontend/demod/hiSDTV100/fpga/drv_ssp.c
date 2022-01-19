/******************************************************************************

  Copyright (C), 2012-2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : drv_ssp.c
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2012/12/23
  Description   :
  History       :
  1.Date        : 2012/12/23
    Author      :
    Modification: Created file
******************************************************************************/
//#include <mach/platform.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <linux/fs.h>
#include <linux/module.h>
#include <linux/miscdevice.h>

#include "hi_drv_ssp.h"
#include "drv_demod.h"

#define SPI0_BASE	0xF8B1A000
#define SPI1_BASE	0xF8B1B000

static void *reg_spi_base_va[SPI_SEL_MAX] = {NULL, NULL};

#define PERI_BASE_ADDR 0xF8A20000
#define CRG_BASE_ADDR  0xF8A22000
#define CRG_SPI_OFFSET 0x0070

#ifndef HI_FPGA_SUPPORT
#define PERI_SPI_SEL    ((void *)(g_pstRegPeri) + 0x110)
#endif

#define  ssp_readw(addr, ret)		(ret = (*(volatile unsigned int *)(addr)))
#define  ssp_writew(addr, value)	((*(volatile unsigned int *)(addr)) = (value))

void *ssp_cr0;
void *ssp_cr1;
void *ssp_dr;
void *ssp_sr;
void *ssp_cpsr;
void *ssp_imsc;
void *ssp_ris;
void *ssp_mis;
void *ssp_icr;
void *ssp_dmacr;

DEFINE_SEMAPHORE(g_sspMutex);

void hi_ssp_clean_reset_and_enable_clock(void)
{
#ifndef HI_FPGA_SUPPORT
	int ret = 0;

    ssp_readw((void *)g_pstRegCrg + CRG_SPI_OFFSET, ret);
	ret = 0x11;
	ssp_writew((void *)g_pstRegCrg + CRG_SPI_OFFSET, ret);
#endif
}

void hi_ssp_writeOnly(int bWriteOnly)
{
	int ret = 0;

	ssp_readw(ssp_cr1, ret);
	if (bWriteOnly)
	{
		ret |= (0x1 << 5);
	}
	else
	{
		ret &= (~(0x1 << 5));
	}
	ssp_writew(ssp_cr1, ret);
}

void hi_ssp_enable(void)
{
	int ret = 0;

	ssp_readw(ssp_cr1, ret);
	ret |= 0x01 << 1;
	ssp_writew(ssp_cr1, ret);

	hi_ssp_writeOnly(0);
}

void hi_ssp_disable(void)
{
	int ret = 0;

	ssp_readw(ssp_cr1, ret);
	ret &= ~(0x01 << 1);
	ssp_writew(ssp_cr1, ret);
}

int hi_ssp_set_frameform(unsigned char framemode, unsigned char spo, unsigned char sph, unsigned char datawidth)
{
	int ret = 0;

	ssp_readw(ssp_cr0, ret);

	if(framemode > 3)
	{
		printk(KERN_ERR "hi_ssp_set_frameform: framemode parameter err.\n");
		return -1;
	}
	ret = (ret & 0xFFCF) | (framemode << 4);

	if ((ret & 0x30) == 0)
	{
		if(spo > 1)
		{
			printk(KERN_ERR "hi_ssp_set_frameform: spo parameter err.\n");
			return -1;
		}

		if(sph > 1)
		{
			printk(KERN_ERR "hi_ssp_set_frameform: sph parameter err.\n");
			return -1;
		}

		ret = (ret & 0xFF3F) | (sph << 7) | (spo << 6);
	}

	if ((datawidth > 16) || (datawidth < 4))
	{
		printk(KERN_ERR "hi_ssp_set_frameform: datawidth parameter err.\n");
		return -1;
	}
	ret = (ret & 0xFFF0) | (datawidth -1);

	ssp_writew(ssp_cr0, ret);

	return 0;
}

int hi_ssp_set_serialclock(unsigned char scr, unsigned char cpsdvsr)
{
	int ret = 0;

	ssp_readw(ssp_cr0, ret);
	ret = (ret & 0xFF) | (scr << 8);
	ssp_writew(ssp_cr0, ret);

	if ((cpsdvsr & 0x1))
	{
		printk(KERN_ERR "hi_ssp_set_serialclock: cpsdvsr parameter err.\n");
		return -1;
	}
	ssp_writew(ssp_cpsr, cpsdvsr);

	return 0;
}

int hi_ssp_alt_mode_set(int enable)
{
	int ret = 0;

	ssp_readw(ssp_cr1, ret);
	if (enable)
	{
		ret = ret & (~0x40);
	}
	else
	{
		ret = (ret & 0xFF) | 0x40;
	}
	ssp_writew(ssp_cr1, ret);

	return 0;
}

unsigned int hi_ssp_is_fifo_empty(int bSend)
{
	int ret = 0;
	ssp_readw(ssp_sr, ret);

	if (bSend)
	{
		if((ret & 0x1) == 0x1)
			return 1;
		else
			return 0;
	}
	else
	{
		if((ret & 0x4) == 0x4)
			return 0;
		else
			return 1;
	}
}

static void spi_enable(void)
{
	ssp_writew(ssp_cr1, 0x42);
}

static void spi_disable(void)
{
	ssp_writew(ssp_cr1, 0x40);
}

int spi_select(unsigned int spi_sel)
{
	void *spi_vaddr;

	if (spi_sel >= SPI_SEL_MAX)
	{
		printk(KERN_ERR "spi_select: spi_sel parameter err.\n");
		return -1;
	}

	spi_vaddr = reg_spi_base_va[spi_sel];

	ssp_cr0 	= spi_vaddr	+ 0x00;
	ssp_cr1 	= spi_vaddr	+ 0x04;
	ssp_dr 		= spi_vaddr	+ 0x08;
	ssp_sr 		= spi_vaddr	+ 0x0C;
	ssp_cpsr 	= spi_vaddr	+ 0x10;
	ssp_imsc 	= spi_vaddr	+ 0x14;
	ssp_ris 	= spi_vaddr	+ 0x18;
	ssp_mis 	= spi_vaddr	+ 0x1C;
	ssp_icr 	= spi_vaddr	+ 0x20;
	ssp_dmacr 	= spi_vaddr	+ 0x24;

	return 0;
}

void do_cs_select(unsigned int spi_cs_sel, unsigned int mask, unsigned int offset)
{
#ifndef HI_FPGA_SUPPORT
	volatile unsigned int ret;

	ssp_readw((unsigned int*)PERI_SPI_SEL, ret);
	ret &= mask;
	ret |= (spi_cs_sel << offset);
	ssp_writew((unsigned int*)PERI_SPI_SEL, ret);
#endif
}

int spi_cs_select(unsigned int spi_sel, unsigned int spi_cs_sel)
{
	unsigned int mask;
	unsigned int offset;

	switch(spi_sel)
	{
		case SPI0_SEL:
		{
			if (spi_cs_sel >= SPI0_CS_SEL_MAX)
			{
				printk(KERN_ERR "spi_cs_select: spi_cs_sel parameter err.\n");
				return -1;
			}

			mask = 0x9FFFFFFF;
			offset = 29;

			break;
		}

		case SPI1_SEL:
		{
			if (spi_cs_sel >= SPI1_CS_SEL_MAX)
			{
				printk(KERN_ERR "spi_cs_select: spi_cs_sel parameter err.\n");
				return -1;
			}
            
			mask = 0x9FFFFFFF;
			offset = 29;

			break;
		}
		default:
		{
			printk(KERN_ERR "spi_cs_select: spi_sel parameter err.\n");
			return -1;
		}
	}

	do_cs_select(spi_cs_sel, mask, offset);

	return 0;
}

int hi_ssp_init_cfg(void)
{
	unsigned char framemode = 0;
	unsigned char spo = 1;
	unsigned char sph = 1;
	unsigned char datawidth = 8;

	unsigned char scr = 0;
	unsigned char cpsdvsr = 2;
    cpsdvsr = 0xa;

	spi_disable();

	hi_ssp_set_frameform(framemode, spo, sph, datawidth);
	hi_ssp_set_serialclock(scr, cpsdvsr);

	hi_ssp_alt_mode_set(1);

	hi_ssp_enable();

	return 0;
}

int spi_read(ssp_info *pssp_Info)
{
	volatile unsigned int data;
	unsigned short addr, dontcare = 0x0000;

	if (down_interruptible(&g_sspMutex))
	{
		printk(KERN_ERR "ssp_ioctl lock g_sspMutex error.\n");
		return -1;
	}

	addr = (pssp_Info->addr << 1) | 0x01;

	spi_select(pssp_Info->spi_sel);
	spi_cs_select(pssp_Info->spi_sel, pssp_Info->spi_cs_sel);

	spi_enable();

	ssp_writew(ssp_dr, addr);
	ssp_writew(ssp_dr, dontcare);

	while (hi_ssp_is_fifo_empty(0)){};
	ssp_readw(ssp_dr, data);

	while (hi_ssp_is_fifo_empty(0)){};
	ssp_readw(ssp_dr, data);

	spi_disable();

	pssp_Info->data = data & 0xFFFF;
    
    up(&g_sspMutex);

	return 0;
}

int spi_write(ssp_info *pssp_Info)
{
	volatile unsigned int data;
	unsigned short addr;

    if (down_interruptible(&g_sspMutex))
	{
		printk(KERN_ERR "ssp_ioctl lock g_sspMutex error.\n");
		return -1;
	}
    
	addr = (pssp_Info->addr << 1) & 0xFE;    

	spi_select(pssp_Info->spi_sel);
	spi_cs_select(pssp_Info->spi_sel, pssp_Info->spi_cs_sel);

	spi_enable();

	ssp_writew(ssp_dr, addr);
	ssp_writew(ssp_dr, pssp_Info->data);

	while (hi_ssp_is_fifo_empty(0)){};
	ssp_readw(ssp_dr, data);

	while (hi_ssp_is_fifo_empty(0)){};
	ssp_readw(ssp_dr, data);

	spi_disable();
    
    up(&g_sspMutex);

	return 0;
}




