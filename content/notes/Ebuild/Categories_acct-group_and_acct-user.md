+++
title = "Ebuild > Categories acct-group and acct-user"
+++

See also the [parent note](@/notes/Ebuild/_index.md).

The packages in the categories `acct-user` and `acct-group` are used to create new users and user groups, respectively, allowing other packages to require the existence of such users and groups.

Example of a new user ebuild:

```bash
# acct-group/webdav/webdav-0.ebuild

EAPI=8

inherit acct-group

DESCRIPTION="Group for net-fs/webdav-server-rs"

ACCT_GROUP_ID=-1
```

Example of a new group ebuild:

```bash
# acct-user/webdav/webdav-0.ebuild

EAPI=8

inherit acct-user

DESCRIPTION="User for net-fs/webdav-server-rs"

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( ${PN} )

acct-user_add_deps
```

Example of declaring the dependence on the existence of this user-group pair:


```bash
# package.ebuild

RDEPEND="
	acct-group/webdav
	acct-user/webdav
"
```

## References

- [Gentoo Wiki: Categories acct-group and acct-user](https://wiki.gentoo.org/wiki/Categories_acct-group_and_acct-user)
