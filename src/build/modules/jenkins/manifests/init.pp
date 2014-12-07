class jenkins {
  require jenkins::packages
  require jenkins::supervisor

  exec { 'mkdir -p /jenkins/data':
    path => ['/bin']
  }

  file { '/jenkins/data/config.xml':
    ensure => present,
    source => 'puppet:///modules/jenkins/jenkins/data/config.xml',
    mode => 644,
    require => Exec['mkdir -p /jenkins/data']
  }
}
