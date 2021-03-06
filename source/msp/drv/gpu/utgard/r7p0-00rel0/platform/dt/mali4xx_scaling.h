/*
 * Copyright (C) 2013 ARM Limited. All rights reserved.
 *
 * This program is free software and is provided to you under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation, and any use by you of this program is subject to the terms of such GNU licence.
 *
 * A copy of the licence is included with the program, and can also be obtained from Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

/**
 * @file arm_core_scaling.h
 * Example core scaling policy.
 */

#ifndef __ARM_CORE_SCALING_H__
#define __ARM_CORE_SCALING_H__

void mali_core_scaling_init(int num_pp_cores);

void mali_core_scaling_term(void);

void mali_init_pp_scale_cores(unsigned int num);

void mali_core_scaling_update(struct mali_gpu_utilization_data *data);

unsigned int gpu_get_gp_utilization(void);

unsigned int gpu_get_pp_utilization(void);

#endif /* __ARM_CORE_SCALING_H__ */
