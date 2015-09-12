class build::ansible::packages {
  package {[
      'build-essential',
      'python-dev',
      'python-setuptools'
    ]:
    ensure => present
  }
}
