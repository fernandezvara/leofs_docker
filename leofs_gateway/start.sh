#!/bin/bash

export CONF_GATEWAY_IP=$(/sbin/ip route|awk '/default/ { print $3}')
/opt/confd/confd -onetime -backend env -confdir /etc/confd
$LEOFS_PATH/leo_gateway/bin/leo_gateway start
