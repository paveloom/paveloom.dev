+++
title = "GnuPG"
+++

## Creating keys

Follow the [Gentoo Infrastructure guide](https://wiki.gentoo.org/wiki/Project:Infrastructure/Generating_GLEP_63_based_OpenPGP_keys) for creating new keys.

## SSH

Follow the [Gentoo Wiki excerpt](https://wiki.gentoo.org/wiki/GnuPG#GPG_Agent) for setting up a GPG agent for SSH.

Generate ECC keys, though, as those are much more secure.

Here's a snippet to put into `/etc/bash/bashrc`:

```bash
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    gpgconf --launch gpg-agent
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
```

