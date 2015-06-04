#!/bin/bash

image=$1

container_id=$(docker run -d --entrypoint=ls ${image})

docker export ${container_id} | docker import - ${image}

