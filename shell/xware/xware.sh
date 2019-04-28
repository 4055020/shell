#!/usr/bin/env bash

docker pull senorsen/docker-thunder-xware
mkdir -p /data/TDDOWNLOAD
mkdir -p /data/cfg

docker run -d --restart on-failure --name xware --net host -v /data/TDDOWNLOAD:/app/TDDOWNLOAD -v /data/config:/app/bin/cfg senorsen/docker-thunder-xware
sleep 10s
docker logs xware