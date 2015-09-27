class build::awscli::packages {
  package {[
      'python-pip'
    ]:
    ensure => present
  }

  bash_exec { 'pip install awscli':
    require => Package['python-pip']
  }
}
