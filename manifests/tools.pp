class profile::tools {
  case $::operatingsystem {
    'Ubuntu': {
      package { ['augeas-tools', 'aptitude', 'curl', 'mg', 'mosh', 'most', 'silversearcher-ag', 'sqlite', 'wget', 'unzip', 'zsh']: }
    }
  }
}
