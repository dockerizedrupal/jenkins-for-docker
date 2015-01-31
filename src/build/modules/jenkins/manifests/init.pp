class jenkins {
  require jenkins::nginx
  require jenkins::packages
  require jenkins::supervisor

  exec { 'usermod -d /jenkins/home jenkins':
    path => ['/usr/sbin']
  }
}
