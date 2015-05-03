FROM devopsbq/debian78_leofs_builder:1.2.8.consul

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs

# Basic configuration
ENV CONF_STORAGE_NAME $HOST
ENV CONF_STORAGE_IP 127.0.0.1

ENV CONF_LOG_LEVEL 1
ENV CONF_DISTRIBUTED_COOKIE 401321b4
ENV CONF_MANAGER_MASTER_IP 127.0.0.1
ENV CONF_MANAGER_SLAVE_IP 127.0.0.1

COPY storage.toml /etc/confd/conf.d/storage.toml
COPY leo_storage.tmpl /etc/confd/templates/leo_storage.tmpl
COPY start.sh /opt/start.sh
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 4010:4010
EXPOSE 4369:4369

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
