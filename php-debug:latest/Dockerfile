# PHP Debug
# @version 5.5.15
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos6

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

# Prerequisites
RUN yum install -y install gcc gcc-c++ make wget tar libxml2-devel readline-devel autoconf

# Download PHP and extract
RUN wget -nv -O - http://uk1.php.net/distributions/php-5.5.15.tar.gz | tar zx

WORKDIR php-5.5.15

RUN ./configure --prefix=/usr/local/php --enable-debug --enable-maintainer-zts --enable-cli --with-readline

RUN make -j
RUN make install

RUN ln -s /usr/local/php/bin/* /usr/local/bin


VOLUME ["/usr/local/php/etc"]

WORKDIR /
