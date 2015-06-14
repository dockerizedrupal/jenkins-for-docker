class jenkins::nginx::timeout {
  file { '/etc/nginx/conf.d/timeout.conf':
    ensure => present,
    content => template('jenkins/timeout.conf.erb'),
    mode => 644
  }
}
