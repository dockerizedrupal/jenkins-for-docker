class run::jenkins {
  bash_exec { 'mkdir -p /jenkins/home': }

  bash_exec { 'mkdir -p /jenkins/data':
    require => Bash_exec['mkdir -p /jenkins/home']
  }

  bash_exec { 'chown -R jenkins.jenkins /jenkins':
    require => Bash_exec['mkdir -p /jenkins/data']
  }
}
