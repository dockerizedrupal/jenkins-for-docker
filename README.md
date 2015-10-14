# docker-jenkins

A Docker image for [Jenkins](http://jenkins-ci.org/) with [Nginx](http://nginx.org/) in front of it providing support for HTTPS.

## Run the container

    CONTAINER="jenkins-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins \
      dockerizedrupal/data:1.1.0

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from jenkins-data \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -d \
      dockerizedrupal/jenkins:1.1.1

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.1 \
      && sudo docker build -t dockerizedrupal/jenkins:1.1.1 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## Back up Jenkins data

    sudo tools/jenkinsdata backup

## Restore Jenkins data from a backup

    sudo tools/jenkinsdata restore

## License

**MIT**
