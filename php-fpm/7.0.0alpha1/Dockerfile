# PHP-FPM
# @version 7.0.0alpha1
# @author Lorenzo Fontana <fontanalorenzo@me.com>
FROM centos:centos7

MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com

#Prerequisites
RUN yum install gcc gcc-c++ kernel-devel libxml2-devel libxslt-devel openssl-devel libcurl-devel libicu-devel readline-devel bzip2-devel tar wget make autoconf re2c bison -y

WORKDIR /tmp

# Download PHP and extract
RUN wget -nv -O - https://github.com/php/php-src/archive/php-7.0.0alpha1.tar.gz | tar zx

WORKDIR /tmp/php-src-php-7.0.0alpha1

RUN rm -f configure

RUN ./buildconf --force

RUN ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ --disable-cgi --without-pear --without-sqlite3 --with-zlib --without-pdo-sqlite --with-curl=/usr/bin/curl --with-openssl --libdir=/usr/lib64 --with-libdir=lib64 --enable-opcache --enable-fileinfo --enable-mbstring --with-readline --enable-fpm --enable-intl --enable-zip --with-pdo-mysql --with-mysqli

RUN make
RUN make install
RUN make test

RUN useradd fpm

RUN rm -Rf /tmp/php-src-php-7.0.0alpha1

RUN ln -s /usr/local/php/bin/* /usr/local/bin
WORKDIR /
VOLUME ["/usr/local/php/etc"]
ENTRYPOINT ["/usr/local/php/sbin/php-fpm"]
CMD ["-F"]
