+++
title = "Tips"
+++

## Searching commits

You can use `git log --grep` to find a commit that matches a specific keyword.

## Restoring files

Knowing a commit hash, you can view the tree related to that commit by calling `git show HASH:`. You can access any file in that tree by adding its relative path after the colon, for example, `git show HASH:path/to/file`. Thus, to restore a file, redirect the standard output somewhere, for example, `git show HASH:path/to/file > path/to/file`.

To restore all files in the current working tree, run `git restore :/`.

## Pushing to several repositories under one remote

One remote can have only one fetch URL but many push URLs.

To list information about the remote, run

```bash
git remote show origin
```

To set the fetch URL, run

```bash
git remote set-url origin $URL
```

To add a new push URL, run

```bash
git remote set-url --add --push origin $URL
```

If you just cloned the repo, you might need to run the last command twice.

To delete a push URL, run

```bash
git remote set-url --delete --push origin $URL
```

Running `git push` will then push to all present push URLs.
