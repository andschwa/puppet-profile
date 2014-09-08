class profile::vcsrepos {
  create_resources('vcsrepo', hiera_hash('vcsrepos', {}))
  Vcsrepo <| provider == git |> {
    require => Package['git']
  }
}
