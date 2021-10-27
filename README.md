# GoAnywhere Gateway Docker

Docker wrapper for https://www.goanywhere.com/gateway that is automatically updated and patched thanks @dependabot !

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

## Tags

I publish a few tags

- `latest` is the most current and **mutable**
- `2.8.3` (or similar version numbers) is always the most recent [centos base](https://hub.docker.com/r/_/centos) with 2.8.3 of goanywhere gateway running and **mutable**
- `centos-8.4.2105-2.8.3` (or similar version numbers) is the versioned centos with the versioned goanywhere gateway and should be considered **immutable**
- `sha-42fe666050666f97dde7b0c658f7f9ce758f328e` is the git sha at the time of the build and should be considered **immutable**

If you care you can of course use the SHA in the pull too:

```
docker pull ghcr.io/chrisns/goanywhere-gateway-docker:centos-8.4.2105-2.8.3@sha256:6a33795969176d4153ae6880c4f699bbc4f9e651dd67129cbb10b35610895c1c
```

## How is this different from the [official image](https://hub.docker.com/r/helpsystems/goanywhere-gateway)?

- Runs as non-root
- Current and patched base image
- stdOut logs by default
- image is signed with [cosign](https://github.com/sigstore/cosign)
