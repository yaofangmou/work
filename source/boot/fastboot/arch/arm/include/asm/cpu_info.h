/******************************************************************************
 *    COPYRIGHT (C) 2013 Czyong. Hisilicon
 *    All rights reserved.
 * ***
 *    Create by Czyong 2013-02-27
 *
******************************************************************************/

#ifndef CPU_INFOH
#define CPU_INFOH
/******************************************************************************/
#include <config.h>

struct cpu_info_t {
	char        *name;
	long long    chipid;
	long long    chipid_mask;
	unsigned int max_ddr_size;

	unsigned int devs;

	int (*boot_media)(char **media);

	void (*get_clock)(unsigned int *cpu, unsigned int *timer);

	int (*get_cpu_version)(char **version);

	int (*get_ca_type)(void);

	unsigned int (*get_ca_vendor)(char **ca_name);

};
long long get_chipid(void);

char is_tee_type(void);

#ifdef CONFIG_SBL_VXX_UXX
void copy_fbl_ext_area(void);
char *get_fbl_ext_area(unsigned int *length);
#endif

/******************************************************************************/
#endif /* CPU_INFOH */
