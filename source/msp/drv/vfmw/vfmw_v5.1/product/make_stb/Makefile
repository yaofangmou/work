#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
    ifneq ($(srctree),)
    KERNEL_DIR := $(srctree)

    SDK_DIR := $(shell cd $(KERNEL_DIR)/../../.. && /bin/pwd)
    else
    SDK_DIR := $(shell cd $(CURDIR)/../../../../../../.. && /bin/pwd)
    endif

    include $(SDK_DIR)/base.mak
endif

#===============================================================================
# export variables  arm64 or arm
#===============================================================================
########tmp value###############################
ifeq ($(CFG_HI_CPU_ARCH),arm)
EXTRA_CFLAGS += -DHI_VFMW_32BIT
endif
# local variables
#===============================================================================
VFMW_DIR := $(MSP_DIR)/drv/vfmw/vfmw_v5.1

EXTRA_CFLAGS += $(filter-out -Wformat-security,$(CFG_HI_KMOD_CFLAGS))

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE)    \
                -I$(COMMON_DRV_INCLUDE)

ifeq ($(CFG_HI_TEE_SUPPORT),y)
EXTRA_CFLAGS += -I$(TEE_DRV_INCLUDE)
endif

ifeq ($(CFG_HI_HDR_SUPPORT),y)
EXTRA_CFLAGS += -DVFMW_HDR_SUPPORT
endif

ifneq "$(origin CFG_HI_VIDEO_MAX_REF_FRAME_NUM)" "undefined"
EXTRA_CFLAGS += -DHI_VIDEO_MAX_REF_FRAME_NUM=$(CFG_HI_VIDEO_MAX_REF_FRAME_NUM)
endif

ifneq "$(origin CFG_HI_VIDEO_MAX_DISP_FRAME_NUM)" "undefined"
EXTRA_CFLAGS += -DHI_VIDEO_MAX_DISP_FRAME_NUM=$(CFG_HI_VIDEO_MAX_DISP_FRAME_NUM)
endif

ifneq "$(origin CFG_HI_VIDEO_EXTRA_PVR_FRAME_NUM)" "undefined"
EXTRA_CFLAGS += -DHI_VIDEO_EXTRA_PVR_FRAME_NUM=$(CFG_HI_VIDEO_EXTRA_PVR_FRAME_NUM)
endif

ifneq "$(origin CFG_HI_VDEC_MAX_INSTANCE)" "undefined"
EXTRA_CFLAGS += -DHI_VDEC_MAX_INSTANCE=$(CFG_HI_VDEC_MAX_INSTANCE)
endif
################################################################################################
#    PRODUCT
################################################################################################
ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv310)
include $(VFMW_DIR)/product/Hi3798MV310/LNX_CFG/vfmw_make.cfg
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3716mv430)
ifeq ($(CFG_HI_VDEC_DECODE_CAPABILITY),HD_FULL)
include $(VFMW_DIR)/product/Hi3716MV430_HD_FULL/LNX_CFG/vfmw_make.cfg
else ifeq ($(CFG_HI_VDEC_DECODE_CAPABILITY),HD_BASIC)
include $(VFMW_DIR)/product/Hi3716MV430_HD_BASIC/LNX_CFG/vfmw_make.cfg
else ifeq ($(CFG_HI_VDEC_DECODE_CAPABILITY),HD_SIMPLE)
include $(VFMW_DIR)/product/Hi3716MV430_HD_SIMPLE/LNX_CFG/vfmw_make.cfg
else
include $(VFMW_DIR)/product/Hi3716MV430_HD_FULL/LNX_CFG/vfmw_make.cfg
endif
endif

EXTRA_CFLAGS += $(VFMW_CFLAGS)
EXTRA_CFLAGS += -fno-pic

ifeq ($(CFG_HI_SMMU_SUPPORT), y)
EXTRA_CFLAGS += -DVFMW_MMU_SUPPORT
endif

EXTRA_CFLAGS += -DVFMW_STB_PRODUCT

ifeq ($(CFG_ADVCA_VERIMATRIX_ULTRA), y)
EXTRA_CFLAGS += -DHI_ULTRA_V_MX
endif

MOD_NAME := hi_vfmw

obj-$(HI_DRV_BUILDTYPE) += $(MOD_NAME).o

$(MOD_NAME)-y := $(VFMW_OBJS)

asflags-y := -I$(COMMON_DRV_INCLUDE)
ifeq ($(findstring -DHI_ADVCA_FUNCTION_RELEASE, $(CFG_HI_CFLAGS)), -DHI_ADVCA_FUNCTION_RELEASE)
asflags-y += -DCONFIG_REMOVE_STRING
endif

BUILD_DIR := $(HI_OUT_DIR)/$(OBJ_NAME)/$(subst $(SDK_DIR)/,,$(CURDIR))

BUILD_DIR_MAKEFILE := $(BUILD_DIR)/Makefile

#===============================================================================
#   rules
#===============================================================================
.PHONY: all clean

all: $(BUILD_DIR_MAKEFILE)
	$(AT)make -C $(LINUX_DIR) ARCH=$(CFG_HI_CPU_ARCH) CROSS_COMPILE=$(HI_KERNEL_TOOLCHAINS_NAME)- M=$(BUILD_DIR) src=$(CURDIR) modules
	$(AT)test -d $(HI_MODULE_DIR) || mkdir -p $(HI_MODULE_DIR)
	$(AT)cp -f $(BUILD_DIR)/$(MOD_NAME).ko $(HI_MODULE_DIR)/

clean:
	$(AT)make -C $(LINUX_DIR) ARCH=$(CFG_HI_CPU_ARCH) CROSS_COMPILE=$(HI_KERNEL_TOOLCHAINS_NAME)- M=$(BUILD_DIR)/../.. src=$(CURDIR) clean
	$(AT)rm -rf $(HI_MODULE_DIR)/$(MOD_NAME).ko

$(BUILD_DIR_MAKEFILE): $(BUILD_DIR)
	$(AT)touch $@

$(BUILD_DIR):
	$(AT)mkdir -p $@

