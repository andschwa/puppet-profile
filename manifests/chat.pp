class profile::chat {
  include mumble
  include prosody

  package { 'znc': }
}
