# Install Jekyll for static website publishing.
class jekyll {
    package {['jekyll', 'sass']:
        ensure => installed,
        provider => gem
    }
}
