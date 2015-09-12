class run::nginx {
  include run::nginx::timeout

  if $http and $https {
    if ! file_exists('/jenkins/ssl/certs/jenkins.crt') {
      require run::nginx::ssl
    }

    file { '/etc/nginx/conf.d/http_https.conf':
      ensure => present,
      content => template('run/http_https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/http_https-ssl.conf':
      ensure => present,
      content => template('run/http_https-ssl.conf.erb'),
      mode => 644
    }
  }
  elsif $http {
    file { '/etc/nginx/conf.d/http.conf':
      ensure => present,
      content => template('run/http.conf.erb'),
      mode => 644
    }
  }
  elsif $https {
    if ! file_exists('/jenkins/ssl/certs/jenkins.crt') {
      require run::nginx::ssl
    }

    file { '/etc/nginx/conf.d/https.conf':
      ensure => present,
      content => template('run/https.conf.erb'),
      mode => 644
    }

    file { '/etc/nginx/conf.d/https-ssl.conf':
      ensure => present,
      content => template('run/https-ssl.conf.erb'),
      mode => 644
    }
  }
}
