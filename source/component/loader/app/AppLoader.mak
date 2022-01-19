#===============================================================================
# for apploader only
#===============================================================================

SRC_DIR := $(CURDIR)

IMAGE_NAME := loader

OBJ_DIR := $(HI_OUT_DIR)/obj/$(subst $(SDK_DIR)/,,$(SRC_DIR))
OBJ64_DIR := $(HI_OUT_DIR)/obj64/$(subst $(SDK_DIR)/,,$(SRC_DIR))

RELEASE_DIR	:= $(OBJ_DIR)/release
RELEASE64_DIR := $(OBJ64_DIR)/release

HI_LIB_PATHS := -L$(HI_STATIC_LIB_DIR)
HI_LIB64_PATHS := -L$(HI_STATIC_LIB64_DIR)

ifeq ($(HI_USER_SPACE_LIB),y)
RELEASE := $(RELEASE_DIR)
OBJECT := $(OBJ_DIR)
endif

ifeq ($(HI_USER_SPACE_LIB64),y)
RELEASE := $(RELEASE64_DIR)
OBJECT := $(OBJ64_DIR)
endif

C_FLAGS += -g -rdynamic -O2
C_FLAGS += -I$(COMMON_UNF_INCLUDE)
C_FLAGS += -I$(COMMON_API_INCLUDE)
C_FLAGS += -I$(COMMON_DRV_INCLUDE)
C_FLAGS += -I$(MSP_UNF_INCLUDE)
C_FLAGS += -I$(MSP_API_INCLUDE)
C_FLAGS += -I$(MSP_DRV_INCLUDE)
C_FLAGS += $(LOADER_INC)
C_FLAGS += $(LOADER_DEF)

LD_FLAGS := -Wl,--start-group
LD_FLAGS += -lrt -lpthread -ldl -lm -lstdc++ -lz
LD_FLAGS += -l:libfreetype.a -l:libharfbuzz.a -l:libhi_common.a -l:libhi_msp.a -l:libhigoadp.a -l:libhigo.a -l:libhiloader.a
LD_FLAGS += $(LOADER_LIB)

LD_FLAGS += -Wl,--end-group

ifeq ($(CFG_ARM_HISTBV320_LINUX),y)
FLOAT_OPTIONS := -mfloat-abi=hard -mfpu=vfpv3-d16
else
FLOAT_OPTIONS := -mfloat-abi=softfp -mfpu=vfpv3-d16
endif

OBJS := $(addprefix $(OBJ_DIR)/, $(LOADER_OBJS))
OBJS64 := $(addprefix $(OBJ64_DIR)/, $(LOADER_OBJS))
#===============================================================================
# rules
#===============================================================================
.PHONY: all clean $(RELEASE_DIR)/$(IMAGE_NAME) $(RELEASE64_DIR)/$(IMAGE_NAME)


all:
	$(AT)test -d $(RELEASE) || mkdir -p $(RELEASE)

ifeq ($(CFG_HI_ADVCA_SUPPORT), y)
	$(AT)make -C ca all
endif

	$(AT)make $(RELEASE)/$(IMAGE_NAME)

	-$(AT)cp -rvf $(CURDIR)/res $(RELEASE)/

	$(AT)rm -rf $(RELEASE)/res/frontend_config*.ini
ifeq ($(CFG_HI_FRONTEND_SUPPORT),y)
    ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv410)
		$(AT)cp $(CURDIR)/res/frontend_config.hi3716m41dma.ini $(RELEASE)/res/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv420)
		$(AT)cp $(CURDIR)/res/frontend_config.hi3716m42*.ini $(RELEASE)/res
        ifneq ($(findstring dmc, $(HI_OUT_DIR)),)
			$(AT)cp $(RELEASE)/res/*dmc*.ini $(RELEASE)/res/frontend_config.ini
        else
			$(AT)cp $(RELEASE)/res/*dmb*.ini $(RELEASE)/res/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv430)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3716m43*.ini $(RELEASE)/res
        ifneq ($(findstring dmb, $(HI_OUT_DIR)),)
			$(AT)cp $(RELEASE)/res/*dmb*.ini $(RELEASE)/res/frontend_config.ini
        else
			$(AT)cp $(RELEASE)/res/*dma*.ini $(RELEASE)/res/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3716mv450)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3716m45dma.ini $(RELEASE)/res/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3796mv100)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3796mdmo1a.ini $(RELEASE)/res/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3796mv200)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3796mv2*.ini   $(RELEASE)/res
        ifneq ($(findstring dmb, $(HI_OUT_DIR)),)
			$(AT)cp $(RELEASE)/res/*dmb*.ini $(RELEASE)/res/frontend_config.ini
        else
			$(AT)cp $(RELEASE)/res/*dma*.ini $(RELEASE)/res/frontend_config.ini
        endif
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3798cv200)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3798cv2dmb.ini $(RELEASE)/res/frontend_config.ini
    else ifeq ($(CFG_HI_CHIP_TYPE),hi3798mv200)
		$(AT)cp  $(CURDIR)/res/frontend_config.hi3798mv2dmg.ini $(RELEASE)/res/frontend_config.ini
    else
		$(AT)cp -drf $(CURDIR)/res/frontend_config*.ini $(RELEASE)/res
    endif
	test ! -f $(CURDIR)/res/frontend_config.ini || cp $(CURDIR)/res/frontend_config.ini $(RELEASE)/res/frontend_config.ini
endif

clean:
	$(AT)rm -rf $(OBJECT)

ifeq ($(CFG_HI_ADVCA_SUPPORT), y)
	$(AT)make -C ca clean
endif


$(RELEASE_DIR)/$(IMAGE_NAME): $(OBJS)
	$(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc -o $@ $^ $(C_FLAGS) $(HI_LIB_PATHS) $(LD_FLAGS)
	$(STRIP) $(RELEASE_DIR)/$(IMAGE_NAME)

$(RELEASE64_DIR)/$(IMAGE_NAME): $(OBJS64)
	$(CFG_HI_AARCH64_TOOLCHAINS_NAME)-gcc -o $@ $^ $(C_FLAGS) $(HI_LIB64_PATHS) $(LD_FLAGS)
	$(STRIP) $(RELEASE64_DIR)/$(IMAGE_NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CFG_HI_ARM_TOOLCHAINS_NAME)-gcc $(C_FLAGS) $(FLOAT_OPTIONS) -o $@ -c $^

$(OBJ64_DIR)/%.o: $(SRC_DIR)/%.c
	$(AT)test -d $(dir $@) || mkdir -p $(dir $@)
	$(AT)$(CFG_HI_AARCH64_TOOLCHAINS_NAME)-gcc $(C_FLAGS) -o $@ -c $^
