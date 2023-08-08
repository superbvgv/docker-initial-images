#!/bin/sh -e

apt-get -y update
apt-get -y upgrade

apt-get install -y vim curl wget git \
	build-essential \
	procps

apt-get -y clean