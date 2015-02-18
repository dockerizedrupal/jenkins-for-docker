#!/usr/bin/env bash

WORKING_DIR="$(pwd)"

help() {
  echo "Usage: jenkinsdata <backup|restore|rm>"

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "Unknown command. See 'jenkinsdata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

jenkinsdata_containers() {
  echo "$(sudo docker ps -a | grep jenkinsdata | awk '{ print $1 }')"
}

shopt -s nullglob

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(jenkinsdata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      sudo docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        simpledrupalcloud/base:latest tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /jenkins
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins \
      simpledrupalcloud/data:latest

    sudo docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      simpledrupalcloud/base:latest tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
elif [ "${1}" = "rm" ]; then
  CONTAINERS="$(jenkinsdata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    sudo docker rm -f ${CONTAINERS}
  fi
else
  unknown_command
fi
