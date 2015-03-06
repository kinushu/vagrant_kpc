#! /bin/sh

# これは一回しか実行して欲しくない

echo 'NETWORKING_IPV6=no' >> /etc/sysconfig/network

echo 'alias ipv6 off' >> /etc/modprobe.conf
echo 'alias net-pf-10 off' >> /etc/modprobe.conf

/sbin/chkconfig ip6tables off

