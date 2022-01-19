#
# (C) Copyright 2006
# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
#
# See file CREDITS for list of people who contributed to this
# project.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA
#

include $(TOPDIR)/config.mk

LIB	:= $(obj)libddr_layout.a


ifneq ($(CONFIG_SUPPORT_CA_CONAX), )
COBJS-y += advca/fixed_ddr_layout_conax.o
else ifneq ($(CONFIG_SUPPORT_CA_VERIMATRIX), )
COBJS-y += advca/fixed_ddr_layout_verimatrix.o
else ifneq ($(CONFIG_SUPPORT_CA_VERIMATRIX_ULTRA), )
COBJS-y += advca/fixed_ddr_layout_verimatrix_ultra.o
else ifneq ($(CONFIG_SUPPORT_CA_NAGRA), )
COBJS-y += advca/fixed_ddr_layout_nagra.o
else ifneq ($(CONFIG_SUPPORT_CA_DCAS), )
COBJS-y += advca/fixed_ddr_layout_dcas.o
else ifneq ($(CONFIG_SUPPORT_CA_IRDETO), )
COBJS-y += advca/fixed_ddr_layout_irdeto.o
else ifneq ($(CONFIG_SUPPORT_CA_L2), )
COBJS-y += advca/fixed_ddr_layout_l2.o
else
COBJS-y += fixed_ddr_layout_basic.o
endif

COBJS-y += ddr_layout.o

COBJS	:= $(COBJS-y)
SRCS	:= $(COBJS:.o=.c)
OBJS	:= $(addprefix $(obj),$(COBJS))

all:	$(LIB)

$(LIB): $(obj).depend $(OBJS)
	$(AR) $(ARFLAGS) $@ $(OBJS)

#########################################################################

# defines $(obj).depend target
include $(SRCTREE)/rules.mk

sinclude $(obj).depend

#########################################################################
