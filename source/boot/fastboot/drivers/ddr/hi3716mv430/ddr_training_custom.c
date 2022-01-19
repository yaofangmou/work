/**
 * ddr_training_custom.c
 *
 * Copyright (c) 2009-2014, HiSilicon Technologies Co., Ltd.
 * All rights reserved.
 *
 * DDR training custom implement.
 */

#include "ddr_interface.h"
#include "ddr_training_impl.h"

/**
 * ddr_cmd_prepare_copy
 * @void
 *
 * Do some prepare before copy code from DDR to SRAM.
 * Keep empty when nothing to do.
 */
void ddr_cmd_prepare_copy(void) { return; }

/**
 * ddr_cmd_site_save
 * @void
 *
 * Save site before DDR training command execute .
 * Keep empty when nothing to do.
 */
void ddr_cmd_site_save(void) { return; }

/**
 * ddr_cmd_site_restore
 * @void
 *
 * Restore site after DDR training command execute.
 * Keep empty when nothing to do.
 */
void ddr_cmd_site_restore(void) { return; }

void ddr_training_save_reg_custom(void *reg, unsigned int mask)
{
	struct tr_relate_reg *relate_reg = (struct tr_relate_reg *)reg;

	relate_reg->custom.scramb = REG_READ(0xF8AB4100);
	/* disable scramb */
	REG_WRITE(((relate_reg->custom.scramb & 0xffffff0f) | 0x50), 0xF8AB4100);
	DDR_DEBUG("Disable scramb [0xF8AB4100 = %x].", ((relate_reg->custom.scramb & 0xffffff0f) | 0x50));

	relate_reg->custom.ddrt = REG_READ(0xF8A22064);
	/* enable ddrt */
	REG_WRITE(((relate_reg->custom.ddrt & 0xffffefff) | 0x1000), 0xF8A22064);
	DDR_DEBUG("Enable ddrt [0xF8A22064 = %x].", ((relate_reg->custom.ddrt & 0xffffefff) | 0x1000));

	/* disable rdqs age compensation */
	relate_reg->custom.phy0_age_compst_en = REG_READ(DDR_REG_BASE_PHY0 + DDR_PHY_PHYRSCTRL);
	REG_WRITE((relate_reg->custom.phy0_age_compst_en & 0x7fffffff), DDR_REG_BASE_PHY0 + DDR_PHY_PHYRSCTRL);
	DDR_DEBUG("disable rdqs age compensation[0xF8A3C0B0 = %x].", (relate_reg->custom.phy0_age_compst_en & 0x7fffffff));
}
void ddr_training_restore_reg_custom(void *reg)
{
	struct tr_relate_reg *relate_reg = (struct tr_relate_reg *)reg;
	/* restore scramb */
	REG_WRITE(relate_reg->custom.scramb, 0xF8AB4100);
	DDR_DEBUG("Restore scramb[0xF8AB4100 = %x].",
		relate_reg->custom.scramb);
	/* restore ddrt */
	REG_WRITE(relate_reg->custom.ddrt, 0xF8A22064);
	DDR_DEBUG("Restore ddrt[0xF8A22064 = %x]", relate_reg->custom.ddrt);

	/* restore rdqs age compensation */
	REG_WRITE(relate_reg->custom.phy0_age_compst_en, DDR_REG_BASE_PHY0 + DDR_PHY_PHYRSCTRL);
	DDR_DEBUG("restore rdqs age compensation[0xF8A3C0B0 = %x].", relate_reg->custom.phy0_age_compst_en);
}
