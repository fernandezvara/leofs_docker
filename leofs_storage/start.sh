#!/bin/bash

export CONF_STORAGE_IP=$(/sbin/ip route|awk '/default/ { print $3}')
/opt/confd/confd -onetime -backend env -confdir /etc/confd
$LEOFS_PATH/leo_storage/bin/leo_storage start
