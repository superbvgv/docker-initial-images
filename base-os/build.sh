#!/bin/sh -e

NETWORK=${NETWORK:-"rnd"}
docker build --no-cache $BUILD_FLAGS -t $NETWORK/base-os .