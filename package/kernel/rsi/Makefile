#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rsi9113
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=

PKG_SOURCE_URL:=https://github.com/SunnyGeGe/RS9113
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=5f1e4efde694fdb678c86cb2f3061541bcc37593
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.xz

PKG_MAINTAINER:=Imre Kaloz <kaloz@openwrt.org>
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rsiwifi
  SUBMENU:=Wireless Drivers
  TITLE:= Redpine RS9113 Wireless Driver
  DEPENDS:=+kmod-mmc
  FILES:= \
	$(PKG_BUILD_DIR)/source/host/onebox_common_gpl.ko \
	$(PKG_BUILD_DIR)/source/host/onebox_gpl.ko \
	$(PKG_BUILD_DIR)/source/host/onebox_nongpl.ko \
	$(PKG_BUILD_DIR)/source/host/onebox_wlan_gpl.ko \
	$(PKG_BUILD_DIR)/source/host/onebox_wlan_nongpl.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_acl.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_tkip.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_wep.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_xauth.ko \
	$(PKG_BUILD_DIR)/source/host/wlan.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_ccmp.ko \
	$(PKG_BUILD_DIR)/source/host/wlan_scan_sta.ko 
  AUTOLOAD:=$(call AutoLoad, 50, mac80211 onebox_common_gpl onebox_gpl onebox_nongpl onebox_wlan_gpl onebox_wlan_nongpl wlan_acl wlan_tkip wlan_wep wlan_xauth wlan_ccmp wlan_scan_sta wlan)
endef

define Package/rsi-wpa
  SECTION:=kernel
  CATEGORY:=Kernel modules
  DEPENDS:=@PACKAGE_kmod-rsiwifi
  SUBMENU:=Proprietary Redpine WiFi driver
  SUBMENUDEP:=@TARGET_myir
  TITLE:= Redpine Wpa tools
endef

define Package/rsi-onebox
  SECTION:=kernel
  CATEGORY:=Kernel modules
  DEPENDS:=@PACKAGE_kmod-rsiwifi
  SUBMENU:=Proprietary Redpine WiFi driver
  SUBMENUDEP:=@TARGET_myir
  TITLE:= Redpine onebox tools
endef


EXTRA_CFLAGS= \
	-DWLAN_ENABLE \
	-DONEBOX_DEBUG_ENABLE \
	-DPROGRAMMING_BBP_TA \
	-DPROGRAMMING_SCAN_TA \
	-DRSI_SDIO_MULTI_BLOCK_SUPPORT \
	-DLINUX \
	-Wimplicit \
	-Wstrict-prototypes \
	-DFLASH_BURNING \
	-DRSI_SDIO_MULTI_BLOCK_SUPPORT \
	-DDYNAMIC_VARIABLES \
	-DRF_8111 \
	-DINET6 \
	-Dnet80211_s \
	-DBGSCAN_SUPPORT \
	-DPWR_SAVE_SUPPORT \
	-DSECURITY_SUPPORT \
	-DACM_NO_TSPEC_CNFM \
	-DBYPASS_TX_DATA_PATH \
	-DBYPASS_RX_DATA_PATH \
	-DIEEE80211_AMPDU_AGE \
	-DSECURITY_SUPPORT \
	-DAMPDU_AGGR_SUPPORT \
	-DENABLE_P2P_SUPPORT \
	-DUSE_WORKQUEUES \
	-DUSE_BLUEZ_BT_STACK \
	-g \
	-DUSE_SDIO_INTF

NOSTDINC_FLAGS = \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/source/host/common_hal/include/linux/ \
	-I$(PKG_BUILD_DIR)/source/host/common_hal/include/common/ \
	-I$(PKG_BUILD_DIR)/source/host/wlan/net80211/linux/osd_linux/include/ \
	-I$(PKG_BUILD_DIR)/source/host/wlan/net80211/linux/osi_net80211/net80211/ \
	-I$(PKG_BUILD_DIR)/source/host/wlan/net80211/linux/osi_net80211/ \
	-I$(PKG_BUILD_DIR)/source/host/wlan/wlan_hal/include/linux \
	-I$(PKG_BUILD_DIR)/source/host/bt/include/linux \
	-I$(PKG_BUILD_DIR)//source/host/zigbee/include/linux
 

define Build/Prepare
        $(call Build/Prepare/Default)
endef


define Build/Compile
	$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
                ARCH="$(LINUX_KARCH)" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                SUBDIRS="$(PKG_BUILD_DIR)/source/host" \
                NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
                modules
	
	$(MAKE) ROOT_DIR="$(PKG_BUILD_DIR)/source/host" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		CC="$(TARGET_CC)" \
		V=99 \
		-C $(PKG_BUILD_DIR)/source/host/wlan/supplicant/linux/wpa_supplicant 
	
	$(MAKE) ROOT_DIR="$(PKG_BUILD_DIR)/source/host" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		CC="$(TARGET_CC)" \
		V=99 \
		-C $(PKG_BUILD_DIR)/source/host/utils/ 
	
endef

define Package/rsi-wpa/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/lib/rsi
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/wlan/supplicant/linux/wpa_supplicant/wpa_supplicant $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/wlan/supplicant/linux/wpa_supplicant/wpa_supplicant $(1)/lib/rsi/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/wlan/supplicant/linux/wpa_supplicant/wpa_cli $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/wlan/supplicant/linux/wpa_supplicant/wpa_cli $(1)/lib/rsi/
endef

define Package/rsi-onebox/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/lib/rsi
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/utils/onebox_util $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/host/utils/onebox_util $(1)/lib/rsi/
endef
define KernelPackage/rsiwifi/install
	$(INSTALL_DIR) $(1)/lib/rsi
	$(INSTALL_DIR) $(1)/lib/rsi/firmware
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_AP_BT_DUAL_MODE.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_WC_BL.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_WLAN_BT_DUAL_MODE_PER.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_WLAN_BT_DUAL_MODE.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_WLAN_QSPI.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_WLAN_ZIGBEE.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_ZIGBEE_COORDINATOR.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/RS9113_ZIGBEE_ROUTER.rps $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/pmemdata $(1)/lib/rsi/firmware/
	$(CP) $(PKG_BUILD_DIR)/source/host/release/firmware/pmemdata_burn $(1)/lib/rsi/firmware/
endef

$(eval $(call KernelPackage,rsiwifi))
$(eval $(call BuildPackage,rsi-wpa))
$(eval $(call BuildPackage,rsi-onebox))
