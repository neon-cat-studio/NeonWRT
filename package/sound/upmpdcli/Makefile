#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=upmpdcli
PKG_VERSION:=1.8.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.lesbonscomptes.com/upmpdcli/downloads
PKG_HASH:=d715120b869382ea701f07baa604c77b7895537e0655e1ed4dfa68d986d6a59f

PKG_MAINTAINER:=
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/meson.mk

define Package/upmpdcli
  SECTION:=sound
  CATEGORY:=Sound
  URL:=https://www.lesbonscomptes.com/upmpdcli
  DEPENDS:=+libupnpp +libmpdclient +jsoncpp
  TITLE:=A UPnP front-end to MPD, the Music Player Daemon
  USERID:=upmpdcli=89:upmpdcli=89
  MENU:=1
endef

define Package/upmpdcli/description
upmpdcli implements an UPnP Media Renderer, using MPD to perform the real work.
endef

define Package/upmpdcli/config
	source "$(SOURCE)/Config.in"
endef

define Package/upmpdcli/conffiles
/etc/config/upmpdcli
endef

define Package/upmpdcli/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/upmpdcli.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/upmpdcli.config $(1)/etc/config/upmpdcli
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/upmpdcli $(1)/usr/bin/
ifeq ($(CONFIG_PACKAGE_UPMPDCLI_SCCTL),y)
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/scctl $(1)/usr/bin/
endif
	$(INSTALL_DIR) $(1)/usr/share/upmpdcli
ifneq ($(CONFIG_PACKAGE_UPMPDCLI_SC_WEB_INTERFACE),y)
	$(RM) -rf $(PKG_INSTALL_DIR)/usr/share/upmpdcli/web
endif
	$(CP) $(PKG_INSTALL_DIR)/usr/share/upmpdcli $(1)/usr/share/
	$(INSTALL_DATA) ./files/upmpdcli.png $(1)/usr/share/upmpdcli/icon.png
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/upmpdcli.init $(1)/etc/init.d/upmpdcli
endef

$(eval $(call BuildPackage,upmpdcli))
