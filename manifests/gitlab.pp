class profile::gitlab {
  include profile::web
  include profile::mail

  include ::gitlab

  include postgresql
  include postgresql::globals
  include postgresql::server
  include redis

  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '12.04': {
          apt::ppa { 'ppa:chris-lea/redis-server':
            before => Package['redis']
          }
        }
      }
    }
  }
}
