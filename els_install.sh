#!/bin/sh

# リポジトリの準備をしてください
# vi /etc/yum.repos.d/elasticsearch.repo

cat <<EOF > /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-2.x]
name=Elasticsearch repository for 2.x packages
baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOF

yum install -y java-1.7.0-openjdk-devel.x86_64

rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

yum install -y elasticsearch

# bin/elasticsearch --network.host 192.168.33.10
# network.host: _eth1_

/etc/init.d/elasticsearch restart
chkconfig --add elasticsearch

curl -X GET http://localhost:9200/

# Kibana

#cd /tmp
#wget https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz
#tar zxvf kibana-4.5.1-linux-x64.tar.gz

#vi /etc/yum.repos.d/kibana.repo
# https://www.elastic.co/guide/en/kibana/current/setup.html

cat <<EOF > /etc/yum.repos.d/kibana.repo
[kibana-4.5]
name=Kibana repository for 4.5.x packages
baseurl=http://packages.elastic.co/kibana/4.5/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
EOF

yum install -y kibana
/etc/init.d/kibana start
chkconfig --add kibana

curl -X GET http://localhost:5601/

# 設定ファイル内での順番も大事なため、これだけではダメ
# echo '-A INPUT -m state --state NEW -m tcp -p tcp --dport 5601 -j ACCEPT' >> /etc/sysconfig/iptables