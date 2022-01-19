#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

include $(SAMPLE_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
CFLAGS := -I$(CURDIR)/../include

SAMPLE_IMAGES := lxc_capset
SAMPLE_IMAGES += lxc_mount

DEPEND_LIBS := -lcap -L $(HI_ROOTFS_DIR)/usr/lib/ -L $(HI_ROOTFS_DIR)/usr/lib64/

include $(SAMPLE_DIR)/hi_sample_rules.mak


