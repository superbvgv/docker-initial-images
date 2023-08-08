#!/bin/sh -e
cd asterisk-${ASTERISK_VERSION}
./configure --with-jansson-bundled

make
make install
make samples
make config
make install-headers
make install-logrotate
ldconfig
