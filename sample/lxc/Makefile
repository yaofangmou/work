#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean

all:
	$(AT)make -C launch
	$(AT)make -C ipc
	$(AT)make -C net
	$(AT)make -C refapp
	$(AT)make -C other

clean:
	$(AT)make -C launch clean
	$(AT)make -C ipc clean
	$(AT)make -C net clean
	$(AT)make -C refapp clean
	$(AT)make -C other clean


