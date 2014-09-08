class profile::logging {
  include papertrail

  package { ['logwatch', 'tiger']: }
}
