#!/usr/bin/env bash

template_path=$(dirname "$0")/Dockerfile
tmp_path=/tmp/dockerfiles-tmp
image_name=php
available_versions="5.4.43 5.5.16 5.5.27 5.6.6 5.6.7 5.6.8 5.6.9 5.6.10 5.6.11 7.0.0alpha1 7.0.0alpha2 7.0.0beta1 7.0.0beta2 7.0.0beta3"

if [ -z "$1" ]; then
    echo "Usage: "
    echo "      build.sh <version>"
    exit 1
fi

available=0
for version in $available_versions
do
    if [ $version = $1 ];then
        available=1
        break
    fi
done

if [ "$available" -eq 0 ]; then
    echo "Requested version is not available"
    echo "Please try with one of these: ${available_versions}"
    exit 1
fi


version=$1

mkdir -p $tmp_path

dockerfile_path=${tmp_path}/${image_name}-${version}
cat $template_path | m4 -D VERSION=$version > $dockerfile_path
docker build -t fntlnz/${image_name}:${version} -f $dockerfile_path $tmp_path
rm $dockerfile_path
