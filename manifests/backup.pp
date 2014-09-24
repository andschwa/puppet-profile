class profile::backup {
  ensure_packages(['duplicity', 'gnupg', 'cifs-utils'])

  package { 'pyrax':
    provider => pip,
    require  => Package['python-pip'],
  }

  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '12.04': {
          apt::ppa { 'ppa:duplicity-team/ppa':
            before => Package['duplicity']
          }
        }
      }
    }
  }
}
