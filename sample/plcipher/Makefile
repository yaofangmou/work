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
CFLAGS := -I$(MSP_API_INCLUDE)

SAMPLE_IMAGES := sample_plcipher_hostkey_enc \
                 sample_plcipher_hostkey_dec

ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
CFLAGS += -DHI_ADVCA_TYPE_NAGRA
SAMPLE_IMAGES += sample_plcipher_akl_enc \
                 sample_plcipher_akl_dec
endif

COMMON_OBJS := $(COMMON_SRCS:%.c=%.o)

LOCAL_OBJS += parse_config_file.o

DEPEND_LIBS := $(HI_LIBS)

include $(SAMPLE_DIR)/hi_sample_rules.mak
