class profile::gitlab {
  include profile::web
  include profile::mail

  include gitlab

  include postgresql
  include postgresql::globals
  include postgresql::server
  include redis
}
