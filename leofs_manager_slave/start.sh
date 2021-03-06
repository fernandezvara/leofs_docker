#!/bin/bash

#export CONF_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_IP=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

/opt/consulkv/consulkv set "leofs/manager/slave_log_level" $CONF_LOG_LEVEL
/opt/consulkv/consulkv set "leofs/manager/slave_ip" $CONF_IP

# configure sshd
sed -i 's/Port 22/Port 50023/' /etc/ssh/sshd_config
sed -i "s/#ListenAddress 0.0.0.0/ListenAddress ${CONF_IP}/" /etc/ssh/sshd_config
echo "root:${CONF_LEOFS_USER_PASSWORD}" | chpasswd

/usr/local/bin/supervisord
