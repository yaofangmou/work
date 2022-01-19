#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
    ifneq ($(srctree),)
    KERNEL_DIR := $(srctree)

    SDK_DIR := $(shell cd $(KERNEL_DIR)/../../.. && /bin/pwd)
    else
    SDK_DIR := $(shell cd $(CURDIR)/../../../.. && /bin/pwd)
    endif

    include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================
EXTRA_CFLAGS += $(CFG_HI_KMOD_CFLAGS)

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE)                 \
                -I$(COMMON_API_INCLUDE)                 \
                -I$(COMMON_DRV_INCLUDE)                 \
                -I$(MSP_UNF_INCLUDE)                    \
                -I$(MSP_API_INCLUDE)                    \
                -I$(MSP_DRV_INCLUDE)                    \
                -I$(MSP_DIR)/api/sci                    \
                -I$(MSP_DIR)/drv/sci
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420),)
EXTRA_CFLAGS += -I$(COMMON_DRV_INCLUDE)/hi3716mv410
endif

ifeq ($(CFG_HI_SCI_SUPPORT_PPS),y)
EXTRA_CFLAGS += -DHI_SCI_SUPPORT_PPS
endif

ifeq ($(CFG_HI_TEE_SCI_SUPPORT),y)
EXTRA_CFLAGS += -I$(TEE_DRV_INCLUDE)
EXTRA_CFLAGS += -DHI_TEE_SCI_SUPPORT
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
    ifeq ($(CFG_HI_SCI_VCC_AUTO_MATCH_SUPPORT),y)
        EXTRA_CFLAGS += -DHI_SCI_VCC_AUTO_MATCH_SUPPORT
       ifeq ($(CFG_HI_SCI_VCC_SELECT_3V),y)
          EXTRA_CFLAGS += -DHI_SCI_VCC_SELECT_3V
       else ifeq ($(CFG_HI_SCI_VCC_SELECT_5V),y)
          EXTRA_CFLAGS += -DHI_SCI_VCC_SELECT_5V
       else ifeq ($(CFG_HI_SCI_VCC_SELECT_AUTO),y)
          EXTRA_CFLAGS += -DHI_SCI_VCC_SELECT_AUTO
       endif
     endif
endif

MOD_NAME := hi_sci

obj-$(HI_DRV_BUILDTYPE) += $(MOD_NAME).o

$(MOD_NAME)-y   :=  drv_sci_intf.o  \
                    drv_sci.o       \
                    hal_sci.o

ifeq ($(CFG_HI_TEE_SCI_SUPPORT),y)
$(MOD_NAME)-y += drv_tzsci.o
$(MOD_NAME)-y += drv_tee_sci_irq.o
$(MOD_NAME)-y += drv_tee_sci_client.o
$(MOD_NAME)-y += drv_tee_sci_agent.o
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
	$(AT)make -C $(LINUX_DIR) ARCH=$(CFG_HI_CPU_ARCH) CROSS_COMPILE=$(HI_KERNEL_TOOLCHAINS_NAME)- M=$(BUILD_DIR) src=$(CURDIR) clean
	$(AT)rm -rf $(HI_MODULE_DIR)/$(MOD_NAME).ko

$(BUILD_DIR_MAKEFILE): $(BUILD_DIR)
	$(AT)touch $@

$(BUILD_DIR):
	$(AT)mkdir -p $@
