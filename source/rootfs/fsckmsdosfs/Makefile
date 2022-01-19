#===============================================================================
# export variables
#===============================================================================
AT := 

ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../../.. && /bin/pwd)

include $(SDK_DIR)/base.mak
endif

################################################################################
ifneq ($(HI_OUT_DIR),)
BUILD_DIR := $(HI_OUT_DIR)/obj/source/rootfs/dosfsck
else
BUILD_DIR := $(CURDIR)
endif

#===============================================================================
# local variable
#===============================================================================

DOSFSCK := dosfsck
FSCK_MSDOS := fsck.msdosfs

OBJS := boot.o \
        check.o \
        dir.o \
        fat.o \
        main.o \

OBJS := $(addprefix $(BUILD_DIR)/, $(OBJS))

CFLAGS := -O2 -g -W -Wall -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64

LIB := -L$(HI_SHARED_LIB_DIR)

CFLAGS := $(LIB) $(CFLAGS)

################################################################################
.PHONY: all clean
################################################################################
all: $(BUILD_DIR)/$(FSCK_MSDOS)
	$(AT) test -d $(HI_ROOTFS_DIR)/bin || mkdir -p $(HI_ROOTFS_DIR)/bin
	$(AT) install -m 0755 $(BUILD_DIR)/$(FSCK_MSDOS) $(HI_ROOTFS_DIR)/bin
	$(AT) cd $(HI_ROOTFS_DIR)/bin && ln -sf $(FSCK_MSDOS) $(DOSFSCK)

clean:
	$(AT)rm -rf $(HI_ROOTFS_DIR)/bin/$(DOSFSCK) $(BUILD_DIR)

$(BUILD_DIR)/$(FSCK_MSDOS): $(OBJS)
	$(AT) $(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o : %.c
	$(AT) test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT) $(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc $(CFLAGS) -o $@ -c $^
