class profile::firewall {
  case $::operatingsystem {
    'Ubuntu': {
      include ufw
      ensure_packages(['sshguard'])
    }
  }
}
