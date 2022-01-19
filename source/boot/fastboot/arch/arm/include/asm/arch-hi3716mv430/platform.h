/* hi3716mv430 */
#ifndef __HI_CHIP_REGS_H__
#define __HI_CHIP_REGS_H__

/* system */
#define REG_BASE_SCTL                   0xF8000000
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
#define REG_BASE_TIMER01                0xF8002000
#define REG_BASE_TIMER23                0xF8A29000
#define REG_BASE_TIMER45                0xF8A2A000
#define REG_BASE_TIMER67                0xF8A2B000
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
#define BOOT_FROM_SPINAND               0x4
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

/******************************************************************************/
#include <asm/platform_common.h>

#define MERGE_IMAGE_BOOTADDR            0x02000000

#endif /*End of __HI_BOARD_H__ */

