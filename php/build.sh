#!/usr/bin/env bash
source "$(dirname "$0")/../utils/utils.sh"

template_path=$(dirname "$0")/Dockerfile
tmp_path=/tmp/dockerfiles-php-tmp
vendor_name=fntlnz
image_name=php
available_versions="5.4.43 5.4.44 5.5.16 5.5.27 5.5.28 5.6.6 5.6.7 5.6.8 5.6.9 5.6.10 5.6.11 5.6.13RC1 7.0.0alpha1 7.0.0alpha2 7.0.0beta1 7.0.0beta2 7.0.0beta3 7.0.0RC1 5.6.12"

if [ -z "$1" ]; then
  echo "Usage: "
  echo "      build.sh <version>"
  exit 1
fi

version=$1

check_version $version "${available_versions}"

mkdir -p $tmp_path
dockerfile_path=${tmp_path}/${image_name}-${version}

configure_command="./configure --enable-static --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc/ \
--disable-cgi --without-pear --with-sqlite3 --with-zlib --with-curl=/usr/bin/curl \
--with-openssl --libdir=/usr/lib64 --with-libdir=lib64 --enable-opcache --enable-fileinfo --enable-mbstring \
--with-readline --enable-zip --with-pdo-mysql --with-pdo-pgsql --with-mysqli --with-pdo-sqlite \
--enable-sockets --enable-fpm --enable-intl"

if [[ $version == 7* ]]; then
    configure_command="${configure_command} --enable-opcache-file"
fi

cat $template_path | m4 -D VERSION=$version | m4 -D CONFIGURE_COMMAND="$configure_command" > $dockerfile_path

docker build -t ${vendor_name}/${image_name}:${version} -f $dockerfile_path $tmp_path

latest_version=$(latest_version "${available_versions}")
if [ "$version" = "$latest_version" ]; then
  docker rmi -f fntlnz/php:latest
  docker tag ${vendor_name}/${image_name}:${version} ${vendor_name}/${image_name}:latest
fi;

rm $dockerfile_path

# vim:set et sw=2
