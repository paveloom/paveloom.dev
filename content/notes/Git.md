+++
title = "Git"
+++

Git is a free and open source distributed version control system.

Links:

- [Site](https://git-scm.com)

You might have been searching for the [list of my repositories](@/notes/Repositories/_index.md) instead.

## Tips

### Searching commits

You can use `git log --grep` to find a commit that matches a specific keyword.

### Restoring files

Knowing a commit hash, you can view the tree related to that commit by calling `git show HASH:`. You can access any file in that tree by adding its relative path after the colon, for example, `git show HASH:path/to/file`. Thus, to restore a file, redirect the standard output somewhere, for example, `git show HASH:path/to/file > path/to/file`.

To restore all files in the current working tree, run `git restore :/`.
