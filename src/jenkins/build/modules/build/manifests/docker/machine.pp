class build::docker::machine {
  file { '/tmp/docker-machine_linux-amd64':
    ensure => present,
    source => 'puppet:///modules/build/tmp/docker-machine_linux-amd64',
    mode => 755
  }

  bash_exec { 'mv /tmp/docker-machine_linux-amd64 /usr/local/bin/docker-machine':
    require => File['/tmp/docker-machine_linux-amd64']
  }
}
