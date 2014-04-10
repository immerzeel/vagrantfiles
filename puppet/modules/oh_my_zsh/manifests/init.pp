class oh_my_zsh {
    package {'zsh':
        ensure => installed,
        provider => apt
    }

    vcsrepo {'~/vagrant/.oh-my-zsh':
        ensure   => present,
        provider => git,
        source   => 'https://github.com/robbyrussel/oh-my-zsh.git'
    }

    user {'vagrant':
        shell => "bin/zsh",
        require => Package['zsh']
    }
}

