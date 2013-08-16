#!/usr/bin/env bash

DONEFILE=/var/vagrant-iftop

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing IF Top..."
aptitude install -y iftop 

# signal a successful provision
touch ${DONEFILE}
