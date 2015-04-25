#!/bin/bash

/opt/confd/confd -onetime -backend env -confdir /etc/confd
$LEOFS_PATH/leo_manager_1/bin/leo_manager start
