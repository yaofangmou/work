#include <common.h>
#include <nand.h>
#include <asm/arch/platform.h>
#include <hinfc_gen.h>
#include <asm/io.h>

#include "hifmc100_reg.h"
#include "hiflash.h"
#include "nand_sync.h"

/*****************************************************************************/
/* driver strength for ONFI2.3 & TOGGLE1.0 */
#define DS_ONFI23_TOGGLE10_DQN_3V3        (0b11110 << 4)
#define DS_ONFI23_TOGGLE10_DQS_3V3        (0b11110 << 4)
#define DS_ONFI23_TOGGLE10_REN_3V3        (0b11111 << 4)
#define DS_ONFI23_TOGGLE10_WEN_3V3        (0b11101 << 4)

#define DS_ONFI23_TOGGLE10_DQN_1V8        (0b11011 << 4)
#define DS_ONFI23_TOGGLE10_DQS_1V8        (0b11011 << 4)
#define DS_ONFI23_TOGGLE10_REN_1V8        (0b11011 << 4)
#define DS_ONFI23_TOGGLE10_WEN_1V8        (0b11011 << 4)

/* driver strength for ONFI3.0 & TOGGLE2.0, only support 1.8V */
#define DS_ONFI30_TOGGLE20_DQN_1V8        (0b11001 << 4)
#define DS_ONFI30_TOGGLE20_DQS_1V8        (0b11001 << 4)
#define DS_ONFI30_TOGGLE20_DQSN_1V8       (0b11001 << 4)
#define DS_ONFI30_TOGGLE20_REN_1V8        (0b11001 << 4)
#define DS_ONFI30_TOGGLE20_REC_1V8        (0b11001 << 4)
#define DS_ONFI30_TOGGLE20_WEN_1V8        (0b11101 << 4)

/*****************************************************************************/

extern unsigned int get_flash_io_voltage(void);
/*****************************************************************************/
struct nand_sync_timing hifmc100_nand_sync_timing[] = {
	/* {desc, {id}, id_len, synctype, timing, clock(in MHz)} */

	/* onfi2.3 */
	{"MT29F32G08CBADA",       {0x2C, 0x44, 0x44, 0x4B, 0xA9, 0x00, 0x00, 0x00}, 8, NAND_MODE_SYNC_ONFI23, DEFAULT_SYNCMODE_TIMING, DEFAULT_SYNCMODE_CLOCK},
	{"MT29F64G08CBAAB",       {0x2C, 0x64, 0x44, 0x4B, 0xA9, 0x00, 0x00, 0x00}, 8, NAND_MODE_SYNC_ONFI23, DEFAULT_SYNCMODE_TIMING, DEFAULT_SYNCMODE_CLOCK},
	/* onfi3.0 */
	{"MT29F128G08CBCBBH6-6R", {0x2C, 0x84, 0x64, 0x3C, 0xA9, 0x04, 0x00, 0x00}, 8, NAND_MODE_SYNC_ONFI30, DEFAULT_SYNCMODE_TIMING, DEFAULT_SYNCMODE_CLOCK},

	/* toggle1.0 */
	{"TH58TEG7DDKTA20",       {0x98, 0xDE, 0x94, 0x93, 0x76, 0x50}, 6, NAND_MODE_SYNC_TOGGLE10, DEFAULT_SYNCMODE_TIMING, DEFAULT_SYNCMODE_CLOCK},

	/* toggle1.0 */
	{"TC58TEG5DClTA0C",       {0x98, 0xD7, 0x84, 0x93, 0x72, 0x51, 0x08, 0x04}, 8, NAND_MODE_SYNC_TOGGLE10, DEFAULT_SYNCMODE_TIMING, DEFAULT_SYNCMODE_CLOCK},

	/* id_len == 0, means default value, don't remove. */
	{NULL, {0x00}, 0, 0, 0, 0},
};

/*****************************************************************************/
static void hifmc100_set_timing_3_3v(struct nand_sync_timing *nand_sync_timing)
{
	unsigned int i, regval;
	u8 syncmode = nand_sync_timing->syncmode;

	if ((syncmode == NAND_MODE_SYNC_ONFI23) || (syncmode == NAND_MODE_SYNC_TOGGLE10)) {
		for (i = 0; i < 7; i++) {
			regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i);
			regval &= ~REG_IOSHARE_NF_MASK;
			regval |= DS_ONFI23_TOGGLE10_DQN_3V3;
			writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i));
		}

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_DQS_3V3;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_REN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_REN_3V3;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_REN));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_WEN_3V3;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN));
	}
}

/*****************************************************************************/

static void hifmc100_set_timing_1_8v(struct nand_sync_timing *nand_sync_timing)
{
	unsigned int i, regval;
	u8 syncmode = nand_sync_timing->syncmode;

	if ((syncmode == NAND_MODE_SYNC_ONFI23) || (syncmode == NAND_MODE_SYNC_TOGGLE10)) {
		for (i = 0; i < 7; i++) {
			regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i);
			regval &= ~REG_IOSHARE_NF_MASK;
			regval |= DS_ONFI23_TOGGLE10_DQN_1V8;
			writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i));
		}

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_DQS_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_REN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_REN_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_REN));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI23_TOGGLE10_WEN_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN));
	} else if ((syncmode == NAND_MODE_SYNC_ONFI30) || (syncmode == NAND_MODE_SYNC_TOGGLE20)) {
		for (i = 0; i < 7; i++) {
			regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i);
			regval &= ~REG_IOSHARE_NF_MASK;
			regval |= DS_ONFI30_TOGGLE20_DQN_1V8;
			writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQ7 + 0x4 * i));
		}

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI30_TOGGLE20_DQS_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQS));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_DQSN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI30_TOGGLE20_DQSN_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_DQSN));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_REN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI30_TOGGLE20_REN_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_REN));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_REC);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI30_TOGGLE20_REC_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_REC));

		regval = readl(REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN);
		regval &= ~REG_IOSHARE_NF_MASK;
		regval |= DS_ONFI30_TOGGLE20_WEN_1V8;
		writel(regval, (REG_BASE_IOSHARE + REG_IOSHARE_NF_WEN));
	}
}
/*****************************************************************************/

void hifmc100_set_sync_timing(struct nand_sync_timing *nand_sync_timing)
{
	unsigned int io_voltage = get_mmc_io_voltage();
	if (io_voltage == NAND_IO_VOL_3_3V)
		return hifmc100_set_timing_3_3v(nand_sync_timing);
	else
		return hifmc100_set_timing_1_8v(nand_sync_timing);
}
