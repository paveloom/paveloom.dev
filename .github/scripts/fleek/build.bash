#!/bin/bash

# A script to build the site for Fleek.
# Expects to be used on the `bitnami/minideb` Docker image.

# Install auxiliary packages
install_packages wget ca-certificates >/dev/null

# Get Zola
wget https://github.com/getzola/zola/releases/download/v0.13.0/zola-v0.13.0-x86_64-unknown-linux-gnu.tar.gz >/dev/null 2>&1
tar -xf zola*.tar.gz && rm zola-*

# Build the site
./zola build -u https://paveloom.on.fleek.co/

# Get `minify-html`
wget https://wilsonl.in/minify-html/bin/0.4.10-linux-x86_64 >/dev/null 2>&1
mv *linux-x86_64 minify-html
chmod u+x minify-html

# Use `minify-html`
for file in `find public -name "*.html" -type f`; do
    ./minify-html -s "$file" -o "$file" --css --js
done

# Get `minify`
wget https://github.com/tdewolff/minify/releases/download/v2.9.16/minify_linux_amd64.tar.gz >/dev/null 2>&1
tar -xf minify_* minify && rm minify_*

# Use `minify`
./minify -ra -o . public

# Apply the hooks
. $(dirname "${BASH_SOURCE[0]}")/hooks.bash
