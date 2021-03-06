/*
 * Copyright (c) 2013-2015, ARM Limited and Contributors. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * Neither the name of ARM nor the names of its contributors may be used
 * to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#include <arm_gic.h>
#include <bl_common.h>
#include <hisi_def.h>

const unsigned int hisi_irq_sec_array[] = {
	HISI_IRQ_SEC_TIMER0,
	HISI_IRQ_SEC_TIMER1,
	HISI_IRQ_SEC_TIMER2,
	HISI_IRQ_SEC_TIMER3,
	HISI_IRQ_SEC_AXI,
	HISI_IRQ_SEC_SGI_0,
	HISI_IRQ_SEC_SGI_1,
	HISI_IRQ_SEC_SGI_2,
	HISI_IRQ_SEC_SGI_3,
	HISI_IRQ_SEC_SGI_4,
	HISI_IRQ_SEC_SGI_5,
	HISI_IRQ_SEC_SGI_6,
	HISI_IRQ_SEC_SGI_7,
	HISI_IRQ_SEC_PPI_0,
};

void plat_hisi_gic_init(void)
{
	arm_gic_init(BASE_GICC_BASE,
		BASE_GICD_BASE,
		BASE_GICR_BASE,
		hisi_irq_sec_array,
		ARRAY_SIZE(hisi_irq_sec_array));
}
