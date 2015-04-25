FROM devopsbq/debian78_leofs_builder:1.2.8

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH
ENV LEOFS_PATH /opt/leofs

# Basic configuration
ENV CONF_GATEWAY_NAME gateway_0
ENV CONF_GATEWAY_IP 127.0.0.1
ENV CONF_GATEWAY_PROTOCOL s3

# TCP/IP Ports
ENV CONF_GATEWAY_HTTP_PORT 8080
ENV CONF_GATEWAT_NFS_MOUNTD_PORT 22050
ENV CONF_GATEWAT_NFS_NFSD_PORT 2049

# Object Length
ENV CONF_GATEWAY_CHUNCKED_OBJ_LEN 5242880
# ENV CONF_GATEWAY_CHUNCKED_OBJ_LEN 1048576 # use this configuration if protocol==NFS

ENV CONF_LOG_LEVEL 1
ENV CONF_DISTRIBUTED_COOKIE 401321b4
ENV CONF_MANAGER_MASTER_IP 127.0.0.1
ENV CONF_MANAGER_SLAVE_IP 127.0.0.1

COPY gateway.toml /etc/confd/conf.d/gateway.toml
COPY leo_gateway.tmpl /etc/confd/templates/leo_gateway.tmpl
COPY start.sh /opt/start.sh

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
