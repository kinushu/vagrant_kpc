#!/bin/sh

yum update -y
yum install -y git gcc gcc-c++
yum install -y make zlib-devel libxml2-devel libxslt-devel readline-devel openssl-devel
yum install -y httpd httpd-devel curl-devel
yum -y install ImageMagick ImageMagick-devel
yum -y install mysql-server mysql-devel
yum install -y httpd bind-utils


echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc

# ruby 
mkdir -p /usr/local/rbenv
cd /usr/local/ 
groupadd rbenv
chgrp -R rbenv rbenv
chmod -R g+rwxXs rbenv 

cd /usr/local
git clone https://github.com/sstephenson/rbenv.git rbenv
git clone https://github.com/sstephenson/ruby-build.git rbenv/plugins/ruby-build

touch /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

source /etc/profile.d/rbenv.sh

rbenv install 2.1.5
rbenv global 2.1.5
rbenv rehash

gem update --no-ri --no-rdoc
gem install bundler --no-ri --no-rdoc
gem install passenger --no-ri --no-rdoc
passenger-install-apache2-module

# httpd
chkconfig httpd on --level 2345
service httpd start

# iptable の設定
echo '-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT' >> /etc/sysconfig/iptables
chkconfig iptables on --level 2345
service iptables restart
