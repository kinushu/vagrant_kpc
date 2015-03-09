#! /bin/sh

# これは一回しか実行して欲しくない

### ipv6 無効

echo 'NETWORKING_IPV6=no' >> /etc/sysconfig/network

echo 'alias ipv6 off' >> /etc/modprobe.d/ipv6off.conf
echo 'alias net-pf-10 off' >> /etc/modprobe.d/ipv6off.conf

/sbin/chkconfig ip6tables off

### dns 設定

echo 'DNS1=8.8.8.8' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'DNS2=8.8.4.4' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'DNS1=8.8.8.8' >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo 'DNS2=8.8.4.4' >> /etc/sysconfig/network-scripts/ifcfg-eth1
/sbin/service network restart

# サーバ起動時に自動実行する
echo '/sbin/service network restart' >> /etc/rc.local

echo '/sbin/service network restart' >> /home/vagrant/.bash_profile
echo '/sbin/service network restart' >> /root/.bash_profile

