#!/bin/bash

# A script to build the site on Fleek.
# Expects to be used on the `bitnami/minideb` Docker image.

# Install auxiliary packages
install_packages wget ca-certificates >/dev/null

# Define the paths
FLEEK=$(dirname "${BASH_SOURCE[0]}")
SCRIPTS=$(dirname "${FLEEK}")

# Build the site
. "${SCRIPTS}"/build.bash

# Apply the hooks
. "${FLEEK}"/hooks.bash
