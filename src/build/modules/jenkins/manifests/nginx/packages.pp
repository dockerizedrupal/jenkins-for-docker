class jenkins::nginx::packages {
  exec { '/bin/bash -c "wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -"': }

  file { '/etc/apt/sources.list.d/nginx.list':
    ensure => present,
    source => 'puppet:///modules/jenkins/etc/apt/sources.list.d/nginx.list',
    mode => 644,
    require => Exec['/bin/bash -c "wget -q -O - http://nginx.org/keys/nginx_signing.key | apt-key add -"']
  }

  exec { '/bin/bash -c "NGINX=1 apt-get update"':
    require => File['/etc/apt/sources.list.d/nginx.list']
  }

  package {[
      'nginx'
    ]:
    ensure => present,
    require => Exec['/bin/bash -c "NGINX=1 apt-get update"']
  }
}
