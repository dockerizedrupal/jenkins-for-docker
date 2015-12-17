# docker-jenkins

A Docker image for [Jenkins](http://jenkins-ci.org/) with [Nginx](http://nginx.org/) in front of it providing support for HTTPS. Also supports connecting to OpenVPN server.

## Run the container

    CONTAINER="jenkins-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /jenkins \
      --entrypoint /bin/echo \
      dockerizedrupal/jenkins:1.1.7 "Data-only container for Jenkins."

    CONTAINER="jenkins" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      --volumes-from jenkins-data \
      --cap-add NET_ADMIN \
      -e SERVER_NAME="localhost" \
      -e TIMEZONE="Etc/UTC" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -e OPENVPN="Off" \
      -e OPENVPN_DEVICE="TAP" \
      -e OPENVPN_HOST="" \
      -e OPENVPN_PORT="1194" \
      -e OPENVPN_USERNAME="" \
      -e OPENVPN_PASSWORD="" \
      -e OPENVPN_CA_CERTIFICATE="" \
      -d \
      dockerizedrupal/jenkins:1.1.7

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-jenkins.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.7 \
      && sudo docker build -t dockerizedrupal/jenkins:1.1.7 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## Back up Jenkins data

    sudo tools/jenkinsdata backup

## Restore Jenkins data from a backup

    sudo tools/jenkinsdata restore

## License

**MIT**
