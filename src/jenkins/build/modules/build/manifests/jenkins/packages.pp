class build::jenkins::packages {
  bash_exec { 'wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -': }

  file { '/etc/apt/sources.list.d/jenkins.list':
    ensure => present,
    source => 'puppet:///modules/build/etc/apt/sources.list.d/jenkins.list',
    require => Bash_exec['wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -']
  }

  bash_exec { 'JENKINS=1 apt-get update':
    require => File['/etc/apt/sources.list.d/jenkins.list']
  }

  package {[
      'jenkins'
    ]:
    ensure => present,
    require => Bash_exec['JENKINS=1 apt-get update']
  }
}
