class profile::tools {
  case $::operatingsystem {
    'Ubuntu': {
      ensure_packages(['augeas-tools', 'aptitude', 'curl', 'mg', 'mosh', 'most', 'silversearcher-ag', 'sqlite', 'wget', 'unzip', 'zsh'])

      case $::operatingsystemrelease {
        '12.04': {
          apt::ppa { 'ppa:git-core/ppa':
            before => Package['git']
          }
          apt::ppa { 'ppa:keithw/mosh':
            before => Package['mosh']
          }
          apt::ppa { 'ppa:lvillani/silversearcher':
            before => Package['silversearcher-ag']
          }
        }
      }
    }
  }
}
