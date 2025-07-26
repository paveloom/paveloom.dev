+++
title = "webdav-server-rs"
+++

`webdav-server-rs` is an implementation of the WebDAV server. It is a single binary deployment, in contrast to Apache WebDAV. It has support for user accounts and switching UID/GID to those user accounts on Linux.

Links:

- [Source code](https://github.com/miquels/webdav-server-rs)
- [Repology](https://repology.org/project/webdav-server-rs/versions)

## Example

Example configuration:

```toml
# /etc/webdav-server-rs/config.toml

[server]
listen = [ "0.0.0.0:4918", "[::]:4918" ]
uid = 999
gid = 999

[accounts]
auth-type = "htpasswd.webdav"
acct-type = "unix"

[htpasswd.webdav]
htpasswd = "/etc/webdav-server-rs/webdav.htpasswd"

[unix]
cache-timeout = 120
min-uid = 1000

[[location]]
route = [ "/*path" ]
methods = [ "webdav-rw" ]
auth = "true"
handler = "filesystem"
setuid = true
directory = "~/Public/WebDAV"
autoindex = true
hide-symlinks = false
```
