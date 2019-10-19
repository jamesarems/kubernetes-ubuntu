# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
#Kubernetes master config
  config.vm.define "km1" do |vm1|
    vm1.vm.hostname = "km1"
    vm1.vm.box = "k8svm"
    vm1.vm.box_check_update = false
  #  config.vm.network "forwarded_port", guest: 80, host: 8080
  #  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    vm1.vm.network "private_network", ip: "192.168.33.10" # Do not change this IP, if needed update in /data/k8s-master.sh
  #  config.vm.network "public_network"
    vm1.vm.synced_folder "./data", "/vagrant_data"
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "km1"
      vb.gui = false
      vb.memory = "2048"
    end
    vm1.vm.provision "shell", inline: <<-SHELL
      bash /vagrant_data/k8s-master.sh
    SHELL
  end

#kubernetes slave config
  config.vm.define "ks1" do |vm2|
    vm2.vm.hostname = "ks1"
    vm2.vm.box = "k8svm"
    vm2.vm.box_check_update = false
   #config.vm.network "forwarded_port", guest: 80, host: 8080
   #config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    vm2.vm.network "private_network", ip: "192.168.33.11"
   #config.vm.network "public_network"
    vm2.vm.synced_folder "./data", "/vagrant_data"
    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "ks1"
      vb.gui = false
      vb.memory = "2048"
    end
    vm2.vm.provision "shell", inline: <<-SHELL
      bash /vagrant_data/k8s-slave.sh
    SHELL
  end
# Add as much as worker node you want. 

end
