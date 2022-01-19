/******************************************************************************
 *    Copyright (c) 2017 by Hisi.
 *    All rights reserved.
 * ***
 *
 ******************************************************************************/

#include <stdio.h>
#include <config.h>
#include <boot.h>
#include <early_uart.h>

#define REG_MODULE_HEAD_SIZE 2
#define REG_LEN_SIZE         2
#define REG_BASE_SIZE        3
#define REG_CFG_LEN_SIZE     2
#define REG_FMT_SIZE         3
#define REG_TABLE_END_FLAG   0
#define REG_OFFSET_POS       10
#define REG_MAX_LENGTH       8192
#define REG_VERSION_V120     0x30323176  /* v120 */

/* Boot mode */
#define BOOT_MODE_SPINAND               0x4
#define BOOT_MODE_EMMC                  0x3
#define BOOT_MODE_NAND                  0x1
#define BOOT_MODE_SPI                   0x0

#define AUTH_SUCCESS                (0x3CA5965A)
#define AUTH_FAILURE                (0xC35A69A5)

#define readl(_a)        (*(volatile unsigned int *)(_a))
#define writel(_v, _a)   (*(volatile unsigned int *)(_a) = (_v))

#define reg_get(_a)      (*(volatile unsigned int *)(_a))
#define reg_set(_a, _v)  (*(volatile unsigned int *)(_a) = (_v))

typedef unsigned int u32;

union reg_module_head {
	struct {
		unsigned char ca_flag : 1;     /* whether execute when ca chip */
		unsigned char normal_flag : 1; /* whether execute when normal(no-ca) chip */
		unsigned char wakeup_flag : 1; /* whether execute when wakeup from standby */
		unsigned char boot_flag : 1;   /* whether execute when power on */
		unsigned char module_type : 4; /* module type, like: spi,nand...  */
	} member;
	unsigned char val;
};

union reg_format {
	struct {
		/* byte 0 */
		unsigned char rw_flag : 1;     /* read or write: 0-write; 1-read */
		unsigned char reserve : 1;
		unsigned char offset : 6;      /* real offset = (offset << 2)*/

		/* byte 1 */
		unsigned char bit_off : 5;     /* bit offset of read/write */
		unsigned char val_len : 3;     /* byte length of val to be read/write: 0-0; 1~3 - 1~3byte; */

		/* byte 2 */
		unsigned char bit_num : 5;     /* bit num of read/write, real bit number = bit_num + 1 */
		unsigned char delay_len : 3;   /* byte length of delay: 0-endless; 1~3 - 1~3byte; */
	} member;
	unsigned char val[3];
};

typedef union
{
	struct
	{
		u32 op_mode                 :1;    //[0]
		u32 flash_sel               :2;    //[2:1]
		u32 page_size               :2;    //[4:3]
		u32 ecc_type                :3;    //[7:5]
		u32 block_size              :2;    //[9:8]
		u32 spi_nor_addr_mode       :1;    //[10]
		u32 spi_nand_sel            :2;    //[12:11]
		u32 nf_mode                 :3;    //[15:13]
		u32 reserved                :16;   //[31:16]
	} bits;
	u32 u32;
} FMC_CFG_U;

/* PERI ctrl register definition */
typedef union
{
	struct
	{
		u32 reserved_0              : 9; //[8:0]
		u32 boot_sel                : 3; //[11:9]
		u32 reserved_1              : 8; //[19:12]
		u32 romboot_sel             : 1; //[20]
		u32 reserved_2              : 2; //[22:21]
		u32 jtag_sel_in             : 1; //[23]
		u32 usb_boot                : 1; //[24]
		u32 sdio_pu_en_in_lock      : 1; //[25]
		u32 flash_boot_in           : 1; //[26]
		u32 reserved_3              : 5; //[31:27]
	} bits;
	u32 u32;
} PERI_START_MODE_U;            //0x0 START_MODE

enum mod_type {
	MOD_TYPE_NORMAL = 0,
	MOD_TYPE_SPI = 1,
	MOD_TYPE_NAND = 2,
	MOD_TYPE_EMMC = 3,
	MOD_TYPE_SYNCNAND = 4,
	MOD_TYPE_SD = 4,
	MOD_TYPE_BUTT,
};

/*****************************************************************************/
struct reg_filter
{
	unsigned int offset;
	unsigned int mask;
};

struct module_filter
{
	unsigned int baseaddr;
	struct reg_filter *filter;
};

struct reg_checklist_t
{
	struct module_filter *module_list;
	unsigned int module_count;
	struct reg_filter *other;
};

extern u32 *default_boot_reg_pos;
extern int get_boot_mode(void);

/*****************************************************************************/

