/******************************************************************************
 *    Copyright (C) 2014 Hisilicon STB Development Dept
 *    All rights reserved.
 * ***
 *    Create by Czyong
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *   http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
******************************************************************************/

#ifndef __HI_CHIP_REGS_H__
#define __HI_CHIP_REGS_H__

#define GIC_DIST_BASE                   0xF1001000
#define GIC_CPU_BASE                    0xF1002000

#define OSC_FREQ                        24000000

#define REG_BASE_SCTL                   0xF8000000
#define REG_BASE_TIMER01                0xF8002000
#define REG_BASE_TIMER23                0xF8A29000
#define REG_BASE_TIMER45                0xF8A2A000
#define REG_BASE_TIMER67                0xF8A2B000
#define TIMER0_BASE                     0xF8002000
#define TIMER1_BASE                     0xF8002020
#define TIMER2_BASE                     0xF8A29000
#define TIMER3_BASE                     0xF8A29020
#define TIMER4_BASE                     0xF8A2A000
#define TIMER5_BASE                     0xF8A2B020
#define TIMER6_BASE                     0xF8A2B000
#define TIMER7_BASE                     0xF8A2B020

#define TIMER0_IRQ_NR                   24
#define TIMER1_IRQ_NR                   24
#define TIMER2_IRQ_NR                   25
#define TIMER3_IRQ_NR                   25
#define TIMER4_IRQ_NR                   26
#define TIMER5_IRQ_NR                   26
#define TIMER6_IRQ_NR                   27
#define TIMER7_IRQ_NR                   27
#define REG_SC_CTRL                     0x0000
#define REG_SC_SYSRES                   0x0004
#define REG_SC_APLLFREQCTRL0            0x0018
#define REG_SC_APLLFREQCTRL1            0x001C
#define REG_SC_LOW_POWER_CTRL           0x0040
#define REG_SC_IO_REUSE_SEL             0x0044
#define REG_SC_SRST_REQ_CTRL            0x0048
#define REG_SC_CA_RST_CTRL              0x004C
#define REG_SC_WDG_RST_CTRL             0x0050
#define REG_SC_DDRC_DFI_RST_CTRL        0x0054
#define REG_SC_PLLLOCK_STAT             0x0070
#define REG_SC_GEN0                     0x0080
#define REG_SC_GEN1                     0x0084
#define REG_SC_GEN2                     0x0088
#define REG_SC_GEN3                     0x008C
#define REG_SC_GEN4                     0x0090
#define REG_SC_GEN5                     0x0094
#define REG_SC_GEN6                     0x0098
#define REG_SC_GEN7                     0x009C
#define REG_SC_GEN8                     0x00A0
#define REG_SC_GEN9                     0x00A4
#define REG_SC_GEN10                    0x00A8
#define REG_SC_GEN11                    0x00AC
#define REG_SC_GEN12                    0x00B0
#define REG_SC_GEN13                    0x00B4
#define REG_SC_GEN14                    0x00B8
#define REG_SC_GEN15                    0x00BC
#define REG_SC_GEN16                    0x00C0
#define REG_SC_GEN17                    0x00C4
#define REG_SC_GEN18                    0x00C8
#define REG_SC_GEN19                    0x00CC
#define REG_SC_GEN20                    0x00D0
#define REG_SC_GEN21                    0x00D4
#define REG_SC_GEN22                    0x00D8
#define REG_SC_GEN23                    0x00DC
#define REG_SC_GEN24                    0x00E0
#define REG_SC_GEN25                    0x00e4
#define REG_SC_GEN26                    0x00e8
#define REG_SC_GEN27                    0x00ec
#define REG_SC_GEN28                    0x00F0
#define REG_SC_GEN29                    0x00F4
#define REG_SC_GEN30                    0x00F8
#define REG_SC_GEN31                    0x00FC
#define REG_SC_SYSID0                   0x0EE0
#define REG_SC_SYSID1                   0x0EE4
#define REG_SC_SYSID2                   0x0EE8
#define REG_SC_SYSID3                   0x0EEC
#define REG_SC_GEN37                    0x0F14


