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
CFLAGS :=  -I$(MSP_DIR)/api/jpge/include
CFLAGS +=  -I$(MSP_DIR)/api/tde/include
CFLAGS +=  -I$(MSP_DIR)/api/jpeg/include
CFLAGS +=  -I$(COMPONENT_DIR)/jpeg/include
CFLAGS +=  -I$(SAMPLE_DIR)/iframe_dec

SAMPLE_IMAGES := sample_iframe_dec

COMMON_OBJS := $(COMMON_SRCS:%.c=%.o)

ifneq ($(findstring $(CFG_HI_CHIP_TYPE),hi3716mv430),)
ifneq ($(CFG_HI_JPEG_MINI_SUPPORT), y)
COMMON_OBJS += ../iframe_dec/jpeg_soft_enc.o
CFLAGS += -DJPEG_SOFT_ENCODE_ENABLE
endif
endif

DEPEND_LIBS := $(HI_LIBS)

include $(SAMPLE_DIR)/hi_sample_rules.mak
