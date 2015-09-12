class build::composer::packages {
  require build::php

  bash_exec { 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename composer':
    timeout => 0
  }
}
