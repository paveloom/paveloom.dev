+++
title = "Docker Compose workflow"
+++

Using Traefik together with Docker Compose and a Docker image registry makes it fairly easy to deploy services to the server. Here's an example of a setup.

1. Make sure the Docker image is visible to Traefik by setting the proper labels:

   ```yaml
   # compose.yaml
   name: project
   services:
     service:
       build:
         context: .
       image: host/owner/repo:latest
       restart: unless-stopped
       networks:
         - traefik
       labels:
         - traefik.enable=true
         - traefik.docker.network=traefik
   networks:
     traefik:
       external: true
   ```

   Make sure the `traefik` network exists locally:

   ```bash
   docker network create traefik
   ```

   See below how it is created on the server.

2. On the server, set up Traefik.

   Layout:

   ```
   $ tree -I certificates
   .
   ├── compose.yaml
   ├── dynamic
   │   └── service.yaml
   ├── traefik.env
   └── traefik.yaml
   ```

   The `traefik.env` file can contain the credentials for a [DNS provider](https://go-acme.github.io/lego/dns/), for example.

   Docker Compose file:

   ```yaml
   # compose.yaml
   name: traefik
   services:
     traefik:
       image: traefik:latest
       restart: unless-stopped
       ports:
         - 80:80
         - 443:443
       networks:
         - traefik
       env_file: ./traefik.env
       volumes:
         - ./certificates:/etc/traefik/certificates
         - ./dynamic:/etc/traefik/dynamic:ro
         - ./traefik.yaml:/etc/traefik/traefik.yaml:ro
         - /etc/localtime:/etc/localtime:ro
         - /var/run/docker.sock:/var/run/docker.sock:ro
     traefik-certs-dumper:
       image: ghcr.io/kereis/traefik-certs-dumper:latest
       restart: unless-stopped
       depends_on:
         - traefik
       networks:
         - traefik
       volumes:
         - ./certificates:/traefik:ro
         - ./certificates/dump:/output
         - /etc/localtime:/etc/localtime:ro
   networks:
     traefik:
       name: traefik
       enable_ipv6: true
       ipam:
         driver: default
         config:
           - subnet: 172.18.0.0/16
             gateway: 172.18.0.1
           - subnet: fdae:58bf:a627::/64
             gateway: fdae:58bf:a627::1
   ```

   The manually specified subnets are a subnet in the Class B of the [private IPv4 address range](https://en.wikipedia.org/wiki/Private_network#Private_IPv4_addresses) and a subnet in the [private IPv6 address range](https://en.wikipedia.org/wiki/Private_network#Private_IPv6_addresses). The specific choice is not important.

   Config:

   ```yaml
   # traefik.yaml
   certificatesResolvers:
     letsencrypt:
       acme:
         email: admin@example.com
         storage: /etc/traefik/certificates/acme.json
         dnsChallenge:
           provider: provider
           propagation:
             delayBeforeChecks: 30s
             disableChecks: true
   entryPoints:
     http:
       address: :80
       http3: {}
     https:
       address: :443
       http3: {}
       http:
         tls:
           certResolver: letsencrypt
   providers:
     file:
       directory: /etc/traefik/dynamic
     docker:
       defaultRule: ""
       exposedByDefault: false
   ```

   Router:

   ```yaml
   # dynamic/service.yaml
   http:
     routers:
       root:
         entrypoints:
           - https
         rule: Host(`example.com`)
         service: service-project@docker
   ```

With the setup above, the workflow is fairly straightforward:

1. Build the image locally:

   ```bash
   docker compose build
   ```

2. Push the image to the image registry:

   ```bash
   docker compose push
   ```

3. Pull the image on the server, start or restart the container:

   ```bash
   docker --context server compose up -d --pull always
   ```

   The context can be created as follows:

   ```bash
   docker context create server --docker="host=ssh://root@example.com"
   ```

The first two steps can be automated (e.g., via GitHub Actions) thus reducing the workflow to essentially one command.
