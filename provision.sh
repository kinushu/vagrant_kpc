#!/bin/sh

yum update -y
yum install -y git gcc gcc-c++ openssl-devel readline-devel
yum install -y httpd bind-utils

# TODO:iptable の設定

# ruby 
cd /usr/local
git clone git://github.com/sstephenson/rbenv.git rbenv
git clone git://github.com/sstephenson/ruby-build.git rbenv/plugins/ruby-build

touch /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init --no-rehash -)"' >> /etc/profile.d/rbenv.sh

source /etc/profile.d/rbenv.sh

rbenv install 2.1.5
rbenv global 2.1.5
rbenv rehash

gem update --no-document --quiet
gem install bundler

# vagrant 共有フォルダマウント失敗時の対応
/etc/init.d/vboxadd setup

service httpd start
