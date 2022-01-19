CFG_HI_SDK_VERSION="HiSTBLinuxV100R005C00SPC061_20181030"

ifeq ($(SDK_CFGFILE),)
SDK_CFGFILE=cfg.mak
endif

include $(SDK_DIR)/$(SDK_CFGFILE)

ifeq ($(VERSION_CFGFLIE),)
VERSION_CFGFILE=version.mak
endif

include $(SDK_DIR)/$(VERSION_CFGFILE)

ifeq ($(CFG_PRODUCT_TYPE),linux)
ifneq ($(HISI_LINUX_ENV),ok)
$(error "Please run 'source ./env.sh' before building!")
endif
endif

#=============SDK_DIR======================================================================

HI_CONFIGS_DIR := $(SDK_DIR)/configs
HI_SCRIPTS_DIR := $(SDK_DIR)/scripts

HI_HAL_DIR := $(SDK_DIR)/source/component/hal

HI_TOOLS_DIR := $(SDK_DIR)/tools/linux/utils

ifneq ($(ANDROID_BUILD),y)
OPEN_SOURCE_DIR=$(SDK_DIR)/third_party/open_source
PLATFORM_DIR=$(SDK_DIR)/platform
HIDOLPHIN_DIR=$(PLATFORM_DIR)/hidolphin
endif

ifneq ($(CFG_HI_OUT_DIR),)
HI_OUT_DIR := $(SDK_DIR)/out/$(CFG_HI_CHIP_TYPE)/$(CFG_HI_OUT_DIR)

saved-output := $(HI_OUT_DIR)

$(shell [ -d $(HI_OUT_DIR) ] || mkdir -p $(HI_OUT_DIR))

HI_OUT_DIR := $(shell cd $(HI_OUT_DIR) && /bin/pwd)
$(if $(HI_OUT_DIR),,$(error output directory "$(saved-output)" does not exist))
endif

#=============SRC_DIR======================================================================
SOURCE_DIR      := $(SDK_DIR)/source
COMMON_DIR      := $(SOURCE_DIR)/common
MSP_DIR         := $(SOURCE_DIR)/msp
COMPONENT_DIR   := $(SOURCE_DIR)/component
SAMPLE_DIR      := $(SDK_DIR)/sample
KERNEL_SRC_DIR  := $(SOURCE_DIR)/kernel/$(CFG_HI_KERNEL_VERSION)

ifneq ($(ANDROID_BUILD),y)
PLUGIN_DIR      := $(SOURCE_DIR)/plugin
ROOTFS_SRC_DIR  := $(SOURCE_DIR)/rootfs
BOOT_DIR        := $(SOURCE_DIR)/boot
KERNEL_DIR      := $(SOURCE_DIR)/kernel

ifeq ($(CFG_HI_CPU_ARCH),arm64)
OBJ_NAME := obj64
else
OBJ_NAME := obj
endif

ifeq ($(CFG_HI_USER_SPACE_ALL_LIB),y)
HI_USER_SPACE_LIB := y
HI_USER_SPACE_LIB64 := y
else ifeq ($(CFG_HI_USER_SPACE_LIB64),y)
HI_USER_SPACE_LIB64 := y
else
HI_USER_SPACE_LIB := y
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450 hi3716mv430),)
ifneq ($(findstring $(CFG_HI_ADVCA_TYPE), NAGRA IRDETO CONAX VERIMATRIX_ULTRA),)
HI_ADVANCED_CHIP := y
endif
ifeq ($(CFG_HI_TEE_SUPPORT),y)
HI_SMMZ2_SUPPORT := y
HI_TEE_SMMZ2_SUPPORT := y
endif
endif

