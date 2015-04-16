class jenkins::php::packages {
  package {[
      'php5-cli',
      'php5-curl'
    ]:
    ensure => present
  }
}
