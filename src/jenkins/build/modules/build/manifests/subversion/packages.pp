class build::subversion::packages {
  package {[
      'subversion'
    ]:
    ensure => present
  }
}