ifeq ($(HI_OUT_DIR),)
LINUX_DIR := $(KERNEL_SRC_DIR)
FIP_OUT_DIR := $(KERNEL_DIR)/arm-trusted-firmware
HI_INCLUDE_DIR := $(SDK_DIR)/pub/include
HI_INSTALL_DIR := $(SDK_DIR)/pub
else
LINUX_DIR := $(HI_OUT_DIR)/$(OBJ_NAME)/$(subst $(SDK_DIR)/,,$(KERNEL_SRC_DIR))
FIP_OUT_DIR := $(HI_OUT_DIR)/$(OBJ_NAME)/$(subst $(SDK_DIR)/,,$(KERNEL_DIR)/arm-trusted-firmware)
HI_INCLUDE_DIR := $(HI_OUT_DIR)/include
HI_INSTALL_DIR := $(HI_OUT_DIR)
HI_ROOTFS_DIR := $(HI_OUT_DIR)/$(OBJ_NAME)/rootfs
endif
endif

#=============INCLUDE_DIR==================================================================
MSP_UNF_INCLUDE         := $(MSP_DIR)/include
MSP_API_INCLUDE         := $(MSP_DIR)/api/include
MSP_DRV_INCLUDE         := $(MSP_DIR)/drv/include
COMMON_UNF_INCLUDE      := $(COMMON_DIR)/include
COMMON_API_INCLUDE      := $(COMMON_DIR)/api/include
COMMON_DRV_INCLUDE      := $(COMMON_DIR)/drv/include

#=============HI_OUT_DIR======================================================================
HI_PREBUILTS_DIR        := $(HI_CONFIGS_DIR)/$(CFG_HI_CHIP_TYPE)/prebuilts
HI_IMAGE_DIR            := $(HI_INSTALL_DIR)/image
HI_SPI_IMAGE_DIR        := $(HI_IMAGE_DIR)/spi_image
HI_NAND_IMAGE_DIR       := $(HI_IMAGE_DIR)/nand_image
HI_EMMC_IMAGE_DIR       := $(HI_IMAGE_DIR)/emmc_image
HI_SPI_EMMC_IMAGE_DIR   := $(HI_IMAGE_DIR)/spi_emmc_image
HI_SPI_NAND_IMAGE_DIR   := $(HI_IMAGE_DIR)/spi_nand_image
HI_MODULE_DIR           := $(HI_INSTALL_DIR)/kmod
HI_ROOTBOX_DIR          := $(HI_INSTALL_DIR)/rootbox

HI_LIB_DIR              := $(HI_INSTALL_DIR)/lib
HI_STATIC_LIB_DIR       := $(HI_LIB_DIR)/static
HI_SHARED_LIB_DIR       := $(HI_LIB_DIR)/share
HI_EXTERN_LIB_DIR       := $(HI_LIB_DIR)/extern

HI_LIB64_DIR            := $(HI_INSTALL_DIR)/lib64
HI_STATIC_LIB64_DIR     := $(HI_LIB64_DIR)/static
HI_SHARED_LIB64_DIR     := $(HI_LIB64_DIR)/share
HI_EXTERN_LIB64_DIR     := $(HI_LIB64_DIR)/extern

#=============TEE_DIR==================================================================
HI_TEE_API_DIR          := $(SDK_DIR)/source/tee/api
HI_TEE_DRV_DIR          := $(SDK_DIR)/source/tee/drv
HI_TEE_TA_DIR           := $(SDK_DIR)/source/tee/ta
HI_TEE_COMPONENT_DIR    := $(SDK_DIR)/source/tee/ta/component

ifeq ($(CFG_HI_OPTEE_SUPPORT), y)
HI_TEE_OS_DIR           := $(SDK_DIR)/source/tee/core/optee
TEE_API_INCLUDE         := $(HI_TEE_OS_DIR)/ca_dev_dir/include
TEE_DRV_INCLUDE         := $(KERNEL_SRC_DIR)/drivers/tee/optee
else
HI_TEE_OS_DIR           := $(SDK_DIR)/source/tee/core/trustedcore
TEE_API_INCLUDE         := $(HI_TEE_OS_DIR)/libteec/inc
TEE_DRV_INCLUDE         := $(KERNEL_SRC_DIR)/drivers/hisilicon/tee/tee_hisi/tzdriver
endif

HI_TA_IMAGE_DIR         := $(HI_INSTALL_DIR)/ta_image

