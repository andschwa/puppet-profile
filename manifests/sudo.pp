class profile::sudo {
  class { '::sudo':
    sudoers => hiera_hash('sudoers', {}),
  }
}
