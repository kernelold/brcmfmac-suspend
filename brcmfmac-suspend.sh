#!/bin/sh
PATH=/sbin:/usr/sbin:/bin:/usr/bin
LOG="/var/log/brcmfmac-suspend.log"
case "$1" in
    pre)
	dev="$(find /sys/bus/pci/drivers/brcmfmac/ | awk -F/ '{print $NF}' | grep -P '^[0-9a-f:.]+$')"
	rfkillpath="$(find "/sys/bus/pci/devices/$dev/ieee80211/" | grep -P '/phy\d+/rfkill\d+/soft$')"
        echo 0 > "/sys/bus/pci/devices/$dev/d3cold_allowed"
	echo 1 > "$rfkillpath" && echo "RF block brcmfmac $rfkillpath" >> "$LOG"
    ;;
    post)
	dev="$(find /sys/bus/pci/drivers/brcmfmac/ | awk -F/ '{print $NF}' | grep -P '^[0-9a-f:.]+$')"
	rfkillpath="$(find "/sys/bus/pci/devices/$dev/ieee80211/" | grep -P '/phy\d+/rfkill\d+/soft$')"
	echo 0 > "$rfkillpath" && echo "RF unblock brcmfmac $rfkillpath" >> "$LOG"
    ;;
esac
exit 0
