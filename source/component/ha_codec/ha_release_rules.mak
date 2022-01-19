#-------------------------------------------------------------------------------
# Copyright (C), 2016, Hisilicon Tech. Co., Ltd.
#-------------------------------------------------------------------------------

ifeq ($(HA_RELEASE_RULES_INCLUDE),)

HA_RELEASE_RULES_INCLUDE := 1

CFG_HI_ARM_RELEASE_TOOLCHAINS_NAME ?=
ifneq ($(CFG_HI_ARM_RELEASE_TOOLCHAINS_NAME),)
HI_USER_SPACE_LIB := y
CFG_HI_ARM_TOOLCHAINS_NAME := $(CFG_HI_ARM_RELEASE_TOOLCHAINS_NAME)

ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv320-linux)
FLOAT_OPTIONS := -mfloat-abi=hard -mfpu=vfpv3-d16
else ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv400-linux)
FLOAT_OPTIONS := -mfloat-abi=hard -mfpu=vfpv3-d16
else ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv310-linux)
FLOAT_OPTIONS := -mfloat-abi=softfp -mfpu=vfpv3-d16
else ifeq ($(CFG_HI_ARM_TOOLCHAINS_NAME),arm-histbv300-linux)
FLOAT_OPTIONS := -mfloat-abi=softfp -mfpu=vfpv3-d16
else
FLOAT_OPTIONS :=
endif
endif

CFG_HI_AARCH64_RELEASE_TOOLCHAINS_NAME ?=
ifneq ($(CFG_HI_AARCH64_RELEASE_TOOLCHAINS_NAME),)
HI_USER_SPACE_LIB64 := y
CFG_HI_AARCH64_TOOLCHAINS_NAME := $(CFG_HI_AARCH64_RELEASE_TOOLCHAINS_NAME)
CFG_HI_CFLAGS := $(filter-out -mcpu=cortex-a9 -mcpu=cortex-a7 -mcpu=cortex-a53,$(CFG_HI_CFLAGS))
CFG_HI_CFLAGS += -mcpu=cortex-a53
endif

# $(warning HI_USER_SPACE_LIB=$(HI_USER_SPACE_LIB))
# $(warning CFG_HI_ARM_RELEASE_TOOLCHAINS_NAME=$(CFG_HI_ARM_RELEASE_TOOLCHAINS_NAME))
# $(warning CFG_HI_ARM_TOOLCHAINS_NAME=$(CFG_HI_ARM_TOOLCHAINS_NAME))

# $(warning HI_USER_SPACE_LIB64=$(HI_USER_SPACE_LIB64))
# $(warning CFG_HI_AARCH64_RELEASE_TOOLCHAINS_NAME=$(CFG_HI_AARCH64_RELEASE_TOOLCHAINS_NAME))
# $(warning CFG_HI_AARCH64_TOOLCHAINS_NAME=$(CFG_HI_AARCH64_TOOLCHAINS_NAME))

endif
