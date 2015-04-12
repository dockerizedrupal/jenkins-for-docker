class jenkins {
  require jenkins::nginx
  require jenkins::packages
  require jenkins::supervisor

  bash_exec { 'usermod -d /jenkins/home jenkins': }
}
