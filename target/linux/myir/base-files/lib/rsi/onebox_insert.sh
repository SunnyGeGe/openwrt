
cat /dev/null > /var/log/messages
insmod /lib/modules/4.1.18/onebox_common_gpl.ko

insmod /lib/modules/4.1.18/wlan.ko
insmod /lib/modules/4.1.18/wlan_wep.ko
insmod /lib/modules/4.1.18/wlan_tkip.ko
insmod /lib/modules/4.1.18/wlan_ccmp.ko
insmod /lib/modules/4.1.18/wlan_acl.ko
insmod /lib/modules/4.1.18/wlan_xauth.ko
insmod /lib/modules/4.1.18/wlan_scan_sta.ko
insmod /lib/modules/4.1.18/onebox_wlan_nongpl.ko
insmod /lib/modules/4.1.18/onebox_wlan_gpl.ko

#Power_mode type
# 0 - HIGH  POWER MODE
# 1 - MEDIUM POWER MODE 
# 2 - LOW POWER MODE
BT_RF_TX_POWER_MODE=0
BT_RF_RX_POWER_MODE=0

PARAMS=$PARAMS" bt_rf_tx_power_mode=$BT_RF_TX_POWER_MODE"
PARAMS=$PARAMS" bt_rf_rx_power_mode=$BT_RF_RX_POWER_MODE"

#insmod onebox_bt_nongpl.ko $PARAMS 
#insmod onebox_bt_gpl.ko

#insmod onebox_zigb_nongpl.ko
#insmod onebox_zigb_gpl.ko

sh common_insert.sh
