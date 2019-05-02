#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export sh=/usr/bin/reok
export sh_new="https://raw.githubusercontent.com/4055020/shell/maste"
export sh_ver="https://raw.githubusercontent.com/4055020/shell/master/config"
export RGB31="\033[31m"				#红	错误
export RGB33="\033[33m"				#黄	提示
export RGB36="\033[36m"				#蓝	回显
export RGB32="\033[32m"				#绿	成功
export RGB35="\033[35m"				#紫	
export RGB40="echo -en \\033[1;30m"	#灰	默认
export RGB="\033[0m"				#关

function CheckDependence(){
Dependence='0';
for BIN_DEP in `echo "$1" |sed 's/,/\n/g'`
  do
    if [[ -n "$BIN_DEP" ]]; then
      Founded='0';
      for BIN_PATH in `echo "$PATH" |sed 's/:/\n/g'`
        do
          ls $BIN_PATH/$BIN_DEP >/dev/null 2>&1;
          if [ $? == '0' ]; then
            Founded='1';
            break;
          fi
        done
      if [ "$Founded" == '1' ]; then
        echo -en $RGB32[right]$RGB
      else
        Dependence='1';
        echo -en $RGB31[wrong]$RGB
      fi
      echo -en $RGB36"\t$BIN_DEP\n"$RGB;
    fi
  done
if [ "$Dependence" == '1' ]; then
	$RGB40
	$sh_sys install $BIN_DEP -y -q
	echo -e $RGB36请装好$RGB31[$BIN_DEP]$RGB36再次执行$RGB33[reok]$RGB && exit 1
fi
}

check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		check_sys="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		check_sys="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		check_sys="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		check_sys="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		check_sys="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		check_sys="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		check_sys="centos"
    fi
	bit=`uname -m`

	if [[ ${check_sys} = "centos" ]]; then
		sh_sys="yum"
	else
		sh_sys="apt"
	fi
}

function check_shell(){
    info=`curl -s -m 10 --connect-timeout 10 -I https://raw.githubusercontent.com/4055020/shell/master/shell/$1.sh`
    code=`echo $info|grep "HTTP"|awk '{print $2}'`
    if [ "$code" == "200" ];then
        bash -c "$(curl -sS https://raw.githubusercontent.com/4055020/shell/master/shell/$1.sh)"
    else
        echo "尚未支持的命令$1"$1
    fi
}

CheckDependence wget,curl,awk,grep,sed,cut,cat;
check_sys
