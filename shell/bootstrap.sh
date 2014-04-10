#!/usr/bin/env bash
# Bootstrap VM for provisioning with Puppet.
echo 'Bootstrapping the VM:'

# Make sure only root can run the script.
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install Puppet stand-alone version.
if ! type -t puppet > /dev/null 2>&1 ; then
    echo 'Installing Puppet...'
    apt-get install -y puppet-common > /dev/null 2>&1
else
    puppetVersion=`puppet --version`
    echo "Puppet $puppetVersion already installed..."
fi

# Install Git, necessary for Librarian Puppet.
# Git also have to be installed for Librarian Puppet to work.
if ! type -t git > /dev/null 2>&1 ; then
    # Update the Ubuntu packages.
    echo 'Updating the packages...'
    apt-get -y update > /dev/null 2>&1

    echo 'Installing Git...'
    apt-get install -y git-core > /dev/null
else
    gitVersion=`git --version`
    echo "$gitVersion already installed..."
fi

# Install Librarian Puppet.
if  ! `gem search -i librarian-puppet` > /dev/null ; then
    # Update the Ruby gems packages.
    echo 'Updating Ruby gems...'
    gem update > /dev/null

    echo 'Installing Librarian Puppet...'
    # Install the ruby-dev for creating stand-alone Ruby apps.
    apt-get install -y ruby-dev > /dev/null
    gem install librarian-puppet --no-rdoc --no-ri > /dev/null
else
    librarianPuppetVersion=`librarian-puppet version`
    echo "$librarianPuppetVersion already installed..."
fi

if [ ! -f /etc/puppet/Puppetfile.lock ]; then
    echo 'Download & install Puppet modules...'
    # Copy the Puppetfile to the default puppet location.
    cp /vagrant/puppet/Puppetfile /etc/puppet/
    cd /etc/puppet && librarian-puppet install --clean
else
    echo 'Updating Puppet modules...'
    cp /vagrant/puppet/Puppetfile /etc/puppet/
    cd /etc/puppet && librarian-puppet update
fi
