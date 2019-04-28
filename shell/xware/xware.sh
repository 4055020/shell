#!/usr/bin/env bash

docker pull senorsen/docker-thunder-xware
mkdir -p /data/TDDOWNLOAD
mkdir -p /data/cfg
docker run -d --restart on-failure --name xware --net host -v /data/TDDOWNLOAD:/app/TDDOWNLOAD -v /data/config:/app/bin/cfg senorsen/docker-thunder-xware
systemctl start rc-local
systemctl enable rc-local
sleep 7s
docker logs xware

if [ -e /etc/rc.local ];then
	wget -N --no-check-certificate -qO /home/xserver.py https://raw.githubusercontent.com/4055020/XwareClient/master/server_deploy/xserver.py && chmod +x /home/xserver.py
	sed -i '/exit 0/i\python /home/xserver.py &' /etc/rc.local
else
cat <<EOF >/etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

python /home/xserver.py &

exit 0
EOF
fi
