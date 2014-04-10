class dotfiles {
    // Template for making symlinks in the home directory.
    define foo {
        file {"~/vagrant/dotfiles/${title}":
            ensure => link,
            target => "~/vagrant/.${title}"
        }
    }

    vcsrepo { '~/vagrant/dotfiles':
        ensure   => present,
        provider => git,
        source   => 'https://github.com/immerzeel/dotfiles.git'
    }

}



