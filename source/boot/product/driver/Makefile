#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../../../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   variable
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ifeq ($(CFG_HI_BOOT_FBL),y)
    objects := common flash otp db pdm

    ifeq ($(CFG_HI_ADVCA_SUPPORT), y)
        objects += cipher

        ifeq ($(CFG_HI_OTP_KLAD_V100),y)
            objects += advca
        else ifeq ($(CFG_HI_OTP_KLAD_V200),y)
            objects += klad
        endif
    endif
else
    objects := common flash otp db pdm pq disp graphic i2c gpio aiao
 
    ifeq ($(CFG_HI_HDMI_SUPPORT), y)
        objects += hdmi
    endif

    ifeq ($(CFG_HI_BUILD_WITH_FRONTEND), y)
        objects += frontend
    endif

    ifeq ($(CFG_HI_GPIOI2C_SUPPORT), y)
        objects += gpioi2c
    endif

    ifeq ($(CFG_HI_BUILD_WITH_DEMUX), y)
        objects += demux
    endif

    ifeq ($(CFG_HI_BUILD_WITH_IR), y)
        objects += ir
    endif

    ifeq ($(CFG_HI_BUILD_WITH_KEYLED), y)
        objects += keyled
    endif

    ifeq ($(CFG_HI_ADVCA_SUPPORT), y)
        objects += cipher
        objects += pmoc

        ifeq ($(CFG_HI_OTP_KLAD_V100),y)
            objects += advca
        else ifeq ($(CFG_HI_OTP_KLAD_V200),y)
            objects += klad
        endif
    endif

    ifeq ($(CFG_HI_PM_IN_BOOT_SUPPORT), y)
        objects += pmoc
    endif
endif

objects_clean := $(addsuffix _clean,$(objects))

LIBS := libdriver.a
SUBLIBS := $(foreach sub,$(objects),$(sub)/lib$(sub).a)

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#==================================================================
#                          all
#==================================================================
.PHONY: all clean $(LIBS)

all: $(LIBS)

clean:  $(objects_clean)
	$(AT)rm -rf $(LIBS)
	$(AT)rm -rf ar.mak

$(LIBS): $(objects)
	$(AT)rm -rf $@
	$(AT)rm -rf ar.mak
	$(AT)echo "CREATE $@" >> ar.mak
	$(AT)$(foreach sublib,$(SUBLIBS),echo "ADDLIB $(sublib)" >> ar.mak;)
	$(AT)echo "SAVE" >> ar.mak
	$(AT)echo "END" >> ar.mak
	$(AT)$(AR) -M < ar.mak

#==================================================================
#                          modules
#==================================================================
.PHONY: $(objects) $(objects_clean)

prepare:
	make -C graphic prepare
	make -C disp prepare
	make -C pq prepare

$(objects): | prepare
	make -C $@ all

$(objects_clean):
	make -C $(patsubst %_clean,%,$@) clean
