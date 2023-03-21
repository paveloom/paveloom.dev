#!/usr/bin/env bash

set -e

# A script to build the site

if [ -n "$GITHUB_ACTIONS" ]; then
    git config --global --add safe.directory /github/workspace
fi

# Don't check for a new version
pdm config check_update false

# Make sure we don't use a virtual environment
pdm config python.use_venv false

# Install the dependencies
pdm install

# Add the site URL to the config
if [ ! ${#} -eq 0 ]; then
    echo "site_url: ${1}" >> mkdocs.yml
fi

# Build the site
pdm mkdocs build

if [ -n "$FLEEK" ]; then
    cp public/404.html public/ipfs-404.html
fi
