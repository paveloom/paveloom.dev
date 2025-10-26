+++
title = "Connecting via Halloy"
+++

Here's an example of connecting to ZNC via [Halloy](https://halloy.chat):

```toml
[servers.libera]
nickname = "paveloom/libera"
server = "znc.paveloom.dev"
password_file = "/home/paveloom/.config/halloy/password"
dangerously_accept_invalid_certs = true
use_tls = true
```

Note that accepting invalid certificates is necessary if a [signed SSL certificate](https://wiki.znc.in/Signed_SSL_certificate) wasn't set up for the ZNS endpoint.
