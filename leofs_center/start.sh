#!/bin/bash
/opt/confd/confd -backend consul -confdir /etc/confd -node=$CONF_CONSUL &

cd /opt/leofs/leo_center/
thin start -l stdout -C thin.yml
