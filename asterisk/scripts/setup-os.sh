#!/bin/sh -e

wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${ASTERISK_VERSION}.tar.gz
wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${ASTERISK_VERSION}.tar.gz.asc
tar -xvf asterisk-${ASTERISK_VERSION}.tar.gz