static inline void delay(unsigned int cnt)
{
	while (cnt--)
		__asm__ __volatile__("nop");
}
/*****************************************************************************/
unsigned int boottype2modtype(unsigned int boot_type)
{
	int i, size;
	FMC_CFG_U un_fmc_cfg;
	unsigned int array[][2] = {
		{BOOT_MODE_SPI, MOD_TYPE_SPI},
		{BOOT_MODE_NAND, MOD_TYPE_NAND},
		{BOOT_MODE_EMMC, MOD_TYPE_EMMC},
		{BOOT_MODE_SPINAND, MOD_TYPE_SPI},
	};

	size = sizeof(array) / sizeof((array)[0]);

	for (i = 0; i < size; i++) {
		if (boot_type == BOOT_MODE_NAND) {
			un_fmc_cfg.u32 = readl(REG_BASE_FMC + REG_FMC_CFG);
			if (un_fmc_cfg.bits.nf_mode == 0) {
				return MOD_TYPE_NAND;
			} else
			      return MOD_TYPE_SYNCNAND;
		}

		if (array[i][0] == boot_type)
		      return array[i][1];
	}

	return MOD_TYPE_NORMAL;
}

/*****************************************************************************/

int regaddr_is_valid(unsigned int regaddr, unsigned int *bitmask,
			struct reg_checklist_t *checklist)
{
	unsigned int base = regaddr & 0xfffff000;
	struct reg_filter *filter = 0;
	struct module_filter *module_list = checklist->module_list;
	unsigned int i = 0;
	volatile unsigned int tmp_regaddr;

	*bitmask = 0x0;

	if ((regaddr & 0xffff0000) == 0xf8a30000) {
		tmp_regaddr = regaddr;

		if ((tmp_regaddr & 0xffff0000) != 0xf8a30000) {
			reset_cpu(0);
		}

		*bitmask = 0xffffffff;
		return AUTH_SUCCESS;
	}

	for(i = 0; i < checklist->module_count; i++) {
		if (module_list->filter == 0)
		      break;

		if(base == module_list->baseaddr) {
			filter = module_list->filter;
			break;
		}
		module_list++;
	}

	if(!filter) {
		filter = checklist->other;
		base = 0;
	}

	for(i = 0; filter[i].mask; i++) {
		if(regaddr == (base + filter[i].offset)) {
			tmp_regaddr = regaddr;

			if(tmp_regaddr != (base + filter[i].offset)) {
				reset_cpu(0);
			}

			*bitmask = filter[i].mask;
			return AUTH_SUCCESS;
		}
	}

	return AUTH_FAILURE;
}

static void reg_read_write(unsigned int addr,
			unsigned int val,
			unsigned int wait,
			union reg_format *reg,
			unsigned int bitmask)
{
	unsigned int tmp_val;
	unsigned int bit_num = reg->member.bit_num + 1;
	unsigned int regmask;

#ifdef CONFIG_REG_DEBUG
	uart_early_puts("\n r/w ");
	uart_early_put_hex(reg->member.rw_flag);
	uart_early_puts(" addr ");
	uart_early_put_hex(addr);
	uart_early_puts(" bn ");
	uart_early_put_hex(reg->member.bit_num);
	uart_early_puts(" bo ");
	uart_early_put_hex(reg->member.bit_off);
	uart_early_puts(" v ");
	uart_early_put_hex(val);
	uart_early_puts(" d ");
	uart_early_put_hex(wait);
#endif

	if (reg->member.rw_flag) { /* read */
		/* if wait == 0, then wait endless */
		if (!wait)
		      wait = 120000000; //1s for 1.2G

		do {
			tmp_val = readl(addr);
			if (bit_num != 32) {
				tmp_val >>= reg->member.bit_off;
				tmp_val &= ((1<<bit_num)-1);
			}

			/* timeout */
			if (0 == wait--)
			      break;

			delay(1);
		} while (tmp_val != val);

		if (tmp_val != val) {
			uart_early_puts("Warning: read reg: ");
			uart_early_put_hex(addr);
			uart_early_puts(" fail.\n");
		}

	} else { /* write */
		if (bit_num < 32) {
			regmask = ((1<<bit_num)-1)<<reg->member.bit_off;
		} else {
			regmask = 0xffffffff;
		}
		regmask &= bitmask;
		regmask &= bitmask;
		regmask &= bitmask;
		tmp_val = readl(addr);
		tmp_val &= ~(regmask);
		val = tmp_val | ((val << reg->member.bit_off) & regmask);
		writel(val, addr);

		delay(wait);
	}
}
/*****************************************************************************/

