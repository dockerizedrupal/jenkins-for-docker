class jenkins::nginx {
  require jenkins::nginx::packages
  require jenkins::nginx::supervisor

  file { '/etc/nginx/conf.d/example_ssl.conf':
    ensure => absent
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/jenkins/etc/nginx/nginx.conf',
    mode => 644
  }
}
