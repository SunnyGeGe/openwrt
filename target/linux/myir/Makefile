#
# Copyright (C) 2012-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=myir
BOARDNAME:=MYIR/ MYC_C335x
FEATURES:=targz usb usbgadget ext4 targz fpu audio jffs2_nand nand ubifs squashfs
CPU_TYPE:=cortex-a9
CPU_SUBTYPE:=vfpv3

LINUX_VERSION:=4.1.18
#KERNEL_PATCHVER:=4.1

MAINTAINER:=Sunny Guo <sunny.guo@myirtech.com>

KERNELNAME:=zImage dtbs

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-myir-myc_c335x

define Target/Description
	MYIR myc c335x boards
endef

$(eval $(call BuildTarget))
