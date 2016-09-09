#
# Copyright (C) 2016 myirtech.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/MYC_C335X
	NAME:=MYIR C335x Board
	DEFAULT_PACKAGES += kmod-usb2 kmod-usb2-omap \
			kmod-usb-net kmod-usb-net-asix \
			kmod-usb-net-asix-ax88179 kmod-usb-net-hso \
			kmod-usb-net-kaweth kmod-usb-net-pegasus \
			kmod-usb-net-mcs7830 kmod-usb-net-smsc95xx \
			kmod-usb-net-dm9601-ether \
			kmod-usb-phy-nop kmod-usb-musb-hdrc kmod-usb-phy-am335x \
			kmod-usb-musb-platformglue kmod-mmc kmod-mmc-omap kmod-sdhci
endef

define Profile/MYC_C335X/Description
	Package set for the MYC_C335X board and similar devices.
	Contains various USB-NET drivers for boards without Ethernet.
endef

$(eval $(call Profile,MYC_C335X))
