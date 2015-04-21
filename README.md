# docker-jenkins

A [Docker](https://docker.com/) container for [Jenkins](http://jenkins-ci.org/) with [Nginx](http://nginx.org/) in front of it providing HTTPS.

## Run the container

Using the `docker` command:

    CONTAINER="jenkinsdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins/data \
      viljaste/data:dev

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from jenkinsdata \
      -d \
      viljaste/jenkins:dev

Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t viljaste/jenkins:dev . \
      && cd -

## Back up Jenkins data

    sudo tools/jenkinsdata backup
    
## Restore Jenkins data from a backup

    sudo tools/jenkinsdata restore

## License

**MIT**
