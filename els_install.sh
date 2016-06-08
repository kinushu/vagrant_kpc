#!/bin/sh

# リポジトリの準備をしてください
# vi /etc/yum.repos.d/elasticsearch.repo
#[elasticsearch-2.x]
#name=Elasticsearch repository for 2.x packages
#baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
#gpgcheck=1
#gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
#enabled=1

yum install -y java-1.7.0-openjdk-devel.x86_64

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

yum install -y elasticsearch


/etc/init.d/elasticsearch start
chkconfig --add elasticsearch

curl -X GET http://localhost:9200/

#cd /tmp
#wget https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz
#tar zxvf kibana-4.5.1-linux-x64.tar.gz

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
#vi /etc/yum.repos.d/kibana.repo
# https://www.elastic.co/guide/en/kibana/current/setup.html
yum install -y kibana
/etc/init.d/kibana start
chkconfig --add kibana

curl -X GET http://localhost:5601/

# 設定ファイル内での順番も大事なため、これだけではダメ
# echo '-A INPUT -m state --state NEW -m tcp -p tcp --dport 5601 -j ACCEPT' >> /etc/sysconfig/iptables