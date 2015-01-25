class jenkins {
  require jenkins::nginx
  require jenkins::packages
  require jenkins::supervisor
}
