################################################################################
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR     := $(shell pwd)/../../../../../

include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================
ifeq ($(CFG_HI_MINIBOOT_SUPPORT),y)
CFLAGS += -I$(BOOT_DIR)/miniboot/include
else ifeq ($(CFG_HI_UBOOT_SUPPORT),y)
CFLAGS += -I$(BOOT_DIR)/fastboot/include
else

endif

CFLAGS  += -I$(COMPONENT_DIR)/loader/api/include
CFLAGS  += -I$(BOOT_DIR)/include
CFLAGS  += -I$(PRODUCT_DIR)/driver/include
CFLAGS  += -I$(PRODUCT_DIR)/driver/include_inc
CFLAGS  += -I$(COMPONENT_DIR)/loader/api/src

ifneq ($(O),)
PRODUCT_DIR := $(O)/product
else
PRODUCT_DIR := $(BOOT_DIR)/../product
endif

SSA_ADAPTER_LIB := libssa_adapter.a

################################################################################


#===============================================================================
# rules
#===============================================================================
objs :=

objs += ssa_utiliy.o
objs += ssa_logo.o
objs += ssa_upgrade.o
objs += ssa_secureos.o

all: $(SSA_ADAPTER_LIB)

$(SSA_ADAPTER_LIB):$(objs)
	$(AT)echo "ar: $^ *************************"
	$(AT)$(AR) -rc -o ../$@ $^

%.o: %.c
	$(AT)echo "cc: $^ *************************"
	echo "$(CFLAGS)"
	$(AT)$(CC) $(CFLAGS) -c $^ -o "$(*D)/$(*F).o"

install: all

uninstall:

