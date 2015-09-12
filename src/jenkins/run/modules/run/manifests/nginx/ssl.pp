class run::nginx::ssl {
  bash_exec { 'mkdir -p /jenkins/ssl': }

  bash_exec { 'mkdir -p /jenkins/ssl/private':
    require => Bash_exec['mkdir -p /jenkins/ssl']
  }

  bash_exec { 'mkdir -p /jenkins/ssl/certs':
    require => Bash_exec['mkdir -p /jenkins/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('run/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /jenkins/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /jenkins/ssl/private/jenkinsCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkinsCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /jenkins/ssl/private/jenkinsCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /jenkins/ssl/private/jenkins.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkinsCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('run/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /jenkins/ssl/private/jenkins.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /jenkins/ssl/private/jenkins.key -out /jenkins/ssl/certs/jenkins.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /jenkins/ssl/certs/jenkins.csr -CA /jenkins/ssl/certs/jenkinsCA.crt -CAkey /jenkins/ssl/private/jenkinsCA.key -out /jenkins/ssl/certs/jenkins.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /jenkins/ssl/private/jenkins.key -out /jenkins/ssl/certs/jenkins.csr"]
  }
}
