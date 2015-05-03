#!/bin/bash

#export CONF_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_IP=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

/opt/consulkv/consulkv set "leofs/manager/slave_log_level" $CONF_LOG_LEVEL
/opt/consulkv/consulkv set "leofs/manager/slave_ip" $CONF_IP

/usr/local/bin/supervisord
