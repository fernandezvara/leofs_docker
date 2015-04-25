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
  cp -r package /opt/leofs && \
  rm -rf /tmp/* && \
  mkdir /opt/leofs/leo_manager_0/work/mnesia/127.0.0.1


#./leofs-adm create-user elfary
#  access-key-id: 2e6acebaa58d7426163d
#  secret-access-key: 02643cfa2253b25288b07ac8e5f05fb4acddc6d7
