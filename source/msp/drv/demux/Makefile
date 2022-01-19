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
DEMUX_DRV_VER = demux_v2

EXTRA_CFLAGS += $(CFG_HI_KMOD_CFLAGS)

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE) \
                -I$(COMMON_API_INCLUDE) \
                -I$(COMMON_DRV_INCLUDE) \
                -I$(MSP_UNF_INCLUDE) \
                -I$(MSP_API_INCLUDE) \
                -I$(MSP_DRV_INCLUDE) \
                -I$(MSP_DIR)/api/demux/$(DEMUX_DRV_VER) \
                -I$(MSP_DIR)/drv/demux/$(DEMUX_DRV_VER) \
                -I$(MSP_DIR)/drv/demux/$(DEMUX_DRV_VER)/descrambler

ifdef CFG_HI_TEE_SUPPORT
EXTRA_CFLAGS += -I$(TEE_DRV_INCLUDE) -DDMX_TEE_SUPPORT
endif

EXTRA_CFLAGS += -DCFG_HI_DEMUX_POOLBUF_SIZE=$(CFG_HI_DEMUX_POOLBUF_SIZE)

ifeq ($(CFG_HI_OTP_KLAD_V100),y)
    EXTRA_CFLAGS += -DCA_FRAMEWORK_V100_SUPPORT
else ifeq ($(CFG_HI_OTP_KLAD_V200),y)
    EXTRA_CFLAGS += -DCA_FRAMEWORK_V200_SUPPORT
endif

ifeq ($(HI_SMMZ2_SUPPORT), y)
EXTRA_CFLAGS += -DDMX_SMMZ2_SUPPORT
endif

ifdef CFG_HI_SMMU_SUPPORT
EXTRA_CFLAGS += -DDMX_MMU_SUPPORT
endif

ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
EXTRA_CFLAGS += -DHI_ADVCA_TYPE_NAGRA
endif

ifdef CFG_HI_DEMUX_INVALID_PES_DROP_SUPPORT
EXTRA_CFLAGS += -DDMX_INVALID_PES_DROP_SUPPORT
endif

ifdef CFG_HI_DMX_DUP_PID_CHANNEL_SUPPORT
EXTRA_CFLAGS += -DDMX_DUP_PID_CHANNEL_SUPPORT
endif

# supprot multithread operate one ts buffer
ifdef CFG_HI_DMX_TSBUF_MULTI_THREAD_SUPPORT
EXTRA_CFLAGS += -DHI_DMX_TSBUF_MULTI_THREAD_SUPPORT
endif

MOD_NAME := hi_demux

obj-$(HI_DRV_BUILDTYPE) += $(MOD_NAME).o

$(MOD_NAME)-y   :=  $(DEMUX_DRV_VER)/drv_demux_intf.o        \
                    $(DEMUX_DRV_VER)/drv_demux.o             \
                    $(DEMUX_DRV_VER)/drv_demux_func.o        \
                    $(DEMUX_DRV_VER)/hal_demux.o

ifeq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)

ifdef CFG_HI_PROC_SUPPORT
    EXTRA_CFLAGS += -DHI_DEMUX_PROC_SUPPORT
endif

EXTRA_CFLAGS += -DHI_DMX_TSO_SUPPORT
EXTRA_CFLAGS += -DHI_DMX_REC_SUPPORT
EXTRA_CFLAGS += -DHI_DMX_REC_INDEX_SUPPORT
EXTRA_CFLAGS += -DHI_DMX_REC_INDEX_HEVC_SUPPORT
$(MOD_NAME)-y   +=  $(DEMUX_DRV_VER)/drv_demux_scd.o   \
                    $(DEMUX_DRV_VER)/drv_demux_index.o  \
                    $(DEMUX_DRV_VER)/drv_demux_bitstream.o

EXTRA_CFLAGS += -DHI_DMX_DESCRAMBLER_SUPPORT
$(MOD_NAME)-y   +=  $(DEMUX_DRV_VER)/descrambler/drv_descrambler.o       \
                    $(DEMUX_DRV_VER)/descrambler/drv_descrambler_func.o  \
                    $(DEMUX_DRV_VER)/descrambler/hal_descrambler.o

else #$(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430)#

#############################16mv430 demux#####################################
ifdef CFG_HI_PROC_SUPPORT
    ifdef CFG_HI_DMX_PROC_SUPPORT
    EXTRA_CFLAGS += -DHI_DEMUX_PROC_SUPPORT
    endif
endif

ifdef CFG_HI_DMX_TSO_SUPPORT
EXTRA_CFLAGS += -DHI_DMX_TSO_SUPPORT
endif

ifeq ($(CFG_HI_DMX_REC_SUPPORT),y)
EXTRA_CFLAGS += -DHI_DMX_REC_SUPPORT
    ifeq ($(CFG_HI_DMX_REC_INDEX_SUPPORT),y)
    EXTRA_CFLAGS += -DHI_DMX_REC_INDEX_SUPPORT
    $(MOD_NAME)-y   +=  $(DEMUX_DRV_VER)/drv_demux_scd.o   \
                        $(DEMUX_DRV_VER)/drv_demux_index.o  \
                        $(DEMUX_DRV_VER)/drv_demux_bitstream.o
        ifeq ($(CFG_HI_DMX_REC_INDEX_HEVC_SUPPORT),y)
        EXTRA_CFLAGS += -DHI_DMX_REC_INDEX_HEVC_SUPPORT
        endif
    endif
endif

ifeq ($(CFG_HI_DMX_DESCRAMBLER_SUPPORT),y)
$(MOD_NAME)-y   +=  $(DEMUX_DRV_VER)/descrambler/drv_descrambler.o       \
                    $(DEMUX_DRV_VER)/descrambler/drv_descrambler_func.o  \
                    $(DEMUX_DRV_VER)/descrambler/hal_descrambler.o
EXTRA_CFLAGS += -DHI_DMX_DESCRAMBLER_SUPPORT
endif
############################16mv430 demux end###################################
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