/* host */
#define REG_BASE_OHCI                   0XF9880000
#define REG_BASE_EHCI                   0XF9890000
#define REG_BASE_FMC                    0xF9950000
#define MEM_BASE_FMC                    0xFE200000
#define REG_BASE_SF_ETH                 0XF9C30000
#define REG_BASE_UART0                  0xF8B00000
#define REG_BASE_WDG0                   0xF8A2C000
#define REG_BASE_GPIO0                  0xF8B20000
#define REG_BASE_GPIO1                  0xF8B21000
#define REG_BASE_GPIO2                  0xF8B22000
#define REG_BASE_GPIO3                  0xF8B23000
#define REG_BASE_GPIO4                  0xF8B24000
#define REG_BASE_GPIO5                  0xF8004000
#define REG_BASE_GPIO6                  0xF8B25000
#define REG_BASE_GPIO7                  0xF8B26000

#define REG_BASE_PERI_CTRL              0xF8A20000

#define CONFIG_UART_CLK                 75000000
#define CONFIG_UART_BAUD                115200
#define CONFIG_CUR_UART_BASE            REG_BASE_UART0
/* CRG */
/* nand */
#define REG_BASE_CRG                    0xF8A22000
#define REG_FMC_CFG			0x0
#define REG_FMC_CFG_NFMODE		(7 << 13)

/* wdg */
#define REG_PERI_CRG94                  0x178
#define REG_PERI_CRG44_USB3CTRL         0x00B0
#define REG_PERI_CRG47_USB2PHY          0x00BC
#define REG_PERI_CRG98_COMBPHY          0x0188

/* eth */
#define REG_CRG_GSF			0x00cc
#define REG_CRG_FEPHY			0x0388
#define REG_PERI_FEPHY			0x0118
#define REG_PERI_FEPHY_LDO		0x0844

#define REG_BASE_MCI_FPGA               0xF9830000
#define REG_BASE_MCI_ASIC               0xF9830000

#define GPIO_SIZE                       (0x1000)
#define MAX_GPIO_NUMS                   (18)

#define OTP_REG_BASE                    0xF8AB0000
#define REG_OTP_ID_WORD                 0xF8AB0060
#define OTP_ID_WORD_VALUE_NORMAL        0x2A13C812
#define OTP_ID_WORD_VALUE_SECURE        0x6EDBE953

#define REG_SCPU_SUPPORT                0xF8AB00F4
#define SCPU_NOT_SUPPORT                0x00420000
#define SCPU_SUPPORT_MASK               0x00FF0000

#define FLASH_IO_VOLTAGE_MASK           (0x01)

/* MEM MODE */
#define REG_MEM_COMB                    0xF8A384CC
#define MEM_MODE_SHIFT                  (0)
#define MEM_MODE_MASK                   (0x1)
#define MEM_COMB_SHIFT                  (1)
#define MEM_COMB_MASK                   (0x3)

#define BOARD_TYPE_MASK                 0xF


/* Pin Mux REG */
#define REG_BASE_IOSHARE                0xF8A21000
#define REG_IOSHARE_EBI_DQ7             (REG_BASE_IOSHARE + 0x000)
#define REG_IOSHARE_EBI_DQ6             (REG_BASE_IOSHARE + 0x004)
#define REG_IOSHARE_EBI_DQ5             (REG_BASE_IOSHARE + 0x008)
#define REG_IOSHARE_EBI_DQ4             (REG_BASE_IOSHARE + 0x00C)
#define REG_IOSHARE_10                  (REG_BASE_IOSHARE + 0x028)


#define EMMC_IO_VOLTAGE_MASK           (0x01)
#define EMMC_IO_VOL_1_8V               (0x01)
#define EMMC_IO_VOL_3_3V               (0x00)
#define HISFV300_MAC0_PORTSEL           0x0200


