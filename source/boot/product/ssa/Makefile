################################################################################
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR ?= $(shell cd $(shell pwd)/../../../.. && /bin/pwd)

include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================
ifeq ($(CFG_HI_MINIBOOT_SUPPORT),y)
BOOT_DIR := $(SDK_DIR)/source/boot/miniboot
else
BOOT_DIR := $(SDK_DIR)/source/boot/fastboot
endif

ifneq ($(O),)
PRODUCT_DIR := $(O)/product
else
PRODUCT_DIR := $(BOOT_DIR)/../product
endif

SSA_DIR := $(PRODUCT_DIR)/ssa

# The case for advca type
ifeq ($(CFG_HI_ADVCA_TYPE), CONAX)
CA_DIR := conax
else ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX)
CA_DIR := vmx_advance
else ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX_ULTRA)
CA_DIR := vmx_ultra
else ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
CA_DIR := nagra
else ifeq ($(CFG_HI_ADVCA_TYPE), DCAS)
CA_DIR := dcas
else ifeq ($(CFG_HI_ADVCA_TYPE), IRDETO)
CA_DIR := irdeto
else ifeq ($(CFG_HI_ADVCA_TYPE), L2)
CA_DIR := general/L2
else
# The case for common CA or other special usage
CA_DIR := misc
endif

# if AVB is enabled, set CA_DIR avb
ifeq ($(CFG_ADVCA_AVB), y)
$(info CFG_ADVCA_AVB = $(CFG_ADVCA_AVB))
CA_DIR := avb
endif

CA_DIR += ssa_adapter

LIB := libssa.a
#===============================================================================
# rules
#===============================================================================
.PHONY: all clean install uninstall $(LIB) $(CA_DIR)
all: $(LIB)

clean:
	$(AT)make -C $(SSA_DIR)/$(CA_DIR) clean

$(LIB): $(CA_DIR)
	$(AT)echo OPEN $(SSA_DIR)/libssa.a > ar.mac
	$(AT)echo ADDLIB $(SSA_DIR)/libssa_adapter.a >> ar.mac
	$(AT)echo SAVE >> ar.mac
	$(AT)echo END >> ar.mac
	$(AT)ar -M < ar.mac

$(CA_DIR):
	$(AT)make -C $(SSA_DIR)/$@ all



install: all

uninstall:
