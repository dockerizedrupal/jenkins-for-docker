class jenkins::ftp::packages {
  package {[
      'ftp'
    ]:
    ensure => present
  }
}
