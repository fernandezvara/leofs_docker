#!/bin/bash

#export CONF_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_IP=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)
export CONF_GATEWAY_NAME=$(hostname)

# configure sshd
sed -i 's/Port 22/Port 50025/' /etc/ssh/sshd_config
sed -i "s/#ListenAddress 0.0.0.0/ListenAddress ${CONF_IP}/" /etc/ssh/sshd_config
echo "root:${CONF_LEOFS_USER_PASSWORD}" | chpasswd

/usr/local/bin/supervisord
