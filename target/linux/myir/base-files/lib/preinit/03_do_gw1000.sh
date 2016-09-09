#!/bin/sh

do_gw1000() {
	echo "do_gw1000"
	. /lib/gw1000.sh
}

boot_hook_add preinit_main do_gw1000
