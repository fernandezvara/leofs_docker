FROM devopsbq/debian78_erlang:17.4

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH

RUN apt-get update && \
  apt-get install -y git netcat-openbsd && \
  git config --global url."https://github".insteadOf git://github && \
  cd /tmp && \
  git clone https://github.com/leo-project/leofs.git && \
  cd /tmp/leofs && \
  git checkout -b 1.2.8 && \
  make && \
  make release && \
  mkdir /opt/leofs && \
  cp -r package/* /opt/leofs && \
  rm -rf /tmp/* && \
  mkdir -p /opt/leofs/leo_manager_0/work/mnesia/127.0.0.1 && \
  mkdir -p /opt/confd && \
  cd /opt/confd && \
  wget https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 && \
  mv /opt/confd/confd-0.9.0-linux-amd64 /opt/confd/confd && \
  chmod 755 /opt/confd/confd && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates
