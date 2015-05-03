FROM devopsbq/debian78_leofs_builder:1.2.8.consul

MAINTAINER Ops@bq <devops@bq.com>

ENV CONF_CONSUL localhost:8500

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

COPY gateway.toml /etc/confd/conf.d/gateway.toml
COPY leo_gateway.tmpl /etc/confd/templates/leo_gateway.tmpl
COPY start.sh /opt/start.sh
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 2049:2049
EXPOSE 4000:4000
EXPOSE 4369:4369
EXPOSE 8080:8080
EXPOSE 8443:8443
EXPOSE 22050:22050

RUN chmod 755 /opt/start.sh

CMD ["/opt/start.sh"]
