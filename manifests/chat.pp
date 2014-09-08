class profile::chat {
  include mumble
  include prosody

  package { 'znc': }

  supervisor::program { 'znc':
    command        => 'znc --foreground',
    autorestart    => true,
    user           => 'andrew',
    group          => 'andrew',
    directory      => '/home/andrew/',
    stdout_logfile => '/home/andrew/.znc/stdout.log',
    stderr_logfile => '/home/andrew/.znc/stderr.log',
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
