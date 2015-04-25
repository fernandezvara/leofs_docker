FROM debian:7.8

MAINTAINER Ops@bq <devops@bq.com>

RUN apt-get update && \
  apt-get install -y build-essential libtool libncurses5-dev libssl-dev cmake check wget && \
  cd /tmp && \
  wget http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-7.4.2.tar.gz && \
  tar xzvf libatomic_ops-7.4.2.tar.gz && \
  cd /tmp/libatomic_ops-7.4.2 && \
  ./configure --prefix=/usr/local && \
  make && \
  make install && \
  cd /tmp && \
  wget http://www.erlang.org/download/otp_src_17.4.tar.gz && \
  tar zxzf otp_src_17.4.tar.gz && \
  cd /tmp/otp_src_17.4 && \
  ./configure --prefix=/usr/local/erlang/17.4 \
              --enable-smp-support \
              --enable-m64-build \
              --enable-halfword-emulator \
              --enable-kernel-poll \
              --without-javac \
              --disable-native-libs \
              --disable-hipe \
              --disable-sctp \
              --enable-threads \
              --with-libatomic_ops=/usr/local && \
  make && \
  make install && \
  apt-get clean && \
  rm -rf /tmp/libatomic_ops-7.4.2 && \
  rm -rf /tmp/otp_src_17.4
