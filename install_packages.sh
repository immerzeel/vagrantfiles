#!/bin/sh
# Maintainer Pascal Immerzeel, pascal@immerzeel.net

APT_GET="sudo apt-get"
INSTALL="$APT_GET install -y"

# Update the package library.
$APT_GET update

$INSTALL build-essential
$INSTALL git-core

# JEKYLL
/opt/vagrant_ruby/bin/gem install jekyll sass rdiscount --no-ri --no-rdoc

# SHELL
$INSTALL zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
sudo ~/install.sh

# DOTFILES
git clone https://github.com/immerzeel/dotfiles.git ~/dotfiles
chown -R vagrant.vagrant ~/dotfiles
~/dotfiles/install.sh

$INSTALL tmux

$INSTALL python-software-properties
sudo add-apt-repository ppa:mizuno-as/silversearcher-ag
$APT_GET update
$INSTALL silversearcher-ag 

# VIM
$INSTALL vim
git clone https://github.com/immerzeel/vimfiles.git ~/vimfiles
chown -R vagrant.vagrant ~/vimfiles
~/vimfiles/install.sh

# NODEJS
# Install Personal Package for latest Node.js.
# Current Vagrant image precise32 only has version 0.6.X.
sudo add-apt-repository ppa:chris-lea/node.js
$APT_GET update

$INSTALL nodejs

# Install node packages with sudo npm install --no-bin-link.
# VirtualBox prevents symlinks in shared folders.
sudo npm install -g grunt-cli grunt-devtools

# UTILITIES
$INSTALL links
