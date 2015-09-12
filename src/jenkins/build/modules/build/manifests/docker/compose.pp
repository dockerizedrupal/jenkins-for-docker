class build::docker::compose {
  file { '/tmp/docker-compose-Linux-x86_64':
    ensure => present,
    source => 'puppet:///modules/build/tmp/docker-compose-Linux-x86_64',
    mode => 755
  }

  bash_exec { 'mv /tmp/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose':
    require => File['/tmp/docker-compose-Linux-x86_64']
  }
}
