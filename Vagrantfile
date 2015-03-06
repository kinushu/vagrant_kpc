# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "kinusvr"
  config.vm.box      = "CentOS-6.5"
  config.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140110.box"

  # この設定でもinternetは接続できる
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "share", "/home/vagrant/share"

#  config.vm.provision :shell, :path => "ipv6off.sh"
#  config.vm.provision :shell, :path => "provision.sh"
end
