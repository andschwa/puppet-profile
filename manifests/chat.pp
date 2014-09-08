class profile::chat {
  include mumble
  include prosody

  ensure_packages(['znc'])
}
