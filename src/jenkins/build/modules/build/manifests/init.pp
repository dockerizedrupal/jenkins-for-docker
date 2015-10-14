class build {
  include build::jenkins
  include build::docker
  include build::docker::machine
  include build::docker::compose
  include build::nodejs
  include build::subversion
  include build::ftp
  include build::ncftp
  include build::lftp
  include build::jq
  include build::awscli
  include build::git_svn
  include build::php
  include build::composer
  include build::ansible
  include build::openvpn
}
