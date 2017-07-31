class build::nmap::packages {
  package {[
      'nmap'
    ]:
    ensure => present
  }
}
