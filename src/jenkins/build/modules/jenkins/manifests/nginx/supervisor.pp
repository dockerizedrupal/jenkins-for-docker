class jenkins::nginx::supervisor {
  file { '/etc/supervisor/conf.d/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/jenkins/etc/supervisor/conf.d/nginx.conf',
    mode => 644
  }
}