#define REG_START_MODE                  0x0000
#define REG_PERI_STAT                   0x0004
#define REG_PERI_CTRL                   0x0008
#define REG_PERI_CRG26                  0x00A8
#define NF_BOOTBW_MASK                  (1<<12)

#define REG_PERI_REMAP                  0x4

#define REG_TIMER_RELOAD                0x000
#define REG_TIMER_VALUE                 0x004
#define REG_TIMER_CONTROL               0x008

#define HI3716MV430_OSC_FREQ            24000000

#define MEM_BASE_DDR                    0x00000000

#define DEFAULT_UART_CLK                54000000

#define BOOT_FROM_DDR                   0x8
#define BOOT_FROM_SYNC_NAND             0x5
#define BOOT_FROM_SPI_NAND              0x4
#define BOOT_FROM_EMMC                  0x3
#define BOOT_FROM_NAND                  0x1
#define BOOT_FROM_SPI                   0x0

/* Pin Mux REG */

#define REG_BASE_IOSHARE                0xF8A21000
#define REG_IOSHARE_NF_MASK             (0x1F << 4)

#define REG_IOSHARE_NF_DQSN             0x020
#define REG_IOSHARE_NF_DQS              0x024
#define REG_IOSHARE_NF_DQ7              0x028
#define REG_IOSHARE_NF_DQ6              0x02c
#define REG_IOSHARE_NF_DQ5              0x030
#define REG_IOSHARE_NF_DQ4              0x034
#define REG_IOSHARE_NF_DQ3              0x038
#define REG_IOSHARE_NF_DQ2              0x03c
#define REG_IOSHARE_NF_DQ1              0x040
#define REG_IOSHARE_NF_DQ0              0x044
#define REG_IOSHARE_NF_WEN              0x048
#define REG_IOSHARE_NF_REN              0x058
#define REG_IOSHARE_NF_REC              0x054

#define REG_START_FLAG                  (REG_BASE_SCTL + REG_SC_GEN12)
#define REG_USB_UART_FLAG               (REG_BASE_SCTL + REG_SC_GEN2)
#define CONFIG_START_MAGIC              (0x444f574e)
#define CONFIG_JTAG_MAGIC               (0x4A544147)
#define RAM_START_ADRS                  0xFFFE0C00

#define REG_PERI_SOC_FUSE               0x840
#define NORMAL_BOOTMODE_OFFSET          9
#define NORMAL_BOOTMODE_MASK            7

/* ARM64 REG */
#define REG_PERI_CPU_RVBARADDR		0xf8a80034
#define REG_PERI_CPU_AARCH_MODE		0xf8a80030

/* ARM System counter reg */
#define REG_SYS_CNT_BASE		0xF8BB0000
#define REG_SYS_CNTCR			REG_SYS_CNT_BASE
#define REG_SYS_CNTFID0			(REG_SYS_CNT_BASE + 0x20)
/*********************************************************************/
/*
 * 0x1-> init item1
 * 0x2-> init item2
 * 0x3->init item1 & item2
 */
#define INIT_REG_ITEM1                  1
#define INIT_REG_ITEM2                  2
#define INIT_REG_ITEM1_ITEM2            (INIT_REG_ITEM1 | INIT_REG_ITEM2)

#define MERGE_IMAGE_BOOTADDR            0x02000000

#define CONFIG_SYS_GBL_DATA_SIZE        128

#define CONFIG_GLOBAL_DATA_SIZE         (CONFIG_ENV_SIZE + 0x2000)
#define CONFIG_SYS_MALLOC_LEN           0x200000
#define CONFIG_DMA_MALLOC_LEN           0x200000

