/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Create By Cai Zhiyong 2015.6.13
 *
******************************************************************************/

#include <linux/init.h>
#include <asm/irq.h>
#include <asm/mach-types.h>
#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <mach/hardware.h>
#include <mach/early-debug.h>
#include <linux/irqchip/arm-gic.h>
#include <linux/delay.h>
#include <linux/memblock.h>
#include <linux/of_platform.h>
#include <linux/hisilicon/himisc.h>

#include "platsmp.h"

/*****************************************************************************/

static struct map_desc hi3798mx_io_desc[] __initdata = {
	/* HI3798MV2X_IOCH1 */
	{
		.virtual	= S40_IOCH1_VIRT,
		.pfn		= __phys_to_pfn(S40_IOCH1_PHYS),
		.length		= S40_IOCH1_SIZE,
		.type		= MT_DEVICE
	},
	{
		.virtual        = S40_IOCH2_VIRT,
		.pfn            = __phys_to_pfn(S40_IOCH2_PHYS),
		.length         = S40_IOCH2_SIZE,
		.type           = MT_DEVICE
	},
};
/******************************************************************************/

static void __init hi3798mx_map_io(void)
{
	int i;

	iotable_init(hi3798mx_io_desc, ARRAY_SIZE(hi3798mx_io_desc));


	for (i = 0; i < ARRAY_SIZE(hi3798mx_io_desc); i++) {
		edb_putstr(" V: ");	edb_puthex(hi3798mx_io_desc[i].virtual);
		edb_putstr(" P: ");	edb_puthex(hi3798mx_io_desc[i].pfn);
		edb_putstr(" S: ");	edb_puthex(hi3798mx_io_desc[i].length);
		edb_putstr(" T: ");	edb_putul(hi3798mx_io_desc[i].type);
		edb_putstr("\n");
	}

	edb_trace();
}
/*****************************************************************************/

static void __init hi3798mx_reserve(void)
{
	initfile_reserve_memory();

}
/******************************************************************************/

static void __init hi3798mx_init_early(void)
{
	/*
	 * 1. enable L1 prefetch                       [2]
	 * 4. enable allocation in one cache way only. [8]
	 */
	asm volatile (
	"	mrc	p15, 0, r0, c1, c0, 1\n"
	"	orr	r0, r0, #0x104\n"
	"	mcr	p15, 0, r0, c1, c0, 1\n"
	  :
	  :
	  : "r0", "cc");
}
/*****************************************************************************/

static void hi3798mx_restart(enum reboot_mode mode, const char *cmd)
{
	printk(KERN_INFO "CPU will restart.");

	mdelay(200);

	local_irq_disable();


	/* unclock wdg */
	writel(0x1ACCE551,  __io_address(REG_BASE_WDG0 + 0xc00));
	/* wdg load value */
	writel(0x00000100,  __io_address(REG_BASE_WDG0 + 0x0));
	/* bit0: int enable bit1: reboot enable */
	writel(0x00000003,  __io_address(REG_BASE_WDG0 + 0x8));

	while (1);

	BUG();
}
/*****************************************************************************/
extern void __init hi3798mx_timer_init(void);
static const char * const hi3798mx_dt_board_compat[] = {
	"hi3716mv430-series",
	NULL
};


DT_MACHINE_START(HI3716MV430, "bigfish")
	.dt_compat    = hi3798mx_dt_board_compat,
	.atag_offset  = 0x100,
	.map_io       = hi3798mx_map_io,
	.init_early   = hi3798mx_init_early,
	.smp          = smp_ops(hi3798mx_smp_ops),
	.reserve      = hi3798mx_reserve,
	.restart      = hi3798mx_restart,
MACHINE_END
