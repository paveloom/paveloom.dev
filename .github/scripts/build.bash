#!/bin/bash

set -e

# A script to build the site on Ubuntu host

# Install `curl`
apt-get update >/dev/null 2>&1 && apt-get install -y curl >/dev/null 2>&1

# Get Zola
curl -L https://github.com/getzola/zola/releases/download/v0.16.1/zola-v0.16.1-x86_64-unknown-linux-gnu.tar.gz >zola.tar.gz 2>/dev/null
tar -xf zola.tar.gz && rm zola.tar.gz

# Build the site
if [ ${#} -eq 0 ]; then
    ./zola build
else
    ./zola build -u "${1}"
fi

# Delete Zola
rm zola

# Get mdBook
curl -L https://github.com/rust-lang/mdBook/releases/download/v0.4.21/mdbook-v0.4.21-x86_64-unknown-linux-gnu.tar.gz >mdbook.tar.gz 2>/dev/null
tar -xf mdbook.tar.gz && rm mdbook.tar.gz

# Build the pensieve
./mdbook build pensieve

# Delete mdBook
rm mdbook

# Get `minify`
curl -L https://github.com/tdewolff/minify/releases/download/v2.12.1/minify_linux_amd64.tar.gz >minify.tar.gz 2>/dev/null
tar -xf minify.tar.gz minify && rm minify.tar.gz

# Use `minify`
./minify -ra -o . public

# Delete `minify`
rm minify
