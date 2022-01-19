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
SAMPLE_IMAGES := debug_assistant

COMMON_OBJS := 
LOCAL_OBJS := debug_assistant_lang.o debug_assistant_media.o debug_assistant_hdmi.o debug_assistant_usb.o
DEPEND_LIBS := -lhi_common -lhi_msp -ljpeg

#include $(SAMPLE_DIR)/hi_sample_rules.mak

SRC_DIR := $(CURDIR)

OBJ_DIR := $(HI_OUT_DIR)/obj/$(subst $(SDK_DIR)/,,$(SRC_DIR))
OBJ64_DIR := $(HI_OUT_DIR)/obj64/$(subst $(SDK_DIR)/,,$(SRC_DIR))


ifeq ($(HI_USER_SPACE_LIB),y)
HI_SAMPLE_IMAGES := $(addprefix $(OBJ_DIR)/,$(SAMPLE_IMAGES))
HI_COMMON_OBJS := $(addprefix $(COMMON_OBJ_DIR)/,$(COMMON_OBJS))
endif

ifeq ($(HI_USER_SPACE_LIB64),y)
HI_SAMPLE_IMAGES64 := $(addprefix $(OBJ64_DIR)/,$(SAMPLE_IMAGES))
HI_COMMON_OBJS64 := $(addprefix $(COMMON_OBJ64_DIR)/,$(COMMON_OBJS))
endif

CFLAGS  +=  $(CFG_HI_SAMPLE_CFLAGS)

CFLAGS  +=  -I$(HI_INCLUDE_DIR) \
            -I$(SAMPLE_DIR)/common

HI_LIB_PATHS := -L$(HI_SHARED_LIB_DIR) -L$(HI_EXTERN_LIB_DIR) -L$(HI_STATIC_LIB_DIR) $(LIB_PATHS)
HI_LIB64_PATHS := -L$(HI_SHARED_LIB64_DIR) -L$(HI_EXTERN_LIB64_DIR) -L$(HI_STATIC_LIB64_DIR) $(LIB64_PATHS)

HI_DEPEND_LIBS := -Wl,--start-group $(SYS_LIBS) $(DEPEND_LIBS) -Wl,--end-group

TARGETS :=

ifeq ($(HI_USER_SPACE_LIB),y)
TARGETS += $(if $(HI_SAMPLE_IMAGES),$(HI_SAMPLE_IMAGES),$(HI_COMMON_OBJS))
endif

ifeq ($(HI_USER_SPACE_LIB64),y)
TARGETS += $(if $(HI_SAMPLE_IMAGES64),$(HI_SAMPLE_IMAGES64),$(HI_COMMON_OBJS64))
endif

#===============================================================================
# rules
#===============================================================================
.PHONY: all clean prepare

all: $(TARGETS)
	$(AT)test ! -e $(LINUX_DIR)/drivers/usb/mon/usbmon.ko || cp $(LINUX_DIR)/drivers/usb/mon/usbmon.ko $(OBJ_DIR)

clean:
	$(AT)rm -rf $(OBJ_DIR) $(OBJ64_DIR) $(HI_COMMON_OBJS) $(HI_COMMON_OBJS64)
	$(AT)rm -rf $(HI_SAMPLE_IMAGES) $(HI_SAMPLE_IMAGES64)

$(HI_SAMPLE_IMAGES) : % : $(HI_COMMON_OBJS) $(addprefix $(OBJ_DIR)/,$(LOCAL_OBJS)) %.o
	$(AT)$(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc -o $@ $^ $(HI_LIB_PATHS) $(HI_DEPEND_LIBS)

$(HI_SAMPLE_IMAGES64) : % : $(HI_COMMON_OBJS64) $(addprefix $(OBJ64_DIR)/,$(LOCAL_OBJS)) %.o
	$(AT)$(CFG_HI_AARCH64_TOOLCHAINS_NAME)-gcc -o $@ $^ $(HI_LIB64_PATHS) $(HI_DEPEND_LIBS)

$(OBJ_DIR)/%.o : %.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc $(CFLAGS) $(FLOAT_OPTIONS) -o $@ -c $^

$(OBJ64_DIR)/%.o : %.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CFG_HI_AARCH64_TOOLCHAINS_NAME)-gcc $(CFLAGS) -o $@ -c $^