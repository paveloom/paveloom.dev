+++
title = "Update workflow"
+++

There are three ebuild repositories that I have forked and have a local checkout of: 

- [`gentoo`](@/notes/Repositories/Personal/Gentoo.md#gentoo)
- [`guru`](@/notes/Repositories/Personal/Gentoo.md#guru)
- [`steam-overlay`](@/notes/Repositories/Personal/Gentoo.md#steam-overlay)

Here's how remotes are set up for `gentoo` (similar for other repositories):

1. Running `git remote show` prints

   ```
   origin
   upstream
   ```

2. Running `git remote show origin` prints

   ```
   * remote origin
     Fetch URL: git@gitlab.com:paveloom-g/personal/gentoo/gentoo.git
     Push  URL: git@gitlab.com:paveloom-g/personal/gentoo/gentoo.git
     Push  URL: git@github.com:paveloom/gentoo-gentoo.git
     Push  URL: ssh://git@codeberg.org/paveloom/gentoo-gentoo.git
     HEAD branch: system
     Remote branches:
       master tracked
       system tracked
     Local branches configured for 'git pull':
       master merges with remote master
       system merges with remote system
     Local refs configured for 'git push':
       master pushes to master (up to date)
       system pushes to system (up to date)
   ```

3. Running `git remote show upstream` prints

   ```
   * remote upstream
     Fetch URL: git@github.com:gentoo/gentoo.git
     Push  URL: git@github.com:gentoo/gentoo.git
     HEAD branch: master
     Remote branch:
       master tracked
     Local ref configured for 'git push':
       master pushes to master (up to date)
   ```

Typical system update procedure:

1. Update each of the local repositories:

   ```bash
   git checkout master
   git pull upstream master
   git push
   git checkout system
   git rebase master
   git push -f
   ```

2. Synchronize the system repositories with `emerge --sync`.

3. Update the system with `emerge -uND @world`.
