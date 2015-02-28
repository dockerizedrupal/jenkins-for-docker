#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/jenkins/build.sh && /src/jenkins/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/jenkins/variables.sh && /src/jenkins/run.sh"
    ;;
esac
