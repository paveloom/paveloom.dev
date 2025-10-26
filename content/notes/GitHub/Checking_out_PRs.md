+++
title = "Checking out PRs"
+++

It is possible to checkout a pull request directly from the upstream repository via Git:

```bash
git fetch upstream refs/pull/$ID/head:$LOCAL_BRANCH
git checkout $LOCAL_BRANCH
```

An alternative would be to add a new remote for the PR author's fork:

```bash
git remote add $FORK $FORK_URL
git fetch $FORK $REMOTE_BRANCH:$LOCAL_BRANCH
git checkout $LOCAL_BRANCH
```
