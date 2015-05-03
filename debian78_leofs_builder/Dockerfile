FROM devopsbq/debian78_erlang:17.4

MAINTAINER Ops@bq <devops@bq.com>

ENV PATH /usr/local/erlang/17.4/bin:$PATH

RUN apt-get update && \
  apt-get install -y git netcat-openbsd python && \
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
  mkdir -p /opt/consulkv && \
  mkdir -p /etc/confd/conf.d && \
  mkdir -p /etc/confd/templates && \
  mkdir -p /etc/supervisord/conf.d && \
  mkdir -p /var/log/supervisor && \
  cd /opt/confd && \
  wget https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 && \
  mv /opt/confd/confd-0.9.0-linux-amd64 /opt/confd/confd && \
  chmod 755 /opt/confd/confd && \
  cd /opt/consulkv && \
  wget https://github.com/fernandezvara/consulkv/releases/download/v0.1/consulkv_linux_amd64_0.1 && \
  mv /opt/consulkv/consulkv_linux_amd64_0.1 /opt/consulkv/consulkv && \
  chmod 755 /opt/consulkv/consulkv && \
  wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
  easy_install supervisor
