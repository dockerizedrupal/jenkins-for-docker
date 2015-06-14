class jenkins::nginx {
  include jenkins::nginx::timeout

  if $http and $https {
    if ! file_exists('/jenkins/ssl/certs/jenkins.crt') {
      require jenkins::nginx::ssl
    }

    file { '/etc/nginx/conf.d/http_https.conf':
      ensure => present,
      content => template('jenkins/http_https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/http_https-ssl.conf':
      ensure => present,
      content => template('jenkins/http_https-ssl.conf.erb'),
      mode => 644
    }
  }
  elsif $http {
    file { '/etc/nginx/conf.d/http.conf':
      ensure => present,
      content => template('jenkins/http.conf.erb'),
      mode => 644
    }
  }
  elsif $https {
    if ! file_exists('/jenkins/ssl/certs/jenkins.crt') {
      require jenkins::nginx::ssl
    }

    file { '/etc/nginx/conf.d/https.conf':
      ensure => present,
      content => template('jenkins/https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/https-ssl.conf':
      ensure => present,
      content => template('jenkins/https-ssl.conf.erb'),
      mode => 644
    }
  }
}