#=============TEE cfg===================================================================
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450),)
CFG_HI_TEE_RESERVED_MEM=y
# Reserve TEE memory, 64K gap + 152M TEE memory + 64K gap
CFG_HI_TEE_RESERVED_MEM_ADDR=0x7FF0000
ifeq ($(CFG_HI_OPTEE_SUPPORT), y)
# optee will take extra 4M reserved share memory
CFG_HI_TEE_RESERVED_MEM_SIZE=0x9c20000
else

ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX_ULTRA)
CFG_HI_TEE_RESERVED_MEM_SIZE=0xB020000
else
CFG_HI_TEE_RESERVED_MEM_SIZE=0x9820000
endif

endif
CFG_HI_BL31_SIZE=2097152
endif


ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv310 hi3716dv110h),)
CFG_HI_TEE_RESERVED_MEM=y
CFG_HI_TEE_RESERVED_MEM_ADDR=0x7FF0000
CFG_HI_TEE_RESERVED_MEM_SIZE=0x5120000
CFG_HI_BL31_SIZE=2097152
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv200h)
CFG_HI_TEE_RESERVED_MEM=y
CFG_HI_TEE_RESERVED_MEM_ADDR=0x7FF0000
CFG_HI_TEE_RESERVED_MEM_SIZE=0x5120000
CFG_HI_BL31_SIZE=2097152
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv300h)
CFG_HI_TEE_RESERVED_MEM=y
CFG_HI_TEE_RESERVED_MEM_ADDR=0x7FF0000
CFG_HI_TEE_RESERVED_MEM_SIZE=0x5120000
CFG_HI_BL31_SIZE=2097152
endif

#=============ATF cfg===================================================================
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450), )
ifeq ($(CFG_HI_CPU_ARCH), arm64)
CFG_HI_TEE_ATF_SUPPORT=y
endif
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv310 hi3716dv110h),)
CFG_HI_TEE_ATF_SUPPORT=y
CFG_HI_ARM32_ATF_SUPPORT=y
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv200h)
CFG_HI_TEE_ATF_SUPPORT=y
CFG_HI_ARM32_ATF_SUPPORT=y
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv300h)
CFG_HI_TEE_ATF_SUPPORT=y
CFG_HI_ARM32_ATF_SUPPORT=y
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200 hi3798mv300 hi3798cv200),)
ifeq ($(CFG_HI_TEE_SUPPORT),y)
ifneq ($(CFG_HI_CHIP_TYPE)_$(CFG_HI_ADVCA_TYPE),hi3798mv200_VERIMATRIX_ULTRA)
CFG_HI_ARM32_ATF_SUPPORT=y
CFG_HI_TEE_ATF_SUPPORT=y
CFG_HI_BL31_SIZE=2097152
endif
endif
endif

#=============TOOL CHAINS===================================================================
HI_TOOLCHAINS_DIR := $(SDK_DIR)/tools/linux/toolchains
ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv300-linux)
CFG_HI_ARM_TOOLCHAINS_NAME := arm-histbv310-linux
endif
ifeq ($(CFG_HI_64BIT_SYSTEM),y)
HI_KERNEL_TOOLCHAINS_NAME := $(CFG_HI_AARCH64_TOOLCHAINS_NAME)
else
HI_KERNEL_TOOLCHAINS_NAME := $(CFG_HI_ARM_TOOLCHAINS_NAME)
endif

