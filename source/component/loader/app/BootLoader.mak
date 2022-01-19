#===============================================================================
# for bootloader only
#===============================================================================

ifeq ($(CFG_HI_MINIBOOT_SUPPORT),y)
CFLAGS += -DHI_LOADER_RUNNING_ENVIRONMENT_MINIBOOT
CFLAGS += -DHI_LOADER_RUNNING_ENVIRONMENT_BOOT
CFLAGS += -I$(BOOT_DIR)/miniboot/include
else ifeq ($(CFG_HI_UBOOT_SUPPORT),y)
CFLAGS += -DHI_LOADER_RUNNING_ENVIRONMENT_UBOOT
CFLAGS += -DHI_LOADER_RUNNING_ENVIRONMENT_BOOT
CFLAGS += -I$(BOOT_DIR)/fastboot/include
CFLAGS += -I$(BOOT_DIR)/fastboot/arch/arm/include
else
endif

ifeq ($(CFG_HI_BOOTLOADER_SUPPORT),y)
CFLAGS += -DHI_BOOTLOADER_SUPPORT
CFLAGS += -DHI_LOADER_BOOTLOADER
endif

CFLAGS += -I$(BOOT_DIR)/product/driver/include
CFLAGS += -I$(BOOT_DIR)/product
CFLAGS += $(LOADER_INC)
CFLAGS += $(LOADER_DEF)

LOADER_LIB = libapp.a


all: $(LOADER_LIB)

install: all

$(LOADER_LIB): $(LOADER_OBJS)
	$(AT)$(AR) -rc $@ $^

%.o: %.c
	$(AT)$(CC) $(CFLAGS) -c $^ -o "$(*D)/$(*F).o"

clean:
	$(AT)rm -f $(OBJS) $(LIBS)