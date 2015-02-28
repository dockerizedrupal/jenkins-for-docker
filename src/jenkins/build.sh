#!/usr/bin/env bash

puppet apply --modulepath=/src/jenkins/build/modules /src/jenkins/build/build.pp
