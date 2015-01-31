class jenkins {
  require jenkins::nginx

  exec { 'mkdir -p /jenkins/home':
    path => ['/bin']
  }

  exec { 'mkdir -p /jenkins/data':
    path => ['/bin'],
    require => Exec['mkdir -p /jenkins/home']
  }

  exec { 'chown -R jenkins.jenkins /jenkins':
    path => ['/bin'],
    require => Exec['mkdir -p /jenkins/data']
  }
}
