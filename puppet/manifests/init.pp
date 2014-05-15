# create a new run stage to ensure certain modules are included first.
# stage { 'setup':
#   before => Stage['main']
# }

# class { 'base':
#   stage => 'setup'
# }

$required_apt_packages = [
  'vim',
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

