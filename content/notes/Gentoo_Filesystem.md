+++
title = "Gentoo: Filesystem"
+++

Gentoo adheres to the following filesystem layout:

- `/bin`: Boot-critical applications
- `/etc`: System administrator controlled configuration files
- `/lib`: Boot-critical libraries
- `/opt`: Non-standard layout applications
- `/sbin`: System administrator boot-critical applications
- `/tmp`: Temporary data
- `/usr`: General applications
  - `/usr/bin`: Applications
  - `/usr/lib`: Libraries
  - `/usr/local`: Non-Portage applications. Ebuilds must not install here.
  - `/usr/sbin`: Non-system-critical system administrator applications
  - `/usr/share`: Architecture independent application data and documentation
- `/var`: Program generated data
  - `/var/cache`: Long term data which can be regenerated
  - `/var/lib`: General application generated data
  - `/var/log`: Log files

On most Gentoo systems, though, some of those paths will be symlinks. For example,

- `/bin -> usr/bin`
- `/lib -> usr/lib`
- `/sbin -> usr/bin`
- `/usr/sbin -> bin`

## References

- [Gentoo Development Guide: Filesystem](https://devmanual.gentoo.org/general-concepts/filesystem/index.html)
