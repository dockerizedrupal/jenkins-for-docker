class build::docker::machine {
  file { '/tmp/docker-machine-Linux-x86_64':
    ensure => present,
    source => 'puppet:///modules/build/tmp/docker-machine-Linux-x86_64',
    mode => 755
  }

  bash_exec { 'mv /tmp/docker-machine-Linux-x86_64 /usr/local/bin/docker-machine':
    require => File['/tmp/docker-machine-Linux-x86_64']
  }
}
