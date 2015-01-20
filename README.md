# docker-jenkins

A [Docker](https://docker.com/) container for [Jenkins](http://jenkins-ci.org/).

## Run the container

Using the `docker` command:

    CONTAINER="jenkinsdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins/data \
      simpledrupalcloud/data:latest

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 8080:8080 \
      --volumes-from jenkinsdata \
      -d \
      simpledrupalcloud/jenkins:latest

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout latest \
      && sudo docker build -t simpledrupalcloud/jenkins:latest . \
      && cd -

## Back up Jenkins data

    sudo docker run \
      --rm \
      --volumes-from jenkinsdata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar czvf /backup/jenkinsdata.tar.gz /jenkins/data

## Restore Jenkins data from a backup

    sudo docker run \
      --rm \
      --volumes-from jenkinsdata \
      -v $(pwd):/backup \
      simpledrupalcloud/base:latest tar xzvf /backup/jenkinsdata.tar.gz

## License

**MIT**
