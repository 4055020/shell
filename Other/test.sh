#!/bin/bash
sh_ver="17.01.01"

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
clear
printf "
#######################################################################
#       OneinStack for CentOS/RadHat 6+ Debian 7+ and Ubuntu 12+      #
#       For more information please visit https://oneinstack.com      #
#######################################################################
"
# Check if user is root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		Checkrelease="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		Checkrelease="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		Checkrelease="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		Checkrelease="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		Checkrelease="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		Checkrelease="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		Checkrelease="centos"
    fi
	bit=`uname -m`
}

Installation(){
	if [[ ${release} = "centos" ]]; then
		release="yum"
	else
		release="apt"
	fi
}

function CheckDependence(){
FullDependence='0';
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
        echo -en "[\033[32mok\033[0m]\t";
      else
        FullDependence='1';
        echo -en "[\033[31mNot Install\033[0m]";
      fi
      echo -en "\t$BIN_DEP\n";
    fi
  done
if [ "$FullDependence" == '1' ]; then
	$release install -y $BIN_DEP
#	echo -ne "\n\033[31mError! \033[0mPlease use '\033[33mapt-get\033[0m' or '\033[33myum\033[0m' install it.\n\n\n"
	exit 1;
fi
}

function httpRequest(){
    info=`curl -s -m 10 --connect-timeout 10 -I https://raw.githubusercontent.com/4055020/shell/master/shell/$1/$1.sh`
    code=`echo $info|grep "HTTP"|awk '{print $2}'`
    if [ "$code" == "200" ];then
        bash -c "$(curl -sS https://raw.githubusercontent.com/4055020/shell/master/shell/$1/$1.sh)"
    else
        echo "尚未支持的命令"
    fi
}

check_shell(){
sh_new_ver=$(wget --no-check-certificate -qO- "https://raw.githubusercontent.com/4055020/shell/master/reok"|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
[[ -z ${sh_new_ver} ]] && echo "无法连接Github" && exit 0
	if [[ ${sh_new_ver} != ${sh_ver} ]]; then
		wget --no-check-certificate -qO /root/reok 'https://raw.githubusercontent.com/4055020/shell/master/reok'
		cp -f /root/reok /usr/local/sbin/reok
		chmod -x /usr/local/sbin/reok
	else
		echo "已连接到Github"
	fi
}

check_sys
Installation
check_shell
CheckDependence llljjj,wget,awk,grep,sed,cut,cat,cpio,gzip,find,dirname,basename,file,xz,git,llljjj;
httpRequest "$1"
