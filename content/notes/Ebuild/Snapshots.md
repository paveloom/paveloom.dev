+++
title = "Ebuild > Snapshots"
+++

See also the [parent note](@/notes/Ebuild/_index.md).

There are two ways to name an ebuild which packages a snapshot version of a source repository:

1. `${last_released_version}_pYYYYMMDD`: treat the snapshot as a patch to the last released version.

2. `${upcoming_version}_preYYYYMMDD`: treat the snapshot as a prerelease of an upcoming version.

It's common to assume `$upcoming_version` to be `0` or `0.0.1` for repositories without tags.

See [Gentoo Development Guide > Snapshots and live ebuilds](https://devmanual.gentoo.org/ebuild-writing/file-format/index.html#snapshots-and-live-ebuilds).
