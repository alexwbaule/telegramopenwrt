# Telegram Scripts for OpenWrt

This is a set of scripts with a plugins API written in bash, you can use it to manage and get informations on OpenWRT Routers.

### How its works ?

Make a bot for you !
https://core.telegram.org/bots/api#authorizing-your-bot

First, you need to replace "[PUT YOUR BOT KEY HERE]" in telebot and telegram_bot file with your bot key.
Second, you need to send a initial message to your bot in Telegram App.
After you send the message, in the OpenWRT run this:

``` curl -s -k -X GET https://api.telegram.org/bot<YOUR BOT ID>/getUpdates | grep -oE "\"id\":[[:digit:]]+" | head -n1 | awk -F : '{print $2}'```

Get the number and replace "[PUT ID OF THE CHAT THAT YOU START WITH BOT]" in the telebot file.

### Directory structure

```
+--- LICENSE
+--- README.md
+--- init.d/
	+--- lanports
	+--- telegram_bot
+--- lanports
+--- plugins/
	+--- block
	+--- fwlist
	+--- gethosts
	+--- getip
	+--- help/
		+--- block
		+--- fwlist
		+--- gethosts
		+--- getip
		+--- getwifi
		+--- start
		+--- unblock
		+--- wifilist
	+--- start
	+--- unblock
	+--- wifilist
+--- telebot
+--- telegram_bot
```
