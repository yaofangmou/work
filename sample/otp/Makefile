#===============================================================================
# export variable
#===============================================================================
#ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
#endif

include $(SAMPLE_DIR)/base.mak
#===============================================================================
.PHONY: all clean
#===============================================================================
all:
ifeq ($(CFG_HI_OTP_KLAD_V100),y)
	$(AT)make -C v100
else ifeq ($(CFG_HI_OTP_KLAD_V200),y)
	$(AT)make -C v200
else
    $(error otp_klad version is error)
endif

clean:
	$(AT)make -C v200 clean
	$(AT)make -C v100 clean