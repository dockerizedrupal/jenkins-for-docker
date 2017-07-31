#!/usr/bin/env bash

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"

if [ -z "${TIMEOUT}" ]; then
  TIMEOUT="300"
fi

export FACTER_TIMEOUT="${TIMEOUT}"

if [ -z "${PROTOCOLS}" ]; then
  PROTOCOLS="https,http"
fi

PROTOCOLS=$(echo "${PROTOCOLS}" | tr "," "\n")

for PROTOCOL in ${PROTOCOLS}; do
  if [ "${PROTOCOL}" == "http" ]; then
    export FACTER_HTTP="1"
  fi

  if [ "${PROTOCOL}" == "https" ]; then
    export FACTER_HTTPS="1"
  fi
done

if [ -z "${OPENVPN}" ]; then
  OPENVPN="Off"
fi

if [ "${OPENVPN}" == "True" ]; then
  OPENVPN="On"
fi

export FACTER_OPENVPN="${OPENVPN}"

if [ -z "${OPENVPN_DEVICE}" ]; then
  OPENVPN_DEVICE="TAP"
fi

export FACTER_OPENVPN_DEVICE="${OPENVPN_DEVICE}"

export FACTER_OPENVPN_HOST="${OPENVPN_HOST}"

if [ -z "${OPENVPN_PORT}" ]; then
  OPENVPN_PORT="1194"
fi

export FACTER_OPENVPN_PORT="${OPENVPN_PORT}"

if [ -z "${OPENVPN_PROTO}" ]; then
  OPENVPN_PROTO="udp"
fi

export FACTER_OPENVPN_PROTO="${OPENVPN_PROTO}"

export FACTER_OPENVPN_USERNAME="${OPENVPN_USERNAME}"
export FACTER_OPENVPN_PASSWORD="${OPENVPN_PASSWORD}"

export FACTER_OPENVPN_CA_CERTIFICATE="${OPENVPN_CA_CERTIFICATE}"
