class build::jenkins {
  require build::jenkins::nginx
  require build::jenkins::packages
  require build::jenkins::supervisor

  bash_exec { 'usermod -d /jenkins/home jenkins': }
}
