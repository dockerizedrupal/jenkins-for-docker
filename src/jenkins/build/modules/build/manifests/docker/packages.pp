class build::docker::packages {
  bash_exec { 'wget -qO- https://get.docker.com/ | sh': }
}
