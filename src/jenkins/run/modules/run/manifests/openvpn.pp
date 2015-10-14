class run::openvpn {
  include run::openvpn::supervisor

  bash_exec { 'mkdir -p /dev/net': }

  if $openvpn_device == "TAP" {
    file { '/etc/openvpn/jenkins-tap.conf':
      ensure => present,
      content => template('run/jenkins-tap.conf.erb'),
      mode => 644
    }

    bash_exec { 'mknod /dev/net/tun c 10 200':
      require => Bash_exec['mkdir -p /dev/net']
    }
  }

  file { '/etc/openvpn/jenkins.auth':
    ensure => present,
    content => template('run/jenkins.auth.erb'),
    mode => 600
  }

  file { '/etc/openvpn/CA.crt':
    ensure => present,
    content => template('run/CA.crt.erb'),
    mode => 600
  }

  bash_exec { 'addgroup --system vpn': }
}
