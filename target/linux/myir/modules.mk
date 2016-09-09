#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/mmc-omap
  SUBMENU:=$(OTHER_MENU)
  TITLE:=TI OMAP High Speed Multimedia Card Interface support
  DEPENDS:=@(TARGET_omap||TARGET_myir) +kmod-mmc
  KCONFIG:= \
       CONFIG_MMC_OMAP_HS \
       CONFIG_MMC_OMAP
  FILES:= \
       $(LINUX_DIR)/drivers/mmc/host/omap.ko \
       $(LINUX_DIR)/drivers/mmc/host/omap_hsmmc.ko
  AUTOLOAD:=$(call AutoLoad,41, omap omap_hsmmc)
endef

define KernelPackage/mmc-omap/description
 Kernel support for TI OMAP High Speed Multimedia Card Interface
endef

$(eval $(call KernelPackage,mmc-omap))

