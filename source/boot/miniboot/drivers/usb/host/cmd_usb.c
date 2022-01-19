/******************************************************************************
 *  Copyright (C) 2015 Hisilicon Technologies CO.,LTD.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Create By liuhui 2018.09.25
 *
******************************************************************************/
#include <errno.h>
#include <stdio.h>
#include <stddef.h>
#include <malloc.h>
#include <cmd-words.h>

#define MOULE_NAME                     "USB: "
#include <debug.h>
#include "usbcore.h"
#include "mass_storage.h"


static int do_usb(struct cmd_t *cmd)
{
	int ret = 0;

 	ret = hiusb_init();
	if (ret)
		return ret;

	hiusb_stor_scan ();

	return ret;
}

CMD({&cw_usb, NULL},
    {&cw_start, _T("init USB subsystem."), do_usb})
