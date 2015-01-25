class jenkins {
  exec { 'mkdir -p /jenkins/data':
    path => ['/bin']
  }

  exec { 'chown -R jenkins.jenkins /jenkins':
    path => ['/bin']
  }
}
