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

#define MOULE_NAME                     "HIFAT: "
#include <debug.h>
#include "fat.h"

static int do_fat_read(struct cmd_t *cmd)
{
	int param_index = param_first(cmd);
	const char *filename = param_str(cmd, param_index++);
	uint32 mem_addr = param_int32(cmd, param_index++);
	uint32 readsize = param_int64(cmd, param_index++);

	if (hifat_read(filename, mem_addr, readsize)) {
		printf("read \"%s\" failed.\n", filename);
		return -1;
	}

	return 0;
}

CMD({&cw_fat, NULL},
    {&cw_read, NULL},
    {&cw_string, _T("filename in FAT system."), NULL},
    {&cw_addr, NULL},
    {&cw_size, _T("filesize in FAT filesystem."), do_fat_read})
