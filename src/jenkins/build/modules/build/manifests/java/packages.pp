class build::java::packages {
  file { '/etc/apt/sources.list.d/webupd8team-java.list':
    ensure => present,
    source => 'puppet:///modules/build/etc/apt/sources.list.d/webupd8team-java.list',
    mode => 644
  }

  bash_exec { 'echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections':
    require => File['/etc/apt/sources.list.d/webupd8team-java.list']
  }

  bash_exec { 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886':
    require => Bash_exec['echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections']
  }

  bash_exec { 'apt-get update':
    require => Bash_exec['apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886']
  }

  package {[
    'oracle-java8-installer'
  ]:
    ensure => present,
    require => Bash_exec['apt-get update']
  }

  bash_exec { 'apt-get install oracle-java8-set-default':
    require => Package['oracle-java8-installer']
  }
}
