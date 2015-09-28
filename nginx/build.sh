#!/usr/bin/env bash
source "$(dirname "$0")/../utils/utils.sh"

vendor_name=fntlnz
image_name=nginx

template_path=$(dirname "$0")/Dockerfile
available_versions="1.6.0 1.6.1 1.6.2 1.6.3 1.7.9 1.7.10 1.7.11 1.8.0 1.9.0 1.9.1 1.9.2 1.9.3 1.9.4"

if [ -z "$1" ]; then
  echo "Usage: "
  echo "      build.sh <version>"
  exit 1
fi

version=$1

check_version $version "${available_versions}"

docker build -t ${vendor_name}/${image_name}:${version} - < <(cat $template_path | m4 -D VERSION=$version)

latest_version=$(latest_version "${available_versions}")
if [ "$version" = "$latest_version" ]; then
  docker rmi -f ${vendor_name}/${image_name}:latest
  docker tag ${vendor_name}/${image_name}:${version} ${vendor_name}/${image_name}:latest
fi;

# vim: ai ts=2 sw=2 et sts=2 ft=sh
