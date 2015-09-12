# docker-jenkins

A [Docker](https://docker.com/) container for [Jenkins](http://jenkins-ci.org/) with [Nginx](http://nginx.org/) in front of it providing HTTPS.

## Run the container

Using the `docker` command:

    CONTAINER="jenkins-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins \
      dockerizedrupal/data:1.0.3

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from jenkins-data \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -d \
      dockerizedrupal/jenkins:1.0.3

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.3 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.3 \
      && sudo docker build -t dockerizedrupal/jenkins:1.0.3 . \
      && cd -

## Back up Jenkins data

    sudo tools/jenkinsdata backup
    
## Restore Jenkins data from a backup

    sudo tools/jenkinsdata restore

## License

**MIT**
