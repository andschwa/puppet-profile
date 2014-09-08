class profile::firewall {
  case $::operatingsystem {
    'Ubuntu': {
      include ufw
      package { 'sshguard': }
    }
  }
}
