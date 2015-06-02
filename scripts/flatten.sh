#!/bin/bash

image_name=$1

container_id=$(docker run -d --entrypoint=whoami ${image_name})

docker export ${container_id} | docker import - pippo

