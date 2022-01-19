/******************************************************************************
*    Copyright (c) 2009-2012 by Hisi.
*    All rights reserved.
* ***
*    Create by Czy. 2012-03-19
*
******************************************************************************/

#include <config.h>
#include <common.h>

#define dsb() __asm__ __volatile__ ("dsb" : : : "memory")

#define readl(_a)        ({ unsigned int __v = (*(volatile unsigned int *)(_a)); dsb(); __v; })
#define writel(_v, _a)   ({  dsb(); (*(volatile unsigned int *)(_a) = (_v)); })

extern char _sys_srst_startup[];
extern char _sys_srst_end[];

/******************************************************************************/

static inline void delay(unsigned int cnt)
{
	while (cnt--)
		__asm__ __volatile__("nop");
}


/******************************************************************************/

long long get_chipid_reg(void)
{
	long long chipid = 0;
	long long val = 0;

	chipid = (long long)readl(REG_BASE_SCTL + REG_SC_SYSID0);
	val = (long long)readl(REG_BASE_PERI_CTRL + REG_PERI_SOC_FUSE);
	chipid = ((val & (0x1F << 16)) << 16) | (chipid & 0xFFFFFFFF);

	return chipid;
}
/******************************************************************************/

void reset_cpu(unsigned long addr)
{
	unsigned int val;

	printf("*** CPU will be reset by WDG0 now\n");

	/* enable the wdg0 crg clock */
	val = readl(REG_BASE_CRG + REG_PERI_CRG94);
	val &= ~(1<<4);
	val |= 1;
	writel(val, REG_BASE_CRG + REG_PERI_CRG94);
	delay(1000);

	/* unclock wdg */
	writel(0x1ACCE551, REG_BASE_WDG0 + 0x0C00);
	/* wdg load value */
	writel(0x00000001, REG_BASE_WDG0 + 0x0000);
	/* bit0: int enable bit1: reboot enable */
	writel(0x00000003, REG_BASE_WDG0 + 0x0008);

	while (1)
		;
}

/******************************************************************************/
#ifdef CONFIG_SYS_SRST_SUPPORT
void sys_srst(void)
{
	char *src = _sys_srst_startup;
	char *dst = (char *)(SYS_SRST_SRAM_BASE);
	void (*entry)(void) = (void *)dst;

	if ((_sys_srst_end - _sys_srst_startup) > SYS_SRST_MAX_SIZE) {
		printf("ERROR: System soft reset code size(0x%x Bytes) over 0x%x Bytes, reset fail\n", _sys_srst_end - _sys_srst_startup, SYS_SRST_MAX_SIZE);
		while(1);
	}

try_again:
	do {
		*dst = *src;
		src++;
		dst++;
	} while(src < _sys_srst_end);

	entry();
	goto try_again;
}
#endif
/******************************************************************************/

int get_boot_mode(void)
{
	int boot_media;

	/* read from pin */
	boot_media = readl(REG_BASE_PERI_CTRL + REG_START_MODE);
	boot_media = ((boot_media >> NORMAL_BOOTMODE_OFFSET)
		& NORMAL_BOOTMODE_MASK);

	return boot_media;
}

/******************************************************************************/
#ifdef CONFIG_HI3716MV430_FPGA
unsigned int get_cpu_midr(void)
{
	unsigned int midr = 0;
	/* Read MIDR to midr */
	asm("mrc	p15, 0, r0, c0, c0, 0" :"=r"(midr) : :"memory");
	return midr;
}
#endif
