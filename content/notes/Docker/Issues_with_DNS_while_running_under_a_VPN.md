+++
title = "Issues with DNS while running under a VPN"
+++

If you run a Docker container on a host that runs all network traffic through a VPN, you might encounter a situation where your Docker container's DNS resolver is not aware of the VPN's DNS servers. In fact, it is very likely to default to your ISP's DNS servers, which in turn may incur unwanted censoring.

A quick workaround is to override the default nameservers. For example, set the [`dns`](https://docs.docker.com/reference/compose-file/services/#dns) attribute on a service in a Docker Compose file:

```yaml
services:
  service:
    image: host/owner/repo:latest
    restart: unless-stopped
    dns: 1.1.1.1
    networks:
      - network
networks:
  network:
```

Check the contents of the `/etc/resolv.conf` file inside the container afterwards.
