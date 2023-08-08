#!/bin/sh -e

/tmp/asterisk-${ASTERISK_VERSION}/contrib/scripts/install_prereq install
apt-get install -y autoconf automake libtool libedit-dev
apt-get clean metadata
apt-get clean all