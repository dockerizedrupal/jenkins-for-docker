node default {
  include jenkins
  include jenkins::docker
  include jenkins::machine
  include jenkins::nodejs
  include jenkins::subversion
  include jenkins::ftp
  include jenkins::ncftp
  include jenkins::lftp
}
