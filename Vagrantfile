# -*- mode: ruby -*-
# vi: set ft=ruby :
 
st2ver="0.5.1"
 
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
 
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "st2express"
 
    config.vm.define "st2express" do |q|
    end
 
    config.vm.provider :virtualbox do |vb|
      vb.name = "st2express"
      vb.memory = 2048
      vb.cpus = 1
    end
 
    # Configure a private network
    config.vm.network "private_network", ip: "172.168.90.50"
 
    # Start shell provisioning
    config.vm.provision :shell, :path => "mistral.sh"
    config.vm.provision :shell, :inline => "curl -sS -k -O https://ops.stackstorm.net/releases/st2/scripts/st2_deploy.sh"
    config.vm.provision :shell, :inline => "bash st2_deploy.sh #{st2ver}"
    config.vm.provision :shell, :path => "rsyslog.sh"
end
