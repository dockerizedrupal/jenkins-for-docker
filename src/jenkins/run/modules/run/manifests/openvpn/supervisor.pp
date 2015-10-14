class run::openvpn::supervisor {
  if $openvpn_device == "TAP" {
    file { '/etc/supervisor/conf.d/openvpn-tap.conf':
      ensure => present,
      source => 'puppet:///modules/run/etc/supervisor/conf.d/openvpn-tap.conf',
      mode => 644
    }
  }
}
