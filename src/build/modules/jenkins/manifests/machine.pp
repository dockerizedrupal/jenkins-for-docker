class jenkins::machine {
  file { '/tmp/docker-machine_linux-amd64':
    ensure => present,
    source => 'puppet:///modules/jenkins/tmp/docker-machine_linux-amd64',
    mode => 755
  }

  exec { 'mv /tmp/docker-machine_linux-amd64 /usr/local/bin/machine':
    path => ['/bin'],
    require => File['/tmp/docker-machine_linux-amd64']
  }
}