static void reg_parse_register(unsigned char *buf, unsigned int base, int length)
{
	unsigned char *pbuf = buf;
	union reg_format reg;
	unsigned int reg_addr;
	unsigned int val, delay;
	unsigned int bitmask = 0;
	while (pbuf < (buf + length)) {
		reg.val[0] = pbuf[0];
		reg.val[1] = pbuf[1];
		reg.val[2] = pbuf[2];
		pbuf += REG_FMT_SIZE;

		val = delay = 0;

		if (reg.member.val_len > 4) {
			reset_cpu(0);
		}

		while (reg.member.val_len--)
		      val = (val << 8) | (*pbuf++);

		if (reg.member.delay_len > 4) {
			reset_cpu(0);
		}

		while (reg.member.delay_len--)
		      delay = (delay << 8) | (*pbuf++);

		if (pbuf > (buf + length)) {
			reset_cpu(0);
		}

		reg_addr = base + (reg.member.offset << 2);

		struct reg_filter sysctrl[] = {
			{0x0, 0xffffffff},
			{0x48, 0xffffffff},
			{0x58, 0xffffffff},
			{0x68, 0xffffffff},
			{0x8C, 0xffffffff},
			{0x98, 0xffffffff},
			{0xA8, 0xffffffff},
			{0xAC, 0xffffffff},
			{0xC4, 0xffffffff},
			{0xC8, 0xffffffff},
			{0xD0, 0xffffffff},
			{0xF4, 0xffffffff},
			{0xF00, 0xffffffff},
			{0, 0}
		};

		struct reg_filter crg[] = {
			{0x0, 0xffffffff},
			{0x4, 0xffffffff},
			{0x8, 0xffffffff},
			{0xc, 0xffffffff},
			{0x10, 0xffffffff},
			{0x14, 0xffffffff},
			{0x20, 0xffffffff},
			{0x24, 0xffffffff},
			{0x28, 0xffffffff},
			{0x2c, 0xffffffff},
			{0x30, 0xffffffff},
			{0x34, 0xffffffff},
			{0x38, 0xffffffff},
			{0x3c, 0xffffffff},
			{0x48, 0xffffffff},
			{0x58, 0xffffffff},
			{0xa0, 0xffffffff},
			{0x128, 0xffffffff},
			{0x134, 0xffffffff},
			{0x180, 0xffffffff},
			{0x27C, 0xffffffff},
			{0x380, 0xffffffff},
			{0, 0}
		};

		struct reg_filter pmc[] = {
			{0x18, 0xffffffff},
			{0x1c, 0xffffffff},
			{0x20, 0xffffffff},
			{0x24, 0xffffffff},
			{0xfc, 0xffffffff},
			{0, 0}
		};

		struct reg_filter others[] = {
			{0, 0}
		};

		struct module_filter modulelist[] = {
			{0xF8000000, sysctrl},
			{0xF8A22000, crg},
			{0xF8A23000, pmc},
			{0, 0},
		};

		struct reg_checklist_t reg_checklist;
		reg_checklist.module_list = modulelist;
		reg_checklist.module_count = sizeof(modulelist)/sizeof(struct module_filter);
		reg_checklist.other = others;

		bitmask = 0;
		if (regaddr_is_valid(reg_addr, &bitmask, &reg_checklist) == AUTH_SUCCESS) {
			continue;
		}

		bitmask = 0xFFFFFFFF;

		reg_read_write(reg_addr, val, delay, &reg, bitmask);
	}

	if (pbuf != (buf + length)) {
		reset_cpu(0);
	}

}
/*****************************************************************************/

static void reg_parse_group(unsigned char *buf, int length)
{
	unsigned int base;
	int regcfg_len;
	unsigned char *pbuf = buf;

	while (pbuf < (buf + length)) {
		base = (pbuf[0]<<24) | (pbuf[1]<<16) | (pbuf[2]<<8);
		regcfg_len = (pbuf[3]<<8) | pbuf[4];

		pbuf += REG_BASE_SIZE + REG_CFG_LEN_SIZE;
		if ((pbuf + regcfg_len) <= (buf + length)) {
			reg_parse_register(pbuf, base, regcfg_len);
		}

		pbuf += regcfg_len;
	}

	if (pbuf != (buf + length)) {
		reset_cpu(0);
	}

}
/*****************************************************************************/

void reg_init_module(unsigned int param)
{
	unsigned int regbase = param;
	unsigned int pm_flag = 0;
	unsigned int ca_flag = 1;
	unsigned int module_type;
	union reg_module_head head;
	int length = 0;
	unsigned short offset = *(unsigned short *)(regbase + REG_OFFSET_POS);
	unsigned char *regbuf = (unsigned char *)(regbase + offset);
	int boot_mode;

	if (SCPU_NOT_SUPPORT == (readl(REG_SCPU_SUPPORT) & SCPU_SUPPORT_MASK))  {
		return;
	}

	boot_mode = get_boot_mode();
	module_type = boottype2modtype(boot_mode);

	while ((REG_TABLE_END_FLAG != (*(unsigned int *)regbuf)) && (length < REG_MAX_LENGTH)) {
		length = (regbuf[2]<<8) | regbuf[3];

		if (length >= REG_MAX_LENGTH)
		      reset_cpu(0);

		head.val = regbuf[1];
		regbuf += REG_MODULE_HEAD_SIZE + REG_LEN_SIZE;
		if ((!head.member.module_type) || (head.member.module_type == module_type)) {
			if ((head.member.boot_flag & (!pm_flag)) || (head.member.wakeup_flag & pm_flag))
			      if ((head.member.normal_flag & (!ca_flag)) || (head.member.ca_flag & ca_flag)) {
				      reg_parse_group(regbuf, length);
			      }
		}

		length = (length + 3) & (~3);
		regbuf += length;
	}
}
void init_registers(unsigned int base, unsigned int pm, unsigned int which)
{
	reg_init_module(base);
}

