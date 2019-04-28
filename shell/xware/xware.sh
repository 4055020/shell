#!/usr/bin/env bash

docker pull senorsen/docker-thunder-xware
cd /data
docker run -d \
        # 通过 restart 来指定异常退出时重启
        --restart on-failure \
        --name xware \
        # 默认的 network 是 host
        # 可以指定其他网络配置(--net, --ip)，以控制其网络行为
        --net host \
        -v $(pwd)/data1:/app/TDDOWNLOAD \
        -v $(pwd)/data2:/app/bin/cfg \
        senorsen/docker-thunder-xware
sleep 10s
docker logs xware