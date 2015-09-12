class build::nodejs::packages {
  bash_exec { 'curl -sL https://deb.nodesource.com/setup | bash -': }

  package {[
      'nodejs'
    ]:
    ensure => present,
    require => Bash_exec['curl -sL https://deb.nodesource.com/setup | bash -']
  }
}
