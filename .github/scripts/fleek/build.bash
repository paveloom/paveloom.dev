#!/bin/bash

# A script to build the site on Fleek.
# Expects to be used on the `bitnami/minideb` Docker image.

# Install auxiliary packages
install_packages wget ca-certificates >/dev/null

# Set the parent directory
PARENT=$(dirname "${BASH_SOURCE[0]}")

# Build the site
. $(dirname ${PARENT})/github/build.bash

# Apply the hooks
. ${PARENT}/hooks.bash
