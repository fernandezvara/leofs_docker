FROM devopsbq/debian78_leofs_builder:1.2.8.consul

MAINTAINER Ops@bq <devops@bq.com>

ENV CONF_CONSUL localhost:8500

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs

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

ENV CONF_LEOFS_USER_PASSWORD password

RUN apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY manager_master.toml /etc/confd/conf.d/manager_master.toml
COPY leo_manager_master.tmpl /etc/confd/templates/leo_manager_master.tmpl
COPY start.sh /opt/start.sh
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 50022:50022
EXPOSE 4020:4020
EXPOSE 4369:4369
EXPOSE 10010:10010
EXPOSE 10020:10020

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
