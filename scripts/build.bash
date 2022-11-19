#!/bin/bash

set -e

# A script to build the site

# Install PDM
if ! command -v pdm > /dev/null; then
    pip install -U pip setuptools wheel
    pip install pdm
fi

# Install the dependencies
pdm install

# Add the site URL to the config
if [ ! ${#} -eq 0 ]; then
    echo "site_url: ${1}" >> mkdocs.yml
fi

# Build the site
pdm mkdocs build
