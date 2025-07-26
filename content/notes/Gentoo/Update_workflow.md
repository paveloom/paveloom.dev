+++
title = "Gentoo > Update workflow"
+++

See also the [parent note](@/notes/Gentoo/_index.md).

There are two local repositories, `gentoo` and `guru`.

Here's how the remotes are set up for `gentoo`:

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

Here's how the remotes are set up for `guru`:

1. Running `git remote show` prints

   ```
   mirror
   origin
   upstream
   ```

2. Running `git remote show mirror` prints

   ```
   * remote mirror
     Fetch URL: git@github.com:gentoo/guru.git
     Push  URL: git@github.com:gentoo/guru.git
     HEAD branch: master
     Remote branches:
       dev    tracked
       master tracked
     Local refs configured for 'git push':
       dev    pushes to dev    (up to date)
       master pushes to master (up to date)
   ```

3. Running `git remote show origin` prints

   ```
   * remote origin
     Fetch URL: git@gitlab.com:paveloom-g/personal/gentoo/guru.git
     Push  URL: git@gitlab.com:paveloom-g/personal/gentoo/guru.git
     Push  URL: git@github.com:paveloom/gentoo-guru.git
     Push  URL: ssh://git@codeberg.org/paveloom/gentoo-guru.git
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

4. Running `git remote show upstream` prints

   ```
   * remote upstream
     Fetch URL: git@git.gentoo.org:repo/proj/guru.git
     Push  URL: git@git.gentoo.org:repo/proj/guru.git
     HEAD branch: master
     Remote branches:
       dev    tracked
       master tracked
     Local branch configured for 'git pull':
       dev merges with remote dev
     Local refs configured for 'git push':
       dev    pushes to dev    (up to date)
       master pushes to master (up to date)
   ```

Typical system update procedure:

1. Update the `gentoo` repository:

   ```bash
   git checkout master
   git pull upstream master
   git push
   git checkout system
   git rebase master
   git push -f
   ```

2. Update the `guru` repository:

   ```bash
   git checkout master
   git pull upstream master
   git push
   git checkout system
   git rebase master
   git push -f
   ```

3. Synchronize the system repositories with `emerge --sync`.

4. Update the system with `emerge -uND @world`.
