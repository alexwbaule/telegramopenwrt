include $(TOPDIR)/rules.mk

PKG_NAME:=telegram-openwrt

PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/telegram-openwrt/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=IP Addresses and Names
  PKGARCH:=all
endef

define Package/telegram-openwrt
  $(call Package/telegram-openwrt/Default)
  TITLE:=Telegram for openwrt BOT
endef

define Package/telegram-openwrt/description
  Telegram for use in openwrt. Its a BOT
  that executes selected commands in your router.
  Version: $(PKG_VERSION)-$(PKG_RELEASE)
  Info   : https://github.com/alexwbaule/telegramopenwrt
endef

define Package/telegram-openwrt/conffiles
/etc/config/telegramopenwrt
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/telegram-openwrt/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./etc/init.d/telegram_bot \
		$(1)/etc/init.d/telegram_bot
	$(INSTALL_BIN) ./etc/init.d/lanports \
		$(1)/etc/init.d/lanports
	$(INSTALL_BIN) ./etc/init.d/hosts_scan \
		$(1)/etc/init.d/hosts_scan

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./etc/config/telegramopenwrt \
		$(1)/etc/config/telegramopenwrt
	
	$(INSTALL_DIR) $(1)/etc/telegramopenwrt
	$(INSTALL_CONF) ./etc/telegramopenwrt \
		$(1)/etc/telegramopenwrt

	$(INSTALL_DIR) $(1)/usr/share/telegramopenwrt
	echo "$(PKG_VERSION)-$(PKG_RELEASE)" > $(1)/usr/share/telegramopenwrt/version

	$(INSTALL_DIR) $(1)/usr/lib/telegramopenwrt/plugins
	$(INSTALL_DATA) ./usr/lib/telegramopenwrt/plugins/* \
		$(1)/usr/lib/telegramopenwrt/plugins

	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./usr/sbin/* \
		$(1)/usr/sbin/
endef

define Package/telegram-openwrt/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot enabled
	/etc/init.d/lanports enabled
	/etc/init.d/host_scan enabled
	/etc/init.d/telegram_bot start
	/etc/init.d/lanports start
	/etc/init.d/host_scan start
fi
exit 0
endef

define Package/telegram-openwrt/prerm
#!/bin/sh
if [ -n "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot stop
	/etc/init.d/lanports stop
	/etc/init.d/host_scan stop
	/etc/init.d/telegram_bot disable
	/etc/init.d/lanports disable
	/etc/init.d/host_scan disable
fi
exit 0
endef

$(eval $(call BuildPackage,telegram-openwrt))
