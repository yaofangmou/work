#! /bin/bash

SYSREG=${SDK_DIR}/source/boot/sysreg/${CFG_HI_CHIP_TYPE}/${CFG_HI_BOOT_REG_NAME}

if [ -n "${CFG_HI_FBL_PARITITION_SIZE}" ]
then
HI_FBL_PARITITION_SIZE=${CFG_HI_FBL_PARITITION_SIZE}
else
HI_FBL_PARITITION_SIZE=0x100000
fi

if [ -n "${CFG_HI_SECURE_OS_PARITITION_SIZE}" ]
then
HI_SECURE_OS_PARITITION_SIZE=${CFG_HI_SECURE_OS_PARITITION_SIZE}
else
HI_SECURE_OS_PARITITION_SIZE=0x800000
fi

if [ -n "${CFG_HI_SBL_PARITITION_SIZE}" ]
then
HI_SBL_PARITITION_SIZE=${CFG_HI_SBL_PARITITION_SIZE}
else
HI_SBL_PARITITION_SIZE=0x400000
fi

if [ -n "${CFG_HI_FBL_DATA_PARITITION_SIZE}" ]
then
HI_FBL_DATA_PARITITION_SIZE=${CFG_HI_FBL_DATA_PARITITION_SIZE}
else
HI_FBL_DATA_PARITITION_SIZE=0x20000
fi

if [ -n "${CFG_HI_SBL_VERIFY_FLAG}" ]
then
HI_SBL_VERIFY_FLAG=0
else
HI_SBL_VERIFY_FLAG=1
fi

if [ -n "${CFG_HI_SBL_DECRYPT_FLAG}" ]
then
HI_SBL_DECRYPT_FLAG=0
else
HI_SBL_DECRYPT_FLAG=1
fi
