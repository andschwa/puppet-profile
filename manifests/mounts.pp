class profile::mounts {
  create_resources('file', hiera_hash('mount_points', {}), {ensure => directory})
  create_resources('mount', hiera_hash('mounts', {}), hiera_hash('mount_defaults', {}))
}
