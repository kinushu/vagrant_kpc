
# MySQL 5.6指定

yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
yum install -y mysql mysql-devel mysql-server mysql-utilities

# echo '/etc/my.cnf を以下のように変更すること
# echo '[mysqld] character-set-server=utf8'

cat /etc/my.cnf
# [mysqld]
# character-set-server=utf8

/etc/init.d/mysqld start
chkconfig mysqld on --level 2345

mysqladmin -u root password 'kpcmysqladmin'

# /usr/bin/mysql_secure_installation
# mysql -u root -p
