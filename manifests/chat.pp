class profile::chat {
  include mumble
  include prosody

  package { 'znc': }

  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '12.04': {
          apt::ppa { 'ppa:teward/znc':
            before => Package['znc']
          }
        }
      }
    }
  }
}
