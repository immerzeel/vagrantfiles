# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  # Use personal install script for Ubuntu image
  config.vm.provision "shell", path:"https://raw.github.com/immerzeel/vagrantfiles/master/vagrant_provision.sh"
  # config.vm.provision "shell", path:"install_packages.sh"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
end
