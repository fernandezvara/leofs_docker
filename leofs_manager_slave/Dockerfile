FROM devopsbq/debian78_leofs_builder:1.2.8.consul

MAINTAINER Ops@bq <devops@bq.com>

ENV CONF_CONSUL localhost:8500

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs

ENV CONF_LOG_LEVEL 1

ENV CONF_LEOFS_USER_PASSWORD password

COPY manager_slave.toml /etc/confd/conf.d/manager_slave.toml
COPY leo_manager_slave.tmpl /etc/confd/templates/leo_manager_slave.tmpl
COPY start.sh /opt/start.sh
COPY supervisord.conf /etc/supervisord.conf

RUN apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 4021:4021
EXPOSE 4369:4369
EXPOSE 10011:10011
EXPOSE 10021:10021
EXPOSE 50022:50022

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
