# Telegram Scripts for OpenWrt

This is a set of scripts with a plugins API written in bash, you can use it to manage and get informations on OpenWRT Routers.

### How its works ?

First of all, 
Make a bot for you !
https://core.telegram.org/bots/api#authorizing-your-bot

With the bot created, you need to replace "[PUT YOUR BOT KEY HERE]" in variables  file with your bot key.

Second, you need to send a initial message to your bot in Telegram App.
After you send the message, in the OpenWRT run this:

``` curl -s -k -X GET https://api.telegram.org/bot<YOUR BOT ID>/getUpdates | grep -oE "\"id\":[[:digit:]]+" | head -n1 | awk -F : '{print $2}'```

Get the number and replace "[PUT ID OF THE CHAT THAT YOU START WITH BOT]" in the telegramopenwrt config.

### Directory structure

```
├── etc
│   ├── config
│   │   └── telegramopenwrt
│   └── init.d
│       ├── hosts_scan
│       ├── lanports
│       └── telegram_bot
├── LICENSE
├── README.md
├── sbin
│   ├── camkeyboard
│   ├── hosts_scan
│   ├── lanports
│   ├── proxy
│   ├── telebot
│   ├── telegram_bot
│   ├── telegram_sender
│   ├── telekeyboard
│   └── typing
└── usr
    └── lib
        └── telegramopenwrt
            └── plugins
                ├── actions
                │   ├── cam_mv
                │   ├── fw_delete
                │   ├── fw_disable
                │   ├── fw_enable
                │   ├── fwr_disable
                │   ├── fwr_enable
                │   ├── light_control
                │   ├── proc_restart
                │   ├── proc_start
                │   ├── proc_stop
                │   ├── proxy_disable
                │   ├── proxy_enable
                │   ├── wifi_disable
                │   ├── wifi_enable
                │   └── wifi_restart
                ├── cam_movie
                ├── cam_mv
                ├── cam_shot
                ├── cam_vdo
                ├── ctx
                │   ├── cam_kbd
                │   ├── fw_list
                │   ├── fwr_list
                │   ├── light_list
                │   ├── proxy
                │   ├── reboot
                │   ├── service_list
                │   └── wifi_list
                ├── fw_add
                ├── fw_delete
                ├── fw_disable
                ├── fw_enable
                ├── fw_list
                ├── fwr_disable
                ├── fwr_enable
                ├── fwr_list
                ├── fw_unblock
                ├── get_ip
                ├── get_mac
                ├── get_ping
                ├── get_uptime
                ├── help
                │   ├── cam_movie
                │   ├── cam_mv
                │   ├── cam_shot
                │   ├── cam_vdo
                │   ├── fw_add
                │   ├── fw_delete
                │   ├── fw_disable
                │   ├── fw_enable
                │   ├── fw_list
                │   ├── fwr_disable
                │   ├── fwr_enable
                │   ├── fwr_list
                │   ├── fw_unblock
                │   ├── get_ip
                │   ├── get_mac
                │   ├── get_ping
                │   ├── get_uptime
                │   ├── hst_list
                │   ├── lights
                │   ├── msg_tv
                │   ├── netstat
                │   ├── proc_list
                │   ├── proc_restart
                │   ├── proc_start
                │   ├── proc_stop
                │   ├── proxy_disable
                │   ├── proxy_enable
                │   ├── proxy_list
                │   ├── reboot
                │   ├── start
                │   ├── swports_list
                │   ├── wifi_disable
                │   ├── wifi_enable
                │   ├── wifi_list
                │   ├── wifi_restart
                │   └── wll_list
                ├── hst_list
                ├── lights
                ├── msg_tv
                ├── netstat
                ├── proc_list
                ├── proc_restart
                ├── proc_start
                ├── proc_stop
                ├── proxy_disable
                ├── proxy_enable
                ├── proxy_list
                ├── reboot
                ├── start
                ├── swports_list
                ├── wifi_disable
                ├── wifi_enable
                ├── wifi_list
                ├── wifi_restart
                └── wll_list

11 directories, 110 files
```
#### lanports file

This file reads the router logs with the logread -f command, and sends messages via bot telegram if a router port is turned off / on or the router delivers an IP address via DHCP.

#### init.d directory

Contains the necessary files for the scripts to be started at the router boot, just move them to the /etc/init.d/ of the router and run:
/etc/init.d/lanports enable
/etc/init.d/telegram_bot enable

And then:

/etc/init.d/lanports start
/etc/init.d/telegram_bot start

#### plugins directory

This is the main directory, it contains all the commands that the telegram bot can execute.

There are some pre-built commands, which are:

* cam_movie: Record 25 seconds of a camIP and send it.
* cam_mv: Move the camera arround.
* cam_shot: Get a Pic from the camera.
* cam_vdo: Get a 25 seconds record from a camIP.
* fw_add: Block a hostname using a deny rule in firewall, if append time to command will block from 23:00 to 8:00
* fw_delete: Remove a hostname from a deny firewall rule, if hostname is empty, will remove all rules created by this bot.
* fw_disable: Disable a firewall rule.
* fw_enable: Enable a firewall rule.
* fw_list: List all fw rules.
* fwr_disable: Disable a redirect firewall rule.
* fwr_enable: Enable a redirect firewall rule.
* fwr_list: List all redirect fw rules.
* fw_unblock: Remove a hostname from a deny firewall rule, if hostname is empty, will remove all rules created by this bot.
* get_ip: Get WAN IPAddress.
* get_mac: Get the Organization that onwer the MacAddr.
* get_ping: Ping a address or host, return Up or Down.
* get_uptime: Return the uptime from this Device.
* hst_list: Get hosts in the dhcp Leases. If a hostname is present, search only for this hostname.
* lights: Turn On or Off house Lights.
* msg_tv: Send Message to Samsung TV
* netstat: Prints netstat table in ESTABLISHED, CLOSED and TIME\_WAIT State.
* proc_list: List all process in execution 
* proc_restart: Restart a process in init.d
* proc_start: Start a process in init.d
* proc_stop: Stop a process in init.d
* proxy_disable: Disable HTTP and HTTPS or HTTP or HTTPS proxy. 
* proxy_enable: Enable HTTP and HTTPS or HTTP or HTTPS proxy. 
* proxy_list: List proxy rules that is enabled.
* reboot: Reboot the router.
* start: This menu help!
* swports_list: Switch ports list with states.
* wifi_disable: Disable a wireless device radio.
* wifi_enable: Enable a wireless device radio.
* wifi_list: List all wireless devices.
* wifi_restart: Restart a wireless device radio.
* wll_list: Get a wifi clients list that is connected to this devices.


#### help directory inside plugins

This is the directory containing the help files, with the same name as the command, to be displayed by the start command.

#### telebot file

This file sends the telegram bot messages generated by lanports


#### telegram_bot

The telegram_bot script is a loop that receives the updates every second and checks to see if there is a command to execute. If there is a command, the script checks to see if there is a file with the same name as the command inside the plugins directory and runs it, if it exists. The output of the executed script is sent as a response message from the command.
Inside the plugins directory, there is the special command "start", which returns a message with the commands and a brief help on each command.
For this command to work properly, you need to create a file inside the plugins / help directory, with the name equal to the command.


