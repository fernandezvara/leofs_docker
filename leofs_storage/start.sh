#!/bin/bash

#export CONF_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_IP=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

export CONF_STORAGE_NAME=$(hostname)

/usr/local/bin/supervisord
