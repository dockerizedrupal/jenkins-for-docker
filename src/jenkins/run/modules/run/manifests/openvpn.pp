class run::openvpn {
  include run::openvpn::supervisor

  bash_exec { 'mkdir -p /dev/net': }

  if $openvpn_device == "TAP" {
    file { '/etc/openvpn/tap.conf':
      ensure => present,
      content => template('run/tap.conf.erb'),
      mode => 644
    }

    bash_exec { 'mknod /dev/net/tun c 10 200':
      require => Bash_exec['mkdir -p /dev/net']
    }
  }

  file { '/etc/openvpn/credentials.auth':
    ensure => present,
    content => template('run/credentials.auth.erb'),
    mode => 600
  }

  file { '/etc/openvpn/CA.crt':
    ensure => present,
    content => template('run/CA.crt.erb'),
    mode => 600
  }

  bash_exec { 'addgroup --system vpn': }
}
