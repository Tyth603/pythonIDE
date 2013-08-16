# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "file:///G:/Users/RKurr/Vagrant/precise64.box"
  config.vm.provision "shell", path: "update-apt.sh"
  config.vm.provision "shell", path: "install-iftop.sh"
  config.vm.provision "shell", path: "add-host-name.sh", args: "ide 192.168.33.50"
  config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--groups", "/Mold-E"]
      v.customize ["modifyvm", :id, "--memory", "256"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      v.customize ["modifyvm", :id, "--vram", "10"]
  end

  config.vm.define "ide" do |ide|
      ide.vm.box = "precise64-xfce"
      ide.vm.box_url = "file:///G:/Users/RKurr/Vagrant/precise64-xfce.box"
      ide.vm.hostname = "ide"
      ide.vm.provision :shell, path: "install-jdk-7.sh"
      ide.vm.network :private_network, ip: "192.168.33.50"
      ide.vm.provision "shell", path: "install-vcs.sh"
      ide.vm.provision "shell", path: "correct-gnome-keyring.sh"
      ide.vm.provision "shell", path: "install-pycharm.sh", args: "vagrant"
      ide.vm.provision "shell", path: "install-desktop-launchers.sh", args: "vagrant"
      ide.vm.provision "shell", path: "install-development-tomcat-7.sh", args: "vagrant"
      ide.vm.provision "shell", path: "install-gvm.sh", args: "vagrant"
      ide.vm.provision "shell", path: "install-alias-file.sh", args: "vagrant"
      ide.vm.provider "virtualbox" do |v|
          v.name = "python.ide"
          v.gui = true
          v.customize ["modifyvm", :id, "--memory", "2048"]
          v.customize ["modifyvm", :id, "--vram", "32"]
      end
  end


end
