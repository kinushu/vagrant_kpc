#! /bin/sh

# これは一回しか実行して欲しくない

### ipv6 無効

echo 'NETWORKING_IPV6=no' >> /etc/sysconfig/network

echo 'alias ipv6 off' >> /etc/modprobe.d/ipv6off.conf
echo 'alias net-pf-10 off' >> /etc/modprobe.d/ipv6off.conf

/sbin/chkconfig ip6tables off

### dns 設定

echo 'DNS1=8.8.8.8' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'DNS1=8.8.8.8' >> /etc/sysconfig/network-scripts/ifcfg-eth1
/sbin/service network restart
