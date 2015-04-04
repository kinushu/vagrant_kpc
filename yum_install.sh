#!/bin/sh

yum update -y
yum install -y gcc gcc-c++ make
yum install -y git tig
yum install -y zlib-devel libxml2-devel libxslt-devel readline-devel openssl-devel
yum -y install ImageMagick ImageMagick-devel
yum install -y httpd httpd-devel curl-devel bind-utils
yum install -y sqlite sqlite-devel

# 時刻設定
yum -y install ntp
ntpdate ntp.nict.jp
/etc/rc.d/init.d/ntpd start
chkconfig ntpd on
