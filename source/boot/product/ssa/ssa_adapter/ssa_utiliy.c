/******************************************************************************

  Copyright (C), 2018, Hisilicon Tech. Co., Ltd.

 ******************************************************************************
  File Name     : ssa_utiliy.c
  Version       : Initial Draft
  Author        : Device Chipset STB Development Dept
  Created       : 2018-08-30
  Description   :
  History       :
  1.Date        : 2018-08-30
    Author      : sdk
    Modification: Created file

*******************************************************************************/
#include <command.h>

#ifdef HI_MINIBOOT_SUPPORT
#include <run.h>
#include <stdio.h>
#include <string.h>
#else
#include <common.h>
#include <linux/string.h>
#endif

#include "ssa_utiliy.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif /* __cplusplus */
#endif /* __cplusplus */

/*************************** Macro Definition *********************************/
#define SSA_LEN_COMMAND                 (1024)



/*************************** Structure Definition *****************************/

/*************************** API Declaration **********************************/

HI_VOID SSA_Reboot(HI_VOID)
{
#ifdef HI_MINIBOOT_SUPPORT
    run_cmd("reset", strlen("reset"));
    run_cmd("reset", strlen("reset"));
    run_cmd("reset", strlen("reset"));
    while (1);
#else
    run_command("reset", 0);
    run_command("reset", 0);
    run_command("reset", 0);
    while (1);
#endif
    return;
}

HI_VOID SSA_SReset(HI_VOID)
{
#ifdef HI_MINIBOOT_SUPPORT
    run_cmd("sreset", strlen("sreset"));
    run_cmd("sreset", strlen("sreset"));
    run_cmd("sreset", strlen("sreset"));
    while (1);
#else
    run_command("sreset", 0);
    run_command("sreset", 0);
    run_command("sreset", 0);
    while (1);
#endif
    return;
}

HI_VOID SSA_BootM(HI_U8 *address)
{
#ifdef HI_MINIBOOT_SUPPORT
    kern_load((HI_CHAR *)(address));
#else
    {
        HI_CHAR as8BootCmd[SSA_LEN_COMMAND] = {0};

        snprintf(as8BootCmd, sizeof(as8BootCmd), "bootm 0x%x", (HI_U32)address);
        run_command(as8BootCmd, 0);
    }
#endif

    SSA_Reboot();
    return;
}

HI_VOID SSA_Go(HI_U8 *address)
{
    HI_CHAR as8BootCmd[SSA_LEN_COMMAND] = {0};

#if defined(CHIP_TYPE_hi3796mv200) || defined(CHIP_TYPE_hi3716mv450) || defined(CHIP_TYPE_hi3716mv430)
    snprintf(as8BootCmd, sizeof(as8BootCmd), "go 0x%x", (HI_U32)address + CONFIG_CHECKED_AREA_START);
#else
    snprintf(as8BootCmd, sizeof(as8BootCmd), "go 0x%x", (HI_U32)address);
#endif

#ifdef HI_MINIBOOT_SUPPORT
    run_cmd(as8BootCmd, SSA_LEN_COMMAND);
#else
    run_command(as8BootCmd, 0);
#endif

    SSA_Reboot();
    return;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif /* __cplusplus */
#endif /* __cplusplus */

