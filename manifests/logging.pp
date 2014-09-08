class profile::logging {
  include papertrail

  ensure_packages(['logwatch', 'tiger'])
}
