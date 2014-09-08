class profile {
  include profile::mounts
  include profile::packages
  include profile::ssh_keys
  include profile::sudo
  include profile::vcsrepos
  include profile::tools

  include git
  include ntp
  include person
  include ssh::server

  case $::operatingsystem {
    'Ubuntu': {
      ensure_packages(['python', 'python-pip'])
      package { ['virtualenvwrapper']:
        provider => pip,
        require  => Package['python-pip'],
      }
    }
  }
}
