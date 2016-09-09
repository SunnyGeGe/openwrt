#!/bin/sh
#
# Copyright (C) 2016 myirtech.com
#
#


gw1000_board_name() {
	local name

	[ -f /tmp/sysinfo/board_name ] && name=$(cat /tmp/sysinfo/board_name)
	[ -n "$name" ] || name="unknown"

	echo $name
}
