# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=poemgr
PKG_SOURCE_DATE:=2022-09-20
PKG_SOURCE_VERSION:=8988247aacdf18013daa7d7931754e338e08b1bd
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/blocktrron/poemgr.git
PKG_MIRROR_HASH:=37463a4e8056c5ebbb6573804d4c0fa923544c939d253326905e2727a67e8426

PKG_MAINTAINER:=David Bauer <mail@david-bauer.net>
PKG_LICENSE:=GPL-2.0-only

include $(INCLUDE_DIR)/package.mk

define Package/poemgr
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libuci +libjson-c
  TITLE:=Utility to control PoE ports on the UniFi Flex switch
endef

define Package/poemgr/conffiles
/etc/config/poemgr
endef

define Package/poemgr/install
	$(INSTALL_DIR) $(1)/sbin $(1)/usr/lib/poemgr/config $(1)/etc/config $(1)/etc/uci-defaults $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/poemgr $(1)/sbin/poemgr
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/contrib/uswlite-pse-enable $(1)/usr/lib/poemgr/uswlite-pse-enable
	$(CP) $(PKG_BUILD_DIR)/contrib/usw-lite.config $(1)/usr/lib/poemgr/config/usw-lite.config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/contrib/uci-defaults.sh $(1)/etc/uci-defaults/99-poemgr
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/contrib/procd-init.sh $(1)/etc/init.d/poemgr
endef


$(eval $(call BuildPackage,poemgr))
