#!/bin/bash

export CONF_STORAGE_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_STORAGE_NAME=$(hostname)

/opt/confd/confd -backend consul -confdir /etc/confd -node $CONF_CONSUL

$LEOFS_PATH/leo_storage/bin/leo_storage start
