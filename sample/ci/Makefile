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
ifeq ($(CFG_HI_CI_DEV_CIMAX),y)
CFLAGS := -DHI_CI_DEV_CIMAX
endif

ifeq ($(CFG_HI_CI_DEV_CIMAXPLUS),y)
CFLAGS := -DHI_CI_DEV_CIMAXPLUS
endif

ifeq ($(CFG_HI_CI_DEV_HICI),y)
CFLAGS := -DHI_CI_DEV_HICI
endif

SAMPLE_IMAGES := sample_ci \
    sample_ci_dvbplay \
    sample_ci_tsplay

LOCAL_OBJS := sample_ci_stack.o

COMMON_OBJS := $(COMMON_SRCS:%.c=%.o)

DEPEND_LIBS := $(HI_LIBS)

include $(SAMPLE_DIR)/hi_sample_rules.mak
