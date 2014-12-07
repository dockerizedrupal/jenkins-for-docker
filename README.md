# docker-jenkins

A [Docker](https://docker.com/) container for [Jenkins CI](http://jenkins-ci.org/).

## Jenkins (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -d \
      simpledrupalcloud/jenkins:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/jenkins:latest . \
      && cd -

## License

**MIT**
