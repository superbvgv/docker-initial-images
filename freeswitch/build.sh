#!/bin/sh -e
NETWORK=${NETWORK:-"dcrm"}
docker build $BUILD_FLAGS -t $NETWORK/freeswitch .