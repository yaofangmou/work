#=======================================
#	export variable
#=======================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
    ifneq ($(srctree),)
    KERNEL_DIR := $(srctree)

    SDK_DIR := $(shell cd $(KERNEL_DIR)/../../.. && /bin/pwd)
    else
    SDK_DIR := $(shell cd $(CURDIR)/../../../.. && /bin/pwd)
    endif

    include $(SDK_DIR)/base.mak
endif

#=======================================
#	local variable
#=======================================

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
DRV_AIAO := aiao_v1_2/
else
DRV_AIAO := aiao_v1_1/
endif

obj-y += $(DRV_AIAO)

#=================================================================
#	  rules
#=================================================================
.PHONY: all clean

all:
	$(AT)make -C $(DRV_AIAO)

clean:
	$(AT)make -C $(DRV_AIAO) clean
