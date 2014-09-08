class profile::irc_bouncer {
  package { 'znc': }

  group { 'znc':
    ensure => present,
  }

  user { 'znc':
    ensure     => present,
    comment    => 'User for IRC bouncer',
    home       => '/home/znc',
    managehome => true,
    gid        => 'znc',
    require    => Group['znc'],
  }

  supervisor::program { 'znc':
    command        => 'znc --foreground',
    autorestart    => true,
    user           => 'znc',
    group          => 'znc',
    directory      => '/home/znc/',
    stdout_logfile => '/var/log/supervisor/znc_stdout.log',
    stderr_logfile => '/var/log/supervisor/znc_stderr.log',
    environment    => 'HOME="/home/znc"',
    require        => User['znc'],
  }

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
