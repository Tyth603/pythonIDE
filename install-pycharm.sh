#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-pycharm
CACHE=/vagrant/file-cache
ARCHIVE=idea.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
IDEADIR=${ACCOUNTDIR}/Software/Pycharm
 
# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Installing Jetbrains Pycharm IDEA..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "Pycharm IDEA already cached.  Not downloading." 
else
  echo "Downloading Pycharm IDEA..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://download.jetbrains.com/python/pycharm-2.7.3.tar.gz
fi
mkdir -p ${IDEADIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${IDEADIR}
cd ${IDEADIR} ; ln -s idea-IU-129.713 idea ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
