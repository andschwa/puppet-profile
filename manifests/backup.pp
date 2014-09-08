class profile::backup {
  ensure_packages(['duplicity', 'gnupg', 'cifs-utils'])
  package { 'pyrax':
    provider => pip,
    require  => Package['python-pip'],
  }
}
