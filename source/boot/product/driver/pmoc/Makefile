#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR     := $(shell pwd)/../../../../..
include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================

ifeq ($(CFG_HI_MINIBOOT_SUPPORT),y)
BOOT_DIR  := $(SDK_DIR)/source/boot/miniboot
else
BOOT_DIR  := $(SDK_DIR)/source/boot/fastboot
endif

ifneq ($(O),)
PRODUCT_DIR := $(O)/product
else
PRODUCT_DIR := $(BOOT_DIR)/../product
endif

ifeq ($(CFG_HI_LPMCU_LOAD_IN_BOOT), y)
CFLAGS += -DHI_LPMCU_LOAD_IN_BOOT
	ifeq ($(CFG_HI_PM_SUSPEND_WHEN_POWERUP), y)
	CFLAGS += -DHI_PM_SUSPEND_WHEN_POWERUP
	endif
endif

ifeq ($(CFG_HI_PM_SUSPEND_FROM_MEMORY), y)
CFLAGS += -DHI_PM_SUSPEND_FROM_MEMORY
endif

CFLAGS   += -I$(PRODUCT_DIR)/driver/include
CFLAGS   += -I$(BOOT_DIR)/arch/arm/include
CFLAGS   += -I$(BOOT_DIR)/include
#CFLAGS   += -I$(COMPONENT_DIR)/pm/c51

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450),)
CFLAGS += -I$(COMPONENT_DIR)/pm/c51_96mv200
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200),)
CFLAGS += -I$(COMPONENT_DIR)/pm/c51_98mv200
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv300),)
CFLAGS += -I$(COMPONENT_DIR)/pm/c51_98mv300
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv310),)
CFLAGS += -I$(COMPONENT_DIR)/pm/c51_98mv310
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv430),)
CFLAGS += -I$(COMPONENT_DIR)/pm/c51_16mv430
else
CFLAGS += -I$(COMPONENT_DIR)/pm/c51
endif

LIBS     := libpmoc.a

###########################ca_common#####################
OBJS += drv_c51.o

ifdef CFG_HI_ADVCA_TYPE
CFLAGS += -DADVCA_SUPPORT  -DADVCA_TYPE_$(CFG_HI_ADVCA_TYPE)
endif

#===============================================================================
# rules
#===============================================================================

.PHONY: all clean install uninstall $(LIBS)

all: $(LIBS)

clean:
	$(AT)rm -rf $(OBJS)
	$(AT)rm -rf $(LIBS)

install: all

uninstall:

$(LIBS): $(OBJS)
	$(AT)$(AR) -rc $@ $^
