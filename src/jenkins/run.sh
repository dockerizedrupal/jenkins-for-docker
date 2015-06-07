#!/usr/bin/env bash

puppet apply --modulepath=/src/jenkins/run/modules /src/jenkins/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
