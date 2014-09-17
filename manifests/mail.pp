class profile::mail {
  include amavis
  include amavis::config

  include dovecot
  include dovecot::auth
  include dovecot::base
  include dovecot::imap
  include dovecot::lmtp
  include dovecot::mail
  include dovecot::master
  include dovecot::sieve
  include dovecot::ssl

  include postfix
  include postfix::config

  package { ['pyzor']:
    provider => pip,
    require  => Package['python-pip'],
  }

    case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '12.04', '14.04': {
          apt::ppa { 'ppa:malte.swart/dovecot-2.2':
            before => Package['dovecot-imapd']
          }
        }
      }
    }
  }
}
