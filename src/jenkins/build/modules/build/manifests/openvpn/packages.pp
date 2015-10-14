class build::openvpn::packages {
  package {[
      'iptables',
      'openvpn'
    ]:
    ensure => present
  }
}
