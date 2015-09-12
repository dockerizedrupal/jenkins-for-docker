class build::ansible {
  require build::ansible::packages

  file { '/tmp/ansible-1.9.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/ansible-1.9.2.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf ansible-1.9.2.tar.gz':
    require => File['/tmp/ansible-1.9.2.tar.gz']
  }

  bash_exec { 'cd /tmp/ansible-1.9.2 && python setup.py install':
    timeout => 0,
    require => Bash_exec['cd /tmp && tar xzf ansible-1.9.2.tar.gz']
  }
}
