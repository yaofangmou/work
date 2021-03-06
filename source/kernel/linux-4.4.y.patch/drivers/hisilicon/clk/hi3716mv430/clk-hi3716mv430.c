/******************************************************************************
 *  Copyright (C) 2014 Hisilicon Technologies CO.,LTD.
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
 * Create By Cai Zhiyong 2014.12.22
 *
******************************************************************************/
#define DRVNAME "hiclk"
#define pr_fmt(fmt) DRVNAME ": " fmt

#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/string.h>
#include <linux/slab.h>
#include <linux/hisilicon/freq.h>
#include <dt-bindings/clock/hi3716mv430-clock.h>
#include "clk-hisi.h"

#define CLK(_id, _mask, _value, _rstbit, _rate, _ops) \
	{.id = _id,         \
	 .name = #_id,      \
	 .offset = _id,     \
	 .mask = _mask,     \
	 .value = _value,   \
	 .rstbit = _rstbit, \
	 .rate = _rate,     \
	 .ops = _ops,}

#define CLK_SHARED(_id, _off, _mask, _value, _rstbit, _rate, _ops) \
	{.id = _id,         \
	.name = #_id,      \
	.offset = _off,     \
	.mask = _mask,     \
	.value = _value,   \
	.rstbit = _rstbit, \
	.rate = _rate,     \
	.ops = _ops,}
/******************************************************************************/

extern struct clk_ops clk_ops_hiusb2;
extern struct clk_ops clk_ops_higpu;
extern struct clk_ops clk_ops_hifmc100;
extern struct clk_ops clk_ops_hiir;

static struct hiclk_hw hiclks_hw[] = {
	CLK(PERI_CRG224_FMC,       0x0,     0x0,     0, 0, &clk_ops_hifmc100),
	CLK(PERI_CRG46_USB2CTRL, 0x0,  0x0,   0x0, 0, &clk_ops_hiusb2),
	CLK(PERI_CRG52_SF, 0x0007, 0x0003, BIT(3), 0, NULL),
	CLK(PERI_CRG73_GPU_LP,  0x0,  0x0,   0x0, 0, &clk_ops_higpu),
	CLK_SHARED(HII2C_I2C0_CLK, PERI_CRG27_I2C, 0x10, 0x10, BIT(5), _100MHz, NULL), /* 25MHz is only for FPGA */
	CLK_SHARED(HII2C_I2C1_CLK, PERI_CRG27_I2C, 0x100, 0x100, BIT(9), _100MHz, NULL), /* 25MHz is only for FPGA */
	CLK_SHARED(HII2C_I2C2_CLK, PERI_CRG27_I2C, 0x1000, 0x1000, BIT(13), _100MHz, NULL), /* 25MHz is only for FPGA */
	CLK_SHARED(HII2C_ADC_CLK, PERI_CRG27_I2C, 0x10000, 0x10000, BIT(17), _100MHz, NULL), /* 25MHz is only for FPGA */
	CLK_SHARED(HII2C_QAM_CLK, PERI_CRG27_I2C, 0x1, 0x1, BIT(1), _100MHz, NULL), /* 25MHz is only for FPGA */
	CLK(HIIR_CLK, 0x0, 0x0, 0, _24MHz, &clk_ops_hiir),
};
/******************************************************************************/

static unsigned long hiclk_recalc_rate_hi3716mv430(struct clk_hw *hw,
						   unsigned long parent_rate)
{
	u32 val;
	struct hiclk_hw *clk = to_hiclk_hw(hw);

	val = readl(clk->peri_crgx);

	switch (clk->id) {
	case PERI_CRG224_FMC: {
		unsigned long rate[] = {
			_200MHz, _100MHz, _75MHz,_50MHz,
			_12MHz};
		val = (val >> 5) & 0x7;
		clk->rate = rate[val];
		break;
	}
	default:
		break;
	}

	return clk->rate;
}
/******************************************************************************/

static int hiclk_set_rate_hi3716mv430(struct clk_hw *hw, unsigned long drate,
				unsigned long parent_rate)
{
	return 0;
}
/******************************************************************************/

static int hiclk_get_phase_hi3716mv430(struct clk_hw *hw)
{
	u32 val = 0;
	return (int)val;
}
/******************************************************************************/

static int hiclk_set_phase_hi3716mv430(struct clk_hw *hw, int degrees)
{
	return 0;
}

/******************************************************************************/

static int hiclk_enable_hi3716mv430(struct clk_hw *hw)
{
	hiclk_enable(hw);
	hiclk_recalc_rate_hi3716mv430(hw, 0);
	return 0;
}
/******************************************************************************/

static struct clk_ops clk_ops_hi3716mv430 = {
	.enable = hiclk_enable_hi3716mv430,
	.recalc_rate = hiclk_recalc_rate_hi3716mv430,
	.set_rate = hiclk_set_rate_hi3716mv430,
	.get_phase = hiclk_get_phase_hi3716mv430,
	.set_phase = hiclk_set_phase_hi3716mv430,
};
/******************************************************************************/

static void __init hi3716mv430_clocks_init(struct device_node *np)
{
	int ix;

	for (ix = 0; ix < ARRAY_SIZE(hiclks_hw); ix++) {
		struct hiclk_hw *hihw = &hiclks_hw[ix];
		struct clk_ops *ops = hihw->ops;

		if (!ops)
			continue;

		if (!ops->enable)
			ops->enable = hiclk_enable_hi3716mv430;
		if (!ops->recalc_rate)
			ops->recalc_rate = hiclk_recalc_rate_hi3716mv430;
	}

	hiclk_clocks_init(np, hiclks_hw, ARRAY_SIZE(hiclks_hw),
		CLK_MAX >> 2, &clk_ops_hi3716mv430);
}
CLK_OF_DECLARE(fixed_clock, "hi3716mv430.clock", hi3716mv430_clocks_init);
