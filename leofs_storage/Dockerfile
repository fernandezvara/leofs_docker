FROM devopsbq/debian78_leofs_builder:1.2.8.consul

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs

# Basic configuration
ENV CONF_STORAGE_NAME $HOST
ENV CONF_IP 127.0.0.1

ENV CONF_LOG_LEVEL 1
ENV CONF_DISTRIBUTED_COOKIE 401321b4
ENV CONF_MANAGER_MASTER_IP 127.0.0.1
ENV CONF_MANAGER_SLAVE_IP 127.0.0.1

ENV CONF_LEOFS_USER_PASSWORD password

COPY storage.toml /etc/confd/conf.d/storage.toml
COPY leo_storage.tmpl /etc/confd/templates/leo_storage.tmpl
COPY start.sh /opt/start.sh
COPY supervisord.conf /etc/supervisord.conf

RUN apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 4010:4010
EXPOSE 4369:4369
EXPOSE 50024:50024

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
