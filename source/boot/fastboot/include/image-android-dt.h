/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2018 Linaro Ltd.
 * Sam Protsenko <semen.protsenko@linaro.org>
 */

#ifndef IMAGE_ANDROID_DT_H
#define IMAGE_ANDROID_DT_H

#include <linux/types.h>


int android_dt_check_header(ulong hdr_addr);
int android_dt_get_fdt_by_index(ulong hdr_addr, u32 index, ulong *addr,
				 u32 *size);
void android_dt_print_contents(ulong hdr_addr);

#endif /* IMAGE_ANDROID_DT_H */
