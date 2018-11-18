# Supported tags and respective `Dockerfile` links

- [`latest`](https://github.com/nicholasdille/docker-auth-proxy/blob/master/Dockerfile)

# Purpose

This container image launches nginx as a reverse proxy. It listens on port 2376/tcp and forwards requests to the local Docker daemon socker `/var/run/docker.sock`. It does not support insecure connections on 2375/tcp.

# Usage

The reverse proxy listens on port 2376/tcp using TLS. All requests are forwarded to the Docker daemon socket which must be mapped:

```bash
docker run -d \
    --env CA_CRT=$(cat ca.pem) \
    --env SERVER_KEY=$(cat server_key.pem) \
    --env SERVER_CRT=$(cat server_cert.pem) \
    --net=host
    --volume /var/run/docker.sock:/var/run/docker.sock
    nicholasdille/docker-auth-proxy
```

The certificates must be created manually before starting the reverse proxy. Please refer to the official documentation how to [protect the Docker daemon socket](https://docs.docker.com/engine/security/https/).

The following variables are supported:

## `CA_CRT`

... must contain the PEM formatted certificate for the certificate authority

## `SERVER_KEY`

... must contain the PEM formatted private key for the server certificate

## `SERVER_CRT`

... must contain the PEM formatted server certificate