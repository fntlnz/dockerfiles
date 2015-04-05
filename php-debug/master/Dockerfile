# PHP Debug
# @version Last commit from master
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos7

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

# Prerequisites
RUN yum install -y install gcc gcc-c++ make wget tar libxml2-devel readline-devel autoconf openssl-devel libcurl-devel re2c bison

WORKDIR /tmp

# Download PHP and extract
RUN wget -nv -O - https://github.com/php/php-src/archive/master.tar.gz | tar zx

WORKDIR /tmp/php-src-master

RUN ./buildconf --force
RUN ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ --enable-debug --enable-maintainer-zts --enable-cli --with-readline --with-curl=/usr/bin/curl --with-openssl --libdir=/usr/lib64 --with-libdir=lib64

RUN make -j
RUN make test
RUN make install

RUN ln -s /usr/local/php/bin/* /usr/local/bin

RUN rm -Rf /tmp/php-src-master

VOLUME ["/usr/local/php/etc"]

WORKDIR /
