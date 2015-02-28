class jenkins::lftp::packages {
  package {[
      'lftp'
    ]:
    ensure => present
  }
}
