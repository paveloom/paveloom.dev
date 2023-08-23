---
date: 2021-07-20
---

# How to access a local server running inside WSL 2?

<!-- separator -->

Usually, this is straightforward: you visit `127.0.0.1:$PORT` on your host system, done. Well, except when it doesn't work.

You can, however, use internal WSL IP, which is always available. Type `ifconfig` in your terminal and grab the first IP in the `inet` row in the `eth0` section. Use this IP instead of the local one above.

It may also occur that you need to explicitly tell the server to use this IP instead of the local interface. For example, for [Zola](https://github.com/getzola/zola), this is done by specifying the `-i` flag.
