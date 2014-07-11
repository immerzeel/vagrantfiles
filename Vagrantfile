# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Define a name for this installation
  config.vm.define "dev-immerzeel" do |dev|
    dev.vm.box = "ubuntu-13.10"
    dev.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
    dev.vm.hostname = "dev-immerzeel"
    
    # Force to download Guest Addition online.
    config.vbguest.iso_path = "http://download.virtualbox.org/virtualbox/%{version}/VBoxGuestAdditions_%{version}.iso"

    # VirtualBox settings
    dev.vm.provider "virtualbox" do |v|
      # 4 generous gigabytes of RAM.
      v.memory = 4096
      # We are running headless.
      v.customize ["modifyvm", :id, "--vram", "10"]
    end

    # Shell provisioning
    # Bootstraps Puppet on the VM, so will run before Puppet provisioning.
    dev.vm.provision "shell", path: "shell/bootstrap.sh"

    # Puppet provisioning
    dev.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "development.pp"
    end
  end
end
