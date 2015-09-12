class build::jenkins::supervisor {
  file { '/etc/supervisor/conf.d/jenkins.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/jenkins.conf',
    mode => 644
  }
}
