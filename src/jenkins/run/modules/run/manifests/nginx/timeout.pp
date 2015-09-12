class run::nginx::timeout {
  file { '/etc/nginx/conf.d/timeout.conf':
    ensure => present,
    content => template('run/timeout.conf.erb'),
    mode => 644
  }
}
