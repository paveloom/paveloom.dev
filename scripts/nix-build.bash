#!/usr/bin/env bash

set -e

# A script to build the site

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
