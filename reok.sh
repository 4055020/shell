#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
Dependence=/reokey/install/Dependence
if [ ! -f $Dependence ];then
	wget -O $Dependence https://raw.githubusercontent.com/4055020/shell/master/Dependence -T 5;
fi
. $Dependence
if [ ! -f $list ];then
	wget -O $list https://raw.githubusercontent.com/4055020/shell/master/list -T 5;
fi
. $list
echo -e "${dco_g}当前系统为 Centos $dos_b位 请按任意键继续...主菜单+ / 退出-${dco_t}"
read -p "" answer
list "$answer"
exit 0
