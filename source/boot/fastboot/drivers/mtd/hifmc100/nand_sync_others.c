#include <common.h>
#include <nand.h>
#include <asm/arch/platform.h>
#include <hinfc_gen.h>
#include <asm/io.h>

#include "hifmc100_reg.h"
#include "hiflash.h"
#include "nand_sync.h"

/*****************************************************************************/
struct nand_sync_timing hifmc100_nand_sync_timing[] = {
	/* {desc, {id}, id_len, synctype, timing, clock(in MHz)} */
	/* id_len == 0, means default value, don't remove. */
	{NULL, {0x00}, 0, 0, 0, 0},
};

void hifmc100_set_sync_timing(struct nand_sync_timing *nand_sync_timing)
{
}
