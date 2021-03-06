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

      ensure_packages(['python', 'python-pip'])

      package { ['virtualenvwrapper']:
        provider => pip,
        require  => Package['python-pip'],
      }

      apt::ppa { 'ppa:pg-radadia/tmux-stable': }
    }
  }
}
