+++
title = "Dependencies"
+++

To figure out what a binary depends on, you can either

- Run `scanelf -n <program>`
- Run `objdump -p <program> | grep NEEDED`
- Read QA messages made during the build of an ebuild
- Run `ldd <program>`

Note that `ldd` will show more runtime dependencies than strictly needed in an ebuild.

Use `equery belongs` to figure out which package the shared library object comes from.
