# create a new run stage to ensure certain modules are included first.
# stage { 'setup':
#   before => Stage['main']
# }

# class { 'base':
#   stage => 'setup'
# }

# Set the global executables path for all the modules.
Exec { path => ['/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin']}

$required_apt_packages = [
  'tmux',
  'silversearcher-ag',
  'links'
]

package { $required_apt_packages:
    ensure => installed,
    provider => apt
}

include dotfiles
include ohmyzsh
include jekyll # Install Jekyll for static website publishing.
include vim

