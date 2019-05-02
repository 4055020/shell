#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
Dependence=/reokey/install/Dependence.sh
if [ ! -f $Dependence ];then
	wget -O $Dependence https://raw.githubusercontent.com/4055020/shell/master/Dependence.sh -T 5;
fi
. $Dependence
if [ ! -f $list ];then
	wget -O $list https://raw.githubusercontent.com/4055020/shell/master/list.sh -T 5;
fi
. $list

read -n1 -p "请按键继续" answer
list "$answer"
exit 0
