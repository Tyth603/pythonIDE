#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-alias-file
CACHE=/vagrant/file-cache
ACCOUNTDIR=/home/${ACCOUNT}
TARGET=${ACCOUNTDIR}

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Bash aliase file..."
cp --verbose /vagrant/.bash_aliases ${TARGET}
chown -R ${ACCOUNT}:${ACCOUNT} ${TARGET}

# signal a successful provision
touch ${DONEFILE} 
