#!/bin/sh

echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc

cd /usr/local
mkdir -v /usr/local/rbenv
groupadd rbenv
chgrp -R rbenv ./rbenv
chmod -R g+rwxXs /usr/local/rbenv

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

echo "ruby version"
ruby -v
