+++
title = "frp"
+++

*frp* is a fast reverse proxy that allows you to expose a local server located behind a NAT or firewall to the Internet. It currently supports TCP and UDP, as well as HTTP and HTTPS protocols, enabling requests to be forwarded to internal services via domain name.

Links:

- [Source code](https://github.com/fatedier/frp)

## Example

The following is an example of making a WebDAV server hosted on the client's hardware in a home network with dynamic IP available to the world through HTTP via an *frp* proxy running on the server.

One can also add a TLS termination proxy in the mix to secure the connection.

Server configuration:

```toml
# /etc/frp/frps.toml

bindAddr = "0.0.0.0"
bindPort = 7000
vhostHTTPPort = 80
auth.token = "TOKEN"
subDomainHost = "frp.example.com"
```

Client configuration:

```toml
# /etc/frp/frpc.toml

user = "laptop"
serverAddr = "frp.example.com"
serverPort = 7000
loginFailExit = false

auth.method = "token"
auth.token = "TOKEN"

[[proxies]]
name = "webdav"
type = "http"
localPort = 4918
subdomain = "webdav"
```
