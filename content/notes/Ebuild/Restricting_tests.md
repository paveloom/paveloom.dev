+++
title = "Restricting tests"
+++

There is a common pattern of setting `RESTRICT="!test? ( test )"` in an ebuild. It restricts tests if the `test` USE flag is not enabled. This is often necessary if the `test` USE flag is used to bring extra dependencies or to enable extra switches at the configuration time.

See also:

- [Gentoo Forums: FEATURES="test": confusion about how it works](https://forums.gentoo.org/viewtopic-p-8721179.html?sid=01faee78fe2c827fc0d6db3e6e3048e0)
