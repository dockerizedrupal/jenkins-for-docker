# docker-jenkins

A [Docker](https://docker.com/) container for [Jenkins](http://jenkins-ci.org/) with [Nginx](http://nginx.org/) in front of it providing HTTPS.

## Run the container

Using the `docker` command:

    CONTAINER="jenkinsdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins/data \
      viljaste/data:latest

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from jenkinsdata \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https" \
      -d \
      viljaste/jenkins:latest

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/jenkins:latest . \
      && cd -

## Back up Jenkins data

    sudo tools/jenkinsdata backup
    
## Restore Jenkins data from a backup

    sudo tools/jenkinsdata restore

## License

**MIT**
