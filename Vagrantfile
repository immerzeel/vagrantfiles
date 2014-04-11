# -*- mode: ruby -*-
# vi: set ft=ruby :

# FIX SYMLINKING ON WINDOWS
# =========================
# Run this command on the Windows host machine as Administrator (without the ticks):
# `fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1`
#
# Then run the Console with administrator privileges, plain vboxfs.

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-13.10"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
  config.vm.hostname = "development"

  # Shell provisioning
  # Bootstraps Puppet on the VM, so will run before Puppet provisioning.
  config.vm.provision "shell", path: "shell/bootstrap.sh"

  # Puppet provisioning
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "init.pp"
    puppet.options = "--verbose --debug"
  end

  # Network
  config.vm.network "forwarded_port", guest: 4000, host: 4000
end
