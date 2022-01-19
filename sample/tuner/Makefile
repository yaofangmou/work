#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

include $(SAMPLE_DIR)/base.mak

#===============================================================================
# local variable
#===============================================================================
ifeq ($(CFG_HI_DISEQC_SUPPORT),y)
CFLAGS := -DDISEQC_SUPPORT
endif
ifeq ($(CFG_HI_DVBS_SUPPORT),y)
CFLAGS += -DDVBS_SUPPORT
endif

SAMPLE_IMAGES := sample_tuner_dvbc \
    sample_tuner

ifeq ($(CFG_HI_DISEQC_SUPPORT),y)
SAMPLE_IMAGES += sample_unicable
endif

COMMON_OBJS := $(COMMON_SRCS:%.c=%.o)

DEPEND_LIBS := $(HI_LIBS)

include $(SAMPLE_DIR)/hi_sample_rules.mak
