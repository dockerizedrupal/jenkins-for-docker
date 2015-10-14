class run {
  include run::jenkins
  include run::nginx
  include run::timezone

  if $openvpn == "On" {
    include run::openvpn
  }
}
