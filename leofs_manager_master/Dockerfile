FROM devopsbq/debian78_leofs_builder:1.2.8

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs/package

ENV CONF_NUM_REPLICAS 1
ENV CONF_READ 1
ENV CONF_WRITE 1
ENV CONF_DELETE 1
ENV CONF_RACK_AWARE_REPLICAS 0
ENV CONF_MNESIA_DIR ./work/mnesia/127.0.0.1
ENV CONF_LOG_LEVEL 1

ENV CONF_DC_ID dc_1
ENV CONF_CLUSTER_ID leofs_1
ENV CONF_DISTRIBUTED_COOKIE 401321b4
ENV CONF_MANAGER_MASTER_IP 127.0.0.1
ENV CONF_MANAGER_SLAVE_IP 127.0.0.1

COPY manager_master.toml /etc/confd/conf.d/manager_master.toml
COPY leo_manager_master.tmpl /etc/confd/templates/leo_manager_master.tmpl

RUN /opt/confd/confd -onetime -backend env -confdir /etc/confd && \
  $LEOFS_PATH/leo_manager_0/bin/leo_manager start
