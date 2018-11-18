# Supported tags and respective `Dockerfile` links

- [`latest`](https://github.com/nicholasdille/docker-auth-proxy/blob/master/Dockerfile)

# Purpose

This container image launches nginx as a reverse proxy. It listens on port 2376/tcp and forwards requests to the local Docker daemon socker `/var/run/docker.sock`. IT does not support insecure connections on 2375/tcp.

# Usage

Example usage:

```bash
docker run -d \
    --env CA_CRT=$(cat ca.pem) \
    --env SERVER_KEY=$(cat server_key.pem) \
    --env SERVER_CRT=$(cat server_cert.pem) \
    --net=host
    docker-auth-proxy
```

The following variables are supported:

## `CA_CRT`

... must contain the PEM formatted certificate for the certificate authority

## `SERVER_KEY`

... must contain the PEM formatted private key for the server certificate

## `SERVER_CRT`

... must contain the PEM formatted server certificate