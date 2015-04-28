#!/bin/bash

export CONF_GATEWAY_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_GATEWAY_NAME=$(hostname)

/opt/confd/confd -backend consul -confdir /etc/confd -node $CONF_CONSUL

$LEOFS_PATH/leo_gateway/bin/leo_gateway start
