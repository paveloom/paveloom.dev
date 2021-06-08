#!/bin/bash

# A script to apply hooks in the build process on Fleek.

# Avoid Email Adress Obfuscation
sed -i 's|<a href=mailto:paveloom@tuta.io>paveloom@tuta.io</a>|<!--email_off--><a href=mailto:paveloom@tuta.io>paveloom@tuta.io</a><!--/email_off-->|g' public/index.html
sed -i 's|user@ip|<!--email_off-->user@ip<!--/email_off-->|g' public/pensieve/how-to-ssh-into-wsl-2/index.html

# Copy the `404.html` as `ipfs-404.html`
cp public/404.html public/ipfs-404.html
