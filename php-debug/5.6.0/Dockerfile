# PHP Debug
# @version 5.6.0
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos6

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

# Prerequisites
RUN yum install -y install gcc gcc-c++ make wget tar libxml2-devel readline-devel autoconf openssl-devel libcurl-devel

# Download PHP and extract
RUN wget -nv -O - http://uk1.php.net/distributions/php-5.6.0.tar.gz | tar zx

WORKDIR php-5.6.0

RUN ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ --enable-debug --enable-maintainer-zts --enable-cli --with-readline --with-curl=/usr/bin/curl --with-openssl --libdir=/usr/lib64 --with-libdir=lib64

RUN make -j
RUN make test
RUN make install

RUN ln -s /usr/local/php/bin/* /usr/local/bin

VOLUME ["/usr/local/php/etc"]

WORKDIR /
