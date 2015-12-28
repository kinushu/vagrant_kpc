# -*- mode: ruby -*-
# vi: set ft=ruby :

# vagrunt up 前に以下を実行してください
# vagrant plugin install vagrant-reload

Vagrant.configure("2") do |config|
  config.vm.hostname = "kpcsvr"
  config.vm.box      = "CentOS-6.5"
  config.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140110.box"

  # この設定でもinternetは接続できる
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider :virtualbox do |vb|
  end
#  config.vm.synced_folder "share", "/home/vagrant/share"

  config.vm.provision :shell, :path => "network_setting.sh"
  config.vm.provision :shell, :path => "yum_install.sh"

  config.vm.provision :shell, :path => "ruby_install.sh"
  config.vm.provision :shell, :path => "httpd_install.sh"
  config.vm.provision :shell, :path => "gem_install.sh"

  config.vm.provision :shell, :path => "mysql_install.sh"

#  config.vm.provision :reload
#  config.vm.provision :shell, :path => "prepare_vagrant_shared.sh"
#  config.vm.provision :reload
end
