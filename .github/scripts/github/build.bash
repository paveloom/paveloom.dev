#!/bin/bash

# A script to build the site for GitHub Pages.

# Get Zola
wget https://github.com/getzola/zola/releases/download/v0.14.0/zola-v0.14.0-x86_64-unknown-linux-gnu.tar.gz >/dev/null 2>&1
tar -xf zola*.tar.gz && rm zola-*

# Build the site
if [ ${#} -eq 0 ]; then
    ./zola build
else
    ./zola build -u "${1}"
fi

# Delete Zola
rm zola

# Get `minify`
wget https://github.com/tdewolff/minify/releases/download/v2.9.19/minify_linux_amd64.tar.gz >/dev/null 2>&1
tar -xf minify_* minify && rm minify_*

# Use `minify`
./minify -ra -o . public

# Delete `minify`
rm minify
