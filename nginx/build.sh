#!/usr/bin/env bash
source "$(dirname "$0")/../utils/utils.sh"

template_path=$(dirname "$0")/Dockerfile
tmp_path=/tmp/dockerfiles-nginx-tmp
image_name=nginx
available_versions="1.6.0 1.6.1 1.6.2 1.6.3 1.7.9 1.7.10 1.7.11 1.8.0 1.9.0 1.9.1 1.9.2 1.9.3 1.9.4"

if [ -z "$1" ]; then
    echo "Usage: "
    echo "      build.sh <version>"
    exit 1
fi

version=$1

check_version $version "${available_versions}"

mkdir -p $tmp_path
dockerfile_path=${tmp_path}/${image_name}-${version}
cat $template_path | m4 -D VERSION=$version > $dockerfile_path
docker build -t fntlnz/${image_name}:${version} -f $dockerfile_path $tmp_path
rm $dockerfile_path
