class build::git_svn::packages {
  package {[
      'git-svn'
    ]:
    ensure => present
  }
}
