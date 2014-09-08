class profile::backup {
  package { ['duplicity', 'gnupg', 'cifs-utils']: }
  package { ['pyrax']:
    provider => pip,
    require  => Package['python-pip'],
  }
}
