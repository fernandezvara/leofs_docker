#!/bin/bash

#export CONF_IP=$(/sbin/ip route|awk '/default/ { print $3}')
export CONF_IP=$(/sbin/ip -o -4 addr list eth1 | awk '{print $4}' | cut -d/ -f1)

/opt/consulkv/consulkv set "leofs/manager/master_ip"           $CONF_IP
/opt/consulkv/consulkv set "leofs/manager/num_replicas"        $CONF_NUM_REPLICAS
/opt/consulkv/consulkv set "leofs/manager/read"                $CONF_READ
/opt/consulkv/consulkv set "leofs/manager/write"               $CONF_WRITE
/opt/consulkv/consulkv set "leofs/manager/delete"              $CONF_DELETE
/opt/consulkv/consulkv set "leofs/manager/rack_aware_replicas" $CONF_RACK_AWARE_REPLICAS
/opt/consulkv/consulkv set "leofs/manager/mnesia_dir"          $CONF_MNESIA_DIR
/opt/consulkv/consulkv set "leofs/manager/master_log_level"    $CONF_LOG_LEVEL
/opt/consulkv/consulkv set "leofs/manager/dc_id"               $CONF_DC_ID
/opt/consulkv/consulkv set "leofs/manager/cluster_id"          $CONF_CLUSTER_ID

/opt/consulkv/consulkv set "leofs/distributed_cookie"          $CONF_DISTRIBUTED_COOKIE

# configure sshd
sed -i 's/Port 22/Port 50022/' /etc/ssh/sshd_config
sed -i "s/#ListenAddress 0.0.0.0/ListenAddress ${CONF_IP}/" /etc/ssh/sshd_config
echo "root:${CONF_LEOFS_USER_PASSWORD}" | chpasswd

/usr/local/bin/supervisord
