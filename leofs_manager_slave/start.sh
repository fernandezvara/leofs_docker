#!/bin/bash

export CONF_MANAGER_SLAVE_IP=$(/sbin/ip route|awk '/default/ { print $3}')

/opt/consulkv/consulkv set "/leofs/manager/slave_log_level" $CONF_LOG_LEVEL
/opt/consulkv/consulkv set "/leofs/manager/slave_ip" $CONF_MANAGER_SLAVE_IP

/opt/confd/confd -backend consul -confdir /etc/confd -node $CONF_CONSUL

$LEOFS_PATH/leo_manager_1/bin/leo_manager start
