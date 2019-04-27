#!/bin/bash
# Crushlinux
# 2017-03-10
# vsftpd 服务虚拟用户管理脚本，可设置用户名，密码，及权限
 
read -p "请输入创建的账户: " user
read -p "请输入账户的密码: " passwd
read -p "请输入账户的权限: " permissions
 
vfile="/etc/vsftpd/vsftpuser.txt"
vdir="/etc/vsftpd/vusers_dir"
 
create-u () {
echo "$user" >> $vfile
echo "$passwd" >> $vfile
}
 
create-p () {
cat << END > $vdir/$user
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
END
}
 
grep -q "$user" $vfile
if [ $? -ne 0 ]
then
    create-u
    cd /etc/vsftpd
    [ -d backup ] || mkdir backup
    cp vsftpuser.db backup/vsftpuser.db-$(date +%s)
    db_load -T -t hash -f vsftpuser.txt vsftpuser.db
    [ -d $vdir ] || mkdir $vdir
    if [ $permissions = 'rw' ]
    then
        create-p
    fi
else
    echo "用户 $user 已经存在!"
fi 
