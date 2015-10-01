#!/usr/bin/env bash
source "$(dirname "$0")/../utils/utils.sh"

vendor_name=fntlnz
image_name=nginx

template_path=$(dirname "$0")/Dockerfile
available_versions="1.6.0 1.6.1 1.6.2 1.6.3 1.7.9 1.7.10 1.7.11 1.8.0 1.9.0 1.9.1 1.9.2 1.9.3 1.9.4 1.9.5"

if [ -z "$1" ]; then
  echo "Usage: "
  echo "      build.sh <version>"
  exit 1
fi

version=$1

check_version $version "${available_versions}"

configure_command="./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --error-log-path=/dev/stdout --http-log-path=/dev/stdout --with-http_gzip_static_module --with-http_stub_status_module --with-http_ssl_module --with-pcre --with-file-aio --with-http_realip_module --without-http_scgi_module --without-http_uwsgi_module"

# HTTP 2 Module is available since 1.9.5
vercomp $version 1.9.4
if [[ $? -eq 1  ]]; then
  configure_command="${configure_command} --with-http_v2_module"
fi

docker build -t ${vendor_name}/${image_name}:${version} - < <(cat $template_path | m4 -D VERSION=$version | m4 -D CONFIGURE_COMMAND="$configure_command")

latest_version=$(latest_version "${available_versions}")
if [ "$version" = "$latest_version" ]; then
  docker rmi -f ${vendor_name}/${image_name}:latest
  docker tag ${vendor_name}/${image_name}:${version} ${vendor_name}/${image_name}:latest
fi;

# vim: ai ts=2 sw=2 et sts=2 ft=sh
