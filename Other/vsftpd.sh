#!/bin/bash
#Tankibaj
#https://github.com/tankibaj

clear
# Options
echo ""
echo ""
echo "# What do you want to do?"
echo "		1) 安装vsftpd"
echo "		2) 添加ftp用户"
echo "		3) 重启vsftpd"
echo "		4) 添加apache2 ftp用户"
echo "		5) 允许/禁止ftp用户"
echo "		6) 卸载vsftp"
echo "		7) 退出"

#
read -p "# 选择一个选项 [1-7]: " option
echo ""
echo ""

	# Start case
	case $option in
		
		1) ############################################
			#
			echo ""
			echo "################### 更新和升级 ###################"
			echo ""
			apt-get update
			apt-get upgrade -y
			clear
			echo ""
			echo "Checked update and upgrade"
			echo "Done......"
			echo ""

			#
			echo ""
			echo "################### 安装vsftpd ###################"
			echo ""
			apt-get install vsftpd -y
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### 打开配置文件并编辑 ###################"
			echo ""
			echo "write_enable=YES" >> /etc/vsftpd.conf
			echo "chroot_local_user=YES" >> /etc/vsftpd.conf
			echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "恭喜。。。您的vsftpd服务器已就绪：)"
			echo "请添加用户以使用ftp"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		2) ############################################
			#
			echo ""
			echo "################### 添加用户 ###################"
			echo ""
			read -p "User name: " -e -i tankibaj USER
			adduser $USER
			chown -R $USER:$USER /home/$USER/
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### 正在查找服务器公用IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "	恭喜。。。您的vsftpd服务器已就绪：）"
			echo "============================================================"
			echo "	Server IP: $PIP"
			echo "	Username: $USER"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		3) ############################################
			#
			echo ""
			echo "################### 重新启动vsftpd ###################"
			echo ""
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""
		exit;;

		
		4) ############################################
			#
			echo ""
			echo "################### Apache2 FTP用户 ###################"
			echo ""
			read -p "User name: " -e -i tankibaj USER
			adduser $USER
			usermod --home /var/www/html $USER
			chown -R $USER:$USER /var/www/html
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### 正在查找服务器公用IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "您的PPTP服务器准备就绪….享受"
			echo "============================================================"
			echo "Server IP: $PIP"
			echo "Username: $USER"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		5) ############################################
			#
			nano /etc/ftpusers
		exit;;

		
		6) ############################################
			#
			echo ""
			echo "################### 正在卸载vsftpd ###################"
			echo ""
			apt-get remove vsftpd
			apt-get purge vsftpd
			echo ""
			echo "Done..."
			echo ""
		exit;;

		
		7) #############################################
		exit;;

	esac

	exit
