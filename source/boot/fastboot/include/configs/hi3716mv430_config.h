

/*
 *  SDK Version
 *
 */
#define SDK_VERSION_STRING	"HiSTBLinuxV100R002"


/*
 *  nand flash support
 *  #define CONFIG_NAND_SUPPORT
 */
#define CONFIG_NAND_SUPPORT


/*
 *  spi flash support
 *
 */
#define CONFIG_SPIFLASH_SUPPORT	y


/*
 *  eth support
 *
 */
#define CONFIG_NET_SUPPORT	y


/*
 *  eth upport phy address
 *  #define HISFV_PHY_U
 */


/*
 *  eth downport phy address
 *  #define HISFV_PHY_D
 */


/*
 * no emmc flash support
 * #define CONFIG_EMMC_SUPPORT     y
 */


/*
 *  boot environment variables start address
 *
 */
#define CFG_ENV_ADDR	0x100000


/*
 *  boot environment variables size
 *
 */
#define CFG_ENV_SIZE	0x10000


/*
 *  boot environment variables range
 *
 */
#define CFG_ENV_RANGE	0x10000


/*
 *  Bakup boot environment variables support
 *  #define CONFIG_ENV_BACKUP
 */


/*
 *  Bakup boot environment variables start address
 *  #define CFG_ENV_BACKUP_ADDR
 */


/*
 *  build product with boot
 *
 */
//#define CONFIG_PRODUCT_WITH_BOOT	y


/*
 *  build auximg from auxcode
 *  #define CONFIG_AUXCODE_COMPILE_SUPPORT
 */


/*
 *  FPGA
 *  #define CFG_HI3716MV430_FPGA
 */


/*
 *  Simulate boot
 *  #define CONFIG_BOOT_SIMULATE
 */


/*
 *  Chip type
 *
 */
#define CHIP_TYPE_hi3716mv430	1


/*
 *  Gpio Light config
 *  #define CONFIG_GPIO_LIGHT_SET
 */


/*
 *  AVS config
 *
 */
#define CONFIG_AVS_SUPPORT	y


/*
 *  PMU Device config
 *  #define CONFIG_PMU_DEVICE
 */


/*
 *  USB Driver config
 *
 */
//#define CONFIG_USB_SUPPORT	y


/*
 *  HSL support
 *  #define CONFIG_HSL_SUPPORT y
 */


/*
 *  Secure boot config
 *  #define CONFIG_TEE_SUPPORT
 */


/*
 *  ARM64 toolchains config
 *
 */
#define CONFIG_ARM64_TOOLCHAINS	arm-histbv310-linux


/*
 *  ARM64 support config
 *  #define CONFIG_ARM64_SUPPORT
 */


/*
 *  Compress boot
 *
 */
#define CONFIG_COMPRESS_BOOT	y


/*
 *  Unified boot
 *
 */
//#define CONFIG_UNIFIED_BOOT	y


/*
 *  boot reg0
 *
 */
#define BOOT_REG0	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"


/*
 *  boot reg1
 *
 */
//#define BOOT_REG1	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"


/*
 *  boot reg2
 *
 */
//#define BOOT_REG2	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"
//#define BOOT_REG3	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"
//#define BOOT_REG4	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"
//#define BOOT_REG5	"/home/yjtao/misc/Code/source/boot/fastboot/hi3796mv200_fpga_umap5_nand.reg"


/*
 *  boot reg3
 *  #define BOOT_REG3
 */


/*
 *  boot reg4
 *  #define BOOT_REG4
 */


/*
 *  boot reg5
 *  #define BOOT_REG5
 */


/*
 *  boot reg6
 *  #define BOOT_REG6
 */


/*
 *  boot reg7
 *  #define BOOT_REG7
 */
