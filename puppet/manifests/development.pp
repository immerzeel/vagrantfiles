hiera_include('classes')
# Set the global executables path for all the modules.
Exec { path => ['/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin', '/usr/local/sbin']}
>
class utils {
  $required_apt_packages = [
    'silversearcher-ag',
    'pandoc',
    'imagemagick',
    'links'
  ]

  package { $required_apt_packages:
    ensure => latest,
    provider => apt
  }
}

class tmux {
  # tmux and tmuxinator
  package{'tmux':}
  package{'tmuxinator':
    provider => gem
  }
}
