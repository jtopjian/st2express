# -*- mode: ruby -*-
# vi: set ft=ruby :

st2ver="0.5.1"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Dummy box because we're using an OpenStack image
  config.vm.box = 'dummy'

  # Path to private-side of imported OpenStack keypair
  config.ssh.private_key_path = '~/.ssh/id_rsa'

  config.vm.provider :openstack do |os|
    os.username        = ENV['OS_USERNAME']
    os.api_key         = ENV['OS_PASSWORD']
    os.flavor          = /m1.small/
    os.image           = 'Ubuntu 14.04'
    os.endpoint        = "#{ENV['OS_AUTH_URL']}/tokens"
    os.keypair_name    = "changeme"
    os.ssh_username    = "ubuntu"
    os.security_groups = ['default']
    os.address_id      = 'changeme'
    os.networks        = ['changeme']
  end

  config.vm.define 'st2express'

  # Start shell provisioning
  config.vm.provision :shell, :path => 'bootstraps/st2express.sh'

end
