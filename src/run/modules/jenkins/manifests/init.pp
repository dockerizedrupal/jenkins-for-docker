class jenkins {
  file { '/jenkins/data/config.xml':
    ensure => present,
    source => 'puppet:///modules/jenkins/jenkins/data/config.xml',
    mode => 644,
    creates => '/jenkins/data/config.xml'
  }
}
