node default {
  include jenkins
  include jenkins::docker
  include jenkins::machine
  include jenkins::nodejs
  include jenkins::subversion
}