ifneq ($(ANDROID_BUILD),y)
ifeq ($(KERNELRELEASE),)
AR=$(CFG_HI_ARM_TOOLCHAINS_NAME)-ar
AS=$(CFG_HI_ARM_TOOLCHAINS_NAME)-as
LD=$(CFG_HI_ARM_TOOLCHAINS_NAME)-ld
CPP=$(CFG_HI_ARM_TOOLCHAINS_NAME)-cpp
CC=$(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc
NM=$(CFG_HI_ARM_TOOLCHAINS_NAME)-nm
STRIP=$(CFG_HI_ARM_TOOLCHAINS_NAME)-strip
OBJCOPY=$(CFG_HI_ARM_TOOLCHAINS_NAME)-objcopy
OBJDUMP=$(CFG_HI_ARM_TOOLCHAINS_NAME)-objdump
CFG_HI_BASE_ENV+=" AR AS LD CPP CC NM STRIP OBJCOPY OBJDUMP "
endif
endif

#=============SERVER_UNTILS=================================================================
ifneq ($(ANDROID_BUILD),y)
MKIMAGE := mkimage
MKBOOTARGS := mkbootargs
MKBOOTIMG := mkbootimg
MKCRAMFS := mkfs.cramfs
MKEXT4FS := make_ext4fs
MKSQUASHFS := mksquashfs
MKJFFS2 := mkfs.jffs2
MKYAFFS := mkyaffs
MKUBIIMG := mkubiimg.sh
FILECAP := filecap
CFG_HI_BASE_ENV+=" MKIMAGE MKBOOTIMG MKCRAMFS MKSQUASHFS MKJFFS2 FILECAP"
endif

#==============LIB COMPILE OPTIONS================================================================
AT := @

ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv320-linux)
FLOAT_OPTIONS := -mfloat-abi=hard -mfpu=vfpv3-d16
else ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv310-linux)
FLOAT_OPTIONS := -mfloat-abi=softfp -mfpu=vfpv3-d16
else ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv300-linux)
FLOAT_OPTIONS := -mfloat-abi=softfp -mfpu=vfpv3-d16
else
FLOAT_OPTIONS :=
endif

CFG_HI_CFLAGS :=

ifeq ($(CFG_HI_NVR_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_NVR_SUPPORT
endif

ifeq ($(CFG_HI_SMMU_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_SMMU_SUPPORT
endif

ifeq ($(CFG_HI_HDR_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_HDR_SUPPORT

ifeq ($(CFG_HI_HDR_DOLBYVISION_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_HDR_DOLBYVISION_SUPPORT
endif
endif

ifneq ($(ANDROID_BUILD),y)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv100 hi3796mv100),)
CFG_HI_CFLAGS += -mcpu=cortex-a7
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3798mv200h hi3798mv300 hi3798mv300h hi3798mv310 hi3796mv200 hi3716mv450 hi3716dv110h),)
CFG_HI_CFLAGS += -mcpu=cortex-a53
else
CFG_HI_CFLAGS += -mcpu=cortex-a9
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420),)
    ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
        CFG_HI_CFLAGS += -DNOCS3_0_SUPPORT
    endif
endif

ifndef CFG_HI_ADVCA_FUNCTION
    RULEFILE=$(ROOTFS_SRC_DIR)/scripts/attr_rule/rulelist_noca.txt
else
    ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
        CFG_HI_CFLAGS += -fstack-protector-all
    endif

    CFG_HI_CFLAGS += --param ssp-buffer-size=4
    CFG_HI_CFLAGS += -Wl,-z,relro -g0 -s -Wformat
    CFG_HI_CFLAGS += -Wformat-security -D_FORTIFY_SOURCE=2
    CFG_HI_CFLAGS += -fno-delete-null-pointer-checks -Wformat-y2k

    ifeq ($(CFG_HI_ADVCA_SANDBOX_SUPPORT),y)
        SANDBOX_TYPE := $(shell echo $(CFG_HI_ADVCA_SANDBOX_TYPE) | tr "[A-Z]" "[a-z]")
    endif

    ifeq ($(CFG_HI_LOADER_APPLOADER),y)
        RULEFILE=$(ROOTFS_SRC_DIR)/scripts/attr_rule/rulelist_ca_apploader_$(SANDBOX_TYPE).txt
    else
        RULEFILE=$(ROOTFS_SRC_DIR)/scripts/attr_rule/rulelist_ca_system_$(SANDBOX_TYPE).txt
    endif
endif

RULEDBG=0

CFG_HI_CFLAGS += -Werror -Wall -D_GNU_SOURCE -D_XOPEN_SOURCE=600

ifeq ($(CFG_HI_OPTM_SIZE_SUPPORT),y)
CFG_HI_CFLAGS += -Os -ffunction-sections
else
CFG_HI_CFLAGS += -O2
endif

CFG_HI_CFLAGS += -fPIC

ifeq ($(CFG_HI_MSP_BUILDIN),y)
HI_DRV_BUILDTYPE := y
else
HI_DRV_BUILDTYPE := m
endif
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv200h)
CFG_HI_CHIP_TYPE := hi3798mv310
endif
ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv300h)
CFG_HI_CHIP_TYPE := hi3798mv310
endif
ifeq ($(CFG_HI_CHIP_TYPE), hi3716dv110h)
CFG_HI_CHIP_TYPE := hi3798mv310
endif
CFG_HI_CFLAGS += -DCHIP_TYPE_$(CFG_HI_CHIP_TYPE)

