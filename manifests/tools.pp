class profile::tools {
  case $::operatingsystem {
    'Ubuntu': {
      ensure_packages(['augeas-tools', 'aptitude', 'curl', 'mg', 'mosh', 'most', 'silversearcher-ag', 'sqlite', 'wget', 'unzip', 'zsh'])
    }
  }
}
