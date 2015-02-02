class jenkins::subversion::packages {
  package {[
      'subversion'
    ]:
    ensure => present
  }
}
