#
# Copyright (C) 2009-2012 OpenWrt.org
# Copyright (C) 2009-2014 Thomas Heil <heil@terminal-consulting.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=memcached
PKG_VERSION:=1.6.31
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://memcached.org/files
PKG_HASH:=20d8d339b8fb1f6c79cee20559dc6ffb5dfee84db9e589f4eb214f6d2c873ef5

PKG_MAINTAINER:=Thomas Heil <heil@terminal-consulting.de>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING
PKG_CPE_ID:=cpe:/a:memcachedb:memcached

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/memcached
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libevent2 +libpthread
  TITLE:=The high-performance, distributed memory object caching system
  URL:=https://memcached.org/
  USERID:=memcached=441:memcached=441
endef

define Package/memcached/description
  Free and open source, high-performance, distributed memory object caching system
endef

define Package/memcached/conffiles
/etc/config/memcached
endef

CONFIGURE_ARGS += \
	--with-libevent=$(STAGING_DIR)/usr/include/libevent \
	--disable-docs \
	--disable-dtrace \
	--disable-coverage \
	--disable-sasl

CONFIGURE_VARS += ac_cv_c_endian=$(if $(CONFIG_BIG_ENDIAN),big,little)

define Package/memcached/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/memcached $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/memcached.config $(1)/etc/config/memcached
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/memcached.init $(1)/etc/init.d/memcached
endef

$(eval $(call BuildPackage,memcached))