#define CONFIG_MACHINE_ID               0x1F40
#define CONFIG_TASK_CYCLE               10
#define CONFIG_CLOCK_TICK               0
#define CONFIG_CLOCK_SOURCE             2
#define CONFIG_MAX_IRQ                  128
#define CONFIG_MAX_TASK                 20
#define CONFIG_VECTOR_BASE              0xFFFF0000
#define CONFIG_TAG_OFFSET               MEM_BASE_DDR + 0x100
#define CONFIG_TAG_MAX_SIZE             (0x10000)
/*
The arm64 kernel require that the device tree blob (dtb) must be placed
on an 8-byte boundary within the first 512 megabytes from the start of
the kernel image and must not cross a 2-megabyte boundary. This is to
allow the kernel to map the blob using a single section mapping in the
initial page tables. Since we place the dtb to the tail of ATAGS area, that is
0x10100(CONFIG_TAG_OFFSET + CONFIG_TAG_MAX_SIZE), and the arm64 kernel is placed at
0x80000, we limit the max dtb size to 128K, which is a safe and enough size for dtb.
*/
#define CONFIG_DTB_MAX_SIZE          (0x20000)

/******************************************************************************/
#define CONFIG_JTAG_PRG_SUPPORT
#ifdef CONFIG_JTAG_PRG_SUPPORT
#define CONFIG_JTAG_RECV_BUF_ADDR 0x1000000
#define CONFIG_JTAG_RECV_BUF_SIZE 0x400
#define CONFIG_JTAG_SEND_BUF_ADDR (CONFIG_JTAG_RECV_BUF_ADDR + 2 * CONFIG_JTAG_RECV_BUF_SIZE)
#define CONFIG_JTAG_SEND_BUF_SIZE 0x100000
#endif

#define CONFIG_MEM_BASE_FREE_START  (CONFIG_JTAG_SEND_BUF_ADDR + 2 * CONFIG_JTAG_SEND_BUF_SIZE)

/* size definition */
#define CONFIG_UNCHK_SIZE	0x1000
#define CONFIG_REG_SIZE		0x2000

/* offset definition */
#define CONFIG_HSL_SUPPORT

/*--------- hsl area --------------*/
#define CONFIG_HSL_AREA_POS         0x0
#define CONFIG_HSL_AREA_LEN         0x10000

/*--------- key area --------------*/
#define CONFIG_BBL_POS		        CONFIG_HSL_AREA_LEN
#define CONFIG_KEY_RIGHTS_POS       (CONFIG_BBL_POS + 0x210)
#define CONFIG_AUXAREA_LEN_POS		(CONFIG_BBL_POS + 0x214)
#define CONFIG_ASCAREA_LEN_POS		(CONFIG_BBL_POS + 0x218)
#define CONFIG_PROTECT_KEY1_POS		(CONFIG_BBL_POS + 0x220)
#define CONFIG_PROTECT_KEY2_POS	        (CONFIG_BBL_POS + 0x230)
#define CONFIG_PROTECT_KEY3_POS		(CONFIG_BBL_POS + 0x240)
#define CONFIG_AUXKEY_POS		    (CONFIG_BBL_POS + 0x250)
#define CONFIG_KEY_AREA_SIG_POS		(CONFIG_BBL_POS + 0x300)
#define CONFIG_KEY_RIGHTS           (0x3C78962D)
#define CONFIG_HEAD_AREA_LEN        0x3000
#define CONFIG_AUXAREA_LEN          0x5000
#define CONFIG_ASCAREA_LEN          0x0
/*--------Encrypted Auxcode Protection Key------*/
/* 7f 2d 4c 97 91 16 3b 1c 1a 72 93 89 a2 5e 56 82 */
#define CONFIG_AUXKEY_0             0x974c2d7f
#define CONFIG_AUXKEY_1             0x1c3b1691
#define CONFIG_AUXKEY_2             0x8993721a
#define CONFIG_AUXKEY_3             0x82565ea2

