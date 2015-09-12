class build::jenkins {
  require build::nginx
  require build::jenkins::packages
  require build::jenkins::supervisor

  bash_exec { 'usermod -d /jenkins/home jenkins': }
}
