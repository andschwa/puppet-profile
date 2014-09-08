class profile::ghost {
  include profile::web

  include nodejs

  include ghost
  create_resources('ghost::blog', hiera_hash('ghost::blogs', {}))
}
