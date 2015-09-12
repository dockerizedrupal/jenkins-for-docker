class jenkins::jq {
  file { '/tmp/jq':
    ensure => present,
    source => 'puppet:///modules/jenkins/tmp/jq-linux64',
    mode => 755
  }

  bash_exec { 'mv /tmp/jq /usr/local/bin/jq':
    require => File['/tmp/jq']
  }
}
