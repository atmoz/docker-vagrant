# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "dockerhost"
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision :shell, path: "vagrant-provision.sh",
      run: "always"

  # Static IP for easy access (tip: add to hosts file)
  config.vm.network "private_network",
      ip: "10.10.10.10"

end
