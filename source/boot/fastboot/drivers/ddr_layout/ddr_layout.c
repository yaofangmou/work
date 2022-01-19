/******************************************************************************
 *    Copyright (c) 2009-2012 by Hisi
 *    All rights reserved.
 * ***
 *    Create by Czyong 2012-12-03
 *
******************************************************************************/

#include <common.h>
#include <ddr_layout.h>

/*****************************************************************************/
extern struct ddr_layout_t fixed_ddr_layout[];
static struct ddr_layout_ctrl_t ddr_layout_ctrl = {0};

/*****************************************************************************/

int insert_ddr_layout(unsigned int start, unsigned int end, char *name)
{
	unsigned int ix = 0;
	unsigned int prev_end = 0;
	struct ddr_layout_t *layout = ddr_layout_ctrl.layout;

	if(0 == start && 0 == end)
		return 0;

	if (!end || start >= end || !name || !name[0]) {
		DBG_BUG(("Bad parameter: start:%u, end:%u. name:%p\n",
			start, end, name));
		return -1;
	}

	if (ddr_layout_ctrl.count >= MAX_OF_LAYOUT) {
		DBG_BUG(("Not enough memory layout space, "
		       "please increate `MAX_OF_LAYOUT`.\n"));
		return -1;
	}

	while (ix++ < ddr_layout_ctrl.count
		&& layout->name
		&& layout->start <= start) {

		prev_end = layout->end;
		layout++;
	}

	if (prev_end > start || (layout->name && end > layout->start)) {

		if (prev_end > start)
			layout--;

		DBG_BUG(("The inserting memory(`%s: 0x%08x - 0x%08x`) "
			"overlap with the existing memory"
			"(`%s: 0x%08x - 0x%08x`)\n",
			name, start, end,
			layout->name, layout->start, layout->end));
		return -1;
	}

	if (layout->name) {
		struct ddr_layout_t *tmp_layout
			= &ddr_layout_ctrl.layout[ddr_layout_ctrl.count];
		while (tmp_layout-- > layout) {
			memcpy((tmp_layout + 1), tmp_layout,
				sizeof(struct ddr_layout_t));
		}
	}

	ddr_layout_ctrl.count++;
	layout->start = start;
	layout->end   = end;
	layout->name  = name;

	layout = ddr_layout_ctrl.layout;
	for(ix = 0; ix < ddr_layout_ctrl.count; ix++, layout++) {
		if(ix < ddr_layout_ctrl.count - 1)
			layout->gap_to_next = (layout + 1)->start - layout->end;
		else
			layout->gap_to_next = 0;
	}

	return 0;
}
/*****************************************************************************/

int get_ddr_layout_by_name(char *name, struct ddr_layout_t *tmp)
{
	struct ddr_layout_t *layout = ddr_layout_ctrl.layout;
	int ix;

	if(!tmp)
		return -1;

	for (ix = 0; ix < ddr_layout_ctrl.count; ix++, layout++) {
		if(!strncmp(name, layout->name, strlen(layout->name))) {
			memcpy(tmp, layout, sizeof(struct ddr_layout_t));
			return 0;
		}
	}
	return -1;
}

/*****************************************************************************/
unsigned int get_ddr_free(unsigned int *size, unsigned int align)
{
	unsigned int ddrstart = MEM_BASE_DDR;

	if (ddr_layout_ctrl.count)
		ddrstart = ddr_layout_ctrl.layout[ddr_layout_ctrl.count - 1].end;

	align = (align <= 4) ? 3 : (align - 1);
	ddrstart = ((ddrstart + align) & ~(align));

	if (ddrstart >= (MEM_BASE_DDR + get_ddr_size())) {
		DBG_BUG(("Not enough memory.\n"));
	}

	if (size)
		(*size) = (MEM_BASE_DDR + get_ddr_size() - ddrstart);

	return ddrstart;
}
/*****************************************************************************/

void show_ddr_layout(void)
{
	unsigned int ix;
	struct ddr_layout_t *layout = ddr_layout_ctrl.layout;

	printf("\nThe DDR memory layout:\n");

	printf("%16s: 0x%08lx - 0x%08lx  ", "Total DDR",
		(long unsigned int)MEM_BASE_DDR,
		(long unsigned int)MEM_BASE_DDR + get_ddr_size());

	print_size(get_ddr_size(), "\n");

	for (ix = 0; ix < ddr_layout_ctrl.count; ix++, layout++) {
		printf("%16s: 0x%08x - 0x%08x  ",
			layout->name, layout->start, layout->end);
		print_size(layout->end - layout->start, "\n");
		/*printf("             gap: ");
		print_size(layout->gap_to_next, "\n");*/
	}
}

void ddr_layout_init(void)
{
	struct ddr_layout_t *layout;
	int ret;

	for(layout = fixed_ddr_layout; layout->name; layout++) {
		ret = insert_ddr_layout(layout->start, layout->end, layout->name);
		if(ret) {
			printf("Can't insert ddr layout %s from 0x%08x to 0x%08x\n", layout->name, layout->start, layout->end);
		}
	}
}

