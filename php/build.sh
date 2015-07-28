#!/usr/bin/env bash

tmp_path=/tmp/dockerfiles-tmp
image_name=
image_versions="5.4.43 5.5.16 5.5.27 5.6.6 5.6.7 5.6.8 5.6.9 5.6.10 5.6.11 7.0.0alpha1 7.0.0alpha2 7.0.0beta1 7.0.0beta2"

read -r -d '' dockerfile_template << EOM
FROM centos:centos7\n
MAINTAINER Lorenzo Fontana, fontanalorenzo@me.com\n

WORKDIR /tmp\n

RUN yum update -y \
    && yum install gcc gcc-c++ kernel-devel libxml2-devel postgresql-devel openssl-devel libcurl-devel libicu-devel readline-devel bzip2-devel tar wget make autoconf re2c bison -y \
    && wget -nv -O - https://github.com/php/php-src/archive/php-VERSION.tar.gz | tar zx \
    && cd /tmp/php-src-php-VERSION \
    && rm -f configure \
    && ./buildconf --force \
    && ./configure --enable-static --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ \
    --disable-cgi --without-pear --with-sqlite3 --with-zlib --with-curl=/usr/bin/curl \
    --with-openssl --libdir=/usr/lib64 --with-libdir=lib64 --enable-opcache --enable-fileinfo --enable-mbstring \
    --with-readline --enable-zip --with-pdo-mysql --with-pdo-pgsql --with-mysqli --with-pdo-sqlite \
    --enable-sockets --enable-fpm --enable-intl \
    && make \
    && make install \
    && rm -Rf /tmp/php-src-php-VERSION \
    && ln -s /usr/local/php/bin/* /usr/local/bin \
    && ln -s /usr/local/php/sbin/* /usr/local/sbin \
    && yum remove kerne-devel libxml2-devel postgresql-devel openssl-devel libcurl-devel libicu-devel readline-devel bzip2-devel -y \
    && yum clean all\n

WORKDIR /\n
VOLUME ["/usr/local/php/etc"]\n
EOM

mkdir -p $tmp_path

for version in $image_versions
do
    dockerfile_path=${tmp_path}/${image_name}-${version}
    echo -e $dockerfile_template | m4 -D VERSION=$version > $dockerfile_path
    docker build -t fntlnz/${image_name}:${version} -f $dockerfile_path $tmp_path
    rm $dockerfile_path
done