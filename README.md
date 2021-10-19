# GoAnywhere Gateway Docker

Docker wrapper for https://www.goanywhere.com/gateway that is automatically updated and patched

[![GitHub issues](https://img.shields.io/github/issues/chrisns/goanywhere-gateway-docker.svg)](https://github.com/chrisns/goanywhere-gateway-docker/issues)
[![GitHub forks](https://img.shields.io/github/forks/chrisns/goanywhere-gateway-docker.svg)](https://github.com/chrisns/goanywhere-gateway-docker/network)
[![GitHub stars](https://img.shields.io/github/stars/chrisns/goanywhere-gateway-docker.svg)](https://github.com/chrisns/goanywhere-gateway-docker/stargazers)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chrisns/goanywhere-gateway-docker/master/LICENSE)
[![Docker Stars](https://img.shields.io/docker/stars/chrisns/goanywhere-gateway-docker.svg)](https://hub.docker.com/r/chrisns/goanywhere-gateway-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/chrisns/goanywhere-gateway-docker.svg)](https://hub.docker.com/r/chrisns/goanywhere-gateway-docker)
[![Security Scanning](https://github.com/chrisns/goanywhere-gateway-docker/actions/workflows/security.yml/badge.svg)](https://github.com/chrisns/goanywhere-gateway-docker/actions/workflows/security.yml)
[![Build](https://github.com/chrisns/goanywhere-gateway-docker/actions/workflows/ci.yml/badge.svg)](https://github.com/chrisns/goanywhere-gateway-docker/actions/workflows/ci.yml)

## Usage

```shell
$ # store your license in ./gateway.lic
$ docker run --net=host \
  -v ${PWD}/gateway.lic:/usr/local/HelpSystems/GoAnywhere_Gateway/gateway.lic \
  ghcr.io/chrisns/goanywhere-gateway-docker
```

Also see [the accompanying helm chart](https://github.com/chrisns/goanywhere-gateway-helmchart)
