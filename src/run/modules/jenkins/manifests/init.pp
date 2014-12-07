class jenkins {
  file { '/jenkins/data/config.xml':
    ensure => present,
    source => 'puppet:///modules/jenkins/jenkins/data/config.xml',
    mode => 644,
    creates => '/jenkins/data/config.xml'
  }

  exec { 'chown -R jenkins.jenkins /jenkins':
    path => ['/bin'],
    require => File['/jenkins/data/config.xml']
  }
}
