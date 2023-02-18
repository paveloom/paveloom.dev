#!/usr/bin/env bash

set -e

# A script to install Nix and to build the site

# Expected to be run on an Ubuntu runner

SCRIPTS=$(dirname "${BASH_SOURCE[0]}")

if [ -z "$GITHUB_ACTIONS" ]; then
    apt-get update
    apt-get -y install \
        curl \
        git \
        xz-utils

    mkdir /etc/nix
    mkdir -m 0755 /nix && chown "$USER" /nix
    echo "build-users-group =" > /etc/nix/nix.conf
fi

if ! command -v nix; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    mkdir -p ~/.config/nix
    echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
fi

~/.nix-profile/bin/nix develop -c bash -c "${SCRIPTS}/nix-build.bash $*"
