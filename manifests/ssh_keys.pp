class profile::ssh_keys {
  create_resources('ssh_authorized_key', hiera_hash('ssh_keys', {}), hiera_hash('ssh_key_defaults', {}))
}
