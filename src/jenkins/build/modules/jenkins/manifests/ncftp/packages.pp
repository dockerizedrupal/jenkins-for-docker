class jenkins::ncftp::packages {
  package {[
      'ncftp'
    ]:
    ensure => present
  }
}
