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
  'silversearcher-ag',
  'pandoc',
  'imagemagick',
  'links'
]

package { $required_apt_packages:
    ensure => installed,
    provider => apt
}

# tmux and tmuxinator
package{'tmux':}
package{'tmuxinator':
  provider => gem
}

include dotfiles
include ohmyzsh
include vim

