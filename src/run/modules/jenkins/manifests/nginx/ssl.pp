class jenkins::nginx::ssl {
  exec { 'mkdir -p /jenkins/ssl':
    path => ['/bin']
  }

  exec { 'mkdir -p /jenkins/ssl/private':
    path => ['/bin'],
    require => Exec['mkdir -p /jenkins/ssl']
  }

  exec { 'mkdir -p /jenkins/ssl/certs':
    path => ['/bin'],
    require => Exec['mkdir -p /jenkins/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('jenkins/opensslCA.cnf.erb'),
    require => Exec['mkdir -p /jenkins/ssl/certs']
  }

  exec { 'openssl genrsa -out /jenkins/ssl/private/jenkinsCA.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/opensslCA.cnf']
  }

  exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkinsCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /jenkins/ssl/private/jenkinsCA.key 4096']
  }

  exec { 'openssl genrsa -out /jenkins/ssl/private/jenkins.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkinsCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('jenkins/openssl.cnf.erb'),
    require => Exec['openssl genrsa -out /jenkins/ssl/private/jenkins.key 4096']
  }

  exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /jenkins/ssl/private/jenkins.key -out /jenkins/ssl/certs/jenkins.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/openssl.cnf']
  }

  exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /jenkins/ssl/certs/jenkins.csr -CA /jenkins/ssl/certs/jenkinsCA.crt -CAkey /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkins.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -config /root/openssl.cnf -key /jenkins/ssl/private/jenkins.key -out /jenkins/ssl/certs/jenkins.csr"]
  }
}
