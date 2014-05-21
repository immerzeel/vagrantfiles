# -*- mode: ruby -*-
# vi: set ft=ruby :

# This is a custom installer class used by the Vagrant vbguest plugin.
# Install the plugin using `vagrant plugin install vagrant-vbguest`.
class VirtualBoxWorkaroundInstaller < VagrantVbguest::Installers::Linux
  def install(opts=nil, &block)
    # do normal installation
    super

   # link the files if it's version 4.3.10 with the vboxfs mounting bug.
    communicate.sudo('( [ -d /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions ] && sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions ) || true', )
  end
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-13.10"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
  config.vm.hostname = "development"

  # VirtualBox settings
  config.vm.provider "virtualbox" do |v|
    # 4 generous gigabytes of RAM.
    v.memory = 4096
    # We are running headless.
    v.customize ["modifyvm", :id, "--vram", "10"]
  end
  # Use a custom installer script from the vbguest plugin.
  # See https://github.com/mitchellh/vagrant/issues/3341 for more info.
  config.vbguest.installer = VirtualBoxWorkaroundInstaller

  # Shell provisioning
  # Bootstraps Puppet on the VM, so will run before Puppet provisioning.
  config.vm.provision "shell", path: "shell/bootstrap.sh"

  # Puppet provisioning
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "init.pp"
  end

  # Network
  config.vm.network "forwarded_port", guest: 4000, host: 4000
end
