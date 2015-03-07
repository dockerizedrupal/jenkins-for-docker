class jenkins::git_svn::packages {
  package {[
      'git-svn'
    ]:
    ensure => present
  }
}
