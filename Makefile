include $(TOPDIR)/rules.mk

PKG_NAME:=telegram-openwrt

PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/telegram-openwrt
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Telegram BOT for openwrt
  URL:=https://github.com/alexwbaule/telegramopenwrt
  PKGARCH:=all
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
			./etc/init.d/lanports \
			./etc/init.d/hosts_scan \
		$(1)/etc/init.d

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./etc/config/telegramopenwrt \
		$(1)/etc/config/telegramopenwrt
	
	$(INSTALL_DIR) $(1)/etc/telegramopenwrt
	$(INSTALL_CONF) ./etc/telegramopenwrt/macaddr.ignore \
		$(1)/etc/telegramopenwrt/macaddr.ignore

	$(INSTALL_DIR) $(1)/usr/share/telegramopenwrt
	echo "$(PKG_VERSION)-$(PKG_RELEASE)" > $(1)/usr/share/telegramopenwrt/version
	
	$(INSTALL_DIR) $(1)/usr/lib/telegramopenwrt/plugins/actions
	$(INSTALL_BIN) ./usr/lib/telegramopenwrt/plugins/actions/cam_mv \
				./usr/lib/telegramopenwrt/plugins/actions/fwr_disable \
				./usr/lib/telegramopenwrt/plugins/actions/fw_delete \
				./usr/lib/telegramopenwrt/plugins/actions/proc_stop \
				./usr/lib/telegramopenwrt/plugins/actions/fwr_enable \
				./usr/lib/telegramopenwrt/plugins/actions/chromego \
				./usr/lib/telegramopenwrt/plugins/actions/fw_disable \
				./usr/lib/telegramopenwrt/plugins/actions/wifi_disable \
				./usr/lib/telegramopenwrt/plugins/actions/proxy_enable \
				./usr/lib/telegramopenwrt/plugins/actions/wifi_restart \
				./usr/lib/telegramopenwrt/plugins/actions/proc_restart \
				./usr/lib/telegramopenwrt/plugins/actions/proxy_disable \
				./usr/lib/telegramopenwrt/plugins/actions/wifi_enable \
				./usr/lib/telegramopenwrt/plugins/actions/light_control \
				./usr/lib/telegramopenwrt/plugins/actions/proc_start \
				./usr/lib/telegramopenwrt/plugins/actions/fw_enable \
		$(1)/usr/lib/telegramopenwrt/plugins/actions
	
	$(INSTALL_DIR) $(1)/usr/lib/telegramopenwrt/plugins/ctx
	$(INSTALL_BIN) ./usr/lib/telegramopenwrt/plugins/ctx/wifi_list \
				./usr/lib/telegramopenwrt/plugins/ctx/fwr_list \
				./usr/lib/telegramopenwrt/plugins/ctx/service_list \
				./usr/lib/telegramopenwrt/plugins/ctx/chromego \
				./usr/lib/telegramopenwrt/plugins/ctx/reboot \
				./usr/lib/telegramopenwrt/plugins/ctx/cam_kbd \
				./usr/lib/telegramopenwrt/plugins/ctx/proxy \
				./usr/lib/telegramopenwrt/plugins/ctx/fw_list \
				./usr/lib/telegramopenwrt/plugins/ctx/light_list \
		$(1)/usr/lib/telegramopenwrt/plugins/ctx
	
	$(INSTALL_DIR) $(1)/usr/lib/telegramopenwrt/plugins/help
	$(INSTALL_DATA) ./usr/lib/telegramopenwrt/plugins/help/cam_mv \
				./usr/lib/telegramopenwrt/plugins/help/fw_unblock \
				./usr/lib/telegramopenwrt/plugins/help/fw_add \
				./usr/lib/telegramopenwrt/plugins/help/cam_vdo \
				./usr/lib/telegramopenwrt/plugins/help/fwr_disable \
				./usr/lib/telegramopenwrt/plugins/help/msg_tv \
				./usr/lib/telegramopenwrt/plugins/help/wifi_list \
				./usr/lib/telegramopenwrt/plugins/help/swports_list \
				./usr/lib/telegramopenwrt/plugins/help/fwr_list \
				./usr/lib/telegramopenwrt/plugins/help/fw_delete \
				./usr/lib/telegramopenwrt/plugins/help/chromego_list \
				./usr/lib/telegramopenwrt/plugins/help/get_mac \
				./usr/lib/telegramopenwrt/plugins/help/proc_stop \
				./usr/lib/telegramopenwrt/plugins/help/proc_list \
				./usr/lib/telegramopenwrt/plugins/help/proxy_list \
				./usr/lib/telegramopenwrt/plugins/help/get_uptime \
				./usr/lib/telegramopenwrt/plugins/help/fwr_enable \
				./usr/lib/telegramopenwrt/plugins/help/wll_list \
				./usr/lib/telegramopenwrt/plugins/help/start \
				./usr/lib/telegramopenwrt/plugins/help/ignoredmac_list \
				./usr/lib/telegramopenwrt/plugins/help/fw_disable \
				./usr/lib/telegramopenwrt/plugins/help/lights \
				./usr/lib/telegramopenwrt/plugins/help/wifi_disable \
				./usr/lib/telegramopenwrt/plugins/help/proxy_enable \
				./usr/lib/telegramopenwrt/plugins/help/wifi_restart \
				./usr/lib/telegramopenwrt/plugins/help/proc_restart \
				./usr/lib/telegramopenwrt/plugins/help/reboot \
				./usr/lib/telegramopenwrt/plugins/help/proxy_disable \
				./usr/lib/telegramopenwrt/plugins/help/wifi_enable \
				./usr/lib/telegramopenwrt/plugins/help/get_ip \
				./usr/lib/telegramopenwrt/plugins/help/cam_shot \
				./usr/lib/telegramopenwrt/plugins/help/cam_movie \
				./usr/lib/telegramopenwrt/plugins/help/get_ping \
				./usr/lib/telegramopenwrt/plugins/help/fw_list \
				./usr/lib/telegramopenwrt/plugins/help/chromego_add \
				./usr/lib/telegramopenwrt/plugins/help/proc_start \
				./usr/lib/telegramopenwrt/plugins/help/ignoredmac_add \
				./usr/lib/telegramopenwrt/plugins/help/chromego_del \
				./usr/lib/telegramopenwrt/plugins/help/fw_enable \
				./usr/lib/telegramopenwrt/plugins/help/hst_list \
				./usr/lib/telegramopenwrt/plugins/help/netstat \
		$(1)/usr/lib/telegramopenwrt/plugins/help

	$(INSTALL_DIR) $(1)/usr/lib/telegramopenwrt/plugins
	$(INSTALL_BIN) ./usr/lib/telegramopenwrt/plugins/cam_mv \
				./usr/lib/telegramopenwrt/plugins/fw_unblock \
				./usr/lib/telegramopenwrt/plugins/fw_add \
				./usr/lib/telegramopenwrt/plugins/cam_vdo \
				./usr/lib/telegramopenwrt/plugins/fwr_disable \
				./usr/lib/telegramopenwrt/plugins/msg_tv \
				./usr/lib/telegramopenwrt/plugins/wifi_list \
				./usr/lib/telegramopenwrt/plugins/swports_list \
				./usr/lib/telegramopenwrt/plugins/fwr_list \
				./usr/lib/telegramopenwrt/plugins/fw_delete \
				./usr/lib/telegramopenwrt/plugins/chromego_list \
				./usr/lib/telegramopenwrt/plugins/get_mac \
				./usr/lib/telegramopenwrt/plugins/proc_stop \
				./usr/lib/telegramopenwrt/plugins/proc_list \
				./usr/lib/telegramopenwrt/plugins/proxy_list \
				./usr/lib/telegramopenwrt/plugins/get_uptime \
				./usr/lib/telegramopenwrt/plugins/fwr_enable \
				./usr/lib/telegramopenwrt/plugins/wll_list \
				./usr/lib/telegramopenwrt/plugins/start \
				./usr/lib/telegramopenwrt/plugins/ignoredmac_list \
				./usr/lib/telegramopenwrt/plugins/fw_disable \
				./usr/lib/telegramopenwrt/plugins/lights \
				./usr/lib/telegramopenwrt/plugins/wifi_disable \
				./usr/lib/telegramopenwrt/plugins/proxy_enable \
				./usr/lib/telegramopenwrt/plugins/wifi_restart \
				./usr/lib/telegramopenwrt/plugins/proc_restart \
				./usr/lib/telegramopenwrt/plugins/reboot \
				./usr/lib/telegramopenwrt/plugins/proxy_disable \
				./usr/lib/telegramopenwrt/plugins/wifi_enable \
				./usr/lib/telegramopenwrt/plugins/get_ip \
				./usr/lib/telegramopenwrt/plugins/cam_shot \
				./usr/lib/telegramopenwrt/plugins/cam_movie \
				./usr/lib/telegramopenwrt/plugins/get_ping \
				./usr/lib/telegramopenwrt/plugins/fw_list \
				./usr/lib/telegramopenwrt/plugins/chromego_add \
				./usr/lib/telegramopenwrt/plugins/proc_start \
				./usr/lib/telegramopenwrt/plugins/ignoredmac_add \
				./usr/lib/telegramopenwrt/plugins/chromego_del \
				./usr/lib/telegramopenwrt/plugins/fw_enable \
				./usr/lib/telegramopenwrt/plugins/hst_list \
				./usr/lib/telegramopenwrt/plugins/netstat \
		$(1)/usr/lib/telegramopenwrt/plugins

	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./sbin/telebot \
				./sbin/camkeyboard \
				./sbin/telegram_bot \
				./sbin/telekeyboard \
				./sbin/hosts_scan \
				./sbin/proxy \
				./sbin/typing \
				./sbin/telegram_sender \
				./sbin/lanports \
		$(1)/sbin/
endef

define Package/telegram-openwrt/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot enabled
	/etc/init.d/lanports enabled
	/etc/init.d/hosts_scan enabled
	/etc/init.d/telegram_bot start
	/etc/init.d/lanports start
	/etc/init.d/hosts_scan start
fi
exit 0
endef

define Package/telegram-openwrt/prerm
#!/bin/sh
if [ -n "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot stop
	/etc/init.d/lanports stop
	/etc/init.d/hosts_scan stop
	/etc/init.d/telegram_bot disable
	/etc/init.d/lanports disable
	/etc/init.d/hosts_scan disable
fi
exit 0
endef

$(eval $(call BuildPackage,telegram-openwrt))
