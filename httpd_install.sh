#!/bin/sh

yum install -y httpd httpd-devel curl-devel bind-utils

setenforce 0
echo '起動時のSELinux状態を変更すること vim /etc/selinux/config'
echo 'SELINUX=disabled'
mkdir -p /var/logs/httpd

echo 'kpcserver' >> /var/www/html/index.html

chkconfig httpd on --level 2345
service httpd start

# iptable の設定
echo '/etc/sysconfig/iptables が正常かどうか確認すること'
# 設定ファイル内での順番も大事なため、これだけではダメ
# echo '-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT' >> /etc/sysconfig/iptables
chkconfig iptables on --level 2345
service iptables restart

echo 'httpd.conf の以下を有効にしておく'
echo 'NameVirtualHost *:80'
