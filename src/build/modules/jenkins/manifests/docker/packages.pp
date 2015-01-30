class jenkins::docker::packages {
  exec { '/bin/bash -c "curl -sSL https://test.docker.com/ubuntu/ | sh"': }
}