/*--------- param area --------------*/
#define CONFIG_PARAM_AREA_POS		(CONFIG_BBL_POS + 0x400)
#define CONFIG_SCS_HASHED_AREA_OFF_POS	(CONFIG_BBL_POS + 0x400)
#define CONFIG_SCS_HASHED_AREA_LEN_POS	(CONFIG_BBL_POS + 0x404)
#define CONFIG_TOTAL_BOOT_AREA_LEN_POS	(CONFIG_BBL_POS + 0x408)
#define CONFIG_FLASH_BOOT_ENC_FLAG_POS	(CONFIG_BBL_POS + 0x40C)
#define CONFIG_BOOT_ENTRY_POS		(CONFIG_BBL_POS + 0x420)
#define CONFIG_EXT_PARAMS_AREA_FLAG_POS	(CONFIG_BBL_POS + 0x428)
#define CONFIG_EXT_PARAMS_AREA_LEN_POS	(CONFIG_BBL_POS + 0x42C)
#define CONFIG_EXT_PARAMS_AREA_NUM_POS	(CONFIG_BBL_POS + 0x430)
#define CONFIG_DEFAULT_BOOT_REG_POS	(CONFIG_BBL_POS + 0x4B0)

#define CONFIG_PARAM_AREA_SIG_POS	(CONFIG_BBL_POS + 0x2EC0)

#define CONFIG_SCS_HASHED_AREA_OFF_VAL	CONFIG_UNCHK_SIZE
#define CONFIG_FLASH_BOOT_ENC_FLAG      (0x3C7896E1)

#define CONFIG_EXT_PARAMS_AREA_FLAG		(0x83855248)
#define CONFIG_EXT_PARAMS_AREA_LEN		CONFIG_REG_SIZE
#define CONFIG_EXT_PARAMS_AREA_NUM      0x6
/*--------- unchecked area for hisi --------------*/
#define CONFIG_UNCHK_AREA_HISI_POS	(CONFIG_BBL_POS + 0x2FC0)
#define CONFIG_SCS_SIM_FLAG_POS		(CONFIG_BBL_POS + 0x2FC0)
#define  CONFIG_SCS_SIM_FLAG_VAL	0x69875AB4

#define CONFIG_BOOT_FLAG_POS		(CONFIG_BBL_POS + 0x2FC4)
#define  CONFIG_BOOT_FLAG_VAL		0x435A590D

#define CONFIG_AUX_ENC_FLAG_POS		(CONFIG_BBL_POS + 0x2FC8)


#define  CONFIG_AUX_ENC_FLAG_VAL	0x2a13c812



#define CONFIG_BOOT_STORE_ADDR_POS	(CONFIG_BBL_POS + 0x2FEC)
#define  CONFIG_BOOT_STRORE_ADDR_VAL	CONFIG_MEM_BASE_FREE_START

/*--------- auxcode area --------------*/
#define CONFIG_AUXCODE_AREA_POS		(CONFIG_BBL_POS + CONFIG_HEAD_AREA_LEN)

/*--------- Boot area --------------*/
#define CONFIG_CHECKED_AREA_START       (CONFIG_AUXCODE_AREA_POS + CONFIG_AUXAREA_LEN + CONFIG_UNCHK_SIZE)

/******************************************************************************/
#define CONFIG_BL31_BASE                       0x8020000
#define CONFIG_BL31_SIZE                       0x200000

#define CONFIG_SYS_SRST_SUPPORT

#ifdef CONFIG_SYS_SRST_SUPPORT
#define SYS_SRST_SRAM_BASE 0xFFFF7000
#define SYS_SRST_MAX_SIZE 4096
#endif
/*****************************************************************************/

#ifndef __ASSEMBLY__

#define WDG_ENABLE(_nn) do { \
	(*(volatile unsigned int *)(WDG_LOCK)    = (0x1ACCE551)); \
	(*(volatile unsigned int *)(WDG_LOAD)    = (_nn)); \
	(*(volatile unsigned int *)(WDG_CONTROL) = (0x3)); \
	(*(volatile unsigned int *)(WDG_LOCK)    = (0)); \
} while (0)

#define WDG_DISABLE() do { \
	(*(volatile unsigned int *)(WDG_LOCK)    = (0x1ACCE551)); \
	(*(volatile unsigned int *)(WDG_CONTROL) = (0)); \
	(*(volatile unsigned int *)(WDG_LOCK)    = (0)); \
} while (0)

#endif /* __ASSEMBLY__ */

#include <cpuids.h>

#endif /*End of __HI_BOARD_H__ */


