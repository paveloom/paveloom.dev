#!/bin/bash

set -e

# A script to build the site on Fleek

# Define the paths
FLEEK=$(dirname "${BASH_SOURCE[0]}")
SCRIPTS=$(dirname "${FLEEK}")

# Build the site
. "${SCRIPTS}"/build.bash

# Apply the hooks
. "${FLEEK}"/hooks.bash
