#!/bin/bash

# A script to apply hooks considering Cloudflare's peculiarities.
# Expects to be used as part of the build process for Fleek.

# Avoid Email Adress Obfuscation
sed 's|>paveloomm@gmail.com<|><!--email_off-->paveloomm@gmail.com<!--/email_off--><|g' public/index.html
sed -i 's|user@ip|<!--email_off-->user@ip<!--/email_off-->|g' public/pensieve/how-to-ssh-into-wsl-2/index.html