CFG_HI_CFLAGS += -DSDK_VERSION=$(CFG_HI_SDK_VERSION) -DFBL_VERSION=$(FBL_VERSION) -DSOS_VERSION=$(SOS_VERSION) -DSOS_MSID=$(SOS_MSID)

## common and other modules will use hi_debug.h, which refers to the HI_LOG_LEVEL
ifeq ($(CFG_HI_LOG_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_LOG_SUPPORT=1

CFG_HI_CFLAGS += -DHI_LOG_LEVEL=$(CFG_HI_LOG_LEVEL)

ifeq ($(CFG_HI_LOG_NETWORK_SUPPORT),y)
CFG_HI_CFLAGS += -DLOG_NETWORK_SUPPORT
endif

ifeq ($(CFG_HI_LOG_UDISK_SUPPORT),y)
CFG_HI_CFLAGS += -DLOG_UDISK_SUPPORT
endif
endif

ifeq ($(CFG_HI_PROC_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_PROC_SUPPORT
endif

ifeq ($(CFG_HI_HDMI_SUPPORT_1_4),y)
CFG_HI_CFLAGS += -DHI_HDMI_SUPPORT_1_4
else ifeq ($(CFG_HI_HDMI_SUPPORT_2_0),y)
CFG_HI_CFLAGS += -DHI_HDMI_SUPPORT_2_0
endif

ifeq ($(CFG_HI_PVR_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_PVR_SUPPORT
endif

ifeq ($(CFG_HI_VI_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_VI_SUPPORT
endif

ifeq ($(CFG_HI_VENC_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_VENC_SUPPORT
endif

ifeq ($(CFG_HI_PQ_V3_0),y)
CFG_HI_CFLAGS += -DHI_PQ_V3_0
endif

ifeq ($(CFG_HI_PQ_V4_0),y)
CFG_HI_CFLAGS += -DHI_PQ_V4_0
endif

ifeq ($(CFG_HI_PQ_V5_0),y)
CFG_HI_CFLAGS += -DHI_PQ_V5_0
endif


ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
    CFG_HI_CFLAGS += -DHI_ADVCA_SUPPORT
    CFG_HI_CFLAGS += -DHI_ADVCA_TYPE_$(CFG_HI_ADVCA_TYPE)

    ifdef CFG_HI_ADVCA_FUNCTION
            CFG_HI_CFLAGS += -DHI_ADVCA_FUNCTION_$(CFG_HI_ADVCA_FUNCTION)
        ifeq ($(CFG_HI_ADVCA_VMX3RD_SUPPORT),y)
            CFG_HI_CFLAGS += -DHI_ADVCA_VMX3RD_SUPPORT
        endif
    endif

    ifeq ($(CFG_HI_ADVCA_VERIFY_ENABLE),y)
        CFG_HI_CFLAGS += -DHI_ADVCA_VERIFY_ENABLE
    endif

    ifeq ($(CFG_HI_ADVCA_USE_EXT1_RSA_KEY),y)
        CFG_HI_CFLAGS += -DHI_ADVCA_USE_EXT1_RSA_KEY
    endif
endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
CFG_HI_CFLAGS += -DHI_TEE_SUPPORT
endif

#=============KERNEL MODULE COMPILE OPTIONS=====================================================
CFG_HI_KMOD_CFLAGS := -Werror

CFG_HI_KMOD_CFLAGS += -DCHIP_TYPE_$(CFG_HI_CHIP_TYPE)

CFG_HI_KMOD_CFLAGS += -DSDK_VERSION=$(CFG_HI_SDK_VERSION)

ifdef CFG_HI_ADVCA_FUNCTION
    CFG_HI_KMOD_CFLAGS += -Wformat --param ssp-buffer-size=4
    CFG_HI_KMOD_CFLAGS += -Wformat-security -g0 -s
    CFG_HI_KMOD_CFLAGS += -Wl,-z,relro -Wformat-y2k
    CFG_HI_KMOD_CFLAGS += -D_FORTIFY_SOURCE=2
    CFG_HI_KMOD_CFLAGS += -fno-delete-null-pointer-checks
endif

ifeq ($(CFG_HI_NVR_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_NVR_SUPPORT
endif

ifeq ($(findstring fpga, $(CFG_HI_BOOT_REG_NAME)), fpga)
CFG_HI_KMOD_CFLAGS += -DHI_FPGA_SUPPORT
endif

ifeq ($(CFG_HI_SMMU_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_SMMU_SUPPORT
endif

ifeq ($(CFG_HI_HDR_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_HDR_SUPPORT

ifeq ($(CFG_HI_HDR_DOLBYVISION_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_HDR_DOLBYVISION_SUPPORT
endif
endif

ifeq ($(CFG_HI_KEYLED_CT1642_KERNEL_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_KEYLED_CT1642_KERNEL_SUPPORT
endif

ifeq ($(CFG_HI_MCE_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_MCE_SUPPORT
endif

ifeq ($(CFG_HI_GPIOI2C_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_GPIOI2C_SUPPORT
endif

## common and other modules will use hi_debug.h, which refers to the HI_LOG_LEVEL
ifeq ($(CFG_HI_LOG_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_LOG_SUPPORT=1

CFG_HI_KMOD_CFLAGS += -DHI_LOG_LEVEL=$(CFG_HI_LOG_LEVEL)
endif

ifeq ($(CFG_HI_PROC_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_PROC_SUPPORT
endif

ifeq ($(CFG_HI_DEMUX_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_DEMUX_SUPPORT
endif

ifeq ($(CFG_HI_HDMI_SUPPORT_1_4),y)
CFG_HI_KMOD_CFLAGS += -DHI_HDMI_SUPPORT_1_4
else ifeq ($(CFG_HI_HDMI_SUPPORT_2_0),y)
CFG_HI_KMOD_CFLAGS += -DHI_HDMI_SUPPORT_2_0
endif

ifeq ($(CFG_HI_GFX2D_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_GFX2D_SUPPORT
endif

ifeq ($(CFG_HI_LOADER_APPLOADER),y)
CFG_HI_KMOD_CFLAGS += -DHI_LOADER_APPLOADER
endif

ifeq ($(CFG_HI_KEYLED_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_KEYLED_SUPPORT
endif

ifeq ($(CFG_HI_HDMI_SUPPORT_HDCP),y)
CFG_HI_KMOD_CFLAGS += -DHI_HDCP_SUPPORT
endif

ifeq ($(CFG_HI_SCI_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_SCI_SUPPORT
endif

ifeq ($(CFG_HI_PVR_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_PVR_SUPPORT
endif

ifeq ($(CFG_HI_VI_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_VI_SUPPORT
endif

ifeq ($(CFG_HI_VENC_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_VENC_SUPPORT
endif

ifeq ($(CFG_HI_AENC_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_AENC_SUPPORT
endif

ifeq ($(CFG_HI_ADAC_SLIC_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_ADAC_SLIC_SUPPORT
endif

ifeq ($(CFG_HI_PQ_V3_0),y)
CFG_HI_KMOD_CFLAGS += -DHI_PQ_V3_0
endif

ifeq ($(CFG_HI_PQ_V4_0),y)
CFG_HI_KMOD_CFLAGS += -DHI_PQ_V4_0
endif

ifeq ($(CFG_HI_PQ_V5_0),y)
CFG_HI_KMOD_CFLAGS += -DHI_PQ_V5_0
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420),)
    ifeq ($(CFG_HI_ADVCA_TYPE),NAGRA)
        CFG_HI_KMOD_CFLAGS += -DNOCS3_0_SUPPORT
    endif
endif

ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
    CFG_HI_KMOD_CFLAGS += -DHI_ADVCA_SUPPORT
    CFG_HI_KMOD_CFLAGS += -DHI_ADVCA_TYPE_$(CFG_HI_ADVCA_TYPE)

    ifdef CFG_HI_ADVCA_FUNCTION
            CFG_HI_KMOD_CFLAGS += -DHI_ADVCA_FUNCTION_$(CFG_HI_ADVCA_FUNCTION)
        ifeq ($(CFG_HI_ADVCA_VMX3RD_SUPPORT),y)
            CFG_HI_KMOD_CFLAGS += -DHI_ADVCA_VMX3RD_SUPPORT
        endif
    endif

endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
CFG_HI_KMOD_CFLAGS += -DHI_TEE_SUPPORT
endif

#=============BOARD CONFIGURATION OPTIONS=====================================================
CFG_HI_BOARD_CONFIGS :=

ifneq ($(CFG_HI_DAC_CVBS),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_CVBS=$(CFG_HI_DAC_CVBS)
endif

ifneq ($(CFG_HI_DAC_YPBPR_Y),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_YPBPR_Y=$(CFG_HI_DAC_YPBPR_Y)
endif

ifneq ($(CFG_HI_DAC_YPBPR_PB),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_YPBPR_PB=$(CFG_HI_DAC_YPBPR_PB)
endif

ifneq ($(CFG_HI_DAC_YPBPR_PR),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_YPBPR_PR=$(CFG_HI_DAC_YPBPR_PR)
endif

ifneq ($(CFG_HI_DAC_VGA_R),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_VGA_R=$(CFG_HI_DAC_VGA_R)
endif

ifneq ($(CFG_HI_DAC_VGA_G),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_VGA_G=$(CFG_HI_DAC_VGA_G)
endif

ifneq ($(CFG_HI_DAC_VGA_B),)
CFG_HI_BOARD_CONFIGS += -DHI_DAC_VGA_B=$(CFG_HI_DAC_VGA_B)
endif

ifneq ($(CFG_HI_SND_MUTECTL_GPIO),)
CFG_HI_BOARD_CONFIGS += -DHI_SND_MUTECTL_GPIO=$(CFG_HI_DAC_SVIDEO_C)
else
CFG_HI_BOARD_CONFIGS += -DHI_SND_MUTECTL_GPIO=0x39
endif

#=============SCI CONFIGURATION OPTIONS===================
ifeq ($(CFG_HI_SCI_CLK_MODE_CMOS),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_CLK_MODE=0
endif
ifeq ($(CFG_HI_SCI_CLK_MODE_OD),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_CLK_MODE=1
endif

ifeq ($(CFG_HI_SCI_VCCEN_MODE_CMOS),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_VCCEN_MODE=0
endif
ifeq ($(CFG_HI_SCI_VCCEN_MODE_OD),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_VCCEN_MODE=1
endif

ifeq ($(CFG_HI_SCI_RESET_MODE_CMOS),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_RESET_MODE=0
endif
ifeq ($(CFG_HI_SCI_RESET_MODE_OD),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_RESET_MODE=1
endif

ifeq ($(CFG_HI_SCI_VCCEN_LOW),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_VCCEN_LEVEL=0
endif
ifeq ($(CFG_HI_SCI_VCCEN_HIGH),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_VCCEN_LEVEL=1
endif

ifeq ($(CFG_HI_SCI_DETECT_LOW),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_DETECT_LEVEL=0
endif
ifeq ($(CFG_HI_SCI_DETECT_HIGH),y)
CFG_HI_BOARD_CONFIGS += -DHI_SCI_DETECT_LEVEL=1
endif

ifeq ($(CFG_HI_CPU_ARCH),arm64)
CFG_HI_CFLAGS += -DCONFIG_ARCH_LP64_MODE
CFG_HI_KMOD_CFLAGS += -DCONFIG_ARCH_LP64_MODE
CFG_HI_BOARD_CONFIGS += -DCONFIG_ARCH_LP64_MODE
endif

