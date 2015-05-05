FROM devopsbq/base:1.0
MAINTAINER Ops@bq <devops@bq.com>

ENV CONF_CONSUL localhost:8500

RUN gem install bundler && \
  mkdir /opt/leofs/ && \
  cd /opt/leofs/ && \
  git clone https://github.com/leo-project/leo_center.git && \
  cd leo_center && \
  git checkout -b 0.4.7 && \
  bundle install && \
  mv thin.yml.sample thin.yml && \
  mkdir -p /opt/confd && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates && \
  cd /opt/confd && \
  wget https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 && \
  mv /opt/confd/confd-0.9.0-linux-amd64 /opt/confd/confd && \
  chmod 755 /opt/confd/confd

COPY center_master.toml /etc/confd/conf.d/center_master.toml
COPY leo_center_master.tmpl /etc/confd/templates/leo_center_master.tmpl
COPY start.sh /opt/start.sh

RUN chmod 755 /opt/start.sh

EXPOSE 9000

CMD ["/opt/start.sh"]
