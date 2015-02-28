class jenkins::nginx {
  if ! file_exists('/jenkins/ssl/certs/jenkins.crt') {
    require jenkins::nginx::ssl
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => present,
    content => template('jenkins/default.conf.erb'),
    mode => 644
  }

  file { '/etc/nginx/conf.d/default-ssl.conf':
    ensure => present,
    content => template('jenkins/default-ssl.conf.erb'),
    mode => 644
  }
}
