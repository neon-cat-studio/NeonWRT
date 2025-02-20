#!/bin/sh

. /usr/share/libubox/jshn.sh
. /usr/share/wginstaller/wg_functions.sh

case "$1" in
list)
	cmd='{ "get_usage": {},'
	cmd=$(echo "$cmd" ' "register": {"mtu":"1400", "public_key": "xyz"} }')
	echo "$cmd"
	;;
call)
	case "$2" in
	get_usage)
		read -r input
		logger -t "wginstaller" "call" "$2" "$input"
		wg_get_usage
		;;
	register)
		read -r input
		logger -t "wginstaller" "call" "$2" "$input"

		json_load "$input"
		json_get_var mtu mtu
		json_get_var public_key public_key

		wg_register "$uplink_bw" "$mtu" "$public_key"
		;;
	esac
	;;
esac
