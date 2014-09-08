class profile::packages {
  ensure_packages(hiera_array('packages', []))

  case $operatingsystem {
    'CentOS': {
      create_resources('yumrepo', hiera_hash('yumrepos', {}), hiera_hash('yumrepo_defaults', {}))
    }
    'Ubuntu': {
      include apt
      include apt::unattended_upgrades
      include ubuntu
    }
  }

  $pip_packages = hiera_array('pip_packages')
  package { $pip_packages:
    ensure   => present,
    provider => pip,
    require  => Package['python-pip']
  }
}
