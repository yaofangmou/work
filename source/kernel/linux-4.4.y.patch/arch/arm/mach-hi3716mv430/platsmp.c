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
#include <linux/errno.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/jiffies.h>
#include <linux/smp.h>
#include <linux/io.h>
#include <asm/cacheflush.h>
#include <mach/hardware.h>
#include <asm/mach-types.h>
#include <asm/unified.h>
#include <asm/smp_scu.h>
#include <mach/early-debug.h>

#include "platsmp.h"
#include "hotplug.h"

#include <linux/hikapi.h>

static DEFINE_SPINLOCK(boot_lock);

/*****************************************************************************/
static void write_pen_release(int val)
{
	pen_release = val;
	smp_wmb();
	__cpuc_flush_dcache_area((void *)&pen_release, sizeof(pen_release));
	outer_clean_range(__pa(&pen_release), __pa(&pen_release + 1));
}
/*****************************************************************************/

static int hi3798mx_boot_secondary(unsigned int cpu,
					struct task_struct *idle)
{
	unsigned long timeout;

	set_scu_boot_addr(0xFFFF0000,
		(unsigned int)virt_to_phys(hi3798mx_secondary_startup));

	/*
	 * set synchronisation state between this boot processor
	 * and the secondary one
	 */
	spin_lock(&boot_lock);

	slave_cores_power_up(cpu);

	/*
	 * The secondary processor is waiting to be released from
	 * the holding pen - release it, then wait for it to flag
	 * that it has been released by resetting pen_release.
	 *
	 * Note that "pen_release" is the hardware CPU ID, whereas
	 * "cpu" is Linux's internal ID.
	 */
	write_pen_release(cpu);

	/*
	 * Send the secondary CPU a soft interrupt, thereby causing
	 * the boot monitor to read the system wide flags register,
	 * and branch to the address found there.
	 */
	arch_send_wakeup_ipi_mask(cpumask_of(cpu));

	/*
	 * Send the secondary CPU a soft interrupt, thereby causing
	 * the boot monitor to read the system wide flags register,
	 * and branch to the address found there.
	 */
	timeout = jiffies + (5 * HZ);
	while (time_before(jiffies, timeout)) {
		smp_rmb();
		if (pen_release == -1)
			break;

		udelay(10);
	}

	/*
	 * now the secondary core is starting up let it run its
	 * calibrations, then wait for it to finish
	 */
	spin_unlock(&boot_lock);

	return pen_release != -1 ? -ENOSYS : 0;
}
/*****************************************************************************/

static void hi3798mx_secondary_init(unsigned int cpu)
{
	/*
	 * let the primary processor know we're out of the
	 * pen, then head off into the C entry point
	 */
	write_pen_release(-1);

	/*
	 * Synchronise with the boot thread.
	 */
	spin_lock(&boot_lock);
	spin_unlock(&boot_lock);
}
/*****************************************************************************/

static void __init hi3798mx_smp_init_cpus(void)
{
	unsigned int i, ncores, l2ctlr;

	asm volatile("mrc p15, 1, %0, c9, c0, 2\n" : "=r" (l2ctlr));
	ncores = ((l2ctlr >> 24) & 0x3) + 1;

	/* sanity check */
	if (ncores > NR_CPUS) {
		printk(KERN_WARNING
			"Realview: no. of cores (%d) greater than configured "
			"maximum of %d - clipping\n",
			ncores, NR_CPUS);
		ncores = NR_CPUS;
	}

	for (i = 0; i < ncores; i++)
		set_cpu_possible(i, true);
}
/*****************************************************************************/
void slave_cores_power_up(int cpu)
{
	unsigned int regval, regval_bak;

	printk(KERN_DEBUG "CPU%u: powerup\n", cpu);

	/* select 400MHz before start slave cores */
	regval_bak = __raw_readl((void __iomem *)IO_ADDRESS(REG_BASE_CPU_LP));
	__raw_writel(0x306, (void __iomem *)IO_ADDRESS(REG_BASE_CPU_LP));
	__raw_writel(0x706, (void __iomem *)IO_ADDRESS(REG_BASE_CPU_LP));

#if 1
	/* clear the slave cpu arm_por_srst_req reset */
	regval = __raw_readl((void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
	regval &= ~(1 << (14));
	regval &= ~(1 << (15));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));

	/* clear the slave cpu cluster_dbg_srst_req reset */
	regval = __raw_readl((void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
	regval &= ~(1 << (18));
	regval &= ~(1 << (19));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
#endif
	/* restore cpu freq */
	regval = regval_bak & (~(1 << REG_CPU_LP_CPU_SW_BEGIN));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(REG_BASE_CPU_LP));
	__raw_writel(regval_bak, (void __iomem *)IO_ADDRESS(REG_BASE_CPU_LP));
}

/*****************************************************************************/
static int hi3798mx_cpu_kill(unsigned int cpu)
{
	unsigned int regval;

	printk(KERN_DEBUG "CPU%u: killed\n", cpu);

	/* set the slave cpu reset */
	regval = __raw_readl((void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
	regval |= (1 << (cpu + CPU_REG_ARM_SRST));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));

	/* set the slave cpu cluster_dbg_srst_req reset */
	regval = __raw_readl((void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
	regval |= (1 << (cpu + CPU_REG_CLUSTER_DBG_SRST));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));

	/* set the slave cpu arm_por_srst_req reset */
	regval = __raw_readl((void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));
	regval |= (1 << (cpu + CPU_REG_ARM_POR_SRST));
	__raw_writel(regval, (void __iomem *)IO_ADDRESS(CPU_REG_BASE_RST));

	return 1;
}
/*****************************************************************************/

struct smp_operations hi3798mx_smp_ops __initdata = {
	.smp_init_cpus = hi3798mx_smp_init_cpus,
	.smp_secondary_init = hi3798mx_secondary_init,
	.smp_boot_secondary = hi3798mx_boot_secondary,
	.cpu_kill = hi3798mx_cpu_kill,
#ifdef CONFIG_HOTPLUG_CPU
	.cpu_die = hi3798mx_cpu_die,
#endif
};
